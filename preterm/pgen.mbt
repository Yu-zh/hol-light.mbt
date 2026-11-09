// ===========================================================================
// The preterms HOL's parser built for set comprehensions and pattern
// clauses, numbering GEN%PVAR variables as it did: the term syntax builds
// them so, and the library's goldens keep upstream's numbering.
// ===========================================================================

///|
fn pv(s : String) -> Preterm {
  Varp(s, dpty)
}

///|
/// Free "variables" of a preterm (identifiers that are not constants,
/// numerals or interface names).
pub fn pfrees(ptm : Preterm) -> List[Preterm] raise {
  match ptm {
    Varp(v, pty) =>
      if v == "" && pty == dpty {
        @list.List([])
      } else if @lib.can(c => @kernel.get_const_type(c), v) ||
        @lib.can(@num.num_of_string, v) ||
        @printer.the_interface.val.any(e => e.0 == v) {
        @list.List([])
      } else {
        @list.singleton(ptm)
      }
    Constp(_) => @list.List([])
    Combp(p1, p2) => {
      // `union (pfrees p1) (pfrees p2)`: arguments right to left.
      let f2 = pfrees(p2)
      @lib.union(pfrees(p1), f2)
    }
    Absp(p1, p2) => {
      let f1 = pfrees(p1)
      @lib.subtract(pfrees(p2), f1)
    }
    Typing(p, _) => pfrees(p)
  }
}

///|
let pgen_counter : Ref[Int] = Ref::{ val: 0, }

///|
fn pgenvar() -> Preterm {
  let count = pgen_counter.val
  pgen_counter.val = count + 1
  pv("GEN%PVAR%" + count.to_string())
}

///|
fn pmk_exists(v : Preterm, ptm : Preterm) -> Preterm {
  Combp(pv("?"), Absp(v, ptm))
}

///|
/// `{fabs | bvs | babs}`: GSPEC (\GEN%PVAR%n. ?bvs. SETSPEC GEN%PVAR%n babs
/// fabs). Also the term syntax's elaboration of set comprehensions, so that
/// both number GEN%PVAR alike.
pub fn pmk_setcompr(
  fabs : Preterm,
  bvs : List[Preterm],
  babs : Preterm,
) -> Preterm {
  let v = pgenvar()
  let bod = @lib.itlist(
    pmk_exists,
    bvs,
    Combp(Combp(Combp(pv("SETSPEC"), v), babs), fabs),
  )
  Combp(pv("GSPEC"), Absp(v, bod))
}

///|
/// `{fabs | babs}`, binding the variables free in both (all those of `fabs`
/// when it has at most one, or `babs` has none).
pub fn pmk_setabs(fabs : Preterm, babs : Preterm) -> Preterm raise {
  let fvs = pfrees(fabs)
  let bvs = pfrees(babs)
  let evs = if fvs.length() <= 1 || bvs.is_empty() {
    fvs
  } else {
    @lib.intersect(fvs, bvs)
  }
  pmk_setcompr(fabs, evs, babs)
}

///|
fn pmk_geq(s : Preterm, t : Preterm) -> Preterm {
  Combp(Combp(pv("GEQ"), s), t)
}

///|
/// `pmk_pattern`, the clause binding the variables `vs` gives (the
/// pattern's free variables, as `pmk_pattern` computes them, where the
/// pattern is read differently from the names it binds: the term syntax).
pub fn pmk_pattern_binding(
  pgr : ((Preterm, List[Preterm]), Preterm),
  vs : () -> List[Preterm] raise,
) -> Preterm raise {
  let ((pat, guards), res) = pgr
  let x = pgenvar()
  let y = pgenvar()
  let vs = vs()
  let bod = if guards.is_empty() {
    Combp(
      Combp(pv("_UNGUARDED_PATTERN"), pmk_geq(pat, x)),
      pmk_geq(res, y),
    )
  } else {
    Combp(
      Combp(
        Combp(pv("_GUARDED_PATTERN"), pmk_geq(pat, x)),
        @lib.hd(guards),
      ),
      pmk_geq(res, y),
    )
  }
  Absp(x, Absp(y, @lib.itlist(pmk_exists, vs, bod)))
}

///|
/// Run `f` and restore the GEN%PVAR counter (which set comprehensions
/// advance) to what it was: a reading that is only checked leaves later
/// generated names as they were.
pub fn[T] with_pgen_counter_restored(f : () -> T raise) -> T raise {
  let start = pgen_counter.val
  defer { pgen_counter.val = start }
  f()
}

///|
/// Take `n` GEN%PVAR names unused: the names HOL's parser takes reading a
/// set comprehension's element in the alternatives it tries first (the
/// term syntax reads it once).
pub fn skip_pgenvars(n : Int) -> Unit {
  pgen_counter.val = pgen_counter.val + n
}

///|
/// The GEN%PVAR counter.
pub fn pgen_count() -> Int {
  pgen_counter.val
}
