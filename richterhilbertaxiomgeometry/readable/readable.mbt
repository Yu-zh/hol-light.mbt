// Translated from upstream RichterHilbertAxiomGeometry/readable.ml; edit this file directly.

///|
/// `parse_qproof`
pub fn parse_qproof(x1 : String) -> String raise {
  let s = x1
  @lib.string_sub(s, 1, @lib.int63_to_int(@lib.sub63(Int::to_int64(@lib.string_length(s)), 1L)))
}

///|
/// `CleanMathFontsForHOL_Light`
pub fn cleanmathfontsforhol_light(x2 : String) -> String raise {
  let s = x2
  fn clean(x3 : String, x4 : @list.List[(String, String)]) -> String raise {
    let s_1 = x3
    let lostringpairs = x4
    match lostringpairs {
      Empty => s_1
      More(hd, tail=tl) => {
        let s_2 = @lib.str_global_replace(@lib.str_regexp(hd.0), hd.1, s_1)
        clean(s_2, tl)
      }
    }
  }
  clean(s, @list.List([("⇒", "==>"), ("⇔", "<=>"), ("∧", "/\\ "), ("∨", "\\/"), ("¬", "~"), ("∀", "forall "), ("∃", "?"), ("∈", "IN"), ("∉", "NOTIN"), ("α", "alpha"), ("β", "beta"), ("γ", "gamma"), ("λ", "\\ "), ("θ", "theta"), ("μ", "mu"), ("⊂", "SUBSET"), ("∩", "INTER"), ("∪", "UNION"), ("∅", "{}"), ("━", "DIFF"), ("≡", "==="), ("≅", "cong"), ("∡", "angle"), ("∥", "parallel"), ("∏", "prod"), ("∘", "_o_"), ("→", "--->"), ("╪", "INSERT"), ("≃", "TarskiCong"), ("≊", "TarskiTriangleCong"), ("ℬ", "TarskiBetween")]))
}

///|
/// `exception Readable_fail`
pub(all) suberror Readable_fail {
  Readable_fail(String)
}

///|
/// `make_env`
pub fn make_env(x25 : @list.List[(String, @kernel.Thm)], x26 : @kernel.Term) -> @list.List[(String, @preterm.Pretype)] raise {
  let (asl, w) = (x25, x26)
  @lib.map(fn(x28 : @kernel.Term) -> (String, @preterm.Pretype) raise {
    (fn(x27 : (String, @kernel.HolType)) -> (String, @preterm.Pretype) raise {
      let (s, ty) = x27
      (s, @preterm.pretype_of_type(ty))
    })(@kernel.dest_var(x28))
  }, @kernel.freesl(@lib.map(fn(x31 : (String, @kernel.Thm)) -> @kernel.Term raise {
    (fn(x29 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x29)
    })((fn(x30 : (String, @kernel.Thm)) -> @kernel.Thm raise {
      x30.1
    })(x31))
  }, asl).prepend(w)))
}

///|
/// `parse_env_string`: the term the term syntax `s` denotes where the
/// variables `env` names have the types it gives them (a goal's free
/// variables, `make_env`).
pub fn parse_env_string(env : @list.List[(String, @preterm.Pretype)], s : String) -> @kernel.Term raise {
  @term_syntax.parse_term_in_context(env, s)
}

///|
/// `NewConstant`
pub fn newconstant(x37 : String, x38 : @kernel.HolType) -> Unit raise {
  let (x, y) = (x37, x38)
  @kernel.new_constant(cleanmathfontsforhol_light(x), y)
}

///|
/// `ParseAsInfix`
pub fn parseasinfix(x39 : String, x40 : (Int64, String)) -> Unit raise {
  let (x, y) = (x39, x40)
  @printer.parse_as_infix(cleanmathfontsforhol_light(x), y)
}

///|
/// `NewDefinition`
pub fn newdefinition(x41 : String) -> @kernel.Thm raise {
  let s = x41
  @pair.new_definition(parse_env_string(@list.List([]), s))
}

///|
/// `NewAxiom`
pub fn newaxiom(x42 : String) -> @kernel.Thm raise {
  let s = x42
  @kernel.new_axiom(parse_env_string(@list.List([]), s))
}

///|
/// `subgoal_THEN`
pub fn subgoal_then(x43 : String, x44 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise, x45 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let stm = x43
  let ttac = x44
  let gl = x45
  @tactics.subgoal_then(parse_env_string(make_env(gl.0, gl.1), stm), ttac)(gl)
}

///|
/// `subgoal_TAC`
pub fn subgoal_tac(x46 : String, x47 : String, x48 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise, x49 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let stm = x46
  let lab = x47
  let tac = x48
  let gl = x49
  @tactics.subgoal_tac(lab, parse_env_string(make_env(gl.0, gl.1), stm), @list.List([tac]))(gl)
}

///|
/// `exists_TAC`
pub fn exists_tac(x50 : String, x51 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let stm = x50
  let gl = x51
  @tactics.exists_tac(parse_env_string(make_env(gl.0, gl.1), stm))(gl)
}

///|
/// `X_gen_TAC`
pub fn x_gen_tac(x52 : String, x53 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let svar = x52
  let (asl, w) as gl = x53
  let vartype = (fn(x57 : (@kernel.Term, @kernel.Term)) -> @kernel.HolType raise {
    (fn(x55 : @kernel.Term) -> @kernel.HolType raise {
      (fn(x54 : (String, @kernel.HolType)) -> @kernel.HolType raise {
        x54.1
      })(@kernel.dest_var(x55))
    })((fn(x56 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
      x56.0
    })(x57))
  })(@basics.dest_forall(w))
  @tactics.x_gen_tac(@kernel.mk_var(svar, vartype))(gl)
}

///|
/// `X_genl_TAC`
pub fn x_genl_tac(x58 : @list.List[String]) -> @tactics.Tactic raise {
  let svarlist = x58
  @tactics.map_every(fn(x60 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x61 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      x_gen_tac(x60, x61)
    }
  }, svarlist)
}

///|
/// `intro_TAC`
pub fn intro_tac(x62 : String) -> @tactics.Tactic raise {
  let s = x62
  @theorems.intro_tac(@lib.str_global_replace(@lib.str_regexp(","), ";", s))
}

///|
/// `assume`
pub fn assume_(x64 : String, x65 : String, x66 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise, x67 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let statement = x64
  let lab = x65
  let tac = x66
  let (asl, w) as gl = x67
  let t = parse_env_string(make_env(gl.0, gl.1), statement)
  let t77 = @tactics.hyp_tac(@simp.simp_tac, lab)(@list.List([]))
  let t76 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.first_assum(fn(x73 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s74 = @tactics.mp_tac(x73)
    fn(x75 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s74(x75)
    }
  }), tac)])
  let t72 = @bool.spec(t, @class.excluded_middle())
  @tactics.then_tac(@tactics.thenl(@tactics.disj_cases_then(fn(x69 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s70 = ((x68 : @kernel.Thm) => @tactics.label_tac(lab, x68))(x69)
    fn(x71 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s70(x71)
    }
  })(t72), t76), t77)(gl)
}

///|
/// `eq_tac`
pub fn eq_tac(x78 : String, x79 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) -> @tactics.Tactic raise {
  let string = x78
  let tac = x79
  if (string == "Right") {
    @tactics.thenl(@tactics.then_tac(@tactics.conv_tac(@equal.sym_conv), @tactics.eq_tac), @list.List([tac, @tactics.all_tac]))
  } else {
    if (string == "Left") {
      @tactics.thenl(@tactics.eq_tac, @list.List([tac, @tactics.all_tac]))
    } else {
      raise Readable_fail::Readable_fail(("eq_tac requires " + (string + " to be either Left or Right")))
    }
  }
}

///|
/// `conj_tac`
pub fn conj_tac(x81 : String, x82 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) -> @tactics.Tactic raise {
  let string = x81
  let tac = x82
  if (string == "Right") {
    @tactics.thenl(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@theorems.conj_sym()])), @tactics.conj_tac), @list.List([tac, @tactics.all_tac]))
  } else {
    if (string == "Left") {
      @tactics.thenl(@tactics.conj_tac, @list.List([tac, @tactics.all_tac]))
    } else {
      raise Readable_fail::Readable_fail(("conj_tac requires " + (string + " to be either Left or Right")))
    }
  }
}

///|
/// `consider`
pub fn consider(x84 : String, x85 : String, x86 : String, x87 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) -> @tactics.Tactic raise {
  let svars = x84
  let stm = x85
  let lab = x86
  let tac = x87
  let t89 = @theorems.destruct_tac(("@" + (svars + ("." + lab))))
  // the statement is the existential itself (∃ x : T, P), its variables
  // `svars`
  let t90 = stm
  @tactics.thenl((x91 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => subgoal_then(t90, t89, x91), @list.List([tac, @tactics.all_tac]))
}

///|
/// `case_split`
pub fn case_split(x92 : String, x93 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise, x94 : @list.List[String], x95 : @list.List[((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise]) -> @tactics.Tactic raise {
  let sdestruct = x92
  let tac = x93
  let listofdisj = x94
  let listoftac = x95
  let disjunction = @lib.itlist(fn(x97 : String, x98 : String) -> String raise {
    let s = x97
    let t = x98
    if (t == "") {
      ("(" + (s + ")"))
    } else {
      ("(" + (s + (") || " + t)))
    }
  }, listofdisj, "")
  @tactics.thenl(@tactics.then_tac((x99 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => subgoal_tac(disjunction, "", tac, x99), @tactics.first_x_assum(@theorems.destruct_tac(sdestruct))), listoftac)
}

///|
/// fol
fn step_9() -> Unit raise {
  fol_c.set(@meson.meson_tac)
}

///|
let fol_c : @lib.Cell[(@list.List[@kernel.Thm]) -> @tactics.Tactic raise] = @lib.Cell::new("fol")

///|
/// `fol`
pub fn fol(x : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  (fol_c.get())(x)
}

///|
/// rewrite
fn step_10() -> Unit raise {
  rewrite_c.set(@simp.rewrite_tac)
}

///|
let rewrite_c : @lib.Cell[(@list.List[@kernel.Thm]) -> @tactics.Tactic raise] = @lib.Cell::new("rewrite")

///|
/// `rewrite`
pub fn rewrite(x : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  (rewrite_c.get())(x)
}

///|
/// simplify
fn step_11() -> Unit raise {
  simplify_c.set(@simp.simp_tac)
}

///|
let simplify_c : @lib.Cell[(@list.List[@kernel.Thm]) -> @tactics.Tactic raise] = @lib.Cell::new("simplify")

///|
/// `simplify`
pub fn simplify(x : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  (simplify_c.get())(x)
}

///|
/// set
fn step_12() -> Unit raise {
  set_c.set(@sets.set_tac)
}

///|
let set_c : @lib.Cell[(@list.List[@kernel.Thm]) -> @tactics.Tactic raise] = @lib.Cell::new("set")

///|
/// `set`
pub fn set(x : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  (set_c.get())(x)
}

///|
/// rewriteR
fn step_13() -> Unit raise {
  rewriter_c.set((x103 : @list.List[@kernel.Thm]) => @simp.gen_rewrite_tac(fn(x100 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s101 = @equal.rand_conv(x100)
    fn(x102 : @kernel.Term) -> @kernel.Thm raise {
      s101(x102)
    }
  }, x103))
}

///|
let rewriter_c : @lib.Cell[(@list.List[@kernel.Thm]) -> @tactics.Tactic raise] = @lib.Cell::new("rewriteR")

///|
/// `rewriteR`
pub fn rewriter(x : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  (rewriter_c.get())(x)
}

///|
/// rewriteL
fn step_14() -> Unit raise {
  rewritel_c.set((x107 : @list.List[@kernel.Thm]) => @simp.gen_rewrite_tac(fn(x104 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s105 = @equal.land_conv(x104)
    fn(x106 : @kernel.Term) -> @kernel.Thm raise {
      s105(x106)
    }
  }, x107))
}

///|
let rewritel_c : @lib.Cell[(@list.List[@kernel.Thm]) -> @tactics.Tactic raise] = @lib.Cell::new("rewriteL")

///|
/// `rewriteL`
pub fn rewritel(x : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  (rewritel_c.get())(x)
}

///|
/// rewriteI
fn step_15() -> Unit raise {
  rewritei_c.set((x109 : @list.List[@kernel.Thm]) => @simp.gen_rewrite_tac(fn(x108 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x108
  }, x109))
}

///|
let rewritei_c : @lib.Cell[(@list.List[@kernel.Thm]) -> @tactics.Tactic raise] = @lib.Cell::new("rewriteI")

///|
/// `rewriteI`
pub fn rewritei(x : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  (rewritei_c.get())(x)
}

///|
/// rewriteRLDepth
fn step_16() -> Unit raise {
  rewriterldepth_c.set((x121 : @list.List[@kernel.Thm]) => @simp.gen_rewrite_tac(fn(x120 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x116 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x110 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s111 = @equal.rand_conv(x110)
        fn(x112 : @kernel.Term) -> @kernel.Thm raise {
          s111(x112)
        }
      })((fn(x113 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s114 = @equal.land_conv(x113)
        fn(x115 : @kernel.Term) -> @kernel.Thm raise {
          s114(x115)
        }
      })(x116))
    })((fn(x117 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s118 = @equal.depth_conv(x117)
      fn(x119 : @kernel.Term) -> @kernel.Thm raise {
        s118(x119)
      }
    })(x120))
  }, x121))
}

///|
let rewriterldepth_c : @lib.Cell[(@list.List[@kernel.Thm]) -> @tactics.Tactic raise] = @lib.Cell::new("rewriteRLDepth")

///|
/// `rewriteRLDepth`
pub fn rewriterldepth(x : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  (rewriterldepth_c.get())(x)
}

///|
/// `TACtoThmTactic`
pub fn tactothmtactic(x122 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise, x123 : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  let tac = x122
  let ths = x123
  @tactics.then_tac(@tactics.map_every(fn(x125 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s126 = @tactics.mp_tac(x125)
    fn(x127 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s126(x127)
    }
  }, ths), tac)
}

///|
/// arithmetic
fn step_17() -> Unit raise {
  arithmetic_c.set((x128 : @list.List[@kernel.Thm]) => tactothmtactic(@int.arith_tac, x128))
}

///|
let arithmetic_c : @lib.Cell[(@list.List[@kernel.Thm]) -> @tactics.Tactic raise] = @lib.Cell::new("arithmetic")

///|
/// `arithmetic`
pub fn arithmetic(x : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  (arithmetic_c.get())(x)
}

///|
/// real_arithmetic
fn step_18() -> Unit raise {
  real_arithmetic_c.set((x129 : @list.List[@kernel.Thm]) => tactothmtactic(@calc_rat.real_arith_tac, x129))
}

///|
let real_arithmetic_c : @lib.Cell[(@list.List[@kernel.Thm]) -> @tactics.Tactic raise] = @lib.Cell::new("real_arithmetic")

///|
/// `real_arithmetic`
pub fn real_arithmetic(x : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  (real_arithmetic_c.get())(x)
}

///|
/// num_ring
fn step_19() -> Unit raise {
  let t130 = @tactics.conv_tac(@grobner.num_ring)
  num_ring_c.set((x131 : @list.List[@kernel.Thm]) => tactothmtactic(t130, x131))
}

///|
let num_ring_c : @lib.Cell[(@list.List[@kernel.Thm]) -> @tactics.Tactic raise] = @lib.Cell::new("num_ring")

///|
/// `num_ring`
pub fn num_ring(x : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  (num_ring_c.get())(x)
}

///|
/// real_ring
fn step_20() -> Unit raise {
  let t132 = @tactics.conv_tac(@calc_rat.real_ring)
  real_ring_c.set((x133 : @list.List[@kernel.Thm]) => tactothmtactic(t132, x133))
}

///|
let real_ring_c : @lib.Cell[(@list.List[@kernel.Thm]) -> @tactics.Tactic raise] = @lib.Cell::new("real_ring")

///|
/// `real_ring`
pub fn real_ring(x : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  (real_ring_c.get())(x)
}

///|
/// `interactive_goal`
pub fn interactive_goal(x203 : String) -> @tactics.Goalstack raise {
  @tactics.g(parse_env_string(@list.List([]), x203))
}

///|
/// SKOLEM_THM_GEN
fn step_23() -> Unit raise {
  skolem_thm_gen_c.set(prove(
    "∀ P : (_) -> Bool, ∀ R : (_, _) -> Bool, (∀ x : _, P(x) → (∃ y : _, R(x, y))) == (∃ f : (_) -> _, ∀ x : _, P(x) → R(x, f(x)))",
    steps(
      [
        intro_tac("forall P R"),
        eq_tac("Right", by(fol, [])),
        intro_tac("H1"),
        exists("(x : _) => select((y : _) => R(x, y))"),
        by(fol, [Label("H1")]),
      ],
    ),
  ))
}

///|
let skolem_thm_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SKOLEM_THM_GEN")

///|
/// `SKOLEM_THM_GEN`
pub fn skolem_thm_gen() -> @kernel.Thm {
  skolem_thm_gen_c.get()
}

///|
/// MOD_MOD_REFL'
fn step_25() -> Unit raise {
  mod_mod_refl_p_c.set(prove(
    "∀ m : Num, ∀ n : Num, !(n == 0) → MOD(MOD(m, n), n) == MOD(m, n)",
    steps(
      [
        intro_tac("forall m n, H1"),
        by_thm(
          th => @tactics.mp_tac(th),
          TermsRule(
            tms => th => @bool.specl(tms, th),
            ["m", "n", "1"],
            Thm("MOD_MOD", () => @arith.mod_mod()),
          ),
        ),
        by(
          fol,
          [
            Label("H1"),
            Thm("MULT_CLAUSES", () => @arith.mult_clauses()),
            Thm("MULT_EQ_0", () => @arith.mult_eq_0()),
            Thm("ONE", () => @arith.one()),
            Thm("NOT_SUC", () => @nums.not_suc()),
          ],
        ),
      ],
    ),
  ))
}

///|
let mod_mod_refl_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD_MOD_REFL'")

///|
/// `MOD_MOD_REFL'`
pub fn mod_mod_refl_p() -> @kernel.Thm {
  mod_mod_refl_p_c.get()
}

///|
/// NSQRT_2
fn step_33() -> Unit raise {
  nsqrt_2_v1_c.set(prove(
    "∀ p : Num, ∀ q : Num, p * p == 2 * (q * q) → q == 0",
    steps_then(
      [
        by_thm(@tactics.match_mp_tac, Thm("num_WF", () => @arith.num_wf())),
        intro_tac("forall p, A, forall q, B"),
        have("EVEN(p * p) == EVEN(2 * (q * q))", "", by(fol, [Label("B")])),
        have(
          "EVEN(p)",
          "",
          by(
            fol,
            [
              Prev,
              Thm("EVEN_DOUBLE", () => @arith.even_double()),
              Thm("EVEN_MULT", () => @arith.even_mult()),
            ],
          ),
        ),
        consider(
          "m",
          "∃ m : Num, p == 2 * m",
          "C",
          by(fol, [Prev, Thm("EVEN_EXISTS", () => @arith.even_exists())]),
        ),
      ],
      case_split(
        "qp | pq",
        by(arithmetic, []),
        @list.List(["q < p", "p <= q"]),
        @list.List(
          [
            steps(
              [
                have(
                  "q * q == 2 * (m * m) → m == 0",
                  "",
                  by(fol, [Label("qp"), Label("A")]),
                ),
                by(num_ring, [Prev, Label("B"), Label("C")]),
              ],
            ),
            steps(
              [
                have(
                  "p * p <= q * q",
                  "",
                  by(fol, [Prev, Thm("LE_MULT2", () => @arith.le_mult2())]),
                ),
                have("q * q == 0", "", by(arithmetic, [Prev, Label("B")])),
                by(num_ring, [Prev]),
              ],
            ),
          ],
        ),
      ),
    ),
  ))
}

///|
let nsqrt_2_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSQRT_2")

///|
/// `NSQRT_2`
pub fn nsqrt_2_v1() -> @kernel.Thm {
  nsqrt_2_v1_c.get()
}

///|
/// RichterHilbertAxiomGeometry/readable.ml:614
fn step_42() -> Unit raise {
  ignore(interactive_goal("∀ p : Num, ∀ q : Num, p * p == 2 * (q * q) → q == 0"))
}

///|
/// RichterHilbertAxiomGeometry/readable.ml:616
fn step_43() -> Unit raise {
  ignore(@tactics.e(
    steps(
      [
        by_thm(@tactics.match_mp_tac, Thm("num_WF", () => @arith.num_wf())),
        intro_tac("forall p, A, forall q, B"),
        have("EVEN(p * p) == EVEN(2 * (q * q))", "", @tactics.all_tac),
      ],
    ),
  ))
}

///|
/// RichterHilbertAxiomGeometry/readable.ml:621
fn step_44() -> Unit raise {
  ignore(@tactics.e(steps([by(fol, [Label("B")])])))
}

///|
/// RichterHilbertAxiomGeometry/readable.ml:624
fn step_45() -> Unit raise {
  ignore(@tactics.e(
    steps(
      [
        have(
          "EVEN(p)",
          "",
          by(
            fol,
            [
              Prev,
              Thm("EVEN_DOUBLE", () => @arith.even_double()),
              Thm("EVEN_MULT", () => @arith.even_mult()),
            ],
          ),
        ),
        consider(
          "m",
          "∃ m : Num, p == 2 * m",
          "C",
          steps([by(fol, [Prev, Thm("EVEN_EXISTS", () => @arith.even_exists())])]),
        ),
      ],
    ),
  ))
}

///|
/// RichterHilbertAxiomGeometry/readable.ml:628
fn step_46() -> Unit raise {
  ignore(@tactics.e(
    case_split(
      "qp | pq",
      by(arithmetic, []),
      @list.List(["q < p", "p <= q"]),
      @list.List([@tactics.all_tac, @tactics.all_tac]),
    ),
  ))
}

///|
/// RichterHilbertAxiomGeometry/readable.ml:635
fn step_47() -> Unit raise {
  ignore(@tactics.e(
    steps(
      [
        have(
          "q * q == 2 * (m * m) → m == 0",
          "",
          by(fol, [Label("qp"), Label("A")]),
        ),
        by(num_ring, [Prev, Label("B"), Label("C")]),
      ],
    ),
  ))
}

///|
/// RichterHilbertAxiomGeometry/readable.ml:639
fn step_48() -> Unit raise {
  ignore(@tactics.e(
    steps(
      [
        have(
          "p * p <= q * q",
          "",
          by(fol, [Prev, Thm("LE_MULT2", () => @arith.le_mult2())]),
        ),
        have("q * q == 0", "", by(arithmetic, [Prev, Label("B")])),
        by(num_ring, [Prev]),
      ],
    ),
  ))
}

///|
/// NSQRT_2
fn step_49() -> Unit raise {
  nsqrt_2_c.set(@tactics.top_thm())
}

///|
let nsqrt_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NSQRT_2")

///|
/// `NSQRT_2`
pub fn nsqrt_2() -> @kernel.Thm {
  nsqrt_2_c.get()
}

///|
/// EXP_2
fn step_50() -> Unit raise {
  exp_2_c.set(prove(
    "∀ n : Num, EXP(n, 2) == n * n",
    by(
      rewrite,
      [
        Thm("BIT0_THM", () => @arith.bit0_thm()),
        Thm("BIT1_THM", () => @arith.bit1_thm()),
        Thm("EXP", () => @arith.exp()),
        Thm("EXP_ADD", () => @arith.exp_add()),
        Thm("MULT_CLAUSES", () => @arith.mult_clauses()),
        Thm("ADD_CLAUSES", () => @arith.add_clauses()),
      ],
    ),
  ))
}

///|
let exp_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXP_2")

///|
/// `EXP_2`
pub fn exp_2() -> @kernel.Thm {
  exp_2_c.get()
}

///|
/// binom
fn step_57() -> Unit raise {
  binom_c.set(@define.define_(@term_syntax.parse_term("(∀ n : Num, (binom : ((Num, Num)) -> Num)((n, 0)) == 1) && (∀ k : Num, binom((0, SUC(k))) == 0) && (∀ n : Num, ∀ k : Num, binom((SUC(n), SUC(k))) == binom((n, SUC(k))) + binom((n, k)))")))
}

///|
let binom_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("binom")

///|
/// `binom`
pub fn binom() -> @kernel.Thm {
  binom_c.get()
}

///|
/// BINOM_LT
fn step_58() -> Unit raise {
  binom_lt_c.set(prove(
    "∀ n : Num, ∀ k : Num, n < k → binom((n, k)) == 0",
    steps(
      [
        @nums.induct_tac,
        @nums.induct_tac,
        by(
          rewrite,
          [
            Thm("binom", () => binom()),
            Thm("ARITH", () => @calc_num.arith()),
            Thm("LT_SUC", () => @arith.lt_suc()),
            Thm("LT", () => @arith.lt()),
          ],
        ),
        by(
          @simp.asm_simp_tac,
          [
            TermRule(@int.arith_rule, "n < k → n < SUC(k)"),
            Thm("ARITH", () => @calc_num.arith()),
          ],
        ),
      ],
    ),
  ))
}

///|
let binom_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BINOM_LT")

///|
/// `BINOM_LT`
pub fn binom_lt() -> @kernel.Thm {
  binom_lt_c.get()
}

///|
/// BINOMIAL_THEOREM
fn step_66() -> Unit raise {
  binomial_theorem_c.set(prove(
    "∀ n : Num, EXP((x : Num) + (y : Num), n) == nsum(op_dot_dot(0, n), (k : Num) => binom((n, k)) * (EXP(x, k) * EXP(y, n - k)))",
    steps(
      [
        have(
          "∀ f : (Num) -> Num, ∀ n : Num, nsum(op_dot_dot(0, SUC(n)), f) == f(0) + nsum(op_dot_dot(0, n), (i : Num) => f(SUC(i)))",
          "Nsum0SUC",
          by(
            simplify,
            [
              Thm("LE_0", () => @arith.le_0()),
              Thm("ADD1", () => @arith.add1()),
              Thm("NSUM_CLAUSES_LEFT", () => @iterate.nsum_clauses_left()),
              Thm("NSUM_OFFSET", () => @iterate.nsum_offset()),
            ],
          ),
        ),
        by_thm(@tactics.match_mp_tac, Thm("num_INDUCTION", () => @nums.num_induction())),
        by(
          simplify,
          [
            Thm("EXP", () => @arith.exp()),
            Thm("NSUM_SING_NUMSEG", () => @iterate.nsum_sing_numseg()),
            Thm("binom", () => binom()),
            Thm("SUB_0", () => @arith.sub_0()),
            Thm("MULT_CLAUSES", () => @arith.mult_clauses()),
          ],
        ),
        intro_tac("forall n, nThm"),
        by(
          rewrite,
          [
            Label("Nsum0SUC"),
            Thm("binom", () => binom()),
            Thm("RIGHT_ADD_DISTRIB", () => @arith.right_add_distrib()),
            Thm("NSUM_ADD_NUMSEG", () => @iterate.nsum_add_numseg()),
            Rule(@equal.gsym, Thm("NSUM_LMUL", () => @iterate.nsum_lmul())),
            Thm("ADD_ASSOC", () => @arith.add_assoc()),
          ],
        ),
        by(rewriter, [Thm("ADD_SYM", () => @arith.add_sym())]),
        by(
          rewriterldepth,
          [Thm("SUB_SUC", () => @arith.sub_suc()), Thm("EXP", () => @arith.exp())],
        ),
        by(
          rewrite,
          [
            Thm("MULT_AC", () => @arith.mult_ac()),
            Thm("EQ_ADD_LCANCEL", () => @arith.eq_add_lcancel()),
            ThmsTermRule(
              ths => tm => @meson.meson(ths, tm),
              [Thm("binom", () => binom())],
              "1 == binom((n, 0))",
            ),
            Rule(@equal.gsym, Label("Nsum0SUC")),
          ],
        ),
        by(
          simplify,
          [
            Thm("NSUM_CLAUSES_RIGHT", () => @iterate.nsum_clauses_right()),
            TermRule(@int.arith_rule, "0 < SUC(n) && 0 <= SUC(n)"),
            Thm("LT", () => @arith.lt()),
            Thm("BINOM_LT", () => binom_lt()),
            Thm("MULT_CLAUSES", () => @arith.mult_clauses()),
            Thm("ADD_CLAUSES", () => @arith.add_clauses()),
            Thm("SUC_SUB1", () => @arith.suc_sub1()),
          ],
        ),
        by(
          simplify,
          [
            TermRule(@int.arith_rule, "(k : Num) <= n → SUC(n) - k == SUC(n - k)"),
            Thm("EXP", () => @arith.exp()),
            Thm("MULT_AC", () => @arith.mult_ac()),
          ],
        ),
      ],
    ),
  ))
}

///|
let binomial_theorem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BINOMIAL_THEOREM")

///|
/// `BINOMIAL_THEOREM`
pub fn binomial_theorem() -> @kernel.Thm {
  binomial_theorem_c.get()
}

///|
fn load_steps() -> Unit raise {
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
  step_23()
  step_25()
  step_33()
  step_42()
  step_43()
  step_44()
  step_45()
  step_46()
  step_47()
  step_48()
  step_49()
  step_50()
  step_57()
  step_58()
  step_66()
}
