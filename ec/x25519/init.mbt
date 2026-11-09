// EC/x25519.ml: the load steps are generated (x25519.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load EC/x25519.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @curve25519.load()
  @xzprojective.load()
  @theory.begin_theory("EC/x25519")
  load_steps() catch {
    e => abort("HOL Light: loading EC/x25519.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
