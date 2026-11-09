// Examples/zolotarev.ml: the load steps are generated (zolotarev.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Examples/zolotarev.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @jacobi.load()
  @permutations.load()
  @theory.begin_theory("Examples/zolotarev")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Examples/zolotarev.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
