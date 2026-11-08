// Translated from upstream GL/decid.ml; edit this file directly.

///|
/// HOLDS_NNFC_UNFOLD
fn step_1() -> Unit raise {
  let t1 = @meson.meson_tac(@list.List([]))
  let t2 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@modal.holds()])), t1)
  holds_nnfc_unfold_c.set(@tactics.prove(@term_syntax.parse_term("(∀ V : (List[Char], W) -> Bool, ∀ w : W, !holds(((W : (W) -> Bool), (R : (W, W) -> Bool)), V, False, w)) && (∀ V : (List[Char], W) -> Bool, ∀ w : W, holds((W, R), V, True, w)) && (∀ V : (List[Char], W) -> Bool, ∀ s : List[Char], ∀ w : W, holds((W, R), V, Atom(s), w) == V(s, w)) && (∀ V : (List[Char], W) -> Bool, ∀ p : Form, ∀ w : W, holds((W, R), V, Not(p), w) == !holds((W, R), V, p, w)) && (∀ p : Form, ∀ V : (List[Char], W) -> Bool, ∀ q : Form, ∀ w : W, holds((W, R), V, op_amp_amp(p, q), w) == (holds((W, R), V, p, w) && holds((W, R), V, q, w))) && (∀ p : Form, ∀ V : (List[Char], W) -> Bool, ∀ q : Form, ∀ w : W, holds((W, R), V, op_bar_bar(p, q), w) == (holds((W, R), V, p, w) || holds((W, R), V, q, w))) && (∀ p : Form, ∀ V : (List[Char], W) -> Bool, ∀ q : Form, ∀ w : W, holds((W, R), V, op_minus_minus_gt(p, q), w) == (!holds((W, R), V, p, w) || holds((W, R), V, q, w))) && (∀ p : Form, ∀ V : (List[Char], W) -> Bool, ∀ q : Form, ∀ w : W, holds((W, R), V, op_lt_minus_gt(p, q), w) == ((holds((W, R), V, p, w) || !holds((W, R), V, q, w)) && (!holds((W, R), V, p, w) || holds((W, R), V, q, w))))"), t2))
}

///|
let holds_nnfc_unfold_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLDS_NNFC_UNFOLD")

///|
/// `HOLDS_NNFC_UNFOLD`
pub fn holds_nnfc_unfold() -> @kernel.Thm {
  holds_nnfc_unfold_c.get()
}

///|
/// COMPLETENESS_NUM
fn step_2() -> Unit raise {
  let t3 = @term_syntax.parse_type("A")
  let t4 = @kernel.inst_type(@list.List([(@term_syntax.parse_type("Num"), t3)]), @completeness.completeness_theorem_gen())
  let completeness_theorem_num = @simp.rewrite_rule(@list.List([@sets.num_infinite()]))(t4)
  let t15 = @meson.asm_meson_tac(@list.List([]))
  let t14 = @simp.asm_rewrite_tac(@list.List([]))
  let t13 = @theorems.hyp_tac("tnt", @simp.rewrite_rule(@list.List([@modal.transnt()])))
  let t12 = @tactics.exists_tac(@term_syntax.parse_term("(w : A)"))
  let t11 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@modal.holds_in(), @modal.holds(), @theorems.right_imp_forall_thm(), @theorems.imp_imp()]))(@gl.transnt_imp_lob()))
  let t10 = @tactics.repeat_tac(@tactics.strip_tac)
  let t8 = @simp.asm_rewrite_tac(@list.List([]))
  let t9 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@gl.itf_nt()), t8), @tactics.all_tac])
  let t7 = @theorems.claim_tac("tnt", @term_syntax.parse_term("TRANSNT(((W : (A) -> Bool), (R : (A, A) -> Bool)))"))
  let t6 = @list.List([@meson.meson_tac(@list.List([])), @tactics.all_tac])
  let t5 = @simp.rewrite_tac(@list.List([@modal.holds()]))
  let t16 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@theorems.intro_tac("forall W R p w; WR w"), t5), @tactics.eq_tac), t6), t7), t9), t10), t11), t12), t13), t14), t15)
  let holds_box_eq = @tactics.prove(@term_syntax.parse_term("∀ W : (A) -> Bool, ∀ R : (A, A) -> Bool, ∀ p : Form, ∀ w : A, ITF((W, R)) && IN(w, W) → holds((W, R), (V : (List[Char], A) -> Bool), Box(p), w) == (∀ y : A, IN(y, W) && R(w, y) → holds((W, R), V, op_minus_minus_gt(Box(p), p), y))"), t16)
  let t36 = @meson.asm_meson_tac(@list.List([@gl.itf()]))
  let t35 = @simp.once_rewrite_tac(@list.List([@modal.holds()]))
  let t33 = @meson.meson_tac(@list.List([]))
  let t34 = @list.List([@tactics.then_tac(@tactics.pop_assum(fn(x30 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s31 = @tactics.mp_tac(x30)
    fn(x32 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s31(x32)
    }
  }), t33), @tactics.all_tac])
  let t28 = @meson.asm_meson_tac(@list.List([]))
  let t27 = @simp.once_rewrite_tac(@list.List([@modal.holds()]))
  let t26 = @simp.asm_simp_tac(@list.List([holds_box_eq]))
  let t29 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t26), t27), t28), @tactics.all_tac])
  let t25 = @tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("(P : Bool) && (P → (Q : Bool)) → P && Q")))
  let t24 = @list.List([@meson.asm_meson_tac(@list.List([@gl.itf()])), @tactics.all_tac])
  let t23 = @simp.asm_rewrite_tac(@list.List([]))
  let t22 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t21 = @tactics.repeat_tac(@tactics.strip_tac)
  let t20 = @theorems.intro_tac("itf")
  let t19 = @tactics.repeat_tac(@tactics.gen_tac)
  let t18 = @simp.rewrite_tac(@list.List([@modal.valid(), @pair.forall_pair_thm(), @modal.holds_in()]))
  let t17 = @tactics.match_mp_tac(completeness_theorem_num)
  let t37 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))), @tactics.disch_tac), t17), t18), t19), t20), t21), t22), t23), @tactics.conj_tac), t24), t25), @tactics.conj_tac), t29), @tactics.disch_tac), @tactics.conj_tac), t34), t35), t36)
  completeness_num_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, (∀ W : (Num) -> Bool, ∀ R : (Num, Num) -> Bool, ∀ V : (List[Char], Num) -> Bool, ∀ w : Num, (∀ x : Num, ∀ y : Num, ∀ z : Num, R(y, z) → R(x, y) → R(x, z)) && (∀ p : Form, ∀ w : Num, IN(w, W) && (∀ y : Num, IN(y, W) && R(w, y) && holds((W, R), V, Box(p), y) → holds((W, R), V, p, y)) → holds((W, R), V, Box(p), w)) && (∀ Q : Bool, ∀ p : Form, ∀ w : Num, IN(w, W) && (∀ y : Num, IN(y, W) && R(w, y) && holds((W, R), V, Box(p), y) → holds((W, R), V, p, y) || Q) → holds((W, R), V, Box(p), w) || Q) && (∀ w : Num, ∀ w' : Num, R(w, w') → (∀ p : Form, holds((W, R), V, Box(p), w) → holds((W, R), V, p, w'))) && (∀ p : Form, ∀ w : Num, holds((W, R), V, Box(p), w) → (∀ w' : Num, R(w, w') → holds((W, R), V, p, w'))) && IN(w, W) → holds((W, R), V, p, w)) → op_bar_minus_minus(p)"), t37))
}

///|
let completeness_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLETENESS_NUM")

///|
/// `COMPLETENESS_NUM`
pub fn completeness_num() -> @kernel.Thm {
  completeness_num_c.get()
}

///|
/// DISCARD_TAC
fn step_3() -> Unit raise {
  let truth_tm = @kernel.concl(@bool.truth())
  discard_tac_c.set(fn(x38 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x38
    let tm = @kernel.concl(th)
    if (tm == truth_tm) {
      @tactics.all_tac
    } else {
      fn(x40 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        let (asl, w) as g = x40
        if @lib.exists(fn(x41 : (String, @kernel.Thm)) -> Bool raise {
          let a = x41
          @basics.aconv(tm, @kernel.concl(a.1))
        }, asl) {
          @tactics.all_tac(g)
        } else {
          raise Failure("DISCARD_TAC: not already present")
        }
      }
    }
  })
}

///|
let discard_tac_c : @lib.Cell[@tactics.ThmTactic] = @lib.Cell::new("DISCARD_TAC")

///|
/// `DISCARD_TAC`
pub fn discard_tac(x : @kernel.Thm) -> @tactics.Tactic raise {
  (discard_tac_c.get())(x)
}

///|
/// `NEG_RIGHT_TAC`
pub fn neg_right_tac(x42 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> @tactics.Tactic raise {
  let _ as k = x42
  let pth = @meson.meson(@list.List([]), @term_syntax.parse_term("(!(P : Bool) || (Q : Bool)) == (P → Q) && !P == (P → false)"))
  let t45 = @tactics.disch_then(k)
  @tactics.then_tac(@simp.gen_rewrite_tac(fn(x44 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x44
  }, @list.List([pth])), t45)
}

///|
/// NEG_CONTR_TAC
fn step_4() -> Unit raise {
  let pth = @meson.meson(@list.List([]), @term_syntax.parse_term("!(P : Bool) → P → (Q : Bool)"))
  neg_contr_tac_c.set(fn(x46 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x46
    let t51 = @tactics.first_x_assum(fn(x48 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s49 = @tactics.match_accept_tac(x48)
      fn(x50 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s49(x50)
      }
    })
    @tactics.then_tac(@tactics.match_mp_tac(@drule.match_mp(pth)(th)), t51)
  })
}

///|
let neg_contr_tac_c : @lib.Cell[@tactics.ThmTactic] = @lib.Cell::new("NEG_CONTR_TAC")

///|
/// `NEG_CONTR_TAC`
pub fn neg_contr_tac(x : @kernel.Thm) -> @tactics.Tactic raise {
  (neg_contr_tac_c.get())(x)
}

///|
/// NEG_LEFT_TAC
fn step_5() -> Unit raise {
  let pth = @meson.meson(@list.List([]), @term_syntax.parse_term("!(P : Bool) → P || (Q : Bool) → Q"))
  let t52 = @drule.match_mp(pth)
  neg_left_tac_c.set(fn(x53 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t52(x53))
  })
}

///|
let neg_left_tac_c : @lib.Cell[@tactics.ThmTactic] = @lib.Cell::new("NEG_LEFT_TAC")

///|
/// `NEG_LEFT_TAC`
pub fn neg_left_tac(x : @kernel.Thm) -> @tactics.Tactic raise {
  (neg_left_tac_c.get())(x)
}

///|
/// `GEN_BOX_RIGHT_TAC`
pub fn gen_box_right_tac(x54 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise, x55 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> @tactics.Tactic raise {
  let _ as kacc = x54
  let _ as kholds = x55
  let t63 = @tactics.then_tac(@tactics.gen_tac, @tactics.disch_then(@tactics.conjuncts_then2(fn(x60 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s61 = @tactics.assume_tac(x60)
    fn(x62 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s61(x62)
    }
  }, @tactics.conjuncts_then2(kacc, kholds))))
  let ptac : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = @tactics.thenl(@tactics.conj_tac, @list.List([@tactics.first_assum(fn(x57 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s58 = @tactics.match_accept_tac(x57)
    fn(x59 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s58(x59)
    }
  }), t63]))
  let ttac : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise = fn(x64 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x64
    @tactics.then_tac(@tactics.match_mp_tac(th), ptac)
  }
  let t66 = @tactics.use_then("boxr2", ttac)
  @tactics.orelse_tac(@tactics.use_then("boxr1", ttac), t66)
}

///|
/// HOLDS_NNFC_UNFOLD_CONV
fn step_6() -> Unit raise {
  holds_nnfc_unfold_conv_c.set(@equal.thenc(@simp.gen_rewrite_conv(fn(x67 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s68 = @equal.top_depth_conv(x67)
    fn(x69 : @kernel.Term) -> @kernel.Thm raise {
      s68(x69)
    }
  }, @list.List([holds_nnfc_unfold(), @theorems.or_clauses(), @theorems.and_clauses()])), @canon.nnfc_conv))
}

///|
let holds_nnfc_unfold_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("HOLDS_NNFC_UNFOLD_CONV")

///|
/// `HOLDS_NNFC_UNFOLD_CONV`
pub fn holds_nnfc_unfold_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (holds_nnfc_unfold_conv_c.get())(x)
}

///|
/// STRIP_HOLDS_TCL
fn step_7() -> Unit raise {
  let strip_tcl : ((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> ((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise = @tactics.first_tcl(@list.List([@tactics.conjuncts_then, @tactics.disj_cases_then]))
  let rule : (@kernel.Thm) -> @kernel.Thm raise = (x70 : @kernel.Thm) => @equal.conv_rule(holds_nnfc_unfold_conv, x70)
  strip_holds_tcl_c.set(fn(x71 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> ((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
    let ttac = x71
    let t73 = @tactics.repeat_tcl(strip_tcl)(ttac)
    fn(x74 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      t73(rule(x74))
    }
  })
}

///|
let strip_holds_tcl_c : @lib.Cell[@tactics.ThmTactical] = @lib.Cell::new("STRIP_HOLDS_TCL")

///|
/// `STRIP_HOLDS_TCL`
pub fn strip_holds_tcl(x : @tactics.ThmTactic) -> @tactics.ThmTactic raise {
  (strip_holds_tcl_c.get())(x)
}

///|
/// ASSUME_HOLDS_LITERAL_TAC
fn step_8() -> Unit raise {
  let rewr_tac : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise = fn(x75 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x75
    let pth = @meson.meson(@list.List([]), @term_syntax.parse_term("(true || (p : Bool)) == true && (p || true) == true && (false || p) == p && (p || false) == p"))
    @simp.gen_rewrite_tac(fn(x77 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s78 = @equal.depth_conv(x77)
      fn(x79 : @kernel.Term) -> @kernel.Thm raise {
        s78(x79)
      }
    }, @list.List([th, pth]))
  }
  let lbl_tac : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise = fn(x80 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x80
    let t84 = @tactics.label_tac("holds", th_1)
    let t83 = discard_tac(th_1)
    let t82 = @tactics.contr_tac(th_1)
    @tactics.orelse_tac(@tactics.orelse_tac(@tactics.then_tac(rewr_tac(th_1), t82), t83), t84)
  }
  assume_holds_literal_tac_c.set(fn(x85 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x85
    let t89 = @tactics.first(@lib.mapfilter(fn(x87 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let ttac = x87
      ttac(th_2)
    }, @list.List([neg_contr_tac, neg_left_tac, lbl_tac])))
    @tactics.then_tac(rewr_tac(th_2), t89)
  })
}

///|
let assume_holds_literal_tac_c : @lib.Cell[@tactics.ThmTactic] = @lib.Cell::new("ASSUME_HOLDS_LITERAL_TAC")

///|
/// `ASSUME_HOLDS_LITERAL_TAC`
pub fn assume_holds_literal_tac(x : @kernel.Thm) -> @tactics.Tactic raise {
  (assume_holds_literal_tac_c.get())(x)
}

///|
/// `STEP_BOXL1_TCL`
pub fn step_boxl1_tcl(x90 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise, x91 : @kernel.Thm) -> @tactics.Tactic raise {
  let k = x90
  let acc = x91
  @tactics.use_then("boxl1", fn(x93 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let boxl1 = x93
    try {
      let f : (@kernel.Thm) -> @kernel.Thm raise = @drule.match_mp(@drule.match_mp(boxl1)(acc))
      let t95 = strip_holds_tcl(k)
      @tactics.assum_list(fn(x98 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        ((x96 : @list.List[@kernel.Thm]) => @tactics.map_every(t95, x96))(((x97 : @list.List[@kernel.Thm]) => @lib.mapfilter(f, x97))(x98))
      })
    } catch {
      Failure(_) => @tactics.all_tac
      e => raise e
    }
  })
}

///|
/// `STEP_BOXL2_TCL`
pub fn step_boxl2_tcl(x99 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise, x100 : @kernel.Thm) -> @tactics.Tactic raise {
  let k = x99
  let hth = x100
  @tactics.use_then("boxl2", fn(x102 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let boxl2 = x102
    try {
      let f : (@kernel.Thm) -> @kernel.Thm raise = @drule.match_mp(@drule.match_mp(boxl2)(hth))
      let t104 = strip_holds_tcl(k)
      @tactics.assum_list(fn(x107 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        ((x105 : @list.List[@kernel.Thm]) => @tactics.map_every(t104, x105))(((x106 : @list.List[@kernel.Thm]) => @lib.mapfilter(f, x106))(x107))
      })
    } catch {
      Failure(_) => @tactics.all_tac
      e => raise e
    }
  })
}

///|
/// `ACC_TCL`
pub fn acc_tcl(x108 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise, x109 : @kernel.Thm) -> @tactics.Tactic raise {
  let k = x108
  let acc = x109
  @tactics.use_then("trans", fn(x111 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let trans = x111
    let f : (@kernel.Thm) -> @kernel.Thm raise = @drule.match_mp(@drule.match_mp(trans)(acc))
    @tactics.assum_list(fn(x115 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      ((x113 : @list.List[@kernel.Thm]) => @tactics.map_every(k, x113))(((x114 : @list.List[@kernel.Thm]) => @lib.mapfilter(f, x114))(x115))
    })
  })
}

///|
/// `HOLDS_TAC`
pub fn holds_tac(x116 : @kernel.Thm) -> @tactics.Tactic raise {
  let th = x116
  let t118 = @tactics.try_tac(step_boxl2_tcl(holds_tac, th))
  @tactics.then_tac(assume_holds_literal_tac(th), t118)
}

///|
/// `SATURATE_ACC_TCL`
pub fn saturate_acc_tcl(x119 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise, x120 : @kernel.Thm) -> @tactics.Tactic raise {
  let ttac = x119
  let th = x120
  let t124 = acc_tcl((x123 : @kernel.Thm) => saturate_acc_tcl(ttac, x123), th)
  let t122 = step_boxl1_tcl(ttac, th)
  @tactics.then_tac(@tactics.then_tac(@tactics.label_tac("acc", th), t122), t124)
}

///|
/// `SATURATE_ACC_TAC`
pub fn saturate_acc_tac(x125 : @kernel.Thm, x126 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let th = x125
  let g = x126
  let t127 = saturate_acc_tcl(holds_tac, th)
  @tactics.then_tac(step_boxl1_tcl(holds_tac, th), t127)(g)
}

///|
/// BOX_RIGHT_TAC
fn step_9() -> Unit raise {
  box_right_tac_c.set(gen_box_right_tac(fn(x128 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x129 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      saturate_acc_tac(x128, x129)
    }
  }, holds_tac))
}

///|
let box_right_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("BOX_RIGHT_TAC")

///|
/// `BOX_RIGHT_TAC`
pub fn box_right_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (box_right_tac_c.get())(x)
}

///|
/// `dest_holds`
pub fn dest_holds(x130 : @kernel.Term) -> @kernel.Term raise {
  match x130 {
    @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("holds", _), _), _), tm), _) => tm
    _ => raise Failure("dest_holds")
  }
}

///|
/// `dest_box`
pub fn dest_box(x131 : @kernel.Term) -> @kernel.Term raise {
  match x131 {
    @kernel.Term::Comb(@kernel.Term::Const("Box", _), tm) => tm
    _ => raise Failure("dest_box")
  }
}

///|
/// is_box
fn step_10() -> Unit raise {
  is_box_c.set((x132 : @kernel.Term) => @lib.can(dest_box, x132))
}

///|
let is_box_c : @lib.Cell[(@kernel.Term) -> Bool raise] = @lib.Cell::new("is_box")

///|
/// `is_box`
pub fn is_box(x : @kernel.Term) -> Bool raise {
  (is_box_c.get())(x)
}

///|
/// `rank`
pub fn rank(x133 : @kernel.Term) -> ((Int64, @kernel.Term)) raise {
  let tm = x133
  try {
    (0L, dest_holds(@basics.dest_neg(tm)))
  } catch {
    Failure(_) => {
      try {
        let x = dest_holds(tm)
        try {
          (1L, dest_box(x))
        } catch {
          Failure(_) => (2L, x)
          e => raise e
        }
      } catch {
        Failure(_) => (3L, tm)
        e => raise e
      }
    }
    e => raise e
  }
}

///|
/// `lt`
pub fn lt(x134 : @kernel.Term, x135 : @kernel.Term) -> Bool raise {
  let tm1 = x134
  let tm2 = x135
  let c1 = Int::to_int64(@lib.compare(tm1, tm2))
  if (c1 == 0L) {
    false
  } else {
    let (r1, x1) = rank(tm1)
    let (r2, x2) = rank(tm2)
    if (r1 != r2) {
      (r1 < r2)
    } else {
      let c2 = Int::to_int64(@lib.compare(x1, x2))
      if (c2 == 0L) {
        (c1 > 0L)
      } else {
        if @basics.free_in(x1, x2) {
          true
        } else {
          if @basics.free_in(x2, x1) {
            false
          } else {
            (c2 > 0L)
          }
        }
      }
    }
  }
}

///|
/// SORT_BOX_CONV
fn step_11() -> Unit raise {
  let f : (@kernel.Term) -> @kernel.Term raise = fn(x141 : @kernel.Term) -> @kernel.Term raise {
    (fn(x139 : @list.List[@kernel.Term]) -> @kernel.Term raise {
      (fn(x137 : @list.List[@kernel.Term]) -> @kernel.Term raise {
        @bool.list_mk_disj((fn(x136 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
          @lib.uniq(x136)
        })(x137))
      })(((x138 : @list.List[@kernel.Term]) => @lib.mergesort(lt, x138))(x139))
    })(((x140 : @kernel.Term) => @lib.striplist(@basics.dest_disj, x140))(x141))
  }
  sort_box_conv_c.set(fn(x142 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x142
    @canon.disj_aci_rule(@basics.mk_eq(tm, f(tm)))
  })
}

///|
let sort_box_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("SORT_BOX_CONV")

///|
/// `SORT_BOX_CONV`
pub fn sort_box_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (sort_box_conv_c.get())(x)
}

///|
/// SORT_BOX_TAC
fn step_12() -> Unit raise {
  sort_box_tac_c.set(@tactics.conv_tac(sort_box_conv))
}

///|
let sort_box_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("SORT_BOX_TAC")

///|
/// `SORT_BOX_TAC`
pub fn sort_box_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (sort_box_tac_c.get())(x)
}

///|
/// GL_RIGHT_TAC
fn step_13() -> Unit raise {
  let t146 = @tactics.try_tac(neg_right_tac(holds_tac))
  let t145 = @tactics.repeat_tac(@tactics.conj_tac)
  let t144 = @tactics.conv_tac(@canon.cnf_conv)
  let t143 = @simp.pure_asm_rewrite_tac(@list.List([@theorems.and_clauses(), @theorems.or_clauses(), @class.not_clauses()]))
  gl_right_tac_c.set(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conv_tac(holds_nnfc_unfold_conv), t143), t144), t145), t146))
}

///|
let gl_right_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("GL_RIGHT_TAC")

///|
/// `GL_RIGHT_TAC`
pub fn gl_right_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (gl_right_tac_c.get())(x)
}

///|
/// GL_STEP_TAC
fn step_14() -> Unit raise {
  let t154 = @list.List([gl_right_tac, @tactics.then_tac(sort_box_tac, box_right_tac)])
  gl_step_tac_c.set((fn(x147 : @list.List[((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s148 = @tactics.first(x147)
    fn(x149 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s148(x149)
    }
  })(((x153 : @list.List[((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise]) => @lib.map(fn(x150 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s151 = @tactics.changed_tac(x150)
    fn(x152 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s151(x152)
    }
  }, x153))(t154)))
}

///|
let gl_step_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("GL_STEP_TAC")

///|
/// `GL_STEP_TAC`
pub fn gl_step_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (gl_step_tac_c.get())(x)
}

///|
/// INNER_GL_TAC
fn step_15() -> Unit raise {
  inner_gl_tac_c.set(@tactics.repeat_tac(gl_step_tac))
}

///|
let inner_gl_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("INNER_GL_TAC")

///|
/// `INNER_GL_TAC`
pub fn inner_gl_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (inner_gl_tac_c.get())(x)
}

///|
/// the_gl_countermodel
fn step_16() -> Unit raise {
  the_gl_countermodel_c.set(Ref::{ val: @term_syntax.parse_term("false") })
}

///|
let the_gl_countermodel_c : @lib.Cell[Ref[@kernel.Term]] = @lib.Cell::new("the_gl_countermodel")

///|
/// `the_gl_countermodel`
pub fn the_gl_countermodel() -> Ref[@kernel.Term] {
  the_gl_countermodel_c.get()
}

///|
/// GL_BUILD_COUNTERMODEL
fn step_17() -> Unit raise {
  let drop_labels = @list.List(["trans", "boxr1", "boxr2", "boxl1", "boxl2"])
  let drop_assumption : (String) -> Bool raise = fn(x155 : String) -> Bool raise {
    let s = x155
    @lib.mem(s, drop_labels)
  }
  let filter_asl : (@list.List[(String, @kernel.Thm)]) -> @list.List[@kernel.Term] raise = (x157 : @list.List[(String, @kernel.Thm)]) => @lib.mapfilter(fn(x156 : (String, @kernel.Thm)) -> @kernel.Term raise {
    let (s_1, t) = x156
    if drop_assumption(s_1) {
      @lib.failure()
    } else {
      @kernel.concl(t)
    }
  }, x157)
  gl_build_countermodel_c.set(fn(x158 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    let (asl, w) = x158
    let l = filter_asl(asl)
    {
      the_gl_countermodel().val = @lib.end_itlist((x160 : @kernel.Term, x161 : @kernel.Term) => @lib.curry(fn(x159 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
        @bool.mk_conj(x159.0, x159.1)
      }, x160, x161), l.concat(@lib.map(@bool.mk_neg, @lib.striplist(@basics.dest_disj, w))))
      ()
    }
    raise Failure("Contermodel stored in reference the_gl_countermodel.")
  })
}

///|
let gl_build_countermodel_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("GL_BUILD_COUNTERMODEL")

///|
/// `GL_BUILD_COUNTERMODEL`
pub fn gl_build_countermodel(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (gl_build_countermodel_c.get())(x)
}

///|
/// GL_TAC
fn step_18() -> Unit raise {
  let t168 = @tactics.repeat_tac(@tactics.gen_tac)
  let t167 = @theorems.intro_tac("trans boxr1 boxr2 boxl1 boxl2 w")
  let t166 = @tactics.repeat_tac(@tactics.gen_tac)
  let t165 = @tactics.match_mp_tac(completeness_num())
  let t164 = @simp.rewrite_tac(@list.List([@modal.diam_def(), @modal.dotbox_def()]))
  let t163 = @tactics.repeat_tac(@tactics.gen_tac)
  let t162 = @tactics.repeat_tac(@tactics.conv_tac(@pair.let_conv))
  gl_tac_c.set(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t162), t163), t164), t165), t166), t167), t168), inner_gl_tac), gl_build_countermodel))
}

///|
let gl_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("GL_TAC")

///|
/// `GL_TAC`
pub fn gl_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (gl_tac_c.get())(x)
}

///|
/// `GL_RULE`
pub fn gl_rule(x169 : @kernel.Term) -> @kernel.Thm raise {
  let _ as tm = x169
  @tactics.prove(tm, gl_tac)
}

///|
/// GL_second_incompleteness_theorem
fn step_19() -> Unit raise {
  gl_second_incompleteness_theorem_c.set(@lib.time(gl_rule, @term_syntax.parse_term("op_bar_minus_minus(op_minus_minus_gt(Not(Box(False)), Not(Box(Diam(True)))))")))
}

///|
let gl_second_incompleteness_theorem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_second_incompleteness_theorem")

///|
/// `GL_second_incompleteness_theorem`
pub fn gl_second_incompleteness_theorem() -> @kernel.Thm {
  gl_second_incompleteness_theorem_c.get()
}

///|
/// GL_PA_ignorance
fn step_20() -> Unit raise {
  gl_pa_ignorance_c.set(@lib.time(gl_rule, @term_syntax.parse_term("∀ p : Form, op_bar_minus_minus(op_lt_minus_gt(Box(False), Box(Diam(p))))")))
}

///|
let gl_pa_ignorance_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_PA_ignorance")

///|
/// `GL_PA_ignorance`
pub fn gl_pa_ignorance() -> @kernel.Thm {
  gl_pa_ignorance_c.get()
}

///|
/// GL_PA_undecidability_of_consistency
fn step_21() -> Unit raise {
  gl_pa_undecidability_of_consistency_c.set(@lib.time(gl_rule, @term_syntax.parse_term("op_bar_minus_minus(op_minus_minus_gt(Not(Box(Box(False))), op_amp_amp(Not(Box(Not(Box(False)))), Not(Box(Not(Not(Box(False))))))))")))
}

///|
let gl_pa_undecidability_of_consistency_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_PA_undecidability_of_consistency")

///|
/// `GL_PA_undecidability_of_consistency`
pub fn gl_pa_undecidability_of_consistency() -> @kernel.Thm {
  gl_pa_undecidability_of_consistency_c.get()
}

///|
/// GL_undecidability_of_Godels_formula
fn step_22() -> Unit raise {
  gl_undecidability_of_godels_formula_c.set(@lib.time(gl_rule, @term_syntax.parse_term("∀ p : Form, op_bar_minus_minus(op_minus_minus_gt(op_amp_amp(Box(op_lt_minus_gt(p, Not(Box(p)))), Not(Box(Box(False)))), op_amp_amp(Not(Box(p)), Not(Box(Not(p))))))")))
}

///|
let gl_undecidability_of_godels_formula_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_undecidability_of_Godels_formula")

///|
/// `GL_undecidability_of_Godels_formula`
pub fn gl_undecidability_of_godels_formula() -> @kernel.Thm {
  gl_undecidability_of_godels_formula_c.get()
}

///|
/// GL_reflection_and_iterated_consistency
fn step_23() -> Unit raise {
  gl_reflection_and_iterated_consistency_c.set(@lib.time(gl_rule, @term_syntax.parse_term("∀ p : Form, op_bar_minus_minus(op_minus_minus_gt(Box(op_minus_minus_gt(op_minus_minus_gt(Box(p), p), Diam(Diam(True)))), op_minus_minus_gt(Diam(Diam(True)), op_minus_minus_gt(Box(p), p))))")))
}

///|
let gl_reflection_and_iterated_consistency_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_reflection_and_iterated_consistency")

///|
/// `GL_reflection_and_iterated_consistency`
pub fn gl_reflection_and_iterated_consistency() -> @kernel.Thm {
  gl_reflection_and_iterated_consistency_c.get()
}

///|
/// GL_Godel_sentence_equiconsistent_consistency
fn step_24() -> Unit raise {
  gl_godel_sentence_equiconsistent_consistency_c.set(@lib.time(gl_rule, @term_syntax.parse_term("∀ p : Form, op_bar_minus_minus(op_lt_minus_gt(Box(op_lt_minus_gt(p, Not(Box(p)))), Box(op_lt_minus_gt(p, Not(Box(False))))))")))
}

///|
let gl_godel_sentence_equiconsistent_consistency_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_Godel_sentence_equiconsistent_consistency")

///|
/// `GL_Godel_sentence_equiconsistent_consistency`
pub fn gl_godel_sentence_equiconsistent_consistency() -> @kernel.Thm {
  gl_godel_sentence_equiconsistent_consistency_c.get()
}

///|
/// GL_arithmetical_fixpoint
fn step_25() -> Unit raise {
  gl_arithmetical_fixpoint_c.set(@lib.time(gl_rule, @term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_lt_minus_gt(Dotbox(op_lt_minus_gt(p, Not(Box(op_minus_minus_gt(q, p))))), Dotbox(op_lt_minus_gt(p, Diam(q)))))")))
}

///|
let gl_arithmetical_fixpoint_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_arithmetical_fixpoint")

///|
/// `GL_arithmetical_fixpoint`
pub fn gl_arithmetical_fixpoint() -> @kernel.Thm {
  gl_arithmetical_fixpoint_c.get()
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
}
