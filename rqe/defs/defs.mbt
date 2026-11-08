// Translated from upstream Rqe/defs.ml; edit this file directly.

///|
let sign_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("sign_INDUCT")

///|
/// `sign_INDUCT`
pub fn sign_induct() -> @kernel.Thm {
  sign_induct_c.get()
}

///|
let sign_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("sign_RECURSION")

///|
/// `sign_RECURSION`
pub fn sign_recursion() -> @kernel.Thm {
  sign_recursion_c.get()
}

///|
/// sign_INDUCT, sign_RECURSION
fn step_1() -> Unit raise {
  let (sign_induct, sign_recursion) = @ind_types.define_type("sign = Zero | Pos | Neg | Nonzero | Unknown")
  sign_induct_c.set(sign_induct)
  sign_recursion_c.set(sign_recursion)
}

///|
/// SIGN_CASES
fn step_2() -> Unit raise {
  let t1 = @simp.rewrite_tac(@list.List([]))
  let t2 = @list.List([@tactics.match_mp_tac(sign_induct()), t1])
  sign_cases_c.set(@rqe_tactics_ext.prove_by_refinement(@term_syntax.parse_term("∀ s : Sign, s == Pos || s == Neg || s == Zero || s == Nonzero || s == Unknown"), t2))
}

///|
let sign_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIGN_CASES")

///|
/// `SIGN_CASES`
pub fn sign_cases() -> @kernel.Thm {
  sign_cases_c.get()
}

///|
let szero_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("szero_tm")

///|
/// `szero_tm`
pub fn szero_tm() -> @kernel.Term {
  szero_tm_c.get()
}

///|
let spos_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("spos_tm")

///|
/// `spos_tm`
pub fn spos_tm() -> @kernel.Term {
  spos_tm_c.get()
}

///|
let sneg_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("sneg_tm")

///|
/// `sneg_tm`
pub fn sneg_tm() -> @kernel.Term {
  sneg_tm_c.get()
}

///|
let snonz_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("snonz_tm")

///|
/// `snonz_tm`
pub fn snonz_tm() -> @kernel.Term {
  snonz_tm_c.get()
}

///|
let sunk_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("sunk_tm")

///|
/// `sunk_tm`
pub fn sunk_tm() -> @kernel.Term {
  sunk_tm_c.get()
}

///|
/// szero_tm, spos_tm, sneg_tm, snonz_tm, sunk_tm
fn step_3() -> Unit raise {
  let t3 = @term_syntax.parse_term("Unknown")
  let t4 = @term_syntax.parse_term("Nonzero")
  let t5 = @term_syntax.parse_term("Neg")
  let t6 = @term_syntax.parse_term("Pos")
  let (szero_tm, spos_tm, sneg_tm, snonz_tm, sunk_tm) = (@term_syntax.parse_term("Zero"), t6, t5, t4, t3)
  szero_tm_c.set(szero_tm)
  spos_tm_c.set(spos_tm)
  sneg_tm_c.set(sneg_tm)
  snonz_tm_c.set(snonz_tm)
  sunk_tm_c.set(sunk_tm)
}

///|
/// interpsign
fn step_4() -> Unit raise {
  let t7 = @term_syntax.parse_term("(interpsign : ((Real) -> Bool, (Real) -> Real, Sign) -> Bool)((set : (Real) -> Bool), (ply : (Real) -> Real), Zero) == (∀ x : Real, set(x) → ply(x) == real_of_num(0)) && interpsign(set, ply, Pos) == (∀ x : Real, set(x) → ply(x) > real_of_num(0)) && interpsign(set, ply, Neg) == (∀ x : Real, set(x) → ply(x) < real_of_num(0)) && interpsign(set, ply, Nonzero) == (∀ x : Real, set(x) → op_lt_gt(ply(x), real_of_num(0))) && interpsign(set, ply, Unknown) == (∀ x : Real, set(x) → ply(x) == ply(x))")
  interpsign_c.set(@recursion.new_recursive_definition(sign_recursion())(t7))
}

///|
let interpsign_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("interpsign")

///|
/// `interpsign`
pub fn interpsign() -> @kernel.Thm {
  interpsign_c.get()
}

///|
/// interpsign_tm
fn step_5() -> Unit raise {
  interpsign_tm_c.set(@term_syntax.parse_term("interpsign"))
}

///|
let interpsign_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("interpsign_tm")

///|
/// `interpsign_tm`
pub fn interpsign_tm() -> @kernel.Term {
  interpsign_tm_c.get()
}

///|
/// `dest_interpsign`
pub fn dest_interpsign(x8 : @kernel.Thm) -> ((@kernel.Term, @kernel.Term, @kernel.Term)) raise {
  let interpthm = x8
  let t9 = @kernel.concl(interpthm)
  match @ind_defs.strip_ncomb(3L)(t9) {
    (int, More(set, tail=More(poly, tail=More(sign, tail=Empty)))) => {
      if !((int == interpsign_tm())) {
        raise Failure("not an interpsign")
      } else {
        (set, poly, sign)
      }
    }
    _ => raise @lib.MatchFailure("tscript.ml:38")
  }
}

///|
/// interpsigns
fn step_6() -> Unit raise {
  interpsigns_c.set(@pair.new_definition(@term_syntax.parse_term("(interpsigns : (List[(Real) -> Real], (Real) -> Bool, List[Sign]) -> Bool)((polyl : List[(Real) -> Real]), (set : (Real) -> Bool), (signl : List[Sign])) == ALL2(interpsign(set), polyl, signl)")))
}

///|
let interpsigns_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("interpsigns")

///|
/// `interpsigns`
pub fn interpsigns() -> @kernel.Thm {
  interpsigns_c.get()
}

///|
/// t0
fn step_7() -> Unit raise {
  t0_c.set(@class.taut(@term_syntax.parse_term("((a : Bool) && true) == a")))
}

///|
let t0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("t0")

///|
/// `t0`
pub fn t0() -> @kernel.Thm {
  t0_c.get()
}

///|
/// `interpsigns_thms`
pub fn interpsigns_thms(x10 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
  let interpthm = x10
  let ret = @lib.map(@equal.beta_rule, @bool.conjuncts_rule(@simp.pure_rewrite_rule(@list.List([interpsign(), interpsigns(), @lists.all2(), t0()]))(interpthm)))
  ret
}

///|
/// `interpsigns_thms2`
pub fn interpsigns_thms2(x11 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
  let interpthm = x11
  @bool.conjuncts_rule(@simp.pure_rewrite_rule(@list.List([interpsigns(), @lists.all2(), t0()]))(interpthm))
}

///|
/// interpsigns_tm
fn step_8() -> Unit raise {
  interpsigns_tm_c.set(@term_syntax.parse_term("interpsigns"))
}

///|
let interpsigns_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("interpsigns_tm")

///|
/// `interpsigns_tm`
pub fn interpsigns_tm() -> @kernel.Term {
  interpsigns_tm_c.get()
}

///|
/// `dest_interpsigns`
pub fn dest_interpsigns(x12 : @kernel.Thm) -> ((@kernel.Term, @kernel.Term, @kernel.Term)) raise {
  let interpthm = x12
  let t13 = @kernel.concl(interpthm)
  match @ind_defs.strip_ncomb(3L)(t13) {
    (int, More(polys, tail=More(set, tail=More(signs, tail=Empty)))) => {
      if !((int == interpsigns_tm())) {
        raise Failure("not an interpsigns")
      } else {
        (polys, set, signs)
      }
    }
    _ => raise @lib.MatchFailure("tscript.ml:71")
  }
}

///|
/// interp_sing
fn step_9() -> Unit raise {
  let t14 = @simp.rewrite_tac(@list.List([interpsigns(), @lists.all2()]))
  interp_sing_c.set(@tactics.prove(@term_syntax.parse_term("interpsign((set : (Real) -> Bool), (p : (Real) -> Real), (s : Sign)) == interpsigns([p], set, [s])"), t14))
}

///|
let interp_sing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("interp_sing")

///|
/// `interp_sing`
pub fn interp_sing() -> @kernel.Thm {
  interp_sing_c.get()
}

///|
/// interp_doub
fn step_10() -> Unit raise {
  let t15 = @meson.asm_meson_tac(@list.List([interpsigns(), @lists.all2()]))
  interp_doub_c.set(@tactics.prove(@term_syntax.parse_term("interpsigns([(p1 : (Real) -> Real)], (set : (Real) -> Bool), [(s1 : Sign)]) → interpsigns((pl : List[(Real) -> Real]), set, (sl : List[Sign])) → interpsigns(CONS(p1, pl), set, CONS(s1, sl))"), t15))
}

///|
let interp_doub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("interp_doub")

///|
/// `interp_doub`
pub fn interp_doub() -> @kernel.Thm {
  interp_doub_c.get()
}

///|
/// `mk_interpsigns`
pub fn mk_interpsigns(x16 : @list.List[@kernel.Thm]) -> @kernel.Thm raise {
  let thms = x16
  let thms_p = @lib.map(@simp.pure_rewrite_rule(@list.List([interp_sing()])), thms)
  @lib.end_itlist(fn(x17 : @kernel.Thm, x18 : @kernel.Thm) -> @kernel.Thm raise {
    let t1 = x17
    let t2 = x18
    @rqe_tactics_ext.match_mpl(@list.List([interp_doub(), t1, t2]))
  }, thms_p)
}

///|
/// partition_line
fn step_11() -> Unit raise {
  let t19 = @term_syntax.parse_term("(partition_line : (List[Real]) -> List[(Real) -> Bool])(NIL) == [(x : Real) => true] && partition_line(CONS((h : Real), (t : List[Real]))) == (if t == NIL { [(x : Real) => x < h, (x : Real) => x == h, (x : Real) => h < x] } else { APPEND([(x : Real) => x < h, (x : Real) => x == h, (x : Real) => h < x && x < HD(t)], TL(partition_line(t))) })")
  partition_line_c.set(@recursion.new_recursive_definition(@ind_types.list_recursion())(t19))
}

///|
let partition_line_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("partition_line")

///|
/// `partition_line`
pub fn partition_line() -> @kernel.Thm {
  partition_line_c.get()
}

///|
/// make_partition_list
fn step_12() -> Unit raise {
  let lxt = @term_syntax.parse_term("(x : Real) => true")
  let htm = @term_syntax.parse_term("(h : Real)")
  let h1tm = @term_syntax.parse_term("(h1 : Real)")
  let h2tm = @term_syntax.parse_term("(h2 : Real)")
  let x_lt_h = @term_syntax.parse_term("(x : Real) => x < (h : Real)")
  let x_eq_h = @term_syntax.parse_term("(x : Real) => x == (h : Real)")
  let h_lt_x = @term_syntax.parse_term("(x : Real) => (h : Real) < x")
  let x_lt_h1 = @term_syntax.parse_term("(x : Real) => x < (h1 : Real)")
  let x_eq_h1 = @term_syntax.parse_term("(x : Real) => x == (h1 : Real)")
  let x_h1_h2 = @term_syntax.parse_term("(x : Real) => (h1 : Real) < x && x < (h2 : Real)")
  fn make_partition_list_1(x20 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
    let ps = x20
    match ps {
      Empty => @list.List([lxt])
      More(h, tail=Empty) => @lib.map((x21 : @kernel.Term) => @basics.subst(@list.List([(h, htm)]), x21), @list.List([x_lt_h, x_eq_h, h_lt_x]))
      More(h1, tail=More(h2, tail=t)) => {
        let t23 = @lib.tl(make_partition_list_1(t.prepend(h2)))
        @lib.map((x22 : @kernel.Term) => @basics.subst(@list.List([(h1, h1tm), (h2, h2tm)]), x22), @list.List([x_lt_h1, x_eq_h1, x_h1_h2])).concat(t23)
      }
    }
  }
  make_partition_list_c.set(make_partition_list_1)
}

///|
let make_partition_list_c : @lib.Cell[(@list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise] = @lib.Cell::new("make_partition_list")

///|
/// `make_partition_list`
pub fn make_partition_list(x : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
  (make_partition_list_c.get())(x)
}

///|
/// part_line_tm
fn step_13() -> Unit raise {
  part_line_tm_c.set(@term_syntax.parse_term("partition_line"))
}

///|
let part_line_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("part_line_tm")

///|
/// `part_line_tm`
pub fn part_line_tm() -> @kernel.Term {
  part_line_tm_c.get()
}

///|
/// real_bool_ty
fn step_14() -> Unit raise {
  real_bool_ty_c.set(@term_syntax.parse_type("(Real) -> Bool"))
}

///|
let real_bool_ty_c : @lib.Cell[@kernel.HolType] = @lib.Cell::new("real_bool_ty")

///|
/// `real_bool_ty`
pub fn real_bool_ty() -> @kernel.HolType {
  real_bool_ty_c.get()
}

///|
/// `PARTITION_LINE_CONV`
pub fn partition_line_conv(x24 : @kernel.Term) -> @kernel.Thm raise {
  let pts = x24
  let ptm = @kernel.mk_comb(part_line_tm(), pts)
  let ltm = @lists.mk_list(make_partition_list(@basics.dest_list(pts)), real_bool_ty())
  let tm = @basics.mk_eq(ptm, ltm)
  @tactics.prove(tm, @simp.rewrite_tac(@list.List([partition_line(), @lists.append(), @class.cond_clauses(), @lists.not_cons_nil(), @lists.tl(), @lists.hd()])))
}

///|
/// interpmat
fn step_15() -> Unit raise {
  interpmat_c.set(@pair.new_definition(@term_syntax.parse_term("(interpmat : (List[Real], List[(Real) -> Real], List[List[Sign]]) -> Bool)((ptl : List[Real]), (polyl : List[(Real) -> Real]), (signll : List[List[Sign]])) == (real_ordered_list(ptl) && ALL2(interpsigns(polyl), partition_line(ptl), signll))")))
}

///|
let interpmat_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("interpmat")

///|
/// `interpmat`
pub fn interpmat() -> @kernel.Thm {
  interpmat_c.get()
}

///|
/// interpmat_tm
fn step_16() -> Unit raise {
  interpmat_tm_c.set(@term_syntax.parse_term("interpmat"))
}

///|
let interpmat_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("interpmat_tm")

///|
/// `interpmat_tm`
pub fn interpmat_tm() -> @kernel.Term {
  interpmat_tm_c.get()
}

///|
/// dest_interpmat
fn step_17() -> Unit raise {
  let imat_tm = interpmat_tm()
  dest_interpmat_c.set(fn(x25 : @kernel.Term) -> (@kernel.Term, @kernel.Term, @kernel.Term) raise {
    let tm = x25
    let (sc, args) = @basics.strip_comb(tm)
    if !((sc == imat_tm)) {
      raise Failure("dest_interpmat: not an interpmat term")
    } else {
      match args {
        More(ptl, tail=More(polyl, tail=More(signll, tail=Empty))) => (ptl, polyl, signll)
        _ => raise @lib.MatchFailure("tscript.ml:197")
      }
    }
  })
}

///|
let dest_interpmat_c : @lib.Cell[(@kernel.Term) -> (@kernel.Term, @kernel.Term, @kernel.Term) raise] = @lib.Cell::new("dest_interpmat")

///|
/// `dest_interpmat`
pub fn dest_interpmat(x : @kernel.Term) -> ((@kernel.Term, @kernel.Term, @kernel.Term)) raise {
  (dest_interpmat_c.get())(x)
}

///|
/// `interpmat_thms`
pub fn interpmat_thms(x26 : @kernel.Thm) -> ((@kernel.Thm, @kernel.Thm)) raise {
  let thm = x26
  match @bool.conjuncts_rule(@simp.pure_rewrite_rule(@list.List([interpmat()]))(thm)) {
    More(rol_thm, tail=More(interpsigns_thm, tail=Empty)) => (rol_thm, interpsigns_thm)
    _ => raise @lib.MatchFailure("tscript.ml:201")
  }
}

///|
/// `mk_interpmat_thm`
pub fn mk_interpmat_thm(x27 : @kernel.Thm, x28 : @kernel.Thm) -> @kernel.Thm raise {
  let rol_thm = x27
  let all_thm = x28
  let t29 = @bool.conj(rol_thm, all_thm)
  let ret = @simp.rewrite_rule(@list.List([@equal.gsym(interpmat())]))(t29)
  let (l, _) = @basics.strip_comb(@kernel.concl(ret))
  if !((l == interpmat_tm())) {
    raise Failure("mk_interpmat")
  } else {
    ret
  }
}

///|
/// all2_thm0
fn step_18() -> Unit raise {
  all2_thm0_c.set(@bool.gen_all(@bool.eqt_elim(@lib.hd(@bool.conjuncts_rule(@lists.all2())))))
}

///|
let all2_thm0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("all2_thm0")

///|
/// `all2_thm0`
pub fn all2_thm0() -> @kernel.Thm {
  all2_thm0_c.get()
}

///|
/// all2_thm
fn step_19() -> Unit raise {
  let t30 = @bool.eq_imp_rule(@equal.gsym(@lib.last(@bool.conjuncts_rule(@lists.all2())))).0
  all2_thm_c.set(@bool.gen_all(@simp.rewrite_rule(@list.List([@basic.and_imp_thm()]))(t30)))
}

///|
let all2_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("all2_thm")

///|
/// `all2_thm`
pub fn all2_thm() -> @kernel.Thm {
  all2_thm_c.get()
}

///|
/// `mk_all2_interpsigns`
pub fn mk_all2_interpsigns(x31 : @kernel.Thm, x32 : @list.List[@kernel.Thm]) -> @kernel.Thm raise {
  let part_thm = x31
  let is_thms = x32
  let is_tm = @kernel.dest_comb(@kernel.dest_comb(@kernel.concl(@lib.hd(is_thms))).0).0
  let all2_thm0_p = @bool.ispec(is_tm, all2_thm0())
  let ret = @lib.itlist(fn(x33 : @kernel.Thm, x34 : @kernel.Thm) -> @kernel.Thm raise {
    let x = x33
    let y = x34
    @rqe_tactics_ext.match_mpl(@list.List([all2_thm(), x, y]))
  }, is_thms, all2_thm0_p)
  @simp.rewrite_rule(@list.List([@equal.gsym(part_thm)]))(ret)
}

///|
/// `dest_all2`
pub fn dest_all2(x35 : @kernel.Term) -> ((@kernel.Term, @kernel.Term, @kernel.Term)) raise {
  let tm = x35
  let (a2, l) = @basics.strip_comb(tm)
  if (@kernel.dest_const(a2).0 == "ALL2") {
    match l {
      More(a1, tail=More(a2_1, tail=More(a3, tail=Empty))) => (a1, a2_1, a3)
      _ => raise @lib.MatchFailure("tscript.ml:268")
    }
  } else {
    raise Failure("dest_all2: not an ALL2")
  }
}

///|
/// `is_interval`
pub fn is_interval(x36 : @kernel.Term) -> Bool raise {
  let set = x36
  try {
    let (x, bod) = @kernel.dest_abs(set)
    if @basics.is_conj(bod) {
      let (l, r) = @basics.dest_conj(bod)
      (@lib.can((x37 : @kernel.Term) => @basics.dest_binop(@rqe_real.rlt(), x37), l) && @lib.can((x38 : @kernel.Term) => @basics.dest_binop(@rqe_real.rlt(), x38), r))
    } else {
      @lib.can((x39 : @kernel.Term) => @basics.dest_binop(@rqe_real.rlt(), x39), bod)
    }
  } catch {
    _ => false
  }
}

///|
/// `is_point`
pub fn is_point(x40 : @kernel.Term) -> Bool raise {
  let set = x40
  try {
    let (x, bod) = @kernel.dest_abs(set)
    if @basics.is_eq(bod) {
      true
    } else {
      false
    }
  } catch {
    _ => false
  }
}

///|
let new_var_c : @lib.Cell[(@kernel.HolType) -> @kernel.Term raise] = @lib.Cell::new("new_var")

///|
/// `new_var`
pub fn new_var(x : @kernel.HolType) -> @kernel.Term raise {
  (new_var_c.get())(x)
}

///|
let reset_vars_c : @lib.Cell[(Unit) -> Unit raise] = @lib.Cell::new("reset_vars")

///|
/// `reset_vars`
pub fn reset_vars(x : Unit) -> Unit raise {
  (reset_vars_c.get())(x)
}

///|
/// new_var, reset_vars
fn step_20() -> Unit raise {
  let id = Ref::{ val: 0L }
  let pre = "x_"
  let new_var : (@kernel.HolType) -> @kernel.Term raise = fn(x41 : @kernel.HolType) -> @kernel.Term raise {
    let ty = x41
    {
      id.val = @lib.add63(id.val, 1L)
      ()
    }
    @kernel.mk_var((pre + Int64::to_string(id.val)), ty)
  }
  let reset_vars : (Unit) -> Unit raise = fn(x42 : Unit) -> Unit raise {
    let _ = x42
    {
      id.val = 0L
      ()
    }
  }
  let (new_var_1, reset_vars_1) = (new_var, reset_vars)
  new_var_c.set(new_var_1)
  reset_vars_c.set(reset_vars_1)
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
}
