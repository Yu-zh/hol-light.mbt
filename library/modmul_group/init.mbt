// Library/modmul_group.ml: the load steps are generated (modmul_group.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Library/modmul_group.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @grouptheory.load()
  @primitive.load()
  @theory.begin_theory("Library/modmul_group")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Library/modmul_group.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
