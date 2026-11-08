// Translated from upstream Formal_ineqs/taylor/m_taylor.hl; edit this file directly.

///|
/// MY_RULE
fn step_1() -> Unit raise {
  let t1 = @simp.pure_rewrite_rule(@list.List([@equal.gsym(@theorems.imp_imp())]))
  my_rule_c.set(fn(x3 : @kernel.Thm) -> @kernel.Thm raise {
    (fn(x2 : @kernel.Thm) -> @kernel.Thm raise {
      @bool.undisch_all(t1(x2))
    })(@bool.spec_all(x3))
  })
}

///|
let my_rule_c : @lib.Cell[(@kernel.Thm) -> @kernel.Thm raise] = @lib.Cell::new("MY_RULE")

///|
/// `MY_RULE`
pub fn my_rule(x : @kernel.Thm) -> @kernel.Thm raise {
  (my_rule_c.get())(x)
}

///|
/// MY_RULE_NUM
fn step_2() -> Unit raise {
  let t5 = @simp.pure_rewrite_rule(@list.List([@equal.gsym(@theorems.imp_imp())]))
  my_rule_num_c.set(fn(x7 : @kernel.Thm) -> @kernel.Thm raise {
    (fn(x6 : @kernel.Thm) -> @kernel.Thm raise {
      (fn(x4 : @kernel.Thm) -> @kernel.Thm raise {
        @bool.undisch_all(@arith_nat.numerals_to_num(x4))
      })(t5(x6))
    })(@bool.spec_all(x7))
  })
}

///|
let my_rule_num_c : @lib.Cell[(@kernel.Thm) -> @kernel.Thm raise] = @lib.Cell::new("MY_RULE_NUM")

///|
/// `MY_RULE_NUM`
pub fn my_rule_num(x : @kernel.Thm) -> @kernel.Thm raise {
  (my_rule_num_c.get())(x)
}

///|
/// MY_RULE_FLOAT
fn step_3() -> Unit raise {
  let t9 = @simp.pure_rewrite_rule(@list.List([@float_theory.float_of_num(), @float_theory.min_exp_def(), @equal.gsym(@theorems.imp_imp())]))
  my_rule_float_c.set(fn(x11 : @kernel.Thm) -> @kernel.Thm raise {
    (fn(x10 : @kernel.Thm) -> @kernel.Thm raise {
      (fn(x8 : @kernel.Thm) -> @kernel.Thm raise {
        @bool.undisch_all(@arith_nat.numerals_to_num(x8))
      })(t9(x10))
    })(@bool.spec_all(x11))
  })
}

///|
let my_rule_float_c : @lib.Cell[(@kernel.Thm) -> @kernel.Thm raise] = @lib.Cell::new("MY_RULE_FLOAT")

///|
/// `MY_RULE_FLOAT`
pub fn my_rule_float(x : @kernel.Thm) -> @kernel.Thm raise {
  (my_rule_float_c.get())(x)
}

///|
/// max_dim
fn step_4() -> Unit raise {
  max_dim_c.set(8L)
}

///|
let max_dim_c : @lib.Cell[Int64] = @lib.Cell::new("max_dim")

///|
/// `M_taylor.max_dim`
pub fn max_dim() -> Int64 {
  max_dim_c.get()
}

///|
/// `inst_first_type_var`
pub fn inst_first_type_var(x12 : @kernel.HolType, x13 : @kernel.Thm) -> @kernel.Thm raise {
  let ty = x12
  let th = x13
  let ty_vars = @kernel.type_vars_in_term(@kernel.concl(th))
  if @list.List::is_empty(ty_vars) {
    raise Failure("inst_first_type: no type variables in the theorem")
  } else {
    @kernel.inst_type(@list.List([(ty, @lib.hd(ty_vars))]), th)
  }
}

///|
/// float0
fn step_5() -> Unit raise {
  float0_c.set(@arith_float.mk_float(0L)(0L))
}

///|
let float0_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("float0")

///|
/// `M_taylor.float0`
pub fn float0() -> @kernel.Term {
  float0_c.get()
}

///|
/// interval0
fn step_6() -> Unit raise {
  interval0_c.set(@arith_float.mk_float_interval_small_num(0L))
}

///|
let interval0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("interval0")

///|
/// `M_taylor.interval0`
pub fn interval0() -> @kernel.Thm {
  interval0_c.get()
}

///|
/// has_size_array
fn step_7() -> Unit raise {
  has_size_array_c.set(@lib.array_init(@lib.add63(max_dim(), 1L), fn(x14 : Int64) -> @kernel.Thm raise {
    let i = x14
    match i {
      0L => @bool.truth()
      1L => @cart.has_size_1()
      _ => @cart.has_size_dimindex_rule(@basics.mk_finty(@num.num_of_int64(i)))
    }
  }))
}

///|
let has_size_array_c : @lib.Cell[FixedArray[@kernel.Thm]] = @lib.Cell::new("has_size_array")

///|
/// `M_taylor.has_size_array`
pub fn has_size_array() -> FixedArray[@kernel.Thm] {
  has_size_array_c.get()
}

///|
/// dimindex_array
fn step_8() -> Unit raise {
  dimindex_array_c.set(@lib.array_init(@lib.add63(max_dim(), 1L), fn(x15 : Int64) -> @kernel.Thm raise {
    let i = x15
    if (i < 1L) {
      @bool.truth()
    } else {
      let t16 = @lib.array_get(has_size_array(), @lib.int63_to_int(i))
      @drule.match_mp(@cart.dimindex_unique())(t16)
    }
  }))
}

///|
let dimindex_array_c : @lib.Cell[FixedArray[@kernel.Thm]] = @lib.Cell::new("dimindex_array")

///|
/// `M_taylor.dimindex_array`
pub fn dimindex_array() -> FixedArray[@kernel.Thm] {
  dimindex_array_c.get()
}

///|
/// n_type_array
fn step_9() -> Unit raise {
  n_type_array_c.set(@lib.array_init(@lib.add63(max_dim(), 1L), fn(x17 : Int64) -> @kernel.HolType raise {
    let i = x17
    if (i < 1L) {
      @kernel.bool_ty
    } else {
      let dimindex_th = @lib.array_get(dimindex_array(), @lib.int63_to_int(i))
      (fn(x25 : @kernel.Term) -> @kernel.HolType raise {
        (fn(x24 : @kernel.Term) -> @kernel.HolType raise {
          (fn(x23 : @kernel.Term) -> @kernel.HolType raise {
            (fn(x22 : (String, @kernel.HolType)) -> @kernel.HolType raise {
              (fn(x20 : @kernel.HolType) -> @kernel.HolType raise {
                (fn(x19 : (String, @list.List[@kernel.HolType])) -> @kernel.HolType raise {
                  @lib.hd((fn(x18 : (String, @list.List[@kernel.HolType])) -> @list.List[@kernel.HolType] raise {
                    x18.1
                  })(x19))
                })(@kernel.dest_type(x20))
              })((fn(x21 : (String, @kernel.HolType)) -> @kernel.HolType raise {
                x21.1
              })(x22))
            })(@kernel.dest_const(x23))
          })(@kernel.rand(x24))
        })(@equal.lhand(x25))
      })((fn(x26 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x26)
      })(dimindex_th))
    }
  }))
}

///|
let n_type_array_c : @lib.Cell[FixedArray[@kernel.HolType]] = @lib.Cell::new("n_type_array")

///|
/// `M_taylor.n_type_array`
pub fn n_type_array() -> FixedArray[@kernel.HolType] {
  n_type_array_c.get()
}

///|
/// n_vector_type_array
fn step_10() -> Unit raise {
  n_vector_type_array_c.set(@lib.array_init(@lib.add63(max_dim(), 1L), fn(x27 : Int64) -> @kernel.HolType raise {
    let i = x27
    if (i < 1L) {
      @kernel.bool_ty
    } else {
      @kernel.mk_type("cart", @list.List([@misc_vars.real_ty(), @lib.array_get(n_type_array(), @lib.int63_to_int(i))]))
    }
  }))
}

///|
let n_vector_type_array_c : @lib.Cell[FixedArray[@kernel.HolType]] = @lib.Cell::new("n_vector_type_array")

///|
/// `M_taylor.n_vector_type_array`
pub fn n_vector_type_array() -> FixedArray[@kernel.HolType] {
  n_vector_type_array_c.get()
}

///|
/// x_var_names
fn step_11() -> Unit raise {
  x_var_names_c.set(@lib.array_init(@lib.add63(max_dim(), 1L), fn(x28 : Int64) -> String raise {
    let i = x28
    ("x" + Int64::to_string(i))
  }))
}

///|
let x_var_names_c : @lib.Cell[FixedArray[String]] = @lib.Cell::new("x_var_names")

///|
/// `M_taylor.x_var_names`
pub fn x_var_names() -> FixedArray[String] {
  x_var_names_c.get()
}

///|
/// y_var_names
fn step_12() -> Unit raise {
  y_var_names_c.set(@lib.array_init(@lib.add63(max_dim(), 1L), fn(x29 : Int64) -> String raise {
    let i_1 = x29
    ("y" + Int64::to_string(i_1))
  }))
}

///|
let y_var_names_c : @lib.Cell[FixedArray[String]] = @lib.Cell::new("y_var_names")

///|
/// `M_taylor.y_var_names`
pub fn y_var_names() -> FixedArray[String] {
  y_var_names_c.get()
}

///|
/// z_var_names
fn step_13() -> Unit raise {
  z_var_names_c.set(@lib.array_init(@lib.add63(max_dim(), 1L), fn(x30 : Int64) -> String raise {
    let i_2 = x30
    ("z" + Int64::to_string(i_2))
  }))
}

///|
let z_var_names_c : @lib.Cell[FixedArray[String]] = @lib.Cell::new("z_var_names")

///|
/// `M_taylor.z_var_names`
pub fn z_var_names() -> FixedArray[String] {
  z_var_names_c.get()
}

///|
/// w_var_names
fn step_14() -> Unit raise {
  w_var_names_c.set(@lib.array_init(@lib.add63(max_dim(), 1L), fn(x31 : Int64) -> String raise {
    let i_3 = x31
    ("w" + Int64::to_string(i_3))
  }))
}

///|
let w_var_names_c : @lib.Cell[FixedArray[String]] = @lib.Cell::new("w_var_names")

///|
/// `M_taylor.w_var_names`
pub fn w_var_names() -> FixedArray[String] {
  w_var_names_c.get()
}

///|
/// x_vars_array
fn step_15() -> Unit raise {
  x_vars_array_c.set(@lib.array_init(@lib.add63(max_dim(), 1L), fn(x32 : Int64) -> @kernel.Term raise {
    let i = x32
    @kernel.mk_var(@lib.array_get(x_var_names(), @lib.int63_to_int(i)), @misc_vars.real_ty())
  }))
}

///|
let x_vars_array_c : @lib.Cell[FixedArray[@kernel.Term]] = @lib.Cell::new("x_vars_array")

///|
/// `M_taylor.x_vars_array`
pub fn x_vars_array() -> FixedArray[@kernel.Term] {
  x_vars_array_c.get()
}

///|
/// y_vars_array
fn step_16() -> Unit raise {
  y_vars_array_c.set(@lib.array_init(@lib.add63(max_dim(), 1L), fn(x33 : Int64) -> @kernel.Term raise {
    let i_1 = x33
    @kernel.mk_var(@lib.array_get(y_var_names(), @lib.int63_to_int(i_1)), @misc_vars.real_ty())
  }))
}

///|
let y_vars_array_c : @lib.Cell[FixedArray[@kernel.Term]] = @lib.Cell::new("y_vars_array")

///|
/// `M_taylor.y_vars_array`
pub fn y_vars_array() -> FixedArray[@kernel.Term] {
  y_vars_array_c.get()
}

///|
/// z_vars_array
fn step_17() -> Unit raise {
  z_vars_array_c.set(@lib.array_init(@lib.add63(max_dim(), 1L), fn(x34 : Int64) -> @kernel.Term raise {
    let i_2 = x34
    @kernel.mk_var(@lib.array_get(z_var_names(), @lib.int63_to_int(i_2)), @misc_vars.real_ty())
  }))
}

///|
let z_vars_array_c : @lib.Cell[FixedArray[@kernel.Term]] = @lib.Cell::new("z_vars_array")

///|
/// `M_taylor.z_vars_array`
pub fn z_vars_array() -> FixedArray[@kernel.Term] {
  z_vars_array_c.get()
}

///|
/// w_vars_array
fn step_18() -> Unit raise {
  w_vars_array_c.set(@lib.array_init(@lib.add63(max_dim(), 1L), fn(x35 : Int64) -> @kernel.Term raise {
    let i_3 = x35
    @kernel.mk_var(@lib.array_get(w_var_names(), @lib.int63_to_int(i_3)), @misc_vars.real_ty())
  }))
}

///|
let w_vars_array_c : @lib.Cell[FixedArray[@kernel.Term]] = @lib.Cell::new("w_vars_array")

///|
/// `M_taylor.w_vars_array`
pub fn w_vars_array() -> FixedArray[@kernel.Term] {
  w_vars_array_c.get()
}

///|
/// df_vars_array
fn step_19() -> Unit raise {
  df_vars_array_c.set(@lib.array_init(@lib.add63(max_dim(), 1L), fn(x36 : Int64) -> @kernel.Term raise {
    let i = x36
    @kernel.mk_var(("df" + Int64::to_string(i)), @misc_vars.real_pair_ty())
  }))
}

///|
let df_vars_array_c : @lib.Cell[FixedArray[@kernel.Term]] = @lib.Cell::new("df_vars_array")

///|
/// `M_taylor.df_vars_array`
pub fn df_vars_array() -> FixedArray[@kernel.Term] {
  df_vars_array_c.get()
}

///|
/// dd_vars_array
fn step_20() -> Unit raise {
  dd_vars_array_c.set(@lib.array_init(@lib.add63(max_dim(), 1L), fn(x37 : Int64) -> FixedArray[@kernel.Term] raise {
    let i = x37
    @lib.array_init(@lib.add63(max_dim(), 1L), fn(x38 : Int64) -> @kernel.Term raise {
      let j = x38
      let t39 = Int64::to_string(j)
      @kernel.mk_var(("dd" + (Int64::to_string(i) + t39)), @misc_vars.real_pair_ty())
    })
  }))
}

///|
let dd_vars_array_c : @lib.Cell[FixedArray[FixedArray[@kernel.Term]]] = @lib.Cell::new("dd_vars_array")

///|
/// `M_taylor.dd_vars_array`
pub fn dd_vars_array() -> FixedArray[FixedArray[@kernel.Term]] {
  dd_vars_array_c.get()
}

///|
/// dest_vector
fn step_21() -> Unit raise {
  dest_vector_c.set(fn(x40 : @kernel.Term) -> @list.List[@kernel.Term] raise {
    @basics.dest_list(@kernel.rand(x40))
  })
}

///|
let dest_vector_c : @lib.Cell[(@kernel.Term) -> @list.List[@kernel.Term] raise] = @lib.Cell::new("dest_vector")

///|
/// `dest_vector`
pub fn dest_vector(x : @kernel.Term) -> @list.List[@kernel.Term] raise {
  (dest_vector_c.get())(x)
}

///|
/// `mk_vector`
pub fn mk_vector(x41 : @kernel.Term) -> @kernel.Term raise {
  let list_tm = x41
  let n = (fn(x42 : @list.List[@kernel.Term]) -> Int64 raise {
    Int::to_int64(@lib.length(x42))
  })(@basics.dest_list(list_tm))
  let ty = (fn(x45 : @kernel.HolType) -> @kernel.HolType raise {
    (fn(x44 : (String, @list.List[@kernel.HolType])) -> @kernel.HolType raise {
      @lib.hd((fn(x43 : (String, @list.List[@kernel.HolType])) -> @list.List[@kernel.HolType] raise {
        x43.1
      })(x44))
    })(@kernel.dest_type(x45))
  })((fn(x46 : @kernel.Term) -> @kernel.HolType raise {
    @kernel.type_of(x46)
  })(list_tm))
  let vec = @kernel.mk_const("vector", @list.List([(ty, @kernel.aty), (@lib.array_get(n_type_array(), @lib.int63_to_int(n)), @misc_vars.nty())]))
  @kernel.mk_comb(vec, list_tm)
}

///|
/// `mk_vector_list`
pub fn mk_vector_list(x47 : @list.List[@kernel.Term]) -> @kernel.Term raise {
  let list = x47
  mk_vector(@lists.mk_list(list, @kernel.type_of(@lib.hd(list))))
}

///|
/// el_thms_array
fn step_22() -> Unit raise {
  let el_tm = @term_syntax.parse_term("(EL : (Num, List[A]) -> A)")
  let gen0 : (Int64) -> FixedArray[@kernel.Thm] raise = fn(x48 : Int64) -> FixedArray[@kernel.Thm] raise {
    let n = x48
    let e_list = @lists.mk_list(@lib.map(fn(x49 : Int64) -> @kernel.Term raise {
      let i = x49
      @kernel.mk_var(("e" + Int64::to_string(i)), @kernel.aty)
    }, @lib.range(1L, n)), @kernel.aty)
    let t50 = @basics.mk_binop(el_tm, @term_syntax.parse_term("0"), e_list)
    let el0_th = @simp.rewrite_conv(@list.List([@lists.el(), @lists.hd()]))(t50)
    @lib.array_make(n, el0_th)
  }
  let array = @lib.array_init(@lib.add63(max_dim(), 1L), gen0)
  let gen_i : (Int64) -> ((Int64) -> Unit raise) raise = fn(x51 : Int64) -> ((Int64) -> Unit raise) raise {
    let n_1 = x51
    fn(x52 : Int64) -> Unit raise {
      let i_1 = x52
      let t55 = @lib.array_get(@lib.array_get(array, @lib.int63_to_int(n_1)), @lib.int63_to_int(i_1))
      let e_list_1 = (fn(x53 : @kernel.Term) -> @kernel.Term raise {
        @kernel.rand(@equal.lhand(x53))
      })((fn(x54 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x54)
      })(t55))
      let t56 = @lib.sub63(i_1, 1L)
      let prev_thm = @lib.array_get(@lib.array_get(array, @lib.int63_to_int(@lib.sub63(n_1, 1L))), @lib.int63_to_int(t56))
      let i_tm = @nums.mk_small_numeral(i_1)
      let prev_i = @calc_num.num_conv(i_tm)
      let t57 = @basics.mk_binop(el_tm, i_tm, e_list_1)
      let el_th = @simp.rewrite_conv(@list.List([prev_i, @lists.el(), @lists.hd(), @lists.tl(), prev_thm]))(t57)
      @lib.array_set(@lib.array_get(array, @lib.int63_to_int(n_1)), @lib.int63_to_int(i_1), el_th)
    }
  }
  let _ = @lib.map(fn(x58 : Int64) -> @list.List[Unit] raise {
    let n_2 = x58
    @lib.map(fn(x59 : Int64) -> Unit raise {
      let i_2 = x59
      gen_i(n_2)(i_2)
    }, @lib.range(1L, @lib.sub63(n_2, 1L)))
  }, @lib.range(2L, max_dim()))
  el_thms_array_c.set(array)
}

///|
let el_thms_array_c : @lib.Cell[FixedArray[FixedArray[@kernel.Thm]]] = @lib.Cell::new("el_thms_array")

///|
/// `M_taylor.el_thms_array`
pub fn el_thms_array() -> FixedArray[FixedArray[@kernel.Thm]] {
  el_thms_array_c.get()
}

///|
/// VECTOR_COMPONENT
fn step_23() -> Unit raise {
  let t63 = @simp.asm_rewrite_tac(@list.List([]))
  let t62 = @tactics.match_mp_tac(@cart.lambda_beta())
  let t61 = @simp.rewrite_tac(@list.List([@cart.vector()]))
  let t60 = @tactics.repeat_tac(@tactics.gen_tac)
  let t64 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.in_numseg()])), t60), @tactics.disch_tac), t61), t62), t63)
  vector_component_c.set(@tactics.prove(@term_syntax.parse_term("∀ l : List[A], ∀ i : Num, IN(i, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) → (op_dollar : (Cart[A, N], Num) -> A)((vector : (List[A]) -> Cart[A, N])(l), i) == EL(i - 1, l)"), t64))
}

///|
let vector_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_COMPONENT")

///|
/// `M_taylor.VECTOR_COMPONENT`
pub fn vector_component() -> @kernel.Thm {
  vector_component_c.get()
}

///|
/// `gen_comp_thm`
pub fn gen_comp_thm(x65 : Int64, x66 : Int64) -> @kernel.Thm raise {
  let n = x65
  let i = x66
  let i_tm = @nums.mk_small_numeral(i)
  let x_list = @lists.mk_list(@lib.map(fn(x67 : Int64) -> @kernel.Term raise {
    let i_1 = x67
    @kernel.mk_var(("x" + Int64::to_string(i_1)), @kernel.aty)
  }, @lib.range(1L, n)), @kernel.aty)
  let t69 = @lib.array_get(n_type_array(), @lib.int63_to_int(n))
  let th0 = ((x68 : @kernel.Thm) => @bool.ispecl(@list.List([x_list, i_tm]), x68))(((x70 : @kernel.Thm) => inst_first_type_var(t69, x70))(vector_component()))
  let t72 = @simp.rewrite_rule(@list.List([@iterate.in_numseg(), @lib.array_get(dimindex_array(), @lib.int63_to_int(n))]))
  let th1 = ((x71 : @kernel.Thm) => @equal.conv_rule(@calc_num.num_reduce_conv, x71))(t72(th0))
  let t73 = @lib.sub63(i, 1L)
  @simp.rewrite_rule(@list.List([@lib.array_get(@lib.array_get(el_thms_array(), @lib.int63_to_int(n)), @lib.int63_to_int(t73))]))(th1)
}

///|
/// comp_thms_array
fn step_24() -> Unit raise {
  comp_thms_array_c.set(@lib.array_init(@lib.add63(max_dim(), 1L), fn(x74 : Int64) -> FixedArray[@kernel.Thm] raise {
    let n = x74
    @lib.array_init(@lib.add63(n, 1L), fn(x75 : Int64) -> @kernel.Thm raise {
      let i = x75
      if ((i < 1L) || (n < 1L)) {
        @bool.truth()
      } else {
        gen_comp_thm(n, i)
      }
    })
  }))
}

///|
let comp_thms_array_c : @lib.Cell[FixedArray[FixedArray[@kernel.Thm]]] = @lib.Cell::new("comp_thms_array")

///|
/// `M_taylor.comp_thms_array`
pub fn comp_thms_array() -> FixedArray[FixedArray[@kernel.Thm]] {
  comp_thms_array_c.get()
}

///|
/// ALL2_ALL_ZIP
fn step_25() -> Unit raise {
  let t89 = @simp.asm_rewrite_tac(@list.List([]))
  let t88 = @tactics.first_x_assum(fn(x86 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x87 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x84 : @kernel.Thm, x85 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x84, x85))(x86, x87)
    }
  })
  let t83 = @simp.rewrite_tac(@list.List([@lists.all2(), @lists.zip(), @lists.all()]))
  let t82 = @simp.rewrite_tac(@list.List([@ssrnat.eqss()]))
  let t81 = @simp.rewrite_tac(@list.List([@lists.length()]))
  let t79 = @simp.rewrite_tac(@list.List([@lists.zip(), @lists.all2(), @lists.all()]))
  let t78 = @tactics.disch_then(fn(x76 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x76
    @simp.rewrite_tac(@list.List([th]))
  })
  let t80 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@lists.length(), @theorems.eq_sym_eq(), @lists.length_eq_nil()]))), t78), t79), @tactics.all_tac])
  let t90 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.gen_tac, @lists.list_induct_tac), t80), @lists.list_induct_tac), t81), @list.List([@int.arith_tac, @tactics.all_tac])), t82), @tactics.disch_tac), t83), t88), t89)
  all2_all_zip_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (A, B) -> Bool, ∀ l1 : List[A], ∀ l2 : List[B], LENGTH(l1) == LENGTH(l2) → ALL2(P, l1, l2) == ALL((p : (A, B)) => P(FST(p), SND(p)), ZIP(l1, l2))"), t90))
}

///|
let all2_all_zip_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALL2_ALL_ZIP")

///|
/// `M_taylor.ALL2_ALL_ZIP`
pub fn all2_all_zip() -> @kernel.Thm {
  all2_all_zip_c.get()
}

///|
/// EL_ZIP
fn step_26() -> Unit raise {
  let t96 = @simp.asm_rewrite_tac(@list.List([]))
  let t95 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t94 = @simp.rewrite_tac(@list.List([@ssrnat.eqss(), @int.arith_rule(@term_syntax.parse_term("(SUC((n : Num)) < SUC((x : Num))) == (n < x)"))]))
  let t93 = @simp.rewrite_tac(@list.List([@lists.el(), @lists.hd(), @lists.tl()]))
  let t92 = @tactics.try_tac(@int.arith_tac)
  let t91 = @simp.rewrite_tac(@list.List([@lists.zip(), @lists.length()]))
  let t97 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@lists.list_induct_tac, @lists.list_induct_tac), t91), t92), @ssreflect.case), t93), @tactics.gen_tac), t94), @tactics.strip_tac), t95), t96)
  el_zip_c.set(@tactics.prove(@term_syntax.parse_term("∀ l1 : List[A], ∀ l2 : List[B], ∀ i : Num, LENGTH(l1) == LENGTH(l2) && i < LENGTH(l1) → EL(i, ZIP(l1, l2)) == (EL(i, l1), EL(i, l2))"), t97))
}

///|
let el_zip_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EL_ZIP")

///|
/// `M_taylor.EL_ZIP`
pub fn el_zip() -> @kernel.Thm {
  el_zip_c.get()
}

///|
/// LENGTH_ZIP
fn step_27() -> Unit raise {
  let t102 = @simp.asm_rewrite_tac(@list.List([]))
  let t101 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t100 = @simp.rewrite_tac(@list.List([@ssrnat.eqss()]))
  let t99 = @tactics.try_tac(@int.arith_tac)
  let t98 = @simp.rewrite_tac(@list.List([@lists.zip(), @lists.length()]))
  let t103 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@lists.list_induct_tac, @lists.list_induct_tac), t98), t99), t100), @tactics.disch_tac), t101), t102)
  length_zip_c.set(@tactics.prove(@term_syntax.parse_term("∀ l1 : List[_], ∀ l2 : List[_], LENGTH(l1) == LENGTH(l2) → LENGTH(ZIP(l1, l2)) == LENGTH(l1)"), t103))
}

///|
let length_zip_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LENGTH_ZIP")

///|
/// `M_taylor.LENGTH_ZIP`
pub fn length_zip() -> @kernel.Thm {
  length_zip_c.get()
}

///|
/// test_domain_xi
fn step_28() -> Unit raise {
  test_domain_xi_c.set(@pair.new_definition(@term_syntax.parse_term("(test_domain_xi : ((Real, Real), (Real, Real)) -> Bool)((xz : (Real, Real)), (yw : (Real, Real))) == (FST(xz) <= FST(yw) && FST(yw) <= SND(xz) && FST(yw) - FST(xz) <= SND(yw) && SND(xz) - FST(yw) <= SND(yw))")))
}

///|
let test_domain_xi_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("test_domain_xi")

///|
/// `M_taylor.test_domain_xi`
pub fn test_domain_xi() -> @kernel.Thm {
  test_domain_xi_c.get()
}

///|
/// MK_CELL_DOMAIN
fn step_29() -> Unit raise {
  let t153 = @simp.asm_rewrite_tac(@list.List([]))
  let t152 = @tactics.repeat_tac((x151 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), el_zip(), x151))
  let t150 = @simp.expand_tac("yw")
  let t149 = @simp.expand_tac("xz")
  let t148 = @simp.asm_rewrite_tac(@list.List([]))
  let t146 = @simp.asm_rewrite_tac(@list.List([]))
  let t144 = @simp.rewrite_tac(@list.List([test_domain_xi()]))
  let t140 = @term_syntax.parse_term("(j : Num)")
  let t143 = @tactics.first_x_assum(fn(x142 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x137 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s138 = @tactics.mp_tac(x137)
      fn(x139 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s138(x139)
      }
    })(((x141 : @kernel.Thm) => @bool.spec(t140, x141))(x142))
  })
  let t135 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t134 = @tactics.pop_assum(fn(x131 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s132 = @tactics.mp_tac(x131)
    fn(x133 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s132(x133)
    }
  })
  let t136 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.pop_assum(fn(x128 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s129 = @tactics.mp_tac(x128)
    fn(x130 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s129(x130)
    }
  }), t134), t135), @int.arith_tac), @tactics.all_tac])
  let t127 = @tactics.subgoal_then(@term_syntax.parse_term("(j : Num) < (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))"), fn(x124 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s125 = @tactics.assume_tac(x124)
    fn(x126 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s125(x126)
    }
  })
  let t123 = @simp.abbrev_tac(@term_syntax.parse_term("(j : Num) == (i : Num) - 1"))
  let t122 = @simp.asm_rewrite_tac(@list.List([]))
  let t121 = @tactics.repeat_tac((x120 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), vector_component(), x120))
  let t119 = @simp.rewrite_tac(@list.List([@multivariate_taylor_compiled.m_cell_domain()]))
  let t118 = @simp.asm_rewrite_tac(@list.List([@multivariate_taylor_compiled.m_cell_domain(), @equal.gsym(@lists.all_el())]))
  let t115 = @simp.asm_rewrite_tac(@list.List([]))
  let t114 = @tactics.repeat_tac((x113 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), length_zip(), x113))
  let t112 = @simp.expand_tac("xz")
  let t116 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("yw"), t112), t114), t115), @tactics.all_tac])
  let t111 = @tactics.subgoal_then(@term_syntax.parse_term("LENGTH((xz : List[(Real, Real)])) == (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && LENGTH((yw : List[(Real, Real)])) == (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))"), fn(x108 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s109 = @tactics.assume_tac(x108)
    fn(x110 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s109(x110)
    }
  })
  let t107 = @tactics.pop_assum(fn(x104 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s105 = @tactics.mp_tac(x104)
    fn(x106 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s105(x106)
    }
  })
  let t154 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t107), t111), t116), (x117 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.rewrite(@list.List([]), @list.List([]), all2_all_zip(), x117)), t118), @tactics.disch_tac), t119), @tactics.gen_tac), @tactics.disch_tac), t121), t122), t123), t127), t136), t143), t144), (x145 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.rewrite(@list.List([]), @list.List([]), length_zip(), x145)), t146), (x147 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.rewrite(@list.List([]), @list.List([]), el_zip(), x147)), t148), t149), t150), t152), t153), @int.arith_tac)
  mk_cell_domain_c.set(@tactics.prove(@term_syntax.parse_term("∀ xz : List[(Real, Real)], ∀ yw : List[(Real, Real)], ∀ x : List[Real], ∀ z : List[Real], ∀ y : List[Real], ∀ w : List[Real], LENGTH(x) == (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && LENGTH(z) == (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && LENGTH(y) == (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && LENGTH(w) == (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && ZIP(y, w) == yw && ZIP(x, z) == xz && ALL2(test_domain_xi, xz, yw) → (m_cell_domain : ((Cart[Real, N], Cart[Real, N]), Cart[Real, N], Cart[Real, N]) -> Bool)(((vector : (List[Real]) -> Cart[Real, N])(x), (vector : (List[Real]) -> Cart[Real, N])(z)), (vector : (List[Real]) -> Cart[Real, N])(y), (vector : (List[Real]) -> Cart[Real, N])(w))"), t154))
}

///|
let mk_cell_domain_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MK_CELL_DOMAIN")

///|
/// `M_taylor.MK_CELL_DOMAIN`
pub fn mk_cell_domain() -> @kernel.Thm {
  mk_cell_domain_c.get()
}

///|
/// mk_m_domain_array
fn step_30() -> Unit raise {
  let mk_m_domain : (Int64) -> @kernel.Thm raise = fn(x155 : Int64) -> @kernel.Thm raise {
    let n = x155
    let dimindex_th = @lib.array_get(dimindex_array(), @lib.int63_to_int(n))
    let n_ty = (fn(x163 : @kernel.Term) -> @kernel.HolType raise {
      (fn(x162 : @kernel.Term) -> @kernel.HolType raise {
        (fn(x161 : @kernel.Term) -> @kernel.HolType raise {
          (fn(x160 : (String, @kernel.HolType)) -> @kernel.HolType raise {
            (fn(x158 : @kernel.HolType) -> @kernel.HolType raise {
              (fn(x157 : (String, @list.List[@kernel.HolType])) -> @kernel.HolType raise {
                @lib.hd((fn(x156 : (String, @list.List[@kernel.HolType])) -> @list.List[@kernel.HolType] raise {
                  x156.1
                })(x157))
              })(@kernel.dest_type(x158))
            })((fn(x159 : (String, @kernel.HolType)) -> @kernel.HolType raise {
              x159.1
            })(x160))
          })(@kernel.dest_const(x161))
        })(@kernel.rand(x162))
      })(@equal.lhand(x163))
    })((fn(x164 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x164)
    })(dimindex_th))
    let nty = @term_syntax.parse_type("N")
    let t169 = @simp.rewrite_rule(@list.List([dimindex_th]))
    let t165 = @simp.rewrite_rule(@list.List([@more_float.float0_eq()]))
    (fn(x170 : @kernel.Thm) -> @kernel.Thm raise {
      (fn(x168 : @kernel.Thm) -> @kernel.Thm raise {
        (fn(x167 : @kernel.Thm) -> @kernel.Thm raise {
          (fn(x166 : @kernel.Thm) -> @kernel.Thm raise {
            @bool.undisch_all(t165(x166))
          })(@bool.disch_all(x167))
        })(@more_float.rule(x168))
      })(t169(x170))
    })((fn(x172 : @kernel.Thm) -> @kernel.Thm raise {
      ((x171 : @kernel.Thm) => @kernel.inst_type(@list.List([(n_ty, nty)]), x171))(x172)
    })(mk_cell_domain()))
  }
  mk_m_domain_array_c.set(@lib.array_init(@lib.add63(max_dim(), 1L), fn(x173 : Int64) -> @kernel.Thm raise {
    let i = x173
    if (i < 1L) {
      @bool.truth()
    } else {
      mk_m_domain(i)
    }
  }))
}

///|
let mk_m_domain_array_c : @lib.Cell[FixedArray[@kernel.Thm]] = @lib.Cell::new("mk_m_domain_array")

///|
/// `M_taylor.mk_m_domain_array`
pub fn mk_m_domain_array() -> FixedArray[@kernel.Thm] {
  mk_m_domain_array_c.get()
}

///|
/// TEST_DOMAIN_XI'
fn step_31() -> Unit raise {
  let t176 = @tactics.then_tac(@simp.simp_tac(@list.List([test_domain_xi()])), @calc_rat.real_arith_tac)
  let t177 = (@term_syntax.parse_term("(xz : (Real, Real)) == ((x : Real), (z : Real)) && (yw : (Real, Real)) == ((y : Real), (w : Real)) && x <= y && y <= z && y - x <= (w1 : Real) && z - y <= (w2 : Real) && w1 <= w && w2 <= w → test_domain_xi(xz, yw)"), t176)
  test_domain_xi_p_c.set((fn(x174 : @kernel.Thm) -> @kernel.Thm raise {
    @bool.eqt_intro(@more_float.rule(x174))
  })((fn(x175 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x175.0, x175.1)
  })(t177)))
}

///|
let test_domain_xi_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TEST_DOMAIN_XI'")

///|
/// `M_taylor.TEST_DOMAIN_XI'`
pub fn test_domain_xi_p() -> @kernel.Thm {
  test_domain_xi_p_c.get()
}

///|
/// `eval_test_domain_xi`
pub fn eval_test_domain_xi(x178 : Int64, x179 : @kernel.Term) -> @kernel.Thm raise {
  let pp = x178
  let test_domain_tm = x179
  let (ltm, yw) = @kernel.dest_comb(test_domain_tm)
  let xz = @kernel.rand(ltm)
  let (x, z) = @pair.dest_pair(xz)
  let (y, w) = @pair.dest_pair(yw)
  let op_lt_eq : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise = fn(x180 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let t1 = x180
    fn(x181 : @kernel.Term) -> @kernel.Thm raise {
      let t2 = x181
      @bool.eqt_elim(@arith_float.float_le_v1(t1)(t2))
    }
  }
  let op_minus : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise = @arith_float.float_sub_hi_v1(pp)
  let x_le_y = op_lt_eq(x)(y)
  let y_le_z = op_lt_eq(y)(z)
  let yx_le_w1 = op_minus(y)(x)
  let zy_le_w2 = op_minus(z)(y)
  let w1 = @kernel.rand((fn(x182 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x182)
  })(yx_le_w1))
  let w2 = @kernel.rand((fn(x183 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x183)
  })(zy_le_w2))
  let w1_le_w = op_lt_eq(w1)(w)
  let w2_le_w = op_lt_eq(w2)(w)
  let t186 = @kernel.refl(yw)
  let t184 = @kernel.refl(xz)
  (fn(x200 : @kernel.Thm) -> @kernel.Thm raise {
    (fn(x198 : @kernel.Thm) -> @kernel.Thm raise {
      (fn(x196 : @kernel.Thm) -> @kernel.Thm raise {
        (fn(x194 : @kernel.Thm) -> @kernel.Thm raise {
          (fn(x192 : @kernel.Thm) -> @kernel.Thm raise {
            (fn(x190 : @kernel.Thm) -> @kernel.Thm raise {
              (fn(x188 : @kernel.Thm) -> @kernel.Thm raise {
                ((x185 : @kernel.Thm) => @misc_functions.my_prove_hyp(t184, x185))(((x187 : @kernel.Thm) => @misc_functions.my_prove_hyp(t186, x187))(x188))
              })(((x189 : @kernel.Thm) => @misc_functions.my_prove_hyp(x_le_y, x189))(x190))
            })(((x191 : @kernel.Thm) => @misc_functions.my_prove_hyp(y_le_z, x191))(x192))
          })(((x193 : @kernel.Thm) => @misc_functions.my_prove_hyp(yx_le_w1, x193))(x194))
        })(((x195 : @kernel.Thm) => @misc_functions.my_prove_hyp(zy_le_w2, x195))(x196))
      })(((x197 : @kernel.Thm) => @misc_functions.my_prove_hyp(w1_le_w, x197))(x198))
    })(((x199 : @kernel.Thm) => @misc_functions.my_prove_hyp(w2_le_w, x199))(x200))
  })(((x201 : @kernel.Thm) => @kernel.inst_rule(@list.List([(x, @misc_vars.x_var_real()), (y, @misc_vars.y_var_real()), (z, @misc_vars.z_var_real()), (w, @misc_vars.w_var_real()), (w1, @misc_vars.w1_var_real()), (w2, @misc_vars.w2_var_real()), (xz, @misc_vars.xz_pair_var()), (yw, @misc_vars.yw_pair_var())]), x201))(test_domain_xi_p()))
}

///|
/// `mk_m_center_domain`
pub fn mk_m_center_domain(x202 : Int64, x203 : Int64, x204 : @kernel.Term, x205 : @kernel.Term) -> @kernel.Thm raise {
  let n = x202
  let pp = x203
  let x_list_tm = x204
  let z_list_tm = x205
  let x_list = @basics.dest_list(x_list_tm)
  let z_list = @basics.dest_list(z_list_tm)
  let op_star : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise = fn(x206 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise {
    let t1 = x206
    fn(x207 : @kernel.Term) -> @kernel.Term raise {
      let t2 = x207
      let t209 = @arith_float.float_mul_eq_v1(t1)(t2)
      @kernel.rand((fn(x208 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x208)
      })(t209))
    }
  }
  let op_plus : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise = fn(x210 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise {
    let t1_1 = x210
    fn(x211 : @kernel.Term) -> @kernel.Term raise {
      let t2_1 = x211
      let t213 = @arith_float.float_add_hi_v1(pp)(t1_1)(t2_1)
      @kernel.rand((fn(x212 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x212)
      })(t213))
    }
  }
  let y_list = @lib.map2(fn(x214 : @kernel.Term, x215 : @kernel.Term) -> @kernel.Term raise {
    let x = x214
    let y = x215
    if (x == y) {
      x
    } else {
      let t216 = op_plus(x)(y)
      op_star(@more_float.float_inv2())(t216)
    }
  }, x_list, z_list)
  let op_minus : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise = fn(x217 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise {
    let t1_2 = x217
    fn(x218 : @kernel.Term) -> @kernel.Term raise {
      let t2_2 = x218
      let t220 = @arith_float.float_sub_hi_v1(pp)(t1_2)(t2_2)
      @kernel.rand((fn(x219 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x219)
      })(t220))
    }
  }
  let max : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise = fn(x221 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise {
    let t1_3 = x221
    fn(x222 : @kernel.Term) -> @kernel.Term raise {
      let t2_3 = x222
      let t224 = @arith_float.float_max_v1(t1_3)(t2_3)
      @kernel.rand((fn(x223 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x223)
      })(t224))
    }
  }
  let w1 = @lib.map2(fn(x225 : @kernel.Term, x226 : @kernel.Term) -> @kernel.Term raise {
    let s227 = op_minus(x225)
    s227(x226)
  }, y_list, x_list)
  let w2 = @lib.map2(fn(x228 : @kernel.Term, x229 : @kernel.Term) -> @kernel.Term raise {
    let s230 = op_minus(x228)
    s230(x229)
  }, z_list, y_list)
  let w_list = @lib.map2(fn(x231 : @kernel.Term, x232 : @kernel.Term) -> @kernel.Term raise {
    let s233 = max(x231)
    s233(x232)
  }, w1, w2)
  let y_list_tm = @lists.mk_list(y_list, @misc_vars.real_ty())
  let w_list_tm = @lists.mk_list(w_list, @misc_vars.real_ty())
  let yw_zip_th = @list_conversions.eval_zip(y_list_tm, w_list_tm)
  let xz_zip_th = @list_conversions.eval_zip(x_list_tm, z_list_tm)
  let yw_list_tm = @kernel.rand((fn(x234 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x234)
  })(yw_zip_th))
  let xz_list_tm = @kernel.rand((fn(x235 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x235)
  })(xz_zip_th))
  let len_x_th = @list_conversions.eval_length(x_list_tm)
  let len_z_th = @list_conversions.eval_length(z_list_tm)
  let len_y_th = @list_conversions.eval_length(y_list_tm)
  let len_w_th = @list_conversions.eval_length(w_list_tm)
  let t248 = @lib.array_get(mk_m_domain_array(), @lib.int63_to_int(n))
  let th0 = (fn(x246 : @kernel.Thm) -> @kernel.Thm raise {
    (fn(x244 : @kernel.Thm) -> @kernel.Thm raise {
      (fn(x242 : @kernel.Thm) -> @kernel.Thm raise {
        (fn(x240 : @kernel.Thm) -> @kernel.Thm raise {
          (fn(x238 : @kernel.Thm) -> @kernel.Thm raise {
            ((x236 : @kernel.Thm) => @misc_functions.my_prove_hyp(len_x_th, x236))(((x237 : @kernel.Thm) => @misc_functions.my_prove_hyp(len_z_th, x237))(x238))
          })(((x239 : @kernel.Thm) => @misc_functions.my_prove_hyp(len_y_th, x239))(x240))
        })(((x241 : @kernel.Thm) => @misc_functions.my_prove_hyp(len_w_th, x241))(x242))
      })(((x243 : @kernel.Thm) => @misc_functions.my_prove_hyp(yw_zip_th, x243))(x244))
    })(((x245 : @kernel.Thm) => @misc_functions.my_prove_hyp(xz_zip_th, x245))(x246))
  })(((x247 : @kernel.Thm) => @kernel.inst_rule(@list.List([(x_list_tm, @misc_vars.x_var_real_list()), (z_list_tm, @misc_vars.z_var_real_list()), (y_list_tm, @misc_vars.y_var_real_list()), (w_list_tm, @misc_vars.w_var_real_list()), (yw_list_tm, @misc_vars.yw_var()), (xz_list_tm, @misc_vars.xz_var())]), x247))(t248))
  let all_th = (fn(x252 : @list.List[@kernel.Term]) -> @kernel.Thm raise {
    (fn(x251 : @kernel.Term) -> @kernel.Thm raise {
      @bool.eqt_elim(((x250 : @kernel.Term) => @list_conversions.all2_conv_univ((x249 : @kernel.Term) => eval_test_domain_xi(pp, x249), x250))(x251))
    })(@lib.hd(x252))
  })((fn(x253 : @kernel.Thm) -> @list.List[@kernel.Term] raise {
    @kernel.hyp(x253)
  })(th0))
  @misc_functions.my_prove_hyp(all_th, th0)
}

///|
/// MK_M_TAYLOR_INTERVAL'
fn step_32() -> Unit raise {
  let t254 = @drule.match_mp(@ssrbool.iffrl_v1())
  mk_m_taylor_interval_p_c.set((fn(x255 : @kernel.Thm) -> @kernel.Thm raise {
    @more_float.rule(t254(x255))
  })(@bool.spec_all(@multivariate_taylor_compiled.m_taylor_interval())))
}

///|
let mk_m_taylor_interval_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MK_M_TAYLOR_INTERVAL'")

///|
/// `M_taylor.MK_M_TAYLOR_INTERVAL'`
pub fn mk_m_taylor_interval_p() -> @kernel.Thm {
  mk_m_taylor_interval_p_c.get()
}

///|
/// `get_types_and_vars`
pub fn get_types_and_vars(x256 : Int64) -> ((@kernel.HolType, @kernel.HolType, @kernel.Term, @kernel.Term, @kernel.Term, @kernel.Term, @kernel.Term)) raise {
  let n = x256
  let ty = @lib.array_get(n_type_array(), @lib.int63_to_int(n))
  let xty = @lib.array_get(n_vector_type_array(), @lib.int63_to_int(n))
  let x_var = @kernel.mk_var("x", xty)
  let f_var = @kernel.mk_var("f", @basics.mk_fun_ty(xty, @misc_vars.real_ty()))
  let y_var = @kernel.mk_var("y", xty)
  let w_var = @kernel.mk_var("w", xty)
  let domain_var = @kernel.mk_var("domain", @kernel.mk_type("prod", @list.List([xty, xty])))
  (ty, xty, x_var, f_var, y_var, w_var, domain_var)
}

///|
/// `dest_m_cell_domain`
pub fn dest_m_cell_domain(x257 : @kernel.Term) -> ((@kernel.Term, @kernel.Term, @kernel.Term)) raise {
  let domain_tm = x257
  let (lhs, w_tm) = @kernel.dest_comb(domain_tm)
  let (lhs2, y_tm) = @kernel.dest_comb(lhs)
  (@kernel.rand(lhs2), y_tm, w_tm)
}

///|
/// get_dim
fn step_33() -> Unit raise {
  get_dim_c.set(fn(x265 : @kernel.Term) -> Int64 raise {
    (fn(x263 : @kernel.HolType) -> Int64 raise {
      (fn(x262 : (String, @list.List[@kernel.HolType])) -> Int64 raise {
        (fn(x260 : @list.List[@kernel.HolType]) -> Int64 raise {
          (fn(x259 : @list.List[@kernel.HolType]) -> Int64 raise {
            (fn(x258 : @kernel.HolType) -> Int64 raise {
              @num.int63_of_num(@basics.dest_finty(x258))
            })(@lib.hd(x259))
          })(@lib.tl(x260))
        })((fn(x261 : (String, @list.List[@kernel.HolType])) -> @list.List[@kernel.HolType] raise {
          x261.1
        })(x262))
      })(@kernel.dest_type(x263))
    })((fn(x264 : @kernel.Term) -> @kernel.HolType raise {
      @kernel.type_of(x264)
    })(x265))
  })
}

///|
let get_dim_c : @lib.Cell[(@kernel.Term) -> Int64 raise] = @lib.Cell::new("get_dim")

///|
/// `get_dim`
pub fn get_dim(x : @kernel.Term) -> Int64 raise {
  (get_dim_c.get())(x)
}

///|
/// partial_pow
fn step_34() -> Unit raise {
  let t276 = @simp.rewrite_tac(@list.List([@realanalysis.real_differentiable_id(), @taylor_interval_compiled.derivative_x_v3()]))
  let t273 = @simp.rewrite_tac(@list.List([@realanalysis.real_differentiable_id()]))
  let t274 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), (x272 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), @realanalysis.real_differentiable_pow_atreal(), x272)), t273), @tactics.all_tac])
  let t269 = @simp.rewrite_tac(@list.List([@trivia.o_thm()]))
  let t270 = @list.List([@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(@ssrfun.eq_ext())])), t269), @tactics.all_tac])
  let t268 = @tactics.subgoal_then(@term_syntax.parse_term("((x : Cart[Real, N]) => pow((f : (Cart[Real, N]) -> Real)(x), (n : Num))) == o((t : Real) => pow(t, n), f)"), fn(x266 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x266
    @simp.rewrite_tac(@list.List([th]))
  })
  let t277 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t268), t270), (x271 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), @multivariate_taylor_compiled.partial_uni_compose_v1(), x271)), t274), (x275 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), @taylor_interval_compiled.derivative_pow_v2(), x275)), t276), @calc_rat.real_arith_tac)
  partial_pow_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : Num, ∀ f : (Cart[Real, N]) -> Real, ∀ n : Num, ∀ y : Cart[Real, N], differentiable(o(lift, f), at(y)) → partial(i, (x : Cart[Real, N]) => pow(f(x), n), y) == real_of_num(n) * (pow(f(y), n - 1) * partial(i, f, y))"), t277))
}

///|
let partial_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("partial_pow")

///|
/// `M_taylor.partial_pow`
pub fn partial_pow() -> @kernel.Thm {
  partial_pow_c.get()
}

///|
/// nth_diff2_pow
fn step_35() -> Unit raise {
  let t293 = @simp.rewrite_tac(@list.List([@taylor_interval_compiled.derivative_x_v3(), @realarith.real_mul_rid()]))
  let t292 = @simp.rewrite_tac(@list.List([@realanalysis.real_differentiable_id()]))
  let t290 = @list.List([@tactics.then_tac((x289 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), @realanalysis.real_differentiable_pow_atreal(), x289), @simp.rewrite_tac(@list.List([@realanalysis.real_differentiable_id()]))), @tactics.all_tac])
  let t288 = @simp.rewrite_tac(@list.List([@realanalysis.real_differentiable_const()]))
  let t286 = @simp.rewrite_tac(@list.List([@metric.real_open_univ(), @sets.in_univ()]))
  let t285 = @tactics.exists_tac(@term_syntax.parse_term("(UNIV : (Real) -> Bool)"))
  let t284 = @tactics.exists_tac(@term_syntax.parse_term("(x : Real) => real_of_num((n : Num)) * pow(x, n - 1)"))
  let t283 = @tactics.match_mp_tac(@taylor_interval_compiled.differentiable_local_v1())
  let t282 = @simp.rewrite_tac(@list.List([@realanalysis.real_differentiable_id()]))
  let t280 = @simp.rewrite_tac(@list.List([@metric.real_open_univ(), @sets.in_univ()]))
  let t279 = @tactics.exists_tac(@term_syntax.parse_term("(UNIV : (Real) -> Bool)"))
  let t278 = @tactics.repeat_tac(@tactics.gen_tac)
  let t294 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@taylor_interval_compiled.nth_diff_strong2_eq_v1()])), t278), t279), t280), @tactics.gen_tac), (x281 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), @realanalysis.real_differentiable_pow_atreal(), x281)), t282), t283), t284), t285), t286), (x287 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), @realanalysis.real_differentiable_mul_atreal(), x287)), t288), t290), @tactics.gen_tac), (x291 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), @taylor_interval_compiled.derivative_pow_v2(), x291)), t292), t293)
  nth_diff2_pow_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ y : Real, nth_diff_strong(2, (x : Real) => pow(x, n), y)"), t294))
}

///|
let nth_diff2_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("nth_diff2_pow")

///|
/// `M_taylor.nth_diff2_pow`
pub fn nth_diff2_pow() -> @kernel.Thm {
  nth_diff2_pow_c.get()
}

///|
/// diff2c_pow
fn step_36() -> Unit raise {
  let t324 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_at_id()]))
  let t323 = @tactics.match_mp_tac(@realanalysis.real_continuous_pow())
  let t322 = @tactics.repeat_tac(@tactics.match_mp_tac(@realanalysis.real_continuous_lmul()))
  let t321 = @simp.asm_rewrite_tac(@list.List([]))
  let t319 = @simp.rewrite_tac(@list.List([@realanalysis.real_differentiable_id()]))
  let t318 = @tactics.match_mp_tac(@realanalysis.real_differentiable_pow_atreal())
  let t317 = @simp.rewrite_tac(@list.List([]))
  let t320 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))), @tactics.gen_tac), (x316 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), @taylor_interval_compiled.derivative_scale_v2(), x316)), t317), t318), t319), @tactics.all_tac])
  let t315 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, derivative((t : Real) => real_of_num(n) * pow(t, n - 1)) == ((t : Real) => real_of_num(n) * derivative((t : Real) => pow(t, n - 1), t))"), fn(x312 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s313 = @tactics.assume_tac(x312)
    fn(x314 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s313(x314)
    }
  })
  let t311 = @simp.asm_rewrite_tac(@list.List([]))
  let t309 = @simp.rewrite_tac(@list.List([@taylor_interval_compiled.derivative_x_v3(), @realarith.real_mul_rid()]))
  let t308 = @simp.rewrite_tac(@list.List([@realanalysis.real_differentiable_id()]))
  let t310 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))), @tactics.gen_tac), (x307 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), @taylor_interval_compiled.derivative_pow_v2(), x307)), t308), t309), @tactics.all_tac])
  let t306 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, derivative((t : Real) => pow(t, n)) == ((t : Real) => real_of_num(n) * pow(t, n - 1))"), fn(x303 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s304 = @tactics.assume_tac(x303)
    fn(x305 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s304(x305)
    }
  })
  let t302 = @simp.rewrite_tac(@list.List([@taylor_interval_compiled.nth_derivative2_v1()]))
  let t301 = @simp.asm_rewrite_tac(@list.List([nth_diff2_pow()]))
  let t298 = @simp.rewrite_tac(@list.List([@trivia.o_thm()]))
  let t299 = @list.List([@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(@ssrfun.eq_ext())])), t298), @tactics.all_tac])
  let t297 = @tactics.subgoal_then(@term_syntax.parse_term("((x : Cart[Real, N]) => pow((f : (Cart[Real, N]) -> Real)(x), (n : Num))) == o((t : Real) => pow(t, n), f)"), fn(x295 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x295
    @simp.rewrite_tac(@list.List([th]))
  })
  let t325 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t297), t299), (x300 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.apply_tac(@multivariate_taylor_compiled.diff2c_uni_compose_v3(), x300)), t301), t302), t306), t310), t311), t315), t320), t321), t322), t323), t324)
  diff2c_pow_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Real, ∀ n : Num, ∀ x : Cart[Real, N], diff2c(f, x) → diff2c((x : Cart[Real, N]) => pow(f(x), n), x)"), t325))
}

///|
let diff2c_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("diff2c_pow")

///|
/// `M_taylor.diff2c_pow`
pub fn diff2c_pow() -> @kernel.Thm {
  diff2c_pow_c.get()
}

///|
/// diff2c_domain_pow
fn step_37() -> Unit raise {
  let t327 = @simp.asm_simp_tac(@list.List([diff2c_pow()]))
  let t326 = @tactics.repeat_tac(@tactics.strip_tac)
  let t328 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@multivariate_taylor_compiled.diff2c_domain()])), t326), t327)
  diff2c_domain_pow_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, _]) -> Real, ∀ n : Num, ∀ domain : (Cart[Real, _], Cart[Real, _]), diff2c_domain(domain, f) → diff2c_domain(domain, (x : Cart[Real, _]) => pow(f(x), n))"), t328))
}

///|
let diff2c_domain_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("diff2c_domain_pow")

///|
/// `M_taylor.diff2c_domain_pow`
pub fn diff2c_domain_pow() -> @kernel.Thm {
  diff2c_domain_pow_c.get()
}

///|
/// diff2c_domain_tm
fn step_38() -> Unit raise {
  diff2c_domain_tm_c.set(@term_syntax.parse_term("diff2c_domain((domain : (Cart[Real, _], Cart[Real, _])))"))
}

///|
let diff2c_domain_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("diff2c_domain_tm")

///|
/// `M_taylor.diff2c_domain_tm`
pub fn diff2c_domain_tm() -> @kernel.Term {
  diff2c_domain_tm_c.get()
}

///|
/// `gen_diff2c_domain_poly`
pub fn gen_diff2c_domain_poly(x329 : @kernel.Term) -> @kernel.Thm raise {
  let poly_tm = x329
  let (x_var, expr) = @kernel.dest_abs(poly_tm)
  let n = get_dim(x_var)
  let diff2c_tm = @basics.mk_icomb(diff2c_domain_tm(), poly_tm)
  if @list.List::is_empty(@kernel.frees(expr)) {
    let t332 = @lib.array_get(n_type_array(), @lib.int63_to_int(n))
    (fn(x331 : @kernel.Thm) -> @kernel.Thm raise {
      @bool.spec_all(((x330 : @kernel.Thm) => @bool.ispec(expr, x330))(x331))
    })(((x333 : @kernel.Thm) => inst_first_type_var(t332, x333))(@multivariate_taylor_compiled.diff2c_domain_const_v1()))
  } else {
    let (lhs, r_tm) = @kernel.dest_comb(expr)
    if (lhs == @misc_vars.neg_op_real()) {
      let r_th = gen_diff2c_domain_poly(@kernel.mk_abs(x_var, r_tm))
      let t334 = @simp.rewrite_tac(@list.List([r_th]))
      @tactics.prove(diff2c_tm, @tactics.then_tac(@tactics.match_mp_tac(@multivariate_taylor_compiled.diff2c_domain_neg_v2()), t334))
    } else {
      let (op, l_tm) = @kernel.dest_comb(lhs)
      let name = (fn(x335 : (String, @kernel.HolType)) -> String raise {
        x335.0
      })(@kernel.dest_const(op))
      if (name == "$") {
        let dim_th = @lib.array_get(dimindex_array(), @lib.int63_to_int(n))
        let t336 = @simp.rewrite_tac(@list.List([@iterate.in_numseg(), dim_th]))
        @tactics.prove(diff2c_tm, @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@multivariate_taylor_compiled.diff2c_domain_x_v1()), t336), @int.arith_tac))
      } else {
        let l_th = gen_diff2c_domain_poly(@kernel.mk_abs(x_var, l_tm))
        if (name == "real_pow") {
          let t337 = @simp.rewrite_tac(@list.List([l_th]))
          @tactics.prove(diff2c_tm, @tactics.then_tac(@tactics.match_mp_tac(diff2c_domain_pow()), t337))
        } else {
          let r_th_1 = gen_diff2c_domain_poly(@kernel.mk_abs(x_var, r_tm))
          let t340 = @simp.rewrite_tac(@list.List([l_th, r_th_1]))
          @tactics.prove(diff2c_tm, @tactics.then_tac(@tactics.map_first(fn(x338 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            fn(x339 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              @ssreflect.apply_tac(x338, x339)
            }
          }, @list.List([@multivariate_taylor_compiled.diff2c_domain_add_v2(), @multivariate_taylor_compiled.diff2c_domain_sub_v2(), @multivariate_taylor_compiled.diff2c_domain_mul_v2()])), t340))
        }
      }
    }
  }
}

///|
/// gen_diff2c_poly
fn step_39() -> Unit raise {
  let t344 = @simp.rewrite_tac(@list.List([@vectors.interval_sing(), @sets.in_sing()]))
  let t343 = @tactics.exists_tac(@term_syntax.parse_term("((x : Cart[Real, N]), x)"))
  let t342 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t341 = @tactics.repeat_tac(@tactics.strip_tac)
  let t345 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@multivariate_taylor_compiled.diff2c_domain()])), t341), t342), t343), t344)
  let th_imp = @tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Real, (∀ domain : (Cart[Real, N], Cart[Real, N]), diff2c_domain(domain, f)) → (∀ x : Cart[Real, N], diff2c(f, x))"), t345)
  gen_diff2c_poly_c.set(fn(x346 : @kernel.Term) -> @kernel.Thm raise {
    let poly_tm = x346
    let t347 = @drule.match_mp(th_imp)
    (fn(x348 : @kernel.Thm) -> @kernel.Thm raise {
      t347(@bool.gen_all(x348))
    })(gen_diff2c_domain_poly(poly_tm))
  })
}

///|
let gen_diff2c_poly_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("gen_diff2c_poly")

///|
/// `gen_diff2c_poly`
pub fn gen_diff2c_poly(x : @kernel.Term) -> @kernel.Thm raise {
  (gen_diff2c_poly_c.get())(x)
}

///|
/// gen_diff_poly
fn step_40() -> Unit raise {
  let t367 = @simp.asm_simp_tac(@list.List([]))
  let t363 = @term_syntax.parse_term("(x : Cart[Real, N])")
  let t366 = @tactics.first_x_assum(fn(x365 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x360 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s361 = @tactics.mp_tac(x360)
      fn(x362 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s361(x362)
      }
    })(((x364 : @kernel.Thm) => @bool.spec(t363, x364))(x365))
  })
  let t359 = @tactics.repeat_tac(@tactics.strip_tac)
  let t358 = @simp.rewrite_tac(@list.List([@vectors.interval_sing(), @sets.in_sing()]))
  let t353 = @term_syntax.parse_term("(x : Cart[Real, N])")
  let t354 = @list.List([@term_syntax.parse_term("((x : Cart[Real, N]), x)"), t353])
  let t357 = @tactics.first_x_assum(fn(x356 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x350 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s351 = @tactics.mp_tac(x350)
      fn(x352 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s351(x352)
      }
    })(((x355 : @kernel.Thm) => @bool.specl(t354, x355))(x356))
  })
  let t349 = @tactics.repeat_tac(@tactics.strip_tac)
  let t368 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@multivariate_taylor_compiled.diff2c_domain(), @multivariate_taylor_compiled.diff2c(), @multivariate_taylor_compiled.diff2()])), t349), t357), t358), @ssreflect.case), t359), t366), t367)
  let th_imp = @tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Real, (∀ domain : (Cart[Real, N], Cart[Real, N]), diff2c_domain(domain, f)) → (∀ x : Cart[Real, N], differentiable(o(lift, f), at(x)))"), t368)
  gen_diff_poly_c.set(fn(x369 : @kernel.Term) -> @kernel.Thm raise {
    let poly_tm = x369
    let t370 = @drule.match_mp(th_imp)
    (fn(x371 : @kernel.Thm) -> @kernel.Thm raise {
      t370(@bool.gen_all(x371))
    })(gen_diff2c_domain_poly(poly_tm))
  })
}

///|
let gen_diff_poly_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("gen_diff_poly")

///|
/// `gen_diff_poly`
pub fn gen_diff_poly(x : @kernel.Term) -> @kernel.Thm raise {
  (gen_diff_poly_c.get())(x)
}

///|
/// in_tm
fn step_41() -> Unit raise {
  in_tm_c.set(@term_syntax.parse_term("(IN : (_, (_) -> Bool) -> Bool)"))
}

///|
let in_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("in_tm")

///|
/// `M_taylor.in_tm`
pub fn in_tm() -> @kernel.Term {
  in_tm_c.get()
}

///|
/// `add_to_hash`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB] add_to_hash(x372 : @lib.OHashtbl[TA, TB], x373 : Int64, x374 : TA, x375 : TB) -> Unit raise {
  let tbl = x372
  let max_size = x373
  let key = x374
  let value = x375
  let _ = if (Int::to_int64(@lib.hashtbl_length(tbl)) >= max_size) {
    @lib.hashtbl_clear(tbl)
  } else {
    ()
  }
  @lib.hashtbl_add(tbl, key, value)
}

///|
/// gen_partial_poly
fn step_42() -> Unit raise {
  let max_hash = 1000L
  let hash = @lib.hashtbl_create(@lib.int63_to_int(max_hash))
  gen_partial_poly_c.set(fn(x376 : Int64) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let i = x376
    fn(x377 : @kernel.Term) -> @kernel.Thm raise {
      let poly_tm = x377
      let key = (i, poly_tm)
      try {
        @lib.hashtbl_find(hash, (i, poly_tm))
      } catch {
        @lib.NotFound => {
          let i_tm = @nums.mk_small_numeral(i)
          fn gen_rec(x378 : @kernel.Term) -> @kernel.Thm raise {
            let poly_tm_1 = x378
            let (x_var, expr) = @kernel.dest_abs(poly_tm_1)
            let n = get_dim(x_var)
            if @list.List::is_empty(@kernel.frees(expr)) {
              let t380 = @lib.array_get(n_type_array(), @lib.int63_to_int(n))
              ((x379 : @kernel.Thm) => @bool.specl(@list.List([i_tm, expr]), x379))(((x381 : @kernel.Thm) => inst_first_type_var(t380, x381))(@multivariate_taylor_compiled.partial_const_v1()))
            } else {
              let (lhs, r_tm) = @kernel.dest_comb(expr)
              if (lhs == @misc_vars.neg_op_real()) {
                let r_poly = @kernel.mk_abs(x_var, r_tm)
                let r_diff = @bool.spec_all(gen_diff_poly(r_poly))
                let r_partial = gen_rec(r_poly)
                let th0 = @bool.spec(i_tm, @drule.match_mp(@multivariate_taylor_compiled.partial_neg_v1())(r_diff))
                @simp.rewrite_rule(@list.List([r_partial]))(th0)
              } else {
                let (op, l_tm) = @kernel.dest_comb(lhs)
                let name = (fn(x382 : (String, @kernel.HolType)) -> String raise {
                  x382.0
                })(@kernel.dest_const(op))
                if (name == "$") {
                  let dim_th = @lib.array_get(dimindex_array(), @lib.int63_to_int(n))
                  let dim_tm = @equal.lhand((fn(x383 : @kernel.Thm) -> @kernel.Term raise {
                    @kernel.concl(x383)
                  })(dim_th))
                  let i_eq_k = @calc_num.num_eq_conv(@basics.mk_eq(i_tm, r_tm))
                  let t384 = @term_syntax.parse_term("1")
                  let int_tm = @basics.mk_binop(@term_syntax.parse_term("op_dot_dot"), t384, dim_tm)
                  let t385 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.in_numseg(), dim_th])), @int.arith_tac)
                  let k_in_dim = @tactics.prove(@kernel.mk_comb(@basics.mk_icomb(in_tm(), r_tm), int_tm), t385)
                  let t386 = @drule.match_mp(@bool.specl(@list.List([r_tm, i_tm]), @multivariate_taylor_compiled.partial_x_v1()))
                  let t387 = @simp.rewrite_rule(@list.List([i_eq_k]))
                  t387(t386(k_in_dim))
                } else {
                  let l_poly = @kernel.mk_abs(x_var, l_tm)
                  let l_partial = gen_rec(l_poly)
                  let l_diff = @bool.spec_all(gen_diff_poly(l_poly))
                  if (name == "real_pow") {
                    let th0_1 = @bool.specl(@list.List([i_tm, r_tm]), @drule.match_mp(partial_pow())(l_diff))
                    @simp.rewrite_rule(@list.List([l_partial]))(th0_1)
                  } else {
                    let r_poly_1 = @kernel.mk_abs(x_var, r_tm)
                    let r_partial_1 = gen_rec(r_poly_1)
                    let r_diff_1 = @bool.spec_all(gen_diff_poly(r_poly_1))
                    let imp_th = @lib.assoc(op, @list.List([(@misc_vars.add_op_real(), @multivariate_taylor_compiled.partial_add_v1()), (@misc_vars.sub_op_real(), @multivariate_taylor_compiled.partial_sub_v1()), (@misc_vars.mul_op_real(), @multivariate_taylor_compiled.partial_mul_v1())]))
                    let th0_2 = @bool.spec(i_tm, @drule.match_mp(@drule.match_mp(imp_th)(l_diff))(r_diff_1))
                    @simp.rewrite_rule(@list.List([l_partial, r_partial_1]))(th0_2)
                  }
                }
              }
            }
          }
          let th1 = gen_rec(poly_tm)
          let t388 = @equal.thenc(@equal.thenc(@calc_num.num_reduce_conv, @simp.rewrite_conv(@list.List([@calc_rat.decimal()]))), @calc_rat.real_poly_conv)
          let th2 = (fn(x389 : @kernel.Term) -> @kernel.Thm raise {
            t388(@kernel.rand(x389))
          })((fn(x390 : @kernel.Thm) -> @kernel.Term raise {
            @kernel.concl(x390)
          })(th1))
          let t394 = @kernel.trans(th1, th2)
          let t391 = @simp.once_rewrite_rule(@list.List([@ssrfun.eq_ext()]))
          let t392 = @simp.rewrite_rule(@list.List([@class.eta_ax()]))
          let th3 = (fn(x393 : @kernel.Thm) -> @kernel.Thm raise {
            t392(t391(x393))
          })(@bool.gen_all(t394))
          let _ = add_to_hash(hash, max_hash, key, th3)
          th3
        }
        e => raise e
      }
    }
  })
}

///|
let gen_partial_poly_c : @lib.Cell[(Int64) -> ((@kernel.Term) -> @kernel.Thm raise) raise] = @lib.Cell::new("gen_partial_poly")

///|
/// `gen_partial_poly`
pub fn gen_partial_poly(x : Int64) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  (gen_partial_poly_c.get())(x)
}

///|
/// `gen_partial2_poly`
pub fn gen_partial2_poly(x395 : Int64, x396 : Int64, x397 : @kernel.Term) -> @kernel.Thm raise {
  let i = x395
  let j = x396
  let poly_tm = x397
  let partial_j = gen_partial_poly(j)(poly_tm)
  let t398 = @kernel.rand(@kernel.concl(partial_j))
  let partial_ij = gen_partial_poly(i)(t398)
  let pi = (fn(x399 : @kernel.Term) -> @kernel.Term raise {
    @kernel.rator(@equal.lhand(x399))
  })((fn(x400 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x400)
  })(partial_ij))
  let t401 = @kernel.trans(@equal.ap_term(pi, partial_j), partial_ij)
  @simp.rewrite_rule(@list.List([@equal.gsym(@multivariate_taylor_compiled.partial2())]))(t401)
}

///|
/// `eval_diff2_poly`
pub fn eval_diff2_poly(x402 : @kernel.Thm, x403 : @kernel.Term, x404 : @kernel.Term) -> @kernel.Thm raise {
  let diff2_domain_th = x402
  let xx = x403
  let zz = x404
  let domain_tm = @pair.mk_pair((xx, zz))
  @kernel.inst_rule(@list.List([(domain_tm, @kernel.mk_var("domain", @kernel.type_of(domain_tm)))]), diff2_domain_th)
}

///|
/// CONST_INTERVAL'
fn step_43() -> Unit raise {
  const_interval_p_c.set(@more_float.rule(@interval_arith.const_interval()))
}

///|
let const_interval_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONST_INTERVAL'")

///|
/// `M_taylor.CONST_INTERVAL'`
pub fn const_interval_p() -> @kernel.Thm {
  const_interval_p_c.get()
}

///|
/// `dest_lin_approx`
pub fn dest_lin_approx(x405 : @kernel.Term) -> ((@kernel.Term, @kernel.Term, @kernel.Term, @kernel.Term)) raise {
  let approx_tm = x405
  let (lhs, df_bounds) = @kernel.dest_comb(approx_tm)
  let (lhs2, f_bounds) = @kernel.dest_comb(lhs)
  let (lhs3, x_tm) = @kernel.dest_comb(lhs2)
  let f_tm = @kernel.rand(lhs3)
  (f_tm, x_tm, f_bounds, df_bounds)
}

///|
/// `gen_lin_approx_eq_thm`
pub fn gen_lin_approx_eq_thm(x406 : Int64) -> @kernel.Thm raise {
  let n = x406
  let ty = @lib.array_get(n_type_array(), @lib.int63_to_int(n))
  let df_vars = @lib.map(fn(x407 : Int64) -> @kernel.Term raise {
    let i = x407
    @lib.array_get(df_vars_array(), @lib.int63_to_int(i))
  }, @lib.range(1L, n))
  let df_bounds_list = @lists.mk_list(df_vars, @misc_vars.real_pair_ty())
  let th0 = ((x408 : @kernel.Thm) => @bool.specl(@list.List([@misc_vars.f_bounds_var(), df_bounds_list]), x408))(((x409 : @kernel.Thm) => inst_first_type_var(ty, x409))(@multivariate_taylor_compiled.m_lin_approx()))
  let t411 = @simp.rewrite_rule(@list.List([@multivariate_taylor_compiled.all_n()]))
  let th1 = ((x410 : @kernel.Thm) => @equal.conv_rule(@calc_num.num_reduce_conv, x410))(t411(th0))
  th1
}

///|
/// `gen_lin_approx_poly_thm`
pub fn gen_lin_approx_poly_thm(x412 : @kernel.Term, x413 : @kernel.Thm, x414 : @list.List[@kernel.Thm]) -> @kernel.Thm raise {
  let poly_tm = x412
  let diff_th = x413
  let partials = x414
  let (x_var, _) = @kernel.dest_abs(poly_tm)
  let n = get_dim(x_var)
  let t416 = gen_lin_approx_eq_thm(n)
  let t417 = @simp.rewrite_rule(partials)
  let lin_eq = t417(((x415 : @kernel.Thm) => @bool.specl(@list.List([poly_tm]), x415))(t416))
  let x_vec = mk_vector_list(@lib.map(fn(x418 : Int64) -> @kernel.Term raise {
    let i = x418
    @lib.array_get(x_vars_array(), @lib.int63_to_int(i))
  }, @lib.range(1L, n)))
  let t422 = @simp.rewrite_rule(@list.List([diff_th]))
  let t420 = @simp.rewrite_rule(@lib.array_to_list(@lib.array_get(comp_thms_array(), @lib.int63_to_int(n))))
  let th1 = (fn(x421 : @kernel.Thm) -> @kernel.Thm raise {
    t420(((x419 : @kernel.Thm) => @bool.spec(x_vec, x419))(x421))
  })(t422(lin_eq))
  th1
}

///|
/// `gen_lin_approx_poly_thm0`
pub fn gen_lin_approx_poly_thm0(x423 : @kernel.Term) -> @kernel.Thm raise {
  let poly_tm = x423
  let (x_var, _) = @kernel.dest_abs(poly_tm)
  let n = get_dim(x_var)
  let partials = @lib.map(fn(x424 : Int64) -> @kernel.Thm raise {
    let i = x424
    gen_partial_poly(i)(poly_tm)
  }, @lib.range(1L, n))
  let diff_th = gen_diff_poly(poly_tm)
  gen_lin_approx_poly_thm(poly_tm, diff_th, partials)
}

///|
/// `eval_lin_approx`
pub fn eval_lin_approx(x425 : Int64, x426 : @kernel.Thm) -> ((Int64) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
  let pp0 = x425
  let lin_approx_th = x426
  let (poly_tm, _, _, _) = (fn(x428 : @kernel.Term) -> (@kernel.Term, @kernel.Term, @kernel.Term, @kernel.Term) raise {
    dest_lin_approx(@equal.lhand(x428))
  })((fn(x429 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x429)
  })(lin_approx_th))
  let (x_var, _) = @kernel.dest_abs(poly_tm)
  let n = get_dim(x_var)
  let th0 = lin_approx_th
  let t432 = @drule.match_mp(@ssrbool.iffrl_v1())
  let t430 = @simp.rewrite_rule(@list.List([@equal.gsym(@theorems.imp_imp())]))
  let th1 = (fn(x431 : @kernel.Thm) -> @kernel.Thm raise {
    @bool.undisch_all(t430(x431))
  })(t432(th0))
  let build_eval : (@kernel.Term) -> (@eval_interval.IntervalFun, @kernel.Term) raise = fn(x433 : @kernel.Term) -> (@eval_interval.IntervalFun, @kernel.Term) raise {
    let int_hyp = x433
    let (expr, b_var) = @basics.dest_binary("interval_arith", int_hyp)
    (((x434 : @eval_interval.IntervalFun) => @eval_interval.eval_constants(pp0, x434))(@eval_interval.build_interval_fun(expr)), b_var)
  }
  let int_fs = @lib.map(build_eval, @kernel.hyp(th1))
  let (const_th_list, i_list0) = split_rules_l(int_fs)
  let th2 = @lib.itlist(fn(x436 : (@kernel.Term, @kernel.Thm), x437 : @kernel.Thm) -> @kernel.Thm raise {
    let (var_tm_1, th_1) = x436
    let th0_1 = x437
    let b_tm = @kernel.rand(@kernel.concl(th_1))
    ((x438 : @kernel.Thm) => @misc_functions.my_prove_hyp(th_1, x438))(((x439 : @kernel.Thm) => @kernel.inst_rule(@list.List([(b_tm, var_tm_1)]), x439))(th0_1))
  }, const_th_list, th1)
  let (v_list, i_list_p_1) = @lib.unzip(i_list0)
  let i_list_1 = @eval_interval.find_and_replace_all(i_list_p_1, @list.List([]))
  fn(x440 : Int64) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let pp = x440
    fn(x441 : @kernel.Term) -> @kernel.Thm raise {
      let vector_tm = x441
      let x_vals = dest_vector(vector_tm)
      if (Int::to_int64(@lib.length(x_vals)) != n) {
        raise Failure(("Wrong vector size; expected size: " + Int64::to_string(n)))
      } else {
        let x_ints = @lib.map(@interval_arith.mk_const_interval, x_vals)
        let vars = @lib.map(fn(x442 : Int64) -> @kernel.Term raise {
          let i = x442
          @lib.array_get(x_vars_array(), @lib.int63_to_int(i))
        }, @lib.range(1L, n))
        let th3 = @kernel.inst_rule(@lib.zip(x_vals, vars), th2)
        let i_vals = @eval_interval.eval_interval_fun_list(pp, i_list_1, @lib.zip(vars, x_ints))
        @lib.itlist2(fn(x443 : @kernel.Term, x444 : @kernel.Thm, x445 : @kernel.Thm) -> @kernel.Thm raise {
          let var_tm_2 = x443
          let th_2 = x444
          let th0_2 = x445
          let b_tm_1 = @kernel.rand(@kernel.concl(th_2))
          ((x446 : @kernel.Thm) => @misc_functions.my_prove_hyp(th_2, x446))(((x447 : @kernel.Thm) => @kernel.inst_rule(@list.List([(b_tm_1, var_tm_2)]), x447))(th0_2))
        }, v_list, i_vals, th3)
      }
    }
  }
}

///|
fn[TC] split_rules_l(x435 : @list.List[(@eval_interval.IntervalFun, TC)]) -> ((@list.List[(TC, @kernel.Thm)], @list.List[(TC, @eval_interval.IntervalFun)])) raise {
  let i_list = x435
  match i_list {
    Empty => (@list.List([]), @list.List([]))
    More((i_fun, var_tm), tail=es) => {
      let (th_list, i_list_p) = split_rules_l(es)
      match i_fun {
        @eval_interval.IntervalFun::Int_const(th) => (th_list.prepend((var_tm, th)), i_list_p)
        @eval_interval.IntervalFun::Int_var(v) => (th_list.prepend((var_tm, @kernel.inst_rule(@list.List([(v, @misc_vars.x_var_real())]), const_interval_p()))), i_list_p)
        _ => (th_list, i_list_p.prepend((var_tm, i_fun)))
      }
    }
  }
}

///|
/// `eval_lin_approx_poly0`
pub fn eval_lin_approx_poly0(x448 : Int64, x449 : @kernel.Term) -> ((Int64) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
  let pp0 = x448
  let poly_tm = x449
  eval_lin_approx(pp0, gen_lin_approx_poly_thm0(poly_tm))
}

///|
/// i_int_array
fn step_44() -> Unit raise {
  let i_tm = @term_syntax.parse_term("(i : Num)")
  let i_th0 = @tactics.prove(@term_syntax.parse_term("(1 <= (i : Num) && i <= SUC((n : Num))) == (1 <= i && i <= n || i == SUC(n))"), @int.arith_tac)
  let th1 = @tactics.prove(@term_syntax.parse_term("(1 <= (i : Num) && i <= 1) == (i == 1)"), @int.arith_tac)
  let array = @lib.array_make(@lib.add63(max_dim(), 1L), th1)
  let prove_next : (Int64) -> Unit raise = fn(x451 : Int64) -> Unit raise {
    let n = x451
    let n_tm = @nums.mk_small_numeral(n)
    let prev_n = @calc_num.num_conv(n_tm)
    let t452 = @basics.mk_binop(@misc_vars.le_op_num(), i_tm, n_tm)
    let tm = @bool.mk_conj(@term_syntax.parse_term("1 <= (i : Num)"), t452)
    let th = @simp.rewrite_conv(@list.List([prev_n, i_th0, @lib.array_get(array, @lib.int63_to_int(@lib.sub63(n, 1L)))]))(tm)
    let t453 = @equal.gsym(@theorems.disj_assoc())
    @lib.array_set(array, @lib.int63_to_int(n), @simp.rewrite_rule(@list.List([@equal.sym(prev_n), t453]))(th))
  }
  let _ = @lib.map(prove_next, @lib.range(2L, max_dim()))
  i_int_array_c.set(array)
}

///|
let i_int_array_c : @lib.Cell[FixedArray[@kernel.Thm]] = @lib.Cell::new("i_int_array")

///|
/// `M_taylor.i_int_array`
pub fn i_int_array() -> FixedArray[@kernel.Thm] {
  i_int_array_c.get()
}

///|
/// gen_in_interval
fn step_45() -> Unit raise {
  let t454 = @meson.meson_tac(@list.List([]))
  let th0 = @tactics.prove(@term_syntax.parse_term("(∀ i : Num, i == (k : Num) || (Q : (Num) -> Bool)(i) → (P : (Num) -> Bool)(i)) == (P(k) && (∀ i : Num, Q(i) → P(i)))"), t454)
  let t455 = @meson.meson_tac(@list.List([]))
  let th1 = @tactics.prove(@term_syntax.parse_term("(∀ i : Num, i == (k : Num) → (P : (Num) -> Bool)(i)) == P(k)"), t455)
  gen_in_interval_c.set(fn(x456 : Int64) -> @kernel.Thm raise {
    let n = x456
    let n_tm = @nums.mk_small_numeral(n)
    let i_tm = @term_syntax.parse_term("(i : Num)")
    let t457 = @basics.mk_binop(@misc_vars.le_op_num(), i_tm, n_tm)
    let lhs1 = @bool.mk_conj(@term_syntax.parse_term("1 <= (i : Num)"), t457)
    let lhs = @bool.mk_forall(i_tm, @bool.mk_imp(lhs1, @term_syntax.parse_term("(P : (Num) -> Bool)((i : Num))")))
    @simp.rewrite_conv(@list.List([@lib.array_get(i_int_array(), @lib.int63_to_int(n)), th0, th1]))(lhs)
  })
}

///|
let gen_in_interval_c : @lib.Cell[(Int64) -> @kernel.Thm raise] = @lib.Cell::new("gen_in_interval")

///|
/// `gen_in_interval`
pub fn gen_in_interval(x : Int64) -> @kernel.Thm raise {
  (gen_in_interval_c.get())(x)
}

///|
/// `gen_second_bounded_eq_thm`
pub fn gen_second_bounded_eq_thm(x458 : Int64) -> @kernel.Thm raise {
  let n = x458
  let (ty, _, x_var, _, _, _, domain_var) = get_types_and_vars(n)
  let dd_vars = @lib.map(fn(x459 : Int64) -> @list.List[@kernel.Term] raise {
    let i = x459
    @lib.map(fn(x460 : Int64) -> @kernel.Term raise {
      let j = x460
      @lib.array_get(@lib.array_get(dd_vars_array(), @lib.int63_to_int(j)), @lib.int63_to_int(i))
    }, @lib.range(1L, i))
  }, @lib.range(1L, n))
  let dd_bounds_list = @lists.mk_list(@lib.map(fn(x461 : @list.List[@kernel.Term]) -> @kernel.Term raise {
    let l = x461
    @lists.mk_list(l, @misc_vars.real_pair_ty())
  }, dd_vars), @misc_vars.real_pair_list_ty())
  let th0 = ((x462 : @kernel.Thm) => @bool.specl(@list.List([domain_var, dd_bounds_list]), x462))(((x463 : @kernel.Thm) => inst_first_type_var(ty, x463))(@multivariate_taylor_compiled.second_bounded()))
  let t465 = @simp.rewrite_rule(@list.List([@multivariate_taylor_compiled.all_n()]))
  let th1 = ((x464 : @kernel.Thm) => @equal.conv_rule(@calc_num.num_reduce_conv, x464))(t465(th0))
  th1
}

///|
/// `gen_second_bounded_poly_thm`
pub fn gen_second_bounded_poly_thm(x466 : @kernel.Term, x467 : @list.List[@list.List[@kernel.Thm]]) -> @kernel.Thm raise {
  let poly_tm = x466
  let partials2 = x467
  let (x_var, _) = @kernel.dest_abs(poly_tm)
  let n = get_dim(x_var)
  let partials2_p = @lib.flat(partials2)
  let t469 = gen_second_bounded_eq_thm(n)
  let t470 = @simp.rewrite_rule(partials2_p)
  let second_th = t470(((x468 : @kernel.Thm) => @bool.specl(@list.List([poly_tm]), x468))(t469))
  second_th
}

///|
/// `gen_second_bounded_poly_thm0`
pub fn gen_second_bounded_poly_thm0(x471 : @kernel.Term) -> @kernel.Thm raise {
  let poly_tm = x471
  let (x_var, _) = @kernel.dest_abs(poly_tm)
  let n = get_dim(x_var)
  let partials = @lib.map(fn(x472 : Int64) -> @kernel.Thm raise {
    let i = x472
    gen_partial_poly(i)(poly_tm)
  }, @lib.range(1L, n))
  let get_partial : (Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(x473 : Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let i_1 = x473
    fn(x474 : @kernel.Thm) -> @kernel.Thm raise {
      let eq_th = x474
      let t475 = @kernel.rand(@kernel.concl(eq_th))
      let partial_i = gen_partial_poly(i_1)(t475)
      let pi = (fn(x476 : @kernel.Term) -> @kernel.Term raise {
        @kernel.rator(@equal.lhand(x476))
      })((fn(x477 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x477)
      })(partial_i))
      let t478 = @kernel.trans(@equal.ap_term(pi, eq_th), partial_i)
      @simp.rewrite_rule(@list.List([@equal.gsym(@multivariate_taylor_compiled.partial2())]))(t478)
    }
  }
  let partials2 = @lib.map(fn(x479 : (@kernel.Thm, Int64)) -> @list.List[@kernel.Thm] raise {
    let (th, i_2) = x479
    @lib.map(fn(x480 : Int64) -> @kernel.Thm raise {
      let j = x480
      get_partial(j)(th)
    }, @lib.range(1L, i_2))
  }, @lib.zip(partials, @lib.range(1L, n)))
  gen_second_bounded_poly_thm(poly_tm, partials2)
}

///|
/// `eval_second_bounded`
pub fn eval_second_bounded(x481 : Int64, x482 : @kernel.Thm) -> ((Int64) -> ((@kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise) raise {
  let pp0 = x481
  let second_bounded_th = x482
  let poly_tm = (fn(x485 : @kernel.Term) -> @kernel.Term raise {
    (fn(x484 : @kernel.Term) -> @kernel.Term raise {
      @equal.lhand(@kernel.rator(x484))
    })(@equal.lhand(x485))
  })((fn(x486 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x486)
  })(second_bounded_th))
  let th0 = second_bounded_th
  let n = (fn(x488 : (@kernel.Term, @kernel.Term)) -> Int64 raise {
    get_dim((fn(x487 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
      x487.0
    })(x488))
  })(@kernel.dest_abs(poly_tm))
  let x_vector = mk_vector_list(@lib.map(fn(x489 : Int64) -> @kernel.Term raise {
    let i = x489
    @lib.array_get(x_vars_array(), @lib.int63_to_int(i))
  }, @lib.range(1L, n)))
  let z_vector = mk_vector_list(@lib.map(fn(x490 : Int64) -> @kernel.Term raise {
    let i_1 = x490
    @lib.array_get(z_vars_array(), @lib.int63_to_int(i_1))
  }, @lib.range(1L, n)))
  let (_, _, _, _, _, _, domain_var) = get_types_and_vars(n)
  let th1 = @kernel.inst_rule(@list.List([(@pair.mk_pair((x_vector, z_vector)), domain_var)]), th0)
  let th2 = @simp.rewrite_rule(@list.List([@vectors.in_interval(), @lib.array_get(dimindex_array(), @lib.int63_to_int(n))]))(th1)
  let t491 = @equal.gsym(@interval_arith.interval_arith())
  let th3 = @simp.rewrite_rule(@list.List([gen_in_interval(n), t491]))(th2)
  let t492 = @simp.rewrite_rule(@lib.array_to_list(@lib.array_get(comp_thms_array(), @lib.int63_to_int(n))))
  let t493 = @simp.rewrite_rule(@list.List([@theorems.conj_aci()]))
  let th4 = t493(t492(th3))
  let t494 = @drule.match_mp(@ssrbool.iffrl_v1())
  let final_th0 = @bool.undisch_all(t494(th4))
  let (x_var, h_tm) = (fn(x495 : @list.List[@kernel.Term]) -> (@kernel.Term, @kernel.Term) raise {
    @basics.dest_forall(@lib.hd(x495))
  })((fn(x496 : @kernel.Thm) -> @list.List[@kernel.Term] raise {
    @kernel.hyp(x496)
  })(final_th0))
  let (_, h2) = @basics.dest_imp(h_tm)
  let concl_ints = @lib.striplist(@basics.dest_conj, h2)
  let i_funs = @lib.map(fn(x497 : @kernel.Term) -> (@eval_interval.IntervalFun, @kernel.Term) raise {
    let int = x497
    let (expr, var_) = @interval_arith.dest_interval_arith(int)
    (((x498 : @eval_interval.IntervalFun) => @eval_interval.eval_constants(pp0, x498))(@eval_interval.build_interval_fun(expr)), var_)
  }, concl_ints)
  let (const_th_list, i_list0) = split_rules_l_1(i_funs)
  let th5 = @lib.itlist(fn(x500 : (@kernel.Term, @kernel.Thm), x501 : @kernel.Thm) -> @kernel.Thm raise {
    let (var_tm_1, th_1) = x500
    let th0_1 = x501
    let b_tm = @kernel.rand(@kernel.concl(th_1))
    let t503 = @simp.rewrite_rule(@list.List([th_1]))
    t503(((x502 : @kernel.Thm) => @kernel.inst_rule(@list.List([(b_tm, var_tm_1)]), x502))(th0_1))
  }, const_th_list, @equal.sym(th4))
  let final_th = @simp.rewrite_rule(@list.List([@equal.gsym(@theorems.imp_imp())]))(th5)
  let (v_list, i_list_p_1) = @lib.unzip(i_list0)
  let i_list_1 = @eval_interval.find_and_replace_all(i_list_p_1, @list.List([]))
  fn(x504 : Int64) -> ((@kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
    let pp = x504
    fn(x505 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let x_vector_tm = x505
      fn(x506 : @kernel.Term) -> @kernel.Thm raise {
        let z_vector_tm = x506
        let x_vals = dest_vector(x_vector_tm)
        let z_vals = dest_vector(z_vector_tm)
        if ((Int::to_int64(@lib.length(x_vals)) != n) || (Int::to_int64(@lib.length(z_vals)) != n)) {
          raise Failure(("Wrong vector size; expected size: " + Int64::to_string(n)))
        } else {
          let x_vars = @lib.map(fn(x507 : Int64) -> @kernel.Term raise {
            let i_2 = x507
            @lib.array_get(x_vars_array(), @lib.int63_to_int(i_2))
          }, @lib.range(1L, n))
          let z_vars = @lib.map(fn(x508 : Int64) -> @kernel.Term raise {
            let i_3 = x508
            @lib.array_get(z_vars_array(), @lib.int63_to_int(i_3))
          }, @lib.range(1L, n))
          let t511 = @lib.zip(z_vals, z_vars)
          let t509 = @lib.zip(x_vals, x_vars)
          let inst_th = ((x510 : @kernel.Thm) => @kernel.inst_rule(t509, x510))(((x512 : @kernel.Thm) => @kernel.inst_rule(t511, x512))(final_th))
          let t515 = @kernel.concl(inst_th)
          if (fn(x513 : Bool) -> Bool raise {
            !x513
          })((fn(x514 : @kernel.Term) -> Bool raise {
            @basics.is_eq(x514)
          })(t515)) {
            inst_th
          } else {
            let (x_var_1, lhs) = (fn(x516 : @kernel.Term) -> (@kernel.Term, @kernel.Term) raise {
              @basics.dest_forall(@equal.lhand(x516))
            })((fn(x517 : @kernel.Thm) -> @kernel.Term raise {
              @kernel.concl(x517)
            })(inst_th))
            let hs = @lib.butlast(((x518 : @kernel.Term) => @lib.striplist(@basics.dest_imp, x518))(lhs))
            let vars = @lib.map(fn(x519 : @kernel.Term) -> @kernel.Term raise {
              @kernel.rand(@kernel.rator(x519))
            }, hs)
            let int_vars = @lib.zip(vars, @lib.map(@kernel.assume_rule, hs))
            let dd_ints = @eval_interval.eval_interval_fun_list(pp, i_list_1, int_vars)
            let inst_dd = @lib.map2(fn(x520 : @kernel.Term, x521 : @kernel.Thm) -> (@kernel.Term, @kernel.Term) raise {
              let var__1 = x520
              let th_2 = x521
              (@kernel.rand((fn(x522 : @kernel.Thm) -> @kernel.Term raise {
                @kernel.concl(x522)
              })(th_2)), var__1)
            }, v_list, dd_ints)
            let inst_th2 = @kernel.inst_rule(inst_dd, inst_th)
            let conj_th = @lib.end_itlist(@bool.conj, dd_ints)
            let lhs_th = @bool.gen(x_var_1, @lib.itlist(@bool.disch, hs, conj_th))
            @kernel.eq_mp(inst_th2, lhs_th)
          }
        }
      }
    }
  }
}

///|
fn[TD] split_rules_l_1(x499 : @list.List[(@eval_interval.IntervalFun, TD)]) -> ((@list.List[(TD, @kernel.Thm)], @list.List[(TD, @eval_interval.IntervalFun)])) raise {
  let i_list = x499
  match i_list {
    Empty => (@list.List([]), @list.List([]))
    More((i_fun, var_tm), tail=es) => {
      let (th_list, i_list_p) = split_rules_l_1(es)
      match i_fun {
        @eval_interval.IntervalFun::Int_const(th) => (th_list.prepend((var_tm, th)), i_list_p)
        _ => (th_list, i_list_p.prepend((var_tm, i_fun)))
      }
    }
  }
}

///|
/// `eval_second_bounded_poly0`
pub fn eval_second_bounded_poly0(x523 : Int64, x524 : @kernel.Term) -> ((Int64) -> ((@kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise) raise {
  let pp0 = x523
  let poly_tm = x524
  eval_second_bounded(pp0, gen_second_bounded_poly_thm0(poly_tm))
}

///|
/// `eval_m_taylor`
pub fn eval_m_taylor(x526 : Int64, x527 : @kernel.Thm, x528 : @kernel.Thm, x529 : @kernel.Thm) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise) raise {
  let pp0 = x526
  let diff2c_th = x527
  let lin_th = x528
  let second_th = x529
  let poly_tm = @kernel.rand((fn(x531 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x531)
  })(diff2c_th))
  let n = (fn(x533 : (@kernel.Term, @kernel.Term)) -> Int64 raise {
    get_dim((fn(x532 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
      x532.0
    })(x533))
  })(@kernel.dest_abs(poly_tm))
  let eval_lin : (Int64) -> ((@kernel.Term) -> @kernel.Thm raise) raise = eval_lin_approx(pp0, lin_th)
  let eval_second : (Int64) -> ((@kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise = eval_second_bounded(pp0, second_th)
  let (ty, _, x_var, f_var, y_var, w_var, domain_var) = get_types_and_vars(n)
  let th0 = @bool.spec_all(((x534 : @kernel.Thm) => inst_first_type_var(ty, x534))(@multivariate_taylor_compiled.m_taylor_interval()))
  let th1 = @kernel.inst_rule(@list.List([(poly_tm, f_var)]), th0)
  let t539 = @simp.rewrite_rule(@list.List([diff2c_th]))
  let t537 = @drule.match_mp(@ssrbool.iffrl_v1())
  let t535 = @simp.rewrite_rule(@list.List([@equal.gsym(@theorems.imp_imp())]))
  let th2 = (fn(x538 : @kernel.Thm) -> @kernel.Thm raise {
    (fn(x536 : @kernel.Thm) -> @kernel.Thm raise {
      @bool.undisch_all(t535(x536))
    })(t537(x538))
  })(t539(th1))
  fn(x540 : Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise {
    let p_lin = x540
    fn(x541 : Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
      let p_second = x541
      fn(x542 : @kernel.Thm) -> @kernel.Thm raise {
        let domain_th = x542
        let (domain_tm, y_tm, w_tm) = dest_m_cell_domain(@kernel.concl(domain_th))
        let (x_tm, z_tm) = @pair.dest_pair(domain_tm)
        let lin_th_1 = eval_lin(p_lin)(y_tm)
        let second_th_1 = eval_second(p_second)(x_tm)(z_tm)
        let (_, _, f_bounds, df_bounds_list) = dest_lin_approx(@kernel.concl(lin_th_1))
        let dd_bounds_list = @kernel.rand((fn(x543 : @kernel.Thm) -> @kernel.Term raise {
          @kernel.concl(x543)
        })(second_th_1))
        let df_var = @kernel.mk_var("d_bounds_list", @kernel.type_of(df_bounds_list))
        let dd_var = @kernel.mk_var("dd_bounds_list", @kernel.type_of(dd_bounds_list))
        (fn(x548 : @kernel.Thm) -> @kernel.Thm raise {
          (fn(x546 : @kernel.Thm) -> @kernel.Thm raise {
            ((x544 : @kernel.Thm) => @misc_functions.my_prove_hyp(domain_th, x544))(((x545 : @kernel.Thm) => @misc_functions.my_prove_hyp(lin_th_1, x545))(x546))
          })(((x547 : @kernel.Thm) => @misc_functions.my_prove_hyp(second_th_1, x547))(x548))
        })(((x549 : @kernel.Thm) => @kernel.inst_rule(@list.List([(domain_tm, domain_var), (y_tm, y_var), (w_tm, w_var), (f_bounds, @misc_vars.f_bounds_var()), (df_bounds_list, df_var), (dd_bounds_list, dd_var)]), x549))(th2))
      }
    }
  }
}

///|
/// `eval_m_taylor_poly0`
pub fn eval_m_taylor_poly0(x550 : Int64, x551 : @kernel.Term) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise) raise {
  let pp0 = x550
  let poly_tm = x551
  let diff2_th = gen_diff2c_domain_poly(poly_tm)
  let (x_var, _) = @kernel.dest_abs(poly_tm)
  let n = get_dim(x_var)
  let partials = @lib.map(fn(x553 : Int64) -> @kernel.Thm raise {
    let i = x553
    gen_partial_poly(i)(poly_tm)
  }, @lib.range(1L, n))
  let get_partial : (Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(x554 : Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let i_1 = x554
    fn(x555 : @kernel.Thm) -> @kernel.Thm raise {
      let eq_th = x555
      let t556 = @kernel.rand(@kernel.concl(eq_th))
      let partial_i = gen_partial_poly(i_1)(t556)
      let pi = (fn(x557 : @kernel.Term) -> @kernel.Term raise {
        @kernel.rator(@equal.lhand(x557))
      })((fn(x558 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x558)
      })(partial_i))
      let t559 = @kernel.trans(@equal.ap_term(pi, eq_th), partial_i)
      @simp.rewrite_rule(@list.List([@equal.gsym(@multivariate_taylor_compiled.partial2())]))(t559)
    }
  }
  let partials2 = @lib.map2(fn(x560 : @kernel.Thm, x561 : Int64) -> @list.List[@kernel.Thm] raise {
    let th = x560
    let i_2 = x561
    @lib.map(fn(x562 : Int64) -> @kernel.Thm raise {
      let j = x562
      get_partial(j)(th)
    }, @lib.range(1L, i_2))
  }, partials, @lib.range(1L, n))
  let second_th = gen_second_bounded_poly_thm(poly_tm, partials2)
  let diff_th = gen_diff_poly(poly_tm)
  let lin_th = gen_lin_approx_poly_thm(poly_tm, diff_th, partials)
  eval_m_taylor(pp0, diff2_th, lin_th, second_th)
}

///|
/// `mk_eval_function_eq`
pub fn mk_eval_function_eq(x563 : Int64, x564 : @kernel.Thm) -> ((Int64) -> ((@kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise) raise {
  let pp0 = x563
  let eq_th = x564
  let expr_tm = @kernel.rand((fn(x566 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x566)
  })(eq_th))
  let tm0 = @term_syntax.parse_term("∀ x : Cart[Real, N], IN(x, interval([(domain : (Cart[Real, N], Cart[Real, N]))])) → interval_arith((f : (Cart[Real, N]) -> Real)(x), (f_bounds : (Real, Real)))")
  let n = (fn(x568 : (@kernel.Term, @kernel.Term)) -> Int64 raise {
    get_dim((fn(x567 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
      x567.0
    })(x568))
  })(@kernel.dest_abs(expr_tm))
  let x_vector = mk_vector_list(@lib.map(fn(x569 : Int64) -> @kernel.Term raise {
    let i = x569
    @lib.array_get(x_vars_array(), @lib.int63_to_int(i))
  }, @lib.range(1L, n)))
  let z_vector = mk_vector_list(@lib.map(fn(x570 : Int64) -> @kernel.Term raise {
    let i_1 = x570
    @lib.array_get(z_vars_array(), @lib.int63_to_int(i_1))
  }, @lib.range(1L, n)))
  let (ty, _, _, _, _, _, domain_var) = get_types_and_vars(n)
  let f_var = @kernel.mk_var("f", @kernel.type_of(expr_tm))
  let t571 = @list.List([(@pair.mk_pair((x_vector, z_vector)), domain_var)])
  let t573 = @simp.rewrite_conv(@list.List([@vectors.in_interval()]))
  let th1 = (fn(x574 : @kernel.Term) -> @kernel.Thm raise {
    t573(((x572 : @kernel.Term) => @basics.subst(t571, x572))(x574))
  })((fn(x576 : @kernel.Term) -> @kernel.Term raise {
    ((x575 : @kernel.Term) => @kernel.inst(@list.List([(ty, @misc_vars.nty())]), x575))(x576)
  })(tm0))
  let th2 = @simp.rewrite_rule(@list.List([@lib.array_get(dimindex_array(), @lib.int63_to_int(n))]))(th1)
  let t577 = @equal.gsym(@interval_arith.interval_arith())
  let th3 = @simp.rewrite_rule(@list.List([gen_in_interval(n), t577]))(th2)
  let t578 = @simp.rewrite_rule(@lib.array_to_list(@lib.array_get(comp_thms_array(), @lib.int63_to_int(n))))
  let t579 = @simp.rewrite_rule(@list.List([@equal.gsym(@theorems.imp_imp()), @theorems.conj_aci()]))
  let th4 = t579(t578(th3))
  let t586 = (fn(x580 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s581 = @equal.rand_conv(x580)
    fn(x582 : @kernel.Term) -> @kernel.Thm raise {
      s581(x582)
    }
  })((fn(x583 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s584 = @equal.once_depth_conv(x583)
    fn(x585 : @kernel.Term) -> @kernel.Thm raise {
      s584(x585)
    }
  })(@equal.beta_conv))
  let final_th0 = ((x587 : @kernel.Thm) => @equal.conv_rule(t586, x587))(((x588 : @kernel.Thm) => @kernel.inst_rule(@list.List([(expr_tm, f_var)]), x588))(th4))
  let (x_var, h_tm) = (fn(x589 : @kernel.Term) -> (@kernel.Term, @kernel.Term) raise {
    @basics.dest_forall(@kernel.rand(x589))
  })((fn(x590 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x590)
  })(final_th0))
  let f_tm = (fn(x593 : @list.List[@kernel.Term]) -> @kernel.Term raise {
    (fn(x592 : @kernel.Term) -> @kernel.Term raise {
      (fn(x591 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
        x591.0
      })(@interval_arith.dest_interval_arith(x592))
    })(@lib.last(x593))
  })(((x594 : @kernel.Term) => @lib.striplist(@basics.dest_imp, x594))(h_tm))
  let i_fun = ((x595 : @eval_interval.IntervalFun) => @eval_interval.eval_constants(pp0, x595))(@eval_interval.build_interval_fun(f_tm))
  let i_list = @eval_interval.find_and_replace_all(@list.List([i_fun]), @list.List([]))
  let t596 = @simp.pure_rewrite_rule(@list.List([@equal.sym(eq_th)]))
  let final_th = t596(@equal.sym(final_th0))
  fn(x597 : Int64) -> ((@kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
    let pp = x597
    fn(x598 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let x_vector_tm = x598
      fn(x599 : @kernel.Term) -> @kernel.Thm raise {
        let z_vector_tm = x599
        let x_vals = dest_vector(x_vector_tm)
        let z_vals = dest_vector(z_vector_tm)
        if ((Int::to_int64(@lib.length(x_vals)) != n) || (Int::to_int64(@lib.length(z_vals)) != n)) {
          raise Failure(("Wrong vector size; expected size: " + Int64::to_string(n)))
        } else {
          let x_vars = @lib.map(fn(x600 : Int64) -> @kernel.Term raise {
            let i_2 = x600
            @lib.array_get(x_vars_array(), @lib.int63_to_int(i_2))
          }, @lib.range(1L, n))
          let z_vars = @lib.map(fn(x601 : Int64) -> @kernel.Term raise {
            let i_3 = x601
            @lib.array_get(z_vars_array(), @lib.int63_to_int(i_3))
          }, @lib.range(1L, n))
          let t604 = @lib.zip(z_vals, z_vars)
          let t602 = @lib.zip(x_vals, x_vars)
          let inst_th = ((x603 : @kernel.Thm) => @kernel.inst_rule(t602, x603))(((x605 : @kernel.Thm) => @kernel.inst_rule(t604, x605))(final_th))
          let (x_var_1, lhs) = (fn(x606 : @kernel.Term) -> (@kernel.Term, @kernel.Term) raise {
            @basics.dest_forall(@equal.lhand(x606))
          })((fn(x607 : @kernel.Thm) -> @kernel.Term raise {
            @kernel.concl(x607)
          })(inst_th))
          let hs = @lib.butlast(((x608 : @kernel.Term) => @lib.striplist(@basics.dest_imp, x608))(lhs))
          let vars = @lib.map(fn(x609 : @kernel.Term) -> @kernel.Term raise {
            @kernel.rand(@kernel.rator(x609))
          }, hs)
          let int_vars = @lib.zip(vars, @lib.map(@kernel.assume_rule, hs))
          let eval_th = @lib.hd(@eval_interval.eval_interval_fun_list(pp, i_list, int_vars))
          let f_bounds = @kernel.rand((fn(x610 : @kernel.Thm) -> @kernel.Term raise {
            @kernel.concl(x610)
          })(eval_th))
          let inst_th2 = @kernel.inst_rule(@list.List([(f_bounds, @misc_vars.f_bounds_var())]), inst_th)
          let lhs_th = @bool.gen(x_var_1, @lib.itlist(@bool.disch, hs, eval_th))
          @kernel.eq_mp(inst_th2, lhs_th)
        }
      }
    }
  }
}

///|
/// `mk_eval_function`
pub fn mk_eval_function(x611 : Int64, x612 : @kernel.Term) -> ((Int64) -> ((@kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise) raise {
  let pp0 = x611
  let expr_tm = x612
  mk_eval_function_eq(pp0, @kernel.refl(expr_tm))
}

///|
/// ITLIST2_EQ_SUM
fn step_46() -> Unit raise {
  let t638 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("1 <= (i : Num) → i + 1 - 1 == SUC(i - 1)")), @lists.el(), @lists.tl()]))
  let t637 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t636 = @ssreflect.move_(@list.List(["i"]))
  let t635 = @tactics.match_mp_tac(@iterate.sum_eq())
  let t634 = @simp.rewrite_tac(@list.List([@equal.gsym(@ssrnat.addn1()), @iterate.sum_offset(), @calc_int.real_eq_add_lcancel()]))
  let t633 = @simp.rewrite_tac(@list.List([@arith.two(), @ssrnat.add1n(), @iterate.sum_sing_numseg(), @ssrnat.subnn(), @lists.el(), @lists.hd()]))
  let t632 = @simp.rewrite_tac(@list.List([@calc_num.arith()]))
  let t630 = @simp.rewrite_tac(@list.List([@equal.gsym(@ssrnat.add1n())]))
  let t629 = @tactics.disch_then(fn(x627 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x627
    @simp.rewrite_tac(@list.List([@lists.tl(), th]))
  })
  let t626 = @simp.asm_rewrite_tac(@list.List([]))
  let t622 = @term_syntax.parse_term("(t' : List[B])")
  let t625 = @tactics.first_x_assum(fn(x624 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x619 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s620 = @tactics.mp_tac(x619)
      fn(x621 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s620(x621)
      }
    })(((x623 : @kernel.Thm) => @bool.spec(t622, x623))(x624))
  })
  let t618 = @simp.rewrite_tac(@list.List([@ssrnat.leqss()]))
  let t616 = @simp.rewrite_tac(@list.List([@iterate.sum_clauses_numseg(), @calc_num.arith()]))
  let t617 = @list.List([@simp.rewrite_tac(@list.List([@iterate.sum_clauses_numseg(), @calc_num.arith()])), t616, @tactics.all_tac])
  let t615 = @tactics.try_tac(@int.arith_tac)
  let t614 = @simp.rewrite_tac(@list.List([@lists.length(), @lists.itlist2_def()]))
  let t639 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @lists.list_induct_tac), @lists.list_induct_tac), t614), t615), t617), t618), @tactics.disch_tac), t625), t626), t629), t630), (x631 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), @iterate.sum_add_split(), x631)), t632), t633), t634), t635), t636), t637), @tactics.disch_tac), t638)
  itlist2_eq_sum_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A, B) -> Real, ∀ l1 : List[A], ∀ l2 : List[B], LENGTH(l1) <= LENGTH(l2) → ITLIST2((x : A) => (y : B) => (z : Real) => f(x, y) + z, l1, l2, real_of_num(0)) == sum(op_dot_dot(1, LENGTH(l1)), (i : Num) => f(EL(i - 1, l1), EL(i - 1, l2)))"), t639))
}

///|
let itlist2_eq_sum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITLIST2_EQ_SUM")

///|
/// `M_taylor.ITLIST2_EQ_SUM`
pub fn itlist2_eq_sum() -> @kernel.Thm {
  itlist2_eq_sum_c.get()
}

///|
/// interval_arith_abs_le
fn step_47() -> Unit raise {
  let t640 = @simp.rewrite_tac(@list.List([@interval_arith.interval_arith(), @more_float.iabs_p()]))
  let t641 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @ssreflect.case), t640), @calc_rat.real_arith_tac)
  interval_arith_abs_le_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ int : (Real, Real), ∀ y : Real, interval_arith(x, int) → iabs(int) <= y → abs(x) <= y"), t641))
}

///|
let interval_arith_abs_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("interval_arith_abs_le")

///|
/// `M_taylor.interval_arith_abs_le`
pub fn interval_arith_abs_le() -> @kernel.Thm {
  interval_arith_abs_le_c.get()
}

///|
/// ALL_N_ALL2
fn step_48() -> Unit raise {
  let t662 = @tactics.disch_then(fn(x660 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x660
    @simp.rewrite_tac(@list.List([th, @lists.all2()]))
  })
  let t659 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("SUC((i0 : Num)) - 1 < SUC(i0)"))]))
  let t657 = @term_syntax.parse_term("SUC((i0 : Num)) - 1")
  let t658 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("SUC((i0 : Num))"), t657]), @more_list.l_seq_nil()))
  let t656 = @simp.rewrite_tac(@list.List([@lists.length(), @ssrnat.addn0()]))
  let t655 = @simp.simp_tac(@list.List([@lists.not_cons_nil()]))
  let t653 = @term_syntax.parse_term("(t : List[A])")
  let t654 = @tactics.spec_tac(@term_syntax.parse_term("(t : List[A])"), t653)
  let t652 = @simp.rewrite_tac(@list.List([@ssrnat.addsn(), @ssrnat.addns(), @ssrnat.addn1()]))
  let t651 = @tactics.try_tac(@int.arith_tac)
  let t650 = @tactics.first_x_assum(fn(x648 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    fn(x649 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      ((x646 : @kernel.Thm, x647 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), x646, x647))(x648, x649)
    }
  })
  let t645 = @tactics.try_tac(@int.arith_tac)
  let t644 = @simp.rewrite_tac(@list.List([@lists.length(), @lists.all2()]))
  let t642 = @simp.rewrite_tac(@list.List([@multivariate_taylor_compiled.all_n(), @lists.not_cons_nil()]))
  let t663 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @lists.list_induct_tac), @tactics.gen_tac), t642), (x643 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), @more_list.l_seq_cons(), x643)), t644), t645), t650), t651), t652), t654), @ssreflect.case), t655), t656), t658), t659), t662)
  all_n_all2_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (Num, A) -> Bool, ∀ l : List[A], ∀ i0 : Num, all_n(i0, l, P) == (if l == NIL { true } else { ALL2(P, l_seq(i0, i0 + LENGTH(l) - 1), l) })"), t663))
}

///|
let all_n_all2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALL_N_ALL2")

///|
/// `M_taylor.ALL_N_ALL2`
pub fn all_n_all2() -> @kernel.Thm {
  all_n_all2_c.get()
}

///|
/// ALL_N_EL
fn step_49() -> Unit raise {
  let t694 = @simp.asm_rewrite_tac(@list.List([]))
  let t693 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t692 = @tactics.try_tac(@int.asm_arith_tac)
  let t690 = @simp.rewrite_tac(@list.List([]))
  let t689 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@more_list.length_l_seq(), @lists.length()])), @int.asm_arith_tac), @tactics.all_tac])
  let t685 = @simp.rewrite_tac(@list.List([]))
  let t684 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@more_list.length_l_seq(), @lists.length()])), @int.asm_arith_tac), @tactics.all_tac])
  let t682 = @simp.asm_rewrite_tac(@list.List([]))
  let t679 = @term_syntax.parse_term("(i : Num)")
  let t687 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x681 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x676 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s677 = @tactics.mp_tac(x676)
      fn(x678 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s677(x678)
      }
    })(((x680 : @kernel.Thm) => @bool.spec(t679, x680))(x681))
  }), t682), (x683 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), el_zip(), x683)), t684), t685), (x686 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), @more_list.el_l_seq(), x686)), @int.asm_arith_tac), @tactics.all_tac])
  let t675 = @tactics.repeat_tac(@tactics.strip_tac)
  let t674 = @simp.rewrite_tac(@list.List([@more_list.length_l_seq(), @int.arith_rule(@term_syntax.parse_term("(i0 : Num) + SUC((a : Num)) - 1 + 1 - i0 == SUC(a)"))]))
  let t673 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@more_list.length_l_seq(), @lists.length()])), @int.arith_tac), @tactics.all_tac])
  let t671 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.all_el())]))
  let t670 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@more_list.length_l_seq(), @lists.length()])), @int.arith_tac), @tactics.all_tac])
  let t668 = @tactics.repeat_tac(@tactics.gen_tac)
  let t667 = @simp.simp_tac(@list.List([@lists.not_cons_nil(), @lists.length(), @ssrnat.ltn0()]))
  let t665 = @term_syntax.parse_term("(l : List[A])")
  let t666 = @tactics.spec_tac(@term_syntax.parse_term("(l : List[A])"), t665)
  let t664 = @simp.rewrite_tac(@list.List([all_n_all2()]))
  let t695 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t664), t666), @ssreflect.case), t667), t668), (x669 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), all2_all_zip(), x669)), t670), t671), (x672 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), length_zip(), x672)), t673), t674), @tactics.eq_tac), t675), t687), (x688 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), el_zip(), x688)), t689), t690), (x691 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), @more_list.el_l_seq(), x691)), t692), t693), t694)
  all_n_el_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (Num, A) -> Bool, ∀ l : List[A], ∀ i0 : Num, all_n(i0, l, P) == (∀ i : Num, i < LENGTH(l) → P(i0 + i, EL(i, l)))"), t695))
}

///|
let all_n_el_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALL_N_EL")

///|
/// `M_taylor.ALL_N_EL`
pub fn all_n_el() -> @kernel.Thm {
  all_n_el_c.get()
}

///|
/// M_TAYLOR_ERROR_ITLIST2
fn step_50() -> Unit raise {
  let t922 = @simp.rewrite_tac(@list.List([@realax.real_le_refl()]))
  let t920 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t919 = @tactics.remove_then("i_in", fn(x916 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s917 = @tactics.mp_tac(x916)
    fn(x918 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s917(x918)
    }
  })
  let t915 = @tactics.remove_then("j_in", fn(x912 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s913 = @tactics.mp_tac(x912)
    fn(x914 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s913(x914)
    }
  })
  let t921 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t915), t919), t920), @int.arith_tac), @tactics.all_tac])
  let t910 = @tactics.disch_then(@tactics.match_mp_tac)
  let t907 = @drule.match_mp(interval_arith_abs_le())
  let t909 = @tactics.disch_then(fn(x908 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x904 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s905 = @tactics.mp_tac(x904)
      fn(x906 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s905(x906)
      }
    })(t907(x908))
  })
  let t903 = @simp.rewrite_tac(@list.List([@multivariate_taylor_compiled.partial2()]))
  let t902 = @list.List([@tactics.then_tac(@tactics.replicate_tac(3, @tactics.pop_assum(fn(x899 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s900 = @tactics.mp_tac(x899)
    fn(x901 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s900(x901)
    }
  })), @int.arith_tac), @tactics.all_tac])
  let t898 = @tactics.subgoal_then(@term_syntax.parse_term("1 + ((j : Num) - 1) == j && 1 + ((i : Num) - 1) == i"), fn(x896 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x896
    @simp.rewrite_tac(@list.List([th_2]))
  })
  let t894 = @tactics.pop_assum(fn(x891 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s892 = @tactics.mp_tac(x891)
    fn(x893 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s892(x893)
    }
  })
  let t895 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t894), @int.arith_tac), @tactics.all_tac])
  let t887 = @term_syntax.parse_term("(j : Num) - 1")
  let t890 = @tactics.disch_then(fn(x889 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x884 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s885 = @tactics.mp_tac(x884)
      fn(x886 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s885(x886)
      }
    })(((x888 : @kernel.Thm) => @bool.spec(t887, x888))(x889))
  })
  let t882 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t883 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.remove_then("i_in", fn(x879 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s880 = @tactics.mp_tac(x879)
    fn(x881 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s880(x881)
    }
  }), t882), @int.arith_tac), @tactics.all_tac])
  let t875 = @term_syntax.parse_term("(i : Num) - 1")
  let t878 = @tactics.disch_then(fn(x877 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x872 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s873 = @tactics.mp_tac(x872)
      fn(x874 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s873(x874)
      }
    })(((x876 : @kernel.Thm) => @bool.spec(t875, x876))(x877))
  })
  let t871 = @simp.asm_rewrite_tac(@list.List([all_n_el()]))
  let t867 = @term_syntax.parse_term("(x : Cart[Real, N])")
  let t870 = @tactics.first_x_assum(fn(x869 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x864 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s865 = @tactics.mp_tac(x864)
      fn(x866 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s865(x866)
      }
    })(((x868 : @kernel.Thm) => @bool.spec(t867, x868))(x869))
  })
  let t863 = @simp.asm_simp_tac(@list.List([]))
  let t862 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t859 = @simp.rewrite_rule(@list.List([@iterate.in_numseg()]))
  let t861 = @tactics.use_then("j_in", fn(x860 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x856 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s857 = @tactics.assume_tac(x856)
      fn(x858 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s857(x858)
      }
    })(t859(x860))
  })
  let t855 = @simp.asm_simp_tac(@list.List([vector_component()]))
  let t853 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t852 = @tactics.remove_then("j_in", fn(x849 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s850 = @tactics.mp_tac(x849)
    fn(x851 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s850(x851)
    }
  })
  let t854 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.remove_then("i_in", fn(x846 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s847 = @tactics.mp_tac(x846)
    fn(x848 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s847(x848)
    }
  }), t852), t853), @int.arith_tac), @tactics.all_tac])
  let t845 = @tactics.subgoal_then(@term_syntax.parse_term("IN((j : Num), op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))))"), fn(x842 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s843 = ((x841 : @kernel.Thm) => @tactics.label_tac("j_in2", x841))(x842)
    fn(x844 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s843(x844)
    }
  })
  let t840 = @ssreflect.move_(@list.List(["j", "j_in"]))
  let t839 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg()]))
  let t838 = @tactics.match_mp_tac(@iterate.sum_le())
  let t837 = @simp.asm_rewrite_tac(@list.List([@more_list.length_butlast()]))
  let t836 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t834 = @simp.rewrite_tac(@list.List([@realax.real_le_refl()]))
  let t833 = @tactics.disch_then(@tactics.match_mp_tac)
  let t830 = @drule.match_mp(interval_arith_abs_le())
  let t832 = @tactics.disch_then(fn(x831 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x827 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s828 = @tactics.mp_tac(x827)
      fn(x829 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s828(x829)
      }
    })(t830(x831))
  })
  let t826 = @simp.rewrite_tac(@list.List([@multivariate_taylor_compiled.partial2()]))
  let t825 = @list.List([@tactics.then_tac(@tactics.replicate_tac(3, @tactics.pop_assum(fn(x822 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s823 = @tactics.mp_tac(x822)
    fn(x824 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s823(x824)
    }
  })), @int.arith_tac), @tactics.all_tac])
  let t821 = @tactics.subgoal_then(@term_syntax.parse_term("1 + ((i : Num) - 1) == i && 1 + (i - 1) == i"), fn(x819 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x819
    @simp.rewrite_tac(@list.List([th_1]))
  })
  let t817 = @simp.asm_rewrite_tac(@list.List([]))
  let t818 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("1 <= (i : Num) && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))")), t817), @int.arith_tac), @tactics.all_tac])
  let t813 = @term_syntax.parse_term("(i : Num) - 1")
  let t816 = @tactics.disch_then(fn(x815 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x810 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s811 = @tactics.mp_tac(x810)
      fn(x812 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s811(x812)
      }
    })(((x814 : @kernel.Thm) => @bool.spec(t813, x814))(x815))
  })
  let t808 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t809 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.remove_then("i_in", fn(x805 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s806 = @tactics.mp_tac(x805)
    fn(x807 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s806(x807)
    }
  }), t808), @int.arith_tac), @tactics.all_tac])
  let t801 = @term_syntax.parse_term("(i : Num) - 1")
  let t804 = @tactics.disch_then(fn(x803 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x798 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s799 = @tactics.mp_tac(x798)
      fn(x800 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s799(x800)
      }
    })(((x802 : @kernel.Thm) => @bool.spec(t801, x802))(x803))
  })
  let t797 = @simp.asm_rewrite_tac(@list.List([all_n_el()]))
  let t793 = @term_syntax.parse_term("(x : Cart[Real, N])")
  let t796 = @tactics.first_x_assum(fn(x795 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x790 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s791 = @tactics.mp_tac(x790)
      fn(x792 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s791(x792)
      }
    })(((x794 : @kernel.Thm) => @bool.spec(t793, x794))(x795))
  })
  let t789 = @simp.asm_simp_tac(@list.List([]))
  let t788 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t787 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t786 = @tactics.remove_then("i_in", fn(x783 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s784 = @tactics.mp_tac(x783)
    fn(x785 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s784(x785)
    }
  })
  let t835 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl((x782 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), @lists.last_el(), x782), @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@equal.gsym(@lists.length_eq_nil())])), t786), t787), @int.arith_tac), @tactics.all_tac])), t788), t789), t796), t797), t804), @tactics.ants_tac), t809), t816), @tactics.ants_tac), t818), t821), t825), t826), t832), t833), t834), @tactics.all_tac])
  let t781 = @tactics.match_mp_tac(@real.real_le_add2())
  let t779 = @tactics.pop_assum(fn(x776 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s777 = @tactics.mp_tac(x776)
    fn(x778 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s777(x778)
    }
  })
  let t775 = @tactics.pop_assum(fn(x772 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s773 = @tactics.mp_tac(x772)
    fn(x774 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s773(x774)
    }
  })
  let t780 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@more_list.length_butlast()])), t775), t779), @int.arith_tac), @tactics.all_tac])
  let t771 = @simp.asm_rewrite_tac(@list.List([]))
  let t768 = @tactics.pop_assum(fn(x765 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s766 = @tactics.mp_tac(x765)
    fn(x767 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s766(x767)
    }
  })
  let t764 = @tactics.disch_then(fn(x762 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x762
    @simp.rewrite_tac(@list.List([th]))
  })
  let t760 = @tactics.pop_assum(fn(x757 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s758 = @tactics.mp_tac(x757)
    fn(x759 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s758(x759)
    }
  })
  let t761 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t760), @int.arith_tac), @tactics.all_tac])
  let t753 = @term_syntax.parse_term("(i : Num) - 1")
  let t756 = @tactics.disch_then(fn(x755 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x750 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s751 = @tactics.mp_tac(x750)
      fn(x752 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s751(x752)
      }
    })(((x754 : @kernel.Thm) => @bool.spec(t753, x754))(x755))
  })
  let t749 = @simp.rewrite_tac(@list.List([all_n_el()]))
  let t769 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.remove_then("ldd_all", fn(x746 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s747 = @tactics.mp_tac(x746)
    fn(x748 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s747(x748)
    }
  }), t749), t756), @tactics.ants_tac), t761), t764), t768), @int.arith_tac), @tactics.all_tac])
  let t745 = @tactics.subgoal_then(@term_syntax.parse_term("LENGTH(EL((i : Num) - 1, (dd_bounds_list : List[List[(Real, Real)]]))) == i"), fn(x742 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s743 = ((x741 : @kernel.Thm) => @tactics.label_tac("len_i", x741))(x742)
    fn(x744 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s743(x744)
    }
  })
  let t740 = @simp.asm_simp_tac(@list.List([]))
  let t739 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t736 = @simp.rewrite_rule(@list.List([@iterate.in_numseg()]))
  let t738 = @tactics.use_then("i_in", fn(x737 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x733 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s734 = @tactics.assume_tac(x733)
      fn(x735 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s734(x735)
      }
    })(t736(x737))
  })
  let t732 = @simp.asm_simp_tac(@list.List([vector_component()]))
  let t731 = @ssreflect.move_(@list.List(["i", "i_in"]))
  let t730 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg()]))
  let t729 = @tactics.match_mp_tac(@iterate.sum_le())
  let t728 = @simp.asm_rewrite_tac(@list.List([@arith.le_refl()]))
  let t726 = @simp.expand_tac("s")
  let t725 = @simp.asm_rewrite_tac(@list.List([]))
  let t724 = @tactics.exists_tac(@term_syntax.parse_term("(s : Real)"))
  let t723 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t721 = @simp.asm_simp_tac(@list.List([vector_component()]))
  let t720 = @simp.asm_rewrite_tac(@list.List([]))
  let t716 = @term_syntax.parse_term("(i : Num)")
  let t719 = @tactics.disch_then(fn(x718 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x713 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s714 = @tactics.mp_tac(x713)
      fn(x715 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s714(x715)
      }
    })(((x717 : @kernel.Thm) => @bool.spec(t716, x717))(x718))
  })
  let t712 = @simp.rewrite_tac(@list.List([@multivariate_taylor_compiled.m_cell_domain()]))
  let t710 = @tactics.remove_then("domain", fn(x707 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s708 = @tactics.mp_tac(x707)
    fn(x709 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s708(x709)
    }
  })
  let t722 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), t710), (x711 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), @taylor_interval_compiled.pair_eq(), x711)), t712), t719), t720), t721), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t706 = @tactics.subgoal_then(@term_syntax.parse_term("∀ i : Num, IN(i, op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) → real_of_num(0) <= EL(i - 1, (w : List[Real]))"), fn(x703 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s704 = ((x702 : @kernel.Thm) => @tactics.label_tac("w_ge0", x702))(x703)
    fn(x705 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s704(x705)
    }
  })
  let t701 = @ssreflect.move_(@list.List(["x", "x_in"]))
  let t700 = @simp.asm_simp_tac(@list.List([@multivariate_taylor_compiled.m_taylor_error_eq_v1()]))
  let t699 = @ssreflect.move_(@list.List(["domain", "d2f", "second", "lw", "ldd", "ldd_all", "s_le"]))
  let t697 = @term_syntax.parse_term("ITLIST2((_1 : (_, _, _) -> _), (_2 : List[_]), (_3 : List[_]), (_4 : _))")
  let t696 = @simp.rewrite_tac(@list.List([@multivariate_taylor_compiled.second_bounded()]))
  let t923 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t696), (x698 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.set_tac("s", t697, x698)), t699), t700), t701), t706), t722), t723), t724), t725), t726), (x727 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), itlist2_eq_sum(), x727)), t728), t729), t730), t731), t732), t738), t739), t740), t745), t769), (x770 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), itlist2_eq_sum(), x770)), t771), t780), t781), @tactics.conj_tac), t835), t836), @tactics.conj_tac), @list.List([@calc_rat.real_arith_tac, @tactics.all_tac])), t837), t838), t839), t840), t845), t854), t855), t861), t862), t863), t870), t871), t878), @tactics.ants_tac), t883), t890), @tactics.ants_tac), t895), t898), t902), t903), t909), t910), (x911 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), @more_list.el_butlast(), x911)), t921), t922)
  m_taylor_error_itlist2_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Real, ∀ domain : (Cart[Real, N], Cart[Real, N]), ∀ y : Cart[Real, N], ∀ w : List[Real], ∀ dd_bounds_list : List[List[(Real, Real)]], ∀ error : Real, (m_cell_domain : ((Cart[Real, N], Cart[Real, N]), Cart[Real, N], Cart[Real, N]) -> Bool)(domain, y, (vector : (List[Real]) -> Cart[Real, N])(w)) → (diff2c_domain : ((Cart[Real, N], Cart[Real, N]), (Cart[Real, N]) -> Real) -> Bool)(domain, f) → (second_bounded : ((Cart[Real, N]) -> Real, (Cart[Real, N], Cart[Real, N]), List[List[(Real, Real)]]) -> Bool)(f, domain, dd_bounds_list) → (LENGTH : (List[Real]) -> Num)(w) == (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → (LENGTH : (List[List[(Real, Real)]]) -> Num)(dd_bounds_list) == (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → (all_n : (Num, List[List[(Real, Real)]], (Num, List[(Real, Real)]) -> Bool) -> Bool)(1, dd_bounds_list, (i : Num) => (list : List[(Real, Real)]) => (LENGTH : (List[(Real, Real)]) -> Num)(list) == i) → (ITLIST2 : ((List[(Real, Real)], Real, Real) -> Real, List[List[(Real, Real)]], List[Real], Real) -> Real)((list : List[(Real, Real)]) => (x : Real) => (z : Real) => x * (x * iabs((LAST : (List[(Real, Real)]) -> (Real, Real))(list)) + real_of_num(2) * (ITLIST2 : (((Real, Real), Real, Real) -> Real, List[(Real, Real)], List[Real], Real) -> Real)((a : (Real, Real)) => (b : Real) => (c : Real) => b * iabs(a) + c, (BUTLAST : (List[(Real, Real)]) -> List[(Real, Real)])(list), w, real_of_num(0))) + z, dd_bounds_list, w, real_of_num(0)) <= error → (m_taylor_error : ((Cart[Real, N]) -> Real, (Cart[Real, N], Cart[Real, N]), Cart[Real, N], Real) -> Bool)(f, domain, (vector : (List[Real]) -> Cart[Real, N])(w), error)"), t923))
}

///|
let m_taylor_error_itlist2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("M_TAYLOR_ERROR_ITLIST2")

///|
/// `M_taylor.M_TAYLOR_ERROR_ITLIST2`
pub fn m_taylor_error_itlist2() -> @kernel.Thm {
  m_taylor_error_itlist2_c.get()
}

///|
/// M_TAYLOR_ERROR_ITLIST2_ALT
fn step_51() -> Unit raise {
  let t926 = @simp.asm_rewrite_tac(@list.List([]))
  let t925 = @tactics.mp_tac(@bool.spec_all(m_taylor_error_itlist2()))
  let t924 = @tactics.repeat_tac(@tactics.strip_tac)
  let t927 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@multivariate_taylor_compiled.m_taylor_interval()])), t924), t925), t926)
  m_taylor_error_itlist2_alt_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Real, ∀ domain : (Cart[Real, N], Cart[Real, N]), ∀ y : Cart[Real, N], ∀ w : List[Real], ∀ f_lo : Real, ∀ f_hi : Real, ∀ d_bounds_list : List[(Real, Real)], ∀ dd_bounds_list : List[List[(Real, Real)]], ∀ error : Real, (m_taylor_interval : ((Cart[Real, N]) -> Real, (Cart[Real, N], Cart[Real, N]), Cart[Real, N], Cart[Real, N], (Real, Real), List[(Real, Real)], List[List[(Real, Real)]]) -> Bool)(f, domain, y, (vector : (List[Real]) -> Cart[Real, N])(w), (f_lo, f_hi), d_bounds_list, dd_bounds_list) → (LENGTH : (List[Real]) -> Num)(w) == (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → (LENGTH : (List[List[(Real, Real)]]) -> Num)(dd_bounds_list) == (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → (all_n : (Num, List[List[(Real, Real)]], (Num, List[(Real, Real)]) -> Bool) -> Bool)(1, dd_bounds_list, (i : Num) => (list : List[(Real, Real)]) => (LENGTH : (List[(Real, Real)]) -> Num)(list) == i) → (ITLIST2 : ((List[(Real, Real)], Real, Real) -> Real, List[List[(Real, Real)]], List[Real], Real) -> Real)((list : List[(Real, Real)]) => (x : Real) => (z : Real) => x * (x * iabs((LAST : (List[(Real, Real)]) -> (Real, Real))(list)) + real_of_num(2) * (ITLIST2 : (((Real, Real), Real, Real) -> Real, List[(Real, Real)], List[Real], Real) -> Real)((a : (Real, Real)) => (b : Real) => (c : Real) => b * iabs(a) + c, (BUTLAST : (List[(Real, Real)]) -> List[(Real, Real)])(list), w, real_of_num(0))) + z, dd_bounds_list, w, real_of_num(0)) <= error → (m_taylor_error : ((Cart[Real, N]) -> Real, (Cart[Real, N], Cart[Real, N]), Cart[Real, N], Real) -> Bool)(f, domain, (vector : (List[Real]) -> Cart[Real, N])(w), error)"), t927))
}

///|
let m_taylor_error_itlist2_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("M_TAYLOR_ERROR_ITLIST2_ALT")

///|
/// `M_taylor.M_TAYLOR_ERROR_ITLIST2_ALT`
pub fn m_taylor_error_itlist2_alt() -> @kernel.Thm {
  m_taylor_error_itlist2_alt_c.get()
}

///|
/// M_TAYLOR_INTERVAL'
fn step_52() -> Unit raise {
  m_taylor_interval_p_c.set(my_rule(@multivariate_taylor_compiled.m_taylor_interval()))
}

///|
let m_taylor_interval_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("M_TAYLOR_INTERVAL'")

///|
/// `M_taylor.M_TAYLOR_INTERVAL'`
pub fn m_taylor_interval_p() -> @kernel.Thm {
  m_taylor_interval_p_c.get()
}

///|
/// `dest_m_taylor`
pub fn dest_m_taylor(x928 : @kernel.Term) -> ((@kernel.Term, @kernel.Term, @kernel.Term, @kernel.Term, @kernel.Term, @kernel.Term, @kernel.Term)) raise {
  let m_taylor_tm = x928
  let (ltm1, dd_bounds_list) = @kernel.dest_comb(m_taylor_tm)
  let (ltm2, d_bounds_list) = @kernel.dest_comb(ltm1)
  let (ltm3, f_bounds) = @kernel.dest_comb(ltm2)
  let (ltm4, w) = @kernel.dest_comb(ltm3)
  let (ltm5, y) = @kernel.dest_comb(ltm4)
  let (ltm6, domain) = @kernel.dest_comb(ltm5)
  (@kernel.rand(ltm6), domain, y, w, f_bounds, d_bounds_list, dd_bounds_list)
}

///|
/// `dest_m_taylor_thms`
pub fn dest_m_taylor_thms(x929 : Int64) -> ((@kernel.Thm) -> (@kernel.Thm, @kernel.Thm, @kernel.Thm, @kernel.Thm) raise) raise {
  let n = x929
  let (ty, xty, x_var, f_var, y_var, w_var, domain_var) = get_types_and_vars(n)
  fn(x931 : @kernel.Thm) -> (@kernel.Thm, @kernel.Thm, @kernel.Thm, @kernel.Thm) raise {
    let m_taylor_th = x931
    let (f, domain, y, w, f_bounds, d_bounds_list, dd_bounds_list) = dest_m_taylor(@kernel.concl(m_taylor_th))
    let th0 = ((x932 : @kernel.Thm) => @kernel.inst_rule(@list.List([(f, f_var), (domain, domain_var), (y, y_var), (w, w_var), (f_bounds, @misc_vars.f_bounds_var()), (d_bounds_list, @misc_vars.d_bounds_list_var()), (dd_bounds_list, @misc_vars.dd_bounds_list_var())]), x932))(((x933 : @kernel.Thm) => inst_first_type_var(ty, x933))(m_taylor_interval_p()))
    let th1 = @kernel.eq_mp(th0, m_taylor_th)
    match @bool.conjuncts_rule(th1) {
      More(domain_th, tail=More(d2_th, tail=More(lin_th, tail=More(second_th, tail=Empty)))) => (domain_th, d2_th, lin_th, second_th)
      _ => raise Failure("dest_m_taylor_thms")
    }
  }
}

///|
/// M_TAYLOR_BOUND'
fn step_53() -> Unit raise {
  let t1009 = @simp.rewrite_tac(@list.List([@realax.real_le_refl()]))
  let t1008 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1006 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t1007 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.pop_assum(fn(x1003 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1004 = @tactics.mp_tac(x1003)
    fn(x1005 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1004(x1005)
    }
  }), t1006), @int.arith_tac), @tactics.all_tac])
  let t1002 = @tactics.subgoal_then(@term_syntax.parse_term("1 + ((x : Num) - 1) == x"), fn(x1000 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1000
    @simp.rewrite_tac(@list.List([th]))
  })
  let t997 = @drule.match_mp(interval_arith_abs_le())
  let t999 = @tactics.disch_then(fn(x998 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x994 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s995 = @tactics.mp_tac(x994)
      fn(x996 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s995(x996)
      }
    })(t997(x998))
  })
  let t992 = @simp.asm_rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t993 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.pop_assum(fn(x989 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s990 = @tactics.mp_tac(x989)
    fn(x991 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s990(x991)
    }
  }), t992), @int.arith_tac), @tactics.all_tac])
  let t985 = @term_syntax.parse_term("(x : Num) - 1")
  let t988 = @tactics.first_x_assum(fn(x987 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x982 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s983 = @tactics.mp_tac(x982)
      fn(x984 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s983(x984)
      }
    })(((x986 : @kernel.Thm) => @bool.spec(t985, x986))(x987))
  })
  let t980 = @simp.asm_simp_tac(@list.List([vector_component()]))
  let t979 = @simp.asm_rewrite_tac(@list.List([]))
  let t975 = @term_syntax.parse_term("(x : Num)")
  let t978 = @tactics.disch_then(fn(x977 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x972 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s973 = @tactics.mp_tac(x972)
      fn(x974 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s973(x974)
      }
    })(((x976 : @kernel.Thm) => @bool.spec(t975, x976))(x977))
  })
  let t971 = @simp.rewrite_tac(@list.List([@multivariate_taylor_compiled.m_cell_domain()]))
  let t981 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("m_cell_domain((domain : (Cart[Real, N], Cart[Real, N])), (y : Cart[Real, N]), vector((w : List[Real])))")), (x970 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), @taylor_interval_compiled.pair_eq(), x970)), t971), t978), t979), t980), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t969 = @simp.asm_simp_tac(@list.List([vector_component(), @realax.real_le_refl(), @real.real_abs_pos()]))
  let t968 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t967 = @tactics.repeat_tac(@tactics.strip_tac)
  let t966 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg()]))
  let t965 = @tactics.match_mp_tac(@iterate.sum_le())
  let t964 = @simp.asm_rewrite_tac(@list.List([@arith.le_refl()]))
  let t962 = @simp.expand_tac("s")
  let t961 = @simp.asm_rewrite_tac(@list.List([]))
  let t960 = @tactics.exists_tac(@term_syntax.parse_term("(s : Real)"))
  let t959 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t958 = @simp.rewrite_tac(@list.List([@realax.real_le_refl()]))
  let t957 = @tactics.match_mp_tac(@real.real_le_add2())
  let t956 = @simp.rewrite_tac(@list.List([@realax.real_div(), @real.real_mul_ac()]))
  let t955 = @simp.asm_rewrite_tac(@list.List([]))
  let t954 = @tactics.exists_tac(@term_syntax.parse_term("(b : Real) + inv(real_of_num(2)) * (error : Real)"))
  let t953 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t952 = @simp.asm_rewrite_tac(@list.List([]))
  let t946 = @term_syntax.parse_term("(a : Real)")
  let t947 = @term_syntax.parse_term("(f_hi : Real)")
  let t948 = @term_syntax.parse_term("(f_lo : Real)")
  let t949 = @term_syntax.parse_term("(error : Real)")
  let t950 = @term_syntax.parse_term("(vector : (List[Real]) -> Cart[Real, N])((w : List[Real]))")
  let t951 = @tactics.map_every(fn(x943 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s944 = @tactics.exists_tac(x943)
    fn(x945 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s944(x945)
    }
  }, @list.List([@term_syntax.parse_term("(y : Cart[Real, N])"), t950, t949, t948, t947, t946]))
  let t940 = @simp.simp_tac(@list.List([@multivariate_taylor_compiled.diff2_domain(), @multivariate_taylor_compiled.diff2c_domain(), @multivariate_taylor_compiled.diff2c()]))
  let t941 = @list.List([@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("diff2c_domain((domain : (Cart[Real, N], Cart[Real, N])), (f : (Cart[Real, N]) -> Real))")), t940), @tactics.all_tac])
  let t939 = @tactics.subgoal_then(@term_syntax.parse_term("diff2_domain((domain : (Cart[Real, N], Cart[Real, N])), (f : (Cart[Real, N]) -> Real))"), fn(x936 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s937 = @tactics.assume_tac(x936)
    fn(x938 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s937(x938)
    }
  })
  let t934 = @term_syntax.parse_term("ITLIST2((_1 : (_, _, _) -> _), (_2 : List[_]), (_3 : List[_]), (_4 : _))")
  let t1010 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@multivariate_taylor_compiled.m_bounded_on_int()), @multivariate_taylor_compiled.m_taylor_interval(), @multivariate_taylor_compiled.m_lin_approx(), all_n_el()])), (x935 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.set_tac("s", t934, x935)), @tactics.strip_tac), t939), t941), (x942 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.apply_tac(@multivariate_taylor_compiled.m_taylor_bounds_v1(), x942)), t951), t952), t953), t954), t955), t956), t957), t958), t959), t960), t961), t962), (x963 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), itlist2_eq_sum(), x963)), t964), t965), t966), t967), t968), t969), @tactics.conj_tac), t981), t988), @tactics.ants_tac), t993), t999), t1002), t1007), t1008), t1009)
  m_taylor_bound_p_c.set(@tactics.prove(@term_syntax.parse_term("(m_taylor_interval : ((Cart[Real, N]) -> Real, (Cart[Real, N], Cart[Real, N]), Cart[Real, N], Cart[Real, N], (Real, Real), List[(Real, Real)], List[List[(Real, Real)]]) -> Bool)((f : (Cart[Real, N]) -> Real), (domain : (Cart[Real, N], Cart[Real, N])), (y : Cart[Real, N]), (vector : (List[Real]) -> Cart[Real, N])((w : List[Real])), ((f_lo : Real), (f_hi : Real)), (d_bounds_list : List[(Real, Real)]), (dd_bounds_list : List[List[(Real, Real)]])) && (m_taylor_error : ((Cart[Real, N]) -> Real, (Cart[Real, N], Cart[Real, N]), Cart[Real, N], Real) -> Bool)(f, domain, (vector : (List[Real]) -> Cart[Real, N])(w), (error : Real)) && (ITLIST2 : (((Real, Real), Real, Real) -> Real, List[(Real, Real)], List[Real], Real) -> Real)((a : (Real, Real)) => (b : Real) => (c : Real) => b * iabs(a) + c, d_bounds_list, w, real_of_num(0)) <= (b : Real) && b + inv(real_of_num(2)) * error <= (a : Real) && (lo : Real) <= f_lo - a && f_hi + a <= (hi : Real) && (LENGTH : (List[Real]) -> Num)(w) == (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && (LENGTH : (List[(Real, Real)]) -> Num)(d_bounds_list) == (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → (∀ x : Cart[Real, N], (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(x, (interval : (List[(Cart[Real, N], Cart[Real, N])], Cart[Real, N]) -> Bool)([domain])) → interval_arith(f(x), (lo, hi)))"), t1010))
}

///|
let m_taylor_bound_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("M_TAYLOR_BOUND'")

///|
/// `M_taylor.M_TAYLOR_BOUND'`
pub fn m_taylor_bound_p() -> @kernel.Thm {
  m_taylor_bound_p_c.get()
}

///|
/// M_TAYLOR_UPPER_BOUND'
fn step_54() -> Unit raise {
  let t1012 = @simp.asm_simp_tac(@list.List([@interval_arith.interval_arith(), @realax.real_le_refl()]))
  let t1011 = @term_syntax.parse_term("(lo : Real)")
  let t1013 = @tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @tactics.mp_tac(@kernel.inst_rule(@list.List([(@term_syntax.parse_term("(f_lo : Real) - (a : Real)"), t1011)]), m_taylor_bound_p()))), t1012)
  m_taylor_upper_bound_p_c.set(@tactics.prove(@term_syntax.parse_term("(m_taylor_interval : ((Cart[Real, N]) -> Real, (Cart[Real, N], Cart[Real, N]), Cart[Real, N], Cart[Real, N], (Real, Real), List[(Real, Real)], List[List[(Real, Real)]]) -> Bool)((f : (Cart[Real, N]) -> Real), (domain : (Cart[Real, N], Cart[Real, N])), (y : Cart[Real, N]), (vector : (List[Real]) -> Cart[Real, N])((w : List[Real])), ((f_lo : Real), (f_hi : Real)), (d_bounds_list : List[(Real, Real)]), (dd_bounds_list : List[List[(Real, Real)]])) && (m_taylor_error : ((Cart[Real, N]) -> Real, (Cart[Real, N], Cart[Real, N]), Cart[Real, N], Real) -> Bool)(f, domain, (vector : (List[Real]) -> Cart[Real, N])(w), (error : Real)) && (ITLIST2 : (((Real, Real), Real, Real) -> Real, List[(Real, Real)], List[Real], Real) -> Real)((a : (Real, Real)) => (b : Real) => (c : Real) => b * iabs(a) + c, d_bounds_list, w, real_of_num(0)) <= (b : Real) && b + inv(real_of_num(2)) * error <= (a : Real) && f_hi + a <= (hi : Real) && (LENGTH : (List[Real]) -> Num)(w) == (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && (LENGTH : (List[(Real, Real)]) -> Num)(d_bounds_list) == (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → (∀ p : Cart[Real, N], (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(p, (interval : (List[(Cart[Real, N], Cart[Real, N])], Cart[Real, N]) -> Bool)([domain])) → f(p) <= hi)"), t1013))
}

///|
let m_taylor_upper_bound_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("M_TAYLOR_UPPER_BOUND'")

///|
/// `M_taylor.M_TAYLOR_UPPER_BOUND'`
pub fn m_taylor_upper_bound_p() -> @kernel.Thm {
  m_taylor_upper_bound_p_c.get()
}

///|
/// M_TAYLOR_LOWER_BOUND'
fn step_55() -> Unit raise {
  let t1015 = @simp.asm_simp_tac(@list.List([@interval_arith.interval_arith(), @realax.real_le_refl()]))
  let t1014 = @term_syntax.parse_term("(hi : Real)")
  let t1016 = @tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @tactics.mp_tac(@kernel.inst_rule(@list.List([(@term_syntax.parse_term("(f_hi : Real) + (a : Real)"), t1014)]), m_taylor_bound_p()))), t1015)
  m_taylor_lower_bound_p_c.set(@tactics.prove(@term_syntax.parse_term("(m_taylor_interval : ((Cart[Real, N]) -> Real, (Cart[Real, N], Cart[Real, N]), Cart[Real, N], Cart[Real, N], (Real, Real), List[(Real, Real)], List[List[(Real, Real)]]) -> Bool)((f : (Cart[Real, N]) -> Real), (domain : (Cart[Real, N], Cart[Real, N])), (y : Cart[Real, N]), (vector : (List[Real]) -> Cart[Real, N])((w : List[Real])), ((f_lo : Real), (f_hi : Real)), (d_bounds_list : List[(Real, Real)]), (dd_bounds_list : List[List[(Real, Real)]])) && (m_taylor_error : ((Cart[Real, N]) -> Real, (Cart[Real, N], Cart[Real, N]), Cart[Real, N], Real) -> Bool)(f, domain, (vector : (List[Real]) -> Cart[Real, N])(w), (error : Real)) && (ITLIST2 : (((Real, Real), Real, Real) -> Real, List[(Real, Real)], List[Real], Real) -> Real)((a : (Real, Real)) => (b : Real) => (c : Real) => b * iabs(a) + c, d_bounds_list, w, real_of_num(0)) <= (b : Real) && b + inv(real_of_num(2)) * error <= (a : Real) && (lo : Real) <= f_lo - a && (LENGTH : (List[Real]) -> Num)(w) == (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && (LENGTH : (List[(Real, Real)]) -> Num)(d_bounds_list) == (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → (∀ p : Cart[Real, N], (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(p, (interval : (List[(Cart[Real, N], Cart[Real, N])], Cart[Real, N]) -> Bool)([domain])) → lo <= f(p))"), t1016))
}

///|
let m_taylor_lower_bound_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("M_TAYLOR_LOWER_BOUND'")

///|
/// `M_taylor.M_TAYLOR_LOWER_BOUND'`
pub fn m_taylor_lower_bound_p() -> @kernel.Thm {
  m_taylor_lower_bound_p_c.get()
}

///|
/// `gen_taylor_bound_th`
pub fn gen_taylor_bound_th(x1017 : @kernel.Thm, x1018 : Int64) -> @kernel.Thm raise {
  let bound_th = x1017
  let n = x1018
  let t1020 = @simp.rewrite_rule(@list.List([my_rule(m_taylor_error_itlist2_alt())]))
  let th0 = (fn(x1019 : @kernel.Thm) -> @kernel.Thm raise {
    @bool.disch_all(my_rule(x1019))
  })(t1020(bound_th))
  let ns = @lib.range(1L, n)
  let mk_list_hd : (@list.List[@kernel.Term]) -> @kernel.Term raise = fn(x1021 : @list.List[@kernel.Term]) -> @kernel.Term raise {
    let l = x1021
    @lists.mk_list(l, @kernel.type_of(@lib.hd(l)))
  }
  let w_list = mk_list_hd(@lib.map(fn(x1022 : Int64) -> @kernel.Term raise {
    let i = x1022
    @lib.array_get(w_vars_array(), @lib.int63_to_int(i))
  }, ns))
  let d_bounds_list = mk_list_hd(@lib.map(fn(x1023 : Int64) -> @kernel.Term raise {
    let i_1 = x1023
    @lib.array_get(df_vars_array(), @lib.int63_to_int(i_1))
  }, ns))
  let dd_bounds_list = mk_list_hd(@lib.map(fn(x1024 : Int64) -> @kernel.Term raise {
    let i_2 = x1024
    mk_list_hd(@lib.map(fn(x1025 : Int64) -> @kernel.Term raise {
      let j = x1025
      @lib.array_get(@lib.array_get(dd_vars_array(), @lib.int63_to_int(i_2)), @lib.int63_to_int(j))
    }, @lib.range(1L, i_2)))
  }, ns))
  let t1027 = @list.List([(@lib.array_get(n_type_array(), @lib.int63_to_int(n)), @misc_vars.nty())])
  let th1 = ((x1026 : @kernel.Thm) => @kernel.inst_rule(@list.List([(w_list, @misc_vars.w_var_real_list()), (d_bounds_list, @misc_vars.d_bounds_list_var()), (dd_bounds_list, @misc_vars.dd_bounds_list_var())]), x1026))((fn(x1029 : @kernel.Thm) -> @kernel.Thm raise {
    ((x1028 : @kernel.Thm) => @kernel.inst_type(t1027, x1028))(x1029)
  })(th0))
  let th2 = @simp.rewrite_rule(@list.List([@lists.last(), @lists.not_cons_nil(), @lists.butlast(), @multivariate_taylor_compiled.all_n(), @lists.itlist2_def(), @lists.length(), @calc_num.arith(), @lib.array_get(dimindex_array(), @lib.int63_to_int(n))]))(th1)
  let th3 = @simp.rewrite_rule(@list.List([@lists.hd(), @lists.tl(), @calc_int.real_mul_rzero(), @calc_int.real_add_rid(), @equal.gsym(@list_float.error_mul_f2())]))(th2)
  let t1030 = @simp.rewrite_rule(@list.List([@more_float.float_inv2_th(), @equal.sym(@more_float.float2_eq())]))
  my_rule(t1030(th3))
}

///|
/// m_taylor_upper_array
fn step_56() -> Unit raise {
  m_taylor_upper_array_c.set(@lib.array_init(@lib.add63(max_dim(), 1L), fn(x1031 : Int64) -> @kernel.Thm raise {
    let i = x1031
    if (i < 1L) {
      @bool.truth()
    } else {
      gen_taylor_bound_th(m_taylor_upper_bound_p(), i)
    }
  }))
}

///|
let m_taylor_upper_array_c : @lib.Cell[FixedArray[@kernel.Thm]] = @lib.Cell::new("m_taylor_upper_array")

///|
/// `M_taylor.m_taylor_upper_array`
pub fn m_taylor_upper_array() -> FixedArray[@kernel.Thm] {
  m_taylor_upper_array_c.get()
}

///|
/// m_taylor_lower_array
fn step_57() -> Unit raise {
  m_taylor_lower_array_c.set(@lib.array_init(@lib.add63(max_dim(), 1L), fn(x1032 : Int64) -> @kernel.Thm raise {
    let i = x1032
    if (i < 1L) {
      @bool.truth()
    } else {
      gen_taylor_bound_th(m_taylor_lower_bound_p(), i)
    }
  }))
}

///|
let m_taylor_lower_array_c : @lib.Cell[FixedArray[@kernel.Thm]] = @lib.Cell::new("m_taylor_lower_array")

///|
/// `M_taylor.m_taylor_lower_array`
pub fn m_taylor_lower_array() -> FixedArray[@kernel.Thm] {
  m_taylor_lower_array_c.get()
}

///|
/// m_taylor_bound_array
fn step_58() -> Unit raise {
  m_taylor_bound_array_c.set(@lib.array_init(@lib.add63(max_dim(), 1L), fn(x1033 : Int64) -> @kernel.Thm raise {
    let i = x1033
    if (i < 1L) {
      @bool.truth()
    } else {
      gen_taylor_bound_th(m_taylor_bound_p(), i)
    }
  }))
}

///|
let m_taylor_bound_array_c : @lib.Cell[FixedArray[@kernel.Thm]] = @lib.Cell::new("m_taylor_bound_array")

///|
/// `M_taylor.m_taylor_bound_array`
pub fn m_taylor_bound_array() -> FixedArray[@kernel.Thm] {
  m_taylor_bound_array_c.get()
}

///|
/// `eval_m_taylor_bounds0`
pub fn eval_m_taylor_bounds0(x1034 : String, x1035 : Int64, x1036 : Int64, x1037 : @kernel.Thm) -> @kernel.Thm raise {
  let mode = x1034
  let n = x1035
  let pp = x1036
  let m_taylor_th = x1037
  let bound_th = if (mode == "upper") {
    @lib.array_get(m_taylor_upper_array(), @lib.int63_to_int(n))
  } else {
    if (mode == "bound") {
      @lib.array_get(m_taylor_bound_array(), @lib.int63_to_int(n))
    } else {
      @lib.array_get(m_taylor_lower_array(), @lib.int63_to_int(n))
    }
  }
  let (f_tm, domain_tm, y_tm, w_tm, f_bounds, d_bounds_list, dd_bounds_list) = dest_m_taylor(@kernel.concl(m_taylor_th))
  let (f_lo, f_hi) = @pair.dest_pair(f_bounds)
  let ws = @basics.dest_list(@kernel.rand(w_tm))
  let dfs = @basics.dest_list(d_bounds_list)
  let dds = @lib.map(@basics.dest_list, @basics.dest_list(dd_bounds_list))
  let ns = @lib.range(1L, n)
  let df_vars = @lib.map(fn(x1038 : Int64) -> @kernel.Term raise {
    let i = x1038
    @lib.array_get(df_vars_array(), @lib.int63_to_int(i))
  }, ns)
  let dd_vars = @lib.map(fn(x1039 : Int64) -> @list.List[@kernel.Term] raise {
    let i_1 = x1039
    @lib.map(fn(x1040 : Int64) -> @kernel.Term raise {
      let j = x1040
      @lib.array_get(@lib.array_get(dd_vars_array(), @lib.int63_to_int(i_1)), @lib.int63_to_int(j))
    }, @lib.range(1L, i_1))
  }, ns)
  let w_vars = @lib.map(fn(x1041 : Int64) -> @kernel.Term raise {
    let i_2 = x1041
    @lib.array_get(w_vars_array(), @lib.int63_to_int(i_2))
  }, ns)
  let y_var = @kernel.mk_var("y", @kernel.type_of(y_tm))
  let f_var = @kernel.mk_var("f", @kernel.type_of(f_tm))
  let domain_var = @kernel.mk_var("domain", @kernel.type_of(domain_tm))
  let mul_wd = @lib.map2((x1042 : @kernel.Term, x1043 : @kernel.Term) => @list_float.error_mul_f2_le_conv2(pp, x1042, x1043), ws, dfs)
  let d_th = @lib.end_itlist((x1044 : @kernel.Thm, x1045 : @kernel.Thm) => @more_float.add_ineq_hi_v1(pp, x1044, x1045), mul_wd)
  let b_tm = @kernel.rand((fn(x1046 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x1046)
  })(d_th))
  let (op_star, op_plus) = (fn(x1049 : @kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x1050 : @kernel.Thm) -> @kernel.Thm raise {
      ((x1047 : @kernel.Term, x1048 : @kernel.Thm) => @more_float.mul_ineq_pos_const_hi_v1(pp, x1047, x1048))(x1049, x1050)
    }
  }, fn(x1053 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x1054 : @kernel.Thm) -> @kernel.Thm raise {
      ((x1051 : @kernel.Thm, x1052 : @kernel.Thm) => @more_float.add_ineq_hi_v1(pp, x1051, x1052))(x1053, x1054)
    }
  })
  let mul_wdd = @lib.map2(fn(x1055 : @list.List[@kernel.Term], x1056 : Int64) -> @list.List[@kernel.Thm] raise {
    let list = x1055
    let i_3 = x1056
    @misc_functions.my_map2(fn(x1059 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      fn(x1060 : @kernel.Term) -> @kernel.Thm raise {
        ((x1057 : @kernel.Term, x1058 : @kernel.Term) => @list_float.error_mul_f2_le_conv2(pp, x1057, x1058))(x1059, x1060)
      }
    }, ws, list)
  }, dds, ns)
  let sums1 = @lib.map(fn(x1065 : @list.List[@kernel.Thm]) -> @kernel.Thm raise {
    ((x1064 : @list.List[@kernel.Thm]) => @lib.end_itlist(fn(x1061 : @kernel.Thm, x1062 : @kernel.Thm) -> @kernel.Thm raise {
      let s1063 = op_plus(x1061)
      s1063(x1062)
    }, x1064))(@lib.butlast(x1065))
  }, @lib.tl(mul_wdd))
  let t1069 = @lib.map2(fn(x1066 : @list.List[@kernel.Thm], x1067 : @kernel.Thm) -> @kernel.Thm raise {
    let list_1 = x1066
    let th1 = x1067
    let t1068 = op_star(@more_float.two_float())(th1)
    op_plus(@lib.last(list_1))(t1068)
  }, @lib.tl(mul_wdd), sums1)
  let sums2 = t1069.prepend(@lib.hd(@lib.hd(mul_wdd)))
  let sums = @lib.map2(fn(x1070 : @kernel.Term, x1071 : @kernel.Thm) -> @kernel.Thm raise {
    let s1072 = op_star(x1070)
    s1072(x1071)
  }, ws, sums2)
  let dd_th = @lib.end_itlist(fn(x1073 : @kernel.Thm, x1074 : @kernel.Thm) -> @kernel.Thm raise {
    let s1075 = op_plus(x1073)
    s1075(x1074)
  }, sums)
  let error_tm = @kernel.rand((fn(x1076 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x1076)
  })(dd_th))
  let (op_star_1, op_plus_1) = (@arith_float.float_mul_hi_v1(pp), fn(x1079 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x1080 : @kernel.Thm) -> @kernel.Thm raise {
      ((x1077 : @kernel.Thm, x1078 : @kernel.Thm) => @more_float.add_ineq_hi_v1(pp, x1077, x1078))(x1079, x1080)
    }
  })
  let t1081 = op_star_1(@more_float.float_inv2())(error_tm)
  let ineq1_th = op_plus_1(@more_float.mk_refl_ineq(b_tm))(t1081)
  let a_tm = @kernel.rand((fn(x1082 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x1082)
  })(ineq1_th))
  let (prove_ineq2, bounds_inst) = if (mode == "upper") {
    let ineq2 = @arith_float.float_add_hi_v1(pp)(f_hi)(a_tm)
    ((x1083 : @kernel.Thm) => @misc_functions.my_prove_hyp(ineq2, x1083), @list.List([(@kernel.rand((fn(x1084 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x1084)
    })(ineq2)), @misc_vars.hi_var_real())]))
  } else {
    if (mode == "bound") {
      let ineq2_1 = @arith_float.float_add_hi_v1(pp)(f_hi)(a_tm)
      let ineq3 = @arith_float.float_sub_lo_v1(pp)(f_lo)(a_tm)
      let t1090 = (@equal.lhand((fn(x1089 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x1089)
      })(ineq3)), @misc_vars.lo_var_real())
      (fn(x1087 : @kernel.Thm) -> @kernel.Thm raise {
        ((x1085 : @kernel.Thm) => @misc_functions.my_prove_hyp(ineq2_1, x1085))(((x1086 : @kernel.Thm) => @misc_functions.my_prove_hyp(ineq3, x1086))(x1087))
      }, @list.List([(@kernel.rand((fn(x1088 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x1088)
      })(ineq2_1)), @misc_vars.hi_var_real()), t1090]))
    } else {
      let ineq2_2 = @arith_float.float_sub_lo_v1(pp)(f_lo)(a_tm)
      ((x1091 : @kernel.Thm) => @misc_functions.my_prove_hyp(ineq2_2, x1091), @list.List([(@equal.lhand((fn(x1092 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x1092)
      })(ineq2_2)), @misc_vars.lo_var_real())]))
    }
  }
  let inst1 = @lib.zip(dfs, df_vars)
  let t1093 = @lib.flat(dd_vars)
  let inst2 = @lib.zip(@lib.flat(dds), t1093)
  let inst3 = @lib.zip(ws, w_vars)
  let inst_list = inst1.concat(inst2.concat(inst3))
  (fn(x1101 : @kernel.Thm) -> @kernel.Thm raise {
    (fn(x1100 : @kernel.Thm) -> @kernel.Thm raise {
      (fn(x1098 : @kernel.Thm) -> @kernel.Thm raise {
        (fn(x1096 : @kernel.Thm) -> @kernel.Thm raise {
          ((x1094 : @kernel.Thm) => @misc_functions.my_prove_hyp(m_taylor_th, x1094))(((x1095 : @kernel.Thm) => @misc_functions.my_prove_hyp(dd_th, x1095))(x1096))
        })(((x1097 : @kernel.Thm) => @misc_functions.my_prove_hyp(d_th, x1097))(x1098))
      })(((x1099 : @kernel.Thm) => @misc_functions.my_prove_hyp(ineq1_th, x1099))(x1100))
    })(prove_ineq2(x1101))
  })(((x1102 : @kernel.Thm) => @kernel.inst_rule((@list.List([(f_hi, @misc_vars.f_hi_var()), (f_lo, @misc_vars.f_lo_var()), (error_tm, @misc_vars.error_var()), (a_tm, @misc_vars.a_var_real()), (b_tm, @misc_vars.b_var_real()), (y_tm, y_var), (domain_tm, domain_var), (f_tm, f_var)])).concat(bounds_inst.concat(inst_list)), x1102))(bound_th))
}

///|
/// eval_m_taylor_upper_bound
fn step_59() -> Unit raise {
  eval_m_taylor_upper_bound_c.set(fn(x1106 : Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise {
    fn(x1107 : Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
      fn(x1108 : @kernel.Thm) -> @kernel.Thm raise {
        ((x1103 : Int64, x1104 : Int64, x1105 : @kernel.Thm) => eval_m_taylor_bounds0("upper", x1103, x1104, x1105))(x1106, x1107, x1108)
      }
    }
  })
}

///|
let eval_m_taylor_upper_bound_c : @lib.Cell[(Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise] = @lib.Cell::new("eval_m_taylor_upper_bound")

///|
/// `eval_m_taylor_upper_bound`
pub fn eval_m_taylor_upper_bound(x : Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise {
  (eval_m_taylor_upper_bound_c.get())(x)
}

///|
/// eval_m_taylor_lower_bound
fn step_60() -> Unit raise {
  eval_m_taylor_lower_bound_c.set(fn(x1112 : Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise {
    fn(x1113 : Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
      fn(x1114 : @kernel.Thm) -> @kernel.Thm raise {
        ((x1109 : Int64, x1110 : Int64, x1111 : @kernel.Thm) => eval_m_taylor_bounds0("lower", x1109, x1110, x1111))(x1112, x1113, x1114)
      }
    }
  })
}

///|
let eval_m_taylor_lower_bound_c : @lib.Cell[(Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise] = @lib.Cell::new("eval_m_taylor_lower_bound")

///|
/// `eval_m_taylor_lower_bound`
pub fn eval_m_taylor_lower_bound(x : Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise {
  (eval_m_taylor_lower_bound_c.get())(x)
}

///|
/// eval_m_taylor_bound
fn step_61() -> Unit raise {
  eval_m_taylor_bound_c.set(fn(x1118 : Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise {
    fn(x1119 : Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
      fn(x1120 : @kernel.Thm) -> @kernel.Thm raise {
        ((x1115 : Int64, x1116 : Int64, x1117 : @kernel.Thm) => eval_m_taylor_bounds0("bound", x1115, x1116, x1117))(x1118, x1119, x1120)
      }
    }
  })
}

///|
let eval_m_taylor_bound_c : @lib.Cell[(Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise] = @lib.Cell::new("eval_m_taylor_bound")

///|
/// `eval_m_taylor_bound`
pub fn eval_m_taylor_bound(x : Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise {
  (eval_m_taylor_bound_c.get())(x)
}

///|
/// M_TAYLOR_PARTIAL_BOUND'
fn step_62() -> Unit raise {
  let t1219 = @simp.rewrite_tac(@list.List([@realax.real_le_refl()]))
  let t1218 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1216 = @simp.asm_simp_tac(@list.List([@multivariate_taylor_compiled.diff2c_domain()]))
  let t1217 = @list.List([@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("diff2c_domain((domain : (Cart[Real, N], Cart[Real, N])), (f : (Cart[Real, N]) -> Real))")), t1216), @tactics.all_tac])
  let t1213 = @simp.rewrite_tac(@list.List([@realax.real_le_refl()]))
  let t1214 = @tactics.try_tac(@tactics.then_tac(@tactics.disch_then(@tactics.match_mp_tac), t1213))
  let t1210 = @drule.match_mp(interval_arith_abs_le())
  let t1212 = @tactics.disch_then(fn(x1211 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1207 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1208 = @tactics.mp_tac(x1207)
      fn(x1209 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1208(x1209)
      }
    })(t1210(x1211))
  })
  let t1205 = @equal.gsym(@multivariate_taylor_compiled.partial2())
  let t1206 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("∀ i : Num, 1 <= i → 1 + (i - 1) == i")), t1205]))
  let t1204 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("1 <= (j : Num) && j <= (n : Num) → j - 1 < n"))]))
  let t1203 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t1202 = @tactics.pop_assum(fn(x1199 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1200 = @tactics.mp_tac(x1199)
    fn(x1201 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1200(x1201)
    }
  })
  let t1195 = @term_syntax.parse_term("(j : Num) - 1")
  let t1198 = @tactics.disch_then(fn(x1197 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1192 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1193 = @tactics.mp_tac(x1192)
      fn(x1194 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1193(x1194)
      }
    })(((x1196 : @kernel.Thm) => @bool.spec(t1195, x1196))(x1197))
  })
  let t1191 = @simp.asm_rewrite_tac(@list.List([]))
  let t1187 = @term_syntax.parse_term("(x : Cart[Real, N])")
  let t1190 = @tactics.first_x_assum(fn(x1189 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1184 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1185 = @tactics.mp_tac(x1184)
      fn(x1186 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1185(x1186)
      }
    })(((x1188 : @kernel.Thm) => @bool.spec(t1187, x1188))(x1189))
  })
  let t1182 = @simp.asm_simp_tac(@list.List([vector_component()]))
  let t1181 = @simp.asm_rewrite_tac(@list.List([]))
  let t1177 = @term_syntax.parse_term("(j : Num)")
  let t1180 = @tactics.disch_then(fn(x1179 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1174 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1175 = @tactics.mp_tac(x1174)
      fn(x1176 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1175(x1176)
      }
    })(((x1178 : @kernel.Thm) => @bool.spec(t1177, x1178))(x1179))
  })
  let t1173 = @simp.rewrite_tac(@list.List([@multivariate_taylor_compiled.m_cell_domain()]))
  let t1183 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("m_cell_domain((domain : (Cart[Real, N], Cart[Real, N])), (y : Cart[Real, N]), vector((w : List[Real])))")), (x1172 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), @taylor_interval_compiled.pair_eq(), x1172)), t1173), t1180), t1181), t1182), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t1171 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t1170 = @simp.asm_simp_tac(@list.List([vector_component()]))
  let t1169 = @ssreflect.move_(@list.List(["j", "j_in"]))
  let t1168 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg()]))
  let t1167 = @tactics.match_mp_tac(@iterate.sum_le())
  let t1166 = @simp.asm_rewrite_tac(@list.List([@arith.le_refl()]))
  let t1164 = @simp.expand_tac("s")
  let t1163 = @simp.asm_rewrite_tac(@list.List([]))
  let t1162 = @tactics.exists_tac(@term_syntax.parse_term("(s : Real)"))
  let t1161 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t1160 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1159 = @simp.rewrite_tac(@list.List([@multivariate_taylor_compiled.m_taylor_partial_error()]))
  let t1158 = @tactics.disch_then(fn(x1156 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1156
    @tactics.all_tac
  })
  let t1155 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("1 <= (i : Num) → 1 + (i - 1) == i")), @interval_arith.interval_arith()]))
  let t1154 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("1 <= (i : Num) && i <= (n : Num) → i - 1 < n"))]))
  let t1150 = @term_syntax.parse_term("(i : Num) - 1")
  let t1153 = @tactics.first_x_assum(fn(x1152 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1147 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1148 = @tactics.mp_tac(x1147)
      fn(x1149 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1148(x1149)
      }
    })(((x1151 : @kernel.Thm) => @bool.spec(t1150, x1151))(x1152))
  })
  let t1146 = @simp.asm_rewrite_tac(@list.List([]))
  let t1141 = @term_syntax.parse_term("(df_hi : Real)")
  let t1142 = @term_syntax.parse_term("(df_lo : Real)")
  let t1143 = @term_syntax.parse_term("(error : Real)")
  let t1144 = @term_syntax.parse_term("(vector : (List[Real]) -> Cart[Real, N])((w : List[Real]))")
  let t1145 = @tactics.map_every(fn(x1138 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1139 = @tactics.exists_tac(x1138)
    fn(x1140 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1139(x1140)
    }
  }, @list.List([@term_syntax.parse_term("(y : Cart[Real, N])"), t1144, t1143, t1142, t1141]))
  let t1136 = @simp.rewrite_tac(@list.List([@class.eta_ax()]))
  let t1134 = @simp.simp_tac(@list.List([@multivariate_taylor_compiled.diff2_domain(), @multivariate_taylor_compiled.diff2c_domain(), @multivariate_taylor_compiled.diff2c()]))
  let t1135 = @list.List([@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("diff2c_domain((domain : (Cart[Real, N], Cart[Real, N])), (f : (Cart[Real, N]) -> Real))")), t1134), @tactics.all_tac])
  let t1133 = @tactics.subgoal_then(@term_syntax.parse_term("diff2_domain((domain : (Cart[Real, N], Cart[Real, N])), (f : (Cart[Real, N]) -> Real))"), fn(x1130 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1131 = @tactics.assume_tac(x1130)
    fn(x1132 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1131(x1132)
    }
  })
  let t1129 = @list.List([@simp.asm_rewrite_tac(@list.List([@equal.gsym(@iterate.in_numseg())])), @tactics.all_tac])
  let t1128 = @tactics.subgoal_then(@term_syntax.parse_term("1 <= (i : Num) && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))"), fn(x1125 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1126 = ((x1124 : @kernel.Thm) => @tactics.label_tac("i_in", x1124))(x1125)
    fn(x1127 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1126(x1127)
    }
  })
  let t1123 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1121 = @term_syntax.parse_term("ITLIST2((_1 : (_, _, _) -> _), (_2 : List[_]), (_3 : List[_]), (_4 : _))")
  let t1220 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@multivariate_taylor_compiled.m_taylor_interval(), @multivariate_taylor_compiled.m_lin_approx(), all_n_el(), @equal.gsym(@multivariate_taylor_compiled.m_bounded_on_int())])), (x1122 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.set_tac("s", t1121, x1122)), t1123), t1128), t1129), t1133), t1135), t1136), (x1137 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.apply_tac(@multivariate_taylor_compiled.m_taylor_partial_bounds_v1(), x1137)), t1145), t1146), t1153), t1154), t1155), t1158), t1159), t1160), t1161), t1162), t1163), t1164), (x1165 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), itlist2_eq_sum(), x1165)), t1166), t1167), t1168), t1169), t1170), t1171), @tactics.conj_tac), t1183), t1190), t1191), t1198), t1202), t1203), @tactics.disch_tac), t1204), t1206), t1212), @class.cond_cases_tac), t1214), (x1215 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @ssreflect.new_rewrite(@list.List([]), @list.List([]), @multivariate_taylor_compiled.mixed_second_partials_v1(), x1215)), t1217), t1218), t1219)
  m_taylor_partial_bound_p_c.set(@tactics.prove(@term_syntax.parse_term("(m_taylor_interval : ((Cart[Real, N]) -> Real, (Cart[Real, N], Cart[Real, N]), Cart[Real, N], Cart[Real, N], (Real, Real), List[(Real, Real)], List[List[(Real, Real)]]) -> Bool)((f : (Cart[Real, N]) -> Real), (domain : (Cart[Real, N], Cart[Real, N])), (y : Cart[Real, N]), (vector : (List[Real]) -> Cart[Real, N])((w : List[Real])), (f_bounds : (Real, Real)), (d_bounds_list : List[(Real, Real)]), (dd_bounds_list : List[List[(Real, Real)]])) && (IN : (Num, (Num) -> Bool) -> Bool)((i : Num), op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) && (EL : (Num, List[(Real, Real)]) -> (Real, Real))(i - 1, d_bounds_list) == ((df_lo : Real), (df_hi : Real)) && (∀ x : Cart[Real, N], (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(x, (interval : (List[(Cart[Real, N], Cart[Real, N])], Cart[Real, N]) -> Bool)([domain])) → (all_n : (Num, List[(Real, Real)], (Num, (Real, Real)) -> Bool) -> Bool)(1, (dd_list : List[(Real, Real)]), (j : Num) => (int : (Real, Real)) => interval_arith(if j <= i { (partial2 : (Num, Num, (Cart[Real, N]) -> Real, Cart[Real, N]) -> Real)(j, i, f, x) } else { (partial2 : (Num, Num, (Cart[Real, N]) -> Real, Cart[Real, N]) -> Real)(i, j, f, x) }, int))) && (LENGTH : (List[(Real, Real)]) -> Num)(dd_list) == (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && (LENGTH : (List[(Real, Real)]) -> Num)(d_bounds_list) == (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && (LENGTH : (List[Real]) -> Num)(w) == (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && (ITLIST2 : (((Real, Real), Real, Real) -> Real, List[(Real, Real)], List[Real], Real) -> Real)((a : (Real, Real)) => (b : Real) => (c : Real) => b * iabs(a) + c, dd_list, w, real_of_num(0)) <= (error : Real) && df_hi + error <= (hi : Real) → (lo : Real) <= df_lo - error → (∀ x : Cart[Real, N], (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(x, (interval : (List[(Cart[Real, N], Cart[Real, N])], Cart[Real, N]) -> Bool)([domain])) → interval_arith((partial : (Num, (Cart[Real, N]) -> Real, Cart[Real, N]) -> Real)(i, f, x), (lo, hi)))"), t1220))
}

///|
let m_taylor_partial_bound_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("M_TAYLOR_PARTIAL_BOUND'")

///|
/// `M_taylor.M_TAYLOR_PARTIAL_BOUND'`
pub fn m_taylor_partial_bound_p() -> @kernel.Thm {
  m_taylor_partial_bound_p_c.get()
}

///|
/// M_TAYLOR_PARTIAL_UPPER'
fn step_63() -> Unit raise {
  let t1224 = @simp.asm_simp_tac(@list.List([@interval_arith.interval_arith()]))
  let t1223 = @simp.asm_rewrite_tac(@list.List([@realax.real_le_refl()]))
  let t1221 = @term_syntax.parse_term("(lo : Real)")
  let t1222 = @tactics.mp_tac(@kernel.inst_rule(@list.List([(@term_syntax.parse_term("(df_lo : Real) - (error : Real)"), t1221)]), m_taylor_partial_bound_p()))
  let t1225 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1222), t1223), t1224)
  m_taylor_partial_upper_p_c.set(@tactics.prove(@term_syntax.parse_term("(m_taylor_interval : ((Cart[Real, N]) -> Real, (Cart[Real, N], Cart[Real, N]), Cart[Real, N], Cart[Real, N], (Real, Real), List[(Real, Real)], List[List[(Real, Real)]]) -> Bool)((f : (Cart[Real, N]) -> Real), (domain : (Cart[Real, N], Cart[Real, N])), (y : Cart[Real, N]), (vector : (List[Real]) -> Cart[Real, N])((w : List[Real])), (f_bounds : (Real, Real)), (d_bounds_list : List[(Real, Real)]), (dd_bounds_list : List[List[(Real, Real)]])) && (IN : (Num, (Num) -> Bool) -> Bool)((i : Num), op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) && (EL : (Num, List[(Real, Real)]) -> (Real, Real))(i - 1, d_bounds_list) == ((df_lo : Real), (df_hi : Real)) && (∀ x : Cart[Real, N], (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(x, (interval : (List[(Cart[Real, N], Cart[Real, N])], Cart[Real, N]) -> Bool)([domain])) → (all_n : (Num, List[(Real, Real)], (Num, (Real, Real)) -> Bool) -> Bool)(1, (dd_list : List[(Real, Real)]), (j : Num) => (int : (Real, Real)) => interval_arith(if j <= i { (partial2 : (Num, Num, (Cart[Real, N]) -> Real, Cart[Real, N]) -> Real)(j, i, f, x) } else { (partial2 : (Num, Num, (Cart[Real, N]) -> Real, Cart[Real, N]) -> Real)(i, j, f, x) }, int))) && (LENGTH : (List[(Real, Real)]) -> Num)(dd_list) == (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && (LENGTH : (List[(Real, Real)]) -> Num)(d_bounds_list) == (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && (LENGTH : (List[Real]) -> Num)(w) == (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && (ITLIST2 : (((Real, Real), Real, Real) -> Real, List[(Real, Real)], List[Real], Real) -> Real)((a : (Real, Real)) => (b : Real) => (c : Real) => b * iabs(a) + c, dd_list, w, real_of_num(0)) <= (error : Real) && df_hi + error <= (hi : Real) → (∀ x : Cart[Real, N], (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(x, (interval : (List[(Cart[Real, N], Cart[Real, N])], Cart[Real, N]) -> Bool)([domain])) → (partial : (Num, (Cart[Real, N]) -> Real, Cart[Real, N]) -> Real)(i, f, x) <= hi)"), t1225))
}

///|
let m_taylor_partial_upper_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("M_TAYLOR_PARTIAL_UPPER'")

///|
/// `M_taylor.M_TAYLOR_PARTIAL_UPPER'`
pub fn m_taylor_partial_upper_p() -> @kernel.Thm {
  m_taylor_partial_upper_p_c.get()
}

///|
/// M_TAYLOR_PARTIAL_LOWER'
fn step_64() -> Unit raise {
  let t1229 = @simp.asm_simp_tac(@list.List([@interval_arith.interval_arith()]))
  let t1228 = @simp.asm_rewrite_tac(@list.List([@realax.real_le_refl()]))
  let t1226 = @term_syntax.parse_term("(hi : Real)")
  let t1227 = @tactics.mp_tac(@kernel.inst_rule(@list.List([(@term_syntax.parse_term("(df_hi : Real) + (error : Real)"), t1226)]), m_taylor_partial_bound_p()))
  let t1230 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1227), t1228), t1229)
  m_taylor_partial_lower_p_c.set(@tactics.prove(@term_syntax.parse_term("(m_taylor_interval : ((Cart[Real, N]) -> Real, (Cart[Real, N], Cart[Real, N]), Cart[Real, N], Cart[Real, N], (Real, Real), List[(Real, Real)], List[List[(Real, Real)]]) -> Bool)((f : (Cart[Real, N]) -> Real), (domain : (Cart[Real, N], Cart[Real, N])), (y : Cart[Real, N]), (vector : (List[Real]) -> Cart[Real, N])((w : List[Real])), (f_bounds : (Real, Real)), (d_bounds_list : List[(Real, Real)]), (dd_bounds_list : List[List[(Real, Real)]])) && (IN : (Num, (Num) -> Bool) -> Bool)((i : Num), op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))) && (EL : (Num, List[(Real, Real)]) -> (Real, Real))(i - 1, d_bounds_list) == ((df_lo : Real), (df_hi : Real)) && (∀ x : Cart[Real, N], (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(x, (interval : (List[(Cart[Real, N], Cart[Real, N])], Cart[Real, N]) -> Bool)([domain])) → (all_n : (Num, List[(Real, Real)], (Num, (Real, Real)) -> Bool) -> Bool)(1, (dd_list : List[(Real, Real)]), (j : Num) => (int : (Real, Real)) => interval_arith(if j <= i { (partial2 : (Num, Num, (Cart[Real, N]) -> Real, Cart[Real, N]) -> Real)(j, i, f, x) } else { (partial2 : (Num, Num, (Cart[Real, N]) -> Real, Cart[Real, N]) -> Real)(i, j, f, x) }, int))) && (LENGTH : (List[(Real, Real)]) -> Num)(dd_list) == (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && (LENGTH : (List[(Real, Real)]) -> Num)(d_bounds_list) == (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && (LENGTH : (List[Real]) -> Num)(w) == (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && (ITLIST2 : (((Real, Real), Real, Real) -> Real, List[(Real, Real)], List[Real], Real) -> Real)((a : (Real, Real)) => (b : Real) => (c : Real) => b * iabs(a) + c, dd_list, w, real_of_num(0)) <= (error : Real) && (lo : Real) <= df_lo - error → (∀ x : Cart[Real, N], (IN : (Cart[Real, N], (Cart[Real, N]) -> Bool) -> Bool)(x, (interval : (List[(Cart[Real, N], Cart[Real, N])], Cart[Real, N]) -> Bool)([domain])) → lo <= (partial : (Num, (Cart[Real, N]) -> Real, Cart[Real, N]) -> Real)(i, f, x))"), t1230))
}

///|
let m_taylor_partial_lower_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("M_TAYLOR_PARTIAL_LOWER'")

///|
/// `M_taylor.M_TAYLOR_PARTIAL_LOWER'`
pub fn m_taylor_partial_lower_p() -> @kernel.Thm {
  m_taylor_partial_lower_p_c.get()
}

///|
/// gen_taylor_partial_bound_th
fn step_65() -> Unit raise {
  let imp_and_eq = @class.taut(@term_syntax.parse_term("(((P : Bool) → (Q : Bool)) && (P → (R : Bool))) == (P → Q && R)"))
  let mk_list_hd : (@list.List[@kernel.Term]) -> @kernel.Term raise = fn(x1231 : @list.List[@kernel.Term]) -> @kernel.Term raise {
    let l = x1231
    @lists.mk_list(l, @kernel.type_of(@lib.hd(l)))
  }
  let dd_list_var = @term_syntax.parse_term("(dd_list : List[(Real, Real)])")
  gen_taylor_partial_bound_th_c.set(fn(x1232 : @kernel.Thm) -> ((Int64) -> ((Int64) -> @kernel.Thm raise) raise) raise {
    let bound_th = x1232
    fn(x1233 : Int64) -> ((Int64) -> @kernel.Thm raise) raise {
      let n = x1233
      fn(x1234 : Int64) -> @kernel.Thm raise {
        let i = x1234
        let ns = @lib.range(1L, n)
        let i_tm = @nums.mk_small_numeral(i)
        let w_list = mk_list_hd(@lib.map(fn(x1235 : Int64) -> @kernel.Term raise {
          let i_1 = x1235
          @lib.array_get(w_vars_array(), @lib.int63_to_int(i_1))
        }, ns))
        let d_bounds_list = mk_list_hd(@lib.map(fn(x1236 : Int64) -> @kernel.Term raise {
          let i_2 = x1236
          @lib.array_get(df_vars_array(), @lib.int63_to_int(i_2))
        }, ns))
        let dd_bounds_list = mk_list_hd(@lib.map(fn(x1237 : Int64) -> @kernel.Term raise {
          let i_3 = x1237
          mk_list_hd(@lib.map(fn(x1238 : Int64) -> @kernel.Term raise {
            let j = x1238
            @lib.array_get(@lib.array_get(dd_vars_array(), @lib.int63_to_int(i_3)), @lib.int63_to_int(j))
          }, @lib.range(1L, i_3)))
        }, ns))
        let dd_list = mk_list_hd(@lib.map(fn(x1239 : Int64) -> @kernel.Term raise {
          let j_1 = x1239
          if (j_1 <= i) {
            @lib.array_get(@lib.array_get(dd_vars_array(), @lib.int63_to_int(i)), @lib.int63_to_int(j_1))
          } else {
            @lib.array_get(@lib.array_get(dd_vars_array(), @lib.int63_to_int(j_1)), @lib.int63_to_int(i))
          }
        }, ns))
        let t1242 = @list.List([(@lib.array_get(n_type_array(), @lib.int63_to_int(n)), @misc_vars.nty())])
        let t1240 = @list.List([(w_list, @misc_vars.w_var_real_list()), (d_bounds_list, @misc_vars.d_bounds_list_var()), (dd_list, dd_list_var), (i_tm, @term_syntax.parse_term("(i : Num)")), (dd_bounds_list, @misc_vars.dd_bounds_list_var())])
        let th1 = ((x1241 : @kernel.Thm) => @kernel.inst_rule(t1240, x1241))((fn(x1244 : @kernel.Thm) -> @kernel.Thm raise {
          ((x1243 : @kernel.Thm) => @kernel.inst_type(t1242, x1243))(x1244)
        })(bound_th))
        let th2 = @simp.rewrite_rule(@list.List([@calc_int.real_add_rid(), @lists.hd(), @lists.tl(), @lists.itlist2_def(), @lists.length(), @calc_num.arith(), @lib.array_get(dimindex_array(), @lib.int63_to_int(n))]))(th1)
        let t1245 = @lib.sub63(i, 1L)
        let th3 = @simp.rewrite_rule(@list.List([@iterate.in_numseg(), @calc_num.arith(), @lib.array_get(@lib.array_get(el_thms_array(), @lib.int63_to_int(n)), @lib.int63_to_int(t1245))]))(th2)
        let t1246 = @lib.array_get(df_vars_array(), @lib.int63_to_int(i))
        let t1247 = @list.List([(@term_syntax.parse_term("((df_lo : Real), (df_hi : Real))"), t1246)])
        let t1249 = @simp.rewrite_rule(@list.List([]))
        let th4 = t1249(((x1248 : @kernel.Thm) => @kernel.inst_rule(t1247, x1248))(th3))
        let t1250 = @equal.gsym(@theorems.and_forall_thm())
        let t1251 = @simp.rewrite_rule(@list.List([@equal.gsym(imp_and_eq), t1250, @multivariate_taylor_compiled.all_n(), @calc_num.arith()]))
        let th5 = my_rule(t1251(th4))
        let m_taylor_hyp = @lib.find((x1252 : @kernel.Term) => @lib.can(dest_m_taylor, x1252), @kernel.hyp(th5))
        let t1253 = @simp.rewrite_rule(@list.List([@calc_num.arith(), @multivariate_taylor_compiled.all_n(), @multivariate_taylor_compiled.second_bounded(), @multivariate_taylor_compiled.m_taylor_interval()]))
        let t_th0 = t1253(@kernel.assume_rule(m_taylor_hyp))
        let t1254 = @equal.gsym(@theorems.and_forall_thm())
        let t_th1 = @simp.rewrite_rule(@list.List([@equal.gsym(imp_and_eq), t1254]))(t_th0)
        let t1255 = @simp.rewrite_rule(@list.List([@equal.gsym(@list_float.error_mul_f2()), t_th1]))
        (fn(x1256 : @kernel.Thm) -> @kernel.Thm raise {
          my_rule_num(t1255(x1256))
        })(@bool.disch_all(th5))
      }
    }
  })
}

///|
let gen_taylor_partial_bound_th_c : @lib.Cell[(@kernel.Thm) -> ((Int64) -> ((Int64) -> @kernel.Thm raise) raise) raise] = @lib.Cell::new("gen_taylor_partial_bound_th")

///|
/// `gen_taylor_partial_bound_th`
pub fn gen_taylor_partial_bound_th(x : @kernel.Thm) -> ((Int64) -> ((Int64) -> @kernel.Thm raise) raise) raise {
  (gen_taylor_partial_bound_th_c.get())(x)
}

///|
/// i_in_array
fn step_66() -> Unit raise {
  i_in_array_c.set(@lib.array_init(@lib.add63(max_dim(), 1L), fn(x1257 : Int64) -> FixedArray[@kernel.Thm] raise {
    let i = x1257
    @lib.array_init(@lib.add63(i, 1L), fn(x1258 : Int64) -> @kernel.Thm raise {
      let j = x1258
      if (j < 1L) {
        @bool.truth()
      } else {
        let j_tm = @nums.mk_small_numeral(j)
        let tm0 = @term_syntax.parse_term("IN((j : Num), op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))))")
        let t1261 = @list.List([(@lib.array_get(n_type_array(), @lib.int63_to_int(i)), @misc_vars.nty())])
        let t1259 = @list.List([(j_tm, @term_syntax.parse_term("(j : Num)"))])
        let tm1 = ((x1260 : @kernel.Term) => @basics.subst(t1259, x1260))((fn(x1263 : @kernel.Term) -> @kernel.Term raise {
          ((x1262 : @kernel.Term) => @kernel.inst(t1261, x1262))(x1263)
        })(tm0))
        @tactics.prove(tm1, @tactics.then_tac(@simp.rewrite_tac(@list.List([@lib.array_get(dimindex_array(), @lib.int63_to_int(i)), @iterate.in_numseg()])), @int.arith_tac))
      }
    })
  }))
}

///|
let i_in_array_c : @lib.Cell[FixedArray[FixedArray[@kernel.Thm]]] = @lib.Cell::new("i_in_array")

///|
/// `M_taylor.i_in_array`
pub fn i_in_array() -> FixedArray[FixedArray[@kernel.Thm]] {
  i_in_array_c.get()
}

///|
let m_taylor_partial_upper_array_c : @lib.Cell[FixedArray[FixedArray[@kernel.Thm]]] = @lib.Cell::new("m_taylor_partial_upper_array")

///|
/// `M_taylor.m_taylor_partial_upper_array`
pub fn m_taylor_partial_upper_array() -> FixedArray[FixedArray[@kernel.Thm]] {
  m_taylor_partial_upper_array_c.get()
}

///|
let m_taylor_partial_lower_array_c : @lib.Cell[FixedArray[FixedArray[@kernel.Thm]]] = @lib.Cell::new("m_taylor_partial_lower_array")

///|
/// `M_taylor.m_taylor_partial_lower_array`
pub fn m_taylor_partial_lower_array() -> FixedArray[FixedArray[@kernel.Thm]] {
  m_taylor_partial_lower_array_c.get()
}

///|
let m_taylor_partial_bound_array_c : @lib.Cell[FixedArray[FixedArray[@kernel.Thm]]] = @lib.Cell::new("m_taylor_partial_bound_array")

///|
/// `M_taylor.m_taylor_partial_bound_array`
pub fn m_taylor_partial_bound_array() -> FixedArray[FixedArray[@kernel.Thm]] {
  m_taylor_partial_bound_array_c.get()
}

///|
/// m_taylor_partial_upper_array, m_taylor_partial_lower_array, m_taylor_partial_bound_array
fn step_67() -> Unit raise {
  let gen_array : (@kernel.Thm) -> FixedArray[FixedArray[@kernel.Thm]] raise = fn(x1264 : @kernel.Thm) -> FixedArray[FixedArray[@kernel.Thm]] raise {
    let bound_th = x1264
    @lib.array_init(@lib.add63(max_dim(), 1L), fn(x1265 : Int64) -> FixedArray[@kernel.Thm] raise {
      let i = x1265
      @lib.array_init(@lib.add63(i, 1L), fn(x1266 : Int64) -> @kernel.Thm raise {
        let j = x1266
        if (j < 1L) {
          @bool.truth()
        } else {
          gen_taylor_partial_bound_th(bound_th)(i)(j)
        }
      })
    })
  }
  let t1267 = gen_array(m_taylor_partial_bound_p())
  let t1268 = gen_array(m_taylor_partial_lower_p())
  let (m_taylor_partial_upper_array, m_taylor_partial_lower_array, m_taylor_partial_bound_array) = (gen_array(m_taylor_partial_upper_p()), t1268, t1267)
  m_taylor_partial_upper_array_c.set(m_taylor_partial_upper_array)
  m_taylor_partial_lower_array_c.set(m_taylor_partial_lower_array)
  m_taylor_partial_bound_array_c.set(m_taylor_partial_bound_array)
}

///|
/// `eval_m_taylor_partial_bounds0`
pub fn eval_m_taylor_partial_bounds0(x1269 : String, x1270 : Int64, x1271 : Int64, x1272 : Int64, x1273 : @kernel.Thm) -> @kernel.Thm raise {
  let mode = x1269
  let n = x1270
  let pp = x1271
  let i = x1272
  let m_taylor_th = x1273
  let bound_th = if (mode == "upper") {
    @lib.array_get(@lib.array_get(m_taylor_partial_upper_array(), @lib.int63_to_int(n)), @lib.int63_to_int(i))
  } else {
    if (mode == "bound") {
      @lib.array_get(@lib.array_get(m_taylor_partial_bound_array(), @lib.int63_to_int(n)), @lib.int63_to_int(i))
    } else {
      @lib.array_get(@lib.array_get(m_taylor_partial_lower_array(), @lib.int63_to_int(n)), @lib.int63_to_int(i))
    }
  }
  let (f_tm, domain_tm, y_tm, w_tm, f_bounds, d_bounds_list, dd_bounds_list) = dest_m_taylor(@kernel.concl(m_taylor_th))
  let ws = @basics.dest_list(@kernel.rand(w_tm))
  let dfs = @basics.dest_list(d_bounds_list)
  let dds = @lib.map(@basics.dest_list, @basics.dest_list(dd_bounds_list))
  let ns = @lib.range(1L, n)
  let (df_lo, df_hi) = @pair.dest_pair(@lib.list_nth(dfs, @lib.int63_to_int(@lib.sub63(i, 1L))))
  let df_vars = @lib.map(fn(x1274 : Int64) -> @kernel.Term raise {
    let i_1 = x1274
    @lib.array_get(df_vars_array(), @lib.int63_to_int(i_1))
  }, ns)
  let dd_vars = @lib.map(fn(x1275 : Int64) -> @list.List[@kernel.Term] raise {
    let i_2 = x1275
    @lib.map(fn(x1276 : Int64) -> @kernel.Term raise {
      let j = x1276
      @lib.array_get(@lib.array_get(dd_vars_array(), @lib.int63_to_int(i_2)), @lib.int63_to_int(j))
    }, @lib.range(1L, i_2))
  }, ns)
  let w_vars = @lib.map(fn(x1277 : Int64) -> @kernel.Term raise {
    let i_3 = x1277
    @lib.array_get(w_vars_array(), @lib.int63_to_int(i_3))
  }, ns)
  let y_var = @kernel.mk_var("y", @kernel.type_of(y_tm))
  let f_var = @kernel.mk_var("f", @kernel.type_of(f_tm))
  let domain_var = @kernel.mk_var("domain", @kernel.type_of(domain_tm))
  let dd_list = @lib.map(fn(x1278 : Int64) -> @kernel.Term raise {
    let j_1 = x1278
    if (j_1 <= i) {
      let t1279 = @lib.int63_to_int(@lib.sub63(j_1, 1L))
      @lib.list_nth(@lib.list_nth(dds, @lib.int63_to_int(@lib.sub63(i, 1L))), t1279)
    } else {
      let t1280 = @lib.int63_to_int(@lib.sub63(i, 1L))
      @lib.list_nth(@lib.list_nth(dds, @lib.int63_to_int(@lib.sub63(j_1, 1L))), t1280)
    }
  }, ns)
  let mul_dd = @lib.map2((x1281 : @kernel.Term, x1282 : @kernel.Term) => @list_float.error_mul_f2_le_conv2(pp, x1281, x1282), ws, dd_list)
  let dd_th = @lib.end_itlist((x1283 : @kernel.Thm, x1284 : @kernel.Thm) => @more_float.add_ineq_hi_v1(pp, x1283, x1284), mul_dd)
  let error_tm = @kernel.rand((fn(x1285 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x1285)
  })(dd_th))
  let (prove_ineq, bounds_inst) = if (mode == "upper") {
    let ineq2 = @arith_float.float_add_hi_v1(pp)(df_hi)(error_tm)
    ((x1286 : @kernel.Thm) => @misc_functions.my_prove_hyp(ineq2, x1286), @list.List([(@kernel.rand((fn(x1287 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x1287)
    })(ineq2)), @misc_vars.hi_var_real())]))
  } else {
    if (mode == "bound") {
      let ineq2_1 = @arith_float.float_add_hi_v1(pp)(df_hi)(error_tm)
      let ineq3 = @arith_float.float_sub_lo_v1(pp)(df_lo)(error_tm)
      let t1293 = (@equal.lhand((fn(x1292 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x1292)
      })(ineq3)), @misc_vars.lo_var_real())
      (fn(x1290 : @kernel.Thm) -> @kernel.Thm raise {
        ((x1288 : @kernel.Thm) => @misc_functions.my_prove_hyp(ineq2_1, x1288))(((x1289 : @kernel.Thm) => @misc_functions.my_prove_hyp(ineq3, x1289))(x1290))
      }, @list.List([(@kernel.rand((fn(x1291 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x1291)
      })(ineq2_1)), @misc_vars.hi_var_real()), t1293]))
    } else {
      let ineq2_2 = @arith_float.float_sub_lo_v1(pp)(df_lo)(error_tm)
      ((x1294 : @kernel.Thm) => @misc_functions.my_prove_hyp(ineq2_2, x1294), @list.List([(@equal.lhand((fn(x1295 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x1295)
      })(ineq2_2)), @misc_vars.lo_var_real())]))
    }
  }
  let inst1 = @lib.zip(dfs, df_vars)
  let t1296 = @lib.flat(dd_vars)
  let inst2 = @lib.zip(@lib.flat(dds), t1296)
  let inst3 = @lib.zip(ws, w_vars)
  let inst_list = inst1.concat(inst2.concat(inst3))
  (fn(x1300 : @kernel.Thm) -> @kernel.Thm raise {
    (fn(x1299 : @kernel.Thm) -> @kernel.Thm raise {
      ((x1297 : @kernel.Thm) => @misc_functions.my_prove_hyp(m_taylor_th, x1297))(((x1298 : @kernel.Thm) => @misc_functions.my_prove_hyp(dd_th, x1298))(x1299))
    })(prove_ineq(x1300))
  })(((x1301 : @kernel.Thm) => @kernel.inst_rule((@list.List([(df_hi, @misc_vars.df_hi_var()), (df_lo, @misc_vars.df_lo_var()), (error_tm, @misc_vars.error_var()), (y_tm, y_var), (domain_tm, domain_var), (f_bounds, @misc_vars.f_bounds_var()), (f_tm, f_var)])).concat(bounds_inst.concat(inst_list)), x1301))(bound_th))
}

///|
/// eval_m_taylor_partial_upper
fn step_68() -> Unit raise {
  eval_m_taylor_partial_upper_c.set(fn(x1306 : Int64) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise) raise {
    fn(x1307 : Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise {
      fn(x1308 : Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
        fn(x1309 : @kernel.Thm) -> @kernel.Thm raise {
          ((x1302 : Int64, x1303 : Int64, x1304 : Int64, x1305 : @kernel.Thm) => eval_m_taylor_partial_bounds0("upper", x1302, x1303, x1304, x1305))(x1306, x1307, x1308, x1309)
        }
      }
    }
  })
}

///|
let eval_m_taylor_partial_upper_c : @lib.Cell[(Int64) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise) raise] = @lib.Cell::new("eval_m_taylor_partial_upper")

///|
/// `eval_m_taylor_partial_upper`
pub fn eval_m_taylor_partial_upper(x : Int64) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise) raise {
  (eval_m_taylor_partial_upper_c.get())(x)
}

///|
/// eval_m_taylor_partial_lower
fn step_69() -> Unit raise {
  eval_m_taylor_partial_lower_c.set(fn(x1314 : Int64) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise) raise {
    fn(x1315 : Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise {
      fn(x1316 : Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
        fn(x1317 : @kernel.Thm) -> @kernel.Thm raise {
          ((x1310 : Int64, x1311 : Int64, x1312 : Int64, x1313 : @kernel.Thm) => eval_m_taylor_partial_bounds0("lower", x1310, x1311, x1312, x1313))(x1314, x1315, x1316, x1317)
        }
      }
    }
  })
}

///|
let eval_m_taylor_partial_lower_c : @lib.Cell[(Int64) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise) raise] = @lib.Cell::new("eval_m_taylor_partial_lower")

///|
/// `eval_m_taylor_partial_lower`
pub fn eval_m_taylor_partial_lower(x : Int64) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise) raise {
  (eval_m_taylor_partial_lower_c.get())(x)
}

///|
/// eval_m_taylor_partial_bound
fn step_70() -> Unit raise {
  eval_m_taylor_partial_bound_c.set(fn(x1322 : Int64) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise) raise {
    fn(x1323 : Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise {
      fn(x1324 : Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
        fn(x1325 : @kernel.Thm) -> @kernel.Thm raise {
          ((x1318 : Int64, x1319 : Int64, x1320 : Int64, x1321 : @kernel.Thm) => eval_m_taylor_partial_bounds0("bound", x1318, x1319, x1320, x1321))(x1322, x1323, x1324, x1325)
        }
      }
    }
  })
}

///|
let eval_m_taylor_partial_bound_c : @lib.Cell[(Int64) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise) raise] = @lib.Cell::new("eval_m_taylor_partial_bound")

///|
/// `eval_m_taylor_partial_bound`
pub fn eval_m_taylor_partial_bound(x : Int64) -> ((Int64) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise) raise {
  (eval_m_taylor_partial_bound_c.get())(x)
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
}
