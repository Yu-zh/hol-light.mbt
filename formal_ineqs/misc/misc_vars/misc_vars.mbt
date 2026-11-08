// Translated from upstream Formal_ineqs/misc/misc_vars.hl; edit this file directly.

///|
let standardize_c : @lib.Cell[(@kernel.Thm) -> @kernel.Thm raise] = @lib.Cell::new("standardize")

///|
/// `standardize`
pub fn standardize(x : @kernel.Thm) -> @kernel.Thm raise {
  (standardize_c.get())(x)
}

///|
let standardize_tm_c : @lib.Cell[(@kernel.Term) -> @kernel.Term raise] = @lib.Cell::new("standardize_tm")

///|
/// `standardize_tm`
pub fn standardize_tm(x : @kernel.Term) -> @kernel.Term raise {
  (standardize_tm_c.get())(x)
}

///|
let standardize_list_c : @lib.Cell[(Unit) -> @list.List[@kernel.Term] raise] = @lib.Cell::new("standardize_list")

///|
/// `standardize_list`
pub fn standardize_list(x : Unit) -> @list.List[@kernel.Term] raise {
  (standardize_list_c.get())(x)
}

///|
let standardize_reset_c : @lib.Cell[(Unit) -> Unit raise] = @lib.Cell::new("standardize_reset")

///|
/// `standardize_reset`
pub fn standardize_reset(x : Unit) -> Unit raise {
  (standardize_reset_c.get())(x)
}

///|
let standardize_enable_c : @lib.Cell[(Bool) -> Unit raise] = @lib.Cell::new("standardize_enable")

///|
/// `standardize_enable`
pub fn standardize_enable(x : Bool) -> Unit raise {
  (standardize_enable_c.get())(x)
}

///|
/// standardize, standardize_tm, standardize_list, standardize_reset, standardize_enable
fn step_1() -> Unit raise {
  let cache = @lib.hashtbl_create(100)
  let enabled = Ref::{ val: true }
  let find : (@kernel.Term) -> @kernel.Term raise = fn(x1 : @kernel.Term) -> @kernel.Term raise {
    let t = x1
    try {
      @lib.hashtbl_find(cache, t)
    } catch {
      @lib.NotFound => {
        @lib.hashtbl_add(cache, t, t)
        t
      }
      e => raise e
    }
  }
  fn replace(x2 : @kernel.Term) -> @kernel.Term raise {
    let tm = x2
    match tm {
      @kernel.Term::Var(_, _) | @kernel.Term::Const(_, _) => find(tm)
      @kernel.Term::Comb(s, t_1) => {
        let t3 = replace(t_1)
        @kernel.mk_comb(replace(s), t3)
      }
      @kernel.Term::Abs(v, b) => {
        let t4 = replace(b)
        @kernel.mk_abs(replace(v), t4)
      }
    }
  }
  let st : (@kernel.Thm) -> @kernel.Thm raise = fn(x5 : @kernel.Thm) -> @kernel.Thm raise {
    let th = x5
    let concl_p = replace(@kernel.concl(th))
    @kernel.eq_mp(@kernel.refl(concl_p), th)
  }
  let get : (Unit) -> @list.List[@kernel.Term] raise = fn(x6 : Unit) -> @list.List[@kernel.Term] raise {
    let _ = x6
    @lib.hashtbl_fold(fn(x7 : @kernel.Term, x8 : @kernel.Term, x9 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
      let t_2 = x8
      let ts = x9
      ts.prepend(t_2)
    }, cache, @list.List([]))
  }
  let reset : (Unit) -> Unit raise = fn(x10 : Unit) -> Unit raise {
    let _ = x10
    @lib.hashtbl_clear(cache)
  }
  let enable : (Bool) -> Unit raise = fn(x11 : Bool) -> Unit raise {
    let flag = x11
    {
      enabled.val = flag
      ()
    }
  }
  let (standardize, standardize_tm, standardize_list, standardize_reset, standardize_enable) = (fn(x12 : @kernel.Thm) -> @kernel.Thm raise {
    let th_1 = x12
    if enabled.val {
      st(th_1)
    } else {
      th_1
    }
  }, fn(x13 : @kernel.Term) -> @kernel.Term raise {
    let tm_1 = x13
    if enabled.val {
      replace(tm_1)
    } else {
      tm_1
    }
  }, get, reset, enable)
  standardize_c.set(standardize)
  standardize_tm_c.set(standardize_tm)
  standardize_list_c.set(standardize_list)
  standardize_reset_c.set(standardize_reset)
  standardize_enable_c.set(standardize_enable)
}

///|
/// s_var_bool
fn step_2() -> Unit raise {
  s_var_bool_c.set(standardize_tm(@term_syntax.parse_term("(s : Bool)")))
}

///|
let s_var_bool_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("s_var_bool")

///|
/// `Misc_vars.s_var_bool`
pub fn s_var_bool() -> @kernel.Term {
  s_var_bool_c.get()
}

///|
/// s1_var_bool
fn step_3() -> Unit raise {
  s1_var_bool_c.set(standardize_tm(@term_syntax.parse_term("(s1 : Bool)")))
}

///|
let s1_var_bool_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("s1_var_bool")

///|
/// `Misc_vars.s1_var_bool`
pub fn s1_var_bool() -> @kernel.Term {
  s1_var_bool_c.get()
}

///|
/// s2_var_bool
fn step_4() -> Unit raise {
  s2_var_bool_c.set(standardize_tm(@term_syntax.parse_term("(s2 : Bool)")))
}

///|
let s2_var_bool_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("s2_var_bool")

///|
/// `Misc_vars.s2_var_bool`
pub fn s2_var_bool() -> @kernel.Term {
  s2_var_bool_c.get()
}

///|
/// n_var_num
fn step_5() -> Unit raise {
  n_var_num_c.set(standardize_tm(@term_syntax.parse_term("(n : Num)")))
}

///|
let n_var_num_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("n_var_num")

///|
/// `Misc_vars.n_var_num`
pub fn n_var_num() -> @kernel.Term {
  n_var_num_c.get()
}

///|
/// m_var_num
fn step_6() -> Unit raise {
  m_var_num_c.set(standardize_tm(@term_syntax.parse_term("(m : Num)")))
}

///|
let m_var_num_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("m_var_num")

///|
/// `Misc_vars.m_var_num`
pub fn m_var_num() -> @kernel.Term {
  m_var_num_c.get()
}

///|
/// t_var_num
fn step_7() -> Unit raise {
  t_var_num_c.set(standardize_tm(@term_syntax.parse_term("(t : Num)")))
}

///|
let t_var_num_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("t_var_num")

///|
/// `Misc_vars.t_var_num`
pub fn t_var_num() -> @kernel.Term {
  t_var_num_c.get()
}

///|
/// p_var_num
fn step_8() -> Unit raise {
  p_var_num_c.set(standardize_tm(@term_syntax.parse_term("(p : Num)")))
}

///|
let p_var_num_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("p_var_num")

///|
/// `Misc_vars.p_var_num`
pub fn p_var_num() -> @kernel.Term {
  p_var_num_c.get()
}

///|
/// q_var_num
fn step_9() -> Unit raise {
  q_var_num_c.set(standardize_tm(@term_syntax.parse_term("(q : Num)")))
}

///|
let q_var_num_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("q_var_num")

///|
/// `Misc_vars.q_var_num`
pub fn q_var_num() -> @kernel.Term {
  q_var_num_c.get()
}

///|
/// k_var_num
fn step_10() -> Unit raise {
  k_var_num_c.set(standardize_tm(@term_syntax.parse_term("(k : Num)")))
}

///|
let k_var_num_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("k_var_num")

///|
/// `Misc_vars.k_var_num`
pub fn k_var_num() -> @kernel.Term {
  k_var_num_c.get()
}

///|
/// e_var_num
fn step_11() -> Unit raise {
  e_var_num_c.set(standardize_tm(@term_syntax.parse_term("(e : Num)")))
}

///|
let e_var_num_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("e_var_num")

///|
/// `Misc_vars.e_var_num`
pub fn e_var_num() -> @kernel.Term {
  e_var_num_c.get()
}

///|
/// e1_var_num
fn step_12() -> Unit raise {
  e1_var_num_c.set(standardize_tm(@term_syntax.parse_term("(e1 : Num)")))
}

///|
let e1_var_num_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("e1_var_num")

///|
/// `Misc_vars.e1_var_num`
pub fn e1_var_num() -> @kernel.Term {
  e1_var_num_c.get()
}

///|
/// e2_var_num
fn step_13() -> Unit raise {
  e2_var_num_c.set(standardize_tm(@term_syntax.parse_term("(e2 : Num)")))
}

///|
let e2_var_num_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("e2_var_num")

///|
/// `Misc_vars.e2_var_num`
pub fn e2_var_num() -> @kernel.Term {
  e2_var_num_c.get()
}

///|
/// r_var_num
fn step_14() -> Unit raise {
  r_var_num_c.set(standardize_tm(@term_syntax.parse_term("(r : Num)")))
}

///|
let r_var_num_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("r_var_num")

///|
/// `Misc_vars.r_var_num`
pub fn r_var_num() -> @kernel.Term {
  r_var_num_c.get()
}

///|
/// r1_var_num
fn step_15() -> Unit raise {
  r1_var_num_c.set(standardize_tm(@term_syntax.parse_term("(r1 : Num)")))
}

///|
let r1_var_num_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("r1_var_num")

///|
/// `Misc_vars.r1_var_num`
pub fn r1_var_num() -> @kernel.Term {
  r1_var_num_c.get()
}

///|
/// r2_var_num
fn step_16() -> Unit raise {
  r2_var_num_c.set(standardize_tm(@term_syntax.parse_term("(r2 : Num)")))
}

///|
let r2_var_num_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("r2_var_num")

///|
/// `Misc_vars.r2_var_num`
pub fn r2_var_num() -> @kernel.Term {
  r2_var_num_c.get()
}

///|
/// n1_var_num
fn step_17() -> Unit raise {
  n1_var_num_c.set(standardize_tm(@term_syntax.parse_term("(n1 : Num)")))
}

///|
let n1_var_num_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("n1_var_num")

///|
/// `Misc_vars.n1_var_num`
pub fn n1_var_num() -> @kernel.Term {
  n1_var_num_c.get()
}

///|
/// n2_var_num
fn step_18() -> Unit raise {
  n2_var_num_c.set(standardize_tm(@term_syntax.parse_term("(n2 : Num)")))
}

///|
let n2_var_num_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("n2_var_num")

///|
/// `Misc_vars.n2_var_num`
pub fn n2_var_num() -> @kernel.Term {
  n2_var_num_c.get()
}

///|
/// m1_var_num
fn step_19() -> Unit raise {
  m1_var_num_c.set(standardize_tm(@term_syntax.parse_term("(m1 : Num)")))
}

///|
let m1_var_num_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("m1_var_num")

///|
/// `Misc_vars.m1_var_num`
pub fn m1_var_num() -> @kernel.Term {
  m1_var_num_c.get()
}

///|
/// m2_var_num
fn step_20() -> Unit raise {
  m2_var_num_c.set(standardize_tm(@term_syntax.parse_term("(m2 : Num)")))
}

///|
let m2_var_num_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("m2_var_num")

///|
/// `Misc_vars.m2_var_num`
pub fn m2_var_num() -> @kernel.Term {
  m2_var_num_c.get()
}

///|
/// x_var_num
fn step_21() -> Unit raise {
  x_var_num_c.set(standardize_tm(@term_syntax.parse_term("(x : Num)")))
}

///|
let x_var_num_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("x_var_num")

///|
/// `Misc_vars.x_var_num`
pub fn x_var_num() -> @kernel.Term {
  x_var_num_c.get()
}

///|
/// y_var_num
fn step_22() -> Unit raise {
  y_var_num_c.set(standardize_tm(@term_syntax.parse_term("(y : Num)")))
}

///|
let y_var_num_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("y_var_num")

///|
/// `Misc_vars.y_var_num`
pub fn y_var_num() -> @kernel.Term {
  y_var_num_c.get()
}

///|
/// i_var_num
fn step_23() -> Unit raise {
  i_var_num_c.set(standardize_tm(@term_syntax.parse_term("(i : Num)")))
}

///|
let i_var_num_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("i_var_num")

///|
/// `Misc_vars.i_var_num`
pub fn i_var_num() -> @kernel.Term {
  i_var_num_c.get()
}

///|
/// j_var_num
fn step_24() -> Unit raise {
  j_var_num_c.set(standardize_tm(@term_syntax.parse_term("(j : Num)")))
}

///|
let j_var_num_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("j_var_num")

///|
/// `Misc_vars.j_var_num`
pub fn j_var_num() -> @kernel.Term {
  j_var_num_c.get()
}

///|
/// x_var_real
fn step_25() -> Unit raise {
  x_var_real_c.set(standardize_tm(@term_syntax.parse_term("(x : Real)")))
}

///|
let x_var_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("x_var_real")

///|
/// `Misc_vars.x_var_real`
pub fn x_var_real() -> @kernel.Term {
  x_var_real_c.get()
}

///|
/// y_var_real
fn step_26() -> Unit raise {
  y_var_real_c.set(standardize_tm(@term_syntax.parse_term("(y : Real)")))
}

///|
let y_var_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("y_var_real")

///|
/// `Misc_vars.y_var_real`
pub fn y_var_real() -> @kernel.Term {
  y_var_real_c.get()
}

///|
/// z_var_real
fn step_27() -> Unit raise {
  z_var_real_c.set(standardize_tm(@term_syntax.parse_term("(z : Real)")))
}

///|
let z_var_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("z_var_real")

///|
/// `Misc_vars.z_var_real`
pub fn z_var_real() -> @kernel.Term {
  z_var_real_c.get()
}

///|
/// w_var_real
fn step_28() -> Unit raise {
  w_var_real_c.set(standardize_tm(@term_syntax.parse_term("(w : Real)")))
}

///|
let w_var_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("w_var_real")

///|
/// `Misc_vars.w_var_real`
pub fn w_var_real() -> @kernel.Term {
  w_var_real_c.get()
}

///|
/// a_var_real
fn step_29() -> Unit raise {
  a_var_real_c.set(standardize_tm(@term_syntax.parse_term("(a : Real)")))
}

///|
let a_var_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("a_var_real")

///|
/// `Misc_vars.a_var_real`
pub fn a_var_real() -> @kernel.Term {
  a_var_real_c.get()
}

///|
/// b_var_real
fn step_30() -> Unit raise {
  b_var_real_c.set(standardize_tm(@term_syntax.parse_term("(b : Real)")))
}

///|
let b_var_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("b_var_real")

///|
/// `Misc_vars.b_var_real`
pub fn b_var_real() -> @kernel.Term {
  b_var_real_c.get()
}

///|
/// a1_var_real
fn step_31() -> Unit raise {
  a1_var_real_c.set(standardize_tm(@term_syntax.parse_term("(a1 : Real)")))
}

///|
let a1_var_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("a1_var_real")

///|
/// `Misc_vars.a1_var_real`
pub fn a1_var_real() -> @kernel.Term {
  a1_var_real_c.get()
}

///|
/// a2_var_real
fn step_32() -> Unit raise {
  a2_var_real_c.set(standardize_tm(@term_syntax.parse_term("(a2 : Real)")))
}

///|
let a2_var_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("a2_var_real")

///|
/// `Misc_vars.a2_var_real`
pub fn a2_var_real() -> @kernel.Term {
  a2_var_real_c.get()
}

///|
/// b1_var_real
fn step_33() -> Unit raise {
  b1_var_real_c.set(standardize_tm(@term_syntax.parse_term("(b1 : Real)")))
}

///|
let b1_var_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("b1_var_real")

///|
/// `Misc_vars.b1_var_real`
pub fn b1_var_real() -> @kernel.Term {
  b1_var_real_c.get()
}

///|
/// b2_var_real
fn step_34() -> Unit raise {
  b2_var_real_c.set(standardize_tm(@term_syntax.parse_term("(b2 : Real)")))
}

///|
let b2_var_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("b2_var_real")

///|
/// `Misc_vars.b2_var_real`
pub fn b2_var_real() -> @kernel.Term {
  b2_var_real_c.get()
}

///|
/// c_var_real
fn step_35() -> Unit raise {
  c_var_real_c.set(standardize_tm(@term_syntax.parse_term("(c : Real)")))
}

///|
let c_var_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("c_var_real")

///|
/// `Misc_vars.c_var_real`
pub fn c_var_real() -> @kernel.Term {
  c_var_real_c.get()
}

///|
/// d_var_real
fn step_36() -> Unit raise {
  d_var_real_c.set(standardize_tm(@term_syntax.parse_term("(d : Real)")))
}

///|
let d_var_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("d_var_real")

///|
/// `Misc_vars.d_var_real`
pub fn d_var_real() -> @kernel.Term {
  d_var_real_c.get()
}

///|
/// h_var_real
fn step_37() -> Unit raise {
  h_var_real_c.set(standardize_tm(@term_syntax.parse_term("(h : Real)")))
}

///|
let h_var_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("h_var_real")

///|
/// `Misc_vars.h_var_real`
pub fn h_var_real() -> @kernel.Term {
  h_var_real_c.get()
}

///|
/// m_var_real
fn step_38() -> Unit raise {
  m_var_real_c.set(standardize_tm(@term_syntax.parse_term("(m : Real)")))
}

///|
let m_var_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("m_var_real")

///|
/// `Misc_vars.m_var_real`
pub fn m_var_real() -> @kernel.Term {
  m_var_real_c.get()
}

///|
/// n_var_real
fn step_39() -> Unit raise {
  n_var_real_c.set(standardize_tm(@term_syntax.parse_term("(n : Real)")))
}

///|
let n_var_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("n_var_real")

///|
/// `Misc_vars.n_var_real`
pub fn n_var_real() -> @kernel.Term {
  n_var_real_c.get()
}

///|
/// r_var_real
fn step_40() -> Unit raise {
  r_var_real_c.set(standardize_tm(@term_syntax.parse_term("(r : Real)")))
}

///|
let r_var_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("r_var_real")

///|
/// `Misc_vars.r_var_real`
pub fn r_var_real() -> @kernel.Term {
  r_var_real_c.get()
}

///|
/// x1_var_real
fn step_41() -> Unit raise {
  x1_var_real_c.set(standardize_tm(@term_syntax.parse_term("(x1 : Real)")))
}

///|
let x1_var_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("x1_var_real")

///|
/// `Misc_vars.x1_var_real`
pub fn x1_var_real() -> @kernel.Term {
  x1_var_real_c.get()
}

///|
/// x2_var_real
fn step_42() -> Unit raise {
  x2_var_real_c.set(standardize_tm(@term_syntax.parse_term("(x2 : Real)")))
}

///|
let x2_var_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("x2_var_real")

///|
/// `Misc_vars.x2_var_real`
pub fn x2_var_real() -> @kernel.Term {
  x2_var_real_c.get()
}

///|
/// y1_var_real
fn step_43() -> Unit raise {
  y1_var_real_c.set(standardize_tm(@term_syntax.parse_term("(y1 : Real)")))
}

///|
let y1_var_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("y1_var_real")

///|
/// `Misc_vars.y1_var_real`
pub fn y1_var_real() -> @kernel.Term {
  y1_var_real_c.get()
}

///|
/// y2_var_real
fn step_44() -> Unit raise {
  y2_var_real_c.set(standardize_tm(@term_syntax.parse_term("(y2 : Real)")))
}

///|
let y2_var_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("y2_var_real")

///|
/// `Misc_vars.y2_var_real`
pub fn y2_var_real() -> @kernel.Term {
  y2_var_real_c.get()
}

///|
/// f1_var_real
fn step_45() -> Unit raise {
  f1_var_real_c.set(standardize_tm(@term_syntax.parse_term("(f1 : Real)")))
}

///|
let f1_var_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("f1_var_real")

///|
/// `Misc_vars.f1_var_real`
pub fn f1_var_real() -> @kernel.Term {
  f1_var_real_c.get()
}

///|
/// f2_var_real
fn step_46() -> Unit raise {
  f2_var_real_c.set(standardize_tm(@term_syntax.parse_term("(f2 : Real)")))
}

///|
let f2_var_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("f2_var_real")

///|
/// `Misc_vars.f2_var_real`
pub fn f2_var_real() -> @kernel.Term {
  f2_var_real_c.get()
}

///|
/// f_var_fun
fn step_47() -> Unit raise {
  f_var_fun_c.set(standardize_tm(@term_syntax.parse_term("(f : (Real) -> Real)")))
}

///|
let f_var_fun_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("f_var_fun")

///|
/// `Misc_vars.f_var_fun`
pub fn f_var_fun() -> @kernel.Term {
  f_var_fun_c.get()
}

///|
/// g_var_fun
fn step_48() -> Unit raise {
  g_var_fun_c.set(standardize_tm(@term_syntax.parse_term("(g : (Real) -> Real)")))
}

///|
let g_var_fun_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("g_var_fun")

///|
/// `Misc_vars.g_var_fun`
pub fn g_var_fun() -> @kernel.Term {
  g_var_fun_c.get()
}

///|
/// f1_var_fun
fn step_49() -> Unit raise {
  f1_var_fun_c.set(standardize_tm(@term_syntax.parse_term("(f1 : (Real) -> Real)")))
}

///|
let f1_var_fun_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("f1_var_fun")

///|
/// `Misc_vars.f1_var_fun`
pub fn f1_var_fun() -> @kernel.Term {
  f1_var_fun_c.get()
}

///|
/// f2_var_fun
fn step_50() -> Unit raise {
  f2_var_fun_c.set(standardize_tm(@term_syntax.parse_term("(f2 : (Real) -> Real)")))
}

///|
let f2_var_fun_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("f2_var_fun")

///|
/// `Misc_vars.f2_var_fun`
pub fn f2_var_fun() -> @kernel.Term {
  f2_var_fun_c.get()
}

///|
/// int_var
fn step_51() -> Unit raise {
  int_var_c.set(standardize_tm(@term_syntax.parse_term("(int : (Real, Real))")))
}

///|
let int_var_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("int_var")

///|
/// `Misc_vars.int_var`
pub fn int_var() -> @kernel.Term {
  int_var_c.get()
}

///|
/// f_bounds_var
fn step_52() -> Unit raise {
  f_bounds_var_c.set(standardize_tm(@term_syntax.parse_term("(f_bounds : (Real, Real))")))
}

///|
let f_bounds_var_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("f_bounds_var")

///|
/// `Misc_vars.f_bounds_var`
pub fn f_bounds_var() -> @kernel.Term {
  f_bounds_var_c.get()
}

///|
/// df_bounds_var
fn step_53() -> Unit raise {
  df_bounds_var_c.set(standardize_tm(@term_syntax.parse_term("(df_bounds : (Real, Real))")))
}

///|
let df_bounds_var_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("df_bounds_var")

///|
/// `Misc_vars.df_bounds_var`
pub fn df_bounds_var() -> @kernel.Term {
  df_bounds_var_c.get()
}

///|
/// dd_bounds_var
fn step_54() -> Unit raise {
  dd_bounds_var_c.set(standardize_tm(@term_syntax.parse_term("(dd_bounds : (Real, Real))")))
}

///|
let dd_bounds_var_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("dd_bounds_var")

///|
/// `Misc_vars.dd_bounds_var`
pub fn dd_bounds_var() -> @kernel.Term {
  dd_bounds_var_c.get()
}

///|
/// x_lo_var
fn step_55() -> Unit raise {
  x_lo_var_c.set(standardize_tm(@term_syntax.parse_term("(x_lo : Real)")))
}

///|
let x_lo_var_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("x_lo_var")

///|
/// `Misc_vars.x_lo_var`
pub fn x_lo_var() -> @kernel.Term {
  x_lo_var_c.get()
}

///|
/// x_hi_var
fn step_56() -> Unit raise {
  x_hi_var_c.set(standardize_tm(@term_syntax.parse_term("(x_hi : Real)")))
}

///|
let x_hi_var_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("x_hi_var")

///|
/// `Misc_vars.x_hi_var`
pub fn x_hi_var() -> @kernel.Term {
  x_hi_var_c.get()
}

///|
/// low_var_real
fn step_57() -> Unit raise {
  low_var_real_c.set(standardize_tm(@term_syntax.parse_term("(low : Real)")))
}

///|
let low_var_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("low_var_real")

///|
/// `Misc_vars.low_var_real`
pub fn low_var_real() -> @kernel.Term {
  low_var_real_c.get()
}

///|
/// high_var_real
fn step_58() -> Unit raise {
  high_var_real_c.set(standardize_tm(@term_syntax.parse_term("(high : Real)")))
}

///|
let high_var_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("high_var_real")

///|
/// `Misc_vars.high_var_real`
pub fn high_var_real() -> @kernel.Term {
  high_var_real_c.get()
}

///|
/// lo_var_real
fn step_59() -> Unit raise {
  lo_var_real_c.set(standardize_tm(@term_syntax.parse_term("(lo : Real)")))
}

///|
let lo_var_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("lo_var_real")

///|
/// `Misc_vars.lo_var_real`
pub fn lo_var_real() -> @kernel.Term {
  lo_var_real_c.get()
}

///|
/// hi_var_real
fn step_60() -> Unit raise {
  hi_var_real_c.set(standardize_tm(@term_syntax.parse_term("(hi : Real)")))
}

///|
let hi_var_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("hi_var_real")

///|
/// `Misc_vars.hi_var_real`
pub fn hi_var_real() -> @kernel.Term {
  hi_var_real_c.get()
}

///|
/// dd_var_real
fn step_61() -> Unit raise {
  dd_var_real_c.set(standardize_tm(@term_syntax.parse_term("(dd : Real)")))
}

///|
let dd_var_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("dd_var_real")

///|
/// `Misc_vars.dd_var_real`
pub fn dd_var_real() -> @kernel.Term {
  dd_var_real_c.get()
}

///|
/// df_lo_var
fn step_62() -> Unit raise {
  df_lo_var_c.set(standardize_tm(@term_syntax.parse_term("(df_lo : Real)")))
}

///|
let df_lo_var_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("df_lo_var")

///|
/// `Misc_vars.df_lo_var`
pub fn df_lo_var() -> @kernel.Term {
  df_lo_var_c.get()
}

///|
/// df_hi_var
fn step_63() -> Unit raise {
  df_hi_var_c.set(standardize_tm(@term_syntax.parse_term("(df_hi : Real)")))
}

///|
let df_hi_var_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("df_hi_var")

///|
/// `Misc_vars.df_hi_var`
pub fn df_hi_var() -> @kernel.Term {
  df_hi_var_c.get()
}

///|
/// df_var_real
fn step_64() -> Unit raise {
  df_var_real_c.set(standardize_tm(@term_syntax.parse_term("(df : Real)")))
}

///|
let df_var_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("df_var_real")

///|
/// `Misc_vars.df_var_real`
pub fn df_var_real() -> @kernel.Term {
  df_var_real_c.get()
}

///|
/// f_lo_var
fn step_65() -> Unit raise {
  f_lo_var_c.set(standardize_tm(@term_syntax.parse_term("(f_lo : Real)")))
}

///|
let f_lo_var_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("f_lo_var")

///|
/// `Misc_vars.f_lo_var`
pub fn f_lo_var() -> @kernel.Term {
  f_lo_var_c.get()
}

///|
/// f_hi_var
fn step_66() -> Unit raise {
  f_hi_var_c.set(standardize_tm(@term_syntax.parse_term("(f_hi : Real)")))
}

///|
let f_hi_var_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("f_hi_var")

///|
/// `Misc_vars.f_hi_var`
pub fn f_hi_var() -> @kernel.Term {
  f_hi_var_c.get()
}

///|
/// w1_var_real
fn step_67() -> Unit raise {
  w1_var_real_c.set(standardize_tm(@term_syntax.parse_term("(w1 : Real)")))
}

///|
let w1_var_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("w1_var_real")

///|
/// `Misc_vars.w1_var_real`
pub fn w1_var_real() -> @kernel.Term {
  w1_var_real_c.get()
}

///|
/// w2_var_real
fn step_68() -> Unit raise {
  w2_var_real_c.set(standardize_tm(@term_syntax.parse_term("(w2 : Real)")))
}

///|
let w2_var_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("w2_var_real")

///|
/// `Misc_vars.w2_var_real`
pub fn w2_var_real() -> @kernel.Term {
  w2_var_real_c.get()
}

///|
/// t_var_real
fn step_69() -> Unit raise {
  t_var_real_c.set(standardize_tm(@term_syntax.parse_term("(t : Real)")))
}

///|
let t_var_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("t_var_real")

///|
/// `Misc_vars.t_var_real`
pub fn t_var_real() -> @kernel.Term {
  t_var_real_c.get()
}

///|
/// g_bounds_var
fn step_70() -> Unit raise {
  g_bounds_var_c.set(standardize_tm(@term_syntax.parse_term("(g_bounds : (Real, Real))")))
}

///|
let g_bounds_var_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("g_bounds_var")

///|
/// `Misc_vars.g_bounds_var`
pub fn g_bounds_var() -> @kernel.Term {
  g_bounds_var_c.get()
}

///|
/// dg_bounds_var
fn step_71() -> Unit raise {
  dg_bounds_var_c.set(standardize_tm(@term_syntax.parse_term("(dg_bounds : (Real, Real))")))
}

///|
let dg_bounds_var_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("dg_bounds_var")

///|
/// `Misc_vars.dg_bounds_var`
pub fn dg_bounds_var() -> @kernel.Term {
  dg_bounds_var_c.get()
}

///|
/// bounds_var
fn step_72() -> Unit raise {
  bounds_var_c.set(standardize_tm(@term_syntax.parse_term("(bounds : (Real, Real))")))
}

///|
let bounds_var_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("bounds_var")

///|
/// `Misc_vars.bounds_var`
pub fn bounds_var() -> @kernel.Term {
  bounds_var_c.get()
}

///|
/// d_bounds_var
fn step_73() -> Unit raise {
  d_bounds_var_c.set(standardize_tm(@term_syntax.parse_term("(d_bounds : (Real, Real))")))
}

///|
let d_bounds_var_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("d_bounds_var")

///|
/// `Misc_vars.d_bounds_var`
pub fn d_bounds_var() -> @kernel.Term {
  d_bounds_var_c.get()
}

///|
/// x0_var_real
fn step_74() -> Unit raise {
  x0_var_real_c.set(standardize_tm(@term_syntax.parse_term("(x0 : Real)")))
}

///|
let x0_var_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("x0_var_real")

///|
/// `Misc_vars.x0_var_real`
pub fn x0_var_real() -> @kernel.Term {
  x0_var_real_c.get()
}

///|
/// z0_var_real
fn step_75() -> Unit raise {
  z0_var_real_c.set(standardize_tm(@term_syntax.parse_term("(z0 : Real)")))
}

///|
let z0_var_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("z0_var_real")

///|
/// `Misc_vars.z0_var_real`
pub fn z0_var_real() -> @kernel.Term {
  z0_var_real_c.get()
}

///|
/// w0_var_real
fn step_76() -> Unit raise {
  w0_var_real_c.set(standardize_tm(@term_syntax.parse_term("(w0 : Real)")))
}

///|
let w0_var_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("w0_var_real")

///|
/// `Misc_vars.w0_var_real`
pub fn w0_var_real() -> @kernel.Term {
  w0_var_real_c.get()
}

///|
/// error_var
fn step_77() -> Unit raise {
  error_var_c.set(standardize_tm(@term_syntax.parse_term("(error : Real)")))
}

///|
let error_var_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("error_var")

///|
/// `Misc_vars.error_var`
pub fn error_var() -> @kernel.Term {
  error_var_c.get()
}

///|
/// d_bounds_list_var
fn step_78() -> Unit raise {
  d_bounds_list_var_c.set(standardize_tm(@term_syntax.parse_term("(d_bounds_list : List[(Real, Real)])")))
}

///|
let d_bounds_list_var_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("d_bounds_list_var")

///|
/// `Misc_vars.d_bounds_list_var`
pub fn d_bounds_list_var() -> @kernel.Term {
  d_bounds_list_var_c.get()
}

///|
/// dd_bounds_list_var
fn step_79() -> Unit raise {
  dd_bounds_list_var_c.set(standardize_tm(@term_syntax.parse_term("(dd_bounds_list : List[List[(Real, Real)]])")))
}

///|
let dd_bounds_list_var_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("dd_bounds_list_var")

///|
/// `Misc_vars.dd_bounds_list_var`
pub fn dd_bounds_list_var() -> @kernel.Term {
  dd_bounds_list_var_c.get()
}

///|
/// df_bounds_list_var
fn step_80() -> Unit raise {
  df_bounds_list_var_c.set(standardize_tm(@term_syntax.parse_term("(df_bounds_list : List[(Real, Real)])")))
}

///|
let df_bounds_list_var_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("df_bounds_list_var")

///|
/// `Misc_vars.df_bounds_list_var`
pub fn df_bounds_list_var() -> @kernel.Term {
  df_bounds_list_var_c.get()
}

///|
/// dd_list_var
fn step_81() -> Unit raise {
  dd_list_var_c.set(standardize_tm(@term_syntax.parse_term("(dd_list : List[(Real, Real)])")))
}

///|
let dd_list_var_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("dd_list_var")

///|
/// `Misc_vars.dd_list_var`
pub fn dd_list_var() -> @kernel.Term {
  dd_list_var_c.get()
}

///|
/// t_var_real_list
fn step_82() -> Unit raise {
  t_var_real_list_c.set(standardize_tm(@term_syntax.parse_term("(t : List[Real])")))
}

///|
let t_var_real_list_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("t_var_real_list")

///|
/// `Misc_vars.t_var_real_list`
pub fn t_var_real_list() -> @kernel.Term {
  t_var_real_list_c.get()
}

///|
/// x_var_real_list
fn step_83() -> Unit raise {
  x_var_real_list_c.set(standardize_tm(@term_syntax.parse_term("(x : List[Real])")))
}

///|
let x_var_real_list_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("x_var_real_list")

///|
/// `Misc_vars.x_var_real_list`
pub fn x_var_real_list() -> @kernel.Term {
  x_var_real_list_c.get()
}

///|
/// y_var_real_list
fn step_84() -> Unit raise {
  y_var_real_list_c.set(standardize_tm(@term_syntax.parse_term("(y : List[Real])")))
}

///|
let y_var_real_list_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("y_var_real_list")

///|
/// `Misc_vars.y_var_real_list`
pub fn y_var_real_list() -> @kernel.Term {
  y_var_real_list_c.get()
}

///|
/// z_var_real_list
fn step_85() -> Unit raise {
  z_var_real_list_c.set(standardize_tm(@term_syntax.parse_term("(z : List[Real])")))
}

///|
let z_var_real_list_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("z_var_real_list")

///|
/// `Misc_vars.z_var_real_list`
pub fn z_var_real_list() -> @kernel.Term {
  z_var_real_list_c.get()
}

///|
/// w_var_real_list
fn step_86() -> Unit raise {
  w_var_real_list_c.set(standardize_tm(@term_syntax.parse_term("(w : List[Real])")))
}

///|
let w_var_real_list_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("w_var_real_list")

///|
/// `Misc_vars.w_var_real_list`
pub fn w_var_real_list() -> @kernel.Term {
  w_var_real_list_c.get()
}

///|
/// yw_var
fn step_87() -> Unit raise {
  yw_var_c.set(standardize_tm(@term_syntax.parse_term("(yw : List[(Real, Real)])")))
}

///|
let yw_var_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("yw_var")

///|
/// `Misc_vars.yw_var`
pub fn yw_var() -> @kernel.Term {
  yw_var_c.get()
}

///|
/// xz_var
fn step_88() -> Unit raise {
  xz_var_c.set(standardize_tm(@term_syntax.parse_term("(xz : List[(Real, Real)])")))
}

///|
let xz_var_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("xz_var")

///|
/// `Misc_vars.xz_var`
pub fn xz_var() -> @kernel.Term {
  xz_var_c.get()
}

///|
/// xz_pair_var
fn step_89() -> Unit raise {
  xz_pair_var_c.set(standardize_tm(@term_syntax.parse_term("(xz : (Real, Real))")))
}

///|
let xz_pair_var_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("xz_pair_var")

///|
/// `Misc_vars.xz_pair_var`
pub fn xz_pair_var() -> @kernel.Term {
  xz_pair_var_c.get()
}

///|
/// yw_pair_var
fn step_90() -> Unit raise {
  yw_pair_var_c.set(standardize_tm(@term_syntax.parse_term("(yw : (Real, Real))")))
}

///|
let yw_pair_var_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("yw_pair_var")

///|
/// `Misc_vars.yw_pair_var`
pub fn yw_pair_var() -> @kernel.Term {
  yw_pair_var_c.get()
}

///|
/// list_var_real_pair
fn step_91() -> Unit raise {
  list_var_real_pair_c.set(standardize_tm(@term_syntax.parse_term("(list : List[(Real, Real)])")))
}

///|
let list_var_real_pair_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("list_var_real_pair")

///|
/// `Misc_vars.list_var_real_pair`
pub fn list_var_real_pair() -> @kernel.Term {
  list_var_real_pair_c.get()
}

///|
/// t_const
fn step_92() -> Unit raise {
  t_const_c.set(standardize_tm(@term_syntax.parse_term("true")))
}

///|
let t_const_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("t_const")

///|
/// `Misc_vars.t_const`
pub fn t_const() -> @kernel.Term {
  t_const_c.get()
}

///|
/// f_const
fn step_93() -> Unit raise {
  f_const_c.set(standardize_tm(@term_syntax.parse_term("false")))
}

///|
let f_const_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("f_const")

///|
/// `Misc_vars.f_const`
pub fn f_const() -> @kernel.Term {
  f_const_c.get()
}

///|
/// zero_const
fn step_94() -> Unit raise {
  zero_const_c.set(standardize_tm(@term_syntax.parse_term("_0")))
}

///|
let zero_const_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("zero_const")

///|
/// `Misc_vars.zero_const`
pub fn zero_const() -> @kernel.Term {
  zero_const_c.get()
}

///|
/// zero_num
fn step_95() -> Unit raise {
  zero_num_c.set(standardize_tm(@term_syntax.parse_term("0")))
}

///|
let zero_num_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("zero_num")

///|
/// `Misc_vars.zero_num`
pub fn zero_num() -> @kernel.Term {
  zero_num_c.get()
}

///|
/// add_op_num
fn step_96() -> Unit raise {
  add_op_num_c.set(standardize_tm(@term_syntax.parse_term("(op_plus : (Num, Num) -> Num)")))
}

///|
let add_op_num_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("add_op_num")

///|
/// `Misc_vars.add_op_num`
pub fn add_op_num() -> @kernel.Term {
  add_op_num_c.get()
}

///|
/// sub_op_num
fn step_97() -> Unit raise {
  sub_op_num_c.set(standardize_tm(@term_syntax.parse_term("(op_minus : (Num, Num) -> Num)")))
}

///|
let sub_op_num_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("sub_op_num")

///|
/// `Misc_vars.sub_op_num`
pub fn sub_op_num() -> @kernel.Term {
  sub_op_num_c.get()
}

///|
/// mul_op_num
fn step_98() -> Unit raise {
  mul_op_num_c.set(standardize_tm(@term_syntax.parse_term("(op_star : (Num, Num) -> Num)")))
}

///|
let mul_op_num_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("mul_op_num")

///|
/// `Misc_vars.mul_op_num`
pub fn mul_op_num() -> @kernel.Term {
  mul_op_num_c.get()
}

///|
/// eq_op_num
fn step_99() -> Unit raise {
  eq_op_num_c.set(standardize_tm(@term_syntax.parse_term("(op_eq : (Num, Num) -> Bool)")))
}

///|
let eq_op_num_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("eq_op_num")

///|
/// `Misc_vars.eq_op_num`
pub fn eq_op_num() -> @kernel.Term {
  eq_op_num_c.get()
}

///|
/// le_op_num
fn step_100() -> Unit raise {
  le_op_num_c.set(standardize_tm(@term_syntax.parse_term("(op_lt_eq : (Num, Num) -> Bool)")))
}

///|
let le_op_num_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("le_op_num")

///|
/// `Misc_vars.le_op_num`
pub fn le_op_num() -> @kernel.Term {
  le_op_num_c.get()
}

///|
/// lt_op_num
fn step_101() -> Unit raise {
  lt_op_num_c.set(standardize_tm(@term_syntax.parse_term("(op_lt : (Num, Num) -> Bool)")))
}

///|
let lt_op_num_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("lt_op_num")

///|
/// `Misc_vars.lt_op_num`
pub fn lt_op_num() -> @kernel.Term {
  lt_op_num_c.get()
}

///|
/// div_op_num
fn step_102() -> Unit raise {
  div_op_num_c.set(standardize_tm(@term_syntax.parse_term("DIV")))
}

///|
let div_op_num_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("div_op_num")

///|
/// `Misc_vars.div_op_num`
pub fn div_op_num() -> @kernel.Term {
  div_op_num_c.get()
}

///|
/// pre_op_num
fn step_103() -> Unit raise {
  pre_op_num_c.set(standardize_tm(@term_syntax.parse_term("PRE")))
}

///|
let pre_op_num_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("pre_op_num")

///|
/// `Misc_vars.pre_op_num`
pub fn pre_op_num() -> @kernel.Term {
  pre_op_num_c.get()
}

///|
/// suc_op_num
fn step_104() -> Unit raise {
  suc_op_num_c.set(standardize_tm(@term_syntax.parse_term("SUC")))
}

///|
let suc_op_num_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("suc_op_num")

///|
/// `Misc_vars.suc_op_num`
pub fn suc_op_num() -> @kernel.Term {
  suc_op_num_c.get()
}

///|
/// real_empty_list
fn step_105() -> Unit raise {
  real_empty_list_c.set(standardize_tm(@term_syntax.parse_term("(NIL : List[Real])")))
}

///|
let real_empty_list_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("real_empty_list")

///|
/// `Misc_vars.real_empty_list`
pub fn real_empty_list() -> @kernel.Term {
  real_empty_list_c.get()
}

///|
/// add_op_real
fn step_106() -> Unit raise {
  add_op_real_c.set(standardize_tm(@term_syntax.parse_term("real_add")))
}

///|
let add_op_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("add_op_real")

///|
/// `Misc_vars.add_op_real`
pub fn add_op_real() -> @kernel.Term {
  add_op_real_c.get()
}

///|
/// mul_op_real
fn step_107() -> Unit raise {
  mul_op_real_c.set(standardize_tm(@term_syntax.parse_term("real_mul")))
}

///|
let mul_op_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("mul_op_real")

///|
/// `Misc_vars.mul_op_real`
pub fn mul_op_real() -> @kernel.Term {
  mul_op_real_c.get()
}

///|
/// sub_op_real
fn step_108() -> Unit raise {
  sub_op_real_c.set(standardize_tm(@term_syntax.parse_term("real_sub")))
}

///|
let sub_op_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("sub_op_real")

///|
/// `Misc_vars.sub_op_real`
pub fn sub_op_real() -> @kernel.Term {
  sub_op_real_c.get()
}

///|
/// div_op_real
fn step_109() -> Unit raise {
  div_op_real_c.set(standardize_tm(@term_syntax.parse_term("real_div")))
}

///|
let div_op_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("div_op_real")

///|
/// `Misc_vars.div_op_real`
pub fn div_op_real() -> @kernel.Term {
  div_op_real_c.get()
}

///|
/// inv_op_real
fn step_110() -> Unit raise {
  inv_op_real_c.set(standardize_tm(@term_syntax.parse_term("real_inv")))
}

///|
let inv_op_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("inv_op_real")

///|
/// `Misc_vars.inv_op_real`
pub fn inv_op_real() -> @kernel.Term {
  inv_op_real_c.get()
}

///|
/// neg_op_real
fn step_111() -> Unit raise {
  neg_op_real_c.set(standardize_tm(@term_syntax.parse_term("real_neg")))
}

///|
let neg_op_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("neg_op_real")

///|
/// `Misc_vars.neg_op_real`
pub fn neg_op_real() -> @kernel.Term {
  neg_op_real_c.get()
}

///|
/// eq_op_real
fn step_112() -> Unit raise {
  eq_op_real_c.set(standardize_tm(@term_syntax.parse_term("(op_eq : (Real, Real) -> Bool)")))
}

///|
let eq_op_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("eq_op_real")

///|
/// `Misc_vars.eq_op_real`
pub fn eq_op_real() -> @kernel.Term {
  eq_op_real_c.get()
}

///|
/// lt_op_real
fn step_113() -> Unit raise {
  lt_op_real_c.set(standardize_tm(@term_syntax.parse_term("real_lt")))
}

///|
let lt_op_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("lt_op_real")

///|
/// `Misc_vars.lt_op_real`
pub fn lt_op_real() -> @kernel.Term {
  lt_op_real_c.get()
}

///|
/// le_op_real
fn step_114() -> Unit raise {
  le_op_real_c.set(standardize_tm(@term_syntax.parse_term("real_le")))
}

///|
let le_op_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("le_op_real")

///|
/// `Misc_vars.le_op_real`
pub fn le_op_real() -> @kernel.Term {
  le_op_real_c.get()
}

///|
/// ge_op_real
fn step_115() -> Unit raise {
  ge_op_real_c.set(standardize_tm(@term_syntax.parse_term("real_ge")))
}

///|
let ge_op_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("ge_op_real")

///|
/// `Misc_vars.ge_op_real`
pub fn ge_op_real() -> @kernel.Term {
  ge_op_real_c.get()
}

///|
/// amp_op_real
fn step_116() -> Unit raise {
  amp_op_real_c.set(standardize_tm(@term_syntax.parse_term("real_of_num")))
}

///|
let amp_op_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("amp_op_real")

///|
/// `Misc_vars.amp_op_real`
pub fn amp_op_real() -> @kernel.Term {
  amp_op_real_c.get()
}

///|
/// pow_op_real
fn step_117() -> Unit raise {
  pow_op_real_c.set(standardize_tm(@term_syntax.parse_term("real_pow")))
}

///|
let pow_op_real_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("pow_op_real")

///|
/// `Misc_vars.pow_op_real`
pub fn pow_op_real() -> @kernel.Term {
  pow_op_real_c.get()
}

///|
/// real_ty
fn step_118() -> Unit raise {
  real_ty_c.set(@term_syntax.parse_type("Real"))
}

///|
let real_ty_c : @lib.Cell[@kernel.HolType] = @lib.Cell::new("real_ty")

///|
/// `Misc_vars.real_ty`
pub fn real_ty() -> @kernel.HolType {
  real_ty_c.get()
}

///|
/// real_list_ty
fn step_119() -> Unit raise {
  real_list_ty_c.set(@term_syntax.parse_type("List[Real]"))
}

///|
let real_list_ty_c : @lib.Cell[@kernel.HolType] = @lib.Cell::new("real_list_ty")

///|
/// `Misc_vars.real_list_ty`
pub fn real_list_ty() -> @kernel.HolType {
  real_list_ty_c.get()
}

///|
/// real_pair_ty
fn step_120() -> Unit raise {
  real_pair_ty_c.set(@term_syntax.parse_type("(Real, Real)"))
}

///|
let real_pair_ty_c : @lib.Cell[@kernel.HolType] = @lib.Cell::new("real_pair_ty")

///|
/// `Misc_vars.real_pair_ty`
pub fn real_pair_ty() -> @kernel.HolType {
  real_pair_ty_c.get()
}

///|
/// real_pair_list_ty
fn step_121() -> Unit raise {
  real_pair_list_ty_c.set(@term_syntax.parse_type("List[(Real, Real)]"))
}

///|
let real_pair_list_ty_c : @lib.Cell[@kernel.HolType] = @lib.Cell::new("real_pair_list_ty")

///|
/// `Misc_vars.real_pair_list_ty`
pub fn real_pair_list_ty() -> @kernel.HolType {
  real_pair_list_ty_c.get()
}

///|
/// num_type
fn step_122() -> Unit raise {
  num_type_c.set(@term_syntax.parse_type("Num"))
}

///|
let num_type_c : @lib.Cell[@kernel.HolType] = @lib.Cell::new("num_type")

///|
/// `Misc_vars.num_type`
pub fn num_type() -> @kernel.HolType {
  num_type_c.get()
}

///|
/// nty
fn step_123() -> Unit raise {
  nty_c.set(@term_syntax.parse_type("N"))
}

///|
let nty_c : @lib.Cell[@kernel.HolType] = @lib.Cell::new("nty")

///|
/// `Misc_vars.nty`
pub fn nty() -> @kernel.HolType {
  nty_c.get()
}

///|
/// `mk_real_list`
pub fn mk_real_list(x14 : @list.List[@kernel.Term]) -> @kernel.Term raise {
  let tms = x14
  @lists.mk_list(tms, real_ty())
}

///|
/// `mk_names`
pub fn mk_names(x15 : Int64, x16 : String) -> @list.List[String] raise {
  let n = x15
  let prefix = x16
  @lib.map(fn(x17 : Int64) -> String raise {
    let i = x17
    (prefix + Int64::to_string(i))
  }, @lib.range(1L, n))
}

///|
/// `mk_real_vars`
pub fn mk_real_vars(x18 : Int64, x19 : String) -> @list.List[@kernel.Term] raise {
  let n = x18
  let prefix = x19
  @lib.map(fn(x25 : String) -> @kernel.Term raise {
    (fn(x23 : String) -> ((@kernel.HolType) -> @kernel.Term raise) raise {
      fn(x24 : @kernel.HolType) -> @kernel.Term raise {
        ((x21 : String, x22 : @kernel.HolType) => @lib.curry(fn(x20 : (String, @kernel.HolType)) -> @kernel.Term raise {
          @kernel.mk_var(x20.0, x20.1)
        }, x21, x22))(x23, x24)
      }
    })(x25)(real_ty())
  }, mk_names(n, prefix))
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
}
