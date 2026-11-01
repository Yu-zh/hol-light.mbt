// Translated from upstream lists.ml; edit this file directly.

///|
/// LIST_INDUCT_TAC
fn step_1() -> Unit raise {
  let t1 = @tactics.match_accept_tac(@ind_types.list_induct())
  let list_induct = @tactics.prove(
    @term_syntax.parse_term("∀ P : (List[A]) -> Bool, P(NIL) && (∀ h : A, ∀ t : List[A], P(t) → P(CONS(h, t))) → (∀ l : List[A], P(l))"),
    t1,
  )
  let t2 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
      @tactics.disch_tac,
    ),
  ])
  list_induct_tac_c.set(
    @tactics.thenl(
      @tactics.then_tac(@tactics.match_mp_tac(list_induct), @tactics.conj_tac),
      t2,
    ),
  )
}

///|
let list_induct_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new(
  "LIST_INDUCT_TAC",
)

///|
/// `LIST_INDUCT_TAC`
pub fn list_induct_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  list_induct_tac_c.get()(x)
}

///|
/// HD
fn step_2() -> Unit raise {
  let t3 = @term_syntax.parse_term("(HD : (List[A]) -> A)(CONS((h : A), (t : List[A]))) == h")
  hd_c.set(@recursion.new_recursive_definition(@ind_types.list_recursion())(t3))
}

///|
let hd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HD")

///|
/// `HD`
pub fn hd() -> @kernel.Thm {
  hd_c.get()
}

///|
/// TL
fn step_3() -> Unit raise {
  let t4 = @term_syntax.parse_term("(TL : (List[A]) -> List[A])(CONS((h : A), (t : List[A]))) == t")
  tl_c.set(@recursion.new_recursive_definition(@ind_types.list_recursion())(t4))
}

///|
let tl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TL")

///|
/// `TL`
pub fn tl() -> @kernel.Thm {
  tl_c.get()
}

///|
/// APPEND
fn step_4() -> Unit raise {
  let t5 = @term_syntax.parse_term("(∀ l : List[A], (APPEND : (List[A], List[A]) -> List[A])(NIL, l) == l) && (∀ h : A, ∀ t : List[A], ∀ l : List[A], APPEND(CONS(h, t), l) == CONS(h, APPEND(t, l)))")
  append_c.set(
    @recursion.new_recursive_definition(@ind_types.list_recursion())(t5),
  )
}

///|
let append_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("APPEND")

///|
/// `APPEND`
pub fn append() -> @kernel.Thm {
  append_c.get()
}

///|
/// REVERSE
fn step_5() -> Unit raise {
  let t6 = @term_syntax.parse_term("(REVERSE : (List[A]) -> List[A])(NIL) == NIL && REVERSE(CONS((x : A), (l : List[A]))) == APPEND(REVERSE(l), [x])")
  reverse_c.set(
    @recursion.new_recursive_definition(@ind_types.list_recursion())(t6),
  )
}

///|
let reverse_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REVERSE")

///|
/// `REVERSE`
pub fn reverse() -> @kernel.Thm {
  reverse_c.get()
}

///|
/// LENGTH
fn step_6() -> Unit raise {
  let t7 = @term_syntax.parse_term("(LENGTH : (List[A]) -> Num)(NIL) == 0 && (∀ h : A, ∀ t : List[A], LENGTH(CONS(h, t)) == SUC(LENGTH(t)))")
  length_c.set(
    @recursion.new_recursive_definition(@ind_types.list_recursion())(t7),
  )
}

///|
let length_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LENGTH")

///|
/// `LENGTH`
pub fn length() -> @kernel.Thm {
  length_c.get()
}

///|
/// MAP
fn step_7() -> Unit raise {
  let t8 = @term_syntax.parse_term("(∀ f : (A) -> B, (MAP : ((A) -> B, List[A]) -> List[B])(f, NIL) == NIL) && (∀ f : (A) -> B, ∀ h : A, ∀ t : List[A], MAP(f, CONS(h, t)) == CONS(f(h), MAP(f, t)))")
  map_c.set(
    @recursion.new_recursive_definition(@ind_types.list_recursion())(t8),
  )
}

///|
let map_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MAP")

///|
/// `MAP`
pub fn map() -> @kernel.Thm {
  map_c.get()
}

///|
/// LAST
fn step_8() -> Unit raise {
  let t9 = @term_syntax.parse_term("(LAST : (List[A]) -> A)(CONS((h : A), (t : List[A]))) == (if t == NIL { h } else { LAST(t) })")
  last_c.set(
    @recursion.new_recursive_definition(@ind_types.list_recursion())(t9),
  )
}

///|
let last_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LAST")

///|
/// `LAST`
pub fn last() -> @kernel.Thm {
  last_c.get()
}

///|
/// BUTLAST
fn step_9() -> Unit raise {
  let t10 = @term_syntax.parse_term("(BUTLAST : (List[A]) -> List[A])(NIL) == NIL && BUTLAST(CONS((h : A), (t : List[A]))) == (if t == NIL { NIL } else { CONS(h, BUTLAST(t)) })")
  butlast_c.set(
    @recursion.new_recursive_definition(@ind_types.list_recursion())(t10),
  )
}

///|
let butlast_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BUTLAST")

///|
/// `BUTLAST`
pub fn butlast() -> @kernel.Thm {
  butlast_c.get()
}

///|
/// REPLICATE
fn step_10() -> Unit raise {
  let t11 = @term_syntax.parse_term("(REPLICATE : (Num, A) -> List[A])(0, (x : A)) == NIL && REPLICATE(SUC((n : Num)), x) == CONS(x, REPLICATE(n, x))")
  replicate_c.set(
    @recursion.new_recursive_definition(@nums.num_recursion())(t11),
  )
}

///|
let replicate_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REPLICATE")

///|
/// `REPLICATE`
pub fn replicate() -> @kernel.Thm {
  replicate_c.get()
}

///|
/// NULL
fn step_11() -> Unit raise {
  let t12 = @term_syntax.parse_term("(NULL : (List[A]) -> Bool)(NIL) == true && NULL(CONS((h : A), (t : List[A]))) == false")
  null_c.set(
    @recursion.new_recursive_definition(@ind_types.list_recursion())(t12),
  )
}

///|
let null_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NULL")

///|
/// `NULL`
pub fn null() -> @kernel.Thm {
  null_c.get()
}

///|
/// ALL
fn step_12() -> Unit raise {
  let t13 = @term_syntax.parse_term("(ALL : ((A) -> Bool, List[A]) -> Bool)((P : (A) -> Bool), NIL) == true && ALL(P, CONS((h : A), (t : List[A]))) == (P(h) && ALL(P, t))")
  all_c.set(
    @recursion.new_recursive_definition(@ind_types.list_recursion())(t13),
  )
}

///|
let all_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALL")

///|
/// `ALL`
pub fn all() -> @kernel.Thm {
  all_c.get()
}

///|
/// EX
fn step_13() -> Unit raise {
  let t14 = @term_syntax.parse_term("(EX : ((A) -> Bool, List[A]) -> Bool)((P : (A) -> Bool), NIL) == false && EX(P, CONS((h : A), (t : List[A]))) == (P(h) || EX(P, t))")
  ex_c.set(
    @recursion.new_recursive_definition(@ind_types.list_recursion())(t14),
  )
}

///|
let ex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EX")

///|
/// `EX`
pub fn ex() -> @kernel.Thm {
  ex_c.get()
}

///|
/// ITLIST
fn step_14() -> Unit raise {
  let t15 = @term_syntax.parse_term("(ITLIST : ((A, B) -> B, List[A], B) -> B)((f : (A, B) -> B), NIL, (b : B)) == b && ITLIST(f, CONS((h : A), (t : List[A])), b) == f(h, ITLIST(f, t, b))")
  itlist_c.set(
    @recursion.new_recursive_definition(@ind_types.list_recursion())(t15),
  )
}

///|
let itlist_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITLIST")

///|
/// `ITLIST`
pub fn itlist() -> @kernel.Thm {
  itlist_c.get()
}

///|
/// MEM
fn step_15() -> Unit raise {
  let t16 = @term_syntax.parse_term("(MEM : (A, List[A]) -> Bool)((x : A), NIL) == false && MEM(x, CONS((h : A), (t : List[A]))) == (x == h || MEM(x, t))")
  mem_c.set(
    @recursion.new_recursive_definition(@ind_types.list_recursion())(t16),
  )
}

///|
let mem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MEM")

///|
/// `MEM`
pub fn mem() -> @kernel.Thm {
  mem_c.get()
}

///|
/// ALL2_DEF
fn step_16() -> Unit raise {
  let t17 = @term_syntax.parse_term("(ALL2 : ((A, B) -> Bool, List[A], List[B]) -> Bool)((P : (A, B) -> Bool), NIL, (l2 : List[B])) == (l2 == NIL) && ALL2(P, CONS((h1 : A), (t1 : List[A])), l2) == (if l2 == NIL { false } else { P(h1, HD(l2)) && ALL2(P, t1, TL(l2)) })")
  all2_def_c.set(
    @recursion.new_recursive_definition(@ind_types.list_recursion())(t17),
  )
}

///|
let all2_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALL2_DEF")

///|
/// `ALL2_DEF`
pub fn all2_def() -> @kernel.Thm {
  all2_def_c.get()
}

///|
/// ALL2
fn step_17() -> Unit raise {
  let t18 = @simp.rewrite_tac(
    @list.List([@ind_types.distinctness("list"), all2_def(), hd(), tl()]),
  )
  all2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("ALL2((P : (A, B) -> Bool), NIL, NIL) == true && ALL2(P, CONS((h1 : A), (t1 : List[A])), NIL) == false && ALL2(P, NIL, CONS((h2 : B), (t2 : List[B]))) == false && ALL2(P, CONS(h1, t1), CONS(h2, t2)) == (P(h1, h2) && ALL2(P, t1, t2))"),
      t18,
    ),
  )
}

///|
let all2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALL2")

///|
/// `ALL2`
pub fn all2() -> @kernel.Thm {
  all2_c.get()
}

///|
/// MAP2_DEF
fn step_18() -> Unit raise {
  let t19 = @term_syntax.parse_term("(MAP2 : ((A, B) -> C, List[A], List[B]) -> List[C])((f : (A, B) -> C), NIL, (l : List[B])) == NIL && MAP2(f, CONS((h1 : A), (t1 : List[A])), l) == CONS(f(h1, HD(l)), MAP2(f, t1, TL(l)))")
  map2_def_c.set(
    @recursion.new_recursive_definition(@ind_types.list_recursion())(t19),
  )
}

///|
let map2_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MAP2_DEF")

///|
/// `MAP2_DEF`
pub fn map2_def() -> @kernel.Thm {
  map2_def_c.get()
}

///|
/// MAP2
fn step_19() -> Unit raise {
  let t20 = @simp.rewrite_tac(@list.List([map2_def(), hd(), tl()]))
  map2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("MAP2((f : (A, B) -> C), NIL, NIL) == NIL && MAP2(f, CONS((h1 : A), (t1 : List[A])), CONS((h2 : B), (t2 : List[B]))) == CONS(f(h1, h2), MAP2(f, t1, t2))"),
      t20,
    ),
  )
}

///|
let map2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MAP2")

///|
/// `MAP2`
pub fn map2() -> @kernel.Thm {
  map2_c.get()
}

///|
/// EL
fn step_20() -> Unit raise {
  let t21 = @term_syntax.parse_term("(EL : (Num, List[A]) -> A)(0, (l : List[A])) == HD(l) && EL(SUC((n : Num)), l) == EL(n, TL(l))")
  el_c.set(@recursion.new_recursive_definition(@nums.num_recursion())(t21))
}

///|
let el_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EL")

///|
/// `EL`
pub fn el() -> @kernel.Thm {
  el_c.get()
}

///|
/// FILTER
fn step_21() -> Unit raise {
  let t22 = @term_syntax.parse_term("(FILTER : ((A) -> Bool, List[A]) -> List[A])((P : (A) -> Bool), NIL) == NIL && FILTER(P, CONS((h : A), (t : List[A]))) == (if P(h) { CONS(h, FILTER(P, t)) } else { FILTER(P, t) })")
  filter_c.set(
    @recursion.new_recursive_definition(@ind_types.list_recursion())(t22),
  )
}

///|
let filter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FILTER")

///|
/// `FILTER`
pub fn filter() -> @kernel.Thm {
  filter_c.get()
}

///|
/// ASSOC
fn step_22() -> Unit raise {
  let t23 = @term_syntax.parse_term("(ASSOC : (A, List[(A, B)]) -> B)((a : A), CONS((h : (A, B)), (t : List[(A, B)]))) == (if FST(h) == a { SND(h) } else { ASSOC(a, t) })")
  assoc_c.set(
    @recursion.new_recursive_definition(@ind_types.list_recursion())(t23),
  )
}

///|
let assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ASSOC")

///|
/// `ASSOC`
pub fn assoc() -> @kernel.Thm {
  assoc_c.get()
}

///|
/// ITLIST2_DEF
fn step_23() -> Unit raise {
  let t24 = @term_syntax.parse_term("(ITLIST2 : ((A, B, C) -> C, List[A], List[B], C) -> C)((f : (A, B, C) -> C), NIL, (l2 : List[B]), (b : C)) == b && ITLIST2(f, CONS((h1 : A), (t1 : List[A])), l2, b) == f(h1, HD(l2), ITLIST2(f, t1, TL(l2), b))")
  itlist2_def_c.set(
    @recursion.new_recursive_definition(@ind_types.list_recursion())(t24),
  )
}

///|
let itlist2_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITLIST2_DEF")

///|
/// `ITLIST2_DEF`
pub fn itlist2_def() -> @kernel.Thm {
  itlist2_def_c.get()
}

///|
/// ITLIST2
fn step_24() -> Unit raise {
  let t25 = @simp.rewrite_tac(@list.List([itlist2_def(), hd(), tl()]))
  itlist2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("ITLIST2((f : (A, B, C) -> C), NIL, NIL, (b : C)) == b && ITLIST2(f, CONS((h1 : A), (t1 : List[A])), CONS((h2 : B), (t2 : List[B])), b) == f(h1, h2, ITLIST2(f, t1, t2, b))"),
      t25,
    ),
  )
}

///|
let itlist2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITLIST2")

///|
/// `ITLIST2`
pub fn itlist2() -> @kernel.Thm {
  itlist2_c.get()
}

///|
/// ZIP_DEF
fn step_25() -> Unit raise {
  let t26 = @term_syntax.parse_term("(ZIP : (List[A], List[B]) -> List[(A, B)])(NIL, (l2 : List[B])) == NIL && ZIP(CONS((h1 : A), (t1 : List[A])), l2) == CONS((h1, HD(l2)), ZIP(t1, TL(l2)))")
  zip_def_c.set(
    @recursion.new_recursive_definition(@ind_types.list_recursion())(t26),
  )
}

///|
let zip_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ZIP_DEF")

///|
/// `ZIP_DEF`
pub fn zip_def() -> @kernel.Thm {
  zip_def_c.get()
}

///|
/// ZIP
fn step_26() -> Unit raise {
  let t27 = @simp.rewrite_tac(@list.List([zip_def(), hd(), tl()]))
  zip_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(ZIP : (List[A], List[B]) -> List[(A, B)])((NIL : List[A]), (NIL : List[B])) == (NIL : List[(A, B)]) && (ZIP : (List[A], List[B]) -> List[(A, B)])((CONS : (A, List[A]) -> List[A])((h1 : A), (t1 : List[A])), (CONS : (B, List[B]) -> List[B])((h2 : B), (t2 : List[B]))) == (CONS : ((A, B), List[(A, B)]) -> List[(A, B)])((h1, h2), (ZIP : (List[A], List[B]) -> List[(A, B)])(t1, t2))"),
      t27,
    ),
  )
}

///|
let zip_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ZIP")

///|
/// `ZIP`
pub fn zip() -> @kernel.Thm {
  zip_c.get()
}

///|
/// ALLPAIRS
fn step_27() -> Unit raise {
  let t28 = @term_syntax.parse_term("(ALLPAIRS : ((A, B) -> Bool, List[A], List[B]) -> Bool)((f : (A, B) -> Bool), NIL, (l : List[B])) == true && ALLPAIRS(f, CONS((h : A), (t : List[A])), l) == (ALL(f(h), l) && ALLPAIRS(f, t, l))")
  allpairs_c.set(
    @recursion.new_recursive_definition(@ind_types.list_recursion())(t28),
  )
}

///|
let allpairs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALLPAIRS")

///|
/// `ALLPAIRS`
pub fn allpairs() -> @kernel.Thm {
  allpairs_c.get()
}

///|
/// PAIRWISE
fn step_28() -> Unit raise {
  let t29 = @term_syntax.parse_term("(PAIRWISE : ((A, A) -> Bool, List[A]) -> Bool)((r : (A, A) -> Bool), NIL) == true && PAIRWISE(r, CONS((h : A), (t : List[A]))) == (ALL(r(h), t) && PAIRWISE(r, t))")
  pairwise_c.set(
    @recursion.new_recursive_definition(@ind_types.list_recursion())(t29),
  )
}

///|
let pairwise_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PAIRWISE")

///|
/// `PAIRWISE`
pub fn pairwise() -> @kernel.Thm {
  pairwise_c.get()
}

///|
/// list_of_seq
fn step_29() -> Unit raise {
  let t30 = @term_syntax.parse_term("(list_of_seq : ((Num) -> A, Num) -> List[A])((s : (Num) -> A), 0) == NIL && list_of_seq(s, SUC((n : Num))) == APPEND(list_of_seq(s, n), [s(n)])")
  list_of_seq_c.set(
    @recursion.new_recursive_definition(@nums.num_recursion())(t30),
  )
}

///|
let list_of_seq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("list_of_seq")

///|
/// `list_of_seq`
pub fn list_of_seq() -> @kernel.Thm {
  list_of_seq_c.get()
}

///|
/// NOT_CONS_NIL
fn step_30() -> Unit raise {
  let t31 = @simp.rewrite_tac(@list.List([@ind_types.distinctness("list")]))
  not_cons_nil_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ h : A, ∀ t : List[A], !(CONS(h, t) == NIL)"), t31),
  )
}

///|
let not_cons_nil_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOT_CONS_NIL")

///|
/// `NOT_CONS_NIL`
pub fn not_cons_nil() -> @kernel.Thm {
  not_cons_nil_c.get()
}

///|
/// LAST_CLAUSES
fn step_31() -> Unit raise {
  let t32 = @simp.rewrite_tac(@list.List([last(), not_cons_nil()]))
  last_clauses_c.set(
    @tactics.prove(
      @term_syntax.parse_term("LAST([(h : A)]) == h && LAST(CONS(h, CONS((k : A), (t : List[A])))) == LAST(CONS(k, t))"),
      t32,
    ),
  )
}

///|
let last_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LAST_CLAUSES")

///|
/// `LAST_CLAUSES`
pub fn last_clauses() -> @kernel.Thm {
  last_clauses_c.get()
}

///|
/// APPEND_NIL
fn step_32() -> Unit raise {
  let t33 = @tactics.then_tac(
    list_induct_tac,
    @simp.asm_rewrite_tac(@list.List([append()])),
  )
  append_nil_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ l : List[A], APPEND(l, NIL) == l"), t33),
  )
}

///|
let append_nil_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("APPEND_NIL")

///|
/// `APPEND_NIL`
pub fn append_nil() -> @kernel.Thm {
  append_nil_c.get()
}

///|
/// APPEND_ASSOC
fn step_33() -> Unit raise {
  let t34 = @tactics.then_tac(
    list_induct_tac,
    @simp.asm_rewrite_tac(@list.List([append()])),
  )
  append_assoc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : List[A], ∀ m : List[A], ∀ n : List[A], APPEND(l, APPEND(m, n)) == APPEND(APPEND(l, m), n)"),
      t34,
    ),
  )
}

///|
let append_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("APPEND_ASSOC")

///|
/// `APPEND_ASSOC`
pub fn append_assoc() -> @kernel.Thm {
  append_assoc_c.get()
}

///|
/// REVERSE_APPEND
fn step_34() -> Unit raise {
  let t35 = @tactics.then_tac(
    list_induct_tac,
    @simp.asm_rewrite_tac(
      @list.List([append(), reverse(), append_nil(), append_assoc()]),
    ),
  )
  reverse_append_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : List[A], ∀ m : List[A], REVERSE(APPEND(l, m)) == APPEND(REVERSE(m), REVERSE(l))"),
      t35,
    ),
  )
}

///|
let reverse_append_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REVERSE_APPEND")

///|
/// `REVERSE_APPEND`
pub fn reverse_append() -> @kernel.Thm {
  reverse_append_c.get()
}

///|
/// REVERSE_REVERSE
fn step_35() -> Unit raise {
  let t36 = @tactics.then_tac(
    list_induct_tac,
    @simp.asm_rewrite_tac(@list.List([reverse(), reverse_append(), append()])),
  )
  reverse_reverse_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ l : List[A], REVERSE(REVERSE(l)) == l"), t36),
  )
}

///|
let reverse_reverse_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REVERSE_REVERSE",
)

///|
/// `REVERSE_REVERSE`
pub fn reverse_reverse() -> @kernel.Thm {
  reverse_reverse_c.get()
}

///|
/// REVERSE_EQ_EMPTY
fn step_36() -> Unit raise {
  let t37 = @meson.meson_tac(@list.List([reverse_reverse(), reverse()]))
  reverse_eq_empty_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : List[A], (REVERSE(l) == NIL) == (l == NIL)"),
      t37,
    ),
  )
}

///|
let reverse_eq_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REVERSE_EQ_EMPTY",
)

///|
/// `REVERSE_EQ_EMPTY`
pub fn reverse_eq_empty() -> @kernel.Thm {
  reverse_eq_empty_c.get()
}

///|
/// CONS_11
fn step_37() -> Unit raise {
  let t38 = @simp.rewrite_tac(@list.List([@ind_types.injectivity("list")]))
  cons_11_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ h1 : A, ∀ h2 : A, ∀ t1 : List[A], ∀ t2 : List[A], (CONS(h1, t1) == CONS(h2, t2)) == (h1 == h2 && t1 == t2)"),
      t38,
    ),
  )
}

///|
let cons_11_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONS_11")

///|
/// `CONS_11`
pub fn cons_11() -> @kernel.Thm {
  cons_11_c.get()
}

///|
/// list_CASES
fn step_38() -> Unit raise {
  let t39 = @meson.meson_tac(@list.List([]))
  let t40 = @tactics.then_tac(
    @tactics.then_tac(
      list_induct_tac,
      @simp.rewrite_tac(@list.List([cons_11(), not_cons_nil()])),
    ),
    t39,
  )
  list_cases_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : List[A], l == NIL || (∃ h : A, ∃ t : List[A], l == CONS(h, t))"),
      t40,
    ),
  )
}

///|
let list_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("list_CASES")

///|
/// `list_CASES`
pub fn list_cases() -> @kernel.Thm {
  list_cases_c.get()
}

///|
/// LIST_EQ
fn step_39() -> Unit raise {
  let t51 = @simp.rewrite_tac(
    @list.List([
      el(),
      hd(),
      tl(),
      @arith.lt_0(),
      @arith.lt_suc(),
      @theorems.conj_aci(),
    ]),
  )
  let t50 = @simp.gen_rewrite_tac(
    fn(
      x49 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x43 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s44 = @equal.rand_conv(x43)
        fn(x45 : @kernel.Term) -> @kernel.Thm raise { s44(x45) }
      })(
        (fn(
          x46 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s47 = @equal.rand_conv(x46)
          fn(x48 : @kernel.Term) -> @kernel.Thm raise { s47(x48) }
        })(x49),
      )
    },
    @list.List([
      @meson.meson(
        @list.List([@nums.num_cases()]),
        @term_syntax.parse_term("(∀ n : Num, (P : (Num) -> Bool)(n)) == (P(0) && (∀ n : Num, P(SUC(n))))"),
      ),
    ]),
  )
  let t42 = @simp.asm_rewrite_tac(@list.List([@nums.suc_inj()]))
  let t41 = @simp.rewrite_tac(
    @list.List([
      not_cons_nil(),
      cons_11(),
      length(),
      @bool.conjunct1(@arith.lt()),
      @nums.not_suc(),
    ]),
  )
  let t52 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(list_induct_tac), t41),
        t42,
      ),
      t50,
    ),
    t51,
  )
  list_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l1 : List[A], ∀ l2 : List[A], (l1 == l2) == (LENGTH(l1) == LENGTH(l2) && (∀ n : Num, n < LENGTH(l2) → EL(n, l1) == EL(n, l2)))"),
      t52,
    ),
  )
}

///|
let list_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIST_EQ")

///|
/// `LIST_EQ`
pub fn list_eq() -> @kernel.Thm {
  list_eq_c.get()
}

///|
/// LENGTH_APPEND
fn step_40() -> Unit raise {
  let t53 = @tactics.then_tac(
    list_induct_tac,
    @simp.asm_rewrite_tac(
      @list.List([append(), length(), @arith.add_clauses()]),
    ),
  )
  length_append_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : List[A], ∀ m : List[A], LENGTH(APPEND(l, m)) == LENGTH(l) + LENGTH(m)"),
      t53,
    ),
  )
}

///|
let length_append_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LENGTH_APPEND")

///|
/// `LENGTH_APPEND`
pub fn length_append() -> @kernel.Thm {
  length_append_c.get()
}

///|
/// MAP_APPEND
fn step_41() -> Unit raise {
  let t54 = @simp.asm_rewrite_tac(@list.List([map(), append()]))
  let t55 = @tactics.then_tac(
    @tactics.then_tac(@tactics.gen_tac, list_induct_tac),
    t54,
  )
  map_append_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, ∀ l1 : List[A], ∀ l2 : List[A], MAP(f, APPEND(l1, l2)) == APPEND(MAP(f, l1), MAP(f, l2))"),
      t55,
    ),
  )
}

///|
let map_append_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MAP_APPEND")

///|
/// `MAP_APPEND`
pub fn map_append() -> @kernel.Thm {
  map_append_c.get()
}

///|
/// LENGTH_MAP
fn step_42() -> Unit raise {
  let t56 = @tactics.then_tac(
    list_induct_tac,
    @simp.asm_rewrite_tac(@list.List([map(), length()])),
  )
  length_map_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : List[A], ∀ f : (A) -> B, LENGTH(MAP(f, l)) == LENGTH(l)"),
      t56,
    ),
  )
}

///|
let length_map_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LENGTH_MAP")

///|
/// `LENGTH_MAP`
pub fn length_map() -> @kernel.Thm {
  length_map_c.get()
}

///|
/// LENGTH_EQ_NIL
fn step_43() -> Unit raise {
  let t57 = @tactics.then_tac(
    list_induct_tac,
    @simp.rewrite_tac(@list.List([length(), not_cons_nil(), @nums.not_suc()])),
  )
  length_eq_nil_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : List[A], (LENGTH(l) == 0) == (l == NIL)"),
      t57,
    ),
  )
}

///|
let length_eq_nil_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LENGTH_EQ_NIL")

///|
/// `LENGTH_EQ_NIL`
pub fn length_eq_nil() -> @kernel.Thm {
  length_eq_nil_c.get()
}

///|
/// LENGTH_EQ_CONS
fn step_44() -> Unit raise {
  let t59 = @meson.meson_tac(@list.List([]))
  let t58 = @simp.asm_rewrite_tac(@list.List([@nums.suc_inj(), cons_11()]))
  let t60 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        list_induct_tac,
        @simp.rewrite_tac(
          @list.List([length(), @nums.not_suc(), not_cons_nil()]),
        ),
      ),
      t58,
    ),
    t59,
  )
  length_eq_cons_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : List[A], ∀ n : Num, (LENGTH(l) == SUC(n)) == (∃ h : A, ∃ t : List[A], l == CONS(h, t) && LENGTH(t) == n)"),
      t60,
    ),
  )
}

///|
let length_eq_cons_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LENGTH_EQ_CONS")

///|
/// `LENGTH_EQ_CONS`
pub fn length_eq_cons() -> @kernel.Thm {
  length_eq_cons_c.get()
}

///|
/// LENGTH_REVERSE
fn step_45() -> Unit raise {
  let t61 = @simp.rewrite_tac(
    @list.List([@arith.add_clauses(), @arith.mult_clauses()]),
  )
  let t62 = @tactics.then_tac(
    @tactics.then_tac(
      list_induct_tac,
      @simp.asm_rewrite_tac(@list.List([reverse(), length_append(), length()])),
    ),
    t61,
  )
  length_reverse_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : List[A], LENGTH(REVERSE(l)) == LENGTH(l)"),
      t62,
    ),
  )
}

///|
let length_reverse_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LENGTH_REVERSE")

///|
/// `LENGTH_REVERSE`
pub fn length_reverse() -> @kernel.Thm {
  length_reverse_c.get()
}

///|
/// MAP_o
fn step_46() -> Unit raise {
  let t63 = @simp.asm_rewrite_tac(@list.List([map(), @trivia.o_thm()]))
  let t64 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
      list_induct_tac,
    ),
    t63,
  )
  map_o_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, ∀ g : (B) -> C, ∀ l : List[A], MAP(o(g, f), l) == MAP(g, MAP(f, l))"),
      t64,
    ),
  )
}

///|
let map_o_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MAP_o")

///|
/// `MAP_o`
pub fn map_o() -> @kernel.Thm {
  map_o_c.get()
}

///|
/// MAP_EQ
fn step_47() -> Unit raise {
  let t66 = @meson.asm_meson_tac(@list.List([]))
  let t65 = @simp.rewrite_tac(@list.List([map(), all()]))
  let t67 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
        list_induct_tac,
      ),
      t65,
    ),
    t66,
  )
  map_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, ∀ g : (A) -> B, ∀ l : List[A], ALL((x : A) => f(x) == g(x), l) → MAP(f, l) == MAP(g, l)"),
      t67,
    ),
  )
}

///|
let map_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MAP_EQ")

///|
/// `MAP_EQ`
pub fn map_eq() -> @kernel.Thm {
  map_eq_c.get()
}

///|
/// ALL_IMP
fn step_48() -> Unit raise {
  let t69 = @meson.asm_meson_tac(@list.List([]))
  let t68 = @simp.rewrite_tac(@list.List([mem(), all()]))
  let t70 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
        list_induct_tac,
      ),
      t68,
    ),
    t69,
  )
  all_imp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ Q : (A) -> Bool, ∀ l : List[A], (∀ x : A, MEM(x, l) && P(x) → Q(x)) && ALL(P, l) → ALL(Q, l)"),
      t70,
    ),
  )
}

///|
let all_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALL_IMP")

///|
/// `ALL_IMP`
pub fn all_imp() -> @kernel.Thm {
  all_imp_c.get()
}

///|
/// NOT_EX
fn step_49() -> Unit raise {
  let t71 = @simp.asm_rewrite_tac(
    @list.List([ex(), all(), @class.de_morgan_thm()]),
  )
  let t72 = @tactics.then_tac(
    @tactics.then_tac(@tactics.gen_tac, list_induct_tac),
    t71,
  )
  not_ex_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ l : List[A], !EX(P, l) == ALL((x : A) => !P(x), l)"),
      t72,
    ),
  )
}

///|
let not_ex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOT_EX")

///|
/// `NOT_EX`
pub fn not_ex() -> @kernel.Thm {
  not_ex_c.get()
}

///|
/// NOT_ALL
fn step_50() -> Unit raise {
  let t73 = @simp.asm_rewrite_tac(
    @list.List([ex(), all(), @class.de_morgan_thm()]),
  )
  let t74 = @tactics.then_tac(
    @tactics.then_tac(@tactics.gen_tac, list_induct_tac),
    t73,
  )
  not_all_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ l : List[A], !ALL(P, l) == EX((x : A) => !P(x), l)"),
      t74,
    ),
  )
}

///|
let not_all_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOT_ALL")

///|
/// `NOT_ALL`
pub fn not_all() -> @kernel.Thm {
  not_all_c.get()
}

///|
/// ALL_MAP
fn step_51() -> Unit raise {
  let t75 = @simp.asm_rewrite_tac(@list.List([all(), map(), @trivia.o_thm()]))
  let t76 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
      list_induct_tac,
    ),
    t75,
  )
  all_map_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (B) -> Bool, ∀ f : (A) -> B, ∀ l : List[A], ALL(P, MAP(f, l)) == ALL(o(P, f), l)"),
      t76,
    ),
  )
}

///|
let all_map_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALL_MAP")

///|
/// `ALL_MAP`
pub fn all_map() -> @kernel.Thm {
  all_map_c.get()
}

///|
/// ALL_EQ
fn step_52() -> Unit raise {
  let t78 = @simp.asm_rewrite_tac(@list.List([]))
  let t77 = @tactics.first_assum(@tactics.match_mp_tac)
  let t79 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            list_induct_tac,
            @simp.rewrite_tac(@list.List([all()])),
          ),
          @tactics.strip_tac,
        ),
        @tactics.binop_tac,
      ),
      t77,
    ),
    t78,
  )
  all_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : List[A], ALL((R : (A) -> Bool), l) && (∀ x : A, R(x) → (P : (A) -> Bool)(x) == (Q : (A) -> Bool)(x)) → ALL(P, l) == ALL(Q, l)"),
      t79,
    ),
  )
}

///|
let all_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALL_EQ")

///|
/// `ALL_EQ`
pub fn all_eq() -> @kernel.Thm {
  all_eq_c.get()
}

///|
/// ALL_T
fn step_53() -> Unit raise {
  let t80 = @tactics.then_tac(
    list_induct_tac,
    @simp.asm_rewrite_tac(@list.List([all()])),
  )
  all_t_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ l : List[A], ALL((x : A) => true, l)"), t80),
  )
}

///|
let all_t_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALL_T")

///|
/// `ALL_T`
pub fn all_t() -> @kernel.Thm {
  all_t_c.get()
}

///|
/// MAP_EQ_ALL2
fn step_54() -> Unit raise {
  let t82 = @meson.asm_meson_tac(@list.List([]))
  let t81 = @simp.asm_rewrite_tac(@list.List([map(), all2(), cons_11()]))
  let t83 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.repeat_tac(list_induct_tac)),
      t81,
    ),
    t82,
  )
  map_eq_all2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, ∀ l : List[A], ∀ m : List[A], ALL2((x : A) => (y : A) => f(x) == f(y), l, m) → MAP(f, l) == MAP(f, m)"),
      t83,
    ),
  )
}

///|
let map_eq_all2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MAP_EQ_ALL2")

///|
/// `MAP_EQ_ALL2`
pub fn map_eq_all2() -> @kernel.Thm {
  map_eq_all2_c.get()
}

///|
/// ALL2_MAP
fn step_55() -> Unit raise {
  let t84 = @simp.asm_rewrite_tac(@list.List([all2(), map(), all()]))
  let t85 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
      list_induct_tac,
    ),
    t84,
  )
  all2_map_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (B, A) -> Bool, ∀ f : (A) -> B, ∀ l : List[A], ALL2(P, MAP(f, l), l) == ALL((a : A) => P(f(a), a), l)"),
      t85,
    ),
  )
}

///|
let all2_map_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALL2_MAP")

///|
/// `ALL2_MAP`
pub fn all2_map() -> @kernel.Thm {
  all2_map_c.get()
}

///|
/// MAP_EQ_DEGEN
fn step_56() -> Unit raise {
  let t89 = @simp.asm_rewrite_tac(@list.List([]))
  let t88 = @tactics.first_assum(@tactics.match_mp_tac)
  let t87 = @simp.asm_rewrite_tac(@list.List([]))
  let t86 = @tactics.repeat_tac(@tactics.strip_tac)
  let t90 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            list_induct_tac,
            @simp.rewrite_tac(@list.List([all(), map(), cons_11()])),
          ),
          t86,
        ),
        t87,
      ),
      t88,
    ),
    t89,
  )
  map_eq_degen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : List[A], ∀ f : (A) -> A, ALL((x : A) => f(x) == x, l) → MAP(f, l) == l"),
      t90,
    ),
  )
}

///|
let map_eq_degen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MAP_EQ_DEGEN")

///|
/// `MAP_EQ_DEGEN`
pub fn map_eq_degen() -> @kernel.Thm {
  map_eq_degen_c.get()
}

///|
/// ALL2_AND_RIGHT
fn step_57() -> Unit raise {
  let t92 = @simp.rewrite_tac(@list.List([@theorems.conj_aci()]))
  let t91 = @simp.asm_rewrite_tac(@list.List([all(), all2()]))
  let t93 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          list_induct_tac,
          @simp.asm_rewrite_tac(@list.List([all(), all2()])),
        ),
        list_induct_tac,
      ),
      t91,
    ),
    t92,
  )
  all2_and_right_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : List[A], ∀ m : List[B], ∀ P : (A) -> Bool, ∀ Q : (A, B) -> Bool, ALL2((x : A) => (y : B) => P(x) && Q(x, y), l, m) == (ALL(P, l) && ALL2(Q, l, m))"),
      t93,
    ),
  )
}

///|
let all2_and_right_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALL2_AND_RIGHT")

///|
/// `ALL2_AND_RIGHT`
pub fn all2_and_right() -> @kernel.Thm {
  all2_and_right_c.get()
}

///|
/// ITLIST_APPEND
fn step_58() -> Unit raise {
  let t94 = @simp.asm_rewrite_tac(@list.List([itlist(), append()]))
  let t95 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
      list_induct_tac,
    ),
    t94,
  )
  itlist_append_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A, B) -> B, ∀ a : B, ∀ l1 : List[A], ∀ l2 : List[A], ITLIST(f, APPEND(l1, l2), a) == ITLIST(f, l1, ITLIST(f, l2, a))"),
      t95,
    ),
  )
}

///|
let itlist_append_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITLIST_APPEND")

///|
/// `ITLIST_APPEND`
pub fn itlist_append() -> @kernel.Thm {
  itlist_append_c.get()
}

///|
/// ITLIST_EXTRA
fn step_59() -> Unit raise {
  let t96 = @simp.rewrite_tac(@list.List([itlist_append(), itlist()]))
  itlist_extra_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A, B) -> B, ∀ l : List[A], ITLIST(f, APPEND(l, [(a : A)]), (b : B)) == ITLIST(f, l, f(a, b))"),
      t96,
    ),
  )
}

///|
let itlist_extra_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITLIST_EXTRA")

///|
/// `ITLIST_EXTRA`
pub fn itlist_extra() -> @kernel.Thm {
  itlist_extra_c.get()
}

///|
/// ALL_MP
fn step_60() -> Unit raise {
  let t98 = @meson.asm_meson_tac(@list.List([]))
  let t97 = @simp.rewrite_tac(@list.List([all()]))
  let t99 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
        list_induct_tac,
      ),
      t97,
    ),
    t98,
  )
  all_mp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ Q : (A) -> Bool, ∀ l : List[A], ALL((x : A) => P(x) → Q(x), l) && ALL(P, l) → ALL(Q, l)"),
      t99,
    ),
  )
}

///|
let all_mp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALL_MP")

///|
/// `ALL_MP`
pub fn all_mp() -> @kernel.Thm {
  all_mp_c.get()
}

///|
/// AND_ALL
fn step_61() -> Unit raise {
  let t100 = @simp.asm_rewrite_tac(@list.List([all(), @theorems.conj_aci()]))
  let t101 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.conv_tac(@equal.once_depth_conv(@equal.sym_conv)),
      list_induct_tac,
    ),
    t100,
  )
  and_all_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : List[A], (ALL((P : (A) -> Bool), l) && ALL((Q : (A) -> Bool), l)) == ALL((x : A) => P(x) && Q(x), l)"),
      t101,
    ),
  )
}

///|
let and_all_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AND_ALL")

///|
/// `AND_ALL`
pub fn and_all() -> @kernel.Thm {
  and_all_c.get()
}

///|
/// EX_IMP
fn step_62() -> Unit raise {
  let t103 = @meson.asm_meson_tac(@list.List([]))
  let t102 = @simp.rewrite_tac(@list.List([mem(), ex()]))
  let t104 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
        list_induct_tac,
      ),
      t102,
    ),
    t103,
  )
  ex_imp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ Q : (A) -> Bool, ∀ l : List[A], (∀ x : A, MEM(x, l) && P(x) → Q(x)) && EX(P, l) → EX(Q, l)"),
      t104,
    ),
  )
}

///|
let ex_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EX_IMP")

///|
/// `EX_IMP`
pub fn ex_imp() -> @kernel.Thm {
  ex_imp_c.get()
}

///|
/// ALL_MEM
fn step_63() -> Unit raise {
  let t106 = @meson.asm_meson_tac(@list.List([]))
  let t105 = @simp.rewrite_tac(@list.List([all(), mem()]))
  let t107 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, list_induct_tac),
      t105,
    ),
    t106,
  )
  all_mem_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ l : List[A], (∀ x : A, MEM(x, l) → P(x)) == ALL(P, l)"),
      t107,
    ),
  )
}

///|
let all_mem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALL_MEM")

///|
/// `ALL_MEM`
pub fn all_mem() -> @kernel.Thm {
  all_mem_c.get()
}

///|
/// LENGTH_REPLICATE
fn step_64() -> Unit raise {
  let t108 = @tactics.then_tac(
    @nums.induct_tac,
    @simp.asm_rewrite_tac(@list.List([length(), replicate()])),
  )
  length_replicate_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : A, LENGTH(REPLICATE(n, x)) == n"),
      t108,
    ),
  )
}

///|
let length_replicate_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "LENGTH_REPLICATE",
)

///|
/// `LENGTH_REPLICATE`
pub fn length_replicate() -> @kernel.Thm {
  length_replicate_c.get()
}

///|
/// MEM_REPLICATE
fn step_65() -> Unit raise {
  let t109 = @meson.meson_tac(@list.List([]))
  let t110 = @tactics.then_tac(
    @tactics.then_tac(
      @nums.induct_tac,
      @simp.asm_rewrite_tac(@list.List([mem(), replicate(), @nums.not_suc()])),
    ),
    t109,
  )
  mem_replicate_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ x : A, ∀ y : A, MEM(x, REPLICATE(n, y)) == (x == y && !(n == 0))"),
      t110,
    ),
  )
}

///|
let mem_replicate_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MEM_REPLICATE")

///|
/// `MEM_REPLICATE`
pub fn mem_replicate() -> @kernel.Thm {
  mem_replicate_c.get()
}

///|
/// EX_MAP
fn step_66() -> Unit raise {
  let t111 = @simp.asm_rewrite_tac(@list.List([map(), ex(), @trivia.o_thm()]))
  let t112 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
      list_induct_tac,
    ),
    t111,
  )
  ex_map_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (B) -> Bool, ∀ f : (A) -> B, ∀ l : List[A], EX(P, MAP(f, l)) == EX(o(P, f), l)"),
      t112,
    ),
  )
}

///|
let ex_map_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EX_MAP")

///|
/// `EX_MAP`
pub fn ex_map() -> @kernel.Thm {
  ex_map_c.get()
}

///|
/// EXISTS_EX
fn step_67() -> Unit raise {
  let t114 = @meson.asm_meson_tac(@list.List([]))
  let t113 = @simp.asm_rewrite_tac(@list.List([ex()]))
  let t115 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, list_induct_tac),
      t113,
    ),
    t114,
  )
  exists_ex_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A, B) -> Bool, ∀ l : List[B], (∃ x : A, EX(P(x), l)) == EX((s : B) => ∃ x : A, P(x, s), l)"),
      t115,
    ),
  )
}

///|
let exists_ex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXISTS_EX")

///|
/// `EXISTS_EX`
pub fn exists_ex() -> @kernel.Thm {
  exists_ex_c.get()
}

///|
/// FORALL_ALL
fn step_68() -> Unit raise {
  let t117 = @meson.asm_meson_tac(@list.List([]))
  let t116 = @simp.asm_rewrite_tac(@list.List([all()]))
  let t118 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, list_induct_tac),
      t116,
    ),
    t117,
  )
  forall_all_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A, B) -> Bool, ∀ l : List[B], (∀ x : A, ALL(P(x), l)) == ALL((s : B) => ∀ x : A, P(x, s), l)"),
      t118,
    ),
  )
}

///|
let forall_all_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORALL_ALL")

///|
/// `FORALL_ALL`
pub fn forall_all() -> @kernel.Thm {
  forall_all_c.get()
}

///|
/// MEM_APPEND
fn step_69() -> Unit raise {
  let t119 = @simp.asm_rewrite_tac(
    @list.List([mem(), append(), @theorems.disj_aci()]),
  )
  let t120 = @tactics.then_tac(
    @tactics.then_tac(@tactics.gen_tac, list_induct_tac),
    t119,
  )
  mem_append_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : A, ∀ l1 : List[A], ∀ l2 : List[A], MEM(x, APPEND(l1, l2)) == (MEM(x, l1) || MEM(x, l2))"),
      t120,
    ),
  )
}

///|
let mem_append_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MEM_APPEND")

///|
/// `MEM_APPEND`
pub fn mem_append() -> @kernel.Thm {
  mem_append_c.get()
}

///|
/// MEM_MAP
fn step_70() -> Unit raise {
  let t122 = @meson.meson_tac(@list.List([]))
  let t121 = @simp.asm_rewrite_tac(@list.List([mem(), map()]))
  let t123 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
        list_induct_tac,
      ),
      t121,
    ),
    t122,
  )
  mem_map_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, ∀ y : B, ∀ l : List[A], MEM(y, MAP(f, l)) == (∃ x : A, MEM(x, l) && y == f(x))"),
      t123,
    ),
  )
}

///|
let mem_map_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MEM_MAP")

///|
/// `MEM_MAP`
pub fn mem_map() -> @kernel.Thm {
  mem_map_c.get()
}

///|
/// FILTER_APPEND
fn step_71() -> Unit raise {
  let t125 = @simp.asm_rewrite_tac(@list.List([append()]))
  let t124 = @simp.asm_rewrite_tac(@list.List([filter(), append()]))
  let t126 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.gen_tac, list_induct_tac),
          t124,
        ),
        @tactics.gen_tac,
      ),
      @class.cond_cases_tac,
    ),
    t125,
  )
  filter_append_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ l1 : List[A], ∀ l2 : List[A], FILTER(P, APPEND(l1, l2)) == APPEND(FILTER(P, l1), FILTER(P, l2))"),
      t126,
    ),
  )
}

///|
let filter_append_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FILTER_APPEND")

///|
/// `FILTER_APPEND`
pub fn filter_append() -> @kernel.Thm {
  filter_append_c.get()
}

///|
/// FILTER_MAP
fn step_72() -> Unit raise {
  let t128 = @simp.rewrite_tac(@list.List([map()]))
  let t127 = @simp.asm_rewrite_tac(
    @list.List([map(), filter(), @trivia.o_thm()]),
  )
  let t129 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
          list_induct_tac,
        ),
        t127,
      ),
      @class.cond_cases_tac,
    ),
    t128,
  )
  filter_map_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (B) -> Bool, ∀ f : (A) -> B, ∀ l : List[A], FILTER(P, MAP(f, l)) == MAP(f, FILTER(o(P, f), l))"),
      t129,
    ),
  )
}

///|
let filter_map_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FILTER_MAP")

///|
/// `FILTER_MAP`
pub fn filter_map() -> @kernel.Thm {
  filter_map_c.get()
}

///|
/// MEM_FILTER
fn step_73() -> Unit raise {
  let t132 = @meson.asm_meson_tac(@list.List([]))
  let t131 = @simp.asm_rewrite_tac(@list.List([mem()]))
  let t130 = @simp.asm_rewrite_tac(@list.List([mem(), filter()]))
  let t133 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.gen_tac, list_induct_tac),
            t130,
          ),
          @tactics.gen_tac,
        ),
        @class.cond_cases_tac,
      ),
      t131,
    ),
    t132,
  )
  mem_filter_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ l : List[A], ∀ x : A, MEM(x, FILTER(P, l)) == (P(x) && MEM(x, l))"),
      t133,
    ),
  )
}

///|
let mem_filter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MEM_FILTER")

///|
/// `MEM_FILTER`
pub fn mem_filter() -> @kernel.Thm {
  mem_filter_c.get()
}

///|
/// LENGTH_FILTER
fn step_74() -> Unit raise {
  let t136 = @meson.asm_meson_tac(@list.List([@arith.le_trans(), @arith.le()]))
  let t135 = @simp.asm_rewrite_tac(@list.List([length(), @arith.le_suc()]))
  let t134 = @simp.asm_rewrite_tac(@list.List([filter(), @arith.le_refl()]))
  let t137 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.gen_tac, list_induct_tac),
          t134,
        ),
        @class.cond_cases_tac,
      ),
      t135,
    ),
    t136,
  )
  length_filter_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ l : List[A], LENGTH(FILTER(P, l)) <= LENGTH(l)"),
      t137,
    ),
  )
}

///|
let length_filter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LENGTH_FILTER")

///|
/// `LENGTH_FILTER`
pub fn length_filter() -> @kernel.Thm {
  length_filter_c.get()
}

///|
/// EX_MEM
fn step_75() -> Unit raise {
  let t139 = @meson.asm_meson_tac(@list.List([]))
  let t138 = @simp.asm_rewrite_tac(@list.List([ex(), mem()]))
  let t140 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, list_induct_tac),
      t138,
    ),
    t139,
  )
  ex_mem_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ l : List[A], (∃ x : A, P(x) && MEM(x, l)) == EX(P, l)"),
      t140,
    ),
  )
}

///|
let ex_mem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EX_MEM")

///|
/// `EX_MEM`
pub fn ex_mem() -> @kernel.Thm {
  ex_mem_c.get()
}

///|
/// MAP_FST_ZIP
fn step_76() -> Unit raise {
  let t141 = @simp.asm_simp_tac(
    @list.List([
      length(),
      @nums.suc_inj(),
      map(),
      @pair.fst(),
      zip(),
      @nums.not_suc(),
    ]),
  )
  let t142 = @tactics.then_tac(
    @tactics.then_tac(list_induct_tac, list_induct_tac),
    t141,
  )
  map_fst_zip_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l1 : List[A], ∀ l2 : List[B], LENGTH(l1) == LENGTH(l2) → MAP(FST, ZIP(l1, l2)) == l1"),
      t142,
    ),
  )
}

///|
let map_fst_zip_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MAP_FST_ZIP")

///|
/// `MAP_FST_ZIP`
pub fn map_fst_zip() -> @kernel.Thm {
  map_fst_zip_c.get()
}

///|
/// MAP_SND_ZIP
fn step_77() -> Unit raise {
  let t143 = @simp.asm_simp_tac(
    @list.List([
      length(),
      @nums.suc_inj(),
      map(),
      @pair.fst(),
      zip(),
      @nums.not_suc(),
    ]),
  )
  let t144 = @tactics.then_tac(
    @tactics.then_tac(list_induct_tac, list_induct_tac),
    t143,
  )
  map_snd_zip_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l1 : List[A], ∀ l2 : List[B], LENGTH(l1) == LENGTH(l2) → MAP(SND, ZIP(l1, l2)) == l2"),
      t144,
    ),
  )
}

///|
let map_snd_zip_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MAP_SND_ZIP")

///|
/// `MAP_SND_ZIP`
pub fn map_snd_zip() -> @kernel.Thm {
  map_snd_zip_c.get()
}

///|
/// LENGTH_ZIP
fn step_78() -> Unit raise {
  let t145 = @simp.asm_simp_tac(
    @list.List([length(), @nums.not_suc(), zip(), @nums.suc_inj()]),
  )
  let t146 = @tactics.then_tac(
    @tactics.repeat_tac(@tactics.orelse_tac(list_induct_tac, @tactics.gen_tac)),
    t145,
  )
  length_zip_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l1 : List[A], ∀ l2 : List[B], LENGTH(l1) == LENGTH(l2) → LENGTH(ZIP(l1, l2)) == LENGTH(l2)"),
      t146,
    ),
  )
}

///|
let length_zip_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LENGTH_ZIP")

///|
/// `LENGTH_ZIP`
pub fn length_zip() -> @kernel.Thm {
  length_zip_c.get()
}

///|
/// MEM_ASSOC
fn step_79() -> Unit raise {
  let t148 = @meson.asm_meson_tac(@list.List([@pair.pair(), @pair.fst()]))
  let t147 = @simp.asm_rewrite_tac(@list.List([]))
  let t149 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            list_induct_tac,
            @simp.asm_rewrite_tac(@list.List([mem(), map(), assoc()])),
          ),
          @tactics.gen_tac,
        ),
        @class.cond_cases_tac,
      ),
      t147,
    ),
    t148,
  )
  mem_assoc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : List[(A, B)], ∀ x : A, MEM((x, ASSOC(x, l)), l) == MEM(x, MAP(FST, l))"),
      t149,
    ),
  )
}

///|
let mem_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MEM_ASSOC")

///|
/// `MEM_ASSOC`
pub fn mem_assoc() -> @kernel.Thm {
  mem_assoc_c.get()
}

///|
/// ALL_APPEND
fn step_80() -> Unit raise {
  let t150 = @simp.asm_rewrite_tac(
    @list.List([all(), append(), @equal.gsym(@theorems.conj_assoc())]),
  )
  let t151 = @tactics.then_tac(
    @tactics.then_tac(@tactics.gen_tac, list_induct_tac),
    t150,
  )
  all_append_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ l1 : List[A], ∀ l2 : List[A], ALL(P, APPEND(l1, l2)) == (ALL(P, l1) && ALL(P, l2))"),
      t151,
    ),
  )
}

///|
let all_append_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALL_APPEND")

///|
/// `ALL_APPEND`
pub fn all_append() -> @kernel.Thm {
  all_append_c.get()
}

///|
/// MEM_EL
fn step_81() -> Unit raise {
  let t152 = @simp.asm_simp_tac(@list.List([el(), hd(), @arith.lt_suc(), tl()]))
  let t153 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        list_induct_tac,
        @simp.rewrite_tac(
          @list.List([mem(), @bool.conjunct1(@arith.lt()), length()]),
        ),
      ),
      @nums.induct_tac,
    ),
    t152,
  )
  mem_el_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : List[A], ∀ n : Num, n < LENGTH(l) → MEM(EL(n, l), l)"),
      t153,
    ),
  )
}

///|
let mem_el_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MEM_EL")

///|
/// `MEM_EL`
pub fn mem_el() -> @kernel.Thm {
  mem_el_c.get()
}

///|
/// MEM_EXISTS_EL
fn step_82() -> Unit raise {
  let t158 = @simp.rewrite_tac(
    @list.List([@arith.lt_suc(), @arith.lt_0(), el(), hd(), tl()]),
  )
  let t157 = @simp.gen_rewrite_tac(
    fn(
      x154 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s155 = @equal.rand_conv(x154)
      fn(x156 : @kernel.Term) -> @kernel.Thm raise { s155(x156) }
    },
    @list.List([
      @meson.meson(
        @list.List([@nums.num_cases()]),
        @term_syntax.parse_term("(∃ i : Num, (P : (Num) -> Bool)(i)) == (P(0) || (∃ i : Num, P(SUC(i))))"),
      ),
    ]),
  )
  let t159 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          list_induct_tac,
          @simp.asm_rewrite_tac(
            @list.List([length(), el(), mem(), @bool.conjunct1(@arith.lt())]),
          ),
        ),
        @tactics.gen_tac,
      ),
      t157,
    ),
    t158,
  )
  mem_exists_el_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : List[A], ∀ x : A, MEM(x, l) == (∃ i : Num, i < LENGTH(l) && x == EL(i, l))"),
      t159,
    ),
  )
}

///|
let mem_exists_el_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MEM_EXISTS_EL")

///|
/// `MEM_EXISTS_EL`
pub fn mem_exists_el() -> @kernel.Thm {
  mem_exists_el_c.get()
}

///|
/// ALL_EL
fn step_83() -> Unit raise {
  let t160 = @meson.meson_tac(@list.List([]))
  let t161 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@equal.gsym(all_mem()), mem_exists_el()])),
    t160,
  )
  all_el_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ l : List[A], (∀ i : Num, i < LENGTH(l) → P(EL(i, l))) == ALL(P, l)"),
      t161,
    ),
  )
}

///|
let all_el_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALL_EL")

///|
/// `ALL_EL`
pub fn all_el() -> @kernel.Thm {
  all_el_c.get()
}

///|
/// ALL2_MAP2
fn step_84() -> Unit raise {
  let t162 = @simp.asm_rewrite_tac(@list.List([all2(), map()]))
  let t163 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
        list_induct_tac,
      ),
      list_induct_tac,
    ),
    t162,
  )
  all2_map2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, ∀ g : (C) -> D, ∀ l : List[A], ∀ m : List[C], ALL2((P : (B, D) -> Bool), MAP(f, l), MAP(g, m)) == ALL2((x : A) => (y : C) => P(f(x), g(y)), l, m)"),
      t163,
    ),
  )
}

///|
let all2_map2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALL2_MAP2")

///|
/// `ALL2_MAP2`
pub fn all2_map2() -> @kernel.Thm {
  all2_map2_c.get()
}

///|
/// AND_ALL2
fn step_85() -> Unit raise {
  let t166 = @simp.rewrite_tac(@list.List([@theorems.conj_aci()]))
  let t165 = @simp.asm_rewrite_tac(@list.List([all2()]))
  let t164 = @tactics.conv_tac(@equal.once_depth_conv(@equal.sym_conv))
  let t167 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
            t164,
          ),
          list_induct_tac,
        ),
        list_induct_tac,
      ),
      t165,
    ),
    t166,
  )
  and_all2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A, B) -> Bool, ∀ Q : (A, B) -> Bool, ∀ l : List[A], ∀ m : List[B], (ALL2(P, l, m) && ALL2(Q, l, m)) == ALL2((x : A) => (y : B) => P(x, y) && Q(x, y), l, m)"),
      t167,
    ),
  )
}

///|
let and_all2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AND_ALL2")

///|
/// `AND_ALL2`
pub fn and_all2() -> @kernel.Thm {
  and_all2_c.get()
}

///|
/// ALLPAIRS_SYM
fn step_86() -> Unit raise {
  let t170 = @meson.asm_meson_tac(@list.List([]))
  let t169 = @simp.asm_rewrite_tac(@list.List([allpairs(), all()]))
  let t168 = @simp.rewrite_tac(@list.List([allpairs()]))
  let t171 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.gen_tac, list_induct_tac),
          t168,
        ),
        list_induct_tac,
      ),
      t169,
    ),
    t170,
  )
  allpairs_sym_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A, B) -> Bool, ∀ l : List[A], ∀ m : List[B], ALLPAIRS(P, l, m) == ALLPAIRS((x : B) => (y : A) => P(y, x), m, l)"),
      t171,
    ),
  )
}

///|
let allpairs_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALLPAIRS_SYM")

///|
/// `ALLPAIRS_SYM`
pub fn allpairs_sym() -> @kernel.Thm {
  allpairs_sym_c.get()
}

///|
/// ALLPAIRS_MEM
fn step_87() -> Unit raise {
  let t173 = @meson.asm_meson_tac(@list.List([]))
  let t172 = @simp.rewrite_tac(
    @list.List([allpairs(), @equal.gsym(all_mem()), mem()]),
  )
  let t174 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, list_induct_tac),
      t172,
    ),
    t173,
  )
  allpairs_mem_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A, B) -> Bool, ∀ l : List[A], ∀ m : List[B], (∀ x : A, ∀ y : B, MEM(x, l) && MEM(y, m) → P(x, y)) == ALLPAIRS(P, l, m)"),
      t174,
    ),
  )
}

///|
let allpairs_mem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALLPAIRS_MEM")

///|
/// `ALLPAIRS_MEM`
pub fn allpairs_mem() -> @kernel.Thm {
  allpairs_mem_c.get()
}

///|
/// ALLPAIRS_MAP
fn step_88() -> Unit raise {
  let t175 = @meson.meson_tac(@list.List([]))
  let t176 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@equal.gsym(allpairs_mem()), mem_map()])),
    t175,
  )
  allpairs_map_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (B, D) -> Bool, ∀ f : (A) -> B, ∀ g : (C) -> D, ∀ l : List[A], ∀ m : List[C], ALLPAIRS(P, MAP(f, l), MAP(g, m)) == ALLPAIRS((x : A) => (y : C) => P(f(x), g(y)), l, m)"),
      t176,
    ),
  )
}

///|
let allpairs_map_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALLPAIRS_MAP")

///|
/// `ALLPAIRS_MAP`
pub fn allpairs_map() -> @kernel.Thm {
  allpairs_map_c.get()
}

///|
/// ALLPAIRS_EQ
fn step_89() -> Unit raise {
  let t178 = @meson.meson_tac(@list.List([]))
  let t177 = @equal.gsym(all_mem())
  let t179 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@equal.gsym(allpairs_mem()), t177])),
    t178,
  )
  allpairs_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : List[A], ∀ m : List[B], ∀ P : (A) -> Bool, ∀ Q : (B) -> Bool, ALL(P, l) && ALL(Q, m) && (∀ p : A, ∀ q : B, P(p) && Q(q) → (R : (A, B) -> Bool)(p, q) == (R' : (A, B) -> Bool)(p, q)) → ALLPAIRS(R, l, m) == ALLPAIRS(R', l, m)"),
      t179,
    ),
  )
}

///|
let allpairs_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALLPAIRS_EQ")

///|
/// `ALLPAIRS_EQ`
pub fn allpairs_eq() -> @kernel.Thm {
  allpairs_eq_c.get()
}

///|
/// ALL2_ALL
fn step_90() -> Unit raise {
  let t180 = @simp.asm_rewrite_tac(@list.List([all2(), all()]))
  let t181 = @tactics.then_tac(
    @tactics.then_tac(@tactics.gen_tac, list_induct_tac),
    t180,
  )
  all2_all_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A, A) -> Bool, ∀ l : List[A], ALL2(P, l, l) == ALL((x : A) => P(x, x), l)"),
      t181,
    ),
  )
}

///|
let all2_all_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALL2_ALL")

///|
/// `ALL2_ALL`
pub fn all2_all() -> @kernel.Thm {
  all2_all_c.get()
}

///|
/// APPEND_EQ_NIL
fn step_91() -> Unit raise {
  let t182 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(length_eq_nil()),
      length_append(),
      @arith.add_eq_0(),
    ]),
  )
  append_eq_nil_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : List[A], ∀ m : List[A], (APPEND(l, m) == NIL) == (l == NIL && m == NIL)"),
      t182,
    ),
  )
}

///|
let append_eq_nil_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("APPEND_EQ_NIL")

///|
/// `APPEND_EQ_NIL`
pub fn append_eq_nil() -> @kernel.Thm {
  append_eq_nil_c.get()
}

///|
/// APPEND_LCANCEL
fn step_92() -> Unit raise {
  let t183 = @tactics.then_tac(
    list_induct_tac,
    @simp.asm_rewrite_tac(@list.List([append(), cons_11()])),
  )
  append_lcancel_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l1 : List[A], ∀ l2 : List[A], ∀ l3 : List[A], (APPEND(l1, l2) == APPEND(l1, l3)) == (l2 == l3)"),
      t183,
    ),
  )
}

///|
let append_lcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("APPEND_LCANCEL")

///|
/// `APPEND_LCANCEL`
pub fn append_lcancel() -> @kernel.Thm {
  append_lcancel_c.get()
}

///|
/// APPEND_RCANCEL
fn step_93() -> Unit raise {
  let t184 = @simp.rewrite_tac(@list.List([reverse_append(), append_lcancel()]))
  let t185 = @tactics.then_tac(
    @simp.once_rewrite_tac(
      @list.List([
        @meson.meson(
          @list.List([reverse_reverse()]),
          @term_syntax.parse_term("((l : List[_]) == (l' : List[_])) == (REVERSE(l) == REVERSE(l'))"),
        ),
      ]),
    ),
    t184,
  )
  append_rcancel_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l1 : List[A], ∀ l2 : List[A], ∀ l3 : List[A], (APPEND(l1, l3) == APPEND(l2, l3)) == (l1 == l2)"),
      t185,
    ),
  )
}

///|
let append_rcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("APPEND_RCANCEL")

///|
/// `APPEND_RCANCEL`
pub fn append_rcancel() -> @kernel.Thm {
  append_rcancel_c.get()
}

///|
/// LENGTH_MAP2
fn step_94() -> Unit raise {
  let t186 = @simp.asm_simp_tac(
    @list.List([
      length(),
      not_cons_nil(),
      @nums.not_suc(),
      map2(),
      @nums.suc_inj(),
    ]),
  )
  let t187 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, list_induct_tac),
      list_induct_tac,
    ),
    t186,
  )
  length_map2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A, B) -> C, ∀ l : List[A], ∀ m : List[B], LENGTH(l) == LENGTH(m) → LENGTH(MAP2(f, l, m)) == LENGTH(m)"),
      t187,
    ),
  )
}

///|
let length_map2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LENGTH_MAP2")

///|
/// `LENGTH_MAP2`
pub fn length_map2() -> @kernel.Thm {
  length_map2_c.get()
}

///|
/// EL_MAP2
fn step_95() -> Unit raise {
  let t189 = @simp.asm_simp_tac(
    @list.List([length(), map2(), el(), hd(), tl(), @arith.lt_suc()]),
  )
  let t188 = @simp.asm_simp_tac(
    @list.List([length(), @bool.conjunct1(@arith.lt())]),
  )
  let t190 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.gen_tac, list_induct_tac),
          list_induct_tac,
        ),
        t188,
      ),
      @nums.induct_tac,
    ),
    t189,
  )
  el_map2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A, B) -> C, ∀ l : List[A], ∀ m : List[B], ∀ k : Num, k < LENGTH(l) && k < LENGTH(m) → EL(k, MAP2(f, l, m)) == f(EL(k, l), EL(k, m))"),
      t190,
    ),
  )
}

///|
let el_map2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EL_MAP2")

///|
/// `EL_MAP2`
pub fn el_map2() -> @kernel.Thm {
  el_map2_c.get()
}

///|
/// MAP_EQ_NIL
fn step_96() -> Unit raise {
  let t191 = @simp.rewrite_tac(@list.List([map(), not_cons_nil()]))
  let t192 = @tactics.then_tac(
    @tactics.then_tac(@tactics.gen_tac, list_induct_tac),
    t191,
  )
  map_eq_nil_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, ∀ l : List[A], (MAP(f, l) == NIL) == (l == NIL)"),
      t192,
    ),
  )
}

///|
let map_eq_nil_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MAP_EQ_NIL")

///|
/// `MAP_EQ_NIL`
pub fn map_eq_nil() -> @kernel.Thm {
  map_eq_nil_c.get()
}

///|
/// INJECTIVE_MAP
fn step_97() -> Unit raise {
  let t204 = @meson.asm_meson_tac(@list.List([]))
  let t203 = @simp.asm_simp_tac(@list.List([map(), not_cons_nil(), cons_11()]))
  let t205 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(list_induct_tac), t203),
    t204,
  )
  let t202 = @simp.asm_rewrite_tac(@list.List([map(), cons_11()]))
  let t197 = @term_syntax.parse_term("[(y : A)]")
  let t198 = @list.List([@term_syntax.parse_term("[(x : A)]"), t197])
  let t201 = @tactics.first_x_assum(fn(
    x200 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x194 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s195 = @tactics.mp_tac(x194)
      fn(
        x196 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s195(x196)
      }
    })(((x199 : @kernel.Thm) => @bool.specl(t198, x199))(x200))
  })
  let t193 = @term_syntax.parse_term("(y : A)")
  let t206 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.map_every(
            @tactics.x_gen_tac,
            @list.List([@term_syntax.parse_term("(x : A)"), t193]),
          ),
          @tactics.disch_tac,
        ),
        t201,
      ),
      t202,
    ),
    t205,
  ])
  let t207 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac),
      @tactics.disch_tac,
    ),
    t206,
  )
  injective_map_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, (∀ l : List[A], ∀ m : List[A], MAP(f, l) == MAP(f, m) → l == m) == (∀ x : A, ∀ y : A, f(x) == f(y) → x == y)"),
      t207,
    ),
  )
}

///|
let injective_map_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INJECTIVE_MAP")

///|
/// `INJECTIVE_MAP`
pub fn injective_map() -> @kernel.Thm {
  injective_map_c.get()
}

///|
/// SURJECTIVE_MAP
fn step_98() -> Unit raise {
  let t219 = @meson.asm_meson_tac(@list.List([map()]))
  let t217 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t216 = @simp.rewrite_tac(
    @list.List([map(), cons_11(), not_cons_nil(), map_eq_nil()]),
  )
  let t215 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t211 = @term_syntax.parse_term("[(y : B)]")
  let t214 = @tactics.first_x_assum(fn(
    x213 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x208 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s209 = @tactics.mp_tac(x208)
      fn(
        x210 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s209(x210)
      }
    })(((x212 : @kernel.Thm) => @bool.spec(t211, x212))(x213))
  })
  let t218 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(y : B)")), t214),
          t215,
        ),
        list_induct_tac,
      ),
      t216,
    ),
    t217,
  ])
  let t220 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac),
        @tactics.disch_tac,
      ),
      t218,
    ),
    t219,
  )
  surjective_map_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, (∀ m : List[B], ∃ l : List[A], MAP(f, l) == m) == (∀ y : B, ∃ x : A, f(x) == y)"),
      t220,
    ),
  )
}

///|
let surjective_map_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SURJECTIVE_MAP")

///|
/// `SURJECTIVE_MAP`
pub fn surjective_map() -> @kernel.Thm {
  surjective_map_c.get()
}

///|
/// MAP_ID
fn step_99() -> Unit raise {
  let t221 = @tactics.then_tac(
    list_induct_tac,
    @simp.asm_rewrite_tac(@list.List([map()])),
  )
  map_id_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ l : List[A], MAP((x : A) => x, l) == l"), t221),
  )
}

///|
let map_id_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MAP_ID")

///|
/// `MAP_ID`
pub fn map_id() -> @kernel.Thm {
  map_id_c.get()
}

///|
/// MAP_I
fn step_100() -> Unit raise {
  let t222 = @simp.rewrite_tac(
    @list.List([@class.fun_eq_thm(), @trivia.i_def(), map_id()]),
  )
  map_i_c.set(@tactics.prove(@term_syntax.parse_term("(MAP : ((A) -> A, List[A]) -> List[A])((I : (A) -> A)) == (I : (List[A]) -> List[A])"), t222))
}

///|
let map_i_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MAP_I")

///|
/// `MAP_I`
pub fn map_i() -> @kernel.Thm {
  map_i_c.get()
}

///|
/// BUTLAST_CLAUSES
fn step_101() -> Unit raise {
  let t223 = @simp.rewrite_tac(@list.List([butlast(), not_cons_nil()]))
  butlast_clauses_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(BUTLAST : (List[A]) -> List[A])((NIL : List[A])) == (NIL : List[A]) && (∀ a : A, (BUTLAST : (List[A]) -> List[A])([a]) == (NIL : List[A])) && (∀ a : A, ∀ h : A, ∀ t : List[A], (BUTLAST : (List[A]) -> List[A])((CONS : (A, List[A]) -> List[A])(a, (CONS : (A, List[A]) -> List[A])(h, t))) == (CONS : (A, List[A]) -> List[A])(a, (BUTLAST : (List[A]) -> List[A])((CONS : (A, List[A]) -> List[A])(h, t))))"),
      t223,
    ),
  )
}

///|
let butlast_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "BUTLAST_CLAUSES",
)

///|
/// `BUTLAST_CLAUSES`
pub fn butlast_clauses() -> @kernel.Thm {
  butlast_clauses_c.get()
}

///|
/// BUTLAST_APPEND
fn step_102() -> Unit raise {
  let t224 = @simp.asm_simp_tac(
    @list.List([append(), butlast(), append_eq_nil()]),
  )
  let t225 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.simp_tac(
        @list.List([
          @class.cond_rand(),
          append_nil(),
          @meson.meson(
            @list.List([]),
            @term_syntax.parse_term("(if (p : Bool) { true } else { (q : Bool) }) == (!p → q)"),
          ),
        ]),
      ),
      list_induct_tac,
    ),
    t224,
  )
  butlast_append_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : List[A], ∀ m : List[A], BUTLAST(APPEND(l, m)) == (if m == NIL { BUTLAST(l) } else { APPEND(l, BUTLAST(m)) })"),
      t225,
    ),
  )
}

///|
let butlast_append_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BUTLAST_APPEND")

///|
/// `BUTLAST_APPEND`
pub fn butlast_append() -> @kernel.Thm {
  butlast_append_c.get()
}

///|
/// APPEND_BUTLAST_LAST
fn step_103() -> Unit raise {
  let t226 = @simp.asm_simp_tac(@list.List([append()]))
  let t227 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        list_induct_tac,
        @simp.rewrite_tac(@list.List([last(), butlast(), not_cons_nil()])),
      ),
      @class.cond_cases_tac,
    ),
    t226,
  )
  append_butlast_last_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : List[A], !(l == NIL) → APPEND(BUTLAST(l), [LAST(l)]) == l"),
      t227,
    ),
  )
}

///|
let append_butlast_last_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "APPEND_BUTLAST_LAST",
)

///|
/// `APPEND_BUTLAST_LAST`
pub fn append_butlast_last() -> @kernel.Thm {
  append_butlast_last_c.get()
}

///|
/// LAST_APPEND
fn step_104() -> Unit raise {
  let t228 = @meson.meson_tac(@list.List([]))
  let t229 = @tactics.then_tac(
    @tactics.then_tac(
      list_induct_tac,
      @simp.asm_rewrite_tac(@list.List([append(), last(), append_eq_nil()])),
    ),
    t228,
  )
  last_append_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : List[A], ∀ q : List[A], LAST(APPEND(p, q)) == (if q == NIL { LAST(p) } else { LAST(q) })"),
      t229,
    ),
  )
}

///|
let last_append_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LAST_APPEND")

///|
/// `LAST_APPEND`
pub fn last_append() -> @kernel.Thm {
  last_append_c.get()
}

///|
/// LENGTH_TL
fn step_105() -> Unit raise {
  let t230 = @tactics.then_tac(
    list_induct_tac,
    @simp.rewrite_tac(
      @list.List([length(), tl(), @calc_num.arith(), @arith.suc_sub1()]),
    ),
  )
  length_tl_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : List[A], !(l == NIL) → LENGTH(TL(l)) == LENGTH(l) - 1"),
      t230,
    ),
  )
}

///|
let length_tl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LENGTH_TL")

///|
/// `LENGTH_TL`
pub fn length_tl() -> @kernel.Thm {
  length_tl_c.get()
}

///|
/// LAST_REVERSE
fn step_106() -> Unit raise {
  let t231 = @tactics.then_tac(
    list_induct_tac,
    @simp.rewrite_tac(
      @list.List([hd(), reverse(), last(), last_append(), not_cons_nil()]),
    ),
  )
  last_reverse_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : List[A], !(l == NIL) → LAST(REVERSE(l)) == HD(l)"),
      t231,
    ),
  )
}

///|
let last_reverse_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LAST_REVERSE")

///|
/// `LAST_REVERSE`
pub fn last_reverse() -> @kernel.Thm {
  last_reverse_c.get()
}

///|
/// HD_REVERSE
fn step_107() -> Unit raise {
  let t232 = @meson.meson_tac(
    @list.List([last_reverse(), reverse_reverse(), reverse_eq_empty()]),
  )
  hd_reverse_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : List[A], !(l == NIL) → HD(REVERSE(l)) == LAST(l)"),
      t232,
    ),
  )
}

///|
let hd_reverse_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HD_REVERSE")

///|
/// `HD_REVERSE`
pub fn hd_reverse() -> @kernel.Thm {
  hd_reverse_c.get()
}

///|
/// EL_APPEND
fn step_108() -> Unit raise {
  let t234 = @simp.asm_rewrite_tac(
    @list.List([tl(), @arith.lt_suc(), @arith.sub_suc()]),
  )
  let t233 = @simp.rewrite_tac(
    @list.List([
      hd(),
      append(),
      length(),
      @arith.sub_0(),
      el(),
      @arith.lt_0(),
      @bool.conjunct1(@arith.lt()),
    ]),
  )
  let t235 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @nums.induct_tac,
          @simp.rewrite_tac(@list.List([el()])),
        ),
        list_induct_tac,
      ),
      t233,
    ),
    t234,
  )
  el_append_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ k : Num, ∀ l : List[A], ∀ m : List[A], EL(k, APPEND(l, m)) == (if k < LENGTH(l) { EL(k, l) } else { EL(k - LENGTH(l), m) })"),
      t235,
    ),
  )
}

///|
let el_append_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EL_APPEND")

///|
/// `EL_APPEND`
pub fn el_append() -> @kernel.Thm {
  el_append_c.get()
}

///|
/// EL_TL
fn step_109() -> Unit raise {
  let t236 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.add1()), el()]))
  el_tl_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Num, EL(n, TL((l : List[A]))) == EL(n + 1, l)"), t236),
  )
}

///|
let el_tl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EL_TL")

///|
/// `EL_TL`
pub fn el_tl() -> @kernel.Thm {
  el_tl_c.get()
}

///|
/// EL_CONS
fn step_110() -> Unit raise {
  let t237 = @tactics.then_tac(
    @nums.induct_tac,
    @simp.rewrite_tac(
      @list.List([el(), hd(), tl(), @nums.not_suc(), @arith.suc_sub1()]),
    ),
  )
  el_cons_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ n : Num, ∀ h : A, ∀ t : List[A], EL(n, CONS(h, t)) == (if n == 0 { h } else { EL(n - 1, t) })"),
      t237,
    ),
  )
}

///|
let el_cons_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EL_CONS")

///|
/// `EL_CONS`
pub fn el_cons() -> @kernel.Thm {
  el_cons_c.get()
}

///|
/// LAST_EL
fn step_111() -> Unit raise {
  let t238 = @simp.asm_simp_tac(
    @list.List([length(), el(), hd(), el_cons(), length_eq_nil()]),
  )
  let t239 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          list_induct_tac,
          @simp.rewrite_tac(@list.List([last(), length(), @arith.suc_sub1()])),
        ),
        @tactics.disch_tac,
      ),
      @class.cond_cases_tac,
    ),
    t238,
  )
  last_el_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : List[A], !(l == NIL) → LAST(l) == EL(LENGTH(l) - 1, l)"),
      t239,
    ),
  )
}

///|
let last_el_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LAST_EL")

///|
/// `LAST_EL`
pub fn last_el() -> @kernel.Thm {
  last_el_c.get()
}

///|
/// HD_APPEND
fn step_112() -> Unit raise {
  let t240 = @tactics.then_tac(
    list_induct_tac,
    @simp.rewrite_tac(@list.List([hd(), append(), not_cons_nil()])),
  )
  hd_append_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : List[A], ∀ m : List[A], HD(APPEND(l, m)) == (if l == NIL { HD(m) } else { HD(l) })"),
      t240,
    ),
  )
}

///|
let hd_append_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HD_APPEND")

///|
/// `HD_APPEND`
pub fn hd_append() -> @kernel.Thm {
  hd_append_c.get()
}

///|
/// CONS_HD_TL
fn step_113() -> Unit raise {
  let t241 = @tactics.then_tac(
    list_induct_tac,
    @simp.rewrite_tac(@list.List([not_cons_nil(), hd(), tl()])),
  )
  cons_hd_tl_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : List[A], !(l == NIL) → l == CONS(HD(l), TL(l))"),
      t241,
    ),
  )
}

///|
let cons_hd_tl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONS_HD_TL")

///|
/// `CONS_HD_TL`
pub fn cons_hd_tl() -> @kernel.Thm {
  cons_hd_tl_c.get()
}

///|
/// EL_MAP
fn step_114() -> Unit raise {
  let t242 = @simp.asm_rewrite_tac(
    @list.List([
      length(),
      @bool.conjunct1(@arith.lt()),
      @arith.lt_0(),
      el(),
      hd(),
      tl(),
      map(),
      @arith.lt_suc(),
    ]),
  )
  let t243 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @nums.induct_tac),
      list_induct_tac,
    ),
    t242,
  )
  el_map_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, ∀ n : Num, ∀ l : List[A], n < LENGTH(l) → EL(n, MAP(f, l)) == f(EL(n, l))"),
      t243,
    ),
  )
}

///|
let el_map_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EL_MAP")

///|
/// `EL_MAP`
pub fn el_map() -> @kernel.Thm {
  el_map_c.get()
}

///|
/// MAP_REVERSE
fn step_115() -> Unit raise {
  let t244 = @simp.asm_rewrite_tac(@list.List([map(), reverse(), map_append()]))
  let t245 = @tactics.then_tac(
    @tactics.then_tac(@tactics.gen_tac, list_induct_tac),
    t244,
  )
  map_reverse_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, ∀ l : List[A], REVERSE(MAP(f, l)) == MAP(f, REVERSE(l))"),
      t245,
    ),
  )
}

///|
let map_reverse_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MAP_REVERSE")

///|
/// `MAP_REVERSE`
pub fn map_reverse() -> @kernel.Thm {
  map_reverse_c.get()
}

///|
/// ALL_FILTER
fn step_116() -> Unit raise {
  let t247 = @simp.asm_rewrite_tac(@list.List([all()]))
  let t246 = @simp.rewrite_tac(@list.List([all(), filter()]))
  let t248 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
          list_induct_tac,
        ),
        t246,
      ),
      @class.cond_cases_tac,
    ),
    t247,
  )
  all_filter_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ Q : (A) -> Bool, ∀ l : List[A], ALL(P, FILTER(Q, l)) == ALL((x : A) => Q(x) → P(x), l)"),
      t248,
    ),
  )
}

///|
let all_filter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALL_FILTER")

///|
/// `ALL_FILTER`
pub fn all_filter() -> @kernel.Thm {
  all_filter_c.get()
}

///|
/// APPEND_SING
fn step_117() -> Unit raise {
  let t249 = @simp.rewrite_tac(@list.List([append()]))
  append_sing_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ h : A, ∀ t : List[A], APPEND([h], t) == CONS(h, t)"),
      t249,
    ),
  )
}

///|
let append_sing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("APPEND_SING")

///|
/// `APPEND_SING`
pub fn append_sing() -> @kernel.Thm {
  append_sing_c.get()
}

///|
/// MEM_APPEND_DECOMPOSE_LEFT
fn step_118() -> Unit raise {
  let t257 = @meson.asm_meson_tac(@list.List([mem(), append()]))
  let t256 = @class.asm_cases_tac(@term_syntax.parse_term("(x : A) == (y : A)"))
  let t254 = @term_syntax.parse_term("(l : List[A])")
  let t255 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(y : A)"), t254]),
  )
  let t253 = @simp.rewrite_tac(@list.List([mem()]))
  let t252 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t251 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : A)"))
  let t250 = @simp.simp_tac(
    @list.List([@theorems.left_imp_exists_thm(), mem_append(), mem()]),
  )
  let t258 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @simp.rewrite_tac(
                  @list.List([
                    @class.taut(
                      @term_syntax.parse_term("((p : Bool) == (q : Bool)) == ((p → q) && (q → p))"),
                    ),
                  ]),
                ),
                t250,
              ),
              t251,
            ),
            t252,
          ),
          t253,
        ),
        t255,
      ),
      t256,
    ),
    t257,
  )
  mem_append_decompose_left_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : A, ∀ l : List[A], MEM(x, l) == (∃ l1 : List[A], ∃ l2 : List[A], !MEM(x, l1) && l == APPEND(l1, CONS(x, l2)))"),
      t258,
    ),
  )
}

///|
let mem_append_decompose_left_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MEM_APPEND_DECOMPOSE_LEFT",
)

///|
/// `MEM_APPEND_DECOMPOSE_LEFT`
pub fn mem_append_decompose_left() -> @kernel.Thm {
  mem_append_decompose_left_c.get()
}

///|
/// MEM_APPEND_DECOMPOSE
fn step_119() -> Unit raise {
  let t261 = @meson.meson_tac(@list.List([]))
  let t260 = @simp.once_rewrite_tac(@list.List([mem_append_decompose_left()]))
  let t259 = @simp.simp_tac(
    @list.List([@theorems.left_imp_exists_thm(), mem_append(), mem()]),
  )
  let t262 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([
            @class.taut(
              @term_syntax.parse_term("((p : Bool) == (q : Bool)) == ((p → q) && (q → p))"),
            ),
          ]),
        ),
        t259,
      ),
      t260,
    ),
    t261,
  )
  mem_append_decompose_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : A, ∀ l : List[A], MEM(x, l) == (∃ l1 : List[A], ∃ l2 : List[A], l == APPEND(l1, CONS(x, l2)))"),
      t262,
    ),
  )
}

///|
let mem_append_decompose_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MEM_APPEND_DECOMPOSE",
)

///|
/// `MEM_APPEND_DECOMPOSE`
pub fn mem_append_decompose() -> @kernel.Thm {
  mem_append_decompose_c.get()
}

///|
/// PAIRWISE_APPEND
fn step_120() -> Unit raise {
  let t264 = @meson.meson_tac(@list.List([]))
  let t263 = @simp.rewrite_tac(
    @list.List([
      append(),
      pairwise(),
      mem(),
      all_append(),
      @equal.gsym(all_mem()),
    ]),
  )
  let t265 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.gen_tac,
        @tactics.match_mp_tac(@ind_types.list_induct()),
      ),
      t263,
    ),
    t264,
  )
  pairwise_append_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ l : List[A], ∀ m : List[A], PAIRWISE(R, APPEND(l, m)) == (PAIRWISE(R, l) && PAIRWISE(R, m) && (∀ x : A, ∀ y : A, MEM(x, l) && MEM(y, m) → R(x, y)))"),
      t265,
    ),
  )
}

///|
let pairwise_append_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PAIRWISE_APPEND",
)

///|
/// `PAIRWISE_APPEND`
pub fn pairwise_append() -> @kernel.Thm {
  pairwise_append_c.get()
}

///|
/// PAIRWISE_MAP
fn step_121() -> Unit raise {
  let t266 = @simp.asm_rewrite_tac(
    @list.List([pairwise(), map(), all_map(), @trivia.o_def()]),
  )
  let t267 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
      list_induct_tac,
    ),
    t266,
  )
  pairwise_map_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (B, B) -> Bool, ∀ f : (A) -> B, ∀ l : List[A], PAIRWISE(R, MAP(f, l)) == PAIRWISE((x : A) => (y : A) => R(f(x), f(y)), l)"),
      t267,
    ),
  )
}

///|
let pairwise_map_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PAIRWISE_MAP")

///|
/// `PAIRWISE_MAP`
pub fn pairwise_map() -> @kernel.Thm {
  pairwise_map_c.get()
}

///|
/// PAIRWISE_IMPLIES
fn step_122() -> Unit raise {
  let t270 = @meson.meson_tac(@list.List([]))
  let t269 = @simp.rewrite_tac(
    @list.List([pairwise(), @equal.gsym(all_mem()), mem()]),
  )
  let t268 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t271 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
        t268,
      ),
      t269,
    ),
    t270,
  )
  pairwise_implies_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ R' : (A, A) -> Bool, ∀ l : List[A], PAIRWISE(R, l) && (∀ x : A, ∀ y : A, MEM(x, l) && MEM(y, l) && R(x, y) → R'(x, y)) → PAIRWISE(R', l)"),
      t271,
    ),
  )
}

///|
let pairwise_implies_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PAIRWISE_IMPLIES",
)

///|
/// `PAIRWISE_IMPLIES`
pub fn pairwise_implies() -> @kernel.Thm {
  pairwise_implies_c.get()
}

///|
/// PAIRWISE_TRANSITIVE
fn step_123() -> Unit raise {
  let t275 = @meson.asm_meson_tac(@list.List([]))
  let t274 = @tactics.match_mp_tac(
    @simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(all_imp()),
  )
  let t272 = @class.taut(
    @term_syntax.parse_term("(((p : Bool) && (q : Bool) && (r : Bool) && (s : Bool)) == (p && r && s)) == (p && s → r → q)"),
  )
  let t273 = @simp.rewrite_tac(
    @list.List([pairwise(), all(), @equal.gsym(@theorems.conj_assoc()), t272]),
  )
  let t276 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t273),
        @tactics.strip_tac,
      ),
      t274,
    ),
    t275,
  )
  pairwise_transitive_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ x : A, ∀ y : A, ∀ l : List[A], (∀ x : A, ∀ y : A, ∀ z : A, R(x, y) && R(y, z) → R(x, z)) → PAIRWISE(R, CONS(x, CONS(y, l))) == (R(x, y) && PAIRWISE(R, CONS(y, l)))"),
      t276,
    ),
  )
}

///|
let pairwise_transitive_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "PAIRWISE_TRANSITIVE",
)

///|
/// `PAIRWISE_TRANSITIVE`
pub fn pairwise_transitive() -> @kernel.Thm {
  pairwise_transitive_c.get()
}

///|
/// LENGTH_LIST_OF_SEQ
fn step_124() -> Unit raise {
  let t277 = @simp.asm_rewrite_tac(
    @list.List([list_of_seq(), length(), length_append(), @arith.add_clauses()]),
  )
  let t278 = @tactics.then_tac(
    @tactics.then_tac(@tactics.gen_tac, @nums.induct_tac),
    t277,
  )
  length_list_of_seq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (Num) -> A, ∀ n : Num, LENGTH(list_of_seq(s, n)) == n"),
      t278,
    ),
  )
}

///|
let length_list_of_seq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "LENGTH_LIST_OF_SEQ",
)

///|
/// `LENGTH_LIST_OF_SEQ`
pub fn length_list_of_seq() -> @kernel.Thm {
  length_list_of_seq_c.get()
}

///|
/// EL_LIST_OF_SEQ
fn step_125() -> Unit raise {
  let t281 = @simp.asm_simp_tac(
    @list.List([@arith.sub_refl(), el(), hd(), @arith.lt_refl()]),
  )
  let t280 = @tactics.repeat_tac(@tactics.strip_tac)
  let t279 = @simp.rewrite_tac(
    @list.List([list_of_seq(), @arith.lt(), el_append(), length_list_of_seq()]),
  )
  let t282 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.gen_tac,
            @simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()])),
          ),
          @nums.induct_tac,
        ),
        t279,
      ),
      t280,
    ),
    t281,
  )
  el_list_of_seq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (Num) -> A, ∀ m : Num, ∀ n : Num, m < n → EL(m, list_of_seq(s, n)) == s(m)"),
      t282,
    ),
  )
}

///|
let el_list_of_seq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EL_LIST_OF_SEQ")

///|
/// `EL_LIST_OF_SEQ`
pub fn el_list_of_seq() -> @kernel.Thm {
  el_list_of_seq_c.get()
}

///|
/// LIST_OF_SEQ_EQ_NIL
fn step_126() -> Unit raise {
  let t283 = @simp.rewrite_tac(
    @list.List([@equal.gsym(length_eq_nil()), length_list_of_seq(), length()]),
  )
  list_of_seq_eq_nil_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (Num) -> A, ∀ n : Num, (list_of_seq(s, n) == NIL) == (n == 0)"),
      t283,
    ),
  )
}

///|
let list_of_seq_eq_nil_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "LIST_OF_SEQ_EQ_NIL",
)

///|
/// `LIST_OF_SEQ_EQ_NIL`
pub fn list_of_seq_eq_nil() -> @kernel.Thm {
  list_of_seq_eq_nil_c.get()
}

///|
/// LIST_OF_SEQ_EQ_SELF
fn step_127() -> Unit raise {
  let t284 = @simp.simp_tac(
    @list.List([list_eq(), length_list_of_seq(), el_list_of_seq()]),
  )
  list_of_seq_eq_self_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : List[A], list_of_seq((i : Num) => EL(i, l), LENGTH(l)) == l"),
      t284,
    ),
  )
}

///|
let list_of_seq_eq_self_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "LIST_OF_SEQ_EQ_SELF",
)

///|
/// `LIST_OF_SEQ_EQ_SELF`
pub fn list_of_seq_eq_self() -> @kernel.Thm {
  list_of_seq_eq_self_c.get()
}

///|
/// LENGTH_EQ_LIST_OF_SEQ
fn step_128() -> Unit raise {
  let t285 = @meson.meson_tac(
    @list.List([list_of_seq_eq_self(), length_list_of_seq()]),
  )
  length_eq_list_of_seq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ l : List[A], ∀ n : Num, (LENGTH(l) == n) == (l == list_of_seq((i : Num) => EL(i, l), n))"),
      t285,
    ),
  )
}

///|
let length_eq_list_of_seq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "LENGTH_EQ_LIST_OF_SEQ",
)

///|
/// `LENGTH_EQ_LIST_OF_SEQ`
pub fn length_eq_list_of_seq() -> @kernel.Thm {
  length_eq_list_of_seq_c.get()
}

///|
/// MAP_LIST_OF_SEQ
fn step_129() -> Unit raise {
  let t286 = @simp.asm_rewrite_tac(
    @list.List([map(), list_of_seq(), map_append(), @trivia.o_thm()]),
  )
  let t287 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac),
      @nums.induct_tac,
    ),
    t286,
  )
  map_list_of_seq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (Num) -> A, ∀ g : (A) -> B, ∀ n : Num, MAP(g, list_of_seq(f, n)) == list_of_seq(o(g, f), n)"),
      t287,
    ),
  )
}

///|
let map_list_of_seq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "MAP_LIST_OF_SEQ",
)

///|
/// `MAP_LIST_OF_SEQ`
pub fn map_list_of_seq() -> @kernel.Thm {
  map_list_of_seq_c.get()
}

///|
/// LIST_OF_SEQ
fn step_130() -> Unit raise {
  let t291 = @simp.asm_simp_tac(
    @list.List([
      @arith.lt_suc(),
      @arith.suc_sub1(),
      el_list_of_seq(),
      @trivia.o_thm(),
    ]),
  )
  let t290 = @simp.asm_simp_tac(@list.List([@nums.not_suc(), el_list_of_seq()]))
  let t289 = @simp.rewrite_tac(
    @list.List([list_eq(), length_list_of_seq(), length(), el_cons()]),
  )
  let t288 = @tactics.repeat_tac(@tactics.gen_tac)
  let t292 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(@list.List([@bool.conjunct1(list_of_seq())])),
            t288,
          ),
          t289,
        ),
        @nums.induct_tac,
      ),
      t290,
    ),
    t291,
  )
  list_of_seq_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ f : (Num) -> A, list_of_seq(f, 0) == NIL) && (∀ f : (Num) -> A, ∀ n : Num, list_of_seq(f, SUC(n)) == CONS(f(0), list_of_seq(o(f, SUC), n)))"),
      t292,
    ),
  )
}

///|
let list_of_seq_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIST_OF_SEQ")

///|
/// `LIST_OF_SEQ`
pub fn list_of_seq_v1() -> @kernel.Thm {
  list_of_seq_v1_c.get()
}

///|
/// `mk_cons`
pub fn mk_cons(x293 : @kernel.Term, x294 : @kernel.Term) -> @kernel.Term raise {
  let h = x293
  let t = x294
  try {
    let cons = @kernel.mk_const(
      "CONS",
      @list.List([(@kernel.type_of(h), @kernel.aty)]),
    )
    @kernel.mk_comb(@kernel.mk_comb(cons, h), t)
  } catch {
    Failure(_) => raise Failure("mk_cons")
    e => raise e
  }
}

///|
/// `mk_list`
pub fn mk_list(
  x295 : @list.List[@kernel.Term],
  x296 : @kernel.HolType,
) -> @kernel.Term raise {
  let (tms, ty) = (x295, x296)
  try {
    let nil = @kernel.mk_const("NIL", @list.List([(ty, @kernel.aty)]))
    if tms == @list.List([]) {
      nil
    } else {
      let cons = @kernel.mk_const("CONS", @list.List([(ty, @kernel.aty)]))
      @lib.itlist(
        (x297 : @kernel.Term, x298 : @kernel.Term) => {
          @basics.mk_binop(cons, x297, x298)
        },
        tms,
        nil,
      )
    }
  } catch {
    Failure(_) => raise Failure("mk_list")
    e => raise e
  }
}

///|
/// `mk_flist`
pub fn mk_flist(x299 : @list.List[@kernel.Term]) -> @kernel.Term raise {
  let tms = x299
  mk_list(tms, @kernel.type_of(@lib.hd(tms))) catch {
    Failure(_) => raise Failure("mk_flist")
    e => raise e
  }
}

///|
/// MONO_ALL
fn step_131() -> Unit raise {
  let t302 = @meson.asm_meson_tac(@list.List([]))
  let t301 = @simp.asm_rewrite_tac(@list.List([all()]))
  let t300 = @term_syntax.parse_term("(l : List[A])")
  let t303 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.disch_tac,
          @tactics.spec_tac(@term_syntax.parse_term("(l : List[A])"), t300),
        ),
        list_induct_tac,
      ),
      t301,
    ),
    t302,
  )
  mono_all_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ x : A, (P : (A) -> Bool)(x) → (Q : (A) -> Bool)(x)) → ALL(P, (l : List[A])) → ALL(Q, l)"),
      t303,
    ),
  )
}

///|
let mono_all_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MONO_ALL")

///|
/// `MONO_ALL`
pub fn mono_all() -> @kernel.Thm {
  mono_all_c.get()
}

///|
/// MONO_ALL2
fn step_132() -> Unit raise {
  let t309 = @meson.asm_meson_tac(@list.List([]))
  let t308 = @simp.rewrite_tac(@list.List([]))
  let t307 = @simp.rewrite_tac(@list.List([all2_def()]))
  let t305 = @term_syntax.parse_term("(l : List[A])")
  let t306 = @tactics.spec_tac(@term_syntax.parse_term("(l : List[A])"), t305)
  let t304 = @term_syntax.parse_term("(l' : List[B])")
  let t310 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.disch_tac,
                  @tactics.spec_tac(@term_syntax.parse_term("(l' : List[B])"), t304),
                ),
                t306,
              ),
              list_induct_tac,
            ),
            t307,
          ),
          @tactics.gen_tac,
        ),
        @class.cond_cases_tac,
      ),
      t308,
    ),
    t309,
  )
  mono_all2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ x : A, ∀ y : B, (P : (A, B) -> Bool)(x, y) → (Q : (A, B) -> Bool)(x, y)) → ALL2(P, (l : List[A]), (l' : List[B])) → ALL2(Q, l, l')"),
      t310,
    ),
  )
}

///|
let mono_all2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MONO_ALL2")

///|
/// `MONO_ALL2`
pub fn mono_all2() -> @kernel.Thm {
  mono_all2_c.get()
}

///|
/// lists.ml:734
fn step_133() -> Unit raise {
  @ind_defs.monotonicity_theorems().val = @list.List([mono_all(), mono_all2()]).concat(
    @ind_defs.monotonicity_theorems().val,
  )
  ()
}

///|
/// `LIST_CONV`
pub fn list_conv(
  x311 : (@kernel.Term) -> @kernel.Thm raise,
  x312 : @kernel.Term,
) -> @kernel.Thm raise {
  let conv = x311
  let tm = x312
  if @basics.is_cons(tm) {
    @equal.comb2_conv(@equal.rand_conv(conv), (x313 : @kernel.Term) => {
      list_conv(conv, x313)
    })(tm)
  } else if @kernel.dest_const(tm).0 == "NIL" {
    @kernel.refl(tm)
  } else {
    raise Failure("LIST_CONV")
  }
}

///|
/// LENGTH_CONV
fn step_134() -> Unit raise {
  let t314 = @simp.rewrite_tac(@list.List([length(), @arith.add_clauses()]))
  let pthc = @tactics.prove(
    @term_syntax.parse_term("(LENGTH : (List[A]) -> Num)((t : List[A])) == (LENGTH : (List[A]) -> Num)(t) + 0 && (LENGTH : (List[A]) -> Num)((NIL : List[A])) + (n : Num) == n && (LENGTH : (List[A]) -> Num)((CONS : (A, List[A]) -> List[A])((h : A), t)) + n == (LENGTH : (List[A]) -> Num)(t) + SUC(n)"),
    t314,
  )
  let pths = @bool.conjuncts_rule(pthc)
  let avars = @lib.sort(
    fn(x317 : @kernel.Term, x318 : @kernel.Term) -> Bool raise {
      let s319 = (fn(
        x315 : @kernel.Term,
      ) -> ((@kernel.Term) -> Bool raise) raise {
        fn(x316 : @kernel.Term) -> Bool raise { @lib.compare(x315, x316) < 0 }
      })(x317)
      s319(x318)
    },
    @kernel.frees(@kernel.concl(pthc)),
  )
  length_conv_c.set(fn(x320 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x320
    match tm {
      @kernel.Term::Comb(@kernel.Term::Const("LENGTH", _), ltm) if @basics.is_list(
          ltm,
        ) => {
        let tyin = @list.List([
          (@lib.hd(@kernel.dest_type(@kernel.type_of(ltm)).1), @kernel.aty),
        ])
        match
          @lib.map(
            fn(x322 : @kernel.Term) -> @kernel.Term raise {
              ((x321 : @kernel.Term) => @kernel.inst(tyin, x321))(x322)
            },
            avars,
          ) {
          More(h_tm, tail=More(n_tm, tail=More(t_tm, tail=Empty))) =>
            match
              @lib.map(
                fn(x324 : @kernel.Thm) -> @kernel.Thm raise {
                  ((x323 : @kernel.Thm) => @kernel.inst_type(tyin, x323))(x324)
                },
                pths,
              ) {
              More(
                pth_init,
                tail=More(pth_base, tail=More(pth_step, tail=Empty))
              ) => {
                fn conv(x325 : @kernel.Thm) -> @kernel.Thm raise {
                  let th = x325
                  let (altm, ntm) = @kernel.dest_comb(
                    @kernel.rand(@kernel.concl(th)),
                  )
                  let ltm_1 = @kernel.rand(@kernel.rand(altm))
                  if @basics.is_cons(ltm_1) {
                    let (htm, ttm) = @basics.dest_cons(ltm_1)
                    let th1 = @kernel.inst_rule(
                      @list.List([(htm, h_tm), (ttm, t_tm), (ntm, n_tm)]),
                      pth_step,
                    )
                    let (ftm, stm) = @kernel.dest_comb(
                      @kernel.rand(@kernel.concl(th1)),
                    )
                    let th2 = @kernel.trans(
                      th1,
                      @equal.ap_term(ftm, @calc_num.num_suc_conv(stm)),
                    )
                    conv(@kernel.trans(th, th2))
                  } else {
                    @kernel.trans(
                      th,
                      @kernel.inst_rule(@list.List([(ntm, n_tm)]), pth_base),
                    )
                  }
                }
                conv(
                  @kernel.inst_rule(
                    @list.List([(@kernel.rand(tm), t_tm)]),
                    pth_init,
                  ),
                ) catch {
                  Failure(_) => raise Failure("LENGTH_CONV")
                  e => raise e
                }
              }
              _ => raise @lib.MatchFailure("tscript.ml:764")
            }
          _ => raise @lib.MatchFailure("tscript.ml:763")
        }
      }
      _ => raise Failure("LENGTH_CONV")
    }
  })
}

///|
let length_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("LENGTH_CONV")

///|
/// `LENGTH_CONV`
pub fn length_conv(x : @kernel.Term) -> @kernel.Thm raise {
  length_conv_c.get()(x)
}

///|
/// EL_CONV
fn step_135() -> Unit raise {
  let t326 = @simp.simp_tac(@list.List([el(), hd(), tl()]))
  let pthc = @tactics.prove(
    @term_syntax.parse_term("EL(0, CONS((h : A), (t : List[A]))) == h && ((n : Num) == SUC((m : Num)) → EL(n, CONS(h, t)) == EL(m, t))"),
    t326,
  )
  let pths = @lib.map(@bool.undisch_all, @bool.conjuncts_rule(pthc))
  let avars = @lib.sort(
    fn(x329 : @kernel.Term, x330 : @kernel.Term) -> Bool raise {
      let s331 = (fn(
        x327 : @kernel.Term,
      ) -> ((@kernel.Term) -> Bool raise) raise {
        fn(x328 : @kernel.Term) -> Bool raise { @lib.compare(x327, x328) < 0 }
      })(x329)
      s331(x330)
    },
    @kernel.frees(@kernel.concl(pthc)),
  )
  el_conv_c.set(fn(x332 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x332
    match tm {
      @kernel.Term::Comb(
        @kernel.Term::Comb(@kernel.Term::Const("EL", _), ntm),
        ltm
      ) if @basics.is_list(ltm) => {
        let tyin = @list.List([
          (@lib.hd(@kernel.dest_type(@kernel.type_of(ltm)).1), @kernel.aty),
        ])
        match
          @lib.map(
            fn(x334 : @kernel.Term) -> @kernel.Term raise {
              ((x333 : @kernel.Term) => @kernel.inst(tyin, x333))(x334)
            },
            avars,
          ) {
          More(
            h_tm,
            tail=More(m_tm, tail=More(n_tm, tail=More(t_tm, tail=Empty)))
          ) =>
            match
              @lib.map(
                fn(x336 : @kernel.Thm) -> @kernel.Thm raise {
                  ((x335 : @kernel.Thm) => @kernel.inst_type(tyin, x335))(x336)
                },
                pths,
              ) {
              More(pth_base, tail=More(pth_step, tail=Empty)) => {
                fn conv(x337 : @kernel.Thm) -> @kernel.Thm raise {
                  let th = x337
                  let (entm, ltm_1) = @kernel.dest_comb(
                    @kernel.rand(@kernel.concl(th)),
                  )
                  let (htm, ttm) = @basics.dest_cons(ltm_1)
                  let (etm, ntm_1) = @kernel.dest_comb(entm)
                  let n = @basics.dest_numeral(ntm_1)
                  if @num.eq_num(n, @num.num_0) {
                    @kernel.trans(
                      th,
                      @kernel.inst_rule(
                        @list.List([(htm, h_tm), (ttm, t_tm)]),
                        pth_base,
                      ),
                    )
                  } else {
                    let th1 = @calc_num.num_conv(ntm_1)
                    let th2 = @kernel.inst_rule(
                      @list.List([
                        (ntm_1, n_tm),
                        (@kernel.rand(@kernel.rand(@kernel.concl(th1))), m_tm),
                        (htm, h_tm),
                        (ttm, t_tm),
                      ]),
                      pth_step,
                    )
                    let th3 = @kernel.trans(th, @bool.prove_hyp(th1, th2))
                    conv(th3)
                  }
                }
                conv(@kernel.refl(tm)) catch {
                  Failure(_) => raise Failure("EL_CONV")
                  e => raise e
                }
              }
              _ => raise @lib.MatchFailure("tscript.ml:792")
            }
          _ => raise @lib.MatchFailure("tscript.ml:791")
        }
      }
      _ => raise Failure("EL_CONV")
    }
  })
}

///|
let el_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("EL_CONV")

///|
/// `EL_CONV`
pub fn el_conv(x : @kernel.Term) -> @kernel.Thm raise {
  el_conv_c.get()(x)
}

///|
/// REVERSE_CONV
fn step_136() -> Unit raise {
  let t338 = @simp.simp_tac(
    @list.List([append(), append_nil(), reverse(), @equal.gsym(append_assoc())]),
  )
  let pthc = @tactics.prove(
    @term_syntax.parse_term("(l : List[A]) == APPEND(l, NIL) && APPEND(REVERSE(NIL), l) == l && APPEND(REVERSE(CONS((h : A), (t : List[A]))), l) == APPEND(REVERSE(t), CONS(h, l))"),
    t338,
  )
  let pths = @lib.map(@bool.undisch_all, @bool.conjuncts_rule(pthc))
  let avars = @lib.sort(
    fn(x341 : @kernel.Term, x342 : @kernel.Term) -> Bool raise {
      let s343 = (fn(
        x339 : @kernel.Term,
      ) -> ((@kernel.Term) -> Bool raise) raise {
        fn(x340 : @kernel.Term) -> Bool raise { @lib.compare(x339, x340) < 0 }
      })(x341)
      s343(x342)
    },
    @kernel.frees(@kernel.concl(pthc)),
  )
  reverse_conv_c.set(fn(x344 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x344
    match tm {
      @kernel.Term::Comb(@kernel.Term::Const("REVERSE", _), ltm) => {
        let tyin = @list.List([
          (@lib.hd(@kernel.dest_type(@kernel.type_of(ltm)).1), @kernel.aty),
        ])
        match
          @lib.map(
            fn(x346 : @kernel.Term) -> @kernel.Term raise {
              ((x345 : @kernel.Term) => @kernel.inst(tyin, x345))(x346)
            },
            avars,
          ) {
          More(h_tm, tail=More(l_tm, tail=More(t_tm, tail=Empty))) =>
            match
              @lib.map(
                fn(x348 : @kernel.Thm) -> @kernel.Thm raise {
                  ((x347 : @kernel.Thm) => @kernel.inst_type(tyin, x347))(x348)
                },
                pths,
              ) {
              More(
                pth_init,
                tail=More(pth_base, tail=More(pth_step, tail=Empty))
              ) => {
                fn conv(x349 : @kernel.Thm) -> @kernel.Thm raise {
                  let th = x349
                  let (ahtm, ltm_1) = @kernel.dest_comb(
                    @kernel.rand(@kernel.concl(th)),
                  )
                  let httm = @kernel.rand(@kernel.rand(ahtm))
                  if @basics.is_cons(httm) {
                    let (htm, ttm) = @basics.dest_cons(httm)
                    let th1 = @kernel.inst_rule(
                      @list.List([(htm, h_tm), (ltm_1, l_tm), (ttm, t_tm)]),
                      pth_step,
                    )
                    conv(@kernel.trans(th, th1))
                  } else {
                    @kernel.trans(
                      th,
                      @kernel.inst_rule(@list.List([(ltm_1, l_tm)]), pth_base),
                    )
                  }
                }
                conv(@kernel.inst_rule(@list.List([(tm, l_tm)]), pth_init)) catch {
                  Failure(_) => raise Failure("REVERSE_CONV")
                  e => raise e
                }
              }
              _ => raise @lib.MatchFailure("tscript.ml:822")
            }
          _ => raise @lib.MatchFailure("tscript.ml:821")
        }
      }
      _ => raise Failure("REVERSE_CONV")
    }
  })
}

///|
let reverse_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("REVERSE_CONV")

///|
/// `REVERSE_CONV`
pub fn reverse_conv(x : @kernel.Term) -> @kernel.Thm raise {
  reverse_conv_c.get()(x)
}

///|
/// LIST_OF_SEQ_CONV
fn step_137() -> Unit raise {
  let t350 = @simp.simp_tac(
    @list.List([
      append(),
      append_nil(),
      list_of_seq(),
      @equal.gsym(append_assoc()),
    ]),
  )
  let pthc = @tactics.prove(
    @term_syntax.parse_term("(l : List[A]) == APPEND(l, NIL) && APPEND(list_of_seq((f : (Num) -> A), 0), l) == l && ((n : Num) == SUC((m : Num)) → APPEND(list_of_seq(f, n), l) == APPEND(list_of_seq(f, m), CONS(f(m), l)))"),
    t350,
  )
  let pths = @lib.map(@bool.undisch_all, @bool.conjuncts_rule(pthc))
  let avars = @lib.sort(
    fn(x353 : @kernel.Term, x354 : @kernel.Term) -> Bool raise {
      let s355 = (fn(
        x351 : @kernel.Term,
      ) -> ((@kernel.Term) -> Bool raise) raise {
        fn(x352 : @kernel.Term) -> Bool raise { @lib.compare(x351, x352) < 0 }
      })(x353)
      s355(x354)
    },
    @kernel.frees(@kernel.concl(pthc)),
  )
  list_of_seq_conv_c.set(fn(x356 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x356
    match tm {
      @kernel.Term::Comb(
        @kernel.Term::Comb(@kernel.Term::Const("list_of_seq", _), ftm),
        ntm
      ) => {
        let tyin = @list.List([
          (@basics.dest_fun_ty(@kernel.type_of(ftm)).1, @kernel.aty),
        ])
        match
          @lib.map(
            fn(x358 : @kernel.Term) -> @kernel.Term raise {
              ((x357 : @kernel.Term) => @kernel.inst(tyin, x357))(x358)
            },
            avars,
          ) {
          More(
            f_tm,
            tail=More(l_tm, tail=More(m_tm, tail=More(n_tm, tail=Empty)))
          ) =>
            match
              @lib.map(
                fn(x360 : @kernel.Thm) -> @kernel.Thm raise {
                  ((x359 : @kernel.Thm) => @kernel.inst_type(tyin, x359))(x360)
                },
                pths,
              ) {
              More(
                pth_init,
                tail=More(pth_base, tail=More(pth_step, tail=Empty))
              ) => {
                let bflag = @kernel.is_abs(ftm)
                fn conv(x361 : @kernel.Thm) -> @kernel.Thm raise {
                  let th = x361
                  let (nftm, ltm) = @kernel.dest_comb(
                    @kernel.rand(@kernel.concl(th)),
                  )
                  let (lftm, ntm_1) = @kernel.dest_comb(@kernel.rand(nftm))
                  let ftm_1 = @kernel.rand(lftm)
                  let n = @basics.dest_numeral(ntm_1)
                  if @num.eq_num(n, @num.num_0) {
                    @kernel.trans(
                      th,
                      @kernel.inst_rule(
                        @list.List([(ftm_1, f_tm), (ltm, l_tm)]),
                        pth_base,
                      ),
                    )
                  } else {
                    let th1 = @calc_num.num_conv(ntm_1)
                    let th2 = @kernel.inst_rule(
                      @list.List([
                        (ntm_1, n_tm),
                        (@kernel.rand(@kernel.rand(@kernel.concl(th1))), m_tm),
                        (ftm_1, f_tm),
                        (ltm, l_tm),
                      ]),
                      pth_step,
                    )
                    let th3 = @kernel.trans(th, @bool.prove_hyp(th1, th2))
                    let th4 = if !bflag {
                      th3
                    } else {
                      let (jtm, ctxtm) = @kernel.dest_comb(
                        @kernel.rand(@kernel.concl(th3)),
                      )
                      let (cttm, xtm) = @kernel.dest_comb(ctxtm)
                      let (ctm, ttm) = @kernel.dest_comb(cttm)
                      @kernel.trans(
                        th3,
                        @equal.ap_term(
                          jtm,
                          @equal.ap_thm(
                            @equal.ap_term(ctm, @equal.beta_conv(ttm)),
                            xtm,
                          ),
                        ),
                      )
                    }
                    conv(th4)
                  }
                }
                conv(@kernel.inst_rule(@list.List([(tm, l_tm)]), pth_init)) catch {
                  Failure(_) => raise Failure("LIST_OF_SEQ_CONV")
                  e => raise e
                }
              }
              _ => raise @lib.MatchFailure("tscript.ml:851")
            }
          _ => raise @lib.MatchFailure("tscript.ml:850")
        }
      }
      _ => raise Failure("LIST_OF_SEQ_CONV")
    }
  })
}

///|
let list_of_seq_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "LIST_OF_SEQ_CONV",
)

///|
/// `LIST_OF_SEQ_CONV`
pub fn list_of_seq_conv(x : @kernel.Term) -> @kernel.Thm raise {
  list_of_seq_conv_c.get()(x)
}

///|
let char_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("char_INDUCT")

///|
/// `char_INDUCT`
pub fn char_induct() -> @kernel.Thm {
  char_induct_c.get()
}

///|
let char_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("char_RECURSION")

///|
/// `char_RECURSION`
pub fn char_recursion() -> @kernel.Thm {
  char_recursion_c.get()
}

///|
/// char_INDUCT, char_RECURSION
fn step_138() -> Unit raise {
  let (char_induct, char_recursion) = @ind_types.define_type(
    "char = ASCII bool bool bool bool bool bool bool bool",
  )
  char_induct_c.set(char_induct)
  char_recursion_c.set(char_recursion)
}

///|
/// lists.ml:884
fn step_139() -> Unit raise {
  @preterm.new_type_abbrev("string", @parser.parse_type("char list"))
}

///|
let dest_char_c : @lib.Cell[(@kernel.Term) -> Char raise] = @lib.Cell::new(
  "dest_char",
)

///|
/// `dest_char`
pub fn dest_char(x : @kernel.Term) -> Char raise {
  dest_char_c.get()(x)
}

///|
let mk_char_c : @lib.Cell[(Char) -> @kernel.Term raise] = @lib.Cell::new(
  "mk_char",
)

///|
/// `mk_char`
pub fn mk_char(x : Char) -> @kernel.Term raise {
  mk_char_c.get()(x)
}

///|
let dest_string_c : @lib.Cell[(@kernel.Term) -> String raise] = @lib.Cell::new(
  "dest_string",
)

///|
/// `dest_string`
pub fn dest_string(x : @kernel.Term) -> String raise {
  dest_string_c.get()(x)
}

///|
let mk_string_c : @lib.Cell[(String) -> @kernel.Term raise] = @lib.Cell::new(
  "mk_string",
)

///|
/// `mk_string`
pub fn mk_string(x : String) -> @kernel.Term raise {
  mk_string_c.get()(x)
}

///|
let char_eq_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("CHAR_EQ_CONV")

///|
/// `CHAR_EQ_CONV`
pub fn char_eq_conv(x : @kernel.Term) -> @kernel.Thm raise {
  char_eq_conv_c.get()(x)
}

///|
let string_eq_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "STRING_EQ_CONV",
)

///|
/// `STRING_EQ_CONV`
pub fn string_eq_conv(x : @kernel.Term) -> @kernel.Thm raise {
  string_eq_conv_c.get()(x)
}

///|
/// dest_char, mk_char, dest_string, mk_string, CHAR_EQ_CONV, STRING_EQ_CONV
fn step_140() -> Unit raise {
  let bool_of_term : (@kernel.Term) -> Bool raise = fn(
    x362 : @kernel.Term,
  ) -> Bool raise {
    let t = x362
    match t {
      @kernel.Term::Const("T", _) => true
      @kernel.Term::Const("F", _) => false
      _ => raise Failure("bool_of_term")
    }
  }
  let code_of_term : (@kernel.Term) -> Int64 raise = fn(
    x363 : @kernel.Term,
  ) -> Int64 raise {
    let t_1 = x363
    let (f, tms) = @basics.strip_comb(t_1)
    if !(@kernel.is_const(f) && @kernel.dest_const(f).0 == "ASCII") ||
      !(Int::to_int64(@lib.length(tms)) == 8L) {
      raise Failure("code_of_term")
    } else {
      @lib.itlist(
        fn(x364 : Bool, x365 : Int64) -> Int64 raise {
          let b = x364
          let f_1 = x365
          if b {
            @lib.add63(1L, @lib.mul63(2L, f_1))
          } else {
            @lib.mul63(2L, f_1)
          }
        },
        @lib.map(bool_of_term, @lib.rev(tms)),
        0L,
      )
    }
  }
  let char_of_term : (@kernel.Term) -> Char raise = fn(
    x367 : @kernel.Term,
  ) -> Char raise {
    (fn(x366 : Int64) -> Char raise { @lib.char_chr(@lib.int63_to_int(x366)) })(
      code_of_term(x367),
    )
  }
  let dest_string : (@kernel.Term) -> String raise = fn(
    x368 : @kernel.Term,
  ) -> String raise {
    let tm = x368
    try {
      let tms_1 = @basics.dest_list(tm)
      if @kernel.dest_type(@lib.hd(@kernel.dest_type(@kernel.type_of(tm)).1)).0 !=
        "char" {
        @lib.failure()
      } else {
        let ccs = @lib.map(
          fn(x370 : @kernel.Term) -> String raise {
            (fn(x369 : Char) -> String raise { @lib.string_make(1L, x369) })(
              char_of_term(x370),
            )
          },
          tms_1,
        )
        @lib.string_escaped(@lib.implode(ccs))
      }
    } catch {
      Failure(_) => raise Failure("dest_string")
      e => raise e
    }
  }
  let mk_bool : (Bool) -> @kernel.Term raise = fn(
    x371 : Bool,
  ) -> @kernel.Term raise {
    let b_1 = x371
    let t372 = @term_syntax.parse_term("false")
    let (true_tm, false_tm) = (@term_syntax.parse_term("true"), t372)
    if b_1 {
      true_tm
    } else {
      false_tm
    }
  }
  let ascii_tm = @term_syntax.parse_term("ASCII")
  let mk_code : (Int64) -> @kernel.Term raise = fn(
    x373 : Int64,
  ) -> @kernel.Term raise {
    let c = x373
    let lis = @lib.map(
      fn(x374 : Int64) -> @kernel.Term raise {
        let i = x374
        mk_bool(@lib.mod63(@lib.div63(c, @lib.lsl63(1L, i)), 2L) == 1L)
      },
      @lib.range(0L, 7L),
    )
    @lib.itlist(
      fn(x375 : @kernel.Term, x376 : @kernel.Term) -> @kernel.Term raise {
        let x = x375
        let y = x376
        @kernel.mk_comb(y, x)
      },
      lis,
      ascii_tm,
    )
  }
  let codes = @lib.array_map(mk_code, @lib.array_of_list(@lib.range(0L, 255L)))
  let mk_code_1 : (Int64) -> @kernel.Term raise = fn(
    x377 : Int64,
  ) -> @kernel.Term raise {
    let c_1 = x377
    @lib.array_get(codes, @lib.int63_to_int(c_1))
  }
  let mk_char : (Char) -> @kernel.Term raise = fn(
    x379 : Char,
  ) -> @kernel.Term raise {
    mk_code_1(
      (fn(x378 : Char) -> Int64 raise { Int::to_int64(Char::to_int(x378)) })(
        x379,
      ),
    )
  }
  let mk_string : (String) -> @kernel.Term raise = fn(
    x380 : String,
  ) -> @kernel.Term raise {
    let s = x380
    let ns = @lib.map(
      fn(x381 : Int64) -> Int64 raise {
        let i_1 = x381
        Int::to_int64(
          Char::to_int(@lib.ocaml_string_get(s, @lib.int63_to_int(i_1))),
        )
      },
      @lib.range(0L, @lib.sub63(Int::to_int64(@lib.string_length(s)), 1L)),
    )
    let t382 = @parser.parse_type("char")
    mk_list(@lib.map(mk_code_1, ns), t382)
  }
  let t395 = @term_syntax.parse_term("(c7 : Bool)")
  let t396 = @term_syntax.parse_term("(c6 : Bool)")
  let t397 = @term_syntax.parse_term("(c5 : Bool)")
  let t398 = @term_syntax.parse_term("(c4 : Bool)")
  let t399 = @term_syntax.parse_term("(c3 : Bool)")
  let t400 = @term_syntax.parse_term("(c2 : Bool)")
  let t401 = @list.List([
    @term_syntax.parse_term("(c1 : Bool)"),
    t400,
    t399,
    t398,
    t397,
    t396,
    t395,
  ])
  let t389 = @term_syntax.parse_term("(b7 : Bool)")
  let t390 = @term_syntax.parse_term("(b6 : Bool)")
  let t391 = @term_syntax.parse_term("(b5 : Bool)")
  let t392 = @term_syntax.parse_term("(b4 : Bool)")
  let t393 = @term_syntax.parse_term("(b3 : Bool)")
  let t394 = @term_syntax.parse_term("(b2 : Bool)")
  let t402 = @list.List([
    @term_syntax.parse_term("(b1 : Bool)"),
    t394,
    t393,
    t392,
    t391,
    t390,
    t389,
  ])
  let t383 = @term_syntax.parse_term("(a6 : Bool)")
  let t384 = @term_syntax.parse_term("(a5 : Bool)")
  let t385 = @term_syntax.parse_term("(a4 : Bool)")
  let t386 = @term_syntax.parse_term("(a3 : Bool)")
  let t387 = @term_syntax.parse_term("(a2 : Bool)")
  let t388 = @term_syntax.parse_term("(a1 : Bool)")
  let (avars, bvars, cvars) = (
    @list.List([
      @term_syntax.parse_term("(a0 : Bool)"),
      t388,
      t387,
      t386,
      t385,
      t384,
      t383,
    ]),
    t402,
    t401,
  )
  let t406 = @simp.rewrite_tac(@list.List([@ind_types.injectivity("char")]))
  let t407 = (
    @term_syntax.parse_term("!(ASCII(false, (b1 : Bool), (b2 : Bool), (b3 : Bool), (b4 : Bool), (b5 : Bool), (b6 : Bool), (b7 : Bool)) == ASCII(true, (c1 : Bool), (c2 : Bool), (c3 : Bool), (c4 : Bool), (c5 : Bool), (c6 : Bool), (c7 : Bool))) && !(ASCII((a0 : Bool), false, b2, b3, b4, b5, b6, b7) == ASCII(a0, true, c2, c3, c4, c5, c6, c7)) && !(ASCII(a0, (a1 : Bool), false, b3, b4, b5, b6, b7) == ASCII(a0, a1, true, c3, c4, c5, c6, c7)) && !(ASCII(a0, a1, (a2 : Bool), false, b4, b5, b6, b7) == ASCII(a0, a1, a2, true, c4, c5, c6, c7)) && !(ASCII(a0, a1, a2, (a3 : Bool), false, b5, b6, b7) == ASCII(a0, a1, a2, a3, true, c5, c6, c7)) && !(ASCII(a0, a1, a2, a3, (a4 : Bool), false, b6, b7) == ASCII(a0, a1, a2, a3, a4, true, c6, c7)) && !(ASCII(a0, a1, a2, a3, a4, (a5 : Bool), false, b7) == ASCII(a0, a1, a2, a3, a4, a5, true, c7)) && !(ASCII(a0, a1, a2, a3, a4, a5, (a6 : Bool), false) == ASCII(a0, a1, a2, a3, a4, a5, a6, true))"),
    t406,
  )
  let ascii_neqs_ft = (fn(x404 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    ((x403 : @list.List[@kernel.Thm]) => @lib.map(@bool.eqf_intro, x403))(
      @bool.conjuncts_rule(x404),
    )
  })(
    (fn(
      x405 : (
        @kernel.Term,
        ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise,
      ),
    ) -> @kernel.Thm raise {
      @tactics.prove(x405.0, x405.1)
    })(t407),
  )
  let t408 = @lib.zip(cvars, bvars)
  let ilist = @lib.zip(bvars, cvars).concat(t408)
  let f_2 : (@kernel.Thm) -> @kernel.Thm raise = fn(
    x412 : @kernel.Thm,
  ) -> @kernel.Thm raise {
    (fn(x411 : @kernel.Thm) -> @kernel.Thm raise {
      (fn(x410 : @kernel.Thm) -> @kernel.Thm raise {
        @bool.eqf_intro(
          ((x409 : @kernel.Thm) => @kernel.inst_rule(ilist, x409))(x410),
        )
      })(@equal.gsym(x411))
    })(@bool.eqf_elim(x412))
  }
  let ascii_neqs_tf = @lib.map(f_2, ascii_neqs_ft)
  fn findneq(
    x415 : Int64,
    x416 : @list.List[@kernel.Term],
    x417 : @list.List[@kernel.Term],
    x418 : @list.List[@kernel.Term],
  ) -> (
    Int64,
    @list.List[@kernel.Term],
    Bool,
    @list.List[@kernel.Term],
    @list.List[@kernel.Term],
  ) raise {
    let n_1 = x415
    let prefix = x416
    let a = x417
    let b_2 = x418
    match (a, b_2) {
      (More(b1, tail=a_1), More(b2, tail=b_3)) =>
        if b1 != b2 {
          let t419 = bool_of_term(b2)
          (n_1, @lib.rev(prefix), t419, a_1, b_3)
        } else {
          findneq(@lib.add63(n_1, 1L), prefix.prepend(b1), a_1, b_3)
        }
      (_, _) => @lib.failure()
    }
  }
  let char_distinctness : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise = fn(
    x420 : @kernel.Term,
  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let c1 = x420
    fn(x421 : @kernel.Term) -> @kernel.Thm raise {
      let c2 = x421
      let (_, a_2) = @basics.strip_comb(c1)
      let (_, b_4) = @basics.strip_comb(c2)
      let (n_2, p, b_5, s1, s2) = findneq(0L, @list.List([]), a_2, b_4)
      let ss1 = @lib.funpow(@lib.int63_to_int(n_2), @lib.tl, bvars)
      let ss2 = @lib.funpow(@lib.int63_to_int(n_2), @lib.tl, cvars)
      let pp = prefix_l(n_2, avars)
      let pth = if b_5 { ascii_neqs_ft } else { ascii_neqs_tf }
      let t424 = @lib.el(@lib.int63_to_int(n_2), pth)
      let t422 = @lib.zip(s2, ss2)
      let t423 = @lib.zip(s1, ss1).concat(t422)
      @kernel.inst_rule(@lib.zip(p, pp).concat(t423), t424)
    }
  }
  let t425 = @term_syntax.parse_term("(xs : List[Char])")
  let (xtm, xstm) = (@term_syntax.parse_term("(x : Char)"), t425)
  let t426 = @term_syntax.parse_term("(ys : List[Char])")
  let (ytm, ystm) = (@term_syntax.parse_term("(y : Char)"), t426)
  let niltm = @term_syntax.parse_term("(NIL : List[Char])")
  let nil_eq_thm = @bool.eqt_intro(@kernel.refl(niltm))
  let t428 = @meson.meson_tac(@list.List([]))
  let t429 = @tactics.then_tac(@simp.rewrite_tac(@list.List([cons_11()])), t428)
  let t430 = (
    @term_syntax.parse_term("(CONS((x : Char), (xs : List[Char])) == CONS(x, (ys : List[Char]))) == (xs == ys) && ((x == (y : Char)) == false → (CONS(x, xs) == CONS(y, ys)) == false)"),
    t429,
  )
  let (cons_eq_thm, cons_neq_thm) = @bool.conj_pair(
    (fn(
      x427 : (
        @kernel.Term,
        ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise,
      ),
    ) -> @kernel.Thm raise {
      @tactics.prove(x427.0, x427.1)
    })(t430),
  )
  let t432 = @simp.rewrite_tac(@list.List([not_cons_nil()]))
  let t433 = (
    @term_syntax.parse_term("(NIL == CONS((x : Char), (xs : List[Char]))) == false && (CONS(x, xs) == NIL) == false"),
    t432,
  )
  let (nil_neq_cons, cons_neq_nil) = @bool.conj_pair(
    (fn(
      x431 : (
        @kernel.Term,
        ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise,
      ),
    ) -> @kernel.Thm raise {
      @tactics.prove(x431.0, x431.1)
    })(t433),
  )
  fn string_distinctness(
    x434 : @kernel.Term,
    x435 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let s1_1 = x434
    let s2_1 = x435
    if s1_1 == niltm {
      if s2_1 == niltm {
        nil_eq_thm
      } else {
        let t436 = @kernel.rand(s2_1)
        let (c2_1, s2_2) = (@kernel.rand(@kernel.rator(s2_1)), t436)
        @kernel.inst_rule(@list.List([(c2_1, xtm), (s2_2, xstm)]), nil_neq_cons)
      }
    } else {
      let t437 = @kernel.rand(s1_1)
      let (c1_1, s1_2) = (@kernel.rand(@kernel.rator(s1_1)), t437)
      if s2_1 == niltm {
        @kernel.inst_rule(@list.List([(c1_1, xtm), (s1_2, xstm)]), cons_neq_nil)
      } else {
        let t438 = @kernel.rand(s2_1)
        let (c2_2, s2_3) = (@kernel.rand(@kernel.rator(s2_1)), t438)
        if c1_1 == c2_2 {
          let th1 = @kernel.inst_rule(
            @list.List([(c1_1, xtm), (s1_2, xstm), (s2_3, ystm)]),
            cons_eq_thm,
          )
          let th2 = string_distinctness(s1_2, s2_3)
          @kernel.trans(th1, th2)
        } else {
          let ilist_1 = @list.List([
            (c1_1, xtm),
            (c2_2, ytm),
            (s1_2, xstm),
            (s2_3, ystm),
          ])
          let itm = @kernel.inst_rule(ilist_1, cons_neq_thm)
          @bool.mp(itm, char_distinctness(c1_1)(c2_2))
        }
      }
    }
  }
  let string_distinctness_1 : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise = fn(
    x439 : @kernel.Term,
  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    fn(x440 : @kernel.Term) -> @kernel.Thm raise {
      string_distinctness(x439, x440)
    }
  }
  let char_eq_conv : (@kernel.Term) -> @kernel.Thm raise = fn(
    x441 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let tm_1 = x441
    let (c1_2, c2_3) = @kernel.dest_eq(tm_1)
    if Int::to_int64(@lib.compare(c1_2, c2_3)) == 0L {
      @bool.eqt_intro(@kernel.refl(c1_2))
    } else {
      char_distinctness(c1_2)(c2_3)
    }
  }
  let string_eq_conv : (@kernel.Term) -> @kernel.Thm raise = fn(
    x442 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let tm_2 = x442
    let (ltm, rtm) = @kernel.dest_eq(tm_2)
    if Int::to_int64(@lib.compare(ltm, rtm)) == 0L {
      @bool.eqt_intro(@kernel.refl(ltm))
    } else {
      string_distinctness_1(ltm)(rtm)
    }
  }
  let (
    dest_char,
    mk_char_1,
    dest_string_1,
    mk_string_1,
    char_eq_conv_1,
    string_eq_conv_1,
  ) = (
    char_of_term, mk_char, dest_string, mk_string, char_eq_conv, string_eq_conv,
  )
  dest_char_c.set(dest_char)
  mk_char_c.set(mk_char_1)
  dest_string_c.set(dest_string_1)
  mk_string_c.set(mk_string_1)
  char_eq_conv_c.set(char_eq_conv_1)
  string_eq_conv_c.set(string_eq_conv_1)
}

///|
fn[TA] prefix_l(x413 : Int64, x414 : @list.List[TA]) -> @list.List[TA] raise {
  let n = x413
  let l = x414
  if n == 0L {
    @list.List([])
  } else {
    match l {
      More(h, tail=t_2) => prefix_l(@lib.sub63(n, 1L), t_2).prepend(h)
      _ => l
    }
  }
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
}
