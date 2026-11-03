// Translated from upstream Formal_ineqs/lib/ssreflect/sections.hl; edit this file directly.

///|
/// `revert_proof_step`
pub fn revert_proof_step(x1 : Unit) -> @tactics.Goalstack raise {
  let _ = x1
  let l = @tactics.current_goalstack.val
  if (Int::to_int64(@lib.length(l)) == 1L) {
    raise Failure("Can't back up any more")
  } else {
    {
      @tactics.current_goalstack.val = @lib.tl(l)
      ()
    }
  }
  @tactics.current_goalstack.val
}

///|
/// fast_load_flag
fn step_1() -> Unit raise {
  fast_load_flag_c.set(Ref::{ val: false })
}

///|
let fast_load_flag_c : @lib.Cell[Ref[Bool]] = @lib.Cell::new("fast_load_flag")

///|
/// `Sections.fast_load_flag`
pub fn fast_load_flag() -> Ref[Bool] {
  fast_load_flag_c.get()
}

///|
/// `section_info`
#derive(Eq, Debug)
pub(all) struct SectionInfo {
  vars : @list.List[@kernel.Term]
  hyps : @list.List[(String, @kernel.Term)]
  types : @list.List[(String, @kernel.HolType)]
  lemmas : @list.List[(String, @kernel.Thm)]
}

///|
pub extend SectionInfo with Eq::{not_equal, equal}

///|
pub extend SectionInfo with Debug::{to_repr}

///|
pub extend SectionInfo with @lib.OCompare::{ocompare}

///|
pub extend SectionInfo with @lib.OHash::{ohash_visit}

///|
pub impl @lib.OCompare for SectionInfo with fn ocompare(self, other) {
  let c = @lib.compare(self.vars, other.vars)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.hyps, other.hyps)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.types, other.types)
  if c != 0 {
    return c
  }
  @lib.compare(self.lemmas, other.lemmas)
}

///|
pub impl @lib.OHash for SectionInfo with fn ohash_visit(self, h) {
  h.block(0, 4)
  h.field(self.vars)
  h.field(self.hyps)
  h.field(self.types)
  h.field(self.lemmas)
}

///|
/// empty_section
fn step_2() -> Unit raise {
  empty_section_c.set(SectionInfo::{ vars: @list.List([]), hyps: @list.List([]), types: @list.List([]), lemmas: @list.List([]) })
}

///|
let empty_section_c : @lib.Cell[SectionInfo] = @lib.Cell::new("empty_section")

///|
/// `Sections.empty_section`
pub fn empty_section() -> SectionInfo {
  empty_section_c.get()
}

///|
/// section_stack
fn step_3() -> Unit raise {
  section_stack_c.set(Ref::{ val: @list.List([]) })
}

///|
let section_stack_c : @lib.Cell[Ref[@list.List[(String, Ref[SectionInfo])]]] = @lib.Cell::new("section_stack")

///|
/// `Sections.section_stack`
pub fn section_stack() -> Ref[@list.List[(String, Ref[SectionInfo])]] {
  section_stack_c.get()
}

///|
/// `begin_section`
pub fn begin_section(x2 : String) -> Unit raise {
  let name = x2
  let sections = section_stack().val
  if @lib.can(fn(x5 : String) -> Ref[SectionInfo] raise {
    (fn(x3 : String) -> ((@list.List[(String, Ref[SectionInfo])]) -> Ref[SectionInfo] raise) raise {
      fn(x4 : @list.List[(String, Ref[SectionInfo])]) -> Ref[SectionInfo] raise {
        @lib.assoc(x3, x4)
      }
    })(x5)(sections)
  }, name) {
    raise Failure(("Section " + (name + " is already active")))
  } else {
    let sections_1 = sections.prepend((name, Ref::{ val: empty_section() }))
    {
      section_stack().val = sections_1
      ()
    }
  }
}

///|
/// `end_section`
pub fn end_section(x6 : String) -> Unit raise {
  let name = x6
  let sections = section_stack().val
  if @list.List::is_empty(sections) {
    raise Failure("end_section: No open sections")
  } else {
    let (last_name, _) = @lib.hd(sections)
    if (Int::to_int64(@lib.compare(last_name, name)) != 0L) {
      raise Failure(("The last open section is " + last_name))
    } else {
      {
        section_stack().val = @lib.tl(sections)
        ()
      }
    }
  }
}

///|
/// `end_all_sections`
pub fn end_all_sections(x7 : Unit) -> Unit raise {
  let _ = x7
  {
    section_stack().val = @list.List([])
    ()
  }
}

///|
/// `current_section_vars`
pub fn current_section_vars(x8 : Unit) -> @list.List[@kernel.Term] raise {
  let _ = x8
  if @list.List::is_empty(section_stack().val) {
    @list.List([])
  } else {
    let t10 = section_stack().val
    ((fn(x9 : (String, Ref[SectionInfo])) -> Ref[SectionInfo] raise {
      x9.1
    })(@lib.hd(t10)).val).vars
  }
}

///|
/// `current_section_hyps`
pub fn current_section_hyps(x11 : Unit) -> @list.List[(String, @kernel.Term)] raise {
  let _ = x11
  if @list.List::is_empty(section_stack().val) {
    @list.List([])
  } else {
    let t13 = section_stack().val
    ((fn(x12 : (String, Ref[SectionInfo])) -> Ref[SectionInfo] raise {
      x12.1
    })(@lib.hd(t13)).val).hyps
  }
}

///|
/// `section_vars`
pub fn section_vars(x14 : Unit) -> @list.List[@kernel.Term] raise {
  let _ = x14
  let vars = @lib.map(fn(x15 : (String, Ref[SectionInfo])) -> @list.List[@kernel.Term] raise {
    let (_, s) = x15
    (s.val).vars
  }, section_stack().val)
  @lib.flat(vars)
}

///|
/// `section_types`
pub fn section_types(x16 : Unit) -> @list.List[(String, @kernel.HolType)] raise {
  let _ = x16
  let types = @lib.map(fn(x17 : (String, Ref[SectionInfo])) -> @list.List[(String, @kernel.HolType)] raise {
    let (_, s) = x17
    (s.val).types
  }, section_stack().val)
  @lib.flat(types)
}

///|
/// `section_hyps`
pub fn section_hyps(x18 : Unit) -> @list.List[(String, @kernel.Term)] raise {
  let _ = x18
  let hyps = @lib.map(fn(x19 : (String, Ref[SectionInfo])) -> @list.List[(String, @kernel.Term)] raise {
    let (_, s) = x19
    (s.val).hyps
  }, section_stack().val)
  @lib.flat(hyps)
}

///|
/// `section_lemmas`
pub fn section_lemmas(x20 : Unit) -> @list.List[(String, @kernel.Thm)] raise {
  let _ = x20
  let lemmas = @lib.map(fn(x21 : (String, Ref[SectionInfo])) -> @list.List[(String, @kernel.Thm)] raise {
    let (_, s) = x21
    (s.val).lemmas
  }, section_stack().val)
  @lib.flat(lemmas)
}

///|
/// `section_labels`
pub fn section_labels(x22 : Unit) -> @list.List[String] raise {
  let _ = x22
  let hyp_names = @lib.map(fn(x23 : (String, @kernel.Term)) -> String raise {
    x23.0
  }, section_hyps(()))
  let lemma_names = @lib.map(fn(x24 : (String, @kernel.Thm)) -> String raise {
    x24.0
  }, section_lemmas(()))
  hyp_names.concat(lemma_names)
}

///|
/// `inst_section_vars`
pub fn inst_section_vars(x25 : @kernel.Term) -> @kernel.Term raise {
  let tm = x25
  let s_vars = @lib.map(@kernel.dest_var, section_vars(()))
  let find_var : ((String, @kernel.HolType)) -> (@kernel.HolType, @kernel.HolType) raise = fn(x26 : (String, @kernel.HolType)) -> (@kernel.HolType, @kernel.HolType) raise {
    let (name, ty) = x26
    try {
      (@lib.assoc(name, s_vars), ty)
    } catch {
      Failure(_) => (@kernel.bool_ty, @kernel.bool_ty)
      e => raise e
    }
  }
  let inst_var : ((String, @kernel.HolType)) -> ((@kernel.Term) -> @kernel.Term raise) raise = fn(x27 : (String, @kernel.HolType)) -> ((@kernel.Term) -> @kernel.Term raise) raise {
    let (name_1, ty_1) = x27
    fn(x28 : @kernel.Term) -> @kernel.Term raise {
      let tm_1 = x28
      let (ty_dst, ty_src) = find_var((name_1, ty_1))
      try {
        @kernel.inst(@basics.type_match(ty_src, ty_dst, @list.List([])), tm_1)
      } catch {
        Failure(_) => raise Failure(("Section variable " + (name_1 + (" has type " + @printer.string_of_type(ty_dst)))))
        e => raise e
      }
    }
  }
  let f_vars = @lib.map(@kernel.dest_var, @kernel.frees(tm))
  @lib.itlist(fn(x29 : (String, @kernel.HolType), x30 : @kernel.Term) -> @kernel.Term raise {
    let s31 = inst_var(x29)
    s31(x30)
  }, f_vars, tm)
}

///|
/// `inst_section_types`
pub fn inst_section_types(x32 : @kernel.Term) -> @kernel.Term raise {
  let tm = x32
  let s_types = section_types(())
  let find_type : (@kernel.Term) -> (@kernel.HolType, @kernel.HolType) raise = fn(x33 : @kernel.Term) -> (@kernel.HolType, @kernel.HolType) raise {
    let tm_1 = x33
    let (name, ty) = @kernel.dest_var(tm_1)
    try {
      (@lib.assoc(name, s_types), ty)
    } catch {
      Failure(_) => (@kernel.bool_ty, @kernel.bool_ty)
      e => raise e
    }
  }
  let f_vars = @kernel.frees(tm)
  let (g_vars, _) = @basics.strip_forall(tm)
  let (ty_dst, ty_src) = @lib.unzip(@lib.map(find_type, g_vars.concat(f_vars)))
  let ty_inst = @lib.itlist2(@basics.type_match, ty_src, ty_dst, @list.List([]))
  @kernel.inst(ty_inst, tm)
}

///|
/// `check_section_term`
pub fn check_section_term(x34 : @kernel.Term) -> Unit raise {
  let tm = x34
  let f_vars = @kernel.frees(tm)
  if @list.List::is_empty(section_stack().val) {
    if !@list.List::is_empty(f_vars) {
      let str = @lib.string_concat(", ", @lib.map(@printer.string_of_term, f_vars))
      raise Failure(("Free variables: " + str))
    } else {
      ()
    }
  } else {
    let s_vars = section_vars(())
    let vars = @lib.subtract(f_vars, s_vars)
    if !@list.List::is_empty(vars) {
      let str_1 = @lib.string_concat(", ", @lib.map(@printer.string_of_term, vars))
      raise Failure(("Free variables: " + str_1))
    } else {
      ()
    }
  }
}

///|
/// `add_section_var`
pub fn add_section_var(x35 : @kernel.Term) -> Unit raise {
  let var_ = x35
  let sections = section_stack().val
  if @list.List::is_empty(sections) {
    raise Failure("add_section_var: No open sections")
  } else {
    let s_var = section_vars(())
    let (var_name, _) = @kernel.dest_var(var_)
    let t38 = @lib.map(@kernel.dest_var, s_var)
    if @lib.can(fn(x39 : String) -> @kernel.HolType raise {
      (fn(x36 : String) -> ((@list.List[(String, @kernel.HolType)]) -> @kernel.HolType raise) raise {
        fn(x37 : @list.List[(String, @kernel.HolType)]) -> @kernel.HolType raise {
          @lib.assoc(x36, x37)
        }
      })(x39)(t38)
    }, var_name) {
      raise Failure(("A variable with the name " + (var_name + " is already defined")))
    } else {
      let section = (fn(x40 : (String, Ref[SectionInfo])) -> Ref[SectionInfo] raise {
        x40.1
      })(@lib.hd(sections))
      let t41 = section.val
      {
        section.val = SectionInfo::{ ..t41, vars: ((section.val).vars).prepend(var_) }
        ()
      }
    }
  }
}

///|
/// `add_section_type`
pub fn add_section_type(x42 : @kernel.Term) -> Unit raise {
  let tm = x42
  let sections = section_stack().val
  if @list.List::is_empty(sections) {
    raise Failure("add_section_type: No open sections")
  } else {
    let s_types = section_types(())
    let (var_name, ty) = @kernel.dest_var(tm)
    if @lib.can(fn(x45 : String) -> @kernel.HolType raise {
      (fn(x43 : String) -> ((@list.List[(String, @kernel.HolType)]) -> @kernel.HolType raise) raise {
        fn(x44 : @list.List[(String, @kernel.HolType)]) -> @kernel.HolType raise {
          @lib.assoc(x43, x44)
        }
      })(x45)(s_types)
    }, var_name) {
      raise Failure(("An implicit type for the variable " + (var_name + " is already defined")))
    } else {
      let section = (fn(x46 : (String, Ref[SectionInfo])) -> Ref[SectionInfo] raise {
        x46.1
      })(@lib.hd(sections))
      let t47 = section.val
      {
        section.val = SectionInfo::{ ..t47, types: ((section.val).types).prepend((var_name, ty)) }
        ()
      }
    }
  }
}

///|
/// `add_section_lemma`
pub fn add_section_lemma(x48 : String, x49 : @kernel.Thm) -> Unit raise {
  let name = x48
  let th = x49
  let sections = section_stack().val
  if @list.List::is_empty(sections) {
    raise Failure("add_section_lemma: No open sections")
  } else {
    let labels = section_labels(())
    if @lib.mem(name, labels) {
      raise Failure(("A lemma (or hypothesis) with the name " + (name + " is already defined")))
    } else {
      let section = (fn(x50 : (String, Ref[SectionInfo])) -> Ref[SectionInfo] raise {
        x50.1
      })(@lib.hd(sections))
      let t51 = section.val
      {
        section.val = SectionInfo::{ ..t51, lemmas: ((section.val).lemmas).prepend((name, th)) }
        ()
      }
    }
  }
}

///|
/// `add_section_hyp`
pub fn add_section_hyp(x52 : String, x53 : @kernel.Term) -> Unit raise {
  let label = x52
  let hyp = x53
  let sections = section_stack().val
  if @list.List::is_empty(sections) {
    raise Failure("add_section_hyp: No open sections")
  } else {
    let labels = section_labels(())
    if @lib.mem(label, labels) {
      raise Failure(("A hypothesis (or lemma) with the label " + (label + " is already defined")))
    } else {
      let hyp0 = inst_section_vars(hyp)
      let hyp1 = inst_section_types(hyp0)
      if (@kernel.type_of(hyp1) != @kernel.bool_ty) {
        raise Failure("A boolean term is expected")
      } else {
        let section = (fn(x54 : (String, Ref[SectionInfo])) -> Ref[SectionInfo] raise {
          x54.1
        })(@lib.hd(sections))
        check_section_term(hyp1)
        let t55 = section.val
        {
          section.val = SectionInfo::{ ..t55, hyps: ((section.val).hyps).prepend((label, hyp1)) }
          ()
        }
      }
    }
  }
}

///|
/// `remove_section_var`
pub fn remove_section_var(x56 : String) -> Unit raise {
  let var_name = x56
  let sections = section_stack().val
  if @list.List::is_empty(sections) {
    raise Failure("remove_section_var: No open sections")
  } else {
    let section = (fn(x57 : (String, Ref[SectionInfo])) -> Ref[SectionInfo] raise {
      x57.1
    })(@lib.hd(sections))
    let new_vars = @lib.filter(fn(x58 : @kernel.Term) -> Bool raise {
      let var_ = x58
      ((fn(x59 : (String, @kernel.HolType)) -> String raise {
        x59.0
      })(@kernel.dest_var(var_)) != var_name)
    }, (section.val).vars)
    {
      section.val = SectionInfo::{ ..section.val, vars: new_vars }
      ()
    }
  }
}

///|
/// `remove_section_type`
pub fn remove_section_type(x60 : String) -> Unit raise {
  let type_name = x60
  let sections = section_stack().val
  if @list.List::is_empty(sections) {
    raise Failure("remove_section_type: No open sections")
  } else {
    let section = (fn(x61 : (String, Ref[SectionInfo])) -> Ref[SectionInfo] raise {
      x61.1
    })(@lib.hd(sections))
    let new_types = @lib.filter(fn(x62 : (String, @kernel.HolType)) -> Bool raise {
      let (name, _) = x62
      (name != type_name)
    }, (section.val).types)
    {
      section.val = SectionInfo::{ ..section.val, types: new_types }
      ()
    }
  }
}

///|
/// `remove_section_lemma`
pub fn remove_section_lemma(x63 : String) -> Unit raise {
  let lemma_name = x63
  let sections = section_stack().val
  if @list.List::is_empty(sections) {
    raise Failure("remove_section_lemma: No open sections")
  } else {
    let section = (fn(x64 : (String, Ref[SectionInfo])) -> Ref[SectionInfo] raise {
      x64.1
    })(@lib.hd(sections))
    let new_lemmas = @lib.filter(fn(x65 : (String, @kernel.Thm)) -> Bool raise {
      let (name, _) = x65
      (name != lemma_name)
    }, (section.val).lemmas)
    {
      section.val = SectionInfo::{ ..section.val, lemmas: new_lemmas }
      ()
    }
  }
}

///|
/// `remove_section_hyp`
pub fn remove_section_hyp(x66 : String) -> Unit raise {
  let label = x66
  let sections = section_stack().val
  if @list.List::is_empty(sections) {
    raise Failure("remove_section_hyp: No open sections")
  } else {
    let section = (fn(x67 : (String, Ref[SectionInfo])) -> Ref[SectionInfo] raise {
      x67.1
    })(@lib.hd(sections))
    let new_hyps = @lib.filter(fn(x68 : (String, @kernel.Term)) -> Bool raise {
      let (name, _) = x68
      (name != label)
    }, (section.val).hyps)
    {
      section.val = SectionInfo::{ ..section.val, hyps: new_hyps }
      ()
    }
  }
}

///|
/// `prepare_goal_term`
pub fn prepare_goal_term(x69 : @kernel.Term) -> @kernel.Term raise {
  let tm = x69
  if @list.List::is_empty(section_stack().val) {
    check_section_term(tm)
    tm
  } else {
    let tm0 = inst_section_vars(tm)
    let tm1 = inst_section_types(tm0)
    let s_hyps = @lib.map(fn(x70 : (String, @kernel.Term)) -> @kernel.Term raise {
      x70.1
    }, section_hyps(()))
    let r = @lib.itlist((x72 : @kernel.Term, x73 : @kernel.Term) => @lib.curry(fn(x71 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
      @bool.mk_imp(x71.0, x71.1)
    }, x72, x73), s_hyps, tm1)
    check_section_term(r)
    r
  }
}

///|
/// `prepare_section_proof`
pub fn prepare_section_proof(x74 : @list.List[String], x75 : @kernel.Term) -> ((@kernel.Term, @tactics.Tactic)) raise {
  let names = x74
  let tm = x75
  let f_vars = @lib.map(@kernel.dest_var, @kernel.frees(tm))
  let find_type : (String) -> @kernel.HolType raise = fn(x76 : String) -> @kernel.HolType raise {
    let var_name = x76
    try {
      @lib.assoc(var_name, f_vars)
    } catch {
      Failure(_) => raise Failure(("Unused variable: " + var_name))
      e => raise e
    }
  }
  let g_vars = @lib.map(fn(x77 : String) -> @kernel.Term raise {
    let name = x77
    @kernel.mk_var(name, find_type(name))
  }, names)
  let g_tm = @bool.list_mk_forall(g_vars, tm)
  let tm0 = prepare_goal_term(g_tm)
  let hyp_names = @lib.map(fn(x78 : (String, @kernel.Term)) -> String raise {
    x78.0
  }, section_hyps(()))
  let lemmas = section_lemmas(())
  let gen_tac : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = @tactics.replicate_tac(@lib.length(g_vars), @tactics.gen_tac)
  let disch_tac : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = @lib.itlist(fn(x79 : String, x80 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let name_1 = x79
    let tac = x80
    @tactics.then_tac(@tactics.disch_then(fn(x83 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s84 = ((x82 : @kernel.Thm) => @tactics.label_tac(name_1, x82))(x83)
      fn(x85 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s84(x85)
      }
    }), tac)
  }, hyp_names, @tactics.all_tac)
  let assume_tac : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = @lib.itlist(fn(x86 : (String, @kernel.Thm), x87 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let (name_2, lemma) = x86
    let tac_1 = x87
    @tactics.then_tac(@tactics.label_tac(name_2, lemma), tac_1)
  }, lemmas, @tactics.all_tac)
  (tm0, @tactics.then_tac(@tactics.then_tac(assume_tac, disch_tac), gen_tac))
}

///|
/// `start_section_proof`
pub fn start_section_proof(x89 : @list.List[String], x90 : @kernel.Term) -> @tactics.Goalstack raise {
  let names = x89
  let tm = x90
  let (tm0, tac0) = prepare_section_proof(names, tm)
  let _ = @tactics.set_goal(@list.List([]), tm0)
  @tactics.refine(@tactics.by(@tactics.valid(tac0)))
}

///|
/// `end_section_proof`
pub fn end_section_proof(x91 : Unit) -> @kernel.Thm raise {
  let _ = x91
  let th = @tactics.top_thm()
  let hyps = section_hyps(())
  @lib.itlist(fn(x92 : (String, @kernel.Term), x93 : @kernel.Thm) -> @kernel.Thm raise {
    let th_1 = x93
    @bool.undisch(th_1)
  }, hyps, th)
}

///|
/// `section_proof`
pub fn section_proof(x94 : @list.List[String], x95 : @kernel.Term, x96 : @list.List[((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise]) -> @kernel.Thm raise {
  let names = x94
  let tm = x95
  let tac_list = x96
  let (tm0, tac0) = prepare_section_proof(names, tm)
  let gstate = @tactics.mk_goalstate((@list.List([]), tm0))
  let tac_list1 = if fast_load_flag().val {
    @list.List([fn(x97 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      let g = x97
      @tactics.accept_tac(@drule.mk_thm(@list.List([]), g.1))(g)
    }])
  } else {
    tac_list
  }
  let (_, sgs, just) = @lib.rev_itlist(fn(x98 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise, x99 : ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    let s100 = @tactics.by(x98)
    s100(x99)
  }, tac_list1.prepend(tac0), gstate)
  let th0 = if @list.List::is_empty(sgs) {
    just(@tactics.null_inst, @list.List([]))
  } else {
    raise Failure("section_proof: unsolved goals")
  }
  let hyps = section_hyps(())
  @lib.itlist(fn(x101 : (String, @kernel.Term), x102 : @kernel.Thm) -> @kernel.Thm raise {
    let th = x102
    @bool.undisch(th)
  }, hyps, th0)
}

///|
/// `finalize_theorem`
pub fn finalize_theorem(x103 : @kernel.Thm) -> @kernel.Thm raise {
  let th = x103
  let hyps = @lib.map(fn(x104 : (String, @kernel.Term)) -> @kernel.Term raise {
    x104.1
  }, current_section_hyps(()))
  let th_hyps = @kernel.hyp(th)
  let hyps0 = @lib.intersect(hyps, th_hyps)
  let s_vars = current_section_vars(())
  let th1 = @lib.rev_itlist(fn(x105 : @kernel.Term, x106 : @kernel.Thm) -> @kernel.Thm raise {
    let hyp = x105
    let th_1 = x106
    @bool.disch(hyp, th_1)
  }, hyps0, th)
  let f_vars = @kernel.frees(@kernel.concl(th1))
  let vars = @lib.intersect(f_vars, s_vars)
  @lib.itlist(fn(x107 : @kernel.Term, x108 : @kernel.Thm) -> @kernel.Thm raise {
    let var_ = x107
    let th_2 = x108
    @bool.gen(var_, th_2)
  }, vars, th1)
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
  step_3()
}
