// Jordan/parse_ext_override_interface.ml: the load steps are generated (parse_ext_override_interface.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Jordan/parse_ext_override_interface.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @tactics_fix.load()
  @theory.begin_theory("Jordan/parse_ext_override_interface")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Jordan/parse_ext_override_interface.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Jordan/parse_ext_override_interface.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Jordan/parse_ext_override_interface")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Jordan/parse_ext_override_interface.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
