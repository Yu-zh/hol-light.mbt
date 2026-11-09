// Tutorial/Custom_tactics.ml: the load steps are generated (Custom_tactics.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Tutorial/Custom_tactics.ml (once), after the files it needs.
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
  @theory.begin_theory("Tutorial/Custom_tactics")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Tutorial/Custom_tactics.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
