// Translated from upstream Jordan/tactics_ext2.ml; edit this file directly.

///|
/// pthm
fn step_1() -> Unit raise {
  pthm_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("((x : A) => true)(select((x : A) => true))"), @list.List([@tactics.beta_tac])))
}

///|
let pthm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pthm")

///|
/// `pthm`
pub fn pthm() -> @kernel.Thm {
  pthm_c.get()
}

///|
/// `abbrev_type`
pub fn abbrev_type(x1 : @kernel.HolType, x2 : String) -> ((@kernel.Thm, @kernel.Thm)) raise {
  let ty = x1
  let s = x2
  let t3 = @kernel.inst_type(@list.List([(ty, @term_syntax.parse_type("A"))]), pthm())
  let t4 = ("dest_" + s)
  let (a, b) = @kernel.new_basic_type_definition(s, ("mk_" + s), t4, t3)
  let abst : (@kernel.Term) -> @kernel.Term raise = fn(x5 : @kernel.Term) -> @kernel.Term raise {
    let t = x5
    @bool.list_mk_forall(@kernel.frees(t), t)
  }
  let a_p = abst(@kernel.concl(a))
  let b_p = abst(@equal.rhs(@kernel.concl(b)))
  let t6 = @tactics_refine.prove_by_refinement(b_p, @list.List([@simp.rewrite_tac(@list.List([@equal.gsym(b)]))]))
  (@tactics_refine.prove_by_refinement(a_p, @list.List([@simp.rewrite_tac(@list.List([a]))])), t6)
}

///|
/// un
fn step_2() -> Unit raise {
  un_c.set(@simp.rewrite_rule(@list.List([@sets.in_()])))
}

///|
let un_c : @lib.Cell[(@kernel.Thm) -> @kernel.Thm raise] = @lib.Cell::new("un")

///|
/// `un`
pub fn un(x : @kernel.Thm) -> @kernel.Thm raise {
  (un_c.get())(x)
}

///|
/// SUBCONJ_TAC
fn step_3() -> Unit raise {
  subconj_tac_c.set(@tactics.then_tac(@tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(A : Bool) && (A → (B : Bool)) → A && B"))), @tactics.conj_tac))
}

///|
let subconj_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("SUBCONJ_TAC")

///|
/// `SUBCONJ_TAC`
pub fn subconj_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (subconj_tac_c.get())(x)
}

///|
/// PROOF_BY_CONTR_TAC
fn step_4() -> Unit raise {
  proof_by_contr_tac_c.set(@tactics.then_tac(@tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(!(A : Bool) → false) → A"))), @tactics.disch_tac))
}

///|
let proof_by_contr_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("PROOF_BY_CONTR_TAC")

///|
/// `PROOF_BY_CONTR_TAC`
pub fn proof_by_contr_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (proof_by_contr_tac_c.get())(x)
}

///|
/// `CLEAN_ASSUME_TAC`
pub fn clean_assume_tac(x7 : @kernel.Thm) -> @tactics.Tactic raise {
  let th = x7
  let t9 = @simp.asm_rewrite_tac(@list.List([]))
  @tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(th), t9), @tactics.disch_tac)
}

///|
/// `CLEAN_THEN`
pub fn clean_then(x10 : @kernel.Thm, x11 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> @tactics.Tactic raise {
  let th = x10
  let ttac = x11
  let t14 = @tactics.disch_then(ttac)
  let t13 = @simp.asm_rewrite_tac(@list.List([]))
  @tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(th), t13), t14)
}

///|
/// `UNDISCH_FIND_TAC`
pub fn undisch_find_tac(x15 : @kernel.Term, x16 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let tm = x15
  let (asl, w) = x16
  let p : (@kernel.Term) -> Bool raise = (x18 : @kernel.Term) => @lib.can((x17 : @kernel.Term) => @drule.term_match(@list.List([]), tm, x17), x18)
  try {
    let (sthm, _) = @lib.remove(fn(x19 : (String, @kernel.Thm)) -> Bool raise {
      let (_, asm_) = x19
      @lib.can((x20 : @kernel.Term) => @basics.find_term(p, x20), @kernel.concl(asm_))
    }, asl)
    @tactics.undisch_tac(@kernel.concl(sthm.1))((asl, w))
  } catch {
    Failure(_) => raise Failure("UNDISCH_FIND_TAC")
    e => raise e
  }
}

///|
/// `UNDISCH_FIND_THEN`
pub fn undisch_find_then(x21 : @kernel.Term, x22 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise, x23 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let tm = x21
  let ttac = x22
  let (asl, w) = x23
  let p : (@kernel.Term) -> Bool raise = (x25 : @kernel.Term) => @lib.can((x24 : @kernel.Term) => @drule.term_match(@list.List([]), tm, x24), x25)
  try {
    let (sthm, _) = @lib.remove(fn(x26 : (String, @kernel.Thm)) -> Bool raise {
      let (_, asm_) = x26
      @lib.can((x27 : @kernel.Term) => @basics.find_term(p, x27), @kernel.concl(asm_))
    }, asl)
    @tactics.undisch_then(@kernel.concl(sthm.1), ttac)((asl, w))
  } catch {
    Failure(_) => raise Failure("UNDISCH_FIND_TAC")
    e => raise e
  }
}

///|
/// `relabel_bound_conv`
pub fn relabel_bound_conv(x28 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x28
  fn vars_and_constants(x29 : @kernel.Term, x30 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
    let tm_1 = x29
    let acc = x30
    match tm_1 {
      @kernel.Term::Var(_, _) => acc.prepend(tm_1)
      @kernel.Term::Const(_, _) => acc.prepend(tm_1)
      @kernel.Term::Comb(a, b) => vars_and_constants(b, vars_and_constants(a, acc))
      @kernel.Term::Abs(a_1, b_1) => vars_and_constants(b_1, acc).prepend(a_1)
    }
  }
  let relabel_bound : (@kernel.Term) -> @kernel.Term raise = fn(x31 : @kernel.Term) -> @kernel.Term raise {
    let tm_2 = x31
    match tm_2 {
      @kernel.Term::Abs(x, t) => {
        let avoids = @lib.filter(fn(x32 : @kernel.Term) -> Bool raise {
          (x != x32)
        }, vars_and_constants(tm_2, @list.List([])))
        let x_p = @equal.mk_primed_var(avoids, x)
        if (x == x_p) {
          raise Failure("relabel_bound")
        } else {
          @basics.alpha(x_p, tm_2)
        }
      }
      _ => raise Failure("relabel_bound")
    }
  }
  @equal.depth_conv(fn(x33 : @kernel.Term) -> @kernel.Thm raise {
    let t_1 = x33
    @equal.alpha_rule(t_1, relabel_bound(t_1))
  })(tm)
}

///|
/// Jordan/tactics_ext2.ml:93
fn step_5() -> Unit raise {
  let t34 = @term_syntax.parse_term("(x : Num) + 1 == 2")
  let bad_term = @kernel.mk_abs(@term_syntax.parse_term("(x : Bool)"), t34)
  ignore(relabel_bound_conv(bad_term))
}

///|
/// NAME_CONFLICT_CONV
fn step_6() -> Unit raise {
  name_conflict_conv_c.set(relabel_bound_conv)
}

///|
let name_conflict_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("NAME_CONFLICT_CONV")

///|
/// `NAME_CONFLICT_CONV`
pub fn name_conflict_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (name_conflict_conv_c.get())(x)
}

///|
/// NAME_CONFLICT_TAC
fn step_7() -> Unit raise {
  name_conflict_tac_c.set(@tactics.conv_tac(relabel_bound_conv))
}

///|
let name_conflict_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("NAME_CONFLICT_TAC")

///|
/// `NAME_CONFLICT_TAC`
pub fn name_conflict_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (name_conflict_tac_c.get())(x)
}

///|
/// `alpha_conv`
pub fn alpha_conv(x35 : @list.List[(String, String)], x36 : @kernel.Term) -> @kernel.Thm raise {
  let env = x35
  let tm = x36
  @equal.alpha_rule(tm, @drule.deep_alpha(env, tm))
}

///|
/// unify_alpha_tac
fn step_8() -> Unit raise {
  unify_alpha_tac_c.set(fn(x41 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x37 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s38 = @tactics.subst_all_tac(x37)
      fn(x39 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s38(x39)
      }
    })((fn(x40 : @kernel.Term) -> @kernel.Thm raise {
      @kernel.refl(x40)
    })(x41))
  })
}

///|
let unify_alpha_tac_c : @lib.Cell[(@kernel.Term) -> @tactics.Tactic raise] = @lib.Cell::new("unify_alpha_tac")

///|
/// `unify_alpha_tac`
pub fn unify_alpha_tac(x : @kernel.Term) -> @tactics.Tactic raise {
  (unify_alpha_tac_c.get())(x)
}

///|
/// `get_abs`
pub fn get_abs(x42 : @kernel.Term, x43 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
  let tm = x42
  let acc = x43
  match tm {
    @kernel.Term::Abs(u, v) => get_abs(v, acc.prepend(tm))
    @kernel.Term::Comb(u_1, v_1) => get_abs(u_1, get_abs(v_1, acc))
    _ => acc
  }
}

///|
/// `alpha_tac`
pub fn alpha_tac(x44 : @list.List[(String, @kernel.Thm)], x45 : @kernel.Term) -> @tactics.Goalstate raise {
  let (asl, w_p) = (x44, x45)
  @tactics.every(@lib.map(unify_alpha_tac, get_abs(w_p, @list.List([]))))((asl, w_p))
}

///|
/// `select_thm`
pub fn select_thm(x46 : @kernel.Term, x47 : @kernel.Term) -> @kernel.Thm raise {
  let select_fn = x46
  let select_exist = x47
  @equal.beta_rule(@bool.ispecl(@list.List([select_fn, select_exist]), @class.select_ax()))
}

///|
/// Jordan/tactics_ext2.ml:132
fn step_9() -> Unit raise {
  let t48 = @term_syntax.parse_term("(n : Num)")
  ignore(select_thm(@term_syntax.parse_term("(m : Num) => (X : (Num) -> Bool)(m) && (∀ n : Num, X(n) → m <= n)"), t48))
}

///|
/// SELECT_EXIST
fn step_10() -> Unit raise {
  let t52 = @meson.asm_meson_tac(@list.List([]))
  let t51 = @term_syntax.parse_term("(y : A)")
  let t53 = @tactics.assume_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(P : (A) -> Bool)"), t51]), @class.select_ax()))
  let t54 = @tactics.disch_then(@tactics.choose_tac)
  let t49 = @term_syntax.parse_term("(op_q : ((_) -> Bool) -> Bool)")
  let t55 = @list.List([@tactics.repeat_tac(@tactics.gen_tac), @tactics_ext.disch_all_tac, (x50 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => undisch_find_tac(t49, x50), t54, t53, t52])
  select_exist_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ P : (A) -> Bool, ∀ Q : (A) -> Bool, (∃ y : A, P(y)) && (∀ t : A, P(t) → Q(t)) → Q(select(P))"), t55))
}

///|
let select_exist_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SELECT_EXIST")

///|
/// `SELECT_EXIST`
pub fn select_exist() -> @kernel.Thm {
  select_exist_c.get()
}

///|
/// SELECT_THM
fn step_11() -> Unit raise {
  let t56 = @list.List([@meson.meson_tac(@list.List([select_exist()]))])
  select_thm_v1_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ P : (A) -> Bool, ∀ Q : (A) -> Bool, ((∃ y : A, P(y)) → (∀ t : A, P(t) → Q(t))) && (!(∃ y : A, P(y)) → (∀ t : A, Q(t))) → Q(select(P))"), t56))
}

///|
let select_thm_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SELECT_THM")

///|
/// `SELECT_THM`
pub fn select_thm_v1() -> @kernel.Thm {
  select_thm_v1_c.get()
}

///|
/// SELECT_TAC
fn step_12() -> Unit raise {
  let t57 = @meson.meson_tac(@list.List([]))
  let unbeta = @tactics_refine.prove(@term_syntax.parse_term("∀ P : (A) -> Bool, ∀ Q : (A) -> Bool, Q(select(P)) == ((t : A) => Q(t))(select(P))"), t57)
  let unbeta_tac : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = @tactics.conv_tac(@drule.higher_rewrite_conv(@list.List([unbeta]))(true))
  let t60 = @tactics.then_tac(@tactics.disch_tac, @tactics.gen_tac)
  let t61 = @list.List([@tactics.then_tac(@tactics.disch_then(fn(x58 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x58
    @tactics.all_tac
  }), @tactics.gen_tac), t60])
  select_tac_c.set(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(unbeta_tac, @tactics.match_mp_tac(select_thm_v1())), @tactics.beta_tac), @tactics.conj_tac), t61))
}

///|
let select_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("SELECT_TAC")

///|
/// `SELECT_TAC`
pub fn select_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (select_tac_c.get())(x)
}

///|
/// `type_set`
pub fn type_set(x62 : @list.List[(String, @kernel.Term)], x63 : (@list.List[@kernel.Term], @kernel.Term)) -> ((@list.List[@kernel.Term], @kernel.Term)) raise {
  let typinfo = x62
  let (acclist, utm) = x63
  match acclist {
    Empty => (acclist, utm)
    More(@kernel.Term::Var(s, _) as a, tail=rest) => {
      let a_p = @lib.assocd(s, typinfo, a)
      if (a == a_p) {
        type_set(typinfo, (rest, utm))
      } else {
        let t64 = @drule.term_match(@list.List([]), a, a_p)
        let inst : (@kernel.Term) -> @kernel.Term raise = (x65 : @kernel.Term) => @drule.instantiate(t64, x65)
        let t66 = inst(utm)
        type_set(typinfo, (@lib.map(inst, rest), t66))
      }
    }
    _ => raise Failure("type_set: variable expected")
  }
}

///|
/// `has_stv`
pub fn has_stv(x67 : @kernel.Term) -> Bool raise {
  let t = x67
  let typ = @kernel.type_vars_in_term(t)
  @lib.can((x69 : @list.List[@kernel.HolType]) => @lib.find(fn(x68 : @kernel.HolType) -> Bool raise {
    let ty = x68
    (@kernel.is_vartype(ty) && (@lib.ocaml_string_get(@kernel.dest_vartype(ty), 0) == '?'))
  }, x69), typ)
}

///|
/// `TYPE_THEN`
pub fn type_then(x70 : @kernel.Term, x71 : (@kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise, x72 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let t = x70
  let _ as tac = x71
  let (asl, w) = x72
  let avoids = @lib.itlist(fn(x80 : (String, @kernel.Thm), x81 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
    (fn(x78 : @kernel.Thm) -> ((@list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise) raise {
      (fn(x76 : @kernel.Term) -> ((@list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise) raise {
        (fn(x73 : @list.List[@kernel.Term]) -> ((@list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise) raise {
          fn(x74 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
            @lib.union(x73, x74)
          }
        })((fn(x75 : @kernel.Term) -> @list.List[@kernel.Term] raise {
          @kernel.frees(x75)
        })(x76))
      })((fn(x77 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x77)
      })(x78))
    })((fn(x79 : (String, @kernel.Thm)) -> @kernel.Thm raise {
      x79.1
    })(x80))(x81)
  }, asl, @kernel.frees(w))
  let strip : (@kernel.Term) -> (String, @kernel.Term) raise = fn(x82 : @kernel.Term) -> (String, @kernel.Term) raise {
    let t_1 = x82
    match t_1 {
      @kernel.Term::Var(s, _) => (s, t_1)
      _ => raise Failure("TYPE_THEN")
    }
  }
  let typinfo = @lib.map(strip, avoids)
  let t_p = type_set(typinfo, (@kernel.frees(t), t)).1
  @lib.warn(has_stv(t_p), "TYPE_THEN: unresolved type variables")
  tac(t_p)((asl, w))
}

///|
/// `TYPEL_THEN`
pub fn typel_then(x83 : @list.List[@kernel.Term], x84 : (@list.List[@kernel.Term]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise, x85 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let t = x83
  let _ as tac = x84
  let (asl, w) = x85
  let avoids = @lib.itlist(fn(x93 : (String, @kernel.Thm), x94 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
    (fn(x91 : @kernel.Thm) -> ((@list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise) raise {
      (fn(x89 : @kernel.Term) -> ((@list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise) raise {
        (fn(x86 : @list.List[@kernel.Term]) -> ((@list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise) raise {
          fn(x87 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
            @lib.union(x86, x87)
          }
        })((fn(x88 : @kernel.Term) -> @list.List[@kernel.Term] raise {
          @kernel.frees(x88)
        })(x89))
      })((fn(x90 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x90)
      })(x91))
    })((fn(x92 : (String, @kernel.Thm)) -> @kernel.Thm raise {
      x92.1
    })(x93))(x94)
  }, asl, @kernel.frees(w))
  let strip : (@kernel.Term) -> (String, @kernel.Term) raise = fn(x95 : @kernel.Term) -> (String, @kernel.Term) raise {
    let t_1 = x95
    match t_1 {
      @kernel.Term::Var(s, _) => (s, t_1)
      _ => raise Failure("TYPE_THEN")
    }
  }
  let typinfo = @lib.map(strip, avoids)
  let t_p = @lib.map(fn(x96 : @kernel.Term) -> @kernel.Term raise {
    let u = x96
    type_set(typinfo, (@kernel.frees(u), u)).1
  }, t)
  @lib.warn(@lib.can((x97 : @list.List[@kernel.Term]) => @lib.find(has_stv, x97), t_p), "TYPEL_THEN: unresolved type vars")
  tac(t_p)((asl, w))
}

///|
/// Jordan/tactics_ext2.ml:242
fn step_13() -> Unit raise {
  let t102 = @meson.meson_tac(@list.List([]))
  let t103 = @tactics.undisch_tac(@term_syntax.parse_term("(y : Num) == y"))
  let t100 = @term_syntax.parse_term("(y : A)")
  ignore(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ y : Num, y == y"), @list.List([@tactics.gen_tac, (x101 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => type_then(t100, fn(x98 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x98
    @tactics.assume_tac(@bool.ispec(t, @class.taut(@term_syntax.parse_term("∀ x : B, x == x"))))
  }, x101), t103, t102])))
}

///|
let save_goal_c : @lib.Cell[(String) -> Unit raise] = @lib.Cell::new("save_goal")

///|
/// `save_goal`
pub fn save_goal(x : String) -> Unit raise {
  (save_goal_c.get())(x)
}

///|
let get_goal_c : @lib.Cell[(String) -> Unit raise] = @lib.Cell::new("get_goal")

///|
/// `get_goal`
pub fn get_goal(x : String) -> Unit raise {
  (get_goal_c.get())(x)
}

///|
/// save_goal, get_goal
fn step_14() -> Unit raise {
  let goal_buffer = Ref::{ val: @list.List([]) }
  let save_goal : (String) -> Unit raise = fn(x104 : String) -> Unit raise {
    let s = x104
    let t105 = goal_buffer.val
    {
      goal_buffer.val = t105.prepend((s, @tactics.current_goalstack.val))
      ()
    }
  }
  let get_goal : (String) -> Unit raise = fn(x106 : String) -> Unit raise {
    let _ as s_1 = x106
    {
      @tactics.current_goalstack.val = @lib.assoc(s_1, goal_buffer.val)
      ()
    }
  }
  let (save_goal_1, get_goal_1) = (save_goal, get_goal)
  save_goal_c.set(save_goal_1)
  get_goal_c.set(get_goal_1)
}

///|
/// `net_of_thm_ord`
pub fn net_of_thm_ord(x107 : (@kernel.Term) -> ((@kernel.Term) -> Bool raise) raise, x108 : Bool, x109 : Bool, x110 : @kernel.Thm) -> ((@nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise) raise {
  let ord = x107
  let rep = x108
  let force = x109
  let th = x110
  let t = @kernel.concl(th)
  let lconsts = @kernel.freesl(@kernel.hyp(th))
  let matchable : (@kernel.Term) -> ((@kernel.Term) -> Bool raise) raise = fn(x118 : @kernel.Term) -> ((@kernel.Term) -> Bool raise) raise {
    (fn(x112 : (@kernel.Term) -> (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]) raise) -> ((@kernel.Term) -> Bool raise) raise {
      fn(x113 : @kernel.Term) -> Bool raise {
        @lib.can(x112, x113)
      }
    })((fn(x116 : @kernel.Term) -> ((@kernel.Term) -> (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]) raise) raise {
      fn(x117 : @kernel.Term) -> (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]) raise {
        ((x114 : @kernel.Term, x115 : @kernel.Term) => @drule.term_match(lconsts, x114, x115))(x116, x117)
      }
    })(x118))
  }
  try {
    let (l, r) = @kernel.dest_eq(t)
    if (rep && @basics.free_in(l, r)) {
      let th_p = @bool.eqt_intro(th)
      let t119 = (1L, @simp.rewr_conv(th_p))
      fn(x121 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
        (x120 => @simp.enter_gconv(lconsts, l, t119, x120))(x121)
      }
    } else {
      if (rep && (matchable(l)(r) && matchable(r)(l))) {
        let t125 = (1L, @simp.ordered_rewr_conv(fn(x122 : @kernel.Term, x123 : @kernel.Term) -> Bool raise {
          let s124 = ord(x122)
          s124(x123)
        }, th))
        fn(x127 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
          (x126 => @simp.enter_gconv(lconsts, l, t125, x126))(x127)
        }
      } else {
        if force {
          let t131 = (1L, @simp.ordered_rewr_conv(fn(x128 : @kernel.Term, x129 : @kernel.Term) -> Bool raise {
            let s130 = ord(x128)
            s130(x129)
          }, th))
          fn(x133 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
            (x132 => @simp.enter_gconv(lconsts, l, t131, x132))(x133)
          }
        } else {
          let t134 = (1L, @simp.rewr_conv(th))
          fn(x136 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
            (x135 => @simp.enter_gconv(lconsts, l, t134, x135))(x136)
          }
        }
      }
    }
  } catch {
    Failure(_) => {
      let (l_1, r_1) = @kernel.dest_eq(@kernel.rand(t))
      if (rep && @basics.free_in(l_1, r_1)) {
        let tm = @equal.lhand(t)
        let th_p_1 = @bool.disch(tm, @bool.eqt_intro(@bool.undisch(th)))
        let t137 = (3L, @simp.imp_rewr_conv(th_p_1))
        fn(x139 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
          (x138 => @simp.enter_gconv(lconsts, l_1, t137, x138))(x139)
        }
      } else {
        if (rep && (matchable(l_1)(r_1) && matchable(r_1)(l_1))) {
          let t143 = (3L, @simp.ordered_imp_rewr_conv(fn(x140 : @kernel.Term, x141 : @kernel.Term) -> Bool raise {
            let s142 = ord(x140)
            s142(x141)
          }, th))
          fn(x145 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
            (x144 => @simp.enter_gconv(lconsts, l_1, t143, x144))(x145)
          }
        } else {
          let t146 = (3L, @simp.imp_rewr_conv(th))
          fn(x148 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
            (x147 => @simp.enter_gconv(lconsts, l_1, t146, x147))(x148)
          }
        }
      }
    }
    e => raise e
  }
}

///|
/// `GENERAL_REWRITE_ORD_CONV`
pub fn general_rewrite_ord_conv(x149 : (@kernel.Term) -> ((@kernel.Term) -> Bool raise) raise, x150 : Bool, x151 : Bool, x152 : ((@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise, x153 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]], x154 : @list.List[@kernel.Thm]) -> @equal.Conv raise {
  let ord = x149
  let rep = x150
  let force = x151
  let _ as cnvl = x152
  let _ as builtin_net = x153
  let thl = x154
  let thl_canon = @lib.itlist((x156 : @kernel.Thm, x157 : @list.List[@kernel.Thm]) => @simp.mk_rewrites(false, x156, x157), thl, @list.List([]))
  let final_net = @lib.itlist(fn(x159 : @kernel.Thm, x160 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
    let s161 = ((x158 : @kernel.Thm) => net_of_thm_ord(ord, rep, force, x158))(x159)
    s161(x160)
  }, thl_canon, builtin_net)
  cnvl(@simp.rewrites_conv(final_net))
}

///|
/// `GEN_REWRITE_ORD_CONV`
pub fn gen_rewrite_ord_conv(x162 : (@kernel.Term) -> ((@kernel.Term) -> Bool raise) raise, x163 : Bool, x164 : ((@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise, x165 : @list.List[@kernel.Thm]) -> @equal.Conv raise {
  let ord = x162
  let force = x163
  let _ as cnvl = x164
  let thl = x165
  general_rewrite_ord_conv(ord, false, force, cnvl, @nets.empty_net(), thl)
}

///|
/// `PURE_REWRITE_ORD_CONV`
pub fn pure_rewrite_ord_conv(x167 : (@kernel.Term) -> ((@kernel.Term) -> Bool raise) raise, x168 : Bool, x169 : @list.List[@kernel.Thm]) -> @equal.Conv raise {
  let ord = x167
  let force = x168
  let thl = x169
  general_rewrite_ord_conv(ord, true, force, fn(x171 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s172 = @equal.top_depth_conv(x171)
    fn(x173 : @kernel.Term) -> @kernel.Thm raise {
      s172(x173)
    }
  }, @nets.empty_net(), thl)
}

///|
/// `REWRITE_ORD_CONV`
pub fn rewrite_ord_conv(x174 : (@kernel.Term) -> ((@kernel.Term) -> Bool raise) raise, x175 : Bool, x176 : @list.List[@kernel.Thm]) -> @equal.Conv raise {
  let ord = x174
  let force = x175
  let thl = x176
  general_rewrite_ord_conv(ord, true, force, fn(x178 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s179 = @equal.top_depth_conv(x178)
    fn(x180 : @kernel.Term) -> @kernel.Thm raise {
      s179(x180)
    }
  }, @simp.basic_net(), thl)
}

///|
/// `PURE_ONCE_REWRITE_ORD_CONV`
pub fn pure_once_rewrite_ord_conv(x181 : (@kernel.Term) -> ((@kernel.Term) -> Bool raise) raise, x182 : Bool, x183 : @list.List[@kernel.Thm]) -> @equal.Conv raise {
  let ord = x181
  let force = x182
  let thl = x183
  general_rewrite_ord_conv(ord, false, force, fn(x185 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s186 = @equal.once_depth_conv(x185)
    fn(x187 : @kernel.Term) -> @kernel.Thm raise {
      s186(x187)
    }
  }, @nets.empty_net(), thl)
}

///|
/// `ONCE_REWRITE_ORD_CONV`
pub fn once_rewrite_ord_conv(x188 : (@kernel.Term) -> ((@kernel.Term) -> Bool raise) raise, x189 : Bool, x190 : @list.List[@kernel.Thm]) -> @equal.Conv raise {
  let ord = x188
  let force = x189
  let thl = x190
  general_rewrite_ord_conv(ord, false, force, fn(x192 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s193 = @equal.once_depth_conv(x192)
    fn(x194 : @kernel.Term) -> @kernel.Thm raise {
      s193(x194)
    }
  }, @simp.basic_net(), thl)
}

///|
/// `REWRITE_ORD_TAC`
pub fn rewrite_ord_tac(x195 : (@kernel.Term) -> ((@kernel.Term) -> Bool raise) raise, x196 : Bool, x197 : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  let ord = x195
  let force = x196
  let thl = x197
  @tactics.conv_tac(rewrite_ord_conv(ord, force, thl))
}

///|
/// `new_factor_order`
pub fn new_factor_order(x199 : @kernel.Term, x200 : @kernel.Term) -> Bool raise {
  let t1 = x199
  let t2 = x200
  try {
    let t1v = @basics.dest_binop(@term_syntax.parse_term("real_mul"), t1).0
    let t2v = @basics.dest_binop(@term_syntax.parse_term("real_mul"), t2).0
    if (@kernel.is_var(t1v) && @kernel.is_var(t2v)) {
      @simp.term_order(t1v, t2v)
    } else {
      if @kernel.is_var(t2v) {
        true
      } else {
        false
      }
    }
  } catch {
    Failure(_) => false
    e => raise e
  }
}

///|
/// `is_arith_const`
pub fn is_arith_const(x201 : @kernel.Term) -> Bool raise {
  let tm = x201
  if @kernel.is_var(tm) {
    false
  } else {
    if @kernel.is_abs(tm) {
      false
    } else {
      if @kernel.is_comb(tm) {
        let (a, b) = @kernel.dest_comb(tm)
        (is_arith_const(a) && is_arith_const(b))
      } else {
        true
      }
    }
  }
}

///|
/// `new_factor_order2`
pub fn new_factor_order2(x202 : @kernel.Term, x203 : @kernel.Term) -> Bool raise {
  let t1 = x202
  let t2 = x203
  try {
    let t1v = @basics.dest_binop(@term_syntax.parse_term("real_mul"), t1).0
    let t2v = @basics.dest_binop(@term_syntax.parse_term("real_mul"), t2).0
    if (@kernel.is_var(t1v) && @kernel.is_var(t2v)) {
      @simp.term_order(t1v, t2v)
    } else {
      if is_arith_const(t2v) {
        true
      } else {
        false
      }
    }
  } catch {
    Failure(_) => false
    e => raise e
  }
}

///|
/// `mon_sz`
pub fn mon_sz(x204 : @kernel.Term) -> @num.Num raise {
  let tm = x204
  if @kernel.is_var(tm) {
    @num.num_of_int64(Int::to_int64(@lib.hash(tm)))
  } else {
    try {
      let (a, b) = @basics.dest_binop(@term_syntax.parse_term("real_mul"), tm)
      let t205 = mon_sz(b)
      @num.mult_num(mon_sz(a), t205)
    } catch {
      Failure(_) => @num.num_of_int64(1L)
      e => raise e
    }
  }
}

///|
/// `new_summand_order`
pub fn new_summand_order(x206 : @kernel.Term, x207 : @kernel.Term) -> Bool raise {
  let t1 = x206
  let t2 = x207
  try {
    let t1v = @basics.dest_binop(@term_syntax.parse_term("real_add"), t1).0
    let t2v = @basics.dest_binop(@term_syntax.parse_term("real_add"), t2).0
    let t208 = mon_sz(t1v)
    @num.gt_num(mon_sz(t2v), t208)
  } catch {
    Failure(_) => false
    e => raise e
  }
}

///|
/// `new_distrib_order`
pub fn[TA] new_distrib_order(x209 : TA, x210 : @kernel.Term) -> Bool raise {
  let t1 = x209
  let t2 = x210
  try {
    let t2v = @basics.dest_binop(@term_syntax.parse_term("real_mul"), t2).0
    if is_arith_const(t2v) {
      true
    } else {
      false
    }
  } catch {
    Failure(_) => {
      try {
        let t2_p = @basics.dest_binop(@term_syntax.parse_term("real_add"), t2).0
        new_distrib_order(t1, t2_p)
      } catch {
        Failure(_) => false
        e => raise e
      }
    }
    e => raise e
  }
}

///|
/// real_poly_conv
fn step_15() -> Unit raise {
  let t232 = @simp.rewrite_conv(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) * (x : Real) == real_of_num(0) && x + real_of_num(0) == x && real_of_num(0) + x == x"))]))
  let t231 = rewrite_ord_conv(fn(x229 : @kernel.Term) -> ((@kernel.Term) -> Bool raise) raise {
    fn(x230 : @kernel.Term) -> Bool raise {
      new_distrib_order(x229, x230)
    }
  }, true, @list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * (b : Real) + (d : Real) * b == (a + d) * b && a * b + b == (a + real_of_num(1)) * b && b + a * b == (a + real_of_num(1)) * b && a * b + (d * b + (e : Real)) == (a + d) * b + e && a * b + (b + e) == (a + real_of_num(1)) * b + e && b + (a * b + e) == (a + real_of_num(1)) * b + e"))]))
  let t228 = rewrite_ord_conv(fn(x226 : @kernel.Term) -> ((@kernel.Term) -> Bool raise) raise {
    fn(x227 : @kernel.Term) -> Bool raise {
      new_factor_order2(x226, x227)
    }
  }, false, @list.List([@real.real_mul_ac()]))
  let t225 = rewrite_ord_conv(fn(x223 : @kernel.Term) -> ((@kernel.Term) -> Bool raise) raise {
    fn(x224 : @kernel.Term) -> Bool raise {
      new_summand_order(x223, x224)
    }
  }, false, @list.List([@calc_int.real_add_ac()]))
  let t222 = @simp.rewrite_conv(@list.List([@equal.gsym(@realax.real_mul_assoc())]))
  let t221 = @simp.gen_rewrite_conv(fn(x218 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s219 = @equal.once_depth_conv(x218)
    fn(x220 : @kernel.Term) -> @kernel.Thm raise {
      s219(x220)
    }
  }, @list.List([@calc_rat.real_arith(@term_syntax.parse_term("-(x : Real) == x * -real_of_num(1)"))]))
  let t217 = rewrite_ord_conv(fn(x215 : @kernel.Term) -> ((@kernel.Term) -> Bool raise) raise {
    fn(x216 : @kernel.Term) -> Bool raise {
      new_factor_order(x215, x216)
    }
  }, false, @list.List([@real.real_mul_ac()]))
  let t211 = @calc_rat.real_arith(@term_syntax.parse_term("(x : Real) * -(y : Real) == -(x * y) && --x == x && -x * y == -(x * y)"))
  let t212 = @calc_rat.real_arith(@term_syntax.parse_term("(x : Real) - -(y : Real) == x + y && x - y == x + -y && -(x + y) == -x + -y && -(x - y) == -x + y"))
  let t213 = @equal.gsym(@realax.real_add_assoc())
  let t214 = @simp.rewrite_conv(@list.List([@realax.real_div(), @analysis.real_rdistrib(), @analysis.real_sub_rdistrib(), @analysis.pow(), @equal.gsym(@realax.real_mul_assoc()), t213, t212, t211, @analysis.real_sub_ldistrib(), @analysis.real_ldistrib()]))
  real_poly_conv_c.set(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@simp.once_rewrite_conv(@list.List([@equal.gsym(@analysis.real_sub_0())])), t214), t217), t221), t222), @calc_rat.real_rat_reduce_conv), t225), t228), t231), @calc_rat.real_rat_reduce_conv), t232))
}

///|
let real_poly_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("real_poly_conv")

///|
/// `real_poly_conv`
pub fn real_poly_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (real_poly_conv_c.get())(x)
}

///|
/// real_poly_tac
fn step_16() -> Unit raise {
  real_poly_tac_c.set(@tactics.conv_tac(real_poly_conv))
}

///|
let real_poly_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("real_poly_tac")

///|
/// `real_poly_tac`
pub fn real_poly_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (real_poly_tac_c.get())(x)
}

///|
/// test_real_poly_tac
fn step_17() -> Unit raise {
  test_real_poly_tac_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, (x + real_of_num(2) * y) * (x - real_of_num(2) * y) == x * x - real_of_num(4) * (y * y)"), @list.List([@tactics_ext.disch_all_tac, real_poly_tac])))
}

///|
let test_real_poly_tac_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("test_real_poly_tac")

///|
/// `test_real_poly_tac`
pub fn test_real_poly_tac() -> @kernel.Thm {
  test_real_poly_tac_c.get()
}

///|
/// strict_lemma
fn step_18() -> Unit raise {
  strict_lemma_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ A : Real, ∀ B : Real, ∀ C : Real, A + B == C → real_of_num(0) < B → A < C"), @list.List([@calc_rat.real_arith_tac])))
}

///|
let strict_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("strict_lemma")

///|
/// `strict_lemma`
pub fn strict_lemma() -> @kernel.Thm {
  strict_lemma_c.get()
}

///|
/// weak_lemma
fn step_19() -> Unit raise {
  weak_lemma_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ A : Real, ∀ B : Real, ∀ C : Real, A + B == C → real_of_num(0) <= B → A <= C"), @list.List([@calc_rat.real_arith_tac])))
}

///|
let weak_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("weak_lemma")

///|
/// `weak_lemma`
pub fn weak_lemma() -> @kernel.Thm {
  weak_lemma_c.get()
}

///|
/// strip_lt_lemma
fn step_20() -> Unit raise {
  let t233 = @list.List([@meson.asm_meson_tac(@list.List([@realarith.real_let_add()]))])
  strip_lt_lemma_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ B1 : Real, ∀ B2 : Real, ∀ C : Bool, (real_of_num(0) < B1 + B2 → C) → real_of_num(0) < B2 → real_of_num(0) <= B1 → C"), t233))
}

///|
let strip_lt_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("strip_lt_lemma")

///|
/// `strip_lt_lemma`
pub fn strip_lt_lemma() -> @kernel.Thm {
  strip_lt_lemma_c.get()
}

///|
/// strip_le_lemma
fn step_21() -> Unit raise {
  let t234 = @list.List([@meson.asm_meson_tac(@list.List([@realarith.real_le_add()]))])
  strip_le_lemma_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ B1 : Real, ∀ B2 : Real, ∀ C : Bool, (real_of_num(0) <= B1 + B2 → C) → real_of_num(0) <= B2 → real_of_num(0) <= B1 → C"), t234))
}

///|
let strip_le_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("strip_le_lemma")

///|
/// `strip_le_lemma`
pub fn strip_le_lemma() -> @kernel.Thm {
  strip_le_lemma_c.get()
}

///|
/// `is_x_prod_le`
pub fn is_x_prod_le(x235 : @kernel.Term) -> Bool raise {
  let tm = x235
  try {
    let hyp = @basics.dest_binop(@term_syntax.parse_term("op_eq_eq_gt"), tm).0
    let arg = @basics.dest_binop(@term_syntax.parse_term("real_le"), hyp).1
    let fac = @basics.dest_binop(@term_syntax.parse_term("real_mul"), arg)
    true
  } catch {
    Failure(_) => false
    e => raise e
  }
}

///|
/// `switch_lemma_le_order`
pub fn switch_lemma_le_order(x236 : @kernel.Term, x237 : @kernel.Term) -> Bool raise {
  let t1 = x236
  let t2 = x237
  if (is_x_prod_le(t1) && is_x_prod_le(t2)) {
    @simp.term_order(t1, t2)
  } else {
    if is_x_prod_le(t2) {
      true
    } else {
      false
    }
  }
}

///|
/// `is_x_prod_lt`
pub fn is_x_prod_lt(x238 : @kernel.Term) -> Bool raise {
  let tm = x238
  try {
    let hyp = @basics.dest_binop(@term_syntax.parse_term("op_eq_eq_gt"), tm).0
    let arg = @basics.dest_binop(@term_syntax.parse_term("real_lt"), hyp).1
    let fac = @basics.dest_binop(@term_syntax.parse_term("real_mul"), arg)
    true
  } catch {
    Failure(_) => false
    e => raise e
  }
}

///|
/// `switch_lemma_lt_order`
pub fn switch_lemma_lt_order(x239 : @kernel.Term, x240 : @kernel.Term) -> Bool raise {
  let t1 = x239
  let t2 = x240
  if (is_x_prod_lt(t1) && is_x_prod_lt(t2)) {
    @simp.term_order(t1, t2)
  } else {
    if is_x_prod_lt(t2) {
      true
    } else {
      false
    }
  }
}

///|
/// switch_lemma_le
fn step_22() -> Unit raise {
  let t241 = @list.List([@meson.asm_meson_tac(@list.List([]))])
  switch_lemma_le_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ A : Real, ∀ B : Real, ∀ C : Bool, (real_of_num(0) <= A → real_of_num(0) <= B → C) == (real_of_num(0) <= B → real_of_num(0) <= A → C)"), t241))
}

///|
let switch_lemma_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("switch_lemma_le")

///|
/// `switch_lemma_le`
pub fn switch_lemma_le() -> @kernel.Thm {
  switch_lemma_le_c.get()
}

///|
/// switch_lemma_let
fn step_23() -> Unit raise {
  let t242 = @list.List([@meson.asm_meson_tac(@list.List([]))])
  switch_lemma_let_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ A : Real, ∀ B : Real, ∀ C : Bool, (real_of_num(0) < A → real_of_num(0) <= B → C) == (real_of_num(0) <= B → real_of_num(0) < A → C)"), t242))
}

///|
let switch_lemma_let_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("switch_lemma_let")

///|
/// `switch_lemma_let`
pub fn switch_lemma_let() -> @kernel.Thm {
  switch_lemma_let_c.get()
}

///|
/// switch_lemma_lt
fn step_24() -> Unit raise {
  let t243 = @list.List([@meson.asm_meson_tac(@list.List([]))])
  switch_lemma_lt_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ A : Real, ∀ B : Real, ∀ C : Bool, (real_of_num(0) < A → real_of_num(0) < B → C) == (real_of_num(0) < B → real_of_num(0) < A → C)"), t243))
}

///|
let switch_lemma_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("switch_lemma_lt")

///|
/// `switch_lemma_lt`
pub fn switch_lemma_lt() -> @kernel.Thm {
  switch_lemma_lt_c.get()
}

///|
/// expand_prod_lt
fn step_25() -> Unit raise {
  let t244 = @list.List([@meson.asm_meson_tac(@list.List([@real.real_lt_mul()]))])
  expand_prod_lt_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ B1 : Real, ∀ B2 : Real, ∀ C : Bool, (real_of_num(0) < B1 * B2 → C) → real_of_num(0) < B1 → real_of_num(0) < B2 → C"), t244))
}

///|
let expand_prod_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("expand_prod_lt")

///|
/// `expand_prod_lt`
pub fn expand_prod_lt() -> @kernel.Thm {
  expand_prod_lt_c.get()
}

///|
/// expand_prod_le
fn step_26() -> Unit raise {
  let t245 = @list.List([@meson.asm_meson_tac(@list.List([@analysis.real_le_mul()]))])
  expand_prod_le_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ B1 : Real, ∀ B2 : Real, ∀ C : Bool, (real_of_num(0) <= B1 * B2 → C) → real_of_num(0) <= B1 → real_of_num(0) <= B2 → C"), t245))
}

///|
let expand_prod_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("expand_prod_le")

///|
/// `expand_prod_le`
pub fn expand_prod_le() -> @kernel.Thm {
  expand_prod_le_c.get()
}

///|
/// `ineq_cert_gen_tac`
pub fn ineq_cert_gen_tac(x246 : @kernel.Thm, x247 : @kernel.Term) -> @tactics.Tactic raise {
  let v = x246
  let cert = x247
  let disch_rule : ((@kernel.Thm) -> @kernel.Thm raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise = fn(x249 : (@kernel.Thm) -> @kernel.Thm raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let f = x249
    @tactics.disch_then(fn(x251 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let t = x251
      @tactics.mp_tac(f(t))
    })
  }
  let t291 = @simp.asm_simp_tac(@list.List([@real.real_le_pow_2(), @calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) < (x : Real) → real_of_num(0) <= x) && real_of_num(0) + x == x && ((a : Real) <= (b : Real) → real_of_num(0) <= b - a) && (a < b → real_of_num(0) <= b - a) && (!(b < a) → real_of_num(0) <= b - a) && (!(b <= a) → real_of_num(0) <= b - a) && (a < b → real_of_num(0) < b - a) && (!(b <= a) → real_of_num(0) < b - a)"))]))
  let t290 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t289 = @tactics.disch_then(@tactics.match_mp_tac)
  let t288 = @simp.rewrite_tac(@list.List([@realax.real_mul_lid()]))
  let t285 = @drule.match_mp(@class.taut(@term_syntax.parse_term("((A : Bool) → (B : Bool) → (C : Bool)) → A && B → C")))
  let t287 = disch_rule((x286 : @kernel.Thm) => @lib.repeat(t285, x286))
  let t281 = @simp.rewrite_rule(@list.List([switch_lemma_let()]))
  let t277 = rewrite_ord_conv(fn(x275 : @kernel.Term) -> ((@kernel.Term) -> Bool raise) raise {
    fn(x276 : @kernel.Term) -> Bool raise {
      switch_lemma_le_order(x275, x276)
    }
  }, true, @list.List([switch_lemma_le()]))
  let t279 = @drule.match_mp(expand_prod_le())
  let t284 = disch_rule((x283 : @kernel.Thm) => @lib.repeat(fn(x282 : @kernel.Thm) -> @kernel.Thm raise {
    (fn(x280 : @kernel.Thm) -> @kernel.Thm raise {
      t279(((x278 : @kernel.Thm) => @equal.conv_rule(t277, x278))(x280))
    })(t281(x282))
  }, x283))
  let t269 = rewrite_ord_conv(fn(x267 : @kernel.Term) -> ((@kernel.Term) -> Bool raise) raise {
    fn(x268 : @kernel.Term) -> Bool raise {
      switch_lemma_lt_order(x267, x268)
    }
  }, true, @list.List([switch_lemma_lt()]))
  let t271 = @drule.match_mp(expand_prod_lt())
  let t274 = disch_rule((x273 : @kernel.Thm) => @lib.repeat(fn(x272 : @kernel.Thm) -> @kernel.Thm raise {
    t271(((x270 : @kernel.Thm) => @equal.conv_rule(t269, x270))(x272))
  }, x273))
  let t264 = @drule.match_mp(strip_le_lemma())
  let t266 = disch_rule((x265 : @kernel.Thm) => @lib.repeat(t264, x265))
  let t261 = @drule.match_mp(strip_lt_lemma())
  let t263 = disch_rule((x262 : @kernel.Thm) => @lib.repeat(t261, x262))
  let t260 = disch_rule(@drule.match_mp(v))
  let t259 = @simp.rewrite_tac(@list.List([]))
  let t256 = @equal.thenc(@simp.rewrite_conv(@list.List([@realarith.real_pow_2()])), real_poly_conv)
  @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x258 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => type_then(cert, fn(x257 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x253 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s254 = @tactics.mp_tac(x253)
      fn(x255 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s254(x255)
      }
    })(t256(x257))
  }, x258), t259), t260), t263), t266), t274), t284), t287), t288), t289), t290), t291)
}

///|
/// ineq_lt_tac
fn step_27() -> Unit raise {
  ineq_lt_tac_c.set((x292 : @kernel.Term) => ineq_cert_gen_tac(strict_lemma(), x292))
}

///|
let ineq_lt_tac_c : @lib.Cell[(@kernel.Term) -> @tactics.Tactic raise] = @lib.Cell::new("ineq_lt_tac")

///|
/// `ineq_lt_tac`
pub fn ineq_lt_tac(x : @kernel.Term) -> @tactics.Tactic raise {
  (ineq_lt_tac_c.get())(x)
}

///|
/// ineq_le_tac
fn step_28() -> Unit raise {
  ineq_le_tac_c.set((x293 : @kernel.Term) => ineq_cert_gen_tac(weak_lemma(), x293))
}

///|
let ineq_le_tac_c : @lib.Cell[(@kernel.Term) -> @tactics.Tactic raise] = @lib.Cell::new("ineq_le_tac")

///|
/// `ineq_le_tac`
pub fn ineq_le_tac(x : @kernel.Term) -> @tactics.Tactic raise {
  (ineq_le_tac_c.get())(x)
}

///|
/// test_ineq_tac
fn step_29() -> Unit raise {
  let t294 = @list.List([@tactics_ext.disch_all_tac, ineq_lt_tac(@term_syntax.parse_term("(x : Real) * (y : Real) + (pow(x, 2) + (real_of_num(2) * (real_of_num(0) + x * y) + real_of_num(2) * real_of_num(2))) == x * x + (real_of_num(3) * (x * y) + real_of_num(4))"))])
  test_ineq_tac_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, real_of_num(0) <= x * y && real_of_num(0) < z → x * y < x * x + (real_of_num(3) * (x * y) + real_of_num(4))"), t294))
}

///|
let test_ineq_tac_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("test_ineq_tac")

///|
/// `test_ineq_tac`
pub fn test_ineq_tac() -> @kernel.Thm {
  test_ineq_tac_c.get()
}

///|
/// tagb
fn step_30() -> Unit raise {
  tagb_c.set(@pair.new_definition(@term_syntax.parse_term("(TAGB : (Bool) -> Bool)((x : Bool)) == x")))
}

///|
let tagb_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("tagb")

///|
/// `tagb`
pub fn tagb() -> @kernel.Thm {
  tagb_c.get()
}

///|
/// `is_quant`
pub fn is_quant(x295 : @kernel.Term) -> Bool raise {
  let tm = x295
  (@basics.is_forall(tm) || @basics.is_exists(tm))
}

///|
/// `tag_quant`
pub fn tag_quant(x296 : String, x297 : @kernel.Term) -> @kernel.Term raise {
  let var_name = x296
  let tm = x297
  if (@basics.is_forall(tm) && (@kernel.dest_var(@basics.dest_forall(tm).0).0 == var_name)) {
    @kernel.mk_comb(@term_syntax.parse_term("TAGB"), tm)
  } else {
    if (@basics.is_exists(tm) && (@kernel.dest_var(@basics.dest_exists(tm).0).0 == var_name)) {
      @kernel.mk_comb(@term_syntax.parse_term("TAGB"), tm)
    } else {
      match tm {
        @kernel.Term::Comb(x, y) => {
          let t298 = tag_quant(var_name, y)
          @kernel.mk_comb(tag_quant(var_name, x), t298)
        }
        @kernel.Term::Abs(x_1, y_1) => @kernel.mk_abs(x_1, tag_quant(var_name, y_1))
        _ => tm
      }
    }
  }
}

///|
/// quant_left_CONV
fn step_31() -> Unit raise {
  let iprove : (@kernel.Term) -> @kernel.Thm raise = fn(x299 : @kernel.Term) -> @kernel.Thm raise {
    let f = x299
    @tactics_refine.prove(f, @tactics.then_tac(@simp.rewrite_tac(@list.List([tagb()])), @itab.itaut_tac))
  }
  let t300 = @simp.rewrite_tac(@list.List([tagb(), @class.not_forall_thm()]))
  let not_forall_tag = @tactics_refine.prove(@term_syntax.parse_term("∀ P : (A) -> Bool, !TAGB(∀ x : A, P(x)) == (∃ x : A, !P(x))"), t300)
  let t301 = @simp.rewrite_tac(@list.List([tagb(), @class.skolem_thm()]))
  let skolem_tag = @tactics_refine.prove(@term_syntax.parse_term("∀ P : (A, B) -> Bool, (∃ y : (A) -> B, TAGB(∀ x : A, P(x, y(x)))) == (∀ x : A, ∃ y : B, P(x, y))"), t301)
  let t302 = @simp.rewrite_tac(@list.List([tagb(), @class.skolem_thm()]))
  let skolem_tag2 = @tactics_refine.prove(@term_syntax.parse_term("∀ P : (A, B) -> Bool, (∀ x : A, TAGB(∃ y : B, P(x, y))) == (∃ y : (A) -> B, ∀ x : A, P(x, y(x)))"), t302)
  let t303 = @simp.rewrite_tac(@list.List([@theorems.swap_forall_thm(), tagb()]))
  let swap_forall_tag = @tactics_refine.prove(@term_syntax.parse_term("∀ P : (A, B) -> Bool, (∀ x : A, TAGB(∀ y : B, P(x, y))) == (∀ y : B, ∀ x : A, P(x, y))"), t303)
  let swap_exists_thm = iprove(@term_syntax.parse_term("∀ P : (A, B) -> Bool, (∃ x : A, TAGB(∃ y : B, P(x, y))) == (∃ y : B, ∃ x : A, P(x, y))"))
  let t304 = @tactics.then_tac(@simp.rewrite_tac(@list.List([tagb()])), @itab.itaut_tac)
  let and_forall_tag = @tactics_refine.prove(@term_syntax.parse_term("∀ P : (_) -> Bool, ∀ Q : (_) -> Bool, (TAGB(∀ x : _, P(x)) && TAGB(∀ x : _, Q(x))) == (∀ x : _, P(x) && Q(x))"), t304)
  let t305 = @tactics.then_tac(@simp.rewrite_tac(@list.List([tagb()])), @itab.itaut_tac)
  let left_and_forall_tag = @tactics_refine.prove(@term_syntax.parse_term("∀ P : (_) -> Bool, ∀ Q : Bool, (TAGB(∀ x : _, P(x)) && Q) == (∀ x : _, P(x) && Q)"), t305)
  let t306 = @tactics.then_tac(@simp.rewrite_tac(@list.List([tagb()])), @itab.itaut_tac)
  let right_and_forall_tag = @tactics_refine.prove(@term_syntax.parse_term("∀ P : Bool, ∀ Q : (_) -> Bool, (P && TAGB(∀ x : _, Q(x))) == (∀ x : _, P && Q(x))"), t306)
  let t307 = @tactics.then_tac(@simp.rewrite_tac(@list.List([tagb()])), @itab.itaut_tac)
  let triv_or_forall_tag = @tactics_refine.prove(@term_syntax.parse_term("∀ P : Bool, ∀ Q : Bool, (TAGB(∀ x : A, P) || TAGB(∀ x : A, Q)) == (∀ x : A, P || Q)"), t307)
  let t308 = @tactics.then_tac(@simp.rewrite_tac(@list.List([tagb()])), @itab.itaut_tac)
  let right_imp_forall_tag = @tactics_refine.prove(@term_syntax.parse_term("∀ P : Bool, ∀ Q : (A) -> Bool, (P → TAGB(∀ x : A, Q(x))) == (∀ x : A, P → Q(x))"), t308)
  let or_exists_thm = iprove(@term_syntax.parse_term("∀ P : (A) -> Bool, ∀ Q : (A) -> Bool, (TAGB(∃ x : A, P(x)) || TAGB(∃ x : A, Q(x))) == (∃ x : A, P(x) || Q(x))"))
  let left_or_exists_thm = iprove(@term_syntax.parse_term("∀ P : (A) -> Bool, ∀ Q : Bool, (TAGB(∃ x : A, P(x)) || Q) == (∃ x : A, P(x) || Q)"))
  let right_or_exists_thm = iprove(@term_syntax.parse_term("∀ P : Bool, ∀ Q : (A) -> Bool, (P || TAGB(∃ x : A, Q(x))) == (∃ x : A, P || Q(x))"))
  let left_and_exists_thm = iprove(@term_syntax.parse_term("∀ P : (A) -> Bool, ∀ Q : Bool, (TAGB(∃ x : A, P(x)) && Q) == (∃ x : A, P(x) && Q)"))
  let right_and_exists_thm = iprove(@term_syntax.parse_term("∀ P : Bool, ∀ Q : (A) -> Bool, (P && TAGB(∃ x : A, Q(x))) == (∃ x : A, P && Q(x))"))
  let triv_and_exists_thm = iprove(@term_syntax.parse_term("∀ P : Bool, ∀ Q : Bool, (TAGB(∃ x : A, P) && TAGB(∃ x : A, Q)) == (∃ x : A, P && Q)"))
  let left_imp_exists_thm = iprove(@term_syntax.parse_term("∀ P : (A) -> Bool, ∀ Q : Bool, (TAGB(∃ x : A, P(x)) → Q) == (∀ x : A, P(x) → Q)"))
  let triv_forall_imp_thm = iprove(@term_syntax.parse_term("∀ P : Bool, ∀ Q : Bool, (TAGB(∃ x : A, P) → TAGB(∀ x : A, Q)) == (∀ x : A, P → Q)"))
  let triv_exists_imp_thm = iprove(@term_syntax.parse_term("∀ P : Bool, ∀ Q : Bool, (TAGB(∀ x : A, P) → TAGB(∃ x : A, Q)) == (∃ x : A, P → Q)"))
  let t309 = @simp.rewrite_tac(@list.List([tagb(), @class.not_exists_thm()]))
  let not_exists_tag = @tactics_refine.prove(@term_syntax.parse_term("∀ P : (A) -> Bool, !TAGB(∃ x : A, P(x)) == (∀ x : A, !P(x))"), t309)
  let t310 = @simp.rewrite_tac(@list.List([tagb(), @class.left_or_forall_thm()]))
  let left_or_forall_tag = @tactics_refine.prove(@term_syntax.parse_term("∀ P : (A) -> Bool, ∀ Q : Bool, (TAGB(∀ x : A, P(x)) || Q) == (∀ x : A, P(x) || Q)"), t310)
  let t311 = @simp.rewrite_tac(@list.List([tagb(), @class.right_or_forall_thm()]))
  let right_or_forall_tag = @tactics_refine.prove(@term_syntax.parse_term("∀ P : Bool, ∀ Q : (A) -> Bool, (P || TAGB(∀ x : A, Q(x))) == (∀ x : A, P || Q(x))"), t311)
  let t312 = @simp.rewrite_tac(@list.List([tagb(), @class.left_imp_forall_thm()]))
  let left_imp_forall_tag = @tactics_refine.prove(@term_syntax.parse_term("∀ P : (A) -> Bool, ∀ Q : Bool, (TAGB(∀ x : A, P(x)) → Q) == (∃ x : A, P(x) → Q)"), t312)
  let t313 = @simp.rewrite_tac(@list.List([tagb(), @class.right_imp_exists_thm()]))
  let right_imp_exists_tag = @tactics_refine.prove(@term_syntax.parse_term("∀ P : Bool, ∀ Q : (A) -> Bool, (P → TAGB(∃ x : A, Q(x))) == (∃ x : A, P → Q(x))"), t313)
  quant_left_conv_c.set(fn(x314 : String) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let var_name = x314
    fn(x315 : @kernel.Term) -> @kernel.Thm raise {
      let tm = x315
      let t317 = tag_quant(var_name, tm)
      let t318 = @equal.top_sweep_conv(@simp.gen_rewrite_conv(fn(x316 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        x316
      }, @list.List([not_forall_tag, skolem_tag, skolem_tag2, swap_forall_tag, swap_exists_thm, swap_exists_thm, and_forall_tag, left_and_forall_tag, right_and_forall_tag, triv_or_forall_tag, right_imp_forall_tag, or_exists_thm, left_or_exists_thm, right_or_exists_thm, left_and_exists_thm, right_and_exists_thm, triv_and_exists_thm, left_imp_exists_thm, triv_forall_imp_thm, triv_exists_imp_thm, not_exists_tag, left_or_forall_tag, right_or_forall_tag, left_imp_forall_tag, right_imp_exists_tag])))(t317)
      @simp.rewrite_rule(@list.List([tagb()]))(t318)
    }
  })
}

///|
let quant_left_conv_c : @lib.Cell[(String) -> ((@kernel.Term) -> @kernel.Thm raise) raise] = @lib.Cell::new("quant_left_CONV")

///|
/// `quant_left_CONV`
pub fn quant_left_conv(x : String) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  (quant_left_conv_c.get())(x)
}

///|
/// quant_left_noswap_CONV
fn step_32() -> Unit raise {
  let iprove : (@kernel.Term) -> @kernel.Thm raise = fn(x319 : @kernel.Term) -> @kernel.Thm raise {
    let f = x319
    @tactics_refine.prove(f, @tactics.then_tac(@simp.rewrite_tac(@list.List([tagb()])), @itab.itaut_tac))
  }
  let t320 = @simp.rewrite_tac(@list.List([tagb(), @class.not_forall_thm()]))
  let not_forall_tag = @tactics_refine.prove(@term_syntax.parse_term("∀ P : (A) -> Bool, !TAGB(∀ x : A, P(x)) == (∃ x : A, !P(x))"), t320)
  let t321 = @simp.rewrite_tac(@list.List([tagb(), @class.skolem_thm()]))
  let skolem_tag = @tactics_refine.prove(@term_syntax.parse_term("∀ P : (A, B) -> Bool, (∃ y : (A) -> B, TAGB(∀ x : A, P(x, y(x)))) == (∀ x : A, ∃ y : B, P(x, y))"), t321)
  let t322 = @simp.rewrite_tac(@list.List([tagb(), @class.skolem_thm()]))
  let skolem_tag2 = @tactics_refine.prove(@term_syntax.parse_term("∀ P : (A, B) -> Bool, (∀ x : A, TAGB(∃ y : B, P(x, y))) == (∃ y : (A) -> B, ∀ x : A, P(x, y(x)))"), t322)
  let t323 = @simp.rewrite_tac(@list.List([@theorems.swap_forall_thm(), tagb()]))
  let swap_forall_tag = @tactics_refine.prove(@term_syntax.parse_term("∀ P : (A, B) -> Bool, (∀ x : A, TAGB(∀ y : B, P(x, y))) == (∀ y : B, ∀ x : A, P(x, y))"), t323)
  let swap_exists_thm = iprove(@term_syntax.parse_term("∀ P : (A, B) -> Bool, (∃ x : A, TAGB(∃ y : B, P(x, y))) == (∃ y : B, ∃ x : A, P(x, y))"))
  let t324 = @tactics.then_tac(@simp.rewrite_tac(@list.List([tagb()])), @itab.itaut_tac)
  let and_forall_tag = @tactics_refine.prove(@term_syntax.parse_term("∀ P : (_) -> Bool, ∀ Q : (_) -> Bool, (TAGB(∀ x : _, P(x)) && TAGB(∀ x : _, Q(x))) == (∀ x : _, P(x) && Q(x))"), t324)
  let t325 = @tactics.then_tac(@simp.rewrite_tac(@list.List([tagb()])), @itab.itaut_tac)
  let left_and_forall_tag = @tactics_refine.prove(@term_syntax.parse_term("∀ P : (_) -> Bool, ∀ Q : Bool, (TAGB(∀ x : _, P(x)) && Q) == (∀ x : _, P(x) && Q)"), t325)
  let t326 = @tactics.then_tac(@simp.rewrite_tac(@list.List([tagb()])), @itab.itaut_tac)
  let right_and_forall_tag = @tactics_refine.prove(@term_syntax.parse_term("∀ P : Bool, ∀ Q : (_) -> Bool, (P && TAGB(∀ x : _, Q(x))) == (∀ x : _, P && Q(x))"), t326)
  let t327 = @tactics.then_tac(@simp.rewrite_tac(@list.List([tagb()])), @itab.itaut_tac)
  let triv_or_forall_tag = @tactics_refine.prove(@term_syntax.parse_term("∀ P : Bool, ∀ Q : Bool, (TAGB(∀ x : A, P) || TAGB(∀ x : A, Q)) == (∀ x : A, P || Q)"), t327)
  let t328 = @tactics.then_tac(@simp.rewrite_tac(@list.List([tagb()])), @itab.itaut_tac)
  let right_imp_forall_tag = @tactics_refine.prove(@term_syntax.parse_term("∀ P : Bool, ∀ Q : (A) -> Bool, (P → TAGB(∀ x : A, Q(x))) == (∀ x : A, P → Q(x))"), t328)
  let or_exists_thm = iprove(@term_syntax.parse_term("∀ P : (A) -> Bool, ∀ Q : (A) -> Bool, (TAGB(∃ x : A, P(x)) || TAGB(∃ x : A, Q(x))) == (∃ x : A, P(x) || Q(x))"))
  let left_or_exists_thm = iprove(@term_syntax.parse_term("∀ P : (A) -> Bool, ∀ Q : Bool, (TAGB(∃ x : A, P(x)) || Q) == (∃ x : A, P(x) || Q)"))
  let right_or_exists_thm = iprove(@term_syntax.parse_term("∀ P : Bool, ∀ Q : (A) -> Bool, (P || TAGB(∃ x : A, Q(x))) == (∃ x : A, P || Q(x))"))
  let left_and_exists_thm = iprove(@term_syntax.parse_term("∀ P : (A) -> Bool, ∀ Q : Bool, (TAGB(∃ x : A, P(x)) && Q) == (∃ x : A, P(x) && Q)"))
  let right_and_exists_thm = iprove(@term_syntax.parse_term("∀ P : Bool, ∀ Q : (A) -> Bool, (P && TAGB(∃ x : A, Q(x))) == (∃ x : A, P && Q(x))"))
  let triv_and_exists_thm = iprove(@term_syntax.parse_term("∀ P : Bool, ∀ Q : Bool, (TAGB(∃ x : A, P) && TAGB(∃ x : A, Q)) == (∃ x : A, P && Q)"))
  let left_imp_exists_thm = iprove(@term_syntax.parse_term("∀ P : (A) -> Bool, ∀ Q : Bool, (TAGB(∃ x : A, P(x)) → Q) == (∀ x : A, P(x) → Q)"))
  let triv_forall_imp_thm = iprove(@term_syntax.parse_term("∀ P : Bool, ∀ Q : Bool, (TAGB(∃ x : A, P) → TAGB(∀ x : A, Q)) == (∀ x : A, P → Q)"))
  let triv_exists_imp_thm = iprove(@term_syntax.parse_term("∀ P : Bool, ∀ Q : Bool, (TAGB(∀ x : A, P) → TAGB(∃ x : A, Q)) == (∃ x : A, P → Q)"))
  let t329 = @simp.rewrite_tac(@list.List([tagb(), @class.not_exists_thm()]))
  let not_exists_tag = @tactics_refine.prove(@term_syntax.parse_term("∀ P : (A) -> Bool, !TAGB(∃ x : A, P(x)) == (∀ x : A, !P(x))"), t329)
  let t330 = @simp.rewrite_tac(@list.List([tagb(), @class.left_or_forall_thm()]))
  let left_or_forall_tag = @tactics_refine.prove(@term_syntax.parse_term("∀ P : (A) -> Bool, ∀ Q : Bool, (TAGB(∀ x : A, P(x)) || Q) == (∀ x : A, P(x) || Q)"), t330)
  let t331 = @simp.rewrite_tac(@list.List([tagb(), @class.right_or_forall_thm()]))
  let right_or_forall_tag = @tactics_refine.prove(@term_syntax.parse_term("∀ P : Bool, ∀ Q : (A) -> Bool, (P || TAGB(∀ x : A, Q(x))) == (∀ x : A, P || Q(x))"), t331)
  let t332 = @simp.rewrite_tac(@list.List([tagb(), @class.left_imp_forall_thm()]))
  let left_imp_forall_tag = @tactics_refine.prove(@term_syntax.parse_term("∀ P : (A) -> Bool, ∀ Q : Bool, (TAGB(∀ x : A, P(x)) → Q) == (∃ x : A, P(x) → Q)"), t332)
  let t333 = @simp.rewrite_tac(@list.List([tagb(), @class.right_imp_exists_thm()]))
  let right_imp_exists_tag = @tactics_refine.prove(@term_syntax.parse_term("∀ P : Bool, ∀ Q : (A) -> Bool, (P → TAGB(∃ x : A, Q(x))) == (∃ x : A, P → Q(x))"), t333)
  quant_left_noswap_conv_c.set(fn(x334 : String) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let var_name = x334
    fn(x335 : @kernel.Term) -> @kernel.Thm raise {
      let tm = x335
      let t337 = tag_quant(var_name, tm)
      let t338 = @equal.top_sweep_conv(@simp.gen_rewrite_conv(fn(x336 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        x336
      }, @list.List([not_forall_tag, and_forall_tag, left_and_forall_tag, right_and_forall_tag, triv_or_forall_tag, right_imp_forall_tag, or_exists_thm, left_or_exists_thm, right_or_exists_thm, left_and_exists_thm, right_and_exists_thm, triv_and_exists_thm, left_imp_exists_thm, triv_forall_imp_thm, triv_exists_imp_thm, not_exists_tag, left_or_forall_tag, right_or_forall_tag, left_imp_forall_tag, right_imp_exists_tag])))(t337)
      @simp.rewrite_rule(@list.List([tagb()]))(t338)
    }
  })
}

///|
let quant_left_noswap_conv_c : @lib.Cell[(String) -> ((@kernel.Term) -> @kernel.Thm raise) raise] = @lib.Cell::new("quant_left_noswap_CONV")

///|
/// `quant_left_noswap_CONV`
pub fn quant_left_noswap_conv(x : String) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  (quant_left_noswap_conv_c.get())(x)
}

///|
/// quant_right_CONV
fn step_33() -> Unit raise {
  let iprove : (@kernel.Term) -> @kernel.Thm raise = fn(x339 : @kernel.Term) -> @kernel.Thm raise {
    let f = x339
    @tactics_refine.prove(f, @tactics.then_tac(@simp.rewrite_tac(@list.List([tagb()])), @itab.itaut_tac))
  }
  let t340 = @simp.rewrite_tac(@list.List([tagb(), @equal.gsym(@class.not_forall_thm())]))
  let not_forall_tag = @tactics_refine.prove(@term_syntax.parse_term("∀ P : (A) -> Bool, TAGB(∃ x : A, !P(x)) == !(∀ x : A, P(x))"), t340)
  let t341 = @simp.rewrite_tac(@list.List([tagb(), @equal.gsym(@class.skolem_thm())]))
  let skolem_tag = @tactics_refine.prove(@term_syntax.parse_term("∀ P : (A, B) -> Bool, TAGB(∀ x : A, ∃ y : B, P(x, y)) == (∃ y : (A) -> B, ∀ x : A, P(x, y(x)))"), t341)
  let t342 = @simp.rewrite_tac(@list.List([tagb(), @equal.gsym(@class.skolem_thm())]))
  let skolem_tag2 = @tactics_refine.prove(@term_syntax.parse_term("∀ P : (A, B) -> Bool, TAGB(∃ y : (A) -> B, ∀ x : A, P(x, y(x))) == (∀ x : A, ∃ y : B, P(x, y))"), t342)
  let t343 = @simp.rewrite_tac(@list.List([@equal.gsym(@theorems.swap_forall_thm()), tagb()]))
  let swap_forall_tag = @tactics_refine.prove(@term_syntax.parse_term("∀ P : (A, B) -> Bool, TAGB(∀ y : B, ∀ x : A, P(x, y)) == (∀ x : A, ∀ y : B, P(x, y))"), t343)
  let swap_exists_thm = iprove(@term_syntax.parse_term("∀ P : (A, B) -> Bool, TAGB(∃ y : B, ∃ x : A, P(x, y)) == (∃ x : A, ∃ y : B, P(x, y))"))
  let and_forall_tag = iprove(@term_syntax.parse_term("∀ P : (_) -> Bool, ∀ Q : (_) -> Bool, TAGB(∀ x : _, P(x) && Q(x)) == ((∀ x : _, P(x)) && (∀ x : _, Q(x)))"))
  let t344 = @tactics.then_tac(@simp.rewrite_tac(@list.List([tagb()])), @itab.itaut_tac)
  let left_and_forall_tag = @tactics_refine.prove(@term_syntax.parse_term("∀ P : (_) -> Bool, ∀ Q : Bool, TAGB(∀ x : _, P(x) && Q) == ((∀ x : _, P(x)) && Q)"), t344)
  let t345 = @tactics.then_tac(@simp.rewrite_tac(@list.List([tagb()])), @itab.itaut_tac)
  let right_and_forall_tag = @tactics_refine.prove(@term_syntax.parse_term("∀ P : Bool, ∀ Q : (_) -> Bool, TAGB(∀ x : _, P && Q(x)) == (P && (∀ x : _, Q(x)))"), t345)
  let t346 = @tactics.then_tac(@simp.rewrite_tac(@list.List([tagb()])), @itab.itaut_tac)
  let triv_or_forall_tag = @tactics_refine.prove(@term_syntax.parse_term("∀ P : Bool, ∀ Q : Bool, TAGB(∀ x : A, P || Q) == ((∀ x : A, P) || (∀ x : A, Q))"), t346)
  let t347 = @tactics.then_tac(@simp.rewrite_tac(@list.List([tagb()])), @itab.itaut_tac)
  let right_imp_forall_tag = @tactics_refine.prove(@term_syntax.parse_term("∀ P : Bool, ∀ Q : (A) -> Bool, TAGB(∀ x : A, P → Q(x)) == (P → (∀ x : A, Q(x)))"), t347)
  let or_exists_thm = iprove(@term_syntax.parse_term("∀ P : (A) -> Bool, ∀ Q : (A) -> Bool, TAGB(∃ x : A, P(x) || Q(x)) == ((∃ x : A, P(x)) || (∃ x : A, Q(x)))"))
  let left_or_exists_thm = iprove(@term_syntax.parse_term("∀ P : (A) -> Bool, ∀ Q : Bool, TAGB(∃ x : A, P(x) || Q) == ((∃ x : A, P(x)) || Q)"))
  let right_or_exists_thm = iprove(@term_syntax.parse_term("∀ P : Bool, ∀ Q : (A) -> Bool, TAGB(∃ x : A, P || Q(x)) == (P || (∃ x : A, Q(x)))"))
  let left_and_exists_thm = iprove(@term_syntax.parse_term("∀ P : (A) -> Bool, ∀ Q : Bool, TAGB(∃ x : A, P(x) && Q) == ((∃ x : A, P(x)) && Q)"))
  let right_and_exists_thm = iprove(@term_syntax.parse_term("∀ P : Bool, ∀ Q : (A) -> Bool, TAGB(∃ x : A, P && Q(x)) == (P && (∃ x : A, Q(x)))"))
  let triv_and_exists_thm = iprove(@term_syntax.parse_term("∀ P : Bool, ∀ Q : Bool, TAGB(∃ x : A, P && Q) == ((∃ x : A, P) && (∃ x : A, Q))"))
  let left_imp_exists_thm = iprove(@term_syntax.parse_term("∀ P : (A) -> Bool, ∀ Q : Bool, TAGB(∀ x : A, P(x) → Q) == ((∃ x : A, P(x)) → Q)"))
  let triv_forall_imp_thm = iprove(@term_syntax.parse_term("∀ P : Bool, ∀ Q : Bool, TAGB(∀ x : A, P → Q) == ((∃ x : A, P) → (∀ x : A, Q))"))
  let triv_exists_imp_thm = iprove(@term_syntax.parse_term("∀ P : Bool, ∀ Q : Bool, TAGB(∃ x : A, P → Q) == ((∀ x : A, P) → (∃ x : A, Q))"))
  let t348 = @simp.rewrite_tac(@list.List([tagb(), @class.not_exists_thm()]))
  let not_exists_tag = @tactics_refine.prove(@term_syntax.parse_term("∀ P : (A) -> Bool, TAGB(∀ x : A, !P(x)) == !(∃ x : A, P(x))"), t348)
  let t349 = @simp.rewrite_tac(@list.List([tagb(), @class.left_or_forall_thm()]))
  let left_or_forall_tag = @tactics_refine.prove(@term_syntax.parse_term("∀ P : (A) -> Bool, ∀ Q : Bool, TAGB(∀ x : A, P(x) || Q) == ((∀ x : A, P(x)) || Q)"), t349)
  let t350 = @simp.rewrite_tac(@list.List([tagb(), @class.right_or_forall_thm()]))
  let right_or_forall_tag = @tactics_refine.prove(@term_syntax.parse_term("∀ P : Bool, ∀ Q : (A) -> Bool, TAGB(∀ x : A, P || Q(x)) == (P || (∀ x : A, Q(x)))"), t350)
  let t351 = @simp.rewrite_tac(@list.List([tagb(), @class.left_imp_forall_thm()]))
  let left_imp_forall_tag = @tactics_refine.prove(@term_syntax.parse_term("∀ P : (A) -> Bool, ∀ Q : Bool, TAGB(∃ x : A, P(x) → Q) == ((∀ x : A, P(x)) → Q)"), t351)
  let t352 = @simp.rewrite_tac(@list.List([tagb(), @class.right_imp_exists_thm()]))
  let right_imp_exists_tag = @tactics_refine.prove(@term_syntax.parse_term("∀ P : Bool, ∀ Q : (A) -> Bool, TAGB(∃ x : A, P → Q(x)) == (P → (∃ x : A, Q(x)))"), t352)
  quant_right_conv_c.set(fn(x353 : String) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let var_name = x353
    fn(x354 : @kernel.Term) -> @kernel.Thm raise {
      let tm = x354
      let t356 = tag_quant(var_name, tm)
      let t357 = @equal.top_sweep_conv(@simp.gen_rewrite_conv(fn(x355 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        x355
      }, @list.List([not_forall_tag, skolem_tag, skolem_tag2, swap_forall_tag, swap_exists_thm, swap_exists_thm, and_forall_tag, left_and_forall_tag, right_and_forall_tag, triv_or_forall_tag, right_imp_forall_tag, or_exists_thm, left_or_exists_thm, right_or_exists_thm, left_and_exists_thm, right_and_exists_thm, triv_and_exists_thm, left_imp_exists_thm, triv_forall_imp_thm, triv_exists_imp_thm, not_exists_tag, left_or_forall_tag, right_or_forall_tag, left_imp_forall_tag, right_imp_exists_tag])))(t356)
      @simp.rewrite_rule(@list.List([tagb()]))(t357)
    }
  })
}

///|
let quant_right_conv_c : @lib.Cell[(String) -> ((@kernel.Term) -> @kernel.Thm raise) raise] = @lib.Cell::new("quant_right_CONV")

///|
/// `quant_right_CONV`
pub fn quant_right_conv(x : String) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  (quant_right_conv_c.get())(x)
}

///|
/// mark_term
fn step_34() -> Unit raise {
  mark_term_c.set(@pair.new_definition(@term_syntax.parse_term("(mark_term : (A) -> A)((u : A)) == u")))
}

///|
let mark_term_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("mark_term")

///|
/// `mark_term`
pub fn mark_term() -> @kernel.Thm {
  mark_term_c.get()
}

///|
/// `markq`
pub fn markq(x358 : String, x359 : @kernel.Term) -> @kernel.Term raise {
  let qname = x358
  let tm = x359
  match tm {
    @kernel.Term::Var(a, b) => {
      if (a == qname) {
        @basics.mk_icomb(@term_syntax.parse_term("(mark_term : (A) -> A)"), tm)
      } else {
        tm
      }
    }
    @kernel.Term::Const(_, _) => tm
    @kernel.Term::Comb(s, b_1) => {
      let t360 = markq(qname, b_1)
      @kernel.mk_comb(markq(qname, s), t360)
    }
    @kernel.Term::Abs(x, t) => @kernel.mk_abs(x, markq(qname, t))
  }
}

///|
/// `getquants`
pub fn getquants(x361 : @kernel.Term) -> @list.List[String] raise {
  let tm = x361
  if @basics.is_forall(tm) {
    let t362 = getquants(@basics.dest_forall(tm).1)
    t362.prepend(@kernel.dest_var(@basics.dest_forall(tm).0).0)
  } else {
    if @basics.is_exists(tm) {
      let t363 = getquants(@basics.dest_exists(tm).1)
      t363.prepend(@kernel.dest_var(@basics.dest_exists(tm).0).0)
    } else {
      match tm {
        @kernel.Term::Comb(s, b) => {
          let t364 = getquants(b)
          getquants(s).concat(t364)
        }
        @kernel.Term::Abs(x, t) => getquants(t)
        _ => @list.List([])
      }
    }
  }
}

///|
/// rewrite_conjs
fn step_35() -> Unit raise {
  let t373 = @list.List([@meson.meson_tac(@list.List([]))])
  let t374 = @tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ A : Bool, ∀ u : A, ∀ t : A, ∀ B : Bool, (A → mark_term(u) == t → B) == (mark_term(u) == t → A → B)"), t373)
  let t372 = @list.List([@meson.meson_tac(@list.List([]))])
  let t375 = @tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ u : A, ∀ t : A, ∀ C : Bool, ∀ D : Bool, (mark_term(u) == t && C → D) == (mark_term(u) == t → C → D)"), t372)
  let t371 = @list.List([@meson.meson_tac(@list.List([]))])
  let t376 = @tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ A : Bool, ∀ u : A, ∀ t : A, (A && mark_term(u) == t) == (mark_term(u) == t && A)"), t371)
  let t370 = @list.List([@meson.meson_tac(@list.List([]))])
  let t377 = @tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ u : A, ∀ t : A, ∀ A : Bool, ∀ C : Bool, (A && mark_term(u) == t && C) == (mark_term(u) == t && A && C)"), t370)
  let t369 = @list.List([@meson.meson_tac(@list.List([]))])
  let t378 = @tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ u : A, ∀ a : A, ∀ b : A, ∀ B : Bool, (mark_term(u) == a && mark_term(u) == b && B) == (mark_term(u) == a && a == b && B)"), t369)
  let t368 = @list.List([@meson.meson_tac(@list.List([]))])
  let t379 = @tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ u : A, ∀ a : A, ∀ b : A, (mark_term(u) == a && mark_term(u) == b) == (mark_term(u) == a && a == b)"), t368)
  let t367 = @list.List([@meson.meson_tac(@list.List([]))])
  let t380 = @tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ u : A, ∀ t : A, (t == mark_term(u)) == (mark_term(u) == t)"), t367)
  let t366 = @list.List([@meson.meson_tac(@list.List([]))])
  let t381 = @tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ u : A, (mark_term(u) == mark_term(u)) == true"), t366)
  let t365 = @list.List([@simp.rewrite_tac(@list.List([@theorems.conj_aci()]))])
  rewrite_conjs_c.set(@list.List([@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ A : Bool, ∀ B : Bool, ∀ C : Bool, ((A && B) && C) == (A && B && C)"), t365), t381, t380, t379, t378, t377, t376, t375, t374]))
}

///|
let rewrite_conjs_c : @lib.Cell[@list.List[@kernel.Thm]] = @lib.Cell::new("rewrite_conjs")

///|
/// `rewrite_conjs`
pub fn rewrite_conjs() -> @list.List[@kernel.Thm] {
  rewrite_conjs_c.get()
}

///|
/// higher_conjs
fn step_36() -> Unit raise {
  let t383 = @list.List([@meson.meson_tac(@list.List([mark_term()]))])
  let t384 = @tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ C : (A) -> Bool, ∀ u : A, ∀ t : A, (mark_term(u) == t && C(mark_term(u))) == (mark_term(u) == t && C(t))"), t383)
  let t382 = @list.List([@meson.meson_tac(@list.List([mark_term()]))])
  higher_conjs_c.set(@list.List([@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ C : (A) -> Bool, ∀ u : A, ∀ t : A, (mark_term(u) == t → C(mark_term(u))) == (mark_term(u) == t → C(t))"), t382), t384]))
}

///|
let higher_conjs_c : @lib.Cell[@list.List[@kernel.Thm]] = @lib.Cell::new("higher_conjs")

///|
/// `higher_conjs`
pub fn higher_conjs() -> @list.List[@kernel.Thm] {
  higher_conjs_c.get()
}

///|
/// dropq_conv
fn step_37() -> Unit raise {
  let t385 = @list.List([@meson.meson_tac(@list.List([]))])
  let drop_exist : (@kernel.Term) -> @kernel.Thm raise = @simp.rewrite_conv(@list.List([@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ t : A, ∃ u : A, u == t"), t385)]))
  dropq_conv_c.set(fn(x386 : String) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let qname = x386
    fn(x387 : @kernel.Term) -> @kernel.Thm raise {
      let tm = x387
      let quanlist = getquants(tm)
      let quantleft_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.every_conv(@lib.map(fn(x391 : String) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(x388 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s389 = @equal.repeatc(x388)
          fn(x390 : @kernel.Term) -> @kernel.Thm raise {
            s389(x390)
          }
        })(quant_left_noswap_conv(x391))
      }, quanlist))
      let qname_conv : (@kernel.Term) -> @kernel.Thm raise = fn(x392 : @kernel.Term) -> @kernel.Thm raise {
        let tm_1 = x392
        let t393 = @simp.rewrite_tac(@list.List([mark_term()]))
        @tactics_refine.prove(@basics.mk_eq(tm_1, markq(qname, tm_1)), t393)
      }
      let conj_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.rewrite_conv(rewrite_conjs())
      let quantright_conv : (@kernel.Term) -> @kernel.Thm raise = @equal.repeatc(quant_right_conv(qname))
      let drop_mark_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.rewrite_conv(@list.List([mark_term()]))
      let t394 = @simp.once_rewrite_conv(higher_conjs())
      @equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(quantleft_conv, qname_conv), conj_conv), t394), drop_mark_conv), quantright_conv), drop_exist)(tm)
    }
  })
}

///|
let dropq_conv_c : @lib.Cell[(String) -> ((@kernel.Term) -> @kernel.Thm raise) raise] = @lib.Cell::new("dropq_conv")

///|
/// `dropq_conv`
pub fn dropq_conv(x : String) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  (dropq_conv_c.get())(x)
}

///|
/// Jordan/tactics_ext2.ml:954
fn step_38() -> Unit raise {
  let t395 = @term_syntax.parse_term("∀ P : (A) -> B, ∀ Q : (A) -> Bool, ∀ R : (B) -> Bool, ∃ u : B, (∃ x : A, u == P(x) && Q(x)) && R(u)")
  ignore(dropq_conv("u")(t395))
}

///|
/// Jordan/tactics_ext2.ml:955
fn step_39() -> Unit raise {
  let t396 = @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ Q : (A) -> B, ∀ R : (B) -> Bool, ∀ t : B, (∃ x : A, P(x) && t == Q(x)) → R(t)")
  ignore(dropq_conv("t")(t396))
}

///|
/// Jordan/tactics_ext2.ml:957
fn step_40() -> Unit raise {
  let t397 = @term_syntax.parse_term("∃ u : Real, ∃ v : Real, ((t : Real) * ((a : Real) + real_of_num(1)) + (real_of_num(1) - t) * a == u && t * ((b : Real) + real_of_num(0)) + (real_of_num(1) - t) * b == v) && a < u && u < (r : Real) && v == b")
  ignore(dropq_conv("u")(t397))
}

///|
/// `%`
pub fn op_percent(x398 : Int64) -> @tactics_ext.Goalthm raise {
  let i = x398
  let t399 = Int64::to_string(i)
  (x400 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp(t399, x400)
}

///|
/// `WITH`
pub fn with_(x401 : Int64, x402 : (@kernel.Thm) -> @kernel.Thm raise) -> @tactics.Tactic raise {
  let i = x401
  let rule = x402
  let t404 = Int64::to_string(i)
  @tactics_ext.h_val(rule, (x405 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp(t404, x405))
}

///|
/// `UND`
pub fn und(x406 : Int64, x407 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let i = x406
  let (asl, w) = x407
  let name = ("Z-" + Int64::to_string(i))
  try {
    let thm = @lib.assoc(name, asl)
    let tm = @kernel.concl(thm)
    let (_, asl_p) = @lib.partition(fn(x408 : (String, @kernel.Thm)) -> Bool raise {
      let t = x408
      (name == t.0)
    }, asl)
    (@tactics.null_meta, @list.List([(asl_p, @bool.mk_imp(tm, w))]), fn(x409 : (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), x410 : @list.List[@kernel.Thm]) -> @kernel.Thm raise {
      let i_1 = x409
      match x410 {
        More(th, tail=Empty) => @bool.mp(th, @drule.instantiate_all(i_1, thm))
        _ => raise @lib.MatchFailure("tscript.ml:981")
      }
    })
  } catch {
    Failure(_) => raise Failure("UND")
    e => raise e
  }
}

///|
/// `KILL`
pub fn kill(x411 : Int64) -> @tactics.Tactic raise {
  let i = x411
  @tactics.then_tac((x413 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => und(i, x413), @tactics.disch_then(fn(x414 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x414
    @tactics.all_tac
  }))
}

///|
/// `USE`
pub fn use_(x416 : Int64, x417 : (@kernel.Thm) -> @kernel.Thm raise) -> @tactics.Tactic raise {
  let i = x416
  let rule = x417
  let t419 = kill(i)
  @tactics.then_tac(with_(i, rule), t419)
}

///|
/// `CHO`
pub fn cho(x420 : Int64) -> @tactics.Tactic raise {
  let i = x420
  @tactics.then_tac((x422 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => und(i, x422), @tactics.disch_then(@tactics.choose_tac))
}

///|
/// `X_CHO`
pub fn x_cho(x423 : Int64, x424 : @kernel.Term) -> @tactics.Tactic raise {
  let i = x423
  let t = x424
  @tactics.then_tac((x426 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => und(i, x426), @tactics.disch_then((x427 : @kernel.Thm) => @tactics.x_choose_tac(t, x427)))
}

///|
/// `AND`
pub fn and_(x428 : Int64) -> @tactics.Tactic raise {
  let i = x428
  @tactics.then_tac((x430 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => und(i, x430), @tactics.disch_then(fn(x431 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x431
    let t433 = @tactics.assume_tac(@bool.conjunct2(t))
    @tactics.then_tac(@tactics.assume_tac(@bool.conjunct1(t)), t433)
  }))
}

///|
/// `JOIN`
pub fn join(x434 : Int64, x435 : Int64) -> @tactics.Tactic raise {
  let i = x434
  let j = x435
  let t441 = kill(j)
  let t440 = kill(i)
  let t439 = op_percent(j)
  @tactics.then_tac(@tactics.then_tac(@tactics_ext.h_val2(fn(x437 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x438 : @kernel.Thm) -> @kernel.Thm raise {
      @bool.conj(x437, x438)
    }
  }, op_percent(i), t439), t440), t441)
}

///|
/// `COPY`
pub fn copy(x442 : Int64) -> @tactics.Tactic raise {
  let i = x442
  with_(i, fn(x444 : @kernel.Thm) -> @kernel.Thm raise {
    x444
  })
}

///|
/// `REP`
pub fn rep(x445 : Int64, x446 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) -> @tactics.Tactic raise {
  let n = x445
  let tac = x446
  @tactics.every(@lib.replicate(tac, @lib.int63_to_int(n)))
}

///|
/// `REWR`
pub fn rewr(x448 : Int64) -> @tactics.Tactic raise {
  let i = x448
  @tactics.then_tac(@tactics.then_tac((x450 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => und(i, x450), @simp.asm_rewrite_tac(@list.List([]))), @tactics.disch_tac)
}

///|
/// `LEFT`
pub fn left(x451 : Int64, x452 : String) -> @tactics.Tactic raise {
  let i = x451
  let t = x452
  let t454 = quant_left_conv(t)
  use_(i, (x455 : @kernel.Thm) => @equal.conv_rule(t454, x455))
}

///|
/// `RIGHT`
pub fn right(x456 : Int64, x457 : String) -> @tactics.Tactic raise {
  let i = x456
  let t = x457
  let t459 = quant_right_conv(t)
  use_(i, (x460 : @kernel.Thm) => @equal.conv_rule(t459, x460))
}

///|
/// `LEFT_TAC`
pub fn left_tac(x461 : String) -> @tactics.Tactic raise {
  let t = x461
  @tactics.conv_tac(quant_left_conv(t))
}

///|
/// `RIGHT_TAC`
pub fn right_tac(x463 : String) -> @tactics.Tactic raise {
  let t = x463
  @tactics.conv_tac(quant_right_conv(t))
}

///|
/// INR
fn step_41() -> Unit raise {
  inr_c.set(@simp.rewrite_rule(@list.List([@sets.in_()])))
}

///|
let inr_c : @lib.Cell[(@kernel.Thm) -> @kernel.Thm raise] = @lib.Cell::new("INR")

///|
/// `INR`
pub fn inr(x : @kernel.Thm) -> @kernel.Thm raise {
  (inr_c.get())(x)
}

///|
/// CONTRAPOSITIVE_TAC
fn step_42() -> Unit raise {
  let t465 = @simp.rewrite_tac(@list.List([]))
  contrapositive_tac_c.set(@tactics.then_tac(@tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(!(q : Bool) → !(p : Bool)) → p → q"))), t465))
}

///|
let contrapositive_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("CONTRAPOSITIVE_TAC")

///|
/// `CONTRAPOSITIVE_TAC`
pub fn contrapositive_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (contrapositive_tac_c.get())(x)
}

///|
/// `REWRT_TAC`
pub fn rewrt_tac(x466 : @kernel.Thm) -> @tactics.Tactic raise {
  let t = x466
  @simp.rewrite_tac(@list.List([t]))
}

///|
let reduce_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("REDUCE_CONV")

///|
/// `REDUCE_CONV`
pub fn reduce_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (reduce_conv_c.get())(x)
}

///|
let reduce_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("REDUCE_TAC")

///|
/// `REDUCE_TAC`
pub fn reduce_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (reduce_tac_c.get())(x)
}

///|
/// REDUCE_CONV, REDUCE_TAC
fn step_43() -> Unit raise {
  let t470 = @equal.gsym(@int.int_neg_minus1())
  let t469 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) - (b : Real) == (c : Real)) == (a == b + c)")), @realax.real_of_num_add(), @realax.real_of_num_eq()])), @int.arith_tac)
  let t471 = @tactics_refine.prove(@term_syntax.parse_term("real_of_num(SUC((x : Num))) - real_of_num(x) == real_of_num(1)"), t469)
  let t472 = @int.arith_rule(@term_syntax.parse_term("SUC((b : Num)) - b == 1"))
  let t473 = @int.arith_rule(@term_syntax.parse_term("SUC((b : Num)) - 1 == b"))
  let t474 = @int.arith_rule(@term_syntax.parse_term("0 < 1"))
  let t475 = @int.arith_rule(@term_syntax.parse_term("((i : Num) <= (j : Num) && j <= i) == (i == j)"))
  let t476 = @int.arith_rule(@term_syntax.parse_term("0 - (i : Num) == 0"))
  let t477 = @int.arith_rule(@term_syntax.parse_term("((j : Num) - (i : Num) == 0) == (j <= i)"))
  let t478 = @int.arith_rule(@term_syntax.parse_term("(0 == (j : Num) - (i : Num)) == (j <= i)"))
  let t468 = @meson.meson_tac(@list.List([@arith.add_eq_0()]))
  let t479 = @tactics_refine.prove(@term_syntax.parse_term("(0 == (m : Num) + (n : Num)) == (m == 0 && n == 0)"), t468)
  let t480 = @int.arith_rule(@term_syntax.parse_term("0 + (m : Num) == m"))
  let t481 = @tactics_refine.prove(@term_syntax.parse_term("(-real_of_num(1) * (x : Real) <= -(y : Real)) == (y <= x)"), @calc_rat.real_arith_tac)
  let t482 = @tactics_refine.prove(@term_syntax.parse_term("(-real_of_num(1) * (x : Real) < -(y : Real)) == (y < x)"), @calc_rat.real_arith_tac)
  let t483 = @tactics_refine.prove(@term_syntax.parse_term("(-(x : Real) == -(y : Real)) == (x == y)"), @calc_rat.real_arith_tac)
  let t484 = @tactics_refine.prove(@term_syntax.parse_term("(-real_of_num((n : Num)) < -real_of_num((m : Num)) + real_of_num((r : Num))) == (real_of_num(m) < real_of_num(n) + real_of_num(r))"), @calc_rat.real_arith_tac)
  let t485 = @tactics_refine.prove(@term_syntax.parse_term("(-(x : Real) == -(y : Real)) == (x == y)"), @calc_rat.real_arith_tac)
  let t486 = @tactics_refine.prove(@term_syntax.parse_term("(real_of_num((n : Num)) < -real_of_num((m : Num)) + real_of_num((r : Num))) == (real_of_num(n) + real_of_num(m) < real_of_num(r))"), @calc_rat.real_arith_tac)
  let t487 = @tactics_refine.prove(@term_syntax.parse_term("(real_of_num((n : Num)) == -real_of_num((m : Num))) == (real_of_num(n) + real_of_num(m) == real_of_num(0))"), @calc_rat.real_arith_tac)
  let t488 = @tactics_refine.prove(@term_syntax.parse_term("(real_of_num((n : Num)) <= -real_of_num((m : Num))) == (real_of_num(n) + real_of_num(m) <= real_of_num(0))"), @calc_rat.real_arith_tac)
  let t489 = @tactics_refine.prove(@term_syntax.parse_term("(real_of_num((n : Num)) < -real_of_num((m : Num))) == (real_of_num(n) + real_of_num(m) < real_of_num(0))"), @calc_rat.real_arith_tac)
  let t490 = @tactics_refine.prove(@term_syntax.parse_term("(-real_of_num((n : Num)) == real_of_num((m : Num))) == (real_of_num(n) + real_of_num(m) == real_of_num(0))"), @calc_rat.real_arith_tac)
  let t491 = @tactics_refine.prove(@term_syntax.parse_term("(-real_of_num((n : Num)) <= real_of_num((m : Num))) == (real_of_num(0) <= real_of_num(n) + real_of_num(m))"), @calc_rat.real_arith_tac)
  let t492 = @tactics_refine.prove(@term_syntax.parse_term("(-real_of_num((n : Num)) < real_of_num((m : Num))) == (real_of_num(0) < real_of_num(n) + real_of_num(m))"), @calc_rat.real_arith_tac)
  let t493 = @calc_rat.real_arith(@term_syntax.parse_term("∀ a : Real, ∀ b : Real, a - b + b == a"))
  let list = @list.List([@analysis.real_neg_ge0(), @analysis.real_half_double(), @analysis.real_sub_refl(), @analysis.real_neg_neg(), @analysis.real_le_v1(), @arith.le_0(), @realax.real_add_linv(), @calc_int.real_add_rinv(), @analysis.real_neg_0(), @analysis.real_neg_le0(), @analysis.real_neg_ge0(), @analysis.real_le_negl(), @analysis.real_le_negr(), @analysis.real_le_neg2(), @real.real_neg_eq_0(), @analysis.real_sub_rneg(), @calc_rat.real_arith(@term_syntax.parse_term("∀ x : Real, (-x == x) == (x == real_of_num(0))")), t493, @realax.real_add_lid(), @calc_int.real_add_rid(), @realax.real_inv_0(), @realax.real_of_num_eq(), @realax.real_of_num_le(), @real.real_of_num_lt(), @realax.real_of_num_add(), @realax.real_of_num_mul(), @analysis.real_pos(), @analysis.real_mul_rzero(), @analysis.real_mul_lzero(), @real.real_le_01(), @analysis.real_sub_rzero(), @analysis.real_le_square(), @analysis.real_mul_rid(), @realax.real_mul_lid(), @real.real_abs_zero(), @calc_int.real_abs_num(), @real.real_abs_1(), @calc_int.real_abs_neg(), @real.real_abs_pos(), @analysis.abs_zero(), @analysis.abs_abs(), @analysis.real_neg_lt0(), @analysis.real_neg_gt0(), @analysis.real_lt_neg2(), @analysis.real_neg_mul2(), @calc_int.real_of_num_pow(), @real.real_lt_inv_eq(), @real.real_pow_1(), @float.real_inv2(), t492, t491, t490, t489, t488, t487, t486, t485, t484, t483, t482, t481, @arith.exp_1(), @arith.exp_lt_0(), @arith.add_0(), t480, @arith.add_eq_0(), t479, @arith.eq_add_lcancel_0(), @arith.eq_add_rcancel_0(), @arith.lt_add(), @arith.lt_addr(), t478, t477, t476, t475, t474, @nums.not_suc(), @nums.suc_inj(), @arith.pre(), @arith.add_clauses(), @arith.mult(), @arith.mult_clauses(), @arith.le(), @arith.lt(), t473, t472, t471, @trivia.o_def(), @trivia.i_thm(), @trivia.i_o_id(), @real.real_pow_1(), @real.real_pow_one(), @int.int_add_linv(), @int.int_add_rinv(), @int.int_add_sub2(), @int.int_eq_neg2(), @int.int_le_neg2(), @int.int_le_negl(), @int.int_le_negr(), @int.int_lt_neg2(), @int.int_lt_neg2(), @int.int_neg_neg(), @int.int_neg_0(), @int.int_neg_eq_0(), @int.int_neg_ge0(), @int.int_neg_gt0(), @int.int_neg_le0(), @int.int_neg_lt0(), t470, @int.int_neg_mul2(), @int.int_neg_neg()])
  let t494 = @simp.rewrite_tac(list)
  let (reduce_conv, reduce_tac) = (@simp.rewrite_conv(list), t494)
  reduce_conv_c.set(reduce_conv)
  reduce_tac_c.set(reduce_tac)
}

///|
/// REAL_POW_2_LE
fn step_44() -> Unit raise {
  let t496 = @simp.asm_simp_tac(@list.List([@real.pow_2_sqrt()]))
  let t497 = @simp.asm_simp_tac(@list.List([@real.real_pow_le()]))
  let t498 = @simp.asm_rewrite_tac(@list.List([]))
  let t495 = @term_syntax.parse_term("pow((y : Real), 2)")
  let t499 = @list.List([@tactics_ext.disch_all_tac, @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("pow((x : Real), 2)"), t495]), @real.sqrt_mono_le())), t498, t497, t496])
  real_pow_2_le_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, real_of_num(0) <= x && real_of_num(0) <= y && pow(x, 2) <= pow(y, 2) → x <= y"), t499))
}

///|
let real_pow_2_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_POW_2_LE")

///|
/// `REAL_POW_2_LE`
pub fn real_pow_2_le() -> @kernel.Thm {
  real_pow_2_le_c.get()
}

///|
/// REAL_POW_2_LT
fn step_45() -> Unit raise {
  let t501 = @simp.asm_simp_tac(@list.List([@real.pow_2_sqrt()]))
  let t502 = @simp.asm_simp_tac(@list.List([@real.real_pow_le()]))
  let t503 = @simp.asm_rewrite_tac(@list.List([]))
  let t500 = @term_syntax.parse_term("pow((y : Real), 2)")
  let t504 = @list.List([@tactics_ext.disch_all_tac, @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("pow((x : Real), 2)"), t500]), @real.sqrt_mono_lt())), t503, t502, t501])
  real_pow_2_lt_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, real_of_num(0) <= x && real_of_num(0) <= y && pow(x, 2) < pow(y, 2) → x < y"), t504))
}

///|
let real_pow_2_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_POW_2_LT")

///|
/// `REAL_POW_2_LT`
pub fn real_pow_2_lt() -> @kernel.Thm {
  real_pow_2_lt_c.get()
}

///|
/// SQUARE_TAC
fn step_46() -> Unit raise {
  let t507 = @simp.rewrite_tac(@list.List([]))
  let t505 = @tactics.match_mp_tac(real_pow_2_le())
  let t506 = @tactics.match_mp_tac(real_pow_2_lt())
  square_tac_c.set(@tactics.then_tac(@tactics.first(@list.List([@tactics.match_mp_tac(@real.real_le_lsqrt()), t506, t505])), t507))
}

///|
let square_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("SQUARE_TAC")

///|
/// `SQUARE_TAC`
pub fn square_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (square_tac_c.get())(x)
}

///|
/// `SPEC2_TAC`
pub fn spec2_tac(x508 : @kernel.Term) -> @tactics.Tactic raise {
  let t = x508
  @tactics.spec_tac(t, t)
}

///|
/// `IN_ELIM`
pub fn in_elim(x510 : Int64) -> @tactics.Tactic raise {
  let i = x510
  use_(i, @simp.rewrite_rule(@list.List([@sets.in_()])))
}

///|
/// `range`
pub fn range(x512 : Int64, x513 : Int64) -> @list.List[Int64] raise {
  let i = x512
  let n = x513
  if (n > 0L) {
    let t514 = @lib.sub63(n, 1L)
    range(@lib.add63(i, 1L), t514).prepend(i)
  } else {
    @list.List([])
  }
}

///|
/// `IN_OUT_TAC`
pub fn in_out_tac(x515 : @list.List[(String, @kernel.Thm)], x516 : @kernel.Term) -> @tactics.Goalstate raise {
  let (asl, g) = (x515, x516)
  let t517 = @tactics.every(@lib.map(in_elim, range(0L, Int::to_int64(@lib.length(asl)))))
  @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_()])), t517)((asl, g))
}

///|
/// `IWRITE_TAC`
pub fn iwrite_tac(x518 : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  let thlist = x518
  @simp.rewrite_tac(@lib.map(inr, thlist))
}

///|
/// `IWRITE_RULE`
pub fn iwrite_rule(x520 : @list.List[@kernel.Thm]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
  let thlist = x520
  @simp.rewrite_rule(@lib.map(inr, thlist))
}

///|
/// `IMATCH_MP`
pub fn imatch_mp(x522 : @kernel.Thm, x523 : @kernel.Thm) -> @kernel.Thm raise {
  let imp = x522
  let ant = x523
  let t524 = inr(ant)
  @drule.match_mp(inr(imp))(t524)
}

///|
/// `IMATCH_MP_TAC`
pub fn imatch_mp_tac(x525 : @kernel.Thm) -> @tactics.Tactic raise {
  let imp = x525
  @tactics.match_mp_tac(inr(imp))
}

///|
/// GBETA_TAC
fn step_47() -> Unit raise {
  gbeta_tac_c.set(@tactics.conv_tac(@equal.top_depth_conv(@pair.gen_beta_conv)))
}

///|
let gbeta_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("GBETA_TAC")

///|
/// `GBETA_TAC`
pub fn gbeta_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (gbeta_tac_c.get())(x)
}

///|
/// GBETA_RULE
fn step_48() -> Unit raise {
  let t527 = @equal.top_depth_conv(@pair.gen_beta_conv)
  gbeta_rule_c.set((x528 : @kernel.Thm) => @equal.conv_rule(t527, x528))
}

///|
let gbeta_rule_c : @lib.Cell[(@kernel.Thm) -> @kernel.Thm raise] = @lib.Cell::new("GBETA_RULE")

///|
/// `GBETA_RULE`
pub fn gbeta_rule(x : @kernel.Thm) -> @kernel.Thm raise {
  (gbeta_rule_c.get())(x)
}

///|
/// REP_CASES_TAC
fn step_49() -> Unit raise {
  rep_cases_tac_c.set(@tactics.repeat_tac(@tactics.disch_then(@tactics.repeat_tcl(@tactics.disj_cases_then)(fn(x529 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s530 = @tactics.assume_tac(x529)
    fn(x531 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s530(x531)
    }
  }))))
}

///|
let rep_cases_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("REP_CASES_TAC")

///|
/// `REP_CASES_TAC`
pub fn rep_cases_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (rep_cases_tac_c.get())(x)
}

///|
/// `TSPEC`
pub fn tspec(x532 : @kernel.Term, x533 : Int64) -> @tactics.Tactic raise {
  let t = x532
  let i = x533
  (x539 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => type_then(t, fn(x538 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    ((x535 : (@kernel.Thm) -> @kernel.Thm raise) => use_(i, x535))((fn(x536 : @kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
      fn(x537 : @kernel.Thm) -> @kernel.Thm raise {
        @bool.spec(x536, x537)
      }
    })(x538))
  }, x539)
}

///|
/// `IMP_REAL`
pub fn imp_real(x540 : @kernel.Term, x541 : Int64) -> @tactics.Tactic raise {
  let t = x540
  let i = x541
  use_(i, @drule.match_mp(@calc_rat.real_arith(t)))
}

///|
/// `TAPP`
pub fn tapp(x543 : @kernel.Term, x544 : Int64) -> @tactics.Tactic raise {
  let z = x543
  let i = x544
  (x549 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => type_then(z, fn(x546 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let u = x546
    use_(i, fn(x548 : @kernel.Thm) -> @kernel.Thm raise {
      let t = x548
      @equal.ap_thm(t, u)
    })
  }, x549)
}

///|
/// `ANT_TAC`
pub fn ant_tac(x550 : @kernel.Thm) -> @tactics.Tactic raise {
  let t = x550
  let (ant, co) = @basics.dest_imp(@kernel.concl(t))
  let t554 = @list.List([@tactics.all_tac, @tactics.disch_then(fn(x552 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let u = x552
    @tactics.mp_tac(@drule.match_mp(t)(u))
  })])
  @tactics.thenl(@tactics_ext.subgoal_tac(ant), t554)
}

///|
/// `TH_INTRO_TAC`
pub fn th_intro_tac(x555 : @list.List[@kernel.Term], x556 : @kernel.Thm) -> @tactics.Tactic raise {
  let tl = x555
  let th = x556
  (x560 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => typel_then(tl, fn(x558 : @list.List[@kernel.Term]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x558
    ant_tac(@bool.ispecl(t, th))
  }, x560)
}

///|
/// `THM_INTRO_TAC`
pub fn thm_intro_tac(x561 : @list.List[@kernel.Term], x562 : @kernel.Thm) -> @tactics.Tactic raise {
  let tl = x561
  let th = x562
  (x566 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => typel_then(tl, fn(x564 : @list.List[@kernel.Term]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x564
    let s = @bool.ispecl(t, th)
    if @basics.is_imp(@kernel.concl(s)) {
      ant_tac(s)
    } else {
      @tactics.assume_tac(s)
    }
  }, x566)
}

///|
/// DISCH_THEN_FULL_REWRITE
fn step_50() -> Unit raise {
  disch_then_full_rewrite_c.set(@tactics.disch_then(fn(x567 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x567
    let t569 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([t])))
    @tactics.then_tac(@simp.rewrite_tac(@list.List([t])), t569)
  }))
}

///|
let disch_then_full_rewrite_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("DISCH_THEN_FULL_REWRITE")

///|
/// `DISCH_THEN_FULL_REWRITE`
pub fn disch_then_full_rewrite(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (disch_then_full_rewrite_c.get())(x)
}

///|
/// `FULL_REWRITE_TAC`
pub fn full_rewrite_tac(x570 : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  let t = x570
  let t572 = @tactics.rule_assum_tac(@simp.rewrite_rule(t))
  @tactics.then_tac(@simp.rewrite_tac(t), t572)
}

///|
/// BASIC_TAC
fn step_51() -> Unit raise {
  let t581 = @tactics.first_assum(fn(x579 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t_1 = x579
    if (Int::to_int64(@lib.length(@bool.conjuncts_rule(t_1))) < 2L) {
      raise Failure("BASIC_TAC")
    } else {
      @tactics.undisch_tac(@kernel.concl(t_1))
    }
  })
  let t582 = @tactics.first_assum(fn(x576 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x576
    let t578 = @tactics.disch_then(@tactics.choose_tac)
    @tactics.then_tac(@tactics.undisch_tac(@kernel.concl(t)), t578)
  })
  let t583 = @tactics.disch_then(@tactics.choose_then(fn(x573 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s574 = @tactics.mp_tac(x573)
    fn(x575 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s574(x575)
    }
  }))
  basic_tac_c.set(@list.List([@tactics.gen_tac, imatch_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool) → (C : Bool)) → a && b → C"))), t583, t582, t581, @tactics.disch_tac]))
}

///|
let basic_tac_c : @lib.Cell[@list.List[@tactics.Tactic]] = @lib.Cell::new("BASIC_TAC")

///|
/// `BASIC_TAC`
pub fn basic_tac() -> @list.List[@tactics.Tactic] {
  basic_tac_c.get()
}

///|
/// REP_BASIC_TAC
fn step_52() -> Unit raise {
  rep_basic_tac_c.set(@tactics.repeat_tac(@tactics.changed_tac(@tactics.first(basic_tac()))))
}

///|
let rep_basic_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("REP_BASIC_TAC")

///|
/// `REP_BASIC_TAC`
pub fn rep_basic_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (rep_basic_tac_c.get())(x)
}

///|
/// `USE_FIRST`
pub fn use_first(x584 : (@kernel.Thm) -> @kernel.Thm raise) -> @tactics.Tactic raise {
  let rule = x584
  @tactics.first_assum(fn(x586 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x586
    let t592 = @tactics.disch_then(fn(x591 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x588 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s589 = @tactics.assume_tac(x588)
        fn(x590 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s589(x590)
        }
      })(rule(x591))
    })
    @tactics.then_tac(@tactics.undisch_tac(@kernel.concl(t)), t592)
  })
}

///|
/// `WITH_FIRST`
pub fn with_first(x593 : (@kernel.Thm) -> @kernel.Thm raise) -> @tactics.Tactic raise {
  let rule = x593
  @tactics.first_assum(fn(x595 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x595
    @tactics.assume_tac(rule(t))
  })
}

///|
/// `UNDF`
pub fn undf(x597 : @kernel.Term) -> @tactics.Tactic raise {
  let t = x597
  (x601 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => type_then(t, fn(x599 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x600 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      undisch_find_tac(x599, x600)
    }
  }, x601)
}

///|
/// `GRABF`
pub fn grabf(x602 : @kernel.Term, x603 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> @tactics.Tactic raise {
  let t = x602
  let ttac = x603
  let t605 = @tactics.disch_then(ttac)
  @tactics.then_tac(undf(t), t605)
}

///|
/// `USEF`
pub fn usef(x606 : @kernel.Term, x607 : (@kernel.Thm) -> @kernel.Thm raise) -> @tactics.Tactic raise {
  let t = x606
  let rule = x607
  (x614 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => type_then(t, fn(x609 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t_p = x609
    (x613 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => undisch_find_then(t_p, fn(x611 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let u = x611
      @tactics.assume_tac(rule(u))
    }, x613)
  }, x614)
}

///|
/// `EXISTSL_TAC`
pub fn existsl_tac(x615 : @list.List[@kernel.Term]) -> @tactics.Tactic raise {
  let tml = x615
  match tml {
    More(a, tail=tml_p) => {
      let t617 = existsl_tac(tml_p)
      @tactics.then_tac(@tactics.exists_tac(a), t617)
    }
    Empty => @tactics.all_tac
  }
}

///|
/// UNIFY_EXISTS_TAC
fn step_53() -> Unit raise {
  let run_one : (@kernel.Term) -> ((@kernel.Term) -> (((@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)])) -> (@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)]) raise) raise) raise = fn(x618 : @kernel.Term) -> ((@kernel.Term) -> (((@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)])) -> (@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)]) raise) raise) raise {
    let wc = x618
    fn(x619 : @kernel.Term) -> (((@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)])) -> (@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)]) raise) raise {
      let assum = x619
      fn(x620 : (@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)])) -> (@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)]) raise {
        let (varl, sofar) = x620
        if @list.List::is_empty(varl) {
          (varl, sofar)
        } else {
          try {
            let wc_p = @drule.instantiate((@list.List([]), sofar, @list.List([])), wc)
            let (_, ins, _) = @drule.term_unify(varl, wc_p, assum)
            let insv = @lib.map(fn(x621 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
              x621.1
            }, ins)
            let t622 = @lib.union(sofar, ins)
            (@lib.subtract(varl, insv), t622)
          } catch {
            failure => (varl, sofar)
          }
        }
      }
    }
  }
  let run_onel : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (((@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)])) -> (@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)]) raise) raise) raise = fn(x623 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> (((@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)])) -> (@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)]) raise) raise) raise {
    let asl = x623
    fn(x624 : @kernel.Term) -> (((@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)])) -> (@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)]) raise) raise {
      let wc_1 = x624
      fn(x625 : (@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)])) -> (@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)]) raise {
        let (varl_1, sofar_1) = x625
        let t626 = run_one(wc_1)
        @lib.itlist(fn(x627 : @kernel.Term, x628 : (@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)])) -> (@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)]) raise {
          let s629 = t626(x627)
          s629(x628)
        }, asl, (varl_1, sofar_1))
      }
    }
  }
  let run_all : (@list.List[@kernel.Term]) -> ((@list.List[(@kernel.Term, @kernel.Term)]) -> ((@list.List[@kernel.Term]) -> ((@list.List[@kernel.Term]) -> (@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)]) raise) raise) raise) raise = fn(x630 : @list.List[@kernel.Term]) -> ((@list.List[(@kernel.Term, @kernel.Term)]) -> ((@list.List[@kernel.Term]) -> ((@list.List[@kernel.Term]) -> (@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)]) raise) raise) raise) raise {
    let varl_2 = x630
    fn(x631 : @list.List[(@kernel.Term, @kernel.Term)]) -> ((@list.List[@kernel.Term]) -> ((@list.List[@kernel.Term]) -> (@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)]) raise) raise) raise {
      let sofar_2 = x631
      fn(x632 : @list.List[@kernel.Term]) -> ((@list.List[@kernel.Term]) -> (@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)]) raise) raise {
        let wcl = x632
        fn(x633 : @list.List[@kernel.Term]) -> (@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)]) raise {
          let asl_1 = x633
          let t634 = run_onel(asl_1)
          @lib.itlist(fn(x635 : @kernel.Term, x636 : (@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)])) -> (@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)]) raise {
            let s637 = t634(x635)
            s637(x636)
          }, wcl, (varl_2, sofar_2))
        }
      }
    }
  }
  let full_unify : ((@list.List[@kernel.Term], @kernel.Term)) -> @list.List[@kernel.Term] raise = fn(x638 : (@list.List[@kernel.Term], @kernel.Term)) -> @list.List[@kernel.Term] raise {
    let (asl_2, w) = x638
    let (varl_3, ws) = @basics.strip_exists(w)
    let vargl = @lib.map(fn(x639 : @kernel.HolType) -> @kernel.Term raise {
      @basics.genvar(x639)
    }, @lib.map(fn(x640 : @kernel.Term) -> @kernel.HolType raise {
      @kernel.type_of(x640)
    }, varl_3))
    let wg = @drule.instantiate((@list.List([]), @lib.zip(vargl, varl_3), @list.List([])), ws)
    let wcg = @basics.conjuncts(wg)
    let (vargl_p, sofar_3) = run_all(vargl)(@list.List([]))(wcg)(asl_2)
    if @list.List::is_empty(vargl_p) {
      let t646 = @lib.zip(vargl, varl_3)
      @lib.map(fn(x643 : @kernel.Term) -> @kernel.Term raise {
        (fn(x641 : @kernel.Term) -> ((@list.List[(@kernel.Term, @kernel.Term)]) -> @kernel.Term raise) raise {
          fn(x642 : @list.List[(@kernel.Term, @kernel.Term)]) -> @kernel.Term raise {
            @lib.rev_assoc(x641, x642)
          }
        })(x643)(sofar_3)
      }, @lib.map(fn(x647 : @kernel.Term) -> @kernel.Term raise {
        (fn(x644 : @kernel.Term) -> ((@list.List[(@kernel.Term, @kernel.Term)]) -> @kernel.Term raise) raise {
          fn(x645 : @list.List[(@kernel.Term, @kernel.Term)]) -> @kernel.Term raise {
            @lib.rev_assoc(x644, x645)
          }
        })(x647)(t646)
      }, varl_3))
    } else {
      raise Failure("full_unify: unification not found ")
    }
  }
  unify_exists_tac_c.set(fn(x648 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    let (asl_3, w_1) = x648
    try {
      let asl_p = @lib.map(fn(x651 : (String, @kernel.Thm)) -> @kernel.Term raise {
        (fn(x649 : @kernel.Thm) -> @kernel.Term raise {
          @kernel.concl(x649)
        })((fn(x650 : (String, @kernel.Thm)) -> @kernel.Thm raise {
          x650.1
        })(x651))
      }, asl_3)
      let asl_p_p = @lib.flat(@lib.map(fn(x652 : @kernel.Term) -> @list.List[@kernel.Term] raise {
        @basics.conjuncts(x652)
      }, asl_p))
      let varsub = full_unify((asl_p_p, w_1))
      existsl_tac(varsub)((asl_3, w_1))
    } catch {
      failure_1 => raise Failure("UNIFY_EXIST_TAC: unification not found.")
    }
  })
}

///|
let unify_exists_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("UNIFY_EXISTS_TAC")

///|
/// `UNIFY_EXISTS_TAC`
pub fn unify_exists_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (unify_exists_tac_c.get())(x)
}

///|
/// unify_exists_tac_example
fn step_54() -> Unit raise {
  unify_exists_tac_example_c.set(try {
    @tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ C : (Num, Num) -> Bool, ∀ a : Num, ∀ b : Num, ∀ v : Num, ∀ A : (Num) -> Bool, ∀ R : (Num) -> Bool, ∀ TX : (Num) -> Bool, ∀ U : (Num, Num) -> Bool, ∀ SS : (Num) -> Bool, A(v) && a == v && C(a, b) && R(a) → (∃ v : Num, ∃ v' : Num, TX(v') && U(v, v') && C(v', v) && SS(v))"), @list.List([rep_basic_tac, unify_exists_tac, @tactics_ext.rep_gen_tac, @tactics.disch_tac, unify_exists_tac]))
  } catch {
    failure => @kernel.refl(@term_syntax.parse_term("true"))
  })
}

///|
let unify_exists_tac_example_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("unify_exists_tac_example")

///|
/// `unify_exists_tac_example`
pub fn unify_exists_tac_example() -> @kernel.Thm {
  unify_exists_tac_example_c.get()
}

///|
/// UNIFY_EXISTS
fn step_55() -> Unit raise {
  let run_one : (@kernel.Term) -> ((@kernel.Term) -> (((@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)])) -> (@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)]) raise) raise) raise = fn(x653 : @kernel.Term) -> ((@kernel.Term) -> (((@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)])) -> (@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)]) raise) raise) raise {
    let wc = x653
    fn(x654 : @kernel.Term) -> (((@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)])) -> (@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)]) raise) raise {
      let assum = x654
      fn(x655 : (@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)])) -> (@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)]) raise {
        let (varl, sofar) = x655
        if @list.List::is_empty(varl) {
          (varl, sofar)
        } else {
          try {
            let wc_p = @drule.instantiate((@list.List([]), sofar, @list.List([])), wc)
            let (_, ins, _) = @drule.term_unify(varl, wc_p, assum)
            let insv = @lib.map(fn(x656 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
              x656.1
            }, ins)
            let t657 = @lib.union(sofar, ins)
            (@lib.subtract(varl, insv), t657)
          } catch {
            failure => (varl, sofar)
          }
        }
      }
    }
  }
  let run_onel : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> (((@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)])) -> (@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)]) raise) raise) raise = fn(x658 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> (((@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)])) -> (@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)]) raise) raise) raise {
    let asl = x658
    fn(x659 : @kernel.Term) -> (((@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)])) -> (@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)]) raise) raise {
      let wc_1 = x659
      fn(x660 : (@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)])) -> (@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)]) raise {
        let (varl_1, sofar_1) = x660
        let t661 = run_one(wc_1)
        @lib.itlist(fn(x662 : @kernel.Term, x663 : (@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)])) -> (@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)]) raise {
          let s664 = t661(x662)
          s664(x663)
        }, asl, (varl_1, sofar_1))
      }
    }
  }
  let run_all : (@list.List[@kernel.Term]) -> ((@list.List[(@kernel.Term, @kernel.Term)]) -> ((@list.List[@kernel.Term]) -> ((@list.List[@kernel.Term]) -> (@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)]) raise) raise) raise) raise = fn(x665 : @list.List[@kernel.Term]) -> ((@list.List[(@kernel.Term, @kernel.Term)]) -> ((@list.List[@kernel.Term]) -> ((@list.List[@kernel.Term]) -> (@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)]) raise) raise) raise) raise {
    let varl_2 = x665
    fn(x666 : @list.List[(@kernel.Term, @kernel.Term)]) -> ((@list.List[@kernel.Term]) -> ((@list.List[@kernel.Term]) -> (@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)]) raise) raise) raise {
      let sofar_2 = x666
      fn(x667 : @list.List[@kernel.Term]) -> ((@list.List[@kernel.Term]) -> (@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)]) raise) raise {
        let wcl = x667
        fn(x668 : @list.List[@kernel.Term]) -> (@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)]) raise {
          let asl_1 = x668
          let t669 = run_onel(asl_1)
          @lib.itlist(fn(x670 : @kernel.Term, x671 : (@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)])) -> (@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)]) raise {
            let s672 = t669(x670)
            s672(x671)
          }, wcl, (varl_2, sofar_2))
        }
      }
    }
  }
  let full_unify : ((@kernel.Thm, @kernel.Term)) -> @list.List[@kernel.Term] raise = fn(x673 : (@kernel.Thm, @kernel.Term)) -> @list.List[@kernel.Term] raise {
    let (t, w) = x673
    let (varl_3, ws) = @basics.strip_exists(w)
    let vargl = @lib.map(fn(x674 : @kernel.HolType) -> @kernel.Term raise {
      @basics.genvar(x674)
    }, @lib.map(fn(x675 : @kernel.Term) -> @kernel.HolType raise {
      @kernel.type_of(x675)
    }, varl_3))
    let wg = @drule.instantiate((@list.List([]), @lib.zip(vargl, varl_3), @list.List([])), ws)
    let wcg = @basics.conjuncts(wg)
    let t676 = @list.List([@kernel.concl(t)])
    let (vargl_p, sofar_3) = run_all(vargl)(@list.List([]))(wcg)(t676)
    if @list.List::is_empty(vargl_p) {
      let t682 = @lib.zip(vargl, varl_3)
      @lib.map(fn(x679 : @kernel.Term) -> @kernel.Term raise {
        (fn(x677 : @kernel.Term) -> ((@list.List[(@kernel.Term, @kernel.Term)]) -> @kernel.Term raise) raise {
          fn(x678 : @list.List[(@kernel.Term, @kernel.Term)]) -> @kernel.Term raise {
            @lib.rev_assoc(x677, x678)
          }
        })(x679)(sofar_3)
      }, @lib.map(fn(x683 : @kernel.Term) -> @kernel.Term raise {
        (fn(x680 : @kernel.Term) -> ((@list.List[(@kernel.Term, @kernel.Term)]) -> @kernel.Term raise) raise {
          fn(x681 : @list.List[(@kernel.Term, @kernel.Term)]) -> @kernel.Term raise {
            @lib.rev_assoc(x680, x681)
          }
        })(x683)(t682)
      }, varl_3))
    } else {
      raise Failure("full_unify: unification not found ")
    }
  }
  unify_exists_c.set(fn(x684 : @kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let t_1 = x684
    fn(x685 : @kernel.Term) -> @kernel.Thm raise {
      let w_1 = x685
      try {
        if !@basics.is_exists(w_1) {
          raise Failure("UNIFY_EXISTS: not EXISTS")
        } else {
          let varl_p = full_unify((t_1, w_1))
          let (varl_4, ws_1) = @basics.strip_exists(w_1)
          let varsub = @lib.zip(varl_p, varl_4)
          let varlb = @lib.map(fn(x686 : Int64) -> (@list.List[@kernel.Term], @list.List[@kernel.Term]) raise {
            let s = x686
            let t687 = @lib.rev(varl_4)
            @lib.chop_list(@lib.int63_to_int(s), t687)
          }, range(1L, Int::to_int64(@lib.length(varl_4))))
          let targets = @lib.map(fn(x688 : (@list.List[@kernel.Term], @list.List[@kernel.Term])) -> @kernel.Term raise {
            let s_1 = x688
            @drule.instantiate((@list.List([]), varsub, @list.List([])), @bool.list_mk_exists(@lib.rev(s_1.0), ws_1))
          }, varlb)
          let target_zip = @lib.zip(@lib.rev(targets), varl_p)
          @lib.itlist(fn(x689 : (@kernel.Term, @kernel.Term), x690 : @kernel.Thm) -> @kernel.Thm raise {
            let s_2 = x689
            let th = x690
            @bool.exists_rule(s_2.0, s_2.1, th)
          }, target_zip, t_1)
        }
      } catch {
        failure_1 => raise Failure("UNIFY_EXISTS: unification not found.")
      }
    }
  })
}

///|
let unify_exists_c : @lib.Cell[(@kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise] = @lib.Cell::new("UNIFY_EXISTS")

///|
/// `UNIFY_EXISTS`
pub fn unify_exists(x : @kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  (unify_exists_c.get())(x)
}

///|
/// unify_exists_example
fn step_56() -> Unit raise {
  let t691 = @term_syntax.parse_term("∃ x : Num, ∃ y : Num, x == y")
  unify_exists_example_c.set(unify_exists(@int.arith_rule(@term_syntax.parse_term("2 == 0 + 2")))(t691))
}

///|
let unify_exists_example_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("unify_exists_example")

///|
/// `unify_exists_example`
pub fn unify_exists_example() -> @kernel.Thm {
  unify_exists_example_c.get()
}

///|
/// `DROP_ANT_TAC`
pub fn drop_ant_tac(x692 : @kernel.Term) -> @tactics.Tactic raise {
  let pq = x692
  let t700 = @tactics.disch_then(fn(x695 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let pthm_1 = x695
    let t699 = @tactics.disch_then(fn(x697 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let pqthm = x697
      @tactics.assume_tac(@drule.match_mp(pqthm)(pthm_1))
    })
    @tactics.then_tac(@tactics.assume_tac(pthm_1), t699)
  })
  let t694 = @tactics.undisch_tac(@basics.dest_imp(pq).0)
  @tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(pq), t694), t700)
}

///|
/// `DROP_ALL_ANT_TAC`
pub fn drop_all_ant_tac(x701 : @list.List[(String, @kernel.Thm)], x702 : @kernel.Term) -> @tactics.Goalstate raise {
  let (asl, w) = (x701, x702)
  let imps = @lib.filter(fn(x703 : @kernel.Term) -> Bool raise {
    @basics.is_imp(x703)
  }, @lib.map(fn(x706 : (String, @kernel.Thm)) -> @kernel.Term raise {
    (fn(x704 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x704)
    })((fn(x705 : (String, @kernel.Thm)) -> @kernel.Thm raise {
      x705.1
    })(x706))
  }, asl))
  @tactics.map_every(fn(x710 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x707 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s708 = @tactics.try_tac(x707)
      fn(x709 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s708(x709)
      }
    })(drop_ant_tac(x710))
  }, imps)((asl, w))
}

///|
/// drop_ant_tac_example
fn step_57() -> Unit raise {
  let t712 = @list.List([rep_basic_tac, fn(x711 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    drop_all_ant_tac(x711.0, x711.1)
  }, @simp.asm_rewrite_tac(@list.List([]))])
  drop_ant_tac_example_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ A : Bool, ∀ B : Bool, ∀ C : Bool, ∀ D : Bool, ∀ E : Bool, A && (A → B) && (C → D) && C → E || C || B"), t712))
}

///|
let drop_ant_tac_example_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("drop_ant_tac_example")

///|
/// `drop_ant_tac_example`
pub fn drop_ant_tac_example() -> @kernel.Thm {
  drop_ant_tac_example_c.get()
}

///|
/// `BACK_TAC`
pub fn back_tac(x713 : @kernel.Term, x714 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let tm = x713
  let (asl, w) = x714
  let ng = @bool.mk_imp(tm, w)
  let t715 = @list.List([@tactics.all_tac, @tactics.disch_then(imatch_mp_tac)])
  @tactics.thenl(@tactics_ext.subgoal_tac(ng), t715)((asl, w))
}

///|
/// `label_of_hash`
pub fn label_of_hash(x716 : (@list.List[(String, @kernel.Thm)], @kernel.Term), x717 : Int64) -> Int64 raise {
  let (asl, g) = x716
  let _ as h = x717
  let one_label : (Int64) -> (((String, @kernel.Thm)) -> Int64 raise) raise = fn(x718 : Int64) -> (((String, @kernel.Thm)) -> Int64 raise) raise {
    let h_1 = x718
    fn(x719 : (String, @kernel.Thm)) -> Int64 raise {
      let (s, tm) = x719
      if (h_1 == @tactics_fix.hash_of_term(@kernel.concl(tm))) {
        let s1 = @lib.string_sub(s, 2, @lib.int63_to_int(@lib.sub63(Int::to_int64(@lib.string_length(s)), 2L)))
        @lib.int63_of_string(s1)
      } else {
        raise Failure("label_of_hash")
      }
    }
  }
  @lib.tryfind(one_label(h), asl)
}

///|
/// `HASHIFY`
pub fn[TA] hashify(x720 : (Int64) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> TA raise) raise, x721 : Int64, x722 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> TA raise {
  let m = x720
  let h = x721
  let w = x722
  m(label_of_hash(w, h))(w)
}

///|
/// UNDH
fn step_58() -> Unit raise {
  undh_c.set(fn(x727 : Int64) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x728 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x725 : Int64, x726 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => hashify(fn(x723 : Int64) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        fn(x724 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          und(x723, x724)
        }
      }, x725, x726))(x727, x728)
    }
  })
}

///|
let undh_c : @lib.Cell[(Int64) -> ((@tactics.Goal) -> @tactics.Goalstate raise) raise] = @lib.Cell::new("UNDH")

///|
/// `UNDH`
pub fn undh(x : Int64) -> ((@tactics.Goal) -> @tactics.Goalstate raise) raise {
  (undh_c.get())(x)
}

///|
/// REWRH
fn step_59() -> Unit raise {
  rewrh_c.set(fn(x731 : Int64) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x732 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x729 : Int64, x730 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => hashify(rewr, x729, x730))(x731, x732)
    }
  })
}

///|
let rewrh_c : @lib.Cell[(Int64) -> ((@tactics.Goal) -> @tactics.Goalstate raise) raise] = @lib.Cell::new("REWRH")

///|
/// `REWRH`
pub fn rewrh(x : Int64) -> ((@tactics.Goal) -> @tactics.Goalstate raise) raise {
  (rewrh_c.get())(x)
}

///|
/// KILLH
fn step_60() -> Unit raise {
  killh_c.set(fn(x735 : Int64) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x736 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x733 : Int64, x734 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => hashify(kill, x733, x734))(x735, x736)
    }
  })
}

///|
let killh_c : @lib.Cell[(Int64) -> ((@tactics.Goal) -> @tactics.Goalstate raise) raise] = @lib.Cell::new("KILLH")

///|
/// `KILLH`
pub fn killh(x : Int64) -> ((@tactics.Goal) -> @tactics.Goalstate raise) raise {
  (killh_c.get())(x)
}

///|
/// COPYH
fn step_61() -> Unit raise {
  copyh_c.set(fn(x739 : Int64) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x740 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x737 : Int64, x738 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => hashify(copy, x737, x738))(x739, x740)
    }
  })
}

///|
let copyh_c : @lib.Cell[(Int64) -> ((@tactics.Goal) -> @tactics.Goalstate raise) raise] = @lib.Cell::new("COPYH")

///|
/// `COPYH`
pub fn copyh(x : Int64) -> ((@tactics.Goal) -> @tactics.Goalstate raise) raise {
  (copyh_c.get())(x)
}

///|
/// `HASHIFY1`
pub fn[TA, TB] hashify1(x741 : (Int64) -> ((TB) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> TA raise) raise) raise, x742 : Int64, x743 : TB, x744 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> TA raise {
  let m = x741
  let h = x742
  let tm = x743
  let w = x744
  m(label_of_hash(w, h))(tm)(w)
}

///|
/// USEH
fn step_62() -> Unit raise {
  useh_c.set(fn(x752 : Int64) -> (((@kernel.Thm) -> @kernel.Thm raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
    fn(x753 : (@kernel.Thm) -> @kernel.Thm raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      fn(x754 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        ((x749 : Int64, x750 : (@kernel.Thm) -> @kernel.Thm raise, x751 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => hashify1(fn(x745 : Int64) -> (((@kernel.Thm) -> @kernel.Thm raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
          fn(x746 : (@kernel.Thm) -> @kernel.Thm raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s747 = use_(x745, x746)
            fn(x748 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s747(x748)
            }
          }
        }, x749, x750, x751))(x752, x753, x754)
      }
    }
  })
}

///|
let useh_c : @lib.Cell[(Int64) -> (((@kernel.Thm) -> @kernel.Thm raise) -> ((@tactics.Goal) -> @tactics.Goalstate raise) raise) raise] = @lib.Cell::new("USEH")

///|
/// `USEH`
pub fn useh(x : Int64) -> (((@kernel.Thm) -> @kernel.Thm raise) -> ((@tactics.Goal) -> @tactics.Goalstate raise) raise) raise {
  (useh_c.get())(x)
}

///|
/// LEFTH
fn step_63() -> Unit raise {
  lefth_c.set(fn(x762 : Int64) -> ((String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
    fn(x763 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      fn(x764 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        ((x759 : Int64, x760 : String, x761 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => hashify1(fn(x755 : Int64) -> ((String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
          fn(x756 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s757 = left(x755, x756)
            fn(x758 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s757(x758)
            }
          }
        }, x759, x760, x761))(x762, x763, x764)
      }
    }
  })
}

///|
let lefth_c : @lib.Cell[(Int64) -> ((String) -> ((@tactics.Goal) -> @tactics.Goalstate raise) raise) raise] = @lib.Cell::new("LEFTH")

///|
/// `LEFTH`
pub fn lefth(x : Int64) -> ((String) -> ((@tactics.Goal) -> @tactics.Goalstate raise) raise) raise {
  (lefth_c.get())(x)
}

///|
/// RIGHTH
fn step_64() -> Unit raise {
  righth_c.set(fn(x772 : Int64) -> ((String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
    fn(x773 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      fn(x774 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        ((x769 : Int64, x770 : String, x771 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => hashify1(fn(x765 : Int64) -> ((String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
          fn(x766 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s767 = right(x765, x766)
            fn(x768 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s767(x768)
            }
          }
        }, x769, x770, x771))(x772, x773, x774)
      }
    }
  })
}

///|
let righth_c : @lib.Cell[(Int64) -> ((String) -> ((@tactics.Goal) -> @tactics.Goalstate raise) raise) raise] = @lib.Cell::new("RIGHTH")

///|
/// `RIGHTH`
pub fn righth(x : Int64) -> ((String) -> ((@tactics.Goal) -> @tactics.Goalstate raise) raise) raise {
  (righth_c.get())(x)
}

///|
/// `TSPECH`
pub fn tspech(x775 : @kernel.Term, x776 : Int64, x777 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let tm = x775
  let h = x776
  let w = x777
  tspec(tm, label_of_hash(w, h))(w)
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
}
