// ===========================================================================
// Term nets: reasonably fast lookup based on term matchability (port of
// nets.ml).
//
// A net is a persistent tree; at each node there are branches (by label)
// and a sorted list of "tips" (the stored values). Linearization is from
// the left of a combination: the head is looked at first, and if it is a
// variable the whole term is treated as a variable.
// ===========================================================================

///|
using @kernel {type Term}

///|
using @list {type List}

///|
/// How net tips are ordered: OCaml's polymorphic `compare`, which raises
/// `Invalid_argument` when it reaches a closure. `None` stands for that
/// exception (upstream treats it as "neither equal nor less").
pub(open) trait NetCompare {
  fn net_compare(Self, Self) -> Int32?
}

///|
pub impl NetCompare for Int32 with fn net_compare(self, other) {
  Some(self.compare(other))
}

///|
pub impl NetCompare for String with fn net_compare(self, other) {
  Some(@kernel.compare_string(self, other))
}

///|
pub impl NetCompare for Term with fn net_compare(self, other) {
  Some(self.compare(other))
}

///|
pub impl NetCompare for @kernel.Thm with fn net_compare(self, other) {
  Some(self.compare(other))
}

///|
pub impl[A : NetCompare, B : NetCompare] NetCompare for (A, B) with fn net_compare(
  self,
  other,
) {
  match self.0.net_compare(other.0) {
    Some(0) => self.1.net_compare(other.1)
    c => c
  }
}

///|
/// A persistent term net.
pub struct Net[A] {
  priv vnet : Net[A]?
  priv cnets : @hashmap.HashMap[(String, Int32), Net[A]]
  priv lcnets : @hashmap.HashMap[(String, Int32), Net[A]]
  priv lnets : @hashmap.HashMap[Int32, Net[A]]
  priv tips : List[A]
}

///|
priv enum Label {
  Vnet
  Lcnet(String, Int32)
  Cnet(String, Int32)
  Lnet(Int32)
}

///|
/// The empty net.
pub fn[A] empty_net() -> Net[A] {
  {
    vnet: None,
    cnets: @hashmap.HashMap::new(),
    lcnets: @hashmap.HashMap::new(),
    lnets: @hashmap.HashMap::new(),
    tips: @list.List([]),
  }
}

///|
/// The values stored at the root of the net.
pub fn[A] Net::tips(self : Net[A]) -> List[A] {
  self.tips
}

///|
fn label_to_store(lconsts : List[Term], tm : Term) -> (Label, List[Term]) {
  let (op, args) = @basics.strip_comb(tm)
  match op {
    Const(name, _) => (Cnet(name, args.length()), args)
    Abs(bv, bod) => {
      let bod1 = if @lib.mem(bv, lconsts) {
        // `vsubst` cannot fail: `genvar` has the type of `bv`.
        @kernel.vsubst(
          @list.singleton((@basics.genvar(@kernel.type_of(bv)), bv)),
          bod,
        ) catch {
          _ => abort("nets: vsubst with a well-typed substitution failed")
        }
      } else {
        bod
      }
      (Lnet(args.length()), args.prepend(bod1))
    }
    Var(name, _) if @lib.mem(op, lconsts) => (Lcnet(name, args.length()), args)
    _ => (Vnet, @list.List([]))
  }
}

///|
/// Insert into a sorted tip list; equal elements are not duplicated.
fn[A] set_insert(cmp : (A, A) -> Int32?, x : A, l : List[A]) -> List[A] {
  let prefix = []
  let mut rest = l
  while rest is More(h, tail=t) {
    match cmp(h, x) {
      Some(0) => return l
      _ => ()
    }
    match cmp(x, h) {
      Some(c) if c < 0 => break
      _ => ()
    }
    prefix.push(h)
    rest = t
  }
  let mut acc = rest.prepend(x)
  for i = prefix.length() - 1; i >= 0; i = i - 1 {
    acc = acc.prepend(prefix[i])
  }
  acc
}

///|
fn[A] net_update(
  cmp : (A, A) -> Int32?,
  lconsts : List[Term],
  elem : A,
  tms : List[Term],
  net : Net[A],
) -> Net[A] {
  match tms {
    Empty => { ..net, tips: set_insert(cmp, elem, net.tips), }
    More(tm, tail=rtms) => {
      let (label, ntms) = label_to_store(lconsts, tm)
      let upd = (child : Net[A]) => {
        net_update(cmp, lconsts, elem, ntms.concat(rtms), child)
      }
      match label {
        Vnet => {
          let child0 = match net.vnet {
            Some(c) => c
            None => empty_net()
          }
          { ..net, vnet: Some(upd(child0)), }
        }
        Cnet(s, n) => {
          let child0 = net.cnets.get((s, n)).unwrap_or(empty_net())
          { ..net, cnets: net.cnets.add((s, n), upd(child0)), }
        }
        Lcnet(s, n) => {
          let child0 = net.lcnets.get((s, n)).unwrap_or(empty_net())
          { ..net, lcnets: net.lcnets.add((s, n), upd(child0)), }
        }
        Lnet(n) => {
          let child0 = net.lnets.get(n).unwrap_or(empty_net())
          { ..net, lnets: net.lnets.add(n, upd(child0)), }
        }
      }
    }
  }
}

///|
/// `enter lconsts (tm, elem) net`: store `elem` under the pattern `tm`;
/// variables in `lconsts` are treated as local constants.
pub fn[A : NetCompare] enter(
  lconsts : List[Term],
  tm : Term,
  elem : A,
  net : Net[A],
) -> Net[A] {
  net_update(
    (a : A, b : A) => a.net_compare(b),
    lconsts,
    elem,
    @list.singleton(tm),
    net,
  )
}

///|
/// OCaml's `compare` on closures: equal when physically equal, else it
/// raises (`None`, see `NetCompare`).
fn[A] closure_compare(a : A, b : A) -> Int32? {
  if physical_equal(a, b) {
    Some(0)
  } else {
    None
  }
}

///|
/// `enter` for a net of functions (MoonBit closures cannot implement
/// `NetCompare`).
pub fn[A] enter_fn(
  lconsts : List[Term],
  tm : Term,
  elem : A,
  net : Net[A],
) -> Net[A] {
  net_update(closure_compare, lconsts, elem, @list.singleton(tm), net)
}

///|
fn label_for_lookup(tm : Term) -> (Label, List[Term]) {
  let (op, args) = @basics.strip_comb(tm)
  match op {
    Const(name, _) => (Cnet(name, args.length()), args)
    Abs(_, bod) => (Lnet(args.length()), args.prepend(bod))
    Var(name, _) => (Lcnet(name, args.length()), args)
    Comb(_) => abort("nets: strip_comb returned a combination")
  }
}

///|
fn[A] follow(tms : List[Term], net : Net[A]) -> List[A] {
  match tms {
    Empty => net.tips
    More(tm, tail=rtms) => {
      let (label, ntms) = label_for_lookup(tm)
      let child = match label {
        Cnet(s, n) => net.cnets.get((s, n))
        Lcnet(s, n) => net.lcnets.get((s, n))
        Lnet(n) => net.lnets.get(n)
        Vnet => None
      }
      let collection = match child {
        Some(c) => follow(ntms.concat(rtms), c)
        None => @list.List([])
      }
      match net.vnet {
        None => collection
        Some(vchild) => collection.concat(follow(rtms, vchild))
      }
    }
  }
}

///|
/// The values whose patterns might match `tm`.
pub fn[A] lookup(tm : Term, net : Net[A]) -> List[A] {
  follow(@list.singleton(tm), net)
}

///|
fn[A] set_merge(cmp : (A, A) -> Int32?, l1 : List[A], l2 : List[A]) -> List[A] {
  let out = []
  let mut a = l1
  let mut b = l2
  while true {
    match (a, b) {
      (Empty, rest) | (rest, Empty) => {
        let mut acc = rest
        for i = out.length() - 1; i >= 0; i = i - 1 {
          acc = acc.prepend(out[i])
        }
        return acc
      }
      (More(h1, tail=t1), More(h2, tail=t2)) =>
        match cmp(h1, h2) {
          Some(0) => {
            out.push(h1)
            a = t1
            b = t2
          }
          Some(c) if c < 0 => {
            out.push(h1)
            a = t1
          }
          _ => {
            out.push(h2)
            b = t2
          }
        }
    }
  }
  l1
}

///|
fn[A] merge_nets_by(cmp : (A, A) -> Int32?, n1 : Net[A], n2 : Net[A]) -> Net[A] {
  let vnet = match (n1.vnet, n2.vnet) {
    (Some(x), Some(y)) => Some(merge_nets_by(cmp, x, y))
    (Some(_), None) => n1.vnet
    (None, _) => n2.vnet
  }
  {
    vnet,
    cnets: n1.cnets.union_with(n2.cnets, (_, a, b) => merge_nets_by(cmp, a, b)),
    lcnets: n1.lcnets.union_with(n2.lcnets, (_, a, b) => {
      merge_nets_by(cmp, a, b)
    }),
    lnets: n1.lnets.union_with(n2.lnets, (_, a, b) => merge_nets_by(cmp, a, b)),
    tips: set_merge(cmp, n1.tips, n2.tips),
  }
}

///|
/// Merge two nets (code from Don Syme's hol-lite).
pub fn[A : NetCompare] merge_nets(n1 : Net[A], n2 : Net[A]) -> Net[A] {
  merge_nets_by((a : A, b : A) => a.net_compare(b), n1, n2)
}

///|
/// `merge_nets` for nets of functions.
pub fn[A] merge_nets_fn(n1 : Net[A], n2 : Net[A]) -> Net[A] {
  merge_nets_by(closure_compare, n1, n2)
}
