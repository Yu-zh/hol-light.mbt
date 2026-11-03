// A test of IEEE/float_thms.hl's dump_fl_*_info tactics, which upstream
// defines for proofs about floats but no theory calls, upstream or here.

///|
test "dump_fl_*_info label what is_float gives" {
  @float_thms.load()
  let tm = @term_syntax.parse_term
  let x = tm("(x : Real)")
  let isfloat = @kernel.assume_rule(
    tm("is_float((fmt : Flformat), (x : Real))"),
  )
  let cases : Array[
    ((@kernel.Thm, String) -> @tactics.Tactic raise, String, Array[String]),
  ] = [
    (@float_thms.dump_fl_ge_info, "greatest_e", ["xgeeq", "xgebig1", "xgebig2"]),
    (
      @float_thms.dump_fl_gm_info,
      "greatest_m",
      ["xgmeq", "xgmgeq1", "xgmltr", "xgmbig1", "xgmbig2"],
    ),
    (@float_thms.dump_fl_gr_info, "greatest_r", ["xgreq", "xgrleq"]),
  ]
  for c in cases {
    let (dump, name, labels) = c
    let (_, goals, _) = dump(isfloat, "x")((@list.List([]), tm("true")))
    // one goal, unchanged, with the labelled facts about the chosen witness
    // assumed
    assert_eq(goals.length(), 1)
    let (asl, w) = goals.head().unwrap()
    assert_eq(w, tm("true"))
    for l in labels {
      ignore(@lib.assoc(l, asl))
    }
    // the first label equates the greatest_* of x with the witness
    let (lhs, _) = @kernel.dest_eq(@kernel.concl(@lib.assoc(labels[0], asl)))
    assert_true(@kernel.frees(lhs).iter().any(v => v == x))
    let consts = @basics.find_terms(@kernel.is_const, lhs).map(c => {
      @kernel.dest_const(c).0
    })
    assert_true(consts.iter().any(n => n == name))
  }
}
