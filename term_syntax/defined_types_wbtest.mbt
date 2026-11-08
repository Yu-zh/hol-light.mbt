///|
test "names being defined are not printed as others" {
  // while enum Zz_d and enum `zz_e` are read, those spellings name them, so
  // a type variable is written another way, or not at all
  @grammar.with_defined_types(["Zz_d", "`zz_e`"], () => {
    let unprintable = (ty : @kernel.HolType) => {
      (try Some(print_type(ty)) catch { _ => None }) is None
    }
    inspect(print_type(@kernel.mk_vartype("Zz_d")), content="`Zz_d`")
    assert_true(unprintable(@kernel.mk_vartype("zz_e")))
    inspect(print_type(@kernel.mk_vartype("zz_f")), content="`zz_f`")
  })
}
