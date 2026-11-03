// The record tests of upstream's UnitTests/records.ml: no theory defines an
// automatic record type while it loads, so define_auto_record_type and
// record_read_write_thms run only here. They live in a package of their own
// because defining test_point would change what records' reference test
// sees of the kernel's types and constants.

///|
test "define_auto_record_type adds a record's read/write theorems" {
  @records.load()
  let (ith, _, cth) = @records.define_auto_record_type(
    "test_point = { xcoord: num; ycoord: num }",
  )
  assert_eq(@records.get_record_components(cth).length(), 2)
  let rw = @records.record_read_write_thms(ith, cth)
  assert_eq(rw.length(), 2)
  for th in rw {
    assert_eq(@kernel.hyp(th), @list.List([]))
  }
}
