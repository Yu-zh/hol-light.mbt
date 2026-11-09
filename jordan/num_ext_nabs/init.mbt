// Jordan/num_ext_nabs.ml: the load steps are generated (num_ext_nabs.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Jordan/num_ext_nabs.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @num_ext_gcd.load()
  @theory.begin_theory("Jordan/num_ext_nabs")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Jordan/num_ext_nabs.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Jordan/num_ext_nabs.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Jordan/num_ext_nabs")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Jordan/num_ext_nabs.ml failed: " + e.to_string(),
      )
  }
  @theory.end_theory()
}
