// Translated from upstream Boyer_Moore/equalities.ml; edit this file directly.

///|
/// `is_explicit_value_template`
pub fn is_explicit_value_template(x1 : @kernel.Term) -> Bool raise {
  let tm = x1
  fn is_explicit_value_template_p(x2 : @list.List[String], x3 : @kernel.Term) -> Bool raise {
    let constructors = x2
    let tm_1 = x3
    (@support.is_t(tm_1) || (@support.is_f(tm_1) || ((if @kernel.is_const(tm_1) {
      let t4 = @term_syntax.parse_type("Num")
      (@kernel.type_of(tm_1) == t4)
    } else {
      false
    }) || (@kernel.is_var(tm_1) || (if @nums.is_numeral(tm_1) {
      true
    } else {
      let (f, args) = @basics.strip_comb(tm_1)
      ((try {
        @lib.mem(@kernel.dest_const(f).0, constructors)
      } catch {
        Failure(_) => false
        e => raise e
      }) && @lib.forall((x5 : @kernel.Term) => is_explicit_value_template_p(constructors, x5), args))
    })))))
  }
  (!@kernel.is_var(tm) && is_explicit_value_template_p(@shells.all_constructors(()), tm))
}

///|
/// `subst_conv`
pub fn subst_conv(x6 : @kernel.Thm, x7 : @kernel.Term) -> @kernel.Thm raise {
  let th = x6
  let tm = x7
  @terms_and_clauses.subst_conv(@list.List([(th, @equal.lhs(@kernel.concl(th)))]), tm, tm)
}

///|
/// `use_equality_subst`
pub fn use_equality_subst(x8 : Bool, x9 : Bool, x10 : @kernel.Thm, x11 : @kernel.Term) -> @kernel.Thm raise {
  let right = x8
  let cross_fert = x9
  let th = x10
  let tm = x11
  try {
    if cross_fert {
      if @basics.is_eq(tm) {
        if right {
          @equal.rand_conv((x12 : @kernel.Term) => subst_conv(th, x12))(tm)
        } else {
          @equal.rator_conv(@equal.rand_conv((x13 : @kernel.Term) => subst_conv(th, x13)))(tm)
        }
      } else {
        if (@basics.is_neg(tm) && (try {
          @basics.is_eq(@kernel.rand(tm))
        } catch {
          Failure(_) => false
          e => raise e
        })) {
          subst_conv(th, tm)
        } else {
          subst_conv(th, tm)
        }
      }
    } else {
      subst_conv(th, tm)
    }
  } catch {
    Failure(_) => raise Failure("use_equality_subst")
    e => raise e
  }
}

///|
/// EQ_EQ_IMP_DISJ_EQ
fn step_1() -> Unit raise {
  let t14 = @simp.asm_rewrite_tac(@list.List([]))
  let t15 = @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t14)
  eq_eq_imp_disj_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Bool, ∀ x' : Bool, ∀ y : Bool, ∀ y' : Bool, x == x' && y == y' → (x || y) == (x' || y')"), t15))
}

///|
let eq_eq_imp_disj_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQ_EQ_IMP_DISJ_EQ")

///|
/// `EQ_EQ_IMP_DISJ_EQ`
pub fn eq_eq_imp_disj_eq() -> @kernel.Thm {
  eq_eq_imp_disj_eq_c.get()
}

///|
/// `DISJ_EQ`
pub fn disj_eq(x16 : @kernel.Thm, x17 : @kernel.Thm) -> @kernel.Thm raise {
  let th1 = x16
  let th2 = x17
  try {
    let (x, x_p) = @kernel.dest_eq(@kernel.concl(th1))
    let (y, y_p) = @kernel.dest_eq(@kernel.concl(th2))
    let t18 = @bool.conj(th1, th2)
    @bool.mp(@bool.specl(@list.List([x, x_p, y, y_p]), eq_eq_imp_disj_eq()), t18)
  } catch {
    Failure(_) => raise Failure("DISJ_EQ")
    e => raise e
  }
}

///|
/// `use_equality_heuristic`
pub fn use_equality_heuristic(x19 : @kernel.Term, x20 : Bool) -> ((@list.List[(@kernel.Term, Bool)], (@list.List[@kernel.Thm]) -> @kernel.Thm raise)) raise {
  let (tm, _ as ind) = (x19, x20)
  try {
    let checkx : ((@list.List[@kernel.Term], @list.List[@kernel.Term])) -> ((@kernel.Term) -> Bool raise) raise = fn(x21 : (@list.List[@kernel.Term], @list.List[@kernel.Term])) -> ((@kernel.Term) -> Bool raise) raise {
      let (tml1, tml2) = x21
      fn(x22 : @kernel.Term) -> Bool raise {
        let t_p = x22
        (!is_explicit_value_template(t_p) && (@lib.exists((x23 : @kernel.Term) => @definitions.is_subterm(t_p, x23), tml1) || @lib.exists((x24 : @kernel.Term) => @definitions.is_subterm(t_p, x24), tml2)))
      }
    }
    fn split_disjuncts(x25 : (@kernel.Term) -> @kernel.Term raise, x26 : @list.List[@kernel.Term], x27 : @list.List[@kernel.Term]) -> ((@list.List[@kernel.Term], @list.List[@kernel.Term])) raise {
      let side = x25
      let prevl = x26
      let tml = x27
      let t32 = @lib.hd(tml)
      let t28 = checkx((prevl, @lib.tl(tml)))
      if @lib.can(fn(x31 : @kernel.Term) -> @kernel.Term raise {
        (fn(x30 : @kernel.Term) -> @kernel.Term raise {
          ((x29 : @kernel.Term) => @lib.check(t28, x29))(side(x30))
        })(@basics.dest_neg(x31))
      }, t32) {
        (prevl, tml)
      } else {
        let t33 = @lib.tl(tml)
        split_disjuncts(side, prevl.prepend(@lib.hd(tml)), t33)
      }
    }
    let literals = @support.disj_list(tm)
    match (try {
      (true, @support.hashi(fn(x37 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
        @lib.rev(x37)
      }, split_disjuncts(@equal.rhs, @list.List([]), literals)))
    } catch {
      Failure(_) => (false, @support.hashi(fn(x38 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
        @lib.rev(x38)
      }, split_disjuncts(@equal.lhs, @list.List([]), literals)))
      e => raise e
    }) {
      (right, (overs, More(neq_p, tail=unders))) => {
        let side_2 : (@kernel.Term) -> @kernel.Term raise = if right {
          @equal.rhs
        } else {
          @equal.lhs
        }
        let flipth = if right {
          @equal.all_conv(neq_p)
        } else {
          @equal.rand_conv(@equal.sym_conv)(neq_p)
        }
        let neq = @equal.rhs(@kernel.concl(flipth))
        let eq = @basics.dest_neg(neq)
        let (s_p, t_p_1) = @kernel.dest_eq(eq)
        let delete = (ind && !@definitions.is_explicit_value(s_p))
        let cross_fert = (delete && (@lib.exists((x39 : @kernel.Term) => is_subterm_of_side_l(side_2, t_p_1, x39), overs) || @lib.exists((x40 : @kernel.Term) => is_subterm_of_side_l(side_2, t_p_1, x40), unders)))
        let sym_eq = @basics.mk_eq(t_p_1, s_p)
        let sym_neq = @bool.mk_neg(sym_eq)
        let t41 = @support.not_eq_sym(@kernel.assume_rule(sym_neq))
        let ass1 = @kernel.eq_mp(@equal.sym(flipth), t41)
        let ass2 = @kernel.assume_rule(sym_eq)
        let subsfun : (@kernel.Term) -> @kernel.Thm raise = (x42 : @kernel.Term) => use_equality_subst(right, cross_fert, ass2, x42)
        let overths = @lib.map(subsfun, overs)
        let neqth = if delete {
          let t44 = @bool.ispec(s_p, @terms_and_clauses.not_eq_f())
          @kernel.trans(@equal.rand_conv(@equal.rand_conv((x43 : @kernel.Term) => subst_conv(ass2, x43)))(neq), t44)
        } else {
          @bool.add_assum(sym_eq, @kernel.refl(neq))
        }
        let underths = @lib.map(subsfun, unders)
        let neqth_p = @kernel.trans(flipth, neqth)
        let th1 = @lib.itlist(@bool.disj2, overs, try {
          @bool.disj1(ass1, @bool.list_mk_disj(unders))
        } catch {
          Failure(_) => ass1
          e => raise e
        })
        let th2 = @lib.itlist(disj_eq, overths, @lib.end_itlist(disj_eq, underths.prepend(neqth_p)))
        let th3 = @bool.spec(sym_eq, @class.excluded_middle())
        let tm_p = @equal.rhs(@kernel.concl(th2))
        let proof : (@kernel.Thm) -> @kernel.Thm raise = fn(x45 : @kernel.Thm) -> @kernel.Thm raise {
          let th = x45
          @bool.disj_cases(th3, @kernel.eq_mp(@equal.sym(th2), th), th1)
        }
        @waterfall.proof_print_string_l("-> Use Equality Heuristic", ())
        (@list.List([(tm_p, ind)]), (x47 : @list.List[@kernel.Thm]) => @waterfall.apply_fproof("use_equality_heuristic", fn(x46 : @list.List[@kernel.Thm]) -> @kernel.Thm raise {
          proof(@lib.hd(x46))
        }, @list.List([tm_p]), x47))
      }
      _ => raise @lib.MatchFailure("tscript.ml:148")
    }
  } catch {
    Failure(_) => raise Failure("use_equality_heuristic`")
    e => raise e
  }
}

///|
fn[TA] is_subterm_of_side_l(x34 : (TA) -> @kernel.Term raise, x35 : @kernel.Term, x36 : TA) -> Bool raise {
  let side_1 = x34
  let subterm = x35
  let tm_1 = x36
  try {
    @definitions.is_subterm(subterm, side_1(tm_1))
  } catch {
    Failure(_) => false
    e => raise e
  }
}

///|
fn load_steps() -> Unit raise {
  step_1()
}
