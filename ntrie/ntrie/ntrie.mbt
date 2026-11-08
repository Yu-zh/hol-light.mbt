// Translated from upstream Ntrie/ntrie.ml; edit this file directly.

///|
/// NTRIE
fn step_1() -> Unit raise {
  ntrie_c.set(@pair.new_definition(@term_syntax.parse_term("(NTRIE : ((Num) -> Bool, Num) -> Bool)((s : (Num) -> Bool)) == s")))
}

///|
let ntrie_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NTRIE")

///|
/// `NTRIE`
pub fn ntrie() -> @kernel.Thm {
  ntrie_c.get()
}

///|
/// NEMPTY
fn step_2() -> Unit raise {
  nempty_c.set(@pair.new_definition(@term_syntax.parse_term("(NEMPTY : (Num) -> Bool) == {}")))
}

///|
let nempty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NEMPTY")

///|
/// `NEMPTY`
pub fn nempty() -> @kernel.Thm {
  nempty_c.get()
}

///|
/// NZERO
fn step_3() -> Unit raise {
  nzero_c.set(@pair.new_definition(@term_syntax.parse_term("(NZERO : (Num) -> Bool) == {_0}")))
}

///|
let nzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NZERO")

///|
/// `NZERO`
pub fn nzero() -> @kernel.Thm {
  nzero_c.get()
}

///|
/// NNODE
fn step_4() -> Unit raise {
  nnode_c.set(@pair.new_definition(@term_syntax.parse_term("(NNODE : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)((s : (Num) -> Bool), (t : (Num) -> Bool)) == UNION(IMAGE(BIT0, s), IMAGE(BIT1, t))")))
}

///|
let nnode_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NNODE")

///|
/// `NNODE`
pub fn nnode() -> @kernel.Thm {
  nnode_c.get()
}

///|
/// NTRIE_RELATIONS
fn step_5() -> Unit raise {
  let t1 = @sets.set_tac(@list.List([@calc_num.arith_eq()]))
  let t2 = @tactics.then_tac(@simp.rewrite_tac(@list.List([nempty(), nzero(), nnode()])), t1)
  ntrie_relations_c.set(@tactics.prove(@term_syntax.parse_term("NNODE(NEMPTY, NEMPTY) == NEMPTY && NNODE(NZERO, NEMPTY) == NZERO"), t2))
}

///|
let ntrie_relations_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NTRIE_RELATIONS")

///|
/// `NTRIE_RELATIONS`
pub fn ntrie_relations() -> @kernel.Thm {
  ntrie_relations_c.get()
}

///|
/// NTRIE_IN
fn step_6() -> Unit raise {
  let t3 = @sets.set_tac(@list.List([@calc_num.arith_eq()]))
  let t4 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@nums.numeral(), ntrie(), nempty(), nzero(), nnode()])), t3)
  ntrie_in_c.set(@tactics.prove(@term_syntax.parse_term("(∀ s : (Num) -> Bool, ∀ n : Num, IN(NUMERAL(n), NTRIE(s)) == IN(n, s)) && (∀ n : Num, !IN(n, NEMPTY)) && (∀ n : Num, IN(n, NZERO) == (n == _0)) && (∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, IN(_0, NNODE(s, t)) == IN(_0, s)) && (∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, ∀ n : Num, IN(BIT0(n), NNODE(s, t)) == IN(n, s)) && (∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, ∀ n : Num, IN(BIT1(n), NNODE(s, t)) == IN(n, t))"), t4))
}

///|
let ntrie_in_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NTRIE_IN")

///|
/// `NTRIE_IN`
pub fn ntrie_in() -> @kernel.Thm {
  ntrie_in_c.get()
}

///|
/// NTRIE_SUBSET
fn step_7() -> Unit raise {
  let t6 = @sets.set_tac(@list.List([]))
  let t5 = @simp.rewrite_tac(@list.List([@sets.in_union(), @sets.in_image(), @sets.in_insert(), @sets.not_in_empty(), @calc_num.arith_eq()]))
  let t7 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([ntrie(), nempty(), nzero(), nnode(), @sets.subset(), @sets.forall_in_union(), @sets.forall_in_image(), @sets.forall_in_insert()])), t5), t6)
  ntrie_subset_c.set(@tactics.prove(@term_syntax.parse_term("(∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, SUBSET(NTRIE(s), NTRIE(t)) == SUBSET(s, t)) && (∀ s : (Num) -> Bool, SUBSET(NEMPTY, s)) && (∀ s : (Num) -> Bool, SUBSET(s, s)) && !SUBSET(NZERO, NEMPTY) && (∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, SUBSET(NNODE(s, t), NEMPTY) == (SUBSET(s, NEMPTY) && SUBSET(t, NEMPTY))) && (∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, SUBSET(NNODE(s, t), NZERO) == (SUBSET(s, NZERO) && SUBSET(t, NEMPTY))) && (∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, SUBSET(NZERO, NNODE(s, t)) == SUBSET(NZERO, s)) && (∀ s1 : (Num) -> Bool, ∀ s2 : (Num) -> Bool, ∀ t1 : (Num) -> Bool, ∀ t2 : (Num) -> Bool, SUBSET(NNODE(s1, t1), NNODE(s2, t2)) == (SUBSET(s1, s2) && SUBSET(t1, t2)))"), t7))
}

///|
let ntrie_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NTRIE_SUBSET")

///|
/// `NTRIE_SUBSET`
pub fn ntrie_subset() -> @kernel.Thm {
  ntrie_subset_c.get()
}

///|
/// NTRIE_EQ
fn step_8() -> Unit raise {
  let t8 = @sets.set_tac(@list.List([]))
  let t9 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@sets.subset_antisym_eq()), ntrie_subset(), nempty(), nzero()])), t8)
  ntrie_eq_c.set(@tactics.prove(@term_syntax.parse_term("(∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, (NTRIE(s) == NTRIE(t)) == (s == t)) && !(NZERO == NEMPTY) && !(NEMPTY == NZERO) && (∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, (NNODE(s, t) == NEMPTY) == (s == NEMPTY && t == NEMPTY)) && (∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, (NEMPTY == NNODE(s, t)) == (s == NEMPTY && t == NEMPTY)) && (∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, (NNODE(s, t) == NZERO) == (s == NZERO && t == NEMPTY)) && (∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, (NZERO == NNODE(s, t)) == (s == NZERO && t == NEMPTY)) && (∀ s1 : (Num) -> Bool, ∀ s2 : (Num) -> Bool, ∀ t1 : (Num) -> Bool, ∀ t2 : (Num) -> Bool, (NNODE(s1, t1) == NNODE(s2, t2)) == (s1 == s2 && t1 == t2))"), t9))
}

///|
let ntrie_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NTRIE_EQ")

///|
/// `NTRIE_EQ`
pub fn ntrie_eq() -> @kernel.Thm {
  ntrie_eq_c.get()
}

///|
/// NTRIE_SING
fn step_9() -> Unit raise {
  let t13 = @sets.set_tac(@list.List([@calc_num.arith_eq()]))
  let t12 = @simp.asm_rewrite_tac(@list.List([]))
  let t11 = @tactics.repeat_tac(@class.cond_cases_tac)
  let t10 = @tactics.repeat_tac(@tactics.strip_tac)
  let t14 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@nums.numeral(), ntrie(), nempty(), nzero(), nnode()])), t10), t11), t12), t13)
  ntrie_sing_c.set(@tactics.prove(@term_syntax.parse_term("(∀ n : Num, {NUMERAL(n)} == NTRIE({n})) && {_0} == NZERO && (∀ n : Num, {BIT0(n)} == (if n == _0 { NZERO } else { NNODE({n}, NEMPTY) })) && (∀ n : Num, {BIT1(n)} == NNODE(NEMPTY, {n}))"), t14))
}

///|
let ntrie_sing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NTRIE_SING")

///|
/// `NTRIE_SING`
pub fn ntrie_sing() -> @kernel.Thm {
  ntrie_sing_c.get()
}

///|
/// NTRIE_INSERT
fn step_10() -> Unit raise {
  let t18 = @sets.set_tac(@list.List([@calc_num.arith_eq()]))
  let t17 = @simp.asm_rewrite_tac(@list.List([]))
  let t16 = @tactics.repeat_tac(@class.cond_cases_tac)
  let t15 = @tactics.repeat_tac(@tactics.strip_tac)
  let t19 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@nums.numeral(), ntrie(), nempty(), nzero(), nnode()])), t15), t16), t17), t18)
  ntrie_insert_c.set(@tactics.prove(@term_syntax.parse_term("(∀ s : (Num) -> Bool, ∀ n : Num, INSERT(NUMERAL(n), NTRIE(s)) == NTRIE(INSERT(n, s))) && INSERT(_0, NEMPTY) == NZERO && INSERT(_0, NZERO) == NZERO && (∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, INSERT(_0, NNODE(s, t)) == NNODE(INSERT(_0, s), t)) && (∀ n : Num, INSERT(BIT0(n), NZERO) == (if n == _0 { NZERO } else { NNODE(INSERT(n, NZERO), NEMPTY) })) && (∀ n : Num, INSERT(BIT1(n), NZERO) == NNODE(NZERO, {n})) && (∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, ∀ n : Num, INSERT(BIT0(n), NNODE(s, t)) == NNODE(INSERT(n, s), t)) && (∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, ∀ n : Num, INSERT(BIT1(n), NNODE(s, t)) == NNODE(s, INSERT(n, t)))"), t19))
}

///|
let ntrie_insert_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NTRIE_INSERT")

///|
/// `NTRIE_INSERT`
pub fn ntrie_insert() -> @kernel.Thm {
  ntrie_insert_c.get()
}

///|
/// NTRIE_UNION
fn step_11() -> Unit raise {
  let t20 = @sets.set_tac(@list.List([@calc_num.arith_eq()]))
  let t21 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@nums.numeral(), ntrie(), nempty(), nzero(), nnode()])), t20)
  ntrie_union_c.set(@tactics.prove(@term_syntax.parse_term("(∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, UNION(NTRIE(s), NTRIE(t)) == NTRIE(UNION(s, t))) && (∀ s : (Num) -> Bool, UNION(s, NEMPTY) == s) && (∀ s : (Num) -> Bool, UNION(NEMPTY, s) == s) && UNION(NZERO, NZERO) == NZERO && (∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, UNION(NNODE(s, t), NZERO) == NNODE(UNION(s, NZERO), t)) && (∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, UNION(NZERO, NNODE(s, t)) == NNODE(UNION(s, NZERO), t)) && (∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, ∀ r : (Num) -> Bool, ∀ q : (Num) -> Bool, UNION(NNODE(s, t), NNODE(r, q)) == NNODE(UNION(s, r), UNION(t, q)))"), t21))
}

///|
let ntrie_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NTRIE_UNION")

///|
/// `NTRIE_UNION`
pub fn ntrie_union() -> @kernel.Thm {
  ntrie_union_c.get()
}

///|
/// NTRIE_INTER
fn step_12() -> Unit raise {
  let t22 = @sets.set_tac(@list.List([@calc_num.arith_eq()]))
  let t23 = @tactics.then_tac(@simp.rewrite_tac(@list.List([ntrie(), nempty(), nzero(), nnode()])), t22)
  ntrie_inter_c.set(@tactics.prove(@term_syntax.parse_term("(∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, INTER(NTRIE(s), NTRIE(t)) == NTRIE(INTER(s, t))) && (∀ s : (Num) -> Bool, INTER(NEMPTY, s) == NEMPTY) && (∀ s : (Num) -> Bool, INTER(s, NEMPTY) == NEMPTY) && INTER(NZERO, NZERO) == NZERO && (∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, INTER(NZERO, NNODE(s, t)) == INTER(NZERO, s)) && (∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, INTER(NNODE(s, t), NZERO) == INTER(NZERO, s)) && (∀ s1 : (Num) -> Bool, ∀ s2 : (Num) -> Bool, ∀ t1 : (Num) -> Bool, ∀ t2 : (Num) -> Bool, INTER(NNODE(s1, t1), NNODE(s2, t2)) == NNODE(INTER(s1, s2), INTER(t1, t2)))"), t23))
}

///|
let ntrie_inter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NTRIE_INTER")

///|
/// `NTRIE_INTER`
pub fn ntrie_inter() -> @kernel.Thm {
  ntrie_inter_c.get()
}

///|
/// NTRIE_DELETE
fn step_13() -> Unit raise {
  let t27 = @tactics.asm_tac(@sets.set_tac)(@list.List([@calc_num.arith_eq(), @calc_num.arith_zero()]))
  let t26 = @simp.asm_rewrite_tac(@list.List([]))
  let t25 = @tactics.repeat_tac(@class.cond_cases_tac)
  let t24 = @tactics.repeat_tac(@tactics.strip_tac)
  let t28 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@nums.numeral(), ntrie(), nempty(), nzero(), nnode()])), t24), t25), t26), t27)
  ntrie_delete_c.set(@tactics.prove(@term_syntax.parse_term("(∀ s : (Num) -> Bool, ∀ n : Num, DELETE(NTRIE(s), NUMERAL(n)) == NTRIE(DELETE(s, n))) && (∀ n : Num, DELETE(NEMPTY, n) == NEMPTY) && (∀ n : Num, DELETE(NZERO, n) == (if n == _0 { NEMPTY } else { NZERO })) && (∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, DELETE(NNODE(s, t), _0) == NNODE(DELETE(s, _0), t)) && (∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, ∀ n : Num, DELETE(NNODE(s, t), BIT0(n)) == NNODE(DELETE(s, n), t)) && (∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, ∀ n : Num, DELETE(NNODE(s, t), BIT1(n)) == NNODE(s, DELETE(t, n)))"), t28))
}

///|
let ntrie_delete_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NTRIE_DELETE")

///|
/// `NTRIE_DELETE`
pub fn ntrie_delete() -> @kernel.Thm {
  ntrie_delete_c.get()
}

///|
/// NTRIE_DISJOINT
fn step_14() -> Unit raise {
  let t29 = @simp.rewrite_tac(@list.List([ntrie(), @sets.disjoint(), @equal.gsym(nempty()), ntrie_inter(), @sets.inter_aci(), ntrie_eq()]))
  ntrie_disjoint_c.set(@tactics.prove(@term_syntax.parse_term("(∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, DISJOINT(NTRIE(s), NTRIE(t)) == DISJOINT(s, t)) && (∀ s : (Num) -> Bool, DISJOINT(s, NEMPTY)) && (∀ s : (Num) -> Bool, DISJOINT(NEMPTY, s)) && !DISJOINT(NZERO, NZERO) && (∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, DISJOINT(NZERO, NNODE(s, t)) == DISJOINT(s, NZERO)) && (∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, DISJOINT(NNODE(s, t), NZERO) == DISJOINT(s, NZERO)) && (∀ s1 : (Num) -> Bool, ∀ s2 : (Num) -> Bool, ∀ t1 : (Num) -> Bool, ∀ t2 : (Num) -> Bool, DISJOINT(NNODE(s1, t1), NNODE(s2, t2)) == (DISJOINT(s1, s2) && DISJOINT(t1, t2)))"), t29))
}

///|
let ntrie_disjoint_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NTRIE_DISJOINT")

///|
/// `NTRIE_DISJOINT`
pub fn ntrie_disjoint() -> @kernel.Thm {
  ntrie_disjoint_c.get()
}

///|
/// NTRIE_DIFF
fn step_15() -> Unit raise {
  let t30 = @sets.set_tac(@list.List([@calc_num.arith_eq()]))
  let t31 = @tactics.then_tac(@simp.rewrite_tac(@list.List([ntrie(), nempty(), nzero(), nnode()])), t30)
  ntrie_diff_c.set(@tactics.prove(@term_syntax.parse_term("(∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, DIFF(NTRIE(s), NTRIE(t)) == NTRIE(DIFF(s, t))) && (∀ s : (Num) -> Bool, DIFF(NEMPTY, s) == NEMPTY) && (∀ s : (Num) -> Bool, DIFF(s, NEMPTY) == s) && DIFF(NZERO, NZERO) == NEMPTY && (∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, DIFF(NZERO, NNODE(s, t)) == DIFF(NZERO, s)) && (∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, DIFF(NNODE(s, t), NZERO) == NNODE(DIFF(s, NZERO), t)) && (∀ s1 : (Num) -> Bool, ∀ t1 : (Num) -> Bool, ∀ s2 : (Num) -> Bool, ∀ t2 : (Num) -> Bool, DIFF(NNODE(s1, t1), NNODE(s2, t2)) == NNODE(DIFF(s1, s2), DIFF(t1, t2)))"), t31))
}

///|
let ntrie_diff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NTRIE_DIFF")

///|
/// `NTRIE_DIFF`
pub fn ntrie_diff() -> @kernel.Thm {
  ntrie_diff_c.get()
}

///|
/// NTRIE_IMAGE_DEF
fn step_16() -> Unit raise {
  ntrie_image_def_c.set(@pair.new_definition(@term_syntax.parse_term("∀ f : (Num) -> A, ∀ acc : (A) -> Bool, ∀ s : (Num) -> Bool, (NTRIE_IMAGE : ((Num) -> A, (A) -> Bool, (Num) -> Bool, A) -> Bool)(f, acc, s) == UNION(IMAGE(f, s), acc)")))
}

///|
let ntrie_image_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NTRIE_IMAGE_DEF")

///|
/// `NTRIE_IMAGE_DEF`
pub fn ntrie_image_def() -> @kernel.Thm {
  ntrie_image_def_c.get()
}

///|
/// NTRIE_IMAGE
fn step_17() -> Unit raise {
  let t32 = @sets.set_tac(@list.List([]))
  let t33 = @tactics.then_tac(@simp.rewrite_tac(@list.List([ntrie(), nempty(), nzero(), nnode(), ntrie_image_def()])), t32)
  ntrie_image_c.set(@tactics.prove(@term_syntax.parse_term("(∀ f : (Num) -> A, ∀ acc : (A) -> Bool, NTRIE_IMAGE(f, acc, NEMPTY) == acc) && (∀ f : (Num) -> A, ∀ acc : (A) -> Bool, NTRIE_IMAGE(f, acc, NZERO) == INSERT(f(_0), acc)) && (∀ f : (Num) -> A, ∀ acc : (A) -> Bool, ∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, NTRIE_IMAGE(f, acc, NNODE(s, t)) == NTRIE_IMAGE((n : Num) => f(BIT1(n)), NTRIE_IMAGE((n : Num) => f(BIT0(n)), acc, s), t))"), t33))
}

///|
let ntrie_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NTRIE_IMAGE")

///|
/// `NTRIE_IMAGE`
pub fn ntrie_image() -> @kernel.Thm {
  ntrie_image_c.get()
}

///|
/// IMAGE_EQ_NTRIE_IMAGE
fn step_18() -> Unit raise {
  let t34 = @simp.rewrite_tac(@list.List([@nums.numeral(), ntrie(), @class.eta_ax(), ntrie_image_def(), @sets.union_empty()]))
  image_eq_ntrie_image_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> A, ∀ s : (Num) -> Bool, IMAGE(f, NTRIE(s)) == NTRIE_IMAGE((n : Num) => f(NUMERAL(n)), {}, s)"), t34))
}

///|
let image_eq_ntrie_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IMAGE_EQ_NTRIE_IMAGE")

///|
/// `IMAGE_EQ_NTRIE_IMAGE`
pub fn image_eq_ntrie_image() -> @kernel.Thm {
  image_eq_ntrie_image_c.get()
}

///|
let ntrie_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("NTRIE_tm")

///|
/// `NTRIE_tm`
pub fn ntrie_tm() -> @kernel.Term {
  ntrie_tm_c.get()
}

///|
let nempty_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("NEMPTY_tm")

///|
/// `NEMPTY_tm`
pub fn nempty_tm() -> @kernel.Term {
  nempty_tm_c.get()
}

///|
let nzero_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("NZERO_tm")

///|
/// `NZERO_tm`
pub fn nzero_tm() -> @kernel.Term {
  nzero_tm_c.get()
}

///|
let nnode_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("NNODE_tm")

///|
/// `NNODE_tm`
pub fn nnode_tm() -> @kernel.Term {
  nnode_tm_c.get()
}

///|
/// NTRIE_tm, NEMPTY_tm, NZERO_tm, NNODE_tm
fn step_19() -> Unit raise {
  let f : (@kernel.Thm) -> @kernel.Term raise = fn(x44 : @kernel.Thm) -> @kernel.Term raise {
    (fn(x42 : @kernel.Term) -> @kernel.Term raise {
      (fn(x40 : (@list.List[@kernel.Term], @kernel.Term)) -> @kernel.Term raise {
        (fn(x38 : @kernel.Term) -> @kernel.Term raise {
          (fn(x37 : @kernel.Term) -> @kernel.Term raise {
            (fn(x35 : (@kernel.Term, @list.List[@kernel.Term])) -> @kernel.Term raise {
              x35.0
            })((fn(x36 : @kernel.Term) -> (@kernel.Term, @list.List[@kernel.Term]) raise {
              @basics.strip_comb(x36)
            })(x37))
          })(@equal.lhs(x38))
        })((fn(x39 : (@list.List[@kernel.Term], @kernel.Term)) -> @kernel.Term raise {
          x39.1
        })(x40))
      })((fn(x41 : @kernel.Term) -> (@list.List[@kernel.Term], @kernel.Term) raise {
        @basics.strip_forall(x41)
      })(x42))
    })((fn(x43 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x43)
    })(x44))
  }
  match @lib.map(f, @list.List([ntrie(), nempty(), nzero(), nnode()])) {
    More(ntrie_tm, tail=More(nempty_tm, tail=More(nzero_tm, tail=More(nnode_tm, tail=Empty)))) => {
      ntrie_tm_c.set(ntrie_tm)
      nempty_tm_c.set(nempty_tm)
      nzero_tm_c.set(nzero_tm)
      nnode_tm_c.set(nnode_tm)
      ()
    }
    _ => raise @lib.MatchFailure("tscript.ml:230:4")
  }
}

///|
/// mk_nnode
fn step_20() -> Unit raise {
  mk_nnode_c.set(fn(x47 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise {
    fn(x48 : @kernel.Term) -> @kernel.Term raise {
      ((x45 : @kernel.Term, x46 : @kernel.Term) => @basics.mk_binop(nnode_tm(), x45, x46))(x47, x48)
    }
  })
}

///|
let mk_nnode_c : @lib.Cell[(@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise] = @lib.Cell::new("mk_nnode")

///|
/// `mk_nnode`
pub fn mk_nnode(x : @kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise {
  (mk_nnode_c.get())(x)
}

///|
/// mk_small_ntrie
fn step_21() -> Unit raise {
  fn mk_sing(x49 : Int64) -> @kernel.Term raise {
    let n = x49
    if physical_equal(n, 0L) {
      nzero_tm()
    } else {
      let t50 = @lib.div63(n, 2L)
      let (r, d) = (@lib.mod63(n, 2L), t50)
      let tm = mk_sing(d)
      if physical_equal(r, 0L) {
        mk_nnode(tm)(nempty_tm())
      } else {
        mk_nnode(nempty_tm())(tm)
      }
    }
  }
  fn part(x51 : (@list.List[Int64], @list.List[Int64]), x52 : @list.List[Int64]) -> ((@list.List[Int64], @list.List[Int64])) raise {
    let (el, ol) as acc = x51
    match x52 {
      Empty => acc
      More(h, tail=t) => {
        let t53 = @lib.div63(h, 2L)
        let (r_1, d_1) = (@lib.mod63(h, 2L), t53)
        let acc_1 = if (r_1 == 0L) {
          (el.prepend(d_1), ol)
        } else {
          (el, ol.prepend(d_1))
        }
        part(acc_1, t)
      }
    }
  }
  fn recur_(x54 : @list.List[Int64]) -> @kernel.Term raise {
    match x54 {
      Empty => nempty_tm()
      More(n_1, tail=Empty) => mk_sing(n_1)
      More(m, tail=More(n_2, tail=_) as t_1) if physical_equal(n_2, m) => recur_(t_1)
      s => {
        let (evens, odds) = part((@list.List([]), @list.List([])), s)
        let t55 = recur_(odds)
        mk_nnode(recur_(evens))(t55)
      }
    }
  }
  mk_small_ntrie_c.set(fn(x56 : @list.List[Int64]) -> @kernel.Term raise {
    let tm_1 = x56
    @kernel.mk_comb(ntrie_tm(), recur_(tm_1))
  })
}

///|
let mk_small_ntrie_c : @lib.Cell[(@list.List[Int64]) -> @kernel.Term raise] = @lib.Cell::new("mk_small_ntrie")

///|
/// Build a trie term from nonnegative machine integers after `load()`.
/// Accepts array literals and slices, e.g. `mk_small_ntrie([1, 3])`.
/// Fixed terms can also use ordinary HOL syntax, e.g. `NTRIE NZERO`.
pub fn mk_small_ntrie(values : ArrayView[Int64]) -> @kernel.Term raise {
  (mk_small_ntrie_c.get())(@list.List(values))
}

///|
/// mk_ntrie
fn step_22() -> Unit raise {
  fn mk_sing(x57 : @num.Num) -> @kernel.Term raise {
    let n = x57
    if @num.eq_num(n, @num.num_0) {
      nzero_tm()
    } else {
      let t58 = @num.quo_num(n, @num.num_2)
      let (r, d) = (@num.mod_num(n, @num.num_2), t58)
      let tm = mk_sing(d)
      if @num.eq_num(r, @num.num_0) {
        mk_nnode(tm)(nempty_tm())
      } else {
        mk_nnode(nempty_tm())(tm)
      }
    }
  }
  fn part(x59 : (@list.List[@num.Num], @list.List[@num.Num]), x60 : @list.List[@num.Num]) -> ((@list.List[@num.Num], @list.List[@num.Num])) raise {
    let (el, ol) as acc = x59
    match x60 {
      Empty => acc
      More(h, tail=t) => {
        let t61 = @num.quo_num(h, @num.num_2)
        let (r_1, d_1) = (@num.mod_num(h, @num.num_2), t61)
        let acc_1 = if @num.eq_num(r_1, @num.num_0) {
          (el.prepend(d_1), ol)
        } else {
          (el, ol.prepend(d_1))
        }
        part(acc_1, t)
      }
    }
  }
  fn recur_(x62 : @list.List[@num.Num]) -> @kernel.Term raise {
    match x62 {
      Empty => nempty_tm()
      More(n_1, tail=Empty) => mk_sing(n_1)
      More(m, tail=More(n_2, tail=_) as t_1) if @num.eq_num(n_2, m) => recur_(t_1)
      s => {
        let (evens, odds) = part((@list.List([]), @list.List([])), s)
        let t63 = recur_(odds)
        mk_nnode(recur_(evens))(t63)
      }
    }
  }
  mk_ntrie_c.set(fn(x64 : @list.List[@num.Num]) -> @kernel.Term raise {
    let tm_1 = x64
    @kernel.mk_comb(ntrie_tm(), recur_(tm_1))
  })
}

///|
let mk_ntrie_c : @lib.Cell[(@list.List[@num.Num]) -> @kernel.Term raise] = @lib.Cell::new("mk_ntrie")

///|
/// Build a trie term from nonnegative integer `Num` values after `load()`.
/// This constructs checked kernel terms directly, without parsing text.
pub fn mk_ntrie(x : @list.List[@num.Num]) -> @kernel.Term raise {
  (mk_ntrie_c.get())(x)
}

///|
/// `mk_numset`
pub fn mk_numset(x65 : @list.List[@kernel.Term]) -> @kernel.Term raise {
  let tm = x65
  @sets.mk_setenum((tm, @term_syntax.parse_type("Num")))
}

///|
let dest_small_ntrie_c : @lib.Cell[(@kernel.Term) -> @list.List[Int64] raise] = @lib.Cell::new("dest_small_ntrie")

///|
/// `dest_small_ntrie`
pub fn dest_small_ntrie(x : @kernel.Term) -> @list.List[Int64] raise {
  (dest_small_ntrie_c.get())(x)
}

///|
let dest_ntrie_c : @lib.Cell[(@kernel.Term) -> @list.List[@num.Num] raise] = @lib.Cell::new("dest_ntrie")

///|
/// `dest_ntrie`
pub fn dest_ntrie(x : @kernel.Term) -> @list.List[@num.Num] raise {
  (dest_ntrie_c.get())(x)
}

///|
/// dest_small_ntrie, dest_ntrie
fn step_23() -> Unit raise {
  let ntrie_strip_tag : (@kernel.Term) -> @kernel.Term raise = fn(x66 : @kernel.Term) -> @kernel.Term raise {
    match x66 {
      @kernel.Term::Comb(@kernel.Term::Const("NTRIE", _), tm) => tm
      _ => raise Failure("ntrie_strip_tag")
    }
  }
  let dest_small_ntrie : (@kernel.Term) -> @list.List[Int64] raise = fn(x67 : @kernel.Term) -> @list.List[Int64] raise {
    let tm_1 = x67
    fn runk(x68 : Int64, x69 : @list.List[Bool]) -> Int64 raise {
      let n = x68
      match x69 {
        Empty => n
        More(h, tail=t) => {
          let d = @lib.mul63(2L, n)
          runk(if h {
            @lib.add63(d, 1L)
          } else {
            d
          }, t)
        }
      }
    }
    fn recur_(x70 : @list.List[Int64], x71 : @list.List[Bool], x72 : @kernel.Term) -> @list.List[Int64] raise {
      let acc = x70
      let k = x71
      match x72 {
        @kernel.Term::Const("NEMPTY", _) => acc
        @kernel.Term::Const("NZERO", _) => acc.prepend(runk(0L, k))
        @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("NNODE", _), stm), ttm) => recur_(recur_(acc, k.prepend(false), stm), k.prepend(true), ttm)
        _ => raise Failure("malformed ntrie")
      }
    }
    recur_(@list.List([]), @list.List([]), ntrie_strip_tag(tm_1))
  }
  let dest_ntrie : (@kernel.Term) -> @list.List[@num.Num] raise = fn(x73 : @kernel.Term) -> @list.List[@num.Num] raise {
    let tm_2 = x73
    fn runk_1(x74 : @num.Num, x75 : @list.List[Bool]) -> @num.Num raise {
      let n_1 = x74
      match x75 {
        Empty => n_1
        More(h_1, tail=t_1) => {
          let d_1 = @num.mult_num(@num.num_2, n_1)
          runk_1(if h_1 {
            @num.add_num(d_1, @num.num_1)
          } else {
            d_1
          }, t_1)
        }
      }
    }
    fn recur__1(x76 : @list.List[@num.Num], x77 : @list.List[Bool], x78 : @kernel.Term) -> @list.List[@num.Num] raise {
      let acc_1 = x76
      let k_1 = x77
      match x78 {
        @kernel.Term::Const("NEMPTY", _) => acc_1
        @kernel.Term::Const("NZERO", _) => acc_1.prepend(runk_1(@num.num_0, k_1))
        @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("NNODE", _), stm_1), ttm_1) => recur__1(recur__1(acc_1, k_1.prepend(false), stm_1), k_1.prepend(true), ttm_1)
        _ => raise Failure("malformed ntrie")
      }
    }
    recur__1(@list.List([]), @list.List([]), ntrie_strip_tag(tm_2))
  }
  let (dest_small_ntrie_1, dest_ntrie_1) = (dest_small_ntrie, dest_ntrie)
  dest_small_ntrie_c.set(dest_small_ntrie_1)
  dest_ntrie_c.set(dest_ntrie_1)
}

///|
/// pp_print_ntrie
fn step_24() -> Unit raise {
  let print_num : (@pp.Formatter) -> ((@num.Num) -> Unit raise) raise = fn(x79 : @pp.Formatter) -> ((@num.Num) -> Unit raise) raise {
    let fmt = x79
    fn(x80 : @num.Num) -> Unit raise {
      let n = x80
      @pp.Formatter::print_string(fmt, @num.string_of_num(n))
    }
  }
  let print_nums : (@pp.Formatter) -> ((@list.List[@num.Num]) -> Unit raise) raise = fn(x81 : @pp.Formatter) -> ((@list.List[@num.Num]) -> Unit raise) raise {
    let fmt_1 = x81
    fn loop_(x83 : @list.List[@num.Num]) -> Unit raise {
      match x83 {
        Empty => ()
        More(h, tail=t) => {
          {
            @pp.Formatter::print_space(fmt_1)
          }
          print_num(fmt_1)(h)
          loop_(t)
        }
      }
    }
    fn(x84 : @list.List[@num.Num]) -> Unit raise {
      match x84 {
        Empty => ()
        More(h_1, tail=t_1) => {
          print_num(fmt_1)(h_1)
          loop_(t_1)
        }
      }
    }
  }
  let print : (@pp.Formatter) -> ((@kernel.Term) -> Unit raise) raise = fn(x85 : @pp.Formatter) -> ((@kernel.Term) -> Unit raise) raise {
    let fmt_2 = x85
    fn(x86 : @kernel.Term) -> Unit raise {
      let tm = x86
      let l = @lib.sort(fn(x87 : @num.Num, x88 : @num.Num) -> Bool raise {
        @num.lt_num(x87, x88)
      }, dest_ntrie(tm))
      @pp.Formatter::open_box(fmt_2, 0)
      @pp.Formatter::print_string(fmt_2, "%%(")
      @pp.Formatter::open_box(fmt_2, 0)
      print_nums(fmt_2)(l)
      {
        @pp.Formatter::close_box(fmt_2)
      }
      @pp.Formatter::print_string(fmt_2, ")")
      {
        @pp.Formatter::close_box(fmt_2)
      }
    }
  }
  pp_print_ntrie_c.set(fn(x89 : @pp.Formatter) -> ((@kernel.Term) -> Unit raise) raise {
    let fmt_3 = x89
    fn(x90 : @kernel.Term) -> Unit raise {
      match x90 {
        @kernel.Term::Comb(@kernel.Term::Const("NTRIE", _), _) as tm_1 => print(fmt_3)(tm_1)
        _ => raise Failure("print_ntrie")
      }
    }
  })
}

///|
let pp_print_ntrie_c : @lib.Cell[(@pp.Formatter) -> ((@kernel.Term) -> Unit raise) raise] = @lib.Cell::new("pp_print_ntrie")

///|
/// `pp_print_ntrie`
pub fn pp_print_ntrie(x : @pp.Formatter) -> ((@kernel.Term) -> Unit raise) raise {
  (pp_print_ntrie_c.get())(x)
}

///|
/// print_ntrie
fn step_25() -> Unit raise {
  print_ntrie_c.set(pp_print_ntrie(@pp.std_formatter))
}

///|
let print_ntrie_c : @lib.Cell[(@kernel.Term) -> Unit raise] = @lib.Cell::new("print_ntrie")

///|
/// `print_ntrie`
pub fn print_ntrie(x : @kernel.Term) -> Unit raise {
  (print_ntrie_c.get())(x)
}

///|
/// string_of_ntrie
fn step_26() -> Unit raise {
  string_of_ntrie_c.set(@printer.print_to_string(pp_print_ntrie))
}

///|
let string_of_ntrie_c : @lib.Cell[(@kernel.Term) -> String raise] = @lib.Cell::new("string_of_ntrie")

///|
/// Format a trie using compact `%%(...)` display notation.
/// This notation is not accepted as trie syntax by the HOL parser.
/// Use `@printer.string_of_term` for ordinary HOL constructor syntax.
pub fn string_of_ntrie(x : @kernel.Term) -> String raise {
  (string_of_ntrie_c.get())(x)
}

///|
let numeral_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("NUMERAL_tm")

///|
/// `NUMERAL_tm`
pub fn numeral_tm() -> @kernel.Term {
  numeral_tm_c.get()
}

///|
let bit0_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("BIT0_tm")

///|
/// `BIT0_tm`
pub fn bit0_tm() -> @kernel.Term {
  bit0_tm_c.get()
}

///|
let bit1_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("BIT1_tm")

///|
/// `BIT1_tm`
pub fn bit1_tm() -> @kernel.Term {
  bit1_tm_c.get()
}

///|
let zero_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("zero_tm")

///|
/// `zero_tm`
pub fn zero_tm() -> @kernel.Term {
  zero_tm_c.get()
}

///|
/// NUMERAL_tm, BIT0_tm, BIT1_tm, zero_tm
fn step_31() -> Unit raise {
  match @equal.lhand(@kernel.concl(@arith.two())) {
    @kernel.Term::Comb(numeral_tm, @kernel.Term::Comb(bit0_tm, @kernel.Term::Comb(bit1_tm, zero_tm))) => {
      numeral_tm_c.set(numeral_tm)
      bit0_tm_c.set(bit0_tm)
      bit1_tm_c.set(bit1_tm)
      zero_tm_c.set(zero_tm)
      ()
    }
    _ => raise @lib.MatchFailure("tscript.ml:420:4")
  }
}

///|
/// `comb_numeral`
pub fn comb_numeral(x112 : @kernel.Term) -> @kernel.Term raise {
  let tm = x112
  @kernel.mk_comb(numeral_tm(), tm)
}

///|
/// `mk_bit0`
pub fn mk_bit0(x113 : @kernel.Term) -> @kernel.Term raise {
  let tm = x113
  if (tm == zero_tm()) {
    tm
  } else {
    @kernel.mk_comb(bit0_tm(), tm)
  }
}

///|
/// `mk_bit1`
pub fn mk_bit1(x114 : @kernel.Term) -> @kernel.Term raise {
  let tm_1 = x114
  @kernel.mk_comb(bit1_tm(), tm_1)
}

///|
/// ntrie_ty
fn step_32() -> Unit raise {
  ntrie_ty_c.set(@kernel.type_of(nempty_tm()))
}

///|
let ntrie_ty_c : @lib.Cell[@kernel.HolType] = @lib.Cell::new("ntrie_ty")

///|
/// `ntrie_ty`
pub fn ntrie_ty() -> @kernel.HolType {
  ntrie_ty_c.get()
}

///|
/// neg_tm
fn step_33() -> Unit raise {
  neg_tm_c.set(@term_syntax.parse_term("op_tilde"))
}

///|
let neg_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("neg_tm")

///|
/// `neg_tm`
pub fn neg_tm() -> @kernel.Term {
  neg_tm_c.get()
}

///|
/// eq_tm
fn step_34() -> Unit raise {
  eq_tm_c.set(@term_syntax.parse_term("(op_eq : ((Num) -> Bool, (Num) -> Bool) -> Bool)"))
}

///|
let eq_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("eq_tm")

///|
/// `eq_tm`
pub fn eq_tm() -> @kernel.Term {
  eq_tm_c.get()
}

///|
/// iff_tm
fn step_35() -> Unit raise {
  iff_tm_c.set(@term_syntax.parse_term("(op_eq : (Bool, Bool) -> Bool)"))
}

///|
let iff_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("iff_tm")

///|
/// `iff_tm`
pub fn iff_tm() -> @kernel.Term {
  iff_tm_c.get()
}

///|
/// conj_tm
fn step_36() -> Unit raise {
  conj_tm_c.set(@term_syntax.parse_term("op_slash_bslash"))
}

///|
let conj_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("conj_tm")

///|
/// `conj_tm`
pub fn conj_tm() -> @kernel.Term {
  conj_tm_c.get()
}

///|
/// IN_tm
fn step_37() -> Unit raise {
  in_tm_c.set(@term_syntax.parse_term("(IN : (Num, (Num) -> Bool) -> Bool)"))
}

///|
let in_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("IN_tm")

///|
/// `IN_tm`
pub fn in_tm() -> @kernel.Term {
  in_tm_c.get()
}

///|
/// EMPTY_tm
fn step_38() -> Unit raise {
  empty_tm_c.set(@term_syntax.parse_term("({} : (Num) -> Bool)"))
}

///|
let empty_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("EMPTY_tm")

///|
/// `EMPTY_tm`
pub fn empty_tm() -> @kernel.Term {
  empty_tm_c.get()
}

///|
/// SUBSET_tm
fn step_39() -> Unit raise {
  subset_tm_c.set(@term_syntax.parse_term("(SUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)"))
}

///|
let subset_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("SUBSET_tm")

///|
/// `SUBSET_tm`
pub fn subset_tm() -> @kernel.Term {
  subset_tm_c.get()
}

///|
/// PSUBSET_tm
fn step_40() -> Unit raise {
  psubset_tm_c.set(@term_syntax.parse_term("(PSUBSET : ((Num) -> Bool, (Num) -> Bool) -> Bool)"))
}

///|
let psubset_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("PSUBSET_tm")

///|
/// `PSUBSET_tm`
pub fn psubset_tm() -> @kernel.Term {
  psubset_tm_c.get()
}

///|
/// DISJOINT_tm
fn step_41() -> Unit raise {
  disjoint_tm_c.set(@term_syntax.parse_term("(DISJOINT : ((Num) -> Bool, (Num) -> Bool) -> Bool)"))
}

///|
let disjoint_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("DISJOINT_tm")

///|
/// `DISJOINT_tm`
pub fn disjoint_tm() -> @kernel.Term {
  disjoint_tm_c.get()
}

///|
/// INSERT_tm
fn step_42() -> Unit raise {
  insert_tm_c.set(@term_syntax.parse_term("(INSERT : (Num, (Num) -> Bool, Num) -> Bool)"))
}

///|
let insert_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("INSERT_tm")

///|
/// `INSERT_tm`
pub fn insert_tm() -> @kernel.Term {
  insert_tm_c.get()
}

///|
/// UNION_tm
fn step_43() -> Unit raise {
  union_tm_c.set(@term_syntax.parse_term("(UNION : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)"))
}

///|
let union_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("UNION_tm")

///|
/// `UNION_tm`
pub fn union_tm() -> @kernel.Term {
  union_tm_c.get()
}

///|
/// INTER_tm
fn step_44() -> Unit raise {
  inter_tm_c.set(@term_syntax.parse_term("(INTER : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)"))
}

///|
let inter_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("INTER_tm")

///|
/// `INTER_tm`
pub fn inter_tm() -> @kernel.Term {
  inter_tm_c.get()
}

///|
/// DELETE_tm
fn step_45() -> Unit raise {
  delete_tm_c.set(@term_syntax.parse_term("(DELETE : ((Num) -> Bool, Num, Num) -> Bool)"))
}

///|
let delete_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("DELETE_tm")

///|
/// `DELETE_tm`
pub fn delete_tm() -> @kernel.Term {
  delete_tm_c.get()
}

///|
/// DIFF_tm
fn step_46() -> Unit raise {
  diff_tm_c.set(@term_syntax.parse_term("(DIFF : ((Num) -> Bool, (Num) -> Bool, Num) -> Bool)"))
}

///|
let diff_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("DIFF_tm")

///|
/// `DIFF_tm`
pub fn diff_tm() -> @kernel.Term {
  diff_tm_c.get()
}

///|
let svar_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("svar")

///|
/// `svar`
pub fn svar() -> @kernel.Term {
  svar_c.get()
}

///|
let svar1_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("svar1")

///|
/// `svar1`
pub fn svar1() -> @kernel.Term {
  svar1_c.get()
}

///|
let svar2_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("svar2")

///|
/// `svar2`
pub fn svar2() -> @kernel.Term {
  svar2_c.get()
}

///|
let tvar_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("tvar")

///|
/// `tvar`
pub fn tvar() -> @kernel.Term {
  tvar_c.get()
}

///|
let tvar1_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("tvar1")

///|
/// `tvar1`
pub fn tvar1() -> @kernel.Term {
  tvar1_c.get()
}

///|
let tvar2_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("tvar2")

///|
/// `tvar2`
pub fn tvar2() -> @kernel.Term {
  tvar2_c.get()
}

///|
/// svar, svar1, svar2, tvar, tvar1, tvar2
fn step_47() -> Unit raise {
  match @lib.map(fn(x115 : String) -> @kernel.Term raise {
    let s = x115
    @kernel.mk_var(s, ntrie_ty())
  }, @list.List(["s", "s1", "s2", "t", "t1", "t2"])) {
    More(svar, tail=More(svar1, tail=More(svar2, tail=More(tvar, tail=More(tvar1, tail=More(tvar2, tail=Empty)))))) => {
      svar_c.set(svar)
      svar1_c.set(svar1)
      svar2_c.set(svar2)
      tvar_c.set(tvar)
      tvar1_c.set(tvar1)
      tvar2_c.set(tvar2)
      ()
    }
    _ => raise @lib.MatchFailure("tscript.ml:442:4")
  }
}

///|
/// nvar
fn step_48() -> Unit raise {
  nvar_c.set(@term_syntax.parse_term("(n : Num)"))
}

///|
let nvar_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("nvar")

///|
/// `nvar`
pub fn nvar() -> @kernel.Term {
  nvar_c.get()
}

///|
/// STANDARDIZE
fn step_49() -> Unit raise {
  let ilist = @lib.map(fn(x116 : @kernel.Term) -> (@kernel.Term, @kernel.Term) raise {
    let x = x116
    (x, x)
  }, @list.List([nempty_tm(), nzero_tm(), nnode_tm(), ntrie_tm(), in_tm(), eq_tm(), subset_tm(), psubset_tm(), disjoint_tm(), insert_tm(), union_tm(), inter_tm(), delete_tm(), diff_tm(), neg_tm(), iff_tm(), conj_tm(), bit0_tm(), bit1_tm(), zero_tm(), nvar(), svar(), svar1(), svar2(), tvar(), tvar1(), tvar2()]))
  fn replace(x117 : @kernel.Term) -> @kernel.Term raise {
    let tm = x117
    match tm {
      @kernel.Term::Var(_, _) | @kernel.Term::Const(_, _) => @lib.rev_assocd(tm, ilist, tm)
      @kernel.Term::Comb(s, t) => {
        let t118 = replace(t)
        @kernel.mk_comb(replace(s), t118)
      }
      @kernel.Term::Abs(_, _) => raise Failure("replace")
    }
  }
  standardize_c.set(fn(x119 : @kernel.Thm) -> @kernel.Thm raise {
    let th = x119
    let tm_p = replace(@kernel.concl(th))
    @kernel.eq_mp(@kernel.refl(tm_p), th)
  })
}

///|
let standardize_c : @lib.Cell[(@kernel.Thm) -> @kernel.Thm raise] = @lib.Cell::new("STANDARDIZE")

///|
/// `STANDARDIZE`
pub fn standardize(x : @kernel.Thm) -> @kernel.Thm raise {
  (standardize_c.get())(x)
}

///|
/// wellformed
fn step_50() -> Unit raise {
  fn visit(x120 : @kernel.Term) -> Unit raise {
    match x120 {
      @kernel.Term::Const("NEMPTY", _) => ()
      @kernel.Term::Const("NZERO", _) => ()
      @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("NNODE", _), stm), ttm) => {
        match (stm, ttm) {
          (@kernel.Term::Const("NEMPTY", _), @kernel.Term::Const("NEMPTY", _)) | (@kernel.Term::Const("NZERO", _), @kernel.Term::Const("NEMPTY", _)) => @lib.failure()
          _ => {
            visit(stm)
            visit(ttm)
          }
        }
      }
      _ => @lib.failure()
    }
  }
  wellformed_c.set(fn(x121 : @kernel.Term) -> Bool raise {
    match x121 {
      @kernel.Term::Comb(@kernel.Term::Const("NTRIE", _), tm) => @lib.can(visit, tm)
      _ => false
    }
  })
}

///|
let wellformed_c : @lib.Cell[(@kernel.Term) -> Bool raise] = @lib.Cell::new("wellformed")

///|
/// `wellformed`
pub fn wellformed(x : @kernel.Term) -> Bool raise {
  (wellformed_c.get())(x)
}

///|
let num_nz_rule_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("NUM_NZ_RULE")

///|
/// `NUM_NZ_RULE`
pub fn num_nz_rule(x : @kernel.Term) -> @kernel.Thm raise {
  (num_nz_rule_c.get())(x)
}

///|
let ntrie_zero_in_rule_c : @lib.Cell[(@kernel.Term) -> (Bool, @kernel.Thm) raise] = @lib.Cell::new("NTRIE_ZERO_IN_RULE")

///|
/// `NTRIE_ZERO_IN_RULE`
pub fn ntrie_zero_in_rule(x : @kernel.Term) -> ((Bool, @kernel.Thm)) raise {
  (ntrie_zero_in_rule_c.get())(x)
}

///|
let ntrie_choose_rule_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("NTRIE_CHOOSE_RULE")

///|
/// `NTRIE_CHOOSE_RULE`
pub fn ntrie_choose_rule(x : @kernel.Term) -> @kernel.Thm raise {
  (ntrie_choose_rule_c.get())(x)
}

///|
let ntrie_in_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("NTRIE_IN_CONV")

///|
/// `NTRIE_IN_CONV`
pub fn ntrie_in_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (ntrie_in_conv_c.get())(x)
}

///|
/// NUM_NZ_RULE, NTRIE_ZERO_IN_RULE, NTRIE_CHOOSE_RULE, NTRIE_IN_CONV
fn step_51() -> Unit raise {
  let t124 = @simp.rewrite_tac(@list.List([@calc_num.arith_eq()]))
  let t125 = (@term_syntax.parse_term("!(BIT1((n : Num)) == _0) && !(n == _0) == !(BIT0(n) == _0)"), t124)
  let (pth1, pth2) = (fn(x122 : @kernel.Thm) -> (@kernel.Thm, @kernel.Thm) raise {
    @bool.conj_pair(standardize(x122))
  })((fn(x123 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x123.0, x123.1)
  })(t125))
  fn num_nz_rule(x126 : @kernel.Term) -> @kernel.Thm raise {
    match x126 {
      @kernel.Term::Comb(@kernel.Term::Const("BIT1", _), ntm) => @kernel.inst_rule(@list.List([(ntm, nvar())]), pth1)
      @kernel.Term::Comb(@kernel.Term::Const("BIT0", _), ntm_1) => {
        let rth = num_nz_rule(ntm_1)
        let pth = @kernel.inst_rule(@list.List([(ntm_1, nvar())]), pth2)
        @kernel.eq_mp(pth, rth)
      }
      _ => raise Failure("NUM_NZ_RULE")
    }
  }
  let t129 = @simp.rewrite_tac(@list.List([ntrie_in(), @calc_num.arith_eq()]))
  let t130 = (@term_syntax.parse_term("!IN(_0, NEMPTY) && IN(_0, NZERO) && !IN((n : Num), NEMPTY) && IN(_0, (s : (Num) -> Bool)) == IN(_0, NNODE(s, (t : (Num) -> Bool))) && IN(n, s) == IN(BIT0(n), NNODE(s, t)) && IN(n, t) == IN(BIT1(n), NNODE(s, t)) && !IN(BIT1(n), NZERO) && !(n == _0) == !IN(BIT0(n), NZERO)"), t129)
  let (num_nz_rule_1, ntrie_zero_in_rule_1, ntrie_choose_rule_1, ntrie_in_conv_2) = match (fn(x127 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    @bool.conjuncts_rule(standardize(x127))
  })((fn(x128 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x128.0, x128.1)
  })(t130)) {
    More(zine_nth, tail=More(zinx_pth, tail=More(ine_nth, tail=More(zinn_pth, tail=More(pth4, tail=More(pth5, tail=More(pth6, tail=More(pth7, tail=Empty)))))))) => {
      match @lib.map((x131 : @kernel.Thm) => @equal.ap_term(neg_tm(), x131), @list.List([zinn_pth, pth4, pth5])) {
        More(zinn_nth, tail=More(npth4, tail=More(npth5, tail=Empty))) => {
          fn ntrie_zero_in_rule(x132 : @kernel.Term) -> ((Bool, @kernel.Thm)) raise {
            match x132 {
              @kernel.Term::Const("NEMPTY", _) => (false, zine_nth)
              @kernel.Term::Const("NZERO", _) => (true, zinx_pth)
              @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("NNODE", _), stm), ttm) => {
                let (b, rth_1) = ntrie_zero_in_rule(stm)
                let pth_1 = if b {
                  zinn_pth
                } else {
                  zinn_nth
                }
                (b, @kernel.eq_mp(@kernel.inst_rule(@list.List([(stm, svar()), (ttm, tvar())]), pth_1), rth_1))
              }
              _ => raise Failure("Malformed ntrie")
            }
          }
          fn ntrie_choose_rule(x133 : @kernel.Term) -> @kernel.Thm raise {
            match x133 {
              @kernel.Term::Const("NEMPTY", _) => raise Failure("Empty ntrie")
              @kernel.Term::Const("NZERO", _) => zinx_pth
              @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("NNODE", _), stm_1), ttm_1) => {
                try {
                  let rth_2 = ntrie_choose_rule(ttm_1)
                  let ntm_2 = @equal.lhand(@kernel.concl(rth_2))
                  let pth_2 = @kernel.inst_rule(@list.List([(ntm_2, nvar()), (stm_1, svar()), (ttm_1, tvar())]), pth5)
                  @kernel.eq_mp(pth_2, rth_2)
                } catch {
                  Failure(_) => {
                    let rth_3 = ntrie_choose_rule(stm_1)
                    let ntm_3 = @equal.lhand(@kernel.concl(rth_3))
                    let pth_3 = @kernel.inst_rule(@list.List([(ntm_3, nvar()), (stm_1, svar()), (ttm_1, tvar())]), pth4)
                    @kernel.eq_mp(pth_3, rth_3)
                  }
                  e => raise e
                }
              }
              _ => raise Failure("Malformed ntrie")
            }
          }
          fn ntrie_in_rule(x134 : (@kernel.Term, @kernel.Term)) -> ((Bool, @kernel.Thm)) raise {
            match x134 {
              (@kernel.Term::Const("_0", _), stm_2) => ntrie_zero_in_rule(stm_2)
              (ntm_4, @kernel.Term::Const("NEMPTY", _)) => (false, @kernel.inst_rule(@list.List([(ntm_4, nvar())]), ine_nth))
              (@kernel.Term::Comb(@kernel.Term::Const("BIT1", _), ntm_5), @kernel.Term::Const("NZERO", _)) => (false, @kernel.inst_rule(@list.List([(ntm_5, nvar())]), pth6))
              (@kernel.Term::Comb(@kernel.Term::Const("BIT0", _), ntm_6), @kernel.Term::Const("NZERO", _)) => {
                let rth_4 = num_nz_rule(ntm_6)
                (false, @kernel.eq_mp(@kernel.inst_rule(@list.List([(ntm_6, nvar())]), pth7), rth_4))
              }
              (@kernel.Term::Comb(@kernel.Term::Const("BIT0", _), ntm_7), @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("NNODE", _), stm_3), ttm_2)) => {
                let (b_1, rth_5) = ntrie_in_rule((ntm_7, stm_3))
                let pth_4 = if b_1 {
                  pth4
                } else {
                  npth4
                }
                let pth_5 = @kernel.inst_rule(@list.List([(ntm_7, nvar()), (stm_3, svar()), (ttm_2, tvar())]), pth_4)
                (b_1, @kernel.eq_mp(pth_5, rth_5))
              }
              (@kernel.Term::Comb(@kernel.Term::Const("BIT1", _), ntm_8), @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("NNODE", _), stm_4), ttm_3)) => {
                let (b_2, rth_6) = ntrie_in_rule((ntm_8, ttm_3))
                let pth_6 = if b_2 {
                  pth5
                } else {
                  npth5
                }
                let pth_7 = @kernel.inst_rule(@list.List([(ntm_8, nvar()), (stm_4, svar()), (ttm_3, tvar())]), pth_6)
                (b_2, @kernel.eq_mp(pth_7, rth_6))
              }
              _ => raise Failure("NTRIE_IN_RULE")
            }
          }
          let t137 = @simp.rewrite_tac(@list.List([@nums.numeral(), ntrie()]))
          let t138 = (@term_syntax.parse_term("IN((n : Num), (s : (Num) -> Bool)) == (IN(NUMERAL(n), NTRIE(s)) == true) && !IN(n, s) == (IN(NUMERAL(n), NTRIE(s)) == false)"), t137)
          let (pth1_1, pth2_1) = (fn(x135 : @kernel.Thm) -> (@kernel.Thm, @kernel.Thm) raise {
            @bool.conj_pair(standardize(x135))
          })((fn(x136 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
            @tactics.prove(x136.0, x136.1)
          })(t138))
          let ntrie_in_conv : (@kernel.Term) -> @kernel.Thm raise = fn(x139 : @kernel.Term) -> @kernel.Thm raise {
            match x139 {
              @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("IN", _), @kernel.Term::Comb(@kernel.Term::Const("NUMERAL", _), ntm_9)), @kernel.Term::Comb(@kernel.Term::Const("NTRIE", _), stm_5)) => {
                let (b_3, rth_7) = ntrie_in_rule((ntm_9, stm_5))
                let pth_8 = if b_3 {
                  pth1_1
                } else {
                  pth2_1
                }
                @kernel.eq_mp(@kernel.inst_rule(@list.List([(ntm_9, nvar()), (stm_5, svar())]), pth_8), rth_7)
              }
              _ => raise Failure("NTRIE_IN_CONV")
            }
          }
          let ntrie_in_conv_1 : (@kernel.Term) -> @kernel.Thm raise = ntrie_in_conv
          (num_nz_rule, ntrie_zero_in_rule, ntrie_choose_rule, ntrie_in_conv_1)
        }
        _ => raise @lib.MatchFailure("tscript.ml:507")
      }
    }
    _ => raise @lib.MatchFailure("tscript.ml:496")
  }
  num_nz_rule_c.set(num_nz_rule_1)
  ntrie_zero_in_rule_c.set(ntrie_zero_in_rule_1)
  ntrie_choose_rule_c.set(ntrie_choose_rule_1)
  ntrie_in_conv_c.set(ntrie_in_conv_2)
}

///|
/// NTRIE_SUBSET_CONV
fn step_52() -> Unit raise {
  let t143 = @sets.set_tac(@list.List([]))
  let t142 = @simp.rewrite_tac(@list.List([nempty()]))
  let t144 = @tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([ntrie_subset()])), t142), t143)
  let t145 = (@term_syntax.parse_term("SUBSET((s : (Num) -> Bool), s) && SUBSET(NEMPTY, NEMPTY) && SUBSET(NZERO, NZERO) && SUBSET(NEMPTY, NZERO) && SUBSET(NEMPTY, (t : (Num) -> Bool)) && !SUBSET(NZERO, NEMPTY) && (IN((n : Num), s) → !SUBSET(s, NEMPTY)) && SUBSET(NZERO, s) == SUBSET(NZERO, NNODE(s, t)) && !SUBSET(NZERO, s) == !SUBSET(NZERO, NNODE(s, t)) && SUBSET(s, NZERO) == SUBSET(NNODE(s, NEMPTY), NZERO) && !SUBSET(s, NZERO) == !SUBSET(NNODE(s, NEMPTY), NZERO) && (IN(n, t) → !SUBSET(NNODE(s, t), NZERO)) && (SUBSET((s1 : (Num) -> Bool), (s2 : (Num) -> Bool)) && SUBSET((t1 : (Num) -> Bool), (t2 : (Num) -> Bool))) == SUBSET(NNODE(s1, t1), NNODE(s2, t2)) && (!SUBSET(s1, s2) → !SUBSET(NNODE(s1, t1), NNODE(s2, t2))) && (!SUBSET(t1, t2) → !SUBSET(NNODE(s1, t1), NNODE(s2, t2)))"), t144)
  ntrie_subset_conv_c.set(match (fn(x140 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    @bool.conjuncts_rule(standardize(x140))
  })((fn(x141 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x141.0, x141.1)
  })(t145)) {
    More(sub_refl_pth, tail=More(esube_pth, tail=More(xsubx_pth, tail=More(esubx_pth, tail=More(esub_pth, tail=More(xsube_nth, tail=More(sube_nth, tail=More(xsubn_pth, tail=More(xsubn_nth, tail=More(nsubx_pth, tail=More(nsubx_nth1, tail=More(nsubx_nth2, tail=More(nsubn_pth, tail=More(nsubn_nth1, tail=More(nsubn_nth2, tail=Empty))))))))))))))) => {
      fn ntrie_nzero_subset_rule(x146 : @kernel.Term) -> ((Bool, @kernel.Thm)) raise {
        match x146 {
          @kernel.Term::Const("NEMPTY", _) => (false, xsube_nth)
          @kernel.Term::Const("NZERO", _) => (true, xsubx_pth)
          @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("NNODE", _), stm), ttm) => {
            let (b, rth) = ntrie_nzero_subset_rule(stm)
            let pth = if b {
              xsubn_pth
            } else {
              xsubn_nth
            }
            (b, @kernel.eq_mp(@kernel.inst_rule(@list.List([(stm, svar()), (ttm, tvar())]), pth), rth))
          }
          _ => raise Failure("Malformed ntrie")
        }
      }
      fn ntrie_subset_nzero_rule(x147 : @kernel.Term) -> ((Bool, @kernel.Thm)) raise {
        match x147 {
          @kernel.Term::Const("NEMPTY", _) => (true, esubx_pth)
          @kernel.Term::Const("NZERO", _) => (true, xsubx_pth)
          @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("NNODE", _), stm_1), @kernel.Term::Const("NEMPTY", _)) => {
            let (b_1, rth_1) = ntrie_subset_nzero_rule(stm_1)
            let pth_1 = if b_1 {
              nsubx_pth
            } else {
              nsubx_nth1
            }
            (b_1, @kernel.eq_mp(@kernel.inst_rule(@list.List([(stm_1, svar())]), pth_1), rth_1))
          }
          @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("NNODE", _), stm_2), ttm_1) => {
            let rth_2 = ntrie_choose_rule(ttm_1)
            let ntm = @equal.lhand(@kernel.concl(rth_2))
            let pth_2 = @kernel.inst_rule(@list.List([(ntm, nvar()), (stm_2, svar()), (ttm_1, tvar())]), nsubx_nth2)
            (false, @bool.mp(pth_2, rth_2))
          }
          _ => raise Failure("Malformed ntrie")
        }
      }
      fn ntrie_subset_rule(x148 : (@kernel.Term, @kernel.Term)) -> ((Bool, @kernel.Thm)) raise {
        match x148 {
          (@kernel.Term::Const("NEMPTY", _), @kernel.Term::Const("NEMPTY", _)) => (true, esube_pth)
          (@kernel.Term::Const("NEMPTY", _), @kernel.Term::Const("NZERO", _)) => (true, esubx_pth)
          (@kernel.Term::Const("NEMPTY", _), ttm_2) => (true, @kernel.inst_rule(@list.List([(ttm_2, tvar())]), esub_pth))
          (stm_3, @kernel.Term::Const("NEMPTY", _)) => {
            let rth_3 = ntrie_choose_rule(stm_3)
            let ntm_1 = @equal.lhand(@kernel.concl(rth_3))
            let pth_3 = @kernel.inst_rule(@list.List([(ntm_1, nvar()), (stm_3, svar())]), sube_nth)
            (false, @bool.mp(pth_3, rth_3))
          }
          (@kernel.Term::Const("NZERO", _), ttm_3) => ntrie_nzero_subset_rule(ttm_3)
          (stm_4, @kernel.Term::Const("NZERO", _)) => ntrie_subset_nzero_rule(stm_4)
          (stm_5, ttm_4) if (stm_5 == ttm_4) => (true, @kernel.inst_rule(@list.List([(stm_5, svar())]), sub_refl_pth))
          (@kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("NNODE", _), stm1), ttm1), @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("NNODE", _), stm2), ttm2)) => {
            let (b1, rth1) = ntrie_subset_rule((stm1, stm2))
            let pinst : (@kernel.Thm) -> @kernel.Thm raise = (x149 : @kernel.Thm) => @kernel.inst_rule(@list.List([(stm1, svar1()), (stm2, svar2()), (ttm1, tvar1()), (ttm2, tvar2())]), x149)
            if !b1 {
              (false, @bool.mp(pinst(nsubn_nth1), rth1))
            } else {
              let (b2, rth2) = ntrie_subset_rule((ttm1, ttm2))
              if !b2 {
                (false, @bool.mp(pinst(nsubn_nth2), rth2))
              } else {
                let t150 = @bool.conj(rth1, rth2)
                (true, @kernel.eq_mp(pinst(nsubn_pth), t150))
              }
            }
          }
          _ => raise Failure("Malformed ntrie")
        }
      }
      let t153 = @simp.rewrite_tac(@list.List([ntrie()]))
      let t154 = (@term_syntax.parse_term("SUBSET((s : (Num) -> Bool), (t : (Num) -> Bool)) == (SUBSET(NTRIE(s), NTRIE(t)) == true) && !SUBSET(s, t) == (SUBSET(NTRIE(s), NTRIE(t)) == false)"), t153)
      let (pth_sub_eqt, pth_sub_eqf) = (fn(x151 : @kernel.Thm) -> (@kernel.Thm, @kernel.Thm) raise {
        @bool.conj_pair(standardize(x151))
      })((fn(x152 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
        @tactics.prove(x152.0, x152.1)
      })(t154))
      let ntrie_subset_conv_1 : (@kernel.Term) -> @kernel.Thm raise = fn(x155 : @kernel.Term) -> @kernel.Thm raise {
        match x155 {
          @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("SUBSET", _), @kernel.Term::Comb(@kernel.Term::Const("NTRIE", _), stm_6)), @kernel.Term::Comb(@kernel.Term::Const("NTRIE", _), ttm_5)) => {
            let (b_2, rth_4) = ntrie_subset_rule((stm_6, ttm_5))
            let pth_4 = if b_2 {
              pth_sub_eqt
            } else {
              pth_sub_eqf
            }
            @kernel.eq_mp(@kernel.inst_rule(@list.List([(stm_6, svar()), (ttm_5, tvar())]), pth_4), rth_4)
          }
          _ => raise Failure("NTRIE_SUBSET_CONV")
        }
      }
      ntrie_subset_conv_1
    }
    _ => raise @lib.MatchFailure("tscript.ml:574")
  })
}

///|
let ntrie_subset_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("NTRIE_SUBSET_CONV")

///|
/// `NTRIE_SUBSET_CONV`
pub fn ntrie_subset_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (ntrie_subset_conv_c.get())(x)
}

///|
/// NTRIE_EQ_CONV
fn step_53() -> Unit raise {
  let t158 = @sets.set_tac(@list.List([nempty(), nzero()]))
  let t159 = @tactics.then_tac(@simp.simp_tac(@list.List([ntrie_eq()])), t158)
  let t160 = (@term_syntax.parse_term("(s : (Num) -> Bool) == s && NEMPTY == NEMPTY && NZERO == NZERO && !(NEMPTY == NZERO) && !(NZERO == NEMPTY) && (IN((n : Num), s) → !(s == NEMPTY)) && (IN(n, (t : (Num) -> Bool)) → !(NEMPTY == t)) && (!(n == _0) → IN(n, s) → !(s == NZERO)) && (!(n == _0) → IN(n, t) → !(NZERO == t)) && ((s1 : (Num) -> Bool) == (s2 : (Num) -> Bool) && (t1 : (Num) -> Bool) == (t2 : (Num) -> Bool)) == (NNODE(s1, t1) == NNODE(s2, t2)) && (!(s1 == s2) → !(NNODE(s1, t1) == NNODE(s2, t2))) && (!(t1 == t2) → !(NNODE(s1, t1) == NNODE(s2, t2)))"), t159)
  ntrie_eq_conv_c.set(match (fn(x156 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    @bool.conjuncts_rule(standardize(x156))
  })((fn(x157 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x157.0, x157.1)
  })(t160)) {
    More(eq_refl_pth, tail=More(eeqe_pth, tail=More(xeqx_pth, tail=More(eeqx_nth, tail=More(xeqe_nth, tail=More(eqe_nth, tail=More(eeq_nth, tail=More(eqx_nth1, tail=More(eqx_nth2, tail=More(neqn_pth, tail=More(neqn_nth1, tail=More(neqn_nth2, tail=Empty)))))))))))) => {
      fn ntrie_eq_rule(x161 : (@kernel.Term, @kernel.Term)) -> ((Bool, @kernel.Thm)) raise {
        match x161 {
          (@kernel.Term::Const("NEMPTY", _), @kernel.Term::Const("NEMPTY", _)) => (true, eeqe_pth)
          (@kernel.Term::Const("NZERO", _), @kernel.Term::Const("NZERO", _)) => (true, xeqx_pth)
          (@kernel.Term::Const("NEMPTY", _), @kernel.Term::Const("NZERO", _)) => (false, eeqx_nth)
          (@kernel.Term::Const("NZERO", _), @kernel.Term::Const("NEMPTY", _)) => (false, xeqe_nth)
          (stm, @kernel.Term::Const("NEMPTY", _)) => {
            let rth = ntrie_choose_rule(stm)
            let ntm = @equal.lhand(@kernel.concl(rth))
            let pth = @kernel.inst_rule(@list.List([(ntm, nvar()), (stm, svar())]), eqe_nth)
            (false, @bool.mp(pth, rth))
          }
          (@kernel.Term::Const("NEMPTY", _), ttm) => {
            let rth_1 = ntrie_choose_rule(ttm)
            let ntm_1 = @equal.lhand(@kernel.concl(rth_1))
            let pth_1 = @kernel.inst_rule(@list.List([(ntm_1, nvar()), (ttm, tvar())]), eeq_nth)
            (false, @bool.mp(pth_1, rth_1))
          }
          (stm_1, @kernel.Term::Const("NZERO", _)) => {
            let rth_2 = ntrie_choose_rule(stm_1)
            let ntm_2 = @equal.lhand(@kernel.concl(rth_2))
            let zth = num_nz_rule(ntm_2)
            let pth_2 = @kernel.inst_rule(@list.List([(ntm_2, nvar()), (stm_1, svar())]), eqx_nth1)
            (false, @bool.mp(@bool.mp(pth_2, zth), rth_2))
          }
          (@kernel.Term::Const("NZERO", _), ttm_1) => {
            let rth_3 = ntrie_choose_rule(ttm_1)
            let ntm_3 = @equal.lhand(@kernel.concl(rth_3))
            let zth_1 = num_nz_rule(ntm_3)
            let pth_3 = @kernel.inst_rule(@list.List([(ntm_3, nvar()), (ttm_1, tvar())]), eqx_nth2)
            (false, @bool.mp(@bool.mp(pth_3, zth_1), rth_3))
          }
          (stm_2, ttm_2) if (stm_2 == ttm_2) => (true, @kernel.inst_rule(@list.List([(stm_2, svar())]), eq_refl_pth))
          (@kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("NNODE", _), stm1), ttm1), @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("NNODE", _), stm2), ttm2)) => {
            let (b1, rth1) = ntrie_eq_rule((stm1, stm2))
            let pinst : (@kernel.Thm) -> @kernel.Thm raise = (x162 : @kernel.Thm) => @kernel.inst_rule(@list.List([(stm1, svar1()), (stm2, svar2()), (ttm1, tvar1()), (ttm2, tvar2())]), x162)
            if !b1 {
              (false, @bool.mp(pinst(neqn_nth1), rth1))
            } else {
              let (b2, rth2) = ntrie_eq_rule((ttm1, ttm2))
              if !b2 {
                (false, @bool.mp(pinst(neqn_nth2), rth2))
              } else {
                raise Failure("Malformed ntrie")
              }
            }
          }
          _ => raise Failure("Malformed ntrie")
        }
      }
      let t165 = @simp.rewrite_tac(@list.List([ntrie()]))
      let t166 = (@term_syntax.parse_term("((s : (Num) -> Bool) == (t : (Num) -> Bool)) == ((NTRIE(s) == NTRIE(t)) == true) && !(s == t) == ((NTRIE(s) == NTRIE(t)) == false)"), t165)
      let (pth1, pth2) = (fn(x163 : @kernel.Thm) -> (@kernel.Thm, @kernel.Thm) raise {
        @bool.conj_pair(standardize(x163))
      })((fn(x164 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
        @tactics.prove(x164.0, x164.1)
      })(t166))
      fn(x167 : @kernel.Term) -> @kernel.Thm raise {
        match x167 {
          @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("=", _), @kernel.Term::Comb(@kernel.Term::Const("NTRIE", _), stm_3)), @kernel.Term::Comb(@kernel.Term::Const("NTRIE", _), ttm_3)) => {
            let (b, rth_4) = ntrie_eq_rule((stm_3, ttm_3))
            let pth_4 = if b {
              pth1
            } else {
              pth2
            }
            @kernel.eq_mp(@kernel.inst_rule(@list.List([(stm_3, svar()), (ttm_3, tvar())]), pth_4), rth_4)
          }
          _ => raise Failure("NTRIE_SUBSET_CONV")
        }
      }
    }
    _ => raise @lib.MatchFailure("tscript.ml:658")
  })
}

///|
let ntrie_eq_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("NTRIE_EQ_CONV")

///|
/// `NTRIE_EQ_CONV`
pub fn ntrie_eq_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (ntrie_eq_conv_c.get())(x)
}

///|
let ntrie_sing_rule_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("NTRIE_SING_RULE")

///|
/// `NTRIE_SING_RULE`
pub fn ntrie_sing_rule(x : @kernel.Term) -> @kernel.Thm raise {
  (ntrie_sing_rule_c.get())(x)
}

///|
let ntrie_sing_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("NTRIE_SING_CONV")

///|
/// `NTRIE_SING_CONV`
pub fn ntrie_sing_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (ntrie_sing_conv_c.get())(x)
}

///|
/// NTRIE_SING_RULE, NTRIE_SING_CONV
fn step_54() -> Unit raise {
  let t171 = @meson.meson_tac(@list.List([nzero()]))
  let t170 = @simp.asm_rewrite_tac(@list.List([ntrie_eq()]))
  let t172 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([ntrie_sing(), ntrie(), ntrie_eq()])), @class.cond_cases_tac), t170), t171)
  let t173 = (@term_syntax.parse_term("({(n : Num)} == (s : (Num) -> Bool)) == ({NUMERAL(n)} == NTRIE(s)) && {_0} == NZERO && ({n} == s → {BIT0(n)} == NNODE(s, NEMPTY)) && ({n} == s) == ({BIT1(n)} == NNODE(NEMPTY, s))"), t172)
  let (ntrie_sing_rule_1, ntrie_sing_conv_1) = match (fn(x168 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    @bool.conjuncts_rule(standardize(x168))
  })((fn(x169 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x169.0, x169.1)
  })(t173)) {
    More(pth0, tail=More(pth1, tail=More(pth2, tail=More(pth3, tail=Empty)))) => {
      fn ntrie_sing_rule(x174 : @kernel.Term) -> @kernel.Thm raise {
        match x174 {
          @kernel.Term::Const("_0", _) => pth1
          @kernel.Term::Comb(@kernel.Term::Const("BIT0", _), ntm) => {
            let rth = ntrie_sing_rule(ntm)
            let stm = @kernel.rand(@kernel.concl(rth))
            let pth = @kernel.inst_rule(@list.List([(ntm, nvar()), (stm, svar())]), pth2)
            @bool.mp(pth, rth)
          }
          @kernel.Term::Comb(@kernel.Term::Const("BIT1", _), ntm_1) => {
            let rth_1 = ntrie_sing_rule(ntm_1)
            let stm_1 = @kernel.rand(@kernel.concl(rth_1))
            let pth_1 = @kernel.inst_rule(@list.List([(ntm_1, nvar()), (stm_1, svar())]), pth3)
            @kernel.eq_mp(pth_1, rth_1)
          }
          _ => raise Failure("Malformed numeral")
        }
      }
      let ntrie_sing_conv : (@kernel.Term) -> @kernel.Thm raise = fn(x175 : @kernel.Term) -> @kernel.Thm raise {
        match x175 {
          @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("INSERT", _), @kernel.Term::Comb(@kernel.Term::Const("NUMERAL", _), ntm_2)), @kernel.Term::Const("EMPTY", _)) => {
            let rth_2 = ntrie_sing_rule(ntm_2)
            let stm_2 = @kernel.rand(@kernel.concl(rth_2))
            let pth_2 = @kernel.inst_rule(@list.List([(ntm_2, nvar()), (stm_2, svar())]), pth0)
            @kernel.eq_mp(pth_2, rth_2)
          }
          _ => raise Failure("NTRIE_SING_CONV")
        }
      }
      (ntrie_sing_rule, ntrie_sing_conv)
    }
    _ => raise @lib.MatchFailure("tscript.ml:729")
  }
  ntrie_sing_rule_c.set(ntrie_sing_rule_1)
  ntrie_sing_conv_c.set(ntrie_sing_conv_1)
}

///|
let ntrie_insert_rule_c : @lib.Cell[((@kernel.Term, @kernel.Term)) -> @kernel.Thm raise] = @lib.Cell::new("NTRIE_INSERT_RULE")

///|
/// `NTRIE_INSERT_RULE`
pub fn ntrie_insert_rule(x : (@kernel.Term, @kernel.Term)) -> @kernel.Thm raise {
  (ntrie_insert_rule_c.get())(x)
}

///|
let ntrie_insert_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("NTRIE_INSERT_CONV")

///|
/// `NTRIE_INSERT_CONV`
pub fn ntrie_insert_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (ntrie_insert_conv_c.get())(x)
}

///|
/// NTRIE_INSERT_RULE, NTRIE_INSERT_CONV
fn step_55() -> Unit raise {
  let t180 = @meson.meson_tac(@list.List([nempty(), nzero()]))
  let t179 = @simp.asm_rewrite_tac(@list.List([ntrie_insert(), ntrie_eq()]))
  let t178 = @tactics.repeat_tac(@class.cond_cases_tac)
  let t181 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([ntrie_insert(), ntrie_eq()])), t178), t179), t180)
  let t182 = (@term_syntax.parse_term("(INSERT((n : Num), (s : (Num) -> Bool)) == (t : (Num) -> Bool)) == (INSERT(NUMERAL(n), NTRIE(s)) == NTRIE(t)) && ({n} == s) == (INSERT(n, NEMPTY) == s) && INSERT(_0, NEMPTY) == NZERO && INSERT(_0, NZERO) == NZERO && (INSERT(_0, s) == (s1 : (Num) -> Bool)) == (INSERT(_0, NNODE(s, t)) == NNODE(s1, t)) && (INSERT(n, NZERO) == t) == (INSERT(BIT0(n), NZERO) == NNODE(t, NEMPTY)) && ({n} == t) == (INSERT(BIT1(n), NZERO) == NNODE(NZERO, t)) && (INSERT(n, s) == s1) == (INSERT(BIT0(n), NNODE(s, t)) == NNODE(s1, t)) && (INSERT(n, t) == (t1 : (Num) -> Bool)) == (INSERT(BIT1(n), NNODE(s, t)) == NNODE(s, t1))"), t181)
  let (ntrie_insert_rule_1, ntrie_insert_conv_1) = match (fn(x176 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    @bool.conjuncts_rule(standardize(x176))
  })((fn(x177 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x177.0, x177.1)
  })(t182)) {
    More(pth0, tail=More(pth1, tail=More(pth2, tail=More(pth3, tail=More(pth4, tail=More(pth5, tail=More(pth6, tail=More(pth7, tail=More(pth8, tail=Empty))))))))) => {
      fn ntrie_insert_rule(x183 : (@kernel.Term, @kernel.Term)) -> @kernel.Thm raise {
        match x183 {
          (@kernel.Term::Const("_0", _), @kernel.Term::Const("NEMPTY", _)) => pth2
          (@kernel.Term::Const("_0", _), @kernel.Term::Const("NZERO", _)) => pth3
          (@kernel.Term::Const("_0", _), @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("NNODE", _), stm), ttm)) => {
            let rth = ntrie_insert_rule((zero_tm(), stm))
            let stm1 = @kernel.rand(@kernel.concl(rth))
            let pth = @kernel.inst_rule(@list.List([(stm, svar()), (ttm, tvar()), (stm1, svar1())]), pth4)
            @kernel.eq_mp(pth, rth)
          }
          (ntm, @kernel.Term::Const("NEMPTY", _)) => {
            let rth_1 = ntrie_sing_rule(ntm)
            let stm_1 = @kernel.rand(@kernel.concl(rth_1))
            let pth_1 = @kernel.inst_rule(@list.List([(ntm, nvar()), (stm_1, svar())]), pth1)
            @kernel.eq_mp(pth_1, rth_1)
          }
          (@kernel.Term::Comb(@kernel.Term::Const("BIT0", _), ntm_1), @kernel.Term::Const("NZERO", _)) => {
            let rth_2 = ntrie_insert_rule((ntm_1, nzero_tm()))
            let ttm_1 = @kernel.rand(@kernel.concl(rth_2))
            let pth_2 = @kernel.inst_rule(@list.List([(ntm_1, nvar()), (ttm_1, tvar())]), pth5)
            @kernel.eq_mp(pth_2, rth_2)
          }
          (@kernel.Term::Comb(@kernel.Term::Const("BIT1", _), ntm_2), @kernel.Term::Const("NZERO", _)) => {
            let rth_3 = ntrie_sing_rule(ntm_2)
            let ttm_2 = @kernel.rand(@kernel.concl(rth_3))
            let pth_3 = @kernel.inst_rule(@list.List([(ntm_2, nvar()), (ttm_2, tvar())]), pth6)
            @kernel.eq_mp(pth_3, rth_3)
          }
          (@kernel.Term::Comb(@kernel.Term::Const("BIT0", _), ntm_3), @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("NNODE", _), stm_2), ttm_3)) => {
            let rth_4 = ntrie_insert_rule((ntm_3, stm_2))
            let stm1_1 = @kernel.rand(@kernel.concl(rth_4))
            let pth_4 = @kernel.inst_rule(@list.List([(ntm_3, nvar()), (stm_2, svar()), (ttm_3, tvar()), (stm1_1, svar1())]), pth7)
            @kernel.eq_mp(pth_4, rth_4)
          }
          (@kernel.Term::Comb(@kernel.Term::Const("BIT1", _), ntm_4), @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("NNODE", _), stm_3), ttm_4)) => {
            let rth_5 = ntrie_insert_rule((ntm_4, ttm_4))
            let ttm1 = @kernel.rand(@kernel.concl(rth_5))
            let pth_5 = @kernel.inst_rule(@list.List([(ntm_4, nvar()), (stm_3, svar()), (ttm_4, tvar()), (ttm1, tvar1())]), pth8)
            @kernel.eq_mp(pth_5, rth_5)
          }
          _ => raise Failure("Malformed ntrie or numeral")
        }
      }
      let ntrie_insert_conv : (@kernel.Term) -> @kernel.Thm raise = fn(x184 : @kernel.Term) -> @kernel.Thm raise {
        match x184 {
          @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("INSERT", _), @kernel.Term::Comb(@kernel.Term::Const("NUMERAL", _), ntm_5)), @kernel.Term::Comb(@kernel.Term::Const("NTRIE", _), stm_4)) => {
            let rth_6 = ntrie_insert_rule((ntm_5, stm_4))
            let ttm_5 = @kernel.rand(@kernel.concl(rth_6))
            let pth_6 = @kernel.inst_rule(@list.List([(ntm_5, nvar()), (stm_4, svar()), (ttm_5, tvar())]), pth0)
            @kernel.eq_mp(pth_6, rth_6)
          }
          _ => raise Failure("NTRIE_INSERT_CONV")
        }
      }
      (ntrie_insert_rule, ntrie_insert_conv)
    }
    _ => raise @lib.MatchFailure("tscript.ml:766")
  }
  ntrie_insert_rule_c.set(ntrie_insert_rule_1)
  ntrie_insert_conv_c.set(ntrie_insert_conv_1)
}

///|
/// NTRIE_UNION_CONV
fn step_56() -> Unit raise {
  let t189 = @simp.rewrite_tac(@list.List([ntrie_union(), ntrie(), ntrie_eq()]))
  let t188 = @tactics.repeat_tac(@tactics.first_x_assum(@tactics.subst_var_tac))
  let t187 = @tactics.try_tac(@tactics.eq_tac)
  let t190 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t187), t188), t189)
  let t191 = (@term_syntax.parse_term("(UNION((s1 : (Num) -> Bool), (s2 : (Num) -> Bool)) == (s : (Num) -> Bool)) == (UNION(NTRIE(s1), NTRIE(s2)) == NTRIE(s)) && UNION(NEMPTY, NEMPTY) == NEMPTY && UNION(NEMPTY, NZERO) == NZERO && UNION(NZERO, NEMPTY) == NZERO && UNION(NZERO, NZERO) == NZERO && UNION(s, NEMPTY) == s && UNION(NEMPTY, (t : (Num) -> Bool)) == t && (UNION(s, NZERO) == s1) == (UNION(NNODE(s, t), NZERO) == NNODE(s1, t)) && (UNION(s, NZERO) == s1) == (UNION(NZERO, NNODE(s, t)) == NNODE(s1, t)) && (UNION(s1, s2) == s && UNION((t1 : (Num) -> Bool), (t2 : (Num) -> Bool)) == t) == (UNION(NNODE(s1, t1), NNODE(s2, t2)) == NNODE(s, t))"), t190)
  ntrie_union_conv_c.set(match (fn(x185 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    @bool.conjuncts_rule(standardize(x185))
  })((fn(x186 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x186.0, x186.1)
  })(t191)) {
    More(pth0, tail=More(pth1, tail=More(pth2, tail=More(pth3, tail=More(pth4, tail=More(pth5, tail=More(pth6, tail=More(pth7, tail=More(pth8, tail=More(pth9, tail=Empty)))))))))) => {
      let ntrie_union_nzero = (x192 : @kernel.Term) => ntrie_union_nzero_l(pth2, pth4, pth7, pth8, x192)
      let ntrie_nnode_union_nzero = (x193 : @kernel.Term, x194 : @kernel.Term) => ntrie_nnode_union_nzero_l(pth2, pth4, pth7, pth8, x193, x194)
      let ntrie_nzero_union_nnode = (x195 : @kernel.Term, x196 : @kernel.Term) => ntrie_nzero_union_nnode_l(pth2, pth4, pth7, pth8, x195, x196)
      fn ntrie_union_rule(x197 : (@kernel.Term, @kernel.Term)) -> @kernel.Thm raise {
        match x197 {
          (@kernel.Term::Const("NEMPTY", _), @kernel.Term::Const("NEMPTY", _)) => pth1
          (@kernel.Term::Const("NEMPTY", _), @kernel.Term::Const("NZERO", _)) => pth2
          (@kernel.Term::Const("NZERO", _), @kernel.Term::Const("NEMPTY", _)) => pth3
          (@kernel.Term::Const("NZERO", _), @kernel.Term::Const("NZERO", _)) => pth4
          (stm_3, @kernel.Term::Const("NEMPTY", _)) => @kernel.inst_rule(@list.List([(stm_3, svar())]), pth5)
          (@kernel.Term::Const("NEMPTY", _), ttm_3) => @kernel.inst_rule(@list.List([(ttm_3, tvar())]), pth6)
          (@kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("NNODE", _), stm_4), ttm_4), @kernel.Term::Const("NZERO", _)) => ntrie_nnode_union_nzero(stm_4, ttm_4)
          (@kernel.Term::Const("NZERO", _), @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("NNODE", _), stm_5), ttm_5)) => ntrie_nzero_union_nnode(stm_5, ttm_5)
          (@kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("NNODE", _), stm1_2), ttm1), @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("NNODE", _), stm2), ttm2)) => {
            let rth1 = ntrie_union_rule((stm1_2, stm2))
            let rth2 = ntrie_union_rule((ttm1, ttm2))
            let stm_6 = @kernel.rand(@kernel.concl(rth1))
            let ttm_6 = @kernel.rand(@kernel.concl(rth2))
            let pth_2 = @kernel.inst_rule(@list.List([(stm_6, svar()), (stm1_2, svar1()), (stm2, svar2()), (ttm_6, tvar()), (ttm1, tvar1()), (ttm2, tvar2())]), pth9)
            @kernel.eq_mp(pth_2, @bool.conj(rth1, rth2))
          }
          _ => raise Failure("Malformed ntrie")
        }
      }
      let ntrie_union_conv_1 : (@kernel.Term) -> @kernel.Thm raise = fn(x198 : @kernel.Term) -> @kernel.Thm raise {
        match x198 {
          @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("UNION", _), @kernel.Term::Comb(@kernel.Term::Const("NTRIE", _), stm1_3)), @kernel.Term::Comb(@kernel.Term::Const("NTRIE", _), stm2_1)) => {
            let rth_2 = ntrie_union_rule((stm1_3, stm2_1))
            let stm_7 = @kernel.rand(@kernel.concl(rth_2))
            @kernel.eq_mp(@kernel.inst_rule(@list.List([(stm_7, svar()), (stm1_3, svar1()), (stm2_1, svar2())]), pth0), rth_2)
          }
          _ => raise Failure("NTRIE_UNION_CONV")
        }
      }
      ntrie_union_conv_1
    }
    _ => raise @lib.MatchFailure("tscript.ml:833")
  })
}

///|
let ntrie_union_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("NTRIE_UNION_CONV")

///|
/// `NTRIE_UNION_CONV`
pub fn ntrie_union_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (ntrie_union_conv_c.get())(x)
}

///|
fn ntrie_union_nzero_l(pth2 : @kernel.Thm, pth4 : @kernel.Thm, pth7 : @kernel.Thm, pth8 : @kernel.Thm, x192 : @kernel.Term) -> @kernel.Thm raise {
  let ntrie_nnode_union_nzero = (x193 : @kernel.Term, x194 : @kernel.Term) => ntrie_nnode_union_nzero_l(pth2, pth4, pth7, pth8, x193, x194)
  match x192 {
    @kernel.Term::Const("NEMPTY", _) => pth2
    @kernel.Term::Const("NZERO", _) => pth4
    @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("NNODE", _), stm), ttm) => ntrie_nnode_union_nzero(stm, ttm)
    _ => raise Failure("Malformed ntrie")
  }
}

///|
fn ntrie_nnode_union_nzero_l(pth2 : @kernel.Thm, pth4 : @kernel.Thm, pth7 : @kernel.Thm, pth8 : @kernel.Thm, x193 : @kernel.Term, x194 : @kernel.Term) -> @kernel.Thm raise {
  let ntrie_union_nzero = (x192 : @kernel.Term) => ntrie_union_nzero_l(pth2, pth4, pth7, pth8, x192)
  let (stm_1, ttm_1) = (x193, x194)
  let rth = ntrie_union_nzero(stm_1)
  let stm1 = @kernel.rand(@kernel.concl(rth))
  let pth = @kernel.inst_rule(@list.List([(stm_1, svar()), (stm1, svar1()), (ttm_1, tvar())]), pth7)
  @kernel.eq_mp(pth, rth)
}

///|
fn ntrie_nzero_union_nnode_l(pth2 : @kernel.Thm, pth4 : @kernel.Thm, pth7 : @kernel.Thm, pth8 : @kernel.Thm, x195 : @kernel.Term, x196 : @kernel.Term) -> @kernel.Thm raise {
  let ntrie_union_nzero = (x192 : @kernel.Term) => ntrie_union_nzero_l(pth2, pth4, pth7, pth8, x192)
  let (stm_2, ttm_2) = (x195, x196)
  let rth_1 = ntrie_union_nzero(stm_2)
  let stm1_1 = @kernel.rand(@kernel.concl(rth_1))
  let pth_1 = @kernel.inst_rule(@list.List([(stm_2, svar()), (stm1_1, svar1()), (ttm_2, tvar())]), pth8)
  @kernel.eq_mp(pth_1, rth_1)
}

///|
/// MK_NNODE_RULE
fn step_57() -> Unit raise {
  let t201 = @simp.rewrite_tac(@list.List([ntrie_eq()]))
  let t202 = (@term_syntax.parse_term("NNODE(NEMPTY, NEMPTY) == NEMPTY && NNODE(NZERO, NEMPTY) == NZERO"), t201)
  let (pth0, pth1) = (fn(x199 : @kernel.Thm) -> (@kernel.Thm, @kernel.Thm) raise {
    @bool.conj_pair(standardize(x199))
  })((fn(x200 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x200.0, x200.1)
  })(t202))
  mk_nnode_rule_c.set(fn(x203 : (@kernel.Term, @kernel.Term)) -> @kernel.Thm raise {
    match x203 {
      (@kernel.Term::Const("NEMPTY", _), @kernel.Term::Const("NEMPTY", _)) => pth0
      (@kernel.Term::Const("NZERO", _), @kernel.Term::Const("NEMPTY", _)) => pth1
      _ => raise Failure("MK_NNODE_RULE")
    }
  })
}

///|
let mk_nnode_rule_c : @lib.Cell[((@kernel.Term, @kernel.Term)) -> @kernel.Thm raise] = @lib.Cell::new("MK_NNODE_RULE")

///|
/// `MK_NNODE_RULE`
pub fn mk_nnode_rule(x : (@kernel.Term, @kernel.Term)) -> @kernel.Thm raise {
  (mk_nnode_rule_c.get())(x)
}

///|
/// NTRIE_INTER_CONV
fn step_58() -> Unit raise {
  let t206 = @sets.set_tac(@list.List([]))
  let t207 = @tactics.then_tac(@simp.rewrite_tac(@list.List([ntrie_inter(), ntrie_eq(), ntrie(), nzero(), nempty()])), t206)
  let t208 = (@term_syntax.parse_term("(INTER((s1 : (Num) -> Bool), (s2 : (Num) -> Bool)) == (s : (Num) -> Bool)) == (INTER(NTRIE(s1), NTRIE(s2)) == NTRIE(s)) && INTER(NEMPTY, NEMPTY) == NEMPTY && INTER(NEMPTY, NZERO) == NEMPTY && INTER(NZERO, NEMPTY) == NEMPTY && INTER(s, NEMPTY) == NEMPTY && INTER(NEMPTY, (t : (Num) -> Bool)) == NEMPTY && INTER(NZERO, NZERO) == NZERO && (INTER(s, NZERO) == s1) == (INTER(NNODE(s, t), NZERO) == s1) && (INTER(s, NZERO) == s1) == (INTER(NZERO, NNODE(s, t)) == s1) && IN(_0, t) == (INTER(NZERO, t) == NZERO) && !IN(_0, t) == (INTER(NZERO, t) == NEMPTY) && (INTER(s1, s2) == s && INTER((t1 : (Num) -> Bool), (t2 : (Num) -> Bool)) == t) == (INTER(NNODE(s1, t1), NNODE(s2, t2)) == NNODE(s, t))"), t207)
  ntrie_inter_conv_c.set(match (fn(x204 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    @bool.conjuncts_rule(standardize(x204))
  })((fn(x205 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x205.0, x205.1)
  })(t208)) {
    More(pth0, tail=More(pth1, tail=More(pth2, tail=More(pth3, tail=More(pth4, tail=More(pth5, tail=More(pth6, tail=More(pth7, tail=More(pth8, tail=More(pth9, tail=More(npth9, tail=More(pth10, tail=Empty)))))))))))) => {
      let ntrie_inter_nzero = (x209 : @kernel.Term) => ntrie_inter_nzero_l(pth2, pth6, pth7, pth8, x209)
      let ntrie_nnode_inter_nzero = (x210 : @kernel.Term, x211 : @kernel.Term) => ntrie_nnode_inter_nzero_l(pth2, pth6, pth7, pth8, x210, x211)
      let ntrie_nzero_inter_nnode = (x212 : @kernel.Term, x213 : @kernel.Term) => ntrie_nzero_inter_nnode_l(pth2, pth6, pth7, pth8, x212, x213)
      fn ntrie_inter_rule(x214 : (@kernel.Term, @kernel.Term)) -> @kernel.Thm raise {
        match x214 {
          (@kernel.Term::Const("NEMPTY", _), @kernel.Term::Const("NEMPTY", _)) => pth1
          (@kernel.Term::Const("NEMPTY", _), @kernel.Term::Const("NZERO", _)) => pth2
          (@kernel.Term::Const("NZERO", _), @kernel.Term::Const("NEMPTY", _)) => pth3
          (@kernel.Term::Const("NZERO", _), @kernel.Term::Const("NZERO", _)) => pth6
          (stm_3, @kernel.Term::Const("NEMPTY", _)) => @kernel.inst_rule(@list.List([(stm_3, svar())]), pth4)
          (@kernel.Term::Const("NEMPTY", _), ttm_3) => @kernel.inst_rule(@list.List([(ttm_3, tvar())]), pth5)
          (@kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("NNODE", _), stm_4), ttm_4), @kernel.Term::Const("NZERO", _)) => ntrie_nnode_inter_nzero(stm_4, ttm_4)
          (@kernel.Term::Const("NZERO", _), @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("NNODE", _), stm_5), ttm_5)) => ntrie_nzero_inter_nnode(stm_5, ttm_5)
          (@kernel.Term::Const("NZERO", _), ttm_6) => {
            let (b, rth_2) = ntrie_zero_in_rule(ttm_6)
            let pth_2 = if b {
              pth9
            } else {
              npth9
            }
            @kernel.eq_mp(@kernel.inst_rule(@list.List([(ttm_6, tvar())]), pth_2), rth_2)
          }
          (@kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("NNODE", _), stm1_2), ttm1), @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("NNODE", _), stm2), ttm2)) => {
            let rth1 = ntrie_inter_rule((stm1_2, stm2))
            let rth2 = ntrie_inter_rule((ttm1, ttm2))
            let stm_6 = @kernel.rand(@kernel.concl(rth1))
            let ttm_7 = @kernel.rand(@kernel.concl(rth2))
            let pth_3 = @kernel.inst_rule(@list.List([(stm_6, svar()), (stm1_2, svar1()), (stm2, svar2()), (ttm_7, tvar()), (ttm1, tvar1()), (ttm2, tvar2())]), pth10)
            let th = @kernel.eq_mp(pth_3, @bool.conj(rth1, rth2))
            try {
              @kernel.trans(th, mk_nnode_rule((stm_6, ttm_7)))
            } catch {
              Failure(_) => th
              e => raise e
            }
          }
          _ => raise Failure("Malformed ntrie")
        }
      }
      let ntrie_inter_conv_1 : (@kernel.Term) -> @kernel.Thm raise = fn(x215 : @kernel.Term) -> @kernel.Thm raise {
        match x215 {
          @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("INTER", _), @kernel.Term::Comb(@kernel.Term::Const("NTRIE", _), stm1_3)), @kernel.Term::Comb(@kernel.Term::Const("NTRIE", _), stm2_1)) => {
            let rth_3 = ntrie_inter_rule((stm1_3, stm2_1))
            let stm_7 = @kernel.rand(@kernel.concl(rth_3))
            @kernel.eq_mp(@kernel.inst_rule(@list.List([(stm_7, svar()), (stm1_3, svar1()), (stm2_1, svar2())]), pth0), rth_3)
          }
          _ => raise Failure("NTRIE_INTER_CONV")
        }
      }
      ntrie_inter_conv_1
    }
    _ => raise @lib.MatchFailure("tscript.ml:914")
  })
}

///|
let ntrie_inter_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("NTRIE_INTER_CONV")

///|
/// `NTRIE_INTER_CONV`
pub fn ntrie_inter_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (ntrie_inter_conv_c.get())(x)
}

///|
fn ntrie_inter_nzero_l(pth2 : @kernel.Thm, pth6 : @kernel.Thm, pth7 : @kernel.Thm, pth8 : @kernel.Thm, x209 : @kernel.Term) -> @kernel.Thm raise {
  let ntrie_nnode_inter_nzero = (x210 : @kernel.Term, x211 : @kernel.Term) => ntrie_nnode_inter_nzero_l(pth2, pth6, pth7, pth8, x210, x211)
  match x209 {
    @kernel.Term::Const("NEMPTY", _) => pth2
    @kernel.Term::Const("NZERO", _) => pth6
    @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("NNODE", _), stm), ttm) => ntrie_nnode_inter_nzero(stm, ttm)
    _ => raise Failure("Malformed ntrie")
  }
}

///|
fn ntrie_nnode_inter_nzero_l(pth2 : @kernel.Thm, pth6 : @kernel.Thm, pth7 : @kernel.Thm, pth8 : @kernel.Thm, x210 : @kernel.Term, x211 : @kernel.Term) -> @kernel.Thm raise {
  let ntrie_inter_nzero = (x209 : @kernel.Term) => ntrie_inter_nzero_l(pth2, pth6, pth7, pth8, x209)
  let (stm_1, ttm_1) = (x210, x211)
  let rth = ntrie_inter_nzero(stm_1)
  let stm1 = @kernel.rand(@kernel.concl(rth))
  let pth = @kernel.inst_rule(@list.List([(stm_1, svar()), (stm1, svar1()), (ttm_1, tvar())]), pth7)
  @kernel.eq_mp(pth, rth)
}

///|
fn ntrie_nzero_inter_nnode_l(pth2 : @kernel.Thm, pth6 : @kernel.Thm, pth7 : @kernel.Thm, pth8 : @kernel.Thm, x212 : @kernel.Term, x213 : @kernel.Term) -> @kernel.Thm raise {
  let ntrie_inter_nzero = (x209 : @kernel.Term) => ntrie_inter_nzero_l(pth2, pth6, pth7, pth8, x209)
  let (stm_2, ttm_2) = (x212, x213)
  let rth_1 = ntrie_inter_nzero(stm_2)
  let stm1_1 = @kernel.rand(@kernel.concl(rth_1))
  let pth_1 = @kernel.inst_rule(@list.List([(stm_2, svar()), (stm1_1, svar1()), (ttm_2, tvar())]), pth8)
  @kernel.eq_mp(pth_1, rth_1)
}

///|
let ntrie_delete_zero_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("NTRIE_DELETE_ZERO")

///|
/// `NTRIE_DELETE_ZERO`
pub fn ntrie_delete_zero(x : @kernel.Term) -> @kernel.Thm raise {
  (ntrie_delete_zero_c.get())(x)
}

///|
let ntrie_nnode_delete_zero_c : @lib.Cell[((@kernel.Term, @kernel.Term)) -> @kernel.Thm raise] = @lib.Cell::new("NTRIE_NNODE_DELETE_ZERO")

///|
/// `NTRIE_NNODE_DELETE_ZERO`
pub fn ntrie_nnode_delete_zero(x : (@kernel.Term, @kernel.Term)) -> @kernel.Thm raise {
  (ntrie_nnode_delete_zero_c.get())(x)
}

///|
let ntrie_delete_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("NTRIE_DELETE_CONV")

///|
/// `NTRIE_DELETE_CONV`
pub fn ntrie_delete_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (ntrie_delete_conv_c.get())(x)
}

///|
/// NTRIE_DELETE_ZERO, NTRIE_NNODE_DELETE_ZERO, NTRIE_DELETE_CONV
fn step_59() -> Unit raise {
  let t218 = @meson.meson_tac(@list.List([ntrie_eq(), ntrie_delete()]))
  let t219 = @tactics.then_tac(@simp.rewrite_tac(@list.List([ntrie_delete(), @calc_num.arith_eq(), ntrie()])), t218)
  let t220 = (@term_syntax.parse_term("(DELETE((s : (Num) -> Bool), (n : Num)) == (t : (Num) -> Bool)) == (DELETE(NTRIE(s), NUMERAL(n)) == NTRIE(t)) && DELETE(NEMPTY, _0) == NEMPTY && DELETE(NEMPTY, n) == NEMPTY && DELETE(NZERO, _0) == NEMPTY && !(n == _0) == (DELETE(NZERO, BIT0(n)) == NZERO) && DELETE(NZERO, BIT1(n)) == NZERO && (DELETE(s, _0) == (s1 : (Num) -> Bool)) == (DELETE(NNODE(s, t), _0) == NNODE(s1, t)) && (DELETE(s, n) == s1) == (DELETE(NNODE(s, t), BIT0(n)) == NNODE(s1, t)) && (DELETE(t, n) == (t1 : (Num) -> Bool)) == (DELETE(NNODE(s, t), BIT1(n)) == NNODE(s, t1))"), t219)
  let (ntrie_delete_zero_1, ntrie_nnode_delete_zero_1, ntrie_delete_conv_1) = match (fn(x216 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    @bool.conjuncts_rule(standardize(x216))
  })((fn(x217 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x217.0, x217.1)
  })(t220)) {
    More(pth0, tail=More(pth1, tail=More(pth2, tail=More(pth3, tail=More(pth4, tail=More(pth5, tail=More(pth6, tail=More(pth7, tail=More(pth8, tail=Empty))))))))) => {
      let ntrie_delete_zero = (x221 : @kernel.Term) => ntrie_delete_zero_l(pth1, pth3, pth6, x221)
      let ntrie_nnode_delete_zero = (x222 : @kernel.Term, x223 : @kernel.Term) => ntrie_nnode_delete_zero_l(pth1, pth3, pth6, x222, x223)
      fn ntrie_delete_rule(x224 : (@kernel.Term, @kernel.Term)) -> @kernel.Thm raise {
        match x224 {
          (@kernel.Term::Const("NEMPTY", _), @kernel.Term::Const("_0", _)) => pth1
          (@kernel.Term::Const("NEMPTY", _), ntm) => @kernel.inst_rule(@list.List([(ntm, nvar())]), pth2)
          (@kernel.Term::Const("NZERO", _), @kernel.Term::Const("_0", _)) => pth3
          (@kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("NNODE", _), stm_2), ttm_2), @kernel.Term::Const("_0", _)) => ntrie_nnode_delete_zero(stm_2, ttm_2)
          (@kernel.Term::Const("NZERO", _), @kernel.Term::Comb(@kernel.Term::Const("BIT0", _), ntm_1)) => {
            let rth_1 = num_nz_rule(ntm_1)
            @kernel.eq_mp(@kernel.inst_rule(@list.List([(ntm_1, nvar())]), pth4), rth_1)
          }
          (@kernel.Term::Const("NZERO", _), @kernel.Term::Comb(@kernel.Term::Const("BIT1", _), ntm_2)) => @kernel.inst_rule(@list.List([(ntm_2, nvar())]), pth5)
          (@kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("NNODE", _), stm_3), ttm_3), @kernel.Term::Comb(@kernel.Term::Const("BIT0", _), ntm_3)) => {
            let rth_2 = ntrie_delete_rule((stm_3, ntm_3))
            let stm1_1 = @kernel.rand(@kernel.concl(rth_2))
            let pth_1 = @kernel.inst_rule(@list.List([(ntm_3, nvar()), (stm_3, svar()), (stm1_1, svar1()), (ttm_3, tvar())]), pth7)
            let th = @kernel.eq_mp(pth_1, rth_2)
            try {
              @kernel.trans(th, mk_nnode_rule((stm1_1, ttm_3)))
            } catch {
              Failure(_) => th
              e => raise e
            }
          }
          (@kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("NNODE", _), stm_4), ttm_4), @kernel.Term::Comb(@kernel.Term::Const("BIT1", _), ntm_4)) => {
            let rth_3 = ntrie_delete_rule((ttm_4, ntm_4))
            let ttm1 = @kernel.rand(@kernel.concl(rth_3))
            let pth_2 = @kernel.inst_rule(@list.List([(ntm_4, nvar()), (stm_4, svar()), (ttm_4, tvar()), (ttm1, tvar1())]), pth8)
            let th_1 = @kernel.eq_mp(pth_2, rth_3)
            try {
              @kernel.trans(th_1, mk_nnode_rule((stm_4, ttm1)))
            } catch {
              Failure(_) => th_1
              e => raise e
            }
          }
          _ => raise Failure("Malformed ntrie")
        }
      }
      let ntrie_delete_conv : (@kernel.Term) -> @kernel.Thm raise = fn(x225 : @kernel.Term) -> @kernel.Thm raise {
        match x225 {
          @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("DELETE", _), @kernel.Term::Comb(@kernel.Term::Const("NTRIE", _), stm_5)), @kernel.Term::Comb(@kernel.Term::Const("NUMERAL", _), ntm_5)) => {
            let rth_4 = ntrie_delete_rule((stm_5, ntm_5))
            let ttm_5 = @kernel.rand(@kernel.concl(rth_4))
            @kernel.eq_mp(@kernel.inst_rule(@list.List([(ntm_5, nvar()), (stm_5, svar()), (ttm_5, tvar())]), pth0), rth_4)
          }
          _ => raise Failure("NTRIE_DELETE_CONV")
        }
      }
      (ntrie_delete_zero, fn(x226 : (@kernel.Term, @kernel.Term)) -> @kernel.Thm raise {
        ntrie_nnode_delete_zero(x226.0, x226.1)
      }, ntrie_delete_conv)
    }
    _ => raise @lib.MatchFailure("tscript.ml:991")
  }
  ntrie_delete_zero_c.set(ntrie_delete_zero_1)
  ntrie_nnode_delete_zero_c.set(ntrie_nnode_delete_zero_1)
  ntrie_delete_conv_c.set(ntrie_delete_conv_1)
}

///|
fn ntrie_delete_zero_l(pth1 : @kernel.Thm, pth3 : @kernel.Thm, pth6 : @kernel.Thm, x221 : @kernel.Term) -> @kernel.Thm raise {
  let ntrie_nnode_delete_zero = (x222 : @kernel.Term, x223 : @kernel.Term) => ntrie_nnode_delete_zero_l(pth1, pth3, pth6, x222, x223)
  match x221 {
    @kernel.Term::Const("NEMPTY", _) => pth1
    @kernel.Term::Const("NZERO", _) => pth3
    @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("NNODE", _), stm), ttm) => ntrie_nnode_delete_zero(stm, ttm)
    _ => raise Failure("Malformed ntrie")
  }
}

///|
fn ntrie_nnode_delete_zero_l(pth1 : @kernel.Thm, pth3 : @kernel.Thm, pth6 : @kernel.Thm, x222 : @kernel.Term, x223 : @kernel.Term) -> @kernel.Thm raise {
  let ntrie_delete_zero = (x221 : @kernel.Term) => ntrie_delete_zero_l(pth1, pth3, pth6, x221)
  let (stm_1, ttm_1) = (x222, x223)
  let rth = ntrie_delete_zero(stm_1)
  let stm1 = @kernel.rand(@kernel.concl(rth))
  let pth = @kernel.inst_rule(@list.List([(stm_1, svar()), (stm1, svar1()), (ttm_1, tvar())]), pth6)
  @kernel.eq_mp(pth, rth)
}

///|
/// NTRIE_DISJOINT_CONV
fn step_60() -> Unit raise {
  let t230 = @sets.set_tac(@list.List([]))
  let t229 = @simp.rewrite_tac(@list.List([nzero()]))
  let t231 = @tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([ntrie_disjoint()])), t229), t230)
  let t232 = (@term_syntax.parse_term("DISJOINT(NEMPTY, NEMPTY) && DISJOINT(NEMPTY, NZERO) && DISJOINT(NZERO, NEMPTY) && !DISJOINT(NZERO, NZERO) && DISJOINT((s : (Num) -> Bool), NEMPTY) && DISJOINT(NEMPTY, (t : (Num) -> Bool)) && IN(_0, s) == !DISJOINT(s, NZERO) && !IN(_0, s) == DISJOINT(s, NZERO) && IN(_0, t) == !DISJOINT(NZERO, t) && !IN(_0, t) == DISJOINT(NZERO, t) && (DISJOINT((s1 : (Num) -> Bool), (s2 : (Num) -> Bool)) && DISJOINT((t1 : (Num) -> Bool), (t2 : (Num) -> Bool))) == DISJOINT(NNODE(s1, t1), NNODE(s2, t2)) && (!DISJOINT(s1, s2) → !DISJOINT(NNODE(s1, t1), NNODE(s2, t2))) && (!DISJOINT(t1, t2) → !DISJOINT(NNODE(s1, t1), NNODE(s2, t2)))"), t231)
  ntrie_disjoint_conv_c.set(match (fn(x227 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    @bool.conjuncts_rule(standardize(x227))
  })((fn(x228 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x228.0, x228.1)
  })(t232)) {
    More(pth0, tail=More(pth1, tail=More(pth2, tail=More(pth3, tail=More(pth4, tail=More(pth5, tail=More(pth6, tail=More(pth7, tail=More(pth8, tail=More(pth9, tail=More(pth10, tail=More(pth11, tail=More(pth12, tail=Empty))))))))))))) => {
      fn ntrie_disjoint_rule(x233 : (@kernel.Term, @kernel.Term)) -> ((Bool, @kernel.Thm)) raise {
        match x233 {
          (@kernel.Term::Const("NEMPTY", _), @kernel.Term::Const("NEMPTY", _)) => (true, pth0)
          (@kernel.Term::Const("NEMPTY", _), @kernel.Term::Const("NZERO", _)) => (true, pth1)
          (@kernel.Term::Const("NZERO", _), @kernel.Term::Const("NEMPTY", _)) => (true, pth2)
          (@kernel.Term::Const("NZERO", _), @kernel.Term::Const("NZERO", _)) => (false, pth3)
          (stm, @kernel.Term::Const("NEMPTY", _)) => (true, @kernel.inst_rule(@list.List([(stm, svar())]), pth4))
          (@kernel.Term::Const("NEMPTY", _), ttm) => (true, @kernel.inst_rule(@list.List([(ttm, tvar())]), pth5))
          (stm_1, @kernel.Term::Const("NZERO", _)) => {
            let (b, rth) = ntrie_zero_in_rule(stm_1)
            let pinst : (@kernel.Thm) -> @kernel.Thm raise = (x234 : @kernel.Thm) => @kernel.inst_rule(@list.List([(stm_1, svar())]), x234)
            let pth = pinst(if b {
              pth6
            } else {
              pth7
            })
            (!b, @kernel.eq_mp(pth, rth))
          }
          (@kernel.Term::Const("NZERO", _), ttm_1) => {
            let (b_1, rth_1) = ntrie_zero_in_rule(ttm_1)
            let pinst_1 : (@kernel.Thm) -> @kernel.Thm raise = (x235 : @kernel.Thm) => @kernel.inst_rule(@list.List([(ttm_1, tvar())]), x235)
            let pth_1 = pinst_1(if b_1 {
              pth8
            } else {
              pth9
            })
            (!b_1, @kernel.eq_mp(pth_1, rth_1))
          }
          (@kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("NNODE", _), stm1), ttm1), @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("NNODE", _), stm2), ttm2)) => {
            let (b1, rth1) = ntrie_disjoint_rule((stm1, stm2))
            let pinst_2 : (@kernel.Thm) -> @kernel.Thm raise = (x236 : @kernel.Thm) => @kernel.inst_rule(@list.List([(stm1, svar1()), (stm2, svar2()), (ttm1, tvar1()), (ttm2, tvar2())]), x236)
            if !b1 {
              (false, @bool.mp(pinst_2(pth11), rth1))
            } else {
              let (b2, rth2) = ntrie_disjoint_rule((ttm1, ttm2))
              if !b2 {
                (false, @bool.mp(pinst_2(pth12), rth2))
              } else {
                let t237 = @bool.conj(rth1, rth2)
                (true, @kernel.eq_mp(pinst_2(pth10), t237))
              }
            }
          }
          _ => raise Failure("Malformed ntrie")
        }
      }
      let t240 = @simp.rewrite_tac(@list.List([ntrie()]))
      let t241 = (@term_syntax.parse_term("DISJOINT((s : (Num) -> Bool), (t : (Num) -> Bool)) == (DISJOINT(NTRIE(s), NTRIE(t)) == true) && !DISJOINT(s, t) == (DISJOINT(NTRIE(s), NTRIE(t)) == false)"), t240)
      let (pth1_1, pth2_1) = (fn(x238 : @kernel.Thm) -> (@kernel.Thm, @kernel.Thm) raise {
        @bool.conj_pair(standardize(x238))
      })((fn(x239 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
        @tactics.prove(x239.0, x239.1)
      })(t241))
      fn(x242 : @kernel.Term) -> @kernel.Thm raise {
        match x242 {
          @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("DISJOINT", _), @kernel.Term::Comb(@kernel.Term::Const("NTRIE", _), stm_2)), @kernel.Term::Comb(@kernel.Term::Const("NTRIE", _), ttm_2)) => {
            let (b_2, rth_2) = ntrie_disjoint_rule((stm_2, ttm_2))
            let pth_2 = if b_2 {
              pth1_1
            } else {
              pth2_1
            }
            @kernel.eq_mp(@kernel.inst_rule(@list.List([(stm_2, svar()), (ttm_2, tvar())]), pth_2), rth_2)
          }
          _ => raise Failure("NTRIE_DISJOINT_CONV")
        }
      }
    }
    _ => raise @lib.MatchFailure("tscript.ml:1055")
  })
}

///|
let ntrie_disjoint_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("NTRIE_DISJOINT_CONV")

///|
/// `NTRIE_DISJOINT_CONV`
pub fn ntrie_disjoint_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (ntrie_disjoint_conv_c.get())(x)
}

///|
/// NTRIE_DIFF_CONV
fn step_61() -> Unit raise {
  let t246 = @sets.set_tac(@list.List([]))
  let t245 = @simp.rewrite_tac(@list.List([nzero(), nempty()]))
  let t247 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([ntrie_diff(), ntrie_eq()])), t245), t246)
  let t248 = (@term_syntax.parse_term("DIFF(NEMPTY, NEMPTY) == NEMPTY && DIFF(NEMPTY, NZERO) == NEMPTY && DIFF(NZERO, NEMPTY) == NZERO && DIFF(NZERO, NZERO) == NEMPTY && DIFF(NEMPTY, (t : (Num) -> Bool)) == NEMPTY && DIFF((s : (Num) -> Bool), NEMPTY) == s && DIFF(s, NZERO) == DELETE(s, _0) && IN(_0, t) == (DIFF(NZERO, t) == NEMPTY) && !IN(_0, t) == (DIFF(NZERO, t) == NZERO) && (DIFF((s1 : (Num) -> Bool), (s2 : (Num) -> Bool)) == s && DIFF((t1 : (Num) -> Bool), (t2 : (Num) -> Bool)) == t) == (DIFF(NNODE(s1, t1), NNODE(s2, t2)) == NNODE(s, t))"), t247)
  ntrie_diff_conv_c.set(match (fn(x243 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    @bool.conjuncts_rule(standardize(x243))
  })((fn(x244 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x244.0, x244.1)
  })(t248)) {
    More(pth0, tail=More(pth1, tail=More(pth2, tail=More(pth3, tail=More(pth4, tail=More(pth5, tail=More(pth6, tail=More(pth7, tail=More(pth8, tail=More(pth9, tail=Empty)))))))))) => {
      fn ntrie_diff_rule(x249 : (@kernel.Term, @kernel.Term)) -> @kernel.Thm raise {
        match x249 {
          (@kernel.Term::Const("NEMPTY", _), @kernel.Term::Const("NEMPTY", _)) => pth0
          (@kernel.Term::Const("NEMPTY", _), @kernel.Term::Const("NZERO", _)) => pth1
          (@kernel.Term::Const("NZERO", _), @kernel.Term::Const("NEMPTY", _)) => pth2
          (@kernel.Term::Const("NZERO", _), @kernel.Term::Const("NZERO", _)) => pth3
          (stm, @kernel.Term::Const("NEMPTY", _)) => @kernel.inst_rule(@list.List([(stm, svar())]), pth5)
          (@kernel.Term::Const("NEMPTY", _), ttm) => @kernel.inst_rule(@list.List([(ttm, tvar())]), pth4)
          (stm_1, @kernel.Term::Const("NZERO", _)) => {
            let rth = ntrie_delete_zero(stm_1)
            let pth = @kernel.inst_rule(@list.List([(stm_1, svar())]), pth6)
            @kernel.trans(pth, rth)
          }
          (@kernel.Term::Const("NZERO", _), ttm_1) => {
            let (b, rth_1) = ntrie_zero_in_rule(ttm_1)
            let pinst : (@kernel.Thm) -> @kernel.Thm raise = (x250 : @kernel.Thm) => @kernel.inst_rule(@list.List([(ttm_1, tvar())]), x250)
            let pth_1 = pinst(if b {
              pth7
            } else {
              pth8
            })
            @kernel.eq_mp(pth_1, rth_1)
          }
          (@kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("NNODE", _), stm1), ttm1), @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("NNODE", _), stm2), ttm2)) => {
            let rth1 = ntrie_diff_rule((stm1, stm2))
            let rth2 = ntrie_diff_rule((ttm1, ttm2))
            let stm_2 = @kernel.rand(@kernel.concl(rth1))
            let ttm_2 = @kernel.rand(@kernel.concl(rth2))
            let pth_2 = @kernel.inst_rule(@list.List([(stm_2, svar()), (stm1, svar1()), (stm2, svar2()), (ttm_2, tvar()), (ttm1, tvar1()), (ttm2, tvar2())]), pth9)
            let th = @kernel.eq_mp(pth_2, @bool.conj(rth1, rth2))
            try {
              @kernel.trans(th, mk_nnode_rule((stm_2, ttm_2)))
            } catch {
              Failure(_) => th
              e => raise e
            }
          }
          _ => raise Failure("Malformed ntrie")
        }
      }
      let t252 = @simp.rewrite_tac(@list.List([ntrie()]))
      let t253 = (@term_syntax.parse_term("(DIFF((s : (Num) -> Bool), (t : (Num) -> Bool)) == (s1 : (Num) -> Bool)) == (DIFF(NTRIE(s), NTRIE(t)) == NTRIE(s1))"), t252)
      let pth_3 = standardize((fn(x251 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
        @tactics.prove(x251.0, x251.1)
      })(t253))
      fn(x254 : @kernel.Term) -> @kernel.Thm raise {
        match x254 {
          @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("DIFF", _), @kernel.Term::Comb(@kernel.Term::Const("NTRIE", _), stm_3)), @kernel.Term::Comb(@kernel.Term::Const("NTRIE", _), ttm_3)) => {
            let rth_2 = ntrie_diff_rule((stm_3, ttm_3))
            let rtm = @kernel.rand(@kernel.concl(rth_2))
            @kernel.eq_mp(@kernel.inst_rule(@list.List([(stm_3, svar()), (ttm_3, tvar()), (rtm, svar1())]), pth_3), rth_2)
          }
          _ => raise Failure("NTRIE_DIFF_CONV")
        }
      }
    }
    _ => raise @lib.MatchFailure("tscript.ml:1116")
  })
}

///|
let ntrie_diff_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("NTRIE_DIFF_CONV")

///|
/// `NTRIE_DIFF_CONV`
pub fn ntrie_diff_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (ntrie_diff_conv_c.get())(x)
}

///|
/// NTRIE_ENCODE_CONV
fn step_62() -> Unit raise {
  let t257 = @simp.rewrite_tac(@list.List([ntrie(), nempty(), @nums.numeral()]))
  let t258 = (@term_syntax.parse_term("{} == NEMPTY && (s : (Num) -> Bool) == NTRIE(s) && INSERT(NUMERAL((n : Num))) == INSERT(n)"), t257)
  ntrie_encode_conv_c.set(match (fn(x255 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    @bool.conjuncts_rule(standardize(x255))
  })((fn(x256 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x256.0, x256.1)
  })(t258)) {
    More(pth0, tail=More(pth1, tail=More(pth2, tail=Empty))) => {
      fn ntrie_enc_conv(x259 : @kernel.Term) -> @kernel.Thm raise {
        match x259 {
          @kernel.Term::Const("EMPTY", ty) if (ty == ntrie_ty()) => pth0
          @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("INSERT", _), @kernel.Term::Comb(@kernel.Term::Const("NUMERAL", _), ntm)), stm) => {
            let rth1 = ntrie_enc_conv(stm)
            let ttm = @kernel.rand(@kernel.concl(rth1))
            let rth2 = @kernel.mk_comb_rule(@kernel.inst_rule(@list.List([(ntm, nvar())]), pth2), rth1)
            @kernel.trans(rth2, ntrie_insert_rule((ntm, ttm)))
          }
          _ => raise Failure("NTRIE_ENC_CONV")
        }
      }
      fn(x260 : @kernel.Term) -> @kernel.Thm raise {
        let tm = x260
        let rth = ntrie_enc_conv(tm)
        let stm_1 = @kernel.rand(@kernel.concl(rth))
        @kernel.trans(rth, @kernel.inst_rule(@list.List([(stm_1, svar())]), pth1))
      }
    }
    _ => raise @lib.MatchFailure("tscript.ml:1176")
  })
}

///|
let ntrie_encode_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("NTRIE_ENCODE_CONV")

///|
/// `NTRIE_ENCODE_CONV`
pub fn ntrie_encode_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (ntrie_encode_conv_c.get())(x)
}

///|
/// `NTRIE_DECODE_CONV`
pub fn ntrie_decode_conv(x261 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x261
  let l = dest_small_ntrie(tm)
  let tm_p = mk_numset(@lib.map(@nums.mk_small_numeral, @lib.sort(fn(x264 : Int64, x265 : Int64) -> Bool raise {
    let s266 = (fn(x262 : Int64) -> ((Int64) -> Bool raise) raise {
      fn(x263 : Int64) -> Bool raise {
        (x262 < x263)
      }
    })(x264)
    s266(x265)
  }, l)))
  @equal.sym(ntrie_encode_conv(tm_p))
}

///|
/// NTRIE_IN_CONV
fn step_63() -> Unit raise {
  ntrie_in_conv_v1_c.set(ntrie_in_conv)
}

///|
let ntrie_in_conv_v1_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("NTRIE_IN_CONV")

///|
/// `NTRIE_IN_CONV`
pub fn ntrie_in_conv_v1(x : @kernel.Term) -> @kernel.Thm raise {
  (ntrie_in_conv_v1_c.get())(x)
}

///|
/// NTRIE_SUBSET_CONV
fn step_64() -> Unit raise {
  ntrie_subset_conv_v1_c.set(ntrie_subset_conv)
}

///|
let ntrie_subset_conv_v1_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("NTRIE_SUBSET_CONV")

///|
/// `NTRIE_SUBSET_CONV`
pub fn ntrie_subset_conv_v1(x : @kernel.Term) -> @kernel.Thm raise {
  (ntrie_subset_conv_v1_c.get())(x)
}

///|
/// NTRIE_EQ_CONV
fn step_65() -> Unit raise {
  ntrie_eq_conv_v1_c.set(ntrie_eq_conv)
}

///|
let ntrie_eq_conv_v1_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("NTRIE_EQ_CONV")

///|
/// `NTRIE_EQ_CONV`
pub fn ntrie_eq_conv_v1(x : @kernel.Term) -> @kernel.Thm raise {
  (ntrie_eq_conv_v1_c.get())(x)
}

///|
/// NTRIE_SING_CONV
fn step_66() -> Unit raise {
  ntrie_sing_conv_v1_c.set(ntrie_sing_conv)
}

///|
let ntrie_sing_conv_v1_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("NTRIE_SING_CONV")

///|
/// `NTRIE_SING_CONV`
pub fn ntrie_sing_conv_v1(x : @kernel.Term) -> @kernel.Thm raise {
  (ntrie_sing_conv_v1_c.get())(x)
}

///|
/// NTRIE_INSERT_CONV
fn step_67() -> Unit raise {
  ntrie_insert_conv_v1_c.set(ntrie_insert_conv)
}

///|
let ntrie_insert_conv_v1_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("NTRIE_INSERT_CONV")

///|
/// `NTRIE_INSERT_CONV`
pub fn ntrie_insert_conv_v1(x : @kernel.Term) -> @kernel.Thm raise {
  (ntrie_insert_conv_v1_c.get())(x)
}

///|
/// NTRIE_UNION_CONV
fn step_68() -> Unit raise {
  ntrie_union_conv_v1_c.set(ntrie_union_conv)
}

///|
let ntrie_union_conv_v1_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("NTRIE_UNION_CONV")

///|
/// `NTRIE_UNION_CONV`
pub fn ntrie_union_conv_v1(x : @kernel.Term) -> @kernel.Thm raise {
  (ntrie_union_conv_v1_c.get())(x)
}

///|
/// NTRIE_INTER_CONV
fn step_69() -> Unit raise {
  ntrie_inter_conv_v1_c.set(ntrie_inter_conv)
}

///|
let ntrie_inter_conv_v1_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("NTRIE_INTER_CONV")

///|
/// `NTRIE_INTER_CONV`
pub fn ntrie_inter_conv_v1(x : @kernel.Term) -> @kernel.Thm raise {
  (ntrie_inter_conv_v1_c.get())(x)
}

///|
/// NTRIE_DELETE_CONV
fn step_70() -> Unit raise {
  ntrie_delete_conv_v1_c.set(ntrie_delete_conv)
}

///|
let ntrie_delete_conv_v1_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("NTRIE_DELETE_CONV")

///|
/// `NTRIE_DELETE_CONV`
pub fn ntrie_delete_conv_v1(x : @kernel.Term) -> @kernel.Thm raise {
  (ntrie_delete_conv_v1_c.get())(x)
}

///|
/// NTRIE_DISJOINT_CONV
fn step_71() -> Unit raise {
  ntrie_disjoint_conv_v1_c.set(ntrie_disjoint_conv)
}

///|
let ntrie_disjoint_conv_v1_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("NTRIE_DISJOINT_CONV")

///|
/// `NTRIE_DISJOINT_CONV`
pub fn ntrie_disjoint_conv_v1(x : @kernel.Term) -> @kernel.Thm raise {
  (ntrie_disjoint_conv_v1_c.get())(x)
}

///|
/// NTRIE_DIFF_CONV
fn step_72() -> Unit raise {
  ntrie_diff_conv_v1_c.set(ntrie_diff_conv)
}

///|
let ntrie_diff_conv_v1_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("NTRIE_DIFF_CONV")

///|
/// `NTRIE_DIFF_CONV`
pub fn ntrie_diff_conv_v1(x : @kernel.Term) -> @kernel.Thm raise {
  (ntrie_diff_conv_v1_c.get())(x)
}

///|
/// NTRIE_ENCODE_CONV
fn step_73() -> Unit raise {
  ntrie_encode_conv_v1_c.set(ntrie_encode_conv)
}

///|
let ntrie_encode_conv_v1_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("NTRIE_ENCODE_CONV")

///|
/// `NTRIE_ENCODE_CONV`
pub fn ntrie_encode_conv_v1(x : @kernel.Term) -> @kernel.Thm raise {
  (ntrie_encode_conv_v1_c.get())(x)
}

///|
/// NTRIE_DECODE_CONV
fn step_74() -> Unit raise {
  ntrie_decode_conv_v1_c.set(ntrie_decode_conv)
}

///|
let ntrie_decode_conv_v1_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("NTRIE_DECODE_CONV")

///|
/// `NTRIE_DECODE_CONV`
pub fn ntrie_decode_conv_v1(x : @kernel.Term) -> @kernel.Thm raise {
  (ntrie_decode_conv_v1_c.get())(x)
}

///|
/// NTRIE_REL_CONV
fn step_75() -> Unit raise {
  let t277 = @simp.basic_net()
  let t274 = (@term_syntax.parse_term("IN(NUMERAL((n : Num)), NTRIE((s : (Num) -> Bool)))"), ntrie_in_conv_v1)
  let t275 = (@term_syntax.parse_term("DISJOINT(NTRIE((s : (Num) -> Bool)), NTRIE((t : (Num) -> Bool)))"), ntrie_disjoint_conv_v1)
  let t276 = (@term_syntax.parse_term("SUBSET(NTRIE((s : (Num) -> Bool)), NTRIE((t : (Num) -> Bool)))"), ntrie_subset_conv_v1)
  let gconv_net = @lib.itlist(fn(x271 : (@kernel.Term, (@kernel.Term) -> @kernel.Thm raise), x272 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
    let s273 = ((x270 : (@kernel.Term, (@kernel.Term) -> @kernel.Thm raise)) => @lib.uncurry(fn(x267 : @kernel.Term, x268 : (@kernel.Term) -> @kernel.Thm raise) -> ((@nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise) raise {
      fn(x269 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
        @simp.net_of_conv(x267, x268, x269)
      }
    }, x270))(x271)
    s273(x272)
  }, @list.List([(@term_syntax.parse_term("NTRIE((s : (Num) -> Bool)) == NTRIE((t : (Num) -> Bool))"), ntrie_eq_conv_v1), t276, t275, t274]), t277)
  ntrie_rel_conv_c.set(@simp.rewrites_conv(gconv_net))
}

///|
let ntrie_rel_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("NTRIE_REL_CONV")

///|
/// `NTRIE_REL_CONV`
pub fn ntrie_rel_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (ntrie_rel_conv_c.get())(x)
}

///|
/// NTRIE_RED_CONV
fn step_76() -> Unit raise {
  let t293 = @simp.basic_net()
  let t285 = (@term_syntax.parse_term("DIFF(NTRIE((s : (Num) -> Bool)), NTRIE((t : (Num) -> Bool)))"), ntrie_diff_conv_v1)
  let t286 = (@term_syntax.parse_term("DELETE(NTRIE((s : (Num) -> Bool)), NUMERAL((n : Num)))"), ntrie_delete_conv_v1)
  let t287 = (@term_syntax.parse_term("INTER(NTRIE((s : (Num) -> Bool)), NTRIE((t : (Num) -> Bool)))"), ntrie_inter_conv_v1)
  let t288 = (@term_syntax.parse_term("UNION(NTRIE((s : (Num) -> Bool)), NTRIE((t : (Num) -> Bool)))"), ntrie_union_conv_v1)
  let t289 = (@term_syntax.parse_term("INSERT(NUMERAL((n : Num)), NTRIE((s : (Num) -> Bool)))"), ntrie_insert_conv_v1)
  let t290 = (@term_syntax.parse_term("IN(NUMERAL((n : Num)), NTRIE((s : (Num) -> Bool)))"), ntrie_in_conv_v1)
  let t291 = (@term_syntax.parse_term("DISJOINT(NTRIE((s : (Num) -> Bool)), NTRIE((t : (Num) -> Bool)))"), ntrie_disjoint_conv_v1)
  let t292 = (@term_syntax.parse_term("SUBSET(NTRIE((s : (Num) -> Bool)), NTRIE((t : (Num) -> Bool)))"), ntrie_subset_conv_v1)
  let gconv_net = @lib.itlist(fn(x282 : (@kernel.Term, (@kernel.Term) -> @kernel.Thm raise), x283 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
    let s284 = ((x281 : (@kernel.Term, (@kernel.Term) -> @kernel.Thm raise)) => @lib.uncurry(fn(x278 : @kernel.Term, x279 : (@kernel.Term) -> @kernel.Thm raise) -> ((@nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise) raise {
      fn(x280 : @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]]) -> @nets.Net[@simp.GconvOf[(@kernel.Term) -> @kernel.Thm raise]] raise {
        @simp.net_of_conv(x278, x279, x280)
      }
    }, x281))(x282)
    s284(x283)
  }, @list.List([(@term_syntax.parse_term("NTRIE((s : (Num) -> Bool)) == NTRIE((t : (Num) -> Bool))"), ntrie_eq_conv_v1), t292, t291, t290, t289, t288, t287, t286, t285]), t293)
  ntrie_red_conv_c.set(@simp.rewrites_conv(gconv_net))
}

///|
let ntrie_red_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("NTRIE_RED_CONV")

///|
/// `NTRIE_RED_CONV`
pub fn ntrie_red_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (ntrie_red_conv_c.get())(x)
}

///|
/// NTRIE_REDUCE_CONV
fn step_77() -> Unit raise {
  ntrie_reduce_conv_c.set(@equal.depth_conv(ntrie_red_conv))
}

///|
let ntrie_reduce_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("NTRIE_REDUCE_CONV")

///|
/// `NTRIE_REDUCE_CONV`
pub fn ntrie_reduce_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (ntrie_reduce_conv_c.get())(x)
}

///|
/// NTRIE_REDUCE_TAC
fn step_78() -> Unit raise {
  ntrie_reduce_tac_c.set(@tactics.conv_tac(ntrie_reduce_conv))
}

///|
let ntrie_reduce_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("NTRIE_REDUCE_TAC")

///|
/// `NTRIE_REDUCE_TAC`
pub fn ntrie_reduce_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (ntrie_reduce_tac_c.get())(x)
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
}
