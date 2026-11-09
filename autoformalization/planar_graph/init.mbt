// Autoformalization/planar_graph.ml: the load steps are generated (planar_graph.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Autoformalization/planar_graph.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @binary.skip_load()
  @clifford.skip_load()
  @moretop.load()
  @rstc.load()
  @theory.begin_theory("Autoformalization/planar_graph")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Autoformalization/planar_graph.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
