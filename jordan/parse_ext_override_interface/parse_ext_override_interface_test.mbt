// Tests of the interface switches Jordan/parse_ext_override_interface.ml
// defines for interactive use, which no theory calls while it loads. Each
// test puts the interface and the infixes back as it found them; the
// priority stack prioritize_* push cannot be emptied (pop_priority keeps
// its last entry, as upstream's does).

///|
fn interface_entries(sym : String) -> Array[String] {
  @printer.the_interface.val
  .iter()
  .filter(e => e.0 == sym)
  .map(e => e.1.0)
  .to_array()
}

///|
/// Put the interface and the infixes back as they were.
fn restore(
  interface : @list.List[(String, (String, @kernel.HolType))],
  infixes : @list.List[(String, (Int64, String))],
) -> Unit {
  @printer.the_interface.val = interface
  for e in @printer.infixes() {
    if !infixes.iter().any(i => i.0 == e.0) {
      @printer.unparse_as_infix(e.0)
    }
  }
}

///|
test "ambiguous_interface takes back what unambiguous_interface adds" {
  @parse_ext_override_interface.load()
  let (interface, infixes) = (@printer.the_interface.val, @printer.infixes())
  defer restore(interface, infixes)
  @parse_ext_override_interface.unambiguous_interface(())
  for sym in ["+|", "**|", "<=|", "+:", "--:", "&:", "+.", "||."] {
    assert_eq(interface_entries(sym).length(), 1)
  }
  @parse_ext_override_interface.ambiguous_interface(())
  for sym in ["+|", "**|", "<=|", "+:", "--:", "&:", "+.", "||."] {
    assert_eq(interface_entries(sym), [])
  }
  @parse_ext_override_interface.unambiguous_interface(())
  assert_eq(interface_entries("+:"), ["int_add"])
}

///|
test "prioritize_int and prioritize_num put their operations first" {
  @parse_ext_override_interface.load()
  let (interface, infixes) = (@printer.the_interface.val, @printer.infixes())
  defer restore(interface, infixes)
  @parse_ext_override_interface.prioritize_int(())
  assert_eq(@parse_ext_override_interface.get_priority(()), "int")
  for
    p in [
      ("+", "int_add"),
      ("<=", "int_le"),
      ("--", "int_neg"),
      ("abs", "int_abs"),
      ("&", "int_of_num"),
    ] {
    assert_eq(interface_entries(p.0)[0], p.1)
  }
  @parse_ext_override_interface.prioritize_num(())
  assert_eq(@parse_ext_override_interface.get_priority(()), "num")
  for p in [("+", "+"), ("<=", "<="), (">", ">")] {
    assert_eq(interface_entries(p.0)[0], p.1)
  }
  @parse_ext_override_interface.pop_priority(())
  assert_eq(@parse_ext_override_interface.get_priority(()), "int")
  @parse_ext_override_interface.pop_priority(())
}
