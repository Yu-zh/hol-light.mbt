// Translated from upstream Library/components.ml; edit this file directly.

///|
/// component_read_write_thms
fn step_1() -> Unit raise {
  component_read_write_thms_c.set(Ref::{ val: @list.List([]), })
}

///|
let component_read_write_thms_c : @lib.Cell[Ref[@list.List[@kernel.Thm]]] = @lib.Cell::new(
  "component_read_write_thms",
)

///|
/// `component_read_write_thms`
pub fn component_read_write_thms() -> Ref[@list.List[@kernel.Thm]] {
  component_read_write_thms_c.get()
}

///|
/// `add_component_read_write_thms`
pub fn add_component_read_write_thms(
  x1 : @list.List[@kernel.Thm],
) -> Unit raise {
  let l = x1
  component_read_write_thms().val = @lib.union(
    l,
    component_read_write_thms().val,
  )
  ()
}

///|
/// component_alias_thms
fn step_2() -> Unit raise {
  component_alias_thms_c.set(Ref::{ val: @list.List([]), })
}

///|
let component_alias_thms_c : @lib.Cell[Ref[@list.List[@kernel.Thm]]] = @lib.Cell::new(
  "component_alias_thms",
)

///|
/// `component_alias_thms`
pub fn component_alias_thms() -> Ref[@list.List[@kernel.Thm]] {
  component_alias_thms_c.get()
}

///|
/// valid_component_thms
fn step_3() -> Unit raise {
  valid_component_thms_c.set(Ref::{ val: @list.List([]), })
}

///|
let valid_component_thms_c : @lib.Cell[Ref[@list.List[@kernel.Thm]]] = @lib.Cell::new(
  "valid_component_thms",
)

///|
/// `valid_component_thms`
pub fn valid_component_thms() -> Ref[@list.List[@kernel.Thm]] {
  valid_component_thms_c.get()
}

///|
/// `add_valid_component_thms`
pub fn add_valid_component_thms(x2 : @list.List[@kernel.Thm]) -> Unit raise {
  let l = x2
  valid_component_thms().val = @lib.union(l, valid_component_thms().val)
  ()
}

///|
/// strongly_valid_component_thms
fn step_4() -> Unit raise {
  strongly_valid_component_thms_c.set(Ref::{ val: @list.List([]), })
}

///|
let strongly_valid_component_thms_c : @lib.Cell[Ref[@list.List[@kernel.Thm]]] = @lib.Cell::new(
  "strongly_valid_component_thms",
)

///|
/// `strongly_valid_component_thms`
pub fn strongly_valid_component_thms() -> Ref[@list.List[@kernel.Thm]] {
  strongly_valid_component_thms_c.get()
}

///|
/// `add_strongly_valid_component_thms`
pub fn add_strongly_valid_component_thms(
  x3 : @list.List[@kernel.Thm],
) -> Unit raise {
  let l = x3
  strongly_valid_component_thms().val = @lib.union(
    l,
    strongly_valid_component_thms().val,
  )
  ()
}

///|
/// weakly_valid_component_thms
fn step_5() -> Unit raise {
  weakly_valid_component_thms_c.set(Ref::{ val: @list.List([]), })
}

///|
let weakly_valid_component_thms_c : @lib.Cell[Ref[@list.List[@kernel.Thm]]] = @lib.Cell::new(
  "weakly_valid_component_thms",
)

///|
/// `weakly_valid_component_thms`
pub fn weakly_valid_component_thms() -> Ref[@list.List[@kernel.Thm]] {
  weakly_valid_component_thms_c.get()
}

///|
/// `add_weakly_valid_component_thms`
pub fn add_weakly_valid_component_thms(
  x4 : @list.List[@kernel.Thm],
) -> Unit raise {
  let l = x4
  weakly_valid_component_thms().val = @lib.union(
    l,
    weakly_valid_component_thms().val,
  )
  ()
}

///|
/// extensionally_valid_component_thms
fn step_6() -> Unit raise {
  extensionally_valid_component_thms_c.set(Ref::{ val: @list.List([]), })
}

///|
let extensionally_valid_component_thms_c : @lib.Cell[
  Ref[@list.List[@kernel.Thm]],
] = @lib.Cell::new("extensionally_valid_component_thms")

///|
/// `extensionally_valid_component_thms`
pub fn extensionally_valid_component_thms() -> Ref[@list.List[@kernel.Thm]] {
  extensionally_valid_component_thms_c.get()
}

///|
/// `add_extensionally_valid_component_thms`
pub fn add_extensionally_valid_component_thms(
  x5 : @list.List[@kernel.Thm],
) -> Unit raise {
  let l = x5
  extensionally_valid_component_thms().val = @lib.union(
    l,
    extensionally_valid_component_thms().val,
  )
  ()
}

///|
/// component_orthogonality_thms
fn step_7() -> Unit raise {
  component_orthogonality_thms_c.set(Ref::{ val: @list.List([]), })
}

///|
let component_orthogonality_thms_c : @lib.Cell[Ref[@list.List[@kernel.Thm]]] = @lib.Cell::new(
  "component_orthogonality_thms",
)

///|
/// `component_orthogonality_thms`
pub fn component_orthogonality_thms() -> Ref[@list.List[@kernel.Thm]] {
  component_orthogonality_thms_c.get()
}

///|
/// `add_component_orthogonality_thms`
pub fn add_component_orthogonality_thms(
  x6 : @list.List[@kernel.Thm],
) -> Unit raise {
  let l = x6
  component_orthogonality_thms().val = @lib.union(
    l,
    component_orthogonality_thms().val,
  )
  ()
}

///|
/// component_tybij
fn step_8() -> Unit raise {
  let t7 = @simp.rewrite_tac(@list.List([]))
  let th = @tactics.prove(@term_syntax.parse_term("∃ rw : ((S) -> V, (V, S) -> S), true"), t7)
  let t8 = @class.new_type_definition(
    "component",
    ("component", "dest_component"),
    th,
  )
  component_tybij_c.set(@simp.rewrite_rule(@list.List([]))(t8))
}

///|
let component_tybij_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "component_tybij",
)

///|
/// `component_tybij`
pub fn component_tybij() -> @kernel.Thm {
  component_tybij_c.get()
}

///|
/// COMPONENT_INJ
fn step_9() -> Unit raise {
  let t9 = @meson.meson_tac(@list.List([component_tybij()]))
  component_inj_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ rw : ((_) -> _, (_, _) -> _), ∀ rw' : ((_) -> _, (_, _) -> _), (component(rw) == component(rw')) == (rw == rw')"),
      t9,
    ),
  )
}

///|
let component_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPONENT_INJ")

///|
/// `COMPONENT_INJ`
pub fn component_inj() -> @kernel.Thm {
  component_inj_c.get()
}

///|
/// FORALL_COMPONENT
fn step_10() -> Unit raise {
  let t10 = @meson.meson_tac(@list.List([component_tybij(), @pair.pair()]))
  forall_component_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ c : Component[S, V], (P : (Component[S, V]) -> Bool)(c)) == (∀ r : (S) -> V, ∀ w : (V, S) -> S, P(component((r, w))))"),
      t10,
    ),
  )
}

///|
let forall_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FORALL_COMPONENT",
)

///|
/// `FORALL_COMPONENT`
pub fn forall_component() -> @kernel.Thm {
  forall_component_c.get()
}

///|
/// EXISTS_COMPONENT
fn step_11() -> Unit raise {
  let t11 = @meson.meson_tac(@list.List([component_tybij(), @pair.pair()]))
  exists_component_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∃ c : Component[S, V], (P : (Component[S, V]) -> Bool)(c)) == (∃ r : (S) -> V, ∃ w : (V, S) -> S, P(component((r, w))))"),
      t11,
    ),
  )
}

///|
let exists_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EXISTS_COMPONENT",
)

///|
/// `EXISTS_COMPONENT`
pub fn exists_component() -> @kernel.Thm {
  exists_component_c.get()
}

///|
/// read_def
fn step_12() -> Unit raise {
  read_def_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(read : (Component[S, V], S) -> V)((c : Component[S, V])) == FST(dest_component(c))"),
    ),
  )
}

///|
let read_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("read_def")

///|
/// `read_def`
pub fn read_def() -> @kernel.Thm {
  read_def_c.get()
}

///|
/// write_def
fn step_13() -> Unit raise {
  write_def_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(write : (Component[S, V], V, S) -> S)((c : Component[S, V])) == SND(dest_component(c))"),
    ),
  )
}

///|
let write_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("write_def")

///|
/// `write_def`
pub fn write_def() -> @kernel.Thm {
  write_def_c.get()
}

///|
/// read
fn step_14() -> Unit raise {
  let t12 = @simp.rewrite_tac(@list.List([read_def(), component_tybij()]))
  read_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ r : (S) -> V, ∀ w : (V, S) -> S, read(component((r, w))) == r"),
      t12,
    ),
  )
}

///|
let read_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("read")

///|
/// `read`
pub fn read() -> @kernel.Thm {
  read_c.get()
}

///|
/// write
fn step_15() -> Unit raise {
  let t13 = @simp.rewrite_tac(@list.List([write_def(), component_tybij()]))
  write_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ r : (S) -> V, ∀ w : (V, S) -> S, write(component((r, w))) == w"),
      t13,
    ),
  )
}

///|
let write_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("write")

///|
/// `write`
pub fn write() -> @kernel.Thm {
  write_c.get()
}

///|
/// COMPONENT_EQ
fn step_16() -> Unit raise {
  let t14 = @simp.rewrite_tac(
    @list.List([
      component_inj(),
      forall_component(),
      read(),
      write(),
      @pair.pair_eq(),
    ]),
  )
  component_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ c1 : Component[_, _], ∀ c2 : Component[_, _], (c1 == c2) == (read(c1) == read(c2) && write(c1) == write(c2))"),
      t14,
    ),
  )
}

///|
let component_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPONENT_EQ")

///|
/// `COMPONENT_EQ`
pub fn component_eq() -> @kernel.Thm {
  component_eq_c.get()
}

///|
/// entirety
fn step_17() -> Unit raise {
  entirety_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(entirety : Component[S, S]) == component(((s : S) => s, (x : S) => (s : S) => x))"),
    ),
  )
}

///|
let entirety_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("entirety")

///|
/// `entirety`
pub fn entirety() -> @kernel.Thm {
  entirety_c.get()
}

///|
/// READ_ENTIRETY
fn step_18() -> Unit raise {
  let t15 = @simp.rewrite_tac(
    @list.List([read(), entirety(), @trivia.i_thm(), @class.fun_eq_thm()]),
  )
  read_entirety_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(read : (Component[_, _], _) -> _)((entirety : Component[_, _])) == (I : (_) -> _) && (∀ s : _, read(entirety, s) == s)"),
      t15,
    ),
  )
}

///|
let read_entirety_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("READ_ENTIRETY")

///|
/// `READ_ENTIRETY`
pub fn read_entirety() -> @kernel.Thm {
  read_entirety_c.get()
}

///|
/// WRITE_ENTIRETY
fn step_19() -> Unit raise {
  let t16 = @simp.rewrite_tac(
    @list.List([write(), entirety(), @trivia.i_thm(), @class.fun_eq_thm()]),
  )
  write_entirety_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ y : _, write(entirety, y) == ((s : _) => y)) && (∀ s : _, ∀ y : _, write(entirety, y, s) == y)"),
      t16,
    ),
  )
}

///|
let write_entirety_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WRITE_ENTIRETY")

///|
/// `WRITE_ENTIRETY`
pub fn write_entirety() -> @kernel.Thm {
  write_entirety_c.get()
}

///|
/// READ_WRITE_ENTIRETY
fn step_20() -> Unit raise {
  let t17 = @simp.rewrite_tac(
    @list.List([write_entirety(), read_entirety(), @trivia.i_def()]),
  )
  read_write_entirety_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ y : _, ∀ s : _, read(entirety, write(entirety, y, s)) == y"),
      t17,
    ),
  )
}

///|
let read_write_entirety_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "READ_WRITE_ENTIRETY",
)

///|
/// `READ_WRITE_ENTIRETY`
pub fn read_write_entirety() -> @kernel.Thm {
  read_write_entirety_c.get()
}

///|
/// Library/components.ml:112
fn step_21() -> Unit raise {
  add_component_read_write_thms(@list.List([read_write_entirety()]))
}

///|
/// Library/components.ml:118
fn step_22() -> Unit raise {
  @printer.parse_as_infix(":>", (28L, "right"))
}

///|
/// component_compose
fn step_23() -> Unit raise {
  component_compose_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(op_colon_gt : (Component[S, T], Component[T, U]) -> Component[S, U])((c1 : Component[S, T]), (c2 : Component[T, U])) == component((o(read(c2), read(c1)), (v : U) => (s : S) => write(c1, write(c2, v, read(c1, s)), s)))"),
    ),
  )
}

///|
let component_compose_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "component_compose",
)

///|
/// `component_compose`
pub fn component_compose() -> @kernel.Thm {
  component_compose_c.get()
}

///|
/// COMPONENT_COMPOSE_ASSOC
fn step_24() -> Unit raise {
  let t18 = @simp.rewrite_tac(
    @list.List([
      forall_component(),
      component_compose(),
      read(),
      write(),
      @trivia.o_def(),
    ]),
  )
  component_compose_assoc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ sc1 : Component[_, _], ∀ sc2 : Component[_, _], ∀ sc3 : Component[_, _], op_colon_gt(sc1, op_colon_gt(sc2, sc3)) == op_colon_gt(op_colon_gt(sc1, sc2), sc3)"),
      t18,
    ),
  )
}

///|
let component_compose_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COMPONENT_COMPOSE_ASSOC",
)

///|
/// `COMPONENT_COMPOSE_ASSOC`
pub fn component_compose_assoc() -> @kernel.Thm {
  component_compose_assoc_c.get()
}

///|
/// READ_COMPONENT_COMPOSE
fn step_25() -> Unit raise {
  let t19 = @simp.rewrite_tac(
    @list.List([
      forall_component(),
      read(),
      component_compose(),
      read(),
      write(),
      @trivia.o_def(),
    ]),
  )
  read_component_compose_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ sc1 : Component[_, _], ∀ sc2 : Component[_, _], ∀ s : _, read(op_colon_gt(sc1, sc2), s) == read(sc2, read(sc1, s))"),
      t19,
    ),
  )
}

///|
let read_component_compose_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "READ_COMPONENT_COMPOSE",
)

///|
/// `READ_COMPONENT_COMPOSE`
pub fn read_component_compose() -> @kernel.Thm {
  read_component_compose_c.get()
}

///|
/// WRITE_COMPONENT_COMPOSE
fn step_26() -> Unit raise {
  let t20 = @simp.rewrite_tac(
    @list.List([forall_component(), read(), write(), component_compose()]),
  )
  write_component_compose_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ sc1 : Component[_, _], ∀ sc2 : Component[_, _], ∀ s : _, ∀ x : _, write(op_colon_gt(sc1, sc2), x, s) == write(sc1, write(sc2, x, read(sc1, s)), s)"),
      t20,
    ),
  )
}

///|
let write_component_compose_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "WRITE_COMPONENT_COMPOSE",
)

///|
/// `WRITE_COMPONENT_COMPOSE`
pub fn write_component_compose() -> @kernel.Thm {
  write_component_compose_c.get()
}

///|
/// COMPOSE_ENTIRETY
fn step_27() -> Unit raise {
  let t21 = @simp.rewrite_tac(
    @list.List([
      forall_component(),
      component_compose(),
      entirety(),
      @class.fun_eq_thm(),
      read(),
      write(),
      component_eq(),
      @trivia.o_def(),
    ]),
  )
  compose_entirety_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(∀ c : Component[_, _], op_colon_gt(c, entirety) == c) && (∀ c : Component[_, _], op_colon_gt(entirety, c) == c)"),
      t21,
    ),
  )
}

///|
let compose_entirety_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "COMPOSE_ENTIRETY",
)

///|
/// `COMPOSE_ENTIRETY`
pub fn compose_entirety() -> @kernel.Thm {
  compose_entirety_c.get()
}

///|
/// READ_WRITE_COMPONENT_COMPOSE
fn step_28() -> Unit raise {
  let t22 = @simp.simp_tac(
    @list.List([read_component_compose(), write_component_compose()]),
  )
  read_write_component_compose_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ sc1 : Component[_, _], ∀ sc2 : Component[_, _], (∀ y : _, ∀ s : _, read(sc1, write(sc1, y, s)) == y) && (∀ y : _, ∀ s : _, read(sc2, write(sc2, y, s)) == y) → (∀ y : _, ∀ s : _, read(op_colon_gt(sc1, sc2), write(op_colon_gt(sc1, sc2), y, s)) == y)"),
      t22,
    ),
  )
}

///|
let read_write_component_compose_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "READ_WRITE_COMPONENT_COMPOSE",
)

///|
/// `READ_WRITE_COMPONENT_COMPOSE`
pub fn read_write_component_compose() -> @kernel.Thm {
  read_write_component_compose_c.get()
}

///|
/// read_over_write
fn step_29() -> Unit raise {
  read_over_write_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(read_over_write : (Component[S, A]) -> Bool)((c : Component[S, A])) == (∀ y : A, ∀ s : S, read(c, write(c, y, s)) == y)"),
    ),
  )
}

///|
let read_over_write_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "read_over_write",
)

///|
/// `read_over_write`
pub fn read_over_write() -> @kernel.Thm {
  read_over_write_c.get()
}

///|
/// write_over_write
fn step_30() -> Unit raise {
  write_over_write_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(write_over_write : (Component[S, A]) -> Bool)((c : Component[S, A])) == (∀ y : A, ∀ z : A, ∀ s : S, write(c, z, write(c, y, s)) == write(c, z, s))"),
    ),
  )
}

///|
let write_over_write_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "write_over_write",
)

///|
/// `write_over_write`
pub fn write_over_write() -> @kernel.Thm {
  write_over_write_c.get()
}

///|
/// write_over_read
fn step_31() -> Unit raise {
  write_over_read_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(write_over_read : (Component[S, A]) -> Bool)((c : Component[S, A])) == (∀ s : S, write(c, read(c, s), s) == s)"),
    ),
  )
}

///|
let write_over_read_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "write_over_read",
)

///|
/// `write_over_read`
pub fn write_over_read() -> @kernel.Thm {
  write_over_read_c.get()
}

///|
/// weak_read_over_write
fn step_32() -> Unit raise {
  weak_read_over_write_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(weak_read_over_write : (Component[S, A]) -> Bool)((c : Component[S, A])) == (∃ f : (A) -> A, ∀ y : A, ∀ s : S, read(c, write(c, y, s)) == f(y))"),
    ),
  )
}

///|
let weak_read_over_write_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "weak_read_over_write",
)

///|
/// `weak_read_over_write`
pub fn weak_read_over_write() -> @kernel.Thm {
  weak_read_over_write_c.get()
}

///|
/// valid_component
fn step_33() -> Unit raise {
  valid_component_c.set(
    @define.define_(
      @term_syntax.parse_term("(valid_component : (Component[_, _]) -> Bool)((c : Component[_, _])) == ((∀ y : _, ∀ s : _, read(c, write(c, y, s)) == y) && (∀ y : _, ∀ z : _, ∀ s : _, write(c, z, write(c, y, s)) == write(c, z, s)))"),
    ),
  )
}

///|
let valid_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "valid_component",
)

///|
/// `valid_component`
pub fn valid_component() -> @kernel.Thm {
  valid_component_c.get()
}

///|
/// VALID_COMPONENT_COMPOSE
fn step_34() -> Unit raise {
  let t24 = @simp.asm_rewrite_tac(
    @list.List([write_component_compose(), read_component_compose()]),
  )
  let t23 = @simp.rewrite_tac(@list.List([valid_component()]))
  let t25 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t23),
      @tactics.strip_tac,
    ),
    t24,
  )
  valid_component_compose_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ c1 : Component[_, _], ∀ c2 : Component[_, _], valid_component(c1) && valid_component(c2) → valid_component(op_colon_gt(c1, c2))"),
      t25,
    ),
  )
}

///|
let valid_component_compose_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "VALID_COMPONENT_COMPOSE",
)

///|
/// `VALID_COMPONENT_COMPOSE`
pub fn valid_component_compose() -> @kernel.Thm {
  valid_component_compose_c.get()
}

///|
/// VALID_COMPONENT_ENTIRETY
fn step_35() -> Unit raise {
  let t26 = @simp.rewrite_tac(
    @list.List([
      valid_component(),
      write_entirety(),
      read_entirety(),
      @trivia.i_def(),
    ]),
  )
  valid_component_entirety_c.set(
    @tactics.prove(@term_syntax.parse_term("(valid_component : (Component[_, _]) -> Bool)((entirety : Component[_, _]))"), t26),
  )
}

///|
let valid_component_entirety_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "VALID_COMPONENT_ENTIRETY",
)

///|
/// `VALID_COMPONENT_ENTIRETY`
pub fn valid_component_entirety() -> @kernel.Thm {
  valid_component_entirety_c.get()
}

///|
/// Library/components.ml:189
fn step_36() -> Unit raise {
  add_valid_component_thms(@list.List([valid_component_entirety()]))
}

///|
/// weakly_valid_component
fn step_37() -> Unit raise {
  weakly_valid_component_c.set(
    @define.define_(
      @term_syntax.parse_term("(weakly_valid_component : (Component[_, _]) -> Bool)((c : Component[_, _])) == ((∃ f : (_) -> _, ∀ y : _, ∀ s : _, read(c, write(c, y, s)) == f(y)) && (∀ y : _, ∀ z : _, ∀ s : _, write(c, z, write(c, y, s)) == write(c, z, s)))"),
    ),
  )
}

///|
let weakly_valid_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "weakly_valid_component",
)

///|
/// `weakly_valid_component`
pub fn weakly_valid_component() -> @kernel.Thm {
  weakly_valid_component_c.get()
}

///|
/// VALID_IMP_WEAKLY_VALID_COMPONENT
fn step_38() -> Unit raise {
  let t30 = @simp.asm_rewrite_tac(@list.List([]))
  let t29 = @tactics.exists_tac(@term_syntax.parse_term("(x : V) => x"))
  let t28 = @simp.asm_rewrite_tac(@list.List([]))
  let t27 = @tactics.repeat_tac(@tactics.strip_tac)
  let t31 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([valid_component(), weakly_valid_component()]),
          ),
          t27,
        ),
        t28,
      ),
      t29,
    ),
    t30,
  )
  valid_imp_weakly_valid_component_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ c : Component[S, V], valid_component(c) → weakly_valid_component(c)"),
      t31,
    ),
  )
}

///|
let valid_imp_weakly_valid_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "VALID_IMP_WEAKLY_VALID_COMPONENT",
)

///|
/// `VALID_IMP_WEAKLY_VALID_COMPONENT`
pub fn valid_imp_weakly_valid_component() -> @kernel.Thm {
  valid_imp_weakly_valid_component_c.get()
}

///|
/// WEAKLY_VALID_COMPONENT_ENTIRETY
fn step_39() -> Unit raise {
  let t32 = @simp.simp_tac(
    @list.List([valid_imp_weakly_valid_component(), valid_component_entirety()]),
  )
  weakly_valid_component_entirety_c.set(
    @tactics.prove(@term_syntax.parse_term("(weakly_valid_component : (Component[_, _]) -> Bool)((entirety : Component[_, _]))"), t32),
  )
}

///|
let weakly_valid_component_entirety_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "WEAKLY_VALID_COMPONENT_ENTIRETY",
)

///|
/// `WEAKLY_VALID_COMPONENT_ENTIRETY`
pub fn weakly_valid_component_entirety() -> @kernel.Thm {
  weakly_valid_component_entirety_c.get()
}

///|
/// Library/components.ml:210
fn step_40() -> Unit raise {
  add_weakly_valid_component_thms(
    @list.List([weakly_valid_component_entirety()]),
  )
}

///|
/// strongly_valid_component
fn step_41() -> Unit raise {
  strongly_valid_component_c.set(
    @define.define_(
      @term_syntax.parse_term("(strongly_valid_component : (Component[_, _]) -> Bool)((c : Component[_, _])) == ((∀ y : _, ∀ s : _, read(c, write(c, y, s)) == y) && (∀ s : _, write(c, read(c, s), s) == s) && (∀ y : _, ∀ z : _, ∀ s : _, write(c, z, write(c, y, s)) == write(c, z, s)))"),
    ),
  )
}

///|
let strongly_valid_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "strongly_valid_component",
)

///|
/// `strongly_valid_component`
pub fn strongly_valid_component() -> @kernel.Thm {
  strongly_valid_component_c.get()
}

///|
/// STRONGLY_VALID_IMP_VALID_COMPONENT
fn step_42() -> Unit raise {
  let t33 = @simp.simp_tac(
    @list.List([valid_component(), strongly_valid_component()]),
  )
  strongly_valid_imp_valid_component_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ c : Component[S, V], strongly_valid_component(c) → valid_component(c)"),
      t33,
    ),
  )
}

///|
let strongly_valid_imp_valid_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "STRONGLY_VALID_IMP_VALID_COMPONENT",
)

///|
/// `STRONGLY_VALID_IMP_VALID_COMPONENT`
pub fn strongly_valid_imp_valid_component() -> @kernel.Thm {
  strongly_valid_imp_valid_component_c.get()
}

///|
/// STRONGLY_VALID_COMPONENT_COMPOSE
fn step_43() -> Unit raise {
  let t35 = @simp.asm_rewrite_tac(
    @list.List([write_component_compose(), read_component_compose()]),
  )
  let t34 = @simp.rewrite_tac(@list.List([strongly_valid_component()]))
  let t36 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t34),
      @tactics.strip_tac,
    ),
    t35,
  )
  strongly_valid_component_compose_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ c1 : Component[_, _], ∀ c2 : Component[_, _], strongly_valid_component(c1) && strongly_valid_component(c2) → strongly_valid_component(op_colon_gt(c1, c2))"),
      t36,
    ),
  )
}

///|
let strongly_valid_component_compose_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "STRONGLY_VALID_COMPONENT_COMPOSE",
)

///|
/// `STRONGLY_VALID_COMPONENT_COMPOSE`
pub fn strongly_valid_component_compose() -> @kernel.Thm {
  strongly_valid_component_compose_c.get()
}

///|
/// STRONGLY_VALID_COMPONENT_ENTIRETY
fn step_44() -> Unit raise {
  let t37 = @simp.rewrite_tac(
    @list.List([strongly_valid_component(), read_entirety(), write_entirety()]),
  )
  strongly_valid_component_entirety_c.set(
    @tactics.prove(@term_syntax.parse_term("(strongly_valid_component : (Component[_, _]) -> Bool)((entirety : Component[_, _]))"), t37),
  )
}

///|
let strongly_valid_component_entirety_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "STRONGLY_VALID_COMPONENT_ENTIRETY",
)

///|
/// `STRONGLY_VALID_COMPONENT_ENTIRETY`
pub fn strongly_valid_component_entirety() -> @kernel.Thm {
  strongly_valid_component_entirety_c.get()
}

///|
/// Library/components.ml:236
fn step_45() -> Unit raise {
  add_strongly_valid_component_thms(
    @list.List([strongly_valid_component_entirety()]),
  )
}

///|
/// extensionally_valid_component
fn step_46() -> Unit raise {
  extensionally_valid_component_c.set(
    @define.define_(
      @term_syntax.parse_term("(extensionally_valid_component : (Component[S, A]) -> Bool)((c : Component[S, A])) == ((∃ f : (A) -> A, ∀ y : A, ∀ s : S, read(c, write(c, y, s)) == f(y)) && (∀ s : S, write(c, read(c, s), s) == s) && (∀ y : A, ∀ z : A, ∀ s : S, write(c, z, write(c, y, s)) == write(c, z, s)))"),
    ),
  )
}

///|
let extensionally_valid_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "extensionally_valid_component",
)

///|
/// `extensionally_valid_component`
pub fn extensionally_valid_component() -> @kernel.Thm {
  extensionally_valid_component_c.get()
}

///|
/// STRONGLY_VALID_IMP_EXTENSIONALLY_VALID_COMPONENT
fn step_47() -> Unit raise {
  let t41 = @simp.asm_rewrite_tac(@list.List([]))
  let t40 = @tactics.exists_tac(@term_syntax.parse_term("(x : V) => x"))
  let t39 = @simp.asm_rewrite_tac(@list.List([]))
  let t38 = @tactics.repeat_tac(@tactics.strip_tac)
  let t42 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.rewrite_tac(
            @list.List([
              extensionally_valid_component(),
              strongly_valid_component(),
            ]),
          ),
          t38,
        ),
        t39,
      ),
      t40,
    ),
    t41,
  )
  strongly_valid_imp_extensionally_valid_component_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ c : Component[S, V], strongly_valid_component(c) → extensionally_valid_component(c)"),
      t42,
    ),
  )
}

///|
let strongly_valid_imp_extensionally_valid_component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "STRONGLY_VALID_IMP_EXTENSIONALLY_VALID_COMPONENT",
)

///|
/// `STRONGLY_VALID_IMP_EXTENSIONALLY_VALID_COMPONENT`
pub fn strongly_valid_imp_extensionally_valid_component() -> @kernel.Thm {
  strongly_valid_imp_extensionally_valid_component_c.get()
}

///|
/// EXTENSIONALLY_VALID_COMPONENT_ENTIRETY
fn step_48() -> Unit raise {
  let t43 = @simp.simp_tac(
    @list.List([
      strongly_valid_component_entirety(),
      strongly_valid_imp_extensionally_valid_component(),
    ]),
  )
  extensionally_valid_component_entirety_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(extensionally_valid_component : (Component[_, _]) -> Bool)((entirety : Component[_, _]))"),
      t43,
    ),
  )
}

///|
let extensionally_valid_component_entirety_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EXTENSIONALLY_VALID_COMPONENT_ENTIRETY",
)

///|
/// `EXTENSIONALLY_VALID_COMPONENT_ENTIRETY`
pub fn extensionally_valid_component_entirety() -> @kernel.Thm {
  extensionally_valid_component_entirety_c.get()
}

///|
/// Library/components.ml:260
fn step_49() -> Unit raise {
  add_extensionally_valid_component_thms(
    @list.List([extensionally_valid_component_entirety()]),
  )
}

///|
/// orthogonal_components
fn step_50() -> Unit raise {
  orthogonal_components_c.set(
    @define.define_(
      @term_syntax.parse_term("(orthogonal_components : (Component[_, _], Component[_, _]) -> Bool)((sc1 : Component[_, _]), (sc2 : Component[_, _])) == ((∀ y : _, ∀ z : _, ∀ s : _, write(sc1, y, write(sc2, z, s)) == write(sc2, z, write(sc1, y, s))) && (∀ y : _, ∀ s : _, read(sc2, write(sc1, y, s)) == read(sc2, s)) && (∀ z : _, ∀ s : _, read(sc1, write(sc2, z, s)) == read(sc1, s)))"),
    ),
  )
}

///|
let orthogonal_components_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "orthogonal_components",
)

///|
/// `orthogonal_components`
pub fn orthogonal_components() -> @kernel.Thm {
  orthogonal_components_c.get()
}

///|
/// ORTHOGONAL_COMPONENTS_SYM
fn step_51() -> Unit raise {
  let t44 = @meson.meson_tac(@list.List([]))
  let t45 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([orthogonal_components()])),
    t44,
  )
  orthogonal_components_sym_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ sc1 : Component[_, _], ∀ sc2 : Component[_, _], orthogonal_components(sc1, sc2) == orthogonal_components(sc2, sc1)"),
      t45,
    ),
  )
}

///|
let orthogonal_components_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ORTHOGONAL_COMPONENTS_SYM",
)

///|
/// `ORTHOGONAL_COMPONENTS_SYM`
pub fn orthogonal_components_sym() -> @kernel.Thm {
  orthogonal_components_sym_c.get()
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
}
