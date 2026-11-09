// Autoformalization/hilbert_waring.ml: the load steps are generated (hilbert_waring.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Autoformalization/hilbert_waring.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @isum.load()
  @permutations.load()
  @schnirelmann.load()
  @theory.begin_theory("Autoformalization/hilbert_waring")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Autoformalization/hilbert_waring.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
