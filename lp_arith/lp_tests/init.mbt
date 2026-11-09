// LP_arith/lp_tests.ml: the load steps are generated (lp_tests.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load LP_arith/lp_tests.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @lp_arith.load()
  @theory.begin_theory("LP_arith/lp_tests")
  load_steps() catch {
    e =>
      abort("HOL Light: loading LP_arith/lp_tests.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load LP_arith/lp_tests.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("LP_arith/lp_tests")
  load_steps() catch {
    e =>
      abort("HOL Light: loading LP_arith/lp_tests.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
