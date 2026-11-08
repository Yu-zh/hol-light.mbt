// Translated from upstream Formal_ineqs/lib/ssrfun.hl; edit this file directly.

///|
/// oapp
fn step_1() -> Unit raise {
  oapp_c.set(@define.define_(@term_syntax.parse_term("∀ f : (_) -> _, ∀ x : _, ∀ y : _, (oapp : ((_) -> _, _, Option[_]) -> _)(f, x, SOME(y)) == f(y) && oapp(f, x, NONE) == x")))
}

///|
let oapp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("oapp")

///|
/// `Ssrfun.oapp`
pub fn oapp() -> @kernel.Thm {
  oapp_c.get()
}

///|
/// odflt
fn step_2() -> Unit raise {
  odflt_c.set(@pair.new_definition(@term_syntax.parse_term("(odflt : (_, Option[_]) -> _) == oapp(I)")))
}

///|
let odflt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("odflt")

///|
/// `Ssrfun.odflt`
pub fn odflt() -> @kernel.Thm {
  odflt_c.get()
}

///|
/// obind
fn step_3() -> Unit raise {
  obind_c.set(@pair.new_definition(@term_syntax.parse_term("(obind : ((_) -> Option[_], Option[_]) -> Option[_])((f : (_) -> Option[_])) == oapp(f, NONE)")))
}

///|
let obind_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("obind")

///|
/// `Ssrfun.obind`
pub fn obind() -> @kernel.Thm {
  obind_c.get()
}

///|
/// omap
fn step_4() -> Unit raise {
  omap_c.set(@pair.new_definition(@term_syntax.parse_term("(omap : ((_) -> _, Option[_]) -> Option[_])((f : (_) -> _)) == obind((x : _) => SOME(f(x)))")))
}

///|
let omap_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("omap")

///|
/// `Ssrfun.omap`
pub fn omap() -> @kernel.Thm {
  omap_c.get()
}

///|
/// pcomp
fn step_5() -> Unit raise {
  pcomp_c.set(@pair.new_definition(@term_syntax.parse_term("(pcomp : ((_) -> Option[_], (_) -> Option[_], _) -> Option[_])((f : (_) -> Option[_]), (g : (_) -> Option[_]), (x : _)) == obind(f, g(x))")))
}

///|
let pcomp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pcomp")

///|
/// `Ssrfun.pcomp`
pub fn pcomp() -> @kernel.Thm {
  pcomp_c.get()
}

///|
/// odflt_alt
fn step_6() -> Unit raise {
  let t18 = @ssreflect.thm_tac(fn(x16 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x17 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x14 : @kernel.Thm, x15 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x14, x15))(x16, x17)
    }
  })
  let t11 = @ssreflect.thm_tac(fn(x9 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x10 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x7 : @kernel.Thm, x8 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x7, x8))(x9, x10)
    }
  })
  let t13 = @ssreflect.repeat_tactic(1L, 9L, (x12 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("oapp", @list.List([oapp()])), t11, x12))
  let t5 = @ssreflect.thm_tac(fn(x3 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x4 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x1 : @kernel.Thm, x2 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x1, x2))(x3, x4)
    }
  })
  let t20 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x6 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("odflt", @list.List([odflt()])), t5, x6), t13), (x19 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("I_THM", @list.List([@trivia.i_thm()])), t18, x19)), @ssreflect.done_tac)])
  odflt_alt_c.set(@sections.section_proof(@list.List(["x"]), @term_syntax.parse_term("(∀ y : _, odflt((x : _), SOME(y)) == y) && odflt(x, NONE) == x"), t20))
}

///|
let odflt_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("odflt_alt")

///|
/// `Ssrfun.odflt_alt`
pub fn odflt_alt() -> @kernel.Thm {
  odflt_alt_c.get()
}

///|
/// obind_alt
fn step_7() -> Unit raise {
  let t31 = @ssreflect.thm_tac(fn(x29 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x30 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x27 : @kernel.Thm, x28 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x27, x28))(x29, x30)
    }
  })
  let t33 = @ssreflect.repeat_tactic(1L, 9L, (x32 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("oapp", @list.List([oapp()])), t31, x32))
  let t25 = @ssreflect.thm_tac(fn(x23 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x24 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x21 : @kernel.Thm, x22 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x21, x22))(x23, x24)
    }
  })
  let t34 = @list.List([@tactics.then_tac(@tactics.then_tac((x26 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("obind", @list.List([obind()])), t25, x26), t33), @ssreflect.done_tac)])
  obind_alt_c.set(@sections.section_proof(@list.List(["f"]), @term_syntax.parse_term("obind((f : (_) -> Option[_]), NONE) == NONE && (∀ x : _, obind(f, SOME(x)) == f(x))"), t34))
}

///|
let obind_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("obind_alt")

///|
/// `Ssrfun.obind_alt`
pub fn obind_alt() -> @kernel.Thm {
  obind_alt_c.get()
}

///|
/// omap_alt
fn step_8() -> Unit raise {
  let t51 = @ssreflect.thm_tac(fn(x49 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x50 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x47 : @kernel.Thm, x48 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x47, x48))(x49, x50)
    }
  })
  let t53 = @ssreflect.repeat_tactic(1L, 9L, (x52 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("oapp", @list.List([oapp()])), t51, x52))
  let t45 = @ssreflect.thm_tac(fn(x43 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x44 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x41 : @kernel.Thm, x42 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x41, x42))(x43, x44)
    }
  })
  let t39 = @ssreflect.thm_tac(fn(x37 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x38 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x35 : @kernel.Thm, x36 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x35, x36))(x37, x38)
    }
  })
  let t54 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x40 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("omap", @list.List([omap()])), t39, x40), (x46 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("obind", @list.List([obind()])), t45, x46)), t53), @ssreflect.done_tac)])
  omap_alt_c.set(@sections.section_proof(@list.List(["f"]), @term_syntax.parse_term("omap((f : (_) -> _), NONE) == NONE && (∀ x : _, omap(f, SOME(x)) == SOME(f(x)))"), t54))
}

///|
let omap_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("omap_alt")

///|
/// `Ssrfun.omap_alt`
pub fn omap_alt() -> @kernel.Thm {
  omap_alt_c.get()
}

///|
/// eq_sym
fn step_9() -> Unit raise {
  let t62 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.beta_tac, @ssreflect.conv_thm_tac(fn(x55 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s56 = @tactics.disch_then(x55)
    fn(x57 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s56(x57)
    }
  }, @ssreflect.thm_tac(fn(x60 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x61 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x58 : @kernel.Thm, x59 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x58, x59))(x60, x61)
    }
  }))), @ssreflect.done_tac)])
  eq_sym_c.set(@sections.section_proof(@list.List(["x", "y"]), @term_syntax.parse_term("(x : _) == (y : _) → y == x"), t62))
}

///|
let eq_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("eq_sym")

///|
/// `Ssrfun.eq_sym`
pub fn eq_sym() -> @kernel.Thm {
  eq_sym_c.get()
}

///|
/// eq_trans
fn step_10() -> Unit raise {
  let t77 = @ssreflect.conv_thm_tac(fn(x70 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s71 = @tactics.disch_then(x70)
    fn(x72 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s71(x72)
    }
  }, @ssreflect.thm_tac(fn(x75 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x76 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x73 : @kernel.Thm, x74 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x73, x74))(x75, x76)
    }
  }))
  let t78 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.beta_tac, @ssreflect.conv_thm_tac(fn(x63 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s64 = @tactics.disch_then(x63)
    fn(x65 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s64(x65)
    }
  }, @ssreflect.thm_tac(fn(x68 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x69 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x66 : @kernel.Thm, x67 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x66, x67))(x68, x69)
    }
  }))), t77), @ssreflect.done_tac)])
  eq_trans_c.set(@sections.section_proof(@list.List(["x", "y", "z"]), @term_syntax.parse_term("(x : _) == (y : _) → y == (z : _) → x == z"), t78))
}

///|
let eq_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("eq_trans")

///|
/// `Ssrfun.eq_trans`
pub fn eq_trans() -> @kernel.Thm {
  eq_trans_c.get()
}

///|
/// f_equal
fn step_11() -> Unit raise {
  let t86 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.beta_tac, @ssreflect.conv_thm_tac(fn(x79 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s80 = @tactics.disch_then(x79)
    fn(x81 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s80(x81)
    }
  }, @ssreflect.thm_tac(fn(x84 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x85 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x82 : @kernel.Thm, x83 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x82, x83))(x84, x85)
    }
  }))), @ssreflect.done_tac)])
  f_equal_c.set(@sections.section_proof(@list.List(["f", "x", "y"]), @term_syntax.parse_term("(x : _) == (y : _) → (f : (_) -> _)(x) == f(y)"), t86))
}

///|
let f_equal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("f_equal")

///|
/// `Ssrfun.f_equal`
pub fn f_equal() -> @kernel.Thm {
  f_equal_c.get()
}

///|
/// f_equal2
fn step_12() -> Unit raise {
  let t101 = @ssreflect.conv_thm_tac(fn(x94 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s95 = @tactics.disch_then(x94)
    fn(x96 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s95(x96)
    }
  }, @ssreflect.thm_tac(fn(x99 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x100 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x97 : @kernel.Thm, x98 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x97, x98))(x99, x100)
    }
  }))
  let t102 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.beta_tac, @ssreflect.conv_thm_tac(fn(x87 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s88 = @tactics.disch_then(x87)
    fn(x89 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s88(x89)
    }
  }, @ssreflect.thm_tac(fn(x92 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x93 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x90 : @kernel.Thm, x91 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x90, x91))(x92, x93)
    }
  }))), t101), @ssreflect.done_tac)])
  f_equal2_c.set(@sections.section_proof(@list.List(["f", "x1", "y1", "x2", "y2"]), @term_syntax.parse_term("(x1 : _) == (y1 : _) → (x2 : _) == (y2 : _) → (f : (_, _) -> _)(x1, x2) == f(y1, y2)"), t102))
}

///|
let f_equal2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("f_equal2")

///|
/// `Ssrfun.f_equal2`
pub fn f_equal2() -> @kernel.Thm {
  f_equal2_c.get()
}

///|
/// erefl
fn step_13() -> Unit raise {
  erefl_c.set(eq_sym())
}

///|
let erefl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("erefl")

///|
/// `Ssrfun.erefl`
pub fn erefl() -> @kernel.Thm {
  erefl_c.get()
}

///|
/// esym
fn step_14() -> Unit raise {
  esym_c.set(eq_sym())
}

///|
let esym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("esym")

///|
/// `Ssrfun.esym`
pub fn esym() -> @kernel.Thm {
  esym_c.get()
}

///|
/// etrans
fn step_15() -> Unit raise {
  etrans_c.set(eq_trans())
}

///|
let etrans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("etrans")

///|
/// `Ssrfun.etrans`
pub fn etrans() -> @kernel.Thm {
  etrans_c.get()
}

///|
/// congr1
fn step_16() -> Unit raise {
  congr1_c.set(f_equal())
}

///|
let congr1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("congr1")

///|
/// `Ssrfun.congr1`
pub fn congr1() -> @kernel.Thm {
  congr1_c.get()
}

///|
/// congr2
fn step_17() -> Unit raise {
  congr2_c.set(f_equal2())
}

///|
let congr2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("congr2")

///|
/// `Ssrfun.congr2`
pub fn congr2() -> @kernel.Thm {
  congr2_c.get()
}

///|
/// eq_ext
fn step_18() -> Unit raise {
  let t118 = @ssreflect.conv_thm_tac(fn(x111 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s112 = @tactics.disch_then(x111)
    fn(x113 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s112(x113)
    }
  }, @ssreflect.thm_tac(fn(x116 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x117 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x114 : @kernel.Thm, x115 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x114, x115))(x116, x117)
    }
  }))
  let t119 = @list.List([@tactics.then_tac(@tactics.thenl(@ssreflect.split_tac, @list.List([@tactics.disch_then(fn(x103 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let snd_th = x103
    let t109 = @ssreflect.thm_tac((x108 : @kernel.Thm) => @ssreflect.match_mp_then_v1(snd_th, fn(x105 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s106 = @tactics.mp_tac(x105)
      fn(x107 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s106(x107)
      }
    }, x108))
    (x110 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("EQ_EXT", @list.List([@class.eq_ext()])), t109, x110)
  }), t118])), @ssreflect.done_tac)])
  eq_ext_c.set(@sections.section_proof(@list.List(["f", "g"]), @term_syntax.parse_term("(∀ x : _, (f : (_) -> _)(x) == (g : (_) -> _)(x)) == (f == g)"), t119))
}

///|
let eq_ext_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("eq_ext")

///|
/// `Ssrfun.eq_ext`
pub fn eq_ext() -> @kernel.Thm {
  eq_ext_c.get()
}

///|
/// Formal_ineqs/lib/ssrfun.hl:77
fn step_19() -> Unit raise {
  @sections.begin_section("Injections")
}

///|
/// Formal_ineqs/lib/ssrfun.hl:78
fn step_20() -> Unit raise {
  @sections.add_section_var(@kernel.mk_var("f", @term_syntax.parse_type("(A) -> R")))
}

///|
/// injective
fn step_21() -> Unit raise {
  injective_c.set(@pair.new_definition(@term_syntax.parse_term("(injective : ((_) -> _) -> Bool)((f : (_) -> _)) == (∀ x1 : _, ∀ x2 : _, f(x1) == f(x2) → x1 == x2)")))
}

///|
let injective_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("injective")

///|
/// `Ssrfun.injective`
pub fn injective() -> @kernel.Thm {
  injective_c.get()
}

///|
/// cancel
fn step_22() -> Unit raise {
  cancel_c.set(@pair.new_definition(@term_syntax.parse_term("(cancel : ((_) -> _, (_) -> _) -> Bool)((f : (_) -> _), (g : (_) -> _)) == (∀ x : _, g(f(x)) == x)")))
}

///|
let cancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cancel")

///|
/// `Ssrfun.cancel`
pub fn cancel() -> @kernel.Thm {
  cancel_c.get()
}

///|
/// pcancel
fn step_23() -> Unit raise {
  pcancel_c.set(@pair.new_definition(@term_syntax.parse_term("(pcancel : ((_) -> _, (_) -> Option[_]) -> Bool)((f : (_) -> _), (g : (_) -> Option[_])) == (∀ x : _, g(f(x)) == SOME(x))")))
}

///|
let pcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pcancel")

///|
/// `Ssrfun.pcancel`
pub fn pcancel() -> @kernel.Thm {
  pcancel_c.get()
}

///|
/// ocancel
fn step_24() -> Unit raise {
  ocancel_c.set(@pair.new_definition(@term_syntax.parse_term("(ocancel : ((_) -> Option[_], (_) -> _) -> Bool)((g : (_) -> Option[_]), (h : (_) -> _)) == (∀ x : _, oapp(h, x, g(x)) == x)")))
}

///|
let ocancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ocancel")

///|
/// `Ssrfun.ocancel`
pub fn ocancel() -> @kernel.Thm {
  ocancel_c.get()
}

///|
/// can_pcan
fn step_25() -> Unit raise {
  let t130 = @ssreflect.thm_tac(fn(x128 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x129 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x126 : @kernel.Thm, x127 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x126, x127))(x128, x129)
    }
  })
  let t124 = @ssreflect.thm_tac(fn(x122 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x123 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x120 : @kernel.Thm, x121 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x120, x121))(x122, x123)
    }
  })
  let t132 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x125 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("cancel", @list.List([cancel()])), t124, x125), (x131 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("pcancel", @list.List([pcancel()])), t130, x131)), @ssreflect.simp_tac), @ssreflect.done_tac)])
  can_pcan_c.set(@sections.section_proof(@list.List(["g"]), @term_syntax.parse_term("cancel((f : (_) -> _), (g : (_) -> _)) → pcancel(f, (y : _) => SOME(g(y)))"), t132))
}

///|
let can_pcan_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("can_pcan")

///|
/// `Ssrfun.can_pcan`
pub fn can_pcan() -> @kernel.Thm {
  can_pcan_c.get()
}

///|
/// pcan_inj
fn step_26() -> Unit raise {
  let t191 = (fn(x185 : (@ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let arg_tac_2 = x185
    arg_tac_2(@ssreflect.ArgType::Arg_theorem(@ind_types.injectivity("option")))
  })(@ssreflect.thm_tac(fn(x189 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x190 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x187 : @kernel.Thm, x188 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x187, x188))(x189, x190)
    }
  }))
  let t183 = @ssreflect.conv_thm_tac(fn(x176 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s177 = @tactics.disch_then(x176)
    fn(x178 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s177(x178)
    }
  }, @ssreflect.thm_tac(fn(x181 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x182 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x179 : @kernel.Thm, x180 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x179, x180))(x181, x182)
    }
  }))
  let t174 = @ssreflect.thm_tac(fn(x172 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x173 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x170 : @kernel.Thm, x171 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x170, x171))(x172, x173)
    }
  })
  let t184 = @tactics.then_tac((x175 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("f_eq", @list.List([])), t174, x175), t183)
  let t169 = (fn(x159 : (@ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let arg_tac_1 = x159
    (x167 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("can", @list.List([])), fn(x161 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let fst_arg_1 = x161
      (x166 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("x1", @list.List([])), fn(x163 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let snd_arg_1 = x163
        (x165 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.combine_args_then(arg_tac_1, fst_arg_1, snd_arg_1, x165)
      }, x166)
    }, x167)
  })((x168 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x168))
  let t192 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((fn(x149 : (@ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let arg_tac = x149
    (x157 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("can", @list.List([])), fn(x151 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let fst_arg = x151
      (x156 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("x2", @list.List([])), fn(x153 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let snd_arg = x153
        (x155 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.combine_args_then(arg_tac, fst_arg, snd_arg, x155)
      }, x156)
    }, x157)
  })((x158 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x158)), t169), @tactics.beta_tac), t184), t191), @ssreflect.done_tac)
  let t148 = @ssreflect.move_(@list.List(["f_eq"]))
  let t147 = @ssreflect.move_(@list.List(["x2"]))
  let t146 = @ssreflect.move_(@list.List(["x1"]))
  let t145 = @ssreflect.move_(@list.List(["can"]))
  let t143 = @ssreflect.thm_tac(fn(x141 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x142 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x139 : @kernel.Thm, x140 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x139, x140))(x141, x142)
    }
  })
  let t137 = @ssreflect.thm_tac(fn(x135 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x136 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x133 : @kernel.Thm, x134 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x133, x134))(x135, x136)
    }
  })
  let t193 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x138 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("pcancel", @list.List([pcancel()])), t137, x138), (x144 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("injective", @list.List([injective()])), t143, x144)), t145), t146), t147), t148), t192])
  pcan_inj_c.set(@sections.section_proof(@list.List(["g"]), @term_syntax.parse_term("pcancel((f : (_) -> _), (g : (_) -> Option[_])) → injective(f)"), t193))
}

///|
let pcan_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pcan_inj")

///|
/// `Ssrfun.pcan_inj`
pub fn pcan_inj() -> @kernel.Thm {
  pcan_inj_c.get()
}

///|
/// can_inj
fn step_27() -> Unit raise {
  let t245 = @ssreflect.thm_tac(fn(x243 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x244 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x241 : @kernel.Thm, x242 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x241, x242))(x243, x244)
    }
  })
  let t238 = @ssreflect.thm_tac(fn(x236 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x237 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x234 : @kernel.Thm, x235 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x234, x235))(x236, x237)
    }
  })
  let t240 = (fn(x225 : (@ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let arg_tac_1 = x225
    (x233 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("can", @list.List([])), fn(x227 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let fst_arg_1 = x227
      (x232 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("x2", @list.List([])), fn(x229 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let snd_arg_1 = x229
        (x231 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.combine_args_then(arg_tac_1, fst_arg_1, snd_arg_1, x231)
      }, x232)
    }, x233)
  })((x239 : @ssreflect.ArgType) => @ssreflect.gsym_then_v1(t238, x239))
  let t223 = @ssreflect.thm_tac(fn(x221 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x222 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x219 : @kernel.Thm, x220 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x219, x220))(x221, x222)
    }
  })
  let t247 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((fn(x210 : (@ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let arg_tac = x210
    (x218 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("can", @list.List([])), fn(x212 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let fst_arg = x212
      (x217 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("x1", @list.List([])), fn(x214 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let snd_arg = x214
        (x216 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.combine_args_then(arg_tac, fst_arg, snd_arg, x216)
      }, x217)
    }, x218)
  })((x224 : @ssreflect.ArgType) => @ssreflect.gsym_then_v1(t223, x224)), t240), (x246 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("f_eq", @list.List([])), t245, x246)), @ssreflect.done_tac)
  let t209 = @ssreflect.move_(@list.List(["f_eq"]))
  let t208 = @ssreflect.move_(@list.List(["x2"]))
  let t207 = @ssreflect.move_(@list.List(["x1"]))
  let t206 = @ssreflect.move_(@list.List(["can"]))
  let t204 = @ssreflect.thm_tac(fn(x202 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x203 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x200 : @kernel.Thm, x201 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x200, x201))(x202, x203)
    }
  })
  let t198 = @ssreflect.thm_tac(fn(x196 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x197 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x194 : @kernel.Thm, x195 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x194, x195))(x196, x197)
    }
  })
  let t248 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x199 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("cancel", @list.List([cancel()])), t198, x199), (x205 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("injective", @list.List([injective()])), t204, x205)), t206), t207), t208), t209), t247])
  can_inj_c.set(@sections.section_proof(@list.List(["g"]), @term_syntax.parse_term("cancel((f : (_) -> _), (g : (_) -> _)) → injective(f)"), t248))
}

///|
let can_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("can_inj")

///|
/// `Ssrfun.can_inj`
pub fn can_inj() -> @kernel.Thm {
  can_inj_c.get()
}

///|
/// canLR
fn step_28() -> Unit raise {
  let t263 = @ssreflect.conv_thm_tac(fn(x256 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s257 = @tactics.disch_then(x256)
    fn(x258 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s257(x258)
    }
  }, @ssreflect.thm_tac(fn(x261 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x262 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x259 : @kernel.Thm, x260 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x259, x260))(x261, x262)
    }
  }))
  let t255 = @ssreflect.move_(@list.List(["can"]))
  let t253 = @ssreflect.thm_tac(fn(x251 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x252 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x249 : @kernel.Thm, x250 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x249, x250))(x251, x252)
    }
  })
  let t264 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x254 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("cancel", @list.List([cancel()])), t253, x254), t255), t263), @ssreflect.done_tac)])
  canlr_c.set(@sections.section_proof(@list.List(["g", "x", "y"]), @term_syntax.parse_term("cancel((f : (_) -> _), (g : (_) -> _)) → (x : _) == f((y : _)) → g(x) == y"), t264))
}

///|
let canlr_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("canLR")

///|
/// `Ssrfun.canLR`
pub fn canlr() -> @kernel.Thm {
  canlr_c.get()
}

///|
/// canRL
fn step_29() -> Unit raise {
  let t279 = @ssreflect.thm_tac(fn(x277 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x278 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x275 : @kernel.Thm, x276 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x275, x276))(x277, x278)
    }
  })
  let t281 = @ssreflect.conv_thm_tac(fn(x272 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s273 = @tactics.disch_then(x272)
    fn(x274 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s273(x274)
    }
  }, (x280 : @ssreflect.ArgType) => @ssreflect.gsym_then_v1(t279, x280))
  let t271 = @ssreflect.move_(@list.List(["can"]))
  let t269 = @ssreflect.thm_tac(fn(x267 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x268 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x265 : @kernel.Thm, x266 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x265, x266))(x267, x268)
    }
  })
  let t282 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x270 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("cancel", @list.List([cancel()])), t269, x270), t271), t281), @ssreflect.done_tac)])
  canrl_c.set(@sections.section_proof(@list.List(["g", "x", "y"]), @term_syntax.parse_term("cancel((f : (_) -> _), (g : (_) -> _)) → f((x : _)) == (y : _) → x == g(y)"), t282))
}

///|
let canrl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("canRL")

///|
/// `Ssrfun.canRL`
pub fn canrl() -> @kernel.Thm {
  canrl_c.get()
}

///|
/// can_pcan
fn step_30() -> Unit raise {
  can_pcan_v1_c.set(@sections.finalize_theorem(can_pcan()))
}

///|
let can_pcan_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("can_pcan")

///|
/// `Ssrfun.can_pcan`
pub fn can_pcan_v1() -> @kernel.Thm {
  can_pcan_v1_c.get()
}

///|
/// pcan_inj
fn step_31() -> Unit raise {
  pcan_inj_v1_c.set(@sections.finalize_theorem(pcan_inj()))
}

///|
let pcan_inj_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pcan_inj")

///|
/// `Ssrfun.pcan_inj`
pub fn pcan_inj_v1() -> @kernel.Thm {
  pcan_inj_v1_c.get()
}

///|
/// can_inj
fn step_32() -> Unit raise {
  can_inj_v1_c.set(@sections.finalize_theorem(can_inj()))
}

///|
let can_inj_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("can_inj")

///|
/// `Ssrfun.can_inj`
pub fn can_inj_v1() -> @kernel.Thm {
  can_inj_v1_c.get()
}

///|
/// canLR
fn step_33() -> Unit raise {
  canlr_v1_c.set(@sections.finalize_theorem(canlr()))
}

///|
let canlr_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("canLR")

///|
/// `Ssrfun.canLR`
pub fn canlr_v1() -> @kernel.Thm {
  canlr_v1_c.get()
}

///|
/// canRL
fn step_34() -> Unit raise {
  canrl_v1_c.set(@sections.finalize_theorem(canrl()))
}

///|
let canrl_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("canRL")

///|
/// `Ssrfun.canRL`
pub fn canrl_v1() -> @kernel.Thm {
  canrl_v1_c.get()
}

///|
/// Formal_ineqs/lib/ssrfun.hl:127
fn step_35() -> Unit raise {
  @sections.end_section("Injections")
}

///|
/// some_inj
fn step_36() -> Unit raise {
  let t295 = (fn(x289 : (@ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let arg_tac = x289
    arg_tac(@ssreflect.ArgType::Arg_theorem(@ind_types.injectivity("option")))
  })(@ssreflect.thm_tac(fn(x293 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x294 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x291 : @kernel.Thm, x292 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x291, x292))(x293, x294)
    }
  }))
  let t287 = @ssreflect.thm_tac(fn(x285 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x286 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x283 : @kernel.Thm, x284 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x283, x284))(x285, x286)
    }
  })
  let t296 = @list.List([@tactics.then_tac(@tactics.then_tac((x288 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("injective", @list.List([injective()])), t287, x288), t295), @ssreflect.done_tac)])
  some_inj_c.set(@sections.section_proof(@list.List([]), @term_syntax.parse_term("(injective : ((_) -> Option[_]) -> Bool)((SOME : (_) -> Option[_]))"), t296))
}

///|
let some_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("some_inj")

///|
/// `Ssrfun.some_inj`
pub fn some_inj() -> @kernel.Thm {
  some_inj_c.get()
}

///|
/// Formal_ineqs/lib/ssrfun.hl:137
fn step_37() -> Unit raise {
  @sections.begin_section("InjectionsTheory")
}

///|
/// Formal_ineqs/lib/ssrfun.hl:138
fn step_38() -> Unit raise {
  @sections.add_section_var(@kernel.mk_var("f", @term_syntax.parse_type("(B) -> A")))
  @sections.add_section_var(@kernel.mk_var("g", @term_syntax.parse_type("(B) -> A")))
}

///|
/// Formal_ineqs/lib/ssrfun.hl:139
fn step_39() -> Unit raise {
  @sections.add_section_var(@kernel.mk_var("h", @term_syntax.parse_type("(C) -> B")))
}

///|
/// inj_id
fn step_40() -> Unit raise {
  let t307 = @ssreflect.thm_tac(fn(x305 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x306 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x303 : @kernel.Thm, x304 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x303, x304))(x305, x306)
    }
  })
  let t309 = @ssreflect.repeat_tactic(1L, 9L, (x308 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("I_THM", @list.List([@trivia.i_thm()])), t307, x308))
  let t301 = @ssreflect.thm_tac(fn(x299 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x300 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x297 : @kernel.Thm, x298 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x297, x298))(x299, x300)
    }
  })
  let t310 = @list.List([@tactics.then_tac(@tactics.then_tac((x302 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("injective", @list.List([injective()])), t301, x302), t309), @ssreflect.done_tac)])
  inj_id_c.set(@sections.section_proof(@list.List([]), @term_syntax.parse_term("(injective : ((_) -> _) -> Bool)((I : (_) -> _))"), t310))
}

///|
let inj_id_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("inj_id")

///|
/// `Ssrfun.inj_id`
pub fn inj_id() -> @kernel.Thm {
  inj_id_c.get()
}

///|
/// inj_can_sym
fn step_41() -> Unit raise {
  let t335 = @ssreflect.thm_tac(fn(x333 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x334 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x331 : @kernel.Thm, x332 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x331, x332))(x333, x334)
    }
  })
  let t330 = @tactics.disch_then(fn(x328 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x329 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      @ssreflect.apply_tac(x328, x329)
    }
  })
  let t337 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x327 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("inj", @list.List([])), (x326 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x326), x327), @ssreflect.clear_assumption("inj")), t330), (x336 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("can1", @list.List([])), t335, x336)), @ssreflect.done_tac)
  let t325 = @ssreflect.move_(@list.List(["x"]))
  let t324 = @ssreflect.move_(@list.List(["inj"]))
  let t323 = @ssreflect.move_(@list.List(["can1"]))
  let t321 = @ssreflect.thm_tac(fn(x319 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x320 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x317 : @kernel.Thm, x318 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x317, x318))(x319, x320)
    }
  })
  let t315 = @ssreflect.thm_tac(fn(x313 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x314 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x311 : @kernel.Thm, x312 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x311, x312))(x313, x314)
    }
  })
  let t338 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@ssreflect.repeat_tactic(2L, 0L, (x316 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("cancel", @list.List([cancel()])), t315, x316)), (x322 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("injective", @list.List([injective()])), t321, x322)), t323), t324), t325), t337])
  inj_can_sym_c.set(@sections.section_proof(@list.List(["f'"]), @term_syntax.parse_term("cancel((f : (_) -> _), (f' : (_) -> _)) → injective(f') → cancel(f', f)"), t338))
}

///|
let inj_can_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("inj_can_sym")

///|
/// `Ssrfun.inj_can_sym`
pub fn inj_can_sym() -> @kernel.Thm {
  inj_can_sym_c.get()
}

///|
/// inj_comp
fn step_42() -> Unit raise {
  let t372 = @tactics.disch_then(fn(x364 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let snd_th_1 = x364
    let t370 = @ssreflect.thm_tac((x369 : @kernel.Thm) => @ssreflect.match_mp_then_v1(snd_th_1, fn(x366 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s367 = @tactics.mp_tac(x366)
      fn(x368 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s367(x368)
      }
    }, x369))
    (x371 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("inj_h", @list.List([])), t370, x371)
  })
  let t373 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.beta_tac, @tactics.disch_then(fn(x356 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let snd_th = x356
    let t362 = @ssreflect.thm_tac((x361 : @kernel.Thm) => @ssreflect.match_mp_then_v1(snd_th, fn(x358 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s359 = @tactics.mp_tac(x358)
      fn(x360 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s359(x360)
      }
    }, x361))
    (x363 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("inj_f", @list.List([])), t362, x363)
  })), t372), @ssreflect.done_tac)
  let t355 = @ssreflect.move_(@list.List(["x2"]))
  let t354 = @ssreflect.move_(@list.List(["x1"]))
  let t353 = @ssreflect.move_(@list.List(["inj_h"]))
  let t352 = @ssreflect.move_(@list.List(["inj_f"]))
  let t349 = @ssreflect.thm_tac(fn(x347 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x348 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x345 : @kernel.Thm, x346 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x345, x346))(x347, x348)
    }
  })
  let t351 = @ssreflect.repeat_tactic(2L, 0L, (x350 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("o_THM", @list.List([@trivia.o_thm()])), t349, x350))
  let t343 = @ssreflect.thm_tac(fn(x341 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x342 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x339 : @kernel.Thm, x340 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x339, x340))(x341, x342)
    }
  })
  let t374 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@ssreflect.repeat_tactic(3L, 0L, (x344 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("injective", @list.List([injective()])), t343, x344)), t351), t352), t353), t354), t355), t373])
  inj_comp_c.set(@sections.section_proof(@list.List([]), @term_syntax.parse_term("injective((f : (_) -> _)) → injective((h : (_) -> _)) → injective(o(f, h))"), t374))
}

///|
let inj_comp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("inj_comp")

///|
/// `Ssrfun.inj_comp`
pub fn inj_comp() -> @kernel.Thm {
  inj_comp_c.get()
}

///|
/// can_comp
fn step_43() -> Unit raise {
  let t390 = @ssreflect.move_(@list.List(["x"]))
  let t389 = @ssreflect.move_(@list.List(["h_can"]))
  let t388 = @ssreflect.move_(@list.List(["f_can"]))
  let t385 = @ssreflect.thm_tac(fn(x383 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x384 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x381 : @kernel.Thm, x382 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x381, x382))(x383, x384)
    }
  })
  let t387 = @ssreflect.repeat_tactic(2L, 0L, (x386 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("o_THM", @list.List([@trivia.o_thm()])), t385, x386))
  let t379 = @ssreflect.thm_tac(fn(x377 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x378 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x375 : @kernel.Thm, x376 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x375, x376))(x377, x378)
    }
  })
  let t391 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@ssreflect.repeat_tactic(3L, 0L, (x380 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("cancel", @list.List([cancel()])), t379, x380)), t387), t388), t389), t390), @ssreflect.done_tac)])
  can_comp_c.set(@sections.section_proof(@list.List(["f'", "h'"]), @term_syntax.parse_term("cancel((f : (_) -> _), (f' : (_) -> _)) → cancel((h : (_) -> _), (h' : (_) -> _)) → cancel(o(f, h), o(h', f'))"), t391))
}

///|
let can_comp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("can_comp")

///|
/// `Ssrfun.can_comp`
pub fn can_comp() -> @kernel.Thm {
  can_comp_c.get()
}

///|
/// pcan_pcomp
fn step_44() -> Unit raise {
  let t428 = @ssreflect.thm_tac(fn(x426 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x427 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x424 : @kernel.Thm, x425 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x424, x425))(x426, x427)
    }
  })
  let t422 = @ssreflect.thm_tac(fn(x420 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x421 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x418 : @kernel.Thm, x419 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x418, x419))(x420, x421)
    }
  })
  let t430 = @tactics.then_tac((x423 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("obind", @list.List([obind()])), t422, x423), (x429 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("oapp", @list.List([oapp()])), t428, x429))
  let t417 = @ssreflect.conv_thm_tac(fn(x410 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s411 = @tactics.disch_then(x410)
    fn(x412 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s411(x412)
    }
  }, @ssreflect.thm_tac(fn(x415 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x416 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x413 : @kernel.Thm, x414 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x413, x414))(x415, x416)
    }
  }))
  let t408 = @ssreflect.thm_tac(fn(x406 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x407 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x404 : @kernel.Thm, x405 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x404, x405))(x406, x407)
    }
  })
  let t402 = @ssreflect.thm_tac(fn(x400 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x401 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x398 : @kernel.Thm, x399 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x398, x399))(x400, x401)
    }
  })
  let t396 = @ssreflect.thm_tac(fn(x394 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x395 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x392 : @kernel.Thm, x393 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x392, x393))(x394, x395)
    }
  })
  let t431 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@ssreflect.repeat_tactic(3L, 0L, (x397 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("pcancel", @list.List([pcancel()])), t396, x397)), (x403 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("pcomp", @list.List([pcomp()])), t402, x403)), (x409 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("o_THM", @list.List([@trivia.o_thm()])), t408, x409)), t417), t430), @ssreflect.done_tac)])
  pcan_pcomp_c.set(@sections.section_proof(@list.List(["f'", "h'"]), @term_syntax.parse_term("pcancel((f : (_) -> _), (f' : (_) -> Option[_])) → pcancel((h : (_) -> _), (h' : (_) -> Option[_])) → pcancel(o(f, h), pcomp(h', f'))"), t431))
}

///|
let pcan_pcomp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pcan_pcomp")

///|
/// `Ssrfun.pcan_pcomp`
pub fn pcan_pcomp() -> @kernel.Thm {
  pcan_pcomp_c.get()
}

///|
/// eq_inj
fn step_45() -> Unit raise {
  let t446 = @ssreflect.thm_tac(fn(x444 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x445 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x442 : @kernel.Thm, x443 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x442, x443))(x444, x445)
    }
  })
  let t448 = @ssreflect.conv_thm_tac(fn(x439 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s440 = @tactics.disch_then(x439)
    fn(x441 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s440(x441)
    }
  }, (x447 : @ssreflect.ArgType) => @ssreflect.gsym_then_v1(t446, x447))
  let t438 = @ssreflect.move_(@list.List(["inj"]))
  let t436 = @ssreflect.thm_tac(fn(x434 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x435 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x432 : @kernel.Thm, x433 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x432, x433))(x434, x435)
    }
  })
  let t449 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x437 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("eq_ext", @list.List([eq_ext()])), t436, x437), t438), t448), @ssreflect.done_tac)])
  eq_inj_c.set(@sections.section_proof(@list.List([]), @term_syntax.parse_term("injective((f : (_) -> _)) → (∀ x : _, f(x) == (g : (_) -> _)(x)) → injective(g)"), t449))
}

///|
let eq_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("eq_inj")

///|
/// `Ssrfun.eq_inj`
pub fn eq_inj() -> @kernel.Thm {
  eq_inj_c.get()
}

///|
/// eq_can
fn step_46() -> Unit raise {
  let t474 = @ssreflect.thm_tac(fn(x472 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x473 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x470 : @kernel.Thm, x471 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x470, x471))(x472, x473)
    }
  })
  let t476 = @ssreflect.conv_thm_tac(fn(x467 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s468 = @tactics.disch_then(x467)
    fn(x469 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s468(x469)
    }
  }, (x475 : @ssreflect.ArgType) => @ssreflect.gsym_then_v1(t474, x475))
  let t464 = @ssreflect.thm_tac(fn(x462 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x463 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x460 : @kernel.Thm, x461 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x460, x461))(x462, x463)
    }
  })
  let t466 = @ssreflect.conv_thm_tac(fn(x457 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s458 = @tactics.disch_then(x457)
    fn(x459 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s458(x459)
    }
  }, (x465 : @ssreflect.ArgType) => @ssreflect.gsym_then_v1(t464, x465))
  let t456 = @ssreflect.move_(@list.List(["can"]))
  let t454 = @ssreflect.thm_tac(fn(x452 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x453 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x450 : @kernel.Thm, x451 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x450, x451))(x452, x453)
    }
  })
  let t477 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@ssreflect.repeat_tactic(1L, 9L, (x455 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("eq_ext", @list.List([eq_ext()])), t454, x455)), t456), t466), t476), @ssreflect.done_tac)])
  eq_can_c.set(@sections.section_proof(@list.List(["f'", "g'"]), @term_syntax.parse_term("cancel((f : (_) -> _), (f' : (_) -> _)) → (∀ x : _, f(x) == (g : (_) -> _)(x)) → (∀ x : _, f'(x) == (g' : (_) -> _)(x)) → cancel(g, g')"), t477))
}

///|
let eq_can_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("eq_can")

///|
/// `Ssrfun.eq_can`
pub fn eq_can() -> @kernel.Thm {
  eq_can_c.get()
}

///|
/// inj_can_eq
fn step_47() -> Unit raise {
  let t506 = @tactics.disch_then(fn(x504 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x505 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      @ssreflect.apply_tac(x504, x505)
    }
  })
  let t507 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x503 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("inj", @list.List([])), (x502 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x502), x503), @ssreflect.clear_assumption("inj")), t506), @ssreflect.done_tac)
  let t500 = @ssreflect.move_(@list.List(["x"]))
  let t497 = @ssreflect.thm_tac(fn(x495 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x496 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x493 : @kernel.Thm, x494 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x493, x494))(x495, x496)
    }
  })
  let t501 = @tactics.then_tac((x499 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("eq_ext", @list.List([eq_ext()])), (x498 : @ssreflect.ArgType) => @ssreflect.gsym_then_v1(t497, x498), x499), t500)
  let t492 = @ssreflect.move_(@list.List(["g_can"]))
  let t491 = @ssreflect.move_(@list.List(["inj"]))
  let t490 = @ssreflect.move_(@list.List(["f_can"]))
  let t488 = @ssreflect.thm_tac(fn(x486 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x487 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x484 : @kernel.Thm, x485 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x484, x485))(x486, x487)
    }
  })
  let t482 = @ssreflect.thm_tac(fn(x480 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x481 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x478 : @kernel.Thm, x479 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x478, x479))(x480, x481)
    }
  })
  let t508 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@ssreflect.repeat_tactic(2L, 0L, (x483 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("cancel", @list.List([cancel()])), t482, x483)), (x489 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("injective", @list.List([injective()])), t488, x489)), t490), t491), t492), t501), t507])
  inj_can_eq_c.set(@sections.section_proof(@list.List(["f'"]), @term_syntax.parse_term("cancel((f : (_) -> _), (f' : (_) -> _)) → injective(f') → cancel((g : (_) -> _), f') → f == g"), t508))
}

///|
let inj_can_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("inj_can_eq")

///|
/// `Ssrfun.inj_can_eq`
pub fn inj_can_eq() -> @kernel.Thm {
  inj_can_eq_c.get()
}

///|
/// inj_id
fn step_48() -> Unit raise {
  inj_id_v1_c.set(@sections.finalize_theorem(inj_id()))
}

///|
let inj_id_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("inj_id")

///|
/// `Ssrfun.inj_id`
pub fn inj_id_v1() -> @kernel.Thm {
  inj_id_v1_c.get()
}

///|
/// inj_can_sym
fn step_49() -> Unit raise {
  inj_can_sym_v1_c.set(@sections.finalize_theorem(inj_can_sym()))
}

///|
let inj_can_sym_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("inj_can_sym")

///|
/// `Ssrfun.inj_can_sym`
pub fn inj_can_sym_v1() -> @kernel.Thm {
  inj_can_sym_v1_c.get()
}

///|
/// inj_comp
fn step_50() -> Unit raise {
  inj_comp_v1_c.set(@sections.finalize_theorem(inj_comp()))
}

///|
let inj_comp_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("inj_comp")

///|
/// `Ssrfun.inj_comp`
pub fn inj_comp_v1() -> @kernel.Thm {
  inj_comp_v1_c.get()
}

///|
/// can_comp
fn step_51() -> Unit raise {
  can_comp_v1_c.set(@sections.finalize_theorem(can_comp()))
}

///|
let can_comp_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("can_comp")

///|
/// `Ssrfun.can_comp`
pub fn can_comp_v1() -> @kernel.Thm {
  can_comp_v1_c.get()
}

///|
/// pcan_pcomp
fn step_52() -> Unit raise {
  pcan_pcomp_v1_c.set(@sections.finalize_theorem(pcan_pcomp()))
}

///|
let pcan_pcomp_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pcan_pcomp")

///|
/// `Ssrfun.pcan_pcomp`
pub fn pcan_pcomp_v1() -> @kernel.Thm {
  pcan_pcomp_v1_c.get()
}

///|
/// eq_inj
fn step_53() -> Unit raise {
  eq_inj_v1_c.set(@sections.finalize_theorem(eq_inj()))
}

///|
let eq_inj_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("eq_inj")

///|
/// `Ssrfun.eq_inj`
pub fn eq_inj_v1() -> @kernel.Thm {
  eq_inj_v1_c.get()
}

///|
/// eq_can
fn step_54() -> Unit raise {
  eq_can_v1_c.set(@sections.finalize_theorem(eq_can()))
}

///|
let eq_can_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("eq_can")

///|
/// `Ssrfun.eq_can`
pub fn eq_can_v1() -> @kernel.Thm {
  eq_can_v1_c.get()
}

///|
/// inj_can_eq
fn step_55() -> Unit raise {
  inj_can_eq_v1_c.set(@sections.finalize_theorem(inj_can_eq()))
}

///|
let inj_can_eq_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("inj_can_eq")

///|
/// `Ssrfun.inj_can_eq`
pub fn inj_can_eq_v1() -> @kernel.Thm {
  inj_can_eq_v1_c.get()
}

///|
/// Formal_ineqs/lib/ssrfun.hl:209
fn step_56() -> Unit raise {
  @sections.end_section("InjectionsTheory")
}

///|
/// Formal_ineqs/lib/ssrfun.hl:212
fn step_57() -> Unit raise {
  @sections.begin_section("Bijections")
}

///|
/// Formal_ineqs/lib/ssrfun.hl:213
fn step_58() -> Unit raise {
  @sections.add_section_var(@kernel.mk_var("f", @term_syntax.parse_type("(B) -> A")))
}

///|
/// bijective
fn step_59() -> Unit raise {
  bijective_c.set(@pair.new_definition(@term_syntax.parse_term("(bijective : ((_) -> _) -> Bool)((f : (_) -> _)) == (∃ g : (_) -> _, cancel(f, g) && cancel(g, f))")))
}

///|
let bijective_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("bijective")

///|
/// `Ssrfun.bijective`
pub fn bijective() -> @kernel.Thm {
  bijective_c.get()
}

///|
/// Formal_ineqs/lib/ssrfun.hl:215
fn step_60() -> Unit raise {
  @sections.add_section_hyp("bijf", @term_syntax.parse_term("bijective((f : (_) -> _))"))
}

///|
/// bij_inj
fn step_61() -> Unit raise {
  let t533 = @ssreflect.conv_thm_tac(fn(x526 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s527 = @tactics.disch_then(x526)
    fn(x528 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s527(x528)
    }
  }, @ssreflect.thm_tac(fn(x531 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x532 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x529 : @kernel.Thm, x530 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x529, x530))(x531, x532)
    }
  }))
  let t534 = @tactics.then_tac(@ssreflect.case, @tactics.then_tac(@tactics.disch_then(fn(x518 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let snd_th = x518
    let t524 = @ssreflect.thm_tac((x523 : @kernel.Thm) => @ssreflect.match_mp_then_v1(snd_th, fn(x520 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s521 = @tactics.mp_tac(x520)
      fn(x522 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s521(x522)
      }
    }, x523))
    (x525 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("can_inj", @list.List([can_inj_v1()])), t524, x525)
  }), t533))
  let t517 = @tactics.then_tac(@ssreflect.case, @ssreflect.move_(@list.List(["g"])))
  let t515 = @ssreflect.thm_tac(fn(x513 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x514 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x511 : @kernel.Thm, x512 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x511, x512))(x513, x514)
    }
  })
  let t535 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x516 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("bijective", @list.List([bijective()])), t515, x516), @tactics.all_tac), t517), t534)
  let t536 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x510 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("bijf", @list.List([])), (x509 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x509), x510), @ssreflect.clear_assumption("bijf")), @tactics.beta_tac), t535), @ssreflect.done_tac)])
  bij_inj_c.set(@sections.section_proof(@list.List([]), @term_syntax.parse_term("injective((f : (_) -> _))"), t536))
}

///|
let bij_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("bij_inj")

///|
/// `Ssrfun.bij_inj`
pub fn bij_inj() -> @kernel.Thm {
  bij_inj_c.get()
}

///|
/// bij_can_sym
fn step_62() -> Unit raise {
  let t602 = @ssreflect.thm_tac(fn(x600 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x601 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x598 : @kernel.Thm, x599 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x598, x599))(x600, x601)
    }
  })
  let t596 = @ssreflect.thm_tac(fn(x594 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x595 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x592 : @kernel.Thm, x593 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x592, x593))(x594, x595)
    }
  })
  let t604 = @tactics.then_tac(@tactics.then_tac((fn(x583 : (@ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let arg_tac_1 = x583
    (x591 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("fg", @list.List([])), fn(x585 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let fst_arg_1 = x585
      (x590 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("x", @list.List([])), fn(x587 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let snd_arg_1 = x587
        (x589 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.combine_args_then(arg_tac_1, fst_arg_1, snd_arg_1, x589)
      }, x590)
    }, x591)
  })((x597 : @ssreflect.ArgType) => @ssreflect.gsym_then_v1(t596, x597)), (x603 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("f'f", @list.List([])), t602, x603)), @ssreflect.done_tac)
  let t581 = @ssreflect.move_(@list.List(["x"]))
  let t580 = @ssreflect.move_(@list.List(["f'f"]))
  let t579 = @ssreflect.move_(@list.List(["fg"]))
  let t578 = @ssreflect.move_(@list.List(["gf"]))
  let t576 = @ssreflect.thm_tac(fn(x574 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x575 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x572 : @kernel.Thm, x573 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x572, x573))(x574, x575)
    }
  })
  let t582 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@ssreflect.repeat_tactic(1L, 9L, (x577 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("cancel", @list.List([cancel()])), t576, x577)), t578), t579), t580), t581)
  let t570 = @tactics.then_tac(@ssreflect.case, @tactics.all_tac)
  let t569 = @tactics.then_tac(@ssreflect.case, @ssreflect.move_(@list.List(["g"])))
  let t567 = @ssreflect.thm_tac(fn(x565 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x566 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x563 : @kernel.Thm, x564 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x563, x564))(x565, x566)
    }
  })
  let t571 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x568 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("bijective", @list.List([bijective()])), t567, x568), @tactics.all_tac), t569), t570)
  let t605 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x562 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("bijf", @list.List([])), (x561 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x561), x562), @ssreflect.clear_assumption("bijf")), @tactics.beta_tac), t571), t582)
  let t559 = (fn(x545 : (@ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let arg_tac = x545
    @ssreflect.conv_thm_tac(fn(x547 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s548 = @tactics.disch_then(x547)
      fn(x549 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s548(x549)
      }
    }, fn(x550 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let fst_arg = x550
      (x555 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("bij_inj", @list.List([bij_inj()])), fn(x552 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let snd_arg = x552
        (x554 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.combine_args_then(arg_tac, fst_arg, snd_arg, x554)
      }, x555)
    })
  })(@ssreflect.thm_tac(fn(x556 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s557 = @tactics.mp_tac(x556)
    fn(x558 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s557(x558)
    }
  }))
  let t560 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x537 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let snd_th = x537
    let t543 = @ssreflect.thm_tac((x542 : @kernel.Thm) => @ssreflect.match_mp_then_v1(snd_th, fn(x539 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s540 = @tactics.mp_tac(x539)
      fn(x541 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s540(x541)
      }
    }, x542))
    (x544 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("inj_can_sym", @list.List([inj_can_sym_v1()])), t543, x544)
  }), @tactics.beta_tac), t559), @ssreflect.done_tac)
  let t606 = @list.List([@ssreflect.thenl_first(@ssreflect.split_tac)(t560), t605, t604])
  bij_can_sym_c.set(@sections.section_proof(@list.List(["f'"]), @term_syntax.parse_term("cancel((f' : (_) -> _), (f : (_) -> _)) == cancel(f, f')"), t606))
}

///|
let bij_can_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("bij_can_sym")

///|
/// `Ssrfun.bij_can_sym`
pub fn bij_can_sym() -> @kernel.Thm {
  bij_can_sym_c.get()
}

///|
/// bij_can_eq
fn step_63() -> Unit raise {
  let t657 = @tactics.then_tac(@tactics.then_tac((fn(x631 : (@ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let arg_tac_1 = x631
    (fn(x633 : (@ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let arg_tac_2 = x633
      (fn(x635 : (@ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let arg_tac_3 = x635
        (x643 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("inj_can_eq", @list.List([inj_can_eq_v1()])), fn(x637 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let fst_arg_1 = x637
          (x642 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("can1", @list.List([])), fn(x639 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let snd_arg_1 = x639
            (x641 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.combine_args_then(arg_tac_3, fst_arg_1, snd_arg_1, x641)
          }, x642)
        }, x643)
      })(fn(x644 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let fst_arg_2 = x644
        (x649 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("bij_inj", @list.List([bij_inj()])), fn(x646 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let snd_arg_2 = x646
          (x648 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.combine_args_then(arg_tac_2, fst_arg_2, snd_arg_2, x648)
        }, x649)
      })
    })(fn(x650 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let fst_arg_3 = x650
      (x655 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("can2", @list.List([])), fn(x652 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let snd_arg_3 = x652
        (x654 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.combine_args_then(arg_tac_1, fst_arg_3, snd_arg_3, x654)
      }, x655)
    })
  })((x656 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x656)), @tactics.beta_tac), @ssreflect.done_tac)
  let t630 = @ssreflect.move_(@list.List(["can2"]))
  let t629 = @ssreflect.move_(@list.List(["can1"]))
  let t626 = @ssreflect.thm_tac(fn(x624 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x625 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x622 : @kernel.Thm, x623 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x622, x623))(x624, x625)
    }
  })
  let t620 = @ssreflect.thm_tac(fn(x618 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x619 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x616 : @kernel.Thm, x617 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x616, x617))(x618, x619)
    }
  })
  let t658 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((fn(x607 : (@ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let arg_tac = x607
    (x615 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("bij_can_sym", @list.List([bij_can_sym()])), fn(x609 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let fst_arg = x609
      (x614 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("f''", @list.List([])), fn(x611 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let snd_arg = x611
        (x613 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.combine_args_then(arg_tac, fst_arg, snd_arg, x613)
      }, x614)
    }, x615)
  })((x621 : @ssreflect.ArgType) => @ssreflect.gsym_then_v1(t620, x621)), (x628 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("bij_can_sym", @list.List([bij_can_sym()])), (x627 : @ssreflect.ArgType) => @ssreflect.gsym_then_v1(t626, x627), x628)), t629), t630), t657])
  bij_can_eq_c.set(@sections.section_proof(@list.List(["f'", "f''"]), @term_syntax.parse_term("cancel((f : (_) -> _), (f' : (_) -> _)) → cancel(f, (f'' : (_) -> _)) → f' == f''"), t658))
}

///|
let bij_can_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("bij_can_eq")

///|
/// `Ssrfun.bij_can_eq`
pub fn bij_can_eq() -> @kernel.Thm {
  bij_can_eq_c.get()
}

///|
/// bij_inj
fn step_64() -> Unit raise {
  bij_inj_v1_c.set(@sections.finalize_theorem(bij_inj()))
}

///|
let bij_inj_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("bij_inj")

///|
/// `Ssrfun.bij_inj`
pub fn bij_inj_v1() -> @kernel.Thm {
  bij_inj_v1_c.get()
}

///|
/// bij_can_sym
fn step_65() -> Unit raise {
  bij_can_sym_v1_c.set(@sections.finalize_theorem(bij_can_sym()))
}

///|
let bij_can_sym_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("bij_can_sym")

///|
/// `Ssrfun.bij_can_sym`
pub fn bij_can_sym_v1() -> @kernel.Thm {
  bij_can_sym_v1_c.get()
}

///|
/// bij_can_eq
fn step_66() -> Unit raise {
  bij_can_eq_v1_c.set(@sections.finalize_theorem(bij_can_eq()))
}

///|
let bij_can_eq_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("bij_can_eq")

///|
/// `Ssrfun.bij_can_eq`
pub fn bij_can_eq_v1() -> @kernel.Thm {
  bij_can_eq_v1_c.get()
}

///|
/// Formal_ineqs/lib/ssrfun.hl:245
fn step_67() -> Unit raise {
  @sections.end_section("Bijections")
}

///|
/// Formal_ineqs/lib/ssrfun.hl:248
fn step_68() -> Unit raise {
  @sections.begin_section("BijectionsTheory")
}

///|
/// Formal_ineqs/lib/ssrfun.hl:249
fn step_69() -> Unit raise {
  @sections.add_section_var(@kernel.mk_var("f", @term_syntax.parse_type("(BB) -> AA")))
}

///|
/// Formal_ineqs/lib/ssrfun.hl:250
fn step_70() -> Unit raise {
  @sections.add_section_var(@kernel.mk_var("h", @term_syntax.parse_type("(CC) -> BB")))
}

///|
/// eq_bij
fn step_71() -> Unit raise {
  let t674 = @ssreflect.thm_tac(fn(x672 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x673 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x670 : @kernel.Thm, x671 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x670, x671))(x672, x673)
    }
  })
  let t676 = @ssreflect.conv_thm_tac(fn(x667 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s668 = @tactics.disch_then(x667)
    fn(x669 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s668(x669)
    }
  }, (x675 : @ssreflect.ArgType) => @ssreflect.gsym_then_v1(t674, x675))
  let t666 = @ssreflect.move_(@list.List(["g"]))
  let t665 = @ssreflect.move_(@list.List(["bij"]))
  let t663 = @ssreflect.thm_tac(fn(x661 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x662 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x659 : @kernel.Thm, x660 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x659, x660))(x661, x662)
    }
  })
  let t677 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x664 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("eq_ext", @list.List([eq_ext()])), t663, x664), t665), t666), t676), @ssreflect.done_tac)])
  eq_bij_c.set(@sections.section_proof(@list.List([]), @term_syntax.parse_term("bijective((f : (_) -> _)) → (∀ g : (_) -> _, (∀ x : _, f(x) == g(x)) → bijective(g))"), t677))
}

///|
let eq_bij_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("eq_bij")

///|
/// `Ssrfun.eq_bij`
pub fn eq_bij() -> @kernel.Thm {
  eq_bij_c.get()
}

///|
/// bij_comp
fn step_72() -> Unit raise {
  let t795 = @tactics.disch_then(fn(x793 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x794 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      @ssreflect.apply_tac(x793, x794)
    }
  })
  let t796 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((fn(x779 : (@ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let arg_tac_10 = x779
    @ssreflect.conv_thm_tac(fn(x781 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s782 = @tactics.disch_then(x781)
      fn(x783 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s782(x783)
      }
    }, fn(x784 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let fst_arg_9 = x784
      (x789 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("can_rh", @list.List([])), fn(x786 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let snd_arg_9 = x786
        (x788 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.combine_args_then(arg_tac_10, fst_arg_9, snd_arg_9, x788)
      }, x789)
    })
  })(@ssreflect.thm_tac(fn(x790 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s791 = @tactics.mp_tac(x790)
    fn(x792 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s791(x792)
    }
  })), @tactics.beta_tac), t795), @ssreflect.done_tac)
  let t797 = @tactics.then_tac((fn(x745 : (@ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let arg_tac_6 = x745
    (fn(x747 : (@ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let arg_tac_7 = x747
      (fn(x749 : (@ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let arg_tac_8 = x749
        (fn(x751 : (@ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let arg_tac_9 = x751
          (x759 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("can_comp", @list.List([can_comp_v1()])), fn(x753 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let fst_arg_5 = x753
            (x758 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("r", @list.List([])), fn(x755 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
              let snd_arg_5 = x755
              (x757 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.combine_args_then(arg_tac_9, fst_arg_5, snd_arg_5, x757)
            }, x758)
          }, x759)
        })(fn(x760 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let fst_arg_6 = x760
          (x765 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("g", @list.List([])), fn(x762 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let snd_arg_6 = x762
            (x764 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.combine_args_then(arg_tac_8, fst_arg_6, snd_arg_6, x764)
          }, x765)
        })
      })(fn(x766 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let fst_arg_7 = x766
        (x771 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("h", @list.List([])), fn(x768 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let snd_arg_7 = x768
          (x770 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.combine_args_then(arg_tac_7, fst_arg_7, snd_arg_7, x770)
        }, x771)
      })
    })(fn(x772 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let fst_arg_8 = x772
      (x777 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("f", @list.List([])), fn(x774 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let snd_arg_8 = x774
        (x776 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.combine_args_then(arg_tac_6, fst_arg_8, snd_arg_8, x776)
      }, x777)
    })
  })((x778 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x778)), @tactics.beta_tac)
  let t744 = @tactics.disch_then(fn(x742 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x743 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      @ssreflect.apply_tac(x742, x743)
    }
  })
  let t798 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac((fn(x728 : (@ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let arg_tac_5 = x728
    @ssreflect.conv_thm_tac(fn(x730 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s731 = @tactics.disch_then(x730)
      fn(x732 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s731(x732)
      }
    }, fn(x733 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let fst_arg_4 = x733
      (x738 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("can_fg", @list.List([])), fn(x735 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let snd_arg_4 = x735
        (x737 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.combine_args_then(arg_tac_5, fst_arg_4, snd_arg_4, x737)
      }, x738)
    })
  })(@ssreflect.thm_tac(fn(x739 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s740 = @tactics.mp_tac(x739)
    fn(x741 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s740(x741)
    }
  })), @tactics.beta_tac), t744), @ssreflect.done_tac)
  let t799 = @tactics.then_tac((fn(x694 : (@ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let arg_tac_1 = x694
    (fn(x696 : (@ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let arg_tac_2 = x696
      (fn(x698 : (@ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let arg_tac_3 = x698
        (fn(x700 : (@ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let arg_tac_4 = x700
          (x708 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("can_comp", @list.List([can_comp_v1()])), fn(x702 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let fst_arg = x702
            (x707 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("f", @list.List([])), fn(x704 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
              let snd_arg = x704
              (x706 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.combine_args_then(arg_tac_4, fst_arg, snd_arg, x706)
            }, x707)
          }, x708)
        })(fn(x709 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let fst_arg_1 = x709
          (x714 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("h", @list.List([])), fn(x711 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let snd_arg_1 = x711
            (x713 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.combine_args_then(arg_tac_3, fst_arg_1, snd_arg_1, x713)
          }, x714)
        })
      })(fn(x715 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let fst_arg_2 = x715
        (x720 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("g", @list.List([])), fn(x717 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let snd_arg_2 = x717
          (x719 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.combine_args_then(arg_tac_2, fst_arg_2, snd_arg_2, x719)
        }, x720)
      })
    })(fn(x721 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let fst_arg_3 = x721
      (x726 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("r", @list.List([])), fn(x723 : @ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let snd_arg_3 = x723
        (x725 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.combine_args_then(arg_tac_1, fst_arg_3, snd_arg_3, x725)
      }, x726)
    })
  })((x727 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x727)), @tactics.beta_tac)
  let t800 = @tactics.then_tac((fn(x690 : (@ssreflect.ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let arg_tac = x690
    arg_tac(@ssreflect.ArgType::Arg_term(@term_syntax.parse_term("o((r : (_) -> _), (g : (_) -> _))")))
  })(@ssreflect.term_tac(fn(x692 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x693 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      @ssreflect.exists_tac(x692, x693)
    }
  })), @ssreflect.split_tac)
  let t687 = @ssreflect.move_(@list.List(["can_rh"]))
  let t688 = @tactics.then_tac(@ssreflect.case, @tactics.then_tac(@ssreflect.move_(@list.List(["can_hr"])), t687))
  let t689 = @tactics.then_tac(@ssreflect.case, @tactics.then_tac(@ssreflect.move_(@list.List(["r"])), t688))
  let t685 = @ssreflect.move_(@list.List(["can_gf"]))
  let t686 = @tactics.then_tac(@ssreflect.case, @tactics.then_tac(@ssreflect.move_(@list.List(["can_fg"])), t685))
  let t684 = @tactics.then_tac(@ssreflect.case, @ssreflect.move_(@list.List(["g"])))
  let t682 = @ssreflect.thm_tac(fn(x680 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x681 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x678 : @kernel.Thm, x679 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x678, x679))(x680, x681)
    }
  })
  let t801 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@ssreflect.repeat_tactic(3L, 0L, (x683 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("bijective", @list.List([bijective()])), t682, x683)), @tactics.all_tac), t684), t686), t689), t800, t799, t798, t797, t796])
  bij_comp_c.set(@sections.section_proof(@list.List([]), @term_syntax.parse_term("bijective((f : (_) -> _)) → bijective((h : (_) -> _)) → bijective(o(f, h))"), t801))
}

///|
let bij_comp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("bij_comp")

///|
/// `Ssrfun.bij_comp`
pub fn bij_comp() -> @kernel.Thm {
  bij_comp_c.get()
}

///|
/// bij_can_bij
fn step_73() -> Unit raise {
  let t827 = @ssreflect.thm_tac(fn(x825 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x826 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x823 : @kernel.Thm, x824 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x823, x824))(x825, x826)
    }
  })
  let t821 = @ssreflect.term_tac(fn(x819 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x820 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      @ssreflect.exists_tac(x819, x820)
    }
  })
  let t829 = @tactics.then_tac(@tactics.then_tac((x822 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("f", @list.List([])), t821, x822), (x828 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("can_sym", @list.List([])), t827, x828)), @ssreflect.done_tac)
  let t817 = @ssreflect.thm_tac(fn(x815 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x816 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x813 : @kernel.Thm, x814 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x813, x814))(x815, x816)
    }
  })
  let t812 = @ssreflect.move_(@list.List(["can_ff'"]))
  let t811 = @ssreflect.move_(@list.List(["f'"]))
  let t810 = @ssreflect.move_(@list.List(["can_sym"]))
  let t830 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x802 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let snd_th = x802
    let t808 = @ssreflect.thm_tac((x807 : @kernel.Thm) => @ssreflect.match_mp_then_v1(snd_th, fn(x804 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s805 = @tactics.mp_tac(x804)
      fn(x806 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s805(x806)
      }
    }, x807))
    (x809 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("bij_can_sym", @list.List([bij_can_sym_v1()])), t808, x809)
  }), @tactics.beta_tac), t810), t811), t812), (x818 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("bijective", @list.List([bijective()])), t817, x818)), t829])
  bij_can_bij_c.set(@sections.section_proof(@list.List([]), @term_syntax.parse_term("bijective((f : (_) -> _)) → (∀ f' : (_) -> _, cancel(f, f') → bijective(f'))"), t830))
}

///|
let bij_can_bij_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("bij_can_bij")

///|
/// `Ssrfun.bij_can_bij`
pub fn bij_can_bij() -> @kernel.Thm {
  bij_can_bij_c.get()
}

///|
/// eq_bij
fn step_74() -> Unit raise {
  eq_bij_v1_c.set(@sections.finalize_theorem(eq_bij()))
}

///|
let eq_bij_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("eq_bij")

///|
/// `Ssrfun.eq_bij`
pub fn eq_bij_v1() -> @kernel.Thm {
  eq_bij_v1_c.get()
}

///|
/// bij_comp
fn step_75() -> Unit raise {
  bij_comp_v1_c.set(@sections.finalize_theorem(bij_comp()))
}

///|
let bij_comp_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("bij_comp")

///|
/// `Ssrfun.bij_comp`
pub fn bij_comp_v1() -> @kernel.Thm {
  bij_comp_v1_c.get()
}

///|
/// bij_can_bij
fn step_76() -> Unit raise {
  bij_can_bij_v1_c.set(@sections.finalize_theorem(bij_can_bij()))
}

///|
let bij_can_bij_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("bij_can_bij")

///|
/// `Ssrfun.bij_can_bij`
pub fn bij_can_bij_v1() -> @kernel.Thm {
  bij_can_bij_v1_c.get()
}

///|
/// Formal_ineqs/lib/ssrfun.hl:283
fn step_77() -> Unit raise {
  @sections.end_section("BijectionsTheory")
}

///|
/// Formal_ineqs/lib/ssrfun.hl:286
fn step_78() -> Unit raise {
  @sections.begin_section("Involutions")
}

///|
/// Formal_ineqs/lib/ssrfun.hl:287
fn step_79() -> Unit raise {
  @sections.add_section_var(@kernel.mk_var("f", @term_syntax.parse_type("(A) -> A")))
}

///|
/// involutive
fn step_80() -> Unit raise {
  involutive_c.set(@pair.new_definition(@term_syntax.parse_term("(involutive : ((_) -> _) -> Bool)((f : (_) -> _)) == cancel(f, f)")))
}

///|
let involutive_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("involutive")

///|
/// `Ssrfun.involutive`
pub fn involutive() -> @kernel.Thm {
  involutive_c.get()
}

///|
/// Formal_ineqs/lib/ssrfun.hl:289
fn step_81() -> Unit raise {
  @sections.add_section_hyp("Hf", @term_syntax.parse_term("involutive((f : (_) -> _))"))
}

///|
/// inv_inj
fn step_82() -> Unit raise {
  let t847 = @tactics.disch_then(fn(x839 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let snd_th = x839
    let t845 = @ssreflect.thm_tac((x844 : @kernel.Thm) => @ssreflect.match_mp_then_v1(snd_th, fn(x841 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s842 = @tactics.mp_tac(x841)
      fn(x843 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s842(x843)
      }
    }, x844))
    (x846 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("can_inj", @list.List([can_inj_v1()])), t845, x846)
  })
  let t837 = @ssreflect.thm_tac(fn(x835 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x836 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x833 : @kernel.Thm, x834 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x833, x834))(x835, x836)
    }
  })
  let t848 = @tactics.then_tac((x838 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("involutive", @list.List([involutive()])), t837, x838), t847)
  let t849 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x832 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("Hf", @list.List([])), (x831 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x831), x832), @ssreflect.clear_assumption("Hf")), @tactics.beta_tac), t848), @ssreflect.done_tac)])
  inv_inj_c.set(@sections.section_proof(@list.List([]), @term_syntax.parse_term("injective((f : (_) -> _))"), t849))
}

///|
let inv_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("inv_inj")

///|
/// `Ssrfun.inv_inj`
pub fn inv_inj() -> @kernel.Thm {
  inv_inj_c.get()
}

///|
/// inv_bij
fn step_83() -> Unit raise {
  let t867 = @ssreflect.thm_tac(fn(x865 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x866 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x863 : @kernel.Thm, x864 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x863, x864))(x865, x866)
    }
  })
  let t862 = @tactics.then_tac(@tactics.then_tac((x861 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("Hf", @list.List([])), (x860 : @ssreflect.ArgType) => @ssreflect.disch_tac(@list.List([]), x860), x861), @ssreflect.clear_assumption("Hf")), @tactics.beta_tac)
  let t858 = @ssreflect.term_tac(fn(x856 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x857 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      @ssreflect.exists_tac(x856, x857)
    }
  })
  let t854 = @ssreflect.thm_tac(fn(x852 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x853 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x850 : @kernel.Thm, x851 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x850, x851))(x852, x853)
    }
  })
  let t869 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x855 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("bijective", @list.List([bijective()])), t854, x855), (x859 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("f", @list.List([])), t858, x859)), t862), (x868 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.use_arg_then2(("involutive", @list.List([involutive()])), t867, x868)), @ssreflect.done_tac)])
  inv_bij_c.set(@sections.section_proof(@list.List([]), @term_syntax.parse_term("bijective((f : (_) -> _))"), t869))
}

///|
let inv_bij_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("inv_bij")

///|
/// `Ssrfun.inv_bij`
pub fn inv_bij() -> @kernel.Thm {
  inv_bij_c.get()
}

///|
/// inv_inj
fn step_84() -> Unit raise {
  inv_inj_v1_c.set(@sections.finalize_theorem(inv_inj()))
}

///|
let inv_inj_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("inv_inj")

///|
/// `Ssrfun.inv_inj`
pub fn inv_inj_v1() -> @kernel.Thm {
  inv_inj_v1_c.get()
}

///|
/// inv_bij
fn step_85() -> Unit raise {
  inv_bij_v1_c.set(@sections.finalize_theorem(inv_bij()))
}

///|
let inv_bij_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("inv_bij")

///|
/// `Ssrfun.inv_bij`
pub fn inv_bij_v1() -> @kernel.Thm {
  inv_bij_v1_c.get()
}

///|
/// Formal_ineqs/lib/ssrfun.hl:308
fn step_86() -> Unit raise {
  @sections.end_section("Involutions")
}

///|
/// Formal_ineqs/lib/ssrfun.hl:311
fn step_87() -> Unit raise {
  @sections.begin_section("OperationProperties")
}

///|
/// Formal_ineqs/lib/ssrfun.hl:314
fn step_88() -> Unit raise {
  @sections.begin_section("SopTisR")
}

///|
/// left_inverse
fn step_89() -> Unit raise {
  left_inverse_c.set(@pair.new_definition(@term_syntax.parse_term("(left_inverse : (_, (Real) -> Real, (Real, Real) -> _) -> Bool)((e : _), inv, (op : (Real, Real) -> _)) == (∀ x : Real, op(inv(x), x) == e)")))
}

///|
let left_inverse_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("left_inverse")

///|
/// `Ssrfun.left_inverse`
pub fn left_inverse() -> @kernel.Thm {
  left_inverse_c.get()
}

///|
/// right_inverse
fn step_90() -> Unit raise {
  right_inverse_c.set(@pair.new_definition(@term_syntax.parse_term("(right_inverse : (_, (Real) -> Real, (Real, Real) -> _) -> Bool)((e : _), inv, (op : (Real, Real) -> _)) == (∀ x : Real, op(x, inv(x)) == e)")))
}

///|
let right_inverse_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("right_inverse")

///|
/// `Ssrfun.right_inverse`
pub fn right_inverse() -> @kernel.Thm {
  right_inverse_c.get()
}

///|
/// left_injective
fn step_91() -> Unit raise {
  left_injective_c.set(@pair.new_definition(@term_syntax.parse_term("(left_injective : ((_, _) -> _) -> Bool)((op : (_, _) -> _)) == (∀ x : _, injective((y : _) => op(y, x)))")))
}

///|
let left_injective_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("left_injective")

///|
/// `Ssrfun.left_injective`
pub fn left_injective() -> @kernel.Thm {
  left_injective_c.get()
}

///|
/// right_injective
fn step_92() -> Unit raise {
  right_injective_c.set(@pair.new_definition(@term_syntax.parse_term("(right_injective : ((_, _) -> _) -> Bool)((op : (_, _) -> _)) == (∀ y : _, injective(op(y)))")))
}

///|
let right_injective_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("right_injective")

///|
/// `Ssrfun.right_injective`
pub fn right_injective() -> @kernel.Thm {
  right_injective_c.get()
}

///|
/// Formal_ineqs/lib/ssrfun.hl:321
fn step_93() -> Unit raise {
  @sections.end_section("SopTisR")
}

///|
/// Formal_ineqs/lib/ssrfun.hl:324
fn step_94() -> Unit raise {
  @sections.begin_section("SopTisS")
}

///|
/// right_id
fn step_95() -> Unit raise {
  right_id_c.set(@pair.new_definition(@term_syntax.parse_term("(right_id : (_, (_, _) -> _) -> Bool)((e : _), (op : (_, _) -> _)) == (∀ x : _, op(x, e) == x)")))
}

///|
let right_id_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("right_id")

///|
/// `Ssrfun.right_id`
pub fn right_id() -> @kernel.Thm {
  right_id_c.get()
}

///|
/// left_zero
fn step_96() -> Unit raise {
  left_zero_c.set(@pair.new_definition(@term_syntax.parse_term("(left_zero : (_, (_, _) -> _) -> Bool)((z : _), (op : (_, _) -> _)) == (∀ x : _, op(z, x) == z)")))
}

///|
let left_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("left_zero")

///|
/// `Ssrfun.left_zero`
pub fn left_zero() -> @kernel.Thm {
  left_zero_c.get()
}

///|
/// right_commutative
fn step_97() -> Unit raise {
  right_commutative_c.set(@pair.new_definition(@term_syntax.parse_term("(right_commutative : ((_, _) -> _) -> Bool)((op : (_, _) -> _)) == (∀ x : _, ∀ y : _, ∀ z : _, op(op(x, y), z) == op(op(x, z), y))")))
}

///|
let right_commutative_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("right_commutative")

///|
/// `Ssrfun.right_commutative`
pub fn right_commutative() -> @kernel.Thm {
  right_commutative_c.get()
}

///|
/// left_distributive
fn step_98() -> Unit raise {
  left_distributive_c.set(@pair.new_definition(@term_syntax.parse_term("(left_distributive : ((_, _) -> _, (_, _) -> _) -> Bool)((op : (_, _) -> _), (add : (_, _) -> _)) == (∀ x : _, ∀ y : _, ∀ z : _, op(add(x, y), z) == add(op(x, z), op(y, z)))")))
}

///|
let left_distributive_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("left_distributive")

///|
/// `Ssrfun.left_distributive`
pub fn left_distributive() -> @kernel.Thm {
  left_distributive_c.get()
}

///|
/// right_loop
fn step_99() -> Unit raise {
  right_loop_c.set(@pair.new_definition(@term_syntax.parse_term("(right_loop : ((Real) -> Real, (_, Real) -> _) -> Bool)(inv, (op : (_, Real) -> _)) == (∀ y : Real, cancel((x : _) => op(x, y), (x : _) => op(x, inv(y))))")))
}

///|
let right_loop_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("right_loop")

///|
/// `Ssrfun.right_loop`
pub fn right_loop() -> @kernel.Thm {
  right_loop_c.get()
}

///|
/// rev_right_loop
fn step_100() -> Unit raise {
  rev_right_loop_c.set(@pair.new_definition(@term_syntax.parse_term("(rev_right_loop : ((Real) -> Real, (_, Real) -> _) -> Bool)(inv, (op : (_, Real) -> _)) == (∀ y : Real, cancel((x : _) => op(x, inv(y)), (x : _) => op(x, y)))")))
}

///|
let rev_right_loop_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("rev_right_loop")

///|
/// `Ssrfun.rev_right_loop`
pub fn rev_right_loop() -> @kernel.Thm {
  rev_right_loop_c.get()
}

///|
/// Formal_ineqs/lib/ssrfun.hl:337
fn step_101() -> Unit raise {
  @sections.end_section("SopTisS")
}

///|
/// Formal_ineqs/lib/ssrfun.hl:340
fn step_102() -> Unit raise {
  @sections.begin_section("SopTisT")
}

///|
/// left_id
fn step_103() -> Unit raise {
  left_id_c.set(@pair.new_definition(@term_syntax.parse_term("(left_id : (_, (_, _) -> _) -> Bool)((e : _), (op : (_, _) -> _)) == (∀ x : _, op(e, x) == x)")))
}

///|
let left_id_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("left_id")

///|
/// `Ssrfun.left_id`
pub fn left_id() -> @kernel.Thm {
  left_id_c.get()
}

///|
/// right_zero
fn step_104() -> Unit raise {
  right_zero_c.set(@pair.new_definition(@term_syntax.parse_term("(right_zero : (_, (_, _) -> _) -> Bool)((z : _), (op : (_, _) -> _)) == (∀ x : _, op(x, z) == z)")))
}

///|
let right_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("right_zero")

///|
/// `Ssrfun.right_zero`
pub fn right_zero() -> @kernel.Thm {
  right_zero_c.get()
}

///|
/// left_commutative
fn step_105() -> Unit raise {
  left_commutative_c.set(@pair.new_definition(@term_syntax.parse_term("(left_commutative : ((_, _) -> _) -> Bool)((op : (_, _) -> _)) == (∀ x : _, ∀ y : _, ∀ z : _, op(x, op(y, z)) == op(y, op(x, z)))")))
}

///|
let left_commutative_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("left_commutative")

///|
/// `Ssrfun.left_commutative`
pub fn left_commutative() -> @kernel.Thm {
  left_commutative_c.get()
}

///|
/// right_distributive
fn step_106() -> Unit raise {
  right_distributive_c.set(@pair.new_definition(@term_syntax.parse_term("(right_distributive : ((_, _) -> _, (_, _) -> _) -> Bool)((op : (_, _) -> _), (add : (_, _) -> _)) == (∀ x : _, ∀ y : _, ∀ z : _, op(x, add(y, z)) == add(op(x, y), op(x, z)))")))
}

///|
let right_distributive_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("right_distributive")

///|
/// `Ssrfun.right_distributive`
pub fn right_distributive() -> @kernel.Thm {
  right_distributive_c.get()
}

///|
/// left_loop
fn step_107() -> Unit raise {
  left_loop_c.set(@pair.new_definition(@term_syntax.parse_term("(left_loop : ((Real) -> Real, (Real, _) -> _) -> Bool)(inv, (op : (Real, _) -> _)) == (∀ x : Real, cancel(op(x), op(inv(x))))")))
}

///|
let left_loop_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("left_loop")

///|
/// `Ssrfun.left_loop`
pub fn left_loop() -> @kernel.Thm {
  left_loop_c.get()
}

///|
/// rev_left_loop
fn step_108() -> Unit raise {
  rev_left_loop_c.set(@pair.new_definition(@term_syntax.parse_term("(rev_left_loop : ((Real) -> Real, (Real, _) -> _) -> Bool)(inv, (op : (Real, _) -> _)) == (∀ x : Real, cancel(op(inv(x)), op(x)))")))
}

///|
let rev_left_loop_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("rev_left_loop")

///|
/// `Ssrfun.rev_left_loop`
pub fn rev_left_loop() -> @kernel.Thm {
  rev_left_loop_c.get()
}

///|
/// Formal_ineqs/lib/ssrfun.hl:353
fn step_109() -> Unit raise {
  @sections.end_section("SopTisT")
}

///|
/// Formal_ineqs/lib/ssrfun.hl:356
fn step_110() -> Unit raise {
  @sections.begin_section("SopSisT")
}

///|
/// self_inverse
fn step_111() -> Unit raise {
  self_inverse_c.set(@pair.new_definition(@term_syntax.parse_term("(self_inverse : (_, (_, _) -> _) -> Bool)((e : _), (op : (_, _) -> _)) == (∀ x : _, op(x, x) == e)")))
}

///|
let self_inverse_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("self_inverse")

///|
/// `Ssrfun.self_inverse`
pub fn self_inverse() -> @kernel.Thm {
  self_inverse_c.get()
}

///|
/// commutative
fn step_112() -> Unit raise {
  commutative_c.set(@pair.new_definition(@term_syntax.parse_term("(commutative : ((_, _) -> _) -> Bool)((op : (_, _) -> _)) == (∀ x : _, ∀ y : _, op(x, y) == op(y, x))")))
}

///|
let commutative_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("commutative")

///|
/// `Ssrfun.commutative`
pub fn commutative() -> @kernel.Thm {
  commutative_c.get()
}

///|
/// Formal_ineqs/lib/ssrfun.hl:361
fn step_113() -> Unit raise {
  @sections.end_section("SopSisT")
}

///|
/// Formal_ineqs/lib/ssrfun.hl:364
fn step_114() -> Unit raise {
  @sections.begin_section("SopSisS")
}

///|
/// idempotent
fn step_115() -> Unit raise {
  idempotent_c.set(@pair.new_definition(@term_syntax.parse_term("(idempotent : ((_, _) -> _) -> Bool)((op : (_, _) -> _)) == (∀ x : _, op(x, x) == x)")))
}

///|
let idempotent_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("idempotent")

///|
/// `Ssrfun.idempotent`
pub fn idempotent() -> @kernel.Thm {
  idempotent_c.get()
}

///|
/// associative
fn step_116() -> Unit raise {
  associative_c.set(@pair.new_definition(@term_syntax.parse_term("(associative : ((_, _) -> _) -> Bool)((op : (_, _) -> _)) == (∀ x : _, ∀ y : _, ∀ z : _, op(x, op(y, z)) == op(op(x, y), z))")))
}

///|
let associative_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("associative")

///|
/// `Ssrfun.associative`
pub fn associative() -> @kernel.Thm {
  associative_c.get()
}

///|
/// Formal_ineqs/lib/ssrfun.hl:369
fn step_117() -> Unit raise {
  @sections.end_section("SopSisS")
}

///|
/// Formal_ineqs/lib/ssrfun.hl:372
fn step_118() -> Unit raise {
  @sections.end_section("OperationProperties")
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
}
