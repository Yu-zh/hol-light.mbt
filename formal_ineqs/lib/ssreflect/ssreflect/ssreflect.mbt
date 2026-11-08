// Translated from upstream Formal_ineqs/lib/ssreflect/ssreflect.hl; edit this file directly.

///|
/// ssreflect_eq_def
fn step_1() -> Unit raise {
  ssreflect_eq_def_c.set(@pair.new_definition(@term_syntax.parse_term("∀ v : A, ∀ P : Bool, (ssreflect_eq : (A, Bool) -> Bool)(v, P) == P")))
}

///|
let ssreflect_eq_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ssreflect_eq_def")

///|
/// `Ssreflect.ssreflect_eq_def`
pub fn ssreflect_eq_def() -> @kernel.Thm {
  ssreflect_eq_def_c.get()
}

///|
/// `gen_variables`
pub fn gen_variables(x1 : @list.List[String], x2 : @kernel.Term) -> @kernel.Term raise {
  let binders = x1
  let tm = x2
  if (@kernel.type_of(tm) != @kernel.bool_ty) {
    if (Int::to_int64(@lib.length(binders)) == 0L) {
      tm
    } else {
      raise Failure("gen_variables: bool term is required")
    }
  } else {
    let f_vars = @lib.map(@kernel.dest_var, @kernel.frees(tm))
    let find_type : (String) -> @kernel.HolType raise = fn(x3 : String) -> @kernel.HolType raise {
      let name = x3
      @lib.assoc(name, f_vars)
    }
    let gen_variable : (String) -> ((@kernel.Term) -> @kernel.Term raise) raise = fn(x4 : String) -> ((@kernel.Term) -> @kernel.Term raise) raise {
      let var_name = x4
      fn(x5 : @kernel.Term) -> @kernel.Term raise {
        let tm_1 = x5
        let var_ = try {
          @kernel.mk_var(var_name, find_type(var_name))
        } catch {
          Failure(_) => raise Failure(("gen_variables: variable " + (var_name + (" is not free in the term " + @printer.string_of_term(tm_1)))))
          e => raise e
        }
        @bool.mk_forall(var_, tm_1)
      }
    }
    @lib.itlist(fn(x6 : String, x7 : @kernel.Term) -> @kernel.Term raise {
      let s8 = gen_variable(x6)
      s8(x7)
    }, binders, tm)
  }
}

///|
/// `arg_type`
pub(all) enum ArgType {
  Arg_theorem(@kernel.Thm)
  Arg_term(@kernel.Term)
  Arg_type(@kernel.HolType)
} derive(Eq, Debug)

///|
pub extend ArgType with Eq::{not_equal, equal}

///|
pub extend ArgType with Debug::{to_repr}

///|
pub extend ArgType with @lib.OCompare::{ocompare}

///|
pub extend ArgType with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_ArgType(x : ArgType) -> Int {
  match x {
    Arg_theorem(_) => 1000000
    Arg_term(_) => 1000001
    Arg_type(_) => 1000002
  }
}

///|
pub impl @lib.OCompare for ArgType with fn ocompare(self, other) {
  match (self, other) {
    (Arg_theorem(a0), Arg_theorem(b0)) => {
      
      @lib.compare(a0, b0)
    }
    (Arg_term(a0), Arg_term(b0)) => {
      
      @lib.compare(a0, b0)
    }
    (Arg_type(a0), Arg_type(b0)) => {
      
      @lib.compare(a0, b0)
    }
    _ => ocaml_rank_ArgType(self).compare(ocaml_rank_ArgType(other))
  }
}

///|
pub impl @lib.OHash for ArgType with fn ohash_visit(self, h) {
  match self {
    Arg_theorem(a0) => {
      h.block(0, 1)
      h.field(a0)
    }
    Arg_term(a0) => {
      h.block(1, 1)
      h.field(a0)
    }
    Arg_type(a0) => {
      h.block(2, 1)
      h.field(a0)
    }
  }
}

///|
/// `get_arg_thm`
pub fn get_arg_thm(x9 : ArgType) -> @kernel.Thm raise {
  let arg = x9
  match arg {
    ArgType::Arg_theorem(th) => th
    _ => raise Failure("A theorem expected")
  }
}

///|
/// `get_arg_term`
pub fn get_arg_term(x10 : ArgType) -> @kernel.Term raise {
  let arg = x10
  match arg {
    ArgType::Arg_term(tm) => tm
    _ => raise Failure("A term expected")
  }
}

///|
/// `get_arg_type`
pub fn get_arg_type(x11 : ArgType) -> @kernel.HolType raise {
  let arg = x11
  match arg {
    ArgType::Arg_type(ty) => ty
    _ => raise Failure("A type expected")
  }
}

///|
/// `thm_tac`
pub fn thm_tac(x12 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> ((ArgType) -> @tactics.Tactic raise) raise {
  let _ as ttac = x12
  fn(x14 : ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    ttac(get_arg_thm(x14))
  }
}

///|
/// `term_tac`
pub fn term_tac(x15 : (@kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> ((ArgType) -> @tactics.Tactic raise) raise {
  let _ as ttac = x15
  fn(x17 : ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    ttac(get_arg_term(x17))
  }
}

///|
/// `type_tac`
pub fn[TA] type_tac(x18 : (@kernel.HolType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise, x19 : TA) -> ((ArgType) -> @tactics.Tactic raise) raise {
  let _ as ttac = x18
  let arg = x19
  fn(x21 : ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    ttac(get_arg_type(x21))
  }
}

///|
/// `conv_thm_tac`
pub fn conv_thm_tac(x22 : ((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise, x23 : (ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> @tactics.Tactic raise {
  let _ as ttac = x22
  let _ as arg_tac = x23
  ttac(fn(x25 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x25
    arg_tac(ArgType::Arg_theorem(th))
  })
}

///|
let thenl_first_c : @lib.Cell[(@tactics.Tactic) -> ((@tactics.Tactic) -> @tactics.Tactic raise) raise] = @lib.Cell::new("THENL_FIRST")

///|
/// `THENL_FIRST`
pub fn thenl_first(x : @tactics.Tactic) -> ((@tactics.Tactic) -> @tactics.Tactic raise) raise {
  (thenl_first_c.get())(x)
}

///|
let thenl_last_c : @lib.Cell[(@tactics.Tactic) -> ((@tactics.Tactic) -> @tactics.Tactic raise) raise] = @lib.Cell::new("THENL_LAST")

///|
/// `THENL_LAST`
pub fn thenl_last(x : @tactics.Tactic) -> ((@tactics.Tactic) -> @tactics.Tactic raise) raise {
  (thenl_last_c.get())(x)
}

///|
/// THENL_FIRST, THENL_LAST
fn step_2() -> Unit raise {
  fn seqapply(x38 : @list.List[((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise], x39 : @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)]) -> (((@list.List[@kernel.Term], @drule.Instantiation), @list.List[@tactics.Goal], (@drule.Instantiation) -> ((@list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise) raise)) raise {
    let l1 = x38
    let l2 = x39
    match (l1, l2) {
      (Empty, Empty) => (@tactics.null_meta, @list.List([]), fn(x40 : (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])) -> ((@list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise) raise {
        fn(x41 : @list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise {
          propagate_empty_l(x40, x41)
        }
      })
      (More(_ as tac, tail=tacs), More(_ as goal, tail=goals)) => {
        let ((mvs1, insts1), gls1, just1_1) = tac(goal)
        let goals_p = @lib.map((x42 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics.inst_goal(insts1, x42), goals)
        let ((mvs2, insts2), gls2, just2_1) = seqapply(tacs, goals_p)
        let t46 = Int::to_int64(@lib.length(gls1))
        let t43 = @tactics.compose_insts(insts1, insts2)
        ((@lib.union(mvs1, mvs2), t43), gls1.concat(gls2), fn(x49 : (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])) -> ((@list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise) raise {
          fn(x50 : @list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise {
            ((x47 : (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), x48 : @list.List[@kernel.Thm]) => compose_justs_l(t46, x44 => x45 => just1_1(x44, x45), just2_1, x47, x48))(x49, x50)
          }
        })
      }
      (_, _) => raise Failure("seqapply: Length mismatch")
    }
  }
  let tacsequence : (((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])) -> ((@list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> ((@list.List[((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise]) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])) -> ((@list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise = fn(x57 : ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])) -> ((@list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> ((@list.List[((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise]) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])) -> ((@list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
    let ((mvs1_1, insts1_1), gls1_1, just1_3) = x57
    fn(x58 : @list.List[((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise]) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])) -> ((@list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let tacl = x58
      let ((mvs2_1, insts2_2), gls2_1, just2_3) = seqapply(tacl, gls1_1)
      let jst : ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])) -> ((@list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = fn(x61 : (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])) -> ((@list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        fn(x62 : @list.List[@kernel.Thm]) -> @kernel.Thm raise {
          ((x59 : (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), x60 : @list.List[@kernel.Thm]) => justsequence_l(just1_3, just2_3, insts2_2, x59, x60))(x61, x62)
        }
      }
      let just : ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])) -> ((@list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = if @list.List::is_empty(gls2_1) {
        let t63 = jst(@tactics.null_inst)(@list.List([]))
        fn(x66 : (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])) -> ((@list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          fn(x67 : @list.List[@kernel.Thm]) -> @kernel.Thm raise {
            ((x64 : (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), x65 : @list.List[@kernel.Thm]) => propagate_thm_l(t63, x64, x65))(x66, x67)
          }
        }
      } else {
        jst
      }
      let t68 = @tactics.compose_insts(insts1_1, insts2_2)
      ((@lib.union(mvs1_1, mvs2_1), t68), gls2_1, just)
    }
  }
  let thenl_first : (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) -> ((((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise = fn(x69 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) -> ((((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
    let tac1 = x69
    fn(x70 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let tac2 = x70
      fn(x71 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        let g = x71
        let (_, gls, _) as gstate = tac1(g)
        if @list.List::is_empty(gls) {
          raise Failure("No subgoals")
        } else {
          let tac_list = @lib.replicate(@tactics.all_tac, @lib.int63_to_int(@lib.sub63(Int::to_int64(@lib.length(gls)), 1L))).prepend(tac2)
          let t74 = tacsequence((gstate.0, gstate.1, fn(x72 : (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])) -> ((@list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            fn(x73 : @list.List[@kernel.Thm]) -> @kernel.Thm raise {
              (gstate.2)(x72, x73)
            }
          }))(tac_list)
          (t74.0, t74.1, fn(x75 : (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), x76 : @list.List[@kernel.Thm]) -> @kernel.Thm raise {
            let s77 = (t74.2)(x75)
            s77(x76)
          })
        }
      }
    }
  }
  let thenl_last : (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) -> ((((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise = fn(x78 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) -> ((((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
    let tac1_1 = x78
    fn(x79 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let tac2_1 = x79
      fn(x80 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        let g_1 = x80
        let (_, gls_1, _) as gstate_1 = tac1_1(g_1)
        if @list.List::is_empty(gls_1) {
          raise Failure("No subgoals")
        } else {
          let tac_list_1 = @lib.replicate(@tactics.all_tac, @lib.int63_to_int(@lib.sub63(Int::to_int64(@lib.length(gls_1)), 1L))).concat(@list.List([tac2_1]))
          let t83 = tacsequence((gstate_1.0, gstate_1.1, fn(x81 : (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])) -> ((@list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            fn(x82 : @list.List[@kernel.Thm]) -> @kernel.Thm raise {
              (gstate_1.2)(x81, x82)
            }
          }))(tac_list_1)
          (t83.0, t83.1, fn(x84 : (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), x85 : @list.List[@kernel.Thm]) -> @kernel.Thm raise {
            let s86 = (t83.2)(x84)
            s86(x85)
          })
        }
      }
    }
  }
  let (thenl_first_1, thenl_last_1) = (thenl_first, thenl_last)
  thenl_first_c.set(thenl_first_1)
  thenl_last_c.set(thenl_last_1)
}

///|
fn[TA, TB, TC] propagate_empty_l(x27 : TC, x28 : @list.List[TB]) -> @list.List[TA] raise {
  let i = x27
  match x28 {
    Empty => @list.List([])
    _ => raise @lib.MatchFailure("tscript.ml:60")
  }
}

///|
fn[TD] propagate_thm_l(x29 : @kernel.Thm, x30 : (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), x31 : @list.List[TD]) -> @kernel.Thm raise {
  let th = x29
  let i_1 = x30
  match x31 {
    Empty => @drule.instantiate_all(i_1, th)
    _ => raise @lib.MatchFailure("tscript.ml:61")
  }
}

///|
fn[TE, TF, TG] compose_justs_l(x32 : Int64, x33 : (TG) -> ((@list.List[TF]) -> TE raise) raise, x34 : (TG) -> ((@list.List[TF]) -> @list.List[TE] raise) raise, x35 : TG, x36 : @list.List[TF]) -> @list.List[TE] raise {
  let n = x32
  let just1 = x33
  let just2 = x34
  let i_2 = x35
  let ths = x36
  let (ths1, ths2) = @lib.chop_list(@lib.int63_to_int(n), ths)
  let t37 = just2(i_2)(ths2)
  t37.prepend(just1(i_2)(ths1))
}

///|
fn[TM, TN, TO] justsequence_l(x51 : ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])) -> ((TO) -> TM raise) raise, x52 : ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])) -> ((TN) -> TO raise) raise, x53 : (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), x54 : (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), x55 : TN) -> TM raise {
  let just1_2 = x51
  let just2_2 = x52
  let insts2_1 = x53
  let i_3 = x54
  let ths_1 = x55
  let t56 = just2_2(i_3)(ths_1)
  just1_2(@tactics.compose_insts(insts2_1, i_3))(t56)
}

///|
/// `THENL_ROT`
pub fn thenl_rot(x87 : Int64, x88 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise, x89 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let n = x87
  let tac = x88
  let g = x89
  let gstate = tac(g)
  @tactics.rotate(n)(gstate)
}

///|
/// `repeat_tactic`
pub fn repeat_tactic(x90 : Int64, x91 : Int64, x92 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) -> @tactics.Tactic raise {
  let n = x90
  let m = x91
  let tac = x92
  fn replicate_at_most(x94 : Int64, x95 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) -> @tactics.Tactic raise {
    let m_1 = x94
    let tac_1 = x95
    if (m_1 <= 0L) {
      @tactics.all_tac
    } else {
      @tactics.orelse_tac(@tactics.then_tac(tac_1, replicate_at_most(@lib.sub63(m_1, 1L), tac_1)), @tactics.all_tac)
    }
  }
  let t97 = replicate_at_most(m, tac)
  @tactics.then_tac(@tactics.replicate_tac(@lib.int63_to_int(n), tac), t97)
}

///|
/// `get_context_vars`
pub fn get_context_vars(x98 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @list.List[(String, @kernel.Term)] raise {
  let _ as g = x98
  let (list, g_tm) = g
  let tms = @lib.map(fn(x101 : (String, @kernel.Thm)) -> @kernel.Term raise {
    (fn(x99 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x99)
    })((fn(x100 : (String, @kernel.Thm)) -> @kernel.Thm raise {
      x100.1
    })(x101))
  }, list).prepend(g_tm)
  let f_vars = @lib.setify(@lib.flat(@lib.map(fn(x102 : @kernel.Term) -> @list.List[@kernel.Term] raise {
    @kernel.frees(x102)
  }, tms)))
  @lib.map(fn(x103 : @kernel.Term) -> (String, @kernel.Term) raise {
    let v = x103
    ((fn(x104 : (String, @kernel.HolType)) -> String raise {
      x104.0
    })(@kernel.dest_var(v)), v)
  }, f_vars)
}

///|
/// `clear_assumption`
pub fn clear_assumption(x105 : String) -> @tactics.Tactic raise {
  let name = x105
  @tactics.try_tac(@tactics.remove_then(name, fn(x107 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x107
    @tactics.all_tac
  }))
}

///|
/// `move`
pub fn move_(x109 : @list.List[String]) -> ((@tactics.Goal) -> @tactics.Goalstate raise) raise {
  let labels = x109
  let move_eq : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = fn(x111 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    let _ as g = x111
    let g_tm = g.1
    let tac : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = try {
      let eq_tm = (fn(x113 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
        @kernel.rator((fn(x112 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
          x112.0
        })(x113))
      })(@basics.dest_imp(g_tm))
      if ((fn(x115 : @kernel.Term) -> String raise {
        (fn(x114 : (String, @kernel.HolType)) -> String raise {
          x114.0
        })(@kernel.dest_const(x115))
      })(@kernel.rator(eq_tm)) == "ssreflect_eq") {
        let label = (fn(x117 : @kernel.Term) -> String raise {
          (fn(x116 : (String, @kernel.HolType)) -> String raise {
            x116.0
          })(@kernel.dest_var(x117))
        })(@kernel.rand(eq_tm))
        let t122 = @simp.pure_once_rewrite_rule(@list.List([ssreflect_eq_def()]))
        @tactics.disch_then(fn(x123 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x119 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s120 = ((x118 : @kernel.Thm) => @tactics.label_tac(label, x118))(x119)
            fn(x121 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s120(x121)
            }
          })(t122(x123))
        })
      } else {
        @tactics.all_tac
      }
    } catch {
      Failure(_) => @tactics.all_tac
      e => raise e
    }
    tac(g)
  }
  let move1 : (String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise = fn(x124 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let name = x124
    fn(x125 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      let _ as g_1 = x125
      let g_tm_1 = g_1.1
      let tac_1 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = if @basics.is_forall(g_tm_1) {
        let (tm0, g_tm1) = @basics.dest_forall(g_tm_1)
        let tm = @kernel.mk_var(name, @kernel.type_of(tm0))
        if (name == "_") {
          @tactics.gen_tac
        } else {
          @tactics.x_gen_tac(tm)
        }
      } else {
        if @basics.is_imp(g_tm_1) {
          if (name == "_") {
            @tactics.disch_then(fn(x126 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
              let th = x126
              @tactics.all_tac
            })
          } else {
            @tactics.disch_then(fn(x129 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
              let s130 = ((x128 : @kernel.Thm) => @tactics.label_tac(name, x128))(x129)
              fn(x131 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
                s130(x131)
              }
            })
          }
        } else {
          raise Failure("move: not (forall) or (==>)")
        }
      }
      tac_1(g_1)
    }
  }
  fn(x132 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    let g_2 = x132
    let tac_3 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = @lib.itlist(fn(x133 : String, x134 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let name_1 = x133
      let tac_2 = x134
      @tactics.then_tac(@tactics.then_tac(move_eq, move1(name_1)), tac_2)
    }, labels, @tactics.all_tac)
    tac_3(g_2)
  }
}

///|
/// `in_tac`
pub fn in_tac(x136 : @list.List[String], x137 : Bool, x138 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise, x139 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let a_list = x136
  let in_goal = x137
  let tac = x138
  let _ as g = x139
  let goal_tm = g.1
  let tmp_goal_name = "$_goal_$"
  let tmp_goal_var = @kernel.mk_var(tmp_goal_name, @kernel.bool_ty)
  let tmp_goal = @basics.mk_eq(tmp_goal_var, goal_tm)
  let tmp_goal_sym = @basics.mk_eq(goal_tm, tmp_goal_var)
  let disch_tac : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = @lib.rev_itlist(fn(x140 : String, x141 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let name = x140
    let tac_1 = x141
    @tactics.then_tac(@tactics.remove_then(name, fn(x143 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s144 = @tactics.mp_tac(x143)
      fn(x145 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s144(x145)
      }
    }), tac_1)
  }, a_list, @tactics.all_tac)
  let intro_tac : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = move_(a_list)
  let (hide_goal, unfold_goal) = if in_goal {
    (@tactics.all_tac, @tactics.all_tac)
  } else {
    let t149 = @tactics.disch_then(fn(x147 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let th = x147
      @tactics.all_tac
    })
    let t146 = @tactics.undisch_tac(tmp_goal_sym)
    let t150 = @tactics.then_tac(@tactics.then_tac(@simp.expand_tac(tmp_goal_name), t146), t149)
    (@simp.abbrev_tac(tmp_goal), t150)
  }
  let t151 = @tactics.try_tac(intro_tac)
  @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(hide_goal, disch_tac), tac), t151), unfold_goal)(g)
}

///|
/// `match_subterm`
pub fn match_subterm(x152 : @list.List[@kernel.Term], x153 : @kernel.Term, x154 : @kernel.Term) -> String raise {
  let local_consts = x152
  let pat = x153
  let tm = x154
  fn find(x155 : @kernel.Term, x156 : String) -> String raise {
    let tm_1 = x155
    let path = x156
    try {
      let inst = @drule.term_match(local_consts, pat, tm_1)
      if (@drule.instantiate(inst, pat) == tm_1) {
        path
      } else {
        raise Failure("Bad instantiation")
      }
    } catch {
      x => {
        try {
          match tm_1 {
            @kernel.Term::Abs(_, b_tm) => find(b_tm, (path + "b"))
            @kernel.Term::Comb(l_tm, r_tm) => {
              try {
                find(l_tm, (path + "l"))
              } catch {
                Failure(_) => find(r_tm, (path + "r"))
                _ => raise Failure("match_subterm: no match")
              }
            }
            _ => raise @lib.MatchFailure("tscript.ml:200")
          }
        } catch {
          x_1 => raise Failure(("match_subterm: no match: " + @printer.string_of_term(pat)))
        }
      }
    }
  }
  find(tm, "")
}

///|
/// `find_all_paths`
pub fn find_all_paths(x157 : (@kernel.Term) -> Bool raise, x158 : @kernel.Term) -> @list.List[String] raise {
  let p = x157
  let tm = x158
  fn find_path(x159 : (@kernel.Term) -> Bool raise, x160 : @kernel.Term, x161 : String) -> @list.List[String] raise {
    let p_1 = x159
    let tm_1 = x160
    let path = x161
    let paths = match tm_1 {
      @kernel.Term::Abs(_, b_tm) => find_path(p_1, b_tm, (path + "b"))
      @kernel.Term::Comb(l_tm, r_tm) => {
        let t162 = find_path(p_1, r_tm, (path + "r"))
        find_path(p_1, l_tm, (path + "l")).concat(t162)
      }
      _ => @list.List([])
    }
    if p_1(tm_1) {
      paths.prepend(path)
    } else {
      paths
    }
  }
  find_path(p, tm, "")
}

///|
/// `inst_context_vars`
pub fn inst_context_vars(x163 : @list.List[(String, @kernel.Term)], x164 : @list.List[@kernel.Term], x165 : @kernel.Term) -> @kernel.Term raise {
  let vars = x163
  let tm_vars = x164
  let tm = x165
  let find_type : (@kernel.Term) -> (@kernel.HolType, @kernel.HolType) raise = fn(x166 : @kernel.Term) -> (@kernel.HolType, @kernel.HolType) raise {
    let var_ = x166
    let (name, ty) = @kernel.dest_var(var_)
    try {
      (ty, @kernel.type_of(@lib.assoc(name, vars)))
    } catch {
      Failure(_) => raise Failure((name + (" is free in the term `" + (@printer.string_of_term(tm) + "` and in the context"))))
      e => raise e
    }
  }
  let (ty_src, ty_dst) = @lib.unzip(@lib.map(find_type, tm_vars))
  let ty_inst = @lib.itlist2(@basics.type_match, ty_src, ty_dst, @list.List([]))
  @kernel.inst(ty_inst, tm)
}

///|
/// `inst_all_free_vars`
pub fn inst_all_free_vars(x167 : @kernel.Term, x168 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
  let tm = x167
  let _ as g = x168
  let context_vars = get_context_vars(g)
  let f_vars = @kernel.frees(tm)
  inst_context_vars(context_vars, f_vars, tm)
}

///|
/// `match_subterm_in_context`
pub fn match_subterm_in_context(x169 : @kernel.Term, x170 : @kernel.Term, x171 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> String raise {
  let pat = x169
  let tm = x170
  let _ as g = x171
  let context_vars = get_context_vars(g)
  let f0_vars = @lib.filter(fn(x172 : @kernel.Term) -> Bool raise {
    let tm_1 = x172
    (@lib.ocaml_string_get((fn(x173 : (String, @kernel.HolType)) -> String raise {
      x173.0
    })(@kernel.dest_var(tm_1)), 0) != '_')
  }, @kernel.frees(pat))
  let pattern = inst_context_vars(context_vars, f0_vars, pat)
  let f1_vars = @lib.filter(fn(x174 : @kernel.Term) -> Bool raise {
    let tm_2 = x174
    (@lib.ocaml_string_get((fn(x175 : (String, @kernel.HolType)) -> String raise {
      x175.0
    })(@kernel.dest_var(tm_2)), 0) != '_')
  }, @kernel.frees(pattern))
  match_subterm(f1_vars, pattern, tm)
}

///|
/// `break_conjuncts`
pub fn break_conjuncts(x176 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
  let th = x176
  let th0 = @simp.pure_rewrite_rule(@list.List([@equal.gsym(@theorems.right_forall_imp_thm()), @theorems.imp_imp()]))(th)
  let th1 = @bool.spec_all(th0)
  let th_list = @bool.conjuncts_rule(th1)
  if (Int::to_int64(@lib.length(th_list)) > 1L) {
    @lib.flat(@lib.map(break_conjuncts, th_list))
  } else {
    let th_tm = @kernel.concl(th1)
    if @basics.is_imp(th_tm) {
      let a_tm = @equal.lhand(th_tm)
      let th_list_1 = break_conjuncts(@bool.undisch(th1))
      @lib.map((x177 : @kernel.Thm) => @bool.disch(a_tm, x177), th_list_1)
    } else {
      if @basics.is_eq(th_tm) {
        @list.List([th1])
      } else {
        if @basics.is_neg(th_tm) {
          @list.List([@simp.pure_once_rewrite_rule(@list.List([@class.taut(@term_syntax.parse_term("!(P : Bool) == (P == false)"))]))(th1)])
        } else {
          @list.List([@bool.eqt_intro(th1)])
        }
      }
    }
  }
}

///|
/// `find_term_inst`
pub fn find_term_inst(x178 : @list.List[@kernel.Term], x179 : @kernel.Term, x180 : @kernel.Term, x181 : String) -> ((@drule.Instantiation, Bool, String)) raise {
  let local_consts = x178
  let tm = x179
  let src_tm = x180
  let path = x181
  try {
    (@drule.term_match(local_consts, tm, src_tm), true, path)
  } catch {
    Failure(_) => {
      match src_tm {
        @kernel.Term::Comb(l_tm, r_tm) => {
          let (r_inst, flag, s) = find_term_inst(local_consts, tm, l_tm, (path + "l"))
          if flag {
            (r_inst, flag, s)
          } else {
            find_term_inst(local_consts, tm, r_tm, (path + "r"))
          }
        }
        @kernel.Term::Abs(_, b_tm) => find_term_inst(local_consts, tm, b_tm, (path + "b"))
        _ => ((@list.List([]), @list.List([]), @list.List([])), false, path)
      }
    }
    e => raise e
  }
}

///|
/// `path_rewrite`
pub fn path_rewrite(x182 : String, x183 : @kernel.Thm, x184 : @kernel.Term) -> @kernel.Thm raise {
  let path = x182
  let th = x183
  let tm = x184
  fn build(x185 : String, x186 : @kernel.Term) -> @kernel.Thm raise {
    let path_1 = x185
    let tm_1 = x186
    let n = Int::to_int64(@lib.string_length(path_1))
    if (n == 0L) {
      th
    } else {
      let ch = @lib.ocaml_string_get(path_1, 0)
      let path_p = @lib.string_sub(path_1, 1, @lib.int63_to_int(@lib.sub63(n, 1L)))
      if (ch == 'l') {
        let (lhs, rhs) = @kernel.dest_comb(tm_1)
        let th0 = build(path_p, lhs)
        @equal.ap_thm(th0, rhs)
      } else {
        if (ch == 'r') {
          let (lhs_1, rhs_1) = @kernel.dest_comb(tm_1)
          let th0_1 = build(path_p, rhs_1)
          @equal.ap_term(lhs_1, th0_1)
        } else {
          if (ch == 'b') {
            let (var_, body) = @kernel.dest_abs(tm_1)
            let th0_2 = build(path_p, body)
            try {
              @kernel.abs_rule(var_, th0_2)
            } catch {
              Failure(_) => {
                let t187 = (", " + @printer.string_of_thm(th0_2))
                raise Failure(("ABS failed: (" + (@printer.string_of_term(var_) + t187)))
              }
              e => raise e
            }
          } else {
            raise Failure(("Bad path symbol: " + path_1))
          }
        }
      }
    }
  }
  let res = build(path, tm)
  let lhs_2 = @equal.lhand((fn(x188 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x188)
  })(res))
  if !@basics.aconv(lhs_2, tm) {
    let t189 = ("; obtained: " + @printer.string_of_term(lhs_2))
    raise Failure(("path_rewrite: incorrect result [required: " + (@printer.string_of_term(tm) + t189)))
  } else {
    res
  }
}

///|
/// `new_rewrite`
pub fn new_rewrite(x190 : @list.List[Int64], x191 : @list.List[@kernel.Term], x192 : @kernel.Thm, x193 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let occ = x190
  let pat = x191
  let th = x192
  let g = x193
  let goal_tm = g.1
  let local_consts = @kernel.frees(@kernel.concl(th))
  let goal_subterm_path = if @list.List::is_empty(pat) {
    ""
  } else {
    match_subterm_in_context(@lib.hd(pat), goal_tm, g)
  }
  let goal_subterm = @basics.follow_path(goal_subterm_path, goal_tm)
  let rewrite : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise = fn(x194 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x194
    let concl_th = @kernel.concl(th_1)
    let cond_flag = @basics.is_imp(concl_th)
    let t197 = if cond_flag {
      @kernel.rand
    } else {
      fn(x196 : @kernel.Term) -> @kernel.Term raise {
        x196
      }
    }
    let match_fun : (@kernel.Term) -> @kernel.Term raise = fn(x198 : @kernel.Term) -> @kernel.Term raise {
      @equal.lhs(t197(x198))
    }
    let lhs_tm = match_fun(concl_th)
    let (ii, flag, path) = find_term_inst(local_consts, lhs_tm, goal_subterm, goal_subterm_path)
    if !flag {
      raise Failure((@printer.string_of_term(lhs_tm) + " does not match any subterm in the goal"))
    } else {
      let matched_th = @drule.instantiate_rule(ii, th_1)
      let matched_tm = match_fun((fn(x199 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x199)
      })(matched_th))
      let paths = find_all_paths(fn(x200 : @kernel.Term) -> Bool raise {
        let x = x200
        @basics.aconv(x, matched_tm)
      }, goal_tm)
      let paths_1 = if @list.List::is_empty(occ) {
        paths
      } else {
        @lib.map(fn(x201 : Int64) -> String raise {
          let i = x201
          @lib.list_nth(paths, @lib.int63_to_int(@lib.sub63(i, 1L)))
        }, occ)
      }
      let tm_frees = @kernel.frees(matched_tm)
      let mth_frees = @kernel.frees(@kernel.concl(matched_th))
      let vars = @lib.subtract(mth_frees, @lib.union(local_consts, tm_frees))
      if @list.List::is_empty(vars) {
        let r_tac : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise = fn(x202 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let th_2 = x202
          @tactics.map_every(fn(x204 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let path_1 = x204
            @tactics.conv_tac((x206 : @kernel.Term) => path_rewrite(path_1, th_2, x206))
          }, paths_1)
        }
        if cond_flag {
          let t207 = @list.List([@tactics.all_tac, @tactics.disch_then(r_tac)])
          @tactics.thenl(@tactics.then_tac(@tactics.mp_tac(matched_th), @tactics.ants_tac), t207)
        } else {
          r_tac(matched_th)
        }
      } else {
        fn gen_vars(x208 : @list.List[@kernel.Term], x209 : @kernel.Thm) -> @kernel.Thm raise {
          let vars_1 = x208
          let th_3 = x209
          match vars_1 {
            More(v, tail=vs) => gen_vars(vs, @bool.gen(v, th_3))
            Empty => th_3
          }
        }
        let th2 = gen_vars(vars, matched_th)
        let t210 = @simp.pure_rewrite_tac(@list.List([@class.left_imp_forall_thm()]))
        @tactics.then_tac(@tactics.mp_tac(th2), t210)
      }
    }
  }
  let th_list = break_conjuncts(th)
  fn my_first(x211 : @list.List[@kernel.Thm]) -> @tactics.Goalstate raise {
    let th_list_1 = x211
    if (Int::to_int64(@lib.length(th_list_1)) == 1L) {
      rewrite(@lib.hd(th_list_1))(g)
    } else {
      try {
        rewrite(@lib.hd(th_list_1))(g)
      } catch {
        Failure(_) => my_first(@lib.tl(th_list_1))
        e => raise e
      }
    }
  }
  my_first(th_list)
}

///|
/// `rewrite`
pub fn rewrite(x212 : @list.List[Int64], x213 : @list.List[@kernel.Term], x214 : @kernel.Thm, x215 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let occ = x212
  let pat = x213
  let th = x214
  let g = x215
  fn match_theorem(x216 : (@kernel.Term) -> @kernel.Term raise, x217 : @kernel.Thm, x218 : @kernel.Term, x219 : String) -> ((@kernel.Thm, Bool, String)) raise {
    let ffun = x216
    let th_1 = x217
    let tm = x218
    let str = x219
    try {
      (@drule.part_match(ffun, th_1)(tm), true, str)
    } catch {
      Failure(_) => {
        match tm {
          @kernel.Term::Comb(l_tm, r_tm) => {
            let (r_th, flag, s) = match_theorem(ffun, th_1, l_tm, (str + "l"))
            if flag {
              (r_th, flag, s)
            } else {
              match_theorem(ffun, th_1, r_tm, (str + "r"))
            }
          }
          @kernel.Term::Abs(_, b_tm) => match_theorem(ffun, th_1, b_tm, (str + "b"))
          _ => (th_1, false, str)
        }
      }
      e => raise e
    }
  }
  let goal_tm = g.1
  let th0 = @simp.pure_rewrite_rule(@list.List([@theorems.imp_imp()]))(th)
  let concl_th = @kernel.concl(@bool.spec_all(th0))
  let cond_flag = @basics.is_imp(concl_th)
  let eq_tm = if cond_flag {
    @kernel.rand(concl_th)
  } else {
    concl_th
  }
  let t222 = if cond_flag {
    @kernel.rand
  } else {
    fn(x221 : @kernel.Term) -> @kernel.Term raise {
      x221
    }
  }
  let t223 = if @basics.is_eq(eq_tm) {
    @equal.lhand
  } else {
    fn(x220 : @kernel.Term) -> @kernel.Term raise {
      x220
    }
  }
  let match_fun : (@kernel.Term) -> @kernel.Term raise = fn(x224 : @kernel.Term) -> @kernel.Term raise {
    t223(t222(x224))
  }
  let goal_subterm_path = if @list.List::is_empty(pat) {
    ""
  } else {
    match_subterm_in_context(@lib.hd(pat), goal_tm, g)
  }
  let goal_subterm = @basics.follow_path(goal_subterm_path, goal_tm)
  let (matched_th, flag_1, path) = match_theorem(match_fun, th0, goal_subterm, goal_subterm_path)
  if !flag_1 {
    raise Failure("lhs does not match any term in the goal")
  } else {
    let matched_tm = match_fun((fn(x225 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x225)
    })(matched_th))
    let paths = find_all_paths(fn(x226 : @kernel.Term) -> Bool raise {
      let x = x226
      (x == matched_tm)
    }, goal_tm)
    let paths_1 = if @list.List::is_empty(occ) {
      paths
    } else {
      @lib.map(fn(x227 : Int64) -> String raise {
        let i = x227
        @lib.list_nth(paths, @lib.int63_to_int(@lib.sub63(i, 1L)))
      }, occ)
    }
    let tm_frees = @kernel.frees(matched_tm)
    let th_frees = @kernel.frees(@kernel.concl(th0))
    let mth_frees = @kernel.frees(@kernel.concl(matched_th))
    let vars = @lib.subtract(mth_frees, @lib.union(th_frees, tm_frees))
    if @list.List::is_empty(vars) {
      let r_tac : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise = fn(x228 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let th_2 = x228
        @tactics.map_every(fn(x230 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let path_1 = x230
          @simp.gen_rewrite_tac(fn(x233 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s234 = ((x232 : (@kernel.Term) -> @kernel.Thm raise) => @equal.path_conv(path_1, x232))(x233)
            fn(x235 : @kernel.Term) -> @kernel.Thm raise {
              s234(x235)
            }
          }, @list.List([th_2]))
        }, paths_1)
      }
      if cond_flag {
        let t236 = @list.List([@tactics.all_tac, @tactics.disch_then(r_tac)])
        @tactics.thenl(@tactics.then_tac(@tactics.mp_tac(matched_th), @tactics.ants_tac), t236)(g)
      } else {
        r_tac(matched_th)(g)
      }
    } else {
      fn gen_vars(x237 : @list.List[@kernel.Term], x238 : @kernel.Thm) -> @kernel.Thm raise {
        let vars_1 = x237
        let th_3 = x238
        match vars_1 {
          More(v, tail=vs) => gen_vars(vs, @bool.gen(v, th_3))
          Empty => th_3
        }
      }
      let th2 = gen_vars(vars, matched_th)
      let t239 = @simp.rewrite_tac(@list.List([@class.left_imp_forall_thm()]))
      @tactics.then_tac(@tactics.mp_tac(th2), t239)(g)
    }
  }
}

///|
/// done_tac
fn step_3() -> Unit raise {
  let t240 = @tactics.fail_tac("done: not all subgoals are proved")
  done_tac_c.set(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t240))
}

///|
let done_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("done_tac")

///|
/// `done_tac`
pub fn done_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (done_tac_c.get())(x)
}

///|
/// simp_tac
fn step_4() -> Unit raise {
  simp_tac_c.set(@simp.simp_tac(@list.List([])))
}

///|
let simp_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("simp_tac")

///|
/// `simp_tac`
pub fn simp_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (simp_tac_c.get())(x)
}

///|
/// arith_tac
fn step_5() -> Unit raise {
  arith_tac_c.set(@tactics.first(@list.List([@int.arith_tac, @calc_rat.real_arith_tac, @int.int_arith_tac])))
}

///|
let arith_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("arith_tac")

///|
/// `arith_tac`
pub fn arith_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (arith_tac_c.get())(x)
}

///|
/// split_tac
fn step_6() -> Unit raise {
  split_tac_c.set(@tactics.first(@list.List([@tactics.conj_tac, @tactics.eq_tac])))
}

///|
let split_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("split_tac")

///|
/// `split_tac`
pub fn split_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (split_tac_c.get())(x)
}

///|
/// `set_tac`
pub fn set_tac(x241 : String, x242 : @kernel.Term, x243 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let name = x241
  let tm = x242
  let _ as g = x243
  let goal_tm = g.1
  let tm0 = try {
    @basics.follow_path(match_subterm_in_context(tm, goal_tm, g), goal_tm)
  } catch {
    Failure(_) => tm
    e => raise e
  }
  let tm1 = inst_all_free_vars(tm0, g)
  let abbrev_tm = @basics.mk_eq(@kernel.mk_var(name, @kernel.type_of(tm1)), tm1)
  let t244 = (name + "_def")
  let t249 = @tactics.pop_assum(fn(x246 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s247 = ((x245 : @kernel.Thm) => @tactics.label_tac(t244, x245))(x246)
    fn(x248 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s247(x248)
    }
  })
  @tactics.then_tac(@simp.abbrev_tac(abbrev_tm), t249)(g)
}

///|
/// `generate_fresh_name`
pub fn generate_fresh_name(x250 : @list.List[String], x251 : @kernel.Term) -> String raise {
  let names = x250
  let tm = x251
  fn find_name(x252 : String, x253 : Int64) -> String raise {
    let prefix = x252
    let n = x253
    let name = (prefix + (if (n == 0L) {
      ""
    } else {
      Int64::to_string(n)
    }))
    if @lib.can((x255 : @list.List[String]) => @lib.find(fn(x254 : String) -> Bool raise {
      let str = x254
      (str == name)
    }, x255), names) {
      find_name(prefix, @lib.add63(n, 1L))
    } else {
      name
    }
  }
  let prefix_1 = if @kernel.is_var(tm) {
    (fn(x256 : (String, @kernel.HolType)) -> String raise {
      x256.0
    })(@kernel.dest_var(tm))
  } else {
    "x"
  }
  find_name(prefix_1, 0L)
}

///|
/// `get_fresh_var`
pub fn get_fresh_var(x257 : @kernel.Term, x258 : @list.List[@kernel.Term]) -> @kernel.Term raise {
  let var_ = x257
  let vars = x258
  let names = @lib.map(fn(x260 : @kernel.Term) -> String raise {
    (fn(x259 : (String, @kernel.HolType)) -> String raise {
      x259.0
    })(@kernel.dest_var(x260))
  }, vars)
  let t261 = @kernel.type_of(var_)
  @kernel.mk_var(generate_fresh_name(names, var_), t261)
}

///|
/// `prepare_term`
pub fn prepare_term(x262 : @kernel.Term, x263 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
  let tm = x262
  let _ as g = x263
  let goal_tm = g.1
  let tm0 = try {
    @basics.follow_path(match_subterm_in_context(tm, goal_tm, g), goal_tm)
  } catch {
    Failure(_) => tm
    e => raise e
  }
  inst_all_free_vars(tm0, g)
}

///|
/// `disch_tm_tac`
pub fn disch_tm_tac(x264 : @list.List[Int64], x265 : @kernel.Term, x266 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let occs = x264
  let tm = x265
  let _ as g = x266
  let tm0 = prepare_term(tm, g)
  let t269 = get_context_vars(g)
  let name = generate_fresh_name((fn(x267 : (@list.List[String], @list.List[@kernel.Term])) -> @list.List[String] raise {
    x267.0
  })((fn(x268 : @list.List[(String, @kernel.Term)]) -> (@list.List[String], @list.List[@kernel.Term]) raise {
    @lib.unzip(x268)
  })(t269)), tm)
  let new_tm = @kernel.mk_var(name, @kernel.type_of(tm0))
  let new_tm1 = if (@list.List::is_empty(occs) && @kernel.is_var(tm)) {
    let t271 = @kernel.type_of(tm0)
    @kernel.mk_var((fn(x270 : (String, @kernel.HolType)) -> String raise {
      x270.0
    })(@kernel.dest_var(tm)), t271)
  } else {
    new_tm
  }
  let abbrev_tm = @basics.mk_eq(new_tm, tm0)
  let t277 = @tactics.spec_tac(new_tm, new_tm1)
  let t276 = @tactics.pop_assum(fn(x273 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x273
    @tactics.try_tac((x275 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => new_rewrite(occs, @list.List([]), th, x275))
  })
  let t272 = @simp.expand_tac(name)
  @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.abbrev_tac(abbrev_tm), t272), t276), t277)(g)
}

///|
/// `disch_tac`
pub fn disch_tac(x278 : @list.List[Int64], x279 : ArgType) -> @tactics.Tactic raise {
  let occs = x278
  let arg = x279
  match arg {
    ArgType::Arg_theorem(th) => @tactics.mp_tac(th)
    ArgType::Arg_term(tm) => (x281 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => disch_tm_tac(occs, tm, x281)
    _ => raise Failure("disch_tac: a type cannot be discharged")
  }
}

///|
/// process_thm
fn step_7() -> Unit raise {
  let conj_imp = @class.taut(@term_syntax.parse_term("((A : Bool) && (B : Bool) → (C : Bool)) → A → B → C"))
  let dummy_tm = @term_syntax.parse_term("false")
  process_thm_c.set(fn(x282 : @list.List[@kernel.Term]) -> ((@kernel.Thm) -> (@list.List[(String, @kernel.Term)], @kernel.Thm) raise) raise {
    let local_consts = x282
    fn process(x284 : @kernel.Thm) -> ((@list.List[(String, @kernel.Term)], @kernel.Thm)) raise {
      let th = x284
      let ctm = @kernel.concl(th)
      if @basics.is_forall(ctm) {
        let (var_tm, _) = @basics.dest_forall(ctm)
        let var_ = get_fresh_var(var_tm, @basics.thm_frees(th).concat(local_consts))
        let th1 = @bool.spec(var_, th)
        let (list, th0) = process(th1)
        (list.prepend(("spec", var_)), th0)
      } else {
        if @basics.is_imp(ctm) {
          let (ant_tm, _) = @basics.dest_imp(ctm)
          if @basics.is_conj(ant_tm) {
            let th1_1 = @drule.match_mp(conj_imp)(th)
            let (list_1, th0_1) = process(th1_1)
            (list_1.prepend(("conj", dummy_tm)), th0_1)
          } else {
            let th1_2 = @bool.undisch(th)
            let (list_2, th0_2) = process(th1_2)
            (list_2.prepend(("undisch", ant_tm)), th0_2)
          }
        } else {
          (@list.List([]), th)
        }
      }
    }
    process
  })
}

///|
let process_thm_c : @lib.Cell[(@list.List[@kernel.Term]) -> ((@kernel.Thm) -> (@list.List[(String, @kernel.Term)], @kernel.Thm) raise) raise] = @lib.Cell::new("process_thm")

///|
/// `process_thm`
pub fn process_thm(x : @list.List[@kernel.Term]) -> ((@kernel.Thm) -> (@list.List[(String, @kernel.Term)], @kernel.Thm) raise) raise {
  (process_thm_c.get())(x)
}

///|
/// reconstruct_thm
fn step_8() -> Unit raise {
  let imp_conj = @class.taut(@term_syntax.parse_term("((A : Bool) → (B : Bool) → (C : Bool)) → A && B → C"))
  let triv_ths = @class.taut(@term_syntax.parse_term("(true → (A : Bool)) == A && (true && A) == A && (A && true) == A"))
  fn reconstruct(x285 : @list.List[(String, @kernel.Term)], x286 : @kernel.Thm) -> @kernel.Thm raise {
    let list = x285
    let th = x286
    match list {
      Empty => th
      More(cmd, tail=t) => {
        let th1 = match cmd {
          ("spec", _ as tm) => @bool.gen(tm, th)
          ("conj", _) => @drule.match_mp(imp_conj)(th)
          ("undisch", _ as tm_1) => @bool.disch(tm_1, th)
          _ => raise Failure(("Unknown command: " + cmd.0))
        }
        reconstruct(t, th1)
      }
    }
  }
  reconstruct_thm_c.set(fn(x287 : (@list.List[(String, @kernel.Term)], @kernel.Thm)) -> @kernel.Thm raise {
    let (cmd_list, th_1) = x287
    let th1_1 = reconstruct(@lib.rev(cmd_list), th_1)
    @simp.pure_rewrite_rule(@list.List([triv_ths]))(th1_1)
  })
}

///|
let reconstruct_thm_c : @lib.Cell[((@list.List[(String, @kernel.Term)], @kernel.Thm)) -> @kernel.Thm raise] = @lib.Cell::new("reconstruct_thm")

///|
/// `reconstruct_thm`
pub fn reconstruct_thm(x : (@list.List[(String, @kernel.Term)], @kernel.Thm)) -> @kernel.Thm raise {
  (reconstruct_thm_c.get())(x)
}

///|
/// `spec_var_th`
pub fn spec_var_th(x288 : @kernel.Thm, x289 : Int64, x290 : @kernel.Term) -> @kernel.Thm raise {
  let th = x288
  let n = x289
  let tm = x290
  let (cmd, th0) = process_thm(@kernel.frees(tm))(th)
  let ty = @kernel.type_of(tm)
  fn spec(x291 : Int64, x292 : @list.List[(String, @kernel.Term)], x293 : @list.List[(String, @kernel.Term)]) -> ((@list.List[(String, @kernel.Term)], @kernel.Thm)) raise {
    let n_1 = x291
    let list = x292
    let head = x293
    match list {
      More(("spec", _ as var_tm), tail=t) => {
        try {
          let ty_ii = @basics.type_match(@kernel.type_of(var_tm), ty, @list.List([]))
          if (n_1 <= 1L) {
            let th1 = reconstruct_thm((list, th0))
            let th2 = @bool.ispec(tm, th1)
            let (tail, th0_1) = process_thm(@list.List([]))(th2)
            let head1 = @lib.map(fn(x294 : (String, @kernel.Term)) -> (String, @kernel.Term) raise {
              let (s, tm_1) = x294
              (s, @kernel.inst(ty_ii, tm_1))
            }, head)
            (head1.concat(tail), th0_1)
          } else {
            let t295 = head.concat(@list.List([@lib.hd(list)]))
            spec(@lib.sub63(n_1, 1L), t, t295)
          }
        } catch {
          Failure(_) => spec(n_1, t, head.concat(@list.List([@lib.hd(list)])))
          e => raise e
        }
      }
      More(h, tail=t_1) => spec(n_1, t_1, head.concat(@list.List([h])))
      Empty => raise Failure("spec_var_th")
    }
  }
  reconstruct_thm(spec(n, cmd, @list.List([])))
}

///|
/// `match_mp_th`
pub fn match_mp_th(x296 : @kernel.Thm, x297 : Int64, x298 : @kernel.Thm) -> @kernel.Thm raise {
  let ith = x296
  let n = x297
  let th = x298
  let lconsts = @basics.thm_frees(ith)
  let (cmd, th0) = process_thm(@basics.thm_frees(th))(ith)
  let tm = @kernel.concl(th)
  fn rec_match(x299 : Int64, x300 : @list.List[(String, @kernel.Term)], x301 : @list.List[(String, @kernel.Term)]) -> ((@list.List[(String, @kernel.Term)], @kernel.Thm)) raise {
    let n_1 = x299
    let list = x300
    let head = x301
    match list {
      More(("undisch", _ as tm0), tail=t) => {
        try {
          let ii = @drule.term_match(lconsts, tm0, tm)
          if (n_1 <= 1L) {
            let th1 = @drule.instantiate_all(ii, th0)
            let th2 = @bool.prove_hyp(th, th1)
            let list0 = head.concat(t.prepend(("undisch", @term_syntax.parse_term("true"))))
            let f_vars = @kernel.frees(tm0)
            let list1 = @lib.filter(fn(x302 : (String, @kernel.Term)) -> Bool raise {
              let (s, tm_1) = x302
              !(((s == "spec") && @lib.mem(tm_1, f_vars)))
            }, list0)
            let list_1 = @lib.map(fn(x303 : (String, @kernel.Term)) -> (String, @kernel.Term) raise {
              let (s_1, tm_2) = x303
              (s_1, @drule.instantiate(ii, tm_2))
            }, list1)
            (list_1, th2)
          } else {
            let t304 = head.concat(@list.List([@lib.hd(list)]))
            rec_match(@lib.sub63(n_1, 1L), t, t304)
          }
        } catch {
          Failure(_) => rec_match(n_1, t, head.concat(@list.List([@lib.hd(list)])))
          e => raise e
        }
      }
      More(h, tail=t_1) => rec_match(n_1, t_1, head.concat(@list.List([h])))
      Empty => raise Failure("match_mp_th: no match")
    }
  }
  let r = rec_match(n, cmd, @list.List([]))
  reconstruct_thm(r)
}

///|
/// `have_gen_tac`
pub fn have_gen_tac(x305 : @list.List[String], x306 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise, x307 : @kernel.Term, x308 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let binders = x305
  let then_tac = x306
  let tm = x307
  let _ as g = x308
  let tm1 = gen_variables(binders, tm)
  let tm2 = prepare_term(tm1, g)
  let t311 = move_(binders)
  thenl_first(@tactics.subgoal_then(tm2, fn(x309 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x309
    @tactics.then_tac(@tactics.mp_tac(th), then_tac)
  }))(t311)(g)
}

///|
/// `have_tac`
pub fn have_tac(x312 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise, x313 : @kernel.Term, x314 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let then_tac = x312
  let tm = x313
  let _ as g = x314
  let tm0 = prepare_term(tm, g)
  @tactics.subgoal_then(tm0, fn(x315 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x315
    @tactics.then_tac(@tactics.mp_tac(th), then_tac)
  })(g)
}

///|
/// `wlog_tac`
pub fn wlog_tac(x317 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise, x318 : @list.List[@kernel.Term], x319 : @kernel.Term, x320 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let then_tac = x317
  let vars = x318
  let tm = x319
  let _ as g = x320
  let tm0 = prepare_term(tm, g)
  let vars0 = @lib.map(fn(x321 : @kernel.Term) -> @kernel.Term raise {
    let tm_1 = x321
    inst_all_free_vars(tm_1, g)
  }, vars)
  let g_tm = g.1
  let imp = @bool.list_mk_forall(vars0, @bool.mk_imp(tm0, g_tm))
  let t324 = @list.List([@tactics.replicate_tac(@lib.length(vars), @tactics.gen_tac), @tactics.all_tac])
  thenl_rot(1L, @tactics.thenl(@tactics.subgoal_then(imp, fn(x322 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x322
    @tactics.then_tac(@tactics.mp_tac(th), then_tac)
  }), t324), g)
}

///|
/// `exists_tac`
pub fn exists_tac(x325 : @kernel.Term, x326 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let tm = x325
  let _ as g = x326
  let tm0 = inst_all_free_vars(tm, g)
  let target_ty = (fn(x330 : @kernel.Term) -> @kernel.HolType raise {
    (fn(x329 : (@kernel.Term, @kernel.Term)) -> @kernel.HolType raise {
      (fn(x327 : @kernel.Term) -> @kernel.HolType raise {
        @kernel.type_of(x327)
      })((fn(x328 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
        x328.0
      })(x329))
    })(@basics.dest_exists(x330))
  })((fn(x331 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
    x331.1
  })(g))
  let inst_ty = @basics.type_match(@kernel.type_of(tm0), target_ty, @list.List([]))
  let tm1 = @kernel.inst(inst_ty, tm0)
  @tactics.exists_tac(tm1)(g)
}

///|
/// `inst_first_type`
pub fn inst_first_type(x332 : @kernel.Thm, x333 : @kernel.HolType) -> @kernel.Thm raise {
  let th = x332
  let ty = x333
  let ty_vars = @kernel.type_vars_in_term(@kernel.concl(th))
  if @list.List::is_empty(ty_vars) {
    raise Failure("inst_first_type: no type variables in the theorem")
  } else {
    @kernel.inst_type(@list.List([(ty, @lib.hd(ty_vars))]), th)
  }
}

///|
/// `combine_args`
pub fn combine_args(x334 : ArgType, x335 : ArgType) -> ArgType raise {
  let arg1 = x334
  let arg2 = x335
  let th1 = get_arg_thm(arg1)
  let th0 = match arg2 {
    ArgType::Arg_theorem(th2) => {
      try {
        @drule.match_mp(th1)(th2)
      } catch {
        Failure(_) => match_mp_th(th1, 1L, th2)
        e => raise e
      }
    }
    ArgType::Arg_term(tm2) => {
      try {
        @bool.ispec(tm2, th1)
      } catch {
        Failure(_) => spec_var_th(th1, 1L, tm2)
        e => raise e
      }
    }
    ArgType::Arg_type(ty2) => inst_first_type(th1, ty2)
  }
  ArgType::Arg_theorem(th0)
}

///|
/// use_arg_then_result
fn step_9() -> Unit raise {
  use_arg_then_result_c.set(Ref::{ val: @bool.truth() })
}

///|
let use_arg_then_result_c : @lib.Cell[Ref[@kernel.Thm]] = @lib.Cell::new("use_arg_then_result")

///|
/// `Ssreflect.use_arg_then_result`
pub fn use_arg_then_result() -> Ref[@kernel.Thm] {
  use_arg_then_result_c.get()
}

///|
/// `use_arg_then2`
pub fn use_arg_then2(x336 : (String, @list.List[@kernel.Thm]), x337 : (ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise, x338 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let (id, opt_thm) = x336
  let _ as arg_tac = x337
  let _ as g = x338
  let list = g.0
  let arg = try {
    let assumption = @lib.assoc(id, list)
    ArgType::Arg_theorem(assumption)
  } catch {
    Failure(_) => {
      try {
        let vars = get_context_vars(g)
        let var_ = @lib.assoc(id, vars)
        ArgType::Arg_term(var_)
      } catch {
        Failure(_) => {
          if !@list.List::is_empty(opt_thm) {
            ArgType::Arg_theorem(@lib.hd(opt_thm))
          } else {
            raise Failure(("Assumption is not found: " + id))
          }
        }
        e => raise e
      }
    }
    e => raise e
  }
  arg_tac(arg)(g)
}

///|
/// `combine_args_then`
pub fn combine_args_then(x339 : (ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise, x340 : ArgType, x341 : ArgType, x342 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let _ as tac = x339
  let arg1 = x340
  let arg2 = x341
  let _ as g = x342
  let th1 = get_arg_thm(arg1)
  let th0 = match arg2 {
    ArgType::Arg_theorem(th2) => {
      try {
        @drule.match_mp(th1)(th2)
      } catch {
        Failure(_) => match_mp_th(th1, 1L, th2)
        e => raise e
      }
    }
    ArgType::Arg_term(tm2) => {
      let tm0 = prepare_term(tm2, g)
      try {
        @bool.ispec(tm0, th1)
      } catch {
        Failure(_) => spec_var_th(th1, 1L, tm0)
        e => raise e
      }
    }
    ArgType::Arg_type(ty2) => inst_first_type(th1, ty2)
  }
  tac(ArgType::Arg_theorem(th0))(g)
}

///|
/// `ispec_then`
pub fn ispec_then(x343 : @kernel.Term, x344 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise, x345 : @kernel.Thm, x346 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let tm = x343
  let _ as tac = x344
  let th = x345
  let _ as g = x346
  let tm0 = prepare_term(tm, g)
  let th0 = try {
    @bool.ispec(tm0, th)
  } catch {
    Failure(_) => spec_var_th(th, 1L, tm0)
    e => raise e
  }
  tac(th0)(g)
}

///|
/// `ISPEC_THEN`
pub fn ispec_then_v1(x347 : @kernel.Term, x348 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise, x349 : @kernel.Thm, x350 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let tm = x347
  let _ as tac = x348
  let th = x349
  let _ as g = x350
  let tm0 = inst_all_free_vars(tm, g)
  tac(@bool.ispec(tm0, th))(g)
}

///|
/// `USE_THM_THEN`
pub fn use_thm_then(x351 : @kernel.Thm, x352 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> @tactics.Tactic raise {
  let th = x351
  let _ as tac = x352
  tac(th)
}

///|
/// `MATCH_MP_THEN`
pub fn match_mp_then(x354 : @kernel.Thm, x355 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise, x356 : @kernel.Thm) -> @tactics.Tactic raise {
  let th2 = x354
  let _ as tac = x355
  let th1 = x356
  tac(@drule.match_mp(th1)(th2))
}

///|
/// `match_mp_then`
pub fn match_mp_then_v1(x358 : @kernel.Thm, x359 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise, x360 : @kernel.Thm) -> @tactics.Tactic raise {
  let th2 = x358
  let _ as tac = x359
  let th1 = x360
  let th0 = try {
    @drule.match_mp(th1)(th2)
  } catch {
    Failure(_) => match_mp_th(th1, 1L, th2)
    e => raise e
  }
  tac(th0)
}

///|
/// `GSYM_THEN`
pub fn gsym_then(x362 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise, x363 : @kernel.Thm) -> @tactics.Tactic raise {
  let _ as tac = x362
  let th = x363
  tac(@equal.gsym(th))
}

///|
/// `gsym_then`
pub fn gsym_then_v1(x365 : (ArgType) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise, x366 : ArgType) -> @tactics.Tactic raise {
  let _ as tac = x365
  let arg = x366
  tac(ArgType::Arg_theorem(@equal.gsym(get_arg_thm(arg))))
}

///|
/// `apply_tac`
pub fn apply_tac(x368 : @kernel.Thm, x369 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let th = x368
  let g = x369
  fn try_match(x370 : @kernel.Thm) -> @tactics.Goalstate raise {
    let th_1 = x370
    try {
      @tactics.match_mp_tac(th_1)(g)
    } catch {
      Failure(_) => {
        let th0 = @simp.pure_once_rewrite_rule(@list.List([@theorems.imp_imp()]))(th_1)
        if (th_1 == th0) {
          raise Failure("apply_tac: no match")
        } else {
          try_match(th0)
        }
      }
      e => raise e
    }
  }
  try {
    @tactics.match_accept_tac(th)(g)
  } catch {
    Failure(_) => try_match(th)
    e => raise e
  }
}

///|
/// exact_tac
fn step_10() -> Unit raise {
  exact_tac_c.set(@tactics.first(@list.List([done_tac, @tactics.then_tac(@tactics.disch_then(fn(x371 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x371
    (x373 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => apply_tac(th, x373)
  }), done_tac)])))
}

///|
let exact_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("exact_tac")

///|
/// `exact_tac`
pub fn exact_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (exact_tac_c.get())(x)
}

///|
/// `spec0`
pub fn spec0(x374 : @list.List[String], x375 : @list.List[(String, @kernel.Term)]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
  let names = x374
  let vars = x375
  let find : (String) -> (@kernel.Term, Bool) raise = fn(x377 : String) -> (@kernel.Term, Bool) raise {
    let name = x377
    try {
      (@lib.assoc(name, vars), true)
    } catch {
      Failure(_) => (@term_syntax.parse_term(name), false)
      e => raise e
    }
  }
  let find_type : (@kernel.Term) -> (@kernel.HolType, @kernel.HolType) raise = fn(x378 : @kernel.Term) -> (@kernel.HolType, @kernel.HolType) raise {
    let var_ = x378
    let (name_1, ty) = @kernel.dest_var(var_)
    let (t, flag) = find(name_1)
    if flag {
      (ty, @kernel.type_of(t))
    } else {
      let t379 = @parser.parse_type("bool")
      (@parser.parse_type("bool"), t379)
    }
  }
  let inst_term : (@kernel.Term) -> @kernel.Term raise = fn(x380 : @kernel.Term) -> @kernel.Term raise {
    let tm = x380
    let (ty_src, ty_dst) = @lib.unzip(@lib.map(find_type, @kernel.frees(tm)))
    let ty_inst = @lib.itlist2(@basics.type_match, ty_src, ty_dst, @list.List([]))
    @kernel.inst(ty_inst, tm)
  }
  let list = @lib.map(find, names)
  let tm_list = @lib.map(fn(x381 : (@kernel.Term, Bool)) -> @kernel.Term raise {
    let (tm_1, flag_1) = x381
    if flag_1 {
      tm_1
    } else {
      inst_term(tm_1)
    }
  }, list)
  (x382 : @kernel.Thm) => @bool.ispecl(tm_list, x382)
}

///|
/// `spec`
pub fn spec(x383 : @list.List[String]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
  let names = x383
  spec0(names, get_context_vars(@tactics.top_realgoal()))
}

///|
/// `spec_mp`
pub fn spec_mp(x385 : @list.List[String], x386 : @kernel.Thm, x387 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let names = x385
  let th = x386
  let g = x387
  @tactics.mp_tac(spec0(names, get_context_vars(g))(th))(g)
}

///|
/// bool_cases
fn step_11() -> Unit raise {
  bool_cases_c.set(@simp.once_rewrite_rule(@list.List([@theorems.conj_aci()]))(@class.bool_induct()))
}

///|
let bool_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("bool_cases")

///|
/// `Ssreflect.bool_cases`
pub fn bool_cases() -> @kernel.Thm {
  bool_cases_c.get()
}

///|
/// list_cases
fn step_12() -> Unit raise {
  let t401 = @tactics.disch_then(fn(x399 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x399
    @simp.asm_rewrite_tac(@list.List([th]))
  })
  let t398 = @tactics.disch_then(@tactics.choose_then(fn(x395 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s396 = @tactics.mp_tac(x395)
    fn(x397 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s396(x397)
    }
  }))
  let t394 = @tactics.first_x_assum(@tactics.choose_then(fn(x391 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s392 = @tactics.mp_tac(x391)
    fn(x393 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s392(x393)
    }
  }))
  let t390 = @simp.asm_rewrite_tac(@list.List([]))
  let t389 = @tactics.disch_then(@tactics.disj_cases_tac)
  let t388 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(l : List[A])"), @lists.list_cases()))
  let t402 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t388), t389), t390), t394), t398), t401)
  list_cases_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (List[A]) -> Bool, P(NIL) && (∀ h : A, ∀ t : List[A], P(CONS(h, t))) → (∀ l : List[A], P(l))"), t402))
}

///|
let list_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("list_cases")

///|
/// `Ssreflect.list_cases`
pub fn list_cases() -> @kernel.Thm {
  list_cases_c.get()
}

///|
/// pair_cases
fn step_13() -> Unit raise {
  pair_cases_c.set(@pair.pair_induct())
}

///|
let pair_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pair_cases")

///|
/// `Ssreflect.pair_cases`
pub fn pair_cases() -> @kernel.Thm {
  pair_cases_c.get()
}

///|
/// num_cases
fn step_14() -> Unit raise {
  let t408 = @tactics.first_x_assum(@tactics.choose_then(fn(x406 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x406
    @simp.asm_rewrite_tac(@list.List([th]))
  }))
  let t405 = @simp.asm_rewrite_tac(@list.List([]))
  let t404 = @tactics.disch_then(@tactics.disj_cases_tac)
  let t403 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(m : Num)"), @nums.num_cases()))
  let t409 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t403), t404), t405), t408)
  num_cases_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (Num) -> Bool, P(0) && (∀ n : Num, P(SUC(n))) → (∀ m : Num, P(m))"), t409))
}

///|
let num_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("num_cases")

///|
/// `Ssreflect.num_cases`
pub fn num_cases() -> @kernel.Thm {
  num_cases_c.get()
}

///|
/// option_cases
fn step_15() -> Unit raise {
  option_cases_c.set(@ind_types.option_induct())
}

///|
let option_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("option_cases")

///|
/// `Ssreflect.option_cases`
pub fn option_cases() -> @kernel.Thm {
  option_cases_c.get()
}

///|
/// cases_table
fn step_16() -> Unit raise {
  cases_table_c.set(@lib.hashtbl_create(10))
}

///|
let cases_table_c : @lib.Cell[@lib.OHashtbl[String, @kernel.Thm]] = @lib.Cell::new("cases_table")

///|
/// `Ssreflect.cases_table`
pub fn cases_table() -> @lib.OHashtbl[String, @kernel.Thm] {
  cases_table_c.get()
}

///|
/// Formal_ineqs/lib/ssreflect/ssreflect.hl:893
fn step_17() -> Unit raise {
  @lib.hashtbl_add(cases_table(), "bool", bool_cases())
}

///|
/// Formal_ineqs/lib/ssreflect/ssreflect.hl:894
fn step_18() -> Unit raise {
  @lib.hashtbl_add(cases_table(), "list", list_cases())
}

///|
/// Formal_ineqs/lib/ssreflect/ssreflect.hl:895
fn step_19() -> Unit raise {
  @lib.hashtbl_add(cases_table(), "prod", pair_cases())
}

///|
/// Formal_ineqs/lib/ssreflect/ssreflect.hl:896
fn step_20() -> Unit raise {
  @lib.hashtbl_add(cases_table(), "num", num_cases())
}

///|
/// Formal_ineqs/lib/ssreflect/ssreflect.hl:897
fn step_21() -> Unit raise {
  @lib.hashtbl_add(cases_table(), "option", option_cases())
}

///|
/// bool_elim
fn step_22() -> Unit raise {
  bool_elim_c.set(bool_cases())
}

///|
let bool_elim_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("bool_elim")

///|
/// `Ssreflect.bool_elim`
pub fn bool_elim() -> @kernel.Thm {
  bool_elim_c.get()
}

///|
/// list_elim
fn step_23() -> Unit raise {
  list_elim_c.set(@ind_types.list_induct())
}

///|
let list_elim_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("list_elim")

///|
/// `Ssreflect.list_elim`
pub fn list_elim() -> @kernel.Thm {
  list_elim_c.get()
}

///|
/// pair_elim
fn step_24() -> Unit raise {
  pair_elim_c.set(@pair.pair_induct())
}

///|
let pair_elim_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pair_elim")

///|
/// `Ssreflect.pair_elim`
pub fn pair_elim() -> @kernel.Thm {
  pair_elim_c.get()
}

///|
/// num_elim
fn step_25() -> Unit raise {
  num_elim_c.set(@nums.num_induction())
}

///|
let num_elim_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("num_elim")

///|
/// `Ssreflect.num_elim`
pub fn num_elim() -> @kernel.Thm {
  num_elim_c.get()
}

///|
/// option_elim
fn step_26() -> Unit raise {
  option_elim_c.set(@ind_types.option_induct())
}

///|
let option_elim_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("option_elim")

///|
/// `Ssreflect.option_elim`
pub fn option_elim() -> @kernel.Thm {
  option_elim_c.get()
}

///|
/// elim_table
fn step_27() -> Unit raise {
  elim_table_c.set(@lib.hashtbl_create(10))
}

///|
let elim_table_c : @lib.Cell[@lib.OHashtbl[String, @kernel.Thm]] = @lib.Cell::new("elim_table")

///|
/// `Ssreflect.elim_table`
pub fn elim_table() -> @lib.OHashtbl[String, @kernel.Thm] {
  elim_table_c.get()
}

///|
/// Formal_ineqs/lib/ssreflect/ssreflect.hl:908
fn step_28() -> Unit raise {
  @lib.hashtbl_add(elim_table(), "bool", bool_elim())
}

///|
/// Formal_ineqs/lib/ssreflect/ssreflect.hl:909
fn step_29() -> Unit raise {
  @lib.hashtbl_add(elim_table(), "list", list_elim())
}

///|
/// Formal_ineqs/lib/ssreflect/ssreflect.hl:910
fn step_30() -> Unit raise {
  @lib.hashtbl_add(elim_table(), "prod", pair_elim())
}

///|
/// Formal_ineqs/lib/ssreflect/ssreflect.hl:911
fn step_31() -> Unit raise {
  @lib.hashtbl_add(elim_table(), "num", num_elim())
}

///|
/// Formal_ineqs/lib/ssreflect/ssreflect.hl:912
fn step_32() -> Unit raise {
  @lib.hashtbl_add(elim_table(), "option", option_elim())
}

///|
/// `case`
pub fn case(x410 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let _ as g = x410
  let goal_tm = g.1
  if !@basics.is_imp(goal_tm) {
    if @basics.is_forall(goal_tm) {
      let (var_, _) = @basics.dest_forall(goal_tm)
      let ty_name = (fn(x412 : @kernel.HolType) -> String raise {
        (fn(x411 : (String, @list.List[@kernel.HolType])) -> String raise {
          x411.0
        })(@kernel.dest_type(x412))
      })((fn(x413 : @kernel.Term) -> @kernel.HolType raise {
        @kernel.type_of(x413)
      })(var_))
      let case_th = @lib.hashtbl_find(cases_table(), ty_name)
      let t414 = @tactics.repeat_tac(@tactics.conj_tac)
      @tactics.then_tac(@tactics.match_mp_tac(case_th), t414)(g)
    } else {
      raise Failure("case: not imp or forall")
    }
  } else {
    let tm = @equal.lhand(goal_tm)
    if @basics.is_conj(tm) {
      let t424 = @tactics.pop_assum(fn(x421 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s422 = @tactics.mp_tac(x421)
        fn(x423 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s422(x423)
        }
      })
      @tactics.then_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x415 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s416 = @tactics.assume_tac(x415)
        fn(x417 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s416(x417)
        }
      }, fn(x418 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s419 = @tactics.mp_tac(x418)
        fn(x420 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s419(x420)
        }
      })), t424)(g)
    } else {
      if @basics.is_disj(tm) {
        let t428 = @tactics.pop_assum(fn(x425 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s426 = @tactics.mp_tac(x425)
          fn(x427 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s426(x427)
          }
        })
        @tactics.then_tac(@tactics.disch_then(@tactics.disj_cases_tac), t428)(g)
      } else {
        if @basics.is_exists(tm) {
          @simp.once_rewrite_tac(@list.List([@equal.gsym(@theorems.left_forall_imp_thm())]))(g)
        } else {
          raise Failure("case: not implemented")
        }
      }
    }
  }
}

///|
/// `elim`
pub fn elim(x429 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let _ as g = x429
  let goal_tm = g.1
  if @basics.is_forall(goal_tm) {
    let (var_, _) = @basics.dest_forall(goal_tm)
    let ty_name = (fn(x431 : @kernel.HolType) -> String raise {
      (fn(x430 : (String, @list.List[@kernel.HolType])) -> String raise {
        x430.0
      })(@kernel.dest_type(x431))
    })((fn(x432 : @kernel.Term) -> @kernel.HolType raise {
      @kernel.type_of(x432)
    })(var_))
    let induct_th = @lib.hashtbl_find(elim_table(), ty_name)
    let t433 = @tactics.repeat_tac(@tactics.conj_tac)
    @tactics.then_tac(@tactics.match_mp_tac(induct_th), t433)(g)
  } else {
    raise Failure("elim: not forall")
  }
}

///|
/// `INST_FIRST_TYPE_THEN`
pub fn inst_first_type_then(x434 : @kernel.HolType, x435 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise, x436 : @kernel.Thm) -> @tactics.Tactic raise {
  let ty = x434
  let _ as then_tac = x435
  let th = x436
  let ty_vars = @kernel.type_vars_in_term(@kernel.concl(th))
  if @list.List::is_empty(ty_vars) {
    raise Failure("inst_first_type: no type variables in the theorem")
  } else {
    then_tac(@kernel.inst_type(@list.List([(ty, @lib.hd(ty_vars))]), th))
  }
}

///|
/// `transform_pattern`
pub fn transform_pattern(x438 : @kernel.Term) -> @kernel.Term raise {
  let pat_tm = x438
  let names = Ref::{ val: @lib.map(fn(x440 : @kernel.Term) -> String raise {
    (fn(x439 : (String, @kernel.HolType)) -> String raise {
      x439.0
    })(@kernel.dest_var(x440))
  }, @kernel.frees(pat_tm)) }
  fn transform(x441 : @kernel.Term) -> @kernel.Term raise {
    let tm = x441
    match tm {
      @kernel.Term::Abs(x_tm, b_tm) => {
        let t443 = names.val
        let _ = {
          names.val = t443.prepend((fn(x442 : (String, @kernel.HolType)) -> String raise {
            x442.0
          })(@kernel.dest_var(x_tm)))
          ()
        }
        @kernel.mk_abs(x_tm, transform(b_tm))
      }
      @kernel.Term::Comb(l_tm, r_tm) => {
        let t444 = transform(r_tm)
        @kernel.mk_comb(transform(l_tm), t444)
      }
      @kernel.Term::Var("_", ty) => {
        let name = generate_fresh_name(names.val, tm)
        let _ = {
          names.val = (names.val).prepend(name)
          ()
        }
        @kernel.mk_var(name, ty)
      }
      _ => tm
    }
  }
  transform(pat_tm)
}

///|
/// `wild_frees`
pub fn wild_frees(x445 : @kernel.Term) -> @list.List[@kernel.Term] raise {
  let tm = x445
  @lib.filter(fn(x446 : @kernel.Term) -> Bool raise {
    let tm_1 = x446
    (@lib.ocaml_string_get((fn(x447 : (String, @kernel.HolType)) -> String raise {
      x447.0
    })(@kernel.dest_var(tm_1)), 0) == '_')
  }, @kernel.frees(tm))
}

///|
/// `nwild_frees`
pub fn nwild_frees(x448 : @kernel.Term) -> @list.List[@kernel.Term] raise {
  let tm = x448
  @lib.filter(fn(x449 : @kernel.Term) -> Bool raise {
    let tm_1 = x449
    (@lib.ocaml_string_get((fn(x450 : (String, @kernel.HolType)) -> String raise {
      x450.0
    })(@kernel.dest_var(tm_1)), 0) != '_')
  }, @kernel.frees(tm))
}

///|
/// `congr_tac`
pub fn congr_tac(x451 : @kernel.Term, x452 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let pat_tm = x451
  let goal = x452
  let goal_tm = goal.1
  let context_vars = get_context_vars(goal)
  let pat = transform_pattern(pat_tm)
  let f0_vars = nwild_frees(pat)
  let pattern = inst_context_vars(context_vars, f0_vars, pat)
  let const_pat = nwild_frees(pattern)
  let wild_pat = wild_frees(pattern)
  let (lhs, rhs) = @kernel.dest_eq(goal_tm)
  let t453 = @drule.term_match(const_pat, pattern, rhs)
  let (lm, rm) = (@drule.term_match(const_pat, pattern, lhs), t453)
  let eq_tms = @lib.map(fn(x454 : @kernel.Term) -> @kernel.Term raise {
    let tm = x454
    let t455 = @drule.instantiate(rm, tm)
    @basics.mk_eq(@drule.instantiate(lm, tm), t455)
  }, wild_pat)
  let eq_tm = @lib.itlist((x457 : @kernel.Term, x458 : @kernel.Term) => @lib.curry(fn(x456 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
    @bool.mk_imp(x456.0, x456.1)
  }, x457, x458), eq_tms, goal_tm)
  let eq_thm = @bool.eqt_elim(@simp.simp_conv(@list.List([]))(eq_tm))
  @tactics.then_tac((x459 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => apply_tac(eq_thm, x459), @tactics.repeat_tac(@tactics.conj_tac))(goal)
}

///|
/// elim_fst_ants_tac
fn step_33() -> Unit raise {
  let gen_elim_thm : (@kernel.Term) -> @kernel.Thm raise = fn(x460 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x460
    let (vars, tm1) = @basics.strip_forall(tm)
    let (ants_tm, concl_tm) = @basics.dest_imp(tm1)
    let th1 = @kernel.assume_rule(@lib.itlist((x462 : @kernel.Term, x463 : @kernel.Term) => @lib.curry(fn(x461 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
      @bool.mk_forall(x461.0, x461.1)
    }, x462, x463), vars, concl_tm))
    let th2 = @bool.disch(ants_tm, @bool.specl(vars, th1))
    @bool.disch_all(@lib.itlist(@bool.gen, vars, th2))
  }
  elim_fst_ants_tac_c.set(fn(x464 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    let _ as g = x464
    let goal_tm = g.1
    let elim_th = gen_elim_thm(goal_tm)
    @tactics.match_mp_tac(elim_th)(g)
  })
}

///|
let elim_fst_ants_tac_c : @lib.Cell[(@tactics.Goal) -> @tactics.Goalstate raise] = @lib.Cell::new("elim_fst_ants_tac")

///|
/// `elim_fst_ants_tac`
pub fn elim_fst_ants_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (elim_fst_ants_tac_c.get())(x)
}

///|
/// `process_fst_eq_tac`
pub fn process_fst_eq_tac(x465 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let _ as g = x465
  let (vars, g_tm) = @basics.strip_forall(g.1)
  let tac : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = try {
    let eq_tm = (fn(x467 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
      @kernel.rator((fn(x466 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
        x466.0
      })(x467))
    })(@basics.dest_imp(g_tm))
    let label = (fn(x469 : @kernel.Term) -> String raise {
      (fn(x468 : (String, @kernel.HolType)) -> String raise {
        x468.0
      })(@kernel.dest_var(x469))
    })(@kernel.rand(eq_tm))
    if ((fn(x471 : @kernel.Term) -> String raise {
      (fn(x470 : (String, @kernel.HolType)) -> String raise {
        x470.0
      })(@kernel.dest_const(x471))
    })(@kernel.rator(eq_tm)) == "ssreflect_eq") {
      if (Int::to_int64(@lib.length(vars)) == 0L) {
        let t476 = @simp.pure_once_rewrite_rule(@list.List([ssreflect_eq_def()]))
        @tactics.disch_then(fn(x477 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x473 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s474 = ((x472 : @kernel.Thm) => @tactics.label_tac(label, x472))(x473)
            fn(x475 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s474(x475)
            }
          })(t476(x477))
        })
      } else {
        elim_fst_ants_tac
      }
    } else {
      @tactics.all_tac
    }
  } catch {
    Failure(_) => @tactics.all_tac
    e => raise e
  }
  tac(g)
}

///|
/// `disch_tm_eq_tac`
pub fn disch_tm_eq_tac(x478 : String, x479 : @list.List[Int64], x480 : @kernel.Term, x481 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let eq_name = x478
  let occs = x479
  let tm = x480
  let _ as g = x481
  let tm0 = prepare_term(tm, g)
  let t484 = get_context_vars(g)
  let name = generate_fresh_name((fn(x482 : (@list.List[String], @list.List[@kernel.Term])) -> @list.List[String] raise {
    x482.0
  })((fn(x483 : @list.List[(String, @kernel.Term)]) -> (@list.List[String], @list.List[@kernel.Term]) raise {
    @lib.unzip(x483)
  })(t484)), tm)
  let eq_var = @kernel.mk_var(eq_name, @kernel.aty)
  let new_tm = @kernel.mk_var(name, @kernel.type_of(tm0))
  let abbrev_tm = @basics.mk_eq(new_tm, tm0)
  let t496 = @tactics.spec_tac(new_tm, new_tm)
  let t493 = @simp.pure_once_rewrite_rule(@list.List([@equal.gsym(@bool.spec(eq_var, ssreflect_eq_def()))]))
  let t495 = @tactics.pop_assum(fn(x494 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x490 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s491 = @tactics.mp_tac(x490)
      fn(x492 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s491(x492)
      }
    })(t493(x494))
  })
  let t489 = @tactics.first_assum(fn(x486 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x486
    @tactics.try_tac((x488 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => new_rewrite(occs, @list.List([]), th, x488))
  })
  let t485 = @simp.expand_tac(name)
  @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.abbrev_tac(abbrev_tm), t485), t489), t495), t496)(g)
}

///|
/// `disch_eq_tac`
pub fn disch_eq_tac(x497 : String, x498 : @list.List[Int64], x499 : ArgType) -> ((@tactics.Goal) -> @tactics.Goalstate raise) raise {
  let eq_name = x497
  let occs = x498
  let arg = x499
  let t501 = get_arg_term(arg)
  (x502 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => disch_tm_eq_tac(eq_name, occs, t501, x502)
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
}
