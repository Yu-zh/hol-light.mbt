// Formal_ineqs/informal/informal_matan.ml: the load steps are generated (informal_matan.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Formal_ineqs/informal/informal_matan.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @informal_sin_cos.load()
  @informal_atn.load()
  @theory.begin_theory("Formal_ineqs/informal/informal_matan")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/informal/informal_matan.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}

///|
/// Load Formal_ineqs/informal/informal_matan.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @informal_atn.load()
  @theory.begin_theory("Formal_ineqs/informal/informal_matan")
  load_steps() catch {
    e =>
      abort(
        "HOL Light: loading Formal_ineqs/informal/informal_matan.ml failed: " +
        e.to_string(),
      )
  }
  @theory.end_theory()
}
