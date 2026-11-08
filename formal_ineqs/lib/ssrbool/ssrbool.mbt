// Translated from upstream Formal_ineqs/lib/ssrbool.hl; edit this file directly.

///|
/// Formal_ineqs/lib/ssrbool.hl:9
fn step_1() -> Unit raise {
  @sections.begin_section("ApplyIff")
}

///|
/// Formal_ineqs/lib/ssrbool.hl:10
fn step_2() -> Unit raise {
  @sections.add_section_var(@kernel.mk_var("P", @term_syntax.parse_type("Bool")))
  @sections.add_section_var(@kernel.mk_var("Q", @term_syntax.parse_type("Bool")))
}

///|
/// Formal_ineqs/lib/ssrbool.hl:11
fn step_3() -> Unit raise {
  @sections.add_section_hyp("eqPQ", @term_syntax.parse_term("(P : Bool) == (Q : Bool)"))
}

///|
/// iffLR
fn step_4() -> Unit raise {
  ifflr_c.set(@sections.section_proof(@list.List([]), @term_syntax.parse_term("(P : Bool) → (Q : Bool)"), @list.List([@ssreflect.done_tac])))
}

///|
let ifflr_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("iffLR")

///|
/// `Ssrbool.iffLR`
pub fn ifflr() -> @kernel.Thm {
  ifflr_c.get()
}

///|
/// iffRL
fn step_5() -> Unit raise {
  iffrl_c.set(@sections.section_proof(@list.List([]), @term_syntax.parse_term("(Q : Bool) → (P : Bool)"), @list.List([@ssreflect.done_tac])))
}

///|
let iffrl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("iffRL")

///|
/// `Ssrbool.iffRL`
pub fn iffrl() -> @kernel.Thm {
  iffrl_c.get()
}

///|
/// iffLRn
fn step_6() -> Unit raise {
  ifflrn_c.set(@sections.section_proof(@list.List([]), @term_syntax.parse_term("!(P : Bool) → !(Q : Bool)"), @list.List([@ssreflect.done_tac])))
}

///|
let ifflrn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("iffLRn")

///|
/// `Ssrbool.iffLRn`
pub fn ifflrn() -> @kernel.Thm {
  ifflrn_c.get()
}

///|
/// iffRLn
fn step_7() -> Unit raise {
  iffrln_c.set(@sections.section_proof(@list.List([]), @term_syntax.parse_term("!(Q : Bool) → !(P : Bool)"), @list.List([@ssreflect.done_tac])))
}

///|
let iffrln_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("iffRLn")

///|
/// `Ssrbool.iffRLn`
pub fn iffrln() -> @kernel.Thm {
  iffrln_c.get()
}

///|
/// iffLR
fn step_8() -> Unit raise {
  ifflr_v1_c.set(@sections.finalize_theorem(ifflr()))
}

///|
let ifflr_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("iffLR")

///|
/// `Ssrbool.iffLR`
pub fn ifflr_v1() -> @kernel.Thm {
  ifflr_v1_c.get()
}

///|
/// iffRL
fn step_9() -> Unit raise {
  iffrl_v1_c.set(@sections.finalize_theorem(iffrl()))
}

///|
let iffrl_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("iffRL")

///|
/// `Ssrbool.iffRL`
pub fn iffrl_v1() -> @kernel.Thm {
  iffrl_v1_c.get()
}

///|
/// iffLRn
fn step_10() -> Unit raise {
  ifflrn_v1_c.set(@sections.finalize_theorem(ifflrn()))
}

///|
let ifflrn_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("iffLRn")

///|
/// `Ssrbool.iffLRn`
pub fn ifflrn_v1() -> @kernel.Thm {
  ifflrn_v1_c.get()
}

///|
/// iffRLn
fn step_11() -> Unit raise {
  iffrln_v1_c.set(@sections.finalize_theorem(iffrln()))
}

///|
let iffrln_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("iffRLn")

///|
/// `Ssrbool.iffRLn`
pub fn iffrln_v1() -> @kernel.Thm {
  iffrln_v1_c.get()
}

///|
/// Formal_ineqs/lib/ssrbool.hl:46
fn step_12() -> Unit raise {
  @sections.end_section("ApplyIff")
}

///|
/// is_true_true
fn step_13() -> Unit raise {
  is_true_true_c.set(@sections.section_proof(@list.List([]), @term_syntax.parse_term("true"), @list.List([@ssreflect.done_tac])))
}

///|
let is_true_true_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_true_true")

///|
/// `Ssrbool.is_true_true`
pub fn is_true_true() -> @kernel.Thm {
  is_true_true_c.get()
}

///|
/// not_false_is_true
fn step_14() -> Unit raise {
  not_false_is_true_c.set(@sections.section_proof(@list.List([]), @term_syntax.parse_term("!false"), @list.List([@ssreflect.done_tac])))
}

///|
let not_false_is_true_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("not_false_is_true")

///|
/// `Ssrbool.not_false_is_true`
pub fn not_false_is_true() -> @kernel.Thm {
  not_false_is_true_c.get()
}

///|
/// isT
fn step_15() -> Unit raise {
  ist_c.set(is_true_true())
}

///|
let ist_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("isT")

///|
/// `Ssrbool.isT`
pub fn ist() -> @kernel.Thm {
  ist_c.get()
}

///|
/// notF
fn step_16() -> Unit raise {
  notf_c.set(not_false_is_true())
}

///|
let notf_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("notF")

///|
/// `Ssrbool.notF`
pub fn notf() -> @kernel.Thm {
  notf_c.get()
}

///|
/// negbT
fn step_17() -> Unit raise {
  negbt_c.set(@sections.section_proof(@list.List(["b"]), @term_syntax.parse_term("(b : Bool) == false → !b"), @list.List([@ssreflect.done_tac])))
}

///|
let negbt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("negbT")

///|
/// `Ssrbool.negbT`
pub fn negbt() -> @kernel.Thm {
  negbt_c.get()
}

///|
/// negbTE
fn step_18() -> Unit raise {
  negbte_c.set(@sections.section_proof(@list.List(["b"]), @term_syntax.parse_term("!(b : Bool) → b == false"), @list.List([@ssreflect.done_tac])))
}

///|
let negbte_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("negbTE")

///|
/// `Ssrbool.negbTE`
pub fn negbte() -> @kernel.Thm {
  negbte_c.get()
}

///|
/// negbF
fn step_19() -> Unit raise {
  negbf_c.set(@sections.section_proof(@list.List(["b"]), @term_syntax.parse_term("(b : Bool) → !b == false"), @list.List([@ssreflect.done_tac])))
}

///|
let negbf_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("negbF")

///|
/// `Ssrbool.negbF`
pub fn negbf() -> @kernel.Thm {
  negbf_c.get()
}

///|
/// negbFE
fn step_20() -> Unit raise {
  negbfe_c.set(@sections.section_proof(@list.List(["b"]), @term_syntax.parse_term("!(b : Bool) == false → b"), @list.List([@ssreflect.done_tac])))
}

///|
let negbfe_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("negbFE")

///|
/// `Ssrbool.negbFE`
pub fn negbfe() -> @kernel.Thm {
  negbfe_c.get()
}

///|
/// negbK
fn step_21() -> Unit raise {
  negbk_c.set(@sections.section_proof(@list.List(["b"]), @term_syntax.parse_term("!!(b : Bool) == b"), @list.List([@ssreflect.done_tac])))
}

///|
let negbk_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("negbK")

///|
/// `Ssrbool.negbK`
pub fn negbk() -> @kernel.Thm {
  negbk_c.get()
}

///|
/// negbNE
fn step_22() -> Unit raise {
  negbne_c.set(@sections.section_proof(@list.List(["b"]), @term_syntax.parse_term("!!(b : Bool) → b"), @list.List([@ssreflect.done_tac])))
}

///|
let negbne_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("negbNE")

///|
/// `Ssrbool.negbNE`
pub fn negbne() -> @kernel.Thm {
  negbne_c.get()
}

///|
/// negb_inj
fn step_23() -> Unit raise {
  let t5 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x4 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b2", @list.List([])), (x3 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x3), x4), @ssreflect.clear_assumption("b2")), @ssreflect.case), @ssreflect.simp_tac)
  let t6 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x2 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b1", @list.List([])), (x1 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x1), x2), @ssreflect.clear_assumption("b1")), @ssreflect.case), t5), @ssreflect.done_tac)])
  negb_inj_c.set(@sections.section_proof(@list.List(["b1", "b2"]), @term_syntax.parse_term("!(b1 : Bool) == !(b2 : Bool) → b1 == b2"), t6))
}

///|
let negb_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("negb_inj")

///|
/// `Ssrbool.negb_inj`
pub fn negb_inj() -> @kernel.Thm {
  negb_inj_c.get()
}

///|
/// negbLR
fn step_24() -> Unit raise {
  let t18 = @ssreflect.thm_tac(fn(x16 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x17 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x14 : @kernel.Thm, x15 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x14, x15))(x16, x17)
    }
  })
  let t20 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.beta_tac, @ssreflect.conv_thm_tac(fn(x7 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s8 = @tactics.disch_then(x7)
    fn(x9 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s8(x9)
    }
  }, @ssreflect.thm_tac(fn(x12 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x13 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x10 : @kernel.Thm, x11 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x10, x11))(x12, x13)
    }
  }))), (x19 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("negbK", @list.List([negbk()])), t18, x19)), @ssreflect.done_tac)])
  negblr_c.set(@sections.section_proof(@list.List(["b", "c"]), @term_syntax.parse_term("(b : Bool) == !(c : Bool) → !b == c"), t20))
}

///|
let negblr_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("negbLR")

///|
/// `Ssrbool.negbLR`
pub fn negblr() -> @kernel.Thm {
  negblr_c.get()
}

///|
/// negbRL
fn step_25() -> Unit raise {
  let t34 = @ssreflect.thm_tac(fn(x32 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x33 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x30 : @kernel.Thm, x31 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x30, x31))(x32, x33)
    }
  })
  let t28 = @ssreflect.thm_tac(fn(x26 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x27 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x24 : @kernel.Thm, x25 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x24, x25))(x26, x27)
    }
  })
  let t36 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.beta_tac, @ssreflect.conv_thm_tac(fn(x21 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s22 = @tactics.disch_then(x21)
    fn(x23 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s22(x23)
    }
  }, (x29 : @ssreflect.ArgType) => @ssreflect.gsym_then_v1(t28, x29))), (x35 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("negbK", @list.List([negbk()])), t34, x35)), @ssreflect.done_tac)])
  negbrl_c.set(@sections.section_proof(@list.List(["b", "c"]), @term_syntax.parse_term("!(b : Bool) == (c : Bool) → b == !c"), t36))
}

///|
let negbrl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("negbRL")

///|
/// `Ssrbool.negbRL`
pub fn negbrl() -> @kernel.Thm {
  negbrl_c.get()
}

///|
/// contra
fn step_26() -> Unit raise {
  let t41 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x40 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("c", @list.List([])), (x39 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x39), x40), @ssreflect.clear_assumption("c")), @ssreflect.case), @ssreflect.simp_tac)
  let t42 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x38 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x37 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x37), x38), @ssreflect.clear_assumption("b")), @ssreflect.case), t41)])
  contra_c.set(@sections.section_proof(@list.List(["c", "b"]), @term_syntax.parse_term("((c : Bool) → (b : Bool)) → !b → !c"), t42))
}

///|
let contra_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("contra")

///|
/// `Ssrbool.contra`
pub fn contra() -> @kernel.Thm {
  contra_c.get()
}

///|
/// contraNN
fn step_27() -> Unit raise {
  contrann_c.set(contra())
}

///|
let contrann_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("contraNN")

///|
/// `Ssrbool.contraNN`
pub fn contrann() -> @kernel.Thm {
  contrann_c.get()
}

///|
/// contraL
fn step_28() -> Unit raise {
  let t57 = @ssreflect.thm_tac(fn(x55 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x56 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x53 : @kernel.Thm, x54 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x53, x54))(x55, x56)
    }
  })
  let t59 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((fn(x43 : (@ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let arg_tac = x43
    (x51 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("contra", @list.List([contra()])), fn(x45 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let fst_arg = x45
      (x50 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("h", @list.List([])), fn(x47 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let snd_arg = x47
        (x49 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.combine_args_then(arg_tac, fst_arg, snd_arg, x49)
      }, x50)
    }, x51)
  })((x52 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x52)), @tactics.beta_tac), (x58 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("negbK", @list.List([negbk()])), t57, x58)), @ssreflect.done_tac)
  let t60 = @list.List([@tactics.then_tac(@tactics.beta_tac, @ssreflect.move_(@list.List(["h"]))), t59])
  contral_c.set(@sections.section_proof(@list.List(["c", "b"]), @term_syntax.parse_term("((c : Bool) → !(b : Bool)) → b → !c"), t60))
}

///|
let contral_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("contraL")

///|
/// `Ssrbool.contraL`
pub fn contral() -> @kernel.Thm {
  contral_c.get()
}

///|
/// contraR
fn step_29() -> Unit raise {
  let t75 = @ssreflect.thm_tac(fn(x73 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x74 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x71 : @kernel.Thm, x72 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x71, x72))(x73, x74)
    }
  })
  let t77 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((fn(x61 : (@ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let arg_tac = x61
    (x69 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("contra", @list.List([contra()])), fn(x63 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let fst_arg = x63
      (x68 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("h", @list.List([])), fn(x65 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let snd_arg = x65
        (x67 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.combine_args_then(arg_tac, fst_arg, snd_arg, x67)
      }, x68)
    }, x69)
  })((x70 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x70)), @tactics.beta_tac), (x76 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("negbK", @list.List([negbk()])), t75, x76)), @ssreflect.done_tac)
  let t78 = @list.List([@tactics.then_tac(@tactics.beta_tac, @ssreflect.move_(@list.List(["h"]))), t77])
  contrar_c.set(@sections.section_proof(@list.List(["c", "b"]), @term_syntax.parse_term("(!(c : Bool) → (b : Bool)) → !b → c"), t78))
}

///|
let contrar_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("contraR")

///|
/// `Ssrbool.contraR`
pub fn contrar() -> @kernel.Thm {
  contrar_c.get()
}

///|
/// contraLR
fn step_30() -> Unit raise {
  let t93 = @ssreflect.thm_tac(fn(x91 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x92 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x89 : @kernel.Thm, x90 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x89, x90))(x91, x92)
    }
  })
  let t95 = @ssreflect.repeat_tactic(1L, 9L, (x94 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("negbK", @list.List([negbk()])), t93, x94))
  let t96 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((fn(x79 : (@ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let arg_tac = x79
    (x87 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("contra", @list.List([contra()])), fn(x81 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let fst_arg = x81
      (x86 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("h", @list.List([])), fn(x83 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let snd_arg = x83
        (x85 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.combine_args_then(arg_tac, fst_arg, snd_arg, x85)
      }, x86)
    }, x87)
  })((x88 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x88)), @tactics.beta_tac), t95), @ssreflect.done_tac)
  let t97 = @list.List([@tactics.then_tac(@tactics.beta_tac, @ssreflect.move_(@list.List(["h"]))), t96])
  contralr_c.set(@sections.section_proof(@list.List(["c", "b"]), @term_syntax.parse_term("(!(c : Bool) → !(b : Bool)) → b → c"), t97))
}

///|
let contralr_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("contraLR")

///|
/// `Ssrbool.contraLR`
pub fn contralr() -> @kernel.Thm {
  contralr_c.get()
}

///|
/// contraT
fn step_31() -> Unit raise {
  contrat_c.set(@sections.section_proof(@list.List(["b"]), @term_syntax.parse_term("(!(b : Bool) → false) → b"), @list.List([@ssreflect.done_tac])))
}

///|
let contrat_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("contraT")

///|
/// `Ssrbool.contraT`
pub fn contrat() -> @kernel.Thm {
  contrat_c.get()
}

///|
/// wlog_neg
fn step_32() -> Unit raise {
  let t100 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x99 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x98 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x98), x99), @ssreflect.clear_assumption("b")), @ssreflect.case), @ssreflect.simp_tac)])
  wlog_neg_c.set(@sections.section_proof(@list.List(["b"]), @term_syntax.parse_term("(!(b : Bool) → b) → b"), t100))
}

///|
let wlog_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("wlog_neg")

///|
/// `Ssrbool.wlog_neg`
pub fn wlog_neg() -> @kernel.Thm {
  wlog_neg_c.get()
}

///|
/// contraFT
fn step_33() -> Unit raise {
  let t105 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x104 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("c", @list.List([])), (x103 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x103), x104), @ssreflect.clear_assumption("c")), @ssreflect.case), @ssreflect.simp_tac)
  let t106 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x102 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x101 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x101), x102), @ssreflect.clear_assumption("b")), @ssreflect.case), t105)])
  contraft_c.set(@sections.section_proof(@list.List(["c", "b"]), @term_syntax.parse_term("(!(c : Bool) → (b : Bool)) → b == false → c"), t106))
}

///|
let contraft_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("contraFT")

///|
/// `Ssrbool.contraFT`
pub fn contraft() -> @kernel.Thm {
  contraft_c.get()
}

///|
/// contraFN
fn step_34() -> Unit raise {
  let t111 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x110 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("c", @list.List([])), (x109 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x109), x110), @ssreflect.clear_assumption("c")), @ssreflect.case), @ssreflect.simp_tac)
  let t112 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x108 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x107 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x107), x108), @ssreflect.clear_assumption("b")), @ssreflect.case), t111)])
  contrafn_c.set(@sections.section_proof(@list.List(["c", "b"]), @term_syntax.parse_term("((c : Bool) → (b : Bool)) → b == false → !c"), t112))
}

///|
let contrafn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("contraFN")

///|
/// `Ssrbool.contraFN`
pub fn contrafn() -> @kernel.Thm {
  contrafn_c.get()
}

///|
/// contraTF
fn step_35() -> Unit raise {
  let t117 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x116 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("c", @list.List([])), (x115 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x115), x116), @ssreflect.clear_assumption("c")), @ssreflect.case), @ssreflect.simp_tac)
  let t118 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x114 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x113 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x113), x114), @ssreflect.clear_assumption("b")), @ssreflect.case), t117)])
  contratf_c.set(@sections.section_proof(@list.List(["c", "b"]), @term_syntax.parse_term("((c : Bool) → !(b : Bool)) → b → c == false"), t118))
}

///|
let contratf_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("contraTF")

///|
/// `Ssrbool.contraTF`
pub fn contratf() -> @kernel.Thm {
  contratf_c.get()
}

///|
/// contraNF
fn step_36() -> Unit raise {
  let t123 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x122 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("c", @list.List([])), (x121 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x121), x122), @ssreflect.clear_assumption("c")), @ssreflect.case), @ssreflect.simp_tac)
  let t124 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x120 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x119 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x119), x120), @ssreflect.clear_assumption("b")), @ssreflect.case), t123)])
  contranf_c.set(@sections.section_proof(@list.List(["c", "b"]), @term_syntax.parse_term("((c : Bool) → (b : Bool)) → !b → c == false"), t124))
}

///|
let contranf_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("contraNF")

///|
/// `Ssrbool.contraNF`
pub fn contranf() -> @kernel.Thm {
  contranf_c.get()
}

///|
/// contraFF
fn step_37() -> Unit raise {
  let t129 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x128 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("c", @list.List([])), (x127 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x127), x128), @ssreflect.clear_assumption("c")), @ssreflect.case), @ssreflect.simp_tac)
  let t130 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x126 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x125 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x125), x126), @ssreflect.clear_assumption("b")), @ssreflect.case), t129)])
  contraff_c.set(@sections.section_proof(@list.List(["c", "b"]), @term_syntax.parse_term("((c : Bool) → (b : Bool)) → b == false → c == false"), t130))
}

///|
let contraff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("contraFF")

///|
/// `Ssrbool.contraFF`
pub fn contraff() -> @kernel.Thm {
  contraff_c.get()
}

///|
/// isSome
fn step_38() -> Unit raise {
  issome_c.set(@define.define_(@term_syntax.parse_term("(isSome : (Option[_]) -> Bool)(NONE) == false && (∀ x : _, isSome(SOME(x)) == true)")))
}

///|
let issome_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("isSome")

///|
/// `Ssrbool.isSome`
pub fn issome() -> @kernel.Thm {
  issome_c.get()
}

///|
/// Formal_ineqs/lib/ssrbool.hl:210
fn step_39() -> Unit raise {
  @sections.begin_section("BoolIf")
}

///|
/// Formal_ineqs/lib/ssrbool.hl:211
fn step_40() -> Unit raise {
  @sections.add_section_var(@kernel.mk_var("vT", @term_syntax.parse_type("A")))
  @sections.add_section_var(@kernel.mk_var("vF", @term_syntax.parse_type("A")))
}

///|
/// Formal_ineqs/lib/ssrbool.hl:212
fn step_41() -> Unit raise {
  @sections.add_section_var(@kernel.mk_var("f", @term_syntax.parse_type("(A) -> B")))
}

///|
/// Formal_ineqs/lib/ssrbool.hl:213
fn step_42() -> Unit raise {
  @sections.add_section_var(@kernel.mk_var("b", @term_syntax.parse_type("Bool")))
}

///|
/// if_same
fn step_43() -> Unit raise {
  let t133 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x132 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x131 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x131), x132), @ssreflect.clear_assumption("b")), @ssreflect.case), @ssreflect.simp_tac), @ssreflect.done_tac)])
  if_same_c.set(@sections.section_proof(@list.List([]), @term_syntax.parse_term("(if (b : Bool) { (vT : _) } else { vT }) == vT"), t133))
}

///|
let if_same_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("if_same")

///|
/// `Ssrbool.if_same`
pub fn if_same() -> @kernel.Thm {
  if_same_c.get()
}

///|
/// if_neg
fn step_44() -> Unit raise {
  let t136 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x135 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x134 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x134), x135), @ssreflect.clear_assumption("b")), @ssreflect.case), @ssreflect.simp_tac), @ssreflect.done_tac)])
  if_neg_c.set(@sections.section_proof(@list.List([]), @term_syntax.parse_term("(if !(b : Bool) { (vT : _) } else { (vF : _) }) == (if b { vF } else { vT })"), t136))
}

///|
let if_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("if_neg")

///|
/// `Ssrbool.if_neg`
pub fn if_neg() -> @kernel.Thm {
  if_neg_c.get()
}

///|
/// fun_if
fn step_45() -> Unit raise {
  let t139 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x138 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x137 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x137), x138), @ssreflect.clear_assumption("b")), @ssreflect.case), @ssreflect.simp_tac), @ssreflect.done_tac)])
  fun_if_c.set(@sections.section_proof(@list.List([]), @term_syntax.parse_term("(f : (_) -> _)(if (b : Bool) { (vT : _) } else { (vF : _) }) == (if b { f(vT) } else { f(vF) })"), t139))
}

///|
let fun_if_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("fun_if")

///|
/// `Ssrbool.fun_if`
pub fn fun_if() -> @kernel.Thm {
  fun_if_c.get()
}

///|
/// if_arg
fn step_46() -> Unit raise {
  let t142 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x141 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x140 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x140), x141), @ssreflect.clear_assumption("b")), @ssreflect.case), @ssreflect.simp_tac), @ssreflect.done_tac)])
  if_arg_c.set(@sections.section_proof(@list.List(["fT", "fF", "x"]), @term_syntax.parse_term("COND((b : Bool), (fT : (A) -> B), (fF : (A) -> B), (x : A)) == (if b { fT(x) } else { fF(x) })"), t142))
}

///|
let if_arg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("if_arg")

///|
/// `Ssrbool.if_arg`
pub fn if_arg() -> @kernel.Thm {
  if_arg_c.get()
}

///|
/// if_same
fn step_47() -> Unit raise {
  if_same_v1_c.set(@sections.finalize_theorem(if_same()))
}

///|
let if_same_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("if_same")

///|
/// `Ssrbool.if_same`
pub fn if_same_v1() -> @kernel.Thm {
  if_same_v1_c.get()
}

///|
/// if_neg
fn step_48() -> Unit raise {
  if_neg_v1_c.set(@sections.finalize_theorem(if_neg()))
}

///|
let if_neg_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("if_neg")

///|
/// `Ssrbool.if_neg`
pub fn if_neg_v1() -> @kernel.Thm {
  if_neg_v1_c.get()
}

///|
/// fun_if
fn step_49() -> Unit raise {
  fun_if_v1_c.set(@sections.finalize_theorem(fun_if()))
}

///|
let fun_if_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("fun_if")

///|
/// `Ssrbool.fun_if`
pub fn fun_if_v1() -> @kernel.Thm {
  fun_if_v1_c.get()
}

///|
/// if_arg
fn step_50() -> Unit raise {
  if_arg_v1_c.set(@sections.finalize_theorem(if_arg()))
}

///|
let if_arg_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("if_arg")

///|
/// `Ssrbool.if_arg`
pub fn if_arg_v1() -> @kernel.Thm {
  if_arg_v1_c.get()
}

///|
/// Formal_ineqs/lib/ssrbool.hl:248
fn step_51() -> Unit raise {
  @sections.end_section("BoolIf")
}

///|
/// andTb
fn step_52() -> Unit raise {
  andtb_c.set(@sections.section_proof(@list.List(["b"]), @term_syntax.parse_term("(true && (b : Bool)) == b"), @list.List([@ssreflect.done_tac])))
}

///|
let andtb_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("andTb")

///|
/// `Ssrbool.andTb`
pub fn andtb() -> @kernel.Thm {
  andtb_c.get()
}

///|
/// andFb
fn step_53() -> Unit raise {
  andfb_c.set(@sections.section_proof(@list.List(["b"]), @term_syntax.parse_term("(false && (b : Bool)) == false"), @list.List([@ssreflect.done_tac])))
}

///|
let andfb_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("andFb")

///|
/// `Ssrbool.andFb`
pub fn andfb() -> @kernel.Thm {
  andfb_c.get()
}

///|
/// andbT
fn step_54() -> Unit raise {
  andbt_c.set(@sections.section_proof(@list.List(["b"]), @term_syntax.parse_term("((b : Bool) && true) == b"), @list.List([@ssreflect.done_tac])))
}

///|
let andbt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("andbT")

///|
/// `Ssrbool.andbT`
pub fn andbt() -> @kernel.Thm {
  andbt_c.get()
}

///|
/// andbF
fn step_55() -> Unit raise {
  andbf_c.set(@sections.section_proof(@list.List(["b"]), @term_syntax.parse_term("((b : Bool) && false) == false"), @list.List([@ssreflect.done_tac])))
}

///|
let andbf_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("andbF")

///|
/// `Ssrbool.andbF`
pub fn andbf() -> @kernel.Thm {
  andbf_c.get()
}

///|
/// andbb
fn step_56() -> Unit raise {
  andbb_c.set(@sections.section_proof(@list.List(["b"]), @term_syntax.parse_term("((b : Bool) && b) == b"), @list.List([@ssreflect.done_tac])))
}

///|
let andbb_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("andbb")

///|
/// `Ssrbool.andbb`
pub fn andbb() -> @kernel.Thm {
  andbb_c.get()
}

///|
/// andbC
fn step_57() -> Unit raise {
  let t147 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x146 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("c", @list.List([])), (x145 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x145), x146), @ssreflect.clear_assumption("c")), @ssreflect.case), @ssreflect.simp_tac)
  let t148 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x144 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x143 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x143), x144), @ssreflect.clear_assumption("b")), @ssreflect.case), t147), @ssreflect.done_tac)])
  andbc_c.set(@sections.section_proof(@list.List(["b", "c"]), @term_syntax.parse_term("((b : Bool) && (c : Bool)) == (c && b)"), t148))
}

///|
let andbc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("andbC")

///|
/// `Ssrbool.andbC`
pub fn andbc() -> @kernel.Thm {
  andbc_c.get()
}

///|
/// andbA
fn step_58() -> Unit raise {
  let t153 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x152 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("c", @list.List([])), (x151 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x151), x152), @ssreflect.clear_assumption("c")), @ssreflect.case), @ssreflect.simp_tac)
  let t154 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x150 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x149 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x149), x150), @ssreflect.clear_assumption("b")), @ssreflect.case), t153), @ssreflect.done_tac)])
  andba_c.set(@sections.section_proof(@list.List(["b", "c", "p"]), @term_syntax.parse_term("((b : Bool) && (c : Bool) && (p : Bool)) == ((b && c) && p)"), t154))
}

///|
let andba_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("andbA")

///|
/// `Ssrbool.andbA`
pub fn andba() -> @kernel.Thm {
  andba_c.get()
}

///|
/// andbCA
fn step_59() -> Unit raise {
  let t159 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x158 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("c", @list.List([])), (x157 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x157), x158), @ssreflect.clear_assumption("c")), @ssreflect.case), @ssreflect.simp_tac)
  let t160 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x156 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x155 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x155), x156), @ssreflect.clear_assumption("b")), @ssreflect.case), t159), @ssreflect.done_tac)])
  andbca_c.set(@sections.section_proof(@list.List(["b", "c", "p"]), @term_syntax.parse_term("((b : Bool) && (c : Bool) && (p : Bool)) == (c && b && p)"), t160))
}

///|
let andbca_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("andbCA")

///|
/// `Ssrbool.andbCA`
pub fn andbca() -> @kernel.Thm {
  andbca_c.get()
}

///|
/// andbAC
fn step_60() -> Unit raise {
  let t165 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x164 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("c", @list.List([])), (x163 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x163), x164), @ssreflect.clear_assumption("c")), @ssreflect.case), @ssreflect.simp_tac)
  let t166 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x162 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x161 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x161), x162), @ssreflect.clear_assumption("b")), @ssreflect.case), t165), @ssreflect.done_tac)])
  andbac_c.set(@sections.section_proof(@list.List(["b", "c", "p"]), @term_syntax.parse_term("(((b : Bool) && (c : Bool)) && (p : Bool)) == ((b && p) && c)"), t166))
}

///|
let andbac_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("andbAC")

///|
/// `Ssrbool.andbAC`
pub fn andbac() -> @kernel.Thm {
  andbac_c.get()
}

///|
/// orTb
fn step_61() -> Unit raise {
  ortb_c.set(@sections.section_proof(@list.List(["b"]), @term_syntax.parse_term("(true || (b : Bool)) == true"), @list.List([@ssreflect.done_tac])))
}

///|
let ortb_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("orTb")

///|
/// `Ssrbool.orTb`
pub fn ortb() -> @kernel.Thm {
  ortb_c.get()
}

///|
/// orFb
fn step_62() -> Unit raise {
  orfb_c.set(@sections.section_proof(@list.List(["b"]), @term_syntax.parse_term("(false || (b : Bool)) == b"), @list.List([@ssreflect.done_tac])))
}

///|
let orfb_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("orFb")

///|
/// `Ssrbool.orFb`
pub fn orfb() -> @kernel.Thm {
  orfb_c.get()
}

///|
/// orbT
fn step_63() -> Unit raise {
  orbt_c.set(@sections.section_proof(@list.List(["b"]), @term_syntax.parse_term("((b : Bool) || true) == true"), @list.List([@ssreflect.done_tac])))
}

///|
let orbt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("orbT")

///|
/// `Ssrbool.orbT`
pub fn orbt() -> @kernel.Thm {
  orbt_c.get()
}

///|
/// orbF
fn step_64() -> Unit raise {
  orbf_c.set(@sections.section_proof(@list.List(["b"]), @term_syntax.parse_term("((b : Bool) || false) == b"), @list.List([@ssreflect.done_tac])))
}

///|
let orbf_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("orbF")

///|
/// `Ssrbool.orbF`
pub fn orbf() -> @kernel.Thm {
  orbf_c.get()
}

///|
/// orbb
fn step_65() -> Unit raise {
  orbb_c.set(@sections.section_proof(@list.List(["b"]), @term_syntax.parse_term("((b : Bool) || b) == b"), @list.List([@ssreflect.done_tac])))
}

///|
let orbb_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("orbb")

///|
/// `Ssrbool.orbb`
pub fn orbb() -> @kernel.Thm {
  orbb_c.get()
}

///|
/// orbC
fn step_66() -> Unit raise {
  let t171 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x170 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("c", @list.List([])), (x169 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x169), x170), @ssreflect.clear_assumption("c")), @ssreflect.case), @ssreflect.simp_tac)
  let t172 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x168 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x167 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x167), x168), @ssreflect.clear_assumption("b")), @ssreflect.case), t171), @ssreflect.done_tac)])
  orbc_c.set(@sections.section_proof(@list.List(["b", "c"]), @term_syntax.parse_term("((b : Bool) || (c : Bool)) == (c || b)"), t172))
}

///|
let orbc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("orbC")

///|
/// `Ssrbool.orbC`
pub fn orbc() -> @kernel.Thm {
  orbc_c.get()
}

///|
/// orbA
fn step_67() -> Unit raise {
  let t177 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x176 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("c", @list.List([])), (x175 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x175), x176), @ssreflect.clear_assumption("c")), @ssreflect.case), @ssreflect.simp_tac)
  let t178 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x174 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x173 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x173), x174), @ssreflect.clear_assumption("b")), @ssreflect.case), t177), @ssreflect.done_tac)])
  orba_c.set(@sections.section_proof(@list.List(["b", "c", "p"]), @term_syntax.parse_term("((b : Bool) || (c : Bool) || (p : Bool)) == ((b || c) || p)"), t178))
}

///|
let orba_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("orbA")

///|
/// `Ssrbool.orbA`
pub fn orba() -> @kernel.Thm {
  orba_c.get()
}

///|
/// orbCA
fn step_68() -> Unit raise {
  let t183 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x182 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("c", @list.List([])), (x181 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x181), x182), @ssreflect.clear_assumption("c")), @ssreflect.case), @ssreflect.simp_tac)
  let t184 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x180 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x179 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x179), x180), @ssreflect.clear_assumption("b")), @ssreflect.case), t183), @ssreflect.done_tac)])
  orbca_c.set(@sections.section_proof(@list.List(["b", "c", "p"]), @term_syntax.parse_term("((b : Bool) || (c : Bool) || (p : Bool)) == (c || b || p)"), t184))
}

///|
let orbca_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("orbCA")

///|
/// `Ssrbool.orbCA`
pub fn orbca() -> @kernel.Thm {
  orbca_c.get()
}

///|
/// orbAC
fn step_69() -> Unit raise {
  let t189 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x188 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("c", @list.List([])), (x187 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x187), x188), @ssreflect.clear_assumption("c")), @ssreflect.case), @ssreflect.simp_tac)
  let t190 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x186 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x185 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x185), x186), @ssreflect.clear_assumption("b")), @ssreflect.case), t189), @ssreflect.done_tac)])
  orbac_c.set(@sections.section_proof(@list.List(["b", "c", "p"]), @term_syntax.parse_term("(((b : Bool) || (c : Bool)) || (p : Bool)) == ((b || p) || c)"), t190))
}

///|
let orbac_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("orbAC")

///|
/// `Ssrbool.orbAC`
pub fn orbac() -> @kernel.Thm {
  orbac_c.get()
}

///|
/// andbN
fn step_70() -> Unit raise {
  let t193 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x192 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x191 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x191), x192), @ssreflect.clear_assumption("b")), @ssreflect.case), @ssreflect.simp_tac), @ssreflect.done_tac)])
  andbn_c.set(@sections.section_proof(@list.List(["b"]), @term_syntax.parse_term("((b : Bool) && !b) == false"), t193))
}

///|
let andbn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("andbN")

///|
/// `Ssrbool.andbN`
pub fn andbn() -> @kernel.Thm {
  andbn_c.get()
}

///|
/// andNb
fn step_71() -> Unit raise {
  let t196 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x195 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x194 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x194), x195), @ssreflect.clear_assumption("b")), @ssreflect.case), @ssreflect.simp_tac), @ssreflect.done_tac)])
  andnb_c.set(@sections.section_proof(@list.List(["b"]), @term_syntax.parse_term("(!(b : Bool) && b) == false"), t196))
}

///|
let andnb_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("andNb")

///|
/// `Ssrbool.andNb`
pub fn andnb() -> @kernel.Thm {
  andnb_c.get()
}

///|
/// orbN
fn step_72() -> Unit raise {
  let t199 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x198 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x197 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x197), x198), @ssreflect.clear_assumption("b")), @ssreflect.case), @ssreflect.simp_tac), @ssreflect.done_tac)])
  orbn_c.set(@sections.section_proof(@list.List(["b"]), @term_syntax.parse_term("(b : Bool) || !b"), t199))
}

///|
let orbn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("orbN")

///|
/// `Ssrbool.orbN`
pub fn orbn() -> @kernel.Thm {
  orbn_c.get()
}

///|
/// orNb
fn step_73() -> Unit raise {
  let t202 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x201 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x200 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x200), x201), @ssreflect.clear_assumption("b")), @ssreflect.case), @ssreflect.simp_tac), @ssreflect.done_tac)])
  ornb_c.set(@sections.section_proof(@list.List(["b"]), @term_syntax.parse_term("!(b : Bool) || b"), t202))
}

///|
let ornb_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("orNb")

///|
/// `Ssrbool.orNb`
pub fn ornb() -> @kernel.Thm {
  ornb_c.get()
}

///|
/// andb_orl
fn step_74() -> Unit raise {
  let t207 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x206 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("c", @list.List([])), (x205 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x205), x206), @ssreflect.clear_assumption("c")), @ssreflect.case), @ssreflect.simp_tac)
  let t208 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x204 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x203 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x203), x204), @ssreflect.clear_assumption("b")), @ssreflect.case), t207), @ssreflect.done_tac)])
  andb_orl_c.set(@sections.section_proof(@list.List(["b", "c", "p"]), @term_syntax.parse_term("(((b : Bool) || (c : Bool)) && (p : Bool)) == (b && p || c && p)"), t208))
}

///|
let andb_orl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("andb_orl")

///|
/// `Ssrbool.andb_orl`
pub fn andb_orl() -> @kernel.Thm {
  andb_orl_c.get()
}

///|
/// andb_orr
fn step_75() -> Unit raise {
  let t213 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x212 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("c", @list.List([])), (x211 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x211), x212), @ssreflect.clear_assumption("c")), @ssreflect.case), @ssreflect.simp_tac)
  let t214 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x210 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x209 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x209), x210), @ssreflect.clear_assumption("b")), @ssreflect.case), t213), @ssreflect.done_tac)])
  andb_orr_c.set(@sections.section_proof(@list.List(["b", "c", "p"]), @term_syntax.parse_term("((b : Bool) && ((c : Bool) || (p : Bool))) == (b && c || b && p)"), t214))
}

///|
let andb_orr_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("andb_orr")

///|
/// `Ssrbool.andb_orr`
pub fn andb_orr() -> @kernel.Thm {
  andb_orr_c.get()
}

///|
/// orb_andl
fn step_76() -> Unit raise {
  let t219 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x218 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("c", @list.List([])), (x217 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x217), x218), @ssreflect.clear_assumption("c")), @ssreflect.case), @ssreflect.simp_tac)
  let t220 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x216 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x215 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x215), x216), @ssreflect.clear_assumption("b")), @ssreflect.case), t219), @ssreflect.done_tac)])
  orb_andl_c.set(@sections.section_proof(@list.List(["b", "c", "p"]), @term_syntax.parse_term("((b : Bool) && (c : Bool) || (p : Bool)) == ((b || p) && (c || p))"), t220))
}

///|
let orb_andl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("orb_andl")

///|
/// `Ssrbool.orb_andl`
pub fn orb_andl() -> @kernel.Thm {
  orb_andl_c.get()
}

///|
/// orb_andr
fn step_77() -> Unit raise {
  let t225 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x224 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("c", @list.List([])), (x223 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x223), x224), @ssreflect.clear_assumption("c")), @ssreflect.case), @ssreflect.simp_tac)
  let t226 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x222 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x221 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x221), x222), @ssreflect.clear_assumption("b")), @ssreflect.case), t225), @ssreflect.done_tac)])
  orb_andr_c.set(@sections.section_proof(@list.List(["b", "c", "p"]), @term_syntax.parse_term("((b : Bool) || (c : Bool) && (p : Bool)) == ((b || c) && (b || p))"), t226))
}

///|
let orb_andr_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("orb_andr")

///|
/// `Ssrbool.orb_andr`
pub fn orb_andr() -> @kernel.Thm {
  orb_andr_c.get()
}

///|
/// andb_idl
fn step_78() -> Unit raise {
  let t231 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x230 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x229 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x229), x230), @ssreflect.clear_assumption("b")), @ssreflect.case), @ssreflect.simp_tac)
  let t232 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x228 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("a", @list.List([])), (x227 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x227), x228), @ssreflect.clear_assumption("a")), @ssreflect.case), t231), @ssreflect.done_tac)])
  andb_idl_c.set(@sections.section_proof(@list.List(["a", "b"]), @term_syntax.parse_term("((b : Bool) → (a : Bool)) → (a && b) == b"), t232))
}

///|
let andb_idl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("andb_idl")

///|
/// `Ssrbool.andb_idl`
pub fn andb_idl() -> @kernel.Thm {
  andb_idl_c.get()
}

///|
/// andb_idr
fn step_79() -> Unit raise {
  let t237 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x236 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x235 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x235), x236), @ssreflect.clear_assumption("b")), @ssreflect.case), @ssreflect.simp_tac)
  let t238 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x234 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("a", @list.List([])), (x233 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x233), x234), @ssreflect.clear_assumption("a")), @ssreflect.case), t237), @ssreflect.done_tac)])
  andb_idr_c.set(@sections.section_proof(@list.List(["a", "b"]), @term_syntax.parse_term("((a : Bool) → (b : Bool)) → (a && b) == a"), t238))
}

///|
let andb_idr_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("andb_idr")

///|
/// `Ssrbool.andb_idr`
pub fn andb_idr() -> @kernel.Thm {
  andb_idr_c.get()
}

///|
/// andb_id2l
fn step_80() -> Unit raise {
  let t241 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x240 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("a", @list.List([])), (x239 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x239), x240), @ssreflect.clear_assumption("a")), @ssreflect.case), @ssreflect.simp_tac), @ssreflect.done_tac)])
  andb_id2l_c.set(@sections.section_proof(@list.List(["a", "b", "c"]), @term_syntax.parse_term("((a : Bool) → (b : Bool) == (c : Bool)) → (a && b) == (a && c)"), t241))
}

///|
let andb_id2l_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("andb_id2l")

///|
/// `Ssrbool.andb_id2l`
pub fn andb_id2l() -> @kernel.Thm {
  andb_id2l_c.get()
}

///|
/// andb_id2r
fn step_81() -> Unit raise {
  let t246 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x245 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x244 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x244), x245), @ssreflect.clear_assumption("b")), @ssreflect.case), @ssreflect.simp_tac)
  let t247 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x243 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("a", @list.List([])), (x242 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x242), x243), @ssreflect.clear_assumption("a")), @ssreflect.case), t246), @ssreflect.done_tac)])
  andb_id2r_c.set(@sections.section_proof(@list.List(["a", "b", "c"]), @term_syntax.parse_term("((b : Bool) → (a : Bool) == (c : Bool)) → (a && b) == (c && b)"), t247))
}

///|
let andb_id2r_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("andb_id2r")

///|
/// `Ssrbool.andb_id2r`
pub fn andb_id2r() -> @kernel.Thm {
  andb_id2r_c.get()
}

///|
/// orb_idl
fn step_82() -> Unit raise {
  let t250 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x249 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("a", @list.List([])), (x248 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x248), x249), @ssreflect.clear_assumption("a")), @ssreflect.case), @ssreflect.simp_tac), @ssreflect.done_tac)])
  orb_idl_c.set(@sections.section_proof(@list.List(["a", "b"]), @term_syntax.parse_term("((a : Bool) → (b : Bool)) → (a || b) == b"), t250))
}

///|
let orb_idl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("orb_idl")

///|
/// `Ssrbool.orb_idl`
pub fn orb_idl() -> @kernel.Thm {
  orb_idl_c.get()
}

///|
/// orbb_idr
fn step_83() -> Unit raise {
  let t253 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x252 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("a", @list.List([])), (x251 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x251), x252), @ssreflect.clear_assumption("a")), @ssreflect.case), @ssreflect.simp_tac), @ssreflect.done_tac)])
  orbb_idr_c.set(@sections.section_proof(@list.List(["a", "b"]), @term_syntax.parse_term("((b : Bool) → (a : Bool)) → (a || b) == a"), t253))
}

///|
let orbb_idr_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("orbb_idr")

///|
/// `Ssrbool.orbb_idr`
pub fn orbb_idr() -> @kernel.Thm {
  orbb_idr_c.get()
}

///|
/// orb_id2l
fn step_84() -> Unit raise {
  let t256 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x255 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("a", @list.List([])), (x254 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x254), x255), @ssreflect.clear_assumption("a")), @ssreflect.case), @ssreflect.simp_tac), @ssreflect.done_tac)])
  orb_id2l_c.set(@sections.section_proof(@list.List(["a", "b", "c"]), @term_syntax.parse_term("(!(a : Bool) → (b : Bool) == (c : Bool)) → (a || b) == (a || c)"), t256))
}

///|
let orb_id2l_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("orb_id2l")

///|
/// `Ssrbool.orb_id2l`
pub fn orb_id2l() -> @kernel.Thm {
  orb_id2l_c.get()
}

///|
/// orb_id2r
fn step_85() -> Unit raise {
  let t261 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x260 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x259 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x259), x260), @ssreflect.clear_assumption("b")), @ssreflect.case), @ssreflect.simp_tac)
  let t262 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x258 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("a", @list.List([])), (x257 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x257), x258), @ssreflect.clear_assumption("a")), @ssreflect.case), t261), @ssreflect.done_tac)])
  orb_id2r_c.set(@sections.section_proof(@list.List(["a", "b", "c"]), @term_syntax.parse_term("(!(b : Bool) → (a : Bool) == (c : Bool)) → (a || b) == (c || b)"), t262))
}

///|
let orb_id2r_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("orb_id2r")

///|
/// `Ssrbool.orb_id2r`
pub fn orb_id2r() -> @kernel.Thm {
  orb_id2r_c.get()
}

///|
/// negb_and
fn step_86() -> Unit raise {
  let t265 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x264 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("a", @list.List([])), (x263 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x263), x264), @ssreflect.clear_assumption("a")), @ssreflect.case), @ssreflect.simp_tac), @ssreflect.done_tac)])
  negb_and_c.set(@sections.section_proof(@list.List(["a", "b"]), @term_syntax.parse_term("!((a : Bool) && (b : Bool)) == (!a || !b)"), t265))
}

///|
let negb_and_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("negb_and")

///|
/// `Ssrbool.negb_and`
pub fn negb_and() -> @kernel.Thm {
  negb_and_c.get()
}

///|
/// negb_or
fn step_87() -> Unit raise {
  let t268 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x267 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("a", @list.List([])), (x266 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x266), x267), @ssreflect.clear_assumption("a")), @ssreflect.case), @ssreflect.simp_tac), @ssreflect.done_tac)])
  negb_or_c.set(@sections.section_proof(@list.List(["a", "b"]), @term_syntax.parse_term("!((a : Bool) || (b : Bool)) == (!a && !b)"), t268))
}

///|
let negb_or_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("negb_or")

///|
/// `Ssrbool.negb_or`
pub fn negb_or() -> @kernel.Thm {
  negb_or_c.get()
}

///|
/// andbK
fn step_88() -> Unit raise {
  let t271 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x270 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("a", @list.List([])), (x269 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x269), x270), @ssreflect.clear_assumption("a")), @ssreflect.case), @ssreflect.simp_tac), @ssreflect.done_tac)])
  andbk_c.set(@sections.section_proof(@list.List(["a", "b"]), @term_syntax.parse_term("((a : Bool) && (b : Bool) || a) == a"), t271))
}

///|
let andbk_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("andbK")

///|
/// `Ssrbool.andbK`
pub fn andbk() -> @kernel.Thm {
  andbk_c.get()
}

///|
/// andKb
fn step_89() -> Unit raise {
  let t274 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x273 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("a", @list.List([])), (x272 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x272), x273), @ssreflect.clear_assumption("a")), @ssreflect.case), @ssreflect.simp_tac), @ssreflect.done_tac)])
  andkb_c.set(@sections.section_proof(@list.List(["a", "b"]), @term_syntax.parse_term("((a : Bool) || (b : Bool) && a) == a"), t274))
}

///|
let andkb_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("andKb")

///|
/// `Ssrbool.andKb`
pub fn andkb() -> @kernel.Thm {
  andkb_c.get()
}

///|
/// orbK
fn step_90() -> Unit raise {
  let t277 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x276 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("a", @list.List([])), (x275 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x275), x276), @ssreflect.clear_assumption("a")), @ssreflect.case), @ssreflect.simp_tac), @ssreflect.done_tac)])
  orbk_c.set(@sections.section_proof(@list.List(["a", "b"]), @term_syntax.parse_term("(((a : Bool) || (b : Bool)) && a) == a"), t277))
}

///|
let orbk_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("orbK")

///|
/// `Ssrbool.orbK`
pub fn orbk() -> @kernel.Thm {
  orbk_c.get()
}

///|
/// orKb
fn step_91() -> Unit raise {
  let t280 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x279 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("a", @list.List([])), (x278 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x278), x279), @ssreflect.clear_assumption("a")), @ssreflect.case), @ssreflect.simp_tac), @ssreflect.done_tac)])
  orkb_c.set(@sections.section_proof(@list.List(["a", "b"]), @term_syntax.parse_term("((a : Bool) && ((b : Bool) || a)) == a"), t280))
}

///|
let orkb_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("orKb")

///|
/// `Ssrbool.orKb`
pub fn orkb() -> @kernel.Thm {
  orkb_c.get()
}

///|
/// implybT
fn step_92() -> Unit raise {
  implybt_c.set(@sections.section_proof(@list.List(["b"]), @term_syntax.parse_term("(b : Bool) → true"), @list.List([@ssreflect.done_tac])))
}

///|
let implybt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("implybT")

///|
/// `Ssrbool.implybT`
pub fn implybt() -> @kernel.Thm {
  implybt_c.get()
}

///|
/// implybF
fn step_93() -> Unit raise {
  implybf_c.set(@sections.section_proof(@list.List(["b"]), @term_syntax.parse_term("((b : Bool) → false) == !b"), @list.List([@ssreflect.done_tac])))
}

///|
let implybf_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("implybF")

///|
/// `Ssrbool.implybF`
pub fn implybf() -> @kernel.Thm {
  implybf_c.get()
}

///|
/// implyFb
fn step_94() -> Unit raise {
  implyfb_c.set(@sections.section_proof(@list.List(["b"]), @term_syntax.parse_term("false → (b : Bool)"), @list.List([@ssreflect.done_tac])))
}

///|
let implyfb_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("implyFb")

///|
/// `Ssrbool.implyFb`
pub fn implyfb() -> @kernel.Thm {
  implyfb_c.get()
}

///|
/// implyTb
fn step_95() -> Unit raise {
  implytb_c.set(@sections.section_proof(@list.List(["b"]), @term_syntax.parse_term("(true → (b : Bool)) == b"), @list.List([@ssreflect.done_tac])))
}

///|
let implytb_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("implyTb")

///|
/// `Ssrbool.implyTb`
pub fn implytb() -> @kernel.Thm {
  implytb_c.get()
}

///|
/// implybb
fn step_96() -> Unit raise {
  implybb_c.set(@sections.section_proof(@list.List(["b"]), @term_syntax.parse_term("(b : Bool) → b"), @list.List([@ssreflect.done_tac])))
}

///|
let implybb_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("implybb")

///|
/// `Ssrbool.implybb`
pub fn implybb() -> @kernel.Thm {
  implybb_c.get()
}

///|
/// negb_imply
fn step_97() -> Unit raise {
  let t283 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x282 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("a", @list.List([])), (x281 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x281), x282), @ssreflect.clear_assumption("a")), @ssreflect.case), @ssreflect.simp_tac), @ssreflect.done_tac)])
  negb_imply_c.set(@sections.section_proof(@list.List(["a", "b"]), @term_syntax.parse_term("!((a : Bool) → (b : Bool)) == (a && !b)"), t283))
}

///|
let negb_imply_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("negb_imply")

///|
/// `Ssrbool.negb_imply`
pub fn negb_imply() -> @kernel.Thm {
  negb_imply_c.get()
}

///|
/// implybE
fn step_98() -> Unit raise {
  let t286 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x285 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("a", @list.List([])), (x284 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x284), x285), @ssreflect.clear_assumption("a")), @ssreflect.case), @ssreflect.simp_tac), @ssreflect.done_tac)])
  implybe_c.set(@sections.section_proof(@list.List(["a", "b"]), @term_syntax.parse_term("((a : Bool) → (b : Bool)) == (!a || b)"), t286))
}

///|
let implybe_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("implybE")

///|
/// `Ssrbool.implybE`
pub fn implybe() -> @kernel.Thm {
  implybe_c.get()
}

///|
/// implyNb
fn step_99() -> Unit raise {
  let t289 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x288 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("a", @list.List([])), (x287 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x287), x288), @ssreflect.clear_assumption("a")), @ssreflect.case), @ssreflect.simp_tac), @ssreflect.done_tac)])
  implynb_c.set(@sections.section_proof(@list.List(["a", "b"]), @term_syntax.parse_term("(!(a : Bool) → (b : Bool)) == (a || b)"), t289))
}

///|
let implynb_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("implyNb")

///|
/// `Ssrbool.implyNb`
pub fn implynb() -> @kernel.Thm {
  implynb_c.get()
}

///|
/// implybN
fn step_100() -> Unit raise {
  let t292 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x291 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("a", @list.List([])), (x290 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x290), x291), @ssreflect.clear_assumption("a")), @ssreflect.case), @ssreflect.simp_tac), @ssreflect.done_tac)])
  implybn_c.set(@sections.section_proof(@list.List(["a", "b"]), @term_syntax.parse_term("((a : Bool) → !(b : Bool)) == (b → !a)"), t292))
}

///|
let implybn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("implybN")

///|
/// `Ssrbool.implybN`
pub fn implybn() -> @kernel.Thm {
  implybn_c.get()
}

///|
/// implybNN
fn step_101() -> Unit raise {
  let t295 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x294 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("a", @list.List([])), (x293 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x293), x294), @ssreflect.clear_assumption("a")), @ssreflect.case), @ssreflect.simp_tac), @ssreflect.done_tac)])
  implybnn_c.set(@sections.section_proof(@list.List(["a", "b"]), @term_syntax.parse_term("(!(a : Bool) → !(b : Bool)) == (b → a)"), t295))
}

///|
let implybnn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("implybNN")

///|
/// `Ssrbool.implybNN`
pub fn implybnn() -> @kernel.Thm {
  implybnn_c.get()
}

///|
/// implyb_idl
fn step_102() -> Unit raise {
  let t298 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x297 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("a", @list.List([])), (x296 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x296), x297), @ssreflect.clear_assumption("a")), @ssreflect.case), @ssreflect.simp_tac), @ssreflect.done_tac)])
  implyb_idl_c.set(@sections.section_proof(@list.List(["a", "b"]), @term_syntax.parse_term("(!(a : Bool) → (b : Bool)) → (a → b) == b"), t298))
}

///|
let implyb_idl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("implyb_idl")

///|
/// `Ssrbool.implyb_idl`
pub fn implyb_idl() -> @kernel.Thm {
  implyb_idl_c.get()
}

///|
/// implyb_idr
fn step_103() -> Unit raise {
  let t301 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x300 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("a", @list.List([])), (x299 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x299), x300), @ssreflect.clear_assumption("a")), @ssreflect.case), @ssreflect.simp_tac), @ssreflect.done_tac)])
  implyb_idr_c.set(@sections.section_proof(@list.List(["a", "b"]), @term_syntax.parse_term("((b : Bool) → !(a : Bool)) → (a → b) == !a"), t301))
}

///|
let implyb_idr_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("implyb_idr")

///|
/// `Ssrbool.implyb_idr`
pub fn implyb_idr() -> @kernel.Thm {
  implyb_idr_c.get()
}

///|
/// implyb_id2l
fn step_104() -> Unit raise {
  let t304 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x303 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("a", @list.List([])), (x302 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x302), x303), @ssreflect.clear_assumption("a")), @ssreflect.case), @ssreflect.simp_tac), @ssreflect.done_tac)])
  implyb_id2l_c.set(@sections.section_proof(@list.List(["a", "b", "c"]), @term_syntax.parse_term("((a : Bool) → (b : Bool) == (c : Bool)) → (a → b) == (a → c)"), t304))
}

///|
let implyb_id2l_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("implyb_id2l")

///|
/// `Ssrbool.implyb_id2l`
pub fn implyb_id2l() -> @kernel.Thm {
  implyb_id2l_c.get()
}

///|
/// XOR_DEF
fn step_105() -> Unit raise {
  xor_def_c.set(@pair.new_definition(@term_syntax.parse_term("(XOR : (Bool, Bool) -> Bool)((p : Bool), (q : Bool)) == (if p { !q } else { q })")))
}

///|
let xor_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("XOR_DEF")

///|
/// `Ssrbool.XOR_DEF`
pub fn xor_def() -> @kernel.Thm {
  xor_def_c.get()
}

///|
/// Formal_ineqs/lib/ssrbool.hl:621
fn step_106() -> Unit raise {
  @preterm.overload_interface("+", @term_syntax.parse_term("XOR"))
}

///|
/// addFb
fn step_107() -> Unit raise {
  let t309 = @ssreflect.thm_tac(fn(x307 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x308 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x305 : @kernel.Thm, x306 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x305, x306))(x307, x308)
    }
  })
  let t311 = @list.List([@tactics.then_tac((x310 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("XOR_DEF", @list.List([xor_def()])), t309, x310), @ssreflect.done_tac)])
  addfb_c.set(@sections.section_proof(@list.List(["b"]), @term_syntax.parse_term("false + (b : Bool) == b"), t311))
}

///|
let addfb_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("addFb")

///|
/// `Ssrbool.addFb`
pub fn addfb() -> @kernel.Thm {
  addfb_c.get()
}

///|
/// addbF
fn step_108() -> Unit raise {
  let t320 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x319 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x318 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x318), x319), @ssreflect.clear_assumption("b")), @ssreflect.case), @ssreflect.simp_tac)
  let t316 = @ssreflect.thm_tac(fn(x314 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x315 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x312 : @kernel.Thm, x313 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x312, x313))(x314, x315)
    }
  })
  let t321 = @list.List([@tactics.then_tac(@tactics.then_tac((x317 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("XOR_DEF", @list.List([xor_def()])), t316, x317), t320), @ssreflect.done_tac)])
  addbf_c.set(@sections.section_proof(@list.List(["b"]), @term_syntax.parse_term("(b : Bool) + false == b"), t321))
}

///|
let addbf_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("addbF")

///|
/// `Ssrbool.addbF`
pub fn addbf() -> @kernel.Thm {
  addbf_c.get()
}

///|
/// addbb
fn step_109() -> Unit raise {
  let t330 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x329 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x328 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x328), x329), @ssreflect.clear_assumption("b")), @ssreflect.case), @ssreflect.simp_tac)
  let t326 = @ssreflect.thm_tac(fn(x324 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x325 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x322 : @kernel.Thm, x323 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x322, x323))(x324, x325)
    }
  })
  let t331 = @list.List([@tactics.then_tac(@tactics.then_tac((x327 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("XOR_DEF", @list.List([xor_def()])), t326, x327), t330), @ssreflect.done_tac)])
  addbb_c.set(@sections.section_proof(@list.List(["b"]), @term_syntax.parse_term("(b : Bool) + b == false"), t331))
}

///|
let addbb_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("addbb")

///|
/// `Ssrbool.addbb`
pub fn addbb() -> @kernel.Thm {
  addbb_c.get()
}

///|
/// addbC
fn step_110() -> Unit raise {
  let t343 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x342 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("c", @list.List([])), (x341 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x341), x342), @ssreflect.clear_assumption("c")), @ssreflect.case), @ssreflect.simp_tac)
  let t340 = @tactics.then_tac(@tactics.then_tac((x339 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x338 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x338), x339), @ssreflect.clear_assumption("b")), @ssreflect.case)
  let t336 = @ssreflect.thm_tac(fn(x334 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x335 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x332 : @kernel.Thm, x333 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x332, x333))(x334, x335)
    }
  })
  let t344 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@ssreflect.repeat_tactic(1L, 9L, (x337 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("XOR_DEF", @list.List([xor_def()])), t336, x337)), t340), t343), @ssreflect.done_tac)])
  addbc_c.set(@sections.section_proof(@list.List(["b", "c"]), @term_syntax.parse_term("(b : Bool) + (c : Bool) == c + b"), t344))
}

///|
let addbc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("addbC")

///|
/// `Ssrbool.addbC`
pub fn addbc() -> @kernel.Thm {
  addbc_c.get()
}

///|
/// addbA
fn step_111() -> Unit raise {
  let t359 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x358 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("a", @list.List([])), (x357 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x357), x358), @ssreflect.clear_assumption("a")), @ssreflect.case), @ssreflect.simp_tac)
  let t356 = @tactics.then_tac(@tactics.then_tac((x355 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("c", @list.List([])), (x354 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x354), x355), @ssreflect.clear_assumption("c")), @ssreflect.case)
  let t353 = @tactics.then_tac(@tactics.then_tac((x352 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x351 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x351), x352), @ssreflect.clear_assumption("b")), @ssreflect.case)
  let t349 = @ssreflect.thm_tac(fn(x347 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x348 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x345 : @kernel.Thm, x346 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x345, x346))(x347, x348)
    }
  })
  let t360 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@ssreflect.repeat_tactic(1L, 9L, (x350 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("XOR_DEF", @list.List([xor_def()])), t349, x350)), t353), t356), t359)])
  addba_c.set(@sections.section_proof(@list.List(["a", "b", "c"]), @term_syntax.parse_term("(a : Bool) + ((b : Bool) + (c : Bool)) == a + b + c"), t360))
}

///|
let addba_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("addbA")

///|
/// `Ssrbool.addbA`
pub fn addba() -> @kernel.Thm {
  addba_c.get()
}

///|
/// addbCA
fn step_112() -> Unit raise {
  let t375 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x374 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("a", @list.List([])), (x373 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x373), x374), @ssreflect.clear_assumption("a")), @ssreflect.case), @ssreflect.simp_tac)
  let t372 = @tactics.then_tac(@tactics.then_tac((x371 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("c", @list.List([])), (x370 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x370), x371), @ssreflect.clear_assumption("c")), @ssreflect.case)
  let t369 = @tactics.then_tac(@tactics.then_tac((x368 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x367 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x367), x368), @ssreflect.clear_assumption("b")), @ssreflect.case)
  let t365 = @ssreflect.thm_tac(fn(x363 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x364 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x361 : @kernel.Thm, x362 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x361, x362))(x363, x364)
    }
  })
  let t376 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@ssreflect.repeat_tactic(1L, 9L, (x366 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("XOR_DEF", @list.List([xor_def()])), t365, x366)), t369), t372), t375)])
  addbca_c.set(@sections.section_proof(@list.List(["a", "b", "c"]), @term_syntax.parse_term("(a : Bool) + (b : Bool) + (c : Bool) == a + c + b"), t376))
}

///|
let addbca_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("addbCA")

///|
/// `Ssrbool.addbCA`
pub fn addbca() -> @kernel.Thm {
  addbca_c.get()
}

///|
/// addbAC
fn step_113() -> Unit raise {
  let t391 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x390 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("a", @list.List([])), (x389 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x389), x390), @ssreflect.clear_assumption("a")), @ssreflect.case), @ssreflect.simp_tac)
  let t388 = @tactics.then_tac(@tactics.then_tac((x387 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("c", @list.List([])), (x386 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x386), x387), @ssreflect.clear_assumption("c")), @ssreflect.case)
  let t385 = @tactics.then_tac(@tactics.then_tac((x384 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x383 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x383), x384), @ssreflect.clear_assumption("b")), @ssreflect.case)
  let t381 = @ssreflect.thm_tac(fn(x379 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x380 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x377 : @kernel.Thm, x378 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x377, x378))(x379, x380)
    }
  })
  let t392 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@ssreflect.repeat_tactic(1L, 9L, (x382 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("XOR_DEF", @list.List([xor_def()])), t381, x382)), t385), t388), t391)])
  addbac_c.set(@sections.section_proof(@list.List(["a", "b", "c"]), @term_syntax.parse_term("(a : Bool) + ((b : Bool) + (c : Bool)) == b + (a + c)"), t392))
}

///|
let addbac_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("addbAC")

///|
/// `Ssrbool.addbAC`
pub fn addbac() -> @kernel.Thm {
  addbac_c.get()
}

///|
/// andb_addl
fn step_114() -> Unit raise {
  let t407 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x406 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("a", @list.List([])), (x405 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x405), x406), @ssreflect.clear_assumption("a")), @ssreflect.case), @ssreflect.simp_tac)
  let t404 = @tactics.then_tac(@tactics.then_tac((x403 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("c", @list.List([])), (x402 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x402), x403), @ssreflect.clear_assumption("c")), @ssreflect.case)
  let t401 = @tactics.then_tac(@tactics.then_tac((x400 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x399 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x399), x400), @ssreflect.clear_assumption("b")), @ssreflect.case)
  let t397 = @ssreflect.thm_tac(fn(x395 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x396 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x393 : @kernel.Thm, x394 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x393, x394))(x395, x396)
    }
  })
  let t408 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@ssreflect.repeat_tactic(1L, 9L, (x398 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("XOR_DEF", @list.List([xor_def()])), t397, x398)), t401), t404), t407)])
  andb_addl_c.set(@sections.section_proof(@list.List(["a", "b", "c"]), @term_syntax.parse_term("((a : Bool) + (b : Bool) && (c : Bool)) == (a && c) + (b && c)"), t408))
}

///|
let andb_addl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("andb_addl")

///|
/// `Ssrbool.andb_addl`
pub fn andb_addl() -> @kernel.Thm {
  andb_addl_c.get()
}

///|
/// andb_addr
fn step_115() -> Unit raise {
  let t423 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x422 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("a", @list.List([])), (x421 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x421), x422), @ssreflect.clear_assumption("a")), @ssreflect.case), @ssreflect.simp_tac)
  let t420 = @tactics.then_tac(@tactics.then_tac((x419 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("c", @list.List([])), (x418 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x418), x419), @ssreflect.clear_assumption("c")), @ssreflect.case)
  let t417 = @tactics.then_tac(@tactics.then_tac((x416 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x415 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x415), x416), @ssreflect.clear_assumption("b")), @ssreflect.case)
  let t413 = @ssreflect.thm_tac(fn(x411 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x412 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x409 : @kernel.Thm, x410 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x409, x410))(x411, x412)
    }
  })
  let t424 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@ssreflect.repeat_tactic(1L, 9L, (x414 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("XOR_DEF", @list.List([xor_def()])), t413, x414)), t417), t420), t423)])
  andb_addr_c.set(@sections.section_proof(@list.List(["a", "b", "c"]), @term_syntax.parse_term("((a : Bool) && (b : Bool) + (c : Bool)) == (a && b) + (a && c)"), t424))
}

///|
let andb_addr_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("andb_addr")

///|
/// `Ssrbool.andb_addr`
pub fn andb_addr() -> @kernel.Thm {
  andb_addr_c.get()
}

///|
/// addKb
fn step_116() -> Unit raise {
  let t436 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x435 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("y", @list.List([])), (x434 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x434), x435), @ssreflect.clear_assumption("y")), @ssreflect.case), @ssreflect.simp_tac)
  let t433 = @tactics.then_tac(@tactics.then_tac((x432 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("x", @list.List([])), (x431 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x431), x432), @ssreflect.clear_assumption("x")), @ssreflect.case)
  let t429 = @ssreflect.thm_tac(fn(x427 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x428 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x425 : @kernel.Thm, x426 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x425, x426))(x427, x428)
    }
  })
  let t437 = @list.List([@tactics.then_tac(@tactics.then_tac(@ssreflect.repeat_tactic(1L, 9L, (x430 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("XOR_DEF", @list.List([xor_def()])), t429, x430)), t433), t436)])
  addkb_c.set(@sections.section_proof(@list.List(["x", "y"]), @term_syntax.parse_term("(x : Bool) + (x + (y : Bool)) == y"), t437))
}

///|
let addkb_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("addKb")

///|
/// `Ssrbool.addKb`
pub fn addkb() -> @kernel.Thm {
  addkb_c.get()
}

///|
/// addbK
fn step_117() -> Unit raise {
  let t449 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x448 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("y", @list.List([])), (x447 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x447), x448), @ssreflect.clear_assumption("y")), @ssreflect.case), @ssreflect.simp_tac)
  let t446 = @tactics.then_tac(@tactics.then_tac((x445 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("x", @list.List([])), (x444 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x444), x445), @ssreflect.clear_assumption("x")), @ssreflect.case)
  let t442 = @ssreflect.thm_tac(fn(x440 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x441 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x438 : @kernel.Thm, x439 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x438, x439))(x440, x441)
    }
  })
  let t450 = @list.List([@tactics.then_tac(@tactics.then_tac(@ssreflect.repeat_tactic(1L, 9L, (x443 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("XOR_DEF", @list.List([xor_def()])), t442, x443)), t446), t449)])
  addbk_c.set(@sections.section_proof(@list.List(["x", "y"]), @term_syntax.parse_term("(y : Bool) + (x : Bool) + x == y"), t450))
}

///|
let addbk_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("addbK")

///|
/// `Ssrbool.addbK`
pub fn addbk() -> @kernel.Thm {
  addbk_c.get()
}

///|
/// addIb
fn step_118() -> Unit raise {
  let t465 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x464 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("x", @list.List([])), (x463 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x463), x464), @ssreflect.clear_assumption("x")), @ssreflect.case), @ssreflect.simp_tac)
  let t462 = @tactics.then_tac(@tactics.then_tac((x461 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("y2", @list.List([])), (x460 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x460), x461), @ssreflect.clear_assumption("y2")), @ssreflect.case)
  let t459 = @tactics.then_tac(@tactics.then_tac((x458 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("y1", @list.List([])), (x457 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x457), x458), @ssreflect.clear_assumption("y1")), @ssreflect.case)
  let t455 = @ssreflect.thm_tac(fn(x453 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x454 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x451 : @kernel.Thm, x452 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x451, x452))(x453, x454)
    }
  })
  let t466 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@ssreflect.repeat_tactic(1L, 9L, (x456 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("XOR_DEF", @list.List([xor_def()])), t455, x456)), t459), t462), t465)])
  addib_c.set(@sections.section_proof(@list.List(["x", "y1", "y2"]), @term_syntax.parse_term("(y1 : Bool) + (x : Bool) == (y2 : Bool) + x → y1 == y2"), t466))
}

///|
let addib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("addIb")

///|
/// `Ssrbool.addIb`
pub fn addib() -> @kernel.Thm {
  addib_c.get()
}

///|
/// addbI
fn step_119() -> Unit raise {
  let t481 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x480 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("y2", @list.List([])), (x479 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x479), x480), @ssreflect.clear_assumption("y2")), @ssreflect.case), @ssreflect.simp_tac)
  let t478 = @tactics.then_tac(@tactics.then_tac((x477 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("y1", @list.List([])), (x476 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x476), x477), @ssreflect.clear_assumption("y1")), @ssreflect.case)
  let t475 = @tactics.then_tac(@tactics.then_tac((x474 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("x", @list.List([])), (x473 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x473), x474), @ssreflect.clear_assumption("x")), @ssreflect.case)
  let t471 = @ssreflect.thm_tac(fn(x469 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x470 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x467 : @kernel.Thm, x468 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x467, x468))(x469, x470)
    }
  })
  let t482 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@ssreflect.repeat_tactic(1L, 9L, (x472 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("XOR_DEF", @list.List([xor_def()])), t471, x472)), t475), t478), t481)])
  addbi_c.set(@sections.section_proof(@list.List(["x", "y1", "y2"]), @term_syntax.parse_term("(x : Bool) + (y1 : Bool) == x + (y2 : Bool) → y1 == y2"), t482))
}

///|
let addbi_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("addbI")

///|
/// `Ssrbool.addbI`
pub fn addbi() -> @kernel.Thm {
  addbi_c.get()
}

///|
/// addTb
fn step_120() -> Unit raise {
  let t489 = @tactics.try_tac(@ssreflect.done_tac)
  let t487 = @ssreflect.thm_tac(fn(x485 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x486 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x483 : @kernel.Thm, x484 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x483, x484))(x485, x486)
    }
  })
  let t490 = @list.List([@tactics.then_tac(@tactics.then_tac((x488 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("XOR_DEF", @list.List([xor_def()])), t487, x488), t489), @ssreflect.done_tac)])
  addtb_c.set(@sections.section_proof(@list.List(["b"]), @term_syntax.parse_term("true + (b : Bool) == !b"), t490))
}

///|
let addtb_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("addTb")

///|
/// `Ssrbool.addTb`
pub fn addtb() -> @kernel.Thm {
  addtb_c.get()
}

///|
/// addbT
fn step_121() -> Unit raise {
  let t499 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x498 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x497 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x497), x498), @ssreflect.clear_assumption("b")), @ssreflect.case), @ssreflect.simp_tac)
  let t495 = @ssreflect.thm_tac(fn(x493 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x494 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x491 : @kernel.Thm, x492 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x491, x492))(x493, x494)
    }
  })
  let t500 = @list.List([@tactics.then_tac(@tactics.then_tac((x496 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("XOR_DEF", @list.List([xor_def()])), t495, x496), t499), @ssreflect.done_tac)])
  addbt_c.set(@sections.section_proof(@list.List(["b"]), @term_syntax.parse_term("(b : Bool) + true == !b"), t500))
}

///|
let addbt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("addbT")

///|
/// `Ssrbool.addbT`
pub fn addbt() -> @kernel.Thm {
  addbt_c.get()
}

///|
/// addbN
fn step_122() -> Unit raise {
  let t512 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x511 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x510 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x510), x511), @ssreflect.clear_assumption("b")), @ssreflect.case), @ssreflect.simp_tac)
  let t509 = @tactics.then_tac(@tactics.then_tac((x508 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("a", @list.List([])), (x507 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x507), x508), @ssreflect.clear_assumption("a")), @ssreflect.case)
  let t505 = @ssreflect.thm_tac(fn(x503 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x504 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x501 : @kernel.Thm, x502 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x501, x502))(x503, x504)
    }
  })
  let t513 = @list.List([@tactics.then_tac(@tactics.then_tac(@ssreflect.repeat_tactic(1L, 9L, (x506 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("XOR_DEF", @list.List([xor_def()])), t505, x506)), t509), t512)])
  addbn_c.set(@sections.section_proof(@list.List(["a", "b"]), @term_syntax.parse_term("(a : Bool) + !(b : Bool) == !(a + b)"), t513))
}

///|
let addbn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("addbN")

///|
/// `Ssrbool.addbN`
pub fn addbn() -> @kernel.Thm {
  addbn_c.get()
}

///|
/// addNb
fn step_123() -> Unit raise {
  let t525 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x524 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("b", @list.List([])), (x523 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x523), x524), @ssreflect.clear_assumption("b")), @ssreflect.case), @ssreflect.simp_tac)
  let t522 = @tactics.then_tac(@tactics.then_tac((x521 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("a", @list.List([])), (x520 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x520), x521), @ssreflect.clear_assumption("a")), @ssreflect.case)
  let t518 = @ssreflect.thm_tac(fn(x516 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x517 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x514 : @kernel.Thm, x515 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x514, x515))(x516, x517)
    }
  })
  let t526 = @list.List([@tactics.then_tac(@tactics.then_tac(@ssreflect.repeat_tactic(1L, 9L, (x519 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("XOR_DEF", @list.List([xor_def()])), t518, x519)), t522), t525)])
  addnb_c.set(@sections.section_proof(@list.List(["a", "b"]), @term_syntax.parse_term("!(a : Bool) + (b : Bool) == !(a + b)"), t526))
}

///|
let addnb_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("addNb")

///|
/// `Ssrbool.addNb`
pub fn addnb() -> @kernel.Thm {
  addnb_c.get()
}

///|
/// subpred
fn step_124() -> Unit raise {
  subpred_c.set(@pair.new_definition(@term_syntax.parse_term("(subpred : ((_) -> Bool, (_) -> Bool) -> Bool)((p1 : (_) -> Bool), (p2 : (_) -> Bool)) == (∀ x : _, p1(x) → p2(x))")))
}

///|
let subpred_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("subpred")

///|
/// `Ssrbool.subpred`
pub fn subpred() -> @kernel.Thm {
  subpred_c.get()
}

///|
/// subrel
fn step_125() -> Unit raise {
  subrel_c.set(@pair.new_definition(@term_syntax.parse_term("(subrel : ((_, _) -> Bool, (_, _) -> Bool) -> Bool)((r1 : (_, _) -> Bool), (r2 : (_, _) -> Bool)) == (∀ x : _, ∀ y : _, r1(x, y) → r2(x, y))")))
}

///|
let subrel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("subrel")

///|
/// `Ssrbool.subrel`
pub fn subrel() -> @kernel.Thm {
  subrel_c.get()
}

///|
/// pred0
fn step_126() -> Unit raise {
  pred0_c.set(@pair.new_definition(@term_syntax.parse_term("(pred0 : (_) -> Bool) == ((x : _) => false)")))
}

///|
let pred0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pred0")

///|
/// `Ssrbool.pred0`
pub fn pred0() -> @kernel.Thm {
  pred0_c.get()
}

///|
/// predT
fn step_127() -> Unit raise {
  predt_c.set(@pair.new_definition(@term_syntax.parse_term("(predT : (_) -> Bool) == ((x : _) => true)")))
}

///|
let predt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("predT")

///|
/// `Ssrbool.predT`
pub fn predt() -> @kernel.Thm {
  predt_c.get()
}

///|
/// predI
fn step_128() -> Unit raise {
  predi_c.set(@pair.new_definition(@term_syntax.parse_term("(predI : ((_) -> Bool, (_) -> Bool, _) -> Bool)((p1 : (_) -> Bool), (p2 : (_) -> Bool)) == ((x : _) => p1(x) && p2(x))")))
}

///|
let predi_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("predI")

///|
/// `Ssrbool.predI`
pub fn predi() -> @kernel.Thm {
  predi_c.get()
}

///|
/// predU
fn step_129() -> Unit raise {
  predu_c.set(@pair.new_definition(@term_syntax.parse_term("(predU : ((_) -> Bool, (_) -> Bool, _) -> Bool)((p1 : (_) -> Bool), (p2 : (_) -> Bool)) == ((x : _) => p1(x) || p2(x))")))
}

///|
let predu_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("predU")

///|
/// `Ssrbool.predU`
pub fn predu() -> @kernel.Thm {
  predu_c.get()
}

///|
/// predC
fn step_130() -> Unit raise {
  predc_c.set(@pair.new_definition(@term_syntax.parse_term("(predC : ((_) -> Bool, _) -> Bool)((p : (_) -> Bool)) == ((x : _) => !p(x))")))
}

///|
let predc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("predC")

///|
/// `Ssrbool.predC`
pub fn predc() -> @kernel.Thm {
  predc_c.get()
}

///|
/// predD
fn step_131() -> Unit raise {
  predd_c.set(@pair.new_definition(@term_syntax.parse_term("(predD : ((_) -> Bool, (_) -> Bool, _) -> Bool)((p1 : (_) -> Bool), (p2 : (_) -> Bool)) == ((x : _) => !p2(x) && p1(x))")))
}

///|
let predd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("predD")

///|
/// `Ssrbool.predD`
pub fn predd() -> @kernel.Thm {
  predd_c.get()
}

///|
/// preim
fn step_132() -> Unit raise {
  preim_c.set(@pair.new_definition(@term_syntax.parse_term("(preim : ((_) -> A, (A) -> Bool, _) -> Bool)((f : (_) -> A), (d : (A) -> Bool)) == ((x : _) => d(f(x)))")))
}

///|
let preim_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("preim")

///|
/// `Ssrbool.preim`
pub fn preim() -> @kernel.Thm {
  preim_c.get()
}

///|
/// relU
fn step_133() -> Unit raise {
  relu_c.set(@pair.new_definition(@term_syntax.parse_term("(relU : ((_, _) -> Bool, (_, _) -> Bool, _, _) -> Bool)((r1 : (_, _) -> Bool), (r2 : (_, _) -> Bool)) == ((x : _) => (y : _) => r1(x, y) || r2(x, y))")))
}

///|
let relu_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("relU")

///|
/// `Ssrbool.relU`
pub fn relu() -> @kernel.Thm {
  relu_c.get()
}

///|
/// subrelUl
fn step_134() -> Unit raise {
  let t537 = @ssreflect.thm_tac(fn(x535 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x536 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x533 : @kernel.Thm, x534 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x533, x534))(x535, x536)
    }
  })
  let t531 = @ssreflect.thm_tac(fn(x529 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x530 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x527 : @kernel.Thm, x528 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x527, x528))(x529, x530)
    }
  })
  let t539 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x532 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("relU", @list.List([relu()])), t531, x532), (x538 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("subrel", @list.List([subrel()])), t537, x538)), @ssreflect.simp_tac), @ssreflect.done_tac)])
  subrelul_c.set(@sections.section_proof(@list.List(["r1", "r2"]), @term_syntax.parse_term("subrel((r1 : (_, _) -> Bool), relU(r1, (r2 : (_, _) -> Bool)))"), t539))
}

///|
let subrelul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("subrelUl")

///|
/// `Ssrbool.subrelUl`
pub fn subrelul() -> @kernel.Thm {
  subrelul_c.get()
}

///|
/// subrelUr
fn step_135() -> Unit raise {
  let t550 = @ssreflect.thm_tac(fn(x548 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x549 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x546 : @kernel.Thm, x547 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x546, x547))(x548, x549)
    }
  })
  let t544 = @ssreflect.thm_tac(fn(x542 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x543 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x540 : @kernel.Thm, x541 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x540, x541))(x542, x543)
    }
  })
  let t552 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x545 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("relU", @list.List([relu()])), t544, x545), (x551 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("subrel", @list.List([subrel()])), t550, x551)), @ssreflect.simp_tac), @ssreflect.done_tac)])
  subrelur_c.set(@sections.section_proof(@list.List(["r1", "r2"]), @term_syntax.parse_term("subrel((r2 : (_, _) -> Bool), relU((r1 : (_, _) -> Bool), r2))"), t552))
}

///|
let subrelur_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("subrelUr")

///|
/// `Ssrbool.subrelUr`
pub fn subrelur() -> @kernel.Thm {
  subrelur_c.get()
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
  step_19()
  step_20()
  step_21()
  step_22()
  step_23()
  step_24()
  step_25()
  step_26()
  step_27()
  step_28()
  step_29()
  step_30()
  step_31()
  step_32()
  step_33()
  step_34()
  step_35()
  step_36()
  step_37()
  step_38()
  step_39()
  step_40()
  step_41()
  step_42()
  step_43()
  step_44()
  step_45()
  step_46()
  step_47()
  step_48()
  step_49()
  step_50()
  step_51()
  step_52()
  step_53()
  step_54()
  step_55()
  step_56()
  step_57()
  step_58()
  step_59()
  step_60()
  step_61()
  step_62()
  step_63()
  step_64()
  step_65()
  step_66()
  step_67()
  step_68()
  step_69()
  step_70()
  step_71()
  step_72()
  step_73()
  step_74()
  step_75()
  step_76()
  step_77()
  step_78()
  step_79()
  step_80()
  step_81()
  step_82()
  step_83()
  step_84()
  step_85()
  step_86()
  step_87()
  step_88()
  step_89()
  step_90()
  step_91()
  step_92()
  step_93()
  step_94()
  step_95()
  step_96()
  step_97()
  step_98()
  step_99()
  step_100()
  step_101()
  step_102()
  step_103()
  step_104()
  step_105()
  step_106()
  step_107()
  step_108()
  step_109()
  step_110()
  step_111()
  step_112()
  step_113()
  step_114()
  step_115()
  step_116()
  step_117()
  step_118()
  step_119()
  step_120()
  step_121()
  step_122()
  step_123()
  step_124()
  step_125()
  step_126()
  step_127()
  step_128()
  step_129()
  step_130()
  step_131()
  step_132()
  step_133()
  step_134()
  step_135()
}
