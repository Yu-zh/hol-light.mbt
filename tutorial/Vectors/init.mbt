// Tutorial/Vectors.ml: the load steps are generated (Vectors.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Tutorial/Vectors.ml (once), after the files it needs.
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
  @vectors.load()
  @solovay.load()
  @theory.begin_theory("Tutorial/Vectors")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Tutorial/Vectors.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
