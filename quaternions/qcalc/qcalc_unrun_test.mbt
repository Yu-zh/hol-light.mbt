// A test of Quaternions/qcalc.hl's dest_quat, which no theory calls while
// it loads: it takes quat(a, b, c, d) apart.

///|
test "dest_quat takes a quaternion literal apart" {
  @qcalc.load()
  let parts = ["(a : Real)", "(b : Real)", "(c : Real)", "(d : Real)"].map(s => {
    @term_syntax.parse_term(s)
  })
  let q = @term_syntax.parse_term(
    "quat(((a : Real), (b : Real), (c : Real), (d : Real)))",
  )
  let (t1, t2, t3, t4) = @qcalc.dest_quat(q)
  assert_eq([t1, t2, t3, t4], parts)
  let failed = try {
    ignore(@qcalc.dest_quat(parts[0]))
    false
  } catch {
    _ => true
  }
  assert_true(failed)
}
