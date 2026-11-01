// How the term syntax reads names, independently of when it reads them.
//
// HOL's quotations resolve an overloaded name (+, <=, &, abs, ...) through
// the interface, whose entries packages add, replace (override_interface)
// and reorder (prioritize_real() and the like), so a quotation's meaning
// depends on when it runs. The term syntax instead reads names through a
// fixed view of it: every overload of an overloadable symbol
// (the_overload_skeletons) to a constant that the interface was ever given
// (@preterm.overload_registry, which only grows), plus the names the syntax
// itself spells (existsunique for ?!), without package aliases such as <=.
// or +.; and ordered by a fixed preference (num, int, real, complex, then
// the full type and the constant's name) instead of the current priority. A
// name the types do not pin down then means the same whenever it is read.

///|
/// Whether the term syntax reads names through the fixed view. Off while
/// the quotations already migrated are checked against it (spellings must
/// read the same both ways); on once they all do.
pub let fixed_resolution : Ref[Bool] = Ref::{ val: true }

///|
/// Run `f` with names read through the fixed view or the live interface.
fn[T] with_resolution(fixed : Bool, f : () -> T raise) -> T raise {
  let saved = fixed_resolution.val
  fixed_resolution.val = fixed
  defer {
    fixed_resolution.val = saved
  }
  f()
}

///|
let fixed_names : Array[String] = ["existsunique"]

///|
/// The rank of an overload of `sym` at type `ty`: by the type its
/// skeleton's variable takes.
fn overload_rank(sym : String, ty : @kernel.HolType) -> (Int, String) {
  let skeleton = @printer.the_overload_skeletons.val
    .iter()
    .find_first(sk => sk.0 == sym)
  let inst = match skeleton {
    Some((_, gty)) =>
      try @basics.type_match(gty, ty, @list.List([])) catch {
        _ => @list.List([])
      }
    None => @list.List([])
  }
  let name = match inst.iter().find_first(_ => true) {
    Some((t, _)) => @printer.string_of_type(t) catch { _ => "" }
    None => ""
  }
  let rank = match name {
    "num" => 0
    "int" => 1
    "real" => 2
    "complex" | "real^2" => 3
    _ => 4
  }
  (rank, name)
}

///|
let fixed_cache : Ref[
  (
    @list.List[(String, (String, @kernel.HolType))],
    @list.List[(String, @kernel.HolType)],
    @list.List[(String, (String, @kernel.HolType))],
    @list.List[(String, (String, @kernel.HolType))],
    Array[String],
    Ref[@list.List[(String, @kernel.HolType)]],
  )?,
] = Ref::{ val: None }

///|
/// Whether `name` is a constant now.
fn is_constant(name : String) -> Bool {
  try {
    ignore(@kernel.get_const_type(name))
    true
  } catch {
    _ => false
  }
}

///|
/// The interface the term syntax reads names through (see above): every
/// overload of an overloadable symbol to a constant the interface was ever
/// given (@preterm.overload_registry) or has now, so that replacing or
/// reordering entries changes nothing, plus the syntax's own names. An
/// overload can be declared before its constant is defined; the view leaves
/// it out until then, gains it then, and the cache remembers such overloads
/// and looks at them again only when the constants have changed.
fn fixed_interface() -> @list.List[(String, (String, @kernel.HolType))] {
  let live = @printer.the_interface.val
  let skeletons = @printer.the_overload_skeletons.val
  let registry = @preterm.overload_registry.val
  let constants = @kernel.constants()
  match fixed_cache.val {
    Some((l, sk, reg, view, pending, seen_constants)) if physical_equal(
        sk, skeletons,
      ) &&
      physical_equal(reg, registry) &&
      (physical_equal(l, live) || physical_equal(view, live)) => {
      if physical_equal(seen_constants.val, constants) {
        return view
      }
      if !pending.iter().any(is_constant) {
        seen_constants.val = constants
        return view
      }
    }
    _ => ()
  }
  let seen : Map[String, Bool] = Map::new()
  let entries = []
  let pending = []
  for e in registry.iter().concat(live.iter()) {
    let (sym, (name, ty)) = e
    let key = sym + "\u{0}" + name + "\u{0}" + (@printer.string_of_type(ty) catch { _ => "" })
    if seen.contains(key) {
      continue
    }
    seen[key] = true
    let overloaded = skeletons.iter().any(sk => sk.0 == sym)
    let defined = is_constant(name)
    if overloaded && !defined {
      pending.push(name)
    }
    if (overloaded && defined) || (fixed_names.contains(sym) && live.iter().any(l => l == e)) {
      entries.push(e)
    }
  }
  let keyed = entries.map(e => {
    let (rank, tyname) = overload_rank(e.0, e.1.1)
    let full = @printer.string_of_type(e.1.1) catch { _ => "" }
    ((e.0, rank, tyname, full, e.1.0), e)
  })
  keyed.sort_by((a, b) => {
    let (s1, r1, t1, f1, c1) = a.0
    let (s2, r2, t2, f2, c2) = b.0
    if s1 != s2 {
      s1.compare(s2)
    } else if r1 != r2 {
      r1.compare(r2)
    } else if t1 != t2 {
      t1.compare(t2)
    } else if f1 != f2 {
      f1.compare(f2)
    } else {
      c1.compare(c2)
    }
  })
  let view = @list.List(keyed.map(k => k.1))
  fixed_cache.val = Some(
    (live, skeletons, registry, view, pending, Ref::{ val: constants }),
  )
  view
}

///|
/// Run `f` with the term syntax's fixed view of the interface in place.
fn[T] with_fixed_interface(f : () -> T raise) -> T raise {
  let saved = @printer.the_interface.val
  @printer.the_interface.val = fixed_interface()
  defer {
    @printer.the_interface.val = saved
  }
  f()
}
