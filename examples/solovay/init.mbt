// Examples/solovay.ml: the load steps are generated (solovay.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/solovay.ml (once), after the files it needs.
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
  @misc.load()
  @vectors.load()
  @sos.load()
  @rqe_make.load()
  @theory.begin_theory("Examples/solovay")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Examples/solovay.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
