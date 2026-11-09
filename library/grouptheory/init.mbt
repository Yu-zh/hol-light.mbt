// Library/grouptheory.ml: the load steps are generated (grouptheory.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Library/grouptheory.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @frag.load()
  @card.load()
  @prime.load()
  if skipped.val {
    return
  }
  @theory.begin_theory("Library/grouptheory")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Library/grouptheory.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
let skipped : Ref[Bool] = Ref::{ val: false, }

///|
/// Leave this file's own steps out of what is loaded after this call: a
/// file that upstream loads without it (tools/ocaml_ref/theory.py,
/// CHAIN_SKIP).
pub fn skip_load() -> Unit {
  skipped.val = true
}
