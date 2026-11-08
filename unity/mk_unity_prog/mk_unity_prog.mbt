// Translated from upstream Unity/mk_unity_prog.ml; edit this file directly.

///|
/// NUM
fn step_1() -> Unit raise {
  num_c.set(@term_syntax.parse_type("Num"))
}

///|
let num_c : @lib.Cell[@kernel.HolType] = @lib.Cell::new("NUM")

///|
/// `NUM`
pub fn num() -> @kernel.HolType {
  num_c.get()
}

///|
/// BOOL
fn step_2() -> Unit raise {
  bool_c.set(@term_syntax.parse_type("Bool"))
}

///|
let bool_c : @lib.Cell[@kernel.HolType] = @lib.Cell::new("BOOL")

///|
/// `BOOL`
pub fn bool() -> @kernel.HolType {
  bool_c.get()
}

///|
/// `VAR_TP`
pub fn var_tp(x1 : String) -> @kernel.HolType raise {
  let s = x1
  @kernel.mk_vartype(s)
}

///|
/// `LST`
pub fn lst(x2 : @kernel.HolType) -> @kernel.HolType raise {
  let t = x2
  @kernel.mk_type("list", @list.List([t]))
}

///|
/// `PRD`
pub fn prd(x3 : @kernel.HolType, x4 : @kernel.HolType) -> @kernel.HolType raise {
  let (l, r) = (x3, x4)
  @kernel.mk_type("prod", @list.List([l, r]))
}

///|
/// `FUN`
pub fn fun(x5 : @kernel.HolType, x6 : @kernel.HolType) -> @kernel.HolType raise {
  let (l, r) = (x5, x6)
  @kernel.mk_type("fun", @list.List([l, r]))
}

///|
/// `FNC`
pub fn fnc(x7 : (@kernel.HolType, @list.List[@kernel.HolType])) -> @kernel.HolType raise {
  match x7 {
    (l, Empty) => l
    (l_1, More(r, tail=rs)) => fun(l_1, fnc((r, rs)))
  }
}

///|
/// LOC
fn step_3() -> Unit raise {
  loc_c.set(var_tp("Loc"))
}

///|
let loc_c : @lib.Cell[@kernel.HolType] = @lib.Cell::new("LOC")

///|
/// `LOC`
pub fn loc() -> @kernel.HolType {
  loc_c.get()
}

///|
/// VAL
fn step_4() -> Unit raise {
  val_c.set(var_tp("Val"))
}

///|
let val_c : @lib.Cell[@kernel.HolType] = @lib.Cell::new("VAL")

///|
/// `VAL`
pub fn val() -> @kernel.HolType {
  val_c.get()
}

///|
/// STA
fn step_5() -> Unit raise {
  sta_c.set(fun(loc(), val()))
}

///|
let sta_c : @lib.Cell[@kernel.HolType] = @lib.Cell::new("STA")

///|
/// `STA`
pub fn sta() -> @kernel.HolType {
  sta_c.get()
}

///|
/// ACT
fn step_6() -> Unit raise {
  act_c.set(fun(sta(), sta()))
}

///|
let act_c : @lib.Cell[@kernel.HolType] = @lib.Cell::new("ACT")

///|
/// `ACT`
pub fn act() -> @kernel.HolType {
  act_c.get()
}

///|
/// INT
fn step_7() -> Unit raise {
  int_c.set(lst(act()))
}

///|
let int_c : @lib.Cell[@kernel.HolType] = @lib.Cell::new("INT")

///|
/// `INT`
pub fn int() -> @kernel.HolType {
  int_c.get()
}

///|
/// `XPR`
pub fn xpr(x8 : @kernel.HolType) -> @kernel.HolType raise {
  let t = x8
  fun(sta(), t)
}

///|
/// `ASG`
pub fn asg(x9 : @kernel.HolType) -> @kernel.HolType raise {
  let t = x9
  fnc((xpr(t), @list.List([sta(), sta(), sta()])))
}

///|
/// `VAR`
pub fn var_(x10 : @kernel.HolType) -> @kernel.HolType raise {
  let t = x10
  let t11 = asg(t)
  prd(xpr(t), t11)
}

///|
/// PAR
fn step_8() -> Unit raise {
  par_c.set(fnc((sta(), @list.List([sta(), sta()]))))
}

///|
let par_c : @lib.Cell[@kernel.HolType] = @lib.Cell::new("PAR")

///|
/// `PAR`
pub fn par() -> @kernel.HolType {
  par_c.get()
}

///|
/// SEQ
fn step_9() -> Unit raise {
  let t12 = fun(num(), prd(int(), num()))
  let t13 = fun(fun(val(), num()), t12)
  seq_c.set(fun(loc(), fun(fun(num(), val()), t13)))
}

///|
let seq_c : @lib.Cell[@kernel.HolType] = @lib.Cell::new("SEQ")

///|
/// `SEQ`
pub fn seq() -> @kernel.HolType {
  seq_c.get()
}

///|
/// t
fn step_10() -> Unit raise {
  t_c.set(@kernel.mk_vartype("T"))
}

///|
let t_c : @lib.Cell[@kernel.HolType] = @lib.Cell::new("t")

///|
/// `t`
pub fn t() -> @kernel.HolType {
  t_c.get()
}

///|
/// v
fn step_11() -> Unit raise {
  v_c.set(@kernel.mk_var("v", var_(t())))
}

///|
let v_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("v")

///|
/// `v`
pub fn v() -> @kernel.Term {
  v_c.get()
}

///|
/// Unity/mk_unity_prog.ml:255
fn step_12() -> Unit raise {
  @preterm.new_type_abbrev("stype", @term_syntax.parse_type("(Loc) -> Val"))
}

///|
/// Unity/mk_unity_prog.ml:257
fn step_13() -> Unit raise {
  @preterm.new_type_abbrev("vtype", @term_syntax.parse_type("((Stype) -> T, ((Stype) -> T, Stype, Stype) -> Stype)"))
}

///|
/// Unity/mk_unity_prog.ml:259
fn step_14() -> Unit raise {
  @preterm.new_type_abbrev("vindex_type", @term_syntax.parse_type("((Stype, I) -> T, ((Stype, I) -> T, Stype, Stype) -> Stype)"))
}

///|
/// Unity/mk_unity_prog.ml:261
fn step_15() -> Unit raise {
  @preterm.new_type_abbrev("vpair_type", @term_syntax.parse_type("((Stype) -> (A, B), ((Stype) -> (A, B), Stype, Stype) -> Stype)"))
}

///|
/// Unity/mk_unity_prog.ml:263
fn step_16() -> Unit raise {
  @preterm.new_type_abbrev("seq_type", @term_syntax.parse_type("(Loc, (Num) -> Val, (Val) -> Num, Num) -> (List[(Stype) -> Stype], Num)"))
}

///|
/// VAR_EXP
fn step_17() -> Unit raise {
  var_exp_c.set(@pair.new_definition(@term_syntax.parse_term("(VAR_EXP : ((((Loc) -> Val) -> T, (((Loc) -> Val) -> T, (Loc) -> Val, (Loc) -> Val, Loc) -> Val), (Loc) -> Val) -> T)((v : (((Loc) -> Val) -> T, (((Loc) -> Val) -> T, (Loc) -> Val, (Loc) -> Val, Loc) -> Val))) == FST(v)")))
}

///|
let var_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VAR_EXP")

///|
/// `VAR_EXP`
pub fn var_exp() -> @kernel.Thm {
  var_exp_c.get()
}

///|
/// VAR_ASG
fn step_18() -> Unit raise {
  var_asg_c.set(@pair.new_definition(@term_syntax.parse_term("(VAR_ASG : ((((Loc) -> Val) -> T, (((Loc) -> Val) -> T, (Loc) -> Val, (Loc) -> Val, Loc) -> Val), ((Loc) -> Val) -> T, (Loc) -> Val, (Loc) -> Val, Loc) -> Val)((v : (((Loc) -> Val) -> T, (((Loc) -> Val) -> T, (Loc) -> Val, (Loc) -> Val, Loc) -> Val))) == SND(v)")))
}

///|
let var_asg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VAR_ASG")

///|
/// `VAR_ASG`
pub fn var_asg() -> @kernel.Thm {
  var_asg_c.get()
}

///|
/// loc
fn step_19() -> Unit raise {
  loc_v1_c.set(@kernel.mk_var("loc", loc()))
}

///|
let loc_v1_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("loc")

///|
/// `loc`
pub fn loc_v1() -> @kernel.Term {
  loc_v1_c.get()
}

///|
/// s
fn step_20() -> Unit raise {
  s_c.set(@kernel.mk_var("s", sta()))
}

///|
let s_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("s")

///|
/// `s`
pub fn s() -> @kernel.Term {
  s_c.get()
}

///|
/// s0
fn step_21() -> Unit raise {
  s0_c.set(@kernel.mk_var("s0", sta()))
}

///|
let s0_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("s0")

///|
/// `s0`
pub fn s0() -> @kernel.Term {
  s0_c.get()
}

///|
/// ds
fn step_22() -> Unit raise {
  ds_c.set(@kernel.mk_var("ds", fun(val(), t())))
}

///|
let ds_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("ds")

///|
/// `ds`
pub fn ds() -> @kernel.Term {
  ds_c.get()
}

///|
/// mk
fn step_23() -> Unit raise {
  mk_c.set(@kernel.mk_var("mk", fun(t(), val())))
}

///|
let mk_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("mk")

///|
/// `mk`
pub fn mk() -> @kernel.Term {
  mk_c.get()
}

///|
/// e
fn step_24() -> Unit raise {
  e_c.set(@kernel.mk_var("e", xpr(t())))
}

///|
let e_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("e")

///|
/// `e`
pub fn e() -> @kernel.Term {
  e_c.get()
}

///|
/// LOC_EXP
fn step_25() -> Unit raise {
  loc_exp_c.set(@pair.new_definition(@term_syntax.parse_term("(LOC_EXP : (Loc, (Val) -> T, (Loc) -> Val) -> T)((loc : Loc), (ds : (Val) -> T), (s : (Loc) -> Val)) == ds(s(loc))")))
}

///|
let loc_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LOC_EXP")

///|
/// `LOC_EXP`
pub fn loc_exp() -> @kernel.Thm {
  loc_exp_c.get()
}

///|
/// LOC_ASG
fn step_26() -> Unit raise {
  loc_asg_c.set(@pair.new_definition(@term_syntax.parse_term("(LOC_ASG : (Loc, (T) -> Val, ((Loc) -> Val) -> T, (Loc) -> Val, (Loc) -> Val, Loc) -> Val)((loc : Loc), (mk : (T) -> Val), (e : ((Loc) -> Val) -> T), (s0 : (Loc) -> Val), (s : (Loc) -> Val), (l : Loc)) == (if l == loc { mk(e(s0)) } else { s(l) })")))
}

///|
let loc_asg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LOC_ASG")

///|
/// `LOC_ASG`
pub fn loc_asg() -> @kernel.Thm {
  loc_asg_c.get()
}

///|
/// LOC_VAR
fn step_27() -> Unit raise {
  loc_var_c.set(@pair.new_definition(@term_syntax.parse_term("(LOC_VAR : (Loc, (T) -> Val, (Val) -> T) -> (((Loc) -> Val) -> T, (((Loc) -> Val) -> T, (Loc) -> Val, (Loc) -> Val, Loc) -> Val))((loc : Loc), (mk : (T) -> Val), (ds : (Val) -> T)) == (LOC_EXP(loc, ds), LOC_ASG(loc, mk))")))
}

///|
let loc_var_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LOC_VAR")

///|
/// `LOC_VAR`
pub fn loc_var() -> @kernel.Thm {
  loc_var_c.get()
}

///|
/// INDEX_EXP
fn step_28() -> Unit raise {
  index_exp_c.set(@pair.new_definition(@term_syntax.parse_term("(INDEX_EXP : (((Loc) -> Val, I) -> T, ((Loc) -> Val) -> I, (Loc) -> Val) -> T)((a : ((Loc) -> Val, I) -> T), (i : ((Loc) -> Val) -> I), (s : (Loc) -> Val)) == a(s, i(s))")))
}

///|
let index_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INDEX_EXP")

///|
/// `INDEX_EXP`
pub fn index_exp() -> @kernel.Thm {
  index_exp_c.get()
}

///|
/// UPD_INDEX
fn step_29() -> Unit raise {
  upd_index_c.set(@pair.new_definition(@term_syntax.parse_term("(UPD_INDEX : (I, T, (I) -> T, I) -> T)((i : I), (c : T), (a : (I) -> T), (j : I)) == (if j == i { c } else { a(j) })")))
}

///|
let upd_index_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UPD_INDEX")

///|
/// `UPD_INDEX`
pub fn upd_index() -> @kernel.Thm {
  upd_index_c.get()
}

///|
/// UPD_INDEX_EXP
fn step_30() -> Unit raise {
  upd_index_exp_c.set(@pair.new_definition(@term_syntax.parse_term("(UPD_INDEX_EXP : (I, T, ((Loc) -> Val, I) -> T, (Loc) -> Val, I) -> T)((i : I), (c : T), (a : ((Loc) -> Val, I) -> T), (s : (Loc) -> Val)) == UPD_INDEX(i, c, a(s))")))
}

///|
let upd_index_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UPD_INDEX_EXP")

///|
/// `UPD_INDEX_EXP`
pub fn upd_index_exp() -> @kernel.Thm {
  upd_index_exp_c.get()
}

///|
/// VAR_INDEX_ASG
fn step_31() -> Unit raise {
  var_index_asg_c.set(@pair.new_definition(@term_syntax.parse_term("(VAR_INDEX_ASG : (((Loc) -> Val) -> I, (((Loc) -> Val, I) -> T, (((Loc) -> Val, I) -> T, (Loc) -> Val, (Loc) -> Val, Loc) -> Val), ((Loc) -> Val) -> T, (Loc) -> Val, (Loc) -> Val, Loc) -> Val)((i : ((Loc) -> Val) -> I), (v : (((Loc) -> Val, I) -> T, (((Loc) -> Val, I) -> T, (Loc) -> Val, (Loc) -> Val, Loc) -> Val)), (e : ((Loc) -> Val) -> T), (s0 : (Loc) -> Val), (s : (Loc) -> Val)) == VAR_ASG(v, UPD_INDEX_EXP(i(s0), e(s0), VAR_EXP(v)), s0, s)")))
}

///|
let var_index_asg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VAR_INDEX_ASG")

///|
/// `VAR_INDEX_ASG`
pub fn var_index_asg() -> @kernel.Thm {
  var_index_asg_c.get()
}

///|
/// VAR_INDEX_EXP
fn step_32() -> Unit raise {
  var_index_exp_c.set(@pair.new_definition(@term_syntax.parse_term("(VAR_INDEX_EXP : (((Loc) -> Val) -> I, (((Loc) -> Val, I) -> T, (((Loc) -> Val, I) -> T, (Loc) -> Val, (Loc) -> Val, Loc) -> Val), (Loc) -> Val) -> T)((i : ((Loc) -> Val) -> I), (v : (((Loc) -> Val, I) -> T, (((Loc) -> Val, I) -> T, (Loc) -> Val, (Loc) -> Val, Loc) -> Val)), (s : (Loc) -> Val)) == VAR_EXP(v, s, i(s))")))
}

///|
let var_index_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VAR_INDEX_EXP")

///|
/// `VAR_INDEX_EXP`
pub fn var_index_exp() -> @kernel.Thm {
  var_index_exp_c.get()
}

///|
/// VAR_INDEXVAR
fn step_33() -> Unit raise {
  var_indexvar_c.set(@pair.new_definition(@term_syntax.parse_term("(VAR_INDEXVAR : (((Loc) -> Val) -> I, (((Loc) -> Val, I) -> T, (((Loc) -> Val, I) -> T, (Loc) -> Val, (Loc) -> Val, Loc) -> Val)) -> (((Loc) -> Val) -> T, (((Loc) -> Val) -> T, (Loc) -> Val, (Loc) -> Val, Loc) -> Val))((i : ((Loc) -> Val) -> I), (v : (((Loc) -> Val, I) -> T, (((Loc) -> Val, I) -> T, (Loc) -> Val, (Loc) -> Val, Loc) -> Val))) == (VAR_INDEX_EXP(i, v), VAR_INDEX_ASG(i, v))")))
}

///|
let var_indexvar_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VAR_INDEXVAR")

///|
/// `VAR_INDEXVAR`
pub fn var_indexvar() -> @kernel.Thm {
  var_indexvar_c.get()
}

///|
/// LIST_EXP_term
fn step_34() -> Unit raise {
  list_exp_term_c.set(@term_syntax.parse_term("(LIST_EXP : (List[((Loc) -> Val) -> T], (Loc) -> Val) -> List[T])(NIL, (s : (Loc) -> Val)) == NIL && LIST_EXP(CONS((e : ((Loc) -> Val) -> T), (t : List[((Loc) -> Val) -> T])), s) == CONS(e(s), LIST_EXP(t, s))"))
}

///|
let list_exp_term_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("LIST_EXP_term")

///|
/// `LIST_EXP_term`
pub fn list_exp_term() -> @kernel.Term {
  list_exp_term_c.get()
}

///|
/// LIST_EXP
fn step_35() -> Unit raise {
  list_exp_c.set(@recursion.new_recursive_definition(@ind_types.list_recursion())(list_exp_term()))
}

///|
let list_exp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIST_EXP")

///|
/// `LIST_EXP`
pub fn list_exp() -> @kernel.Thm {
  list_exp_c.get()
}

///|
/// s_FST
fn step_36() -> Unit raise {
  s_fst_c.set(@pair.new_definition(@term_syntax.parse_term("(s_FST : ((Sta) -> (A, B), Sta) -> A)((e : (Sta) -> (A, B)), (s : Sta)) == FST(e(s))")))
}

///|
let s_fst_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("s_FST")

///|
/// `s_FST`
pub fn s_fst() -> @kernel.Thm {
  s_fst_c.get()
}

///|
/// s_SND
fn step_37() -> Unit raise {
  s_snd_c.set(@pair.new_definition(@term_syntax.parse_term("(s_SND : ((Sta) -> (A, B), Sta) -> B)((e : (Sta) -> (A, B)), (s : Sta)) == SND(e(s))")))
}

///|
let s_snd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("s_SND")

///|
/// `s_SND`
pub fn s_snd() -> @kernel.Thm {
  s_snd_c.get()
}

///|
/// UPD_FST
fn step_38() -> Unit raise {
  upd_fst_c.set(@pair.new_definition(@term_syntax.parse_term("(UPD_FST : (A, (Sta) -> (A, B), Sta) -> (A, B))((c : A), (p : (Sta) -> (A, B)), (s : Sta)) == (c, SND(p(s)))")))
}

///|
let upd_fst_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UPD_FST")

///|
/// `UPD_FST`
pub fn upd_fst() -> @kernel.Thm {
  upd_fst_c.get()
}

///|
/// UPD_SND
fn step_39() -> Unit raise {
  upd_snd_c.set(@pair.new_definition(@term_syntax.parse_term("(UPD_SND : (B, (Sta) -> (A, B), Sta) -> (A, B))((c : B), (p : (Sta) -> (A, B)), (s : Sta)) == (FST(p(s)), c)")))
}

///|
let upd_snd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UPD_SND")

///|
/// `UPD_SND`
pub fn upd_snd() -> @kernel.Thm {
  upd_snd_c.get()
}

///|
/// VAR_FST_ASG
fn step_40() -> Unit raise {
  var_fst_asg_c.set(@pair.new_definition(@term_syntax.parse_term("(VAR_FST_ASG : ((((Loc) -> Val) -> (A, B), (((Loc) -> Val) -> (A, B), (Loc) -> Val, (Loc) -> Val, Loc) -> Val), ((Loc) -> Val) -> A, (Loc) -> Val, (Loc) -> Val, Loc) -> Val)((v : (((Loc) -> Val) -> (A, B), (((Loc) -> Val) -> (A, B), (Loc) -> Val, (Loc) -> Val, Loc) -> Val)), (e : ((Loc) -> Val) -> A), (s0 : (Loc) -> Val), (s : (Loc) -> Val)) == VAR_ASG(v, UPD_FST(e(s0), VAR_EXP(v)), s0, s)")))
}

///|
let var_fst_asg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VAR_FST_ASG")

///|
/// `VAR_FST_ASG`
pub fn var_fst_asg() -> @kernel.Thm {
  var_fst_asg_c.get()
}

///|
/// VAR_SND_ASG
fn step_41() -> Unit raise {
  var_snd_asg_c.set(@pair.new_definition(@term_syntax.parse_term("(VAR_SND_ASG : ((((Loc) -> Val) -> (A, B), (((Loc) -> Val) -> (A, B), (Loc) -> Val, (Loc) -> Val, Loc) -> Val), ((Loc) -> Val) -> B, (Loc) -> Val, (Loc) -> Val, Loc) -> Val)((v : (((Loc) -> Val) -> (A, B), (((Loc) -> Val) -> (A, B), (Loc) -> Val, (Loc) -> Val, Loc) -> Val)), (e : ((Loc) -> Val) -> B), (s0 : (Loc) -> Val), (s : (Loc) -> Val)) == VAR_ASG(v, UPD_SND(e(s0), VAR_EXP(v)), s0, s)")))
}

///|
let var_snd_asg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VAR_SND_ASG")

///|
/// `VAR_SND_ASG`
pub fn var_snd_asg() -> @kernel.Thm {
  var_snd_asg_c.get()
}

///|
/// FST_VAR
fn step_42() -> Unit raise {
  fst_var_c.set(@pair.new_definition(@term_syntax.parse_term("(FST_VAR : ((((Loc) -> Val) -> (A, B), (((Loc) -> Val) -> (A, B), (Loc) -> Val, (Loc) -> Val, Loc) -> Val)) -> (((Loc) -> Val) -> A, (((Loc) -> Val) -> A, (Loc) -> Val, (Loc) -> Val, Loc) -> Val))((v : (((Loc) -> Val) -> (A, B), (((Loc) -> Val) -> (A, B), (Loc) -> Val, (Loc) -> Val, Loc) -> Val))) == (s_FST(VAR_EXP(v)), VAR_FST_ASG(v))")))
}

///|
let fst_var_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FST_VAR")

///|
/// `FST_VAR`
pub fn fst_var() -> @kernel.Thm {
  fst_var_c.get()
}

///|
/// SND_VAR
fn step_43() -> Unit raise {
  snd_var_c.set(@pair.new_definition(@term_syntax.parse_term("(SND_VAR : ((((Loc) -> Val) -> (A, B), (((Loc) -> Val) -> (A, B), (Loc) -> Val, (Loc) -> Val, Loc) -> Val)) -> (((Loc) -> Val) -> B, (((Loc) -> Val) -> B, (Loc) -> Val, (Loc) -> Val, Loc) -> Val))((v : (((Loc) -> Val) -> (A, B), (((Loc) -> Val) -> (A, B), (Loc) -> Val, (Loc) -> Val, Loc) -> Val))) == (s_SND(VAR_EXP(v)), VAR_SND_ASG(v))")))
}

///|
let snd_var_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SND_VAR")

///|
/// `SND_VAR`
pub fn snd_var() -> @kernel.Thm {
  snd_var_c.get()
}

///|
/// PAR_PAR
fn step_44() -> Unit raise {
  par_par_c.set(@pair.new_definition(@term_syntax.parse_term("(PAR_PAR : (((Loc) -> Val, (Loc) -> Val, Loc) -> Val, ((Loc) -> Val, (Loc) -> Val, Loc) -> Val, (Loc) -> Val, (Loc) -> Val, Loc) -> Val)((p1 : ((Loc) -> Val, (Loc) -> Val, Loc) -> Val), (p2 : ((Loc) -> Val, (Loc) -> Val, Loc) -> Val), (s0 : (Loc) -> Val), (s : (Loc) -> Val)) == p2(s0, p1(s0, s))")))
}

///|
let par_par_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PAR_PAR")

///|
/// `PAR_PAR`
pub fn par_par() -> @kernel.Thm {
  par_par_c.get()
}

///|
/// LIST_PAR_term
fn step_45() -> Unit raise {
  list_par_term_c.set(@term_syntax.parse_term("(LIST_PAR : (List[((Loc) -> Val, (Loc) -> Val, Loc) -> Val], (Loc) -> Val, (Loc) -> Val, Loc) -> Val)(NIL, (s0 : (Loc) -> Val), (s : (Loc) -> Val)) == s && LIST_PAR(CONS((h : ((Loc) -> Val, (Loc) -> Val, Loc) -> Val), (t : List[((Loc) -> Val, (Loc) -> Val, Loc) -> Val])), s0, s) == LIST_PAR(t, s0, h(s0, s))"))
}

///|
let list_par_term_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("LIST_PAR_term")

///|
/// `LIST_PAR_term`
pub fn list_par_term() -> @kernel.Term {
  list_par_term_c.get()
}

///|
/// LIST_PAR
fn step_46() -> Unit raise {
  list_par_c.set(@recursion.new_recursive_definition(@ind_types.list_recursion())(list_par_term()))
}

///|
let list_par_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIST_PAR")

///|
/// `LIST_PAR`
pub fn list_par() -> @kernel.Thm {
  list_par_c.get()
}

///|
/// PAR_ATOM
fn step_47() -> Unit raise {
  par_atom_c.set(@pair.new_definition(@term_syntax.parse_term("(PAR_ATOM : (((Loc) -> Val, (Loc) -> Val, Loc) -> Val, (Loc) -> Val, Loc) -> Val)((p : ((Loc) -> Val, (Loc) -> Val, Loc) -> Val), (s : (Loc) -> Val)) == p(s, s)")))
}

///|
let par_atom_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PAR_ATOM")

///|
/// `PAR_ATOM`
pub fn par_atom() -> @kernel.Thm {
  par_atom_c.get()
}

///|
/// WHEN_PAR
fn step_48() -> Unit raise {
  when_par_c.set(@pair.new_definition(@term_syntax.parse_term("(WHEN_PAR : (((Loc) -> Val, (Loc) -> Val, Loc) -> Val, ((Loc) -> Val) -> Bool, (Loc) -> Val, (Loc) -> Val, Loc) -> Val)((p : ((Loc) -> Val, (Loc) -> Val, Loc) -> Val), (g : ((Loc) -> Val) -> Bool), (s0 : (Loc) -> Val), (s : (Loc) -> Val)) == (if g(s0) { p(s0, s) } else { s })")))
}

///|
let when_par_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WHEN_PAR")

///|
/// `WHEN_PAR`
pub fn when_par() -> @kernel.Thm {
  when_par_c.get()
}

///|
/// IF_PAR
fn step_49() -> Unit raise {
  if_par_c.set(@pair.new_definition(@term_syntax.parse_term("(IF_PAR : (((Loc) -> Val, (Loc) -> Val, Loc) -> Val, ((Loc) -> Val, (Loc) -> Val, Loc) -> Val, ((Loc) -> Val) -> Bool, (Loc) -> Val, (Loc) -> Val, Loc) -> Val)((p1 : ((Loc) -> Val, (Loc) -> Val, Loc) -> Val), (p2 : ((Loc) -> Val, (Loc) -> Val, Loc) -> Val), (g : ((Loc) -> Val) -> Bool), (s0 : (Loc) -> Val), (s : (Loc) -> Val)) == (if g(s0) { p1(s0, s) } else { p2(s0, s) })")))
}

///|
let if_par_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IF_PAR")

///|
/// `IF_PAR`
pub fn if_par() -> @kernel.Thm {
  if_par_c.get()
}

///|
/// ID_PAR
fn step_50() -> Unit raise {
  id_par_c.set(@pair.new_definition(@term_syntax.parse_term("(ID_PAR : ((Loc) -> Val, (Loc) -> Val, Loc) -> Val)((s0 : (Loc) -> Val), (s : (Loc) -> Val)) == s")))
}

///|
let id_par_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ID_PAR")

///|
/// `ID_PAR`
pub fn id_par() -> @kernel.Thm {
  id_par_c.get()
}

///|
/// ITER_PAR0_term
fn step_51() -> Unit raise {
  iter_par0_term_c.set(@term_syntax.parse_term("(ITER_PAR0 : (Num, Num, (Num) -> Bool, (Num, (Loc) -> Val, (Loc) -> Val, Loc) -> Val, (Loc) -> Val, (Loc) -> Val, Loc) -> Val)((low : Num), 0, (f : (Num) -> Bool), (fi : (Num, (Loc) -> Val, (Loc) -> Val, Loc) -> Val)) == ID_PAR && ITER_PAR0(low, SUC((n : Num)), f, fi) == (if f(low) { PAR_PAR(fi(low), ITER_PAR0(SUC(low), n, f, fi)) } else { ITER_PAR0(SUC(low), n, f, fi) })"))
}

///|
let iter_par0_term_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("ITER_PAR0_term")

///|
/// `ITER_PAR0_term`
pub fn iter_par0_term() -> @kernel.Term {
  iter_par0_term_c.get()
}

///|
/// ITER_PAR0
fn step_52() -> Unit raise {
  iter_par0_c.set(@recursion.new_recursive_definition(@nums.num_recursion())(iter_par0_term()))
}

///|
let iter_par0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITER_PAR0")

///|
/// `ITER_PAR0`
pub fn iter_par0() -> @kernel.Thm {
  iter_par0_c.get()
}

///|
/// ITER_PAR
fn step_53() -> Unit raise {
  iter_par_c.set(@pair.new_definition(@term_syntax.parse_term("(ITER_PAR : (Num, Num, (Num) -> Bool, (Num, (Loc) -> Val, (Loc) -> Val, Loc) -> Val, (Loc) -> Val, (Loc) -> Val, Loc) -> Val)((low : Num), (high : Num), (f : (Num) -> Bool), (fi : (Num, (Loc) -> Val, (Loc) -> Val, Loc) -> Val)) == ITER_PAR0(low, 1 + high - low, f, fi)")))
}

///|
let iter_par_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITER_PAR")

///|
/// `ITER_PAR`
pub fn iter_par() -> @kernel.Thm {
  iter_par_c.get()
}

///|
/// K_DEF
fn step_54() -> Unit raise {
  k_def_c.set(@pair.new_definition(@term_syntax.parse_term("(K : (_, _) -> _)((x : _), (y : _)) == x")))
}

///|
let k_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("K_DEF")

///|
/// `K_DEF`
pub fn k_def() -> @kernel.Thm {
  k_def_c.get()
}

///|
/// ASG_ACT
fn step_55() -> Unit raise {
  asg_act_c.set(@pair.new_definition(@term_syntax.parse_term("(ASG_ACT : (((Loc) -> Val, (Loc) -> Val, Loc) -> Val, Loc, (Num) -> Val, (Val) -> Num, Num, (Loc) -> Val, Loc) -> Val)((par : ((Loc) -> Val, (Loc) -> Val, Loc) -> Val), (pc : Loc), (mk : (Num) -> Val), (ds : (Val) -> Num), (l0 : Num)) == PAR_ATOM(WHEN_PAR(LIST_PAR([par, LOC_ASG(pc, mk, K(SUC(l0)))]), op_eq_star(LOC_EXP(pc, ds), K(l0))))")))
}

///|
let asg_act_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ASG_ACT")

///|
/// `ASG_ACT`
pub fn asg_act() -> @kernel.Thm {
  asg_act_c.get()
}

///|
/// TST_ACT
fn step_56() -> Unit raise {
  tst_act_c.set(@pair.new_definition(@term_syntax.parse_term("(TST_ACT : (((Loc) -> Val) -> Bool, Num, Loc, (Num) -> Val, (Val) -> Num, Num, (Loc) -> Val, Loc) -> Val)((g : ((Loc) -> Val) -> Bool), (l : Num), (pc : Loc), (mk : (Num) -> Val), (ds : (Val) -> Num), (l0 : Num)) == PAR_ATOM(WHEN_PAR(LOC_ASG(pc, mk, op_eq_gt_star(g, K(SUC(l0)), K(l))), op_eq_star(LOC_EXP(pc, ds), K(l0))))")))
}

///|
let tst_act_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TST_ACT")

///|
/// `TST_ACT`
pub fn tst_act() -> @kernel.Thm {
  tst_act_c.get()
}

///|
/// GTO_ACT
fn step_57() -> Unit raise {
  gto_act_c.set(@pair.new_definition(@term_syntax.parse_term("(GTO_ACT : (Num, Loc, (Num) -> Val, (Val) -> Num, Num, (Loc) -> Val, Loc) -> Val)((l : Num), (pc : Loc), (mk : (Num) -> Val), (ds : (Val) -> Num), (l0 : Num)) == PAR_ATOM(WHEN_PAR(LOC_ASG(pc, mk, K(l)), op_eq_star(LOC_EXP(pc, ds), K(l0))))")))
}

///|
let gto_act_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GTO_ACT")

///|
/// `GTO_ACT`
pub fn gto_act() -> @kernel.Thm {
  gto_act_c.get()
}

///|
/// PAR_SEQ
fn step_58() -> Unit raise {
  par_seq_c.set(@pair.new_definition(@term_syntax.parse_term("(PAR_SEQ : (((Loc) -> Val, (Loc) -> Val, Loc) -> Val, Loc, (Num) -> Val, (Val) -> Num, Num) -> (List[((Loc) -> Val, Loc) -> Val], Num))((par : ((Loc) -> Val, (Loc) -> Val, Loc) -> Val), (pc : Loc), (mk : (Num) -> Val), (ds : (Val) -> Num), (l0 : Num)) == ([ASG_ACT(par, pc, mk, ds, l0)], SUC(l0))")))
}

///|
let par_seq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PAR_SEQ")

///|
/// `PAR_SEQ`
pub fn par_seq() -> @kernel.Thm {
  par_seq_c.get()
}

///|
/// ID_SEQ
fn step_59() -> Unit raise {
  id_seq_c.set(@pair.new_definition(@term_syntax.parse_term("(ID_SEQ : (Loc, (Num) -> Val, (Val) -> Num, Num) -> (List[_], Num))((pc : Loc), (mk : (Num) -> Val), (ds : (Val) -> Num), (l0 : Num)) == (NIL, l0)")))
}

///|
let id_seq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ID_SEQ")

///|
/// `ID_SEQ`
pub fn id_seq() -> @kernel.Thm {
  id_seq_c.get()
}

///|
/// SEQ_SEQ
fn step_60() -> Unit raise {
  seq_seq_c.set(@pair.new_definition(@term_syntax.parse_term("(SEQ_SEQ : ((Loc, (Num) -> Val, (Val) -> Num, Num) -> (List[((Loc) -> Val, Loc) -> Val], Num), (Loc, (Num) -> Val, (Val) -> Num, Num) -> (List[((Loc) -> Val, Loc) -> Val], Num), Loc, (Num) -> Val, (Val) -> Num, Num) -> (List[((Loc) -> Val, Loc) -> Val], Num))((s1 : (Loc, (Num) -> Val, (Val) -> Num, Num) -> (List[((Loc) -> Val, Loc) -> Val], Num)), (s2 : (Loc, (Num) -> Val, (Val) -> Num, Num) -> (List[((Loc) -> Val, Loc) -> Val], Num)), (pc : Loc), (mk : (Num) -> Val), (ds : (Val) -> Num), (l0 : Num)) == LET((b1 : (List[((Loc) -> Val, Loc) -> Val], Num)) => LET_END(LET((b2 : (List[((Loc) -> Val, Loc) -> Val], Num)) => LET_END((APPEND(FST(b1), FST(b2)), SND(b2))), s2(pc, mk, ds, SND(b1)))), s1(pc, mk, ds, l0))")))
}

///|
let seq_seq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEQ_SEQ")

///|
/// `SEQ_SEQ`
pub fn seq_seq() -> @kernel.Thm {
  seq_seq_c.get()
}

///|
/// ITER_SEQ0_term
fn step_61() -> Unit raise {
  iter_seq0_term_c.set(@term_syntax.parse_term("(ITER_SEQ0 : (Num, Num, (Num) -> Bool, (Num, Loc, (Num) -> Val, (Val) -> Num, Num) -> (List[((Loc) -> Val, Loc) -> Val], Num), Loc, (Num) -> Val, (Val) -> Num, Num) -> (List[((Loc) -> Val, Loc) -> Val], Num))((low : Num), 0, (f : (Num) -> Bool), (fi : (Num, Loc, (Num) -> Val, (Val) -> Num, Num) -> (List[((Loc) -> Val, Loc) -> Val], Num))) == ID_SEQ && ITER_SEQ0(low, SUC((n : Num)), f, fi) == (if f(low) { SEQ_SEQ(fi(low), ITER_SEQ0(SUC(low), n, f, fi)) } else { ITER_SEQ0(SUC(low), n, f, fi) })"))
}

///|
let iter_seq0_term_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("ITER_SEQ0_term")

///|
/// `ITER_SEQ0_term`
pub fn iter_seq0_term() -> @kernel.Term {
  iter_seq0_term_c.get()
}

///|
/// ITER_SEQ0
fn step_62() -> Unit raise {
  iter_seq0_c.set(@recursion.new_recursive_definition(@nums.num_recursion())(iter_seq0_term()))
}

///|
let iter_seq0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITER_SEQ0")

///|
/// `ITER_SEQ0`
pub fn iter_seq0() -> @kernel.Thm {
  iter_seq0_c.get()
}

///|
/// ITER_SEQ
fn step_63() -> Unit raise {
  iter_seq_c.set(@pair.new_definition(@term_syntax.parse_term("(ITER_SEQ : (Num, Num, (Num) -> Bool, (Num, Loc, (Num) -> Val, (Val) -> Num, Num) -> (List[((Loc) -> Val, Loc) -> Val], Num), Loc, (Num) -> Val, (Val) -> Num, Num) -> (List[((Loc) -> Val, Loc) -> Val], Num))((low : Num), (high : Num), (f : (Num) -> Bool), (fi : (Num, Loc, (Num) -> Val, (Val) -> Num, Num) -> (List[((Loc) -> Val, Loc) -> Val], Num))) == ITER_SEQ0(low, 1 + high - low, f, fi)")))
}

///|
let iter_seq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITER_SEQ")

///|
/// `ITER_SEQ`
pub fn iter_seq() -> @kernel.Thm {
  iter_seq_c.get()
}

///|
/// LIST_SEQ_term
fn step_64() -> Unit raise {
  list_seq_term_c.set(@term_syntax.parse_term("(LIST_SEQ : (List[(Loc, (Num) -> Val, (Val) -> Num, Num) -> (List[((Loc) -> Val, Loc) -> Val], Num)], Loc, (Num) -> Val, (Val) -> Num, Num) -> (List[((Loc) -> Val, Loc) -> Val], Num))(NIL, (pc : Loc), (mk : (Num) -> Val), (ds : (Val) -> Num), (l0 : Num)) == (NIL, l0) && LIST_SEQ(CONS((sa : (Loc, (Num) -> Val, (Val) -> Num, Num) -> (List[((Loc) -> Val, Loc) -> Val], Num)), (sas : List[(Loc, (Num) -> Val, (Val) -> Num, Num) -> (List[((Loc) -> Val, Loc) -> Val], Num)])), pc, mk, ds, l0) == LET((b1 : (List[((Loc) -> Val, Loc) -> Val], Num)) => LET_END(LET((bs : (List[((Loc) -> Val, Loc) -> Val], Num)) => LET_END((APPEND(FST(b1), FST(bs)), SND(bs))), LIST_SEQ(sas, pc, mk, ds, SND(b1)))), sa(pc, mk, ds, l0))"))
}

///|
let list_seq_term_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("LIST_SEQ_term")

///|
/// `LIST_SEQ_term`
pub fn list_seq_term() -> @kernel.Term {
  list_seq_term_c.get()
}

///|
/// LIST_SEQ
fn step_65() -> Unit raise {
  list_seq_c.set(@recursion.new_recursive_definition(@ind_types.list_recursion())(list_seq_term()))
}

///|
let list_seq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIST_SEQ")

///|
/// `LIST_SEQ`
pub fn list_seq() -> @kernel.Thm {
  list_seq_c.get()
}

///|
/// IF1_SEQ
fn step_66() -> Unit raise {
  if1_seq_c.set(@pair.new_definition(@term_syntax.parse_term("(IF1_SEQ : (((Loc) -> Val) -> Bool, (Loc, (Num) -> Val, (Val) -> Num, Num) -> (List[((Loc) -> Val, Loc) -> Val], Num), Loc, (Num) -> Val, (Val) -> Num, Num) -> (List[((Loc) -> Val, Loc) -> Val], Num))((g : ((Loc) -> Val) -> Bool), (sa : (Loc, (Num) -> Val, (Val) -> Num, Num) -> (List[((Loc) -> Val, Loc) -> Val], Num)), (pc : Loc), (mk : (Num) -> Val), (ds : (Val) -> Num), (l0 : Num)) == LET((b1 : (List[((Loc) -> Val, Loc) -> Val], Num)) => LET_END(LET((a1 : ((Loc) -> Val, Loc) -> Val) => LET_END((CONS(a1, FST(b1)), SND(b1))), TST_ACT(g, SND(b1), pc, mk, ds, l0))), sa(pc, mk, ds, SUC(l0)))")))
}

///|
let if1_seq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IF1_SEQ")

///|
/// `IF1_SEQ`
pub fn if1_seq() -> @kernel.Thm {
  if1_seq_c.get()
}

///|
/// IF2_SEQ
fn step_67() -> Unit raise {
  if2_seq_c.set(@pair.new_definition(@term_syntax.parse_term("(IF2_SEQ : (((Loc) -> Val) -> Bool, (Loc, (Num) -> Val, (Val) -> Num, Num) -> (List[((Loc) -> Val, Loc) -> Val], Num), (Loc, (Num) -> Val, (Val) -> Num, Num) -> (List[((Loc) -> Val, Loc) -> Val], Num), Loc, (Num) -> Val, (Val) -> Num, Num) -> (List[((Loc) -> Val, Loc) -> Val], Num))((g : ((Loc) -> Val) -> Bool), (sa1 : (Loc, (Num) -> Val, (Val) -> Num, Num) -> (List[((Loc) -> Val, Loc) -> Val], Num)), (sa2 : (Loc, (Num) -> Val, (Val) -> Num, Num) -> (List[((Loc) -> Val, Loc) -> Val], Num)), (pc : Loc), (mk : (Num) -> Val), (ds : (Val) -> Num), (l0 : Num)) == LET((b1 : (List[((Loc) -> Val, Loc) -> Val], Num)) => LET_END(LET((b2 : (List[((Loc) -> Val, Loc) -> Val], Num)) => LET_END(LET((a1 : ((Loc) -> Val, Loc) -> Val) => LET_END(LET((a2 : ((Loc) -> Val, Loc) -> Val) => LET_END((APPEND(CONS(a1, FST(b1)), CONS(a2, FST(b2))), SND(b2))), GTO_ACT(SND(b2), pc, mk, ds, SND(b1)))), TST_ACT(g, SUC(SND(b1)), pc, mk, ds, l0))), sa2(pc, mk, ds, SUC(SND(b1))))), sa1(pc, mk, ds, SUC(l0)))")))
}

///|
let if2_seq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IF2_SEQ")

///|
/// `IF2_SEQ`
pub fn if2_seq() -> @kernel.Thm {
  if2_seq_c.get()
}

///|
/// WHL_SEQ
fn step_68() -> Unit raise {
  whl_seq_c.set(@pair.new_definition(@term_syntax.parse_term("(WHL_SEQ : (((Loc) -> Val) -> Bool, (Loc, (Num) -> Val, (Val) -> Num, Num) -> (List[((Loc) -> Val, Loc) -> Val], Num), Loc, (Num) -> Val, (Val) -> Num, Num) -> (List[((Loc) -> Val, Loc) -> Val], Num))((g : ((Loc) -> Val) -> Bool), (sa : (Loc, (Num) -> Val, (Val) -> Num, Num) -> (List[((Loc) -> Val, Loc) -> Val], Num)), (pc : Loc), (mk : (Num) -> Val), (ds : (Val) -> Num), (l0 : Num)) == LET((b1 : (List[((Loc) -> Val, Loc) -> Val], Num)) => LET_END(LET((a1 : ((Loc) -> Val, Loc) -> Val) => LET_END(LET((a2 : ((Loc) -> Val, Loc) -> Val) => LET_END((APPEND(CONS(a1, FST(b1)), [a2]), SUC(SND(b1)))), GTO_ACT(l0, pc, mk, ds, SND(b1)))), TST_ACT(g, SUC(SND(b1)), pc, mk, ds, l0))), sa(pc, mk, ds, SUC(l0)))")))
}

///|
let whl_seq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WHL_SEQ")

///|
/// `WHL_SEQ`
pub fn whl_seq() -> @kernel.Thm {
  whl_seq_c.get()
}

///|
/// PAR_INT
fn step_69() -> Unit raise {
  par_int_c.set(@pair.new_definition(@term_syntax.parse_term("(PAR_INT : (((Loc) -> Val, (Loc) -> Val, Loc) -> Val) -> List[((Loc) -> Val, Loc) -> Val])((par : ((Loc) -> Val, (Loc) -> Val, Loc) -> Val)) == [PAR_ATOM(par)]")))
}

///|
let par_int_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PAR_INT")

///|
/// `PAR_INT`
pub fn par_int() -> @kernel.Thm {
  par_int_c.get()
}

///|
/// INT_INT
fn step_70() -> Unit raise {
  int_int_c.set(@pair.new_definition(@term_syntax.parse_term("(INT_INT : (List[((Loc) -> Val, Loc) -> Val], List[((Loc) -> Val, Loc) -> Val]) -> List[((Loc) -> Val, Loc) -> Val])((i1 : List[((Loc) -> Val, Loc) -> Val]), (i2 : List[((Loc) -> Val, Loc) -> Val])) == APPEND(i1, i2)")))
}

///|
let int_int_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_INT")

///|
/// `INT_INT`
pub fn int_int() -> @kernel.Thm {
  int_int_c.get()
}

///|
/// LIST_INT_term
fn step_71() -> Unit raise {
  list_int_term_c.set(@term_syntax.parse_term("(LIST_INT : (List[List[((Loc) -> Val, Loc) -> Val]]) -> List[((Loc) -> Val, Loc) -> Val])(NIL) == NIL && LIST_INT(CONS((h : List[((Loc) -> Val, Loc) -> Val]), (t : List[List[((Loc) -> Val, Loc) -> Val]]))) == APPEND(h, LIST_INT(t))"))
}

///|
let list_int_term_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("LIST_INT_term")

///|
/// `LIST_INT_term`
pub fn list_int_term() -> @kernel.Term {
  list_int_term_c.get()
}

///|
/// LIST_INT
fn step_72() -> Unit raise {
  list_int_c.set(@recursion.new_recursive_definition(@ind_types.list_recursion())(list_int_term()))
}

///|
let list_int_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIST_INT")

///|
/// `LIST_INT`
pub fn list_int() -> @kernel.Thm {
  list_int_c.get()
}

///|
/// ID_INT
fn step_73() -> Unit raise {
  id_int_c.set(@pair.new_definition(@term_syntax.parse_term("(ID_INT : List[((Loc) -> Val, Loc) -> Val]) == NIL")))
}

///|
let id_int_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ID_INT")

///|
/// `ID_INT`
pub fn id_int() -> @kernel.Thm {
  id_int_c.get()
}

///|
/// ITER_INT0_term
fn step_74() -> Unit raise {
  iter_int0_term_c.set(@term_syntax.parse_term("(ITER_INT0 : (Num, Num, (Num) -> Bool, (Num) -> List[((Loc) -> Val, Loc) -> Val]) -> List[((Loc) -> Val, Loc) -> Val])((low : Num), 0, (f : (Num) -> Bool), (fi : (Num) -> List[((Loc) -> Val, Loc) -> Val])) == ID_INT && ITER_INT0(low, SUC((n : Num)), f, fi) == (if f(low) { INT_INT(fi(low), ITER_INT0(SUC(low), n, f, fi)) } else { ITER_INT0(SUC(low), n, f, fi) })"))
}

///|
let iter_int0_term_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("ITER_INT0_term")

///|
/// `ITER_INT0_term`
pub fn iter_int0_term() -> @kernel.Term {
  iter_int0_term_c.get()
}

///|
/// ITER_INT0
fn step_75() -> Unit raise {
  iter_int0_c.set(@recursion.new_recursive_definition(@nums.num_recursion())(iter_int0_term()))
}

///|
let iter_int0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITER_INT0")

///|
/// `ITER_INT0`
pub fn iter_int0() -> @kernel.Thm {
  iter_int0_c.get()
}

///|
/// ITER_INT
fn step_76() -> Unit raise {
  iter_int_c.set(@pair.new_definition(@term_syntax.parse_term("(ITER_INT : (Num, Num, (Num) -> Bool, (Num) -> List[((Loc) -> Val, Loc) -> Val]) -> List[((Loc) -> Val, Loc) -> Val])((low : Num), (high : Num), (f : (Num) -> Bool), (fi : (Num) -> List[((Loc) -> Val, Loc) -> Val])) == ITER_INT0(low, 1 + high - low, f, fi)")))
}

///|
let iter_int_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITER_INT")

///|
/// `ITER_INT`
pub fn iter_int() -> @kernel.Thm {
  iter_int_c.get()
}

///|
/// AT_LBL
fn step_77() -> Unit raise {
  at_lbl_c.set(@pair.new_definition(@term_syntax.parse_term("(AT_LBL : ((Val) -> Num, Loc, (Num, Num), (Loc) -> Val) -> Bool)((ds : (Val) -> Num), (pc : Loc), (label : (Num, Num))) == op_eq_star(LOC_EXP(pc, ds), K(FST(label)))")))
}

///|
let at_lbl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AT_LBL")

///|
/// `AT_LBL`
pub fn at_lbl() -> @kernel.Thm {
  at_lbl_c.get()
}

///|
/// AFTER_LBL
fn step_78() -> Unit raise {
  after_lbl_c.set(@pair.new_definition(@term_syntax.parse_term("(AFTER_LBL : ((Val) -> Num, Loc, (Num, Num), (Loc) -> Val) -> Bool)((ds : (Val) -> Num), (pc : Loc), (label : (Num, Num))) == op_eq_star(LOC_EXP(pc, ds), K(SND(label)))")))
}

///|
let after_lbl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AFTER_LBL")

///|
/// `AFTER_LBL`
pub fn after_lbl() -> @kernel.Thm {
  after_lbl_c.get()
}

///|
/// BEFORE_LBL
fn step_79() -> Unit raise {
  before_lbl_c.set(@pair.new_definition(@term_syntax.parse_term("(BEFORE_LBL : ((Val) -> Num, Loc, (Num, Num), (Loc) -> Val) -> Bool)((ds : (Val) -> Num), (pc : Loc), (label : (Num, Num))) == op_lt_star(LOC_EXP(pc, ds), K(FST(label)))")))
}

///|
let before_lbl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BEFORE_LBL")

///|
/// `BEFORE_LBL`
pub fn before_lbl() -> @kernel.Thm {
  before_lbl_c.get()
}

///|
/// INSIDE_LBL
fn step_80() -> Unit raise {
  inside_lbl_c.set(@pair.new_definition(@term_syntax.parse_term("(INSIDE_LBL : ((Val) -> Num, Loc, (Num, Num), (Loc) -> Val) -> Bool)((ds : (Val) -> Num), (pc : Loc), (label : (Num, Num))) == op_slash_bslash_star(op_gt_eq_star(LOC_EXP(pc, ds), K(FST(label))), op_lt_star(LOC_EXP(pc, ds), K(SND(label))))")))
}

///|
let inside_lbl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INSIDE_LBL")

///|
/// `INSIDE_LBL`
pub fn inside_lbl() -> @kernel.Thm {
  inside_lbl_c.get()
}

///|
/// FOLLOW_LBL
fn step_81() -> Unit raise {
  follow_lbl_c.set(@pair.new_definition(@term_syntax.parse_term("(FOLLOW_LBL : ((Val) -> Num, Loc, (Num, Num), (Loc) -> Val) -> Bool)((ds : (Val) -> Num), (pc : Loc), (label : (Num, Num))) == op_gt_eq_star(LOC_EXP(pc, ds), K(SND(label)))")))
}

///|
let follow_lbl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FOLLOW_LBL")

///|
/// `FOLLOW_LBL`
pub fn follow_lbl() -> @kernel.Thm {
  follow_lbl_c.get()
}

///|
/// AT_ABS
fn step_82() -> Unit raise {
  at_abs_c.set(@pair.new_definition(@term_syntax.parse_term("(AT_ABS : (((Loc) -> Val) -> Num, Num, Num, (Loc) -> Val) -> Bool)((pc : ((Loc) -> Val) -> Num), (l : Num), (u : Num)) == op_eq_star(pc, K(l))")))
}

///|
let at_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AT_ABS")

///|
/// `AT_ABS`
pub fn at_abs() -> @kernel.Thm {
  at_abs_c.get()
}

///|
/// AT_REL
fn step_83() -> Unit raise {
  at_rel_c.set(@pair.new_definition(@term_syntax.parse_term("(AT_REL : ((((Loc) -> Val) -> Num, (((Loc) -> Val) -> Num, (Loc) -> Val, (Loc) -> Val, Loc) -> Val), (Num, Num), (Loc) -> Val) -> Bool)((pc : (((Loc) -> Val) -> Num, (((Loc) -> Val) -> Num, (Loc) -> Val, (Loc) -> Val, Loc) -> Val)), (label : (Num, Num))) == op_eq_star(VAR_EXP(pc), K(FST(label)))")))
}

///|
let at_rel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AT_REL")

///|
/// `AT_REL`
pub fn at_rel() -> @kernel.Thm {
  at_rel_c.get()
}

///|
/// AFTER_ABS
fn step_84() -> Unit raise {
  after_abs_c.set(@pair.new_definition(@term_syntax.parse_term("(AFTER_ABS : (((Loc) -> Val) -> Num, Num, Num, (Loc) -> Val) -> Bool)((pc : ((Loc) -> Val) -> Num), (l : Num), (u : Num)) == op_eq_star(pc, K(u))")))
}

///|
let after_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AFTER_ABS")

///|
/// `AFTER_ABS`
pub fn after_abs() -> @kernel.Thm {
  after_abs_c.get()
}

///|
/// AFTER_REL
fn step_85() -> Unit raise {
  after_rel_c.set(@pair.new_definition(@term_syntax.parse_term("(AFTER_REL : ((((Loc) -> Val) -> Num, (((Loc) -> Val) -> Num, (Loc) -> Val, (Loc) -> Val, Loc) -> Val), (Num, Num), (Loc) -> Val) -> Bool)((pc : (((Loc) -> Val) -> Num, (((Loc) -> Val) -> Num, (Loc) -> Val, (Loc) -> Val, Loc) -> Val)), (label : (Num, Num))) == op_eq_star(VAR_EXP(pc), K(SND(label)))")))
}

///|
let after_rel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AFTER_REL")

///|
/// `AFTER_REL`
pub fn after_rel() -> @kernel.Thm {
  after_rel_c.get()
}

///|
/// BEFORE_ABS
fn step_86() -> Unit raise {
  before_abs_c.set(@pair.new_definition(@term_syntax.parse_term("(BeforeAbs : (((Loc) -> Val) -> Num, Num, Num, (Loc) -> Val) -> Bool)((pc : ((Loc) -> Val) -> Num), (l : Num), (u : Num)) == op_lt_star(pc, K(l))")))
}

///|
let before_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BEFORE_ABS")

///|
/// `BEFORE_ABS`
pub fn before_abs() -> @kernel.Thm {
  before_abs_c.get()
}

///|
/// BEFORE_REL
fn step_87() -> Unit raise {
  before_rel_c.set(@pair.new_definition(@term_syntax.parse_term("(BEFORE_REL : ((((Loc) -> Val) -> Num, (((Loc) -> Val) -> Num, (Loc) -> Val, (Loc) -> Val, Loc) -> Val), (Num, Num), (Loc) -> Val) -> Bool)((pc : (((Loc) -> Val) -> Num, (((Loc) -> Val) -> Num, (Loc) -> Val, (Loc) -> Val, Loc) -> Val)), (label : (Num, Num))) == op_lt_star(VAR_EXP(pc), K(FST(label)))")))
}

///|
let before_rel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BEFORE_REL")

///|
/// `BEFORE_REL`
pub fn before_rel() -> @kernel.Thm {
  before_rel_c.get()
}

///|
/// INSIDE_ABS
fn step_88() -> Unit raise {
  inside_abs_c.set(@pair.new_definition(@term_syntax.parse_term("(INSIDE_ABS : (((Loc) -> Val) -> Num, Num, Num, (Loc) -> Val) -> Bool)((pc : ((Loc) -> Val) -> Num), (l : Num), (u : Num)) == op_slash_bslash_star(op_gt_eq_star(pc, K(l)), op_lt_star(pc, K(u)))")))
}

///|
let inside_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INSIDE_ABS")

///|
/// `INSIDE_ABS`
pub fn inside_abs() -> @kernel.Thm {
  inside_abs_c.get()
}

///|
/// INSIDE_REL
fn step_89() -> Unit raise {
  inside_rel_c.set(@pair.new_definition(@term_syntax.parse_term("(INSIDE_REL : ((((Loc) -> Val) -> Num, (((Loc) -> Val) -> Num, (Loc) -> Val, (Loc) -> Val, Loc) -> Val), (Num, Num), (Loc) -> Val) -> Bool)((pc : (((Loc) -> Val) -> Num, (((Loc) -> Val) -> Num, (Loc) -> Val, (Loc) -> Val, Loc) -> Val)), (label : (Num, Num))) == op_slash_bslash_star(op_gt_eq_star(VAR_EXP(pc), K(FST(label))), op_lt_star(VAR_EXP(pc), K(SND(label))))")))
}

///|
let inside_rel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INSIDE_REL")

///|
/// `INSIDE_REL`
pub fn inside_rel() -> @kernel.Thm {
  inside_rel_c.get()
}

///|
/// FOLLOW_ABS
fn step_90() -> Unit raise {
  follow_abs_c.set(@pair.new_definition(@term_syntax.parse_term("(FollowAbs : (((Loc) -> Val) -> Num, Num, Num, (Loc) -> Val) -> Bool)((pc : ((Loc) -> Val) -> Num), (l : Num), (u : Num)) == op_gt_eq_star(pc, K(l))")))
}

///|
let follow_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FOLLOW_ABS")

///|
/// `FOLLOW_ABS`
pub fn follow_abs() -> @kernel.Thm {
  follow_abs_c.get()
}

///|
/// FOLLOW_REL
fn step_91() -> Unit raise {
  follow_rel_c.set(@pair.new_definition(@term_syntax.parse_term("(FOLLOW_REL : ((((Loc) -> Val) -> Num, (((Loc) -> Val) -> Num, (Loc) -> Val, (Loc) -> Val, Loc) -> Val), (Num, Num), (Loc) -> Val) -> Bool)((pc : (((Loc) -> Val) -> Num, (((Loc) -> Val) -> Num, (Loc) -> Val, (Loc) -> Val, Loc) -> Val)), (label : (Num, Num))) == op_gt_eq_star(VAR_EXP(pc), K(SND(label)))")))
}

///|
let follow_rel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FOLLOW_REL")

///|
/// `FOLLOW_REL`
pub fn follow_rel() -> @kernel.Thm {
  follow_rel_c.get()
}

///|
/// RESTRICTED_UNLESS_STMT
fn step_92() -> Unit raise {
  restricted_unless_stmt_c.set(@pair.new_definition(@term_syntax.parse_term("(RESTRICTED_UNLESS_STMT : ((State) -> Bool, (State) -> Bool, (State) -> Bool, (State) -> State) -> Bool)((v : (State) -> Bool), (p : (State) -> Bool), (q : (State) -> Bool), (st : (State) -> State)) == (∀ s : State, p(s) && v(s) && !q(s) → p(st(s)) || q(st(s)))")))
}

///|
let restricted_unless_stmt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RESTRICTED_UNLESS_STMT")

///|
/// `RESTRICTED_UNLESS_STMT`
pub fn restricted_unless_stmt() -> @kernel.Thm {
  restricted_unless_stmt_c.get()
}

///|
/// RESTRICTED_UNLESS_term
fn step_93() -> Unit raise {
  restricted_unless_term_c.set(@term_syntax.parse_term("(RESTRICTED_UNLESS : ((State) -> Bool, (State) -> Bool, (State) -> Bool, List[(State) -> State]) -> Bool)((v : (State) -> Bool), (p : (State) -> Bool), (q : (State) -> Bool), NIL) == true && RESTRICTED_UNLESS(v, p, q, CONS((st : (State) -> State), (Pr : List[(State) -> State]))) == (RESTRICTED_UNLESS_STMT(v, p, q, st) && RESTRICTED_UNLESS(v, p, q, Pr))"))
}

///|
let restricted_unless_term_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("RESTRICTED_UNLESS_term")

///|
/// `RESTRICTED_UNLESS_term`
pub fn restricted_unless_term() -> @kernel.Term {
  restricted_unless_term_c.get()
}

///|
/// RESTRICTED_UNLESS
fn step_94() -> Unit raise {
  restricted_unless_c.set(@recursion.new_recursive_definition(@ind_types.list_recursion())(restricted_unless_term()))
}

///|
let restricted_unless_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RESTRICTED_UNLESS")

///|
/// `RESTRICTED_UNLESS`
pub fn restricted_unless() -> @kernel.Thm {
  restricted_unless_c.get()
}

///|
/// RESTRICTED_STABLE_STMT
fn step_95() -> Unit raise {
  restricted_stable_stmt_c.set(@pair.new_definition(@term_syntax.parse_term("(RESTRICTED_STABLE_STMT : ((State) -> Bool, (State) -> Bool, (State) -> State) -> Bool)((v : (State) -> Bool), (p : (State) -> Bool), (st : (State) -> State)) == (∀ s : State, p(s) && v(s) → p(st(s)))")))
}

///|
let restricted_stable_stmt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RESTRICTED_STABLE_STMT")

///|
/// `RESTRICTED_STABLE_STMT`
pub fn restricted_stable_stmt() -> @kernel.Thm {
  restricted_stable_stmt_c.get()
}

///|
/// RESTRICTED_STABLE_term
fn step_96() -> Unit raise {
  restricted_stable_term_c.set(@term_syntax.parse_term("(RESTRICTED_STABLE : ((State) -> Bool, (State) -> Bool, List[(State) -> State]) -> Bool)((v : (State) -> Bool), (p : (State) -> Bool), NIL) == true && RESTRICTED_STABLE(v, p, CONS((st : (State) -> State), (Pr : List[(State) -> State]))) == (RESTRICTED_STABLE_STMT(v, p, st) && RESTRICTED_STABLE(v, p, Pr))"))
}

///|
let restricted_stable_term_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("RESTRICTED_STABLE_term")

///|
/// `RESTRICTED_STABLE_term`
pub fn restricted_stable_term() -> @kernel.Term {
  restricted_stable_term_c.get()
}

///|
/// RESTRICTED_STABLE
fn step_97() -> Unit raise {
  restricted_stable_c.set(@recursion.new_recursive_definition(@ind_types.list_recursion())(restricted_stable_term()))
}

///|
let restricted_stable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RESTRICTED_STABLE")

///|
/// `RESTRICTED_STABLE`
pub fn restricted_stable() -> @kernel.Thm {
  restricted_stable_c.get()
}

///|
/// RESTRICTED_EXISTS_TRANSITION_STMT
fn step_98() -> Unit raise {
  restricted_exists_transition_stmt_c.set(@pair.new_definition(@term_syntax.parse_term("(RESTRICTED_EXISTS_TRANSITION_STMT : ((State) -> Bool, (State) -> Bool, (State) -> Bool, (State) -> State) -> Bool)((v : (State) -> Bool), (p : (State) -> Bool), (q : (State) -> Bool), (st : (State) -> State)) == (∀ s : State, p(s) && v(s) && !q(s) → q(st(s)))")))
}

///|
let restricted_exists_transition_stmt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RESTRICTED_EXISTS_TRANSITION_STMT")

///|
/// `RESTRICTED_EXISTS_TRANSITION_STMT`
pub fn restricted_exists_transition_stmt() -> @kernel.Thm {
  restricted_exists_transition_stmt_c.get()
}

///|
/// RESTRICTED_EXISTS_TRANSITION_term
fn step_99() -> Unit raise {
  restricted_exists_transition_term_c.set(@term_syntax.parse_term("(RESTRICTED_EXISTS_TRANSITION : ((State) -> Bool, (State) -> Bool, (State) -> Bool, List[(State) -> State]) -> Bool)((v : (State) -> Bool), (p : (State) -> Bool), (q : (State) -> Bool), NIL) == false && RESTRICTED_EXISTS_TRANSITION(v, p, q, CONS((st : (State) -> State), (Pr : List[(State) -> State]))) == (RESTRICTED_EXISTS_TRANSITION_STMT(v, p, q, st) || RESTRICTED_EXISTS_TRANSITION(v, p, q, Pr))"))
}

///|
let restricted_exists_transition_term_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("RESTRICTED_EXISTS_TRANSITION_term")

///|
/// `RESTRICTED_EXISTS_TRANSITION_term`
pub fn restricted_exists_transition_term() -> @kernel.Term {
  restricted_exists_transition_term_c.get()
}

///|
/// RESTRICTED_EXISTS_TRANSITION
fn step_100() -> Unit raise {
  restricted_exists_transition_c.set(@recursion.new_recursive_definition(@ind_types.list_recursion())(restricted_exists_transition_term()))
}

///|
let restricted_exists_transition_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RESTRICTED_EXISTS_TRANSITION")

///|
/// `RESTRICTED_EXISTS_TRANSITION`
pub fn restricted_exists_transition() -> @kernel.Thm {
  restricted_exists_transition_c.get()
}

///|
/// RESTRICTED_ENSURES
fn step_101() -> Unit raise {
  restricted_ensures_c.set(@pair.new_definition(@term_syntax.parse_term("(RESTRICTED_ENSURES : ((State) -> Bool, (State) -> Bool, (State) -> Bool, List[(State) -> State]) -> Bool)((v : (State) -> Bool), (p : (State) -> Bool), (q : (State) -> Bool), (Pr : List[(State) -> State])) == (RESTRICTED_UNLESS(v, p, q, Pr) && RESTRICTED_EXISTS_TRANSITION(v, p, q, Pr))")))
}

///|
let restricted_ensures_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RESTRICTED_ENSURES")

///|
/// `RESTRICTED_ENSURES`
pub fn restricted_ensures() -> @kernel.Thm {
  restricted_ensures_c.get()
}

///|
/// RESTRICTED_LEADSTO
fn step_102() -> Unit raise {
  restricted_leadsto_c.set(@pair.new_definition(@term_syntax.parse_term("(RESTRICTED_LEADSTO : ((State) -> Bool, (State) -> Bool, (State) -> Bool, List[(State) -> State]) -> Bool)((v : (State) -> Bool), (p : (State) -> Bool), (q : (State) -> Bool), (Pr : List[(State) -> State])) == LEADSTO(op_slash_bslash_star(p, v), q, Pr)")))
}

///|
let restricted_leadsto_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RESTRICTED_LEADSTO")

///|
/// `RESTRICTED_LEADSTO`
pub fn restricted_leadsto() -> @kernel.Thm {
  restricted_leadsto_c.get()
}

///|
/// VALID
fn step_103() -> Unit raise {
  valid_c.set(@pair.new_definition(@term_syntax.parse_term("(VALID : ((State) -> Bool) -> Bool)((p : (State) -> Bool)) == (∀ s : State, p(s))")))
}

///|
let valid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VALID")

///|
/// `VALID`
pub fn valid() -> @kernel.Thm {
  valid_c.get()
}

///|
/// TRIPLE_term
fn step_104() -> Unit raise {
  triple_term_c.set(@term_syntax.parse_term("(TRIPLE : ((State) -> Bool, (State) -> Bool, List[(State) -> State]) -> Bool)((p : (State) -> Bool), (q : (State) -> Bool), NIL) == true && TRIPLE(p, q, CONS((st : (State) -> State), (Pr : List[(State) -> State]))) == ((∀ s : State, p(s) → q(st(s))) && TRIPLE(p, q, Pr))"))
}

///|
let triple_term_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("TRIPLE_term")

///|
/// `TRIPLE_term`
pub fn triple_term() -> @kernel.Term {
  triple_term_c.get()
}

///|
/// RESTRICTED_TRIPLE
fn step_105() -> Unit raise {
  restricted_triple_c.set(@recursion.new_recursive_definition(@ind_types.list_recursion())(triple_term()))
}

///|
let restricted_triple_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RESTRICTED_TRIPLE")

///|
/// `RESTRICTED_TRIPLE`
pub fn restricted_triple() -> @kernel.Thm {
  restricted_triple_c.get()
}

///|
/// SUMMA0_term
fn step_106() -> Unit raise {
  summa0_term_c.set(@term_syntax.parse_term("(SUMMA0 : (Num, Num, (Num) -> Bool, (Num) -> Num) -> Num)((lwb : Num), 0, (f : (Num) -> Bool), (b : (Num) -> Num)) == 0 && SUMMA0(lwb, SUC((n : Num)), f, b) == (if f(lwb) { b(lwb) } else { 0 }) + SUMMA0(SUC(lwb), n, f, b)"))
}

///|
let summa0_term_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("SUMMA0_term")

///|
/// `SUMMA0_term`
pub fn summa0_term() -> @kernel.Term {
  summa0_term_c.get()
}

///|
/// SUMMA0
fn step_107() -> Unit raise {
  summa0_c.set(@recursion.new_recursive_definition(@nums.num_recursion())(summa0_term()))
}

///|
let summa0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUMMA0")

///|
/// `SUMMA0`
pub fn summa0() -> @kernel.Thm {
  summa0_c.get()
}

///|
/// SUMMA
fn step_108() -> Unit raise {
  summa_c.set(@pair.new_definition(@term_syntax.parse_term("(SUMMA : (Num, Num, (Num) -> Bool, (Num) -> Num) -> Num)((lwb : Num), (upb : Num), (f : (Num) -> Bool), (b : (Num) -> Num)) == SUMMA0(lwb, 1 + upb - lwb, f, b)")))
}

///|
let summa_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUMMA")

///|
/// `SUMMA`
pub fn summa() -> @kernel.Thm {
  summa_c.get()
}

///|
/// SUMMA_S
fn step_109() -> Unit raise {
  summa_s_c.set(@pair.new_definition(@term_syntax.parse_term("(SUMMA_S : ((State) -> Num, (State) -> Num, (Num, State) -> Bool, (Num, State) -> Num, State) -> Num)((lwb : (State) -> Num), (upb : (State) -> Num), (f : (Num, State) -> Bool), (b : (Num, State) -> Num), (s : State)) == SUMMA(lwb(s), upb(s), (i : Num) => f(i, s), (i : Num) => b(i, s))")))
}

///|
let summa_s_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUMMA_S")

///|
/// `SUMMA_S`
pub fn summa_s() -> @kernel.Thm {
  summa_s_c.get()
}

///|
/// MULTA0_term
fn step_110() -> Unit raise {
  multa0_term_c.set(@term_syntax.parse_term("(MULTA0 : (Num, Num, (Num) -> Bool, (Num) -> Num) -> Num)((lwb : Num), 0, (f : (Num) -> Bool), (b : (Num) -> Num)) == 1 && MULTA0(lwb, SUC((n : Num)), f, b) == (if f(lwb) { b(lwb) } else { 1 }) * MULTA0(SUC(lwb), n, f, b)"))
}

///|
let multa0_term_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("MULTA0_term")

///|
/// `MULTA0_term`
pub fn multa0_term() -> @kernel.Term {
  multa0_term_c.get()
}

///|
/// MULTA0
fn step_111() -> Unit raise {
  multa0_c.set(@recursion.new_recursive_definition(@nums.num_recursion())(multa0_term()))
}

///|
let multa0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULTA0")

///|
/// `MULTA0`
pub fn multa0() -> @kernel.Thm {
  multa0_c.get()
}

///|
/// MULTA
fn step_112() -> Unit raise {
  multa_c.set(@pair.new_definition(@term_syntax.parse_term("(MULTA : (Num, Num, (Num) -> Bool, (Num) -> Num) -> Num)((lwb : Num), (upb : Num), (f : (Num) -> Bool), (b : (Num) -> Num)) == MULTA0(lwb, 1 + upb - lwb, f, b)")))
}

///|
let multa_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULTA")

///|
/// `MULTA`
pub fn multa() -> @kernel.Thm {
  multa_c.get()
}

///|
/// MULTA_S
fn step_113() -> Unit raise {
  multa_s_c.set(@pair.new_definition(@term_syntax.parse_term("(MULTA_S : ((State) -> Num, (State) -> Num, (Num, State) -> Bool, (Num, State) -> Num, State) -> Num)((lwb : (State) -> Num), (upb : (State) -> Num), (f : (Num, State) -> Bool), (b : (Num, State) -> Num), (s : State)) == MULTA(lwb(s), upb(s), (i : Num) => f(i, s), (i : Num) => b(i, s))")))
}

///|
let multa_s_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULTA_S")

///|
/// `MULTA_S`
pub fn multa_s() -> @kernel.Thm {
  multa_s_c.get()
}

///|
/// CONJA0_term
fn step_114() -> Unit raise {
  conja0_term_c.set(@term_syntax.parse_term("(CONJA0 : (Num, Num, (Num) -> Bool, (Num) -> Bool) -> Bool)((lwb : Num), 0, (f : (Num) -> Bool), (b : (Num) -> Bool)) == true && CONJA0(lwb, SUC((n : Num)), f, b) == ((if f(lwb) { b(lwb) } else { true }) && CONJA0(SUC(lwb), n, f, b))"))
}

///|
let conja0_term_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("CONJA0_term")

///|
/// `CONJA0_term`
pub fn conja0_term() -> @kernel.Term {
  conja0_term_c.get()
}

///|
/// CONJA0
fn step_115() -> Unit raise {
  conja0_c.set(@recursion.new_recursive_definition(@nums.num_recursion())(conja0_term()))
}

///|
let conja0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONJA0")

///|
/// `CONJA0`
pub fn conja0() -> @kernel.Thm {
  conja0_c.get()
}

///|
/// CONJA
fn step_116() -> Unit raise {
  conja_c.set(@pair.new_definition(@term_syntax.parse_term("(CONJA : (Num, Num, (Num) -> Bool, (Num) -> Bool) -> Bool)((lwb : Num), (upb : Num), (f : (Num) -> Bool), (b : (Num) -> Bool)) == CONJA0(lwb, 1 + upb - lwb, f, b)")))
}

///|
let conja_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONJA")

///|
/// `CONJA`
pub fn conja() -> @kernel.Thm {
  conja_c.get()
}

///|
/// CONJA_S
fn step_117() -> Unit raise {
  conja_s_c.set(@pair.new_definition(@term_syntax.parse_term("(CONJA_S : ((State) -> Num, (State) -> Num, (Num, State) -> Bool, (Num, State) -> Bool, State) -> Bool)((lwb : (State) -> Num), (upb : (State) -> Num), (f : (Num, State) -> Bool), (b : (Num, State) -> Bool), (s : State)) == CONJA(lwb(s), upb(s), (i : Num) => f(i, s), (i : Num) => b(i, s))")))
}

///|
let conja_s_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONJA_S")

///|
/// `CONJA_S`
pub fn conja_s() -> @kernel.Thm {
  conja_s_c.get()
}

///|
/// DISJA0_term
fn step_118() -> Unit raise {
  disja0_term_c.set(@term_syntax.parse_term("(DISJA0 : (Num, Num, (Num) -> Bool, (Num) -> Bool) -> Bool)((lwb : Num), 0, (f : (Num) -> Bool), (b : (Num) -> Bool)) == false && DISJA0(lwb, SUC((n : Num)), f, b) == ((if f(lwb) { b(lwb) } else { false }) || DISJA0(SUC(lwb), n, f, b))"))
}

///|
let disja0_term_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("DISJA0_term")

///|
/// `DISJA0_term`
pub fn disja0_term() -> @kernel.Term {
  disja0_term_c.get()
}

///|
/// DISJA0
fn step_119() -> Unit raise {
  disja0_c.set(@recursion.new_recursive_definition(@nums.num_recursion())(disja0_term()))
}

///|
let disja0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DISJA0")

///|
/// `DISJA0`
pub fn disja0() -> @kernel.Thm {
  disja0_c.get()
}

///|
/// DISJA
fn step_120() -> Unit raise {
  disja_c.set(@pair.new_definition(@term_syntax.parse_term("(DISJA : (Num, Num, (Num) -> Bool, (Num) -> Bool) -> Bool)((lwb : Num), (upb : Num), (f : (Num) -> Bool), (b : (Num) -> Bool)) == DISJA0(lwb, 1 + upb - lwb, f, b)")))
}

///|
let disja_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DISJA")

///|
/// `DISJA`
pub fn disja() -> @kernel.Thm {
  disja_c.get()
}

///|
/// DISJA_S
fn step_121() -> Unit raise {
  disja_s_c.set(@pair.new_definition(@term_syntax.parse_term("(DISJA_S : ((State) -> Num, (State) -> Num, (Num, State) -> Bool, (Num, State) -> Bool, State) -> Bool)((lwb : (State) -> Num), (upb : (State) -> Num), (f : (Num, State) -> Bool), (b : (Num, State) -> Bool), (s : State)) == DISJA(lwb(s), upb(s), (i : Num) => f(i, s), (i : Num) => b(i, s))")))
}

///|
let disja_s_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DISJA_S")

///|
/// `DISJA_S`
pub fn disja_s() -> @kernel.Thm {
  disja_s_c.get()
}

///|
/// MEMBER_term
fn step_122() -> Unit raise {
  member_term_c.set(@term_syntax.parse_term("(MEMBER : (A, List[A]) -> Bool)((x : A), NIL) == false && MEMBER(x, CONS((h : A), (t : List[A]))) == (x == h || MEMBER(x, t))"))
}

///|
let member_term_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("MEMBER_term")

///|
/// `MEMBER_term`
pub fn member_term() -> @kernel.Term {
  member_term_c.get()
}

///|
/// MEMBER
fn step_123() -> Unit raise {
  member_c.set(@recursion.new_recursive_definition(@ind_types.list_recursion())(member_term()))
}

///|
let member_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MEMBER")

///|
/// `MEMBER`
pub fn member_() -> @kernel.Thm {
  member_c.get()
}

///|
/// UNIQUE_term
fn step_124() -> Unit raise {
  unique_term_c.set(@term_syntax.parse_term("(UNIQUE : (List[A]) -> Bool)(NIL) == true && UNIQUE(CONS((h : A), (t : List[A]))) == (!MEMBER(h, t) && UNIQUE(t))"))
}

///|
let unique_term_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("UNIQUE_term")

///|
/// `UNIQUE_term`
pub fn unique_term() -> @kernel.Term {
  unique_term_c.get()
}

///|
/// UNIQUE
fn step_125() -> Unit raise {
  unique_c.set(@recursion.new_recursive_definition(@ind_types.list_recursion())(unique_term()))
}

///|
let unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNIQUE")

///|
/// `UNIQUE`
pub fn unique() -> @kernel.Thm {
  unique_c.get()
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
}
