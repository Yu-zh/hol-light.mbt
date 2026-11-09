// Jordan/metric_spaces.ml: the load steps are generated (metric_spaces.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Jordan/metric_spaces.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @misc_defs_and_lemmas.load()
  @theory.begin_theory("Jordan/metric_spaces")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Jordan/metric_spaces.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Jordan/metric_spaces.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Jordan/metric_spaces")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Jordan/metric_spaces.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
