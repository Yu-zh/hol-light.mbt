// Translated from upstream ocaml_map.ml; edit this file directly.

///|
/// `t`
#derive(Eq, Debug)
pub(all) enum T[TA, TB] {
  Empty
  Node(T[TA, TB], TA, TB, T[TA, TB], Int64)
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
fn[TA, TB] ocaml_rank_T(x : T[TA, TB]) -> Int {
  match x {
    Empty => 0
    Node(_, _, _, _, _) => 1000000
  }
}

///|
pub impl[TA : @lib.OCompare, TB : @lib.OCompare] @lib.OCompare for T[TA, TB] with fn ocompare(
  self,
  other,
) {
  match (self, other) {
    (Node(a0, a1, a2, a3, a4), Node(b0, b1, b2, b3, b4)) => {
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
      let c = @lib.compare(a3, b3)
      if c != 0 {
        return c
      }
      @lib.compare(a4, b4)
    }
    _ => ocaml_rank_T(self).compare(ocaml_rank_T(other))
  }
}

///|
pub impl[TA : @lib.OHash, TB : @lib.OHash] @lib.OHash for T[TA, TB] with fn ohash_visit(
  self,
  h,
) {
  match self {
    Empty => h.int(0L)
    Node(a0, a1, a2, a3, a4) => {
      h.block(0, 5)
      h.field(a0)
      h.field(a1)
      h.field(a2)
      h.field(a3)
      h.field(a4)
    }
  }
}

///|
/// `height`
pub fn[TA, TB] height(x1 : T[TA, TB]) -> Int64 raise {
  match x1 {
    T::Empty => 0L
    T::Node(_, _, _, _, h) => h
  }
}

///|
/// `create`
pub fn[TA, TB] create(
  x2 : T[TA, TB],
  x3 : TA,
  x4 : TB,
  x5 : T[TA, TB],
) -> T[TA, TB] raise {
  let l = x2
  let x = x3
  let d = x4
  let r = x5
  let hl = height(l)
  let hr = height(r)
  T::Node(
    l,
    x,
    d,
    r,
    if hl >= hr {
      @lib.add63(hl, 1L)
    } else {
      @lib.add63(hr, 1L)
    },
  )
}

///|
/// `singleton`
pub fn[TA, TB] singleton(x6 : TA, x7 : TB) -> T[TA, TB] raise {
  let x = x6
  let d = x7
  T::Node(T::Empty, x, d, T::Empty, 1L)
}

///|
/// `bal`
pub fn[TA, TB] bal(
  x8 : T[TA, TB],
  x9 : TA,
  x10 : TB,
  x11 : T[TA, TB],
) -> T[TA, TB] raise {
  let l = x8
  let x = x9
  let d = x10
  let r = x11
  let hl = match l {
    T::Empty => 0L
    T::Node(_, _, _, _, h) => h
  }
  let hr = match r {
    T::Empty => 0L
    T::Node(_, _, _, _, h_1) => h_1
  }
  if hl > @lib.add63(hr, 2L) {
    match l {
      T::Empty => raise @num.InvalidArgument("Map.bal")
      T::Node(ll, lv, ld, lr, _) => {
        let t12 = height(lr)
        if height(ll) >= t12 {
          create(ll, lv, ld, create(lr, x, d, r))
        } else {
          match lr {
            T::Empty => raise @num.InvalidArgument("Map.bal")
            T::Node(lrl, lrv, lrd, lrr, _) => {
              let t13 = create(lrr, x, d, r)
              create(create(ll, lv, ld, lrl), lrv, lrd, t13)
            }
          }
        }
      }
    }
  } else if hr > @lib.add63(hl, 2L) {
    match r {
      T::Empty => raise @num.InvalidArgument("Map.bal")
      T::Node(rl, rv, rd, rr, _) => {
        let t14 = height(rl)
        if height(rr) >= t14 {
          create(create(l, x, d, rl), rv, rd, rr)
        } else {
          match rl {
            T::Empty => raise @num.InvalidArgument("Map.bal")
            T::Node(rll, rlv, rld, rlr, _) => {
              let t15 = create(rlr, rv, rd, rr)
              create(create(l, x, d, rll), rlv, rld, t15)
            }
          }
        }
      }
    }
  } else {
    T::Node(
      l,
      x,
      d,
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
/// `empty`
pub fn[TA, TB] empty() -> T[TA, TB] {
  T::Empty
}

///|
/// `is_empty`
pub fn[TA, TB] is_empty(x16 : T[TA, TB]) -> Bool raise {
  match x16 {
    T::Empty => true
    _ => false
  }
}

///|
/// `add`
pub fn[TA, TB] add(
  x17 : (TA) -> ((TA) -> Int64 raise) raise,
  x18 : TA,
  x19 : TB,
  x20 : T[TA, TB],
) -> T[TA, TB] raise {
  let ord = x17
  let x = x18
  let data = x19
  match x20 {
    T::Empty => T::Node(T::Empty, x, data, T::Empty, 1L)
    T::Node(l, v, d, r, h) as m => {
      let c = ord(x)(v)
      if c == 0L {
        if physical_equal(d, data) {
          m
        } else {
          T::Node(l, x, data, r, h)
        }
      } else if c < 0L {
        let ll = add(ord, x, data, l)
        if physical_equal(l, ll) {
          m
        } else {
          bal(ll, v, d, r)
        }
      } else {
        let rr = add(ord, x, data, r)
        if physical_equal(r, rr) {
          m
        } else {
          bal(l, v, d, rr)
        }
      }
    }
  }
}

///|
/// `find`
pub fn[TA, TB, TC] find(
  x21 : (TC) -> ((TB) -> Int64 raise) raise,
  x22 : TC,
  x23 : T[TB, TA],
) -> TA raise {
  let ord = x21
  let x = x22
  match x23 {
    T::Empty => raise @lib.NotFound
    T::Node(l, v, d, r, _) => {
      let c = ord(x)(v)
      if c == 0L {
        d
      } else {
        find(ord, x, if c < 0L { l } else { r })
      }
    }
  }
}

///|
/// `find_first_aux`
pub fn[TA, TB] find_first_aux(
  x24 : TA,
  x25 : TB,
  x26 : (TA) -> Bool raise,
  x27 : T[TA, TB],
) -> (TA, TB) raise {
  let v0 = x24
  let d0 = x25
  let f = x26
  match x27 {
    T::Empty => (v0, d0)
    T::Node(l, v, d, r, _) =>
      if f(v) {
        find_first_aux(v, d, f, l)
      } else {
        find_first_aux(v0, d0, f, r)
      }
  }
}

///|
/// `find_first`
pub fn[TA, TB] find_first(
  x28 : (TA) -> Bool raise,
  x29 : T[TA, TB],
) -> (TA, TB) raise {
  let f = x28
  match x29 {
    T::Empty => raise @lib.NotFound
    T::Node(l, v, d, r, _) =>
      if f(v) {
        find_first_aux(v, d, f, l)
      } else {
        find_first(f, r)
      }
  }
}

///|
/// `find_first_opt_aux`
pub fn[TA, TB] find_first_opt_aux(
  x30 : TA,
  x31 : TB,
  x32 : (TA) -> Bool raise,
  x33 : T[TA, TB],
) -> (TA, TB)? raise {
  let v0 = x30
  let d0 = x31
  let f = x32
  match x33 {
    T::Empty => Some((v0, d0))
    T::Node(l, v, d, r, _) =>
      if f(v) {
        find_first_opt_aux(v, d, f, l)
      } else {
        find_first_opt_aux(v0, d0, f, r)
      }
  }
}

///|
/// `find_first_opt`
pub fn[TA, TB] find_first_opt(
  x34 : (TA) -> Bool raise,
  x35 : T[TA, TB],
) -> (TA, TB)? raise {
  let f = x34
  match x35 {
    T::Empty => None
    T::Node(l, v, d, r, _) =>
      if f(v) {
        find_first_opt_aux(v, d, f, l)
      } else {
        find_first_opt(f, r)
      }
  }
}

///|
/// `find_last_aux`
pub fn[TA, TB] find_last_aux(
  x36 : TA,
  x37 : TB,
  x38 : (TA) -> Bool raise,
  x39 : T[TA, TB],
) -> (TA, TB) raise {
  let v0 = x36
  let d0 = x37
  let f = x38
  match x39 {
    T::Empty => (v0, d0)
    T::Node(l, v, d, r, _) =>
      if f(v) {
        find_last_aux(v, d, f, r)
      } else {
        find_last_aux(v0, d0, f, l)
      }
  }
}

///|
/// `find_last`
pub fn[TA, TB] find_last(
  x40 : (TA) -> Bool raise,
  x41 : T[TA, TB],
) -> (TA, TB) raise {
  let f = x40
  match x41 {
    T::Empty => raise @lib.NotFound
    T::Node(l, v, d, r, _) =>
      if f(v) {
        find_last_aux(v, d, f, r)
      } else {
        find_last(f, l)
      }
  }
}

///|
/// `find_last_opt_aux`
pub fn[TA, TB] find_last_opt_aux(
  x42 : TA,
  x43 : TB,
  x44 : (TA) -> Bool raise,
  x45 : T[TA, TB],
) -> (TA, TB)? raise {
  let v0 = x42
  let d0 = x43
  let f = x44
  match x45 {
    T::Empty => Some((v0, d0))
    T::Node(l, v, d, r, _) =>
      if f(v) {
        find_last_opt_aux(v, d, f, r)
      } else {
        find_last_opt_aux(v0, d0, f, l)
      }
  }
}

///|
/// `find_last_opt`
pub fn[TA, TB] find_last_opt(
  x46 : (TA) -> Bool raise,
  x47 : T[TA, TB],
) -> (TA, TB)? raise {
  let f = x46
  match x47 {
    T::Empty => None
    T::Node(l, v, d, r, _) =>
      if f(v) {
        find_last_opt_aux(v, d, f, r)
      } else {
        find_last_opt(f, l)
      }
  }
}

///|
/// `find_opt`
pub fn[TA, TB, TC] find_opt(
  x48 : (TC) -> ((TB) -> Int64 raise) raise,
  x49 : TC,
  x50 : T[TB, TA],
) -> TA? raise {
  let ord = x48
  let x = x49
  match x50 {
    T::Empty => None
    T::Node(l, v, d, r, _) => {
      let c = ord(x)(v)
      if c == 0L {
        Some(d)
      } else {
        find_opt(ord, x, if c < 0L { l } else { r })
      }
    }
  }
}

///|
/// `mem`
pub fn[TA, TB, TC] mem(
  x51 : (TB) -> ((TA) -> Int64 raise) raise,
  x52 : TB,
  x53 : T[TA, TC],
) -> Bool raise {
  let ord = x51
  let x = x52
  match x53 {
    T::Empty => false
    T::Node(l, v, _, r, _) => {
      let c = ord(x)(v)
      c == 0L || mem(ord, x, if c < 0L { l } else { r })
    }
  }
}

///|
/// `min_binding`
pub fn[TA, TB] min_binding(x54 : T[TA, TB]) -> (TA, TB) raise {
  match x54 {
    T::Empty => raise @lib.NotFound
    T::Node(T::Empty, v, d, _, _) => (v, d)
    T::Node(l, _, _, _, _) => min_binding(l)
  }
}

///|
/// `min_binding_opt`
pub fn[TA, TB] min_binding_opt(x55 : T[TA, TB]) -> (TA, TB)? raise {
  match x55 {
    T::Empty => None
    T::Node(T::Empty, v, d, _, _) => Some((v, d))
    T::Node(l, _, _, _, _) => min_binding_opt(l)
  }
}

///|
/// `max_binding`
pub fn[TA, TB] max_binding(x56 : T[TA, TB]) -> (TA, TB) raise {
  match x56 {
    T::Empty => raise @lib.NotFound
    T::Node(_, v, d, T::Empty, _) => (v, d)
    T::Node(_, _, _, r, _) => max_binding(r)
  }
}

///|
/// `max_binding_opt`
pub fn[TA, TB] max_binding_opt(x57 : T[TA, TB]) -> (TA, TB)? raise {
  match x57 {
    T::Empty => None
    T::Node(_, v, d, T::Empty, _) => Some((v, d))
    T::Node(_, _, _, r, _) => max_binding_opt(r)
  }
}

///|
/// `remove_min_binding`
pub fn[TA, TB] remove_min_binding(x58 : T[TA, TB]) -> T[TA, TB] raise {
  match x58 {
    T::Empty => raise @num.InvalidArgument("Map.remove_min_elt")
    T::Node(T::Empty, _, _, r, _) => r
    T::Node(l, v, d, r_1, _) => bal(remove_min_binding(l), v, d, r_1)
  }
}

///|
/// `merge_trees`
pub fn[TA, TB] merge_trees(x59 : T[TA, TB], x60 : T[TA, TB]) -> T[TA, TB] raise {
  let t1 = x59
  let t2 = x60
  match (t1, t2) {
    (T::Empty, t) => t
    (t_1, T::Empty) => t_1
    (_, _) => {
      let (x, d) = min_binding(t2)
      bal(t1, x, d, remove_min_binding(t2))
    }
  }
}

///|
/// `remove`
pub fn[TA, TB, TC] remove(
  x61 : (TC) -> ((TA) -> Int64 raise) raise,
  x62 : TC,
  x63 : T[TA, TB],
) -> T[TA, TB] raise {
  let ord = x61
  let x = x62
  match x63 {
    T::Empty => T::Empty
    T::Node(l, v, d, r, _) as m => {
      let c = ord(x)(v)
      if c == 0L {
        merge_trees(l, r)
      } else if c < 0L {
        let ll = remove(ord, x, l)
        if physical_equal(l, ll) {
          m
        } else {
          bal(ll, v, d, r)
        }
      } else {
        let rr = remove(ord, x, r)
        if physical_equal(r, rr) {
          m
        } else {
          bal(l, v, d, rr)
        }
      }
    }
  }
}

///|
/// `update`
pub fn[TA, TB] update(
  x64 : (TA) -> ((TA) -> Int64 raise) raise,
  x65 : TA,
  x66 : (TB?) -> TB? raise,
  x67 : T[TA, TB],
) -> T[TA, TB] raise {
  let ord = x64
  let x = x65
  let f = x66
  match x67 {
    T::Empty =>
      match f(None) {
        None => T::Empty
        Some(data) => T::Node(T::Empty, x, data, T::Empty, 1L)
      }
    T::Node(l, v, d, r, h) as m => {
      let c = ord(x)(v)
      if c == 0L {
        match f(Some(d)) {
          None => merge_trees(l, r)
          Some(data_1) =>
            if physical_equal(d, data_1) {
              m
            } else {
              T::Node(l, x, data_1, r, h)
            }
        }
      } else if c < 0L {
        let ll = update(ord, x, f, l)
        if physical_equal(l, ll) {
          m
        } else {
          bal(ll, v, d, r)
        }
      } else {
        let rr = update(ord, x, f, r)
        if physical_equal(r, rr) {
          m
        } else {
          bal(l, v, d, rr)
        }
      }
    }
  }
}

///|
/// `iter`
pub fn[TA, TB, TC] iter(
  x68 : (TC) -> ((TB) -> TA raise) raise,
  x69 : T[TC, TB],
) -> Unit raise {
  let f = x68
  match x69 {
    T::Empty => ()
    T::Node(l, v, d, r, _) => {
      iter(f, l)
      ignore(f(v)(d))
      iter(f, r)
    }
  }
}

///|
/// `map`
pub fn[TA, TB, TC] map(
  x70 : (TC) -> TB raise,
  x71 : T[TA, TC],
) -> T[TA, TB] raise {
  let f = x70
  match x71 {
    T::Empty => T::Empty
    T::Node(l, v, d, r, h) => {
      let l_p = map(f, l)
      let d_p = f(d)
      let r_p = map(f, r)
      T::Node(l_p, v, d_p, r_p, h)
    }
  }
}

///|
/// `mapi`
pub fn[TA, TB, TC] mapi(
  x72 : (TA) -> ((TC) -> TB raise) raise,
  x73 : T[TA, TC],
) -> T[TA, TB] raise {
  let f = x72
  match x73 {
    T::Empty => T::Empty
    T::Node(l, v, d, r, h) => {
      let l_p = mapi(f, l)
      let d_p = f(v)(d)
      let r_p = mapi(f, r)
      T::Node(l_p, v, d_p, r_p, h)
    }
  }
}

///|
/// `fold`
pub fn[TA, TB, TC] fold(
  x74 : (TC) -> ((TB) -> ((TA) -> TA raise) raise) raise,
  x75 : T[TC, TB],
  x76 : TA,
) -> TA raise {
  let f = x74
  let m = x75
  let accu = x76
  match m {
    T::Empty => accu
    T::Node(l, v, d, r, _) => {
      let t77 = fold(f, l, accu)
      fold(f, r, f(v)(d)(t77))
    }
  }
}

///|
/// `for_all`
pub fn[TA, TB] for_all(
  x78 : (TB) -> ((TA) -> Bool raise) raise,
  x79 : T[TB, TA],
) -> Bool raise {
  let p = x78
  match x79 {
    T::Empty => true
    T::Node(l, v, d, r, _) => p(v)(d) && for_all(p, l) && for_all(p, r)
  }
}

///|
/// `exists`
pub fn[TA, TB] exists(
  x80 : (TB) -> ((TA) -> Bool raise) raise,
  x81 : T[TB, TA],
) -> Bool raise {
  let p = x80
  match x81 {
    T::Empty => false
    T::Node(l, v, d, r, _) => p(v)(d) || exists(p, l) || exists(p, r)
  }
}

///|
/// `add_min_binding`
pub fn[TA, TB] add_min_binding(
  x82 : TA,
  x83 : TB,
  x84 : T[TA, TB],
) -> T[TA, TB] raise {
  let k = x82
  let x = x83
  match x84 {
    T::Empty => singleton(k, x)
    T::Node(l, v, d, r, _) => bal(add_min_binding(k, x, l), v, d, r)
  }
}

///|
/// `add_max_binding`
pub fn[TA, TB] add_max_binding(
  x85 : TA,
  x86 : TB,
  x87 : T[TA, TB],
) -> T[TA, TB] raise {
  let k = x85
  let x = x86
  match x87 {
    T::Empty => singleton(k, x)
    T::Node(l, v, d, r, _) => bal(l, v, d, add_max_binding(k, x, r))
  }
}

///|
/// `join`
pub fn[TA, TB] join(
  x88 : T[TA, TB],
  x89 : TA,
  x90 : TB,
  x91 : T[TA, TB],
) -> T[TA, TB] raise {
  let l = x88
  let v = x89
  let d = x90
  let r = x91
  match (l, r) {
    (T::Empty, _) => add_min_binding(v, d, r)
    (_, T::Empty) => add_max_binding(v, d, l)
    (T::Node(ll, lv, ld, lr, lh), T::Node(rl, rv, rd, rr, rh)) =>
      if lh > @lib.add63(rh, 2L) {
        bal(ll, lv, ld, join(lr, v, d, r))
      } else if rh > @lib.add63(lh, 2L) {
        bal(join(l, v, d, rl), rv, rd, rr)
      } else {
        create(l, v, d, r)
      }
  }
}

///|
/// `concat`
pub fn[TA, TB] concat(x92 : T[TA, TB], x93 : T[TA, TB]) -> T[TA, TB] raise {
  let t1 = x92
  let t2 = x93
  match (t1, t2) {
    (T::Empty, t) => t
    (t_1, T::Empty) => t_1
    (_, _) => {
      let (x, d) = min_binding(t2)
      join(t1, x, d, remove_min_binding(t2))
    }
  }
}

///|
/// `concat_or_join`
pub fn[TA, TB] concat_or_join(
  x94 : T[TA, TB],
  x95 : TA,
  x96 : TB?,
  x97 : T[TA, TB],
) -> T[TA, TB] raise {
  let t1 = x94
  let v = x95
  let d = x96
  let t2 = x97
  match d {
    Some(d_1) => join(t1, v, d_1, t2)
    None => concat(t1, t2)
  }
}

///|
/// `split`
pub fn[TA, TB, TC] split(
  x98 : (TC) -> ((TA) -> Int64 raise) raise,
  x99 : TC,
  x100 : T[TA, TB],
) -> (T[TA, TB], TB?, T[TA, TB]) raise {
  let ord = x98
  let x = x99
  match x100 {
    T::Empty => (T::Empty, None, T::Empty)
    T::Node(l, v, d, r, _) => {
      let c = ord(x)(v)
      if c == 0L {
        (l, Some(d), r)
      } else if c < 0L {
        let (ll, pres, rl) = split(ord, x, l)
        (ll, pres, join(rl, v, d, r))
      } else {
        let (lr, pres_1, rr) = split(ord, x, r)
        (join(l, v, d, lr), pres_1, rr)
      }
    }
  }
}

///|
/// `merge`
pub fn[TA, TB, TC, TD] merge(
  x101 : (TA) -> ((TA) -> Int64 raise) raise,
  x102 : (TA) -> ((TD?) -> ((TC?) -> TB? raise) raise) raise,
  x103 : T[TA, TD],
  x104 : T[TA, TC],
) -> T[TA, TB] raise {
  let ord = x101
  let f = x102
  let s1 = x103
  let s2 = x104
  match (s1, s2) {
    (T::Empty, T::Empty) => T::Empty
    (T::Node(l1, v1, d1, r1, h1), _) if h1 >= height(s2) => {
      let (l2, d2, r2) = split(ord, v1, s2)
      let t106 = merge(ord, f, r1, r2)
      let t105 = Some(d1)
      let t107 = f(v1)(t105)(d2)
      concat_or_join(merge(ord, f, l1, l2), v1, t107, t106)
    }
    (_, T::Node(l2_1, v2, d2_1, r2_1, _)) => {
      let (l1_1, d1_1, r1_1) = split(ord, v2, s1)
      let t109 = merge(ord, f, r1_1, r2_1)
      let t108 = Some(d2_1)
      let t110 = f(v2)(d1_1)(t108)
      concat_or_join(merge(ord, f, l1_1, l2_1), v2, t110, t109)
    }
    _ => raise @lib.AssertFailure("tscript.ml:327:8")
  }
}

///|
/// `union`
pub fn[TA, TB] union(
  x111 : (TA) -> ((TA) -> Int64 raise) raise,
  x112 : (TA) -> ((TB) -> ((TB) -> TB? raise) raise) raise,
  x113 : T[TA, TB],
  x114 : T[TA, TB],
) -> T[TA, TB] raise {
  let ord = x111
  let f = x112
  let s1 = x113
  let s2 = x114
  match (s1, s2) {
    (T::Empty, s) | (s, T::Empty) => s
    (T::Node(l1, v1, d1, r1, h1), T::Node(l2, v2, d2, r2, h2)) =>
      if h1 >= h2 {
        let (l2_1, d2_1, r2_1) = split(ord, v1, s2)
        let l = union(ord, f, l1, l2_1)
        let r = union(ord, f, r1, r2_1)
        match d2_1 {
          None => join(l, v1, d1, r)
          Some(d2_2) => concat_or_join(l, v1, f(v1)(d1)(d2_2), r)
        }
      } else {
        let (l1_1, d1_1, r1_1) = split(ord, v2, s1)
        let l_1 = union(ord, f, l1_1, l2)
        let r_1 = union(ord, f, r1_1, r2)
        match d1_1 {
          None => join(l_1, v2, d2, r_1)
          Some(d1_2) => concat_or_join(l_1, v2, f(v2)(d1_2)(d2), r_1)
        }
      }
  }
}

///|
/// `filter`
pub fn[TA, TB] filter(
  x115 : (TA) -> ((TB) -> Bool raise) raise,
  x116 : T[TA, TB],
) -> T[TA, TB] raise {
  let p = x115
  match x116 {
    T::Empty => T::Empty
    T::Node(l, v, d, r, _) as m => {
      let l_p = filter(p, l)
      let pvd = p(v)(d)
      let r_p = filter(p, r)
      if pvd {
        if physical_equal(l, l_p) && physical_equal(r, r_p) {
          m
        } else {
          join(l_p, v, d, r_p)
        }
      } else {
        concat(l_p, r_p)
      }
    }
  }
}

///|
/// `filter_map`
pub fn[TA, TB, TC] filter_map(
  x117 : (TA) -> ((TC) -> TB? raise) raise,
  x118 : T[TA, TC],
) -> T[TA, TB] raise {
  let f = x117
  match x118 {
    T::Empty => T::Empty
    T::Node(l, v, d, r, _) => {
      let l_p = filter_map(f, l)
      let fvd = f(v)(d)
      let r_p = filter_map(f, r)
      match fvd {
        Some(d_p) => join(l_p, v, d_p, r_p)
        None => concat(l_p, r_p)
      }
    }
  }
}

///|
/// `partition`
pub fn[TA, TB] partition(
  x119 : (TA) -> ((TB) -> Bool raise) raise,
  x120 : T[TA, TB],
) -> (T[TA, TB], T[TA, TB]) raise {
  let p = x119
  match x120 {
    T::Empty => (T::Empty, T::Empty)
    T::Node(l, v, d, r, _) => {
      let (lt, lf) = partition(p, l)
      let pvd = p(v)(d)
      let (rt, rf) = partition(p, r)
      if pvd {
        let t121 = concat(lf, rf)
        (join(lt, v, d, rt), t121)
      } else {
        let t122 = join(lf, v, d, rf)
        (concat(lt, rt), t122)
      }
    }
  }
}

///|
/// `enumeration`
#derive(Eq, Debug)
pub(all) enum Enumeration[TA, TB] {
  End
  More(TA, TB, T[TA, TB], Enumeration[TA, TB])
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
fn[TA, TB] ocaml_rank_Enumeration(x : Enumeration[TA, TB]) -> Int {
  match x {
    End => 0
    More(_, _, _, _) => 1000000
  }
}

///|
pub impl[TA : @lib.OCompare, TB : @lib.OCompare] @lib.OCompare for Enumeration[
  TA,
  TB,
] with fn ocompare(self, other) {
  match (self, other) {
    (More(a0, a1, a2, a3), More(b0, b1, b2, b3)) => {
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
    _ => ocaml_rank_Enumeration(self).compare(ocaml_rank_Enumeration(other))
  }
}

///|
pub impl[TA : @lib.OHash, TB : @lib.OHash] @lib.OHash for Enumeration[TA, TB] with fn ohash_visit(
  self,
  h,
) {
  match self {
    End => h.int(0L)
    More(a0, a1, a2, a3) => {
      h.block(0, 4)
      h.field(a0)
      h.field(a1)
      h.field(a2)
      h.field(a3)
    }
  }
}

///|
/// `cons_enum`
pub fn[TA, TB] cons_enum(
  x123 : T[TA, TB],
  x124 : Enumeration[TA, TB],
) -> Enumeration[TA, TB] raise {
  let m = x123
  let e = x124
  match m {
    T::Empty => e
    T::Node(l, v, d, r, _) => cons_enum(l, Enumeration::More(v, d, r, e))
  }
}

///|
/// `compare`
pub fn[TA, TB, TC, TD] compare(
  x125 : (TB) -> ((TA) -> Int64 raise) raise,
  x126 : (TD) -> ((TC) -> Int64 raise) raise,
  x127 : T[TB, TD],
  x128 : T[TA, TC],
) -> Int64 raise {
  let ord = x125
  let cmp = x126
  let m1 = x127
  let m2 = x128
  fn compare_aux(
    x129 : Enumeration[TB, TD],
    x130 : Enumeration[TA, TC],
  ) -> Int64 raise {
    let e1 = x129
    let e2 = x130
    match (e1, e2) {
      (Enumeration::End, Enumeration::End) => 0L
      (Enumeration::End, _) => -1L
      (_, Enumeration::End) => 1L
      (Enumeration::More(v1, d1, r1, e1_1), Enumeration::More(v2, d2, r2, e2_1)) => {
        let c = ord(v1)(v2)
        if c != 0L {
          c
        } else {
          let c_1 = cmp(d1)(d2)
          if c_1 != 0L {
            c_1
          } else {
            let t131 = cons_enum(r2, e2_1)
            compare_aux(cons_enum(r1, e1_1), t131)
          }
        }
      }
    }
  }
  let t132 = cons_enum(m2, Enumeration::End)
  compare_aux(cons_enum(m1, Enumeration::End), t132)
}

///|
/// `equal`
pub fn[TA, TB, TC, TD] equal(
  x133 : (TB) -> ((TA) -> Int64 raise) raise,
  x134 : (TD) -> ((TC) -> Bool raise) raise,
  x135 : T[TB, TD],
  x136 : T[TA, TC],
) -> Bool raise {
  let ord = x133
  let cmp = x134
  let m1 = x135
  let m2 = x136
  fn equal_aux(
    x137 : Enumeration[TB, TD],
    x138 : Enumeration[TA, TC],
  ) -> Bool raise {
    let e1 = x137
    let e2 = x138
    match (e1, e2) {
      (Enumeration::End, Enumeration::End) => true
      (Enumeration::End, _) => false
      (_, Enumeration::End) => false
      (Enumeration::More(v1, d1, r1, e1_1), Enumeration::More(v2, d2, r2, e2_1)) =>
        ord(v1)(v2) == 0L &&
        (if cmp(d1)(d2) {
          let t139 = cons_enum(r2, e2_1)
          equal_aux(cons_enum(r1, e1_1), t139)
        } else {
          false
        })
    }
  }
  let t140 = cons_enum(m2, Enumeration::End)
  equal_aux(cons_enum(m1, Enumeration::End), t140)
}

///|
/// `cardinal`
pub fn[TA, TB] cardinal(x141 : T[TA, TB]) -> Int64 raise {
  match x141 {
    T::Empty => 0L
    T::Node(l, _, _, r, _) => {
      let t142 = cardinal(r)
      @lib.add63(@lib.add63(cardinal(l), 1L), t142)
    }
  }
}

///|
/// `bindings_aux`
pub fn[TA, TB] bindings_aux(
  x143 : @list.List[(TA, TB)],
  x144 : T[TA, TB],
) -> @list.List[(TA, TB)] raise {
  let accu = x143
  match x144 {
    T::Empty => accu
    T::Node(l, v, d, r, _) =>
      bindings_aux(bindings_aux(accu, r).prepend((v, d)), l)
  }
}

///|
/// `bindings`
pub fn[TA, TB] bindings(x145 : T[TA, TB]) -> @list.List[(TA, TB)] raise {
  let s = x145
  bindings_aux(@list.List([]), s)
}

///|
/// `choose`
pub fn[TA, TB] choose(x : T[TA, TB]) -> (TA, TB) raise {
  let f : (T[TA, TB]) -> (TA, TB) raise = min_binding
  f(x)
}

///|
/// `choose_opt`
pub fn[TA, TB] choose_opt(x : T[TA, TB]) -> (TA, TB)? raise {
  let f : (T[TA, TB]) -> (TA, TB)? raise = min_binding_opt
  f(x)
}
