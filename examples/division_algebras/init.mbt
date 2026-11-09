// Examples/division_algebras.ml: the load steps are generated (division_algebras.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/division_algebras.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @moretop.load()
  @theory.begin_theory("Examples/division_algebras")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Examples/division_algebras.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
