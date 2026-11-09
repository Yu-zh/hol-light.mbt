// Library/rabin_test.ml: the load steps are generated (rabin_test_ml.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Library/rabin_test.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @fieldtheory.load()
  @theory.begin_theory("Library/rabin_test")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Library/rabin_test.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
