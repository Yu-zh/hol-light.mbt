// Translated from upstream Logic/fol.ml; edit this file directly.

///|
/// `EXPAND_TAC`
pub fn expand_tac(x1 : String) -> @tactics.Tactic raise {
  let s = x1
  @tactics.then_tac(@tactics.first_assum(fn(x15 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x6 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x3 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s4 = @tactics.subst1_tac(x3)
        fn(x5 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s4(x5)
        }
      })(@equal.sym(x6))
    })(((x14 : @kernel.Thm) => @lib.check(fn(x13 : @kernel.Thm) -> Bool raise {
      (fn(x11 : @kernel.Term) -> Bool raise {
        (fn(x10 : @kernel.Term) -> Bool raise {
          (fn(x9 : (String, @kernel.HolType)) -> Bool raise {
            (fn(x7 : String) -> Bool raise {
              (s == x7)
            })((fn(x8 : (String, @kernel.HolType)) -> String raise {
              x8.0
            })(x9))
          })(@kernel.dest_var(x10))
        })(@equal.rhs(x11))
      })((fn(x12 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x12)
      })(x13))
    }, x14))(x15))
  }), @tactics.beta_tac)
}

///|
/// LIST_UNION
fn step_1() -> Unit raise {
  let t16 = @term_syntax.parse_term("(LIST_UNION : (List[(_) -> Bool], _) -> Bool)(NIL) == {} && LIST_UNION(CONS((h : (_) -> Bool), (t : List[(_) -> Bool]))) == UNION(h, LIST_UNION(t))")
  list_union_c.set(@recursion.new_recursive_definition(@ind_types.list_recursion())(t16))
}

///|
let list_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIST_UNION")

///|
/// `LIST_UNION`
pub fn list_union() -> @kernel.Thm {
  list_union_c.get()
}

///|
/// LIST_UNION_FINITE
fn step_2() -> Unit raise {
  let t18 = @meson.asm_meson_tac(@list.List([]))
  let t17 = @simp.rewrite_tac(@list.List([@sets.finite_union(), @lists.all()]))
  let t19 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@lists.list_induct_tac, @simp.rewrite_tac(@list.List([list_union(), @sets.finite_rules()]))), t17), t18)
  list_union_finite_c.set(@tactics.prove(@term_syntax.parse_term("∀ l : List[(_) -> Bool], ALL(FINITE, l) → FINITE(LIST_UNION(l))"), t19))
}

///|
let list_union_finite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIST_UNION_FINITE")

///|
/// `LIST_UNION_FINITE`
pub fn list_union_finite() -> @kernel.Thm {
  list_union_finite_c.get()
}

///|
/// IN_LIST_UNION
fn step_3() -> Unit raise {
  let t20 = @simp.asm_rewrite_tac(@list.List([list_union(), @lists.ex(), @sets.not_in_empty(), @sets.in_union()]))
  let t21 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @lists.list_induct_tac), t20)
  in_list_union_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : _, ∀ l : List[(_) -> Bool], IN(x, LIST_UNION(l)) == EX((s : (_) -> Bool) => IN(x, s), l)"), t21))
}

///|
let in_list_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_LIST_UNION")

///|
/// `IN_LIST_UNION`
pub fn in_list_union() -> @kernel.Thm {
  in_list_union_c.get()
}

///|
/// LIST_UNION_APPEND
fn step_4() -> Unit raise {
  let t22 = @tactics.then_tac(@lists.list_induct_tac, @simp.asm_rewrite_tac(@list.List([list_union(), @lists.append(), @sets.union_empty(), @equal.gsym(@sets.union_assoc())])))
  list_union_append_c.set(@tactics.prove(@term_syntax.parse_term("∀ l1 : List[(_) -> Bool], ∀ l2 : List[(_) -> Bool], LIST_UNION(APPEND(l1, l2)) == UNION(LIST_UNION(l1), LIST_UNION(l2))"), t22))
}

///|
let list_union_append_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIST_UNION_APPEND")

///|
/// `LIST_UNION_APPEND`
pub fn list_union_append() -> @kernel.Thm {
  list_union_append_c.get()
}

///|
let term_raw_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("term_raw_INDUCT")

///|
/// `term_raw_INDUCT`
pub fn term_raw_induct() -> @kernel.Thm {
  term_raw_induct_c.get()
}

///|
let term_raw_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("term_raw_RECURSION")

///|
/// `term_raw_RECURSION`
pub fn term_raw_recursion() -> @kernel.Thm {
  term_raw_recursion_c.get()
}

///|
/// term_raw_INDUCT, term_raw_RECURSION
fn step_5() -> Unit raise {
  let (term_raw_induct, term_raw_recursion) = @ind_types.define_type("enum Term { V(Num); Fn(Num, List[Term]) }")
  term_raw_induct_c.set(term_raw_induct)
  term_raw_recursion_c.set(term_raw_recursion)
}

///|
/// term_INDUCT
fn step_6() -> Unit raise {
  let t25 = @simp.asm_simp_tac(@list.List([@lists.all()]))
  let t23 = @term_syntax.parse_term("ALL((P : (Term) -> Bool))")
  let t24 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(P : (Term) -> Bool)"), t23]), term_raw_induct()))
  let t26 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t24), t25)
  term_induct_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (Term) -> Bool, (∀ v : Num, P(V(v))) && (∀ s : Num, ∀ l : List[Term], ALL(P, l) → P(Fn(s, l))) → (∀ t : Term, P(t))"), t26))
}

///|
let term_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("term_INDUCT")

///|
/// `term_INDUCT`
pub fn term_induct() -> @kernel.Thm {
  term_induct_c.get()
}

///|
/// term_RECURSION
fn step_7() -> Unit raise {
  let t39 = @simp.asm_rewrite_tac(@list.List([@lists.map()]))
  let t37 = @term_syntax.parse_term("(l : List[Term])")
  let t38 = @tactics.spec_tac(@term_syntax.parse_term("(l : List[Term])"), t37)
  let t36 = @tactics.x_gen_tac(@term_syntax.parse_term("(l : List[Term])"))
  let t35 = @simp.asm_rewrite_tac(@list.List([]))
  let t34 = @tactics.exists_tac(@term_syntax.parse_term("(fn_ : (Term) -> Z)"))
  let t32 = @tactics.x_choose_then(@term_syntax.parse_term("(fn_ : (Term) -> Z)"))(@tactics.strip_assume_tac)
  let t33 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(mf : (List[Term]) -> List[Z])"))(t32))
  let t31 = @simp.rewrite_tac(@list.List([]))
  let t27 = @term_syntax.parse_term("(x : Term) => (y : List[Term]) => (z : Z) => (w : List[Z]) => CONS(z, w)")
  let t28 = @term_syntax.parse_term("(NIL : List[Z])")
  let t29 = @term_syntax.parse_term("(h : (Num, List[Term], List[Z]) -> Z)")
  let t30 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Num) -> Z)"), t29, t28, t27]), term_raw_recursion()))
  let t40 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t30), t31), t33), t34), t35), @tactics.gen_tac), t36), @tactics.ap_term_tac), t38), @lists.list_induct_tac), t39)
  term_recursion_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Z, ∀ h : (Num, List[Term], List[Z]) -> Z, ∃ fn_ : (Term) -> Z, (∀ v : Num, fn_(V(v)) == f(v)) && (∀ s : Num, ∀ l : List[Term], fn_(Fn(s, l)) == h(s, l, MAP(fn_, l)))"), t40))
}

///|
let term_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("term_RECURSION")

///|
/// `term_RECURSION`
pub fn term_recursion() -> @kernel.Thm {
  term_recursion_c.get()
}

///|
/// `new_nested_recursive_definition`
pub fn new_nested_recursive_definition(x41 : @kernel.Thm, x42 : @kernel.Term) -> @kernel.Thm raise {
  let ax = x41
  let tm = x42
  let expat = @equal.lhand(@basics.strip_forall(@lib.hd(@basics.conjuncts(tm))).1)
  let (ev, allargs) = @basics.strip_comb(expat)
  let pargs = @lib.butlast(allargs)
  let tm_p = @bool.mk_exists(ev, @bool.list_mk_forall(pargs, tm))
  let rawprover : (@kernel.Term) -> @kernel.Thm raise = @recursion.prove_recursive_functions_exist(ax)
  let t43 = @tactics.repeat_tac(@tactics.gen_tac)
  let eth = @tactics.prove(tm_p, @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@class.skolem_thm())])), t43), fn(x53 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x52 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x50 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x49 : (@kernel.Term, @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x47 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            (fn(x44 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
              let s45 = @tactics.accept_tac(x44)
              fn(x46 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
                s45(x46)
              }
            })(rawprover(x47))
          })((fn(x48 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
            x48.1
          })(x49))
        })(@basics.dest_exists(x50))
      })((fn(x51 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x51.1
      })(x52))
    })(x53)(x53)
  }))
  @bool.specl(pargs, @nums.new_specification(@list.List([@kernel.dest_var(ev).0]))(eth))
}

///|
/// term_INJ
fn step_8() -> Unit raise {
  term_inj_c.set(@ind_types.prove_constructors_injective(term_recursion()))
}

///|
let term_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("term_INJ")

///|
/// `term_INJ`
pub fn term_inj() -> @kernel.Thm {
  term_inj_c.get()
}

///|
/// term_DISTINCT
fn step_9() -> Unit raise {
  term_distinct_c.set(@ind_types.prove_constructors_distinct(term_recursion()))
}

///|
let term_distinct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("term_DISTINCT")

///|
/// `term_DISTINCT`
pub fn term_distinct() -> @kernel.Thm {
  term_distinct_c.get()
}

///|
/// term_CASES
fn step_10() -> Unit raise {
  term_cases_c.set(@ind_types.prove_cases_thm(term_induct()))
}

///|
let term_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("term_CASES")

///|
/// `term_CASES`
pub fn term_cases() -> @kernel.Thm {
  term_cases_c.get()
}

///|
/// Logic/fol.ml:92
fn step_11() -> Unit raise {
  @printer.parse_as_infix("-->", (13L, "right"))
}

///|
let form_induction_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("form_INDUCTION")

///|
/// `form_INDUCTION`
pub fn form_induction() -> @kernel.Thm {
  form_induction_c.get()
}

///|
let form_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("form_RECURSION")

///|
/// `form_RECURSION`
pub fn form_recursion() -> @kernel.Thm {
  form_recursion_c.get()
}

///|
/// form_INDUCTION, form_RECURSION
fn step_12() -> Unit raise {
  let (form_induction, form_recursion) = @ind_types.define_type("enum Form { False; Atom(Num, List[Term]); `-->`(Form, Form); `!!`(Num, Form) }")
  form_induction_c.set(form_induction)
  form_recursion_c.set(form_recursion)
}

///|
/// form_INJ
fn step_13() -> Unit raise {
  form_inj_c.set(@ind_types.prove_constructors_injective(form_recursion()))
}

///|
let form_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("form_INJ")

///|
/// `form_INJ`
pub fn form_inj() -> @kernel.Thm {
  form_inj_c.get()
}

///|
/// form_DISTINCT
fn step_14() -> Unit raise {
  form_distinct_c.set(@ind_types.prove_constructors_distinct(form_recursion()))
}

///|
let form_distinct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("form_DISTINCT")

///|
/// `form_DISTINCT`
pub fn form_distinct() -> @kernel.Thm {
  form_distinct_c.get()
}

///|
/// form_CASES
fn step_15() -> Unit raise {
  form_cases_c.set(@ind_types.prove_cases_thm(form_induction()))
}

///|
let form_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("form_CASES")

///|
/// `form_CASES`
pub fn form_cases() -> @kernel.Thm {
  form_cases_c.get()
}

///|
/// Logic/fol.ml:110
fn step_16() -> Unit raise {
  @printer.parse_as_infix("&&", (16L, "right"))
}

///|
/// Logic/fol.ml:111
fn step_17() -> Unit raise {
  @printer.parse_as_infix("||", (14L, "right"))
}

///|
/// Logic/fol.ml:112
fn step_18() -> Unit raise {
  @printer.parse_as_infix("<->", (12L, "right"))
}

///|
/// Not_DEF
fn step_19() -> Unit raise {
  not_def_c.set(@pair.new_definition(@term_syntax.parse_term("(Not : (Form) -> Form)((p : Form)) == op_minus_minus_gt(p, False)")))
}

///|
let not_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Not_DEF")

///|
/// `Not_DEF`
pub fn not_def() -> @kernel.Thm {
  not_def_c.get()
}

///|
/// True_DEF
fn step_20() -> Unit raise {
  true_def_c.set(@pair.new_definition(@term_syntax.parse_term("(True : Form) == Not(False)")))
}

///|
let true_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("True_DEF")

///|
/// `True_DEF`
pub fn true_def() -> @kernel.Thm {
  true_def_c.get()
}

///|
/// Or_DEF
fn step_21() -> Unit raise {
  or_def_c.set(@pair.new_definition(@term_syntax.parse_term("(op_bar_bar : (Form, Form) -> Form)((p : Form), (q : Form)) == op_minus_minus_gt(op_minus_minus_gt(p, q), q)")))
}

///|
let or_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Or_DEF")

///|
/// `Or_DEF`
pub fn or_def() -> @kernel.Thm {
  or_def_c.get()
}

///|
/// And_DEF
fn step_22() -> Unit raise {
  and_def_c.set(@pair.new_definition(@term_syntax.parse_term("(op_amp_amp : (Form, Form) -> Form)((p : Form), (q : Form)) == Not(op_bar_bar(Not(p), Not(q)))")))
}

///|
let and_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("And_DEF")

///|
/// `And_DEF`
pub fn and_def() -> @kernel.Thm {
  and_def_c.get()
}

///|
/// Iff_DEF
fn step_23() -> Unit raise {
  iff_def_c.set(@pair.new_definition(@term_syntax.parse_term("(op_lt_minus_gt : (Form, Form) -> Form)((p : Form), (q : Form)) == op_amp_amp(op_minus_minus_gt(p, q), op_minus_minus_gt(q, p))")))
}

///|
let iff_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Iff_DEF")

///|
/// `Iff_DEF`
pub fn iff_def() -> @kernel.Thm {
  iff_def_c.get()
}

///|
/// Exists_DEF
fn step_24() -> Unit raise {
  exists_def_c.set(@pair.new_definition(@term_syntax.parse_term("(op_q_q : (Num, Form) -> Form)((x : Num), (p : Form)) == Not(op_bang_bang(x, Not(p)))")))
}

///|
let exists_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Exists_DEF")

///|
/// `Exists_DEF`
pub fn exists_def() -> @kernel.Thm {
  exists_def_c.get()
}

///|
/// functions_term
fn step_25() -> Unit raise {
  let t54 = @term_syntax.parse_term("(∀ v : Num, (functions_term : (Term, (Num, Num)) -> Bool)(V(v)) == {}) && (∀ f : Num, ∀ l : List[Term], functions_term(Fn(f, l)) == INSERT((f, LENGTH(l)), LIST_UNION(MAP(functions_term, l))))")
  functions_term_c.set(@recursion.new_recursive_definition(term_recursion())(t54))
}

///|
let functions_term_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("functions_term")

///|
/// `functions_term`
pub fn functions_term() -> @kernel.Thm {
  functions_term_c.get()
}

///|
/// functions_form
fn step_26() -> Unit raise {
  let t55 = @term_syntax.parse_term("(functions_form : (Form, (Num, Num)) -> Bool)(False) == {} && functions_form(Atom((a : Num), (l : List[Term]))) == LIST_UNION(MAP(functions_term, l)) && functions_form(op_minus_minus_gt((p : Form), (q : Form))) == UNION(functions_form(p), functions_form(q)) && functions_form(op_bang_bang((x : Num), p)) == functions_form(p)")
  functions_form_c.set(@recursion.new_recursive_definition(form_recursion())(t55))
}

///|
let functions_form_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("functions_form")

///|
/// `functions_form`
pub fn functions_form() -> @kernel.Thm {
  functions_form_c.get()
}

///|
/// predicates_form
fn step_27() -> Unit raise {
  let t56 = @term_syntax.parse_term("(predicates_form : (Form, (Num, Num)) -> Bool)(False) == {} && predicates_form(Atom((a : Num), (l : List[Term]))) == {(a, LENGTH(l))} && predicates_form(op_minus_minus_gt((p : Form), (q : Form))) == UNION(predicates_form(p), predicates_form(q)) && predicates_form(op_bang_bang((x : Num), p)) == predicates_form(p)")
  predicates_form_c.set(@recursion.new_recursive_definition(form_recursion())(t56))
}

///|
let predicates_form_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("predicates_form")

///|
/// `predicates_form`
pub fn predicates_form() -> @kernel.Thm {
  predicates_form_c.get()
}

///|
/// functions
fn step_28() -> Unit raise {
  functions_c.set(@pair.new_definition(@term_syntax.parse_term("(functions : ((Form) -> Bool, (Num, Num)) -> Bool)((fms : (Form) -> Bool)) == UNIONS({functions_form((f : Form)) | IN(f, fms)})")))
}

///|
let functions_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("functions")

///|
/// `functions`
pub fn functions() -> @kernel.Thm {
  functions_c.get()
}

///|
/// predicates
fn step_29() -> Unit raise {
  predicates_c.set(@pair.new_definition(@term_syntax.parse_term("(predicates : ((Form) -> Bool, (Num, Num)) -> Bool)((fms : (Form) -> Bool)) == UNIONS({predicates_form((f : Form)) | IN(f, fms)})")))
}

///|
let predicates_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("predicates")

///|
/// `predicates`
pub fn predicates() -> @kernel.Thm {
  predicates_c.get()
}

///|
/// language
fn step_30() -> Unit raise {
  language_c.set(@pair.new_definition(@term_syntax.parse_term("(language : ((Form) -> Bool) -> (((Num, Num)) -> Bool, ((Num, Num)) -> Bool))((fms : (Form) -> Bool)) == (functions(fms), predicates(fms))")))
}

///|
let language_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("language")

///|
/// `language`
pub fn language() -> @kernel.Thm {
  language_c.get()
}

///|
/// FUNCTIONS_SING
fn step_31() -> Unit raise {
  let t57 = @meson.meson_tac(@list.List([]))
  let t58 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_insert(), @sets.not_in_empty(), functions(), @sets.in_elim_thm(), @sets.in_unions()])), t57)
  functions_sing_c.set(@tactics.prove(@term_syntax.parse_term("functions({(p : Form)}) == functions_form(p)"), t58))
}

///|
let functions_sing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FUNCTIONS_SING")

///|
/// `FUNCTIONS_SING`
pub fn functions_sing() -> @kernel.Thm {
  functions_sing_c.get()
}

///|
/// LANGUAGE_1
fn step_32() -> Unit raise {
  let t61 = @meson.meson_tac(@list.List([]))
  let t60 = @simp.rewrite_tac(@list.List([@sets.in_unions(), @sets.in_elim_thm(), @sets.in_insert(), @sets.not_in_empty()]))
  let t59 = @simp.once_rewrite_tac(@list.List([@sets.extension()]))
  let t62 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([language(), functions(), predicates(), @pair.pair_eq()])), @tactics.conj_tac), t59), t60), t61)
  language_1_c.set(@tactics.prove(@term_syntax.parse_term("language({(p : Form)}) == (functions_form(p), predicates_form(p))"), t62))
}

///|
let language_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LANGUAGE_1")

///|
/// `LANGUAGE_1`
pub fn language_1() -> @kernel.Thm {
  language_1_c.get()
}

///|
/// Dom_DEF
fn step_33() -> Unit raise {
  dom_def_c.set(@pair.new_definition(@term_syntax.parse_term("(Dom : (((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), A) -> Bool)(((D : (A) -> Bool), (Funs : (Num, List[A]) -> A), (Preds : (Num, List[A]) -> Bool))) == D")))
}

///|
let dom_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Dom_DEF")

///|
/// `Dom_DEF`
pub fn dom_def() -> @kernel.Thm {
  dom_def_c.get()
}

///|
/// Fun_DEF
fn step_34() -> Unit raise {
  fun_def_c.set(@pair.new_definition(@term_syntax.parse_term("(Fun : (((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), Num, List[A]) -> A)(((D : (A) -> Bool), (Funs : (Num, List[A]) -> A), (Preds : (Num, List[A]) -> Bool))) == Funs")))
}

///|
let fun_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Fun_DEF")

///|
/// `Fun_DEF`
pub fn fun_def() -> @kernel.Thm {
  fun_def_c.get()
}

///|
/// Pred_DEF
fn step_35() -> Unit raise {
  pred_def_c.set(@pair.new_definition(@term_syntax.parse_term("(Pred : (((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), Num, List[A]) -> Bool)(((D : (A) -> Bool), (Funs : (Num, List[A]) -> A), (Preds : (Num, List[A]) -> Bool))) == Preds")))
}

///|
let pred_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Pred_DEF")

///|
/// `Pred_DEF`
pub fn pred_def() -> @kernel.Thm {
  pred_def_c.get()
}

///|
/// MODEL_EQ
fn step_36() -> Unit raise {
  let t63 = @simp.rewrite_tac(@list.List([]))
  let detrip = @tactics.prove(@term_syntax.parse_term("(p : (_, _, _)) == (FST(p), FST(SND(p)), SND(SND(p)))"), t63)
  let t65 = @simp.rewrite_tac(@list.List([]))
  let t64 = @simp.pure_rewrite_tac(@list.List([@pair.pair_eq(), dom_def(), fun_def(), pred_def()]))
  let t66 = @tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([detrip])), t64), t65)
  model_eq_c.set(@tactics.prove(@term_syntax.parse_term("((M : ((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool)) == (M' : ((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool))) == (Dom(M) == Dom(M') && Fun(M) == Fun(M') && Pred(M) == Pred(M'))"), t66))
}

///|
let model_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MODEL_EQ")

///|
/// `MODEL_EQ`
pub fn model_eq() -> @kernel.Thm {
  model_eq_c.get()
}

///|
/// MODEL_DECOMP
fn step_37() -> Unit raise {
  let t67 = @simp.rewrite_tac(@list.List([dom_def(), fun_def(), pred_def()]))
  let t68 = @tactics.then_tac(@simp.rewrite_tac(@list.List([model_eq()])), t67)
  model_decomp_c.set(@tactics.prove(@term_syntax.parse_term("(M : ((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool)) == (Dom(M), Fun(M), Pred(M))"), t68))
}

///|
let model_decomp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MODEL_DECOMP")

///|
/// `MODEL_DECOMP`
pub fn model_decomp() -> @kernel.Thm {
  model_decomp_c.get()
}

///|
/// FVT
fn step_38() -> Unit raise {
  let t69 = @term_syntax.parse_term("(∀ x : Num, (FVT : (Term, Num) -> Bool)(V(x)) == {x}) && (∀ f : Num, ∀ l : List[Term], FVT(Fn(f, l)) == LIST_UNION(MAP(FVT, l)))")
  fvt_c.set(@recursion.new_recursive_definition(term_recursion())(t69))
}

///|
let fvt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FVT")

///|
/// `FVT`
pub fn fvt() -> @kernel.Thm {
  fvt_c.get()
}

///|
/// FV
fn step_39() -> Unit raise {
  let t70 = @term_syntax.parse_term("(FV : (Form, Num) -> Bool)(False) == {} && (∀ a : Num, ∀ l : List[Term], FV(Atom(a, l)) == LIST_UNION(MAP(FVT, l))) && (∀ p : Form, ∀ q : Form, FV(op_minus_minus_gt(p, q)) == UNION(FV(p), FV(q))) && (∀ x : Num, ∀ p : Form, FV(op_bang_bang(x, p)) == DELETE(FV(p), x))")
  fv_c.set(@recursion.new_recursive_definition(form_recursion())(t70))
}

///|
let fv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FV")

///|
/// `FV`
pub fn fv() -> @kernel.Thm {
  fv_c.get()
}

///|
/// BV
fn step_40() -> Unit raise {
  let t71 = @term_syntax.parse_term("(BV : (Form, Num) -> Bool)(False) == {} && (∀ a : Num, ∀ l : List[Term], BV(Atom(a, l)) == {}) && (∀ p : Form, ∀ q : Form, BV(op_minus_minus_gt(p, q)) == UNION(BV(p), BV(q))) && (∀ x : Num, ∀ p : Form, BV(op_bang_bang(x, p)) == INSERT(x, BV(p)))")
  bv_c.set(@recursion.new_recursive_definition(form_recursion())(t71))
}

///|
let bv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BV")

///|
/// `BV`
pub fn bv() -> @kernel.Thm {
  bv_c.get()
}

///|
/// FVT_FINITE
fn step_41() -> Unit raise {
  let t75 = @simp.asm_rewrite_tac(@list.List([@lists.all_map(), @trivia.o_def()]))
  let t74 = @tactics.match_mp_tac(list_union_finite())
  let t73 = @tactics.repeat_tac(@tactics.strip_tac)
  let t72 = @simp.rewrite_tac(@list.List([fvt(), @sets.finite_rules(), @sets.finite_insert()]))
  let t76 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(term_induct()), t72), t73), t74), t75)
  fvt_finite_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : Term, FINITE(FVT(t))"), t76))
}

///|
let fvt_finite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FVT_FINITE")

///|
/// `FVT_FINITE`
pub fn fvt_finite() -> @kernel.Thm {
  fvt_finite_c.get()
}

///|
/// FV_FINITE
fn step_42() -> Unit raise {
  let t79 = @simp.rewrite_tac(@list.List([@lists.all_map(), fvt_finite(), @trivia.o_def(), @lists.all_t()]))
  let t78 = @tactics.match_mp_tac(list_union_finite())
  let t77 = @simp.asm_rewrite_tac(@list.List([fv(), @sets.finite_rules(), @sets.finite_union(), @sets.finite_delete()]))
  let t80 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(form_induction()), t77), @tactics.gen_tac), t78), t79)
  fv_finite_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, FINITE(FV(p))"), t80))
}

///|
let fv_finite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FV_FINITE")

///|
/// `FV_FINITE`
pub fn fv_finite() -> @kernel.Thm {
  fv_finite_c.get()
}

///|
/// BV_FINITE
fn step_43() -> Unit raise {
  let t81 = @simp.asm_rewrite_tac(@list.List([bv(), @sets.finite_rules(), @sets.finite_union(), @sets.finite_insert()]))
  let t82 = @tactics.then_tac(@tactics.match_mp_tac(form_induction()), t81)
  bv_finite_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, FINITE(BV(p))"), t82))
}

///|
let bv_finite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BV_FINITE")

///|
/// `BV_FINITE`
pub fn bv_finite() -> @kernel.Thm {
  bv_finite_c.get()
}

///|
/// FV_EXISTS
fn step_44() -> Unit raise {
  let t83 = @sets.set_tac(@list.List([]))
  let t84 = @tactics.then_tac(@simp.rewrite_tac(@list.List([exists_def(), not_def(), fv()])), t83)
  fv_exists_c.set(@tactics.prove(@term_syntax.parse_term("FV(op_q_q((x : Num), (p : Form))) == DELETE(FV(p), x)"), t84))
}

///|
let fv_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FV_EXISTS")

///|
/// `FV_EXISTS`
pub fn fv_exists() -> @kernel.Thm {
  fv_exists_c.get()
}

///|
/// valmod
fn step_45() -> Unit raise {
  valmod_c.set(@pair.new_definition(@term_syntax.parse_term("(valmod : ((_, _), (_) -> _, _) -> _)(((x : _), (a : _)), (v : (_) -> _)) == ((y : _) => if y == x { a } else { v(y) })")))
}

///|
let valmod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("valmod")

///|
/// `valmod`
pub fn valmod() -> @kernel.Thm {
  valmod_c.get()
}

///|
/// VALMOD_CLAUSES
fn step_46() -> Unit raise {
  let t86 = @meson.asm_meson_tac(@list.List([]))
  let t85 = @tactics.repeat_tac(@tactics.gen_tac)
  let t87 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([valmod()])), t85), @class.cond_cases_tac), t86)
  valmod_clauses_c.set(@tactics.prove(@term_syntax.parse_term("(∀ v : (_) -> _, ∀ a : _, ∀ k : _, valmod((k, a), v, k) == a) && (∀ v : (_) -> _, ∀ a : _, ∀ k : _, ∀ x : _, !(x == k) → valmod((k, a), v, x) == v(x))"), t87))
}

///|
let valmod_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VALMOD_CLAUSES")

///|
/// `VALMOD_CLAUSES`
pub fn valmod_clauses() -> @kernel.Thm {
  valmod_clauses_c.get()
}

///|
/// VALMOD_TRIV
fn step_47() -> Unit raise {
  let t89 = @simp.asm_rewrite_tac(@list.List([]))
  let t88 = @tactics.repeat_tac(@tactics.gen_tac)
  let t90 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([valmod(), @class.fun_eq_thm()])), t88), @class.cond_cases_tac), t89)
  valmod_triv_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : (_) -> _, ∀ x : _, valmod((x, v(x)), v) == v"), t90))
}

///|
let valmod_triv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VALMOD_TRIV")

///|
/// `VALMOD_TRIV`
pub fn valmod_triv() -> @kernel.Thm {
  valmod_triv_c.get()
}

///|
/// VALMOD_VALMOD
fn step_48() -> Unit raise {
  let t95 = @tactics.repeat_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_rewrite_tac(@list.List([]))))
  let t94 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t93 = @simp.asm_rewrite_tac(@list.List([]))
  let t92 = @tactics.repeat_tac(@class.cond_cases_tac)
  let t91 = @simp.rewrite_tac(@list.List([valmod()]))
  let t96 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t91), t92), t93), t94), @tactics.gen_tac), t95)
  valmod_valmod_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : (_) -> _, ∀ a : _, ∀ x : _, ∀ b : _, valmod((x, a), valmod((x, b), v)) == valmod((x, a), v)"), t96))
}

///|
let valmod_valmod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VALMOD_VALMOD")

///|
/// `VALMOD_VALMOD`
pub fn valmod_valmod() -> @kernel.Thm {
  valmod_valmod_c.get()
}

///|
/// valuation
fn step_49() -> Unit raise {
  valuation_c.set(@pair.new_definition(@term_syntax.parse_term("(valuation : (((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool), (Num) -> _) -> Bool)((M : ((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool)), (v : (Num) -> _)) == (∀ x : Num, IN(v(x), Dom(M)))")))
}

///|
let valuation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("valuation")

///|
/// `valuation`
pub fn valuation() -> @kernel.Thm {
  valuation_c.get()
}

///|
/// VALUATION_VALMOD
fn step_50() -> Unit raise {
  let t99 = @simp.asm_rewrite_tac(@list.List([]))
  let t98 = @tactics.repeat_tac(@tactics.strip_tac)
  let t97 = @simp.rewrite_tac(@list.List([valuation(), valmod()]))
  let t100 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t97), t98), @class.cond_cases_tac), t99)
  valuation_valmod_c.set(@tactics.prove(@term_syntax.parse_term("∀ M : ((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool), ∀ a : _, ∀ v : (Num) -> _, valuation(M, v) && IN(a, Dom(M)) → valuation(M, valmod(((x : Num), a), v))"), t100))
}

///|
let valuation_valmod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VALUATION_VALMOD")

///|
/// `VALUATION_VALMOD`
pub fn valuation_valmod() -> @kernel.Thm {
  valuation_valmod_c.get()
}

///|
/// VALUATION_IS_VALMOD
fn step_51() -> Unit raise {
  let t102 = @simp.asm_rewrite_tac(@list.List([]))
  let t101 = @tactics.repeat_tac(@tactics.gen_tac)
  let t103 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([valmod(), @class.fun_eq_thm()])), t101), @class.cond_cases_tac), t102)
  valuation_is_valmod_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : (_) -> _, ∀ x : _, valmod((x, v(x)), v) == v"), t103))
}

///|
let valuation_is_valmod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VALUATION_IS_VALMOD")

///|
/// `VALUATION_IS_VALMOD`
pub fn valuation_is_valmod() -> @kernel.Thm {
  valuation_is_valmod_c.get()
}

///|
/// Logic/fol.ml:289
fn step_52() -> Unit raise {
  @printer.parse_as_infix("satisfies", (10L, "right"))
}

///|
/// termval
fn step_53() -> Unit raise {
  termval_c.set(new_nested_recursive_definition(term_recursion(), @term_syntax.parse_term("(∀ x : Num, (termval : (((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool), (Num) -> _, Term) -> _)((M : ((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool)), (v : (Num) -> _), V(x)) == v(x)) && (∀ f : Num, ∀ l : List[Term], termval(M, v, Fn(f, l)) == Fun(M, f, MAP(termval(M, v), l)))")))
}

///|
let termval_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("termval")

///|
/// `termval`
pub fn termval() -> @kernel.Thm {
  termval_c.get()
}

///|
/// holds
fn step_54() -> Unit raise {
  let t104 = @term_syntax.parse_term("(holds : (((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool), (Num) -> _, Form) -> Bool)((M : ((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool)), (v : (Num) -> _), False) == false && (∀ a : Num, ∀ l : List[Term], holds(M, v, Atom(a, l)) == Pred(M, a, MAP(termval(M, v), l))) && (∀ p : Form, ∀ q : Form, holds(M, v, op_minus_minus_gt(p, q)) == (holds(M, v, p) → holds(M, v, q))) && (∀ x : Num, ∀ p : Form, holds(M, v, op_bang_bang(x, p)) == (∀ a : _, IN(a, Dom(M)) → holds(M, valmod((x, a), v), p)))")
  holds_c.set(@recursion.new_recursive_definition(form_recursion())(t104))
}

///|
let holds_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("holds")

///|
/// `holds`
pub fn holds() -> @kernel.Thm {
  holds_c.get()
}

///|
/// hold
fn step_55() -> Unit raise {
  hold_c.set(@pair.new_definition(@term_syntax.parse_term("(hold : (((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool), (Num) -> _, (Form) -> Bool) -> Bool)((M : ((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool)), (v : (Num) -> _), (fms : (Form) -> Bool)) == (∀ p : Form, IN(p, fms) → holds(M, v, p))")))
}

///|
let hold_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("hold")

///|
/// `hold`
pub fn hold() -> @kernel.Thm {
  hold_c.get()
}

///|
/// satisfies
fn step_56() -> Unit raise {
  satisfies_c.set(@pair.new_definition(@term_syntax.parse_term("(satisfies : (((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool), (Form) -> Bool) -> Bool)((M : ((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool)), (fms : (Form) -> Bool)) == (∀ v : (Num) -> _, ∀ p : Form, valuation(M, v) && IN(p, fms) → holds(M, v, p))")))
}

///|
let satisfies_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("satisfies")

///|
/// `satisfies`
pub fn satisfies() -> @kernel.Thm {
  satisfies_c.get()
}

///|
/// SATISFIES_1
fn step_57() -> Unit raise {
  let t105 = @meson.meson_tac(@list.List([]))
  let t106 = @tactics.then_tac(@simp.rewrite_tac(@list.List([satisfies(), @sets.in_insert(), @sets.not_in_empty()])), t105)
  satisfies_1_c.set(@tactics.prove(@term_syntax.parse_term("satisfies((M : ((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool)), {(p : Form)}) == (∀ v : (Num) -> _, valuation(M, v) → holds(M, v, p))"), t106))
}

///|
let satisfies_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SATISFIES_1")

///|
/// `SATISFIES_1`
pub fn satisfies_1() -> @kernel.Thm {
  satisfies_1_c.get()
}

///|
/// HOLDS
fn step_58() -> Unit raise {
  let t107 = @meson.meson_tac(@list.List([]))
  let t108 = @tactics.then_tac(@simp.rewrite_tac(@list.List([not_def(), true_def(), or_def(), and_def(), iff_def(), exists_def(), holds()])), t107)
  holds_v1_c.set(@tactics.prove(@term_syntax.parse_term("holds((M : ((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool)), (v : (Num) -> _), False) == false && holds(M, v, True) == true && (∀ a : Num, ∀ l : List[Term], holds(M, v, Atom(a, l)) == Pred(M, a, MAP(termval(M, v), l))) && (∀ p : Form, holds(M, v, Not(p)) == !holds(M, v, p)) && (∀ p : Form, ∀ q : Form, holds(M, v, op_bar_bar(p, q)) == (holds(M, v, p) || holds(M, v, q))) && (∀ p : Form, ∀ q : Form, holds(M, v, op_amp_amp(p, q)) == (holds(M, v, p) && holds(M, v, q))) && (∀ p : Form, ∀ q : Form, holds(M, v, op_minus_minus_gt(p, q)) == (holds(M, v, p) → holds(M, v, q))) && (∀ p : Form, ∀ q : Form, holds(M, v, op_lt_minus_gt(p, q)) == (holds(M, v, p) == holds(M, v, q))) && (∀ x : Num, ∀ p : Form, holds(M, v, op_bang_bang(x, p)) == (∀ a : _, IN(a, Dom(M)) → holds(M, valmod((x, a), v), p))) && (∀ x : Num, ∀ p : Form, holds(M, v, op_q_q(x, p)) == (∃ a : _, IN(a, Dom(M)) && holds(M, valmod((x, a), v), p)))"), t108))
}

///|
let holds_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLDS")

///|
/// `HOLDS`
pub fn holds_v1() -> @kernel.Thm {
  holds_v1_c.get()
}

///|
/// TERMVAL_VALUATION
fn step_59() -> Unit raise {
  let t109 = @meson.asm_meson_tac(@list.List([]))
  let t110 = @tactics.then_tac(@tactics.then_tac(@lists.list_induct_tac, @simp.rewrite_tac(@list.List([@lists.map(), list_union(), @sets.in_union(), @lists.mem()]))), t109)
  let lemma = @tactics.prove(@term_syntax.parse_term("∀ l : List[Term], ∀ t : Term, ∀ x : Num, IN(x, FVT(t)) && MEM(t, l) → IN(x, LIST_UNION(MAP(FVT, l)))"), t110)
  let t122 = @meson.asm_meson_tac(@list.List([lemma]))
  let t121 = @simp.asm_rewrite_tac(@list.List([]))
  let t120 = @tactics.exists_tac(@term_syntax.parse_term("(t : Term) => ∀ v : (Num) -> A, ∀ v' : (Num) -> A, (∀ x : Num, IN(x, FVT(t)) → v'(x) == v(x)) → termval((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), v', t) == termval(M, v, t)"))
  let t119 = @tactics.match_mp_tac(@lists.all_imp())
  let t123 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@lists.map_eq()), t119), t120), t121), t122)
  let t118 = @simp.asm_rewrite_tac(@list.List([]))
  let t117 = @tactics.first_assum(@tactics.match_mp_tac)
  let t116 = @tactics.repeat_tac(@tactics.strip_tac)
  let t124 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(@tactics.match_mp_tac), t116), t117), t118), t123])
  let t115 = @simp.rewrite_tac(@list.List([@lists.cons_11()]))
  let t114 = @tactics.repeat_tac(@tactics.strip_tac)
  let t113 = @simp.rewrite_tac(@list.List([@lists.all(), list_union(), @lists.map(), @sets.in_union()]))
  let t125 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @lists.list_induct_tac), t113), t114), @tactics.ap_term_tac), t115), @tactics.conj_tac), t124)
  let t112 = @meson.meson_tac(@list.List([]))
  let t126 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_insert(), @sets.not_in_empty()])), t112), t125])
  let t111 = @simp.rewrite_tac(@list.List([fvt(), termval()]))
  let t127 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(term_induct())), t111), @tactics.conj_tac), t126)
  termval_valuation_c.set(@tactics.prove(@term_syntax.parse_term("∀ M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), ∀ t : Term, ∀ v : (Num) -> A, ∀ v' : (Num) -> A, (∀ x : Num, IN(x, FVT(t)) → v'(x) == v(x)) → termval(M, v', t) == termval(M, v, t)"), t127))
}

///|
let termval_valuation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TERMVAL_VALUATION")

///|
/// `TERMVAL_VALUATION`
pub fn termval_valuation() -> @kernel.Thm {
  termval_valuation_c.get()
}

///|
/// HOLDS_VALUATION
fn step_60() -> Unit raise {
  let t144 = @meson.asm_meson_tac(@list.List([]))
  let t143 = @simp.asm_rewrite_tac(@list.List([valmod()]))
  let t142 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Num) == (p : Num)"))
  let t141 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)"))
  let t140 = @tactics.first_assum(@tactics.match_mp_tac)
  let t139 = @tactics.repeat_tac(@tactics.strip_tac)
  let t145 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)")), t139), @tactics.ap_term_tac), @tactics.abs_tac), @tactics.ap_term_tac), t140), t141), t142), t143), t144)
  let t146 = @meson.meson_tac(@list.List([]))
  let t138 = @meson.asm_meson_tac(@list.List([termval_valuation()]))
  let t137 = @simp.rewrite_tac(@list.List([@lists.map(), list_union(), @sets.in_union()]))
  let t135 = @term_syntax.parse_term("(l : List[Term])")
  let t136 = @tactics.spec_tac(@term_syntax.parse_term("(l : List[Term])"), t135)
  let t134 = @tactics.pop_assum(fn(x131 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s132 = @tactics.mp_tac(x131)
    fn(x133 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s132(x133)
    }
  })
  let t130 = @tactics.repeat_tac(@tactics.strip_tac)
  let t147 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.x_gen_tac(@term_syntax.parse_term("(l : List[Term])"))), t130), @tactics.ap_term_tac), t134), t136), @lists.list_induct_tac), t137), t138), t146, t145])
  let t129 = @tactics.repeat_tac(@tactics.conj_tac)
  let t128 = @simp.rewrite_tac(@list.List([fv(), holds_v1(), @sets.in_union(), @sets.in_delete()]))
  let t148 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(form_induction())), t128), t129), t147)
  holds_valuation_c.set(@tactics.prove(@term_syntax.parse_term("∀ M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), ∀ p : Form, ∀ v : (Num) -> A, ∀ v' : (Num) -> A, (∀ x : Num, IN(x, FV(p)) → v'(x) == v(x)) → holds(M, v', p) == holds(M, v, p)"), t148))
}

///|
let holds_valuation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLDS_VALUATION")

///|
/// `HOLDS_VALUATION`
pub fn holds_valuation() -> @kernel.Thm {
  holds_valuation_c.get()
}

///|
/// satisfiable
fn step_61() -> Unit raise {
  satisfiable_c.set(@pair.new_definition(@term_syntax.parse_term("(satisfiable : ((A) -> Bool, (Form) -> Bool) -> Bool)((U : (A) -> Bool), (fms : (Form) -> Bool)) == (∃ M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), !(Dom(M) == {}) && satisfies(M, fms))")))
}

///|
let satisfiable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("satisfiable")

///|
/// `satisfiable`
pub fn satisfiable() -> @kernel.Thm {
  satisfiable_c.get()
}

///|
/// valid
fn step_62() -> Unit raise {
  valid_c.set(@pair.new_definition(@term_syntax.parse_term("(valid : ((A) -> Bool, (Form) -> Bool) -> Bool)((U : (A) -> Bool), (fms : (Form) -> Bool)) == (∀ M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), satisfies(M, fms))")))
}

///|
let valid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("valid")

///|
/// `valid`
pub fn valid() -> @kernel.Thm {
  valid_c.get()
}

///|
/// entails
fn step_63() -> Unit raise {
  entails_c.set(@pair.new_definition(@term_syntax.parse_term("(entails : ((A) -> Bool, (Form) -> Bool, Form) -> Bool)((U : (A) -> Bool), (A : (Form) -> Bool), (p : Form)) == (∀ M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), ∀ v : (Num) -> A, hold(M, v, A) → holds(M, v, p))")))
}

///|
let entails_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("entails")

///|
/// `entails`
pub fn entails() -> @kernel.Thm {
  entails_c.get()
}

///|
/// equivalent
fn step_64() -> Unit raise {
  equivalent_c.set(@pair.new_definition(@term_syntax.parse_term("(equivalent : ((A) -> Bool, Form, Form) -> Bool)((U : (A) -> Bool), (p : Form), (q : Form)) == (∀ M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), ∀ v : (Num) -> A, holds(M, v, p) == holds(M, v, q))")))
}

///|
let equivalent_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("equivalent")

///|
/// `equivalent`
pub fn equivalent() -> @kernel.Thm {
  equivalent_c.get()
}

///|
/// interpretation
fn step_65() -> Unit raise {
  interpretation_c.set(@pair.new_definition(@term_syntax.parse_term("(interpretation : ((((Num, Num)) -> Bool, ((Num, Num)) -> Bool), ((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool)) -> Bool)(((fns : ((Num, Num)) -> Bool), (preds : ((Num, Num)) -> Bool)), (M : ((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool))) == (∀ f : Num, ∀ l : List[_], IN((f, LENGTH(l)), fns) && ALL((x : _) => IN(x, Dom(M)), l) → IN(Fun(M, f, l), Dom(M)))")))
}

///|
let interpretation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("interpretation")

///|
/// `interpretation`
pub fn interpretation() -> @kernel.Thm {
  interpretation_c.get()
}

///|
/// INTERPRETATION_TERMVAL
fn step_66() -> Unit raise {
  let t181 = @meson.asm_meson_tac(@list.List([]))
  let t180 = @simp.rewrite_tac(@list.List([list_union(), @lists.map(), @sets.in_union()]))
  let t179 = @simp.rewrite_tac(@list.List([@lists.mem()]))
  let t177 = @term_syntax.parse_term("(l : List[Term])")
  let t178 = @tactics.spec_tac(@term_syntax.parse_term("(l : List[Term])"), t177)
  let t176 = @tactics.undisch_tac(@term_syntax.parse_term("MEM((x : Term), (l : List[Term]))"))
  let t175 = @simp.rewrite_tac(@list.List([@sets.in_insert()]))
  let t174 = @simp.rewrite_tac(@list.List([functions_term()]))
  let t173 = @simp.asm_rewrite_tac(@list.List([]))
  let t172 = @tactics.first_assum(@tactics.match_mp_tac)
  let t171 = @tactics.repeat_tac(@tactics.strip_tac)
  let t170 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x167 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s168 = @tactics.assume_tac(x167)
    fn(x169 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s168(x169)
    }
  }, @tactics.match_mp_tac))
  let t166 = @simp.asm_rewrite_tac(@list.List([]))
  let t165 = @tactics.first_assum(fn(x164 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x162 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x159 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s160 = @tactics.exists_tac(x159)
        fn(x161 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s160(x161)
        }
      })(@equal.lhand(x162))
    })((fn(x163 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x163)
    })(x164))
  })
  let t158 = @tactics.match_mp_tac(@lists.all_imp())
  let t157 = @simp.rewrite_tac(@list.List([@trivia.o_def()]))
  let t156 = @simp.rewrite_tac(@list.List([@lists.all_map()]))
  let t155 = @simp.rewrite_tac(@list.List([@lists.length_map(), functions_term(), @sets.in_insert()]))
  let t154 = @tactics.first_assum(@tactics.match_mp_tac)
  let t182 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t154), t155), t156), t157), t158), t165), t166), @tactics.gen_tac), t170), t171), t172), t173), t174), t175), @tactics.disj2_tac), t176), t178), @lists.list_induct_tac), t179), t180), t181)
  let t153 = @simp.asm_rewrite_tac(@list.List([]))
  let t152 = @tactics.repeat_tac(@tactics.strip_tac)
  let t183 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([valuation()])), t152), t153), t182])
  let t151 = @simp.rewrite_tac(@list.List([termval()]))
  let t150 = @tactics.match_mp_tac(term_induct())
  let t149 = @simp.rewrite_tac(@list.List([interpretation()]))
  let t184 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @tactics.gen_tac), t149), t150), t151), @tactics.conj_tac), t183)
  interpretation_termval_c.set(@tactics.prove(@term_syntax.parse_term("∀ any : ((Num, Num)) -> Bool, ∀ M : ((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool), ∀ v : (Num) -> _, ∀ t : Term, interpretation((functions_term(t), any), M) && valuation(M, v) → IN(termval(M, v, t), Dom(M))"), t184))
}

///|
let interpretation_termval_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERPRETATION_TERMVAL")

///|
/// `INTERPRETATION_TERMVAL`
pub fn interpretation_termval() -> @kernel.Thm {
  interpretation_termval_c.get()
}

///|
/// INTERPRETATION_SUBLANGUAGE
fn step_67() -> Unit raise {
  let t185 = @meson.meson_tac(@list.List([]))
  let t186 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([interpretation(), @sets.subset()]))), t185)
  interpretation_sublanguage_c.set(@tactics.prove(@term_syntax.parse_term("∀ M : ((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool), ∀ funs1 : ((Num, Num)) -> Bool, ∀ funs2 : ((Num, Num)) -> Bool, ∀ preds1 : ((Num, Num)) -> Bool, ∀ preds2 : ((Num, Num)) -> Bool, SUBSET(funs2, funs1) → interpretation((funs1, preds1), M) → interpretation((funs2, preds2), M)"), t186))
}

///|
let interpretation_sublanguage_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERPRETATION_SUBLANGUAGE")

///|
/// `INTERPRETATION_SUBLANGUAGE`
pub fn interpretation_sublanguage() -> @kernel.Thm {
  interpretation_sublanguage_c.get()
}

///|
/// termsubst
fn step_68() -> Unit raise {
  termsubst_c.set(new_nested_recursive_definition(term_recursion(), @term_syntax.parse_term("(∀ x : Num, (termsubst : ((Num) -> Term, Term) -> Term)((v : (Num) -> Term), V(x)) == v(x)) && (∀ f : Num, ∀ l : List[Term], termsubst(v, Fn(f, l)) == Fn(f, MAP(termsubst(v), l)))")))
}

///|
let termsubst_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("termsubst")

///|
/// `termsubst`
pub fn termsubst() -> @kernel.Thm {
  termsubst_c.get()
}

///|
/// TERMSUBST_TERMVAL
fn step_69() -> Unit raise {
  let t191 = @simp.asm_rewrite_tac(@list.List([]))
  let t190 = @tactics.match_mp_tac(@lists.map_eq())
  let t189 = @tactics.repeat_tac(@tactics.strip_tac)
  let t188 = @simp.asm_rewrite_tac(@list.List([termsubst(), termval()]))
  let t187 = @tactics.match_mp_tac(term_induct())
  let t192 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), @tactics.gen_tac), t187), t188), t189), @tactics.ap_term_tac), t190), t191)
  termsubst_termval_c.set(@tactics.prove(@term_syntax.parse_term("∀ M : ((Term) -> Bool, (Num, List[Term]) -> Term, (Num, List[Term]) -> Bool), Fun(M) == Fn → (∀ v : (Num) -> Term, ∀ t : Term, termsubst(v, t) == termval(M, v, t))"), t192))
}

///|
let termsubst_termval_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TERMSUBST_TERMVAL")

///|
/// `TERMSUBST_TERMVAL`
pub fn termsubst_termval() -> @kernel.Thm {
  termsubst_termval_c.get()
}

///|
/// TERMVAL_TRIV
fn step_70() -> Unit raise {
  let t197 = @simp.asm_rewrite_tac(@list.List([]))
  let t196 = @tactics.match_mp_tac(@lists.map_eq_degen())
  let t195 = @tactics.repeat_tac(@tactics.strip_tac)
  let t194 = @simp.asm_rewrite_tac(@list.List([termval()]))
  let t193 = @tactics.match_mp_tac(term_induct())
  let t198 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), t193), t194), t195), @tactics.ap_term_tac), t196), t197)
  termval_triv_c.set(@tactics.prove(@term_syntax.parse_term("∀ M : ((Term) -> Bool, (Num, List[Term]) -> Term, (Num, List[Term]) -> Bool), Fun(M) == Fn → (∀ t : Term, termval(M, V, t) == t)"), t198))
}

///|
let termval_triv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TERMVAL_TRIV")

///|
/// `TERMVAL_TRIV`
pub fn termval_triv() -> @kernel.Thm {
  termval_triv_c.get()
}

///|
/// TERMVAL_TERMSUBST
fn step_71() -> Unit raise {
  let t204 = @simp.asm_rewrite_tac(@list.List([@trivia.o_thm()]))
  let t203 = @tactics.match_mp_tac(@lists.map_eq())
  let t202 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.map_o())]))
  let t201 = @tactics.repeat_tac(@tactics.strip_tac)
  let t200 = @simp.rewrite_tac(@list.List([termval(), termsubst(), @trivia.o_thm()]))
  let t199 = @tactics.match_mp_tac(term_induct())
  let t205 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @tactics.gen_tac), t199), t200), t201), @tactics.ap_term_tac), t202), t203), t204)
  termval_termsubst_c.set(@tactics.prove(@term_syntax.parse_term("∀ M : ((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool), ∀ v : (Num) -> _, ∀ i : (Num) -> Term, ∀ t : Term, termval(M, v, termsubst(i, t)) == termval(M, o(termval(M, v), i), t)"), t205))
}

///|
let termval_termsubst_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TERMVAL_TERMSUBST")

///|
/// `TERMVAL_TERMSUBST`
pub fn termval_termsubst() -> @kernel.Thm {
  termval_termsubst_c.get()
}

///|
/// TERMSUBST_TERMSUBST
fn step_72() -> Unit raise {
  let t211 = @simp.asm_rewrite_tac(@list.List([@trivia.o_thm()]))
  let t210 = @tactics.match_mp_tac(@lists.map_eq())
  let t209 = @tactics.repeat_tac(@tactics.strip_tac)
  let t208 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.map_o())]))
  let t207 = @simp.rewrite_tac(@list.List([termsubst(), @trivia.o_thm()]))
  let t206 = @tactics.match_mp_tac(term_induct())
  let t212 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), t206), t207), t208), t209), @tactics.ap_term_tac), t210), t211)
  termsubst_termsubst_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : (Num) -> Term, ∀ j : (Num) -> Term, ∀ t : Term, termsubst(j, termsubst(i, t)) == termsubst(o(termsubst(j), i), t)"), t212))
}

///|
let termsubst_termsubst_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TERMSUBST_TERMSUBST")

///|
/// `TERMSUBST_TERMSUBST`
pub fn termsubst_termsubst() -> @kernel.Thm {
  termsubst_termsubst_c.get()
}

///|
/// TERMSUBST_TRIV
fn step_73() -> Unit raise {
  let t216 = @simp.asm_rewrite_tac(@list.List([]))
  let t215 = @tactics.match_mp_tac(@lists.map_eq_degen())
  let t214 = @tactics.repeat_tac(@tactics.strip_tac)
  let t213 = @simp.rewrite_tac(@list.List([termsubst()]))
  let t217 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(term_induct()), t213), t214), @tactics.ap_term_tac), t215), t216)
  termsubst_triv_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : Term, termsubst(V, t) == t"), t217))
}

///|
let termsubst_triv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TERMSUBST_TRIV")

///|
/// `TERMSUBST_TRIV`
pub fn termsubst_triv() -> @kernel.Thm {
  termsubst_triv_c.get()
}

///|
/// TERMSUBST_VALUATION
fn step_74() -> Unit raise {
  let t222 = @simp.rewrite_tac(@list.List([termval_valuation()]))
  let t221 = @tactics.disch_then(fn(x219 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x219
    @simp.rewrite_tac(@list.List([th]))
  })
  let t218 = @simp.rewrite_tac(@list.List([fun_def()]))
  let t223 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(Dom(((a : (Term) -> Bool), Fn, (b : (Num, List[Term]) -> Bool))), Fn, Pred((a, Fn, b)))"), termsubst_termval())), t218), t221), t222)
  termsubst_valuation_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : Term, ∀ v : (Num) -> Term, ∀ v' : (Num) -> Term, (∀ x : Num, IN(x, FVT(t)) → v'(x) == v(x)) → termsubst(v', t) == termsubst(v, t)"), t223))
}

///|
let termsubst_valuation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TERMSUBST_VALUATION")

///|
/// `TERMSUBST_VALUATION`
pub fn termsubst_valuation() -> @kernel.Thm {
  termsubst_valuation_c.get()
}

///|
/// TERMSUBST_FVT
fn step_75() -> Unit raise {
  let t224 = @meson.meson_tac(@list.List([]))
  let t225 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_union(), @sets.in_elim_thm()])), t224)
  let lemma1 = @tactics.prove(@term_syntax.parse_term("{(x : _) | ∃ y : _, IN(y, UNION((s : (_) -> Bool), (t : (_) -> Bool))) && (P : (_, _) -> Bool)(x, y)} == UNION({(x : _) | ∃ y : _, IN(y, s) && P(x, y)}, {(x : _) | ∃ y : _, IN(y, t) && P(x, y)})"), t225)
  let t236 = @simp.asm_rewrite_tac(@list.List([]))
  let t235 = @tactics.first_assum(@tactics.match_mp_tac)
  let t233 = @term_syntax.parse_term("(i : (Num) -> Term)")
  let t234 = @tactics.spec_tac(@term_syntax.parse_term("(i : (Num) -> Term)"), t233)
  let t232 = @simp.asm_rewrite_tac(@list.List([]))
  let t231 = @simp.rewrite_tac(@list.List([lemma1]))
  let t230 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : (Num) -> Term)"))
  let t229 = @simp.rewrite_tac(@list.List([@lists.all()]))
  let t228 = @list.List([@simp.rewrite_tac(@list.List([@sets.extension(), @sets.not_in_empty(), @sets.subset(), @sets.in_elim_thm()])), @tactics.all_tac])
  let t237 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@lists.list_induct_tac, @simp.rewrite_tac(@list.List([@lists.map(), list_union()]))), t228), t229), @tactics.strip_tac), t230), t231), @tactics.binop_tac), t232), t234), t235), t236)
  let t227 = @meson.meson_tac(@list.List([]))
  let t238 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_insert(), @sets.in_elim_thm(), @sets.not_in_empty(), @sets.extension()])), t227), t237])
  let t226 = @simp.rewrite_tac(@list.List([fvt(), termsubst()]))
  let t239 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(term_induct()), t226), @tactics.conj_tac), t238)
  termsubst_fvt_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : Term, ∀ i : (Num) -> Term, FVT(termsubst(i, t)) == {(x : Num) | ∃ y : Num, IN(y, FVT(t)) && IN(x, FVT(i(y)))}"), t239))
}

///|
let termsubst_fvt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TERMSUBST_FVT")

///|
/// `TERMSUBST_FVT`
pub fn termsubst_fvt() -> @kernel.Thm {
  termsubst_fvt_c.get()
}

///|
/// MAX_SYM
fn step_76() -> Unit raise {
  max_sym_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Num, ∀ y : Num, MAX(x, y) == MAX(y, x)"), @int.arith_tac))
}

///|
let max_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MAX_SYM")

///|
/// `MAX_SYM`
pub fn max_sym() -> @kernel.Thm {
  max_sym_c.get()
}

///|
/// MAX_ASSOC
fn step_77() -> Unit raise {
  max_assoc_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ z : Num, MAX(x, MAX(y, z)) == MAX(MAX(x, y), z)"), @int.arith_tac))
}

///|
let max_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MAX_ASSOC")

///|
/// `MAX_ASSOC`
pub fn max_assoc() -> @kernel.Thm {
  max_assoc_c.get()
}

///|
/// SETMAX
fn step_78() -> Unit raise {
  setmax_c.set(@pair.new_definition(@term_syntax.parse_term("(SETMAX : ((Num) -> Bool) -> Num)((s : (Num) -> Bool)) == ITSET(MAX, s, 0)")))
}

///|
let setmax_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SETMAX")

///|
/// `SETMAX`
pub fn setmax() -> @kernel.Thm {
  setmax_c.get()
}

///|
/// VARIANT
fn step_79() -> Unit raise {
  variant_c.set(@pair.new_definition(@term_syntax.parse_term("(VARIANT : ((Num) -> Bool) -> Num)((s : (Num) -> Bool)) == SETMAX(s) + 1")))
}

///|
let variant_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VARIANT")

///|
/// `VARIANT`
pub fn variant() -> @kernel.Thm {
  variant_c.get()
}

///|
/// SETMAX_LEMMA
fn step_80() -> Unit raise {
  let t248 = @meson.asm_meson_tac(@list.List([@arith.le_cases(), @arith.le_trans(), @arith.le_antisym()]))
  let t247 = @simp.asm_rewrite_tac(@list.List([]))
  let t243 = @term_syntax.parse_term("(y : Num) <= (x : Num)")
  let t244 = @term_syntax.parse_term("(x : Num) <= (y : Num)")
  let t245 = @term_syntax.parse_term("(y : Num) <= (s : Num)")
  let t246 = @tactics.map_every(@class.asm_cases_tac, @list.List([@term_syntax.parse_term("(x : Num) <= (s : Num)"), t245, t244, t243]))
  let t242 = @tactics.repeat_tac(@tactics.gen_tac)
  let t241 = @simp.rewrite_tac(@list.List([@arith.max()]))
  let t240 = @tactics.match_mp_tac(@sets.finite_recursion())
  let t249 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([setmax()])), t240), t241), t242), t246), t247), t248)
  setmax_lemma_c.set(@tactics.prove(@term_syntax.parse_term("SETMAX({}) == 0 && (∀ x : Num, ∀ s : (Num) -> Bool, FINITE(s) → SETMAX(INSERT(x, s)) == (if IN(x, s) { SETMAX(s) } else { MAX(x, SETMAX(s)) }))"), t249))
}

///|
let setmax_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SETMAX_LEMMA")

///|
/// `SETMAX_LEMMA`
pub fn setmax_lemma() -> @kernel.Thm {
  setmax_lemma_c.get()
}

///|
/// SETMAX_MEMBER
fn step_81() -> Unit raise {
  let t256 = @meson.asm_meson_tac(@list.List([@arith.le_cases(), @arith.le_trans()]))
  let t255 = @simp.asm_rewrite_tac(@list.List([@arith.le_refl()]))
  let t254 = @tactics.repeat_tac(@tactics.strip_tac)
  let t253 = @simp.asm_rewrite_tac(@list.List([@arith.max()]))
  let t252 = @simp.asm_simp_tac(@list.List([setmax_lemma()]))
  let t251 = @tactics.repeat_tac(@tactics.gen_tac)
  let t250 = @simp.rewrite_tac(@list.List([@sets.not_in_empty(), @sets.in_insert()]))
  let t257 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.finite_induct_strong()), t250), t251), @tactics.strip_tac), t252), t253), t254), @class.cond_cases_tac), t255), t256)
  setmax_member_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, FINITE(s) → (∀ x : Num, IN(x, s) → x <= SETMAX(s))"), t257))
}

///|
let setmax_member_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SETMAX_MEMBER")

///|
/// `SETMAX_MEMBER`
pub fn setmax_member() -> @kernel.Thm {
  setmax_member_c.get()
}

///|
/// SETMAX_THM
fn step_82() -> Unit raise {
  let t260 = @meson.asm_meson_tac(@list.List([setmax_member()]))
  let t259 = @simp.rewrite_tac(@list.List([@arith.max()]))
  let t258 = @simp.asm_simp_tac(@list.List([setmax_lemma()]))
  let t261 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t258), @class.cond_cases_tac), t259), @class.cond_cases_tac), t260)
  setmax_thm_c.set(@tactics.prove(@term_syntax.parse_term("SETMAX({}) == 0 && (∀ x : Num, ∀ s : (Num) -> Bool, FINITE(s) → SETMAX(INSERT(x, s)) == MAX(x, SETMAX(s)))"), t261))
}

///|
let setmax_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SETMAX_THM")

///|
/// `SETMAX_THM`
pub fn setmax_thm() -> @kernel.Thm {
  setmax_thm_c.get()
}

///|
/// SETMAX_UNION
fn step_83() -> Unit raise {
  let t262 = @sets.set_tac(@list.List([]))
  let lemma = @tactics.prove(@term_syntax.parse_term("UNION(INSERT((x : _), (s : (_) -> Bool)), (t : (_) -> Bool)) == INSERT(x, UNION(s, t))"), t262)
  let t271 = @simp.rewrite_tac(@list.List([max_assoc()]))
  let t270 = @simp.asm_simp_tac(@list.List([setmax_thm(), @sets.finite_union()]))
  let t269 = @simp.rewrite_tac(@list.List([lemma]))
  let t268 = @tactics.repeat_tac(@tactics.strip_tac)
  let t267 = @list.List([@simp.rewrite_tac(@list.List([@arith.max(), @arith.le_0()])), @tactics.all_tac])
  let t266 = @simp.rewrite_tac(@list.List([@sets.union_empty(), setmax_thm()]))
  let t265 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t272 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("∀ t : (Num) -> Bool, FINITE(t) → (∀ s : (Num) -> Bool, FINITE(s) → SETMAX(UNION(s, t)) == MAX(SETMAX(s), SETMAX(t)))"), fn(x263 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x263
    @meson.meson_tac(@list.List([th, @sets.finite_union()]))
  }), @tactics.gen_tac), @tactics.disch_tac), t265), t266), @tactics.conj_tac), t267), t268), t269), t270), t271)
  setmax_union_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, FINITE(UNION(s, t)) → SETMAX(UNION(s, t)) == MAX(SETMAX(s), SETMAX(t))"), t272))
}

///|
let setmax_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SETMAX_UNION")

///|
/// `SETMAX_UNION`
pub fn setmax_union() -> @kernel.Thm {
  setmax_union_c.get()
}

///|
/// VARIANT_FINITE
fn step_84() -> Unit raise {
  let t273 = @meson.meson_tac(@list.List([setmax_member(), @int.arith_rule(@term_syntax.parse_term("!((x : Num) + 1 <= x)"))]))
  let t274 = @tactics.then_tac(@simp.rewrite_tac(@list.List([variant()])), t273)
  variant_finite_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, FINITE(s) → !IN(VARIANT(s), s)"), t274))
}

///|
let variant_finite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VARIANT_FINITE")

///|
/// `VARIANT_FINITE`
pub fn variant_finite() -> @kernel.Thm {
  variant_finite_c.get()
}

///|
/// VARIANT_THM
fn step_85() -> Unit raise {
  let t275 = @simp.rewrite_tac(@list.List([fv_finite()]))
  let t276 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(variant_finite())), t275)
  variant_thm_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, !IN(VARIANT(FV(p)), FV(p))"), t276))
}

///|
let variant_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VARIANT_THM")

///|
/// `VARIANT_THM`
pub fn variant_thm() -> @kernel.Thm {
  variant_thm_c.get()
}

///|
/// formsubst
fn step_86() -> Unit raise {
  let t277 = @term_syntax.parse_term("(formsubst : ((Num) -> Term, Form) -> Form)((v : (Num) -> Term), False) == False && formsubst(v, Atom((p : Num), (l : List[Term]))) == Atom(p, MAP(termsubst(v), l)) && formsubst(v, op_minus_minus_gt((q : Form), (r : Form))) == op_minus_minus_gt(formsubst(v, q), formsubst(v, r)) && formsubst(v, op_bang_bang((x : Num), q)) == LET((v' : (Num) -> Term) => LET_END(LET((z : Num) => LET_END(op_bang_bang(z, formsubst(valmod((x, V(z)), v), q))), if (∃ y : Num, IN(y, FV(op_bang_bang(x, q))) && IN(x, FVT(v'(y)))) { VARIANT(FV(formsubst(v', q))) } else { x })), valmod((x, V(x)), v))")
  formsubst_c.set(@recursion.new_recursive_definition(form_recursion())(t277))
}

///|
let formsubst_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("formsubst")

///|
/// `formsubst`
pub fn formsubst() -> @kernel.Thm {
  formsubst_c.get()
}

///|
/// FORMSUBST_TRIV
fn step_87() -> Unit raise {
  let t285 = @simp.asm_rewrite_tac(@list.List([valmod_triv()]))
  let t283 = @class.taut(@term_syntax.parse_term("!(!(p : Bool) && p)"))
  let t284 = @simp.rewrite_tac(@list.List([@equal.gsym(@theorems.conj_assoc()), @theorems.eq_sym_eq(), t283]))
  let t282 = @simp.rewrite_tac(@list.List([fvt(), @sets.in_insert(), @sets.not_in_empty(), fv(), @sets.in_delete()]))
  let t286 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([valmod_triv(), @pair.let_def(), @pair.let_end_def()])), t282), t284), t285)
  let t281 = @simp.rewrite_tac(@list.List([termsubst_triv(), @lists.all_t()]))
  let t287 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @tactics.match_mp_tac(@lists.map_eq_degen())), t281), t286])
  let t280 = @simp.asm_rewrite_tac(@list.List([]))
  let t279 = @tactics.repeat_tac(@tactics.strip_tac)
  let t278 = @simp.rewrite_tac(@list.List([formsubst()]))
  let t288 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(form_induction()), t278), t279), t280), t287)
  formsubst_triv_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, formsubst(V, p) == p"), t288))
}

///|
let formsubst_triv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORMSUBST_TRIV")

///|
/// `FORMSUBST_TRIV`
pub fn formsubst_triv() -> @kernel.Thm {
  formsubst_triv_c.get()
}

///|
/// FORMSUBST_VALUATION
fn step_88() -> Unit raise {
  let t331 = @meson.asm_meson_tac(@list.List([]))
  let t330 = @simp.asm_rewrite_tac(@list.List([]))
  let t329 = @simp.rewrite_tac(@list.List([valmod()]))
  let t332 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @tactics.first_assum(@tactics.match_mp_tac)), @tactics.gen_tac), t329), @class.cond_cases_tac), t330), t331)
  let t327 = @meson.asm_meson_tac(@list.List([]))
  let t326 = @simp.asm_rewrite_tac(@list.List([]))
  let t325 = @simp.rewrite_tac(@list.List([]))
  let t324 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Num)"))
  let t323 = @tactics.first_assum(@tactics.match_mp_tac)
  let t322 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([]))])
  let t321 = @simp.asm_rewrite_tac(@list.List([]))
  let t320 = @simp.rewrite_tac(@list.List([valmod()]))
  let t319 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)"))
  let t328 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(@tactics.match_mp_tac), t319), @tactics.disch_tac), t320), @class.cond_cases_tac), t321), t322), @tactics.ap_term_tac), @tactics.ap_term_tac), @tactics.ap_term_tac), t323), t324), t325), @class.cond_cases_tac), t326), t327)
  let t318 = @meson.asm_meson_tac(@list.List([]))
  let t317 = @simp.asm_rewrite_tac(@list.List([]))
  let t316 = @simp.rewrite_tac(@list.List([valmod()]))
  let t315 = @tactics.first_assum(@tactics.match_mp_tac)
  let t333 = @list.List([@tactics.thenl(@tactics.binop_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @tactics.ap_term_tac), t315), @tactics.gen_tac), t316), @class.cond_cases_tac), t317), t318), t328])), t332])
  let t314 = @simp.asm_rewrite_tac(@list.List([valmod_valmod()]))
  let t312 = @simp.asm_rewrite_tac(@list.List([]))
  let t311 = @simp.rewrite_tac(@list.List([valmod()]))
  let t310 = @tactics.disch_then(@tactics.ante_res_then(fn(x307 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s308 = @tactics.assume_tac(x307)
    fn(x309 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s308(x309)
    }
  }))
  let t306 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool) == (c : Bool)) → (a && b) == (a && c)")))
  let t313 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @tactics.abs_tac), t306), t310), t311), @class.cond_cases_tac), t312), @tactics.all_tac])
  let t305 = @tactics.subgoal_then(@term_syntax.parse_term("(∃ y : Num, (IN(y, FV((a1 : Form))) && !(y == (p : Num))) && IN(p, FVT(valmod((p, V(p)), (v' : (Num) -> Term), y)))) == (∃ y : Num, (IN(y, FV(a1)) && !(y == p)) && IN(p, FVT(valmod((p, V(p)), (v : (Num) -> Term), y))))"), fn(x302 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s303 = @tactics.subst1_tac(x302)
    fn(x304 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s303(x304)
    }
  })
  let t301 = @simp.rewrite_tac(@list.List([@pair.let_def(), @pair.let_end_def()]))
  let t300 = @tactics.repeat_tac(@tactics.strip_tac)
  let t334 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)")), t300), t301), t305), t313), @class.cond_cases_tac), t314), t333)
  let t335 = @meson.meson_tac(@list.List([]))
  let t299 = @meson.asm_meson_tac(@list.List([termsubst_valuation()]))
  let t298 = @simp.rewrite_tac(@list.List([@lists.map(), list_union(), @sets.in_union()]))
  let t296 = @term_syntax.parse_term("(l : List[Term])")
  let t297 = @tactics.spec_tac(@term_syntax.parse_term("(l : List[Term])"), t296)
  let t295 = @tactics.pop_assum(fn(x292 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s293 = @tactics.mp_tac(x292)
    fn(x294 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s293(x294)
    }
  })
  let t291 = @tactics.repeat_tac(@tactics.strip_tac)
  let t336 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.x_gen_tac(@term_syntax.parse_term("(l : List[Term])"))), t291), @tactics.ap_term_tac), t295), t297), @lists.list_induct_tac), t298), t299), t335, t334])
  let t290 = @tactics.repeat_tac(@tactics.conj_tac)
  let t289 = @simp.rewrite_tac(@list.List([fv(), formsubst(), @sets.in_union(), @sets.in_delete()]))
  let t337 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(form_induction()), t289), t290), t336)
  formsubst_valuation_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ v : (Num) -> Term, ∀ v' : (Num) -> Term, (∀ x : Num, IN(x, FV(p)) → v'(x) == v(x)) → formsubst(v', p) == formsubst(v, p)"), t337))
}

///|
let formsubst_valuation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORMSUBST_VALUATION")

///|
/// `FORMSUBST_VALUATION`
pub fn formsubst_valuation() -> @kernel.Thm {
  formsubst_valuation_c.get()
}

///|
/// FORMSUBST_FV
fn step_89() -> Unit raise {
  let t338 = @meson.meson_tac(@list.List([]))
  let t339 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_union(), @sets.in_elim_thm()])), t338)
  let lemma1 = @tactics.prove(@term_syntax.parse_term("{(x : _) | ∃ y : _, IN(y, UNION((s : (_) -> Bool), (t : (_) -> Bool))) && (P : (_, _) -> Bool)(x, y)} == UNION({(x : _) | ∃ y : _, IN(y, s) && P(x, y)}, {(x : _) | ∃ y : _, IN(y, t) && P(x, y)})"), t339)
  let t373 = @meson.meson_tac(@list.List([]))
  let t372 = @simp.asm_rewrite_tac(@list.List([fvt(), @sets.in_insert(), @sets.not_in_empty(), @sets.in_delete()]))
  let t371 = @simp.rewrite_tac(@list.List([valmod()]))
  let t367 = @term_syntax.parse_term("(y : Num)")
  let t370 = @tactics.disch_then(fn(x369 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x364 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s365 = @tactics.mp_tac(x364)
      fn(x366 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s365(x366)
      }
    })(((x368 : @kernel.Thm) => @bool.spec(t367, x368))(x369))
  })
  let t361 = @simp.gen_rewrite_rule(fn(x360 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x360
  }, @list.List([@class.not_exists_thm()]))
  let t363 = @tactics.first_x_assum(fn(x362 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x357 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s358 = @tactics.mp_tac(x357)
      fn(x359 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s358(x359)
      }
    })(t361(x362))
  })
  let t356 = @tactics.repeat_tac(@tactics.strip_tac)
  let t355 = @simp.rewrite_tac(@list.List([@theorems.left_and_exists_thm()]))
  let t354 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_delete(), @sets.in_elim_thm()]))
  let t353 = @simp.asm_rewrite_tac(@list.List([]))
  let t351 = @simp.abbrev_tac(@term_syntax.parse_term("(a0' : Num) == VARIANT(FV(formsubst(valmod(((a0 : Num), V(a0)), (i : (Num) -> Term)), (a1 : Form))))"))
  let t352 = @list.List([@tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("formsubst(valmod(((a0 : Num), V(a0)), (i : (Num) -> Term)), (a1 : Form))"), variant_thm())), t351), @tactics.all_tac])
  let t350 = @simp.rewrite_tac(@list.List([fv(), valmod_valmod()]))
  let t349 = @simp.rewrite_tac(@list.List([@pair.let_def(), @pair.let_end_def()]))
  let t374 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t349), @class.cond_cases_tac), t350), t352), t353), t354), t355), t356), @tactics.ap_term_tac), @tactics.abs_tac), t363), t370), t371), @class.cond_cases_tac), t372), t373)
  let t348 = @meson.meson_tac(@list.List([]))
  let t347 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm(), @sets.not_in_empty(), @sets.in_union()]))
  let t346 = @simp.asm_rewrite_tac(@list.List([]))
  let t375 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t346), t347), t348)
  let t345 = @meson.meson_tac(@list.List([]))
  let t344 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm(), @sets.not_in_empty(), @sets.in_union()]))
  let t343 = @simp.asm_rewrite_tac(@list.List([]))
  let t342 = @simp.rewrite_tac(@list.List([list_union(), @lists.map()]))
  let t376 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@lists.map_o()), @trivia.o_def(), termsubst_fvt()])), @lists.list_induct_tac), t342), t343), t344), t345)
  let t377 = @list.List([@simp.rewrite_tac(@list.List([@sets.extension(), @sets.not_in_empty(), @sets.in_elim_thm()])), t376, t375, t374])
  let t341 = @tactics.repeat_tac(@tactics.conj_tac)
  let t340 = @simp.rewrite_tac(@list.List([formsubst(), fv()]))
  let t378 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(form_induction()), t340), t341), t377)
  formsubst_fv_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ i : (Num) -> Term, FV(formsubst(i, p)) == {(x : Num) | ∃ y : Num, IN(y, FV(p)) && IN(x, FVT(i(y)))}"), t378))
}

///|
let formsubst_fv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORMSUBST_FV")

///|
/// `FORMSUBST_FV`
pub fn formsubst_fv() -> @kernel.Thm {
  formsubst_fv_c.get()
}

///|
/// HOLDS_FORMSUBST
fn step_90() -> Unit raise {
  let t439 = @meson.asm_meson_tac(@list.List([]))
  let t438 = @simp.asm_rewrite_tac(@list.List([fvt(), @sets.in_insert(), @sets.not_in_empty()]))
  let t437 = @simp.rewrite_tac(@list.List([valmod()]))
  let t436 = @simp.asm_rewrite_tac(@list.List([fv(), @sets.in_delete()]))
  let t432 = @term_syntax.parse_term("(x : Num)")
  let t435 = @tactics.disch_then(fn(x434 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x429 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s430 = @tactics.mp_tac(x429)
      fn(x431 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s430(x431)
      }
    })(((x433 : @kernel.Thm) => @bool.spec(t432, x433))(x434))
  })
  let t427 = @simp.gen_rewrite_rule(fn(x426 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x426
  }, @list.List([@class.not_exists_thm()]))
  let t440 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x428 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x423 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s424 = @tactics.mp_tac(x423)
      fn(x425 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s424(x425)
      }
    })(t427(x428))
  }), t435), t436), t437), @class.cond_cases_tac), t438), t439)
  let t422 = @meson.asm_meson_tac(@list.List([]))
  let t421 = @simp.asm_rewrite_tac(@list.List([fvt(), @sets.in_insert(), @sets.not_in_empty()]))
  let t420 = @simp.rewrite_tac(@list.List([valmod()]))
  let t419 = @simp.asm_rewrite_tac(@list.List([]))
  let t415 = @term_syntax.parse_term("(x : Num)")
  let t418 = @tactics.disch_then(fn(x417 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x412 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s413 = @tactics.mp_tac(x412)
      fn(x414 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s413(x414)
      }
    })(((x416 : @kernel.Thm) => @bool.spec(t415, x416))(x417))
  })
  let t411 = @simp.rewrite_tac(@list.List([@class.not_exists_thm()]))
  let t410 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t409 = @simp.rewrite_tac(@list.List([formsubst_fv()]))
  let t407 = @simp.rewrite_tac(@list.List([variant_thm()]))
  let t408 = @list.List([@tactics.then_tac(expand_tac("y"), t407), @tactics.all_tac])
  let t406 = @tactics.subgoal_then(@term_syntax.parse_term("!IN((y : Num), FV(formsubst(valmod(((a0 : Num), V(a0)), (i : (Num) -> Term)), (a1 : Form))))"), fn(x403 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s404 = @tactics.mp_tac(x403)
    fn(x405 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s404(x405)
    }
  })
  let t441 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.first_x_assum(fn(x402 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x399 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s400 = @tactics.assume_tac(x399)
      fn(x401 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s400(x401)
      }
    })(@equal.sym(x402))
  }), t406), t408), t409), t410), t411), t418), t419), t420), @class.cond_cases_tac), t421), t422), t440])
  let t398 = @simp.rewrite_tac(@list.List([]))
  let t397 = @simp.asm_rewrite_tac(@list.List([]))
  let t396 = @simp.once_rewrite_tac(@list.List([valmod()]))
  let t395 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Num)"))
  let t394 = @tactics.match_mp_tac(termval_valuation())
  let t392 = @list.List([@simp.rewrite_tac(@list.List([termval(), valmod()])), @tactics.all_tac])
  let t391 = @simp.rewrite_tac(@list.List([@equal.gsym(valmod())]))
  let t393 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_rewrite_tac(@list.List([]))), t391), t392)
  let t390 = @simp.rewrite_tac(@list.List([@trivia.o_thm(), valmod()]))
  let t389 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)"))
  let t388 = @tactics.match_mp_tac(holds_valuation())
  let t387 = @simp.asm_rewrite_tac(@list.List([valmod_valmod()]))
  let t386 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool) == (c : Bool)) → (a → b) == (a → c)")))
  let t385 = @simp.rewrite_tac(@list.List([@pair.let_def(), @pair.let_end_def(), holds_v1()]))
  let t383 = @simp.rewrite_tac(@list.List([@trivia.o_thm(), termval_termsubst(), @lists.all_t()]))
  let t382 = @tactics.match_mp_tac(@lists.map_eq())
  let t384 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @simp.rewrite_tac(@list.List([@equal.gsym(@lists.map_o())]))), t382), t383), @tactics.all_tac])
  let t381 = @simp.asm_rewrite_tac(@list.List([]))
  let t380 = @tactics.repeat_tac(@tactics.strip_tac)
  let t379 = @simp.asm_rewrite_tac(@list.List([formsubst(), holds()]))
  let t442 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(form_induction()), t379), t380), t381), t384), t385), @tactics.ap_term_tac), @tactics.abs_tac), t386), @tactics.disch_tac), @class.cond_cases_tac), t387), t388), t389), @tactics.disch_tac), t390), t393), t394), t395), @tactics.disch_tac), t396), t397), @class.cond_cases_tac), t398), t441)
  holds_formsubst_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ i : (Num) -> Term, ∀ v : (Num) -> A, holds((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), v, formsubst(i, p)) == holds(M, o(termval(M, v), i), p)"), t442))
}

///|
let holds_formsubst_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLDS_FORMSUBST")

///|
/// `HOLDS_FORMSUBST`
pub fn holds_formsubst() -> @kernel.Thm {
  holds_formsubst_c.get()
}

///|
/// HOLDS_FORMSUBST1
fn step_91() -> Unit raise {
  let t447 = @simp.rewrite_tac(@list.List([termval()]))
  let t446 = @simp.rewrite_tac(@list.List([valmod(), @trivia.o_thm()]))
  let t445 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Num)"))
  let t444 = @tactics.match_mp_tac(holds_valuation())
  let t443 = @simp.rewrite_tac(@list.List([holds_formsubst()]))
  let t448 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t443), t444), t445), @tactics.disch_tac), t446), @class.cond_cases_tac), t447)
  holds_formsubst1_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Num, ∀ t : Term, ∀ p : Form, ∀ v : (Num) -> A, holds((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), v, formsubst(valmod((x, t), V), p)) == holds(M, valmod((x, termval(M, v, t)), v), p)"), t448))
}

///|
let holds_formsubst1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLDS_FORMSUBST1")

///|
/// `HOLDS_FORMSUBST1`
pub fn holds_formsubst1() -> @kernel.Thm {
  holds_formsubst1_c.get()
}

///|
/// HOLDS_RENAME
fn step_92() -> Unit raise {
  let t451 = @simp.rewrite_tac(@list.List([termval()]))
  let t450 = @tactics.match_mp_tac(holds_valuation())
  let t449 = @simp.rewrite_tac(@list.List([holds_formsubst1()]))
  let t452 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t449), t450), t451)
  holds_rename_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ p : Form, ∀ v : (Num) -> A, holds((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), v, formsubst(valmod((x, V(y)), V), p)) == holds(M, valmod((x, v(y)), v), p)"), t452))
}

///|
let holds_rename_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLDS_RENAME")

///|
/// `HOLDS_RENAME`
pub fn holds_rename() -> @kernel.Thm {
  holds_rename_c.get()
}

///|
/// HOLDS_ALPHA_FORALL
fn step_93() -> Unit raise {
  let t459 = @meson.asm_meson_tac(@list.List([]))
  let t458 = @simp.rewrite_tac(@list.List([]))
  let t457 = @simp.rewrite_tac(@list.List([valmod(), termval()]))
  let t456 = @simp.rewrite_tac(@list.List([valmod(), termval(), @trivia.o_thm()]))
  let t455 = @tactics.match_mp_tac(holds_valuation())
  let t454 = @simp.rewrite_tac(@list.List([holds_v1(), holds_formsubst()]))
  let t453 = @tactics.repeat_tac(@tactics.strip_tac)
  let t460 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([fv(), @sets.in_delete()])), t453), t454), @tactics.ap_term_tac), @tactics.abs_tac), @tactics.ap_term_tac), t455), @tactics.gen_tac), t456), @class.cond_cases_tac), t457), @class.cond_cases_tac), t458), t459)
  holds_alpha_forall_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ p : Form, ∀ v : (Num) -> A, !IN(y, FV(op_bang_bang(x, p))) → holds((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), v, op_bang_bang(y, formsubst(valmod((x, V(y)), V), p))) == holds(M, v, op_bang_bang(x, p))"), t460))
}

///|
let holds_alpha_forall_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLDS_ALPHA_FORALL")

///|
/// `HOLDS_ALPHA_FORALL`
pub fn holds_alpha_forall() -> @kernel.Thm {
  holds_alpha_forall_c.get()
}

///|
/// HOLDS_ALPHA_EXISTS
fn step_94() -> Unit raise {
  let t467 = @meson.asm_meson_tac(@list.List([]))
  let t466 = @simp.rewrite_tac(@list.List([]))
  let t465 = @simp.rewrite_tac(@list.List([valmod(), termval()]))
  let t464 = @simp.rewrite_tac(@list.List([valmod(), termval(), @trivia.o_thm()]))
  let t463 = @tactics.match_mp_tac(holds_valuation())
  let t462 = @simp.rewrite_tac(@list.List([holds_v1(), holds_formsubst()]))
  let t461 = @tactics.repeat_tac(@tactics.strip_tac)
  let t468 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([fv(), exists_def(), not_def(), @sets.in_delete(), @sets.union_empty()])), t461), t462), @tactics.ap_term_tac), @tactics.ap_term_tac), @tactics.abs_tac), @tactics.ap_term_tac), @tactics.ap_term_tac), t463), @tactics.gen_tac), t464), @class.cond_cases_tac), t465), @class.cond_cases_tac), t466), t467)
  holds_alpha_exists_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Num, ∀ y : Num, ∀ p : Form, ∀ v : (Num) -> A, !IN(y, FV(op_q_q(x, p))) → holds((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), v, op_q_q(y, formsubst(valmod((x, V(y)), V), p))) == holds(M, v, op_q_q(x, p))"), t468))
}

///|
let holds_alpha_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLDS_ALPHA_EXISTS")

///|
/// `HOLDS_ALPHA_EXISTS`
pub fn holds_alpha_exists() -> @kernel.Thm {
  holds_alpha_exists_c.get()
}

///|
/// FORMSUBST_RENAME
fn step_95() -> Unit raise {
  let t474 = @meson.meson_tac(@list.List([]))
  let t473 = @simp.rewrite_tac(@list.List([fvt(), @sets.in_insert(), @sets.not_in_empty()]))
  let t472 = @tactics.conv_tac(@equal.once_depth_conv(@class.cond_elim_conv))
  let t471 = @simp.rewrite_tac(@list.List([valmod()]))
  let t470 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_delete(), @sets.in_elim_thm()]))
  let t469 = @simp.rewrite_tac(@list.List([formsubst_fv()]))
  let t475 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t469), t470), @tactics.gen_tac), t471), t472), t473), t474)
  formsubst_rename_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ x : Num, ∀ y : Num, DELETE(FV(formsubst(valmod((x, V(y)), V), p)), y) == DELETE(DELETE(FV(p), x), y)"), t475))
}

///|
let formsubst_rename_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORMSUBST_RENAME")

///|
/// `FORMSUBST_RENAME`
pub fn formsubst_rename() -> @kernel.Thm {
  formsubst_rename_c.get()
}

///|
/// TERMSUBST_FUNCTIONS_TERM
fn step_96() -> Unit raise {
  let t476 = @meson.meson_tac(@list.List([]))
  let t477 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_union(), @sets.in_elim_thm()])), t476)
  let lemma1 = @tactics.prove(@term_syntax.parse_term("{(x : _) | ∃ y : _, IN(y, UNION((s : (_) -> Bool), (t : (_) -> Bool))) && (P : (_, _) -> Bool)(x, y)} == UNION({(x : _) | ∃ y : _, IN(y, s) && P(x, y)}, {(x : _) | ∃ y : _, IN(y, t) && P(x, y)})"), t477)
  let t478 = @sets.set_tac(@list.List([]))
  let lemma2 = @tactics.prove(@term_syntax.parse_term("(s : (_) -> Bool) == UNION((a : (_) -> Bool), (c : (_) -> Bool)) && (t : (_) -> Bool) == UNION((b : (_) -> Bool), (d : (_) -> Bool)) → UNION(s, t) == UNION(UNION(a, b), UNION(c, d))"), t478)
  let t501 = @simp.asm_rewrite_tac(@list.List([]))
  let t500 = @tactics.first_assum(@tactics.match_mp_tac)
  let t498 = @term_syntax.parse_term("(i : (Num) -> Term)")
  let t499 = @tactics.spec_tac(@term_syntax.parse_term("(i : (Num) -> Term)"), t498)
  let t497 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@lists.length_map()])))
  let t496 = @simp.asm_rewrite_tac(@list.List([]))
  let t495 = @tactics.match_mp_tac(lemma2)
  let t494 = @simp.rewrite_tac(@list.List([lemma1, @lists.length(), @lists.length_map()]))
  let t493 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : (Num) -> Term)"))
  let t492 = @simp.rewrite_tac(@list.List([@lists.all()]))
  let t491 = @list.List([@simp.rewrite_tac(@list.List([@sets.extension(), @sets.not_in_empty(), @sets.in_insert(), @sets.subset(), @sets.in_elim_thm(), @sets.in_union()])), @tactics.all_tac])
  let t490 = @simp.rewrite_tac(@list.List([@lists.map(), list_union()]))
  let t488 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_insert(), @sets.in_union(), @lists.length_map(), @theorems.disj_aci()]))
  let t489 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_then(@tactics.ante_res_then(fn(x486 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x486
    @simp.rewrite_tac(@list.List([th]))
  }))), t488)])
  let t485 = @tactics.subgoal_then(@term_syntax.parse_term("∀ l : List[Term], ALL((t : Term) => ∀ i : (Num) -> Term, functions_term(termsubst(i, t)) == UNION(functions_term(t), {(x : (Num, Num)) | ∃ y : Num, IN(y, FVT(t)) && IN(x, functions_term(i(y)))}), l) → (∀ i : (Num) -> Term, LIST_UNION(MAP(functions_term, MAP(termsubst(i), l))) == UNION(LIST_UNION(MAP(functions_term, l)), {(x : (Num, Num)) | ∃ y : Num, IN(y, LIST_UNION(MAP(FVT, l))) && IN(x, functions_term(i(y)))}))"), fn(x482 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s483 = @tactics.assume_tac(x482)
    fn(x484 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s483(x484)
    }
  })
  let t480 = @meson.meson_tac(@list.List([]))
  let t481 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_insert(), @sets.in_union(), @sets.in_elim_thm(), @sets.not_in_empty(), @sets.extension()])), t480), @tactics.all_tac])
  let t479 = @simp.rewrite_tac(@list.List([functions_term(), termsubst(), fvt()]))
  let t502 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(term_induct()), t479), @tactics.conj_tac), t481), @tactics.gen_tac), t485), t489), @lists.list_induct_tac), t490), t491), t492), @tactics.strip_tac), t493), t494), t495), t496), t497), t499), t500), t501)
  termsubst_functions_term_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : Term, ∀ i : (Num) -> Term, functions_term(termsubst(i, t)) == UNION(functions_term(t), {(x : (Num, Num)) | ∃ y : Num, IN(y, FVT(t)) && IN(x, functions_term(i(y)))})"), t502))
}

///|
let termsubst_functions_term_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TERMSUBST_FUNCTIONS_TERM")

///|
/// `TERMSUBST_FUNCTIONS_TERM`
pub fn termsubst_functions_term() -> @kernel.Thm {
  termsubst_functions_term_c.get()
}

///|
/// FORMSUBST_FUNCTIONS_FORM
fn step_97() -> Unit raise {
  let t503 = @meson.meson_tac(@list.List([]))
  let t504 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_union(), @sets.in_elim_thm()])), t503)
  let lemma1 = @tactics.prove(@term_syntax.parse_term("{(x : _) | ∃ y : _, IN(y, UNION((s : (_) -> Bool), (t : (_) -> Bool))) && (P : (_, _) -> Bool)(x, y)} == UNION({(x : _) | ∃ y : _, IN(y, s) && P(x, y)}, {(x : _) | ∃ y : _, IN(y, t) && P(x, y)})"), t504)
  let t505 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_union(), @theorems.disj_aci()]))
  let lemma2 = @tactics.prove(@term_syntax.parse_term("UNION(UNION((a : (_) -> Bool), (b : (_) -> Bool)), UNION((c : (_) -> Bool), (d : (_) -> Bool))) == UNION(UNION(a, c), UNION(b, d))"), t505)
  let t530 = @meson.asm_meson_tac(@list.List([]))
  let t529 = @simp.asm_rewrite_tac(@list.List([]))
  let t528 = @class.asm_cases_tac(@term_syntax.parse_term("(y : Num) == (a0 : Num)"))
  let t527 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_union(), @sets.in_elim_thm()]))
  let t526 = @simp.rewrite_tac(@list.List([fvt(), @sets.in_insert(), @sets.not_in_empty()]))
  let t525 = @simp.rewrite_tac(@list.List([functions_term(), @sets.not_in_empty(), @sets.in_insert(), @sets.in_delete()]))
  let t524 = @tactics.conv_tac(@equal.depth_conv(@class.cond_elim_conv))
  let t523 = @simp.rewrite_tac(@list.List([valmod()]))
  let t522 = @simp.asm_rewrite_tac(@list.List([]))
  let t521 = @tactics.repeat_tac(@tactics.strip_tac)
  let t520 = @simp.rewrite_tac(@list.List([functions_form(), @pair.let_def(), @pair.let_end_def(), valmod_valmod()]))
  let t516 = @simp.asm_rewrite_tac(@list.List([]))
  let t515 = @simp.once_rewrite_tac(@list.List([lemma2]))
  let t514 = @tactics.repeat_tac(@tactics.strip_tac)
  let t517 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([lemma1])), t514), t515), t516)
  let t513 = @simp.asm_rewrite_tac(@list.List([termsubst_functions_term()]))
  let t512 = @simp.once_rewrite_tac(@list.List([lemma2]))
  let t511 = @simp.rewrite_tac(@list.List([lemma1]))
  let t510 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : (Num) -> Term)"))
  let t509 = @list.List([@simp.rewrite_tac(@list.List([@sets.not_in_empty(), @sets.extension(), @sets.in_union(), @sets.in_elim_thm()])), @tactics.all_tac])
  let t518 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@lists.list_induct_tac, @simp.rewrite_tac(@list.List([@lists.map(), list_union()]))), t509), t510), t511), t512), @tactics.binop_tac), t513)
  let t508 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_union(), @sets.not_in_empty(), @sets.in_elim_thm()]))
  let t519 = @list.List([@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t508), t518, t517, @tactics.all_tac])
  let t507 = @tactics.repeat_tac(@tactics.conj_tac)
  let t506 = @simp.rewrite_tac(@list.List([formsubst(), functions_form(), fv()]))
  let t531 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(form_induction()), t506), t507), t519), t520), t521), t522), t523), t524), t525), t526), t527), @tactics.gen_tac), @tactics.ap_term_tac), @tactics.ap_term_tac), @tactics.abs_tac), t528), t529), t530)
  formsubst_functions_form_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ i : (Num) -> Term, functions_form(formsubst(i, p)) == UNION(functions_form(p), {(x : (Num, Num)) | ∃ y : Num, IN(y, FV(p)) && IN(x, functions_term(i(y)))})"), t531))
}

///|
let formsubst_functions_form_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORMSUBST_FUNCTIONS_FORM")

///|
/// `FORMSUBST_FUNCTIONS_FORM`
pub fn formsubst_functions_form() -> @kernel.Thm {
  formsubst_functions_form_c.get()
}

///|
/// FORMSUBST_FUNCTIONS_FORM_1
fn step_98() -> Unit raise {
  let t537 = @meson.asm_meson_tac(@list.List([]))
  let t536 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm()]))
  let t535 = @simp.rewrite_tac(@list.List([functions_term(), @sets.not_in_empty()]))
  let t534 = @tactics.conv_tac(@equal.once_depth_conv(@class.cond_elim_conv))
  let t533 = @simp.rewrite_tac(@list.List([valmod()]))
  let t532 = @simp.rewrite_tac(@list.List([formsubst_functions_form()]))
  let t538 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t532), t533), t534), t535), @tactics.ap_term_tac), t536), t537)
  formsubst_functions_form_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Num, ∀ t : Term, ∀ p : Form, IN(x, FV(p)) → functions_form(formsubst(valmod((x, t), V), p)) == UNION(functions_form(p), functions_term(t))"), t538))
}

///|
let formsubst_functions_form_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORMSUBST_FUNCTIONS_FORM_1")

///|
/// `FORMSUBST_FUNCTIONS_FORM_1`
pub fn formsubst_functions_form_1() -> @kernel.Thm {
  formsubst_functions_form_1_c.get()
}

///|
/// FORMSUBST_PREDICATES
fn step_99() -> Unit raise {
  let t541 = @simp.asm_rewrite_tac(@list.List([@lists.length_map()]))
  let t540 = @tactics.repeat_tac(@tactics.strip_tac)
  let t539 = @simp.rewrite_tac(@list.List([predicates_form(), formsubst(), @pair.let_def(), @pair.let_end_def()]))
  let t542 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(form_induction()), t539), t540), t541)
  formsubst_predicates_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ i : (Num) -> Term, predicates_form(formsubst(i, p)) == predicates_form(p)"), t542))
}

///|
let formsubst_predicates_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORMSUBST_PREDICATES")

///|
/// `FORMSUBST_PREDICATES`
pub fn formsubst_predicates() -> @kernel.Thm {
  formsubst_predicates_c.get()
}

///|
/// FORMSUBST_LANGUAGE_RENAME
fn step_100() -> Unit raise {
  let t548 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("(!(p : Bool) && p) == false"))]))
  let t547 = @simp.rewrite_tac(@list.List([functions_term(), @sets.not_in_empty()]))
  let t546 = @tactics.conv_tac(@equal.once_depth_conv(@class.cond_elim_conv))
  let t545 = @simp.rewrite_tac(@list.List([valmod()]))
  let t544 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_union(), @sets.in_elim_thm()]))
  let t543 = @simp.rewrite_tac(@list.List([@pair.pair_eq()]))
  let t549 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([language_1(), formsubst_predicates(), formsubst_functions_form()])), t543), t544), t545), t546), t547), t548)
  formsubst_language_rename_c.set(@tactics.prove(@term_syntax.parse_term("language({formsubst(valmod(((x : Num), V((y : Num))), V), (p : Form))}) == language({p})"), t549))
}

///|
let formsubst_language_rename_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORMSUBST_LANGUAGE_RENAME")

///|
/// `FORMSUBST_LANGUAGE_RENAME`
pub fn formsubst_language_rename() -> @kernel.Thm {
  formsubst_language_rename_c.get()
}

///|
/// TERMVAL_FUNCTIONS
fn step_101() -> Unit raise {
  let t587 = @simp.rewrite_tac(@list.List([@lists.length_map()]))
  let t586 = @simp.rewrite_tac(@list.List([@sets.in_insert()]))
  let t588 = @tactics.then_tac(@tactics.then_tac(@tactics.first_assum(@tactics.match_mp_tac), t586), t587)
  let t585 = @meson.asm_meson_tac(@list.List([]))
  let t584 = @simp.rewrite_tac(@list.List([list_union(), @lists.map(), @sets.in_union()]))
  let t583 = @simp.rewrite_tac(@list.List([@lists.mem()]))
  let t581 = @term_syntax.parse_term("(l : List[Term])")
  let t582 = @tactics.spec_tac(@term_syntax.parse_term("(l : List[Term])"), t581)
  let t580 = @tactics.undisch_tac(@term_syntax.parse_term("MEM((x : Term), (l : List[Term]))"))
  let t579 = @simp.rewrite_tac(@list.List([@sets.in_insert()]))
  let t578 = @tactics.first_assum(@tactics.match_mp_tac)
  let t577 = @tactics.repeat_tac(@tactics.strip_tac)
  let t576 = @tactics.disch_then(fn(x572 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x572
    let t575 = @tactics.match_mp_tac(th)
    let t574 = @term_syntax.parse_term("(v : (Num) -> A)")
    @tactics.then_tac(@tactics.spec_tac(@term_syntax.parse_term("(v : (Num) -> A)"), t574), t575)
  })
  let t571 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x565 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s566 = @tactics.assume_tac(x565)
    fn(x567 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s566(x567)
    }
  }, fn(x568 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s569 = @tactics.mp_tac(x568)
    fn(x570 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s569(x570)
    }
  }))
  let t564 = @simp.asm_rewrite_tac(@list.List([]))
  let t563 = @tactics.first_assum(fn(x562 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x560 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x557 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s558 = @tactics.exists_tac(x557)
        fn(x559 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s558(x559)
        }
      })(@equal.lhand(x560))
    })((fn(x561 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x561)
    })(x562))
  })
  let t556 = @tactics.match_mp_tac(@lists.all_imp())
  let t589 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@lists.map_eq()), t556), t563), t564), @tactics.gen_tac), t571), t576), t577), t578), t579), @tactics.disj2_tac), t580), t582), @lists.list_induct_tac), t583), t584), t585), t588])
  let t555 = @tactics.subgoal_then(@term_syntax.parse_term("MAP(termval((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), (v : (Num) -> A)), (l : List[Term])) == MAP(termval((M' : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), v), l)"), fn(x552 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s553 = @tactics.subst1_tac(x552)
    fn(x554 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s553(x554)
    }
  })
  let t551 = @tactics.repeat_tac(@tactics.strip_tac)
  let t550 = @simp.rewrite_tac(@list.List([termval(), functions_term()]))
  let t590 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(term_induct())), t550), t551), t555), t589)
  termval_functions_c.set(@tactics.prove(@term_syntax.parse_term("∀ M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), ∀ t : Term, (∀ f : Num, ∀ zs : List[A], IN((f, LENGTH(zs)), functions_term(t)) → Fun(M, f, zs) == Fun((M' : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), f, zs)) → (∀ v : (Num) -> A, termval(M, v, t) == termval(M', v, t))"), t590))
}

///|
let termval_functions_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TERMVAL_FUNCTIONS")

///|
/// `TERMVAL_FUNCTIONS`
pub fn termval_functions() -> @kernel.Thm {
  termval_functions_c.get()
}

///|
/// HOLDS_FUNCTIONS
fn step_102() -> Unit raise {
  let t623 = @simp.asm_rewrite_tac(@list.List([functions_form()]))
  let t622 = @tactics.first_assum(@tactics.match_mp_tac)
  let t621 = @tactics.repeat_tac(@tactics.strip_tac)
  let t620 = @tactics.first_assum(@tactics.match_mp_tac)
  let t618 = @term_syntax.parse_term("(v : (Num) -> A)")
  let t619 = @tactics.spec_tac(@term_syntax.parse_term("valmod(((a0 : Num), (a : A)), (v : (Num) -> A))"), t618)
  let t624 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @tactics.abs_tac), @tactics.ap_term_tac), t619), t620), t621), t622), t623)
  let t617 = @simp.asm_rewrite_tac(@list.List([functions_form(), @sets.in_union()]))
  let t616 = @tactics.first_assum(@tactics.match_mp_tac)
  let t615 = @tactics.repeat_tac(@tactics.strip_tac)
  let t614 = @tactics.first_assum(@tactics.match_mp_tac)
  let t613 = @term_syntax.parse_term("(v : (Num) -> A)")
  let t625 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.binop_tac, @tactics.spec_tac(@term_syntax.parse_term("(v : (Num) -> A)"), t613)), t614), t615), t616), t617)
  let t610 = @simp.asm_rewrite_tac(@list.List([]))
  let t609 = @tactics.first_assum(@tactics.match_mp_tac)
  let t608 = @tactics.repeat_tac(@tactics.strip_tac)
  let t611 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(@tactics.match_mp_tac), t608), t609), t610)
  let t607 = @simp.asm_rewrite_tac(@list.List([]))
  let t606 = @tactics.first_assum(@tactics.match_mp_tac)
  let t605 = @tactics.repeat_tac(@tactics.strip_tac)
  let t604 = @tactics.match_mp_tac(termval_functions())
  let t603 = @term_syntax.parse_term("(v : (Num) -> A)")
  let t612 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.spec_tac(@term_syntax.parse_term("(v : (Num) -> A)"), t603), t604), t605), t606), t607), t611])
  let t602 = @tactics.repeat_tac(@tactics.strip_tac)
  let t601 = @simp.rewrite_tac(@list.List([@sets.in_union(), @lists.cons_11()]))
  let t600 = @simp.rewrite_tac(@list.List([list_union(), @lists.map(), @sets.not_in_empty()]))
  let t598 = @term_syntax.parse_term("(a1 : List[Term])")
  let t599 = @tactics.spec_tac(@term_syntax.parse_term("(a1 : List[Term])"), t598)
  let t597 = @simp.rewrite_tac(@list.List([functions_form()]))
  let t626 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @tactics.undisch_tac(@term_syntax.parse_term("∀ f : Num, ∀ zs : List[A], IN((f, LENGTH(zs)), functions_form(Atom((a0 : Num), (a1 : List[Term])))) → Fun((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), f, zs) == Fun((M' : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), f, zs)"))), t597), t599), @lists.list_induct_tac), t600), t601), t602), t612), t625, t624])
  let t596 = @simp.asm_rewrite_tac(@list.List([]))
  let t595 = @tactics.repeat_tac(@tactics.strip_tac)
  let t594 = @simp.rewrite_tac(@list.List([holds()]))
  let t593 = @tactics.match_mp_tac(form_induction())
  let t592 = @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()]))
  let t591 = @simp.rewrite_tac(@list.List([@theorems.imp_conj()]))
  let t627 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), t591), t592), @tactics.disch_tac), @tactics.disch_tac), t593), t594), t595), t596), t626)
  holds_functions_c.set(@tactics.prove(@term_syntax.parse_term("∀ M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), ∀ M' : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), ∀ p : Form, Dom(M) == Dom(M') && (∀ P : Num, ∀ zs : List[A], Pred(M, P, zs) == Pred(M', P, zs)) && (∀ f : Num, ∀ zs : List[A], IN((f, LENGTH(zs)), functions_form(p)) → Fun(M, f, zs) == Fun(M', f, zs)) → (∀ v : (Num) -> A, holds(M, v, p) == holds(M', v, p))"), t627))
}

///|
let holds_functions_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLDS_FUNCTIONS")

///|
/// `HOLDS_FUNCTIONS`
pub fn holds_functions() -> @kernel.Thm {
  holds_functions_c.get()
}

///|
/// HOLDS_PREDICATES
fn step_103() -> Unit raise {
  let t651 = @simp.asm_rewrite_tac(@list.List([]))
  let t650 = @tactics.first_assum(@tactics.match_mp_tac)
  let t648 = @term_syntax.parse_term("(v : (Num) -> A)")
  let t649 = @tactics.spec_tac(@term_syntax.parse_term("valmod(((a0 : Num), (a : A)), (v : (Num) -> A))"), t648)
  let t652 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @tactics.abs_tac), @tactics.ap_term_tac), t649), t650), t651)
  let t653 = @meson.asm_meson_tac(@list.List([]))
  let t647 = @simp.rewrite_tac(@list.List([@lists.length_map()]))
  let t646 = @tactics.first_assum(@tactics.match_mp_tac)
  let t644 = @simp.asm_rewrite_tac(@list.List([]))
  let t643 = @tactics.match_mp_tac(termval_functions())
  let t641 = @term_syntax.parse_term("(v : (Num) -> A)")
  let t642 = @tactics.spec_tac(@term_syntax.parse_term("(v : (Num) -> A)"), t641)
  let t640 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Term, termval((M' : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), (v : (Num) -> A), x) == termval((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), v, x)"), fn(x638 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x638
    @simp.rewrite_tac(@list.List([th, @lists.all_t()]))
  })
  let t645 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@lists.map_eq()), t640), @tactics.gen_tac), t642), t643), t644), @tactics.all_tac])
  let t654 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("MAP(termval((M' : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), (v : (Num) -> A)), (a1 : List[Term])) == MAP(termval((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), v), a1)"), fn(x635 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s636 = @tactics.subst1_tac(x635)
    fn(x637 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s636(x637)
    }
  }), t645), t646), t647), t653, t652])
  let t634 = @simp.asm_rewrite_tac(@list.List([]))
  let t633 = @tactics.repeat_tac(@tactics.strip_tac)
  let t632 = @simp.rewrite_tac(@list.List([predicates_form(), @sets.in_insert(), @sets.not_in_empty(), @sets.in_union()]))
  let t631 = @simp.rewrite_tac(@list.List([holds()]))
  let t630 = @tactics.match_mp_tac(form_induction())
  let t629 = @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()]))
  let t628 = @simp.rewrite_tac(@list.List([@theorems.imp_conj()]))
  let t655 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), t628), t629), @tactics.disch_tac), @tactics.disch_tac), t630), t631), t632), t633), t634), t654)
  holds_predicates_c.set(@tactics.prove(@term_syntax.parse_term("∀ M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), ∀ M' : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), ∀ p : Form, Dom(M) == Dom(M') && (∀ f : Num, ∀ zs : List[A], Fun(M, f, zs) == Fun(M', f, zs)) && (∀ P : Num, ∀ zs : List[A], IN((P, LENGTH(zs)), predicates_form(p)) → Pred(M, P, zs) == Pred(M', P, zs)) → (∀ v : (Num) -> A, holds(M, v, p) == holds(M', v, p))"), t655))
}

///|
let holds_predicates_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLDS_PREDICATES")

///|
/// `HOLDS_PREDICATES`
pub fn holds_predicates() -> @kernel.Thm {
  holds_predicates_c.get()
}

///|
/// HOLDS_UCLOSE
fn step_104() -> Unit raise {
  let t659 = @meson.asm_meson_tac(@list.List([valuation_is_valmod(), valuation_valmod(), valuation()]))
  let t658 = @simp.asm_rewrite_tac(@list.List([@sets.not_in_empty()]))
  let t657 = @class.asm_cases_tac(@term_syntax.parse_term("Dom((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool))) == {}"))
  let t656 = @simp.rewrite_tac(@list.List([holds()]))
  let t660 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t656), t657), t658), t659)
  holds_uclose_c.set(@tactics.prove(@term_syntax.parse_term("∀ M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), ∀ x : Num, ∀ p : Form, (∀ v : (Num) -> A, valuation(M, v) → holds(M, v, op_bang_bang(x, p))) == (Dom(M) == {} || (∀ v : (Num) -> A, valuation(M, v) → holds(M, v, p)))"), t660))
}

///|
let holds_uclose_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLDS_UCLOSE")

///|
/// `HOLDS_UCLOSE`
pub fn holds_uclose() -> @kernel.Thm {
  holds_uclose_c.get()
}

///|
/// MODEL_DUPLICATE
fn step_105() -> Unit raise {
  let t832 = @simp.asm_rewrite_tac(@list.List([@trivia.o_thm()]))
  let t833 = @tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.first_assum(@tactics.match_mp_tac)), t832)
  let t831 = @meson.asm_meson_tac(@list.List([@sets.subset()]))
  let t829 = @simp.asm_rewrite_tac(@list.List([]))
  let t828 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.o_thm()]))
  let t830 = @list.List([@tactics.then_tac(@tactics.then_tac(expand_tac("i"), t828), t829), @tactics.all_tac])
  let t834 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.disch_tac, @tactics.subgoal_then(@term_syntax.parse_term("(v : (Num) -> A) == o((i : (A) -> A), v)"), fn(x825 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s826 = @tactics.subst1_tac(x825)
    fn(x827 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s826(x827)
    }
  })), t830), t831), t833])
  let t824 = @tactics.x_gen_tac(@term_syntax.parse_term("(v : (Num) -> A)"))
  let t823 = @simp.asm_simp_tac(@list.List([]))
  let t821 = @meson.asm_meson_tac(@list.List([]))
  let t820 = @simp.rewrite_tac(@list.List([functions(), @sets.subset(), @sets.in_unions(), @sets.in_elim_thm()]))
  let t822 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("SUBSET(functions((s : (Form) -> Bool)), (fns : ((Num, Num)) -> Bool))")), t820), t821), @tactics.all_tac])
  let t819 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET(functions_form((p : Form)), (fns : ((Num, Num)) -> Bool))"), fn(x816 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s817 = @tactics.assume_tac(x816)
    fn(x818 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s817(x818)
    }
  })
  let t815 = @simp.asm_rewrite_tac(@list.List([]))
  let t814 = @class.asm_cases_tac(@term_syntax.parse_term("IN((p : Form), (s : (Form) -> Bool))"))
  let t813 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Form)"))
  let t812 = @simp.gen_rewrite_tac(fn(x811 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x811
  }, @list.List([@class.fun_eq_thm()]))
  let t810 = @simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()]))
  let t809 = @simp.asm_rewrite_tac(@list.List([]))
  let t808 = @simp.rewrite_tac(@list.List([dom_def()]))
  let t807 = expand_tac("M'")
  let t806 = @simp.rewrite_tac(@list.List([valuation()]))
  let t805 = @simp.rewrite_tac(@list.List([satisfies()]))
  let t804 = @tactics.x_gen_tac(@term_syntax.parse_term("(s : (Form) -> Bool)"))
  let t802 = @meson.asm_meson_tac(@list.List([@sets.subset()]))
  let t800 = @simp.simp_tac(@list.List([]))
  let t801 = @list.List([@tactics.then_tac(expand_tac("i"), t800), @tactics.all_tac])
  let t799 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : A, IN(x, Dom((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)))) → (i : (A) -> A)(x) == x"), fn(x796 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s797 = @tactics.mp_tac(x796)
    fn(x798 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s797(x798)
    }
  })
  let t794 = @simp.asm_rewrite_tac(@list.List([@trivia.o_thm()]))
  let t793 = @simp.rewrite_tac(@list.List([valmod()]))
  let t792 = @tactics.repeat_tac(@tactics.gen_tac)
  let t795 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm()])), t792), t793), @class.cond_cases_tac), t794), @tactics.all_tac])
  let t791 = @tactics.subgoal_then(@term_syntax.parse_term("∀ a : A, o((i : (A) -> A), valmod(((x : Num), a), (v : (Num) -> A))) == valmod((x, i(a)), o(i, v))"), fn(x789 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_3 = x789
    @simp.rewrite_tac(@list.List([th_3]))
  })
  let t788 = @tactics.x_gen_tac(@term_syntax.parse_term("(v : (Num) -> A)"))
  let t787 = @simp.asm_rewrite_tac(@list.List([]))
  let t786 = @simp.asm_rewrite_tac(@list.List([]))
  let t785 = @tactics.disch_then(fn(x783 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x783
    @tactics.then_tac(@tactics.disch_tac, @tactics.mp_tac(th_2))
  })
  let t781 = @term_syntax.parse_term("(p : Form)")
  let t782 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : Num)"), t781]))
  let t778 = @meson.meson_tac(@list.List([]))
  let t779 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_union()])), t778)
  let t777 = @meson.asm_meson_tac(@list.List([@sets.subset()]))
  let t776 = @simp.rewrite_tac(@list.List([@trivia.o_thm()]))
  let t775 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.all_mem())]))
  let t774 = @tactics.match_mp_tac(@lists.map_eq())
  let t773 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.map_o())]))
  let t772 = @simp.asm_rewrite_tac(@list.List([]))
  let t771 = @simp.rewrite_tac(@list.List([pred_def()]))
  let t770 = expand_tac("M'")
  let t769 = @tactics.repeat_tac(@tactics.strip_tac)
  let t780 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), in_list_union(), @equal.gsym(@lists.ex_mem()), @lists.mem_map()])), t769), t770), t771), t772), @tactics.ap_term_tac), t773), t774), t775), t776), t777), t779, @tactics.all_tac])
  let t768 = @tactics.repeat_tac(@tactics.conj_tac)
  let t767 = @simp.rewrite_tac(@list.List([holds(), functions_form()]))
  let t803 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(form_induction()), t767), t768), t780), t782), t785), t786), @tactics.disch_tac), t787), t788), t791), t795), t799), t801), t802), @tactics.all_tac])
  let t766 = @tactics.subgoal_then(@term_syntax.parse_term("∀ p : Form, SUBSET(functions_form(p), (fns : ((Num, Num)) -> Bool)) → (∀ v : (Num) -> A, holds((M' : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), v, p) == holds((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), o((i : (A) -> A), v), p))"), fn(x763 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s764 = @tactics.assume_tac(x763)
    fn(x765 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s764(x765)
    }
  })
  let t761 = @meson.asm_meson_tac(@list.List([]))
  let t760 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.all_mem()), @trivia.o_thm()]))
  let t759 = @tactics.match_mp_tac(@lists.map_eq())
  let t757 = @meson.asm_meson_tac(@list.List([]))
  let t756 = @simp.rewrite_tac(@list.List([@lists.mem_map(), @trivia.o_thm()]))
  let t755 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.all_mem())]))
  let t754 = @simp.asm_rewrite_tac(@list.List([@lists.length_map()]))
  let t751 = @simp.gen_rewrite_rule(fn(x750 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x750
  }, @list.List([interpretation()]))
  let t753 = @tactics.first_assum(fn(x752 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t751(x752))
  })
  let t749 = @tactics.subgoal_then(@term_syntax.parse_term("IN(Fun((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), (P : Num), MAP(o((i : (A) -> A), termval((M' : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), (v : (Num) -> A))), (args : List[Term]))), Dom(M))"), fn(x747 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x747
    @simp.rewrite_tac(@list.List([th_1]))
  })
  let t758 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x738 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x738
    @simp.gen_rewrite_tac(fn(x746 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x740 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s741 = @equal.land_conv(x740)
        fn(x742 : @kernel.Term) -> @kernel.Thm raise {
          s741(x742)
        }
      })((fn(x743 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s744 = @equal.rator_conv(x743)
        fn(x745 : @kernel.Term) -> @kernel.Thm raise {
          s744(x745)
        }
      })(x746))
    }, @list.List([@equal.sym(th)]))
  }), t749), t753), t754), t755), t756), t757), @tactics.all_tac])
  let t737 = @tactics.exists_tac(@term_syntax.parse_term("Fun((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), (P : Num), MAP(o((i : (A) -> A), termval((M' : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), (v : (Num) -> A))), (args : List[Term])))"))
  let t736 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t735 = @tactics.x_gen_tac(@term_syntax.parse_term("(v : (Num) -> A)"))
  let t734 = @list.List([@meson.asm_meson_tac(@list.List([@sets.subset()])), @tactics.all_tac])
  let t733 = @tactics.subgoal_then(@term_syntax.parse_term("∀ t : Term, MEM(t, (args : List[Term])) → (∀ v : (Num) -> A, (i : (A) -> A)(termval((M' : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), v, t)) == termval((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), o(i, v), t))"), fn(x730 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s731 = @tactics.assume_tac(x730)
    fn(x732 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s731(x732)
    }
  })
  let t728 = @meson.asm_meson_tac(@list.List([@lists.mem_map()]))
  let t729 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset()])), t728), @tactics.all_tac])
  let t727 = @tactics.subgoal_then(@term_syntax.parse_term("∀ t : Term, MEM(t, (args : List[Term])) → SUBSET(functions_term(t), (fns : ((Num, Num)) -> Bool))"), fn(x724 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s725 = @tactics.assume_tac(x724)
    fn(x726 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s725(x726)
    }
  })
  let t723 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t722 = @tactics.subgoal_then(@term_syntax.parse_term("IN(((P : Num), LENGTH((args : List[Term]))), (fns : ((Num, Num)) -> Bool))"), fn(x719 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s720 = @tactics.assume_tac(x719)
    fn(x721 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s720(x721)
    }
  })
  let t717 = @equal.gsym(@lists.all_mem())
  let t718 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.ex_mem()), t717]))
  let t716 = @simp.rewrite_tac(@list.List([functions_term(), @sets.subset(), in_list_union(), @sets.in_insert()]))
  let t714 = @term_syntax.parse_term("(args : List[Term])")
  let t715 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(P : Num)"), t714]))
  let t713 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.map_o())]))
  let t712 = @simp.asm_rewrite_tac(@list.List([]))
  let t711 = @simp.rewrite_tac(@list.List([fun_def()]))
  let t710 = expand_tac("M'")
  let t709 = @simp.rewrite_tac(@list.List([termval(), @trivia.o_thm()]))
  let t762 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(term_induct()), t709), t710), t711), t712), t713), t715), t716), t718), @tactics.disch_tac), @tactics.disch_tac), t722), t723), t727), t729), t733), t734), t735), t736), t737), @tactics.conj_tac), t758), @tactics.ap_term_tac), t759), t760), t761), @tactics.all_tac])
  let t708 = @tactics.subgoal_then(@term_syntax.parse_term("∀ t : Term, SUBSET(functions_term(t), (fns : ((Num, Num)) -> Bool)) → (∀ v : (Num) -> A, (i : (A) -> A)(termval((M' : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), v, t)) == termval((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), o(i, v), t))"), fn(x705 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s706 = @tactics.assume_tac(x705)
    fn(x707 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s706(x707)
    }
  })
  let t703 = @simp.asm_rewrite_tac(@list.List([@trivia.o_thm()]))
  let t702 = @tactics.match_mp_tac(@lists.mono_all())
  let t701 = @simp.rewrite_tac(@list.List([@lists.all_map()]))
  let t700 = @tactics.undisch_tac(@term_syntax.parse_term("ALL((x : A) => IN(x, (D : (A) -> Bool)), (l : List[A]))"))
  let t699 = @simp.asm_rewrite_tac(@list.List([@lists.length_map()]))
  let t698 = @tactics.first_assum(@tactics.match_mp_tac)
  let t695 = @simp.rewrite_rule(@list.List([@sets.subset()]))
  let t697 = @tactics.first_assum(fn(x696 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t695(x696))
  })
  let t694 = @tactics.repeat_tac(@tactics.strip_tac)
  let t693 = @simp.rewrite_tac(@list.List([fun_def()]))
  let t692 = expand_tac("M'")
  let t691 = @simp.asm_rewrite_tac(@list.List([interpretation()]))
  let t689 = @simp.gen_rewrite_rule(fn(x688 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x688
  }, @list.List([interpretation()]))
  let t704 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x690 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x685 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s686 = @tactics.mp_tac(x685)
      fn(x687 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s686(x687)
      }
    })(t689(x690))
  }), t691), t692), t693), t694), t697), t698), t699), t700), t701), t702), t703), @tactics.all_tac])
  let t683 = @simp.rewrite_tac(@list.List([dom_def()]))
  let t684 = @list.List([@tactics.then_tac(expand_tac("M'"), t683), @tactics.all_tac])
  let t682 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(b : Bool) && (b → (a : Bool) && (c : Bool)) → a && b && c")))
  let t680 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.not_in_empty(), @class.not_forall_thm()]))
  let t679 = @tactics.undisch_tac(@term_syntax.parse_term("!(Dom((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool))) == {})"))
  let t678 = @tactics.conv_tac(@class.select_conv)
  let t677 = @simp.asm_rewrite_tac(@list.List([]))
  let t676 = expand_tac("i")
  let t681 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : A)")), t676), @class.cond_cases_tac), t677), t678), t679), t680), @tactics.all_tac])
  let t675 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : A, IN((i : (A) -> A)(x), Dom((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool))))"), fn(x672 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s673 = @tactics.assume_tac(x672)
    fn(x674 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s673(x674)
    }
  })
  let t662 = @simp.abbrev_tac(@term_syntax.parse_term("(M' : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)) == ((D : (A) -> Bool), (f : Num) => (args : List[A]) => Fun((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), f, MAP((i : (A) -> A), args)), (P : Num) => (args : List[A]) => Pred(M, P, MAP(i, args)))"))
  let t661 = @simp.abbrev_tac(@term_syntax.parse_term("(i : (A) -> A) == ((x : A) => if IN(x, Dom((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)))) { x } else { select((z : A) => IN(z, Dom(M))) })"))
  let t835 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t661), t662), fn(x671 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x670 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x668 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x667 : (@kernel.Term, @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x663 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s664 = @tactics.exists_tac(x663)
            fn(x665 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s664(x665)
            }
          })((fn(x666 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
            x666.0
          })(x667))
        })(@basics.dest_exists(x668))
      })((fn(x669 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x669.1
      })(x670))
    })(x671)(x671)
  }), t675), t681), t682), @tactics.conj_tac), t684), @tactics.disch_tac), @tactics.conj_tac), t704), t708), t762), t766), t803), t804), @tactics.strip_tac), t805), t806), t807), t808), t809), t810), @tactics.ap_term_tac), t812), t813), t814), t815), t819), t822), t823), @tactics.eq_tac), @tactics.disch_tac), t824), t834)
  model_duplicate_c.set(@tactics.prove(@term_syntax.parse_term("∀ M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), ∀ fns : ((Num, Num)) -> Bool, ∀ preds : ((Num, Num)) -> Bool, ∀ D : (A) -> Bool, interpretation((fns, preds), M) && SUBSET(Dom(M), D) && !(Dom(M) == {}) → (∃ M' : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), interpretation((fns, preds), M') && Dom(M') == D && (∀ s : (Form) -> Bool, SUBSET(functions(s), fns) && SUBSET(predicates(s), preds) → satisfies(M', s) == satisfies(M, s)))"), t835))
}

///|
let model_duplicate_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MODEL_DUPLICATE")

///|
/// `MODEL_DUPLICATE`
pub fn model_duplicate() -> @kernel.Thm {
  model_duplicate_c.get()
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
}
