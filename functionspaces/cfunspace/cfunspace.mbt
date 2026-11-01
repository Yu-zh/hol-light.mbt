// Translated from upstream Functionspaces/cfunspace.ml; edit this file directly.

///|
/// real_of_complex
fn step_1() -> Unit raise {
  real_of_complex_c.set(@pair.new_definition(@term_syntax.parse_term("(real_of_complex : (Cart[Real, Tybit0[Unit]]) -> Real)((c : Cart[Real, Tybit0[Unit]])) == select((r : Real) => c == Cx(r))")))
}

///|
let real_of_complex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("real_of_complex")

///|
/// `real_of_complex`
pub fn real_of_complex() -> @kernel.Thm {
  real_of_complex_c.get()
}

///|
/// REAL_OF_COMPLEX
fn step_2() -> Unit raise {
  let t1 = @meson.meson_tac(@list.List([@complexes.real_v1(), real_of_complex()]))
  real_of_complex_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, Tybit0[Unit]], real(c) → Cx(real_of_complex(c)) == c"), t1))
}

///|
let real_of_complex_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_OF_COMPLEX")

///|
/// `REAL_OF_COMPLEX`
pub fn real_of_complex_v1() -> @kernel.Thm {
  real_of_complex_v1_c.get()
}

///|
/// REAL_OF_COMPLEX_RE
fn step_3() -> Unit raise {
  let t2 = @meson.meson_tac(@list.List([@complexes.re_cx(), real_of_complex_v1()]))
  real_of_complex_re_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, Tybit0[Unit]], real(c) → real_of_complex(c) == Re(c)"), t2))
}

///|
let real_of_complex_re_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_OF_COMPLEX_RE")

///|
/// `REAL_OF_COMPLEX_RE`
pub fn real_of_complex_re() -> @kernel.Thm {
  real_of_complex_re_c.get()
}

///|
/// REAL_OF_COMPLEX_CX
fn step_4() -> Unit raise {
  let t3 = @simp.simp_tac(@list.List([@complexes.real_cx(), real_of_complex_re(), @complexes.re_cx()]))
  real_of_complex_cx_c.set(@tactics.prove(@term_syntax.parse_term("∀ r : Real, real_of_complex(Cx(r)) == r"), t3))
}

///|
let real_of_complex_cx_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_OF_COMPLEX_CX")

///|
/// `REAL_OF_COMPLEX_CX`
pub fn real_of_complex_cx() -> @kernel.Thm {
  real_of_complex_cx_c.get()
}

///|
/// REAL_OF_COMPLEX_NORM
fn step_5() -> Unit raise {
  let t4 = @impconv.imp_rewrite_tac(@list.List([@complexes.real_norm(), real_of_complex_re()]))
  real_of_complex_norm_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, Tybit0[Unit]], real(c) → norm(c) == abs(real_of_complex(c))"), t4))
}

///|
let real_of_complex_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_OF_COMPLEX_NORM")

///|
/// `REAL_OF_COMPLEX_NORM`
pub fn real_of_complex_norm() -> @kernel.Thm {
  real_of_complex_norm_c.get()
}

///|
/// REAL_OF_COMPLEX_ADD
fn step_6() -> Unit raise {
  let t5 = @meson.meson_tac(@list.List([@complexes.real_add(), real_of_complex_re(), @complexes.re_add()]))
  real_of_complex_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Tybit0[Unit]], ∀ y : Cart[Real, Tybit0[Unit]], real(x) && real(y) → real_of_complex(x + y) == real_of_complex(x) + real_of_complex(y)"), t5))
}

///|
let real_of_complex_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_OF_COMPLEX_ADD")

///|
/// `REAL_OF_COMPLEX_ADD`
pub fn real_of_complex_add() -> @kernel.Thm {
  real_of_complex_add_c.get()
}

///|
/// REAL_OF_COMPLEX_SUB
fn step_7() -> Unit raise {
  let t6 = @meson.meson_tac(@list.List([@complexes.real_sub(), real_of_complex_re(), @complexes.re_sub()]))
  real_of_complex_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Tybit0[Unit]], ∀ y : Cart[Real, Tybit0[Unit]], real(x) && real(y) → real_of_complex(x - y) == real_of_complex(x) - real_of_complex(y)"), t6))
}

///|
let real_of_complex_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_OF_COMPLEX_SUB")

///|
/// `REAL_OF_COMPLEX_SUB`
pub fn real_of_complex_sub() -> @kernel.Thm {
  real_of_complex_sub_c.get()
}

///|
/// REAL_OF_COMPLEX_ZERO
fn step_8() -> Unit raise {
  let t7 = @meson.meson_tac(@list.List([real_of_complex_re(), @complexes.real(), @complexes.simple_complex_arith(@term_syntax.parse_term("Im((x : Cart[Real, Tybit0[Unit]])) == real_of_num(0) → (Re(x) == real_of_num(0)) == (x == Cx(real_of_num(0)))"))]))
  real_of_complex_zero_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Tybit0[Unit]], ∀ y : _, real(x) → (real_of_complex(x) == real_of_num(0)) == (x == Cx(real_of_num(0)))"), t7))
}

///|
let real_of_complex_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_OF_COMPLEX_ZERO")

///|
/// `REAL_OF_COMPLEX_ZERO`
pub fn real_of_complex_zero() -> @kernel.Thm {
  real_of_complex_zero_c.get()
}

///|
/// REAL_MUL
fn step_9() -> Unit raise {
  let t8 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.real()])), @complexes.simple_complex_arith_tac)
  real_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Tybit0[Unit]], ∀ y : Cart[Real, Tybit0[Unit]], real(x) && real(y) → real(x * y)"), t8))
}

///|
let real_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MUL")

///|
/// `REAL_MUL`
pub fn real_mul() -> @kernel.Thm {
  real_mul_c.get()
}

///|
/// REAL_OF_COMPLEX_MUL
fn step_10() -> Unit raise {
  let t9 = @meson.meson_tac(@list.List([real_mul(), real_of_complex_v1(), @complexes.cx_mul(), real_of_complex_cx()]))
  real_of_complex_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Tybit0[Unit]], ∀ y : Cart[Real, Tybit0[Unit]], real(x) && real(y) → real_of_complex(x * y) == real_of_complex(x) * real_of_complex(y)"), t9))
}

///|
let real_of_complex_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_OF_COMPLEX_MUL")

///|
/// `REAL_OF_COMPLEX_MUL`
pub fn real_of_complex_mul() -> @kernel.Thm {
  real_of_complex_mul_c.get()
}

///|
/// NORM2_ADD_REAL
fn step_11() -> Unit raise {
  let t10 = @simp.simp_tac(@list.List([@complexes.real(), @complexes.complex_norm(), @complexes.re_add(), @complexes.im_add(), @complexes.re_mul_ii(), @complexes.im_mul_ii(), @calc_int.real_neg_0(), @realax.real_add_lid(), @calc_int.real_add_rid(), @real.real_pow_zero(), @int.arith_rule(@term_syntax.parse_term("!(2 == 0)")), @real.real_le_pow_2(), @real.sqrt_pow_2(), @realarith.real_le_add()]))
  norm2_add_real_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Tybit0[Unit]], ∀ y : Cart[Real, Tybit0[Unit]], real(x) && real(y) → pow(norm(x + ii * y), 2) == pow(norm(x), 2) + pow(norm(y), 2)"), t10))
}

///|
let norm2_add_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NORM2_ADD_REAL")

///|
/// `NORM2_ADD_REAL`
pub fn norm2_add_real() -> @kernel.Thm {
  norm2_add_real_c.get()
}

///|
/// real_thms
fn step_12() -> Unit raise {
  real_thms_c.set(Ref::{ val: @list.List([]) })
}

///|
let real_thms_c : @lib.Cell[Ref[@list.List[@kernel.Thm]]] = @lib.Cell::new("real_thms")

///|
/// `real_thms`
pub fn real_thms() -> Ref[@list.List[@kernel.Thm]] {
  real_thms_c.get()
}

///|
/// `add_real_thm`
pub fn add_real_thm(x11 : @kernel.Thm) -> Unit raise {
  let thm = x11
  let t12 = real_thms().val
  {
    real_thms().val = t12.prepend(@utils.gimp_imp_v1(thm))
    ()
  }
}

///|
/// add_real_thms
fn step_13() -> Unit raise {
  add_real_thms_c.set(x13 => @lib.do_list(add_real_thm, x13))
}

///|
let add_real_thms_c : @lib.Cell[(@list.List[@kernel.Thm]) -> Unit raise] = @lib.Cell::new("add_real_thms")

///|
/// `add_real_thms`
pub fn add_real_thms(x : @list.List[@kernel.Thm]) -> Unit raise {
  (add_real_thms_c.get())(x)
}

///|
/// `REAL_TAC`
pub fn real_tac_v1(x14 : @list.List[((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise]?) -> ((@tactics.Goal) -> @tactics.Goalstate raise) raise {
  let _opt_ = x14
  let alternatives = match _opt_ {
    Some(_sth_) => _sth_
    None => @list.List([])
  }
  fn(x16 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    let g = x16
    let is_meta_variable : (@kernel.Term) -> Bool raise = fn(x17 : @kernel.Term) -> Bool raise {
      let v = x17
      try {
        (@lib.ocaml_string_get(@kernel.dest_var(v).0, 0) == '_')
      } catch {
        _ => false
      }
    }
    let contain_meta_variable : (@kernel.Term) -> Bool raise = (x19 : @kernel.Term) => @lib.can((x18 : @kernel.Term) => @basics.find_term(is_meta_variable, x18), x19)
    let match_mp_tac : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise = fn(x20 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let x = x20
      @tactics.then_tac(fn(x22 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        let g_1 = x22
        @tactics.match_mp_tac(x)(g_1)
      }, fn(x23 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        let (_, concl) as g_2 = x23
        if contain_meta_variable(concl) {
          @tactics.no_tac(g_2)
        } else {
          @tactics.all_tac(g_2)
        }
      })
    }
    let t28 = real_thms().val
    let try_real_thm : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = @tactics.asm_tac((x27 : @list.List[@kernel.Thm]) => @tactics.map_first(fn(x24 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let x_1 = x24
      let t26 = match_mp_tac(x_1)
      @tactics.orelse_tac(@tactics.match_accept_tac(x_1), t26)
    }, x27))(t28)
    let t31 = @tactics.first(alternatives)
    let t29 = @tactics.conv_tac(@complexes.complex_field)
    let t30 = @tactics.then_tac(@tactics.changed_tac(@simp.asm_simp_tac(@list.List([@complexes.real()]))), t29)
    let loop_ : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = @tactics.orelse_tac(@tactics.orelse_tac(@tactics.orelse_tac(try_real_thm, @tactics.then_tac(@simp.asm_simp_tac(@list.List([])), @tactics.no_tac)), t30), t31)
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), fn(x32 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      let (_, concl_1) as g_3 = x32
      let t33 = @term_syntax.parse_term("real")
      if !((@lib.repeat(@kernel.rator, concl_1) == t33)) {
        @tactics.fail_tac("bad goal")(g_3)
      } else {
        @tactics.changed_tac(@tactics.repeat_tac(@tactics.then_tac(loop_, @tactics.repeat_tac(@tactics.conj_tac))))(g_3)
      }
    })(g)
  }
}

///|
/// Functionspaces/cfunspace.ml:91
fn step_14() -> Unit raise {
  add_real_thm(real_mul())
}

///|
/// fun_map2
fn step_15() -> Unit raise {
  fun_map2_c.set(@pair.new_definition(@term_syntax.parse_term("(fun_map2 : ((B, C) -> D, (A) -> B, (A) -> C, A) -> D)((f : (B, C) -> D), (g1 : (A) -> B), (g2 : (A) -> C)) == ((x : A) => f(g1(x), g2(x)))")))
}

///|
let fun_map2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("fun_map2")

///|
/// `fun_map2`
pub fn fun_map2() -> @kernel.Thm {
  fun_map2_c.get()
}

///|
/// FUN_MAP2_THM
fn step_16() -> Unit raise {
  let t34 = @simp.rewrite_tac(@list.List([fun_map2()]))
  fun_map2_thm_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_, _) -> _, ∀ g1 : (_) -> _, ∀ g2 : (_) -> _, ∀ x : _, fun_map2(f, g1, g2, x) == f(g1(x), g2(x))"), t34))
}

///|
let fun_map2_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FUN_MAP2_THM")

///|
/// `FUN_MAP2_THM`
pub fn fun_map2_thm() -> @kernel.Thm {
  fun_map2_thm_c.get()
}

///|
/// K_DEF
fn step_17() -> Unit raise {
  k_def_c.set(@pair.new_definition(@term_syntax.parse_term("(K : (A, B) -> A)((x : A)) == ((y : B) => x)")))
}

///|
let k_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("K_DEF")

///|
/// `K_DEF`
pub fn k_def() -> @kernel.Thm {
  k_def_c.get()
}

///|
/// K_THM
fn step_18() -> Unit raise {
  let t35 = @simp.rewrite_tac(@list.List([k_def()]))
  k_thm_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : _, ∀ y : _, K(x, y) == x"), t35))
}

///|
let k_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("K_THM")

///|
/// `K_THM`
pub fn k_thm() -> @kernel.Thm {
  k_thm_c.get()
}

///|
/// fun_map_defs
fn step_19() -> Unit raise {
  fun_map_defs_c.set(@utils.conjs(@list.List([k_def(), @trivia.o_def(), fun_map2()])))
}

///|
let fun_map_defs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("fun_map_defs")

///|
/// `fun_map_defs`
pub fn fun_map_defs() -> @kernel.Thm {
  fun_map_defs_c.get()
}

///|
/// FUN_MAP_THMS
fn step_20() -> Unit raise {
  fun_map_thms_c.set(@utils.conjs(@list.List([k_thm(), @trivia.o_thm(), fun_map2_thm()])))
}

///|
let fun_map_thms_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FUN_MAP_THMS")

///|
/// `FUN_MAP_THMS`
pub fn fun_map_thms() -> @kernel.Thm {
  fun_map_thms_c.get()
}

///|
/// Functionspaces/cfunspace.ml:121
fn step_21() -> Unit raise {
  @preterm.new_type_abbrev("cfun", @parser.parse_type("A->complex"))
}

///|
/// Functionspaces/cfunspace.ml:122
fn step_22() -> Unit raise {
  @preterm.new_type_abbrev("cfunB", @parser.parse_type("B->complex"))
}

///|
/// Functionspaces/cfunspace.ml:123
fn step_23() -> Unit raise {
  @preterm.new_type_abbrev("cfunC", @parser.parse_type("C->complex"))
}

///|
/// cfun_add
fn step_24() -> Unit raise {
  cfun_add_c.set(@pair.new_definition(@term_syntax.parse_term("(cfun_add : ((A) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]]) == fun_map2(op_plus)")))
}

///|
let cfun_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cfun_add")

///|
/// `cfun_add`
pub fn cfun_add() -> @kernel.Thm {
  cfun_add_c.get()
}

///|
/// cfun_smul
fn step_25() -> Unit raise {
  cfun_smul_c.set(@pair.new_definition(@term_syntax.parse_term("(cfun_smul : (Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]])((a : Cart[Real, Tybit0[Unit]])) == o(op_star(a))")))
}

///|
let cfun_smul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cfun_smul")

///|
/// `cfun_smul`
pub fn cfun_smul() -> @kernel.Thm {
  cfun_smul_c.get()
}

///|
/// cfun_neg
fn step_26() -> Unit raise {
  cfun_neg_c.set(@pair.new_definition(@term_syntax.parse_term("(cfun_neg : ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]]) == o(op_minus_minus)")))
}

///|
let cfun_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cfun_neg")

///|
/// `cfun_neg`
pub fn cfun_neg() -> @kernel.Thm {
  cfun_neg_c.get()
}

///|
/// cfun_sub
fn step_27() -> Unit raise {
  cfun_sub_c.set(@pair.new_definition(@term_syntax.parse_term("(cfun_sub : ((A) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]]) == fun_map2(op_minus)")))
}

///|
let cfun_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cfun_sub")

///|
/// `cfun_sub`
pub fn cfun_sub() -> @kernel.Thm {
  cfun_sub_c.get()
}

///|
/// cfun_zero
fn step_28() -> Unit raise {
  cfun_zero_c.set(@pair.new_definition(@term_syntax.parse_term("(cfun_zero : (A) -> Cart[Real, Tybit0[Unit]]) == K(Cx(real_of_num(0)))")))
}

///|
let cfun_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cfun_zero")

///|
/// `cfun_zero`
pub fn cfun_zero() -> @kernel.Thm {
  cfun_zero_c.get()
}

///|
/// cfun_cnj
fn step_29() -> Unit raise {
  cfun_cnj_c.set(@pair.new_definition(@term_syntax.parse_term("(cfun_cnj : ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]]) == o(cnj)")))
}

///|
let cfun_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cfun_cnj")

///|
/// `cfun_cnj`
pub fn cfun_cnj() -> @kernel.Thm {
  cfun_cnj_c.get()
}

///|
/// cfun_defs
fn step_30() -> Unit raise {
  cfun_defs_c.set(@utils.conjs(@list.List([cfun_add(), cfun_sub(), cfun_smul(), cfun_neg(), cfun_cnj(), cfun_zero()])))
}

///|
let cfun_defs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cfun_defs")

///|
/// `cfun_defs`
pub fn cfun_defs() -> @kernel.Thm {
  cfun_defs_c.get()
}

///|
/// Functionspaces/cfunspace.ml:145
fn step_31() -> Unit raise {
  @preterm.make_overloadable("%", @parser.parse_type("A->B->B"))
}

///|
/// Functionspaces/cfunspace.ml:146
fn step_32() -> Unit raise {
  @printer.parse_as_infix("%", (25L, "left"))
}

///|
/// `prioritize_cfun`
pub fn prioritize_cfun(x36 : Unit) -> Unit raise {
  let _ = x36
  @preterm.overload_interface("+", @term_syntax.parse_term("(cfun_add : ((A) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]])"))
  @preterm.overload_interface("%", @term_syntax.parse_term("(cfun_smul : (Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]])"))
  @preterm.overload_interface("--", @term_syntax.parse_term("(cfun_neg : ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]])"))
  @preterm.overload_interface("-", @term_syntax.parse_term("(cfun_sub : ((A) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]])"))
}

///|
/// Functionspaces/cfunspace.ml:154
fn step_33() -> Unit raise {
  prioritize_cfun(())
}

///|
/// CFUN_EQ
fn step_34() -> Unit raise {
  let t37 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  cfun_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Real, Tybit0[Unit]], ∀ g : (A) -> Cart[Real, Tybit0[Unit]], (f == g) == (∀ x : A, f(x) == g(x))"), t37))
}

///|
let cfun_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_EQ")

///|
/// `CFUN_EQ`
pub fn cfun_eq() -> @kernel.Thm {
  cfun_eq_c.get()
}

///|
/// CFUN_TO_COMPLEX
fn step_35() -> Unit raise {
  cfun_to_complex_c.set(@utils.conjs(@list.List([fun_map_thms(), cfun_defs(), cfun_eq()])))
}

///|
let cfun_to_complex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_TO_COMPLEX")

///|
/// `CFUN_TO_COMPLEX`
pub fn cfun_to_complex() -> @kernel.Thm {
  cfun_to_complex_c.get()
}

///|
/// CFUN_ARITH_TAC
fn step_36() -> Unit raise {
  let lemma = @meson.meson(@list.List([]), @term_syntax.parse_term("(∀ x : _, (P : (_) -> Bool)(x) == (Q : (_) -> Bool)(x)) → (∀ x : _, P(x)) == (∀ x : _, Q(x))"))
  let t40 = @tactics.conv_tac(@complexes.complex_field)
  let t39 = @tactics.match_mp_tac(lemma)
  let t38 = @tactics.conv_tac(@canon.prenex_conv)
  let t41 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t38), t39), t40)
  let t42 = @tactics.orelse_tac(@tactics.orelse_tac(@tactics.conv_tac(@complexes.complex_field), @complexes.simple_complex_arith_tac), t41)
  cfun_arith_tac_c.set(@tactics.then_tac(@simp.rewrite_tac(@list.List([cfun_to_complex()])), t42))
}

///|
let cfun_arith_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("CFUN_ARITH_TAC")

///|
/// `CFUN_ARITH_TAC`
pub fn cfun_arith_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (cfun_arith_tac_c.get())(x)
}

///|
/// `CFUN_ARITH`
pub fn cfun_arith(x43 : @kernel.Term) -> @kernel.Thm raise {
  let t = x43
  @tactics.prove(t, cfun_arith_tac)
}

///|
/// CFUN_SUB
fn step_37() -> Unit raise {
  cfun_sub_v1_c.set(cfun_arith(@term_syntax.parse_term("∀ f : (_) -> Cart[Real, Tybit0[Unit]], ∀ g : (_) -> Cart[Real, Tybit0[Unit]], f - g == ((x : _) => f(x) - g(x))")))
}

///|
let cfun_sub_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUB")

///|
/// `CFUN_SUB`
pub fn cfun_sub_v1() -> @kernel.Thm {
  cfun_sub_v1_c.get()
}

///|
/// CFUN_SUB_THM
fn step_38() -> Unit raise {
  cfun_sub_thm_c.set(cfun_arith(@term_syntax.parse_term("∀ f : (_) -> Cart[Real, Tybit0[Unit]], ∀ g : (_) -> Cart[Real, Tybit0[Unit]], op_minus(f, g, (x : _)) == f(x) - g(x)")))
}

///|
let cfun_sub_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUB_THM")

///|
/// `CFUN_SUB_THM`
pub fn cfun_sub_thm() -> @kernel.Thm {
  cfun_sub_thm_c.get()
}

///|
/// CFUN_ADD
fn step_39() -> Unit raise {
  cfun_add_v1_c.set(cfun_arith(@term_syntax.parse_term("∀ f : (_) -> Cart[Real, Tybit0[Unit]], ∀ g : (_) -> Cart[Real, Tybit0[Unit]], f + g == ((x : _) => f(x) + g(x))")))
}

///|
let cfun_add_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_ADD")

///|
/// `CFUN_ADD`
pub fn cfun_add_v1() -> @kernel.Thm {
  cfun_add_v1_c.get()
}

///|
/// CFUN_ADD_THM
fn step_40() -> Unit raise {
  cfun_add_thm_c.set(cfun_arith(@term_syntax.parse_term("∀ f : (_) -> Cart[Real, Tybit0[Unit]], ∀ g : (_) -> Cart[Real, Tybit0[Unit]], op_plus(f, g, (x : _)) == f(x) + g(x)")))
}

///|
let cfun_add_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_ADD_THM")

///|
/// `CFUN_ADD_THM`
pub fn cfun_add_thm() -> @kernel.Thm {
  cfun_add_thm_c.get()
}

///|
/// CFUN_SMUL
fn step_41() -> Unit raise {
  cfun_smul_v1_c.set(cfun_arith(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ∀ f : (_) -> Cart[Real, Tybit0[Unit]], cfun_smul(a, f) == ((x : _) => a * f(x))")))
}

///|
let cfun_smul_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SMUL")

///|
/// `CFUN_SMUL`
pub fn cfun_smul_v1() -> @kernel.Thm {
  cfun_smul_v1_c.get()
}

///|
/// CFUN_NEG_LAMBDA
fn step_42() -> Unit raise {
  cfun_neg_lambda_c.set(cfun_arith(@term_syntax.parse_term("∀ f : (_) -> Cart[Real, Tybit0[Unit]], -f == ((x : _) => -f(x))")))
}

///|
let cfun_neg_lambda_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_NEG_LAMBDA")

///|
/// `CFUN_NEG_LAMBDA`
pub fn cfun_neg_lambda() -> @kernel.Thm {
  cfun_neg_lambda_c.get()
}

///|
/// CFUN_SMUL_LNEG
fn step_43() -> Unit raise {
  cfun_smul_lneg_c.set(cfun_arith(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ∀ f : (_) -> Cart[Real, Tybit0[Unit]], cfun_smul(-a, f) == -cfun_smul(a, f)")))
}

///|
let cfun_smul_lneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SMUL_LNEG")

///|
/// `CFUN_SMUL_LNEG`
pub fn cfun_smul_lneg() -> @kernel.Thm {
  cfun_smul_lneg_c.get()
}

///|
/// CFUN_SMUL_RNEG
fn step_44() -> Unit raise {
  cfun_smul_rneg_c.set(cfun_arith(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ∀ f : (_) -> Cart[Real, Tybit0[Unit]], cfun_smul(a, -f) == -cfun_smul(a, f)")))
}

///|
let cfun_smul_rneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SMUL_RNEG")

///|
/// `CFUN_SMUL_RNEG`
pub fn cfun_smul_rneg() -> @kernel.Thm {
  cfun_smul_rneg_c.get()
}

///|
/// CFUN_ADD_SYM
fn step_45() -> Unit raise {
  cfun_add_sym_c.set(cfun_arith(@term_syntax.parse_term("∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ y : (_) -> Cart[Real, Tybit0[Unit]], x + y == y + x")))
}

///|
let cfun_add_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_ADD_SYM")

///|
/// `CFUN_ADD_SYM`
pub fn cfun_add_sym() -> @kernel.Thm {
  cfun_add_sym_c.get()
}

///|
/// CFUN_ADD_ASSOC
fn step_46() -> Unit raise {
  cfun_add_assoc_c.set(cfun_arith(@term_syntax.parse_term("∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ y : (_) -> Cart[Real, Tybit0[Unit]], ∀ z : (_) -> Cart[Real, Tybit0[Unit]], x + y + z == x + (y + z)")))
}

///|
let cfun_add_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_ADD_ASSOC")

///|
/// `CFUN_ADD_ASSOC`
pub fn cfun_add_assoc() -> @kernel.Thm {
  cfun_add_assoc_c.get()
}

///|
/// CFUN_SUB_NEG
fn step_47() -> Unit raise {
  cfun_sub_neg_c.set(cfun_arith(@term_syntax.parse_term("∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ y : (_) -> Cart[Real, Tybit0[Unit]], x - y == x + -y")))
}

///|
let cfun_sub_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUB_NEG")

///|
/// `CFUN_SUB_NEG`
pub fn cfun_sub_neg() -> @kernel.Thm {
  cfun_sub_neg_c.get()
}

///|
/// CFUN_SMUL_LZERO
fn step_48() -> Unit raise {
  cfun_smul_lzero_c.set(cfun_arith(@term_syntax.parse_term("∀ x : (_) -> Cart[Real, Tybit0[Unit]], cfun_smul(Cx(real_of_num(0)), x) == cfun_zero")))
}

///|
let cfun_smul_lzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SMUL_LZERO")

///|
/// `CFUN_SMUL_LZERO`
pub fn cfun_smul_lzero() -> @kernel.Thm {
  cfun_smul_lzero_c.get()
}

///|
/// CFUN_ADD_LID
fn step_49() -> Unit raise {
  cfun_add_lid_c.set(cfun_arith(@term_syntax.parse_term("∀ x : (_) -> Cart[Real, Tybit0[Unit]], cfun_zero + x == x")))
}

///|
let cfun_add_lid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_ADD_LID")

///|
/// `CFUN_ADD_LID`
pub fn cfun_add_lid() -> @kernel.Thm {
  cfun_add_lid_c.get()
}

///|
/// CFUN_ADD_RID
fn step_50() -> Unit raise {
  cfun_add_rid_c.set(cfun_arith(@term_syntax.parse_term("∀ x : (_) -> Cart[Real, Tybit0[Unit]], x + cfun_zero == x")))
}

///|
let cfun_add_rid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_ADD_RID")

///|
/// `CFUN_ADD_RID`
pub fn cfun_add_rid() -> @kernel.Thm {
  cfun_add_rid_c.get()
}

///|
/// CFUN_SUB_RID
fn step_51() -> Unit raise {
  cfun_sub_rid_c.set(cfun_arith(@term_syntax.parse_term("∀ x : (_) -> Cart[Real, Tybit0[Unit]], x - cfun_zero == x")))
}

///|
let cfun_sub_rid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUB_RID")

///|
/// `CFUN_SUB_RID`
pub fn cfun_sub_rid() -> @kernel.Thm {
  cfun_sub_rid_c.get()
}

///|
/// CFUN_SMUL_RZERO
fn step_52() -> Unit raise {
  cfun_smul_rzero_c.set(cfun_arith(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], (cfun_smul : (Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]])(a, (cfun_zero : (_) -> Cart[Real, Tybit0[Unit]])) == (cfun_zero : (_) -> Cart[Real, Tybit0[Unit]])")))
}

///|
let cfun_smul_rzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SMUL_RZERO")

///|
/// `CFUN_SMUL_RZERO`
pub fn cfun_smul_rzero() -> @kernel.Thm {
  cfun_smul_rzero_c.get()
}

///|
/// CFUN_SUB_REFL
fn step_53() -> Unit raise {
  cfun_sub_refl_c.set(cfun_arith(@term_syntax.parse_term("∀ x : (_) -> Cart[Real, Tybit0[Unit]], x - x == cfun_zero")))
}

///|
let cfun_sub_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUB_REFL")

///|
/// `CFUN_SUB_REFL`
pub fn cfun_sub_refl() -> @kernel.Thm {
  cfun_sub_refl_c.get()
}

///|
/// CFUN_ZERO_CLAUSES
fn step_54() -> Unit raise {
  cfun_zero_clauses_c.set(@utils.conjs(@list.List([cfun_sub_refl(), cfun_add_rid(), cfun_smul_lzero(), cfun_smul_rzero()])))
}

///|
let cfun_zero_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_ZERO_CLAUSES")

///|
/// `CFUN_ZERO_CLAUSES`
pub fn cfun_zero_clauses() -> @kernel.Thm {
  cfun_zero_clauses_c.get()
}

///|
/// CFUN_SMUL_SYM
fn step_55() -> Unit raise {
  cfun_smul_sym_c.set(cfun_arith(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ∀ b : Cart[Real, Tybit0[Unit]], ∀ x : (_) -> Cart[Real, Tybit0[Unit]], cfun_smul(a, cfun_smul(b, x)) == cfun_smul(b, cfun_smul(a, x))")))
}

///|
let cfun_smul_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SMUL_SYM")

///|
/// `CFUN_SMUL_SYM`
pub fn cfun_smul_sym() -> @kernel.Thm {
  cfun_smul_sym_c.get()
}

///|
/// CFUN_SMUL_DIS
fn step_56() -> Unit raise {
  cfun_smul_dis_c.set(cfun_arith(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ y : (_) -> Cart[Real, Tybit0[Unit]], cfun_smul(a, x + y) == cfun_smul(a, x) + cfun_smul(a, y)")))
}

///|
let cfun_smul_dis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SMUL_DIS")

///|
/// `CFUN_SMUL_DIS`
pub fn cfun_smul_dis() -> @kernel.Thm {
  cfun_smul_dis_c.get()
}

///|
/// CFUN_SMUL_ASSOC
fn step_57() -> Unit raise {
  cfun_smul_assoc_c.set(cfun_arith(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ∀ b : Cart[Real, Tybit0[Unit]], ∀ x : (_) -> Cart[Real, Tybit0[Unit]], cfun_smul(a, cfun_smul(b, x)) == cfun_smul(a * b, x)")))
}

///|
let cfun_smul_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SMUL_ASSOC")

///|
/// `CFUN_SMUL_ASSOC`
pub fn cfun_smul_assoc() -> @kernel.Thm {
  cfun_smul_assoc_c.get()
}

///|
/// CFUN_ADD_RDISTRIB
fn step_58() -> Unit raise {
  cfun_add_rdistrib_c.set(cfun_arith(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ∀ b : Cart[Real, Tybit0[Unit]], ∀ x : (_) -> Cart[Real, Tybit0[Unit]], cfun_smul(a + b, x) == cfun_smul(a, x) + cfun_smul(b, x)")))
}

///|
let cfun_add_rdistrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_ADD_RDISTRIB")

///|
/// `CFUN_ADD_RDISTRIB`
pub fn cfun_add_rdistrib() -> @kernel.Thm {
  cfun_add_rdistrib_c.get()
}

///|
/// CFUN_SUB_RDISTRIB
fn step_59() -> Unit raise {
  cfun_sub_rdistrib_c.set(cfun_arith(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ∀ b : Cart[Real, Tybit0[Unit]], ∀ x : (_) -> Cart[Real, Tybit0[Unit]], cfun_smul(a - b, x) == cfun_smul(a, x) - cfun_smul(b, x)")))
}

///|
let cfun_sub_rdistrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUB_RDISTRIB")

///|
/// `CFUN_SUB_RDISTRIB`
pub fn cfun_sub_rdistrib() -> @kernel.Thm {
  cfun_sub_rdistrib_c.get()
}

///|
/// CFUN_SUB_RADD
fn step_60() -> Unit raise {
  cfun_sub_radd_c.set(cfun_arith(@term_syntax.parse_term("∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ y : (_) -> Cart[Real, Tybit0[Unit]], ∀ z : (_) -> Cart[Real, Tybit0[Unit]], x - (y + z) == x - y - z")))
}

///|
let cfun_sub_radd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUB_RADD")

///|
/// `CFUN_SUB_RADD`
pub fn cfun_sub_radd() -> @kernel.Thm {
  cfun_sub_radd_c.get()
}

///|
/// CFUN_ADD_RSUB
fn step_61() -> Unit raise {
  cfun_add_rsub_c.set(cfun_arith(@term_syntax.parse_term("∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ y : (_) -> Cart[Real, Tybit0[Unit]], ∀ z : (_) -> Cart[Real, Tybit0[Unit]], x + (y - z) == x + y - z")))
}

///|
let cfun_add_rsub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_ADD_RSUB")

///|
/// `CFUN_ADD_RSUB`
pub fn cfun_add_rsub() -> @kernel.Thm {
  cfun_add_rsub_c.get()
}

///|
/// CFUN_SUB_ADD
fn step_62() -> Unit raise {
  cfun_sub_add_c.set(cfun_arith(@term_syntax.parse_term("∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ y : (_) -> Cart[Real, Tybit0[Unit]], ∀ z : (_) -> Cart[Real, Tybit0[Unit]], x - y + z == x + z - y")))
}

///|
let cfun_sub_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUB_ADD")

///|
/// `CFUN_SUB_ADD`
pub fn cfun_sub_add() -> @kernel.Thm {
  cfun_sub_add_c.get()
}

///|
/// CFUN_SUB_SUB
fn step_63() -> Unit raise {
  cfun_sub_sub_c.set(cfun_arith(@term_syntax.parse_term("∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ y : (_) -> Cart[Real, Tybit0[Unit]], ∀ z : (_) -> Cart[Real, Tybit0[Unit]], x - (y - z) == x - y + z")))
}

///|
let cfun_sub_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUB_SUB")

///|
/// `CFUN_SUB_SUB`
pub fn cfun_sub_sub() -> @kernel.Thm {
  cfun_sub_sub_c.get()
}

///|
/// CFUN_EQ_LSUB
fn step_64() -> Unit raise {
  cfun_eq_lsub_c.set(cfun_arith(@term_syntax.parse_term("∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ y : (_) -> Cart[Real, Tybit0[Unit]], ∀ z : (_) -> Cart[Real, Tybit0[Unit]], (x - y == z) == (x == z + y)")))
}

///|
let cfun_eq_lsub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_EQ_LSUB")

///|
/// `CFUN_EQ_LSUB`
pub fn cfun_eq_lsub() -> @kernel.Thm {
  cfun_eq_lsub_c.get()
}

///|
/// CFUN_EQ_RSUB
fn step_65() -> Unit raise {
  cfun_eq_rsub_c.set(cfun_arith(@term_syntax.parse_term("∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ y : (_) -> Cart[Real, Tybit0[Unit]], ∀ z : (_) -> Cart[Real, Tybit0[Unit]], (x == y - z) == (x + z == y)")))
}

///|
let cfun_eq_rsub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_EQ_RSUB")

///|
/// `CFUN_EQ_RSUB`
pub fn cfun_eq_rsub() -> @kernel.Thm {
  cfun_eq_rsub_c.get()
}

///|
/// CFUN_ZERO_ADD
fn step_66() -> Unit raise {
  cfun_zero_add_c.set(cfun_arith(@term_syntax.parse_term("∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ y : (_) -> Cart[Real, Tybit0[Unit]], (y + x == x) == (y == cfun_zero)")))
}

///|
let cfun_zero_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_ZERO_ADD")

///|
/// `CFUN_ZERO_ADD`
pub fn cfun_zero_add() -> @kernel.Thm {
  cfun_zero_add_c.get()
}

///|
/// CFUN_SUB_LDISTRIB
fn step_67() -> Unit raise {
  cfun_sub_ldistrib_c.set(cfun_arith(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ y : (_) -> Cart[Real, Tybit0[Unit]], cfun_smul(a, x - y) == cfun_smul(a, x) - cfun_smul(a, y)")))
}

///|
let cfun_sub_ldistrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUB_LDISTRIB")

///|
/// `CFUN_SUB_LDISTRIB`
pub fn cfun_sub_ldistrib() -> @kernel.Thm {
  cfun_sub_ldistrib_c.get()
}

///|
/// CFUN_ADD_LDISTRIB
fn step_68() -> Unit raise {
  cfun_add_ldistrib_c.set(cfun_arith(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ y : (_) -> Cart[Real, Tybit0[Unit]], cfun_smul(a, x + y) == cfun_smul(a, x) + cfun_smul(a, y)")))
}

///|
let cfun_add_ldistrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_ADD_LDISTRIB")

///|
/// `CFUN_ADD_LDISTRIB`
pub fn cfun_add_ldistrib() -> @kernel.Thm {
  cfun_add_ldistrib_c.get()
}

///|
/// CFUN_SMUL_DISTRIB
fn step_69() -> Unit raise {
  cfun_smul_distrib_c.set(cfun_arith(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ∀ b : Cart[Real, Tybit0[Unit]], ∀ f : (_) -> Cart[Real, Tybit0[Unit]], cfun_smul(a, cfun_smul(b, f)) == cfun_smul(a * b, f)")))
}

///|
let cfun_smul_distrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SMUL_DISTRIB")

///|
/// `CFUN_SMUL_DISTRIB`
pub fn cfun_smul_distrib() -> @kernel.Thm {
  cfun_smul_distrib_c.get()
}

///|
/// CFUN_SMUL_LID
fn step_70() -> Unit raise {
  cfun_smul_lid_c.set(cfun_arith(@term_syntax.parse_term("∀ v : (_) -> Cart[Real, Tybit0[Unit]], cfun_smul(Cx(real_of_num(1)), v) == v")))
}

///|
let cfun_smul_lid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SMUL_LID")

///|
/// `CFUN_SMUL_LID`
pub fn cfun_smul_lid() -> @kernel.Thm {
  cfun_smul_lid_c.get()
}

///|
/// CFUN_SMUL_LID_NEG
fn step_71() -> Unit raise {
  cfun_smul_lid_neg_c.set(cfun_arith(@term_syntax.parse_term("∀ v : (_) -> Cart[Real, Tybit0[Unit]], cfun_smul(-Cx(real_of_num(1)), v) == -v")))
}

///|
let cfun_smul_lid_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SMUL_LID_NEG")

///|
/// `CFUN_SMUL_LID_NEG`
pub fn cfun_smul_lid_neg() -> @kernel.Thm {
  cfun_smul_lid_neg_c.get()
}

///|
/// CFUN_EQ_NEG2
fn step_72() -> Unit raise {
  cfun_eq_neg2_c.set(cfun_arith(@term_syntax.parse_term("∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ y : (_) -> Cart[Real, Tybit0[Unit]], (-x == -y) == (x == y)")))
}

///|
let cfun_eq_neg2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_EQ_NEG2")

///|
/// `CFUN_EQ_NEG2`
pub fn cfun_eq_neg2() -> @kernel.Thm {
  cfun_eq_neg2_c.get()
}

///|
/// CFUN_EQ_ADD_LCANCEL
fn step_73() -> Unit raise {
  cfun_eq_add_lcancel_c.set(cfun_arith(@term_syntax.parse_term("∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ y : (_) -> Cart[Real, Tybit0[Unit]], ∀ z : (_) -> Cart[Real, Tybit0[Unit]], (x + y == x + z) == (y == z)")))
}

///|
let cfun_eq_add_lcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_EQ_ADD_LCANCEL")

///|
/// `CFUN_EQ_ADD_LCANCEL`
pub fn cfun_eq_add_lcancel() -> @kernel.Thm {
  cfun_eq_add_lcancel_c.get()
}

///|
/// CFUN_EQ_ADD_RCANCEL
fn step_74() -> Unit raise {
  cfun_eq_add_rcancel_c.set(cfun_arith(@term_syntax.parse_term("∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ y : (_) -> Cart[Real, Tybit0[Unit]], ∀ z : (_) -> Cart[Real, Tybit0[Unit]], (x + z == y + z) == (x == y)")))
}

///|
let cfun_eq_add_rcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_EQ_ADD_RCANCEL")

///|
/// `CFUN_EQ_ADD_RCANCEL`
pub fn cfun_eq_add_rcancel() -> @kernel.Thm {
  cfun_eq_add_rcancel_c.get()
}

///|
/// CFUN_EQ_SUB_LCANCEL
fn step_75() -> Unit raise {
  cfun_eq_sub_lcancel_c.set(cfun_arith(@term_syntax.parse_term("∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ y : (_) -> Cart[Real, Tybit0[Unit]], ∀ z : (_) -> Cart[Real, Tybit0[Unit]], (x - y == x - z) == (y == z)")))
}

///|
let cfun_eq_sub_lcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_EQ_SUB_LCANCEL")

///|
/// `CFUN_EQ_SUB_LCANCEL`
pub fn cfun_eq_sub_lcancel() -> @kernel.Thm {
  cfun_eq_sub_lcancel_c.get()
}

///|
/// CFUN_EQ_SUB_RADD
fn step_76() -> Unit raise {
  cfun_eq_sub_radd_c.set(cfun_arith(@term_syntax.parse_term("∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ y : (_) -> Cart[Real, Tybit0[Unit]], ∀ z : (_) -> Cart[Real, Tybit0[Unit]], (x - y == z) == (x == z + y)")))
}

///|
let cfun_eq_sub_radd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_EQ_SUB_RADD")

///|
/// `CFUN_EQ_SUB_RADD`
pub fn cfun_eq_sub_radd() -> @kernel.Thm {
  cfun_eq_sub_radd_c.get()
}

///|
/// CFUN_SUB_ADD2
fn step_77() -> Unit raise {
  cfun_sub_add2_c.set(cfun_arith(@term_syntax.parse_term("∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ y : (_) -> Cart[Real, Tybit0[Unit]], y + (x - y) == x")))
}

///|
let cfun_sub_add2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUB_ADD2")

///|
/// `CFUN_SUB_ADD2`
pub fn cfun_sub_add2() -> @kernel.Thm {
  cfun_sub_add2_c.get()
}

///|
/// CFUN_SUB_0
fn step_78() -> Unit raise {
  cfun_sub_0_c.set(cfun_arith(@term_syntax.parse_term("∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ y : (_) -> Cart[Real, Tybit0[Unit]], (x - y == cfun_zero) == (x == y)")))
}

///|
let cfun_sub_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUB_0")

///|
/// `CFUN_SUB_0`
pub fn cfun_sub_0() -> @kernel.Thm {
  cfun_sub_0_c.get()
}

///|
/// CFUN_ENTIRE
fn step_79() -> Unit raise {
  cfun_entire_c.set(cfun_arith(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ∀ x : (_) -> Cart[Real, Tybit0[Unit]], (cfun_smul(a, x) == cfun_zero) == (a == Cx(real_of_num(0)) || x == cfun_zero)")))
}

///|
let cfun_entire_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_ENTIRE")

///|
/// `CFUN_ENTIRE`
pub fn cfun_entire() -> @kernel.Thm {
  cfun_entire_c.get()
}

///|
/// CFUN_EQ_SMUL_LCANCEL
fn step_80() -> Unit raise {
  cfun_eq_smul_lcancel_c.set(cfun_arith(@term_syntax.parse_term("∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ y : (_) -> Cart[Real, Tybit0[Unit]], ∀ a : Cart[Real, Tybit0[Unit]], (cfun_smul(a, x) == cfun_smul(a, y)) == (a == Cx(real_of_num(0)) || x == y)")))
}

///|
let cfun_eq_smul_lcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_EQ_SMUL_LCANCEL")

///|
/// `CFUN_EQ_SMUL_LCANCEL`
pub fn cfun_eq_smul_lcancel() -> @kernel.Thm {
  cfun_eq_smul_lcancel_c.get()
}

///|
/// CFUN_EQ_SMUL_LCANCEL2
fn step_81() -> Unit raise {
  let t50 = @tactics.conv_tac(@complexes.complex_field)
  let t49 = @tactics.pop_assum(fn(x46 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s47 = @tactics.mp_tac(x46)
    fn(x48 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s47(x48)
    }
  })
  let t45 = @tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ x : _, (P : (_) -> Bool)(x) == (Q : (_) -> Bool)(x)) → (∀ x : _, P(x)) == (∀ x : _, Q(x))")))
  let t44 = @tactics.repeat_tac(@tactics.strip_tac)
  let t51 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([cfun_to_complex()])), t44), t45), @tactics.gen_tac), t49), t50)
  cfun_eq_smul_lcancel2_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ y : (_) -> Cart[Real, Tybit0[Unit]], !(a == Cx(real_of_num(0))) → (cfun_smul(a, x) == y) == (x == cfun_smul(inv(a), y))"), t51))
}

///|
let cfun_eq_smul_lcancel2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_EQ_SMUL_LCANCEL2")

///|
/// `CFUN_EQ_SMUL_LCANCEL2`
pub fn cfun_eq_smul_lcancel2() -> @kernel.Thm {
  cfun_eq_smul_lcancel2_c.get()
}

///|
/// is_cfun_subspace
fn step_82() -> Unit raise {
  is_cfun_subspace_c.set(@pair.new_definition(@term_syntax.parse_term("(is_cfun_subspace : (((A) -> Cart[Real, Tybit0[Unit]]) -> Bool) -> Bool)((spc : ((A) -> Cart[Real, Tybit0[Unit]]) -> Bool)) == (IN(cfun_zero, spc) && (∀ x : (A) -> Cart[Real, Tybit0[Unit]], IN(x, spc) → (∀ a : Cart[Real, Tybit0[Unit]], IN(cfun_smul(a, x), spc)) && (∀ y : (A) -> Cart[Real, Tybit0[Unit]], IN(y, spc) → IN(x + y, spc))))")))
}

///|
let is_cfun_subspace_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_cfun_subspace")

///|
/// `is_cfun_subspace`
pub fn is_cfun_subspace() -> @kernel.Thm {
  is_cfun_subspace_c.get()
}

///|
/// CFUN_SUBSPACE_ZERO
fn step_83() -> Unit raise {
  let t52 = @simp.simp_tac(@list.List([is_cfun_subspace()]))
  cfun_subspace_zero_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, is_cfun_subspace(s) → IN(cfun_zero, s)"), t52))
}

///|
let cfun_subspace_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUBSPACE_ZERO")

///|
/// `CFUN_SUBSPACE_ZERO`
pub fn cfun_subspace_zero() -> @kernel.Thm {
  cfun_subspace_zero_c.get()
}

///|
/// CFUN_SUBSPACE_SMUL
fn step_84() -> Unit raise {
  let t53 = @simp.simp_tac(@list.List([is_cfun_subspace()]))
  cfun_subspace_smul_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ a : Cart[Real, Tybit0[Unit]], ∀ x : (_) -> Cart[Real, Tybit0[Unit]], is_cfun_subspace(s) && IN(x, s) → IN(cfun_smul(a, x), s)"), t53))
}

///|
let cfun_subspace_smul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUBSPACE_SMUL")

///|
/// `CFUN_SUBSPACE_SMUL`
pub fn cfun_subspace_smul() -> @kernel.Thm {
  cfun_subspace_smul_c.get()
}

///|
/// CFUN_SUBSPACE_ADD
fn step_85() -> Unit raise {
  let t54 = @simp.simp_tac(@list.List([is_cfun_subspace()]))
  cfun_subspace_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ y : (_) -> Cart[Real, Tybit0[Unit]], is_cfun_subspace(s) && IN(x, s) && IN(y, s) → IN(x + y, s)"), t54))
}

///|
let cfun_subspace_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUBSPACE_ADD")

///|
/// `CFUN_SUBSPACE_ADD`
pub fn cfun_subspace_add() -> @kernel.Thm {
  cfun_subspace_add_c.get()
}

///|
/// CFUN_SUBSPACE_NEG
fn step_86() -> Unit raise {
  let t55 = @simp.simp_tac(@list.List([@equal.gsym(cfun_smul_lid_neg()), cfun_subspace_smul()]))
  cfun_subspace_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ x : (_) -> Cart[Real, Tybit0[Unit]], is_cfun_subspace(s) && IN(x, s) → IN(-x, s)"), t55))
}

///|
let cfun_subspace_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUBSPACE_NEG")

///|
/// `CFUN_SUBSPACE_NEG`
pub fn cfun_subspace_neg() -> @kernel.Thm {
  cfun_subspace_neg_c.get()
}

///|
/// CFUN_SUBSPACE_SUB
fn step_87() -> Unit raise {
  let t56 = @simp.simp_tac(@list.List([cfun_sub_neg(), cfun_subspace_neg(), cfun_subspace_add()]))
  cfun_subspace_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ y : (_) -> Cart[Real, Tybit0[Unit]], is_cfun_subspace(s) && IN(x, s) && IN(y, s) → IN(x - y, s)"), t56))
}

///|
let cfun_subspace_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUBSPACE_SUB")

///|
/// `CFUN_SUBSPACE_SUB`
pub fn cfun_subspace_sub() -> @kernel.Thm {
  cfun_subspace_sub_c.get()
}

///|
/// CFUN_SUBSPACE_SING_CFUNZERO
fn step_88() -> Unit raise {
  let t57 = @simp.simp_tac(@list.List([is_cfun_subspace(), @sets.in_sing(), cfun_smul_rzero(), cfun_add_rid()]))
  cfun_subspace_sing_cfunzero_c.set(@tactics.prove(@term_syntax.parse_term("(is_cfun_subspace : (((_) -> Cart[Real, Tybit0[Unit]]) -> Bool) -> Bool)({(cfun_zero : (_) -> Cart[Real, Tybit0[Unit]])})"), t57))
}

///|
let cfun_subspace_sing_cfunzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUBSPACE_SING_CFUNZERO")

///|
/// `CFUN_SUBSPACE_SING_CFUNZERO`
pub fn cfun_subspace_sing_cfunzero() -> @kernel.Thm {
  cfun_subspace_sing_cfunzero_c.get()
}

///|
let sing_ind_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SING_IND")

///|
/// `SING_IND`
pub fn sing_ind() -> @kernel.Thm {
  sing_ind_c.get()
}

///|
let sing_rec_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SING_REC")

///|
/// `SING_REC`
pub fn sing_rec() -> @kernel.Thm {
  sing_rec_c.get()
}

///|
/// SING_IND, SING_REC
fn step_89() -> Unit raise {
  let (sing_ind, sing_rec) = @ind_types.define_type("singleton = SING_ELT")
  sing_ind_c.set(sing_ind)
  sing_rec_c.set(sing_rec)
}

///|
/// SING_EQ
fn step_90() -> Unit raise {
  let t58 = @tactics.then_tac(@tactics.match_mp_tac(sing_ind()), @tactics.refl_tac)
  sing_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Singleton, x == SING_ELT"), t58))
}

///|
let sing_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SING_EQ")

///|
/// `SING_EQ`
pub fn sing_eq() -> @kernel.Thm {
  sing_eq_c.get()
}

///|
/// cfun_of_complex
fn step_91() -> Unit raise {
  cfun_of_complex_c.set(@pair.new_definition(@term_syntax.parse_term("(cfun_of_complex : (Cart[Real, Tybit0[Unit]], Singleton) -> Cart[Real, Tybit0[Unit]]) == K")))
}

///|
let cfun_of_complex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cfun_of_complex")

///|
/// `cfun_of_complex`
pub fn cfun_of_complex() -> @kernel.Thm {
  cfun_of_complex_c.get()
}

///|
/// CFUN_OF_COMPLEX_ADD
fn step_92() -> Unit raise {
  let t59 = @tactics.then_tac(@simp.rewrite_tac(@list.List([cfun_of_complex()])), cfun_arith_tac)
  cfun_of_complex_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Tybit0[Unit]], ∀ y : Cart[Real, Tybit0[Unit]], cfun_of_complex(x + y) == cfun_of_complex(x) + cfun_of_complex(y)"), t59))
}

///|
let cfun_of_complex_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_OF_COMPLEX_ADD")

///|
/// `CFUN_OF_COMPLEX_ADD`
pub fn cfun_of_complex_add() -> @kernel.Thm {
  cfun_of_complex_add_c.get()
}

///|
/// CFUN_OF_COMPLEX_SUB
fn step_93() -> Unit raise {
  let t60 = @tactics.then_tac(@simp.rewrite_tac(@list.List([cfun_of_complex()])), cfun_arith_tac)
  cfun_of_complex_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Tybit0[Unit]], ∀ y : Cart[Real, Tybit0[Unit]], cfun_of_complex(x - y) == cfun_of_complex(x) - cfun_of_complex(y)"), t60))
}

///|
let cfun_of_complex_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_OF_COMPLEX_SUB")

///|
/// `CFUN_OF_COMPLEX_SUB`
pub fn cfun_of_complex_sub() -> @kernel.Thm {
  cfun_of_complex_sub_c.get()
}

///|
/// CFUN_OF_COMPLEX_NEG
fn step_94() -> Unit raise {
  let t61 = @tactics.then_tac(@simp.rewrite_tac(@list.List([cfun_of_complex()])), cfun_arith_tac)
  cfun_of_complex_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Tybit0[Unit]], cfun_of_complex(-x) == -cfun_of_complex(x)"), t61))
}

///|
let cfun_of_complex_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_OF_COMPLEX_NEG")

///|
/// `CFUN_OF_COMPLEX_NEG`
pub fn cfun_of_complex_neg() -> @kernel.Thm {
  cfun_of_complex_neg_c.get()
}

///|
/// CFUN_OF_COMPLEX_SMUL
fn step_95() -> Unit raise {
  let t62 = @tactics.then_tac(@simp.rewrite_tac(@list.List([cfun_of_complex()])), cfun_arith_tac)
  cfun_of_complex_smul_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ∀ x : Cart[Real, Tybit0[Unit]], cfun_of_complex(a * x) == cfun_smul(a, cfun_of_complex(x))"), t62))
}

///|
let cfun_of_complex_smul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_OF_COMPLEX_SMUL")

///|
/// `CFUN_OF_COMPLEX_SMUL`
pub fn cfun_of_complex_smul() -> @kernel.Thm {
  cfun_of_complex_smul_c.get()
}

///|
/// CFUN_OF_COMPLEX_CNJ
fn step_96() -> Unit raise {
  let t63 = @tactics.then_tac(@simp.rewrite_tac(@list.List([cfun_of_complex()])), cfun_arith_tac)
  cfun_of_complex_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Tybit0[Unit]], cfun_of_complex(cnj(x)) == cfun_cnj(cfun_of_complex(x))"), t63))
}

///|
let cfun_of_complex_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_OF_COMPLEX_CNJ")

///|
/// `CFUN_OF_COMPLEX_CNJ`
pub fn cfun_of_complex_cnj() -> @kernel.Thm {
  cfun_of_complex_cnj_c.get()
}

///|
/// CFUN_OF_COMPLEX_ZERO
fn step_97() -> Unit raise {
  let t64 = @tactics.then_tac(@simp.rewrite_tac(@list.List([cfun_of_complex()])), cfun_arith_tac)
  cfun_of_complex_zero_c.set(@tactics.prove(@term_syntax.parse_term("cfun_of_complex(Cx(real_of_num(0))) == cfun_zero"), t64))
}

///|
let cfun_of_complex_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_OF_COMPLEX_ZERO")

///|
/// `CFUN_OF_COMPLEX_ZERO`
pub fn cfun_of_complex_zero() -> @kernel.Thm {
  cfun_of_complex_zero_c.get()
}

///|
/// complex_of_cfun
fn step_98() -> Unit raise {
  complex_of_cfun_c.set(@pair.new_definition(@term_syntax.parse_term("(complex_of_cfun : ((Singleton) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]])((f : (Singleton) -> Cart[Real, Tybit0[Unit]])) == f(SING_ELT)")))
}

///|
let complex_of_cfun_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("complex_of_cfun")

///|
/// `complex_of_cfun`
pub fn complex_of_cfun() -> @kernel.Thm {
  complex_of_cfun_c.get()
}

///|
/// COMPLEX_OF_CFUN_ADD
fn step_99() -> Unit raise {
  let t65 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_of_cfun()])), cfun_arith_tac)
  complex_of_cfun_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : (Singleton) -> Cart[Real, Tybit0[Unit]], ∀ y : (Singleton) -> Cart[Real, Tybit0[Unit]], complex_of_cfun(x + y) == complex_of_cfun(x) + complex_of_cfun(y)"), t65))
}

///|
let complex_of_cfun_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_OF_CFUN_ADD")

///|
/// `COMPLEX_OF_CFUN_ADD`
pub fn complex_of_cfun_add() -> @kernel.Thm {
  complex_of_cfun_add_c.get()
}

///|
/// COMPLEX_OF_CFUN_SUB
fn step_100() -> Unit raise {
  let t66 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_of_cfun()])), cfun_arith_tac)
  complex_of_cfun_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : (Singleton) -> Cart[Real, Tybit0[Unit]], ∀ y : (Singleton) -> Cart[Real, Tybit0[Unit]], complex_of_cfun(x - y) == complex_of_cfun(x) - complex_of_cfun(y)"), t66))
}

///|
let complex_of_cfun_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_OF_CFUN_SUB")

///|
/// `COMPLEX_OF_CFUN_SUB`
pub fn complex_of_cfun_sub() -> @kernel.Thm {
  complex_of_cfun_sub_c.get()
}

///|
/// COMPLEX_OF_CFUN_NEG
fn step_101() -> Unit raise {
  let t67 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_of_cfun()])), cfun_arith_tac)
  complex_of_cfun_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : (Singleton) -> Cart[Real, Tybit0[Unit]], complex_of_cfun(-x) == -complex_of_cfun(x)"), t67))
}

///|
let complex_of_cfun_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_OF_CFUN_NEG")

///|
/// `COMPLEX_OF_CFUN_NEG`
pub fn complex_of_cfun_neg() -> @kernel.Thm {
  complex_of_cfun_neg_c.get()
}

///|
/// COMPLEX_OF_CFUN_SMUL
fn step_102() -> Unit raise {
  let t68 = @tactics.then_tac(@simp.rewrite_tac(@list.List([complex_of_cfun()])), cfun_arith_tac)
  complex_of_cfun_smul_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ∀ x : (Singleton) -> Cart[Real, Tybit0[Unit]], complex_of_cfun(cfun_smul(a, x)) == a * complex_of_cfun(x)"), t68))
}

///|
let complex_of_cfun_smul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_OF_CFUN_SMUL")

///|
/// `COMPLEX_OF_CFUN_SMUL`
pub fn complex_of_cfun_smul() -> @kernel.Thm {
  complex_of_cfun_smul_c.get()
}

///|
/// COMPLEX_OF_CFUN_OF_COMPLEX
fn step_103() -> Unit raise {
  let t69 = @simp.rewrite_tac(@list.List([complex_of_cfun(), cfun_of_complex(), @trivia.o_def(), k_thm(), @trivia.i_def()]))
  complex_of_cfun_of_complex_c.set(@tactics.prove(@term_syntax.parse_term("o(complex_of_cfun, cfun_of_complex) == I"), t69))
}

///|
let complex_of_cfun_of_complex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_OF_CFUN_OF_COMPLEX")

///|
/// `COMPLEX_OF_CFUN_OF_COMPLEX`
pub fn complex_of_cfun_of_complex() -> @kernel.Thm {
  complex_of_cfun_of_complex_c.get()
}

///|
/// CFUN_OF_COMPLEX_OF_CFUN
fn step_104() -> Unit raise {
  let t71 = @simp.rewrite_tac(@list.List([]))
  let t70 = @simp.once_rewrite_tac(@list.List([sing_eq()]))
  let t72 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([complex_of_cfun(), cfun_of_complex(), @trivia.o_def(), k_def(), @class.fun_eq_thm(), @trivia.i_thm()])), t70), t71)
  cfun_of_complex_of_cfun_c.set(@tactics.prove(@term_syntax.parse_term("o(cfun_of_complex, complex_of_cfun) == I"), t72))
}

///|
let cfun_of_complex_of_cfun_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_OF_COMPLEX_OF_CFUN")

///|
/// `CFUN_OF_COMPLEX_OF_CFUN`
pub fn cfun_of_complex_of_cfun() -> @kernel.Thm {
  cfun_of_complex_of_cfun_c.get()
}

///|
/// Functionspaces/cfunspace.ml:379
fn step_105() -> Unit raise {
  @preterm.new_type_abbrev("inprod", @parser.parse_type("cfun->cfun->complex"))
}

///|
/// Functionspaces/cfunspace.ml:381
fn step_106() -> Unit raise {
  @printer.parse_as_infix("equv", (24L, "left"))
}

///|
/// are_equv
fn step_107() -> Unit raise {
  are_equv_c.set(@pair.new_definition(@term_syntax.parse_term("(equv : ((A) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]], ((A) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]) -> Bool)((f : (A) -> Cart[Real, Tybit0[Unit]]), (g : (A) -> Cart[Real, Tybit0[Unit]]), (inprod : ((A) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]])) == (inprod(f - g, f - g) == Cx(real_of_num(0)))")))
}

///|
let are_equv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("are_equv")

///|
/// `are_equv`
pub fn are_equv() -> @kernel.Thm {
  are_equv_c.get()
}

///|
/// Functionspaces/cfunspace.ml:386
fn step_108() -> Unit raise {
  @preterm.new_type_abbrev("inner_space", @parser.parse_type("(cfun->bool)#inprod"))
}

///|
/// is_inner_space
fn step_109() -> Unit raise {
  is_inner_space_c.set(@pair.new_definition(@term_syntax.parse_term("(is_inner_space : ((((A) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((A) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]])) -> Bool)(((s : ((A) -> Cart[Real, Tybit0[Unit]]) -> Bool), (inprod : ((A) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]))) == (is_cfun_subspace(s) && (∀ x : (A) -> Cart[Real, Tybit0[Unit]], IN(x, s) → real(inprod(x, x)) && real_of_num(0) <= real_of_complex(inprod(x, x)) && (∀ y : (A) -> Cart[Real, Tybit0[Unit]], IN(y, s) → (inprod(x, x) == Cx(real_of_num(0)) → inprod(y, x) == Cx(real_of_num(0))) && cnj(inprod(y, x)) == inprod(x, y) && (∀ a : Cart[Real, Tybit0[Unit]], inprod(x, cfun_smul(a, y)) == a * inprod(x, y)) && (∀ z : (A) -> Cart[Real, Tybit0[Unit]], IN(z, s) → inprod(x + y, z) == inprod(x, z) + inprod(y, z)))))")))
}

///|
let is_inner_space_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_inner_space")

///|
/// `is_inner_space`
pub fn is_inner_space() -> @kernel.Thm {
  is_inner_space_c.get()
}

///|
/// `inner_space_parse`
pub fn inner_space_parse(x73 : String) -> @kernel.Term raise {
  let s = x73
  @parser.parse_term(("forall s inprod. is_inner_space (s,inprod) ==> " + s))
}

///|
/// `inner_space_prove`
pub fn inner_space_prove(x74 : String, x75 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) -> @kernel.Thm raise {
  let (s, p) = (x74, x75)
  @tactics.prove(@utils.gimp_imp(inner_space_parse(s)), p)
}

///|
/// `inner_space_g`
pub fn inner_space_g(x76 : String) -> @tactics.Goalstack raise {
  let s = x76
  @tactics.g(@utils.gimp_imp(inner_space_parse(s)))
}

///|
/// `full_inner_space_parse`
pub fn full_inner_space_parse(x77 : String) -> @kernel.Term raise {
  let s = x77
  @parser.parse_term(("forall is_. is_inner_space is_ ==> " + s))
}

///|
/// `full_inner_space_prove`
pub fn full_inner_space_prove(x78 : String, x79 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) -> @kernel.Thm raise {
  let (s, p) = (x78, x79)
  @tactics.prove(@utils.gimp_imp(full_inner_space_parse(s)), p)
}

///|
/// `full_inner_space_g`
pub fn full_inner_space_g(x80 : String) -> @tactics.Goalstack raise {
  let s = x80
  @tactics.g(@utils.gimp_imp(full_inner_space_parse(s)))
}

///|
/// FORALL_INNER_SPACE_THM
fn step_110() -> Unit raise {
  let t81 = @simp.rewrite_tac(@list.List([@pair.forall_pair_thm()]))
  forall_inner_space_thm_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : ((((A) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((A) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]])) -> Bool, (∀ is_ : (((A) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((A) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]), P(is_)) == (∀ s : ((A) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((A) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], P((s, inprod)))"), t81))
}

///|
let forall_inner_space_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORALL_INNER_SPACE_THM")

///|
/// `FORALL_INNER_SPACE_THM`
pub fn forall_inner_space_thm() -> @kernel.Thm {
  forall_inner_space_thm_c.get()
}

///|
/// INNER_SPACE_IS_SUBSPACE
fn step_111() -> Unit raise {
  inner_space_is_subspace_c.set(inner_space_prove("is_cfun_subspace s", @simp.simp_tac(@list.List([is_inner_space()]))))
}

///|
let inner_space_is_subspace_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INNER_SPACE_IS_SUBSPACE")

///|
/// `INNER_SPACE_IS_SUBSPACE`
pub fn inner_space_is_subspace() -> @kernel.Thm {
  inner_space_is_subspace_c.get()
}

///|
/// INNER_SPACE_ZERO
fn step_112() -> Unit raise {
  inner_space_zero_c.set(inner_space_prove("cfun_zero IN s", @meson.meson_tac(@list.List([inner_space_is_subspace(), cfun_subspace_zero()]))))
}

///|
let inner_space_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INNER_SPACE_ZERO")

///|
/// `INNER_SPACE_ZERO`
pub fn inner_space_zero() -> @kernel.Thm {
  inner_space_zero_c.get()
}

///|
/// INNER_SPACE_SMUL
fn step_113() -> Unit raise {
  inner_space_smul_c.set(inner_space_prove("forall x a. x IN s ==> a%x IN s", @meson.meson_tac(@list.List([inner_space_is_subspace(), cfun_subspace_smul()]))))
}

///|
let inner_space_smul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INNER_SPACE_SMUL")

///|
/// `INNER_SPACE_SMUL`
pub fn inner_space_smul() -> @kernel.Thm {
  inner_space_smul_c.get()
}

///|
/// INNER_SPACE_ADD
fn step_114() -> Unit raise {
  inner_space_add_c.set(inner_space_prove("forall x y. x IN s /\\ y IN s ==> x+y IN s", @meson.meson_tac(@list.List([inner_space_is_subspace(), cfun_subspace_add()]))))
}

///|
let inner_space_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INNER_SPACE_ADD")

///|
/// `INNER_SPACE_ADD`
pub fn inner_space_add() -> @kernel.Thm {
  inner_space_add_c.get()
}

///|
/// INNER_SPACE_NEG
fn step_115() -> Unit raise {
  inner_space_neg_c.set(inner_space_prove("forall x. x IN s ==> --x IN s", @meson.meson_tac(@list.List([inner_space_is_subspace(), cfun_subspace_neg()]))))
}

///|
let inner_space_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INNER_SPACE_NEG")

///|
/// `INNER_SPACE_NEG`
pub fn inner_space_neg() -> @kernel.Thm {
  inner_space_neg_c.get()
}

///|
/// INNER_SPACE_SUB
fn step_116() -> Unit raise {
  inner_space_sub_c.set(inner_space_prove("forall x y. x IN s /\\ y IN s ==> x-y IN s", @meson.meson_tac(@list.List([inner_space_is_subspace(), cfun_subspace_sub()]))))
}

///|
let inner_space_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INNER_SPACE_SUB")

///|
/// `INNER_SPACE_SUB`
pub fn inner_space_sub() -> @kernel.Thm {
  inner_space_sub_c.get()
}

///|
/// INPROD_CNJ
fn step_117() -> Unit raise {
  inprod_cnj_c.set(inner_space_prove("forall x y. x IN s /\\ y IN s ==> cnj(inprod y x) = inprod x y", @simp.simp_tac(@list.List([is_inner_space()]))))
}

///|
let inprod_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INPROD_CNJ")

///|
/// `INPROD_CNJ`
pub fn inprod_cnj() -> @kernel.Thm {
  inprod_cnj_c.get()
}

///|
/// INPROD_SELF_REAL
fn step_118() -> Unit raise {
  inprod_self_real_c.set(inner_space_prove("forall x. x IN s ==> real (inprod x x)", @simp.simp_tac(@list.List([is_inner_space()]))))
}

///|
let inprod_self_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INPROD_SELF_REAL")

///|
/// `INPROD_SELF_REAL`
pub fn inprod_self_real() -> @kernel.Thm {
  inprod_self_real_c.get()
}

///|
/// INPROD_SELF_POS
fn step_119() -> Unit raise {
  inprod_self_pos_c.set(inner_space_prove("forall x. x IN s ==> &0 <= real_of_complex (inprod x x)", @simp.simp_tac(@list.List([is_inner_space()]))))
}

///|
let inprod_self_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INPROD_SELF_POS")

///|
/// `INPROD_SELF_POS`
pub fn inprod_self_pos() -> @kernel.Thm {
  inprod_self_pos_c.get()
}

///|
/// INPROD_RSMUL
fn step_120() -> Unit raise {
  inprod_rsmul_c.set(inner_space_prove("forall x y a. x IN s /\\ y IN s ==> inprod x (a%y) = a * inprod x y", @simp.simp_tac(@list.List([is_inner_space()]))))
}

///|
let inprod_rsmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INPROD_RSMUL")

///|
/// `INPROD_RSMUL`
pub fn inprod_rsmul() -> @kernel.Thm {
  inprod_rsmul_c.get()
}

///|
/// INPROD_ADD_RDIST
fn step_121() -> Unit raise {
  inprod_add_rdist_c.set(inner_space_prove("forall x y z. x IN s /\\ y IN s /\\ z IN s\n      ==> inprod (x+y) z = inprod x z + inprod y z", @simp.simp_tac(@list.List([is_inner_space()]))))
}

///|
let inprod_add_rdist_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INPROD_ADD_RDIST")

///|
/// `INPROD_ADD_RDIST`
pub fn inprod_add_rdist() -> @kernel.Thm {
  inprod_add_rdist_c.get()
}

///|
/// INPROD_ZERO_EQ
fn step_122() -> Unit raise {
  inprod_zero_eq_c.set(inner_space_prove("forall x y. x IN s /\\ y IN s ==> (inprod x x = Cx(&0) ==> inprod y x = Cx(&0))", @simp.simp_tac(@list.List([is_inner_space()]))))
}

///|
let inprod_zero_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INPROD_ZERO_EQ")

///|
/// `INPROD_ZERO_EQ`
pub fn inprod_zero_eq() -> @kernel.Thm {
  inprod_zero_eq_c.get()
}

///|
/// INPROD_LZERO_EQ
fn step_123() -> Unit raise {
  inprod_lzero_eq_c.set(inner_space_prove("forall x y. x IN s /\\ y IN s ==> (inprod x x = Cx(&0) ==> inprod x y = Cx(&0))", @meson.meson_tac(@list.List([inprod_zero_eq(), inprod_cnj()]))))
}

///|
let inprod_lzero_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INPROD_LZERO_EQ")

///|
/// `INPROD_LZERO_EQ`
pub fn inprod_lzero_eq() -> @kernel.Thm {
  inprod_lzero_eq_c.get()
}

///|
/// INPROD_NORM
fn step_124() -> Unit raise {
  inprod_norm_c.set(inner_space_prove("forall x. x IN s ==> real (inprod x x) /\\ &0 <= real_of_complex (inprod x x)", @simp.simp_tac(@list.List([is_inner_space()]))))
}

///|
let inprod_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INPROD_NORM")

///|
/// `INPROD_NORM`
pub fn inprod_norm() -> @kernel.Thm {
  inprod_norm_c.get()
}

///|
/// Functionspaces/cfunspace.ml:475
fn step_125() -> Unit raise {
  add_real_thm(@meson.meson(@list.List([inprod_self_real()]), @term_syntax.parse_term("∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], ∀ x : (_) -> Cart[Real, Tybit0[Unit]], is_inner_space((s, inprod)) && IN(x, s) → real(inprod(x, x))")))
}

///|
/// INPROD_LSMUL
fn step_126() -> Unit raise {
  inprod_lsmul_c.set(inner_space_prove("forall x y a. x IN s /\\ y IN s ==> inprod (a%x) y = cnj a * inprod x y", @meson.meson_tac(@list.List([is_inner_space(), is_cfun_subspace(), @complexes.cnj_mul()]))))
}

///|
let inprod_lsmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INPROD_LSMUL")

///|
/// `INPROD_LSMUL`
pub fn inprod_lsmul() -> @kernel.Thm {
  inprod_lsmul_c.get()
}

///|
/// INPROD_LNEG
fn step_127() -> Unit raise {
  inprod_lneg_c.set(inner_space_prove("forall x y. x IN s /\\ y IN s ==> inprod (--x) y = --inprod x y", @meson.meson_tac(@list.List([@equal.gsym(cfun_smul_lid_neg()), inprod_lsmul(), @complexes.cnj_neg(), @complexes.cnj_cx(), @complexes.complex_neg_minus1()]))))
}

///|
let inprod_lneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INPROD_LNEG")

///|
/// `INPROD_LNEG`
pub fn inprod_lneg() -> @kernel.Thm {
  inprod_lneg_c.get()
}

///|
/// INPROD_SUB_RDIST
fn step_128() -> Unit raise {
  inprod_sub_rdist_c.set(inner_space_prove("forall x y z. x IN s /\\ y IN s /\\ z IN s ==>\n      inprod (x-y) z = inprod x z - inprod y z", @impconv.imp_rewrite_tac(@list.List([cfun_sub_neg(), @complexes.complex_sub(), inprod_add_rdist(), inprod_lneg(), cfun_subspace_neg(), inner_space_is_subspace()]))))
}

///|
let inprod_sub_rdist_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INPROD_SUB_RDIST")

///|
/// `INPROD_SUB_RDIST`
pub fn inprod_sub_rdist() -> @kernel.Thm {
  inprod_sub_rdist_c.get()
}

///|
/// INPROD_RNEG
fn step_129() -> Unit raise {
  inprod_rneg_c.set(inner_space_prove("forall x y. x IN s /\\ y IN s ==> inprod x (--y) = --inprod x y", @meson.meson_tac(@list.List([@equal.gsym(cfun_smul_lid_neg()), inprod_rsmul(), @complexes.complex_neg_minus1()]))))
}

///|
let inprod_rneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INPROD_RNEG")

///|
/// `INPROD_RNEG`
pub fn inprod_rneg() -> @kernel.Thm {
  inprod_rneg_c.get()
}

///|
/// INPROD_ADD_LDIST
fn step_130() -> Unit raise {
  inprod_add_ldist_c.set(inner_space_prove("forall x y z. x IN s /\\ y IN s /\\ z IN s ==>\n      inprod z (x+y) = inprod z x + inprod z y", @meson.meson_tac(@list.List([inprod_cnj(), inner_space_is_subspace(), cfun_subspace_add(), inprod_add_rdist(), @complexes.cnj_add()]))))
}

///|
let inprod_add_ldist_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INPROD_ADD_LDIST")

///|
/// `INPROD_ADD_LDIST`
pub fn inprod_add_ldist() -> @kernel.Thm {
  inprod_add_ldist_c.get()
}

///|
/// INPROD_SUB_LDIST
fn step_131() -> Unit raise {
  inprod_sub_ldist_c.set(inner_space_prove("forall x y z. x IN s /\\ y IN s /\\ z IN s ==>\n    inprod z (x-y) = inprod z x - inprod z y", @impconv.imp_rewrite_tac(@list.List([cfun_sub_neg(), @complexes.complex_sub(), inprod_add_ldist(), inprod_rneg(), cfun_subspace_neg(), inner_space_is_subspace()]))))
}

///|
let inprod_sub_ldist_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INPROD_SUB_LDIST")

///|
/// `INPROD_SUB_LDIST`
pub fn inprod_sub_ldist() -> @kernel.Thm {
  inprod_sub_ldist_c.get()
}

///|
/// INPROD_RZERO
fn step_132() -> Unit raise {
  inprod_rzero_c.set(inner_space_prove("forall x. x IN s ==> inprod x cfun_zero = Cx(&0)", @impconv.imp_rewrite_tac(@list.List([@equal.gsym(cfun_smul_lzero()), inprod_rsmul(), @complexes.complex_mul_lzero()]))))
}

///|
let inprod_rzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INPROD_RZERO")

///|
/// `INPROD_RZERO`
pub fn inprod_rzero() -> @kernel.Thm {
  inprod_rzero_c.get()
}

///|
/// INPROD_LZERO
fn step_133() -> Unit raise {
  inprod_lzero_c.set(inner_space_prove("forall x. x IN s ==> inprod cfun_zero x = Cx(&0)", @impconv.imp_rewrite_tac(@list.List([@equal.gsym(cfun_smul_lzero()), inprod_lsmul(), @complexes.cnj_cx(), @complexes.complex_mul_lzero()]))))
}

///|
let inprod_lzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INPROD_LZERO")

///|
/// `INPROD_LZERO`
pub fn inprod_lzero() -> @kernel.Thm {
  inprod_lzero_c.get()
}

///|
/// INPROD_ZERO
fn step_134() -> Unit raise {
  inprod_zero_c.set(inner_space_prove("inprod cfun_zero cfun_zero = Cx(&0)", @meson.meson_tac(@list.List([inprod_lzero(), inner_space_zero()]))))
}

///|
let inprod_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INPROD_ZERO")

///|
/// `INPROD_ZERO`
pub fn inprod_zero() -> @kernel.Thm {
  inprod_zero_c.get()
}

///|
/// INPROD_SELF_CNJ
fn step_135() -> Unit raise {
  inprod_self_cnj_c.set(inner_space_prove("forall x. x IN s ==> cnj (inprod x x) = inprod x x", @simp.simp_tac(@list.List([@equal.gsym(@complexes.real_cnj()), is_inner_space()]))))
}

///|
let inprod_self_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INPROD_SELF_CNJ")

///|
/// `INPROD_SELF_CNJ`
pub fn inprod_self_cnj() -> @kernel.Thm {
  inprod_self_cnj_c.get()
}

///|
/// INPROD_ADD_CNJ
fn step_136() -> Unit raise {
  inprod_add_cnj_c.set(inner_space_prove("forall x y. x IN s /\\ y IN s ==> inprod x y + inprod y x =\n   Cx(&2 * Re (inprod x y))", @impconv.imp_rewrite_tac(@list.List([@equal.gsym(@complexes.complex_add_cnj()), inprod_cnj()]))))
}

///|
let inprod_add_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INPROD_ADD_CNJ")

///|
/// `INPROD_ADD_CNJ`
pub fn inprod_add_cnj() -> @kernel.Thm {
  inprod_add_cnj_c.get()
}

///|
/// INPROD_SELF_NORM
fn step_137() -> Unit raise {
  inprod_self_norm_c.set(inner_space_prove("forall x. x IN s ==> norm (inprod x x) = real_of_complex (inprod x x)", @meson.meson_tac(@list.List([is_inner_space(), real_of_complex_v1(), @complexes.complex_norm_cx(), @real.real_abs_refl()]))))
}

///|
let inprod_self_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INPROD_SELF_NORM")

///|
/// `INPROD_SELF_NORM`
pub fn inprod_self_norm() -> @kernel.Thm {
  inprod_self_norm_c.get()
}

///|
/// INPROD_SELF_RE
fn step_138() -> Unit raise {
  inprod_self_re_c.set(inner_space_prove("forall x. x IN s ==> real_of_complex (inprod x x) = Re (inprod x x)", @meson.meson_tac(@list.List([is_inner_space(), real_of_complex_re()]))))
}

///|
let inprod_self_re_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INPROD_SELF_RE")

///|
/// `INPROD_SELF_RE`
pub fn inprod_self_re() -> @kernel.Thm {
  inprod_self_re_c.get()
}

///|
/// INPROD_NEG
fn step_139() -> Unit raise {
  inprod_neg_c.set(inner_space_prove("forall x y. x IN s /\\ y IN s ==> inprod (--x) (--y) = inprod x y", @impconv.imp_rewrite_tac(@list.List([cfun_subspace_neg(), inner_space_is_subspace(), inprod_rneg(), inprod_lneg(), @complexes.complex_neg_neg()]))))
}

///|
let inprod_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INPROD_NEG")

///|
/// `INPROD_NEG`
pub fn inprod_neg() -> @kernel.Thm {
  inprod_neg_c.get()
}

///|
/// EQUV_ZERO
fn step_140() -> Unit raise {
  let t82 = @simp.rewrite_tac(@list.List([are_equv(), cfun_sub_rid()]))
  equv_zero_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], (inprod(x, x) == Cx(real_of_num(0))) == equv(x, cfun_zero, inprod)"), t82))
}

///|
let equv_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQUV_ZERO")

///|
/// `EQUV_ZERO`
pub fn equv_zero() -> @kernel.Thm {
  equv_zero_c.get()
}

///|
/// INPROD_NOT_ZERO
fn step_141() -> Unit raise {
  inprod_not_zero_c.set(inner_space_prove("forall x. x IN s /\\ ~(x equv cfun_zero) inprod ==> ~(x = cfun_zero)", @meson.meson_tac(@list.List([are_equv(), inprod_zero(), cfun_sub_rid()]))))
}

///|
let inprod_not_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INPROD_NOT_ZERO")

///|
/// `INPROD_NOT_ZERO`
pub fn inprod_not_zero() -> @kernel.Thm {
  inprod_not_zero_c.get()
}

///|
/// EQUV_SUB_ZERO
fn step_142() -> Unit raise {
  let t83 = @simp.rewrite_tac(@list.List([are_equv(), cfun_sub_rid()]))
  equv_sub_zero_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], equv(x, (y : (_) -> Cart[Real, Tybit0[Unit]]), inprod) == equv(x - y, cfun_zero, inprod)"), t83))
}

///|
let equv_sub_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQUV_SUB_ZERO")

///|
/// `EQUV_SUB_ZERO`
pub fn equv_sub_zero() -> @kernel.Thm {
  equv_sub_zero_c.get()
}

///|
/// INPROD_ZERO_EQUV
fn step_143() -> Unit raise {
  inprod_zero_equv_c.set(inner_space_prove("forall x y. x IN s /\\ y IN s ==> (x equv cfun_zero) inprod ==> inprod y x = Cx(&0)", @meson.meson_tac(@list.List([equv_zero(), inprod_zero_eq()]))))
}

///|
let inprod_zero_equv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INPROD_ZERO_EQUV")

///|
/// `INPROD_ZERO_EQUV`
pub fn inprod_zero_equv() -> @kernel.Thm {
  inprod_zero_equv_c.get()
}

///|
/// INPROD_EQUV_SYM
fn step_144() -> Unit raise {
  let t86 = @meson.asm_meson_tac(@list.List([inner_space_sub()]))
  let t85 = @impconv.target_rewrite_tac(@list.List([cfun_arith(@term_syntax.parse_term("∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ y : (_) -> Cart[Real, Tybit0[Unit]], x - y == -(y - x)"))]))(inprod_neg())
  let t84 = @simp.rewrite_tac(@list.List([are_equv()]))
  inprod_equv_sym_c.set(inner_space_prove("forall x y. x IN s /\\ y IN s ==>  ((x equv y) inprod <=> (y equv x) inprod)", @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.eq_tac), t84), @tactics.disch_tac), t85), t86)))
}

///|
let inprod_equv_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INPROD_EQUV_SYM")

///|
/// `INPROD_EQUV_SYM`
pub fn inprod_equv_sym() -> @kernel.Thm {
  inprod_equv_sym_c.get()
}

///|
/// INPROD_EQUV_RREPLACE
fn step_145() -> Unit raise {
  let t88 = @meson.meson_tac(@list.List([inner_space_sub(), @q.specl(@list.List(["s", "inprod", "x-y", "z"]), @equal.gsym(inprod_zero_equv())), inprod_sub_ldist()]))
  let t87 = @tactics.repeat_tac(@tactics.gen_tac)
  let t89 = @tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(@complexes.complex_sub_0()), equv_sub_zero()])), t87), t88)
  inprod_equv_rreplace_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], ∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ y : (_) -> Cart[Real, Tybit0[Unit]], ∀ z : (_) -> Cart[Real, Tybit0[Unit]], equv(x, y, inprod) → is_inner_space((s, inprod)) && IN(x, s) && IN(y, s) && IN(z, s) → inprod(z, x) == inprod(z, y)"), t89))
}

///|
let inprod_equv_rreplace_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INPROD_EQUV_RREPLACE")

///|
/// `INPROD_EQUV_RREPLACE`
pub fn inprod_equv_rreplace() -> @kernel.Thm {
  inprod_equv_rreplace_c.get()
}

///|
/// INPROD_EQUV_LREPLACE
fn step_146() -> Unit raise {
  let t90 = @meson.meson_tac(@list.List([@equal.gsym(inprod_cnj()), inprod_equv_rreplace()]))
  inprod_equv_lreplace_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], ∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ y : (_) -> Cart[Real, Tybit0[Unit]], ∀ z : (_) -> Cart[Real, Tybit0[Unit]], equv(x, y, inprod) → is_inner_space((s, inprod)) && IN(x, s) && IN(y, s) && IN(z, s) → inprod(x, z) == inprod(y, z)"), t90))
}

///|
let inprod_equv_lreplace_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INPROD_EQUV_LREPLACE")

///|
/// `INPROD_EQUV_LREPLACE`
pub fn inprod_equv_lreplace() -> @kernel.Thm {
  inprod_equv_lreplace_c.get()
}

///|
/// INPROD_INJ_ALT
fn step_147() -> Unit raise {
  let t94 = @meson.asm_meson_tac(@list.List([are_equv(), @complexes.complex_sub_0(), cfun_subspace_sub(), inner_space_is_subspace()]))
  let t92 = @equal.gsym(inprod_sub_rdist())
  let t93 = @impconv.target_rewrite_tac(@list.List([@equal.gsym(@complexes.complex_sub_0())]))(t92)
  let t91 = @list.List([@meson.asm_meson_tac(@list.List([inprod_equv_lreplace()])), @tactics.all_tac])
  inprod_inj_alt_c.set(inner_space_prove("forall x y. x IN s /\\ y IN s\n    ==> ((x equv y) inprod  <=> (forall z. z IN s ==> inprod x z = inprod y z))", @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.eq_tac), t91), t93), t94)))
}

///|
let inprod_inj_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INPROD_INJ_ALT")

///|
/// `INPROD_INJ_ALT`
pub fn inprod_inj_alt() -> @kernel.Thm {
  inprod_inj_alt_c.get()
}

///|
/// `INPROD_EQUV_TAC`
pub fn inprod_equv_tac(x95 : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  let ths = x95
  @tactics.assum_list(fn(x97 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let thl = x97
    let mthl = @lib.map(fn(x99 : @kernel.Thm) -> @kernel.Thm raise {
      let th = x99
      try {
        let t100 = @drule.match_mp(inprod_equv_lreplace())(th)
        @bool.conj(@drule.match_mp(inprod_equv_rreplace())(th), t100)
      } catch {
        Failure(explanation) => th
        e => raise e
      }
    }, thl)
    @impconv.imp_rewrite_tac(mthl.concat(ths))
  })
}

///|
/// INPROD_EQUV_TRANSTIVE
fn step_148() -> Unit raise {
  let t101 = inprod_equv_tac(@list.List([are_equv(), inprod_sub_rdist(), inprod_sub_ldist(), inner_space_sub(), @complexes.complex_sub_refl()]))
  inprod_equv_transtive_c.set(inner_space_prove("forall x y z. x IN s /\\ y IN s /\\ z IN s ==> (x equv y) inprod /\\\n          (y equv z) inprod ==> (x equv z) inprod", @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t101)))
}

///|
let inprod_equv_transtive_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INPROD_EQUV_TRANSTIVE")

///|
/// `INPROD_EQUV_TRANSTIVE`
pub fn inprod_equv_transtive() -> @kernel.Thm {
  inprod_equv_transtive_c.get()
}

///|
/// are_orthogonal
fn step_149() -> Unit raise {
  are_orthogonal_c.set(@pair.new_definition(@term_syntax.parse_term("(are_orthogonal1 : ((((A) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((A) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]), (A) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]]) -> Bool)(((s : ((A) -> Cart[Real, Tybit0[Unit]]) -> Bool), (inprod : ((A) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]])), (u : (A) -> Cart[Real, Tybit0[Unit]]), (v : (A) -> Cart[Real, Tybit0[Unit]])) == (is_inner_space((s, inprod)) && IN(u, s) && IN(v, s) → inprod(u, v) == Cx(real_of_num(0)))")))
}

///|
let are_orthogonal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("are_orthogonal")

///|
/// `are_orthogonal`
pub fn are_orthogonal() -> @kernel.Thm {
  are_orthogonal_c.get()
}

///|
/// ARE_ORTHOGONAL
fn step_150() -> Unit raise {
  are_orthogonal_v1_c.set(inner_space_prove("forall u v. u IN s /\\ v IN s ==>\n      (are_orthogonal1 (s,inprod) u v <=> inprod u v = Cx(&0))", @meson.meson_tac(@list.List([are_orthogonal()]))))
}

///|
let are_orthogonal_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ARE_ORTHOGONAL")

///|
/// `ARE_ORTHOGONAL`
pub fn are_orthogonal_v1() -> @kernel.Thm {
  are_orthogonal_v1_c.get()
}

///|
/// ARE_ORTHOGONAL_SYM
fn step_151() -> Unit raise {
  let t104 = @meson.asm_meson_tac(@list.List([@complexes.cnj_cx(), inprod_cnj()]))
  let t103 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@complexes.cnj_inj())]))
  let t102 = @tactics.repeat_tac(@tactics.orelse_tac(@tactics.strip_tac, @tactics.eq_tac))
  are_orthogonal_sym_c.set(inner_space_prove("forall u v. u IN s /\\ v IN s\n      ==> (are_orthogonal1 (s,inprod) u v <=> are_orthogonal1 (s,inprod) v u)", @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([are_orthogonal_v1()])), t102), t103), t104)))
}

///|
let are_orthogonal_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ARE_ORTHOGONAL_SYM")

///|
/// `ARE_ORTHOGONAL_SYM`
pub fn are_orthogonal_sym() -> @kernel.Thm {
  are_orthogonal_sym_c.get()
}

///|
/// ARE_ORTHOGONAL_LSCALAR
fn step_152() -> Unit raise {
  are_orthogonal_lscalar_c.set(inner_space_prove("forall u v. u IN s /\\ v IN s /\\ are_orthogonal1 (s,inprod) u v\n      ==> forall a. are_orthogonal1 (s,inprod) (a % u) v", @impconv.imp_rewrite_tac(@list.List([are_orthogonal(), inprod_lsmul(), @complexes.complex_mul_rzero()]))))
}

///|
let are_orthogonal_lscalar_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ARE_ORTHOGONAL_LSCALAR")

///|
/// `ARE_ORTHOGONAL_LSCALAR`
pub fn are_orthogonal_lscalar() -> @kernel.Thm {
  are_orthogonal_lscalar_c.get()
}

///|
/// ORTHOGONAL_SUM_NORM
fn step_153() -> Unit raise {
  let t117 = @meson.meson_tac(@list.List([inprod_cnj(), @complexes.cnj_cx()]))
  let t116 = (fn(x112 : (@kernel.Term) -> @kernel.Thm raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x106 : (@kernel.Term) -> @kernel.Thm raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s107 = @tactics.conv_tac(x106)
      fn(x108 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s107(x108)
      }
    })((fn(x109 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s110 = @equal.depth_conv(x109)
      fn(x111 : @kernel.Term) -> @kernel.Thm raise {
        s110(x111)
      }
    })(x112))
  })((fn(x113 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s114 = @equal.changed_conv(x113)
    fn(x115 : @kernel.Term) -> @kernel.Thm raise {
      s114(x115)
    }
  })(@complexes.complex_poly_conv))
  let t105 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@complexes.complex_sub_0())]))
  orthogonal_sum_norm_c.set(inner_space_prove("forall u v. u IN s /\\ v IN s /\\ are_orthogonal1 (s,inprod) u v ==>\n    inprod (u+v) (u+v) = inprod u u + inprod v v", @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@impconv.imp_rewrite_tac(@list.List([are_orthogonal(), inprod_add_ldist(), inprod_add_rdist(), cfun_subspace_add(), inner_space_is_subspace()])), t105), t116), t117)))
}

///|
let orthogonal_sum_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORTHOGONAL_SUM_NORM")

///|
/// `ORTHOGONAL_SUM_NORM`
pub fn orthogonal_sum_norm() -> @kernel.Thm {
  orthogonal_sum_norm_c.get()
}

///|
/// ORTHOGONAL_DECOMPOS_WRT_CFUN
fn step_154() -> Unit raise {
  let t121 = @impconv.imp_rewrite_tac(@list.List([@complexes.complex_div_rmul(), inprod_not_zero(), equv_zero()]))
  let t122 = @list.List([inprod_equv_tac(@list.List([cfun_smul_rzero(), inprod_lzero(), cfun_subspace_zero(), inner_space_is_subspace()])), t121])
  let t120 = @q.asm_cases_tac("(v equv cfun_zero) inprod")
  let t119 = @tactics.repeat_tac(@tactics.strip_tac)
  let t118 = @impconv.imp_rewrite_tac(@list.List([inprod_sub_ldist(), inprod_rsmul(), cfun_subspace_smul(), inner_space_is_subspace()]))
  orthogonal_decompos_wrt_cfun_c.set(inner_space_prove("forall u v. u IN s /\\ v IN s ==>\n      let proj_v = inprod v u / inprod v v in\n      let orthogonal_component = u - proj_v % v in\n      u = proj_v % v + orthogonal_component\n      /\\ are_orthogonal1 (s,inprod) v orthogonal_component", @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@utils.let_defs(), cfun_sub_add2(), are_orthogonal()])), t118), t119), t120), t122), @complexes.simple_complex_arith_tac)))
}

///|
let orthogonal_decompos_wrt_cfun_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORTHOGONAL_DECOMPOS_WRT_CFUN")

///|
/// `ORTHOGONAL_DECOMPOS_WRT_CFUN`
pub fn orthogonal_decompos_wrt_cfun() -> @kernel.Thm {
  orthogonal_decompos_wrt_cfun_c.get()
}

///|
/// ORTHOGONAL_DECOMPOS_WRT_CFUN_DECOMPOSITION
fn step_155() -> Unit raise {
  let t123 = @meson.meson_tac(@list.List([@simp.rewrite_rule(@list.List([@utils.let_defs()]))(orthogonal_decompos_wrt_cfun())]))
  orthogonal_decompos_wrt_cfun_decomposition_c.set(inner_space_prove("forall u v. u IN s /\\ v IN s ==>\n      let proj_v = inprod v u / inprod v v in\n      let orthogonal_component = u - proj_v % v in\n      u = proj_v % v + orthogonal_component", @tactics.then_tac(@simp.rewrite_tac(@list.List([@utils.let_defs()])), t123)))
}

///|
let orthogonal_decompos_wrt_cfun_decomposition_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORTHOGONAL_DECOMPOS_WRT_CFUN_DECOMPOSITION")

///|
/// `ORTHOGONAL_DECOMPOS_WRT_CFUN_DECOMPOSITION`
pub fn orthogonal_decompos_wrt_cfun_decomposition() -> @kernel.Thm {
  orthogonal_decompos_wrt_cfun_decomposition_c.get()
}

///|
/// ORTHOGONAL_DECOMPOS_WRT_CFUN_ORTHOGONAL
fn step_156() -> Unit raise {
  let t124 = @meson.meson_tac(@list.List([@simp.rewrite_rule(@list.List([@utils.let_defs()]))(orthogonal_decompos_wrt_cfun())]))
  orthogonal_decompos_wrt_cfun_orthogonal_c.set(inner_space_prove("forall u v. u IN s /\\ v IN s ==>\n      are_orthogonal1 (s,inprod) v (u - (inprod v u / inprod v v) % v)", @tactics.then_tac(@simp.rewrite_tac(@list.List([@utils.let_defs()])), t124)))
}

///|
let orthogonal_decompos_wrt_cfun_orthogonal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORTHOGONAL_DECOMPOS_WRT_CFUN_ORTHOGONAL")

///|
/// `ORTHOGONAL_DECOMPOS_WRT_CFUN_ORTHOGONAL`
pub fn orthogonal_decompos_wrt_cfun_orthogonal() -> @kernel.Thm {
  orthogonal_decompos_wrt_cfun_orthogonal_c.get()
}

///|
/// SCHWARZ_INEQUALITY
fn step_157() -> Unit raise {
  let t159 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_0(), @complexes.re_cx()]))
  let t158 = @impconv.imp_rewrite_tac(@list.List([inprod_zero_eq()]))
  let t157 = @utils.gconv_tac(@complexes.complex_poly_conv)
  let t160 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t157), t158), t159), @int.arith_tac)
  let t156 = @simp.asm_rewrite_tac(@list.List([]))
  let t155 = @impconv.imp_rewrite_tac(@list.List([cfun_subspace_sub(), cfun_subspace_smul(), inner_space_is_subspace()]))
  let arg : (@list.List[((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise]?) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise = real_tac_v1
  let t153 = @impconv.imp_rewrite_tac(@list.List([@equal.gsym(real_of_complex_re()), real_of_complex_mul(), @realax.real_le_mul(), inprod_self_pos(), inprod_self_pos(), cfun_subspace_sub(), cfun_subspace_smul(), inner_space_is_subspace()]))
  let t152 = @simp.rewrite_tac(@list.List([@complexes.re_add(), @complexes.re_cx(), @complexes.complex_mul_rid(), @equal.gsym(@complexes.cx_pow()), @real.real_le_addr()]))
  let t161 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@impconv.imp_rewrite_tac(@list.List([inprod_cnj()])), t152), t153), fn(x154 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    let eta = x154
    arg(None)(eta)
  }), @utils.hint_exists_tac), t155), t156), t160])
  let t149 = @simp.once_rewrite_rule(@list.List([@equal.gsym(@complexes.complex_norm_cnj())]))(@complexes.complex_mul_cnj())
  let t150 = @simp.rewrite_tac(@list.List([@complexes.complex_add_rdistrib(), @utils.complex_field("((x*y)*(z*t)*u)*v = (x*z)*(u*t)*(v*y)"), t149]))
  let t148 = @impconv.imp_rewrite_tac(@list.List([inprod_self_cnj()]))
  let t147 = @impconv.imp_rewrite_tac(@list.List([real_of_complex_v1(), inprod_self_real()]))
  let t146 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.re_mul_cx())]))
  let t145 = @impconv.imp_rewrite_tac(@list.List([inprod_self_norm()]))
  let t144 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @complexes.cnj_mul(), @complexes.cnj_inv()]))
  let t143 = @impconv.imp_rewrite_tac(@list.List([orthogonal_sum_norm(), are_orthogonal_lscalar(), cfun_subspace_sub(), inprod_rsmul(), cfun_subspace_smul(), inner_space_is_subspace(), inprod_lsmul()]))
  let t142 = @tactics.first_x_assum((x141 : @kernel.Thm) => @utils.wrap(fn(x140 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x128 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s129 = @tactics.changed_tac(x128)
      fn(x130 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s129(x130)
      }
    })(((x139 : @list.List[@kernel.Thm]) => @simp.gen_rewrite_tac(fn(x138 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x132 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s133 = ((x131 : (@kernel.Term) -> @kernel.Thm raise) => @equal.path_conv("rl", x131))(x132)
        fn(x134 : @kernel.Term) -> @kernel.Thm raise {
          s133(x134)
        }
      })((fn(x135 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s136 = @equal.once_depth_conv(x135)
        fn(x137 : @kernel.Term) -> @kernel.Thm raise {
          s136(x137)
        }
      })(x138))
    }, x139))(x140))
  }, x141))
  let t127 = @tactics.repeat_tac(@tactics.strip_tac)
  let t125 = @bool.spec_all(@simp.rewrite_rule(@list.List([@utils.let_defs()]))(orthogonal_decompos_wrt_cfun()))
  let t126 = @simp.rewrite_tac(@list.List([@drule.match_mp(@class.taut(@term_syntax.parse_term("((A : Bool) → (B : Bool)) → (A → (C : Bool)) == (A && B → C)")))(t125)]))
  schwarz_inequality_c.set(inner_space_prove("forall x y. x IN s /\\ y IN s\n      ==> norm (inprod x y) pow 2\n        <= real_of_complex (inprod x x) * real_of_complex (inprod y y)", @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@impconv.imp_rewrite_tac(@list.List([@equal.gsym(inprod_self_norm()), inprod_self_re()])), t126), t127), t142), t143), t144), t145), t146), t147), t148), t150), (x151 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @utils.cases_rewrite_tac(@complexes.complex_mul_rinv(), x151)), t161)))
}

///|
let schwarz_inequality_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SCHWARZ_INEQUALITY")

///|
/// `SCHWARZ_INEQUALITY`
pub fn schwarz_inequality() -> @kernel.Thm {
  schwarz_inequality_c.get()
}

///|
/// SCHWARZ_INEQUALITY2
fn step_158() -> Unit raise {
  let t163 = @impconv.imp_rewrite_tac(@list.List([schwarz_inequality(), inprod_self_pos(), @vectors.norm_pos_le(), @realax.real_le_mul(), @real.real_le_pow_2()]))
  let t162 = @equal.gsym(@real.sqrt_mul())
  schwarz_inequality2_c.set(inner_space_prove("forall x y. x IN s /\\ y IN s\n      ==> norm (inprod x y)\n        <= sqrt (real_of_complex (inprod x x)) *\n                        sqrt(real_of_complex (inprod y y))", @tactics.then_tac(@impconv.target_rewrite_tac(@list.List([@equal.gsym(@bool.gen_all(@q.spec("norm z", @real.pow_2_sqrt()))), t162]))(@real.sqrt_mono_le_eq()), t163)))
}

///|
let schwarz_inequality2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SCHWARZ_INEQUALITY2")

///|
/// `SCHWARZ_INEQUALITY2`
pub fn schwarz_inequality2() -> @kernel.Thm {
  schwarz_inequality2_c.get()
}

///|
/// SCHWARZ_INEQUALITY_ENHANCED
fn step_159() -> Unit raise {
  let t173 = @meson.meson_tac(@list.List([inprod_cnj(), @complexes.cx_im_cnj(), @complexes.real_cx()]))
  let t171 = @equal.gsym(@complexes.complex_div())
  let t172 = @simp.rewrite_tac(@list.List([@complexes.simple_complex_arith(@term_syntax.parse_term("(x : Cart[Real, Tybit0[Unit]]) * ((y : Cart[Real, Tybit0[Unit]]) * inv(ii)) == inv(ii) * (x * y)")), @complexes.complex_inv_ii(), t171]))
  let t170 = @impconv.imp_rewrite_tac(@list.List([inprod_cnj(), real_of_complex_v1()]))
  let t169 = @simp.rewrite_tac(@list.List([@complexes.cx_im_cnj(), @equal.gsym(@complexes.complex_inv_ii()), @complexes.complex_div(), @complexes.complex_inv_mul()]))
  let t168 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@complexes.cx_inj())]))
  let t167 = @impconv.imp_rewrite_tac(@list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("(x : Real) == (y : Real) → pow(x, 2) == pow(y, 2)"))]))
  let t166 = @simp.rewrite_tac(@list.List([@real.real_le_pow_2()]))
  let t165 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) == (y : Real) + (z : Real) → real_of_num(0) <= y && (t : Real) == z → t <= x")))(@complexes.complex_sqnorm())
  let t164 = @bool.spec_all(schwarz_inequality())
  schwarz_inequality_enhanced_c.set(inner_space_prove("forall x y. x IN s /\\ y IN s ==>\n      real_of_complex ((inprod x y - inprod y x) / (Cx(&2) * ii)) pow 2\n        <= real_of_complex (inprod x x) * real_of_complex (inprod y y)", @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@impconv.imp_rewrite_tac(@list.List([@drule.match_mp(@meson.meson(@list.List([@realax.real_le_trans()]), @term_syntax.parse_term("∀ f : (_, _) -> Real, ∀ g : (_, _) -> Real, ((P : Bool) → f((x : _), (y : _)) <= g(x, y)) → P && (z : Real) <= f(x, y) → z <= g(x, y)")))(t164), t165])), t166), t167), t168), t169), t170), t172), t173)))
}

///|
let schwarz_inequality_enhanced_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SCHWARZ_INEQUALITY_ENHANCED")

///|
/// `SCHWARZ_INEQUALITY_ENHANCED`
pub fn schwarz_inequality_enhanced() -> @kernel.Thm {
  schwarz_inequality_enhanced_c.get()
}

///|
/// Functionspaces/cfunspace.ml:748
fn step_160() -> Unit raise {
  @preterm.new_type_abbrev("cop", @parser.parse_type("cfunB->cfun"))
}

///|
/// Functionspaces/cfunspace.ml:749
fn step_161() -> Unit raise {
  @preterm.new_type_abbrev("copB", @parser.parse_type("cfunC->cfunB"))
}

///|
/// Functionspaces/cfunspace.ml:750
fn step_162() -> Unit raise {
  @preterm.new_type_abbrev("cops", @parser.parse_type("cfun->cfun"))
}

///|
/// cop_add
fn step_163() -> Unit raise {
  cop_add_c.set(@pair.new_definition(@term_syntax.parse_term("(cop_add : (((B) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], ((B) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], (B) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]]) == fun_map2(op_plus)")))
}

///|
let cop_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cop_add")

///|
/// `cop_add`
pub fn cop_add() -> @kernel.Thm {
  cop_add_c.get()
}

///|
/// cop_sub
fn step_164() -> Unit raise {
  cop_sub_c.set(@pair.new_definition(@term_syntax.parse_term("(cop_sub : (((B) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], ((B) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], (B) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]]) == fun_map2(op_minus)")))
}

///|
let cop_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cop_sub")

///|
/// `cop_sub`
pub fn cop_sub() -> @kernel.Thm {
  cop_sub_c.get()
}

///|
/// cop_neg
fn step_165() -> Unit raise {
  cop_neg_c.set(@pair.new_definition(@term_syntax.parse_term("(cop_neg : (((B) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], (B) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]]) == o(op_minus_minus)")))
}

///|
let cop_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cop_neg")

///|
/// `cop_neg`
pub fn cop_neg() -> @kernel.Thm {
  cop_neg_c.get()
}

///|
/// cop_mul
fn step_166() -> Unit raise {
  cop_mul_c.set(@pair.new_definition(@term_syntax.parse_term("(cop_mul : (((B) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], ((C) -> Cart[Real, Tybit0[Unit]], B) -> Cart[Real, Tybit0[Unit]], (C) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]]) == o")))
}

///|
let cop_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cop_mul")

///|
/// `cop_mul`
pub fn cop_mul() -> @kernel.Thm {
  cop_mul_c.get()
}

///|
/// cop_smul
fn step_167() -> Unit raise {
  cop_smul_c.set(@pair.new_definition(@term_syntax.parse_term("(cop_smul : (Cart[Real, Tybit0[Unit]], ((B) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], (B) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]]) == o(o, cfun_smul)")))
}

///|
let cop_smul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cop_smul")

///|
/// `cop_smul`
pub fn cop_smul() -> @kernel.Thm {
  cop_smul_c.get()
}

///|
/// cop_zero
fn step_168() -> Unit raise {
  cop_zero_c.set(@pair.new_definition(@term_syntax.parse_term("(cop_zero : ((B) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]]) == K(cfun_zero)")))
}

///|
let cop_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cop_zero")

///|
/// `cop_zero`
pub fn cop_zero() -> @kernel.Thm {
  cop_zero_c.get()
}

///|
/// cop_pow
fn step_169() -> Unit raise {
  cop_pow_c.set(@define.define_(@term_syntax.parse_term("(cop_pow : (((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], Num, (A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]])((op : ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]]), 0) == I && cop_pow(op, SUC((n : Num))) == cop_mul(op, cop_pow(op, n))")))
}

///|
let cop_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cop_pow")

///|
/// `cop_pow`
pub fn cop_pow() -> @kernel.Thm {
  cop_pow_c.get()
}

///|
/// cop_cnj
fn step_170() -> Unit raise {
  cop_cnj_c.set(@pair.new_definition(@term_syntax.parse_term("(cop_cnj : (((B) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], (B) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]]) == o(cfun_cnj)")))
}

///|
let cop_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cop_cnj")

///|
/// `cop_cnj`
pub fn cop_cnj() -> @kernel.Thm {
  cop_cnj_c.get()
}

///|
/// cop_defs
fn step_171() -> Unit raise {
  cop_defs_c.set(@utils.conjs(@list.List([cop_add(), cop_sub(), cop_neg(), cop_mul(), cop_smul(), cop_zero(), @trivia.i_thm(), cop_pow(), cop_cnj()])))
}

///|
let cop_defs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cop_defs")

///|
/// `cop_defs`
pub fn cop_defs() -> @kernel.Thm {
  cop_defs_c.get()
}

///|
/// `prioritize_cop`
pub fn prioritize_cop(x174 : Unit) -> Unit raise {
  let _ = x174
  @preterm.overload_interface("+", @term_syntax.parse_term("(cop_add : (((B) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], ((B) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], (B) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]])"))
  @preterm.overload_interface("-", @term_syntax.parse_term("(cop_sub : (((B) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], ((B) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], (B) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]])"))
  @preterm.overload_interface("--", @term_syntax.parse_term("(cop_neg : (((B) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], (B) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]])"))
  @preterm.overload_interface("**", @term_syntax.parse_term("(cop_mul : (((B) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], ((C) -> Cart[Real, Tybit0[Unit]], B) -> Cart[Real, Tybit0[Unit]], (C) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]])"))
  @preterm.overload_interface("pow", @term_syntax.parse_term("(cop_pow : (((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], Num, (A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]])"))
  @preterm.overload_interface("%", @term_syntax.parse_term("(cop_smul : (Cart[Real, Tybit0[Unit]], ((B) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], (B) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]])"))
}

///|
/// Functionspaces/cfunspace.ml:788
fn step_172() -> Unit raise {
  prioritize_cop(())
}

///|
/// COP_EQ
fn step_173() -> Unit raise {
  let t175 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  cop_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : ((B) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], ∀ g : ((B) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], (f == g) == (∀ x : (B) -> Cart[Real, Tybit0[Unit]], f(x) == g(x))"), t175))
}

///|
let cop_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_EQ")

///|
/// `COP_EQ`
pub fn cop_eq() -> @kernel.Thm {
  cop_eq_c.get()
}

///|
/// COP_TO_CFUN
fn step_174() -> Unit raise {
  cop_to_cfun_c.set(@utils.conjs(@list.List([fun_map_thms(), @trivia.o_thm(), cop_defs(), cop_eq()])))
}

///|
let cop_to_cfun_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_TO_CFUN")

///|
/// `COP_TO_CFUN`
pub fn cop_to_cfun() -> @kernel.Thm {
  cop_to_cfun_c.get()
}

///|
/// COP_POW_CONV
fn step_175() -> Unit raise {
  let t176 = @term_syntax.parse_term("pow((t : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]]), SUC(0))")
  let th = @simp.rewrite_conv(@list.List([cop_pow(), cop_mul(), @trivia.i_o_id()]))(t176)
  cop_pow_conv_c.set(fn(x177 : @kernel.Term) -> @kernel.Thm raise {
    let t = x177
    let (h, _) = @basics.strip_comb(t)
    if (@printer.name_of(h) == "cop_pow") {
      let t178 = @simp.rewrite_conv(@list.List([cop_pow(), th]))
      @equal.changed_conv(@equal.thenc(@equal.rand_conv(@equal.redepth_conv(@calc_num.num_conv)), t178))(t)
    } else {
      raise Failure("COP_POW_CONV")
    }
  })
}

///|
let cop_pow_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("COP_POW_CONV")

///|
/// `COP_POW_CONV`
pub fn cop_pow_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (cop_pow_conv_c.get())(x)
}

///|
/// COP_ARITH_TAC
fn step_176() -> Unit raise {
  let lemma = @meson.meson(@list.List([]), @term_syntax.parse_term("(∀ x : _, (P : (_) -> Bool)(x) == (Q : (_) -> Bool)(x)) → (∀ x : _, P(x)) == (∀ x : _, Q(x))"))
  let t181 = @tactics.match_mp_tac(lemma)
  let t180 = @tactics.conv_tac(@canon.prenex_conv)
  let t182 = @tactics.orelse_tac(cfun_arith_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t180), t181), cfun_arith_tac))
  let t179 = @simp.rewrite_tac(@list.List([cop_to_cfun()]))
  cop_arith_tac_c.set(@tactics.then_tac(@tactics.then_tac(@tactics.conv_tac(@equal.top_depth_conv(cop_pow_conv)), t179), t182))
}

///|
let cop_arith_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("COP_ARITH_TAC")

///|
/// `COP_ARITH_TAC`
pub fn cop_arith_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (cop_arith_tac_c.get())(x)
}

///|
/// `COP_ARITH`
pub fn cop_arith(x183 : @kernel.Term) -> @kernel.Thm raise {
  let t = x183
  @tactics.prove(t, cop_arith_tac)
}

///|
/// COP_ZERO
fn step_177() -> Unit raise {
  cop_zero_v1_c.set(cop_arith(@term_syntax.parse_term("∀ x : (_) -> Cart[Real, Tybit0[Unit]], (cop_zero : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]])(x) == (cfun_zero : (_) -> Cart[Real, Tybit0[Unit]])")))
}

///|
let cop_zero_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_ZERO")

///|
/// `COP_ZERO`
pub fn cop_zero_v1() -> @kernel.Thm {
  cop_zero_v1_c.get()
}

///|
/// COP_SMUL
fn step_178() -> Unit raise {
  cop_smul_v1_c.set(cop_arith(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ∀ op : (_) -> Cart[Real, Tybit0[Unit]], cfun_smul(a, op) == ((x : _) => a * op(x))")))
}

///|
let cop_smul_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_SMUL")

///|
/// `COP_SMUL`
pub fn cop_smul_v1() -> @kernel.Thm {
  cop_smul_v1_c.get()
}

///|
/// COP_SMUL_THM
fn step_179() -> Unit raise {
  cop_smul_thm_c.set(cop_arith(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ x : (_) -> Cart[Real, Tybit0[Unit]], cop_smul(a, op, x) == cfun_smul(a, op(x))")))
}

///|
let cop_smul_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_SMUL_THM")

///|
/// `COP_SMUL_THM`
pub fn cop_smul_thm() -> @kernel.Thm {
  cop_smul_thm_c.get()
}

///|
/// COP_SMUL_ALT
fn step_180() -> Unit raise {
  cop_smul_alt_c.set(cop_arith(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ∀ op : (_) -> Cart[Real, Tybit0[Unit]], cfun_smul(a, op) == ((x : _) => a * op(x))")))
}

///|
let cop_smul_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_SMUL_ALT")

///|
/// `COP_SMUL_ALT`
pub fn cop_smul_alt() -> @kernel.Thm {
  cop_smul_alt_c.get()
}

///|
/// COP_MUL
fn step_181() -> Unit raise {
  cop_mul_v1_c.set(cop_arith(@term_syntax.parse_term("∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], cop_mul(op1, op2) == ((x : (_) -> Cart[Real, Tybit0[Unit]]) => op1(op2(x)))")))
}

///|
let cop_mul_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_MUL")

///|
/// `COP_MUL`
pub fn cop_mul_v1() -> @kernel.Thm {
  cop_mul_v1_c.get()
}

///|
/// COP_ADD
fn step_182() -> Unit raise {
  cop_add_v1_c.set(cop_arith(@term_syntax.parse_term("∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], op1 + op2 == ((x : (_) -> Cart[Real, Tybit0[Unit]]) => op1(x) + op2(x))")))
}

///|
let cop_add_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_ADD")

///|
/// `COP_ADD`
pub fn cop_add_v1() -> @kernel.Thm {
  cop_add_v1_c.get()
}

///|
/// COP_SUB_ABS
fn step_183() -> Unit raise {
  cop_sub_abs_c.set(cop_arith(@term_syntax.parse_term("∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], op1 - op2 == ((x : (_) -> Cart[Real, Tybit0[Unit]]) => op1(x) - op2(x))")))
}

///|
let cop_sub_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_SUB_ABS")

///|
/// `COP_SUB_ABS`
pub fn cop_sub_abs() -> @kernel.Thm {
  cop_sub_abs_c.get()
}

///|
/// COP_ADD_THM
fn step_184() -> Unit raise {
  cop_add_thm_c.set(cop_arith(@term_syntax.parse_term("∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ x : (_) -> Cart[Real, Tybit0[Unit]], op_plus(op1, op2, x) == op1(x) + op2(x)")))
}

///|
let cop_add_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_ADD_THM")

///|
/// `COP_ADD_THM`
pub fn cop_add_thm() -> @kernel.Thm {
  cop_add_thm_c.get()
}

///|
/// COP_SUB_THM
fn step_185() -> Unit raise {
  cop_sub_thm_c.set(cop_arith(@term_syntax.parse_term("∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ x : (_) -> Cart[Real, Tybit0[Unit]], op_minus(op1, op2, x) == op1(x) - op2(x)")))
}

///|
let cop_sub_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_SUB_THM")

///|
/// `COP_SUB_THM`
pub fn cop_sub_thm() -> @kernel.Thm {
  cop_sub_thm_c.get()
}

///|
/// COP_ZERO_THM
fn step_186() -> Unit raise {
  cop_zero_thm_c.set(cop_arith(@term_syntax.parse_term("(cop_zero : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]])((x : (_) -> Cart[Real, Tybit0[Unit]])) == (cfun_zero : (_) -> Cart[Real, Tybit0[Unit]])")))
}

///|
let cop_zero_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_ZERO_THM")

///|
/// `COP_ZERO_THM`
pub fn cop_zero_thm() -> @kernel.Thm {
  cop_zero_thm_c.get()
}

///|
/// COP_MUL_LID
fn step_187() -> Unit raise {
  cop_mul_lid_c.set(cop_arith(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], cop_mul(I, op) == op")))
}

///|
let cop_mul_lid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_MUL_LID")

///|
/// `COP_MUL_LID`
pub fn cop_mul_lid() -> @kernel.Thm {
  cop_mul_lid_c.get()
}

///|
/// COP_MUL_RID
fn step_188() -> Unit raise {
  cop_mul_rid_c.set(cop_arith(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], cop_mul(op, I) == op")))
}

///|
let cop_mul_rid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_MUL_RID")

///|
/// `COP_MUL_RID`
pub fn cop_mul_rid() -> @kernel.Thm {
  cop_mul_rid_c.get()
}

///|
/// COP_I_ID
fn step_189() -> Unit raise {
  cop_i_id_c.set(@bool.conj(cop_mul_lid(), cop_mul_rid()))
}

///|
let cop_i_id_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_I_ID")

///|
/// `COP_I_ID`
pub fn cop_i_id() -> @kernel.Thm {
  cop_i_id_c.get()
}

///|
/// COP_ENTIRE
fn step_190() -> Unit raise {
  cop_entire_c.set(cop_arith(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ∀ x : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], (cop_smul(a, x) == cop_zero) == (a == Cx(real_of_num(0)) || x == cop_zero)")))
}

///|
let cop_entire_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_ENTIRE")

///|
/// `COP_ENTIRE`
pub fn cop_entire() -> @kernel.Thm {
  cop_entire_c.get()
}

///|
/// COP_ZERO_NEQ_ID
fn step_191() -> Unit raise {
  let t185 = @tactics.conv_tac(@complexes.complex_field)
  let t186 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([cop_to_cfun(), cfun_to_complex(), @class.not_forall_thm()])), (x184 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @q.exists_tac("\\x. Cx(&1)", x184)), t185)
  cop_zero_neq_id_c.set(@tactics.prove(@term_syntax.parse_term("!((I : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]]) == (cop_zero : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]]))"), t186))
}

///|
let cop_zero_neq_id_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_ZERO_NEQ_ID")

///|
/// `COP_ZERO_NEQ_ID`
pub fn cop_zero_neq_id() -> @kernel.Thm {
  cop_zero_neq_id_c.get()
}

///|
/// COP_SMUL_I_ZERO
fn step_192() -> Unit raise {
  let t187 = @simp.rewrite_tac(@list.List([cop_entire(), cop_zero_neq_id()]))
  cop_smul_i_zero_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ((cop_smul : (Cart[Real, Tybit0[Unit]], ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]])(a, (I : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]])) == (cop_zero : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]])) == (a == Cx(real_of_num(0)))"), t187))
}

///|
let cop_smul_i_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_SMUL_I_ZERO")

///|
/// `COP_SMUL_I_ZERO`
pub fn cop_smul_i_zero() -> @kernel.Thm {
  cop_smul_i_zero_c.get()
}

///|
/// COP_SMUL_I_ONE
fn step_193() -> Unit raise {
  let t194 = @tactics.conv_tac(@complexes.complex_field)
  let t193 = @list.List([@tactics.disch_then(fn(x192 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x188 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s189 = @tactics.mp_tac(x188)
      fn(x190 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s189(x190)
      }
    })(((x191 : @kernel.Thm) => @q.spec("\\x.Cx(&1)", x191))(x192))
  }), @tactics.all_tac])
  let t195 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([cop_to_cfun(), cfun_to_complex()])), @tactics.gen_tac), @tactics.eq_tac), t193), t194)
  cop_smul_i_one_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ((cop_smul : (Cart[Real, Tybit0[Unit]], ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]])(a, (I : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]])) == (I : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]])) == (a == Cx(real_of_num(1)))"), t195))
}

///|
let cop_smul_i_one_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_SMUL_I_ONE")

///|
/// `COP_SMUL_I_ONE`
pub fn cop_smul_i_one() -> @kernel.Thm {
  cop_smul_i_one_c.get()
}

///|
/// COP_MUL_I_SYM
fn step_194() -> Unit raise {
  cop_mul_i_sym_c.set(cop_arith(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], cop_mul(op, I) == cop_mul(I, op)")))
}

///|
let cop_mul_i_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_MUL_I_SYM")

///|
/// `COP_MUL_I_SYM`
pub fn cop_mul_i_sym() -> @kernel.Thm {
  cop_mul_i_sym_c.get()
}

///|
/// COP_ADD_I_SYM
fn step_195() -> Unit raise {
  cop_add_i_sym_c.set(cop_arith(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], op + I == I + op")))
}

///|
let cop_add_i_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_ADD_I_SYM")

///|
/// `COP_ADD_I_SYM`
pub fn cop_add_i_sym() -> @kernel.Thm {
  cop_add_i_sym_c.get()
}

///|
/// COP_I_SCALAR
fn step_196() -> Unit raise {
  cop_i_scalar_c.set(cop_arith(@term_syntax.parse_term("((x : (_) -> Cart[Real, Tybit0[Unit]]) => cfun_smul((a : Cart[Real, Tybit0[Unit]]), x)) == cop_smul(a, I)")))
}

///|
let cop_i_scalar_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_I_SCALAR")

///|
/// `COP_I_SCALAR`
pub fn cop_i_scalar() -> @kernel.Thm {
  cop_i_scalar_c.get()
}

///|
/// COP_MUL_THM
fn step_197() -> Unit raise {
  cop_mul_thm_c.set(cop_arith(@term_syntax.parse_term("∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], cop_mul(op1, op2, x) == op1(op2(x))")))
}

///|
let cop_mul_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_MUL_THM")

///|
/// `COP_MUL_THM`
pub fn cop_mul_thm() -> @kernel.Thm {
  cop_mul_thm_c.get()
}

///|
/// COP_SMUL_LNEG
fn step_198() -> Unit raise {
  cop_smul_lneg_c.set(cop_arith(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], cop_smul(-a, op) == -cop_smul(a, op)")))
}

///|
let cop_smul_lneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_SMUL_LNEG")

///|
/// `COP_SMUL_LNEG`
pub fn cop_smul_lneg() -> @kernel.Thm {
  cop_smul_lneg_c.get()
}

///|
/// COP_SMUL_RNEG
fn step_199() -> Unit raise {
  cop_smul_rneg_c.set(cop_arith(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], cop_smul(a, -op) == -cop_smul(a, op)")))
}

///|
let cop_smul_rneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_SMUL_RNEG")

///|
/// `COP_SMUL_RNEG`
pub fn cop_smul_rneg() -> @kernel.Thm {
  cop_smul_rneg_c.get()
}

///|
/// COP_SUB
fn step_200() -> Unit raise {
  cop_sub_v1_c.set(cop_arith(@term_syntax.parse_term("∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], op1 - op2 == op1 + -op2")))
}

///|
let cop_sub_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_SUB")

///|
/// `COP_SUB`
pub fn cop_sub_v1() -> @kernel.Thm {
  cop_sub_v1_c.get()
}

///|
/// COP_SUB_NEG
fn step_201() -> Unit raise {
  cop_sub_neg_c.set(cop_arith(@term_syntax.parse_term("∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], op1 - op2 == op1 + -op2")))
}

///|
let cop_sub_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_SUB_NEG")

///|
/// `COP_SUB_NEG`
pub fn cop_sub_neg() -> @kernel.Thm {
  cop_sub_neg_c.get()
}

///|
/// COP_NEG_NEG
fn step_202() -> Unit raise {
  cop_neg_neg_c.set(cop_arith(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], --op == op")))
}

///|
let cop_neg_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_NEG_NEG")

///|
/// `COP_NEG_NEG`
pub fn cop_neg_neg() -> @kernel.Thm {
  cop_neg_neg_c.get()
}

///|
/// COP_NEG_ADD
fn step_203() -> Unit raise {
  cop_neg_add_c.set(cop_arith(@term_syntax.parse_term("∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], -(op1 + op2) == -op1 + -op2")))
}

///|
let cop_neg_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_NEG_ADD")

///|
/// `COP_NEG_ADD`
pub fn cop_neg_add() -> @kernel.Thm {
  cop_neg_add_c.get()
}

///|
/// COP_NEG_SUB
fn step_204() -> Unit raise {
  cop_neg_sub_c.set(cop_arith(@term_syntax.parse_term("∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], -(op1 - op2) == -op1 + op2")))
}

///|
let cop_neg_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_NEG_SUB")

///|
/// `COP_NEG_SUB`
pub fn cop_neg_sub() -> @kernel.Thm {
  cop_neg_sub_c.get()
}

///|
/// COP_NEG_CLAUSES
fn step_205() -> Unit raise {
  cop_neg_clauses_c.set(@utils.conjs(@list.List([cop_neg_neg(), cop_neg_add(), cop_neg_sub(), cop_sub_v1(), cop_sub_neg()])))
}

///|
let cop_neg_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_NEG_CLAUSES")

///|
/// `COP_NEG_CLAUSES`
pub fn cop_neg_clauses() -> @kernel.Thm {
  cop_neg_clauses_c.get()
}

///|
/// COP_SMUL_ASSOC
fn step_206() -> Unit raise {
  cop_smul_assoc_c.set(cop_arith(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ∀ b : Cart[Real, Tybit0[Unit]], ∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], cop_smul(a, cop_smul(b, op)) == cop_smul(a * b, op)")))
}

///|
let cop_smul_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_SMUL_ASSOC")

///|
/// `COP_SMUL_ASSOC`
pub fn cop_smul_assoc() -> @kernel.Thm {
  cop_smul_assoc_c.get()
}

///|
/// COP_SMUL_SYM
fn step_207() -> Unit raise {
  cop_smul_sym_c.set(cop_arith(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ∀ b : Cart[Real, Tybit0[Unit]], ∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], cop_smul(a, cop_smul(b, op)) == cop_smul(b, cop_smul(a, op))")))
}

///|
let cop_smul_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_SMUL_SYM")

///|
/// `COP_SMUL_SYM`
pub fn cop_smul_sym() -> @kernel.Thm {
  cop_smul_sym_c.get()
}

///|
/// COP_MUL_LSMUL
fn step_208() -> Unit raise {
  cop_mul_lsmul_c.set(cop_arith(@term_syntax.parse_term("∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], cop_mul(cop_smul((a : Cart[Real, Tybit0[Unit]]), op1), op2) == cop_smul(a, cop_mul(op1, op2))")))
}

///|
let cop_mul_lsmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_MUL_LSMUL")

///|
/// `COP_MUL_LSMUL`
pub fn cop_mul_lsmul() -> @kernel.Thm {
  cop_mul_lsmul_c.get()
}

///|
/// COP_ADD_LDISTRIB
fn step_209() -> Unit raise {
  cop_add_ldistrib_c.set(cop_arith(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], cop_smul(a, op1 + op2) == cop_smul(a, op1) + cop_smul(a, op2)")))
}

///|
let cop_add_ldistrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_ADD_LDISTRIB")

///|
/// `COP_ADD_LDISTRIB`
pub fn cop_add_ldistrib() -> @kernel.Thm {
  cop_add_ldistrib_c.get()
}

///|
/// COP_ADD_RDISTRIB
fn step_210() -> Unit raise {
  cop_add_rdistrib_c.set(cop_arith(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ∀ b : Cart[Real, Tybit0[Unit]], ∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], cop_smul(a + b, op) == cop_smul(a, op) + cop_smul(b, op)")))
}

///|
let cop_add_rdistrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_ADD_RDISTRIB")

///|
/// `COP_ADD_RDISTRIB`
pub fn cop_add_rdistrib() -> @kernel.Thm {
  cop_add_rdistrib_c.get()
}

///|
/// COP_SMUL_INV_ID
fn step_211() -> Unit raise {
  cop_smul_inv_id_c.set(cop_arith(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], !(a == Cx(real_of_num(0))) → cop_smul(a, cop_smul(inv(a), op)) == op")))
}

///|
let cop_smul_inv_id_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_SMUL_INV_ID")

///|
/// `COP_SMUL_INV_ID`
pub fn cop_smul_inv_id() -> @kernel.Thm {
  cop_smul_inv_id_c.get()
}

///|
/// COP_SUB_LDISTRIB
fn step_212() -> Unit raise {
  cop_sub_ldistrib_c.set(cop_arith(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ∀ x : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ y : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], cop_smul(a, x - y) == cop_smul(a, x) - cop_smul(a, y)")))
}

///|
let cop_sub_ldistrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_SUB_LDISTRIB")

///|
/// `COP_SUB_LDISTRIB`
pub fn cop_sub_ldistrib() -> @kernel.Thm {
  cop_sub_ldistrib_c.get()
}

///|
/// COP_SUB_RADD
fn step_213() -> Unit raise {
  cop_sub_radd_c.set(cop_arith(@term_syntax.parse_term("∀ x : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ y : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ z : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], x - (y + z) == x - y - z")))
}

///|
let cop_sub_radd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_SUB_RADD")

///|
/// `COP_SUB_RADD`
pub fn cop_sub_radd() -> @kernel.Thm {
  cop_sub_radd_c.get()
}

///|
/// COP_ADD_RSUB
fn step_214() -> Unit raise {
  cop_add_rsub_c.set(cop_arith(@term_syntax.parse_term("∀ x : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ y : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ z : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], x + (y - z) == x + y - z")))
}

///|
let cop_add_rsub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_ADD_RSUB")

///|
/// `COP_ADD_RSUB`
pub fn cop_add_rsub() -> @kernel.Thm {
  cop_add_rsub_c.get()
}

///|
/// COP_SUB_SUB
fn step_215() -> Unit raise {
  cop_sub_sub_c.set(cop_arith(@term_syntax.parse_term("∀ x : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ y : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ z : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], x - (y - z) == x - y + z")))
}

///|
let cop_sub_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_SUB_SUB")

///|
/// `COP_SUB_SUB`
pub fn cop_sub_sub() -> @kernel.Thm {
  cop_sub_sub_c.get()
}

///|
/// COP_ADD_SYM
fn step_216() -> Unit raise {
  cop_add_sym_c.set(cop_arith(@term_syntax.parse_term("∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], op1 + op2 == op2 + op1")))
}

///|
let cop_add_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_ADD_SYM")

///|
/// `COP_ADD_SYM`
pub fn cop_add_sym() -> @kernel.Thm {
  cop_add_sym_c.get()
}

///|
/// COP_ADD_ASSOC
fn step_217() -> Unit raise {
  cop_add_assoc_c.set(cop_arith(@term_syntax.parse_term("∀ x : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ y : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ z : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], x + y + z == x + (y + z)")))
}

///|
let cop_add_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_ADD_ASSOC")

///|
/// `COP_ADD_ASSOC`
pub fn cop_add_assoc() -> @kernel.Thm {
  cop_add_assoc_c.get()
}

///|
/// COP_ADD_AC
fn step_218() -> Unit raise {
  cop_add_ac_c.set(cop_arith(@term_syntax.parse_term("∀ m : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ n : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ p : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], m + n == n + m && m + n + p == m + (n + p) && m + (n + p) == n + (m + p)")))
}

///|
let cop_add_ac_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_ADD_AC")

///|
/// `COP_ADD_AC`
pub fn cop_add_ac() -> @kernel.Thm {
  cop_add_ac_c.get()
}

///|
/// COP_MUL_ASSOC
fn step_219() -> Unit raise {
  cop_mul_assoc_c.set(cop_arith(@term_syntax.parse_term("∀ x : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ y : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ z : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], cop_mul(cop_mul(x, y), z) == cop_mul(x, cop_mul(y, z))")))
}

///|
let cop_mul_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_MUL_ASSOC")

///|
/// `COP_MUL_ASSOC`
pub fn cop_mul_assoc() -> @kernel.Thm {
  cop_mul_assoc_c.get()
}

///|
/// COP_SUB_ADD
fn step_220() -> Unit raise {
  cop_sub_add_c.set(cop_arith(@term_syntax.parse_term("∀ x : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ y : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ z : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], x - y + z == x + z - y")))
}

///|
let cop_sub_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_SUB_ADD")

///|
/// `COP_SUB_ADD`
pub fn cop_sub_add() -> @kernel.Thm {
  cop_sub_add_c.get()
}

///|
/// COP_NEG_INJ
fn step_221() -> Unit raise {
  cop_neg_inj_c.set(cop_arith(@term_syntax.parse_term("∀ x : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ y : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], (-x == -y) == (x == y)")))
}

///|
let cop_neg_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_NEG_INJ")

///|
/// `COP_NEG_INJ`
pub fn cop_neg_inj() -> @kernel.Thm {
  cop_neg_inj_c.get()
}

///|
/// COP_EQ_ADD_LCANCEL
fn step_222() -> Unit raise {
  cop_eq_add_lcancel_c.set(cop_arith(@term_syntax.parse_term("∀ x : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ y : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ z : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], (x + y == x + z) == (y == z)")))
}

///|
let cop_eq_add_lcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_EQ_ADD_LCANCEL")

///|
/// `COP_EQ_ADD_LCANCEL`
pub fn cop_eq_add_lcancel() -> @kernel.Thm {
  cop_eq_add_lcancel_c.get()
}

///|
/// COP_EQ_ADD_RCANCEL
fn step_223() -> Unit raise {
  cop_eq_add_rcancel_c.set(cop_arith(@term_syntax.parse_term("∀ x : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ y : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ z : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], (x + z == y + z) == (x == y)")))
}

///|
let cop_eq_add_rcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_EQ_ADD_RCANCEL")

///|
/// `COP_EQ_ADD_RCANCEL`
pub fn cop_eq_add_rcancel() -> @kernel.Thm {
  cop_eq_add_rcancel_c.get()
}

///|
/// COP_EQ_SUB_LCANCEL
fn step_224() -> Unit raise {
  cop_eq_sub_lcancel_c.set(cop_arith(@term_syntax.parse_term("∀ x : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ y : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ z : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], (x - y == x - z) == (y == z)")))
}

///|
let cop_eq_sub_lcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_EQ_SUB_LCANCEL")

///|
/// `COP_EQ_SUB_LCANCEL`
pub fn cop_eq_sub_lcancel() -> @kernel.Thm {
  cop_eq_sub_lcancel_c.get()
}

///|
/// COP_EQ_LSUB
fn step_225() -> Unit raise {
  cop_eq_lsub_c.set(cop_arith(@term_syntax.parse_term("∀ x : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ y : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ z : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], (x - y == z) == (x == z + y)")))
}

///|
let cop_eq_lsub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_EQ_LSUB")

///|
/// `COP_EQ_LSUB`
pub fn cop_eq_lsub() -> @kernel.Thm {
  cop_eq_lsub_c.get()
}

///|
/// COP_EQ_RSUB
fn step_226() -> Unit raise {
  cop_eq_rsub_c.set(cop_arith(@term_syntax.parse_term("∀ x : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ y : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ z : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], (x == y - z) == (x + z == y)")))
}

///|
let cop_eq_rsub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_EQ_RSUB")

///|
/// `COP_EQ_RSUB`
pub fn cop_eq_rsub() -> @kernel.Thm {
  cop_eq_rsub_c.get()
}

///|
/// COP_MUL_LZERO
fn step_227() -> Unit raise {
  cop_mul_lzero_c.set(cop_arith(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], (cop_mul : (((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]])((cop_zero : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]]), op) == (cop_zero : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]])")))
}

///|
let cop_mul_lzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_MUL_LZERO")

///|
/// `COP_MUL_LZERO`
pub fn cop_mul_lzero() -> @kernel.Thm {
  cop_mul_lzero_c.get()
}

///|
/// COP_SUB_REFL
fn step_228() -> Unit raise {
  cop_sub_refl_c.set(cop_arith(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], op - op == cop_zero")))
}

///|
let cop_sub_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_SUB_REFL")

///|
/// `COP_SUB_REFL`
pub fn cop_sub_refl() -> @kernel.Thm {
  cop_sub_refl_c.get()
}

///|
/// COP_SMUL_LID_NEG
fn step_229() -> Unit raise {
  cop_smul_lid_neg_c.set(cop_arith(@term_syntax.parse_term("∀ x : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], cop_smul(-Cx(real_of_num(1)), x) == -x")))
}

///|
let cop_smul_lid_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_SMUL_LID_NEG")

///|
/// `COP_SMUL_LID_NEG`
pub fn cop_smul_lid_neg() -> @kernel.Thm {
  cop_smul_lid_neg_c.get()
}

///|
/// COP_ADD_RID
fn step_230() -> Unit raise {
  cop_add_rid_c.set(cop_arith(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], op + cop_zero == op")))
}

///|
let cop_add_rid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_ADD_RID")

///|
/// `COP_ADD_RID`
pub fn cop_add_rid() -> @kernel.Thm {
  cop_add_rid_c.get()
}

///|
/// COP_ADD_LID
fn step_231() -> Unit raise {
  cop_add_lid_c.set(cop_arith(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], cop_zero + op == op")))
}

///|
let cop_add_lid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_ADD_LID")

///|
/// `COP_ADD_LID`
pub fn cop_add_lid() -> @kernel.Thm {
  cop_add_lid_c.get()
}

///|
/// COP_SMUL_LID
fn step_232() -> Unit raise {
  cop_smul_lid_c.set(cop_arith(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], cop_smul(Cx(real_of_num(1)), op) == op")))
}

///|
let cop_smul_lid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_SMUL_LID")

///|
/// `COP_SMUL_LID`
pub fn cop_smul_lid() -> @kernel.Thm {
  cop_smul_lid_c.get()
}

///|
/// COP_SMUL_RZERO
fn step_233() -> Unit raise {
  cop_smul_rzero_c.set(cop_arith(@term_syntax.parse_term("∀ op : _, (cop_smul : (Cart[Real, Tybit0[Unit]], ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]])((a : Cart[Real, Tybit0[Unit]]), (cop_zero : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]])) == (cop_zero : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]])")))
}

///|
let cop_smul_rzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_SMUL_RZERO")

///|
/// `COP_SMUL_RZERO`
pub fn cop_smul_rzero() -> @kernel.Thm {
  cop_smul_rzero_c.get()
}

///|
/// COP_SUB_LZERO
fn step_234() -> Unit raise {
  cop_sub_lzero_c.set(cop_arith(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], cop_zero - op == -op")))
}

///|
let cop_sub_lzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_SUB_LZERO")

///|
/// `COP_SUB_LZERO`
pub fn cop_sub_lzero() -> @kernel.Thm {
  cop_sub_lzero_c.get()
}

///|
/// COP_SUB_RZERO
fn step_235() -> Unit raise {
  cop_sub_rzero_c.set(cop_arith(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], op - cop_zero == op")))
}

///|
let cop_sub_rzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_SUB_RZERO")

///|
/// `COP_SUB_RZERO`
pub fn cop_sub_rzero() -> @kernel.Thm {
  cop_sub_rzero_c.get()
}

///|
/// COP_SMUL_LZERO
fn step_236() -> Unit raise {
  cop_smul_lzero_c.set(cop_arith(@term_syntax.parse_term("∀ x : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], cop_smul(Cx(real_of_num(0)), x) == cop_zero")))
}

///|
let cop_smul_lzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_SMUL_LZERO")

///|
/// `COP_SMUL_LZERO`
pub fn cop_smul_lzero() -> @kernel.Thm {
  cop_smul_lzero_c.get()
}

///|
/// COP_ZERO_CLAUSES
fn step_237() -> Unit raise {
  cop_zero_clauses_c.set(@utils.conjs(@list.List([cop_mul_lzero(), cop_sub_refl(), cop_add_rid(), cop_add_lid(), cop_smul_rzero()])))
}

///|
let cop_zero_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_ZERO_CLAUSES")

///|
/// `COP_ZERO_CLAUSES`
pub fn cop_zero_clauses() -> @kernel.Thm {
  cop_zero_clauses_c.get()
}

///|
/// COP_ADD_MUL_RDISTRIB
fn step_238() -> Unit raise {
  cop_add_mul_rdistrib_c.set(cop_arith(@term_syntax.parse_term("∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op3 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], cop_mul(op1 + op2, op3) == cop_mul(op1, op3) + cop_mul(op2, op3)")))
}

///|
let cop_add_mul_rdistrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_ADD_MUL_RDISTRIB")

///|
/// `COP_ADD_MUL_RDISTRIB`
pub fn cop_add_mul_rdistrib() -> @kernel.Thm {
  cop_add_mul_rdistrib_c.get()
}

///|
/// COP_SUB_MUL_RDISTRIB
fn step_239() -> Unit raise {
  cop_sub_mul_rdistrib_c.set(cop_arith(@term_syntax.parse_term("∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op3 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], cop_mul(op1 - op2, op3) == cop_mul(op1, op3) - cop_mul(op2, op3)")))
}

///|
let cop_sub_mul_rdistrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_SUB_MUL_RDISTRIB")

///|
/// `COP_SUB_MUL_RDISTRIB`
pub fn cop_sub_mul_rdistrib() -> @kernel.Thm {
  cop_sub_mul_rdistrib_c.get()
}

///|
/// COP_EQ_LSUB_LSUB
fn step_240() -> Unit raise {
  cop_eq_lsub_lsub_c.set(cop_arith(@term_syntax.parse_term("∀ x : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ y : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ z : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], (x - y == z) == (x - z == y)")))
}

///|
let cop_eq_lsub_lsub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_EQ_LSUB_LSUB")

///|
/// `COP_EQ_LSUB_LSUB`
pub fn cop_eq_lsub_lsub() -> @kernel.Thm {
  cop_eq_lsub_lsub_c.get()
}

///|
/// COP_EQ_LSMUL
fn step_241() -> Unit raise {
  cop_eq_lsmul_c.set(cop_arith(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ∀ x : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ y : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], (cop_smul(a, x) == cop_smul(a, y)) == (x == y || a == Cx(real_of_num(0)))")))
}

///|
let cop_eq_lsmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_EQ_LSMUL")

///|
/// `COP_EQ_LSMUL`
pub fn cop_eq_lsmul() -> @kernel.Thm {
  cop_eq_lsmul_c.get()
}

///|
/// COP_EQ_MUL_LCANCEL2
fn step_242() -> Unit raise {
  let t203 = @tactics.conv_tac(@complexes.complex_field)
  let t202 = @tactics.pop_assum(fn(x199 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s200 = @tactics.mp_tac(x199)
    fn(x201 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s200(x201)
    }
  })
  let t198 = @tactics.repeat_tac(@tactics.gen_tac)
  let t197 = @tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ x : _, ∀ y : _, (P : (_, _) -> Bool)(x, y) == (Q : (_, _) -> Bool)(x, y)) → (∀ x : _, ∀ y : _, P(x, y)) == (∀ x : _, ∀ y : _, Q(x, y))")))
  let t196 = @tactics.repeat_tac(@tactics.strip_tac)
  let t204 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([cop_to_cfun(), cfun_to_complex()])), t196), t197), t198), t202), t203)
  cop_eq_mul_lcancel2_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Tybit0[Unit]], ∀ y : ((B) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], ∀ z : Cart[Real, Tybit0[Unit]], ∀ t : ((B) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], !(x == Cx(real_of_num(0))) → (cop_smul(x, y) == cop_smul(z, t)) == (y == cop_smul(z / x, t))"), t204))
}

///|
let cop_eq_mul_lcancel2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_EQ_MUL_LCANCEL2")

///|
/// `COP_EQ_MUL_LCANCEL2`
pub fn cop_eq_mul_lcancel2() -> @kernel.Thm {
  cop_eq_mul_lcancel2_c.get()
}

///|
/// COP_POW_2
fn step_243() -> Unit raise {
  cop_pow_2_c.set(cop_arith(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], pow(op, 2) == cop_mul(op, op)")))
}

///|
let cop_pow_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_POW_2")

///|
/// `COP_POW_2`
pub fn cop_pow_2() -> @kernel.Thm {
  cop_pow_2_c.get()
}

///|
/// COP_POW_I
fn step_244() -> Unit raise {
  let t205 = @tactics.then_tac(@nums.induct_tac, @simp.asm_simp_tac(@list.List([cop_pow(), cop_mul_lid()])))
  cop_pow_i_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, (pow : (((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], Num, (_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]])((I : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]]), n) == (I : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]])"), t205))
}

///|
let cop_pow_i_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_POW_I")

///|
/// `COP_POW_I`
pub fn cop_pow_i() -> @kernel.Thm {
  cop_pow_i_c.get()
}

///|
/// COP_POW_ZERO
fn step_245() -> Unit raise {
  let t206 = @tactics.then_tac(@nums.induct_tac, @meson.asm_meson_tac(@list.List([cop_pow(), @arith.add_clauses(), @arith.add1(), cop_mul_lzero(), cop_mul_rid()])))
  cop_pow_zero_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, (pow : (((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], Num, (_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]])((cop_zero : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]]), n + 1) == (cop_zero : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]])"), t206))
}

///|
let cop_pow_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_POW_ZERO")

///|
/// `COP_POW_ZERO`
pub fn cop_pow_zero() -> @kernel.Thm {
  cop_pow_zero_c.get()
}

///|
/// COP_POW_COMMUTE_N
fn step_246() -> Unit raise {
  let t208 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(cop_pow()), cop_mul_assoc()]))
  let t207 = @simp.asm_rewrite_tac(@list.List([cop_pow(), @equal.gsym(cop_mul_assoc()), cop_mul_lid(), cop_mul_rid()]))
  let t209 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), @nums.induct_tac), t207), t208)
  cop_pow_commute_n_c.set(@tactics.prove(@term_syntax.parse_term("∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], cop_mul(op1, op2) == cop_mul(op2, op1) → (∀ n : Num, cop_mul(op1, pow(op2, n)) == cop_mul(pow(op2, n), op1))"), t209))
}

///|
let cop_pow_commute_n_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_POW_COMMUTE_N")

///|
/// `COP_POW_COMMUTE_N`
pub fn cop_pow_commute_n() -> @kernel.Thm {
  cop_pow_commute_n_c.get()
}

///|
/// COP_ADD_2
fn step_247() -> Unit raise {
  cop_add_2_c.set(cop_arith(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], cop_smul(Cx(real_of_num(2)), op) == op + op")))
}

///|
let cop_add_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_ADD_2")

///|
/// `COP_ADD_2`
pub fn cop_add_2() -> @kernel.Thm {
  cop_add_2_c.get()
}

///|
/// is_linear_cop
fn step_248() -> Unit raise {
  is_linear_cop_c.set(@pair.new_definition(@term_syntax.parse_term("(is_linear_cop : (((B) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]]) -> Bool)((op : ((B) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]])) == (∀ x : (B) -> Cart[Real, Tybit0[Unit]], ∀ y : (B) -> Cart[Real, Tybit0[Unit]], op(x + y) == op(x) + op(y) && (∀ a : Cart[Real, Tybit0[Unit]], op(cfun_smul(a, x)) == cfun_smul(a, op(x))))")))
}

///|
let is_linear_cop_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_linear_cop")

///|
/// `is_linear_cop`
pub fn is_linear_cop() -> @kernel.Thm {
  is_linear_cop_c.get()
}

///|
/// LINCOP_ADD
fn step_249() -> Unit raise {
  let t210 = @simp.simp_tac(@list.List([is_linear_cop()]))
  lincop_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ y : (_) -> Cart[Real, Tybit0[Unit]], ∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], is_linear_cop(op) → op(x + y) == op(x) + op(y)"), t210))
}

///|
let lincop_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINCOP_ADD")

///|
/// `LINCOP_ADD`
pub fn lincop_add() -> @kernel.Thm {
  lincop_add_c.get()
}

///|
/// LINCOP_SMUL
fn step_250() -> Unit raise {
  let t211 = @simp.simp_tac(@list.List([is_linear_cop()]))
  lincop_smul_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], is_linear_cop(op) → op(cfun_smul(a, x)) == cfun_smul(a, op(x))"), t211))
}

///|
let lincop_smul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINCOP_SMUL")

///|
/// `LINCOP_SMUL`
pub fn lincop_smul() -> @kernel.Thm {
  lincop_smul_c.get()
}

///|
/// LINCOP_SUB
fn step_251() -> Unit raise {
  let t212 = @simp.simp_tac(@list.List([is_linear_cop(), cfun_sub_neg(), @equal.gsym(cfun_smul_lid_neg())]))
  lincop_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ y : (_) -> Cart[Real, Tybit0[Unit]], ∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], is_linear_cop(op) → op(x - y) == op(x) - op(y)"), t212))
}

///|
let lincop_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINCOP_SUB")

///|
/// `LINCOP_SUB`
pub fn lincop_sub() -> @kernel.Thm {
  lincop_sub_c.get()
}

///|
/// LINCOP_MUL_RSMUL
fn step_252() -> Unit raise {
  let t213 = @simp.simp_tac(@list.List([is_linear_cop(), cop_to_cfun()]))
  lincop_mul_rsmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], is_linear_cop(op2) → cop_mul(op2, cop_smul(a, op1)) == cop_smul(a, cop_mul(op2, op1))"), t213))
}

///|
let lincop_mul_rsmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINCOP_MUL_RSMUL")

///|
/// `LINCOP_MUL_RSMUL`
pub fn lincop_mul_rsmul() -> @kernel.Thm {
  lincop_mul_rsmul_c.get()
}

///|
/// LINCOP_SMUL_CLAUSES
fn step_253() -> Unit raise {
  lincop_smul_clauses_c.set(@utils.conjs(@list.List([lincop_mul_rsmul(), cop_add_ldistrib(), cop_sub_ldistrib(), cop_mul_lsmul(), cop_mul_assoc(), cop_mul_lid()])))
}

///|
let lincop_smul_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINCOP_SMUL_CLAUSES")

///|
/// `LINCOP_SMUL_CLAUSES`
pub fn lincop_smul_clauses() -> @kernel.Thm {
  lincop_smul_clauses_c.get()
}

///|
/// LINCOP_MUL_RMUL
fn step_254() -> Unit raise {
  let t214 = @simp.simp_tac(@list.List([is_linear_cop(), cop_to_cfun()]))
  lincop_mul_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], is_linear_cop(op2) → cop_mul(op2, cop_smul((a : Cart[Real, Tybit0[Unit]]), op1)) == cop_smul(a, cop_mul(op2, op1))"), t214))
}

///|
let lincop_mul_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINCOP_MUL_RMUL")

///|
/// `LINCOP_MUL_RMUL`
pub fn lincop_mul_rmul() -> @kernel.Thm {
  lincop_mul_rmul_c.get()
}

///|
/// LINCOP_ADD_MUL_LDISTRIB
fn step_255() -> Unit raise {
  let t215 = @simp.simp_tac(@list.List([is_linear_cop(), cop_to_cfun()]))
  lincop_add_mul_ldistrib_c.set(@tactics.prove(@term_syntax.parse_term("∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op3 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], is_linear_cop(op3) → cop_mul(op3, op1 + op2) == cop_mul(op3, op1) + cop_mul(op3, op2)"), t215))
}

///|
let lincop_add_mul_ldistrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINCOP_ADD_MUL_LDISTRIB")

///|
/// `LINCOP_ADD_MUL_LDISTRIB`
pub fn lincop_add_mul_ldistrib() -> @kernel.Thm {
  lincop_add_mul_ldistrib_c.get()
}

///|
/// LINCOP_SUB_MUL_LDISTRIB
fn step_256() -> Unit raise {
  let t216 = @simp.simp_tac(@list.List([is_linear_cop(), cop_to_cfun(), lincop_sub()]))
  lincop_sub_mul_ldistrib_c.set(@tactics.prove(@term_syntax.parse_term("∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op3 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], is_linear_cop(op3) → cop_mul(op3, op1 - op2) == cop_mul(op3, op1) - cop_mul(op3, op2)"), t216))
}

///|
let lincop_sub_mul_ldistrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINCOP_SUB_MUL_LDISTRIB")

///|
/// `LINCOP_SUB_MUL_LDISTRIB`
pub fn lincop_sub_mul_ldistrib() -> @kernel.Thm {
  lincop_sub_mul_ldistrib_c.get()
}

///|
/// LINCOP_MUL_DISTRIB_CLAUSES
fn step_257() -> Unit raise {
  lincop_mul_distrib_clauses_c.set(@utils.conjs(@list.List([cop_add_mul_rdistrib(), cop_sub_mul_rdistrib(), lincop_add_mul_ldistrib(), lincop_sub_mul_ldistrib()])))
}

///|
let lincop_mul_distrib_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINCOP_MUL_DISTRIB_CLAUSES")

///|
/// `LINCOP_MUL_DISTRIB_CLAUSES`
pub fn lincop_mul_distrib_clauses() -> @kernel.Thm {
  lincop_mul_distrib_clauses_c.get()
}

///|
/// LINCOP_CFUN_ZERO
fn step_258() -> Unit raise {
  let t217 = @meson.meson_tac(@list.List([is_linear_cop(), cfun_smul_lzero()]))
  lincop_cfun_zero_c.set(@tactics.prove(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], is_linear_cop(op) → op(cfun_zero) == cfun_zero"), t217))
}

///|
let lincop_cfun_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINCOP_CFUN_ZERO")

///|
/// `LINCOP_CFUN_ZERO`
pub fn lincop_cfun_zero() -> @kernel.Thm {
  lincop_cfun_zero_c.get()
}

///|
/// COP_POW_SMUL
fn step_259() -> Unit raise {
  let t219 = @simp.asm_rewrite_tac(@list.List([cop_to_cfun(), @complexes.complex_pow()]))
  let t218 = @tactics.repeat_tac(@tactics.orelse_tac(@nums.induct_tac, @tactics.strip_tac))
  let t220 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([is_linear_cop()])), t218), t219), cfun_arith_tac)
  cop_pow_smul_c.set(@tactics.prove(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], is_linear_cop(op) → (∀ n : Num, ∀ a : Cart[Real, Tybit0[Unit]], pow(cop_smul(a, op), n) == cop_smul(pow(a, n), pow(op, n)))"), t220))
}

///|
let cop_pow_smul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_POW_SMUL")

///|
/// `COP_POW_SMUL`
pub fn cop_pow_smul() -> @kernel.Thm {
  cop_pow_smul_c.get()
}

///|
/// COP_POW_SMUL2
fn step_260() -> Unit raise {
  let t221 = @meson.meson_tac(@list.List([cop_pow_smul()]))
  cop_pow_smul2_c.set(@tactics.prove(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ n : Num, ∀ a : Cart[Real, Tybit0[Unit]], is_linear_cop(op) → pow(cop_smul(a, op), n) == cop_smul(pow(a, n), pow(op, n))"), t221))
}

///|
let cop_pow_smul2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_POW_SMUL2")

///|
/// `COP_POW_SMUL2`
pub fn cop_pow_smul2() -> @kernel.Thm {
  cop_pow_smul2_c.get()
}

///|
/// ADD_LINCOP
fn step_261() -> Unit raise {
  let t222 = @tactics.repeat_tac(@tactics.strip_tac)
  let t223 = @tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([is_linear_cop(), cop_to_cfun()])), t222), cop_arith_tac)
  add_lincop_c.set(@tactics.prove(@term_syntax.parse_term("∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], is_linear_cop(op1) && is_linear_cop(op2) → is_linear_cop(op1 + op2)"), t223))
}

///|
let add_lincop_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ADD_LINCOP")

///|
/// `ADD_LINCOP`
pub fn add_lincop() -> @kernel.Thm {
  add_lincop_c.get()
}

///|
/// SUB_LINCOP
fn step_262() -> Unit raise {
  let t224 = @tactics.repeat_tac(@tactics.strip_tac)
  let t225 = @tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([is_linear_cop(), cop_to_cfun()])), t224), cop_arith_tac)
  sub_lincop_c.set(@tactics.prove(@term_syntax.parse_term("∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], is_linear_cop(op1) && is_linear_cop(op2) → is_linear_cop(op1 - op2)"), t225))
}

///|
let sub_lincop_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUB_LINCOP")

///|
/// `SUB_LINCOP`
pub fn sub_lincop() -> @kernel.Thm {
  sub_lincop_c.get()
}

///|
/// SMUL_LINCOP
fn step_263() -> Unit raise {
  let t226 = @tactics.repeat_tac(@tactics.strip_tac)
  let t227 = @tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([is_linear_cop(), cop_to_cfun()])), t226), cop_arith_tac)
  smul_lincop_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], is_linear_cop(op) → is_linear_cop(cop_smul(a, op))"), t227))
}

///|
let smul_lincop_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SMUL_LINCOP")

///|
/// `SMUL_LINCOP`
pub fn smul_lincop() -> @kernel.Thm {
  smul_lincop_c.get()
}

///|
/// MUL_LINCOP
fn step_264() -> Unit raise {
  let t228 = @tactics.repeat_tac(@tactics.strip_tac)
  let t229 = @tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([is_linear_cop(), cop_to_cfun()])), t228), cop_arith_tac)
  mul_lincop_c.set(@tactics.prove(@term_syntax.parse_term("∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], is_linear_cop(op1) && is_linear_cop(op2) → is_linear_cop(cop_mul(op1, op2))"), t229))
}

///|
let mul_lincop_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MUL_LINCOP")

///|
/// `MUL_LINCOP`
pub fn mul_lincop() -> @kernel.Thm {
  mul_lincop_c.get()
}

///|
/// ARITH_LINCOP_CLAUSES
fn step_265() -> Unit raise {
  arith_lincop_clauses_c.set(@utils.conjs(@list.List([add_lincop(), sub_lincop(), smul_lincop(), mul_lincop()])))
}

///|
let arith_lincop_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ARITH_LINCOP_CLAUSES")

///|
/// `ARITH_LINCOP_CLAUSES`
pub fn arith_lincop_clauses() -> @kernel.Thm {
  arith_lincop_clauses_c.get()
}

///|
/// linearity_thms
fn step_266() -> Unit raise {
  linearity_thms_c.set(Ref::{ val: @list.List([]) })
}

///|
let linearity_thms_c : @lib.Cell[Ref[@list.List[@kernel.Thm]]] = @lib.Cell::new("linearity_thms")

///|
/// `linearity_thms`
pub fn linearity_thms() -> Ref[@list.List[@kernel.Thm]] {
  linearity_thms_c.get()
}

///|
/// `add_linearity_thm`
pub fn add_linearity_thm(x230 : @kernel.Thm) -> Unit raise {
  let thm = x230
  let thm_1 = @utils.gimp_imp_v1(thm)
  {
    linearity_thms().val = (linearity_thms().val).prepend(thm_1)
    ()
  }
  let eta_thm = @simp.simp_rule(@list.List([@class.eta_ax()]))(thm_1)
  if !@basics.equals_thm(thm_1, eta_thm) {
    {
      linearity_thms().val = (linearity_thms().val).prepend(eta_thm)
      ()
    }
  } else {
    ()
  }
}

///|
/// add_linearity_thms
fn step_267() -> Unit raise {
  add_linearity_thms_c.set(x231 => @lib.do_list(add_linearity_thm, x231))
}

///|
let add_linearity_thms_c : @lib.Cell[(@list.List[@kernel.Thm]) -> Unit raise] = @lib.Cell::new("add_linearity_thms")

///|
/// `add_linearity_thms`
pub fn add_linearity_thms(x : @list.List[@kernel.Thm]) -> Unit raise {
  (add_linearity_thms_c.get())(x)
}

///|
/// Functionspaces/cfunspace.ml:1090
fn step_268() -> Unit raise {
  add_linearity_thms(@list.List([add_lincop(), sub_lincop(), smul_lincop(), mul_lincop(), @simp.rewrite_rule(@list.List([cop_smul()]))(smul_lincop())]))
}

///|
/// I_LINCOP
fn step_269() -> Unit raise {
  let t232 = @simp.rewrite_tac(@list.List([is_linear_cop(), @trivia.i_def()]))
  i_lincop_c.set(@tactics.prove(@term_syntax.parse_term("(is_linear_cop : (((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]]) -> Bool)((I : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]]))"), t232))
}

///|
let i_lincop_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("I_LINCOP")

///|
/// `I_LINCOP`
pub fn i_lincop() -> @kernel.Thm {
  i_lincop_c.get()
}

///|
/// COP_POW_SCALAR
fn step_270() -> Unit raise {
  let t233 = @simp.simp_tac(@list.List([cop_arith(@term_syntax.parse_term("((x : (_) -> Cart[Real, Tybit0[Unit]]) => cfun_smul((a : Cart[Real, Tybit0[Unit]]), x)) == cop_smul(a, I)")), cop_pow_smul(), i_lincop(), cop_pow_i()]))
  cop_pow_scalar_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ∀ n : Num, pow((x : (_) -> Cart[Real, Tybit0[Unit]]) => cfun_smul(a, x), n) == ((x : (_) -> Cart[Real, Tybit0[Unit]]) => cfun_smul(pow(a, n), x))"), t233))
}

///|
let cop_pow_scalar_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_POW_SCALAR")

///|
/// `COP_POW_SCALAR`
pub fn cop_pow_scalar() -> @kernel.Thm {
  cop_pow_scalar_c.get()
}

///|
/// Functionspaces/cfunspace.ml:1101
fn step_271() -> Unit raise {
  add_linearity_thms(@list.List([i_lincop(), @simp.rewrite_rule(@list.List([@trivia.i_def()]))(i_lincop())]))
}

///|
/// ZERO_LINCOP
fn step_272() -> Unit raise {
  let t234 = @tactics.then_tac(@simp.rewrite_tac(@list.List([is_linear_cop(), cop_zero_thm()])), cop_arith_tac)
  zero_lincop_c.set(@tactics.prove(@term_syntax.parse_term("(is_linear_cop : (((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]]) -> Bool)((cop_zero : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]]))"), t234))
}

///|
let zero_lincop_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ZERO_LINCOP")

///|
/// `ZERO_LINCOP`
pub fn zero_lincop() -> @kernel.Thm {
  zero_lincop_c.get()
}

///|
/// Functionspaces/cfunspace.ml:1107
fn step_273() -> Unit raise {
  add_linearity_thms(@list.List([zero_lincop()]))
}

///|
/// SCALAR_LINCOP
fn step_274() -> Unit raise {
  let t235 = @tactics.then_tac(@simp.rewrite_tac(@list.List([is_linear_cop()])), cfun_arith_tac)
  scalar_lincop_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], is_linear_cop((x : (_) -> Cart[Real, Tybit0[Unit]]) => cfun_smul(a, x))"), t235))
}

///|
let scalar_lincop_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SCALAR_LINCOP")

///|
/// `SCALAR_LINCOP`
pub fn scalar_lincop() -> @kernel.Thm {
  scalar_lincop_c.get()
}

///|
/// POW_LINCOP
fn step_275() -> Unit raise {
  let t236 = @simp.asm_simp_tac(@list.List([cop_pow(), i_lincop(), mul_lincop()]))
  let t237 = @tactics.then_tac(@tactics.repeat_tac(@tactics.orelse_tac(@nums.induct_tac, @tactics.strip_tac)), t236)
  pow_lincop_c.set(@tactics.prove(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], is_linear_cop(op) → (∀ n : Num, is_linear_cop(pow(op, n)))"), t237))
}

///|
let pow_lincop_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POW_LINCOP")

///|
/// `POW_LINCOP`
pub fn pow_lincop() -> @kernel.Thm {
  pow_lincop_c.get()
}

///|
/// Functionspaces/cfunspace.ml:1118
fn step_276() -> Unit raise {
  add_linearity_thms(@list.List([scalar_lincop(), pow_lincop()]))
}

///|
/// `LINEARITY_TAC`
pub fn linearity_tac(x238 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let g = x238
  let match_mp_tac : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise = fn(x239 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let x = x239
    fn(x240 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      let y = x240
      @tactics.match_mp_tac(x)(y)
    }
  }
  let t245 = linearity_thms().val
  let try_linearity_thm : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = @tactics.asm_tac((x244 : @list.List[@kernel.Thm]) => @tactics.map_first(fn(x241 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let x_1 = x241
    let t243 = match_mp_tac(x_1)
    @tactics.orelse_tac(@tactics.match_accept_tac(x_1), t243)
  }, x244))(t245)
  let t246 = @tactics.then_tac(@simp.asm_simp_tac(@list.List([])), @tactics.no_tac)
  let loop_ : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = @tactics.orelse_tac(@tactics.orelse_tac(try_linearity_thm, @tactics.then_tac(@simp.simp_tac(@list.List([@class.eta_ax()])), try_linearity_thm)), t246)
  let t247 = @tactics.changed_tac(@tactics.repeat_tac(@tactics.then_tac(loop_, @tactics.repeat_tac(@tactics.conj_tac))))
  @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t247)(g)
}

///|
/// is_set_linear_cop
fn step_277() -> Unit raise {
  is_set_linear_cop_c.set(@pair.new_definition(@term_syntax.parse_term("(is_set_linear_cop : (((B) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((B) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]]) -> Bool)((s : ((B) -> Cart[Real, Tybit0[Unit]]) -> Bool), (op : ((B) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]])) == (∀ x : (B) -> Cart[Real, Tybit0[Unit]], ∀ y : (B) -> Cart[Real, Tybit0[Unit]], IN(x, s) && IN(y, s) → op(x + y) == op(x) + op(y) && (∀ a : Cart[Real, Tybit0[Unit]], op(cfun_smul(a, x)) == cfun_smul(a, op(x))))")))
}

///|
let is_set_linear_cop_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_set_linear_cop")

///|
/// `is_set_linear_cop`
pub fn is_set_linear_cop() -> @kernel.Thm {
  is_set_linear_cop_c.get()
}

///|
/// LINCOP_SLINCOP
fn step_278() -> Unit raise {
  let t248 = @simp.simp_tac(@list.List([is_linear_cop(), is_set_linear_cop()]))
  lincop_slincop_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], is_linear_cop(op) → is_set_linear_cop(s, op)"), t248))
}

///|
let lincop_slincop_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINCOP_SLINCOP")

///|
/// `LINCOP_SLINCOP`
pub fn lincop_slincop() -> @kernel.Thm {
  lincop_slincop_c.get()
}

///|
/// SLINCOP_SMUL
fn step_279() -> Unit raise {
  let t249 = @meson.meson_tac(@list.List([is_set_linear_cop()]))
  slincop_smul_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, IN(x, s) && is_set_linear_cop(s, op) → op(cfun_smul(a, x)) == cfun_smul(a, op(x))"), t249))
}

///|
let slincop_smul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SLINCOP_SMUL")

///|
/// `SLINCOP_SMUL`
pub fn slincop_smul() -> @kernel.Thm {
  slincop_smul_c.get()
}

///|
/// SLINCOP_ADD
fn step_280() -> Unit raise {
  let t250 = @simp.simp_tac(@list.List([is_set_linear_cop()]))
  slincop_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ y : (_) -> Cart[Real, Tybit0[Unit]], ∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, is_set_linear_cop(s, op) && IN(x, s) && IN(y, s) → op(x + y) == op(x) + op(y)"), t250))
}

///|
let slincop_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SLINCOP_ADD")

///|
/// `SLINCOP_ADD`
pub fn slincop_add() -> @kernel.Thm {
  slincop_add_c.get()
}

///|
/// SLINCOP_SUB
fn step_281() -> Unit raise {
  let t251 = @meson.meson_tac(@list.List([slincop_smul(), cfun_subspace_smul(), slincop_add(), cfun_sub_neg(), @equal.gsym(cfun_smul_lid_neg())]))
  slincop_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ y : (_) -> Cart[Real, Tybit0[Unit]], ∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, is_cfun_subspace(s) && is_set_linear_cop(s, op) && IN(x, s) && IN(y, s) → op(x - y) == op(x) - op(y)"), t251))
}

///|
let slincop_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SLINCOP_SUB")

///|
/// `SLINCOP_SUB`
pub fn slincop_sub() -> @kernel.Thm {
  slincop_sub_c.get()
}

///|
/// SLINCOP_CFUN_ZERO
fn step_282() -> Unit raise {
  let t252 = @meson.meson_tac(@list.List([slincop_smul(), cfun_smul_lzero(), cfun_subspace_zero()]))
  let t253 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(@q.spec("cfun_zero", cfun_smul_lzero()))])), t252)
  slincop_cfun_zero_c.set(@tactics.prove(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, is_set_linear_cop(s, op) && is_cfun_subspace(s) → op(cfun_zero) == cfun_zero"), t253))
}

///|
let slincop_cfun_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SLINCOP_CFUN_ZERO")

///|
/// `SLINCOP_CFUN_ZERO`
pub fn slincop_cfun_zero() -> @kernel.Thm {
  slincop_cfun_zero_c.get()
}

///|
/// Functionspaces/cfunspace.ml:1165
fn step_283() -> Unit raise {
  @preterm.new_type_abbrev("cfun_dual", @parser.parse_type("cfun->complex"))
}

///|
/// Functionspaces/cfunspace.ml:1166
fn step_284() -> Unit raise {
  @preterm.new_type_abbrev("cfun_dualB", @parser.parse_type("cfunB->complex"))
}

///|
/// cfun_dual
fn step_285() -> Unit raise {
  cfun_dual_c.set(@pair.new_definition(@term_syntax.parse_term("(cfun_dual : (((A) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((A) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]) -> Bool)((spc : ((A) -> Cart[Real, Tybit0[Unit]]) -> Bool)) == {(f : ((A) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]) | is_linear_cop(o(cfun_of_complex, f))}")))
}

///|
let cfun_dual_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cfun_dual")

///|
/// `cfun_dual`
pub fn cfun_dual() -> @kernel.Thm {
  cfun_dual_c.get()
}

///|
/// cop_transpose
fn step_286() -> Unit raise {
  cop_transpose_c.set(@pair.new_definition(@term_syntax.parse_term("(cop_transpose : (((B) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], ((A) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], (B) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]])((f : ((B) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]])) == ((phi : ((A) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]) => o(phi, f))")))
}

///|
let cop_transpose_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cop_transpose")

///|
/// `cop_transpose`
pub fn cop_transpose() -> @kernel.Thm {
  cop_transpose_c.get()
}

///|
/// commutator
fn step_287() -> Unit raise {
  commutator_c.set(@pair.new_definition(@term_syntax.parse_term("(commutator : (((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]])((op1 : ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]]), (op2 : ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]])) == cop_mul(op1, op2) - cop_mul(op2, op1)")))
}

///|
let commutator_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("commutator")

///|
/// `commutator`
pub fn commutator() -> @kernel.Thm {
  commutator_c.get()
}

///|
/// Functionspaces/cfunspace.ml:1193
fn step_288() -> Unit raise {
  @preterm.make_overloadable("com", @parser.parse_type("A->A->A"))
}

///|
/// Functionspaces/cfunspace.ml:1194
fn step_289() -> Unit raise {
  @printer.parse_as_infix("com", (24L, "left"))
}

///|
/// Functionspaces/cfunspace.ml:1195
fn step_290() -> Unit raise {
  @preterm.overload_interface("com", @term_syntax.parse_term("(commutator : (((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]])"))
}

///|
/// COMMUTATOR_NEG
fn step_291() -> Unit raise {
  let t254 = @tactics.then_tac(@simp.rewrite_tac(@list.List([commutator()])), cop_arith_tac)
  commutator_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], com(op1, op2) == -com(op2, op1)"), t254))
}

///|
let commutator_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMMUTATOR_NEG")

///|
/// `COMMUTATOR_NEG`
pub fn commutator_neg() -> @kernel.Thm {
  commutator_neg_c.get()
}

///|
/// COMMUTATOR_COMPOSIT
fn step_292() -> Unit raise {
  let t255 = @tactics.then_tac(@simp.simp_tac(@list.List([commutator(), lincop_mul_distrib_clauses(), lincop_smul_clauses(), cop_smul_assoc(), cop_sub_radd()])), cop_arith_tac)
  commutator_composit_c.set(@tactics.prove(@term_syntax.parse_term("∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ a : Cart[Real, Tybit0[Unit]], ∀ b : Cart[Real, Tybit0[Unit]], ∀ c : Cart[Real, Tybit0[Unit]], ∀ d : Cart[Real, Tybit0[Unit]], is_linear_cop(op1) && is_linear_cop(op2) → com(cop_smul(a, op1) + cop_smul(b, op2), cop_smul(c, op1) + cop_smul(d, op2)) == cop_smul(a * d, com(op1, op2)) - cop_smul(b * c, com(op1, op2))"), t255))
}

///|
let commutator_composit_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMMUTATOR_COMPOSIT")

///|
/// `COMMUTATOR_COMPOSIT`
pub fn commutator_composit() -> @kernel.Thm {
  commutator_composit_c.get()
}

///|
/// COMMUTATOR_SMUL
fn step_293() -> Unit raise {
  let t256 = @utils.spec_v(("b", "Cx(&0)"), @utils.spec_v(("c", "Cx(&0)"), commutator_composit()))
  commutator_smul_c.set(@bool.gen_all(@simp.rewrite_rule(@list.List([cop_smul_lzero(), @complexes.complex_mul_lzero(), cop_sub_rzero(), cop_add_rid(), cop_add_lid()]))(t256)))
}

///|
let commutator_smul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMMUTATOR_SMUL")

///|
/// `COMMUTATOR_SMUL`
pub fn commutator_smul() -> @kernel.Thm {
  commutator_smul_c.get()
}

///|
/// COMMUTATOR_ZERO_SYM
fn step_294() -> Unit raise {
  let t257 = @meson.meson_tac(@list.List([]))
  let t258 = @tactics.then_tac(@simp.rewrite_tac(@list.List([commutator(), cop_eq_lsub(), cop_add_lid()])), t257)
  commutator_zero_sym_c.set(@tactics.prove(@term_syntax.parse_term("∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], (com(op1, op2) == cop_zero) == (com(op2, op1) == cop_zero)"), t258))
}

///|
let commutator_zero_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMMUTATOR_ZERO_SYM")

///|
/// `COMMUTATOR_ZERO_SYM`
pub fn commutator_zero_sym() -> @kernel.Thm {
  commutator_zero_sym_c.get()
}

///|
/// COMMUTATOR_SCALAR
fn step_295() -> Unit raise {
  let t259 = @tactics.then_tac(@simp.simp_tac(@list.List([commutator(), cop_sub_abs(), cop_mul_v1(), lincop_smul()])), cop_arith_tac)
  commutator_scalar_c.set(@tactics.prove(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ a : Cart[Real, Tybit0[Unit]], is_linear_cop(op) → com(op, (x : (_) -> Cart[Real, Tybit0[Unit]]) => cfun_smul(a, x)) == cop_zero"), t259))
}

///|
let commutator_scalar_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMMUTATOR_SCALAR")

///|
/// `COMMUTATOR_SCALAR`
pub fn commutator_scalar() -> @kernel.Thm {
  commutator_scalar_c.get()
}

///|
/// COMMUTATOR_SCALAR_OP
fn step_296() -> Unit raise {
  let t260 = @tactics.then_tac(@simp.simp_tac(@list.List([commutator(), lincop_mul_rsmul()])), cop_arith_tac)
  commutator_scalar_op_c.set(@tactics.prove(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ a : Cart[Real, Tybit0[Unit]], is_linear_cop(op) → com(op, cop_smul(a, op)) == cop_zero"), t260))
}

///|
let commutator_scalar_op_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMMUTATOR_SCALAR_OP")

///|
/// `COMMUTATOR_SCALAR_OP`
pub fn commutator_scalar_op() -> @kernel.Thm {
  commutator_scalar_op_c.get()
}

///|
/// COMMUTATOR_ZERO
fn step_297() -> Unit raise {
  let t261 = @tactics.then_tac(@simp.simp_tac(@list.List([cop_zero(), k_def(), @equal.gsym(cfun_smul_lzero()), commutator(), cop_sub_abs(), cop_mul_v1(), lincop_smul()])), cop_arith_tac)
  commutator_zero_c.set(@tactics.prove(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], is_linear_cop(op) → com(op, cop_zero) == cop_zero"), t261))
}

///|
let commutator_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMMUTATOR_ZERO")

///|
/// `COMMUTATOR_ZERO`
pub fn commutator_zero() -> @kernel.Thm {
  commutator_zero_c.get()
}

///|
/// LINCOP_COMMUTATOR
fn step_298() -> Unit raise {
  let t262 = @tactics.repeat_tac(@tactics.strip_tac)
  let t263 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([commutator()])), t262), linearity_tac)
  lincop_commutator_c.set(@tactics.prove(@term_syntax.parse_term("∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], is_linear_cop(op1) && is_linear_cop(op2) → is_linear_cop(com(op1, op2))"), t263))
}

///|
let lincop_commutator_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINCOP_COMMUTATOR")

///|
/// `LINCOP_COMMUTATOR`
pub fn lincop_commutator() -> @kernel.Thm {
  lincop_commutator_c.get()
}

///|
/// Functionspaces/cfunspace.ml:1239
fn step_299() -> Unit raise {
  add_linearity_thm(lincop_commutator())
}

///|
/// expectation
fn step_300() -> Unit raise {
  expectation_c.set(@pair.new_definition(@term_syntax.parse_term("(expectation : (((A) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]], ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]])((inprod : ((A) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]), (f : (A) -> Cart[Real, Tybit0[Unit]]), (op : ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]])) == inprod(f, op(f))")))
}

///|
let expectation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("expectation")

///|
/// `expectation`
pub fn expectation() -> @kernel.Thm {
  expectation_c.get()
}

///|
/// deviation
fn step_301() -> Unit raise {
  deviation_c.set(@pair.new_definition(@term_syntax.parse_term("(deviation : (((A) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]], ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]])((inprod : ((A) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]), (f : (A) -> Cart[Real, Tybit0[Unit]]), (op : ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]])) == op - ((x : (A) -> Cart[Real, Tybit0[Unit]]) => cfun_smul(expectation(inprod, f, op), x))")))
}

///|
let deviation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("deviation")

///|
/// `deviation`
pub fn deviation() -> @kernel.Thm {
  deviation_c.get()
}

///|
/// DEVIATION_ALT
fn step_302() -> Unit raise {
  let t264 = @tactics.then_tac(@simp.rewrite_tac(@list.List([deviation()])), cop_arith_tac)
  deviation_alt_c.set(@tactics.prove(@term_syntax.parse_term("∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], ∀ f : (_) -> Cart[Real, Tybit0[Unit]], ∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], deviation(inprod, f, op) == op - cop_smul(expectation(inprod, f, op), I)"), t264))
}

///|
let deviation_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DEVIATION_ALT")

///|
/// `DEVIATION_ALT`
pub fn deviation_alt() -> @kernel.Thm {
  deviation_alt_c.get()
}

///|
/// LINCOP_DEVIATION
fn step_303() -> Unit raise {
  let t265 = @tactics.then_tac(@simp.rewrite_tac(@list.List([deviation(), @equal.gsym(cop_smul_v1())])), linearity_tac)
  lincop_deviation_c.set(@tactics.prove(@term_syntax.parse_term("∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], ∀ state : (_) -> Cart[Real, Tybit0[Unit]], ∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], is_linear_cop(op) → is_linear_cop(deviation(inprod, state, op))"), t265))
}

///|
let lincop_deviation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINCOP_DEVIATION")

///|
/// `LINCOP_DEVIATION`
pub fn lincop_deviation() -> @kernel.Thm {
  lincop_deviation_c.get()
}

///|
/// Functionspaces/cfunspace.ml:1256
fn step_304() -> Unit raise {
  add_linearity_thm(lincop_deviation())
}

///|
/// variance
fn step_305() -> Unit raise {
  variance_c.set(@pair.new_definition(@term_syntax.parse_term("(variance : (((A) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]], ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]])((inprod : ((A) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]), (f : (A) -> Cart[Real, Tybit0[Unit]]), (op : ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]])) == expectation(inprod, f, cop_mul(deviation(inprod, f, op), deviation(inprod, f, op)))")))
}

///|
let variance_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("variance")

///|
/// `variance`
pub fn variance() -> @kernel.Thm {
  variance_c.get()
}

///|
/// DEVIATION_COMMUTATOR
fn step_306() -> Unit raise {
  let t269 = @simp.asm_simp_tac(@list.List([lincop_mul_distrib_clauses(), cop_mul_lsmul(), cop_i_id(), lincop_mul_rmul(), @meson.meson(@list.List([cop_smul_sym()]), @term_syntax.parse_term("(f : (((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]]) -> _)(cop_smul((a : Cart[Real, Tybit0[Unit]]), cop_smul((b : Cart[Real, Tybit0[Unit]]), (op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]]))), cop_smul(b, cop_smul(a, op))) == f(cop_smul(a, cop_smul(b, op)), cop_smul(a, cop_smul(b, op)))"))]))
  let t268 = @tactics.try_tac(linearity_tac)
  let t267 = @tactics.repeat_tac(@tactics.strip_tac)
  let t266 = @impconv.imp_rewrite_tac(@list.List([lincop_sub_mul_ldistrib()]))
  let t270 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([deviation_alt(), commutator()])), t266), t267), t268), t269), cop_arith_tac)
  deviation_commutator_c.set(@tactics.prove(@term_syntax.parse_term("∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], ∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ state : (_) -> Cart[Real, Tybit0[Unit]], is_linear_cop(op1) && is_linear_cop(op2) → com(deviation(inprod, state, op1), deviation(inprod, state, op2)) == com(op1, op2)"), t270))
}

///|
let deviation_commutator_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DEVIATION_COMMUTATOR")

///|
/// `DEVIATION_COMMUTATOR`
pub fn deviation_commutator() -> @kernel.Thm {
  deviation_commutator_c.get()
}

///|
/// EXPEC_ZERO_STATE
fn step_307() -> Unit raise {
  let t271 = @meson.meson_tac(@list.List([expectation(), inprod_zero(), lincop_cfun_zero()]))
  expec_zero_state_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], ∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], is_linear_cop(op) && is_inner_space((s, inprod)) → expectation(inprod, cfun_zero, op) == Cx(real_of_num(0))"), t271))
}

///|
let expec_zero_state_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXPEC_ZERO_STATE")

///|
/// `EXPEC_ZERO_STATE`
pub fn expec_zero_state() -> @kernel.Thm {
  expec_zero_state_c.get()
}

///|
/// is_closed_by
fn step_308() -> Unit raise {
  is_closed_by_c.set(@pair.new_definition(@term_syntax.parse_term("(is_closed_by : ((_) -> Bool, (_) -> _) -> Bool)((s : (_) -> Bool), (f : (_) -> _)) == (∀ x : _, IN(x, s) → IN(f(x), s))")))
}

///|
let is_closed_by_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_closed_by")

///|
/// `is_closed_by`
pub fn is_closed_by() -> @kernel.Thm {
  is_closed_by_c.get()
}

///|
/// IS_CLOSED_BY_THM
fn step_309() -> Unit raise {
  let t272 = @simp.simp_tac(@list.List([is_closed_by()]))
  is_closed_by_thm_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : _, ∀ s : (_) -> Bool, ∀ f : (_) -> _, is_closed_by(s, f) && IN(x, s) → IN(f(x), s)"), t272))
}

///|
let is_closed_by_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IS_CLOSED_BY_THM")

///|
/// `IS_CLOSED_BY_THM`
pub fn is_closed_by_thm() -> @kernel.Thm {
  is_closed_by_thm_c.get()
}

///|
/// IS_CLOSED_BY_COMPOSE
fn step_310() -> Unit raise {
  let t273 = @meson.meson_tac(@list.List([]))
  let t274 = @tactics.then_tac(@simp.rewrite_tac(@list.List([is_closed_by(), @trivia.o_def()])), t273)
  is_closed_by_compose_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (_) -> Bool, ∀ f : (_) -> _, ∀ g : (_) -> _, is_closed_by(s, f) && is_closed_by(s, g) → is_closed_by(s, o(f, g))"), t274))
}

///|
let is_closed_by_compose_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IS_CLOSED_BY_COMPOSE")

///|
/// `IS_CLOSED_BY_COMPOSE`
pub fn is_closed_by_compose() -> @kernel.Thm {
  is_closed_by_compose_c.get()
}

///|
/// IS_CLOSED_BY_I
fn step_311() -> Unit raise {
  let t275 = @simp.rewrite_tac(@list.List([is_closed_by(), @trivia.i_thm()]))
  is_closed_by_i_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (_) -> Bool, is_closed_by(s, I)"), t275))
}

///|
let is_closed_by_i_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IS_CLOSED_BY_I")

///|
/// `IS_CLOSED_BY_I`
pub fn is_closed_by_i() -> @kernel.Thm {
  is_closed_by_i_c.get()
}

///|
/// IS_CLOSED_BY_COP_ADD
fn step_312() -> Unit raise {
  let t276 = @meson.meson_tac(@list.List([cfun_subspace_add()]))
  let t277 = @tactics.then_tac(@simp.rewrite_tac(@list.List([is_closed_by(), cop_to_cfun()])), t276)
  is_closed_by_cop_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], is_cfun_subspace(s) && is_closed_by(s, op1) && is_closed_by(s, op2) → is_closed_by(s, op1 + op2)"), t277))
}

///|
let is_closed_by_cop_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IS_CLOSED_BY_COP_ADD")

///|
/// `IS_CLOSED_BY_COP_ADD`
pub fn is_closed_by_cop_add() -> @kernel.Thm {
  is_closed_by_cop_add_c.get()
}

///|
/// IS_CLOSED_BY_COP_SUB
fn step_313() -> Unit raise {
  let t278 = @meson.meson_tac(@list.List([cfun_subspace_sub()]))
  let t279 = @tactics.then_tac(@simp.rewrite_tac(@list.List([is_closed_by(), cop_to_cfun()])), t278)
  is_closed_by_cop_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], is_cfun_subspace(s) && is_closed_by(s, op1) && is_closed_by(s, op2) → is_closed_by(s, op1 - op2)"), t279))
}

///|
let is_closed_by_cop_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IS_CLOSED_BY_COP_SUB")

///|
/// `IS_CLOSED_BY_COP_SUB`
pub fn is_closed_by_cop_sub() -> @kernel.Thm {
  is_closed_by_cop_sub_c.get()
}

///|
/// IS_CLOSED_BY_COP_MUL
fn step_314() -> Unit raise {
  let t280 = @meson.meson_tac(@list.List([]))
  let t281 = @tactics.then_tac(@simp.rewrite_tac(@list.List([is_closed_by(), cop_to_cfun()])), t280)
  is_closed_by_cop_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], is_closed_by(s, op1) && is_closed_by(s, op2) → is_closed_by(s, cop_mul(op1, op2))"), t281))
}

///|
let is_closed_by_cop_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IS_CLOSED_BY_COP_MUL")

///|
/// `IS_CLOSED_BY_COP_MUL`
pub fn is_closed_by_cop_mul() -> @kernel.Thm {
  is_closed_by_cop_mul_c.get()
}

///|
/// IS_CLOSED_SCALAR
fn step_315() -> Unit raise {
  let t282 = @simp.simp_tac(@list.List([is_closed_by(), is_cfun_subspace(), cop_to_cfun()]))
  is_closed_scalar_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ a : Cart[Real, Tybit0[Unit]], is_cfun_subspace(s) → is_closed_by(s, cop_smul(a, I))"), t282))
}

///|
let is_closed_scalar_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IS_CLOSED_SCALAR")

///|
/// `IS_CLOSED_SCALAR`
pub fn is_closed_scalar() -> @kernel.Thm {
  is_closed_scalar_c.get()
}

///|
/// IS_CLOSED_INPROD_SCALAR
fn step_316() -> Unit raise {
  is_closed_inprod_scalar_c.set(inner_space_prove("forall a. is_closed_by s (a % I)", @simp.simp_tac(@list.List([is_closed_by(), is_inner_space(), is_closed_scalar()]))))
}

///|
let is_closed_inprod_scalar_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IS_CLOSED_INPROD_SCALAR")

///|
/// `IS_CLOSED_INPROD_SCALAR`
pub fn is_closed_inprod_scalar() -> @kernel.Thm {
  is_closed_inprod_scalar_c.get()
}

///|
/// IS_CLOSED_BY_COP_SMUL
fn step_317() -> Unit raise {
  let t283 = @impconv.imp_rewrite_tac(@list.List([is_closed_by(), cop_to_cfun(), cfun_subspace_smul()]))
  is_closed_by_cop_smul_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ a : Cart[Real, Tybit0[Unit]], ∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], is_cfun_subspace(s) && is_closed_by(s, op) → is_closed_by(s, cop_smul(a, op))"), t283))
}

///|
let is_closed_by_cop_smul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IS_CLOSED_BY_COP_SMUL")

///|
/// `IS_CLOSED_BY_COP_SMUL`
pub fn is_closed_by_cop_smul() -> @kernel.Thm {
  is_closed_by_cop_smul_c.get()
}

///|
/// IS_CLOSED_BY_COMMUTATOR
fn step_318() -> Unit raise {
  let t284 = @impconv.imp_rewrite_tac(@list.List([commutator(), is_closed_by_cop_mul(), is_closed_by_cop_sub()]))
  is_closed_by_commutator_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ a : _, ∀ op : _, is_cfun_subspace(s) && is_closed_by(s, (op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]])) && is_closed_by(s, (op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]])) → is_closed_by(s, com(op1, op2))"), t284))
}

///|
let is_closed_by_commutator_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IS_CLOSED_BY_COMMUTATOR")

///|
/// `IS_CLOSED_BY_COMMUTATOR`
pub fn is_closed_by_commutator() -> @kernel.Thm {
  is_closed_by_commutator_c.get()
}

///|
/// is_hermitian
fn step_319() -> Unit raise {
  is_hermitian_c.set(@pair.new_definition(@term_syntax.parse_term("(is_hermitian : ((((A) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((A) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]), ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]]) -> Bool)(((s : ((A) -> Cart[Real, Tybit0[Unit]]) -> Bool), (inprod : ((A) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]])), (op1 : ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]]), (op2 : ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]])) == (is_inner_space((s, inprod)) → is_closed_by(s, op1) && is_closed_by(s, op2) && is_linear_cop(op1) && is_linear_cop(op2) && (∀ x : (A) -> Cart[Real, Tybit0[Unit]], ∀ y : (A) -> Cart[Real, Tybit0[Unit]], IN(x, s) && IN(y, s) → inprod(x, op1(y)) == inprod(op2(x), y)))")))
}

///|
let is_hermitian_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_hermitian")

///|
/// `is_hermitian`
pub fn is_hermitian() -> @kernel.Thm {
  is_hermitian_c.get()
}

///|
/// HERM_LINCOP
fn step_320() -> Unit raise {
  herm_lincop_c.set(full_inner_space_prove("forall op1 op2. is_hermitian is_ op1 op2 ==> is_linear_cop op1\n                /\\ is_linear_cop op2", @simp.simp_tac(@list.List([forall_inner_space_thm(), is_hermitian()]))))
}

///|
let herm_lincop_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HERM_LINCOP")

///|
/// `HERM_LINCOP`
pub fn herm_lincop() -> @kernel.Thm {
  herm_lincop_c.get()
}

///|
/// HERM_LINCOP_L
fn step_321() -> Unit raise {
  herm_lincop_l_c.set(full_inner_space_prove("forall op1 op2. is_hermitian is_ op1 op2 ==> is_linear_cop op1", @simp.simp_tac(@list.List([forall_inner_space_thm(), is_hermitian()]))))
}

///|
let herm_lincop_l_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HERM_LINCOP_L")

///|
/// `HERM_LINCOP_L`
pub fn herm_lincop_l() -> @kernel.Thm {
  herm_lincop_l_c.get()
}

///|
/// HERM_LINCOP_R
fn step_322() -> Unit raise {
  herm_lincop_r_c.set(full_inner_space_prove("forall op1 op2. is_hermitian is_ op1 op2 ==> is_linear_cop op2", @simp.simp_tac(@list.List([forall_inner_space_thm(), is_hermitian()]))))
}

///|
let herm_lincop_r_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HERM_LINCOP_R")

///|
/// `HERM_LINCOP_R`
pub fn herm_lincop_r() -> @kernel.Thm {
  herm_lincop_r_c.get()
}

///|
/// HERM_IS_CLOSED_BY_L
fn step_323() -> Unit raise {
  herm_is_closed_by_l_c.set(inner_space_prove("forall op1 op2. is_hermitian (s,inprod) op1 op2 ==> is_closed_by s op1", @simp.simp_tac(@list.List([is_hermitian()]))))
}

///|
let herm_is_closed_by_l_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HERM_IS_CLOSED_BY_L")

///|
/// `HERM_IS_CLOSED_BY_L`
pub fn herm_is_closed_by_l() -> @kernel.Thm {
  herm_is_closed_by_l_c.get()
}

///|
/// HERM_IS_CLOSED_BY_R
fn step_324() -> Unit raise {
  herm_is_closed_by_r_c.set(inner_space_prove("forall op1 op2. is_hermitian (s,inprod) op1 op2 ==> is_closed_by s op2", @simp.simp_tac(@list.List([is_hermitian()]))))
}

///|
let herm_is_closed_by_r_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HERM_IS_CLOSED_BY_R")

///|
/// `HERM_IS_CLOSED_BY_R`
pub fn herm_is_closed_by_r() -> @kernel.Thm {
  herm_is_closed_by_r_c.get()
}

///|
/// HERM_ITSELF
fn step_325() -> Unit raise {
  herm_itself_c.set(inner_space_prove("forall op1 op2 x y. is_hermitian (s,inprod) op1 op2 /\\ x IN s /\\ y IN s ==>\n   inprod x (op1 y) = inprod (op2 x) y", @simp.simp_tac(@list.List([is_hermitian()]))))
}

///|
let herm_itself_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HERM_ITSELF")

///|
/// `HERM_ITSELF`
pub fn herm_itself() -> @kernel.Thm {
  herm_itself_c.get()
}

///|
/// ADD_HERM
fn step_326() -> Unit raise {
  let t287 = @impconv.imp_rewrite_tac(@list.List([cop_to_cfun(), cfun_subspace_add(), inner_space_is_subspace(), inprod_add_ldist(), inprod_add_rdist()]))
  let t286 = @tactics.try_tac(linearity_tac)
  let t285 = @tactics.repeat_tac(@tactics.strip_tac)
  add_herm_c.set(full_inner_space_prove("forall op1 op2 op3 op4.\n    is_hermitian is_ op1 op2 /\\ is_hermitian is_ op3 op4\n    ==> is_hermitian is_ (op1+op3) (op2+op4)", @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([forall_inner_space_thm(), is_hermitian(), is_closed_by()])), @utils.simp_horn_tac), t285), t286), t287)))
}

///|
let add_herm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ADD_HERM")

///|
/// `ADD_HERM`
pub fn add_herm() -> @kernel.Thm {
  add_herm_c.get()
}

///|
/// SUB_HERM
fn step_327() -> Unit raise {
  let t290 = @impconv.imp_rewrite_tac(@list.List([cop_to_cfun(), cfun_subspace_sub(), inner_space_is_subspace(), inprod_sub_ldist(), inprod_sub_rdist()]))
  let t289 = @tactics.try_tac(linearity_tac)
  let t288 = @tactics.repeat_tac(@tactics.strip_tac)
  sub_herm_c.set(full_inner_space_prove("forall op1 op2 op3 op4.\n    is_hermitian is_ op1 op2 /\\ is_hermitian is_ op3 op4\n      ==> is_hermitian is_ (op1-op3) (op2-op4)", @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([forall_inner_space_thm(), is_hermitian(), is_closed_by()])), @utils.simp_horn_tac), t288), t289), t290)))
}

///|
let sub_herm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUB_HERM")

///|
/// `SUB_HERM`
pub fn sub_herm() -> @kernel.Thm {
  sub_herm_c.get()
}

///|
/// MUL_HERM
fn step_328() -> Unit raise {
  let t294 = @meson.asm_meson_tac(@list.List([]))
  let t293 = @simp.rewrite_tac(@list.List([cop_to_cfun(), cop_mul(), @trivia.o_def()]))
  let t292 = @tactics.try_tac(linearity_tac)
  let t291 = @tactics.repeat_tac(@tactics.strip_tac)
  mul_herm_c.set(full_inner_space_prove("forall op1 op2 op3 op4.\n    is_hermitian is_ op1 op2 /\\ is_hermitian is_ op3 op4\n      ==> is_hermitian is_ (op1**op3) (op4**op2)", @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([forall_inner_space_thm(), is_hermitian(), is_closed_by()])), @utils.simp_horn_tac), t291), t292), t293), t294)))
}

///|
let mul_herm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MUL_HERM")

///|
/// `MUL_HERM`
pub fn mul_herm() -> @kernel.Thm {
  mul_herm_c.get()
}

///|
/// SMUL_HERM
fn step_329() -> Unit raise {
  let t298 = @meson.asm_meson_tac(@list.List([@complexes.cnj_cnj()]))
  let t297 = @impconv.imp_rewrite_tac(@list.List([cop_to_cfun(), cfun_subspace_smul(), inner_space_is_subspace(), inprod_lsmul(), inprod_rsmul()]))
  let t296 = @tactics.try_tac(linearity_tac)
  let t295 = @tactics.repeat_tac(@tactics.strip_tac)
  smul_herm_c.set(full_inner_space_prove("forall a op1 op2 op3 op4.\n    is_hermitian is_ op1 op2 /\\ is_hermitian is_ op3 op4\n      ==> is_hermitian is_ (a % op1) (cnj a % op2)", @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([forall_inner_space_thm(), is_hermitian(), is_closed_by()])), @utils.simp_horn_tac), t295), t296), t297), t298)))
}

///|
let smul_herm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SMUL_HERM")

///|
/// `SMUL_HERM`
pub fn smul_herm() -> @kernel.Thm {
  smul_herm_c.get()
}

///|
/// HERMITAIN_INPROD
fn step_330() -> Unit raise {
  hermitain_inprod_c.set(inner_space_prove("forall op1 op2 op3. is_hermitian (s,inprod) op1 op2 /\\ is_closed_by s op3\n    ==> forall x y. x IN s /\\ y IN s\n      ==> inprod x ((op1 ** op3) y) = inprod (op2 x) (op3 y)", @meson.meson_tac(@list.List([herm_itself(), cop_mul_v1(), is_closed_by()]))))
}

///|
let hermitain_inprod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HERMITAIN_INPROD")

///|
/// `HERMITAIN_INPROD`
pub fn hermitain_inprod() -> @kernel.Thm {
  hermitain_inprod_c.get()
}

///|
/// ZERO_HERM
fn step_331() -> Unit raise {
  let t299 = @impconv.imp_rewrite_tac(@list.List([is_closed_by(), zero_lincop(), cop_zero_thm(), cfun_subspace_zero(), inner_space_is_subspace(), inprod_rzero(), inprod_lzero()]))
  let t300 = @tactics.then_tac(@simp.rewrite_tac(@list.List([forall_inner_space_thm(), is_hermitian()])), t299)
  zero_herm_c.set(@tactics.prove(@term_syntax.parse_term("∀ is_ : (((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]), is_hermitian(is_, cop_zero, cop_zero)"), t300))
}

///|
let zero_herm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ZERO_HERM")

///|
/// `ZERO_HERM`
pub fn zero_herm() -> @kernel.Thm {
  zero_herm_c.get()
}

///|
/// ARITH_HERM_CLAUSES
fn step_332() -> Unit raise {
  arith_herm_clauses_c.set(@utils.conjs(@list.List([add_herm(), sub_herm(), mul_herm(), smul_herm()])))
}

///|
let arith_herm_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ARITH_HERM_CLAUSES")

///|
/// `ARITH_HERM_CLAUSES`
pub fn arith_herm_clauses() -> @kernel.Thm {
  arith_herm_clauses_c.get()
}

///|
/// HERM_SYM
fn step_333() -> Unit raise {
  let t301 = @meson.meson_tac(@list.List([@complexes.cx_inj(), inprod_cnj()]))
  let t302 = @tactics.then_tac(@simp.rewrite_tac(@list.List([forall_inner_space_thm(), is_hermitian(), is_closed_by()])), t301)
  herm_sym_c.set(@tactics.prove(@term_syntax.parse_term("∀ is_ : (((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]), ∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], is_hermitian(is_, op1, op2) == is_hermitian(is_, op2, op1)"), t302))
}

///|
let herm_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HERM_SYM")

///|
/// `HERM_SYM`
pub fn herm_sym() -> @kernel.Thm {
  herm_sym_c.get()
}

///|
/// HERM_UNIQUENESS
fn step_334() -> Unit raise {
  let t303 = @meson.asm_meson_tac(@list.List([]))
  let t304 = @tactics.then_tac(@impconv.imp_rewrite_tac(@list.List([is_hermitian(), cop_eq(), is_closed_by(), inprod_inj_alt()])), t303)
  herm_uniqueness_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], ∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op3 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], is_inner_space((s, inprod)) && is_hermitian((s, inprod), op1, op2) && is_hermitian((s, inprod), op1, op3) → (∀ x : (_) -> Cart[Real, Tybit0[Unit]], IN(x, s) → equv(op2(x), op3(x), inprod))"), t304))
}

///|
let herm_uniqueness_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HERM_UNIQUENESS")

///|
/// `HERM_UNIQUENESS`
pub fn herm_uniqueness() -> @kernel.Thm {
  herm_uniqueness_c.get()
}

///|
/// HERM_UNIQUENESS_ALT
fn step_335() -> Unit raise {
  let t305 = @meson.meson_tac(@list.List([herm_sym(), herm_uniqueness()]))
  herm_uniqueness_alt_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], ∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op3 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], is_inner_space((s, inprod)) && is_hermitian((s, inprod), op2, op1) && is_hermitian((s, inprod), op3, op1) → (∀ x : (_) -> Cart[Real, Tybit0[Unit]], IN(x, s) → equv(op2(x), op3(x), inprod))"), t305))
}

///|
let herm_uniqueness_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HERM_UNIQUENESS_ALT")

///|
/// `HERM_UNIQUENESS_ALT`
pub fn herm_uniqueness_alt() -> @kernel.Thm {
  herm_uniqueness_alt_c.get()
}

///|
/// HERM_PROP_ADVANCED
fn step_336() -> Unit raise {
  let t306 = @meson.meson_tac(@list.List([arith_herm_clauses(), @complexes.cnj_cnj(), herm_sym()]))
  herm_prop_advanced_c.set(inner_space_prove("forall a b op1 op2 op3 op4 op5.\n    is_hermitian (s,inprod) op1 op2 /\\ is_hermitian (s,inprod) op3 op4\n    /\\ is_hermitian (s,inprod) op5 (a % op1 + b % op3)\n      ==> forall x. x IN s ==> (op5 x equv (cnj a % op2 + cnj b % op4) x) inprod", @tactics.then_tac(@impconv.imp_rewrite_tac(@list.List([cop_eq(), @utils.gimp_imp_v1(herm_uniqueness_alt())])), t306)))
}

///|
let herm_prop_advanced_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HERM_PROP_ADVANCED")

///|
/// `HERM_PROP_ADVANCED`
pub fn herm_prop_advanced() -> @kernel.Thm {
  herm_prop_advanced_c.get()
}

///|
/// is_self_adjoint
fn step_337() -> Unit raise {
  is_self_adjoint_c.set(@pair.new_definition(@term_syntax.parse_term("(is_self_adjoint1 : ((((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]), ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]]) -> Bool)((is_ : (((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]])), (op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]])) == is_hermitian(is_, op, op)")))
}

///|
let is_self_adjoint_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_self_adjoint")

///|
/// `is_self_adjoint`
pub fn is_self_adjoint() -> @kernel.Thm {
  is_self_adjoint_c.get()
}

///|
/// IS_SELF_ADJOINT
fn step_338() -> Unit raise {
  is_self_adjoint_v1_c.set(@simp.rewrite_rule(@list.List([forall_inner_space_thm(), is_hermitian()]))(is_self_adjoint()))
}

///|
let is_self_adjoint_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IS_SELF_ADJOINT")

///|
/// `IS_SELF_ADJOINT`
pub fn is_self_adjoint_v1() -> @kernel.Thm {
  is_self_adjoint_v1_c.get()
}

///|
/// SELF_ADJ_IS_LINCOP
fn step_339() -> Unit raise {
  self_adj_is_lincop_c.set(full_inner_space_prove("forall op. is_self_adjoint1 is_ op ==> is_linear_cop op", @impconv.imp_rewrite_tac(@list.List([is_self_adjoint(), herm_lincop_l()]))))
}

///|
let self_adj_is_lincop_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SELF_ADJ_IS_LINCOP")

///|
/// `SELF_ADJ_IS_LINCOP`
pub fn self_adj_is_lincop() -> @kernel.Thm {
  self_adj_is_lincop_c.get()
}

///|
/// SELF_ADJ_IS_CLOSED_BY
fn step_340() -> Unit raise {
  self_adj_is_closed_by_c.set(inner_space_prove("forall op. is_self_adjoint1 (s,inprod) op ==> is_closed_by s op", @impconv.imp_rewrite_tac(@list.List([is_self_adjoint(), herm_is_closed_by_l()]))))
}

///|
let self_adj_is_closed_by_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SELF_ADJ_IS_CLOSED_BY")

///|
/// `SELF_ADJ_IS_CLOSED_BY`
pub fn self_adj_is_closed_by() -> @kernel.Thm {
  self_adj_is_closed_by_c.get()
}

///|
/// SELF_ADJ_INPROD
fn step_341() -> Unit raise {
  let t307 = @meson.meson_tac(@list.List([]))
  self_adj_inprod_c.set(inner_space_prove("forall op1 op2. is_self_adjoint1 (s,inprod) op1 /\\ is_closed_by s op2\n    ==> forall x y. x IN s /\\ y IN s\n      ==> inprod x ((op1 ** op2) y) = inprod (op1 x) (op2 y)", @tactics.then_tac(@simp.rewrite_tac(@list.List([is_self_adjoint_v1(), cop_mul_v1(), is_closed_by()])), t307)))
}

///|
let self_adj_inprod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SELF_ADJ_INPROD")

///|
/// `SELF_ADJ_INPROD`
pub fn self_adj_inprod() -> @kernel.Thm {
  self_adj_inprod_c.get()
}

///|
/// ADD_SELF_ADJ
fn step_342() -> Unit raise {
  add_self_adj_c.set(full_inner_space_prove("forall op1 op2. is_self_adjoint1 is_ op1 /\\ is_self_adjoint1 is_ op2\n    ==> is_self_adjoint1 is_ (op1 + op2)", @impconv.imp_rewrite_tac(@list.List([is_self_adjoint(), add_herm()]))))
}

///|
let add_self_adj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ADD_SELF_ADJ")

///|
/// `ADD_SELF_ADJ`
pub fn add_self_adj() -> @kernel.Thm {
  add_self_adj_c.get()
}

///|
/// SUB_SELF_ADJ
fn step_343() -> Unit raise {
  sub_self_adj_c.set(full_inner_space_prove("forall op1 op2. is_self_adjoint1 is_ op1 /\\ is_self_adjoint1 is_ op2\n    ==> is_self_adjoint1 is_ (op1 - op2)", @impconv.imp_rewrite_tac(@list.List([is_self_adjoint(), sub_herm()]))))
}

///|
let sub_self_adj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUB_SELF_ADJ")

///|
/// `SUB_SELF_ADJ`
pub fn sub_self_adj() -> @kernel.Thm {
  sub_self_adj_c.get()
}

///|
/// SMUL_SELF_ADJ
fn step_344() -> Unit raise {
  smul_self_adj_c.set(full_inner_space_prove("forall a op. real a /\\ is_self_adjoint1 is_ op ==> is_self_adjoint1 is_ (a % op)", @meson.meson_tac(@list.List([is_self_adjoint(), smul_herm(), @complexes.real_cnj()]))))
}

///|
let smul_self_adj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SMUL_SELF_ADJ")

///|
/// `SMUL_SELF_ADJ`
pub fn smul_self_adj() -> @kernel.Thm {
  smul_self_adj_c.get()
}

///|
/// MUL_SELF_ADJ
fn step_345() -> Unit raise {
  mul_self_adj_c.set(full_inner_space_prove("forall op1 op2.\n    is_self_adjoint1 is_ op1 /\\ is_self_adjoint1 is_ op2 /\\ op1 ** op2 = op2 ** op1\n    ==> is_self_adjoint1 is_ (op1 ** op2)", @meson.meson_tac(@list.List([is_self_adjoint(), mul_herm()]))))
}

///|
let mul_self_adj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MUL_SELF_ADJ")

///|
/// `MUL_SELF_ADJ`
pub fn mul_self_adj() -> @kernel.Thm {
  mul_self_adj_c.get()
}

///|
/// I_SELF_ADJ
fn step_346() -> Unit raise {
  let t308 = @simp.rewrite_tac(@list.List([forall_inner_space_thm(), is_self_adjoint_v1(), i_lincop(), @trivia.i_thm(), is_closed_by_i()]))
  i_self_adj_c.set(@tactics.prove(@term_syntax.parse_term("∀ is_ : (((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]), is_self_adjoint1(is_, I)"), t308))
}

///|
let i_self_adj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("I_SELF_ADJ")

///|
/// `I_SELF_ADJ`
pub fn i_self_adj() -> @kernel.Thm {
  i_self_adj_c.get()
}

///|
/// ZERO_SELF_ADJ
fn step_347() -> Unit raise {
  let t309 = @simp.rewrite_tac(@list.List([is_self_adjoint(), zero_herm()]))
  zero_self_adj_c.set(@tactics.prove(@term_syntax.parse_term("∀ is_ : (((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]), is_self_adjoint1(is_, cop_zero)"), t309))
}

///|
let zero_self_adj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ZERO_SELF_ADJ")

///|
/// `ZERO_SELF_ADJ`
pub fn zero_self_adj() -> @kernel.Thm {
  zero_self_adj_c.get()
}

///|
/// selfadjoint_thms
fn step_348() -> Unit raise {
  selfadjoint_thms_c.set(Ref::{ val: @list.List([]) })
}

///|
let selfadjoint_thms_c : @lib.Cell[Ref[@list.List[@kernel.Thm]]] = @lib.Cell::new("selfadjoint_thms")

///|
/// `selfadjoint_thms`
pub fn selfadjoint_thms() -> Ref[@list.List[@kernel.Thm]] {
  selfadjoint_thms_c.get()
}

///|
/// `add_selfadjoint_thm`
pub fn add_selfadjoint_thm(x310 : @kernel.Thm) -> Unit raise {
  let thm = x310
  let thm_1 = @utils.gimp_imp_v1(thm)
  {
    selfadjoint_thms().val = (selfadjoint_thms().val).prepend(thm_1)
    ()
  }
  let eta_thm = @simp.simp_rule(@list.List([@class.eta_ax()]))(thm_1)
  if !@basics.equals_thm(thm_1, eta_thm) {
    {
      selfadjoint_thms().val = (selfadjoint_thms().val).prepend(eta_thm)
      ()
    }
  } else {
    ()
  }
}

///|
/// add_selfadjoint_thms
fn step_349() -> Unit raise {
  add_selfadjoint_thms_c.set(x311 => @lib.do_list(add_selfadjoint_thm, x311))
}

///|
let add_selfadjoint_thms_c : @lib.Cell[(@list.List[@kernel.Thm]) -> Unit raise] = @lib.Cell::new("add_selfadjoint_thms")

///|
/// `add_selfadjoint_thms`
pub fn add_selfadjoint_thms(x : @list.List[@kernel.Thm]) -> Unit raise {
  (add_selfadjoint_thms_c.get())(x)
}

///|
/// `SELF_ADJOINT_TAC`
pub fn self_adjoint_tac(x312 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let g = x312
  let match_mp_tac : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise = fn(x313 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let x = x313
    fn(x314 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      let y = x314
      @tactics.match_mp_tac(x)(y)
    }
  }
  let t319 = selfadjoint_thms().val
  let try_selfadjoint_thm : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = @tactics.asm_tac((x318 : @list.List[@kernel.Thm]) => @tactics.map_first(fn(x315 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let x_1 = x315
    let t317 = match_mp_tac(x_1)
    @tactics.orelse_tac(@tactics.match_accept_tac(x_1), t317)
  }, x318))(t319)
  let t321 = real_tac_v1(Some(@list.List([self_adjoint_tac, linearity_tac])))
  let t320 = @tactics.then_tac(@simp.asm_simp_tac(@list.List([])), @tactics.no_tac)
  let loop_ : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = @tactics.orelse_tac(@tactics.orelse_tac(@tactics.orelse_tac(@tactics.orelse_tac(try_selfadjoint_thm, @tactics.then_tac(@simp.simp_tac(@list.List([@class.eta_ax()])), try_selfadjoint_thm)), t320), linearity_tac), t321)
  @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), fn(x322 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    let (_, c) as g_1 = x322
    let head = @basics.strip_comb(c).0
    if (if (@printer.name_of(head) == "is_self_adjoint1") {
      let t323 = @kernel.type_of(head)
      let t324 = @parser.parse_type("inner_space->cop->bool")
      @lib.can((x325 : @list.List[(@kernel.HolType, @kernel.HolType)]) => @basics.type_match(t324, t323, x325), @list.List([]))
    } else {
      false
    }) {
      @tactics.changed_tac(@tactics.repeat_tac(@tactics.then_tac(loop_, @tactics.repeat_tac(@tactics.conj_tac))))(g_1)
    } else {
      @tactics.fail_tac("bad goal")(g_1)
    }
  })(g)
}

///|
/// `REAL_TAC`
pub fn real_tac_v2(x326 : @list.List[((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise]?) -> ((@tactics.Goal) -> @tactics.Goalstate raise) raise {
  let _opt_ = x326
  let alternatives = match _opt_ {
    Some(_sth_) => _sth_
    None => @list.List([])
  }
  real_tac_v1(Some((alternatives.prepend(linearity_tac)).prepend(self_adjoint_tac)))
}

///|
/// Functionspaces/cfunspace.ml:1537
fn step_350() -> Unit raise {
  add_selfadjoint_thms(@list.List([add_self_adj(), sub_self_adj(), smul_self_adj(), @simp.rewrite_rule(@list.List([cop_smul_v1()]))(smul_self_adj()), mul_self_adj(), i_self_adj(), zero_self_adj()]))
}

///|
/// ANTI_COMMUTATOR_SELF_ADJ
fn step_351() -> Unit raise {
  let t331 = @meson.asm_meson_tac(@list.List([@complexes.complex_add_sym(), is_closed_by()]))
  let t330 = @tactics.asm_tac(@impconv.imp_rewrite_tac)(@list.List([is_closed_by_cop_add(), is_closed_by_cop_mul(), cop_mul_v1(), cop_add_v1(), is_closed_by_cop_mul(), inner_space_is_subspace(), inprod_add_ldist(), inprod_add_rdist()]))
  let t329 = @tactics.try_tac(linearity_tac)
  let t328 = @tactics.repeat_tac(@tactics.strip_tac)
  anti_commutator_self_adj_c.set(full_inner_space_prove("forall op1 op2. is_self_adjoint1 is_ op1 /\\ is_self_adjoint1 is_ op2\n    ==> is_self_adjoint1 is_ (op1 ** op2 + op2 ** op1)", @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([forall_inner_space_thm(), is_self_adjoint_v1()])), @utils.simp_horn_tac), t328), t329), t330), t331)))
}

///|
let anti_commutator_self_adj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANTI_COMMUTATOR_SELF_ADJ")

///|
/// `ANTI_COMMUTATOR_SELF_ADJ`
pub fn anti_commutator_self_adj() -> @kernel.Thm {
  anti_commutator_self_adj_c.get()
}

///|
/// Functionspaces/cfunspace.ml:1550
fn step_352() -> Unit raise {
  add_selfadjoint_thm(anti_commutator_self_adj())
}

///|
/// NEG_SELF_ADJ
fn step_353() -> Unit raise {
  neg_self_adj_c.set(full_inner_space_prove("forall op. is_linear_cop op /\\ is_self_adjoint1 is_ op\n    ==> is_self_adjoint1 is_ (--op)", @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(cop_sub_lzero())])), self_adjoint_tac)))
}

///|
let neg_self_adj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NEG_SELF_ADJ")

///|
/// `NEG_SELF_ADJ`
pub fn neg_self_adj() -> @kernel.Thm {
  neg_self_adj_c.get()
}

///|
/// Functionspaces/cfunspace.ml:1557
fn step_354() -> Unit raise {
  add_selfadjoint_thm(neg_self_adj())
}

///|
/// SCALAR_II_HERM
fn step_355() -> Unit raise {
  scalar_ii_herm_c.set(inner_space_prove("forall op. is_linear_cop op /\\ (forall x y. inprod (op x) y = -- (inprod x (op y)))\n      /\\ is_closed_by s op\n        ==> is_self_adjoint1 (s,inprod) (ii % op)", @tactics.then_tac(@impconv.imp_rewrite_tac(@list.List([is_self_adjoint_v1(), cop_smul_thm(), is_closed_by_cop_smul(), is_closed_by(), inner_space_is_subspace(), inprod_lsmul(), inprod_rsmul(), @complexes.cnj_ii(), @complexes.complex_neg_mul2()])), linearity_tac)))
}

///|
let scalar_ii_herm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SCALAR_II_HERM")

///|
/// `SCALAR_II_HERM`
pub fn scalar_ii_herm() -> @kernel.Thm {
  scalar_ii_herm_c.get()
}

///|
/// Functionspaces/cfunspace.ml:1567
fn step_356() -> Unit raise {
  add_selfadjoint_thm(scalar_ii_herm())
}

///|
/// COMMUTATOR_ANTI_HERM
fn step_357() -> Unit raise {
  commutator_anti_herm_c.set(inner_space_prove("forall op1 op2. is_self_adjoint1 (s,inprod) op1 /\\ is_self_adjoint1 (s,inprod) op2\n    ==> forall x y. x IN s /\\ y IN s\n     ==> inprod (commutator op1 op2 x) y = --(inprod x (commutator op1 op2 y))", @impconv.imp_rewrite_tac(@list.List([commutator(), is_self_adjoint_v1(), cop_mul_thm(), cop_sub_thm(), is_closed_by(), inprod_sub_ldist(), inprod_sub_rdist(), @complexes.complex_neg_sub()]))))
}

///|
let commutator_anti_herm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMMUTATOR_ANTI_HERM")

///|
/// `COMMUTATOR_ANTI_HERM`
pub fn commutator_anti_herm() -> @kernel.Thm {
  commutator_anti_herm_c.get()
}

///|
/// Functionspaces/cfunspace.ml:1576
fn step_358() -> Unit raise {
  add_selfadjoint_thm(commutator_anti_herm())
}

///|
/// II_COMMUTATOR_HERM
fn step_359() -> Unit raise {
  let t334 = @simp.rewrite_rule(@list.List([is_closed_by()]))(is_closed_by_commutator())
  let t335 = @impconv.imp_rewrite_tac(@list.List([@utils.gimp_imp_v1(commutator_anti_herm()), is_self_adjoint(), is_hermitian(), t334, inner_space_is_subspace(), is_closed_by()]))
  let t333 = @simp.once_rewrite_tac(@list.List([@complexes.complex_field(@term_syntax.parse_term("((x : Cart[Real, Tybit0[Unit]]) == -(y : Cart[Real, Tybit0[Unit]])) == (y == -x)"))]))
  let t332 = @impconv.imp_rewrite_tac(@list.List([cop_smul_thm(), inprod_rsmul(), inprod_lsmul(), is_closed_by_commutator(), is_closed_by_cop_smul(), @complexes.cnj_ii(), @complexes.ii_nz(), inner_space_is_subspace(), @complexes.complex_mul_lneg(), @equal.gsym(@complexes.complex_mul_rneg()), @complexes.complex_eq_mul_lcancel()]))
  ii_commutator_herm_c.set(full_inner_space_prove("forall op1 op2. is_self_adjoint1 is_ op1 /\\ is_self_adjoint1 is_ op2\n    ==> is_self_adjoint1 is_ (ii % commutator op1 op2)", @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([forall_inner_space_thm(), is_self_adjoint_v1()])), t332), t333), t335), linearity_tac)))
}

///|
let ii_commutator_herm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("II_COMMUTATOR_HERM")

///|
/// `II_COMMUTATOR_HERM`
pub fn ii_commutator_herm() -> @kernel.Thm {
  ii_commutator_herm_c.get()
}

///|
/// Functionspaces/cfunspace.ml:1591
fn step_360() -> Unit raise {
  add_selfadjoint_thm(ii_commutator_herm())
}

///|
/// EXPEC_HERM_REAL
fn step_361() -> Unit raise {
  expec_herm_real_c.set(inner_space_prove("forall op state. is_self_adjoint1 (s,inprod) op /\\ state IN s\n    ==> real (expectation inprod state op)", @impconv.imp_rewrite_tac(@list.List([is_self_adjoint_v1(), expectation(), is_closed_by(), @complexes.real_cnj(), inprod_cnj()]))))
}

///|
let expec_herm_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXPEC_HERM_REAL")

///|
/// `EXPEC_HERM_REAL`
pub fn expec_herm_real() -> @kernel.Thm {
  expec_herm_real_c.get()
}

///|
/// Functionspaces/cfunspace.ml:1599
fn step_362() -> Unit raise {
  add_real_thms(@list.List([expec_herm_real(), @simp.rewrite_rule(@list.List([expectation()]))(expec_herm_real())]))
}

///|
/// DEVIATION_HERM
fn step_363() -> Unit raise {
  let t336 = @meson.asm_meson_tac(@list.List([]))
  deviation_herm_c.set(inner_space_prove("forall op state. is_self_adjoint1 (s,inprod) op /\\ state IN s\n    ==> is_self_adjoint1 (s,inprod) (deviation inprod state op)", @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([deviation_alt()])), self_adjoint_tac), t336)))
}

///|
let deviation_herm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DEVIATION_HERM")

///|
/// `DEVIATION_HERM`
pub fn deviation_herm() -> @kernel.Thm {
  deviation_herm_c.get()
}

///|
/// Functionspaces/cfunspace.ml:1606
fn step_364() -> Unit raise {
  add_selfadjoint_thms(@list.List([deviation_herm(), @simp.rewrite_rule(@list.List([deviation()]))(deviation_herm())]))
}

///|
/// VARIANCE_REAL
fn step_365() -> Unit raise {
  let arg : (@list.List[((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise]?) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise = real_tac_v2
  variance_real_c.set(inner_space_prove("forall op state.  state IN s /\\ is_self_adjoint1 (s,inprod) op\n    ==> real (variance inprod state op)", @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([variance()])), fn(x337 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    let eta = x337
    arg(None)(eta)
  }), @utils.hint_exists_tac), self_adjoint_tac)))
}

///|
let variance_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VARIANCE_REAL")

///|
/// `VARIANCE_REAL`
pub fn variance_real() -> @kernel.Thm {
  variance_real_c.get()
}

///|
/// Functionspaces/cfunspace.ml:1614
fn step_366() -> Unit raise {
  add_real_thm(variance_real())
}

///|
/// is_eigen_pair
fn step_367() -> Unit raise {
  is_eigen_pair_c.set(@pair.new_definition(@term_syntax.parse_term("(is_eigen_pair : (((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], ((A) -> Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]])) -> Bool)((op : ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]]), ((x : (A) -> Cart[Real, Tybit0[Unit]]), (a : Cart[Real, Tybit0[Unit]]))) == (is_linear_cop(op) → op(x) == cfun_smul(a, x) && !(x == cfun_zero))")))
}

///|
let is_eigen_pair_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_eigen_pair")

///|
/// `is_eigen_pair`
pub fn is_eigen_pair() -> @kernel.Thm {
  is_eigen_pair_c.get()
}

///|
/// EIGEN_PAIR_SMUL
fn step_368() -> Unit raise {
  let t338 = @simp.simp_tac(@list.List([is_eigen_pair(), cfun_entire(), lincop_smul(), cfun_smul_sym()]))
  eigen_pair_smul_c.set(@tactics.prove(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ v : Cart[Real, Tybit0[Unit]], ∀ x : (_) -> Cart[Real, Tybit0[Unit]], is_eigen_pair(op, (x, v)) → (∀ a : Cart[Real, Tybit0[Unit]], !(a == Cx(real_of_num(0))) → is_eigen_pair(op, (cfun_smul(a, x), v)))"), t338))
}

///|
let eigen_pair_smul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EIGEN_PAIR_SMUL")

///|
/// `EIGEN_PAIR_SMUL`
pub fn eigen_pair_smul() -> @kernel.Thm {
  eigen_pair_smul_c.get()
}

///|
/// EIGEN_PAIR_ADD
fn step_369() -> Unit raise {
  let t339 = @simp.simp_tac(@list.List([is_eigen_pair(), lincop_add(), cfun_add_ldistrib()]))
  eigen_pair_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ v : Cart[Real, Tybit0[Unit]], ∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ y : (_) -> Cart[Real, Tybit0[Unit]], is_eigen_pair(op, (x, v)) && is_eigen_pair(op, (y, v)) && !(x + y == cfun_zero) → is_eigen_pair(op, (x + y, v))"), t339))
}

///|
let eigen_pair_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EIGEN_PAIR_ADD")

///|
/// `EIGEN_PAIR_ADD`
pub fn eigen_pair_add() -> @kernel.Thm {
  eigen_pair_add_c.get()
}

///|
/// EIGEN_SPACE_THM
fn step_370() -> Unit raise {
  let t342 = @meson.asm_meson_tac(@list.List([eigen_pair_smul(), eigen_pair_add()]))
  let t341 = @simp.asm_simp_tac(@list.List([cfun_add_rid(), cfun_add_lid()]))
  let t340 = @tactics.repeat_tac(@tactics.strip_tac)
  let t343 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([is_cfun_subspace(), @sets.in_elim_thm(), @sets.in_union(), @sets.in_sing(), cfun_entire()])), t340), t341), t342)
  eigen_space_thm_c.set(@tactics.prove(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], is_linear_cop(op) → (∀ a : Cart[Real, Tybit0[Unit]], is_cfun_subspace(UNION({(x : (_) -> Cart[Real, Tybit0[Unit]]) | is_eigen_pair(op, (x, a))}, {cfun_zero})))"), t343))
}

///|
let eigen_space_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EIGEN_SPACE_THM")

///|
/// `EIGEN_SPACE_THM`
pub fn eigen_space_thm() -> @kernel.Thm {
  eigen_space_thm_c.get()
}

///|
/// is_eigen_val
fn step_371() -> Unit raise {
  is_eigen_val_c.set(@pair.new_definition(@term_syntax.parse_term("(is_eigen_val : (((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]]) -> Bool)((op : ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]]), (a : Cart[Real, Tybit0[Unit]])) == (∃ x : (A) -> Cart[Real, Tybit0[Unit]], is_eigen_pair(op, (x, a)))")))
}

///|
let is_eigen_val_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_eigen_val")

///|
/// `is_eigen_val`
pub fn is_eigen_val() -> @kernel.Thm {
  is_eigen_val_c.get()
}

///|
/// is_eigen_fun
fn step_372() -> Unit raise {
  is_eigen_fun_c.set(@pair.new_definition(@term_syntax.parse_term("(is_eigen_fun : (((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]]) -> Bool)((op : ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]]), (x : (A) -> Cart[Real, Tybit0[Unit]])) == (∃ a : Cart[Real, Tybit0[Unit]], is_eigen_pair(op, (x, a)))")))
}

///|
let is_eigen_fun_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_eigen_fun")

///|
/// `is_eigen_fun`
pub fn is_eigen_fun() -> @kernel.Thm {
  is_eigen_fun_c.get()
}

///|
/// is_unbounded_linear_cop
fn step_373() -> Unit raise {
  is_unbounded_linear_cop_c.set(@pair.new_definition(@term_syntax.parse_term("(is_unbounded_linear_cop : (((B) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((B) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]]) -> Bool)((s : ((B) -> Cart[Real, Tybit0[Unit]]) -> Bool), (op : ((B) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]])) == (is_cfun_subspace(s) && (∀ x : (B) -> Cart[Real, Tybit0[Unit]], ∀ y : (B) -> Cart[Real, Tybit0[Unit]], IN(x, s) && IN(y, s) → op(x + y) == op(x) + op(y) && (∀ a : Cart[Real, Tybit0[Unit]], op(cfun_smul(a, x)) == cfun_smul(a, op(x)))))")))
}

///|
let is_unbounded_linear_cop_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_unbounded_linear_cop")

///|
/// `is_unbounded_linear_cop`
pub fn is_unbounded_linear_cop() -> @kernel.Thm {
  is_unbounded_linear_cop_c.get()
}

///|
/// ULINCOP_SUBSPACE
fn step_374() -> Unit raise {
  let t344 = @meson.meson_tac(@list.List([is_unbounded_linear_cop()]))
  ulincop_subspace_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, is_unbounded_linear_cop(s, op) → is_cfun_subspace(s)"), t344))
}

///|
let ulincop_subspace_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ULINCOP_SUBSPACE")

///|
/// `ULINCOP_SUBSPACE`
pub fn ulincop_subspace_v1() -> @kernel.Thm {
  ulincop_subspace_v1_c.get()
}

///|
/// ULINCOP_SMUL
fn step_375() -> Unit raise {
  let t345 = @meson.meson_tac(@list.List([is_unbounded_linear_cop()]))
  ulincop_smul_c.set(@tactics.prove(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ a : Cart[Real, Tybit0[Unit]], ∀ x : (_) -> Cart[Real, Tybit0[Unit]], is_unbounded_linear_cop(s, op) && IN(x, s) → op(cfun_smul(a, x)) == cfun_smul(a, op(x))"), t345))
}

///|
let ulincop_smul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ULINCOP_SMUL")

///|
/// `ULINCOP_SMUL`
pub fn ulincop_smul() -> @kernel.Thm {
  ulincop_smul_c.get()
}

///|
/// ULINCOP_ADD
fn step_376() -> Unit raise {
  let t346 = @simp.simp_tac(@list.List([is_unbounded_linear_cop()]))
  ulincop_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ y : (_) -> Cart[Real, Tybit0[Unit]], is_unbounded_linear_cop(s, op) && IN(x, s) && IN(y, s) → op(x + y) == op(x) + op(y)"), t346))
}

///|
let ulincop_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ULINCOP_ADD")

///|
/// `ULINCOP_ADD`
pub fn ulincop_add() -> @kernel.Thm {
  ulincop_add_c.get()
}

///|
/// ULINCOP_SUBSPACE
fn step_377() -> Unit raise {
  let t347 = @simp.simp_tac(@list.List([is_unbounded_linear_cop()]))
  ulincop_subspace_c.set(@tactics.prove(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, is_unbounded_linear_cop(s, op) → is_cfun_subspace(s)"), t347))
}

///|
let ulincop_subspace_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ULINCOP_SUBSPACE")

///|
/// `ULINCOP_SUBSPACE`
pub fn ulincop_subspace() -> @kernel.Thm {
  ulincop_subspace_c.get()
}

///|
/// ULINCOP_SUB
fn step_378() -> Unit raise {
  let t348 = @meson.asm_meson_tac(@list.List([ulincop_smul()]))
  let t349 = @tactics.then_tac(@impconv.imp_rewrite_tac(@list.List([cfun_subspace_smul(), ulincop_subspace(), ulincop_add(), cfun_sub_neg(), @equal.gsym(cfun_smul_lid_neg())])), t348)
  ulincop_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ y : (_) -> Cart[Real, Tybit0[Unit]], ∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, is_unbounded_linear_cop(s, op) && IN(x, s) && IN(y, s) → op(x - y) == op(x) - op(y)"), t349))
}

///|
let ulincop_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ULINCOP_SUB")

///|
/// `ULINCOP_SUB`
pub fn ulincop_sub() -> @kernel.Thm {
  ulincop_sub_c.get()
}

///|
/// ULINCOP_ZERO
fn step_379() -> Unit raise {
  let t350 = @meson.meson_tac(@list.List([ulincop_smul(), cfun_smul_lzero(), cfun_subspace_zero(), ulincop_subspace()]))
  let t351 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(@q.spec("cfun_zero", cfun_smul_lzero()))])), t350)
  ulincop_zero_c.set(@tactics.prove(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, is_unbounded_linear_cop(s, op) → op(cfun_zero) == cfun_zero"), t351))
}

///|
let ulincop_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ULINCOP_ZERO")

///|
/// `ULINCOP_ZERO`
pub fn ulincop_zero() -> @kernel.Thm {
  ulincop_zero_c.get()
}

///|
/// SUBSPACE_INTER
fn step_380() -> Unit raise {
  let t352 = @simp.simp_tac(@list.List([is_cfun_subspace(), @sets.inter(), @sets.in_elim_thm()]))
  subspace_inter_c.set(@tactics.prove(@term_syntax.parse_term("∀ s1 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s2 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, is_cfun_subspace(s1) && is_cfun_subspace(s2) → is_cfun_subspace(INTER(s1, s2))"), t352))
}

///|
let subspace_inter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBSPACE_INTER")

///|
/// `SUBSPACE_INTER`
pub fn subspace_inter() -> @kernel.Thm {
  subspace_inter_c.get()
}

///|
/// CFUN_ADD_AC
fn step_381() -> Unit raise {
  cfun_add_ac_c.set(cfun_arith(@term_syntax.parse_term("∀ m : (A) -> Cart[Real, Tybit0[Unit]], ∀ n : (A) -> Cart[Real, Tybit0[Unit]], ∀ p : (A) -> Cart[Real, Tybit0[Unit]], m + n == n + m && m + n + p == m + (n + p) && m + (n + p) == n + (m + p)")))
}

///|
let cfun_add_ac_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_ADD_AC")

///|
/// `CFUN_ADD_AC`
pub fn cfun_add_ac() -> @kernel.Thm {
  cfun_add_ac_c.get()
}

///|
/// ADD_ULINCOP
fn step_382() -> Unit raise {
  let t353 = @meson.meson_tac(@list.List([cfun_add_ldistrib()]))
  let t354 = @tactics.then_tac(@simp.simp_tac(@list.List([is_unbounded_linear_cop(), subspace_inter(), @sets.in_inter(), cfun_add_ac(), cop_add_thm()])), t353)
  add_ulincop_c.set(@tactics.prove(@term_syntax.parse_term("∀ s1 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s2 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], is_unbounded_linear_cop(s1, op1) && is_unbounded_linear_cop(s2, op2) → is_unbounded_linear_cop(INTER(s1, s2), op1 + op2)"), t354))
}

///|
let add_ulincop_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ADD_ULINCOP")

///|
/// `ADD_ULINCOP`
pub fn add_ulincop() -> @kernel.Thm {
  add_ulincop_c.get()
}

///|
/// SMUL_ULINCOP
fn step_383() -> Unit raise {
  let t355 = @meson.meson_tac(@list.List([@complexes.complex_mul_sym(), cfun_smul_distrib()]))
  let t356 = @tactics.then_tac(@simp.simp_tac(@list.List([is_unbounded_linear_cop(), cop_to_cfun(), cop_add_thm(), cfun_add_ldistrib()])), t355)
  smul_ulincop_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ a : Cart[Real, Tybit0[Unit]], is_unbounded_linear_cop(s, op) → is_unbounded_linear_cop(s, cop_smul(a, op))"), t356))
}

///|
let smul_ulincop_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SMUL_ULINCOP")

///|
/// `SMUL_ULINCOP`
pub fn smul_ulincop() -> @kernel.Thm {
  smul_ulincop_c.get()
}

///|
/// SUB_ULINCOP
fn step_384() -> Unit raise {
  let t358 = @equal.gsym(@complexes.cx_neg())
  let t359 = @equal.gsym(cop_smul_lid_neg())
  let t357 = @utils.spec_v(("a", "Cx x"), smul_ulincop())
  let t360 = @impconv.imp_rewrite_tac(@list.List([add_ulincop(), @simp.rewrite_rule(@list.List([@complexes.cnj_cx()]))(t357), cop_sub_v1(), t359, t358]))
  sub_ulincop_c.set(@tactics.prove(@term_syntax.parse_term("∀ s1 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s2 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], is_unbounded_linear_cop(s1, op1) && is_unbounded_linear_cop(s2, op2) → is_unbounded_linear_cop(INTER(s1, s2), op1 - op2)"), t360))
}

///|
let sub_ulincop_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUB_ULINCOP")

///|
/// `SUB_ULINCOP`
pub fn sub_ulincop() -> @kernel.Thm {
  sub_ulincop_c.get()
}

///|
/// I_ULINCOP
fn step_385() -> Unit raise {
  let t361 = @simp.rewrite_tac(@list.List([is_unbounded_linear_cop(), @trivia.i_thm()]))
  i_ulincop_c.set(@tactics.prove(@term_syntax.parse_term("∀ s1 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, is_cfun_subspace(s1) → is_unbounded_linear_cop(s1, I)"), t361))
}

///|
let i_ulincop_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("I_ULINCOP")

///|
/// `I_ULINCOP`
pub fn i_ulincop() -> @kernel.Thm {
  i_ulincop_c.get()
}

///|
/// MUL_LEMMA
fn step_386() -> Unit raise {
  let t363 = @impconv.imp_rewrite_tac(@list.List([ulincop_smul(), ulincop_subspace(), cfun_subspace_smul(), cfun_subspace_add(), ulincop_add(), cfun_subspace_zero(), ulincop_zero()]))
  let t362 = @simp.rewrite_tac(@list.List([is_cfun_subspace(), @sets.in_elim_thm()]))
  let t364 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t362), t363)
  mul_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ s1 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s2 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], is_cfun_subspace(s1) && is_unbounded_linear_cop(s2, op2) → is_cfun_subspace({(x : (_) -> Cart[Real, Tybit0[Unit]]) | IN(x, s2) && IN(op2(x), s1)})"), t364))
}

///|
let mul_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MUL_LEMMA")

///|
/// `MUL_LEMMA`
pub fn mul_lemma() -> @kernel.Thm {
  mul_lemma_c.get()
}

///|
/// MUL_ULINCOP
fn step_387() -> Unit raise {
  let t376 = @meson.asm_meson_tac(@list.List([@complexes.complex_mul_sym(), cfun_smul_distrib()]))
  let t375 = @simp.simp_tac(@list.List([is_unbounded_linear_cop(), cop_to_cfun(), cop_add_thm(), cfun_add_ldistrib(), @sets.in_elim_thm()]))
  let t374 = @tactics.pop_assum(fn(x371 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s372 = @tactics.mp_tac(x371)
    fn(x373 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s372(x373)
    }
  })
  let t370 = @tactics.pop_assum(fn(x367 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s368 = @tactics.mp_tac(x367)
    fn(x369 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s368(x369)
    }
  })
  let t366 = @impconv.imp_rewrite_tac(@list.List([mul_lemma(), ulincop_subspace()]))
  let t365 = @simp.rewrite_tac(@list.List([is_unbounded_linear_cop()]))
  let t377 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t365), t366), t370), t374), t375), t376)
  mul_ulincop_c.set(@tactics.prove(@term_syntax.parse_term("∀ s1 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s2 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], is_unbounded_linear_cop(s1, op1) && is_unbounded_linear_cop(s2, op2) → is_unbounded_linear_cop({(x : (_) -> Cart[Real, Tybit0[Unit]]) | IN(x, s2) && IN(op2(x), s1)}, cop_mul(op1, op2))"), t377))
}

///|
let mul_ulincop_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MUL_ULINCOP")

///|
/// `MUL_ULINCOP`
pub fn mul_ulincop() -> @kernel.Thm {
  mul_ulincop_c.get()
}

///|
/// ulinearity_thms
fn step_388() -> Unit raise {
  ulinearity_thms_c.set(Ref::{ val: @list.List([]) })
}

///|
let ulinearity_thms_c : @lib.Cell[Ref[@list.List[@kernel.Thm]]] = @lib.Cell::new("ulinearity_thms")

///|
/// `ulinearity_thms`
pub fn ulinearity_thms() -> Ref[@list.List[@kernel.Thm]] {
  ulinearity_thms_c.get()
}

///|
/// `add_ulinearity_thm`
pub fn add_ulinearity_thm(x378 : @kernel.Thm) -> Unit raise {
  let thm = x378
  let thm_1 = @utils.gimp_imp_v1(thm)
  {
    ulinearity_thms().val = (ulinearity_thms().val).prepend(thm_1)
    ()
  }
  let eta_thm = @simp.simp_rule(@list.List([@class.eta_ax()]))(thm_1)
  if !@basics.equals_thm(thm_1, eta_thm) {
    {
      ulinearity_thms().val = (ulinearity_thms().val).prepend(eta_thm)
      ()
    }
  } else {
    ()
  }
}

///|
/// add_ulinearity_thms
fn step_389() -> Unit raise {
  add_ulinearity_thms_c.set(x379 => @lib.do_list(add_ulinearity_thm, x379))
}

///|
let add_ulinearity_thms_c : @lib.Cell[(@list.List[@kernel.Thm]) -> Unit raise] = @lib.Cell::new("add_ulinearity_thms")

///|
/// `add_ulinearity_thms`
pub fn add_ulinearity_thms(x : @list.List[@kernel.Thm]) -> Unit raise {
  (add_ulinearity_thms_c.get())(x)
}

///|
/// Functionspaces/cfunspace.ml:1765
fn step_390() -> Unit raise {
  add_ulinearity_thms(@list.List([add_ulincop(), sub_ulincop(), smul_ulincop(), mul_ulincop(), @simp.rewrite_rule(@list.List([cop_smul()]))(smul_ulincop())]))
}

///|
/// `ULINEARITY_TAC`
pub fn ulinearity_tac(x380 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let g = x380
  let match_mp_tac : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise = fn(x381 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let x = x381
    fn(x382 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      let y = x382
      @tactics.match_mp_tac(x)(y)
    }
  }
  let t387 = ulinearity_thms().val
  let try_linearity_thm : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = @tactics.asm_tac((x386 : @list.List[@kernel.Thm]) => @tactics.map_first(fn(x383 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let x_1 = x383
    let t385 = match_mp_tac(x_1)
    @tactics.orelse_tac(@tactics.match_accept_tac(x_1), t385)
  }, x386))(t387)
  let t388 = @tactics.then_tac(@simp.asm_simp_tac(@list.List([])), @tactics.no_tac)
  let loop_ : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = @tactics.orelse_tac(@tactics.orelse_tac(try_linearity_thm, @tactics.then_tac(@simp.simp_tac(@list.List([@class.eta_ax()])), try_linearity_thm)), t388)
  let t389 = @tactics.changed_tac(@tactics.repeat_tac(@tactics.then_tac(loop_, @tactics.repeat_tac(@tactics.conj_tac))))
  @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t389)(g)
}

///|
/// COMMUTAOR_ULINCOP
fn step_391() -> Unit raise {
  let t390 = @tactics.then_tac(@simp.rewrite_tac(@list.List([commutator()])), ulinearity_tac)
  commutaor_ulincop_c.set(@tactics.prove(@term_syntax.parse_term("∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ s1 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ s2 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, is_unbounded_linear_cop(s1, op1) && is_unbounded_linear_cop(s2, op2) → is_unbounded_linear_cop(INTER({(x : (_) -> Cart[Real, Tybit0[Unit]]) | IN(x, s2) && IN(op2(x), s1)}, {(x : (_) -> Cart[Real, Tybit0[Unit]]) | IN(x, s1) && IN(op1(x), s2)}), com(op1, op2))"), t390))
}

///|
let commutaor_ulincop_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMMUTAOR_ULINCOP")

///|
/// `COMMUTAOR_ULINCOP`
pub fn commutaor_ulincop() -> @kernel.Thm {
  commutaor_ulincop_c.get()
}

///|
/// is_hermitian_unbounded
fn step_392() -> Unit raise {
  is_hermitian_unbounded_c.set(@pair.new_definition(@term_syntax.parse_term("(is_hermitian_unbounded : ((((A) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((A) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]), ((A) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((A) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]]) -> Bool)(((s : ((A) -> Cart[Real, Tybit0[Unit]]) -> Bool), (inprod : ((A) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]])), (s1 : ((A) -> Cart[Real, Tybit0[Unit]]) -> Bool), (s2 : ((A) -> Cart[Real, Tybit0[Unit]]) -> Bool), (op1 : ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]]), (op2 : ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]])) == (is_inner_space((s, inprod)) → SUBSET(s1, s) && SUBSET(s2, s) && is_unbounded_linear_cop(s1, op1) && is_unbounded_linear_cop(s2, op2) && (∀ x : (A) -> Cart[Real, Tybit0[Unit]], IN(x, s1) → IN(op1(x), s)) && (∀ x : (A) -> Cart[Real, Tybit0[Unit]], IN(x, s2) → IN(op2(x), s)) && (∀ x : (A) -> Cart[Real, Tybit0[Unit]], ∀ y : (A) -> Cart[Real, Tybit0[Unit]], IN(x, s2) && IN(y, s1) → inprod(x, op1(y)) == inprod(op2(x), y)))")))
}

///|
let is_hermitian_unbounded_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_hermitian_unbounded")

///|
/// `is_hermitian_unbounded`
pub fn is_hermitian_unbounded() -> @kernel.Thm {
  is_hermitian_unbounded_c.get()
}

///|
/// ADD_HERM_UNBOUNDED
fn step_393() -> Unit raise {
  let t394 = @meson.asm_meson_tac(@list.List([inner_space_add(), @sets.subset()]))
  let t395 = @tactics.then_tac(@impconv.imp_rewrite_tac(@list.List([cop_add_thm(), inprod_add_rdist(), inprod_add_ldist()])), t394)
  let t393 = @meson.asm_meson_tac(@list.List([inner_space_add(), @sets.subset()]))
  let t396 = @tactics.then_tac(@simp.rewrite_tac(@list.List([cop_add_thm()])), t393)
  let t392 = @meson.asm_meson_tac(@list.List([inner_space_add(), @sets.subset()]))
  let t397 = @tactics.then_tac(@simp.rewrite_tac(@list.List([cop_add_thm()])), t392)
  let t398 = @simp.asm_simp_tac(@list.List([add_ulincop()]))
  let t399 = @simp.asm_simp_tac(@list.List([add_ulincop()]))
  let t400 = @tactics.assum_list(@sets.set_tac)
  let t401 = @list.List([@tactics.assum_list(@sets.set_tac), t400, t399, t398, t397, t396, t395])
  let t391 = @tactics.repeat_tac(@tactics.strip_tac)
  let t402 = @tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([is_hermitian_unbounded(), @sets.in_inter()])), t391), t401)
  add_herm_unbounded_c.set(@tactics.prove(@term_syntax.parse_term("∀ op1 : ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], ∀ op3 : ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], ∀ op4 : ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], ∀ s1 : ((A) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s2 : ((A) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s3 : ((A) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s4 : ((A) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s : ((A) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((A) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], is_hermitian_unbounded((s, inprod), s1, s2, op1, op2) && is_hermitian_unbounded((s, inprod), s3, s4, op3, op4) → is_hermitian_unbounded((s, inprod), INTER(s1, s3), INTER(s2, s4), op1 + op3, op2 + op4)"), t402))
}

///|
let add_herm_unbounded_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ADD_HERM_UNBOUNDED")

///|
/// `ADD_HERM_UNBOUNDED`
pub fn add_herm_unbounded() -> @kernel.Thm {
  add_herm_unbounded_c.get()
}

///|
/// SMUL_HERM_UNBOUNDED
fn step_394() -> Unit raise {
  let t405 = @meson.asm_meson_tac(@list.List([inner_space_smul(), @sets.subset(), cop_to_cfun()]))
  let t404 = @impconv.imp_rewrite_tac(@list.List([inprod_lsmul(), inprod_rsmul(), @complexes.cnj_cnj(), inner_space_smul(), @sets.subset(), cop_to_cfun()]))
  let t403 = @tactics.repeat_tac(@tactics.strip_tac)
  let t406 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([is_hermitian_unbounded(), smul_ulincop()])), t403), t404), t405)
  smul_herm_unbounded_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ∀ op1 : ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], ∀ op3 : _, ∀ op4 : _, ∀ s1 : ((A) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s2 : ((A) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s3 : _, ∀ s4 : _, ∀ s : ((A) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((A) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], is_hermitian_unbounded((s, inprod), s1, s2, op1, op2) → is_hermitian_unbounded((s, inprod), s1, s2, cop_smul(a, op1), cop_smul(cnj(a), op2))"), t406))
}

///|
let smul_herm_unbounded_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SMUL_HERM_UNBOUNDED")

///|
/// `SMUL_HERM_UNBOUNDED`
pub fn smul_herm_unbounded() -> @kernel.Thm {
  smul_herm_unbounded_c.get()
}

///|
/// SUB_HERM_UNBOUNDED
fn step_395() -> Unit raise {
  let t408 = @equal.gsym(@complexes.cx_neg())
  let t409 = @equal.gsym(cop_smul_lid_neg())
  let t407 = @utils.spec_v(("a", "Cx x"), smul_herm_unbounded())
  let t410 = @impconv.imp_rewrite_tac(@list.List([add_herm_unbounded(), @simp.rewrite_rule(@list.List([@complexes.cnj_cx()]))(t407), cop_sub_v1(), t409, t408]))
  sub_herm_unbounded_c.set(@tactics.prove(@term_syntax.parse_term("∀ op1 : ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], ∀ op3 : ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], ∀ op4 : ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], ∀ s1 : ((A) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s2 : ((A) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s3 : ((A) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s4 : ((A) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s : ((A) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((A) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], is_hermitian_unbounded((s, inprod), s1, s2, op1, op2) && is_hermitian_unbounded((s, inprod), s3, s4, op3, op4) → is_hermitian_unbounded((s, inprod), INTER(s1, s3), INTER(s2, s4), op1 - op3, op2 - op4)"), t410))
}

///|
let sub_herm_unbounded_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUB_HERM_UNBOUNDED")

///|
/// `SUB_HERM_UNBOUNDED`
pub fn sub_herm_unbounded() -> @kernel.Thm {
  sub_herm_unbounded_c.get()
}

///|
/// MUL_HERM_UNBOUNDED
fn step_396() -> Unit raise {
  let t411 = @simp.simp_tac(@list.List([@sets.in_elim_thm(), cop_mul_v1(), @sets.subset()]))
  let t412 = @tactics.then_tac(@simp.simp_tac(@list.List([is_hermitian_unbounded(), mul_ulincop()])), t411)
  mul_herm_unbounded_c.set(@tactics.prove(@term_syntax.parse_term("∀ op1 : ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], ∀ op3 : ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], ∀ op4 : ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], ∀ s1 : ((A) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s2 : ((A) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s3 : ((A) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s4 : ((A) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s : ((A) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((A) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], is_hermitian_unbounded((s, inprod), s1, s2, op1, op2) && is_hermitian_unbounded((s, inprod), s3, s4, op3, op4) → is_hermitian_unbounded((s, inprod), {(x : (A) -> Cart[Real, Tybit0[Unit]]) | IN(x, s3) && IN(op3(x), s1)}, {(x : (A) -> Cart[Real, Tybit0[Unit]]) | IN(x, s2) && IN(op2(x), s4)}, cop_mul(op1, op3), cop_mul(op4, op2))"), t412))
}

///|
let mul_herm_unbounded_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MUL_HERM_UNBOUNDED")

///|
/// `MUL_HERM_UNBOUNDED`
pub fn mul_herm_unbounded() -> @kernel.Thm {
  mul_herm_unbounded_c.get()
}

///|
/// HERM_ITSELF_UNBOUNDED
fn step_397() -> Unit raise {
  herm_itself_unbounded_c.set(inner_space_prove("forall op1 op2 s1 s2 x y.\n  is_hermitian_unbounded (s,inprod) s1 s2 op1 op2\n  /\\ x IN s2 /\\ y IN s1 ==>\n   inprod x (op1 y) = inprod (op2 x) y", @simp.simp_tac(@list.List([is_hermitian_unbounded()]))))
}

///|
let herm_itself_unbounded_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HERM_ITSELF_UNBOUNDED")

///|
/// `HERM_ITSELF_UNBOUNDED`
pub fn herm_itself_unbounded() -> @kernel.Thm {
  herm_itself_unbounded_c.get()
}

///|
/// HERMITAIN_INPROD_UNBOUNDED
fn step_398() -> Unit raise {
  hermitain_inprod_unbounded_c.set(inner_space_prove("forall op1 op2 op3 s1 s2. is_hermitian_unbounded (s,inprod) s1 s2 op1 op2\n    ==> forall x y. x IN s2 /\\ op3 y IN s1\n      ==> inprod x ((op1 ** op3) y) = inprod (op2 x) (op3 y)", @meson.meson_tac(@list.List([herm_itself_unbounded(), cop_mul_v1()]))))
}

///|
let hermitain_inprod_unbounded_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HERMITAIN_INPROD_UNBOUNDED")

///|
/// `HERMITAIN_INPROD_UNBOUNDED`
pub fn hermitain_inprod_unbounded() -> @kernel.Thm {
  hermitain_inprod_unbounded_c.get()
}

///|
/// HERM_SYM_UNBOUNDED
fn step_399() -> Unit raise {
  let t413 = @meson.meson_tac(@list.List([@sets.subset(), inprod_cnj()]))
  let t414 = @tactics.then_tac(@simp.rewrite_tac(@list.List([forall_inner_space_thm(), is_hermitian_unbounded()])), t413)
  herm_sym_unbounded_c.set(@tactics.prove(@term_syntax.parse_term("∀ is_ : (((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]), ∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ s1 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s2 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, is_hermitian_unbounded(is_, s1, s2, op1, op2) == is_hermitian_unbounded(is_, s2, s1, op2, op1)"), t414))
}

///|
let herm_sym_unbounded_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HERM_SYM_UNBOUNDED")

///|
/// `HERM_SYM_UNBOUNDED`
pub fn herm_sym_unbounded() -> @kernel.Thm {
  herm_sym_unbounded_c.get()
}

///|
/// is_symmetric
fn step_400() -> Unit raise {
  is_symmetric_c.set(@pair.new_definition(@term_syntax.parse_term("(is_symmetric : ((((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]), ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]]) -> Bool)((is_ : (((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]])), (s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool), (op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]])) == is_hermitian_unbounded(is_, s, s, op, op)")))
}

///|
let is_symmetric_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_symmetric")

///|
/// `is_symmetric`
pub fn is_symmetric() -> @kernel.Thm {
  is_symmetric_c.get()
}

///|
/// IS_SYMMETRIC
fn step_401() -> Unit raise {
  is_symmetric_v1_c.set(@simp.rewrite_rule(@list.List([forall_inner_space_thm(), is_hermitian_unbounded()]))(is_symmetric()))
}

///|
let is_symmetric_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IS_SYMMETRIC")

///|
/// `IS_SYMMETRIC`
pub fn is_symmetric_v1() -> @kernel.Thm {
  is_symmetric_v1_c.get()
}

///|
/// SYMMETRIC_IS_LINCOP
fn step_402() -> Unit raise {
  let t415 = @meson.meson_tac(@list.List([is_symmetric(), is_hermitian_unbounded()]))
  symmetric_is_lincop_c.set(@tactics.prove(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ s1 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], is_inner_space((s, inprod)) && is_symmetric((s, inprod), s1, op) → is_unbounded_linear_cop(s1, op)"), t415))
}

///|
let symmetric_is_lincop_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SYMMETRIC_IS_LINCOP")

///|
/// `SYMMETRIC_IS_LINCOP`
pub fn symmetric_is_lincop() -> @kernel.Thm {
  symmetric_is_lincop_c.get()
}

///|
/// SYMMETRIC_SUBSET
fn step_403() -> Unit raise {
  let t416 = @meson.meson_tac(@list.List([is_symmetric(), is_hermitian_unbounded()]))
  symmetric_subset_c.set(@tactics.prove(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ s1 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], is_inner_space((s, inprod)) && is_symmetric((s, inprod), s1, op) → SUBSET(s1, s)"), t416))
}

///|
let symmetric_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SYMMETRIC_SUBSET")

///|
/// `SYMMETRIC_SUBSET`
pub fn symmetric_subset() -> @kernel.Thm {
  symmetric_subset_c.get()
}

///|
/// SYMMETRIC_CLOSURE
fn step_404() -> Unit raise {
  let t417 = @meson.meson_tac(@list.List([is_symmetric(), is_hermitian_unbounded()]))
  symmetric_closure_c.set(@tactics.prove(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ s1 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], is_inner_space((s, inprod)) && is_symmetric((s, inprod), s1, op) → (∀ x : (_) -> Cart[Real, Tybit0[Unit]], IN(x, s1) → IN(op(x), s))"), t417))
}

///|
let symmetric_closure_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SYMMETRIC_CLOSURE")

///|
/// `SYMMETRIC_CLOSURE`
pub fn symmetric_closure() -> @kernel.Thm {
  symmetric_closure_c.get()
}

///|
/// SYMMETRIC_ITSELF
fn step_405() -> Unit raise {
  let t418 = @meson.meson_tac(@list.List([is_symmetric(), is_hermitian_unbounded()]))
  symmetric_itself_c.set(@tactics.prove(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ s1 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], is_inner_space((s, inprod)) && is_symmetric((s, inprod), s1, op) → (∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ y : (_) -> Cart[Real, Tybit0[Unit]], IN(x, s1) && IN(y, s1) → inprod(x, op(y)) == inprod(op(x), y))"), t418))
}

///|
let symmetric_itself_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SYMMETRIC_ITSELF")

///|
/// `SYMMETRIC_ITSELF`
pub fn symmetric_itself() -> @kernel.Thm {
  symmetric_itself_c.get()
}

///|
/// IS_SYMMETRIC_INPROD
fn step_406() -> Unit raise {
  let t419 = @meson.meson_tac(@list.List([is_symmetric(), hermitain_inprod_unbounded()]))
  is_symmetric_inprod_c.set(@tactics.prove(@term_syntax.parse_term("∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ s1 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], is_inner_space((s, inprod)) && is_symmetric((s, inprod), s1, op1) → (∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ y : (_) -> Cart[Real, Tybit0[Unit]], IN(x, s1) && IN(op2(y), s1) → inprod(x, cop_mul(op1, op2, y)) == inprod(op1(x), op2(y)))"), t419))
}

///|
let is_symmetric_inprod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IS_SYMMETRIC_INPROD")

///|
/// `IS_SYMMETRIC_INPROD`
pub fn is_symmetric_inprod() -> @kernel.Thm {
  is_symmetric_inprod_c.get()
}

///|
/// ADD_SYMMETRIC
fn step_407() -> Unit raise {
  let t420 = @meson.meson_tac(@list.List([is_symmetric(), add_herm_unbounded()]))
  add_symmetric_c.set(@tactics.prove(@term_syntax.parse_term("∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ s1 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s2 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], is_symmetric((s, inprod), s1, op1) && is_symmetric((s, inprod), s2, op2) → is_symmetric((s, inprod), INTER(s1, s2), op1 + op2)"), t420))
}

///|
let add_symmetric_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ADD_SYMMETRIC")

///|
/// `ADD_SYMMETRIC`
pub fn add_symmetric() -> @kernel.Thm {
  add_symmetric_c.get()
}

///|
/// SUB_SYMMETRIC
fn step_408() -> Unit raise {
  let t421 = @meson.meson_tac(@list.List([is_symmetric(), sub_herm_unbounded()]))
  sub_symmetric_c.set(@tactics.prove(@term_syntax.parse_term("∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ s1 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s2 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], is_symmetric((s, inprod), s1, op1) && is_symmetric((s, inprod), s2, op2) → is_symmetric((s, inprod), INTER(s1, s2), op1 - op2)"), t421))
}

///|
let sub_symmetric_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUB_SYMMETRIC")

///|
/// `SUB_SYMMETRIC`
pub fn sub_symmetric() -> @kernel.Thm {
  sub_symmetric_c.get()
}

///|
/// SMUL_SYMMETRIC
fn step_409() -> Unit raise {
  let t422 = @meson.meson_tac(@list.List([is_symmetric(), smul_herm_unbounded(), @complexes.real_cnj()]))
  smul_symmetric_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ∀ ops : _, ∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], real(a) && is_symmetric((s, inprod), (s1 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool), (op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]])) → is_symmetric((s, inprod), s1, cop_smul(a, op))"), t422))
}

///|
let smul_symmetric_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SMUL_SYMMETRIC")

///|
/// `SMUL_SYMMETRIC`
pub fn smul_symmetric() -> @kernel.Thm {
  smul_symmetric_c.get()
}

///|
/// POW2_SYM_UNBOUNDED
fn step_410() -> Unit raise {
  let t423 = @simp.simp_tac(@list.List([is_symmetric(), mul_herm_unbounded()]))
  pow2_sym_unbounded_c.set(@tactics.prove(@term_syntax.parse_term("∀ op : ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], ∀ s1 : ((A) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s : ((A) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((A) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], is_symmetric((s, inprod), s1, op) → is_symmetric((s, inprod), {(x : (A) -> Cart[Real, Tybit0[Unit]]) | IN(x, s1) && IN(op(x), s1)}, cop_mul(op, op))"), t423))
}

///|
let pow2_sym_unbounded_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POW2_SYM_UNBOUNDED")

///|
/// `POW2_SYM_UNBOUNDED`
pub fn pow2_sym_unbounded() -> @kernel.Thm {
  pow2_sym_unbounded_c.get()
}

///|
/// I_SYMMETRIC
fn step_411() -> Unit raise {
  let t424 = @simp.simp_tac(@list.List([is_symmetric_v1(), i_ulincop(), is_unbounded_linear_cop(), @trivia.i_thm(), @sets.subset()]))
  i_symmetric_c.set(@tactics.prove(@term_syntax.parse_term("∀ s1 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], SUBSET(s1, s) && is_cfun_subspace(s1) → is_symmetric((s, inprod), s1, I)"), t424))
}

///|
let i_symmetric_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("I_SYMMETRIC")

///|
/// `I_SYMMETRIC`
pub fn i_symmetric() -> @kernel.Thm {
  i_symmetric_c.get()
}

///|
/// symmetric_thms
fn step_412() -> Unit raise {
  symmetric_thms_c.set(Ref::{ val: @list.List([]) })
}

///|
let symmetric_thms_c : @lib.Cell[Ref[@list.List[@kernel.Thm]]] = @lib.Cell::new("symmetric_thms")

///|
/// `symmetric_thms`
pub fn symmetric_thms() -> Ref[@list.List[@kernel.Thm]] {
  symmetric_thms_c.get()
}

///|
/// `add_symmetric_thm`
pub fn add_symmetric_thm(x425 : @kernel.Thm) -> Unit raise {
  let thm = x425
  let thm_1 = @utils.gimp_imp_v1(thm)
  {
    symmetric_thms().val = (symmetric_thms().val).prepend(thm_1)
    ()
  }
  let eta_thm = @simp.simp_rule(@list.List([@class.eta_ax()]))(thm_1)
  if !@basics.equals_thm(thm_1, eta_thm) {
    {
      selfadjoint_thms().val = (symmetric_thms().val).prepend(eta_thm)
      ()
    }
  } else {
    ()
  }
}

///|
/// add_symmetric_thms
fn step_413() -> Unit raise {
  add_symmetric_thms_c.set(x426 => @lib.do_list(add_symmetric_thm, x426))
}

///|
let add_symmetric_thms_c : @lib.Cell[(@list.List[@kernel.Thm]) -> Unit raise] = @lib.Cell::new("add_symmetric_thms")

///|
/// `add_symmetric_thms`
pub fn add_symmetric_thms(x : @list.List[@kernel.Thm]) -> Unit raise {
  (add_symmetric_thms_c.get())(x)
}

///|
/// Functionspaces/cfunspace.ml:1943
fn step_414() -> Unit raise {
  add_symmetric_thms(@list.List([add_symmetric(), sub_symmetric(), smul_symmetric(), @simp.rewrite_rule(@list.List([cop_smul_v1()]))(smul_symmetric()), i_symmetric(), pow2_sym_unbounded()]))
}

///|
/// `SYMMETRIC_TAC`
pub fn symmetric_tac(x427 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let g = x427
  let match_mp_tac : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise = fn(x428 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let x = x428
    fn(x429 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      let y = x429
      @tactics.match_mp_tac(x)(y)
    }
  }
  let t434 = symmetric_thms().val
  let try_symmetric_thm : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = @tactics.asm_tac((x433 : @list.List[@kernel.Thm]) => @tactics.map_first(fn(x430 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let x_1 = x430
    let t432 = match_mp_tac(x_1)
    @tactics.orelse_tac(@tactics.match_accept_tac(x_1), t432)
  }, x433))(t434)
  let t436 = real_tac_v2(Some(@list.List([symmetric_tac, ulinearity_tac])))
  let t435 = @tactics.then_tac(@simp.asm_simp_tac(@list.List([])), @tactics.no_tac)
  let loop_ : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = @tactics.orelse_tac(@tactics.orelse_tac(@tactics.orelse_tac(@tactics.orelse_tac(try_symmetric_thm, @tactics.then_tac(@simp.simp_tac(@list.List([@class.eta_ax()])), try_symmetric_thm)), t435), ulinearity_tac), t436)
  @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), fn(x437 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    let (_, c) as g_1 = x437
    let head = @basics.strip_comb(c).0
    if (if (@printer.name_of(head) == "is_symmetric") {
      let t438 = @kernel.type_of(head)
      let t439 = @parser.parse_type("inner_space->(cfun->boo)->cop->bool")
      @lib.can((x440 : @list.List[(@kernel.HolType, @kernel.HolType)]) => @basics.type_match(t439, t438, x440), @list.List([]))
    } else {
      false
    }) {
      @tactics.changed_tac(@tactics.repeat_tac(@tactics.then_tac(loop_, @tactics.repeat_tac(@tactics.conj_tac))))(g_1)
    } else {
      @tactics.fail_tac("bad goal")(g_1)
    }
  })(g)
}

///|
/// `REAL_TAC`
pub fn real_tac(x441 : @list.List[((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise]?) -> ((@tactics.Goal) -> @tactics.Goalstate raise) raise {
  let _opt_ = x441
  let alternatives = match _opt_ {
    Some(_sth_) => _sth_
    None => @list.List([])
  }
  real_tac_v2(Some((((alternatives.prepend(linearity_tac)).prepend(self_adjoint_tac)).prepend(ulinearity_tac)).prepend(symmetric_tac)))
}

///|
/// ANTI_COMMUTATOR_SYMMETRIC
fn step_415() -> Unit raise {
  let t448 = @tactics.assum_list(@sets.set_tac)
  let t447 = @tactics.assum_list(@sets.set_tac)
  let t449 = @tactics.then_tac(@impconv.imp_rewrite_tac(@list.List([@sets.subset(), inner_space_add(), cop_add_thm(), cop_mul_v1()])), t447)
  let t446 = @meson.asm_meson_tac(@list.List([@sets.subset()]))
  let t445 = @simp.asm_simp_tac(@list.List([@complexes.complex_add_sym()]))
  let t444 = @impconv.imp_rewrite_tac(@list.List([cop_mul_v1(), inprod_add_ldist(), inprod_add_rdist(), @sets.subset(), @sets.inter(), cop_add_thm()]))
  let t450 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@sets.inter(), @sets.in_elim_thm()]))), t444), t445), t446), t449, ulinearity_tac, t448])
  let t443 = @tactics.repeat_tac(@tactics.strip_tac)
  let t451 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([is_symmetric_v1()])), @utils.simp_horn_tac), t443), t450)
  anti_commutator_symmetric_c.set(@tactics.prove(@term_syntax.parse_term("∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ s1 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s2 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], is_symmetric((s, inprod), s1, op1) && is_symmetric((s, inprod), s2, op2) → is_symmetric((s, inprod), INTER({(x : (_) -> Cart[Real, Tybit0[Unit]]) | IN(x, s2) && IN(op2(x), s1)}, {(x : (_) -> Cart[Real, Tybit0[Unit]]) | IN(x, s1) && IN(op1(x), s2)}), cop_mul(op1, op2) + cop_mul(op2, op1))"), t451))
}

///|
let anti_commutator_symmetric_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANTI_COMMUTATOR_SYMMETRIC")

///|
/// `ANTI_COMMUTATOR_SYMMETRIC`
pub fn anti_commutator_symmetric() -> @kernel.Thm {
  anti_commutator_symmetric_c.get()
}

///|
/// Functionspaces/cfunspace.ml:1980
fn step_416() -> Unit raise {
  add_symmetric_thm(anti_commutator_symmetric())
}

///|
/// NEG_SYMMETRIC
fn step_417() -> Unit raise {
  let t452 = @simp.rewrite_tac(@list.List([@complexes.real_cx(), @equal.gsym(@complexes.cx_neg())]))
  let t453 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([cop_arith(@term_syntax.parse_term("-(op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]]) == cop_smul(-Cx(real_of_num(1)), op)"))])), symmetric_tac), t452)
  neg_symmetric_c.set(@tactics.prove(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ s1 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], is_symmetric((s, inprod), s1, op) → is_symmetric((s, inprod), s1, -op)"), t453))
}

///|
let neg_symmetric_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NEG_SYMMETRIC")

///|
/// `NEG_SYMMETRIC`
pub fn neg_symmetric() -> @kernel.Thm {
  neg_symmetric_c.get()
}

///|
/// Functionspaces/cfunspace.ml:1988
fn step_418() -> Unit raise {
  add_symmetric_thm(neg_symmetric())
}

///|
/// SCALAR_II_HERM_UNBOUND
fn step_419() -> Unit raise {
  let t455 = @tactics.assum_list(@sets.set_tac)
  let t454 = @impconv.imp_rewrite_tac(@list.List([is_symmetric_v1(), cop_smul_thm(), inprod_lsmul(), inprod_rsmul(), @complexes.cnj_ii(), @complexes.complex_neg_mul2(), @sets.subset(), inner_space_smul(), smul_ulincop()]))
  let t456 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t454), t455)
  scalar_ii_herm_unbound_c.set(@tactics.prove(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ s1 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], is_unbounded_linear_cop(s1, op) && SUBSET(s1, s) && (∀ x : (_) -> Cart[Real, Tybit0[Unit]], IN(x, s1) → IN(op(x), s)) && (∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ y : (_) -> Cart[Real, Tybit0[Unit]], IN(x, s1) && IN(y, s1) → inprod(op(x), y) == -inprod(x, op(y))) → is_symmetric((s, inprod), s1, cop_smul(ii, op))"), t456))
}

///|
let scalar_ii_herm_unbound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SCALAR_II_HERM_UNBOUND")

///|
/// `SCALAR_II_HERM_UNBOUND`
pub fn scalar_ii_herm_unbound() -> @kernel.Thm {
  scalar_ii_herm_unbound_c.get()
}

///|
/// Functionspaces/cfunspace.ml:2001
fn step_420() -> Unit raise {
  add_symmetric_thm(scalar_ii_herm_unbound())
}

///|
/// COMMUTATOR_ANTI_UNBOUNDED_HERM
fn step_421() -> Unit raise {
  let t457 = @sets.set_tac(@list.List([]))
  let t458 = @tactics.then_tac(@impconv.imp_rewrite_tac(@list.List([commutator(), is_symmetric_v1(), cop_mul_thm(), cop_sub_thm(), inprod_sub_ldist(), inprod_sub_rdist(), @complexes.complex_neg_sub(), inprod_sub_ldist(), inprod_sub_rdist(), @complexes.complex_neg_sub()])), t457)
  commutator_anti_unbounded_herm_c.set(@tactics.prove(@term_syntax.parse_term("∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ s1 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s2 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], is_inner_space((s, inprod)) && is_symmetric((s, inprod), s1, op1) && is_symmetric((s, inprod), s2, op2) → (∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ y : (_) -> Cart[Real, Tybit0[Unit]], IN(x, s2) && IN(op2(x), s1) && IN(x, s1) && IN(op1(x), s2) && IN(y, s2) && IN(op2(y), s1) && IN(y, s1) && IN(op1(y), s2) → inprod(com(op1, op2, x), y) == -inprod(x, com(op1, op2, y)))"), t458))
}

///|
let commutator_anti_unbounded_herm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMMUTATOR_ANTI_UNBOUNDED_HERM")

///|
/// `COMMUTATOR_ANTI_UNBOUNDED_HERM`
pub fn commutator_anti_unbounded_herm() -> @kernel.Thm {
  commutator_anti_unbounded_herm_c.get()
}

///|
/// Functionspaces/cfunspace.ml:2014
fn step_422() -> Unit raise {
  add_symmetric_thm(commutator_anti_unbounded_herm())
}

///|
/// II_COMMUTATOR_UNBOUNDED_HERM
fn step_423() -> Unit raise {
  let t464 = @meson.asm_meson_tac(@list.List([symmetric_subset(), @sets.subset()]))
  let t463 = @impconv.imp_rewrite_tac(@list.List([symmetric_itself(), @complexes.complex_field(@term_syntax.parse_term("-((a : Cart[Real, Tybit0[Unit]]) - (b : Cart[Real, Tybit0[Unit]])) == b - a")), symmetric_subset(), symmetric_closure()]))
  let t462 = @impconv.imp_rewrite_tac(@list.List([inprod_sub_rdist(), inprod_sub_ldist()]))
  let t465 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([commutator(), @sets.inter(), @sets.in_elim_thm(), cop_sub_thm(), cop_mul_v1()])), t462), t463), t464)
  let t461 = @meson.asm_meson_tac(@list.List([symmetric_closure(), symmetric_subset(), @sets.subset(), inner_space_sub()]))
  let t466 = @tactics.then_tac(@simp.rewrite_tac(@list.List([commutator(), @sets.inter(), @sets.in_elim_thm(), cop_sub_thm(), cop_mul_v1()])), t461)
  let t460 = @meson.asm_meson_tac(@list.List([@sets.subset(), symmetric_subset()]))
  let t467 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @sets.inter(), @sets.in_elim_thm()])), t460)
  let t459 = @meson.asm_meson_tac(@list.List([symmetric_is_lincop()]))
  let t468 = @tactics.thenl(symmetric_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([commutator()])), ulinearity_tac), t459), t467, t466, t465]))
  ii_commutator_unbounded_herm_c.set(@tactics.prove(@term_syntax.parse_term("∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ s1 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s2 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], is_inner_space((s, inprod)) && is_symmetric((s, inprod), s1, op1) && is_symmetric((s, inprod), s2, op2) → is_symmetric((s, inprod), INTER({(x : (_) -> Cart[Real, Tybit0[Unit]]) | IN(x, s2) && IN(op2(x), s1)}, {(x : (_) -> Cart[Real, Tybit0[Unit]]) | IN(x, s1) && IN(op1(x), s2)}), cop_smul(ii, com(op1, op2)))"), t468))
}

///|
let ii_commutator_unbounded_herm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("II_COMMUTATOR_UNBOUNDED_HERM")

///|
/// `II_COMMUTATOR_UNBOUNDED_HERM`
pub fn ii_commutator_unbounded_herm() -> @kernel.Thm {
  ii_commutator_unbounded_herm_c.get()
}

///|
/// Functionspaces/cfunspace.ml:2032
fn step_424() -> Unit raise {
  add_symmetric_thm(ii_commutator_unbounded_herm())
}

///|
/// EXPEC_UNBOUNDED_HERM_REAL
fn step_425() -> Unit raise {
  let t469 = @simp.simp_tac(@list.List([@sets.subset()]))
  let t470 = @tactics.then_tac(@impconv.imp_rewrite_tac(@list.List([is_symmetric_v1(), expectation(), @complexes.real_cnj(), inprod_cnj()])), t469)
  expec_unbounded_herm_real_c.set(@tactics.prove(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ s1 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], is_inner_space((s, inprod)) && is_symmetric((s, inprod), s1, op) → (∀ state : (_) -> Cart[Real, Tybit0[Unit]], IN(state, s1) → real(expectation(inprod, state, op)))"), t470))
}

///|
let expec_unbounded_herm_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXPEC_UNBOUNDED_HERM_REAL")

///|
/// `EXPEC_UNBOUNDED_HERM_REAL`
pub fn expec_unbounded_herm_real() -> @kernel.Thm {
  expec_unbounded_herm_real_c.get()
}

///|
/// Functionspaces/cfunspace.ml:2041
fn step_426() -> Unit raise {
  add_real_thms(@list.List([expec_unbounded_herm_real(), @simp.rewrite_rule(@list.List([expectation()]))(expec_unbounded_herm_real())]))
}

///|
/// DEVIATION_UNBOUNDED_HERM_ALT
fn step_427() -> Unit raise {
  let t471 = @meson.asm_meson_tac(@list.List([symmetric_subset(), @sets.subset(), symmetric_is_lincop(), ulincop_subspace()]))
  let t472 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([deviation_alt()])), symmetric_tac), t471)
  deviation_unbounded_herm_alt_c.set(@tactics.prove(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ s1 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], ∀ state : (_) -> Cart[Real, Tybit0[Unit]], is_inner_space((s, inprod)) && is_symmetric((s, inprod), s1, op) && IN(state, s1) → is_symmetric((s, inprod), INTER(s1, s1), deviation(inprod, state, op))"), t472))
}

///|
let deviation_unbounded_herm_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DEVIATION_UNBOUNDED_HERM_ALT")

///|
/// `DEVIATION_UNBOUNDED_HERM_ALT`
pub fn deviation_unbounded_herm_alt() -> @kernel.Thm {
  deviation_unbounded_herm_alt_c.get()
}

///|
/// DEVIATION_UNBOUNDED_HERM
fn step_428() -> Unit raise {
  deviation_unbounded_herm_c.set(@simp.rewrite_rule(@list.List([@sets.set_rule(@term_syntax.parse_term("INTER((s : (_) -> Bool), s) == s"))]))(deviation_unbounded_herm_alt()))
}

///|
let deviation_unbounded_herm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DEVIATION_UNBOUNDED_HERM")

///|
/// `DEVIATION_UNBOUNDED_HERM`
pub fn deviation_unbounded_herm() -> @kernel.Thm {
  deviation_unbounded_herm_c.get()
}

///|
/// Functionspaces/cfunspace.ml:2053
fn step_429() -> Unit raise {
  add_symmetric_thms(@list.List([deviation_unbounded_herm(), @simp.rewrite_rule(@list.List([deviation()]))(deviation_unbounded_herm())]))
}

///|
/// VARIANCE_UNBOUNDED_REAL
fn step_430() -> Unit raise {
  let t476 = @simp.asm_simp_tac(@list.List([@sets.in_elim_thm()]))
  let arg : (@list.List[((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise]?) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise = real_tac
  let t477 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([variance()])), fn(x473 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    let eta = x473
    arg(None)(eta)
  }), (x474 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @q.exists_tac("{x| x IN s1 /\\  deviation inprod state op x IN s1}", x474)), (x475 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @q.exists_tac("s", x475)), t476), symmetric_tac)
  variance_unbounded_real_c.set(@tactics.prove(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ s1 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], is_inner_space((s, inprod)) && is_symmetric((s, inprod), s1, op) → (∀ state : (_) -> Cart[Real, Tybit0[Unit]], IN(state, s1) && IN(deviation(inprod, state, op, state), s1) → real(variance(inprod, state, op)))"), t477))
}

///|
let variance_unbounded_real_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VARIANCE_UNBOUNDED_REAL")

///|
/// `VARIANCE_UNBOUNDED_REAL`
pub fn variance_unbounded_real() -> @kernel.Thm {
  variance_unbounded_real_c.get()
}

///|
/// Functionspaces/cfunspace.ml:2066
fn step_431() -> Unit raise {
  add_real_thm(variance_real())
}

///|
/// is_eigen_pair_unbounded
fn step_432() -> Unit raise {
  is_eigen_pair_unbounded_c.set(@pair.new_definition(@term_syntax.parse_term("(is_eigen_pair_unbounded : (((A) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]], ((A) -> Cart[Real, Tybit0[Unit]], Cart[Real, Tybit0[Unit]])) -> Bool)((s : ((A) -> Cart[Real, Tybit0[Unit]]) -> Bool), (op : ((A) -> Cart[Real, Tybit0[Unit]], A) -> Cart[Real, Tybit0[Unit]]), ((x : (A) -> Cart[Real, Tybit0[Unit]]), (a : Cart[Real, Tybit0[Unit]]))) == (is_unbounded_linear_cop(s, op) → IN(x, s) && op(x) == cfun_smul(a, x) && !(x == cfun_zero))")))
}

///|
let is_eigen_pair_unbounded_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_eigen_pair_unbounded")

///|
/// `is_eigen_pair_unbounded`
pub fn is_eigen_pair_unbounded() -> @kernel.Thm {
  is_eigen_pair_unbounded_c.get()
}

///|
/// EIGEN_PAIR_SMUL_UNBOUNDED
fn step_433() -> Unit raise {
  let t478 = @meson.meson_tac(@list.List([ulincop_smul(), ulincop_subspace(), cfun_smul_sym(), cfun_subspace_smul()]))
  let t479 = @tactics.then_tac(@simp.simp_tac(@list.List([is_eigen_pair_unbounded(), cfun_entire()])), t478)
  eigen_pair_smul_unbounded_c.set(@tactics.prove(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ v : Cart[Real, Tybit0[Unit]], ∀ x : (_) -> Cart[Real, Tybit0[Unit]], is_eigen_pair_unbounded(s, op, (x, v)) → (∀ a : Cart[Real, Tybit0[Unit]], !(a == Cx(real_of_num(0))) → is_eigen_pair_unbounded(s, op, (cfun_smul(a, x), v)))"), t479))
}

///|
let eigen_pair_smul_unbounded_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EIGEN_PAIR_SMUL_UNBOUNDED")

///|
/// `EIGEN_PAIR_SMUL_UNBOUNDED`
pub fn eigen_pair_smul_unbounded() -> @kernel.Thm {
  eigen_pair_smul_unbounded_c.get()
}

///|
/// EIGEN_PAIR_ADD_UNBOUNDED
fn step_434() -> Unit raise {
  let t480 = @meson.meson_tac(@list.List([ulincop_add(), cfun_add_ldistrib(), ulincop_subspace(), cfun_subspace_add()]))
  let t481 = @tactics.then_tac(@simp.simp_tac(@list.List([is_eigen_pair_unbounded()])), t480)
  eigen_pair_add_unbounded_c.set(@tactics.prove(@term_syntax.parse_term("∀ op : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ v : Cart[Real, Tybit0[Unit]], ∀ x : (_) -> Cart[Real, Tybit0[Unit]], ∀ y : (_) -> Cart[Real, Tybit0[Unit]], is_eigen_pair_unbounded(s, op, (x, v)) && is_eigen_pair_unbounded(s, op, (y, v)) && !(x + y == cfun_zero) → is_eigen_pair_unbounded(s, op, (x + y, v))"), t481))
}

///|
let eigen_pair_add_unbounded_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EIGEN_PAIR_ADD_UNBOUNDED")

///|
/// `EIGEN_PAIR_ADD_UNBOUNDED`
pub fn eigen_pair_add_unbounded() -> @kernel.Thm {
  eigen_pair_add_unbounded_c.get()
}

///|
/// cfun_norm
fn step_435() -> Unit raise {
  cfun_norm_c.set(@pair.new_definition(@term_syntax.parse_term("(cfun_norm : (((A) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]]) -> Real)((inprod : ((A) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]), (x : (A) -> Cart[Real, Tybit0[Unit]])) == sqrt(real_of_complex(inprod(x, x)))")))
}

///|
let cfun_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cfun_norm")

///|
/// `cfun_norm`
pub fn cfun_norm() -> @kernel.Thm {
  cfun_norm_c.get()
}

///|
/// INPROD_SUB_SELF
fn step_436() -> Unit raise {
  let t482 = @impconv.imp_rewrite_tac(@list.List([real_of_complex_add(), real_of_complex_cx(), real_of_complex_sub(), inprod_self_real(), @complexes.real_cx(), @complexes.real_sub()]))
  inprod_sub_self_c.set(inner_space_prove("forall x y. x IN s /\\ y IN s\n     ==> real_of_complex (inprod (x-y) (x-y)) = real_of_complex(inprod x x) +\n            real_of_complex(inprod y y) - &2*Re(inprod y x)", @tactics.then_tac(@impconv.imp_rewrite_tac(@list.List([inner_space_sub(), inprod_sub_ldist(), inprod_sub_rdist(), @complexes.complex_field(@term_syntax.parse_term("(x : Cart[Real, Tybit0[Unit]]) - (y : Cart[Real, Tybit0[Unit]]) - ((z : Cart[Real, Tybit0[Unit]]) - (h : Cart[Real, Tybit0[Unit]])) == x + (h - (z + y))")), inprod_add_cnj()])), t482)))
}

///|
let inprod_sub_self_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INPROD_SUB_SELF")

///|
/// `INPROD_SUB_SELF`
pub fn inprod_sub_self() -> @kernel.Thm {
  inprod_sub_self_c.get()
}

///|
/// INPROD_ADD_SELF
fn step_437() -> Unit raise {
  let t483 = @impconv.imp_rewrite_tac(@list.List([real_of_complex_add(), real_of_complex_cx(), inprod_self_real(), @complexes.real_cx(), @complexes.real_add()]))
  inprod_add_self_c.set(inner_space_prove("forall x y. x IN s /\\ y IN s\n     ==> real_of_complex (inprod (x+y) (x+y)) = real_of_complex(inprod x x) +\n            real_of_complex(inprod y y) + &2*Re(inprod x y)", @tactics.then_tac(@impconv.imp_rewrite_tac(@list.List([inner_space_add(), inprod_add_ldist(), inprod_add_rdist(), @complexes.complex_field(@term_syntax.parse_term("(x : Cart[Real, Tybit0[Unit]]) + (y : Cart[Real, Tybit0[Unit]]) + ((z : Cart[Real, Tybit0[Unit]]) + (h : Cart[Real, Tybit0[Unit]])) == x + (h + (y + z))")), inprod_add_cnj()])), t483)))
}

///|
let inprod_add_self_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INPROD_ADD_SELF")

///|
/// `INPROD_ADD_SELF`
pub fn inprod_add_self() -> @kernel.Thm {
  inprod_add_self_c.get()
}

///|
/// INPROD_TRIANGLE_INEQ
fn step_438() -> Unit raise {
  let t488 = @calc_int.real_int_lt_conv(@term_syntax.parse_term("real_of_num(0) < real_of_num(2)"))
  let t489 = @meson.meson_tac(@list.List([@bool.gen_all(@q.spec("Re z", @real.real_abs_le())), @complexes.complex_norm_ge_re_im(), t488, schwarz_inequality2(), @realax.real_le_trans()]))
  let t487 = @impconv.imp_rewrite_tac(@list.List([inprod_add_self(), @realax.real_add_assoc(), @realax.real_le_ladd_imp(), @real.real_le_lmul_eq()]))
  let t486 = @impconv.imp_rewrite_tac(@list.List([@real.sqrt_pow_2(), inprod_self_pos()]))
  let t484 = @calc_rat.real_arith(@term_syntax.parse_term("(x : Real) * x + (x * (y : Real) + (x * y + y * y)) == pow(x, 2) + (pow(y, 2) + real_of_num(2) * (x * y))"))
  let t485 = @simp.simp_tac(@list.List([@realax.real_add_ldistrib(), @real.real_add_rdistrib(), @realax.real_mul_sym(), @equal.gsym(@realax.real_add_assoc()), t484]))
  inprod_triangle_ineq_c.set(inner_space_prove("forall x y. x IN s /\\ y IN s\n    ==> real_of_complex(inprod (x+y) (x+y)) <=\n          (sqrt(real_of_complex (inprod x x)) +\n          sqrt(real_of_complex (inprod y y))) pow 2", @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realarith.real_pow_2()])), t485), t486), t487), t489)))
}

///|
let inprod_triangle_ineq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INPROD_TRIANGLE_INEQ")

///|
/// `INPROD_TRIANGLE_INEQ`
pub fn inprod_triangle_ineq() -> @kernel.Thm {
  inprod_triangle_ineq_c.get()
}

///|
/// INPROD_TRIANGLE_INEQ2
fn step_439() -> Unit raise {
  let real_manop = @bool.gen_all(@q.specl(@list.List(["sqrt x", "sqrt y + sqrt z"]), @bool.gen_all(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) && real_of_num(0) <= (y : Real) → (x <= y) == (abs(x) <= abs(y))")))))
  inprod_triangle_ineq2_c.set(inner_space_prove("forall x y. x IN s /\\ y IN s\n    ==> sqrt (real_of_complex(inprod (x+y) (x+y))) <=\n          sqrt(real_of_complex (inprod x x)) +\n          sqrt(real_of_complex (inprod y y))", @impconv.imp_rewrite_tac(@list.List([real_manop, @real.real_le_square_abs(), @real.sqrt_pow_2(), inprod_triangle_ineq(), inprod_self_pos(), @real.sqrt_pos_le(), inner_space_add(), @realarith.real_le_add()]))))
}

///|
let inprod_triangle_ineq2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INPROD_TRIANGLE_INEQ2")

///|
/// `INPROD_TRIANGLE_INEQ2`
pub fn inprod_triangle_ineq2() -> @kernel.Thm {
  inprod_triangle_ineq2_c.get()
}

///|
/// CFUN_NORM_SUB
fn step_440() -> Unit raise {
  let t493 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) + ((y : Real) - (z : Real)) == y + (x - z)"))]))
  let t492 = @simp.once_simp_tac(@list.List([@complexes.complex_add_sym()]))
  let t491 = @impconv.imp_rewrite_tac(@list.List([@equal.gsym(inprod_add_cnj())]))
  let t490 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@q.spec("&2 *Re r", @complexes.re_cx()))]))
  cfun_norm_sub_c.set(inner_space_prove("forall x y. x IN s /\\ y IN s\n     ==> cfun_norm inprod (x-y) = cfun_norm inprod (y-x)", @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@impconv.imp_rewrite_tac(@list.List([cfun_norm(), inprod_sub_self()])), t490), t491), t492), t493)))
}

///|
let cfun_norm_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_NORM_SUB")

///|
/// `CFUN_NORM_SUB`
pub fn cfun_norm_sub() -> @kernel.Thm {
  cfun_norm_sub_c.get()
}

///|
/// CFUN_NORM_SUB_INEQ
fn step_441() -> Unit raise {
  let t494 = @term_syntax.parse_term("cfun_norm((inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]), (x : (_) -> Cart[Real, Tybit0[Unit]])) - cfun_norm(inprod, (y : (_) -> Cart[Real, Tybit0[Unit]])) == cfun_norm(inprod, x - y + y) - cfun_norm(inprod, y)")
  let arrange = @meson.meson(@list.List([cfun_arith(@term_syntax.parse_term("(x : (A) -> Cart[Real, Tybit0[Unit]]) == x - (y : (A) -> Cart[Real, Tybit0[Unit]]) + y"))]), t494)
  let t495 = @impconv.imp_rewrite_tac(@list.List([inprod_triangle_ineq2(), @real.real_le_sub_radd(), cfun_norm(), inner_space_sub()]))
  cfun_norm_sub_ineq_c.set(inner_space_prove("forall x y. x IN s /\\ y IN s\n     ==> cfun_norm inprod x - cfun_norm inprod y <= cfun_norm inprod (x-y)", @tactics.then_tac(@simp.once_rewrite_tac(@list.List([arrange])), t495)))
}

///|
let cfun_norm_sub_ineq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_NORM_SUB_INEQ")

///|
/// `CFUN_NORM_SUB_INEQ`
pub fn cfun_norm_sub_ineq() -> @kernel.Thm {
  cfun_norm_sub_ineq_c.get()
}

///|
/// cfun_dist
fn step_442() -> Unit raise {
  cfun_dist_c.set(@pair.new_definition(@term_syntax.parse_term("(cfun_dist : (((A) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]]) -> Real)((inprod : ((A) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]), (x : (A) -> Cart[Real, Tybit0[Unit]]), (y : (A) -> Cart[Real, Tybit0[Unit]])) == sqrt(real_of_complex(inprod(x - y, x - y)))")))
}

///|
let cfun_dist_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cfun_dist")

///|
/// `cfun_dist`
pub fn cfun_dist() -> @kernel.Thm {
  cfun_dist_c.get()
}

///|
/// CFUN_DIST_TRIANGLE_ADD
fn step_443() -> Unit raise {
  cfun_dist_triangle_add_c.set(inner_space_prove("forall x y x' y'. x IN s /\\ y IN s /\\ x' IN s /\\ y' IN s\n     ==> cfun_dist inprod (x+y) (x'+y')\n           <= cfun_dist inprod x x' + cfun_dist inprod y y'", @impconv.imp_rewrite_tac(@list.List([cfun_dist(), cfun_arith(@term_syntax.parse_term("(x : (A) -> Cart[Real, Tybit0[Unit]]) + (y : (A) -> Cart[Real, Tybit0[Unit]]) - ((x' : (A) -> Cart[Real, Tybit0[Unit]]) + (y' : (A) -> Cart[Real, Tybit0[Unit]])) == x - x' + (y - y')")), inprod_triangle_ineq2(), inner_space_sub(), inprod_self_pos(), @real.sqrt_pos_le(), @real.sqrt_mono_le(), @real.real_abs_refl(), @real.sqrt_pow_2(), @real.pow_2_sqrt()]))))
}

///|
let cfun_dist_triangle_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_DIST_TRIANGLE_ADD")

///|
/// `CFUN_DIST_TRIANGLE_ADD`
pub fn cfun_dist_triangle_add() -> @kernel.Thm {
  cfun_dist_triangle_add_c.get()
}

///|
/// CFUN_DIST_REFL
fn step_444() -> Unit raise {
  let t496 = @meson.meson_tac(@list.List([inprod_zero(), @real.sqrt_0(), real_of_complex_cx()]))
  cfun_dist_refl_c.set(inner_space_prove("forall x. cfun_dist inprod x x = &0", @tactics.then_tac(@simp.rewrite_tac(@list.List([cfun_dist(), cfun_sub_refl()])), t496)))
}

///|
let cfun_dist_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_DIST_REFL")

///|
/// `CFUN_DIST_REFL`
pub fn cfun_dist_refl() -> @kernel.Thm {
  cfun_dist_refl_c.get()
}

///|
/// CFUN_NORM_0
fn step_445() -> Unit raise {
  cfun_norm_0_c.set(inner_space_prove("cfun_norm inprod cfun_zero = &0", @meson.meson_tac(@list.List([cfun_norm(), inprod_zero(), real_of_complex_cx(), @real.sqrt_0()]))))
}

///|
let cfun_norm_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_NORM_0")

///|
/// `CFUN_NORM_0`
pub fn cfun_norm_0() -> @kernel.Thm {
  cfun_norm_0_c.get()
}

///|
/// CFUN_NORM_EQ_0
fn step_446() -> Unit raise {
  cfun_norm_eq_0_c.set(inner_space_prove("forall x. x IN s ==> (cfun_norm inprod x = &0 <=> (x  equv cfun_zero) inprod)", @meson.meson_tac(@list.List([cfun_norm(), @real.sqrt_eq_0(), real_of_complex_zero(), inprod_norm(), @equal.gsym(equv_zero())]))))
}

///|
let cfun_norm_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_NORM_EQ_0")

///|
/// `CFUN_NORM_EQ_0`
pub fn cfun_norm_eq_0() -> @kernel.Thm {
  cfun_norm_eq_0_c.get()
}

///|
/// CFUN_NORM_POS_LE
fn step_447() -> Unit raise {
  cfun_norm_pos_le_c.set(inner_space_prove("forall x. x IN s ==> &0 <= cfun_norm inprod x ", @meson.meson_tac(@list.List([cfun_norm(), @real.sqrt_pos_le(), inprod_self_pos()]))))
}

///|
let cfun_norm_pos_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_NORM_POS_LE")

///|
/// `CFUN_NORM_POS_LE`
pub fn cfun_norm_pos_le() -> @kernel.Thm {
  cfun_norm_pos_le_c.get()
}

///|
/// CFUN_NORM_POW2
fn step_448() -> Unit raise {
  cfun_norm_pow2_c.set(inner_space_prove("forall x. x IN s ==> cfun_norm inprod x pow 2 = real_of_complex (inprod x x)", @meson.meson_tac(@list.List([cfun_norm(), @real.sqrt_pow_2(), inprod_self_pos()]))))
}

///|
let cfun_norm_pow2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_NORM_POW2")

///|
/// `CFUN_NORM_POW2`
pub fn cfun_norm_pow2() -> @kernel.Thm {
  cfun_norm_pow2_c.get()
}

///|
/// CFUN_NORM_INPROD_0
fn step_449() -> Unit raise {
  cfun_norm_inprod_0_c.set(inner_space_prove("forall x. x IN s ==> (cfun_norm inprod x = &0 <=>\n                   real_of_complex(inprod x x) = &0)", @meson.meson_tac(@list.List([cfun_norm(), inprod_self_pos(), @real.sqrt_eq_0()]))))
}

///|
let cfun_norm_inprod_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_NORM_INPROD_0")

///|
/// `CFUN_NORM_INPROD_0`
pub fn cfun_norm_inprod_0() -> @kernel.Thm {
  cfun_norm_inprod_0_c.get()
}

///|
/// CFUN_NORM_NZ
fn step_450() -> Unit raise {
  let t497 = @meson.meson_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(y : Real) <= (x : Real) → !(x == y) == (y < x)")), cfun_norm_pos_le()]))
  cfun_norm_nz_c.set(inner_space_prove("forall x. x IN s ==> (~((x equv cfun_zero) inprod) <=> &0 < cfun_norm inprod x)", @tactics.then_tac(@impconv.imp_rewrite_tac(@list.List([@equal.gsym(cfun_norm_eq_0())])), t497)))
}

///|
let cfun_norm_nz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_NORM_NZ")

///|
/// `CFUN_NORM_NZ`
pub fn cfun_norm_nz() -> @kernel.Thm {
  cfun_norm_nz_c.get()
}

///|
/// CFUN_NORM_SMUL
fn step_451() -> Unit raise {
  let t500 = @impconv.imp_rewrite_tac(@list.List([@complexes.real_cx(), inprod_self_real(), real_of_complex_mul(), real_of_complex_cx(), @real.sqrt_mul(), inprod_self_pos(), @real.real_le_pow_2(), @real.pow_2_sqrt(), @vectors.norm_pos_le()]))
  let t498 = @equal.gsym(@realarith.real_pow_2())
  let t499 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_assoc(), @complexes.complex_mul_cnj(), @complexes.complex_pow_2(), @equal.gsym(@complexes.cx_mul()), t498]))
  cfun_norm_smul_c.set(inner_space_prove("forall x a. x IN s ==> cfun_norm inprod (a%x) =  norm a * cfun_norm inprod x", @tactics.then_tac(@tactics.then_tac(@impconv.imp_rewrite_tac(@list.List([cfun_norm(), inprod_rsmul(), inprod_lsmul(), inner_space_smul()])), t499), t500)))
}

///|
let cfun_norm_smul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_NORM_SMUL")

///|
/// `CFUN_NORM_SMUL`
pub fn cfun_norm_smul() -> @kernel.Thm {
  cfun_norm_smul_c.get()
}

///|
/// CFUN_DIST_NZ
fn step_452() -> Unit raise {
  let t502 = @meson.meson_tac(@list.List([cfun_norm_nz(), equv_sub_zero(), inner_space_sub()]))
  let t501 = @simp.rewrite_tac(@list.List([cfun_dist(), @equal.gsym(cfun_norm())]))
  cfun_dist_nz_c.set(inner_space_prove("forall x y. x IN s /\\ y IN s ==>\n    (~((x equv y) inprod) <=>  &0 < cfun_dist inprod x y)", @tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(cfun_sub_0())])), t501), t502)))
}

///|
let cfun_dist_nz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_DIST_NZ")

///|
/// `CFUN_DIST_NZ`
pub fn cfun_dist_nz() -> @kernel.Thm {
  cfun_dist_nz_c.get()
}

///|
/// cfun_sum
fn step_453() -> Unit raise {
  cfun_sum_c.set(@pair.new_definition(@term_syntax.parse_term("(cfun_sum : ((_) -> Bool, (_, _) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]]) == iterate(op_plus)")))
}

///|
let cfun_sum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cfun_sum")

///|
/// `cfun_sum`
pub fn cfun_sum() -> @kernel.Thm {
  cfun_sum_c.get()
}

///|
/// NEUTRAL_CFUN_ADD
fn step_454() -> Unit raise {
  let t504 = @meson.meson_tac(@list.List([cfun_add_lid(), cfun_add_rid()]))
  let t503 = @tactics.match_mp_tac(@class.select_unique())
  let t505 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.neutral()])), t503), t504)
  neutral_cfun_add_c.set(@tactics.prove(@term_syntax.parse_term("(neutral : (((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]])((op_plus : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]])) == (cfun_zero : (_) -> Cart[Real, Tybit0[Unit]])"), t505))
}

///|
let neutral_cfun_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NEUTRAL_CFUN_ADD")

///|
/// `NEUTRAL_CFUN_ADD`
pub fn neutral_cfun_add() -> @kernel.Thm {
  neutral_cfun_add_c.get()
}

///|
/// MONOIDAL_CFUN_ADD
fn step_455() -> Unit raise {
  let t506 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.monoidal(), neutral_cfun_add()])), cfun_arith_tac)
  monoidal_cfun_add_c.set(@tactics.prove(@term_syntax.parse_term("(monoidal : (((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]]) -> Bool)((op_plus : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]]))"), t506))
}

///|
let monoidal_cfun_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MONOIDAL_CFUN_ADD")

///|
/// `MONOIDAL_CFUN_ADD`
pub fn monoidal_cfun_add() -> @kernel.Thm {
  monoidal_cfun_add_c.get()
}

///|
/// CFUN_SUM_CLAUSES
fn step_456() -> Unit raise {
  let t508 = @meson.meson_tac(@list.List([@iterate.iterate_clauses(), monoidal_cfun_add()]))
  let t507 = @simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()]))
  let t509 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([cfun_sum(), @equal.gsym(neutral_cfun_add())])), t507), t508)
  cfun_sum_clauses_c.set(@tactics.prove(@term_syntax.parse_term("(∀ f : (_, _) -> Cart[Real, Tybit0[Unit]], cfun_sum({}, f) == cfun_zero) && (∀ x : _, ∀ f : (_, _) -> Cart[Real, Tybit0[Unit]], ∀ s : (_) -> Bool, FINITE(s) → cfun_sum(INSERT(x, s), f) == (if IN(x, s) { cfun_sum(s, f) } else { f(x) + cfun_sum(s, f) }))"), t509))
}

///|
let cfun_sum_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUM_CLAUSES")

///|
/// `CFUN_SUM_CLAUSES`
pub fn cfun_sum_clauses() -> @kernel.Thm {
  cfun_sum_clauses_c.get()
}

///|
/// CFUN_SUM_CLAUSES_NUMSEG
fn step_457() -> Unit raise {
  let t511 = @drule.match_mp(@iterate.iterate_clauses_numseg())(monoidal_cfun_add())
  let t510 = @equal.gsym(cfun_sum())
  cfun_sum_clauses_numseg_c.set(@simp.rewrite_rule(@list.List([@equal.gsym(neutral_cfun_add()), t510]))(t511))
}

///|
let cfun_sum_clauses_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUM_CLAUSES_NUMSEG")

///|
/// `CFUN_SUM_CLAUSES_NUMSEG`
pub fn cfun_sum_clauses_numseg() -> @kernel.Thm {
  cfun_sum_clauses_numseg_c.get()
}

///|
/// CFUN_SUM_CLAUSES_LEFT
fn step_458() -> Unit raise {
  let t512 = @tactics.then_tac(@simp.simp_tac(@list.List([@equal.gsym(@iterate.numseg_lrec()), cfun_sum_clauses(), @iterate.finite_numseg(), @iterate.in_numseg()])), @int.arith_tac)
  cfun_sum_clauses_left_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num, _) -> Cart[Real, Tybit0[Unit]], ∀ m : Num, ∀ n : Num, m <= n → cfun_sum(op_dot_dot(m, n), f) == f(m) + cfun_sum(op_dot_dot(m + 1, n), f)"), t512))
}

///|
let cfun_sum_clauses_left_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUM_CLAUSES_LEFT")

///|
/// `CFUN_SUM_CLAUSES_LEFT`
pub fn cfun_sum_clauses_left() -> @kernel.Thm {
  cfun_sum_clauses_left_c.get()
}

///|
/// CFUN_SUM_IMAGE
fn step_459() -> Unit raise {
  let t514 = @simp.rewrite_tac(@list.List([monoidal_cfun_add()]))
  let t513 = @tactics.match_mp_tac(@iterate.iterate_image())
  let t515 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([cfun_sum(), @equal.gsym(neutral_cfun_add())])), t513), t514)
  cfun_sum_image_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_) -> _, ∀ g : (_, _) -> Cart[Real, Tybit0[Unit]], ∀ s : (_) -> Bool, (∀ x : _, ∀ y : _, IN(x, s) && IN(y, s) && f(x) == f(y) → x == y) → cfun_sum(IMAGE(f, s), g) == cfun_sum(s, o(g, f))"), t515))
}

///|
let cfun_sum_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUM_IMAGE")

///|
/// `CFUN_SUM_IMAGE`
pub fn cfun_sum_image() -> @kernel.Thm {
  cfun_sum_image_c.get()
}

///|
/// NUMSEG_EMPTY_IMP
fn step_460() -> Unit raise {
  let t516 = @simp.simp_tac(@list.List([@iterate.numseg_empty()]))
  numseg_empty_imp_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, n < m → op_dot_dot(m, n) == {}"), t516))
}

///|
let numseg_empty_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NUMSEG_EMPTY_IMP")

///|
/// `NUMSEG_EMPTY_IMP`
pub fn numseg_empty_imp() -> @kernel.Thm {
  numseg_empty_imp_c.get()
}

///|
/// CFUN_SUM_TRIV_NUMSEG
fn step_461() -> Unit raise {
  let t517 = @simp.simp_tac(@list.List([numseg_empty_imp(), cfun_sum_clauses()]))
  cfun_sum_triv_numseg_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ f : (Num, _) -> Cart[Real, Tybit0[Unit]], n < m → cfun_sum(op_dot_dot(m, n), f) == cfun_zero"), t517))
}

///|
let cfun_sum_triv_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUM_TRIV_NUMSEG")

///|
/// `CFUN_SUM_TRIV_NUMSEG`
pub fn cfun_sum_triv_numseg() -> @kernel.Thm {
  cfun_sum_triv_numseg_c.get()
}

///|
/// CFUN_SUM_OFFSET
fn step_462() -> Unit raise {
  let t518 = @simp.rewrite_tac(@list.List([@trivia.o_def()]))
  let t519 = @tactics.then_tac(@simp.simp_tac(@list.List([@iterate.numseg_offset_image(), cfun_sum_image(), @arith.eq_add_rcancel(), @iterate.finite_numseg()])), t518)
  cfun_sum_offset_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, ∀ f : (Num, _) -> Cart[Real, Tybit0[Unit]], ∀ m : Num, ∀ n : Num, cfun_sum(op_dot_dot(m + p, n + p), f) == cfun_sum(op_dot_dot(m, n), (i : Num) => f(i + p))"), t519))
}

///|
let cfun_sum_offset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUM_OFFSET")

///|
/// `CFUN_SUM_OFFSET`
pub fn cfun_sum_offset() -> @kernel.Thm {
  cfun_sum_offset_c.get()
}

///|
/// CFUN_SUM_OFFSET_0
fn step_463() -> Unit raise {
  let t520 = @simp.simp_tac(@list.List([@equal.gsym(cfun_sum_offset()), @arith.add_clauses(), @arith.sub_add()]))
  cfun_sum_offset_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num, _) -> Cart[Real, Tybit0[Unit]], ∀ m : Num, ∀ n : Num, m <= n → cfun_sum(op_dot_dot(m, n), f) == cfun_sum(op_dot_dot(0, n - m), (i : Num) => f(i + m))"), t520))
}

///|
let cfun_sum_offset_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUM_OFFSET_0")

///|
/// `CFUN_SUM_OFFSET_0`
pub fn cfun_sum_offset_0() -> @kernel.Thm {
  cfun_sum_offset_0_c.get()
}

///|
/// CFUN_SUM_CONST
fn step_464() -> Unit raise {
  let t522 = @tactics.repeat_tac(@tactics.strip_tac)
  let t521 = @simp.simp_tac(@list.List([cfun_sum_clauses(), @sets.card_clauses(), @equal.gsym(@real.real_of_num_suc())]))
  let t523 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@sets.finite_induct_strong())), t521), t522), cfun_arith_tac)
  cfun_sum_const_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : (_) -> Cart[Real, Tybit0[Unit]], ∀ s : (_) -> Bool, FINITE(s) → cfun_sum(s, (n : _) => c) == cfun_smul(Cx(real_of_num(CARD(s))), c)"), t523))
}

///|
let cfun_sum_const_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUM_CONST")

///|
/// `CFUN_SUM_CONST`
pub fn cfun_sum_const() -> @kernel.Thm {
  cfun_sum_const_c.get()
}

///|
/// CFUN_SUM_EQ_0
fn step_465() -> Unit raise {
  let t524 = @simp.simp_tac(@list.List([@iterate.iterate_eq_neutral(), monoidal_cfun_add()]))
  let t525 = @tactics.then_tac(@simp.rewrite_tac(@list.List([cfun_sum(), @equal.gsym(neutral_cfun_add())])), t524)
  cfun_sum_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A, _) -> Cart[Real, Tybit0[Unit]], ∀ s : (A) -> Bool, (∀ x : A, IN(x, s) → f(x) == cfun_zero) → cfun_sum(s, f) == cfun_zero"), t525))
}

///|
let cfun_sum_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUM_EQ_0")

///|
/// `CFUN_SUM_EQ_0`
pub fn cfun_sum_eq_0() -> @kernel.Thm {
  cfun_sum_eq_0_c.get()
}

///|
/// CFUN_SUM_0
fn step_466() -> Unit raise {
  let t526 = @simp.simp_tac(@list.List([cfun_sum_eq_0()]))
  cfun_sum_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, (cfun_sum : ((A) -> Bool, (A, _) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]])(s, (n : A) => (cfun_zero : (_) -> Cart[Real, Tybit0[Unit]])) == (cfun_zero : (_) -> Cart[Real, Tybit0[Unit]])"), t526))
}

///|
let cfun_sum_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUM_0")

///|
/// `CFUN_SUM_0`
pub fn cfun_sum_0() -> @kernel.Thm {
  cfun_sum_0_c.get()
}

///|
/// CFUN_SUM_EQ
fn step_467() -> Unit raise {
  let t528 = @simp.rewrite_tac(@list.List([monoidal_cfun_add()]))
  let t527 = @tactics.match_mp_tac(@iterate.iterate_eq())
  let t529 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([cfun_sum()])), t527), t528)
  cfun_sum_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_, _) -> Cart[Real, Tybit0[Unit]], ∀ g : (_, _) -> Cart[Real, Tybit0[Unit]], ∀ s : (_) -> Bool, (∀ x : _, IN(x, s) → f(x) == g(x)) → cfun_sum(s, f) == cfun_sum(s, g)"), t529))
}

///|
let cfun_sum_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUM_EQ")

///|
/// `CFUN_SUM_EQ`
pub fn cfun_sum_eq() -> @kernel.Thm {
  cfun_sum_eq_c.get()
}

///|
/// CFUN_SUM_SING
fn step_468() -> Unit raise {
  let t530 = @simp.simp_tac(@list.List([cfun_sum_clauses(), @sets.finite_rules(), @sets.not_in_empty(), cfun_add_rid()]))
  cfun_sum_sing_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_, _) -> Cart[Real, Tybit0[Unit]], ∀ x : _, cfun_sum({x}, f) == f(x)"), t530))
}

///|
let cfun_sum_sing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUM_SING")

///|
/// `CFUN_SUM_SING`
pub fn cfun_sum_sing() -> @kernel.Thm {
  cfun_sum_sing_c.get()
}

///|
/// CFUN_SUM_SING_NUMSEG
fn step_469() -> Unit raise {
  let t531 = @simp.simp_tac(@list.List([cfun_sum_sing(), @iterate.numseg_sing()]))
  cfun_sum_sing_numseg_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num, _) -> Cart[Real, Tybit0[Unit]], ∀ n : Num, cfun_sum(op_dot_dot(n, n), f) == f(n)"), t531))
}

///|
let cfun_sum_sing_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUM_SING_NUMSEG")

///|
/// `CFUN_SUM_SING_NUMSEG`
pub fn cfun_sum_sing_numseg() -> @kernel.Thm {
  cfun_sum_sing_numseg_c.get()
}

///|
/// CFUN_SUM_EQ_NUMSEG
fn step_470() -> Unit raise {
  let t532 = @meson.meson_tac(@list.List([cfun_sum_eq(), @iterate.finite_numseg(), @iterate.in_numseg()]))
  cfun_sum_eq_numseg_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num, _) -> Cart[Real, Tybit0[Unit]], ∀ g : (Num, _) -> Cart[Real, Tybit0[Unit]], ∀ m : Num, ∀ n : Num, (∀ i : Num, m <= i && i <= n → f(i) == g(i)) → cfun_sum(op_dot_dot(m, n), f) == cfun_sum(op_dot_dot(m, n), g)"), t532))
}

///|
let cfun_sum_eq_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUM_EQ_NUMSEG")

///|
/// `CFUN_SUM_EQ_NUMSEG`
pub fn cfun_sum_eq_numseg() -> @kernel.Thm {
  cfun_sum_eq_numseg_c.get()
}

///|
/// CFUN_SUM_IN_SPC
fn step_471() -> Unit raise {
  let t536 = @simp.asm_simp_tac(@list.List([cfun_subspace_zero(), cfun_subspace_add()]))
  let t535 = @simp.simp_tac(@list.List([cfun_sum_clauses()]))
  let t534 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t533 = @simp.simp_tac(@list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()]))
  let t537 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t533), t534), t535), t536)
  cfun_sum_in_spc_c.set(@tactics.prove(@term_syntax.parse_term("∀ g : (_, _) -> Cart[Real, Tybit0[Unit]], ∀ spc : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, is_cfun_subspace(spc) && (∀ n : _, IN(g(n), spc)) → (∀ s : (_) -> Bool, FINITE(s) → IN(cfun_sum(s, g), spc))"), t537))
}

///|
let cfun_sum_in_spc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUM_IN_SPC")

///|
/// `CFUN_SUM_IN_SPC`
pub fn cfun_sum_in_spc() -> @kernel.Thm {
  cfun_sum_in_spc_c.get()
}

///|
/// SLINEAR_CFUN_SUM
fn step_472() -> Unit raise {
  let t545 = @simp.asm_simp_tac(@list.List([cfun_sum_in_spc(), @trivia.o_def()]))
  let t542 = @impconv.imp_rewrite_tac(@list.List([slincop_add()]))
  let t543 = @list.List([@meson.asm_meson_tac(@list.List([slincop_cfun_zero()])), t542])
  let t541 = @tactics.repeat_tac(@tactics.strip_tac)
  let t540 = @simp.simp_tac(@list.List([cfun_sum_clauses()]))
  let t539 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t538 = @simp.simp_tac(@list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()]))
  let t546 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t538), t539), t540), t541), t543), (x544 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @q.exists_tac("spc", x544)), t545)
  slinear_cfun_sum_c.set(@tactics.prove(@term_syntax.parse_term("∀ spc : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ f : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ g : (_, _) -> Cart[Real, Tybit0[Unit]], is_cfun_subspace(spc) && (∀ n : _, IN(g(n), spc)) && is_set_linear_cop(spc, f) → (∀ s : (_) -> Bool, FINITE(s) → f(cfun_sum(s, g)) == cfun_sum(s, o(f, g)))"), t546))
}

///|
let slinear_cfun_sum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SLINEAR_CFUN_SUM")

///|
/// `SLINEAR_CFUN_SUM`
pub fn slinear_cfun_sum() -> @kernel.Thm {
  slinear_cfun_sum_c.get()
}

///|
/// SLINEAR_CFUN_SUM_IMP
fn step_473() -> Unit raise {
  let t547 = @meson.meson_tac(@list.List([slinear_cfun_sum()]))
  slinear_cfun_sum_imp_c.set(@tactics.prove(@term_syntax.parse_term("∀ spc : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ f : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ g : (_, _) -> Cart[Real, Tybit0[Unit]], ∀ s : (_) -> Bool, is_cfun_subspace(spc) && (∀ n : _, IN(g(n), spc)) && is_set_linear_cop(spc, f) && FINITE(s) → f(cfun_sum(s, g)) == cfun_sum(s, o(f, g))"), t547))
}

///|
let slinear_cfun_sum_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SLINEAR_CFUN_SUM_IMP")

///|
/// `SLINEAR_CFUN_SUM_IMP`
pub fn slinear_cfun_sum_imp() -> @kernel.Thm {
  slinear_cfun_sum_imp_c.get()
}

///|
/// LINEAR_CFUN_SUM
fn step_474() -> Unit raise {
  let t554 = @tactics.first_assum(fn(x551 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x551
    let t553 = @drule.match_mp(lincop_add())(th)
    @simp.simp_tac(@list.List([@drule.match_mp(lincop_cfun_zero())(th), t553, @trivia.o_thm()]))
  })
  let t550 = @simp.simp_tac(@list.List([cfun_sum_clauses()]))
  let t549 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t548 = @simp.simp_tac(@list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()]))
  let t555 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), t548), @tactics.disch_tac), t549), t550), t554)
  linear_cfun_sum_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ g : (_, _) -> Cart[Real, Tybit0[Unit]], ∀ s : (_) -> Bool, is_linear_cop(f) && FINITE(s) → f(cfun_sum(s, g)) == cfun_sum(s, o(f, g))"), t555))
}

///|
let linear_cfun_sum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINEAR_CFUN_SUM")

///|
/// `LINEAR_CFUN_SUM`
pub fn linear_cfun_sum() -> @kernel.Thm {
  linear_cfun_sum_c.get()
}

///|
/// CFUN_SUM_ADD
fn step_475() -> Unit raise {
  let t556 = @simp.simp_tac(@list.List([cfun_sum(), @iterate.iterate_op(), monoidal_cfun_add()]))
  cfun_sum_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_, _) -> Cart[Real, Tybit0[Unit]], ∀ g : (_, _) -> Cart[Real, Tybit0[Unit]], ∀ s : (_) -> Bool, FINITE(s) → cfun_sum(s, (x : _) => f(x) + g(x)) == cfun_sum(s, f) + cfun_sum(s, g)"), t556))
}

///|
let cfun_sum_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUM_ADD")

///|
/// `CFUN_SUM_ADD`
pub fn cfun_sum_add() -> @kernel.Thm {
  cfun_sum_add_c.get()
}

///|
/// CFUN_SUM_SMUL
fn step_476() -> Unit raise {
  let t557 = @equal.gsym(linear_cfun_sum())
  let t558 = @simp.simp_tac(@list.List([@simp.rewrite_rule(@list.List([@trivia.o_def()]))(t557), scalar_lincop()]))
  let t559 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("cfun_smul((a : Cart[Real, Tybit0[Unit]]), (y : (A) -> Cart[Real, Tybit0[Unit]])) == ((x : (A) -> Cart[Real, Tybit0[Unit]]) => cfun_smul(a, x))(y)"))])), t558)
  cfun_sum_smul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_, _) -> Cart[Real, Tybit0[Unit]], ∀ a : Cart[Real, Tybit0[Unit]], ∀ s : (_) -> Bool, FINITE(s) → cfun_sum(s, (x : _) => cfun_smul(a, f(x))) == cfun_smul(a, cfun_sum(s, f))"), t559))
}

///|
let cfun_sum_smul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUM_SMUL")

///|
/// `CFUN_SUM_SMUL`
pub fn cfun_sum_smul() -> @kernel.Thm {
  cfun_sum_smul_c.get()
}

///|
/// CFUN_SUM_SUB
fn step_477() -> Unit raise {
  let t561 = @simp.simp_tac(@list.List([cfun_sum_smul(), cfun_sum_add()]))
  let t560 = @simp.once_rewrite_tac(@list.List([@equal.gsym(cfun_smul_lid_neg())]))
  let t562 = @tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([cfun_sub_neg()])), t560), t561)
  cfun_sum_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_, _) -> Cart[Real, Tybit0[Unit]], ∀ g : (_, _) -> Cart[Real, Tybit0[Unit]], ∀ s : (_) -> Bool, FINITE(s) → cfun_sum(s, (x : _) => f(x) - g(x)) == cfun_sum(s, f) - cfun_sum(s, g)"), t562))
}

///|
let cfun_sum_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUM_SUB")

///|
/// `CFUN_SUM_SUB`
pub fn cfun_sum_sub() -> @kernel.Thm {
  cfun_sum_sub_c.get()
}

///|
/// CUN_SUM_ADD_NUMSEG
fn step_478() -> Unit raise {
  let t563 = @simp.simp_tac(@list.List([cfun_sum_add(), @iterate.finite_numseg()]))
  cun_sum_add_numseg_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num, _) -> Cart[Real, Tybit0[Unit]], ∀ g : (Num, _) -> Cart[Real, Tybit0[Unit]], ∀ m : Num, ∀ n : Num, cfun_sum(op_dot_dot(m, n), (i : Num) => f(i) + g(i)) == cfun_sum(op_dot_dot(m, n), f) + cfun_sum(op_dot_dot(m, n), g)"), t563))
}

///|
let cun_sum_add_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CUN_SUM_ADD_NUMSEG")

///|
/// `CUN_SUM_ADD_NUMSEG`
pub fn cun_sum_add_numseg() -> @kernel.Thm {
  cun_sum_add_numseg_c.get()
}

///|
/// cfun_lim
fn step_479() -> Unit raise {
  cfun_lim_c.set(@pair.new_definition(@term_syntax.parse_term("(cfun_lim1 : ((((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]), (_, _) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]], Net[_]) -> Bool)(((s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool), (inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]])), (f : (_, _) -> Cart[Real, Tybit0[Unit]]), (l : (_) -> Cart[Real, Tybit0[Unit]]), (net : Net[_])) == (is_inner_space((s, inprod)) && IN(l, s) && (∀ x : _, IN(f(x), s)) && (∀ e : Real, real_of_num(0) < e → eventually((x : _) => cfun_dist(inprod, f(x), l) < e, net)))")))
}

///|
let cfun_lim_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cfun_lim")

///|
/// `cfun_lim`
pub fn cfun_lim() -> @kernel.Thm {
  cfun_lim_c.get()
}

///|
/// CFUN_LIM_INNER_SPACE
fn step_480() -> Unit raise {
  let t564 = @simp.simp_tac(@list.List([forall_inner_space_thm(), cfun_lim()]))
  cfun_lim_inner_space_c.set(@tactics.prove(@term_syntax.parse_term("∀ innerspc : (((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]), ∀ f : (_, _) -> Cart[Real, Tybit0[Unit]], ∀ l : (_) -> Cart[Real, Tybit0[Unit]], ∀ net : Net[_], cfun_lim1(innerspc, f, l, net) → is_inner_space(innerspc)"), t564))
}

///|
let cfun_lim_inner_space_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_LIM_INNER_SPACE")

///|
/// `CFUN_LIM_INNER_SPACE`
pub fn cfun_lim_inner_space() -> @kernel.Thm {
  cfun_lim_inner_space_c.get()
}

///|
/// is_bounded
fn step_481() -> Unit raise {
  is_bounded_c.set(@pair.new_definition(@term_syntax.parse_term("(is_bounded1 : ((((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]), ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]]) -> Bool)(((s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool), (inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]])), (h : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]])) == (is_inner_space((s, inprod)) → (∃ B : Real, real_of_num(0) < B && (∀ x : (_) -> Cart[Real, Tybit0[Unit]], IN(x, s) && IN(h(x), s) → sqrt(real_of_complex(inprod(h(x), h(x)))) <= B * sqrt(real_of_complex(inprod(x, x))))))")))
}

///|
let is_bounded_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_bounded")

///|
/// `is_bounded`
pub fn is_bounded() -> @kernel.Thm {
  is_bounded_c.get()
}

///|
/// is_bounded_linear
fn step_482() -> Unit raise {
  is_bounded_linear_c.set(@pair.new_definition(@term_syntax.parse_term("(is_bounded_linear1 : ((((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]), ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]]) -> Bool)(((s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool), (inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]])), (h : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]])) == (is_inner_space((s, inprod)) → is_linear_cop(h) && is_closed_by(s, h) && (∃ B : Real, real_of_num(0) < B && (∀ x : (_) -> Cart[Real, Tybit0[Unit]], IN(x, s) → sqrt(real_of_complex(inprod(h(x), h(x)))) <= B * sqrt(real_of_complex(inprod(x, x))))))")))
}

///|
let is_bounded_linear_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_bounded_linear")

///|
/// `is_bounded_linear`
pub fn is_bounded_linear() -> @kernel.Thm {
  is_bounded_linear_c.get()
}

///|
/// SCALAR_BOUNDED
fn step_483() -> Unit raise {
  let t570 = @tactics.then_tac((x569 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @q.exists_tac("norm a", x569), @impconv.imp_rewrite_tac(@list.List([@complexes.complex_norm_nz(), @realax.real_le_refl(), @equal.gsym(cfun_norm()), cfun_norm_smul()])))
  let t568 = @meson.asm_meson_tac(@list.List([@real.sqrt_pos_le(), real_of_complex_cx(), @real.sqrt_0(), inprod_zero(), inprod_self_pos()]))
  let t571 = @list.List([@tactics.then_tac(@tactics.then_tac((x567 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @q.exists_tac("&1", x567), @simp.asm_rewrite_tac(@list.List([@real.real_lt_01(), cfun_smul_lzero(), @realax.real_mul_lid()]))), t568), t570])
  let t566 = @q.asm_cases_tac("a = Cx(&0)")
  let t565 = @tactics.repeat_tac(@tactics.strip_tac)
  let t572 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([forall_inner_space_thm(), is_bounded()])), t565), t566), t571)
  scalar_bounded_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ∀ is_ : (((A) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((A) -> Cart[Real, Tybit0[Unit]], (A) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]), is_bounded1(is_, (x : (A) -> Cart[Real, Tybit0[Unit]]) => cfun_smul(a, x))"), t572))
}

///|
let scalar_bounded_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SCALAR_BOUNDED")

///|
/// `SCALAR_BOUNDED`
pub fn scalar_bounded() -> @kernel.Thm {
  scalar_bounded_c.get()
}

///|
/// CFUN_LIM_ULINEAR
fn step_484() -> Unit raise {
  let t599 = @meson.asm_meson_tac(@list.List([ulincop_sub(), inner_space_sub()]))
  let t598 = @impconv.imp_rewrite_tac(@list.List([inner_space_sub()]))
  let t597 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t596 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realarith.real_let_trans()))
  let t595 = @impconv.imp_rewrite_tac(@list.List([@equal.gsym(@q.spec("s1", ulincop_sub())), ulincop_subspace()]))
  let t593 = @simp.rewrite_tac(@list.List([]))
  let t592 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@metric.eventually_mono()))
  let t591 = @simp.asm_simp_tac(@list.List([@real.real_lt_div(), cfun_dist(), @real.real_lt_rdiv_eq()]))
  let t590 = @tactics.first_x_assum(fn(x589 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x585 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s586 = @tactics.mp_tac(x585)
      fn(x587 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s586(x587)
      }
    })(((x588 : @kernel.Thm) => @q.spec("e / B", x588))(x589))
  })
  let t584 = @tactics.x_gen_tac(@term_syntax.parse_term("(B : Real)"))
  let t583 = @simp.asm_rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t580 = @simp.gen_rewrite_rule(fn(x579 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x579
  }, @list.List([is_bounded()]))
  let t582 = @tactics.first_x_assum(fn(x581 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x576 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s577 = @tactics.mp_tac(x576)
      fn(x578 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s577(x578)
      }
    })(t580(x581))
  })
  let t575 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t574 = @simp.simp_tac(@list.List([cfun_lim()]))
  let t573 = @tactics.repeat_tac(@tactics.gen_tac)
  let t600 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([forall_inner_space_thm()])), t573), t574), @tactics.strip_tac), t575), @tactics.disch_tac), t582), t583), t584), @tactics.strip_tac), t590), t591), t592), t593), (x594 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @q.x_gen_tac("x", x594)), t595), t596), t597), t598), t599)
  cfun_lim_ulinear_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ h : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ s1 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ f : (A, _) -> Cart[Real, Tybit0[Unit]], ∀ l : (_) -> Cart[Real, Tybit0[Unit]], ∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], cfun_lim1((s, inprod), f, l, net) && is_unbounded_linear_cop(s1, h) && (∀ x : (_) -> Cart[Real, Tybit0[Unit]], IN(x, s1) → IN(x, s) && IN(h(x), s)) && (∀ x : A, IN(f(x), s1)) && IN(l, s1) && is_bounded1((s, inprod), h) → cfun_lim1((s, inprod), (x : A) => h(f(x)), h(l), net)"), t600))
}

///|
let cfun_lim_ulinear_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_LIM_ULINEAR")

///|
/// `CFUN_LIM_ULINEAR`
pub fn cfun_lim_ulinear() -> @kernel.Thm {
  cfun_lim_ulinear_c.get()
}

///|
/// cfun_sums
fn step_485() -> Unit raise {
  cfun_sums_c.set(@pair.new_definition(@term_syntax.parse_term("(cfun_sums : ((((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]), (Num, _) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]], (Num) -> Bool) -> Bool)((innerspc : (((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]])), (f : (Num, _) -> Cart[Real, Tybit0[Unit]]), (l : (_) -> Cart[Real, Tybit0[Unit]]), (s : (Num) -> Bool)) == cfun_lim1(innerspc, (n : Num) => cfun_sum(INTER(s, op_dot_dot(0, n)), f), l, sequentially)")))
}

///|
let cfun_sums_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cfun_sums")

///|
/// `cfun_sums`
pub fn cfun_sums() -> @kernel.Thm {
  cfun_sums_c.get()
}

///|
/// cfun_infsum
fn step_486() -> Unit raise {
  cfun_infsum_c.set(@pair.new_definition(@term_syntax.parse_term("(cfun_infsum : ((((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]), (Num) -> Bool, (Num, _) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]])((innerspc : (((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]])), (s : (Num) -> Bool), (f : (Num, _) -> Cart[Real, Tybit0[Unit]])) == select((l : (_) -> Cart[Real, Tybit0[Unit]]) => cfun_sums(innerspc, f, l, s))")))
}

///|
let cfun_infsum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cfun_infsum")

///|
/// `cfun_infsum`
pub fn cfun_infsum() -> @kernel.Thm {
  cfun_infsum_c.get()
}

///|
/// cfun_summable
fn step_487() -> Unit raise {
  cfun_summable_c.set(@pair.new_definition(@term_syntax.parse_term("(cfun_summable : ((((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]), (Num) -> Bool, (Num, _) -> Cart[Real, Tybit0[Unit]]) -> Bool)((innerspc : (((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]])), (s : (Num) -> Bool), (f : (Num, _) -> Cart[Real, Tybit0[Unit]])) == (∃ l : (_) -> Cart[Real, Tybit0[Unit]], cfun_sums(innerspc, f, l, s))")))
}

///|
let cfun_summable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cfun_summable")

///|
/// `cfun_summable`
pub fn cfun_summable() -> @kernel.Thm {
  cfun_summable_c.get()
}

///|
/// CFUN_SUMS_INNER_SPACE
fn step_488() -> Unit raise {
  let t601 = @simp.simp_tac(@list.List([forall_inner_space_thm(), cfun_sums(), cfun_lim()]))
  cfun_sums_inner_space_c.set(@tactics.prove(@term_syntax.parse_term("∀ innerspc : (((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]), ∀ f : (Num, _) -> Cart[Real, Tybit0[Unit]], ∀ l : (_) -> Cart[Real, Tybit0[Unit]], ∀ s : (Num) -> Bool, cfun_sums(innerspc, f, l, s) → is_inner_space(innerspc)"), t601))
}

///|
let cfun_sums_inner_space_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUMS_INNER_SPACE")

///|
/// `CFUN_SUMS_INNER_SPACE`
pub fn cfun_sums_inner_space() -> @kernel.Thm {
  cfun_sums_inner_space_c.get()
}

///|
/// CFUN_SUMS_SUMMABLE
fn step_489() -> Unit raise {
  let t602 = @meson.meson_tac(@list.List([]))
  let t603 = @tactics.then_tac(@simp.rewrite_tac(@list.List([cfun_summable()])), t602)
  cfun_sums_summable_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num, _) -> Cart[Real, Tybit0[Unit]], ∀ l : (_) -> Cart[Real, Tybit0[Unit]], ∀ s : (Num) -> Bool, ∀ innerspc : (((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]), cfun_sums(innerspc, f, l, s) → cfun_summable(innerspc, s, f)"), t603))
}

///|
let cfun_sums_summable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUMS_SUMMABLE")

///|
/// `CFUN_SUMS_SUMMABLE`
pub fn cfun_sums_summable() -> @kernel.Thm {
  cfun_sums_summable_c.get()
}

///|
/// CFUN_SUMS_INFSUM
fn step_490() -> Unit raise {
  let t604 = @meson.meson_tac(@list.List([]))
  let t605 = @tactics.then_tac(@simp.rewrite_tac(@list.List([cfun_infsum(), cfun_summable()])), t604)
  cfun_sums_infsum_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num, _) -> Cart[Real, Tybit0[Unit]], ∀ s : (Num) -> Bool, ∀ innerspc : (((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]), cfun_sums(innerspc, f, cfun_infsum(innerspc, s, f), s) == cfun_summable(innerspc, s, f)"), t605))
}

///|
let cfun_sums_infsum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUMS_INFSUM")

///|
/// `CFUN_SUMS_INFSUM`
pub fn cfun_sums_infsum() -> @kernel.Thm {
  cfun_sums_infsum_c.get()
}

///|
/// CFUN_SUM_RESTRICT
fn step_491() -> Unit raise {
  let t607 = @simp.asm_simp_tac(@list.List([]))
  let t606 = @tactics.match_mp_tac(cfun_sum_eq())
  let t608 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t606), t607)
  cfun_sum_restrict_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_, _) -> Cart[Real, Tybit0[Unit]], ∀ s : (_) -> Bool, FINITE(s) → cfun_sum(s, (x : _) => if IN(x, s) { f(x) } else { cfun_zero }) == cfun_sum(s, f)"), t608))
}

///|
let cfun_sum_restrict_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUM_RESTRICT")

///|
/// `CFUN_SUM_RESTRICT`
pub fn cfun_sum_restrict() -> @kernel.Thm {
  cfun_sum_restrict_c.get()
}

///|
/// CFUN_SUM_SUPERSET
fn step_492() -> Unit raise {
  let t609 = @simp.simp_tac(@list.List([cfun_sum(), @equal.gsym(neutral_cfun_add()), @iterate.iterate_superset(), monoidal_cfun_add()]))
  cfun_sum_superset_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_, _) -> Cart[Real, Tybit0[Unit]], ∀ u : (_) -> Bool, ∀ v : (_) -> Bool, SUBSET(u, v) && (∀ x : _, IN(x, v) && !IN(x, u) → f(x) == cfun_zero) → cfun_sum(v, f) == cfun_sum(u, f)"), t609))
}

///|
let cfun_sum_superset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUM_SUPERSET")

///|
/// `CFUN_SUM_SUPERSET`
pub fn cfun_sum_superset() -> @kernel.Thm {
  cfun_sum_superset_c.get()
}

///|
/// CFUN_LIM_SEQUENTIALLY
fn step_493() -> Unit raise {
  let t610 = @meson.meson_tac(@list.List([]))
  let t611 = @tactics.then_tac(@simp.rewrite_tac(@list.List([cfun_lim(), @metric.eventually_sequentially()])), t610)
  cfun_lim_sequentially_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num, _) -> Cart[Real, Tybit0[Unit]], ∀ l : (_) -> Cart[Real, Tybit0[Unit]], ∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], cfun_lim1((s, inprod), f, l, sequentially) == (is_inner_space((s, inprod)) && IN(l, s) && (∀ x : Num, IN(f(x), s)) && (∀ e : Real, real_of_num(0) < e → (∃ N : Num, ∀ n : Num, N <= n → cfun_dist(inprod, f(n), l) < e)))"), t611))
}

///|
let cfun_lim_sequentially_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_LIM_SEQUENTIALLY")

///|
/// `CFUN_LIM_SEQUENTIALLY`
pub fn cfun_lim_sequentially() -> @kernel.Thm {
  cfun_lim_sequentially_c.get()
}

///|
/// CFUN_LIM_NEG
fn step_494() -> Unit raise {
  let t632 = @impconv.imp_rewrite_tac(@list.List([cfun_arith(@term_syntax.parse_term("-(x : (A) -> Cart[Real, Tybit0[Unit]]) - -(y : (A) -> Cart[Real, Tybit0[Unit]]) == -(x - y)")), inprod_neg(), cfun_subspace_sub(), cfun_subspace_neg(), inner_space_is_subspace()]))
  let t631 = @simp.rewrite_tac(@list.List([]))
  let t630 = @tactics.repeat_tac(@tactics.pop_assum(fn(x627 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s628 = @tactics.mp_tac(x627)
    fn(x629 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s628(x629)
    }
  }))
  let t626 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@metric.eventually_mono()))
  let t625 = @simp.rewrite_tac(@list.List([]))
  let t624 = @tactics.match_mp_tac(@theorems.mono_imp())
  let t623 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t622 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t621 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x615 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s616 = @tactics.assume_tac(x615)
    fn(x617 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s616(x617)
    }
  }, fn(x618 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s619 = @tactics.mp_tac(x618)
    fn(x620 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s619(x620)
    }
  })))
  let t614 = @impconv.imp_rewrite_tac(@list.List([cfun_arith(@term_syntax.parse_term("-(x : (A) -> Cart[Real, Tybit0[Unit]]) - -(y : (A) -> Cart[Real, Tybit0[Unit]]) == -(x - y)")), inprod_neg(), cfun_subspace_sub(), cfun_subspace_neg(), inner_space_is_subspace()]))
  let t613 = @simp.rewrite_tac(@list.List([cfun_lim(), cfun_dist()]))
  let t612 = @tactics.repeat_tac(@tactics.gen_tac)
  let t633 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([forall_inner_space_thm()])), t612), t613), t614), t621), t622), t623), t624), t625), t626), t630), t631), t632)
  cfun_lim_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[_], ∀ f : (_, _) -> Cart[Real, Tybit0[Unit]], ∀ l : (_) -> Cart[Real, Tybit0[Unit]], ∀ innerspc : (((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]), cfun_lim1(innerspc, f, l, net) → cfun_lim1(innerspc, (x : _) => -f(x), -l, net)"), t633))
}

///|
let cfun_lim_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_LIM_NEG")

///|
/// `CFUN_LIM_NEG`
pub fn cfun_lim_neg() -> @kernel.Thm {
  cfun_lim_neg_c.get()
}

///|
/// CFUN_LIM_ADD
fn step_495() -> Unit raise {
  let t649 = @meson.asm_meson_tac(@list.List([cfun_dist_triangle_add()]))
  let t648 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(z : Real) <= (x : Real) + (y : Real) → x < (e : Real) / real_of_num(2) && y < e / real_of_num(2) → z < e")))
  let t647 = @simp.rewrite_tac(@list.List([]))
  let t646 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@metric.eventually_mono()))
  let t645 = @simp.asm_rewrite_tac(@list.List([@misc.real_half(), @theorems.imp_imp(), @equal.gsym(@metric.eventually_and())]))
  let t641 = @term_syntax.parse_term("(e : Real) / real_of_num(2)")
  let t644 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x643 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x638 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s639 = @tactics.mp_tac(x638)
      fn(x640 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s639(x640)
      }
    })(((x642 : @kernel.Thm) => @bool.spec(t641, x642))(x643))
  }))
  let t637 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t636 = @impconv.imp_rewrite_tac(@list.List([inner_space_add()]))
  let t635 = @simp.rewrite_tac(@list.List([cfun_lim(), @theorems.conj_aci()]))
  let t634 = @tactics.repeat_tac(@tactics.gen_tac)
  let t650 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([forall_inner_space_thm()])), t634), t635), t636), @tactics.strip_tac), t637), @tactics.disch_tac), t644), t645), t646), @tactics.gen_tac), t647), t648), t649)
  cfun_lim_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[_], ∀ f : (_, _) -> Cart[Real, Tybit0[Unit]], ∀ g : (_, _) -> Cart[Real, Tybit0[Unit]], ∀ l : (_) -> Cart[Real, Tybit0[Unit]], ∀ m : (_) -> Cart[Real, Tybit0[Unit]], ∀ innerspc : (((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]), cfun_lim1(innerspc, f, l, net) && cfun_lim1(innerspc, g, m, net) → cfun_lim1(innerspc, (x : _) => f(x) + g(x), l + m, net)"), t650))
}

///|
let cfun_lim_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_LIM_ADD")

///|
/// `CFUN_LIM_ADD`
pub fn cfun_lim_add() -> @kernel.Thm {
  cfun_lim_add_c.get()
}

///|
/// CFUN_LIM_SUB
fn step_496() -> Unit raise {
  let t651 = @simp.asm_simp_tac(@list.List([cfun_lim_add(), cfun_lim_neg()]))
  let t652 = @tactics.then_tac(@simp.rewrite_tac(@list.List([cfun_sub_neg()])), t651)
  cfun_lim_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[_], ∀ f : (_, _) -> Cart[Real, Tybit0[Unit]], ∀ g : (_, _) -> Cart[Real, Tybit0[Unit]], ∀ l : (_) -> Cart[Real, Tybit0[Unit]], ∀ m : (_) -> Cart[Real, Tybit0[Unit]], ∀ innerspc : (((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]), cfun_lim1(innerspc, f, l, net) && cfun_lim1(innerspc, g, m, net) → cfun_lim1(innerspc, (x : _) => f(x) - g(x), l - m, net)"), t652))
}

///|
let cfun_lim_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_LIM_SUB")

///|
/// `CFUN_LIM_SUB`
pub fn cfun_lim_sub() -> @kernel.Thm {
  cfun_lim_sub_c.get()
}

///|
/// CFUN_LIM_CONST
fn step_497() -> Unit raise {
  let t653 = @impconv.imp_rewrite_tac(@list.List([cfun_lim(), cfun_dist_refl(), @metric.eventually_true()]))
  cfun_lim_const_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[_], ∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], ∀ y : (_) -> Cart[Real, Tybit0[Unit]], IN(y, s) && is_inner_space((s, inprod)) → cfun_lim1((s, inprod), (x : _) => y, y, net)"), t653))
}

///|
let cfun_lim_const_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_LIM_CONST")

///|
/// `CFUN_LIM_CONST`
pub fn cfun_lim_const() -> @kernel.Thm {
  cfun_lim_const_c.get()
}

///|
/// CFUN_LIM_SMUL
fn step_498() -> Unit raise {
  let t659 = @meson.asm_meson_tac(@list.List([inner_space_is_subspace(), cfun_subspace_smul(), cfun_add_ldistrib(), cfun_smul_assoc(), @complexes.complex_mul_sym()]))
  let t658 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([cfun_lim()])))
  let t657 = @simp.asm_simp_tac(@list.List([@simp.rewrite_rule(@list.List([@class.eta_ax()]))(scalar_bounded()), is_unbounded_linear_cop()]))
  let t655 = @tactics.match_mp_tac(cfun_lim_ulinear())
  let t654 = @tactics.repeat_tac(@tactics.strip_tac)
  let t660 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([forall_inner_space_thm()])), t654), t655), (x656 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @q.exists_tac("s", x656)), t657), t658), t659)
  cfun_lim_smul_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ∀ net : Net[_], ∀ f : (_, _) -> Cart[Real, Tybit0[Unit]], ∀ l : (_) -> Cart[Real, Tybit0[Unit]], ∀ innerspc : (((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]), cfun_lim1(innerspc, f, l, net) → cfun_lim1(innerspc, (x : _) => cfun_smul(a, f(x)), cfun_smul(a, l), net)"), t660))
}

///|
let cfun_lim_smul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_LIM_SMUL")

///|
/// `CFUN_LIM_SMUL`
pub fn cfun_lim_smul() -> @kernel.Thm {
  cfun_lim_smul_c.get()
}

///|
/// CFUN_LIM_NORM_UBOUND
fn step_499() -> Unit raise {
  let t661 = @term_syntax.parse_term("is_inner_space(((s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool), (inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]))) && IN((l : (_) -> Cart[Real, Tybit0[Unit]]), s) && IN((f : (_) -> Cart[Real, Tybit0[Unit]]), s) → cfun_norm(inprod, l) <= cfun_norm(inprod, f - l) + (b : Real) || !(cfun_norm(inprod, f) <= b)")
  let step = @meson.meson(@list.List([cfun_norm_sub_ineq(), cfun_norm_sub(), @calc_rat.real_arith(@term_syntax.parse_term("(z : Real) <= (b : Real) && (x : Real) - z <= (y : Real) → x <= y + b"))]), t661)
  let t696 = @simp.asm_rewrite_tac(@list.List([]))
  let t695 = @tactics.match_mp_tac(step)
  let t694 = @simp.rewrite_tac(@list.List([@realarith.real_not_lt(), @real.real_le_sub_radd(), @class.de_morgan_thm(), cfun_dist(), @equal.gsym(cfun_norm())]))
  let t693 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(x : A)"))(fn(x690 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s691 = @tactics.mp_tac(x690)
    fn(x692 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s691(x692)
    }
  }))
  let t689 = @simp.asm_rewrite_tac(@list.List([]))
  let t686 = @drule.match_mp(@metric.eventually_happens())
  let t688 = @tactics.disch_then(fn(x687 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x683 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s684 = @tactics.mp_tac(x683)
      fn(x685 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s684(x685)
      }
    })(t686(x687))
  })
  let t681 = @equal.gsym(@metric.eventually_and())
  let t682 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((p : Bool) → (q : Bool) → false) == !(p && q)")), t681]))
  let t680 = @tactics.first_x_assum(@tactics.ante_res_then(fn(x677 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s678 = @tactics.mp_tac(x677)
    fn(x679 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s678(x679)
    }
  }))
  let t676 = @tactics.disch_then(@tactics.conjuncts_then2(@tactics.strip_assume_tac, fn(x673 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s674 = @tactics.mp_tac(x673)
    fn(x675 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s674(x675)
    }
  }))
  let t672 = @simp.rewrite_tac(@list.List([cfun_lim()]))
  let t671 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("!((l : Real) <= (b : Real)) == (real_of_num(0) < l - b)"))]))
  let t670 = @simp.gen_rewrite_tac(fn(x669 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x669
  }, @list.List([@equal.gsym(@class.contrapos_thm())]))
  let t668 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x662 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s663 = @tactics.assume_tac(x662)
    fn(x664 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s663(x664)
    }
  }, fn(x665 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s666 = @tactics.mp_tac(x665)
    fn(x667 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s666(x667)
    }
  }))
  let t697 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t668), t670), t671), @tactics.disch_tac), t672), t676), t680), t682), t688), t689), t693), t694), t695), t696)
  cfun_lim_norm_ubound_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ f : (A, _) -> Cart[Real, Tybit0[Unit]], ∀ l : (_) -> Cart[Real, Tybit0[Unit]], ∀ b : Real, ∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], !trivial_limit(net) && cfun_lim1((s, inprod), f, l, net) && eventually((x : A) => cfun_norm(inprod, f(x)) <= b, net) → cfun_norm(inprod, l) <= b"), t697))
}

///|
let cfun_lim_norm_ubound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_LIM_NORM_UBOUND")

///|
/// `CFUN_LIM_NORM_UBOUND`
pub fn cfun_lim_norm_ubound() -> @kernel.Thm {
  cfun_lim_norm_ubound_c.get()
}

///|
/// CFUN_LIM_UNIQUE
fn step_500() -> Unit raise {
  let t735 = @simp.asm_simp_tac(@list.List([@real.real_lt_rdiv_eq(), @real.real_le_rdiv_eq(), @real.real_of_num_lt(), @calc_num.arith()]))
  let t734 = @tactics.disch_then(fn(x729 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let thm_1 = x729
    @tactics.assum_list(fn(x731 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let thms = x731
      let t733 = @q.specl(@list.List(["s"]), thm_1)
      @tactics.mp_tac(@simp.rewrite_rule(thms)(t733))
    })
  })
  let t728 = @simp.rewrite_tac(@list.List([cfun_dist(), @equal.gsym(cfun_norm())]))
  let t727 = @impconv.imp_rewrite_tac(@list.List([cfun_dist_nz()]))
  let t726 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@class.contrapos_thm())]))
  let t736 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x725 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x721 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s722 = @tactics.mp_tac(x721)
      fn(x723 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s722(x723)
      }
    })(((x724 : @kernel.Thm) => @q.spec("cfun_norm inprod (l-l') / &2", x724))(x725))
  }), t726), t727), t728), t734), t735), @calc_rat.real_arith_tac)
  let t720 = @meson.asm_meson_tac(@list.List([@metric.eventually()]))
  let t719 = @impconv.imp_rewrite_tac(@list.List([cfun_norm_0(), @realarith.real_lt_imp_le()]))
  let t718 = @simp.asm_rewrite_tac(@list.List([]))
  let t717 = @tactics.map_every(fn(x715 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x716 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      @q.exists_tac(x715, x716)
    }
  }, @list.List(["net:(A)net", "\\x:A. cfun_zero", "s"]))
  let t714 = @tactics.match_mp_tac(cfun_lim_norm_ubound())
  let t737 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), t714), t717), t718), t719), t720), t736])
  let t713 = @q.subgoal_then("forall e. &0 < e ==> cfun_norm inprod (l-l') <= e", fn(x710 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s711 = @tactics.mp_tac(x710)
    fn(x712 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s711(x712)
    }
  })
  let t709 = @tactics.disch_then(fn(x705 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let thm = x705
    let t707 = @drule.match_mp(cfun_lim_sub())(thm)
    let t708 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([cfun_sub_refl()]))(t707))
    @tactics.then_tac(@tactics.assume_tac(@simp.rewrite_rule(@list.List([cfun_lim()]))(thm)), t708)
  })
  let t704 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x698 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s699 = @tactics.assume_tac(x698)
    fn(x700 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s699(x700)
    }
  }, fn(x701 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s702 = @tactics.mp_tac(x701)
    fn(x703 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s702(x703)
    }
  }))
  let t738 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t704), t709), t713), t737)
  cfun_lim_unique_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ f : (A, _) -> Cart[Real, Tybit0[Unit]], ∀ l : (_) -> Cart[Real, Tybit0[Unit]], ∀ l' : (_) -> Cart[Real, Tybit0[Unit]], ∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], !trivial_limit(net) && cfun_lim1((s, inprod), f, l, net) && cfun_lim1((s, inprod), f, l', net) → equv(l, l', inprod)"), t738))
}

///|
let cfun_lim_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_LIM_UNIQUE")

///|
/// `CFUN_LIM_UNIQUE`
pub fn cfun_lim_unique() -> @kernel.Thm {
  cfun_lim_unique_c.get()
}

///|
/// CFUN_SERIES_ADD
fn step_501() -> Unit raise {
  let t739 = @simp.simp_tac(@list.List([cfun_sums(), @misc.finite_inter_numseg(), cfun_sum_add(), cfun_lim_add()]))
  cfun_series_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num, _) -> Cart[Real, Tybit0[Unit]], ∀ g : (Num, _) -> Cart[Real, Tybit0[Unit]], ∀ l : (_) -> Cart[Real, Tybit0[Unit]], ∀ l' : (_) -> Cart[Real, Tybit0[Unit]], ∀ s : (Num) -> Bool, ∀ innerspc : (((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]), cfun_sums(innerspc, f, l, s) && cfun_sums(innerspc, g, l', s) → cfun_sums(innerspc, (n : Num) => f(n) + g(n), l + l', s)"), t739))
}

///|
let cfun_series_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SERIES_ADD")

///|
/// `CFUN_SERIES_ADD`
pub fn cfun_series_add() -> @kernel.Thm {
  cfun_series_add_c.get()
}

///|
/// CFUN_SERIES_SUB
fn step_502() -> Unit raise {
  let t740 = @simp.simp_tac(@list.List([cfun_sums(), @misc.finite_inter_numseg(), cfun_sum_sub(), cfun_lim_sub()]))
  cfun_series_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num, _) -> Cart[Real, Tybit0[Unit]], ∀ g : (Num, _) -> Cart[Real, Tybit0[Unit]], ∀ l : (_) -> Cart[Real, Tybit0[Unit]], ∀ l' : (_) -> Cart[Real, Tybit0[Unit]], ∀ s : (Num) -> Bool, ∀ innerspc : (((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]), cfun_sums(innerspc, f, l, s) && cfun_sums(innerspc, g, l', s) → cfun_sums(innerspc, (n : Num) => f(n) - g(n), l - l', s)"), t740))
}

///|
let cfun_series_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SERIES_SUB")

///|
/// `CFUN_SERIES_SUB`
pub fn cfun_series_sub() -> @kernel.Thm {
  cfun_series_sub_c.get()
}

///|
/// CFUN_SERIES_SMUL
fn step_503() -> Unit raise {
  let t741 = @simp.simp_tac(@list.List([cfun_sums(), @misc.finite_inter_numseg(), cfun_sum_smul(), cfun_lim_smul()]))
  cfun_series_smul_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ∀ f : (Num, _) -> Cart[Real, Tybit0[Unit]], ∀ l : (_) -> Cart[Real, Tybit0[Unit]], ∀ s : (Num) -> Bool, ∀ innerspc : (((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]), cfun_sums(innerspc, f, l, s) → cfun_sums(innerspc, (n : Num) => cfun_smul(a, f(n)), cfun_smul(a, l), s)"), t741))
}

///|
let cfun_series_smul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SERIES_SMUL")

///|
/// `CFUN_SERIES_SMUL`
pub fn cfun_series_smul() -> @kernel.Thm {
  cfun_series_smul_c.get()
}

///|
/// CFUN_SERIES_UNIQUE
fn step_504() -> Unit raise {
  let t742 = @meson.meson_tac(@list.List([@metric.trivial_limit_sequentially(), cfun_lim_unique()]))
  let t743 = @tactics.then_tac(@simp.rewrite_tac(@list.List([cfun_sums()])), t742)
  cfun_series_unique_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num, _) -> Cart[Real, Tybit0[Unit]], ∀ l : (_) -> Cart[Real, Tybit0[Unit]], ∀ l' : (_) -> Cart[Real, Tybit0[Unit]], ∀ s : (Num) -> Bool, ∀ s1 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], cfun_sums((s1, inprod), f, l, s) && cfun_sums((s1, inprod), f, l', s) → equv(l, l', inprod)"), t743))
}

///|
let cfun_series_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SERIES_UNIQUE")

///|
/// `CFUN_SERIES_UNIQUE`
pub fn cfun_series_unique() -> @kernel.Thm {
  cfun_series_unique_c.get()
}

///|
/// CFUN_INFSUM_UNIQUE
fn step_505() -> Unit raise {
  let t744 = @meson.meson_tac(@list.List([cfun_series_unique(), cfun_sums_infsum(), cfun_summable()]))
  cfun_infsum_unique_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num, _) -> Cart[Real, Tybit0[Unit]], ∀ l : (_) -> Cart[Real, Tybit0[Unit]], ∀ s : (Num) -> Bool, ∀ s1 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], cfun_sums((s1, inprod), f, l, s) → equv(cfun_infsum((s1, inprod), s, f), l, inprod)"), t744))
}

///|
let cfun_infsum_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_INFSUM_UNIQUE")

///|
/// `CFUN_INFSUM_UNIQUE`
pub fn cfun_infsum_unique() -> @kernel.Thm {
  cfun_infsum_unique_c.get()
}

///|
/// INFSUM_IN_SPC
fn step_506() -> Unit raise {
  let t745 = @meson.meson_tac(@list.List([cfun_lim_unique()]))
  let t746 = @tactics.then_tac(@simp.rewrite_tac(@list.List([cfun_summable(), cfun_lim(), cfun_infsum(), cfun_sums()])), t745)
  infsum_in_spc_c.set(@tactics.prove(@term_syntax.parse_term("∀ spc : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], ∀ f : (Num, _) -> Cart[Real, Tybit0[Unit]], ∀ l : _, ∀ s : (Num) -> Bool, cfun_summable((spc, inprod), s, f) → IN(cfun_infsum((spc, inprod), s, f), spc)"), t746))
}

///|
let infsum_in_spc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INFSUM_IN_SPC")

///|
/// `INFSUM_IN_SPC`
pub fn infsum_in_spc() -> @kernel.Thm {
  infsum_in_spc_c.get()
}

///|
/// CFUN_SERIES_0
fn step_507() -> Unit raise {
  let t747 = @impconv.imp_rewrite_tac(@list.List([cfun_sums(), cfun_sum_0(), cfun_lim_const(), inner_space_zero()]))
  cfun_series_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, ∀ spc : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], is_inner_space((spc, inprod)) → cfun_sums((spc, inprod), (n : Num) => cfun_zero, cfun_zero, s)"), t747))
}

///|
let cfun_series_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SERIES_0")

///|
/// `CFUN_SERIES_0`
pub fn cfun_series_0() -> @kernel.Thm {
  cfun_series_0_c.get()
}

///|
/// CFUN_SERIES_FINITE
fn step_508() -> Unit raise {
  let t763 = @meson.asm_meson_tac(@list.List([@arith.le_trans(), cfun_dist_refl()]))
  let t762 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_inter(), @iterate.in_numseg(), @arith.le_0()]))
  let t761 = @tactics.subgoal_then(@term_syntax.parse_term("INTER((s : (Num) -> Bool), op_dot_dot(0, (m : Num))) == s"), fn(x759 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x759
    @simp.asm_simp_tac(@list.List([th]))
  })
  let t758 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t757 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num)"))
  let t756 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t755 = @impconv.imp_rewrite_tac(@list.List([cfun_sum_in_spc(), @misc.finite_inter_numseg(), inner_space_is_subspace()]))
  let t754 = @simp.asm_rewrite_tac(@list.List([cfun_sums(), cfun_lim_sequentially()]))
  let t753 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t752 = @simp.rewrite_tac(@list.List([@sets.num_finite(), @theorems.left_imp_exists_thm()]))
  let t751 = @tactics.pop_assum(fn(x748 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let thm = x748
    let t750 = @tactics.assume_tac(thm)
    @tactics.then_tac(@tactics.mp_tac(thm), t750)
  })
  let t764 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t751), t752), t753), t754), t755), @tactics.disch_tac), t756), @tactics.disch_tac), t757), t758), @tactics.disch_tac), t761), t762), t763)
  cfun_series_finite_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num, _) -> Cart[Real, Tybit0[Unit]], ∀ s : (Num) -> Bool, ∀ spc : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], (∀ x : Num, IN(f(x), spc)) && is_inner_space((spc, inprod)) && FINITE(s) → cfun_sums((spc, inprod), f, cfun_sum(s, f), s)"), t764))
}

///|
let cfun_series_finite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SERIES_FINITE")

///|
/// `CFUN_SERIES_FINITE`
pub fn cfun_series_finite() -> @kernel.Thm {
  cfun_series_finite_c.get()
}

///|
/// CFUN_SERIES_SLINEAR
fn step_509() -> Unit raise {
  let t773 = @meson.asm_meson_tac(@list.List([cfun_sum_in_spc(), ulincop_subspace(), @sets.finite_inter(), @iterate.finite_numseg()]))
  let t771 = @tactics.match_mp_tac(cfun_lim_ulinear())
  let t774 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([cfun_sums()])), t771), (x772 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @q.exists_tac("s1", x772)), t773)
  let t770 = @meson.asm_meson_tac(@list.List([ulincop_subspace(), ulincop_add(), ulincop_smul(), is_set_linear_cop()]))
  let t775 = @list.List([@tactics.then_tac(@impconv.imp_rewrite_tac(@list.List([@sets.finite_inter(), @iterate.finite_numseg(), @equal.gsym(@simp.rewrite_rule(@list.List([@trivia.o_def()]))(slinear_cfun_sum_imp()))])), t770), t774])
  let t769 = @q.subgoal_then("forall n. cfun_sum (s INTER(0..n)) (\\x. h(f x)) = h(cfun_sum (s INTER(0..n)) f)", fn(x766 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s767 = @tactics.assume_tac(x766)
    fn(x768 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s767(x768)
    }
  })
  let t765 = @tactics.repeat_tac(@tactics.strip_tac)
  let t776 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([cfun_sums()])), t765), t769), t775)
  cfun_series_slinear_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num, _) -> Cart[Real, Tybit0[Unit]], ∀ h : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ l : (_) -> Cart[Real, Tybit0[Unit]], ∀ s : (Num) -> Bool, ∀ s1 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s2 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], cfun_sums((s2, inprod), f, l, s) && is_unbounded_linear_cop(s1, h) && is_bounded1((s2, inprod), h) && (∀ x : (_) -> Cart[Real, Tybit0[Unit]], IN(x, s1) → IN(x, s2) && IN(h(x), s2)) && (∀ n : Num, IN(f(n), s1)) && IN(l, s1) → cfun_sums((s2, inprod), (n : Num) => h(f(n)), h(l), s)"), t776))
}

///|
let cfun_series_slinear_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SERIES_SLINEAR")

///|
/// `CFUN_SERIES_SLINEAR`
pub fn cfun_series_slinear() -> @kernel.Thm {
  cfun_series_slinear_c.get()
}

///|
/// CFUN_INFSUM_0
fn step_510() -> Unit raise {
  let t778 = @simp.asm_simp_tac(@list.List([cfun_series_0()]))
  let t777 = @tactics.match_mp_tac(cfun_infsum_unique())
  let t779 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t777), t778)
  cfun_infsum_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ spc : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], ∀ s : (Num) -> Bool, is_inner_space((spc, inprod)) → equv(cfun_infsum((spc, inprod), s, (i : Num) => cfun_zero), cfun_zero, inprod)"), t779))
}

///|
let cfun_infsum_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_INFSUM_0")

///|
/// `CFUN_INFSUM_0`
pub fn cfun_infsum_0() -> @kernel.Thm {
  cfun_infsum_0_c.get()
}

///|
/// CFUN_INFSUM_SLINEAR
fn step_511() -> Unit raise {
  let t783 = @simp.asm_simp_tac(@list.List([cfun_sums_infsum()]))
  let t781 = @tactics.match_mp_tac(cfun_series_slinear())
  let t780 = @tactics.match_mp_tac(cfun_infsum_unique())
  let t784 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t780), t781), (x782 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @q.exists_tac("s1", x782)), t783)
  cfun_infsum_slinear_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num, _) -> Cart[Real, Tybit0[Unit]], ∀ h : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ l : _, ∀ s : (Num) -> Bool, ∀ s1 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ s2 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], cfun_summable((s2, inprod), s, f) && is_unbounded_linear_cop(s1, h) && is_bounded1((s2, inprod), h) && (∀ x : (_) -> Cart[Real, Tybit0[Unit]], IN(x, s1) → IN(x, s2) && IN(h(x), s2)) && (∀ n : Num, IN(f(n), s1)) && IN(cfun_infsum((s2, inprod), s, f), s1) → equv(cfun_infsum((s2, inprod), s, (n : Num) => h(f(n))), h(cfun_infsum((s2, inprod), s, f)), inprod)"), t784))
}

///|
let cfun_infsum_slinear_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_INFSUM_SLINEAR")

///|
/// `CFUN_INFSUM_SLINEAR`
pub fn cfun_infsum_slinear() -> @kernel.Thm {
  cfun_infsum_slinear_c.get()
}

///|
/// CFUN_INFSUM_SMUL
fn step_512() -> Unit raise {
  let t787 = @simp.asm_rewrite_tac(@list.List([cfun_sums_infsum()]))
  let t786 = @tactics.match_mp_tac(cfun_series_smul())
  let t785 = @tactics.match_mp_tac(cfun_infsum_unique())
  let t788 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t785), t786), t787)
  cfun_infsum_smul_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, Tybit0[Unit]], ∀ f : (Num, _) -> Cart[Real, Tybit0[Unit]], ∀ s : (Num) -> Bool, ∀ s1 : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], cfun_summable((s1, inprod), s, f) → equv(cfun_infsum((s1, inprod), s, (n : Num) => cfun_smul(a, f(n))), cfun_smul(a, cfun_infsum((s1, inprod), s, f)), inprod)"), t788))
}

///|
let cfun_infsum_smul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_INFSUM_SMUL")

///|
/// `CFUN_INFSUM_SMUL`
pub fn cfun_infsum_smul() -> @kernel.Thm {
  cfun_infsum_smul_c.get()
}

///|
/// CFUN_SERIES_RESTRICT
fn step_513() -> Unit raise {
  let t794 = @simp.simp_tac(@list.List([@sets.in_inter()]))
  let t795 = @tactics.then_tac(@tactics.match_mp_tac(cfun_sum_eq()), t794)
  let t793 = @sets.set_tac(@list.List([]))
  let t796 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(cfun_sum_superset()), t793), t795])
  let t792 = @tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("cfun_sum((s : (_) -> Bool), (f : (_, _) -> Cart[Real, Tybit0[Unit]])) == cfun_sum((t : (_) -> Bool), f) && cfun_sum(t, f) == cfun_sum(t, (g : (_, _) -> Cart[Real, Tybit0[Unit]])) → cfun_sum(s, f) == cfun_sum(t, g)")))
  let t791 = @simp.rewrite_tac(@list.List([@sets.inter_univ()]))
  let t790 = @simp.once_rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t789 = @simp.rewrite_tac(@list.List([cfun_sums()]))
  let t797 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t789), @tactics.ap_thm_tac), @tactics.ap_thm_tac), @tactics.ap_term_tac), t790), t791), @tactics.gen_tac), t792), @tactics.conj_tac), t796)
  cfun_series_restrict_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num, _) -> Cart[Real, Tybit0[Unit]], ∀ k : (Num) -> Bool, ∀ l : (_) -> Cart[Real, Tybit0[Unit]], ∀ innerspc : (((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]), cfun_sums(innerspc, (n : Num) => if IN(n, k) { f(n) } else { cfun_zero }, l, UNIV) == cfun_sums(innerspc, f, l, k)"), t797))
}

///|
let cfun_series_restrict_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SERIES_RESTRICT")

///|
/// `CFUN_SERIES_RESTRICT`
pub fn cfun_series_restrict() -> @kernel.Thm {
  cfun_series_restrict_c.get()
}

///|
/// CFUN_SUMS_FINITE_DIFF
fn step_514() -> Unit raise {
  let lem = @meson.meson(@list.List([]), @term_syntax.parse_term("((P : Bool) && (Q : Bool) && (E : Bool) → (C : Bool)) == (E → P → Q → C)"))
  let t842 = @simp.asm_rewrite_tac(@list.List([cfun_sub_refl(), cfun_sub_rid()]))
  let t840 = @term_syntax.parse_term("IN((x : Num), (t : (Num) -> Bool))")
  let t841 = @tactics.map_every(@class.asm_cases_tac, @list.List([@term_syntax.parse_term("IN((x : Num), (s : (Num) -> Bool))"), t840]))
  let t837 = @simp.gen_rewrite_rule(fn(x836 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x836
  }, @list.List([@sets.subset()]))
  let t833 = @term_syntax.parse_term("(x : Num)")
  let t839 = @tactics.first_assum(fn(x838 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x835 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x830 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s831 = @tactics.mp_tac(x830)
        fn(x832 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s831(x832)
        }
      })(((x834 : @kernel.Thm) => @bool.spec(t833, x834))(x835))
    })(t837(x838))
  })
  let t829 = @simp.rewrite_tac(@list.List([@sets.in_diff()]))
  let t828 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)"))
  let t827 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t826 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t823 = @drule.match_mp(cfun_series_sub())
  let t825 = @tactics.disch_then(fn(x824 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x820 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s821 = @tactics.mp_tac(x820)
      fn(x822 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s821(x822)
      }
    })(t823(x824))
  })
  let t819 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t818 = @simp.once_rewrite_tac(@list.List([@equal.gsym(cfun_series_restrict())]))
  let t817 = @tactics.pop_assum(fn(x814 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s815 = @tactics.mp_tac(x814)
    fn(x816 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s815(x816)
    }
  })
  let t813 = @tactics.pop_assum(fn(x810 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s811 = @tactics.mp_tac(x810)
    fn(x812 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s811(x812)
    }
  })
  let t809 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x805 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let thm1 = x805
    @tactics.pop_assum(fn(x807 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let thm2 = x807
      @tactics.assume_tac(@drule.match_mp(thm2)(thm1))
    })
  }))
  let t804 = @tactics.assume_tac(@simp.rewrite_rule(@list.List([lem]))(cfun_series_finite()))
  let t801 = @drule.match_mp(cfun_sums_inner_space())
  let t803 = @tactics.first_assum(fn(x802 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x798 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s799 = @tactics.assume_tac(x798)
      fn(x800 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s799(x800)
      }
    })(t801(x802))
  })
  let t843 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t803), t804), t809), t813), t817), t818), t819), t825), t826), @tactics.ap_thm_tac), @tactics.ap_thm_tac), @tactics.ap_term_tac), t827), t828), t829), t839), t841), t842)
  cfun_sums_finite_diff_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num, _) -> Cart[Real, Tybit0[Unit]], ∀ l : (_) -> Cart[Real, Tybit0[Unit]], ∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, ∀ spc : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inpord : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], SUBSET(t, s) && FINITE(t) && (∀ x : Num, IN(f(x), spc)) && cfun_sums((spc, inpord), f, l, s) → cfun_sums((spc, inpord), f, l - cfun_sum(t, f), DIFF(s, t))"), t843))
}

///|
let cfun_sums_finite_diff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUMS_FINITE_DIFF")

///|
/// `CFUN_SUMS_FINITE_DIFF`
pub fn cfun_sums_finite_diff() -> @kernel.Thm {
  cfun_sums_finite_diff_c.get()
}

///|
/// CFUN_SUMS_OFFSET
fn step_515() -> Unit raise {
  let t849 = @simp.simp_tac(@list.List([@sets.subset(), @misc.in_from(), @iterate.in_numseg()]))
  let t848 = @simp.asm_rewrite_tac(@list.List([@iterate.finite_numseg()]))
  let t850 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(cfun_sums_finite_diff()), t848), t849)
  let t851 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @misc.in_from(), @sets.in_diff(), @iterate.in_numseg()])), @int.asm_arith_tac), t850])
  let t847 = @tactics.subgoal_then(@term_syntax.parse_term("from((n : Num)) == DIFF(from((m : Num)), op_dot_dot(m, n - 1))"), fn(x844 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s845 = @tactics.subst1_tac(x844)
    fn(x846 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s845(x846)
    }
  })
  let t852 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t847), t851)
  cfun_sums_offset_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num, _) -> Cart[Real, Tybit0[Unit]], ∀ l : (_) -> Cart[Real, Tybit0[Unit]], ∀ m : Num, ∀ n : Num, ∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], cfun_sums((s, inprod), f, l, from(m)) && (∀ x : Num, IN(f(x), s)) && m < n → cfun_sums((s, inprod), f, l - cfun_sum(op_dot_dot(m, n - 1), f), from(n))"), t852))
}

///|
let cfun_sums_offset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUMS_OFFSET")

///|
/// `CFUN_SUMS_OFFSET`
pub fn cfun_sums_offset() -> @kernel.Thm {
  cfun_sums_offset_c.get()
}

///|
/// CFUN_SUMMABLE_OFFSET
fn step_516() -> Unit raise {
  let t853 = @meson.meson_tac(@list.List([cfun_summable(), cfun_sums_offset()]))
  cfun_summable_offset_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num, _) -> Cart[Real, Tybit0[Unit]], ∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], ∀ n : Num, cfun_summable((s, inprod), from((m : Num)), f) && (∀ x : Num, IN(f(x), s)) && m < n → cfun_summable((s, inprod), from(n), f)"), t853))
}

///|
let cfun_summable_offset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUMMABLE_OFFSET")

///|
/// `CFUN_SUMMABLE_OFFSET`
pub fn cfun_summable_offset() -> @kernel.Thm {
  cfun_summable_offset_c.get()
}

///|
/// CFUN_INFSUM_OFFSET
fn step_517() -> Unit raise {
  let t861 = @meson.meson_tac(@list.List([cfun_infsum_unique()]))
  let t858 = @drule.match_mp(cfun_sums_offset())
  let t860 = @tactics.disch_then(fn(x859 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x855 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s856 = @tactics.mp_tac(x855)
      fn(x857 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s856(x857)
      }
    })(t858(x859))
  })
  let t854 = @simp.rewrite_tac(@list.List([@equal.gsym(cfun_sums_infsum())]))
  let t862 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t854), t860), t861)
  cfun_infsum_offset_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num, _) -> Cart[Real, Tybit0[Unit]], ∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], ∀ n : Num, ∀ m : Num, cfun_summable((s, inprod), from(m), f) && (∀ x : Num, IN(f(x), s)) && m < n → equv(cfun_infsum((s, inprod), from(n), f), cfun_infsum((s, inprod), from(m), f) - cfun_sum(op_dot_dot(m, n - 1), f), inprod)"), t862))
}

///|
let cfun_infsum_offset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_INFSUM_OFFSET")

///|
/// `CFUN_INFSUM_OFFSET`
pub fn cfun_infsum_offset() -> @kernel.Thm {
  cfun_infsum_offset_c.get()
}

///|
/// CFUN_SUMS_REINDEX
fn step_518() -> Unit raise {
  let t879 = @int.arith_rule(@term_syntax.parse_term("(N : Num) + (k : Num) <= (n : Num) → N <= n + k"))
  let t880 = @meson.asm_meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(N : Num) + (k : Num) <= (n : Num) → n == n - k + k && N <= n - k")), t879]))
  let t875 = @tactics.pop_assum(fn(x872 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s873 = @tactics.mp_tac(x872)
    fn(x874 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s873(x874)
    }
  })
  let t876 = @tactics.then_tac(@tactics.then_tac(@impconv.imp_rewrite_tac(@list.List([cfun_sum_triv_numseg(), inner_space_zero()])), t875), @int.arith_tac)
  let t877 = @list.List([@tactics.first_assum(fn(x870 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x870
    @meson.asm_meson_tac(@list.List([@arith.sub_add(), @q.spec("x-k", th)]))
  }), t876])
  let t878 = @list.List([@tactics.thenl(@q.asm_cases_tac(" k <= x"), t877), @tactics.all_tac, @tactics.all_tac])
  let t869 = @tactics.repeat_tac(@tactics.strip_tac)
  let t868 = @simp.simp_tac(@list.List([]))
  let t867 = @simp.rewrite_tac(@list.List([cfun_lim_sequentially()]))
  let t866 = @simp.rewrite_tac(@list.List([@equal.gsym(cfun_sum_offset())]))
  let t865 = @tactics.repeat_tac(@tactics.gen_tac)
  let t864 = @simp.rewrite_tac(@list.List([cfun_sums(), @misc.from_inter_numseg()]))
  let t863 = @tactics.repeat_tac(@tactics.gen_tac)
  let t881 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([forall_inner_space_thm()])), t863), t864), t865), t866), t867), @tactics.eq_tac), t868), t869), t878), t880)
  cfun_sums_reindex_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num, _) -> Cart[Real, Tybit0[Unit]], ∀ innerspc : (((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]), ∀ n : Num, ∀ l : (_) -> Cart[Real, Tybit0[Unit]], ∀ k : Num, cfun_sums(innerspc, (x : Num) => f(x + k), l, from(n)) == cfun_sums(innerspc, f, l, from(n + k))"), t881))
}

///|
let cfun_sums_reindex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUMS_REINDEX")

///|
/// `CFUN_SUMS_REINDEX`
pub fn cfun_sums_reindex() -> @kernel.Thm {
  cfun_sums_reindex_c.get()
}

///|
/// CFUN_SUMMABLE_REINDEX
fn step_519() -> Unit raise {
  let t882 = @meson.meson_tac(@list.List([cfun_summable(), cfun_sums_reindex()]))
  cfun_summable_reindex_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num, _) -> Cart[Real, Tybit0[Unit]], ∀ innerspc : (((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]]), ∀ n : Num, ∀ k : Num, cfun_summable(innerspc, from(n), (x : Num) => f(x + k)) == cfun_summable(innerspc, from(n + k), f)"), t882))
}

///|
let cfun_summable_reindex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_SUMMABLE_REINDEX")

///|
/// `CFUN_SUMMABLE_REINDEX`
pub fn cfun_summable_reindex() -> @kernel.Thm {
  cfun_summable_reindex_c.get()
}

///|
/// CFUN_INFSUM_REINDEX
fn step_520() -> Unit raise {
  let t884 = @simp.asm_simp_tac(@list.List([@equal.gsym(cfun_sums_reindex()), cfun_sums_infsum()]))
  let t883 = @tactics.match_mp_tac(cfun_infsum_unique())
  let t885 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t883), t884)
  cfun_infsum_reindex_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num, _) -> Cart[Real, Tybit0[Unit]], ∀ s : ((_) -> Cart[Real, Tybit0[Unit]]) -> Bool, ∀ inprod : ((_) -> Cart[Real, Tybit0[Unit]], (_) -> Cart[Real, Tybit0[Unit]]) -> Cart[Real, Tybit0[Unit]], ∀ n : Num, ∀ k : Num, cfun_summable((s, inprod), from(n), (x : Num) => f(x + k)) → equv(cfun_infsum((s, inprod), from(n + k), f), cfun_infsum((s, inprod), from(n), (x : Num) => f(x + k)), inprod)"), t885))
}

///|
let cfun_infsum_reindex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CFUN_INFSUM_REINDEX")

///|
/// `CFUN_INFSUM_REINDEX`
pub fn cfun_infsum_reindex() -> @kernel.Thm {
  cfun_infsum_reindex_c.get()
}

///|
/// cop_sum
fn step_521() -> Unit raise {
  cop_sum_c.set(@pair.new_definition(@term_syntax.parse_term("(cop_sum : ((_) -> Bool, (_, _, _) -> Cart[Real, Tybit0[Unit]], _, _) -> Cart[Real, Tybit0[Unit]])((s : (_) -> Bool), (f : (_, _, _) -> Cart[Real, Tybit0[Unit]])) == ((x : _) => cfun_sum(s, (n : _) => f(n, x)))")))
}

///|
let cop_sum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cop_sum")

///|
/// `cop_sum`
pub fn cop_sum() -> @kernel.Thm {
  cop_sum_c.get()
}

///|
/// COP_BINOMIAL_THEOREM
fn step_522() -> Unit raise {
  let t910 = @simp.simp_tac(@list.List([cop_pow_commute_n(), cop_mul_assoc()]))
  let t909 = @simp.asm_simp_tac(@list.List([cop_pow_commute_n()]))
  let t908 = @simp.simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(k : Num) <= (n : Num) → SUC(n) - k == SUC(n - k)")), cop_pow()]))
  let t907 = @tactics.match_mp_tac(cfun_sum_eq_numseg())
  let t906 = @tactics.rule_assum_tac(@equal.gsym)
  let t904 = @equal.gsym(cop_mul_assoc())
  let t905 = @simp.asm_simp_tac(@list.List([@equal.gsym(cop_add_v1()), cop_mul_rid(), cop_eq_add_lcancel(), lincop_mul_rmul(), @calc_num.arith(), @class.eta_ax(), t904]))
  let t903 = @simp.simp_tac(@list.List([cfun_sum_clauses_left(), @arith.le_0(), @binomial.binom_lt(), @arith.lt(), cop_smul_lid(), @arith.sub_0(), cop_pow(), @binomial.binom(), cop_smul_lzero(), cop_zero_v1(), cfun_add_rid(), cop_mul_lid()]))
  let t902 = @simp.rewrite_tac(@list.List([cfun_sum_clauses_numseg(), @equal.gsym(@arith.add1()), @arith.le_suc(), @arith.le_0()]))
  let t900 = @term_syntax.parse_term("cfun_sum(op_dot_dot((m : Num) + 1, (n : Num) + 1), (i : Num) => (f : (Num, _) -> Cart[Real, Tybit0[Unit]])(i))")
  let t901 = @simp.simp_tac(@list.List([@arith.add1(), @equal.sym(@simp.rewrite_conv(@list.List([cfun_sum_offset()]))(t900))]))
  let t897 = @equal.gsym(cop_mul_assoc())
  let t898 = @simp.simp_tac(@list.List([@equal.gsym(cop_pow()), t897]))
  let t899 = @list.List([@simp.asm_simp_tac(@list.List([@equal.gsym(lincop_mul_rmul()), @arith.sub_suc(), cop_mul_v1()])), t898])
  let t894 = @equal.gsym(@trivia.i_def())
  let t895 = @equal.gsym(cop_mul_thm())
  let t896 = @simp.rewrite_tac(@list.List([@equal.gsym(cop_mul_v1()), t895, t894, cop_mul_rid()]))
  let t893 = @tactics.match_mp_tac(@meson.meson(@list.List([cop_add_ac()]), @term_syntax.parse_term("(a : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]]) == (e : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]]) && (b : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]]) == (c : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]]) + (d : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]]) → a + b == c + (d + e)")))
  let t891 = @equal.gsym(cop_add_v1())
  let t892 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add()), @complexes.cx_add(), cop_add_rdistrib(), cun_sum_add_numseg(), @arith.sub_0(), t891, cop_add_thm()]))
  let t890 = @simp.asm_simp_tac(@list.List([linear_cfun_sum(), add_lincop(), cop_mul_v1(), @iterate.finite_numseg(), @trivia.o_def(), cop_add_mul_rdistrib()]))
  let t889 = @simp.asm_simp_tac(@list.List([cop_pow(), @binomial.binom(), @equal.gsym(@arith.add1()), cop_mul_lid(), cop_smul_lid(), cop_sum()]))
  let t888 = @simp.simp_tac(@list.List([cfun_sum_clauses_left(), @arith.add1(), @int.arith_rule(@term_syntax.parse_term("0 <= (n : Num) + 1")), cfun_sum_offset()]))
  let t887 = @simp.rewrite_tac(@list.List([cfun_sum_sing_numseg(), @binomial.binom(), @arith.sub_refl(), cop_pow(), cop_mul_lid(), @trivia.i_thm(), @equal.gsym(@trivia.i_def()), cop_smul_lid()]))
  let t886 = @simp.asm_rewrite_tac(@list.List([cop_pow(), cop_sum()]))
  let t911 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@nums.induct_tac, @tactics.repeat_tac(@tactics.strip_tac)), t886), t887), t888), t889), t890), t892), t893), @tactics.conj_tac), t896), t899), t901), t902), t903), t905), @tactics.abs_tac), t906), t907), t908), t909), t910)
  cop_binomial_theorem_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ op1 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], ∀ op2 : ((_) -> Cart[Real, Tybit0[Unit]], _) -> Cart[Real, Tybit0[Unit]], cop_mul(op1, op2) == cop_mul(op2, op1) && is_linear_cop(op1) && is_linear_cop(op2) → pow(op1 + op2, n) == cop_sum(op_dot_dot(0, n), (k : Num) => cop_smul(Cx(real_of_num(binom((n, k)))), cop_mul(pow(op1, k), pow(op2, n - k))))"), t911))
}

///|
let cop_binomial_theorem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COP_BINOMIAL_THEOREM")

///|
/// `COP_BINOMIAL_THEOREM`
pub fn cop_binomial_theorem() -> @kernel.Thm {
  cop_binomial_theorem_c.get()
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
  step_126()
  step_127()
  step_128()
  step_129()
  step_130()
  step_131()
  step_132()
  step_133()
  step_134()
  step_135()
  step_136()
  step_137()
  step_138()
  step_139()
  step_140()
  step_141()
  step_142()
  step_143()
  step_144()
  step_145()
  step_146()
  step_147()
  step_148()
  step_149()
  step_150()
  step_151()
  step_152()
  step_153()
  step_154()
  step_155()
  step_156()
  step_157()
  step_158()
  step_159()
  step_160()
  step_161()
  step_162()
  step_163()
  step_164()
  step_165()
  step_166()
  step_167()
  step_168()
  step_169()
  step_170()
  step_171()
  step_172()
  step_173()
  step_174()
  step_175()
  step_176()
  step_177()
  step_178()
  step_179()
  step_180()
  step_181()
  step_182()
  step_183()
  step_184()
  step_185()
  step_186()
  step_187()
  step_188()
  step_189()
  step_190()
  step_191()
  step_192()
  step_193()
  step_194()
  step_195()
  step_196()
  step_197()
  step_198()
  step_199()
  step_200()
  step_201()
  step_202()
  step_203()
  step_204()
  step_205()
  step_206()
  step_207()
  step_208()
  step_209()
  step_210()
  step_211()
  step_212()
  step_213()
  step_214()
  step_215()
  step_216()
  step_217()
  step_218()
  step_219()
  step_220()
  step_221()
  step_222()
  step_223()
  step_224()
  step_225()
  step_226()
  step_227()
  step_228()
  step_229()
  step_230()
  step_231()
  step_232()
  step_233()
  step_234()
  step_235()
  step_236()
  step_237()
  step_238()
  step_239()
  step_240()
  step_241()
  step_242()
  step_243()
  step_244()
  step_245()
  step_246()
  step_247()
  step_248()
  step_249()
  step_250()
  step_251()
  step_252()
  step_253()
  step_254()
  step_255()
  step_256()
  step_257()
  step_258()
  step_259()
  step_260()
  step_261()
  step_262()
  step_263()
  step_264()
  step_265()
  step_266()
  step_267()
  step_268()
  step_269()
  step_270()
  step_271()
  step_272()
  step_273()
  step_274()
  step_275()
  step_276()
  step_277()
  step_278()
  step_279()
  step_280()
  step_281()
  step_282()
  step_283()
  step_284()
  step_285()
  step_286()
  step_287()
  step_288()
  step_289()
  step_290()
  step_291()
  step_292()
  step_293()
  step_294()
  step_295()
  step_296()
  step_297()
  step_298()
  step_299()
  step_300()
  step_301()
  step_302()
  step_303()
  step_304()
  step_305()
  step_306()
  step_307()
  step_308()
  step_309()
  step_310()
  step_311()
  step_312()
  step_313()
  step_314()
  step_315()
  step_316()
  step_317()
  step_318()
  step_319()
  step_320()
  step_321()
  step_322()
  step_323()
  step_324()
  step_325()
  step_326()
  step_327()
  step_328()
  step_329()
  step_330()
  step_331()
  step_332()
  step_333()
  step_334()
  step_335()
  step_336()
  step_337()
  step_338()
  step_339()
  step_340()
  step_341()
  step_342()
  step_343()
  step_344()
  step_345()
  step_346()
  step_347()
  step_348()
  step_349()
  step_350()
  step_351()
  step_352()
  step_353()
  step_354()
  step_355()
  step_356()
  step_357()
  step_358()
  step_359()
  step_360()
  step_361()
  step_362()
  step_363()
  step_364()
  step_365()
  step_366()
  step_367()
  step_368()
  step_369()
  step_370()
  step_371()
  step_372()
  step_373()
  step_374()
  step_375()
  step_376()
  step_377()
  step_378()
  step_379()
  step_380()
  step_381()
  step_382()
  step_383()
  step_384()
  step_385()
  step_386()
  step_387()
  step_388()
  step_389()
  step_390()
  step_391()
  step_392()
  step_393()
  step_394()
  step_395()
  step_396()
  step_397()
  step_398()
  step_399()
  step_400()
  step_401()
  step_402()
  step_403()
  step_404()
  step_405()
  step_406()
  step_407()
  step_408()
  step_409()
  step_410()
  step_411()
  step_412()
  step_413()
  step_414()
  step_415()
  step_416()
  step_417()
  step_418()
  step_419()
  step_420()
  step_421()
  step_422()
  step_423()
  step_424()
  step_425()
  step_426()
  step_427()
  step_428()
  step_429()
  step_430()
  step_431()
  step_432()
  step_433()
  step_434()
  step_435()
  step_436()
  step_437()
  step_438()
  step_439()
  step_440()
  step_441()
  step_442()
  step_443()
  step_444()
  step_445()
  step_446()
  step_447()
  step_448()
  step_449()
  step_450()
  step_451()
  step_452()
  step_453()
  step_454()
  step_455()
  step_456()
  step_457()
  step_458()
  step_459()
  step_460()
  step_461()
  step_462()
  step_463()
  step_464()
  step_465()
  step_466()
  step_467()
  step_468()
  step_469()
  step_470()
  step_471()
  step_472()
  step_473()
  step_474()
  step_475()
  step_476()
  step_477()
  step_478()
  step_479()
  step_480()
  step_481()
  step_482()
  step_483()
  step_484()
  step_485()
  step_486()
  step_487()
  step_488()
  step_489()
  step_490()
  step_491()
  step_492()
  step_493()
  step_494()
  step_495()
  step_496()
  step_497()
  step_498()
  step_499()
  step_500()
  step_501()
  step_502()
  step_503()
  step_504()
  step_505()
  step_506()
  step_507()
  step_508()
  step_509()
  step_510()
  step_511()
  step_512()
  step_513()
  step_514()
  step_515()
  step_516()
  step_517()
  step_518()
  step_519()
  step_520()
  step_521()
  step_522()
}
