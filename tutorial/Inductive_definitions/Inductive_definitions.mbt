// Translated from upstream Tutorial/Inductive_definitions.ml; edit this file directly.

///|
/// Tutorial/Inductive_definitions.ml:5
fn step_1() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// move
fn step_2() -> Unit raise {
  move__c.set(@pair.new_definition(@term_syntax.parse_term("(move_ : (((Real, Real), (Real, Real), Real, Real), ((Real, Real), (Real, Real), Real, Real)) -> Bool)((((ax : Real), (ay : Real)), ((bx : Real), (by : Real)), (cx : Real), (cy : Real)), (((ax' : Real), (ay' : Real)), ((bx' : Real), (by' : Real)), (cx' : Real), (cy' : Real))) == ((∃ a : Real, ax' == ax + a * (cx - bx) && ay' == ay + a * (cy - by) && bx' == bx && by' == by && cx' == cx && cy' == cy) || (∃ b : Real, bx' == bx + b * (ax - cx) && by' == by + b * (ay - cy) && ax' == ax && ay' == ay && cx' == cx && cy' == cy) || (∃ c : Real, ax' == ax && ay' == ay && bx' == bx && by' == by && cx' == cx + c * (bx - ax) && cy' == cy + c * (by - ay)))")))
}

///|
let move__c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("move")

///|
/// `move`
pub fn move_() -> @kernel.Thm {
  move__c.get()
}

///|
let reachable_rules_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("reachable_RULES")

///|
/// `reachable_RULES`
pub fn reachable_rules() -> @kernel.Thm {
  reachable_rules_c.get()
}

///|
let reachable_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("reachable_INDUCT")

///|
/// `reachable_INDUCT`
pub fn reachable_induct() -> @kernel.Thm {
  reachable_induct_c.get()
}

///|
let reachable_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("reachable_CASES")

///|
/// `reachable_CASES`
pub fn reachable_cases() -> @kernel.Thm {
  reachable_cases_c.get()
}

///|
/// reachable_RULES, reachable_INDUCT, reachable_CASES
fn step_3() -> Unit raise {
  let (reachable_rules, reachable_induct, reachable_cases) = @ind_defs.new_inductive_definition(@term_syntax.parse_term("(∀ p : ((Real, Real), (Real, Real), Real, Real), (reachable : (((Real, Real), (Real, Real), Real, Real), ((Real, Real), (Real, Real), Real, Real)) -> Bool)(p, p)) && (∀ p : ((Real, Real), (Real, Real), Real, Real), ∀ q : ((Real, Real), (Real, Real), Real, Real), ∀ r : ((Real, Real), (Real, Real), Real, Real), move_(p, q) && reachable(q, r) → reachable(p, r))"))
  reachable_rules_c.set(reachable_rules)
  reachable_induct_c.set(reachable_induct)
  reachable_cases_c.set(reachable_cases)
}

///|
/// oriented_area
fn step_4() -> Unit raise {
  oriented_area_c.set(@pair.new_definition(@term_syntax.parse_term("(oriented_area : (((Real, Real), (Real, Real), Real, Real)) -> Real)((((ax : Real), (ay : Real)), ((bx : Real), (by : Real)), (cx : Real), (cy : Real))) == ((bx - ax) * (cy - ay) - (cx - ax) * (by - ay)) / real_of_num(2)")))
}

///|
let oriented_area_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("oriented_area")

///|
/// `oriented_area`
pub fn oriented_area() -> @kernel.Thm {
  oriented_area_c.get()
}

///|
/// MOVE_INVARIANT
fn step_5() -> Unit raise {
  let t1 = @tactics.conv_tac(@calc_rat.real_ring)
  let t2 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@pair.forall_pair_thm(), move_(), oriented_area()])), t1)
  move_invariant_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : ((Real, Real), (Real, Real), Real, Real), ∀ p' : ((Real, Real), (Real, Real), Real, Real), move_(p, p') → oriented_area(p) == oriented_area(p')"), t2))
}

///|
let move_invariant_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOVE_INVARIANT")

///|
/// `MOVE_INVARIANT`
pub fn move_invariant() -> @kernel.Thm {
  move_invariant_c.get()
}

///|
/// REACHABLE_INVARIANT
fn step_6() -> Unit raise {
  let t3 = @meson.meson_tac(@list.List([move_invariant()]))
  let t4 = @tactics.then_tac(@tactics.match_mp_tac(reachable_induct()), t3)
  reachable_invariant_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : ((Real, Real), (Real, Real), Real, Real), ∀ p' : ((Real, Real), (Real, Real), Real, Real), reachable(p, p') → oriented_area(p) == oriented_area(p')"), t4))
}

///|
let reachable_invariant_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REACHABLE_INVARIANT")

///|
/// `REACHABLE_INVARIANT`
pub fn reachable_invariant() -> @kernel.Thm {
  reachable_invariant_c.get()
}

///|
/// IMPOSSIBILITY_B
fn step_7() -> Unit raise {
  let t10 = @simp.rewrite_tac(@list.List([oriented_area()]))
  let t8 = @drule.match_mp(reachable_invariant())
  let t11 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @tactics.first_assum(fn(x9 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x5 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s6 = @tactics.mp_tac(x5)
      fn(x7 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s6(x7)
      }
    })(t8(x9))
  })), t10), @calc_rat.real_arith_tac)
  impossibility_b_c.set(@tactics.prove(@term_syntax.parse_term("!(reachable(((real_of_num(0), real_of_num(0)), (real_of_num(3), real_of_num(0)), real_of_num(0), real_of_num(3)), ((real_of_num(1), real_of_num(2)), (real_of_num(2), real_of_num(5)), -real_of_num(2), real_of_num(3))) || reachable(((real_of_num(0), real_of_num(0)), (real_of_num(3), real_of_num(0)), real_of_num(0), real_of_num(3)), ((real_of_num(1), real_of_num(2)), (-real_of_num(2), real_of_num(3)), real_of_num(2), real_of_num(5))) || reachable(((real_of_num(0), real_of_num(0)), (real_of_num(3), real_of_num(0)), real_of_num(0), real_of_num(3)), ((real_of_num(2), real_of_num(5)), (real_of_num(1), real_of_num(2)), -real_of_num(2), real_of_num(3))) || reachable(((real_of_num(0), real_of_num(0)), (real_of_num(3), real_of_num(0)), real_of_num(0), real_of_num(3)), ((real_of_num(2), real_of_num(5)), (-real_of_num(2), real_of_num(3)), real_of_num(1), real_of_num(2))) || reachable(((real_of_num(0), real_of_num(0)), (real_of_num(3), real_of_num(0)), real_of_num(0), real_of_num(3)), ((-real_of_num(2), real_of_num(3)), (real_of_num(1), real_of_num(2)), real_of_num(2), real_of_num(5))) || reachable(((real_of_num(0), real_of_num(0)), (real_of_num(3), real_of_num(0)), real_of_num(0), real_of_num(3)), ((-real_of_num(2), real_of_num(3)), (real_of_num(2), real_of_num(5)), real_of_num(1), real_of_num(2))))"), t11))
}

///|
let impossibility_b_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IMPOSSIBILITY_B")

///|
/// `IMPOSSIBILITY_B`
pub fn impossibility_b() -> @kernel.Thm {
  impossibility_b_c.get()
}

///|
/// init
fn step_8() -> Unit raise {
  init__c.set(@pair.new_definition(@term_syntax.parse_term("(init : ((Num, Num, Num, Num, Num)) -> Bool)(((x : Num), (y : Num), (pc1 : Num), (pc2 : Num), (sem : Num))) == (pc1 == 10 && pc2 == 10 && x == 0 && y == 0 && sem == 1)")))
}

///|
let init__c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("init")

///|
/// `init`
pub fn init_() -> @kernel.Thm {
  init__c.get()
}

///|
/// trans
fn step_9() -> Unit raise {
  trans_c.set(@pair.new_definition(@term_syntax.parse_term("(trans : ((Num, Num, Num, Num, Num), (Num, Num, Num, Num, Num)) -> Bool)(((x : Num), (y : Num), (pc1 : Num), (pc2 : Num), (sem : Num)), ((x' : Num), (y' : Num), (pc1' : Num), (pc2' : Num), (sem' : Num))) == (pc1 == 10 && sem > 0 && pc1' == 20 && sem' == sem - 1 && (x', y', pc2') == (x, y, pc2) || pc2 == 10 && sem > 0 && pc2' == 20 && sem' == sem - 1 && (x', y', pc1') == (x, y, pc1) || pc1 == 20 && pc1' == 30 && x' == x + 1 && (y', pc2', sem') == (y, pc2, sem) || pc2 == 20 && pc2' == 30 && y' == y + 1 && x' == x && pc1' == pc1 && sem' == sem || pc1 == 30 && pc1' == 10 && sem' == sem + 1 && (x', y', pc2') == (x, y, pc2) || pc2 == 30 && pc2' == 10 && sem' == sem + 1 && (x', y', pc1') == (x, y, pc1))")))
}

///|
let trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("trans")

///|
/// `trans`
pub fn trans() -> @kernel.Thm {
  trans_c.get()
}

///|
/// mutex
fn step_10() -> Unit raise {
  mutex_c.set(@pair.new_definition(@term_syntax.parse_term("(mutex : ((_, _, Num, Num, _)) -> Bool)(((x : _), (y : _), (pc1 : Num), (pc2 : Num), (sem : _))) == (pc1 == 10 || pc2 == 10)")))
}

///|
let mutex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("mutex")

///|
/// `mutex`
pub fn mutex() -> @kernel.Thm {
  mutex_c.get()
}

///|
/// indinv
fn step_11() -> Unit raise {
  indinv_c.set(@pair.new_definition(@term_syntax.parse_term("(indinv : ((Num, Num, Num, Num, Num)) -> Bool)(((x : Num), (y : Num), (pc1 : Num), (pc2 : Num), (sem : Num))) == (sem + ((if pc1 == 10 { 0 } else { 1 }) + (if pc2 == 10 { 0 } else { 1 })) == 1)")))
}

///|
let indinv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("indinv")

///|
/// `indinv`
pub fn indinv() -> @kernel.Thm {
  indinv_c.get()
}

///|
/// INDUCTIVE_INVARIANT
fn step_12() -> Unit raise {
  let t14 = @meson.meson_tac(@list.List([]))
  let t12 = @term_syntax.parse_term("(s : A) => (s' : A) => (invariant : (A) -> Bool)(s) → invariant(s')")
  let t13 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(transition : (A, A) -> Bool)"), t12]), @rstc.rtc_induct()))
  let t15 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t13), t14)
  inductive_invariant_c.set(@tactics.prove(@parser.parse_term("forall init invariant transition P.\n        (forall s. init s ==> invariant s) /\\\n        (forall s s'. invariant s /\\ transition s s' ==> invariant s') /\\\n        (forall s. invariant s ==> P s)\n        ==> forall s s':A. init s /\\ RTC transition s s' ==> P s'"), t15))
}

///|
let inductive_invariant_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INDUCTIVE_INVARIANT")

///|
/// `INDUCTIVE_INVARIANT`
pub fn inductive_invariant() -> @kernel.Thm {
  inductive_invariant_c.get()
}

///|
/// MUTEX
fn step_13() -> Unit raise {
  let t17 = @simp.rewrite_tac(@list.List([init_(), trans(), indinv(), mutex(), @pair.forall_pair_thm(), @pair.pair_eq()]))
  let t16 = @tactics.exists_tac(@term_syntax.parse_term("indinv"))
  let t18 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(inductive_invariant()), t16), t17), @int.arith_tac)
  mutex_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num, Num, Num, Num, Num), ∀ s' : (Num, Num, Num, Num, Num), init(s) && RTC(trans, s, s') → mutex(s')"), t18))
}

///|
let mutex_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MUTEX")

///|
/// `MUTEX`
pub fn mutex_v1() -> @kernel.Thm {
  mutex_v1_c.get()
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
}
