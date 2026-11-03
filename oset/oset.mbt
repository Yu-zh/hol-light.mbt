// Translated from upstream ocaml_set.ml; edit this file directly.

///|
/// `t`
#derive(Eq, Debug)
pub(all) enum T[TA] {
  Empty
  Node(T[TA], TA, T[TA], Int64)
}

///|
pub extend T with Eq::{not_equal, equal}

///|
pub extend T with Debug::{to_repr}

///|
pub extend T with @lib.OCompare::{ocompare}

///|
pub extend T with @lib.OHash::{ohash_visit}

///|
fn[TA] ocaml_rank_T(x : T[TA]) -> Int {
  match x {
    Empty => 0
    Node(_, _, _, _) => 1000000
  }
}

///|
pub impl[TA : @lib.OCompare] @lib.OCompare for T[TA] with fn ocompare(
  self,
  other,
) {
  match (self, other) {
    (Node(a0, a1, a2, a3), Node(b0, b1, b2, b3)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      let c = @lib.compare(a1, b1)
      if c != 0 {
        return c
      }
      let c = @lib.compare(a2, b2)
      if c != 0 {
        return c
      }
      @lib.compare(a3, b3)
    }
    _ => ocaml_rank_T(self).compare(ocaml_rank_T(other))
  }
}

///|
pub impl[TA : @lib.OHash] @lib.OHash for T[TA] with fn ohash_visit(self, h) {
  match self {
    Empty => h.int(0L)
    Node(a0, a1, a2, a3) => {
      h.block(0, 4)
      h.field(a0)
      h.field(a1)
      h.field(a2)
      h.field(a3)
    }
  }
}

///|
/// `height`
pub fn[TA] height(x1 : T[TA]) -> Int64 raise {
  match x1 {
    T::Empty => 0L
    T::Node(_, _, _, h) => h
  }
}

///|
/// `create`
pub fn[TA] create(x2 : T[TA], x3 : TA, x4 : T[TA]) -> T[TA] raise {
  let l = x2
  let v = x3
  let r = x4
  let hl = match l {
    T::Empty => 0L
    T::Node(_, _, _, h) => h
  }
  let hr = match r {
    T::Empty => 0L
    T::Node(_, _, _, h_1) => h_1
  }
  T::Node(
    l,
    v,
    r,
    if hl >= hr {
      @lib.add63(hl, 1L)
    } else {
      @lib.add63(hr, 1L)
    },
  )
}

///|
/// `bal`
pub fn[TA] bal(x5 : T[TA], x6 : TA, x7 : T[TA]) -> T[TA] raise {
  let l = x5
  let v = x6
  let r = x7
  let hl = match l {
    T::Empty => 0L
    T::Node(_, _, _, h) => h
  }
  let hr = match r {
    T::Empty => 0L
    T::Node(_, _, _, h_1) => h_1
  }
  if hl > @lib.add63(hr, 2L) {
    match l {
      T::Empty => raise @num.InvalidArgument("Set.bal")
      T::Node(ll, lv, lr, _) => {
        let t8 = height(lr)
        if height(ll) >= t8 {
          create(ll, lv, create(lr, v, r))
        } else {
          match lr {
            T::Empty => raise @num.InvalidArgument("Set.bal")
            T::Node(lrl, lrv, lrr, _) => {
              let t9 = create(lrr, v, r)
              create(create(ll, lv, lrl), lrv, t9)
            }
          }
        }
      }
    }
  } else if hr > @lib.add63(hl, 2L) {
    match r {
      T::Empty => raise @num.InvalidArgument("Set.bal")
      T::Node(rl, rv, rr, _) => {
        let t10 = height(rl)
        if height(rr) >= t10 {
          create(create(l, v, rl), rv, rr)
        } else {
          match rl {
            T::Empty => raise @num.InvalidArgument("Set.bal")
            T::Node(rll, rlv, rlr, _) => {
              let t11 = create(rlr, rv, rr)
              create(create(l, v, rll), rlv, t11)
            }
          }
        }
      }
    }
  } else {
    T::Node(
      l,
      v,
      r,
      if hl >= hr {
        @lib.add63(hl, 1L)
      } else {
        @lib.add63(hr, 1L)
      },
    )
  }
}

///|
/// `add`
pub fn[TA] add(
  x12 : (TA) -> ((TA) -> Int64 raise) raise,
  x13 : TA,
  x14 : T[TA],
) -> T[TA] raise {
  let ord = x12
  let x = x13
  match x14 {
    T::Empty => T::Node(T::Empty, x, T::Empty, 1L)
    T::Node(l, v, r, _) as t => {
      let c = ord(x)(v)
      if c == 0L {
        t
      } else if c < 0L {
        let ll = add(ord, x, l)
        if physical_equal(l, ll) {
          t
        } else {
          bal(ll, v, r)
        }
      } else {
        let rr = add(ord, x, r)
        if physical_equal(r, rr) {
          t
        } else {
          bal(l, v, rr)
        }
      }
    }
  }
}

///|
/// `singleton`
pub fn[TA] singleton(x15 : TA) -> T[TA] raise {
  let x = x15
  T::Node(T::Empty, x, T::Empty, 1L)
}

///|
/// `add_min_element`
pub fn[TA] add_min_element(x16 : TA, x17 : T[TA]) -> T[TA] raise {
  let x = x16
  match x17 {
    T::Empty => singleton(x)
    T::Node(l, v, r, _) => bal(add_min_element(x, l), v, r)
  }
}

///|
/// `add_max_element`
pub fn[TA] add_max_element(x18 : TA, x19 : T[TA]) -> T[TA] raise {
  let x = x18
  match x19 {
    T::Empty => singleton(x)
    T::Node(l, v, r, _) => bal(l, v, add_max_element(x, r))
  }
}

///|
/// `join`
pub fn[TA] join(x20 : T[TA], x21 : TA, x22 : T[TA]) -> T[TA] raise {
  let l = x20
  let v = x21
  let r = x22
  match (l, r) {
    (T::Empty, _) => add_min_element(v, r)
    (_, T::Empty) => add_max_element(v, l)
    (T::Node(ll, lv, lr, lh), T::Node(rl, rv, rr, rh)) =>
      if lh > @lib.add63(rh, 2L) {
        bal(ll, lv, join(lr, v, r))
      } else if rh > @lib.add63(lh, 2L) {
        bal(join(l, v, rl), rv, rr)
      } else {
        create(l, v, r)
      }
  }
}

///|
/// `min_elt`
pub fn[TA] min_elt(x23 : T[TA]) -> TA raise {
  match x23 {
    T::Empty => raise @lib.NotFound
    T::Node(T::Empty, v, _, _) => v
    T::Node(l, _, _, _) => min_elt(l)
  }
}

///|
/// `min_elt_opt`
pub fn[TA] min_elt_opt(x24 : T[TA]) -> TA? raise {
  match x24 {
    T::Empty => None
    T::Node(T::Empty, v, _, _) => Some(v)
    T::Node(l, _, _, _) => min_elt_opt(l)
  }
}

///|
/// `max_elt`
pub fn[TA] max_elt(x25 : T[TA]) -> TA raise {
  match x25 {
    T::Empty => raise @lib.NotFound
    T::Node(_, v, T::Empty, _) => v
    T::Node(_, _, r, _) => max_elt(r)
  }
}

///|
/// `max_elt_opt`
pub fn[TA] max_elt_opt(x26 : T[TA]) -> TA? raise {
  match x26 {
    T::Empty => None
    T::Node(_, v, T::Empty, _) => Some(v)
    T::Node(_, _, r, _) => max_elt_opt(r)
  }
}

///|
/// `remove_min_elt`
pub fn[TA] remove_min_elt(x27 : T[TA]) -> T[TA] raise {
  match x27 {
    T::Empty => raise @num.InvalidArgument("Set.remove_min_elt")
    T::Node(T::Empty, _, r, _) => r
    T::Node(l, v, r_1, _) => bal(remove_min_elt(l), v, r_1)
  }
}

///|
/// `merge`
pub fn[TA] merge(x28 : T[TA], x29 : T[TA]) -> T[TA] raise {
  let t1 = x28
  let t2 = x29
  match (t1, t2) {
    (T::Empty, t) => t
    (t_1, T::Empty) => t_1
    (_, _) => {
      let t30 = remove_min_elt(t2)
      bal(t1, min_elt(t2), t30)
    }
  }
}

///|
/// `concat`
pub fn[TA] concat(x31 : T[TA], x32 : T[TA]) -> T[TA] raise {
  let t1 = x31
  let t2 = x32
  match (t1, t2) {
    (T::Empty, t) => t
    (t_1, T::Empty) => t_1
    (_, _) => {
      let t33 = remove_min_elt(t2)
      join(t1, min_elt(t2), t33)
    }
  }
}

///|
/// `split`
pub fn[TA, TB] split(
  x34 : (TB) -> ((TA) -> Int64 raise) raise,
  x35 : TB,
  x36 : T[TA],
) -> (T[TA], Bool, T[TA]) raise {
  let ord = x34
  let x = x35
  match x36 {
    T::Empty => (T::Empty, false, T::Empty)
    T::Node(l, v, r, _) => {
      let c = ord(x)(v)
      if c == 0L {
        (l, true, r)
      } else if c < 0L {
        let (ll, pres, rl) = split(ord, x, l)
        (ll, pres, join(rl, v, r))
      } else {
        let (lr, pres_1, rr) = split(ord, x, r)
        (join(l, v, lr), pres_1, rr)
      }
    }
  }
}

///|
/// `empty`
pub fn[TA] empty() -> T[TA] {
  T::Empty
}

///|
/// `is_empty`
pub fn[TA] is_empty(x37 : T[TA]) -> Bool raise {
  match x37 {
    T::Empty => true
    _ => false
  }
}

///|
/// `mem`
pub fn[TA, TB] mem(
  x38 : (TB) -> ((TA) -> Int64 raise) raise,
  x39 : TB,
  x40 : T[TA],
) -> Bool raise {
  let ord = x38
  let x = x39
  match x40 {
    T::Empty => false
    T::Node(l, v, r, _) => {
      let c = ord(x)(v)
      c == 0L || mem(ord, x, if c < 0L { l } else { r })
    }
  }
}

///|
/// `remove`
pub fn[TA, TB] remove(
  x41 : (TB) -> ((TA) -> Int64 raise) raise,
  x42 : TB,
  x43 : T[TA],
) -> T[TA] raise {
  let ord = x41
  let x = x42
  match x43 {
    T::Empty => T::Empty
    T::Node(l, v, r, _) as t => {
      let c = ord(x)(v)
      if c == 0L {
        merge(l, r)
      } else if c < 0L {
        let ll = remove(ord, x, l)
        if physical_equal(l, ll) {
          t
        } else {
          bal(ll, v, r)
        }
      } else {
        let rr = remove(ord, x, r)
        if physical_equal(r, rr) {
          t
        } else {
          bal(l, v, rr)
        }
      }
    }
  }
}

///|
/// `union`
pub fn[TA] union(
  x44 : (TA) -> ((TA) -> Int64 raise) raise,
  x45 : T[TA],
  x46 : T[TA],
) -> T[TA] raise {
  let ord = x44
  let s1 = x45
  let s2 = x46
  match (s1, s2) {
    (T::Empty, t2) => t2
    (t1, T::Empty) => t1
    (T::Node(l1, v1, r1, h1), T::Node(l2, v2, r2, h2)) =>
      if h1 >= h2 {
        if h2 == 1L {
          add(ord, v2, s1)
        } else {
          let (l2_1, _, r2_1) = split(ord, v1, s2)
          let t47 = union(ord, r1, r2_1)
          join(union(ord, l1, l2_1), v1, t47)
        }
      } else if h1 == 1L {
        add(ord, v1, s2)
      } else {
        let (l1_1, _, r1_1) = split(ord, v2, s1)
        let t48 = union(ord, r1_1, r2)
        join(union(ord, l1_1, l2), v2, t48)
      }
  }
}

///|
/// `inter`
pub fn[TA, TB] inter(
  x49 : (TA) -> ((TB) -> Int64 raise) raise,
  x50 : T[TA],
  x51 : T[TB],
) -> T[TA] raise {
  let ord = x49
  let s1 = x50
  let s2 = x51
  match (s1, s2) {
    (T::Empty, _) => T::Empty
    (_, T::Empty) => T::Empty
    (T::Node(l1, v1, r1, _), t2) =>
      match split(ord, v1, t2) {
        (l2, false, r2) => {
          let t52 = inter(ord, r1, r2)
          concat(inter(ord, l1, l2), t52)
        }
        (l2_1, true, r2_1) => {
          let t53 = inter(ord, r1, r2_1)
          join(inter(ord, l1, l2_1), v1, t53)
        }
      }
  }
}

///|
/// `split_bis`
pub(all) enum SplitBis[TA] {
  Split_found
  Split_absent(T[TA], (Unit) -> T[TA] raise)
}

///|
/// `split_bis`
pub fn[TA, TB] split_bis(
  x54 : (TB) -> ((TA) -> Int64 raise) raise,
  x55 : TB,
  x56 : T[TA],
) -> SplitBis[TA] raise {
  let ord = x54
  let x = x55
  match x56 {
    T::Empty =>
      SplitBis::Split_absent(T::Empty, fn(x57 : Unit) -> T[TA] raise {
        let _ = x57
        T::Empty
      })
    T::Node(l, v, r, _) => {
      let c = ord(x)(v)
      if c == 0L {
        SplitBis::Split_found
      } else if c < 0L {
        match split_bis(ord, x, l) {
          SplitBis::Split_found => SplitBis::Split_found
          SplitBis::Split_absent(ll, rl) =>
            SplitBis::Split_absent(ll, fn(x58 : Unit) -> T[TA] raise {
              let _ = x58
              join(rl(()), v, r)
            })
        }
      } else {
        match split_bis(ord, x, r) {
          SplitBis::Split_found => SplitBis::Split_found
          SplitBis::Split_absent(lr, rr) =>
            SplitBis::Split_absent(join(l, v, lr), rr)
        }
      }
    }
  }
}

///|
/// `disjoint`
pub fn[TA] disjoint(
  x59 : (TA) -> ((TA) -> Int64 raise) raise,
  x60 : T[TA],
  x61 : T[TA],
) -> Bool raise {
  let ord = x59
  let s1 = x60
  let s2 = x61
  match (s1, s2) {
    (T::Empty, _) | (_, T::Empty) => true
    (T::Node(l1, v1, r1, _), t2) =>
      if physical_equal(s1, s2) {
        false
      } else {
        match split_bis(ord, v1, t2) {
          SplitBis::Split_absent(l2, r2) =>
            disjoint(ord, l1, l2) && disjoint(ord, r1, r2(()))
          SplitBis::Split_found => false
        }
      }
  }
}

///|
/// `diff`
pub fn[TA, TB] diff(
  x62 : (TA) -> ((TB) -> Int64 raise) raise,
  x63 : T[TA],
  x64 : T[TB],
) -> T[TA] raise {
  let ord = x62
  let s1 = x63
  let s2 = x64
  match (s1, s2) {
    (T::Empty, _) => T::Empty
    (t1, T::Empty) => t1
    (T::Node(l1, v1, r1, _), t2) =>
      match split(ord, v1, t2) {
        (l2, false, r2) => {
          let t65 = diff(ord, r1, r2)
          join(diff(ord, l1, l2), v1, t65)
        }
        (l2_1, true, r2_1) => {
          let t66 = diff(ord, r1, r2_1)
          concat(diff(ord, l1, l2_1), t66)
        }
      }
  }
}

///|
/// `enumeration`
#derive(Eq, Debug)
pub(all) enum Enumeration[TA] {
  End
  More(TA, T[TA], Enumeration[TA])
}

///|
pub extend Enumeration with Eq::{not_equal, equal}

///|
pub extend Enumeration with Debug::{to_repr}

///|
pub extend Enumeration with @lib.OCompare::{ocompare}

///|
pub extend Enumeration with @lib.OHash::{ohash_visit}

///|
fn[TA] ocaml_rank_Enumeration(x : Enumeration[TA]) -> Int {
  match x {
    End => 0
    More(_, _, _) => 1000000
  }
}

///|
pub impl[TA : @lib.OCompare] @lib.OCompare for Enumeration[TA] with fn ocompare(
  self,
  other,
) {
  match (self, other) {
    (More(a0, a1, a2), More(b0, b1, b2)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      let c = @lib.compare(a1, b1)
      if c != 0 {
        return c
      }
      @lib.compare(a2, b2)
    }
    _ => ocaml_rank_Enumeration(self).compare(ocaml_rank_Enumeration(other))
  }
}

///|
pub impl[TA : @lib.OHash] @lib.OHash for Enumeration[TA] with fn ohash_visit(
  self,
  h,
) {
  match self {
    End => h.int(0L)
    More(a0, a1, a2) => {
      h.block(0, 3)
      h.field(a0)
      h.field(a1)
      h.field(a2)
    }
  }
}

///|
/// `cons_enum`
pub fn[TA] cons_enum(
  x67 : T[TA],
  x68 : Enumeration[TA],
) -> Enumeration[TA] raise {
  let s = x67
  let e = x68
  match s {
    T::Empty => e
    T::Node(l, v, r, _) => cons_enum(l, Enumeration::More(v, r, e))
  }
}

///|
/// `compare_aux`
pub fn[TA, TB] compare_aux(
  x69 : (TB) -> ((TA) -> Int64 raise) raise,
  x70 : Enumeration[TB],
  x71 : Enumeration[TA],
) -> Int64 raise {
  let ord = x69
  let e1 = x70
  let e2 = x71
  match (e1, e2) {
    (Enumeration::End, Enumeration::End) => 0L
    (Enumeration::End, _) => -1L
    (_, Enumeration::End) => 1L
    (Enumeration::More(v1, r1, e1_1), Enumeration::More(v2, r2, e2_1)) => {
      let c = ord(v1)(v2)
      if c != 0L {
        c
      } else {
        let t72 = cons_enum(r2, e2_1)
        compare_aux(ord, cons_enum(r1, e1_1), t72)
      }
    }
  }
}

///|
/// `compare`
pub fn[TA, TB] compare(
  x73 : (TB) -> ((TA) -> Int64 raise) raise,
  x74 : T[TB],
  x75 : T[TA],
) -> Int64 raise {
  let ord = x73
  let s1 = x74
  let s2 = x75
  let t76 = cons_enum(s2, Enumeration::End)
  compare_aux(ord, cons_enum(s1, Enumeration::End), t76)
}

///|
/// `equal`
pub fn[TA, TB] equal(
  x77 : (TB) -> ((TA) -> Int64 raise) raise,
  x78 : T[TB],
  x79 : T[TA],
) -> Bool raise {
  let ord = x77
  let s1 = x78
  let s2 = x79
  compare(ord, s1, s2) == 0L
}

///|
/// `subset`
pub fn[TA, TB] subset(
  x80 : (TB) -> ((TA) -> Int64 raise) raise,
  x81 : T[TB],
  x82 : T[TA],
) -> Bool raise {
  let ord = x80
  let s1 = x81
  let s2 = x82
  match (s1, s2) {
    (T::Empty, _) => true
    (_, T::Empty) => false
    (T::Node(l1, v1, r1, _), T::Node(l2, v2, r2, _) as t2) => {
      let c = ord(v1)(v2)
      if c == 0L {
        subset(ord, l1, l2) && subset(ord, r1, r2)
      } else if c < 0L {
        subset(ord, T::Node(l1, v1, T::Empty, 0L), l2) && subset(ord, r1, t2)
      } else {
        subset(ord, T::Node(T::Empty, v1, r1, 0L), r2) && subset(ord, l1, t2)
      }
    }
  }
}

///|
/// `iter`
pub fn[TA, TB] iter(x83 : (TB) -> TA raise, x84 : T[TB]) -> Unit raise {
  let f = x83
  match x84 {
    T::Empty => ()
    T::Node(l, v, r, _) => {
      iter(f, l)
      ignore(f(v))
      iter(f, r)
    }
  }
}

///|
/// `fold`
pub fn[TA, TB] fold(
  x85 : (TB) -> ((TA) -> TA raise) raise,
  x86 : T[TB],
  x87 : TA,
) -> TA raise {
  let f = x85
  let s = x86
  let accu = x87
  match s {
    T::Empty => accu
    T::Node(l, v, r, _) => {
      let t88 = fold(f, l, accu)
      fold(f, r, f(v)(t88))
    }
  }
}

///|
/// `for_all`
pub fn[TA] for_all(x89 : (TA) -> Bool raise, x90 : T[TA]) -> Bool raise {
  let p = x89
  match x90 {
    T::Empty => true
    T::Node(l, v, r, _) => p(v) && for_all(p, l) && for_all(p, r)
  }
}

///|
/// `exists`
pub fn[TA] exists(x91 : (TA) -> Bool raise, x92 : T[TA]) -> Bool raise {
  let p = x91
  match x92 {
    T::Empty => false
    T::Node(l, v, r, _) => p(v) || exists(p, l) || exists(p, r)
  }
}

///|
/// `filter`
pub fn[TA] filter(x93 : (TA) -> Bool raise, x94 : T[TA]) -> T[TA] raise {
  let p = x93
  match x94 {
    T::Empty => T::Empty
    T::Node(l, v, r, _) as t => {
      let l_p = filter(p, l)
      let pv = p(v)
      let r_p = filter(p, r)
      if pv {
        if physical_equal(l, l_p) && physical_equal(r, r_p) {
          t
        } else {
          join(l_p, v, r_p)
        }
      } else {
        concat(l_p, r_p)
      }
    }
  }
}

///|
/// `partition`
pub fn[TA] partition(
  x95 : (TA) -> Bool raise,
  x96 : T[TA],
) -> (T[TA], T[TA]) raise {
  let p = x95
  match x96 {
    T::Empty => (T::Empty, T::Empty)
    T::Node(l, v, r, _) => {
      let (lt, lf) = partition(p, l)
      let pv = p(v)
      let (rt, rf) = partition(p, r)
      if pv {
        let t97 = concat(lf, rf)
        (join(lt, v, rt), t97)
      } else {
        let t98 = join(lf, v, rf)
        (concat(lt, rt), t98)
      }
    }
  }
}

///|
/// `cardinal`
pub fn[TA] cardinal(x99 : T[TA]) -> Int64 raise {
  match x99 {
    T::Empty => 0L
    T::Node(l, _, r, _) => {
      let t100 = cardinal(r)
      @lib.add63(@lib.add63(cardinal(l), 1L), t100)
    }
  }
}

///|
/// `elements_aux`
pub fn[TA] elements_aux(
  x101 : @list.List[TA],
  x102 : T[TA],
) -> @list.List[TA] raise {
  let accu = x101
  match x102 {
    T::Empty => accu
    T::Node(l, v, r, _) => elements_aux(elements_aux(accu, r).prepend(v), l)
  }
}

///|
/// `elements`
pub fn[TA] elements(x103 : T[TA]) -> @list.List[TA] raise {
  let s = x103
  elements_aux(@list.List([]), s)
}

///|
/// `choose`
pub fn[TA] choose(x : T[TA]) -> TA raise {
  let f : (T[TA]) -> TA raise = min_elt
  f(x)
}

///|
/// `choose_opt`
pub fn[TA] choose_opt(x : T[TA]) -> TA? raise {
  let f : (T[TA]) -> TA? raise = min_elt_opt
  f(x)
}

///|
/// `find`
pub fn[TA, TB] find(
  x104 : (TB) -> ((TA) -> Int64 raise) raise,
  x105 : TB,
  x106 : T[TA],
) -> TA raise {
  let ord = x104
  let x = x105
  match x106 {
    T::Empty => raise @lib.NotFound
    T::Node(l, v, r, _) => {
      let c = ord(x)(v)
      if c == 0L {
        v
      } else {
        find(ord, x, if c < 0L { l } else { r })
      }
    }
  }
}

///|
/// `find_first_aux`
pub fn[TA] find_first_aux(
  x107 : TA,
  x108 : (TA) -> Bool raise,
  x109 : T[TA],
) -> TA raise {
  let v0 = x107
  let f = x108
  match x109 {
    T::Empty => v0
    T::Node(l, v, r, _) =>
      if f(v) {
        find_first_aux(v, f, l)
      } else {
        find_first_aux(v0, f, r)
      }
  }
}

///|
/// `find_first`
pub fn[TA] find_first(x110 : (TA) -> Bool raise, x111 : T[TA]) -> TA raise {
  let f = x110
  match x111 {
    T::Empty => raise @lib.NotFound
    T::Node(l, v, r, _) =>
      if f(v) {
        find_first_aux(v, f, l)
      } else {
        find_first(f, r)
      }
  }
}

///|
/// `find_first_opt_aux`
pub fn[TA] find_first_opt_aux(
  x112 : TA,
  x113 : (TA) -> Bool raise,
  x114 : T[TA],
) -> TA? raise {
  let v0 = x112
  let f = x113
  match x114 {
    T::Empty => Some(v0)
    T::Node(l, v, r, _) =>
      if f(v) {
        find_first_opt_aux(v, f, l)
      } else {
        find_first_opt_aux(v0, f, r)
      }
  }
}

///|
/// `find_first_opt`
pub fn[TA] find_first_opt(x115 : (TA) -> Bool raise, x116 : T[TA]) -> TA? raise {
  let f = x115
  match x116 {
    T::Empty => None
    T::Node(l, v, r, _) =>
      if f(v) {
        find_first_opt_aux(v, f, l)
      } else {
        find_first_opt(f, r)
      }
  }
}

///|
/// `find_last_aux`
pub fn[TA] find_last_aux(
  x117 : TA,
  x118 : (TA) -> Bool raise,
  x119 : T[TA],
) -> TA raise {
  let v0 = x117
  let f = x118
  match x119 {
    T::Empty => v0
    T::Node(l, v, r, _) =>
      if f(v) {
        find_last_aux(v, f, r)
      } else {
        find_last_aux(v0, f, l)
      }
  }
}

///|
/// `find_last`
pub fn[TA] find_last(x120 : (TA) -> Bool raise, x121 : T[TA]) -> TA raise {
  let f = x120
  match x121 {
    T::Empty => raise @lib.NotFound
    T::Node(l, v, r, _) =>
      if f(v) {
        find_last_aux(v, f, r)
      } else {
        find_last(f, l)
      }
  }
}

///|
/// `find_last_opt_aux`
pub fn[TA] find_last_opt_aux(
  x122 : TA,
  x123 : (TA) -> Bool raise,
  x124 : T[TA],
) -> TA? raise {
  let v0 = x122
  let f = x123
  match x124 {
    T::Empty => Some(v0)
    T::Node(l, v, r, _) =>
      if f(v) {
        find_last_opt_aux(v, f, r)
      } else {
        find_last_opt_aux(v0, f, l)
      }
  }
}

///|
/// `find_last_opt`
pub fn[TA] find_last_opt(x125 : (TA) -> Bool raise, x126 : T[TA]) -> TA? raise {
  let f = x125
  match x126 {
    T::Empty => None
    T::Node(l, v, r, _) =>
      if f(v) {
        find_last_opt_aux(v, f, r)
      } else {
        find_last_opt(f, l)
      }
  }
}

///|
/// `find_opt`
pub fn[TA, TB] find_opt(
  x127 : (TB) -> ((TA) -> Int64 raise) raise,
  x128 : TB,
  x129 : T[TA],
) -> TA? raise {
  let ord = x127
  let x = x128
  match x129 {
    T::Empty => None
    T::Node(l, v, r, _) => {
      let c = ord(x)(v)
      if c == 0L {
        Some(v)
      } else {
        find_opt(ord, x, if c < 0L { l } else { r })
      }
    }
  }
}

///|
/// `try_join`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] try_join(
  x130 : (TA) -> ((TA) -> Int64 raise) raise,
  x131 : T[TA],
  x132 : TA,
  x133 : T[TA],
) -> T[TA] raise {
  let ord = x130
  let l = x131
  let v = x132
  let r = x133
  if (l == T::Empty || ord(max_elt(l))(v) < 0L) &&
    (if r == T::Empty {
      true
    } else {
      let t134 = min_elt(r)
      ord(v)(t134) < 0L
    }) {
    join(l, v, r)
  } else {
    union(ord, l, add(ord, v, r))
  }
}

///|
/// `map`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] map(
  x135 : (TA) -> ((TA) -> Int64 raise) raise,
  x136 : (TA) -> TA raise,
  x137 : T[TA],
) -> T[TA] raise {
  let ord = x135
  let f = x136
  match x137 {
    T::Empty => T::Empty
    T::Node(l, v, r, _) as t => {
      let l_p = map(ord, f, l)
      let v_p = f(v)
      let r_p = map(ord, f, r)
      if physical_equal(l, l_p) &&
        physical_equal(v, v_p) &&
        physical_equal(r, r_p) {
        t
      } else {
        try_join(ord, l_p, v_p, r_p)
      }
    }
  }
}

///|
/// `try_concat`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] try_concat(
  x138 : (TA) -> ((TA) -> Int64 raise) raise,
  x139 : T[TA],
  x140 : T[TA],
) -> T[TA] raise {
  let ord = x138
  let t1 = x139
  let t2 = x140
  match (t1, t2) {
    (T::Empty, t) => t
    (t_1, T::Empty) => t_1
    (_, _) => {
      let t141 = remove_min_elt(t2)
      try_join(ord, t1, min_elt(t2), t141)
    }
  }
}

///|
/// `filter_map`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] filter_map(
  x142 : (TA) -> ((TA) -> Int64 raise) raise,
  x143 : (TA) -> TA? raise,
  x144 : T[TA],
) -> T[TA] raise {
  let ord = x142
  let f = x143
  match x144 {
    T::Empty => T::Empty
    T::Node(l, v, r, _) as t => {
      let l_p = filter_map(ord, f, l)
      let v_p = f(v)
      let r_p = filter_map(ord, f, r)
      match v_p {
        Some(v_p_1) =>
          if physical_equal(l, l_p) &&
            physical_equal(v, v_p_1) &&
            physical_equal(r, r_p) {
            t
          } else {
            try_join(ord, l_p, v_p_1, r_p)
          }
        None => try_concat(ord, l_p, r_p)
      }
    }
  }
}
