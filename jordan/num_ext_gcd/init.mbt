// Jordan/num_ext_gcd.ml: the load steps are generated (num_ext_gcd.mbt).

///|
let loaded : Ref[Bool] = Ref::{ val: false, }

///|
/// Load Jordan/num_ext_gcd.ml (once), after the files it needs.
pub fn load() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @tactics_ext.load()
  @theory.begin_theory("Jordan/num_ext_gcd")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Jordan/num_ext_gcd.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}

///|
/// Load Jordan/num_ext_gcd.ml (once) as `needs` does: after what it needs itself, not
/// after the files its directory's make.ml loads before it.
pub fn load_alone() -> Unit {
  if loaded.val {
    return
  }
  loaded.val = true
  @theory.begin_theory("Jordan/num_ext_gcd")
  load_steps() catch {
    e =>
      abort("HOL Light: loading Jordan/num_ext_gcd.ml failed: " + e.to_string())
  }
  @theory.end_theory()
}
