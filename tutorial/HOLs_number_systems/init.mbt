// Tutorial/HOLs_number_systems.ml: the load steps are generated (HOLs_number_systems.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Tutorial/HOLs_number_systems.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @cooper.load()
  @rqe_make.load()
  @theory.begin_theory("Tutorial/HOLs_number_systems")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Tutorial/HOLs_number_systems.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
