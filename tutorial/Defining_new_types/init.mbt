// Tutorial/Defining_new_types.ml: the load steps are generated (Defining_new_types.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Tutorial/Defining_new_types.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @products.skip_load()
  @iter.skip_load()
  @metric.skip_load()
  @frag.skip_load()
  @prime.skip_load()
  @grouptheory.skip_load()
  @homology.skip_load()
  @Vectors.load()
  @theory.begin_theory("Tutorial/Defining_new_types")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Tutorial/Defining_new_types.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
