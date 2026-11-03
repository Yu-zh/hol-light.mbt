// Translated from upstream metis.ml; edit this file directly.

///|
/// metisverb
fn step_1() -> Unit raise {
  metisverb_c.set(Ref::{ val: false, })
}

///|
let metisverb_c : @lib.Cell[Ref[Bool]] = @lib.Cell::new("metisverb")

///|
/// `metisverb`
pub fn metisverb() -> Ref[Bool] {
  metisverb_c.get()
}

///|
/// `word`
pub type Word = Int64

///|
/// `compare`
pub fn compare(x1 : Int64, x2 : Int64) -> Int64 raise {
  let _ as x = x1
  let _ as y = x2
  Int::to_int64(@lib.compare(x, y))
}

///|
/// `shiftLeft`
pub fn shiftleft(x3 : Int64, x4 : Int64) -> Int64 raise {
  let (x, y) = (x3, x4)
  @lib.lsl63(x, y)
}

///|
/// `shiftRight`
pub fn shiftright(x5 : Int64, x6 : Int64) -> Int64 raise {
  let (x, y) = (x5, x6)
  @lib.lsr63(x, y)
}

///|
/// `minus`
pub fn minus(x7 : Int64, x8 : Int64) -> Int64 raise {
  let (x, y) = (x7, x8)
  @lib.sub63(x, y)
}

///|
/// `andb`
pub fn andb(x9 : Int64, x10 : Int64) -> Int64 raise {
  let (x, y) = (x9, x10)
  x & y
}

///|
/// `orb`
pub fn orb(x11 : Int64, x12 : Int64) -> Int64 raise {
  let (x, y) = (x11, x12)
  x | y
}

///|
/// `xorb`
pub fn xorb(x13 : Int64, x14 : Int64) -> Int64 raise {
  let (x, y) = (x13, x14)
  x ^ y
}

///|
/// `notb`
pub fn notb(x15 : Int64) -> Int64 raise {
  let x = x15
  @lib.lnot63(x)
}

///|
/// `toInt`
pub fn[TA] toint(x16 : TA) -> TA raise {
  let x = x16
  x
}

///|
/// `fromInt`
pub fn[TA] fromint(x17 : TA) -> TA raise {
  let x = x17
  x
}

///|
/// `foldl`
pub fn[TA, TB] foldl(
  x18 : ((TB, TA)) -> TA raise,
  x19 : TA,
  x20 : @list.List[TB],
) -> TA raise {
  let f = x18
  let a = x19
  let l = x20
  @lib.fold_left(
    fn(x21 : TA, x22 : TB) -> TA raise {
      let acc = x21
      let x = x22
      f((x, acc))
    },
    a,
    l,
  )
}

///|
/// `foldr`
pub fn[TA, TB] foldr(
  x23 : ((TB, TA)) -> TA raise,
  x24 : TA,
  x25 : @list.List[TB],
) -> TA raise {
  let f = x23
  let a = x24
  let l = x25
  @lib.itlist(
    fn(x26 : TB, x27 : TA) -> TA raise {
      let x = x26
      let acc = x27
      f((x, acc))
    },
    l,
    a,
  )
}

///|
/// `null`
pub fn[TA] null(x28 : @list.List[TA]) -> Bool raise {
  match x28 {
    Empty => true
    _ => false
  }
}

///|
/// `tabulate`
pub fn[TA] tabulate(
  x29 : Int64,
  x30 : (Int64) -> TA raise,
) -> @list.List[TA] raise {
  let (n, f) = (x29, x30)
  fn go(x31 : Int64) -> @list.List[TA] raise {
    let i = x31
    if physical_equal(i, n) {
      @list.List([])
    } else {
      let t32 = go(@lib.add63(i, 1L))
      t32.prepend(f(i))
    }
  }
  go(0L)
}

///|
/// `find`
pub fn[TA] find(x33 : (TA) -> Bool raise, x34 : @list.List[TA]) -> TA? raise {
  let p = x33
  let l = x34
  Some(@lib.list_find(p, l)) catch {
    @lib.NotFound => None
    e => raise e
  }
}

///|
/// `first`
pub fn[TA, TB] first(
  x35 : (TB) -> TA? raise,
  x36 : @list.List[TB],
) -> TA? raise {
  let f = x35
  match x36 {
    Empty => None
    More(x, tail=xs) =>
      match f(x) {
        None => first(f, xs)
        s => s
      }
  }
}

///|
/// `enumerate`
pub fn[TA] enumerate(x37 : @list.List[TA]) -> @list.List[(Int64, TA)] raise {
  let l = x37
  @lib.mapi(
    fn(x38 : Int, x39 : TA) -> (Int64, TA) raise {
      let x = x38
      let y = x39
      (Int::to_int64(x), y)
    },
    l,
  )
}

///|
/// `revDivide`
pub fn[TA] revdivide(
  x40 : @list.List[TA],
) -> ((Int64) -> (@list.List[TA], @list.List[TA]) raise) raise {
  let l = x40
  fn(x44 : Int64) -> (@list.List[TA], @list.List[TA]) raise {
    let n_1 = x44
    revdiv_l(@list.List([]), (l, n_1))
  }
}

///|
fn[TB] revdiv_l(
  x42 : @list.List[TB],
  x43 : (@list.List[TB], Int64),
) -> (@list.List[TB], @list.List[TB]) raise {
  let acc = x42
  match x43 {
    (l_1, 0L) => (acc, l_1)
    (Empty, _) => raise @num.InvalidArgument("Metis_prover.Mlist.revDivide")
    (More(h, tail=t), n) => revdiv_l(acc.prepend(h), (t, @lib.sub63(n, 1L)))
  }
}

///|
/// `updateNth`
pub fn[TA] updatenth(
  x45 : (Int64, TA),
  x46 : @list.List[TA],
) -> @list.List[TA] raise {
  let (n, x) = x45
  let l = x46
  let (a, b) = revdivide(l)(n)
  match b {
    Empty => raise @num.InvalidArgument("Metis_prover.Mlist.updateNth")
    More(_, tail=t) => @lib.rev_append(a, t.prepend(x))
  }
}

///|
/// `sortMap`
pub fn[TA, TB] sortmap(
  x47 : (TA) -> TB raise,
  x48 : (TB) -> ((TB) -> Int64 raise) raise,
  x49 : @list.List[TA],
) -> @list.List[TA] raise {
  let f = x47
  let cmp = x48
  match x49 {
    Empty => @list.List([])
    More(_, tail=Empty) as l => l
    xs => {
      let nxs = @lib.map(
        fn(x52 : TA) -> (TB, TA) raise {
          let x = x52
          (f(x), x)
        },
        xs,
      )
      let nys = @lib.list_sort(
        fn(x53 : (TB, TA), x54 : (TB, TA)) -> Int raise {
          @lib.int63_to_int(((x50, x51) => ncmp_l(cmp, x50, x51))(x53, x54))
        },
        nxs,
      )
      @lib.map(fn(x55 : (TB, TA)) -> TA raise { x55.1 }, nys)
    }
  }
}

///|
fn[TB, TC, TD] ncmp_l(
  cmp : (TB) -> ((TB) -> Int64 raise) raise,
  x50 : (TB, TD),
  x51 : (TB, TC),
) -> Int64 raise {
  let (m, _) = x50
  let (n, _) = x51
  cmp(m)(n)
}

///|
/// `is_some`
pub fn[TA] is_some(x56 : TA?) -> Bool raise {
  match x56 {
    Some(_) => true
    None => false
  }
}

///|
/// `bind`
pub fn[TA, TB] bind(x57 : TB?, x58 : (TB) -> TA? raise) -> TA? raise {
  let opt = x57
  let f = x58
  match opt {
    Some(x) => f(x)
    None => None
  }
}

///|
/// `value`
pub fn[TA] value(x59 : TA?, x60 : TA) -> TA raise {
  let opt = x59
  let default = x60
  match opt {
    Some(x) => x
    None => default
  }
}

///|
/// `critical`
pub fn[TA] critical(x61 : TA) -> TA raise {
  let x = x61
  x
}

///|
/// `isDigit`
pub fn isdigit(x62 : Char) -> Bool raise {
  let c = x62
  @lib.compare('0', c) <= 0 && @lib.compare(c, '9') <= 0
}

///|
/// `exception Bug`
pub(all) suberror Bug {
  Bug(String)
}

///|
/// `total`
pub fn[TA, TB] total(x63 : (TB) -> TA raise, x64 : TB) -> TA? raise {
  let f = x63
  let x = x64
  Some(f(x)) catch {
    Failure(_) => None
    e => raise e
  }
}

///|
/// `exp`
pub fn[TA] exp(
  x65 : ((TA, TA)) -> TA raise,
) -> ((TA) -> ((Int64) -> ((TA) -> TA raise) raise) raise) raise {
  let m = x65
  fn f(x67 : TA, x68 : Int64, x69 : TA) -> TA raise {
    let x = x67
    let y = x68
    let z = x69
    match y {
      0L => z
      _ => {
        let t70 = if @lib.mod63(y, 2L) == 0L { z } else { m((z, x)) }
        let t71 = @lib.div63(y, 2L)
        f(m((x, x)), t71, t70)
      }
    }
  }
  fn(x72 : TA) -> ((Int64) -> ((TA) -> TA raise) raise) raise {
    fn(x73 : Int64) -> ((TA) -> TA raise) raise {
      fn(x74 : TA) -> TA raise { f(x72, x73, x74) }
    }
  }
}

///|
/// `revCompare`
pub fn[TA, TB, TC] revcompare(
  x75 : (TC) -> ((TB) -> TA raise) raise,
  x76 : TB,
  x77 : TC,
) -> TA raise {
  let cmp = x75
  let x = x76
  let y = x77
  cmp(y)(x)
}

///|
/// `prodCompare`
pub fn[TA, TB, TC, TD] prodcompare(
  x78 : (TB) -> ((TA) -> Int64 raise) raise,
  x79 : (TD) -> ((TC) -> Int64 raise) raise,
  x80 : (TB, TD),
  x81 : (TA, TC),
) -> Int64 raise {
  let xcmp = x78
  let ycmp = x79
  let (x1, y1) = x80
  let (x2, y2) = x81
  let c = xcmp(x1)(x2)
  if c != 0L {
    c
  } else {
    ycmp(y1)(y2)
  }
}

///|
/// `lexCompare`
pub fn[TA, TB] lexcompare(
  x82 : (TB) -> ((TA) -> Int64 raise) raise,
) -> ((@list.List[TB]) -> ((@list.List[TA]) -> Int64 raise) raise) raise {
  let cmp = x82
  fn lex(x84 : @list.List[TB], x85 : @list.List[TA]) -> Int64 raise {
    let xs = x84
    let ys = x85
    match (xs, ys) {
      (Empty, Empty) => 0L
      (Empty, More(_, tail=_)) => -1L
      (More(_, tail=_), Empty) => 1L
      (More(x, tail=xs_1), More(y, tail=ys_1)) => {
        let c = cmp(x)(y)
        if c != 0L {
          c
        } else {
          lex(xs_1, ys_1)
        }
      }
    }
  }
  fn(x86 : @list.List[TB]) -> ((@list.List[TA]) -> Int64 raise) raise {
    fn(x87 : @list.List[TA]) -> Int64 raise { lex(x86, x87) }
  }
}

///|
/// `boolCompare`
pub fn boolcompare(x88 : Bool, x89 : Bool) -> Int64 raise {
  let x = x88
  let y = x89
  match (x, y) {
    (false, true) => -1L
    (true, false) => 1L
    _ => 0L
  }
}

///|
/// `intCompare`
pub fn intcompare(x90 : Int64, x91 : Int64) -> Int64 raise {
  let _ as x = x90
  let y = x91
  Int::to_int64(@lib.compare(x, y))
}

///|
/// `mkPrefix`
pub fn mkprefix(x92 : String, x93 : String) -> String raise {
  let p = x92
  let s = x93
  p + s
}

///|
/// `stripSuffix`
pub fn stripsuffix(x94 : (Char) -> Bool raise, x95 : String) -> String raise {
  let pred = x94
  let s = x95
  fn strip(x96 : Int64) -> String raise {
    let pos = x96
    if pos < 0L {
      ""
    } else if pred(@lib.ocaml_string_get(s, @lib.int63_to_int(pos))) {
      strip(@lib.sub63(pos, 1L))
    } else {
      @lib.string_sub(s, 0, @lib.int63_to_int(@lib.add63(pos, 1L)))
    }
  }
  strip(@lib.sub63(Int::to_int64(@lib.string_length(s)), 1L))
}

///|
/// `interval`
pub fn interval(x97 : Int64, x98 : Int64) -> @list.List[Int64] raise {
  let m = x97
  match x98 {
    0L => @list.List([])
    len => {
      let t99 = @lib.sub63(len, 1L)
      interval(@lib.add63(m, 1L), t99).prepend(m)
    }
  }
}

///|
/// `divides`
pub fn divides(x100 : (Int64, Int64)) -> Bool raise {
  match x100 {
    (_, 0L) => true
    (0L, _) => false
    (a, b) => @lib.mod63(b, @lib.abs63(a)) == 0L
  }
}

///|
/// divides
fn step_2() -> Unit raise {
  divides_v1_c.set(fn(x103 : Int64) -> ((Int64) -> Bool raise) raise {
    fn(x104 : Int64) -> Bool raise {
      ((x101 : Int64, x102 : Int64) => @lib.curry(divides, x101, x102))(
        x103, x104,
      )
    }
  })
}

///|
let divides_v1_c : @lib.Cell[(Int64) -> ((Int64) -> Bool raise) raise] = @lib.Cell::new(
  "divides",
)

///|
/// `divides`
pub fn divides_v1(x : Int64) -> ((Int64) -> Bool raise) raise {
  divides_v1_c.get()(x)
}

///|
/// generator
fn step_3() -> Unit raise {
  generator_c.set(Ref::{ val: 0L, })
}

///|
let generator_c : @lib.Cell[Ref[Int64]] = @lib.Cell::new("generator")

///|
/// `generator`
pub fn generator() -> Ref[Int64] {
  generator_c.get()
}

///|
/// `newIntThunk`
pub fn newintthunk(x105 : Unit) -> Int64 raise {
  let _ = x105
  let n = generator().val
  {
    generator().val = @lib.add63(n, 1L)
    ()
  }
  n
}

///|
/// `newIntsThunk`
pub fn newintsthunk(x106 : Int64, x107 : Unit) -> @list.List[Int64] raise {
  let k = x106
  let _ = x107
  let n = generator().val
  {
    generator().val = @lib.add63(n, k)
    ()
  }
  interval(n, k)
}

///|
/// `newInt`
pub fn newint(x108 : Unit) -> Int64 raise {
  let _ = x108
  newintthunk(())
}

///|
/// `newInts`
pub fn newints(x109 : Int64) -> @list.List[Int64] raise {
  let k = x109
  if k <= 0L {
    @list.List([])
  } else {
    newintsthunk(k, ())
  }
}

///|
/// `equalKey`
pub fn[TA, TB] equalkey(
  x110 : (TB) -> ((TA) -> Int64 raise) raise,
  x111 : TB,
  x112 : TA,
) -> Bool raise {
  let comparekey = x110
  let key1 = x111
  let key2 = x112
  comparekey(key1)(key2) == 0L
}

///|
/// `priority`
pub type Priority = Word

///|
/// randomPriority
fn step_4() -> Unit raise {
  randompriority_c.set(fn(x113 : Unit) -> Int64 raise { @lib.random_bits() })
}

///|
let randompriority_c : @lib.Cell[(Unit) -> Int64 raise] = @lib.Cell::new(
  "randomPriority",
)

///|
/// `randomPriority`
pub fn randompriority(x : Unit) -> Int64 raise {
  randompriority_c.get()(x)
}

///|
/// comparePriority
fn step_5() -> Unit raise {
  comparepriority_c.set(fn(x114 : Int64) -> ((Int64) -> Int64 raise) raise {
    fn(x115 : Int64) -> Int64 raise { compare(x114, x115) }
  })
}

///|
let comparepriority_c : @lib.Cell[(Word) -> ((Word) -> Int64 raise) raise] = @lib.Cell::new(
  "comparePriority",
)

///|
/// `comparePriority`
pub fn comparepriority(x : Word) -> ((Word) -> Int64 raise) raise {
  comparepriority_c.get()(x)
}

///|
/// `tree`
#derive(Eq, Debug)
pub(all) enum Tree[TA, TB] {
  Empty
  Tree(Node[TA, TB])
}

///|
pub extend Tree with Eq::{not_equal, equal}

///|
pub extend Tree with Debug::{to_repr}

///|
pub extend Tree with @lib.OCompare::{ocompare}

///|
pub extend Tree with @lib.OHash::{ohash_visit}

///|
fn[TA, TB] ocaml_rank_Tree(x : Tree[TA, TB]) -> Int {
  match x {
    Empty => 0
    Tree(_) => 1000000
  }
}

///|
pub impl[TA : @lib.OCompare, TB : @lib.OCompare] @lib.OCompare for Tree[TA, TB] with fn ocompare(
  self,
  other,
) {
  match (self, other) {
    (Tree(a0), Tree(b0)) => @lib.compare(a0, b0)
    _ => ocaml_rank_Tree(self).compare(ocaml_rank_Tree(other))
  }
}

///|
pub impl[TA : @lib.OHash, TB : @lib.OHash] @lib.OHash for Tree[TA, TB] with fn ohash_visit(
  self,
  h,
) {
  match self {
    Empty => h.int(0L)
    Tree(a0) => {
      h.block(0, 1)
      h.field(a0)
    }
  }
}

///|
/// `node`
#derive(Eq, Debug)
pub(all) struct Node[TA, TB] {
  size : Int64
  priority : Priority
  left : Tree[TA, TB]
  key : TA
  value : TB
  right : Tree[TA, TB]
}

///|
pub extend Node with Eq::{not_equal, equal}

///|
pub extend Node with Debug::{to_repr}

///|
pub extend Node with @lib.OCompare::{ocompare}

///|
pub extend Node with @lib.OHash::{ohash_visit}

///|
pub impl[TA : @lib.OCompare, TB : @lib.OCompare] @lib.OCompare for Node[TA, TB] with fn ocompare(
  self,
  other,
) {
  let c = @lib.compare(self.size, other.size)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.priority, other.priority)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.left, other.left)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.key, other.key)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.value, other.value)
  if c != 0 {
    return c
  }
  @lib.compare(self.right, other.right)
}

///|
pub impl[TA : @lib.OHash, TB : @lib.OHash] @lib.OHash for Node[TA, TB] with fn ohash_visit(
  self,
  h,
) {
  h.block(0, 6)
  h.field(self.size)
  h.field(self.priority)
  h.field(self.left)
  h.field(self.key)
  h.field(self.value)
  h.field(self.right)
}

///|
/// `lowerPriorityNode`
pub fn[TA, TB, TC, TD] lowerprioritynode(
  x116 : Node[TA, TB],
  x117 : Node[TC, TD],
) -> Bool raise {
  let node1 = x116
  let node2 = x117
  match node1 {
    { priority: p1, .. } =>
      match node2 {
        { priority: p2, .. } => comparepriority(p1)(p2) < 0L
        _ => raise @lib.MatchFailure("tscript.ml:260")
      }
    _ => raise @lib.MatchFailure("tscript.ml:259")
  }
}

///|
/// `treeNew`
pub fn[TA, TB] treenew(x118 : Unit) -> Tree[TA, TB] raise {
  let _ = x118
  Tree::Empty
}

///|
/// `nodeSize`
pub fn[TA, TB] nodesize(x119 : Node[TA, TB]) -> Int64 raise {
  match x119 {
    { size: x, .. } => x
  }
}

///|
/// `treeSize`
pub fn[TA, TB] treesize(x120 : Tree[TA, TB]) -> Int64 raise {
  let tree = x120
  match tree {
    Tree::Empty => 0L
    Tree::Tree(x) => nodesize(x)
  }
}

///|
/// `mkNode`
pub fn[TA, TB] mknode(
  x121 : Int64,
  x122 : Tree[TA, TB],
  x123 : TA,
  x124 : TB,
  x125 : Tree[TA, TB],
) -> Node[TA, TB] raise {
  let priority = x121
  let left = x122
  let key = x123
  let value_1 = x124
  let right = x125
  let t126 = treesize(right)
  let size = @lib.add63(@lib.add63(treesize(left), 1L), t126)
  Node::{ size, priority, left, key, value: value_1, right, }
}

///|
/// `mkTree`
pub fn[TA, TB] mktree(
  x127 : Int64,
  x128 : Tree[TA, TB],
  x129 : TA,
  x130 : TB,
  x131 : Tree[TA, TB],
) -> Tree[TA, TB] raise {
  let priority = x127
  let left = x128
  let key = x129
  let value_1 = x130
  let right = x131
  let node = mknode(priority, left, key, value_1, right)
  Tree::Tree(node)
}

///|
/// `treeLeftSpine`
pub fn[TA, TB] treeleftspine(
  x132 : @list.List[Node[TA, TB]],
  x133 : Tree[TA, TB],
) -> @list.List[Node[TA, TB]] raise {
  let acc = x132
  let tree = x133
  match tree {
    Tree::Empty => acc
    Tree::Tree(node) => nodeleftspine(acc, node)
  }
}

///|
/// `nodeLeftSpine`
pub fn[TA, TB] nodeleftspine(
  x134 : @list.List[Node[TA, TB]],
  x135 : Node[TA, TB],
) -> @list.List[Node[TA, TB]] raise {
  let acc_1 = x134
  let node_1 = x135
  match node_1 {
    { left, .. } => treeleftspine(acc_1.prepend(node_1), left)
    _ => raise @lib.MatchFailure("tscript.ml:383")
  }
}

///|
/// `treeRightSpine`
pub fn[TA, TB] treerightspine(
  x136 : @list.List[Node[TA, TB]],
  x137 : Tree[TA, TB],
) -> @list.List[Node[TA, TB]] raise {
  let acc = x136
  let tree = x137
  match tree {
    Tree::Empty => acc
    Tree::Tree(node) => noderightspine(acc, node)
  }
}

///|
/// `nodeRightSpine`
pub fn[TA, TB] noderightspine(
  x138 : @list.List[Node[TA, TB]],
  x139 : Node[TA, TB],
) -> @list.List[Node[TA, TB]] raise {
  let acc_1 = x138
  let node_1 = x139
  match node_1 {
    { right, .. } => treerightspine(acc_1.prepend(node_1), right)
    _ => raise @lib.MatchFailure("tscript.ml:394")
  }
}

///|
/// `mkNodeSingleton`
pub fn[TA, TB] mknodesingleton(
  x140 : Int64,
  x141 : TA,
  x142 : TB,
) -> Node[TA, TB] raise {
  let priority = x140
  let key = x141
  let value_1 = x142
  let size = 1L
  let left = Tree::Empty
  let right = Tree::Empty
  Node::{ size, priority, left, key, value: value_1, right, }
}

///|
/// `nodeSingleton`
pub fn[TA, TB] nodesingleton(x143 : TA, x144 : TB) -> Node[TA, TB] raise {
  let (key, value_1) = (x143, x144)
  let priority = randompriority(())
  mknodesingleton(priority, key, value_1)
}

///|
/// `treeSingleton`
pub fn[TA, TB] treesingleton(x145 : (TA, TB)) -> Tree[TA, TB] raise {
  let key_value = x145
  let node = nodesingleton(key_value.0, key_value.1)
  Tree::Tree(node)
}

///|
/// `treeAppend`
pub fn[TA, TB] treeappend(
  x146 : Tree[TA, TB],
  x147 : Tree[TA, TB],
) -> Tree[TA, TB] raise {
  let tree1 = x146
  let tree2 = x147
  match tree1 {
    Tree::Empty => tree2
    Tree::Tree(node1) =>
      match tree2 {
        Tree::Empty => tree1
        Tree::Tree(node2) =>
          if lowerprioritynode(node1, node2) {
            match node2 {
              { priority, left, key, value: value_1, right, .. } => {
                let left_1 = treeappend(tree1, left)
                mktree(priority, left_1, key, value_1, right)
              }
              _ => raise @lib.MatchFailure("tscript.ml:441")
            }
          } else {
            match node1 {
              {
                priority: priority_1,
                left: left_2,
                key: key_1,
                value: value_2,
                right: right_1,
                ..
              } => {
                let right_2 = treeappend(right_1, tree2)
                mktree(priority_1, left_2, key_1, value_2, right_2)
              }
              _ => raise @lib.MatchFailure("tscript.ml:447")
            }
          }
      }
  }
}

///|
/// `treeCombine`
pub fn[TA, TB] treecombine(
  x148 : Tree[TA, TB],
  x149 : Node[TA, TB],
  x150 : Tree[TA, TB],
) -> Tree[TA, TB] raise {
  let left = x148
  let node = x149
  let right = x150
  let left_node = treeappend(left, Tree::Tree(node))
  treeappend(left_node, right)
}

///|
/// `treePeek`
pub fn[TA, TB, TC] treepeek(
  x151 : (TC) -> ((TB) -> Int64 raise) raise,
  x152 : TC,
  x153 : Tree[TB, TA],
) -> TA? raise {
  let comparekey = x151
  let pkey = x152
  let tree = x153
  match tree {
    Tree::Empty => None
    Tree::Tree(node) => nodepeek(comparekey, pkey, node)
  }
}

///|
/// `nodePeek`
pub fn[TA, TB, TC] nodepeek(
  x154 : (TC) -> ((TB) -> Int64 raise) raise,
  x155 : TC,
  x156 : Node[TB, TA],
) -> TA? raise {
  let comparekey_1 = x154
  let pkey_1 = x155
  let node_1 = x156
  match node_1 {
    { left, key, value: value_1, right, .. } => {
      let c = comparekey_1(pkey_1)(key)
      if c < 0L {
        treepeek(comparekey_1, pkey_1, left)
      } else if c == 0L {
        Some(value_1)
      } else {
        treepeek(comparekey_1, pkey_1, right)
      }
    }
    _ => raise @lib.MatchFailure("tscript.ml:476")
  }
}

///|
/// `treePeekPath`
pub fn[TA, TB, TC] treepeekpath(
  x157 : (TC) -> ((TA) -> Int64 raise) raise,
  x158 : TC,
  x159 : @list.List[(Bool, Node[TA, TB])],
  x160 : Tree[TA, TB],
) -> (@list.List[(Bool, Node[TA, TB])], Node[TA, TB]?) raise {
  let comparekey = x157
  let pkey = x158
  let path = x159
  let tree = x160
  match tree {
    Tree::Empty => (path, None)
    Tree::Tree(node) => nodepeekpath(comparekey, pkey, path, node)
  }
}

///|
/// `nodePeekPath`
pub fn[TA, TB, TC] nodepeekpath(
  x161 : (TC) -> ((TA) -> Int64 raise) raise,
  x162 : TC,
  x163 : @list.List[(Bool, Node[TA, TB])],
  x164 : Node[TA, TB],
) -> (@list.List[(Bool, Node[TA, TB])], Node[TA, TB]?) raise {
  let comparekey_1 = x161
  let pkey_1 = x162
  let path_1 = x163
  let node_1 = x164
  match node_1 {
    { left, key, right, .. } => {
      let c = comparekey_1(pkey_1)(key)
      if c < 0L {
        treepeekpath(comparekey_1, pkey_1, path_1.prepend((true, node_1)), left)
      } else if c == 0L {
        (path_1, Some(node_1))
      } else {
        treepeekpath(
          comparekey_1,
          pkey_1,
          path_1.prepend((false, node_1)),
          right,
        )
      }
    }
    _ => raise @lib.MatchFailure("tscript.ml:496")
  }
}

///|
/// `addSidePath`
pub fn[TA, TB] addsidepath(
  x165 : (Bool, Node[TA, TB]),
  x166 : (Tree[TA, TB], Tree[TA, TB]),
) -> (Tree[TA, TB], Tree[TA, TB]) raise {
  let ((wentleft, node), (lefttree, righttree)) = (x165, x166)
  match node {
    { priority, left, key, value: value_1, right, .. } =>
      if wentleft {
        (lefttree, mktree(priority, righttree, key, value_1, right))
      } else {
        (mktree(priority, left, key, value_1, lefttree), righttree)
      }
    _ => raise @lib.MatchFailure("tscript.ml:507")
  }
}

///|
/// `addSidesPath`
pub fn[TA, TB] addsidespath(
  x167 : (Tree[TA, TB], Tree[TA, TB]),
) -> ((@list.List[(Bool, Node[TA, TB])]) -> (Tree[TA, TB], Tree[TA, TB]) raise) raise {
  let left_right = x167
  (x170 : @list.List[(Bool, Node[TA, TB])]) => {
    foldl(
      fn(
        x169 : ((Bool, Node[TA, TB]), (Tree[TA, TB], Tree[TA, TB])),
      ) -> (Tree[TA, TB], Tree[TA, TB]) raise {
        addsidepath(x169.0, x169.1)
      },
      left_right,
      x170,
    )
  }
}

///|
/// `mkSidesPath`
pub fn[TA, TB] mksidespath(
  x171 : @list.List[(Bool, Node[TA, TB])],
) -> (Tree[TA, TB], Tree[TA, TB]) raise {
  let path = x171
  addsidespath((Tree::Empty, Tree::Empty))(path)
}

///|
/// `updateTree`
pub fn[TA, TB] updatetree(
  x172 : (Bool, Node[TA, TB]),
  x173 : Tree[TA, TB],
) -> Tree[TA, TB] raise {
  let ((wentleft, node), tree) = (x172, x173)
  match node {
    { priority, left, key, value: value_1, right, .. } =>
      if wentleft {
        mktree(priority, tree, key, value_1, right)
      } else {
        mktree(priority, left, key, value_1, tree)
      }
    _ => raise @lib.MatchFailure("tscript.ml:520")
  }
}

///|
/// `updateTreePath`
pub fn[TA, TB] updatetreepath(
  x174 : Tree[TA, TB],
) -> ((@list.List[(Bool, Node[TA, TB])]) -> Tree[TA, TB] raise) raise {
  let tree = x174
  (x177 : @list.List[(Bool, Node[TA, TB])]) => {
    foldl(
      fn(x176 : ((Bool, Node[TA, TB]), Tree[TA, TB])) -> Tree[TA, TB] raise {
        updatetree(x176.0, x176.1)
      },
      tree,
      x177,
    )
  }
}

///|
/// `insertNodePath`
pub fn[TA, TB] insertnodepath(
  x178 : Node[TA, TB],
) -> ((@list.List[(Bool, Node[TA, TB])]) -> Tree[TA, TB] raise) raise {
  let node = x178
  fn insert(
    x180 : (Tree[TA, TB], Tree[TA, TB]),
    x181 : @list.List[(Bool, Node[TA, TB])],
  ) -> Tree[TA, TB] raise {
    let left_right = x180
    let path = x181
    match path {
      Empty => {
        let (left, right) = left_right
        treecombine(left, node, right)
      }
      More((_, snode) as step, tail=rest) =>
        if lowerprioritynode(snode, node) {
          let left_right_1 = addsidepath(step, left_right)
          insert(left_right_1, rest)
        } else {
          let (left_1, right_1) = left_right
          let tree = treecombine(left_1, node, right_1)
          updatetreepath(tree)(path)
        }
    }
  }
  (x182 : @list.List[(Bool, Node[TA, TB])]) => {
    insert((Tree::Empty, Tree::Empty), x182)
  }
}

///|
/// `nodePartition`
pub fn[TA, TB, TC] nodepartition(
  x183 : (TC) -> ((TA) -> Int64 raise) raise,
  x184 : TC,
  x185 : Node[TA, TB],
) -> (Tree[TA, TB], (TA, TB)?, Tree[TA, TB]) raise {
  let comparekey = x183
  let pkey = x184
  let node = x185
  let (path, pnode) = nodepeekpath(comparekey, pkey, @list.List([]), node)
  match pnode {
    None => {
      let (left, right) = mksidespath(path)
      (left, None, right)
    }
    Some(node_1) =>
      match node_1 {
        { left: left_1, key, value: value_1, right: right_1, .. } => {
          let (left_2, right_2) = addsidespath((left_1, right_1))(path)
          (left_2, Some((key, value_1)), right_2)
        }
        _ => raise @lib.MatchFailure("tscript.ml:565")
      }
  }
}

///|
/// `treePeekKey`
pub fn[TA, TB, TC] treepeekkey(
  x186 : (TC) -> ((TA) -> Int64 raise) raise,
  x187 : TC,
  x188 : Tree[TA, TB],
) -> (TA, TB)? raise {
  let comparekey = x186
  let pkey = x187
  let tree = x188
  match tree {
    Tree::Empty => None
    Tree::Tree(node) => nodepeekkey(comparekey, pkey, node)
  }
}

///|
/// `nodePeekKey`
pub fn[TA, TB, TC] nodepeekkey(
  x189 : (TC) -> ((TA) -> Int64 raise) raise,
  x190 : TC,
  x191 : Node[TA, TB],
) -> (TA, TB)? raise {
  let comparekey_1 = x189
  let pkey_1 = x190
  let node_1 = x191
  match node_1 {
    { left, key, value: value_1, right, .. } => {
      let c = comparekey_1(pkey_1)(key)
      if c < 0L {
        treepeekkey(comparekey_1, pkey_1, left)
      } else if c == 0L {
        Some((key, value_1))
      } else {
        treepeekkey(comparekey_1, pkey_1, right)
      }
    }
    _ => raise @lib.MatchFailure("tscript.ml:582")
  }
}

///|
/// `treeInsert`
pub fn[TA, TB] treeinsert(
  x192 : (TA) -> ((TA) -> Int64 raise) raise,
  x193 : (TA, TB),
  x194 : Tree[TA, TB],
) -> Tree[TA, TB] raise {
  let comparekey = x192
  let key_value = x193
  let tree = x194
  let (key, value_1) = key_value
  let (path, inode) = treepeekpath(comparekey, key, @list.List([]), tree)
  match inode {
    None => {
      let node = nodesingleton(key, value_1)
      insertnodepath(node)(path)
    }
    Some(node_1) =>
      match node_1 {
        { size, priority, left, right, .. } => {
          let node_2 = Node::{
            size,
            priority,
            left,
            key,
            value: value_1,
            right,
          }
          updatetreepath(Tree::Tree(node_2))(path)
        }
        _ => raise @lib.MatchFailure("tscript.ml:605")
      }
  }
}

///|
/// `treeDelete`
pub fn[TA, TB, TC] treedelete(
  x195 : (TC) -> ((TA) -> Int64 raise) raise,
  x196 : TC,
  x197 : Tree[TA, TB],
) -> Tree[TA, TB] raise {
  let comparekey = x195
  let dkey = x196
  let tree = x197
  match tree {
    Tree::Empty => raise Bug::Bug("Map.delete: element not found")
    Tree::Tree(node) => nodedelete(comparekey, dkey, node)
  }
}

///|
/// `nodeDelete`
pub fn[TA, TB, TC] nodedelete(
  x198 : (TC) -> ((TA) -> Int64 raise) raise,
  x199 : TC,
  x200 : Node[TA, TB],
) -> Tree[TA, TB] raise {
  let comparekey_1 = x198
  let dkey_1 = x199
  let node_1 = x200
  match node_1 {
    { size, priority, left, key, value: value_1, right } => {
      let c = comparekey_1(dkey_1)(key)
      if c < 0L {
        let size_1 = @lib.sub63(size, 1L)
        let left_1 = treedelete(comparekey_1, dkey_1, left)
        let node_2 = Node::{
          size: size_1,
          priority,
          left: left_1,
          key,
          value: value_1,
          right,
        }
        Tree::Tree(node_2)
      } else if c == 0L {
        treeappend(left, right)
      } else {
        let size_2 = @lib.sub63(size, 1L)
        let right_1 = treedelete(comparekey_1, dkey_1, right)
        let node_3 = Node::{
          size: size_2,
          priority,
          left,
          key,
          value: value_1,
          right: right_1,
        }
        Tree::Tree(node_3)
      }
    }
    _ => raise @lib.MatchFailure("tscript.ml:629")
  }
}

///|
/// `treeMapPartial`
pub fn[TA, TB, TC] treemappartial(
  x201 : ((TA, TC)) -> TB? raise,
  x202 : Tree[TA, TC],
) -> Tree[TA, TB] raise {
  let f = x201
  let tree = x202
  match tree {
    Tree::Empty => Tree::Empty
    Tree::Tree(node) => nodemappartial(f, node)
  }
}

///|
/// `nodeMapPartial`
pub fn[TA, TB, TC] nodemappartial(
  x203 : ((TA, TC)) -> TB? raise,
  x204 : Node[TA, TC],
) -> Tree[TA, TB] raise {
  let f_1 = x203
  match x204 {
    { priority, left, key, value: value_1, right, .. } => {
      let left_1 = treemappartial(f_1, left)
      let vo = f_1((key, value_1))
      let right_1 = treemappartial(f_1, right)
      match vo {
        None => treeappend(left_1, right_1)
        Some(value_2) => mktree(priority, left_1, key, value_2, right_1)
      }
    }
  }
}

///|
/// `treeMap`
pub fn[TA, TB, TC] treemap(
  x205 : ((TA, TC)) -> TB raise,
  x206 : Tree[TA, TC],
) -> Tree[TA, TB] raise {
  let f = x205
  let tree = x206
  match tree {
    Tree::Empty => Tree::Empty
    Tree::Tree(node) => Tree::Tree(nodemap(f, node))
  }
}

///|
/// `nodeMap`
pub fn[TA, TB, TC] nodemap(
  x207 : ((TA, TC)) -> TB raise,
  x208 : Node[TA, TC],
) -> Node[TA, TB] raise {
  let f_1 = x207
  let node_1 = x208
  match node_1 {
    { size, priority, left, key, value: value_1, right } => {
      let left_1 = treemap(f_1, left)
      let value_2 = f_1((key, value_1))
      let right_1 = treemap(f_1, right)
      Node::{
        size,
        priority,
        left: left_1,
        key,
        value: value_2,
        right: right_1,
      }
    }
    _ => raise @lib.MatchFailure("tscript.ml:691")
  }
}

///|
/// `treeMerge`
pub fn[TA, TB, TC, TD] treemerge(
  x209 : (TA) -> ((TA) -> Int64 raise) raise,
  x210 : ((TA, TC)) -> TB? raise,
  x211 : ((TA, TD)) -> TB? raise,
  x212 : (((TA, TC), (TA, TD))) -> TB? raise,
  x213 : Tree[TA, TC],
  x214 : Tree[TA, TD],
) -> Tree[TA, TB] raise {
  let comparekey = x209
  let f1 = x210
  let f2 = x211
  let fb = x212
  let tree1 = x213
  let tree2 = x214
  match tree1 {
    Tree::Empty => treemappartial(f2, tree2)
    Tree::Tree(node1) =>
      match tree2 {
        Tree::Empty => treemappartial(f1, tree1)
        Tree::Tree(node2) => nodemerge(comparekey, f1, f2, fb, node1, node2)
      }
  }
}

///|
/// `nodeMerge`
pub fn[TA, TB, TC, TD] nodemerge(
  x215 : (TA) -> ((TA) -> Int64 raise) raise,
  x216 : ((TA, TC)) -> TB? raise,
  x217 : ((TA, TD)) -> TB? raise,
  x218 : (((TA, TC), (TA, TD))) -> TB? raise,
  x219 : Node[TA, TC],
  x220 : Node[TA, TD],
) -> Tree[TA, TB] raise {
  let comparekey_1 = x215
  let f1_1 = x216
  let f2_1 = x217
  let fb_1 = x218
  let node1_1 = x219
  let node2_1 = x220
  match node2_1 {
    { priority, left, key, value: value_1, right, .. } => {
      let (l, kvo, r) = nodepartition(comparekey_1, key, node1_1)
      let left_1 = treemerge(comparekey_1, f1_1, f2_1, fb_1, l, left)
      let right_1 = treemerge(comparekey_1, f1_1, f2_1, fb_1, r, right)
      let vo = match kvo {
        None => f2_1((key, value_1))
        Some(kv) => fb_1((kv, (key, value_1)))
      }
      match vo {
        None => treeappend(left_1, right_1)
        Some(value_2) => {
          let node = mknodesingleton(priority, key, value_2)
          treecombine(left_1, node, right_1)
        }
      }
    }
    _ => raise @lib.MatchFailure("tscript.ml:719")
  }
}

///|
/// `treeUnion`
pub fn[TA, TB] treeunion(
  x221 : (TA) -> ((TA) -> Int64 raise) raise,
  x222 : (((TA, TB), (TA, TB))) -> TB? raise,
  x223 : ((TA, TB)) -> TB? raise,
  x224 : Tree[TA, TB],
  x225 : Tree[TA, TB],
) -> Tree[TA, TB] raise {
  let comparekey = x221
  let f = x222
  let f2 = x223
  let tree1 = x224
  let tree2 = x225
  match tree1 {
    Tree::Empty => tree2
    Tree::Tree(node1) =>
      match tree2 {
        Tree::Empty => tree1
        Tree::Tree(node2) => nodeunion(comparekey, f, f2, node1, node2)
      }
  }
}

///|
/// `nodeUnion`
pub fn[TA, TB] nodeunion(
  x226 : (TA) -> ((TA) -> Int64 raise) raise,
  x227 : (((TA, TB), (TA, TB))) -> TB? raise,
  x228 : ((TA, TB)) -> TB? raise,
  x229 : Node[TA, TB],
  x230 : Node[TA, TB],
) -> Tree[TA, TB] raise {
  let comparekey_1 = x226
  let f_1 = x227
  let f2_1 = x228
  let node1_1 = x229
  let node2_1 = x230
  if physical_equal(node1_1, node2_1) {
    nodemappartial(f2_1, node1_1)
  } else {
    match node2_1 {
      { priority, left, key, value: value_1, right, .. } => {
        let (l, kvo, r) = nodepartition(comparekey_1, key, node1_1)
        let left_1 = treeunion(comparekey_1, f_1, f2_1, l, left)
        let right_1 = treeunion(comparekey_1, f_1, f2_1, r, right)
        let vo = match kvo {
          None => Some(value_1)
          Some(kv) => f_1((kv, (key, value_1)))
        }
        match vo {
          None => treeappend(left_1, right_1)
          Some(value_2) => {
            let node = mknodesingleton(priority, key, value_2)
            treecombine(left_1, node, right_1)
          }
        }
      }
      _ => raise @lib.MatchFailure("tscript.ml:754")
    }
  }
}

///|
/// `treeIntersect`
pub fn[TA, TB, TC, TD, TE] treeintersect(
  x231 : (TA) -> ((TC) -> Int64 raise) raise,
  x232 : (((TC, TD), (TA, TE))) -> TB? raise,
  x233 : Tree[TC, TD],
  x234 : Tree[TA, TE],
) -> Tree[TA, TB] raise {
  let comparekey = x231
  let f = x232
  let t1 = x233
  let t2 = x234
  match t1 {
    Tree::Empty => Tree::Empty
    Tree::Tree(n1) =>
      match t2 {
        Tree::Empty => Tree::Empty
        Tree::Tree(n2) => nodeintersect(comparekey, f, n1, n2)
      }
  }
}

///|
/// `nodeIntersect`
pub fn[TA, TB, TC, TD, TE] nodeintersect(
  x235 : (TA) -> ((TC) -> Int64 raise) raise,
  x236 : (((TC, TD), (TA, TE))) -> TB? raise,
  x237 : Node[TC, TD],
  x238 : Node[TA, TE],
) -> Tree[TA, TB] raise {
  let comparekey_1 = x235
  let f_1 = x236
  let n1_1 = x237
  let n2_1 = x238
  match n2_1 {
    { priority, left, key, value: value_1, right, .. } => {
      let (l, kvo, r) = nodepartition(comparekey_1, key, n1_1)
      let left_1 = treeintersect(comparekey_1, f_1, l, left)
      let right_1 = treeintersect(comparekey_1, f_1, r, right)
      let vo = match kvo {
        None => None
        Some(kv) => f_1((kv, (key, value_1)))
      }
      match vo {
        None => treeappend(left_1, right_1)
        Some(value_2) => mktree(priority, left_1, key, value_2, right_1)
      }
    }
    _ => raise @lib.MatchFailure("tscript.ml:787")
  }
}

///|
/// `treeUnionDomain`
pub fn[TA, TB] treeuniondomain(
  x239 : (TA) -> ((TA) -> Int64 raise) raise,
  x240 : Tree[TA, TB],
  x241 : Tree[TA, TB],
) -> Tree[TA, TB] raise {
  let comparekey = x239
  let tree1 = x240
  let tree2 = x241
  match tree1 {
    Tree::Empty => tree2
    Tree::Tree(node1) =>
      match tree2 {
        Tree::Empty => tree1
        Tree::Tree(node2) =>
          if physical_equal(node1, node2) {
            tree2
          } else {
            nodeuniondomain(comparekey, node1, node2)
          }
      }
  }
}

///|
/// `nodeUnionDomain`
pub fn[TA, TB] nodeuniondomain(
  x242 : (TA) -> ((TA) -> Int64 raise) raise,
  x243 : Node[TA, TB],
  x244 : Node[TA, TB],
) -> Tree[TA, TB] raise {
  let comparekey_1 = x242
  let node1_1 = x243
  let node2_1 = x244
  match node2_1 {
    { priority, left, key, value: value_1, right, .. } => {
      let (l, _, r) = nodepartition(comparekey_1, key, node1_1)
      let left_1 = treeuniondomain(comparekey_1, l, left)
      let right_1 = treeuniondomain(comparekey_1, r, right)
      let node = mknodesingleton(priority, key, value_1)
      treecombine(left_1, node, right_1)
    }
    _ => raise @lib.MatchFailure("tscript.ml:819")
  }
}

///|
/// `treeIntersectDomain`
pub fn[TA, TB] treeintersectdomain(
  x245 : (TA) -> ((TA) -> Int64 raise) raise,
  x246 : Tree[TA, TB],
  x247 : Tree[TA, TB],
) -> Tree[TA, TB] raise {
  let comparekey = x245
  let tree1 = x246
  let tree2 = x247
  match tree1 {
    Tree::Empty => Tree::Empty
    Tree::Tree(node1) =>
      match tree2 {
        Tree::Empty => Tree::Empty
        Tree::Tree(node2) =>
          if physical_equal(node1, node2) {
            tree2
          } else {
            nodeintersectdomain(comparekey, node1, node2)
          }
      }
  }
}

///|
/// `nodeIntersectDomain`
pub fn[TA, TB] nodeintersectdomain(
  x248 : (TA) -> ((TA) -> Int64 raise) raise,
  x249 : Node[TA, TB],
  x250 : Node[TA, TB],
) -> Tree[TA, TB] raise {
  let comparekey_1 = x248
  let node1_1 = x249
  let node2_1 = x250
  match node2_1 {
    { priority, left, key, value: value_1, right, .. } => {
      let (l, kvo, r) = nodepartition(comparekey_1, key, node1_1)
      let left_1 = treeintersectdomain(comparekey_1, l, left)
      let right_1 = treeintersectdomain(comparekey_1, r, right)
      if is_some(kvo) {
        mktree(priority, left_1, key, value_1, right_1)
      } else {
        treeappend(left_1, right_1)
      }
    }
    _ => raise @lib.MatchFailure("tscript.ml:846")
  }
}

///|
/// `treeDifferenceDomain`
pub fn[TA, TB] treedifferencedomain(
  x251 : (TA) -> ((TA) -> Int64 raise) raise,
  x252 : Tree[TA, TB],
  x253 : Tree[TA, TB],
) -> Tree[TA, TB] raise {
  let comparekey = x251
  let t1 = x252
  let t2 = x253
  match t1 {
    Tree::Empty => Tree::Empty
    Tree::Tree(n1) =>
      match t2 {
        Tree::Empty => t1
        Tree::Tree(n2) => nodedifferencedomain(comparekey, n1, n2)
      }
  }
}

///|
/// `nodeDifferenceDomain`
pub fn[TA, TB] nodedifferencedomain(
  x254 : (TA) -> ((TA) -> Int64 raise) raise,
  x255 : Node[TA, TB],
  x256 : Node[TA, TB],
) -> Tree[TA, TB] raise {
  let comparekey_1 = x254
  let n1_1 = x255
  let n2_1 = x256
  if physical_equal(n1_1, n2_1) {
    Tree::Empty
  } else {
    match n1_1 {
      { priority, left, key, value: value_1, right, .. } => {
        let (l, kvo, r) = nodepartition(comparekey_1, key, n2_1)
        let left_1 = treedifferencedomain(comparekey_1, left, l)
        let right_1 = treedifferencedomain(comparekey_1, right, r)
        if is_some(kvo) {
          treeappend(left_1, right_1)
        } else {
          mktree(priority, left_1, key, value_1, right_1)
        }
      }
      _ => raise @lib.MatchFailure("tscript.ml:872")
    }
  }
}

///|
/// `treeSubsetDomain`
pub fn[TA, TB] treesubsetdomain(
  x257 : (TA) -> ((TA) -> Int64 raise) raise,
  x258 : Tree[TA, TB],
  x259 : Tree[TA, TB],
) -> Bool raise {
  let comparekey = x257
  let tree1 = x258
  let tree2 = x259
  match tree1 {
    Tree::Empty => true
    Tree::Tree(node1) =>
      match tree2 {
        Tree::Empty => false
        Tree::Tree(node2) => nodesubsetdomain(comparekey, node1, node2)
      }
  }
}

///|
/// `nodeSubsetDomain`
pub fn[TA, TB] nodesubsetdomain(
  x260 : (TA) -> ((TA) -> Int64 raise) raise,
  x261 : Node[TA, TB],
  x262 : Node[TA, TB],
) -> Bool raise {
  let comparekey_1 = x260
  let node1_1 = x261
  let node2_1 = x262
  physical_equal(node1_1, node2_1) ||
  (match node1_1 {
    { size, left, key, right, .. } =>
      if size <= nodesize(node2_1) {
        let (l, kvo, r) = nodepartition(comparekey_1, key, node2_1)
        is_some(kvo) &&
        treesubsetdomain(comparekey_1, left, l) &&
        treesubsetdomain(comparekey_1, right, r)
      } else {
        false
      }
    _ => raise @lib.MatchFailure("tscript.ml:897")
  })
}

///|
/// `nodePick`
pub fn[TA, TB] nodepick(x263 : Node[TA, TB]) -> (TA, TB) raise {
  let node = x263
  match node {
    { key, value: value_1, .. } => (key, value_1)
    _ => raise @lib.MatchFailure("tscript.ml:912")
  }
}

///|
/// `treePick`
pub fn[TA, TB] treepick(x264 : Tree[TA, TB]) -> (TA, TB) raise {
  let tree = x264
  match tree {
    Tree::Empty => raise Bug::Bug("Map.treePick")
    Tree::Tree(node) => nodepick(node)
  }
}

///|
/// `nodeDeletePick`
pub fn[TA, TB] nodedeletepick(
  x265 : Node[TA, TB],
) -> ((TA, TB), Tree[TA, TB]) raise {
  let node = x265
  match node {
    { left, key, value: value_1, right, .. } =>
      ((key, value_1), treeappend(left, right))
    _ => raise @lib.MatchFailure("tscript.ml:927")
  }
}

///|
/// `treeDeletePick`
pub fn[TA, TB] treedeletepick(
  x266 : Tree[TA, TB],
) -> ((TA, TB), Tree[TA, TB]) raise {
  let tree = x266
  match tree {
    Tree::Empty => raise Bug::Bug("Map.treeDeletePick")
    Tree::Tree(node) => nodedeletepick(node)
  }
}

///|
/// `treeNth`
pub fn[TA, TB] treenth(x267 : Int64, x268 : Tree[TA, TB]) -> (TA, TB) raise {
  let n = x267
  let tree = x268
  match tree {
    Tree::Empty => raise Bug::Bug("Map.treeNth")
    Tree::Tree(node) => nodenth(n, node)
  }
}

///|
/// `nodeNth`
pub fn[TA, TB] nodenth(x269 : Int64, x270 : Node[TA, TB]) -> (TA, TB) raise {
  let n_1 = x269
  let node_1 = x270
  match node_1 {
    { left, key, value: value_1, right, .. } => {
      let k = treesize(left)
      if n_1 == k {
        (key, value_1)
      } else if n_1 < k {
        treenth(n_1, left)
      } else {
        treenth(@lib.sub63(n_1, @lib.add63(k, 1L)), right)
      }
    }
    _ => raise @lib.MatchFailure("tscript.ml:947")
  }
}

///|
/// `treeDeleteNth`
pub fn[TA, TB] treedeletenth(
  x271 : Int64,
  x272 : Tree[TA, TB],
) -> ((TA, TB), Tree[TA, TB]) raise {
  let n = x271
  let tree = x272
  match tree {
    Tree::Empty => raise Bug::Bug("Map.treeDeleteNth")
    Tree::Tree(node) => nodedeletenth(n, node)
  }
}

///|
/// `nodeDeleteNth`
pub fn[TA, TB] nodedeletenth(
  x273 : Int64,
  x274 : Node[TA, TB],
) -> ((TA, TB), Tree[TA, TB]) raise {
  let n_1 = x273
  let node_1 = x274
  match node_1 {
    { size, priority, left, key, value: value_1, right } => {
      let k = treesize(left)
      if n_1 == k {
        ((key, value_1), treeappend(left, right))
      } else if n_1 < k {
        let (key_value, left_1) = treedeletenth(n_1, left)
        let size_1 = @lib.sub63(size, 1L)
        let node_2 = Node::{
          size: size_1,
          priority,
          left: left_1,
          key,
          value: value_1,
          right,
        }
        (key_value, Tree::Tree(node_2))
      } else {
        let n_2 = @lib.sub63(n_1, @lib.add63(k, 1L))
        let (key_value_1, right_1) = treedeletenth(n_2, right)
        let size_2 = @lib.sub63(size, 1L)
        let node_3 = Node::{
          size: size_2,
          priority,
          left,
          key,
          value: value_1,
          right: right_1,
        }
        (key_value_1, Tree::Tree(node_3))
      }
    }
    _ => raise @lib.MatchFailure("tscript.ml:966")
  }
}

///|
/// `iterator`
#derive(Eq, Debug)
pub(all) enum Iterator[TA, TB] {
  Left_to_right_iterator((TA, TB), Tree[TA, TB], @list.List[Node[TA, TB]])
  Right_to_left_iterator((TA, TB), Tree[TA, TB], @list.List[Node[TA, TB]])
}

///|
pub extend Iterator with Eq::{not_equal, equal}

///|
pub extend Iterator with Debug::{to_repr}

///|
pub extend Iterator with @lib.OCompare::{ocompare}

///|
pub extend Iterator with @lib.OHash::{ohash_visit}

///|
fn[TA, TB] ocaml_rank_Iterator(x : Iterator[TA, TB]) -> Int {
  match x {
    Left_to_right_iterator(_, _, _) => 1000000
    Right_to_left_iterator(_, _, _) => 1000001
  }
}

///|
pub impl[TA : @lib.OCompare, TB : @lib.OCompare] @lib.OCompare for Iterator[
  TA,
  TB,
] with fn ocompare(self, other) {
  match (self, other) {
    (Left_to_right_iterator(a0, a1, a2), Left_to_right_iterator(b0, b1, b2)) => {
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
    (Right_to_left_iterator(a0, a1, a2), Right_to_left_iterator(b0, b1, b2)) => {
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
    _ => ocaml_rank_Iterator(self).compare(ocaml_rank_Iterator(other))
  }
}

///|
pub impl[TA : @lib.OHash, TB : @lib.OHash] @lib.OHash for Iterator[TA, TB] with fn ohash_visit(
  self,
  h,
) {
  match self {
    Left_to_right_iterator(a0, a1, a2) => {
      h.block(0, 3)
      h.field(a0)
      h.field(a1)
      h.field(a2)
    }
    Right_to_left_iterator(a0, a1, a2) => {
      h.block(1, 3)
      h.field(a0)
      h.field(a1)
      h.field(a2)
    }
  }
}

///|
/// `fromSpineLeftToRightIterator`
pub fn[TA, TB] fromspinelefttorightiterator(
  x275 : @list.List[Node[TA, TB]],
) -> Iterator[TA, TB]? raise {
  let nodes = x275
  match nodes {
    Empty => None
    More({ key, value: value_1, right, .. }, tail=nodes_1) =>
      Some(Iterator::Left_to_right_iterator((key, value_1), right, nodes_1))
  }
}

///|
/// `fromSpineRightToLeftIterator`
pub fn[TA, TB] fromspinerighttoleftiterator(
  x276 : @list.List[Node[TA, TB]],
) -> Iterator[TA, TB]? raise {
  let nodes = x276
  match nodes {
    Empty => None
    More({ left, key, value: value_1, .. }, tail=nodes_1) =>
      Some(Iterator::Right_to_left_iterator((key, value_1), left, nodes_1))
  }
}

///|
/// `addLeftToRightIterator`
pub fn[TA, TB] addlefttorightiterator(
  x277 : @list.List[Node[TA, TB]],
  x278 : Tree[TA, TB],
) -> Iterator[TA, TB]? raise {
  let nodes = x277
  let tree = x278
  fromspinelefttorightiterator(treeleftspine(nodes, tree))
}

///|
/// `addRightToLeftIterator`
pub fn[TA, TB] addrighttoleftiterator(
  x279 : @list.List[Node[TA, TB]],
  x280 : Tree[TA, TB],
) -> Iterator[TA, TB]? raise {
  let nodes = x279
  let tree = x280
  fromspinerighttoleftiterator(treerightspine(nodes, tree))
}

///|
/// `treeMkIterator`
pub fn[TA, TB] treemkiterator(x281 : Tree[TA, TB]) -> Iterator[TA, TB]? raise {
  let tree = x281
  addlefttorightiterator(@list.List([]), tree)
}

///|
/// `treeMkRevIterator`
pub fn[TA, TB] treemkreviterator(
  x282 : Tree[TA, TB],
) -> Iterator[TA, TB]? raise {
  let tree = x282
  addrighttoleftiterator(@list.List([]), tree)
}

///|
/// `readIterator`
pub fn[TA, TB] readiterator(x283 : Iterator[TA, TB]) -> (TA, TB) raise {
  let iter = x283
  match iter {
    Iterator::Left_to_right_iterator(key_value, _, _) => key_value
    Iterator::Right_to_left_iterator(key_value_1, _, _) => key_value_1
  }
}

///|
/// `advanceIterator`
pub fn[TA, TB] advanceiterator(
  x284 : Iterator[TA, TB],
) -> Iterator[TA, TB]? raise {
  let iter = x284
  match iter {
    Iterator::Left_to_right_iterator(_, tree, nodes) =>
      addlefttorightiterator(nodes, tree)
    Iterator::Right_to_left_iterator(_, tree_1, nodes_1) =>
      addrighttoleftiterator(nodes_1, tree_1)
  }
}

///|
/// `foldIterator`
pub fn[TA, TB, TC] folditerator(
  x285 : ((TB, TC, TA)) -> TA raise,
  x286 : TA,
  x287 : Iterator[TB, TC]?,
) -> TA raise {
  let f = x285
  let acc = x286
  let io = x287
  match io {
    None => acc
    Some(iter) => {
      let (key, value_1) = readiterator(iter)
      let t288 = advanceiterator(iter)
      folditerator(f, f((key, value_1, acc)), t288)
    }
  }
}

///|
/// `findIterator`
pub fn[TA, TB] finditerator(
  x289 : ((TA, TB)) -> Bool raise,
  x290 : Iterator[TA, TB]?,
) -> (TA, TB)? raise {
  let pred = x289
  let io = x290
  match io {
    None => None
    Some(iter) => {
      let key_value = readiterator(iter)
      if pred(key_value) {
        Some(key_value)
      } else {
        finditerator(pred, advanceiterator(iter))
      }
    }
  }
}

///|
/// `firstIterator`
pub fn[TA, TB, TC] firstiterator(
  x291 : ((TB, TC)) -> TA? raise,
  x292 : Iterator[TB, TC]?,
) -> TA? raise {
  let f = x291
  let io = x292
  match io {
    None => None
    Some(iter) => {
      let key_value = readiterator(iter)
      match f(key_value) {
        None => firstiterator(f, advanceiterator(iter))
        s => s
      }
    }
  }
}

///|
/// `compareIterator`
pub fn[TA, TB, TC, TD] compareiterator(
  x293 : (TB) -> ((TA) -> Int64 raise) raise,
  x294 : (TD) -> ((TC) -> Int64 raise) raise,
  x295 : Iterator[TB, TD]?,
  x296 : Iterator[TA, TC]?,
) -> Int64 raise {
  let comparekey = x293
  let comparevalue = x294
  let io1 = x295
  let io2 = x296
  match (io1, io2) {
    (None, None) => 0L
    (None, Some(_)) => -1L
    (Some(_), None) => 1L
    (Some(i1), Some(i2)) => {
      let (k1, v1) = readiterator(i1)
      let (k2, v2) = readiterator(i2)
      let c = comparekey(k1)(k2)
      if c != 0L {
        c
      } else {
        let c_1 = comparevalue(v1)(v2)
        if c_1 != 0L {
          c_1
        } else {
          let io1_1 = advanceiterator(i1)
          let io2_1 = advanceiterator(i2)
          compareiterator(comparekey, comparevalue, io1_1, io2_1)
        }
      }
    }
  }
}

///|
/// `equalIterator`
pub fn[TA, TB, TC, TD] equaliterator(
  x297 : (TB) -> ((TA) -> Bool raise) raise,
  x298 : (TD) -> ((TC) -> Bool raise) raise,
  x299 : Iterator[TB, TD]?,
  x300 : Iterator[TA, TC]?,
) -> Bool raise {
  let equalkey_1 = x297
  let equalvalue = x298
  let io1 = x299
  let io2 = x300
  match (io1, io2) {
    (None, None) => true
    (None, Some(_)) => false
    (Some(_), None) => false
    (Some(i1), Some(i2)) => {
      let (k1, v1) = readiterator(i1)
      let (k2, v2) = readiterator(i2)
      equalkey_1(k1)(k2) &&
      (if equalvalue(v1)(v2) {
        let io1_1 = advanceiterator(i1)
        let io2_1 = advanceiterator(i2)
        equaliterator(equalkey_1, equalvalue, io1_1, io2_1)
      } else {
        false
      })
    }
  }
}

///|
/// `map`
pub(all) enum Map[TA, TB] {
  Map((TA) -> ((TA) -> Int64 raise) raise, Tree[TA, TB])
}

///|
/// `newMap`
pub fn[TA, TB] newmap(
  x301 : (TA) -> ((TA) -> Int64 raise) raise,
) -> Map[TA, TB] raise {
  let comparekey = x301
  let tree = treenew(())
  Map::Map(comparekey, tree)
}

///|
/// `singleton`
pub fn[TA, TB] singleton(
  x302 : (TA) -> ((TA) -> Int64 raise) raise,
  x303 : (TA, TB),
) -> Map[TA, TB] raise {
  let comparekey = x302
  let key_value = x303
  let tree = treesingleton(key_value)
  Map::Map(comparekey, tree)
}

///|
/// `size`
pub fn[TA, TB] size(x304 : Map[TA, TB]) -> Int64 raise {
  match x304 {
    Map::Map(_, tree) => treesize(tree)
  }
}

///|
/// `null`
pub fn[TA, TB] null_v1(x305 : Map[TA, TB]) -> Bool raise {
  let m = x305
  size(m) == 0L
}

///|
/// `peekKey`
pub fn[TA, TB] peekkey(x306 : Map[TA, TB]) -> ((TA) -> (TA, TB)? raise) raise {
  match x306 {
    Map::Map(comparekey, tree) =>
      fn(x307 : TA) -> (TA, TB)? raise {
        let key = x307
        treepeekkey(comparekey, key, tree)
      }
  }
}

///|
/// `peek`
pub fn[TA, TB] peek(x308 : Map[TB, TA]) -> ((TB) -> TA? raise) raise {
  match x308 {
    Map::Map(comparekey, tree) =>
      fn(x309 : TB) -> TA? raise {
        let key = x309
        treepeek(comparekey, key, tree)
      }
  }
}

///|
/// `inDomain`
pub fn[TA, TB] indomain(x310 : TA, x311 : Map[TA, TB]) -> Bool raise {
  let key = x310
  let m = x311
  is_some(peek(m)(key))
}

///|
/// `get`
pub fn[TA, TB] get(x312 : Map[TB, TA], x313 : TB) -> TA raise {
  let m = x312
  let key = x313
  match peek(m)(key) {
    None => raise Failure("Map.get: element not found")
    Some(value_1) => value_1
  }
}

///|
/// `pick`
pub fn[TA, TB] pick(x314 : Map[TA, TB]) -> (TA, TB) raise {
  match x314 {
    Map::Map(_, tree) => treepick(tree)
  }
}

///|
/// `nth`
pub fn[TA, TB] nth(x315 : Map[TA, TB]) -> ((Int64) -> (TA, TB) raise) raise {
  match x315 {
    Map::Map(_, tree) =>
      fn(x316 : Int64) -> (TA, TB) raise {
        let n = x316
        treenth(n, tree)
      }
  }
}

///|
/// `random`
pub fn[TA, TB] random(x317 : Map[TA, TB]) -> (TA, TB) raise {
  let m = x317
  let n = size(m)
  if n == 0L {
    raise Bug::Bug("Map.random: empty")
  } else {
    let t318 = @lib.random_int(n)
    nth(m)(t318)
  }
}

///|
/// `insert`
pub fn[TA, TB] insert(
  x319 : Map[TA, TB],
) -> (((TA, TB)) -> Map[TA, TB] raise) raise {
  match x319 {
    Map::Map(comparekey, tree) =>
      fn(x320 : (TA, TB)) -> Map[TA, TB] raise {
        let key_value = x320
        let tree_1 = treeinsert(comparekey, key_value, tree)
        Map::Map(comparekey, tree_1)
      }
  }
}

///|
/// `insertList`
pub fn[TA, TB] insertlist(
  x321 : Map[TA, TB],
) -> ((@list.List[(TA, TB)]) -> Map[TA, TB] raise) raise {
  let m = x321
  (x326 : @list.List[(TA, TB)]) => {
    foldl(
      fn(x325 : ((TA, TB), Map[TA, TB])) -> Map[TA, TB] raise {
        ins_l(x325.0, x325.1)
      },
      m,
      x326,
    )
  }
}

///|
fn[TC, TD] ins_l(x323 : (TC, TD), x324 : Map[TC, TD]) -> Map[TC, TD] raise {
  let (key_value, acc) = (x323, x324)
  insert(acc)(key_value)
}

///|
/// `delete`
pub fn[TA, TB] delete(x327 : Map[TA, TB]) -> ((TA) -> Map[TA, TB] raise) raise {
  match x327 {
    Map::Map(comparekey, tree) =>
      fn(x328 : TA) -> Map[TA, TB] raise {
        let dkey = x328
        let tree_1 = treedelete(comparekey, dkey, tree)
        Map::Map(comparekey, tree_1)
      }
  }
}

///|
/// `remove`
pub fn[TA, TB] remove(x329 : Map[TA, TB], x330 : TA) -> Map[TA, TB] raise {
  let m = x329
  let key = x330
  if indomain(key, m) {
    delete(m)(key)
  } else {
    m
  }
}

///|
/// `deletePick`
pub fn[TA, TB] deletepick(x331 : Map[TA, TB]) -> ((TA, TB), Map[TA, TB]) raise {
  match x331 {
    Map::Map(comparekey, tree) => {
      let (key_value, tree_1) = treedeletepick(tree)
      (key_value, Map::Map(comparekey, tree_1))
    }
  }
}

///|
/// `deleteNth`
pub fn[TA, TB] deletenth(
  x332 : Map[TA, TB],
) -> ((Int64) -> ((TA, TB), Map[TA, TB]) raise) raise {
  match x332 {
    Map::Map(comparekey, tree) =>
      fn(x333 : Int64) -> ((TA, TB), Map[TA, TB]) raise {
        let n = x333
        let (key_value, tree_1) = treedeletenth(n, tree)
        (key_value, Map::Map(comparekey, tree_1))
      }
  }
}

///|
/// `deleteRandom`
pub fn[TA, TB] deleterandom(
  x334 : Map[TA, TB],
) -> ((TA, TB), Map[TA, TB]) raise {
  let m = x334
  let n = size(m)
  if n == 0L {
    raise Bug::Bug("Map.deleteRandom: empty")
  } else {
    let t335 = @lib.random_int(n)
    deletenth(m)(t335)
  }
}

///|
/// `merge`
pub fn[TA, TB, TC, TD] merge(
  x336 : (
    ((TA, TD)) -> TB? raise,
    ((TA, TC)) -> TB? raise,
    (((TA, TD), (TA, TC))) -> TB? raise,
  ),
  x337 : Map[TA, TD],
) -> ((Map[TA, TC]) -> Map[TA, TB] raise) raise {
  let (first_1, second, both) = x336
  match x337 {
    Map::Map(comparekey, tree1) =>
      fn(x338 : Map[TA, TC]) -> Map[TA, TB] raise {
        match x338 {
          Map::Map(_, tree2) => {
            let tree = treemerge(
              comparekey, first_1, second, both, tree1, tree2,
            )
            Map::Map(comparekey, tree)
          }
        }
      }
  }
}

///|
/// `union`
pub fn[TA, TB] union(
  x339 : (((TA, TB), (TA, TB))) -> TB? raise,
  x340 : Map[TA, TB],
) -> ((Map[TA, TB]) -> Map[TA, TB] raise) raise {
  let f = x339
  match x340 {
    Map::Map(comparekey, tree1) =>
      fn(x341 : Map[TA, TB]) -> Map[TA, TB] raise {
        match x341 {
          Map::Map(_, tree2) => {
            let f2 : ((TA, TB)) -> TB? raise = fn(
              x342 : (TA, TB),
            ) -> TB? raise {
              let kv = x342
              f((kv, kv))
            }
            let tree = treeunion(comparekey, f, f2, tree1, tree2)
            Map::Map(comparekey, tree)
          }
        }
      }
  }
}

///|
/// `intersect`
pub fn[TA, TB, TC, TD] intersect(
  x343 : (((TA, TD), (TA, TC))) -> TB? raise,
  x344 : Map[TA, TD],
) -> ((Map[TA, TC]) -> Map[TA, TB] raise) raise {
  let f = x343
  match x344 {
    Map::Map(comparekey, tree1) =>
      fn(x345 : Map[TA, TC]) -> Map[TA, TB] raise {
        match x345 {
          Map::Map(_, tree2) => {
            let tree = treeintersect(comparekey, f, tree1, tree2)
            Map::Map(comparekey, tree)
          }
        }
      }
  }
}

///|
/// `mkIterator`
pub fn[TA, TB] mkiterator(x346 : Map[TA, TB]) -> Iterator[TA, TB]? raise {
  match x346 {
    Map::Map(_, tree) => treemkiterator(tree)
  }
}

///|
/// `mkRevIterator`
pub fn[TA, TB] mkreviterator(x347 : Map[TA, TB]) -> Iterator[TA, TB]? raise {
  match x347 {
    Map::Map(_, tree) => treemkreviterator(tree)
  }
}

///|
/// `mapPartial`
pub fn[TA, TB, TC] mappartial(
  x348 : ((TA, TC)) -> TB? raise,
  x349 : Map[TA, TC],
) -> Map[TA, TB] raise {
  let f = x348
  match x349 {
    Map::Map(comparekey, tree) => {
      let tree_1 = treemappartial(f, tree)
      Map::Map(comparekey, tree_1)
    }
  }
}

///|
/// `map`
pub fn[TA, TB, TC] map(
  x350 : ((TA, TC)) -> TB raise,
  x351 : Map[TA, TC],
) -> Map[TA, TB] raise {
  let f = x350
  match x351 {
    Map::Map(comparekey, tree) => {
      let tree_1 = treemap(f, tree)
      Map::Map(comparekey, tree_1)
    }
  }
}

///|
/// `transform`
pub fn[TA, TB, TC] transform(
  x352 : (TC) -> TB raise,
) -> ((Map[TA, TC]) -> Map[TA, TB] raise) raise {
  let f = x352
  (x355 : Map[TA, TC]) => {
    map(
      fn(x354 : (TA, TC)) -> TB raise {
        let (_, value_1) = x354
        f(value_1)
      },
      x355,
    )
  }
}

///|
/// `filter`
pub fn[TA, TB] filter(
  x356 : ((TA, TB)) -> Bool raise,
) -> ((Map[TA, TB]) -> Map[TA, TB] raise) raise {
  let pred = x356
  let f : ((TA, TB)) -> TB? raise = fn(x358 : (TA, TB)) -> TB? raise {
    let (_, value_1) as key_value = x358
    if pred(key_value) {
      Some(value_1)
    } else {
      None
    }
  }
  (x359 : Map[TA, TB]) => mappartial(f, x359)
}

///|
/// `partition`
pub fn[TA, TB] partition(
  x360 : ((TA, TB)) -> Bool raise,
) -> ((Map[TA, TB]) -> (Map[TA, TB], Map[TA, TB]) raise) raise {
  let p = x360
  let np : ((TA, TB)) -> Bool raise = fn(x362 : (TA, TB)) -> Bool raise {
    let x = x362
    !p(x)
  }
  fn(x363 : Map[TA, TB]) -> (Map[TA, TB], Map[TA, TB]) raise {
    let m = x363
    let t364 = filter(np)(m)
    (filter(p)(m), t364)
  }
}

///|
/// `foldl`
pub fn[TA, TB, TC] foldl_v1(
  x365 : ((TB, TC, TA)) -> TA raise,
  x366 : TA,
  x367 : Map[TB, TC],
) -> TA raise {
  let f = x365
  let b = x366
  let m = x367
  folditerator(f, b, mkiterator(m))
}

///|
/// `foldr`
pub fn[TA, TB, TC] foldr_v1(
  x368 : ((TB, TC, TA)) -> TA raise,
  x369 : TA,
  x370 : Map[TB, TC],
) -> TA raise {
  let f = x368
  let b = x369
  let m = x370
  folditerator(f, b, mkreviterator(m))
}

///|
/// `app`
pub fn[TA, TB] app(
  x371 : ((TA, TB)) -> Unit raise,
  x372 : Map[TA, TB],
) -> Unit raise {
  let f = x371
  let m = x372
  foldl_v1(
    fn(x373 : (TA, TB, Unit)) -> Unit raise {
      let (key, value_1, _) = x373
      f((key, value_1))
    },
    (),
    m,
  )
}

///|
/// `findl`
pub fn[TA, TB] findl(
  x374 : ((TA, TB)) -> Bool raise,
  x375 : Map[TA, TB],
) -> (TA, TB)? raise {
  let p = x374
  let m = x375
  finditerator(p, mkiterator(m))
}

///|
/// `findr`
pub fn[TA, TB] findr(
  x376 : ((TA, TB)) -> Bool raise,
  x377 : Map[TA, TB],
) -> (TA, TB)? raise {
  let p = x376
  let m = x377
  finditerator(p, mkreviterator(m))
}

///|
/// `firstl`
pub fn[TA, TB, TC] firstl(
  x378 : ((TB, TC)) -> TA? raise,
  x379 : Map[TB, TC],
) -> TA? raise {
  let f = x378
  let m = x379
  firstiterator(f, mkiterator(m))
}

///|
/// `firstr`
pub fn[TA, TB, TC] firstr(
  x380 : ((TB, TC)) -> TA? raise,
  x381 : Map[TB, TC],
) -> TA? raise {
  let f = x380
  let m = x381
  firstiterator(f, mkreviterator(m))
}

///|
/// `exists`
pub fn[TA, TB] exists(
  x382 : ((TA, TB)) -> Bool raise,
  x383 : Map[TA, TB],
) -> Bool raise {
  let p = x382
  let m = x383
  is_some(findl(p, m))
}

///|
/// `all`
pub fn[TA, TB] all(
  x384 : ((TA, TB)) -> Bool raise,
) -> ((Map[TA, TB]) -> Bool raise) raise {
  let p = x384
  let np : ((TA, TB)) -> Bool raise = fn(x386 : (TA, TB)) -> Bool raise {
    let x = x386
    !p(x)
  }
  fn(x387 : Map[TA, TB]) -> Bool raise {
    let m = x387
    !exists(np, m)
  }
}

///|
/// `count`
pub fn[TA, TB] count(
  x388 : ((TA, TB)) -> Bool raise,
) -> ((Map[TA, TB]) -> Int64 raise) raise {
  let pred = x388
  let f : ((TA, TB, Int64)) -> Int64 raise = fn(
    x390 : (TA, TB, Int64),
  ) -> Int64 raise {
    let (k, v, acc) = x390
    if pred((k, v)) {
      @lib.add63(acc, 1L)
    } else {
      acc
    }
  }
  (x391 : Map[TA, TB]) => foldl_v1(f, 0L, x391)
}

///|
/// `compare`
pub fn[TA, TB] compare_v1(
  x392 : (TA) -> ((TA) -> Int64 raise) raise,
  x393 : Map[TB, TA],
  x394 : Map[TB, TA],
) -> Int64 raise {
  let comparevalue = x392
  let m1 = x393
  let m2 = x394
  if physical_equal(m1, m2) {
    0L
  } else {
    let t395 = size(m2)
    let c = intcompare(size(m1), t395)
    if c != 0L {
      c
    } else {
      match m1 {
        Map::Map(comparekey, _) => {
          let io1 = mkiterator(m1)
          let io2 = mkiterator(m2)
          compareiterator(comparekey, comparevalue, io1, io2)
        }
      }
    }
  }
}

///|
/// `equal`
pub fn[TA, TB] equal(
  x396 : (TA) -> ((TA) -> Bool raise) raise,
  x397 : Map[TB, TA],
  x398 : Map[TB, TA],
) -> Bool raise {
  let equalvalue = x396
  let m1 = x397
  let m2 = x398
  if physical_equal(m1, m2) {
    true
  } else {
    let t399 = size(m2)
    size(m1) == t399 &&
    (match m1 {
      Map::Map(comparekey, _) => {
        let io1 = mkiterator(m1)
        let io2 = mkiterator(m2)
        equaliterator(
          fn(x402 : TB) -> ((TB) -> Bool raise) raise {
            fn(x403 : TB) -> Bool raise {
              ((x400 : TB, x401 : TB) => equalkey(comparekey, x400, x401))(
                x402, x403,
              )
            }
          },
          equalvalue,
          io1,
          io2,
        )
      }
    })
  }
}

///|
/// `unionDomain`
pub fn[TA, TB] uniondomain(
  x404 : Map[TA, TB],
) -> ((Map[TA, TB]) -> Map[TA, TB] raise) raise {
  match x404 {
    Map::Map(comparekey, tree1) =>
      fn(x405 : Map[TA, TB]) -> Map[TA, TB] raise {
        match x405 {
          Map::Map(_, tree2) => {
            let tree = treeuniondomain(comparekey, tree1, tree2)
            Map::Map(comparekey, tree)
          }
        }
      }
  }
}

///|
/// `uncurriedUnionDomain`
pub fn[TA, TB] uncurrieduniondomain(
  x406 : Map[TA, TB],
  x407 : Map[TA, TB],
) -> Map[TA, TB] raise {
  let (m, acc) = (x406, x407)
  uniondomain(acc)(m)
}

///|
/// `unionListDomain`
pub fn[TA, TB] unionlistdomain(
  x408 : @list.List[Map[TA, TB]],
) -> Map[TA, TB] raise {
  let ms = x408
  match ms {
    Empty => raise Bug::Bug("Map.unionListDomain: no sets")
    More(m, tail=ms_1) =>
      foldl(
        fn(x409 : (Map[TA, TB], Map[TA, TB])) -> Map[TA, TB] raise {
          uncurrieduniondomain(x409.0, x409.1)
        },
        m,
        ms_1,
      )
  }
}

///|
/// `intersectDomain`
pub fn[TA, TB] intersectdomain(
  x410 : Map[TA, TB],
) -> ((Map[TA, TB]) -> Map[TA, TB] raise) raise {
  match x410 {
    Map::Map(comparekey, tree1) =>
      fn(x411 : Map[TA, TB]) -> Map[TA, TB] raise {
        match x411 {
          Map::Map(_, tree2) => {
            let tree = treeintersectdomain(comparekey, tree1, tree2)
            Map::Map(comparekey, tree)
          }
        }
      }
  }
}

///|
/// `uncurriedIntersectDomain`
pub fn[TA, TB] uncurriedintersectdomain(
  x412 : Map[TA, TB],
  x413 : Map[TA, TB],
) -> Map[TA, TB] raise {
  let (m, acc) = (x412, x413)
  intersectdomain(acc)(m)
}

///|
/// `intersectListDomain`
pub fn[TA, TB] intersectlistdomain(
  x414 : @list.List[Map[TA, TB]],
) -> Map[TA, TB] raise {
  let ms = x414
  match ms {
    Empty => raise Bug::Bug("Map.intersectListDomain: no sets")
    More(m, tail=ms_1) =>
      foldl(
        fn(x415 : (Map[TA, TB], Map[TA, TB])) -> Map[TA, TB] raise {
          uncurriedintersectdomain(x415.0, x415.1)
        },
        m,
        ms_1,
      )
  }
}

///|
/// `differenceDomain`
pub fn[TA, TB] differencedomain(
  x416 : Map[TA, TB],
) -> ((Map[TA, TB]) -> Map[TA, TB] raise) raise {
  match x416 {
    Map::Map(comparekey, tree1) =>
      fn(x417 : Map[TA, TB]) -> Map[TA, TB] raise {
        match x417 {
          Map::Map(_, tree2) => {
            let tree = treedifferencedomain(comparekey, tree1, tree2)
            Map::Map(comparekey, tree)
          }
        }
      }
  }
}

///|
/// `symmetricDifferenceDomain`
pub fn[TA, TB] symmetricdifferencedomain(
  x418 : Map[TA, TB],
  x419 : Map[TA, TB],
) -> Map[TA, TB] raise {
  let m1 = x418
  let m2 = x419
  let t420 = differencedomain(m2)(m1)
  uniondomain(differencedomain(m1)(m2))(t420)
}

///|
/// `equalDomain`
pub fn[TA, TB] equaldomain(
  x421 : Map[TA, TB],
  x422 : Map[TA, TB],
) -> Bool raise {
  let m1 = x421
  let m2 = x422
  equal(
    fn(x424 : TB) -> ((TB) -> Bool raise) raise {
      fn(x423 : TB) -> Bool raise { true }
    },
    m1,
    m2,
  )
}

///|
/// `subsetDomain`
pub fn[TA, TB] subsetdomain(
  x425 : Map[TA, TB],
) -> ((Map[TA, TB]) -> Bool raise) raise {
  match x425 {
    Map::Map(comparekey, tree1) =>
      fn(x426 : Map[TA, TB]) -> Bool raise {
        match x426 {
          Map::Map(_, tree2) => treesubsetdomain(comparekey, tree1, tree2)
        }
      }
  }
}

///|
/// `disjointDomain`
pub fn[TA, TB] disjointdomain(
  x427 : Map[TA, TB],
  x428 : Map[TA, TB],
) -> Bool raise {
  let m1 = x427
  let m2 = x428
  null_v1(intersectdomain(m1)(m2))
}

///|
/// `keys`
pub fn[TA, TB] keys(x429 : Map[TA, TB]) -> @list.List[TA] raise {
  let m = x429
  foldr_v1(
    fn(x430 : (TA, TB, @list.List[TA])) -> @list.List[TA] raise {
      let (key, _, l) = x430
      l.prepend(key)
    },
    @list.List([]),
    m,
  )
}

///|
/// `values`
pub fn[TA, TB] values(x431 : Map[TB, TA]) -> @list.List[TA] raise {
  let m = x431
  foldr_v1(
    fn(x432 : (TB, TA, @list.List[TA])) -> @list.List[TA] raise {
      let (_, value_1, l) = x432
      l.prepend(value_1)
    },
    @list.List([]),
    m,
  )
}

///|
/// `toList`
pub fn[TA, TB] tolist(x433 : Map[TA, TB]) -> @list.List[(TA, TB)] raise {
  let m = x433
  foldr_v1(
    fn(x434 : (TA, TB, @list.List[(TA, TB)])) -> @list.List[(TA, TB)] raise {
      let (key, value_1, l) = x434
      l.prepend((key, value_1))
    },
    @list.List([]),
    m,
  )
}

///|
/// `fromList`
pub fn[TA, TB] fromlist(
  x435 : (TA) -> ((TA) -> Int64 raise) raise,
  x436 : @list.List[(TA, TB)],
) -> Map[TA, TB] raise {
  let comparekey = x435
  let l = x436
  let m = newmap(comparekey)
  insertlist(m)(l)
}

///|
/// `toString`
pub fn[TA, TB] tostring(x437 : Map[TA, TB]) -> String raise {
  let m = x437
  "<" + ((if null_v1(m) { "" } else { Int64::to_string(size(m)) }) + ">")
}

///|
/// `map`
pub type Map1[TA, TB] = Map[TA, TB]

///|
/// `set`
pub(all) enum Set[TA] {
  Set(Map1[TA, Unit])
}

///|
/// `dest`
pub fn[TA] dest(x438 : Set[TA]) -> Map1[TA, Unit] raise {
  match x438 {
    Set::Set(m) => m
  }
}

///|
/// `mapPartial`
pub fn[TA, TB] mappartial_v1(
  x439 : (TA) -> TB? raise,
) -> ((Set[TA]) -> Map[TA, TB] raise) raise {
  let f = x439
  let mf : ((TA, Unit)) -> TB? raise = fn(x441 : (TA, Unit)) -> TB? raise {
    let (elt, _) = x441
    f(elt)
  }
  fn(x442 : Set[TA]) -> Map[TA, TB] raise {
    match x442 {
      Set::Set(m) => mappartial(mf, m)
    }
  }
}

///|
/// `map`
pub fn[TA, TB] map_v1(
  x443 : (TA) -> TB raise,
) -> ((Set[TA]) -> Map[TA, TB] raise) raise {
  let f = x443
  let mf : ((TA, Unit)) -> TB raise = fn(x445 : (TA, Unit)) -> TB raise {
    let (elt, _) = x445
    f(elt)
  }
  fn(x446 : Set[TA]) -> Map[TA, TB] raise {
    match x446 {
      Set::Set(m) => map(mf, m)
    }
  }
}

///|
/// `domain`
pub fn[TA, TB] domain(x447 : Map[TA, TB]) -> Set[TA] raise {
  let m = x447
  Set::Set(transform(fn(x448 : TB) -> Unit raise { () })(m))
}

///|
/// `empty`
pub fn[TA] empty(x449 : (TA) -> ((TA) -> Int64 raise) raise) -> Set[TA] raise {
  let cmp = x449
  Set::Set(newmap(cmp))
}

///|
/// `singleton`
pub fn[TA] singleton_v1(
  x450 : (TA) -> ((TA) -> Int64 raise) raise,
  x451 : TA,
) -> Set[TA] raise {
  let cmp = x450
  let elt = x451
  Set::Set(singleton(cmp, (elt, ())))
}

///|
/// `null`
pub fn[TA] null_v2(x452 : Set[TA]) -> Bool raise {
  match x452 {
    Set::Set(m) => null_v1(m)
  }
}

///|
/// `size`
pub fn[TA] size_v1(x453 : Set[TA]) -> Int64 raise {
  match x453 {
    Set::Set(m) => size(m)
  }
}

///|
/// `peek`
pub fn[TA] peek_v1(x454 : Set[TA]) -> ((TA) -> TA? raise) raise {
  match x454 {
    Set::Set(m) =>
      fn(x455 : TA) -> TA? raise {
        let elt = x455
        match peekkey(m)(elt) {
          Some((elt_1, _)) => Some(elt_1)
          None => None
        }
      }
  }
}

///|
/// `member`
pub fn[TA] member_(x456 : TA, x457 : Set[TA]) -> Bool raise {
  let elt = x456
  match x457 {
    Set::Set(m) => indomain(elt, m)
  }
}

///|
/// `pick`
pub fn[TA] pick_v1(x458 : Set[TA]) -> TA raise {
  match x458 {
    Set::Set(m) => {
      let (elt, _) = pick(m)
      elt
    }
  }
}

///|
/// `nth`
pub fn[TA] nth_v1(x459 : Set[TA]) -> ((Int64) -> TA raise) raise {
  match x459 {
    Set::Set(m) =>
      fn(x460 : Int64) -> TA raise {
        let n = x460
        let (elt, _) = nth(m)(n)
        elt
      }
  }
}

///|
/// `random`
pub fn[TA] random_v1(x461 : Set[TA]) -> TA raise {
  match x461 {
    Set::Set(m) => {
      let (elt, _) = random(m)
      elt
    }
  }
}

///|
/// `add`
pub fn[TA] add(x462 : Set[TA]) -> ((TA) -> Set[TA] raise) raise {
  match x462 {
    Set::Set(m) =>
      fn(x463 : TA) -> Set[TA] raise {
        let elt = x463
        let m_1 = insert(m)((elt, ()))
        Set::Set(m_1)
      }
  }
}

///|
/// `uncurriedAdd`
pub fn[TA] uncurriedadd(x464 : TA, x465 : Set[TA]) -> Set[TA] raise {
  let (elt, set) = (x464, x465)
  add(set)(elt)
}

///|
/// `addList`
pub fn[TA] addlist(x466 : Set[TA]) -> ((@list.List[TA]) -> Set[TA] raise) raise {
  let set = x466
  (x469 : @list.List[TA]) => {
    foldl(
      fn(x468 : (TA, Set[TA])) -> Set[TA] raise { uncurriedadd(x468.0, x468.1) },
      set,
      x469,
    )
  }
}

///|
/// `delete`
pub fn[TA] delete_v1(x470 : Set[TA]) -> ((TA) -> Set[TA] raise) raise {
  match x470 {
    Set::Set(m) =>
      fn(x471 : TA) -> Set[TA] raise {
        let elt = x471
        let m_1 = delete(m)(elt)
        Set::Set(m_1)
      }
  }
}

///|
/// `remove`
pub fn[TA] remove_v1(x472 : Set[TA]) -> ((TA) -> Set[TA] raise) raise {
  match x472 {
    Set::Set(m) =>
      fn(x473 : TA) -> Set[TA] raise {
        let elt = x473
        let m_1 = remove(m, elt)
        Set::Set(m_1)
      }
  }
}

///|
/// `deletePick`
pub fn[TA] deletepick_v1(x474 : Set[TA]) -> (TA, Set[TA]) raise {
  match x474 {
    Set::Set(m) =>
      match deletepick(m) {
        ((elt, _), m_1) => (elt, Set::Set(m_1))
      }
  }
}

///|
/// `deleteNth`
pub fn[TA] deletenth_v1(
  x475 : Set[TA],
) -> ((Int64) -> (TA, Set[TA]) raise) raise {
  match x475 {
    Set::Set(m) =>
      fn(x476 : Int64) -> (TA, Set[TA]) raise {
        let n = x476
        match deletenth(m)(n) {
          ((elt, _), m_1) => (elt, Set::Set(m_1))
        }
      }
  }
}

///|
/// `deleteRandom`
pub fn[TA] deleterandom_v1(x477 : Set[TA]) -> (TA, Set[TA]) raise {
  match x477 {
    Set::Set(m) =>
      match deleterandom(m) {
        ((elt, _), m_1) => (elt, Set::Set(m_1))
      }
  }
}

///|
/// `union`
pub fn[TA] union_v1(x478 : Set[TA]) -> ((Set[TA]) -> Set[TA] raise) raise {
  match x478 {
    Set::Set(m1) =>
      fn(x479 : Set[TA]) -> Set[TA] raise {
        match x479 {
          Set::Set(m2) => Set::Set(uniondomain(m1)(m2))
        }
      }
  }
}

///|
/// `unionList`
pub fn[TA] unionlist(x480 : @list.List[Set[TA]]) -> Set[TA] raise {
  let sets = x480
  let ms = @lib.map(dest, sets)
  Set::Set(unionlistdomain(ms))
}

///|
/// `intersect`
pub fn[TA] intersect_v1(x481 : Set[TA]) -> ((Set[TA]) -> Set[TA] raise) raise {
  match x481 {
    Set::Set(m1) =>
      fn(x482 : Set[TA]) -> Set[TA] raise {
        match x482 {
          Set::Set(m2) => Set::Set(intersectdomain(m1)(m2))
        }
      }
  }
}

///|
/// `intersectList`
pub fn[TA] intersectlist(x483 : @list.List[Set[TA]]) -> Set[TA] raise {
  let sets = x483
  let ms = @lib.map(dest, sets)
  Set::Set(intersectlistdomain(ms))
}

///|
/// `difference`
pub fn[TA] difference(x484 : Set[TA]) -> ((Set[TA]) -> Set[TA] raise) raise {
  match x484 {
    Set::Set(m1) =>
      fn(x485 : Set[TA]) -> Set[TA] raise {
        match x485 {
          Set::Set(m2) => Set::Set(differencedomain(m1)(m2))
        }
      }
  }
}

///|
/// `symmetricDifference`
pub fn[TA] symmetricdifference(
  x486 : Set[TA],
) -> ((Set[TA]) -> Set[TA] raise) raise {
  match x486 {
    Set::Set(m1) =>
      fn(x487 : Set[TA]) -> Set[TA] raise {
        match x487 {
          Set::Set(m2) => Set::Set(symmetricdifferencedomain(m1, m2))
        }
      }
  }
}

///|
/// `filter`
pub fn[TA] filter_v1(
  x488 : (TA) -> Bool raise,
) -> ((Set[TA]) -> Set[TA] raise) raise {
  let pred = x488
  let mpred : ((TA, Unit)) -> Bool raise = fn(x490 : (TA, Unit)) -> Bool raise {
    let (elt, _) = x490
    pred(elt)
  }
  fn(x491 : Set[TA]) -> Set[TA] raise {
    match x491 {
      Set::Set(m) => Set::Set(filter(mpred)(m))
    }
  }
}

///|
/// `partition`
pub fn[TA] partition_v1(
  x492 : (TA) -> Bool raise,
) -> ((Set[TA]) -> (Set[TA], Set[TA]) raise) raise {
  let pred = x492
  let mpred : ((TA, Unit)) -> Bool raise = fn(x494 : (TA, Unit)) -> Bool raise {
    let (elt, _) = x494
    pred(elt)
  }
  fn(x495 : Set[TA]) -> (Set[TA], Set[TA]) raise {
    match x495 {
      Set::Set(m) => {
        let (m1, m2) = partition(mpred)(m)
        let t496 = Set::Set(m2)
        (Set::Set(m1), t496)
      }
    }
  }
}

///|
/// `app`
pub fn[TA] app_v1(x497 : (TA) -> Unit raise) -> ((Set[TA]) -> Unit raise) raise {
  let f = x497
  let mf : ((TA, Unit)) -> Unit raise = fn(x499 : (TA, Unit)) -> Unit raise {
    let (elt, _) = x499
    f(elt)
  }
  fn(x500 : Set[TA]) -> Unit raise {
    match x500 {
      Set::Set(m) => app(mf, m)
    }
  }
}

///|
/// `foldl`
pub fn[TA, TB] foldl_v2(
  x501 : ((TB, TA)) -> TA raise,
) -> ((TA) -> ((Set[TB]) -> TA raise) raise) raise {
  let f = x501
  let mf : ((TB, Unit, TA)) -> TA raise = fn(
    x503 : (TB, Unit, TA),
  ) -> TA raise {
    let (elt, _, acc) = x503
    f((elt, acc))
  }
  fn(x504 : TA) -> ((Set[TB]) -> TA raise) raise {
    let acc_1 = x504
    fn(x505 : Set[TB]) -> TA raise {
      match x505 {
        Set::Set(m) => foldl_v1(mf, acc_1, m)
      }
    }
  }
}

///|
/// `foldr`
pub fn[TA, TB] foldr_v2(
  x506 : ((TB, TA)) -> TA raise,
) -> ((TA) -> ((Set[TB]) -> TA raise) raise) raise {
  let f = x506
  let mf : ((TB, Unit, TA)) -> TA raise = fn(
    x508 : (TB, Unit, TA),
  ) -> TA raise {
    let (elt, _, acc) = x508
    f((elt, acc))
  }
  fn(x509 : TA) -> ((Set[TB]) -> TA raise) raise {
    let acc_1 = x509
    fn(x510 : Set[TB]) -> TA raise {
      match x510 {
        Set::Set(m) => foldr_v1(mf, acc_1, m)
      }
    }
  }
}

///|
/// `findl`
pub fn[TA] findl_v1(
  x511 : (TA) -> Bool raise,
) -> ((Set[TA]) -> TA? raise) raise {
  let p = x511
  let mp : ((TA, Unit)) -> Bool raise = fn(x513 : (TA, Unit)) -> Bool raise {
    let (elt, _) = x513
    p(elt)
  }
  fn(x514 : Set[TA]) -> TA? raise {
    match x514 {
      Set::Set(m) =>
        match findl(mp, m) {
          Some((elt_1, _)) => Some(elt_1)
          None => None
        }
    }
  }
}

///|
/// `findr`
pub fn[TA] findr_v1(
  x515 : (TA) -> Bool raise,
) -> ((Set[TA]) -> TA? raise) raise {
  let p = x515
  let mp : ((TA, Unit)) -> Bool raise = fn(x517 : (TA, Unit)) -> Bool raise {
    let (elt, _) = x517
    p(elt)
  }
  fn(x518 : Set[TA]) -> TA? raise {
    match x518 {
      Set::Set(m) =>
        match findr(mp, m) {
          Some((elt_1, _)) => Some(elt_1)
          None => None
        }
    }
  }
}

///|
/// `firstl`
pub fn[TA, TB] firstl_v1(
  x519 : (TB) -> TA? raise,
) -> ((Set[TB]) -> TA? raise) raise {
  let f = x519
  let mf : ((TB, Unit)) -> TA? raise = fn(x521 : (TB, Unit)) -> TA? raise {
    let (elt, _) = x521
    f(elt)
  }
  fn(x522 : Set[TB]) -> TA? raise {
    match x522 {
      Set::Set(m) => firstl(mf, m)
    }
  }
}

///|
/// `firstr`
pub fn[TA, TB] firstr_v1(
  x523 : (TB) -> TA? raise,
) -> ((Set[TB]) -> TA? raise) raise {
  let f = x523
  let mf : ((TB, Unit)) -> TA? raise = fn(x525 : (TB, Unit)) -> TA? raise {
    let (elt, _) = x525
    f(elt)
  }
  fn(x526 : Set[TB]) -> TA? raise {
    match x526 {
      Set::Set(m) => firstr(mf, m)
    }
  }
}

///|
/// `exists`
pub fn[TA] exists_v1(
  x527 : (TA) -> Bool raise,
) -> ((Set[TA]) -> Bool raise) raise {
  let p = x527
  let mp : ((TA, Unit)) -> Bool raise = fn(x529 : (TA, Unit)) -> Bool raise {
    let (elt, _) = x529
    p(elt)
  }
  fn(x530 : Set[TA]) -> Bool raise {
    match x530 {
      Set::Set(m) => exists(mp, m)
    }
  }
}

///|
/// `all`
pub fn[TA] all_v1(x531 : (TA) -> Bool raise) -> ((Set[TA]) -> Bool raise) raise {
  let p = x531
  let mp : ((TA, Unit)) -> Bool raise = fn(x533 : (TA, Unit)) -> Bool raise {
    let (elt, _) = x533
    p(elt)
  }
  fn(x534 : Set[TA]) -> Bool raise {
    match x534 {
      Set::Set(m) => all(mp)(m)
    }
  }
}

///|
/// `count`
pub fn[TA] count_v1(
  x535 : (TA) -> Bool raise,
) -> ((Set[TA]) -> Int64 raise) raise {
  let p = x535
  let mp : ((TA, Unit)) -> Bool raise = fn(x537 : (TA, Unit)) -> Bool raise {
    let (elt, _) = x537
    p(elt)
  }
  fn(x538 : Set[TA]) -> Int64 raise {
    match x538 {
      Set::Set(m) => count(mp)(m)
    }
  }
}

///|
/// `compareValue`
pub fn comparevalue(x539 : Unit, x540 : Unit) -> Int64 raise {
  let _ = x539
  let _ = x540
  0L
}

///|
/// `equalValue`
pub fn equalvalue(x541 : Unit, x542 : Unit) -> Bool raise {
  let _ = x541
  let _ = x542
  true
}

///|
/// `compare`
pub fn[TA] compare_v2(x543 : Set[TA]) -> ((Set[TA]) -> Int64 raise) raise {
  match x543 {
    Set::Set(m1) =>
      fn(x544 : Set[TA]) -> Int64 raise {
        match x544 {
          Set::Set(m2) =>
            compare_v1(
              fn(x545 : Unit) -> ((Unit) -> Int64 raise) raise {
                fn(x546 : Unit) -> Int64 raise { comparevalue(x545, x546) }
              },
              m1,
              m2,
            )
        }
      }
  }
}

///|
/// `equal`
pub fn[TA] equal_v1(x547 : Set[TA]) -> ((Set[TA]) -> Bool raise) raise {
  match x547 {
    Set::Set(m1) =>
      fn(x548 : Set[TA]) -> Bool raise {
        match x548 {
          Set::Set(m2) =>
            equal(
              fn(x549 : Unit) -> ((Unit) -> Bool raise) raise {
                fn(x550 : Unit) -> Bool raise { equalvalue(x549, x550) }
              },
              m1,
              m2,
            )
        }
      }
  }
}

///|
/// `subset`
pub fn[TA] subset(x551 : Set[TA]) -> ((Set[TA]) -> Bool raise) raise {
  match x551 {
    Set::Set(m1) =>
      fn(x552 : Set[TA]) -> Bool raise {
        match x552 {
          Set::Set(m2) => subsetdomain(m1)(m2)
        }
      }
  }
}

///|
/// `disjoint`
pub fn[TA] disjoint(x553 : Set[TA]) -> ((Set[TA]) -> Bool raise) raise {
  match x553 {
    Set::Set(m1) =>
      fn(x554 : Set[TA]) -> Bool raise {
        match x554 {
          Set::Set(m2) => disjointdomain(m1, m2)
        }
      }
  }
}

///|
/// `transform`
pub fn[TA, TB] transform_v1(
  x555 : (TB) -> TA raise,
) -> ((Set[TB]) -> @list.List[TA] raise) raise {
  let f = x555
  let inc : ((TB, @list.List[TA])) -> @list.List[TA] raise = fn(
    x557 : (TB, @list.List[TA]),
  ) -> @list.List[TA] raise {
    let (x, l) = x557
    l.prepend(f(x))
  }
  foldr_v2(inc)(@list.List([]))
}

///|
/// `toList`
pub fn[TA] tolist_v1(x558 : Set[TA]) -> @list.List[TA] raise {
  match x558 {
    Set::Set(m) => keys(m)
  }
}

///|
/// `fromList`
pub fn[TA] fromlist_v1(
  x559 : (TA) -> ((TA) -> Int64 raise) raise,
  x560 : @list.List[TA],
) -> Set[TA] raise {
  let cmp = x559
  let elts = x560
  addlist(empty(cmp))(elts)
}

///|
/// `toString`
pub fn[TA] tostring_v1(x561 : Set[TA]) -> String raise {
  let set = x561
  "{" + ((if null_v2(set) { "" } else { Int64::to_string(size_v1(set)) }) + "}")
}

///|
/// `iterator`
pub type Iterator1[TA] = Iterator[TA, Unit]

///|
/// `mkIterator`
pub fn[TA] mkiterator_v1(x562 : Set[TA]) -> Iterator[TA, Unit]? raise {
  match x562 {
    Set::Set(m) => mkiterator(m)
  }
}

///|
/// `mkRevIterator`
pub fn[TA] mkreviterator_v1(x563 : Set[TA]) -> Iterator[TA, Unit]? raise {
  match x563 {
    Set::Set(m) => mkreviterator(m)
  }
}

///|
/// `readIterator`
pub fn[TA] readiterator_v1(x564 : Iterator[TA, Unit]) -> TA raise {
  let iter = x564
  match readiterator(iter) {
    (elt, _) => elt
  }
}

///|
/// `advanceIterator`
pub fn[TA, TB] advanceiterator_v1(
  x565 : Iterator[TA, TB],
) -> Iterator[TA, TB]? raise {
  let iter = x565
  advanceiterator(iter)
}

///|
/// `t`
pub type T = Int64

///|
/// `compare`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] compare_v3(
  x : TA,
) -> ((TA) -> Int64 raise) raise {
  let f : (TA) -> ((TA) -> Int64 raise) raise = x566 => {
    x567 => Int::to_int64(@lib.compare(x566, x567))
  }
  f(x)
}

///|
/// `key`
pub type Key = T

///|
/// `t`
pub type T1[TA] = @omap.T[Key, TA]

///|
/// `empty`
pub fn[TA, TB] empty_v1() -> @omap.T[TA, TB] {
  @omap.empty()
}

///|
/// `is_empty`
pub fn[TA, TB] is_empty(x568 : @omap.T[TA, TB]) -> Bool raise {
  let m = x568
  @omap.is_empty(m)
}

///|
/// `mem`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB] mem(
  x569 : TA,
  x570 : @omap.T[TA, TB],
) -> Bool raise {
  let x = x569
  let m = x570
  @omap.mem(compare_v3, x, m)
}

///|
/// `add`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB] add_v1(
  x571 : TA,
  x572 : TB,
  x573 : @omap.T[TA, TB],
) -> @omap.T[TA, TB] raise {
  let x = x571
  let data = x572
  let m = x573
  @omap.add(compare_v3, x, data, m)
}

///|
/// `update`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB] update(
  x574 : TA,
  x575 : (TB?) -> TB? raise,
  x576 : @omap.T[TA, TB],
) -> @omap.T[TA, TB] raise {
  let x = x574
  let f = x575
  let m = x576
  @omap.update(compare_v3, x, f, m)
}

///|
/// `singleton`
pub fn[TA, TB] singleton_v2(x577 : TA, x578 : TB) -> @omap.T[TA, TB] raise {
  let x = x577
  let d = x578
  @omap.singleton(x, d)
}

///|
/// `remove`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB] remove_v2(
  x579 : TA,
  x580 : @omap.T[TA, TB],
) -> @omap.T[TA, TB] raise {
  let x = x579
  let m = x580
  @omap.remove(compare_v3, x, m)
}

///|
/// `merge`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB, TC, TD] merge_v1(
  x581 : (TA) -> ((TD?) -> ((TC?) -> TB? raise) raise) raise,
  x582 : @omap.T[TA, TD],
  x583 : @omap.T[TA, TC],
) -> @omap.T[TA, TB] raise {
  let f = x581
  let s1 = x582
  let s2 = x583
  @omap.merge(compare_v3, f, s1, s2)
}

///|
/// `union`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB] union_v2(
  x584 : (TA) -> ((TB) -> ((TB) -> TB? raise) raise) raise,
  x585 : @omap.T[TA, TB],
  x586 : @omap.T[TA, TB],
) -> @omap.T[TA, TB] raise {
  let f = x584
  let s1 = x585
  let s2 = x586
  @omap.union(compare_v3, f, s1, s2)
}

///|
/// `compare`
pub fn[TA, TB, TC : Eq + @lib.OCompare + @lib.OHash] compare_v4(
  x587 : (TB) -> ((TA) -> Int64 raise) raise,
  x588 : @omap.T[TC, TB],
  x589 : @omap.T[TC, TA],
) -> Int64 raise {
  let cmp = x587
  let m1 = x588
  let m2 = x589
  @omap.compare(compare_v3, cmp, m1, m2)
}

///|
/// `equal`
pub fn[TA, TB, TC : Eq + @lib.OCompare + @lib.OHash] equal_v2(
  x590 : (TB) -> ((TA) -> Bool raise) raise,
  x591 : @omap.T[TC, TB],
  x592 : @omap.T[TC, TA],
) -> Bool raise {
  let cmp = x590
  let m1 = x591
  let m2 = x592
  @omap.equal(compare_v3, cmp, m1, m2)
}

///|
/// `iter`
pub fn[TA, TB, TC] iter(
  x593 : (TC) -> ((TB) -> TA raise) raise,
  x594 : @omap.T[TC, TB],
) -> Unit raise {
  let f = x593
  let m = x594
  @omap.iter(f, m)
}

///|
/// `fold`
pub fn[TA, TB, TC] fold(
  x595 : (TC) -> ((TB) -> ((TA) -> TA raise) raise) raise,
  x596 : @omap.T[TC, TB],
  x597 : TA,
) -> TA raise {
  let f = x595
  let m = x596
  let accu = x597
  @omap.fold(f, m, accu)
}

///|
/// `for_all`
pub fn[TA, TB] for_all(
  x598 : (TB) -> ((TA) -> Bool raise) raise,
  x599 : @omap.T[TB, TA],
) -> Bool raise {
  let p = x598
  let m = x599
  @omap.for_all(p, m)
}

///|
/// `exists`
pub fn[TA, TB] exists_v2(
  x600 : (TB) -> ((TA) -> Bool raise) raise,
  x601 : @omap.T[TB, TA],
) -> Bool raise {
  let p = x600
  let m = x601
  @omap.exists(p, m)
}

///|
/// `filter`
pub fn[TA, TB] filter_v2(
  x602 : (TA) -> ((TB) -> Bool raise) raise,
  x603 : @omap.T[TA, TB],
) -> @omap.T[TA, TB] raise {
  let p = x602
  let m = x603
  @omap.filter(p, m)
}

///|
/// `filter_map`
pub fn[TA, TB, TC] filter_map(
  x604 : (TA) -> ((TC) -> TB? raise) raise,
  x605 : @omap.T[TA, TC],
) -> @omap.T[TA, TB] raise {
  let f = x604
  let m = x605
  @omap.filter_map(f, m)
}

///|
/// `partition`
pub fn[TA, TB] partition_v2(
  x606 : (TA) -> ((TB) -> Bool raise) raise,
  x607 : @omap.T[TA, TB],
) -> (@omap.T[TA, TB], @omap.T[TA, TB]) raise {
  let p = x606
  let m = x607
  @omap.partition(p, m)
}

///|
/// `cardinal`
pub fn[TA, TB] cardinal(x608 : @omap.T[TA, TB]) -> Int64 raise {
  let m = x608
  @omap.cardinal(m)
}

///|
/// `bindings`
pub fn[TA, TB] bindings(x609 : @omap.T[TA, TB]) -> @list.List[(TA, TB)] raise {
  let s = x609
  @omap.bindings(s)
}

///|
/// `min_binding`
pub fn[TA, TB] min_binding(x610 : @omap.T[TA, TB]) -> (TA, TB) raise {
  let m = x610
  @omap.min_binding(m)
}

///|
/// `min_binding_opt`
pub fn[TA, TB] min_binding_opt(x611 : @omap.T[TA, TB]) -> (TA, TB)? raise {
  let m = x611
  @omap.min_binding_opt(m)
}

///|
/// `max_binding`
pub fn[TA, TB] max_binding(x612 : @omap.T[TA, TB]) -> (TA, TB) raise {
  let m = x612
  @omap.max_binding(m)
}

///|
/// `max_binding_opt`
pub fn[TA, TB] max_binding_opt(x613 : @omap.T[TA, TB]) -> (TA, TB)? raise {
  let m = x613
  @omap.max_binding_opt(m)
}

///|
/// `choose`
pub fn[TA, TB] choose(x614 : @omap.T[TA, TB]) -> (TA, TB) raise {
  let m = x614
  @omap.choose(m)
}

///|
/// `choose_opt`
pub fn[TA, TB] choose_opt(x615 : @omap.T[TA, TB]) -> (TA, TB)? raise {
  let m = x615
  @omap.choose_opt(m)
}

///|
/// `split`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB] split(
  x616 : TA,
  x617 : @omap.T[TA, TB],
) -> (@omap.T[TA, TB], TB?, @omap.T[TA, TB]) raise {
  let x = x616
  let m = x617
  @omap.split(compare_v3, x, m)
}

///|
/// `find`
pub fn[TA, TB : Eq + @lib.OCompare + @lib.OHash] find_v1(
  x618 : TB,
  x619 : @omap.T[TB, TA],
) -> TA raise {
  let x = x618
  let m = x619
  @omap.find(compare_v3, x, m)
}

///|
/// `find_opt`
pub fn[TA, TB : Eq + @lib.OCompare + @lib.OHash] find_opt(
  x620 : TB,
  x621 : @omap.T[TB, TA],
) -> TA? raise {
  let x = x620
  let m = x621
  @omap.find_opt(compare_v3, x, m)
}

///|
/// `find_first`
pub fn[TA, TB] find_first(
  x622 : (TA) -> Bool raise,
  x623 : @omap.T[TA, TB],
) -> (TA, TB) raise {
  let f = x622
  let m = x623
  @omap.find_first(f, m)
}

///|
/// `find_first_opt`
pub fn[TA, TB] find_first_opt(
  x624 : (TA) -> Bool raise,
  x625 : @omap.T[TA, TB],
) -> (TA, TB)? raise {
  let f = x624
  let m = x625
  @omap.find_first_opt(f, m)
}

///|
/// `find_last`
pub fn[TA, TB] find_last(
  x626 : (TA) -> Bool raise,
  x627 : @omap.T[TA, TB],
) -> (TA, TB) raise {
  let f = x626
  let m = x627
  @omap.find_last(f, m)
}

///|
/// `find_last_opt`
pub fn[TA, TB] find_last_opt(
  x628 : (TA) -> Bool raise,
  x629 : @omap.T[TA, TB],
) -> (TA, TB)? raise {
  let f = x628
  let m = x629
  @omap.find_last_opt(f, m)
}

///|
/// `map`
pub fn[TA, TB, TC] map_v2(
  x630 : (TC) -> TB raise,
  x631 : @omap.T[TA, TC],
) -> @omap.T[TA, TB] raise {
  let f = x630
  let m = x631
  @omap.map(f, m)
}

///|
/// `mapi`
pub fn[TA, TB, TC] mapi(
  x632 : (TA) -> ((TC) -> TB raise) raise,
  x633 : @omap.T[TA, TC],
) -> @omap.T[TA, TB] raise {
  let f = x632
  let m = x633
  @omap.mapi(f, m)
}

///|
/// `map`
pub type Map2[TA] = T1[TA]

///|
/// `newMap`
pub fn[TA, TB] newmap_v1(x634 : Unit) -> @omap.T[TA, TB] raise {
  let _ = x634
  empty_v1()
}

///|
/// `null`
pub fn[TA, TB] null_v3(x : @omap.T[TA, TB]) -> Bool raise {
  let f : (@omap.T[TA, TB]) -> Bool raise = is_empty
  f(x)
}

///|
/// `singleton`
pub fn[TA, TB] singleton_v3(x635 : TA, x636 : TB) -> @omap.T[TA, TB] raise {
  let (k, x) = (x635, x636)
  singleton_v2(k, x)
}

///|
/// `size`
pub fn[TA, TB] size_v2(x : @omap.T[TA, TB]) -> Int64 raise {
  let f : (@omap.T[TA, TB]) -> Int64 raise = cardinal
  f(x)
}

///|
/// `get`
pub fn[TA, TB : Eq + @lib.OCompare + @lib.OHash] get_v1(
  x637 : @omap.T[TB, TA],
  x638 : TB,
) -> TA raise {
  let m = x637
  let k = x638
  find_v1(k, m) catch {
    @lib.NotFound => raise Failure("Mmap.get: element not found")
    e => raise e
  }
}

///|
/// `peek`
pub fn[TA, TB : Eq + @lib.OCompare + @lib.OHash] peek_v2(
  x639 : @omap.T[TB, TA],
  x640 : TB,
) -> TA? raise {
  let m = x639
  let k = x640
  Some(find_v1(k, m)) catch {
    @lib.NotFound => None
    e => raise e
  }
}

///|
/// `insert`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB] insert_v1(
  x641 : @omap.T[TA, TB],
  x642 : (TA, TB),
) -> @omap.T[TA, TB] raise {
  let m = x641
  let (k, v) = x642
  add_v1(k, v, m)
}

///|
/// `toList`
pub fn[TA, TB] tolist_v2(x : @omap.T[TA, TB]) -> @list.List[(TA, TB)] raise {
  let f : (@omap.T[TA, TB]) -> @list.List[(TA, TB)] raise = bindings
  f(x)
}

///|
/// `fromList`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB] fromlist_v2(
  x643 : @list.List[(TA, TB)],
) -> @omap.T[TA, TB] raise {
  let l = x643
  @lib.itlist(
    fn(x644 : (TA, TB), x645 : @omap.T[TA, TB]) -> @omap.T[TA, TB] raise {
      let (v, tm) = x644
      ((x646 : @omap.T[TA, TB]) => add_v1(v, tm, x646))(x645)
    },
    l,
    empty_v1(),
  )
}

///|
/// `foldl`
pub fn[TA, TB, TC] foldl_v3(
  x647 : ((TB, TC, TA)) -> TA raise,
  x648 : TA,
  x649 : @omap.T[TB, TC],
) -> TA raise {
  let f = x647
  let b = x648
  let m = x649
  @lib.fold_left(
    fn(x650 : TA, x651 : (TB, TC)) -> TA raise {
      let s = x650
      let (v, tm) = x651
      f((v, tm, s))
    },
    b,
    bindings(m),
  )
}

///|
/// `foldr`
pub fn[TA, TB, TC] foldr_v3(
  x : ((TB, TC, TA)) -> TA raise,
) -> ((TA) -> ((@omap.T[TB, TC]) -> TA raise) raise) raise {
  let f : (((TB, TC, TA)) -> TA raise) -> ((TA) -> ((@omap.T[TB, TC]) -> TA raise) raise) raise = x652 => {
    x653 => x654 => foldl_v3(x652, x653, x654)
  }
  f(x)
}

///|
/// `filter`
pub fn[TA, TB] filter_v3(
  x655 : ((TA, TB)) -> Bool raise,
) -> ((@omap.T[TA, TB]) -> @omap.T[TA, TB] raise) raise {
  let f = x655
  (x659 : @omap.T[TA, TB]) => {
    filter_v2(
      fn(x657 : TA) -> ((TB) -> Bool raise) raise {
        let x = x657
        fn(x658 : TB) -> Bool raise {
          let y = x658
          f((x, y))
        }
      },
      x659,
    )
  }
}

///|
/// `inDomain`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB] indomain_v1(
  x : TA,
) -> ((@omap.T[TA, TB]) -> Bool raise) raise {
  let f : (TA) -> ((@omap.T[TA, TB]) -> Bool raise) raise = x660 => {
    x661 => mem(x660, x661)
  }
  f(x)
}

///|
/// `union`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB] union_v3(
  x662 : (((TA, TB), (TA, TB))) -> TB? raise,
  x663 : @omap.T[TA, TB],
  x664 : @omap.T[TA, TB],
) -> @omap.T[TA, TB] raise {
  let f = x662
  let m1 = x663
  let m2 = x664
  let f_p : (TA) -> (((TB?, TB?)) -> TB? raise) raise = fn(
    x665 : TA,
  ) -> (((TB?, TB?)) -> TB? raise) raise {
    let k = x665
    fn(x666 : (TB?, TB?)) -> TB? raise {
      match x666 {
        (Some(x), Some(y)) => f(((k, x), (k, y)))
        (Some(x_1), None) => Some(x_1)
        (None, Some(y_1)) => Some(y_1)
        (None, None) => None
      }
    }
  }
  merge_v1(
    fn(x667 : TA) -> ((TB?) -> ((TB?) -> TB? raise) raise) raise {
      let k_1 = x667
      fn(x668 : TB?) -> ((TB?) -> TB? raise) raise {
        let x_2 = x668
        fn(x669 : TB?) -> TB? raise {
          let y_2 = x669
          f_p(k_1)((x_2, y_2))
        }
      }
    },
    m1,
    m2,
  )
}

///|
/// `delete`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB] delete_v2(
  x670 : @omap.T[TA, TB],
  x671 : TA,
) -> @omap.T[TA, TB] raise {
  let m = x670
  let k = x671
  remove_v2(k, m)
}

///|
/// `mapPartial`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB, TC] mappartial_v2(
  x672 : ((TA, TC)) -> TB? raise,
  x673 : @omap.T[TA, TC],
) -> @omap.T[TA, TB] raise {
  let f = x672
  let m = x673
  fold(
    fn(
      x674 : TA,
    ) -> ((TC) -> ((@omap.T[TA, TB]) -> @omap.T[TA, TB] raise) raise) raise {
      let k = x674
      fn(x675 : TC) -> ((@omap.T[TA, TB]) -> @omap.T[TA, TB] raise) raise {
        let x = x675
        fn(x676 : @omap.T[TA, TB]) -> @omap.T[TA, TB] raise {
          let acc = x676
          match f((k, x)) {
            Some(y) => add_v1(k, y, acc)
            None => acc
          }
        }
      }
    },
    m,
    empty_v1(),
  )
}

///|
/// `transform`
pub fn[TA, TB, TC] transform_v2(
  x : (TC) -> TB raise,
) -> ((@omap.T[TA, TC]) -> @omap.T[TA, TB] raise) raise {
  let f : ((TC) -> TB raise) -> ((@omap.T[TA, TC]) -> @omap.T[TA, TB] raise) raise = x677 => {
    x678 => map_v2(x677, x678)
  }
  f(x)
}

///|
/// `exists`
pub fn[TA, TB] exists_v3(
  x679 : ((TA, TB)) -> Bool raise,
) -> ((@omap.T[TA, TB]) -> Bool raise) raise {
  let f = x679
  (x683 : @omap.T[TA, TB]) => {
    exists_v2(
      fn(x681 : TA) -> ((TB) -> Bool raise) raise {
        let k = x681
        fn(x682 : TB) -> Bool raise {
          let m = x682
          f((k, m))
        }
      },
      x683,
    )
  }
}

///|
/// `t`
pub type T2 = String

///|
/// `compare`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] compare_v5(
  x : TA,
) -> ((TA) -> Int64 raise) raise {
  let f : (TA) -> ((TA) -> Int64 raise) raise = x684 => {
    x685 => Int::to_int64(@lib.compare(x684, x685))
  }
  f(x)
}

///|
/// `key`
pub type Key1 = T2

///|
/// `t`
pub type T3[TA] = @omap.T[Key1, TA]

///|
/// `empty`
pub fn[TA, TB] empty_v2() -> @omap.T[TA, TB] {
  @omap.empty()
}

///|
/// `is_empty`
pub fn[TA, TB] is_empty_v1(x686 : @omap.T[TA, TB]) -> Bool raise {
  let m = x686
  @omap.is_empty(m)
}

///|
/// `mem`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB] mem_v1(
  x687 : TA,
  x688 : @omap.T[TA, TB],
) -> Bool raise {
  let x = x687
  let m = x688
  @omap.mem(compare_v5, x, m)
}

///|
/// `add`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB] add_v2(
  x689 : TA,
  x690 : TB,
  x691 : @omap.T[TA, TB],
) -> @omap.T[TA, TB] raise {
  let x = x689
  let data = x690
  let m = x691
  @omap.add(compare_v5, x, data, m)
}

///|
/// `update`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB] update_v1(
  x692 : TA,
  x693 : (TB?) -> TB? raise,
  x694 : @omap.T[TA, TB],
) -> @omap.T[TA, TB] raise {
  let x = x692
  let f = x693
  let m = x694
  @omap.update(compare_v5, x, f, m)
}

///|
/// `singleton`
pub fn[TA, TB] singleton_v4(x695 : TA, x696 : TB) -> @omap.T[TA, TB] raise {
  let x = x695
  let d = x696
  @omap.singleton(x, d)
}

///|
/// `remove`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB] remove_v3(
  x697 : TA,
  x698 : @omap.T[TA, TB],
) -> @omap.T[TA, TB] raise {
  let x = x697
  let m = x698
  @omap.remove(compare_v5, x, m)
}

///|
/// `merge`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB, TC, TD] merge_v2(
  x699 : (TA) -> ((TD?) -> ((TC?) -> TB? raise) raise) raise,
  x700 : @omap.T[TA, TD],
  x701 : @omap.T[TA, TC],
) -> @omap.T[TA, TB] raise {
  let f = x699
  let s1 = x700
  let s2 = x701
  @omap.merge(compare_v5, f, s1, s2)
}

///|
/// `union`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB] union_v4(
  x702 : (TA) -> ((TB) -> ((TB) -> TB? raise) raise) raise,
  x703 : @omap.T[TA, TB],
  x704 : @omap.T[TA, TB],
) -> @omap.T[TA, TB] raise {
  let f = x702
  let s1 = x703
  let s2 = x704
  @omap.union(compare_v5, f, s1, s2)
}

///|
/// `compare`
pub fn[TA, TB, TC : Eq + @lib.OCompare + @lib.OHash] compare_v6(
  x705 : (TB) -> ((TA) -> Int64 raise) raise,
  x706 : @omap.T[TC, TB],
  x707 : @omap.T[TC, TA],
) -> Int64 raise {
  let cmp = x705
  let m1 = x706
  let m2 = x707
  @omap.compare(compare_v5, cmp, m1, m2)
}

///|
/// `equal`
pub fn[TA, TB, TC : Eq + @lib.OCompare + @lib.OHash] equal_v3(
  x708 : (TB) -> ((TA) -> Bool raise) raise,
  x709 : @omap.T[TC, TB],
  x710 : @omap.T[TC, TA],
) -> Bool raise {
  let cmp = x708
  let m1 = x709
  let m2 = x710
  @omap.equal(compare_v5, cmp, m1, m2)
}

///|
/// `iter`
pub fn[TA, TB, TC] iter_v1(
  x711 : (TC) -> ((TB) -> TA raise) raise,
  x712 : @omap.T[TC, TB],
) -> Unit raise {
  let f = x711
  let m = x712
  @omap.iter(f, m)
}

///|
/// `fold`
pub fn[TA, TB, TC] fold_v1(
  x713 : (TC) -> ((TB) -> ((TA) -> TA raise) raise) raise,
  x714 : @omap.T[TC, TB],
  x715 : TA,
) -> TA raise {
  let f = x713
  let m = x714
  let accu = x715
  @omap.fold(f, m, accu)
}

///|
/// `for_all`
pub fn[TA, TB] for_all_v1(
  x716 : (TB) -> ((TA) -> Bool raise) raise,
  x717 : @omap.T[TB, TA],
) -> Bool raise {
  let p = x716
  let m = x717
  @omap.for_all(p, m)
}

///|
/// `exists`
pub fn[TA, TB] exists_v4(
  x718 : (TB) -> ((TA) -> Bool raise) raise,
  x719 : @omap.T[TB, TA],
) -> Bool raise {
  let p = x718
  let m = x719
  @omap.exists(p, m)
}

///|
/// `filter`
pub fn[TA, TB] filter_v4(
  x720 : (TA) -> ((TB) -> Bool raise) raise,
  x721 : @omap.T[TA, TB],
) -> @omap.T[TA, TB] raise {
  let p = x720
  let m = x721
  @omap.filter(p, m)
}

///|
/// `filter_map`
pub fn[TA, TB, TC] filter_map_v1(
  x722 : (TA) -> ((TC) -> TB? raise) raise,
  x723 : @omap.T[TA, TC],
) -> @omap.T[TA, TB] raise {
  let f = x722
  let m = x723
  @omap.filter_map(f, m)
}

///|
/// `partition`
pub fn[TA, TB] partition_v3(
  x724 : (TA) -> ((TB) -> Bool raise) raise,
  x725 : @omap.T[TA, TB],
) -> (@omap.T[TA, TB], @omap.T[TA, TB]) raise {
  let p = x724
  let m = x725
  @omap.partition(p, m)
}

///|
/// `cardinal`
pub fn[TA, TB] cardinal_v1(x726 : @omap.T[TA, TB]) -> Int64 raise {
  let m = x726
  @omap.cardinal(m)
}

///|
/// `bindings`
pub fn[TA, TB] bindings_v1(
  x727 : @omap.T[TA, TB],
) -> @list.List[(TA, TB)] raise {
  let s = x727
  @omap.bindings(s)
}

///|
/// `min_binding`
pub fn[TA, TB] min_binding_v1(x728 : @omap.T[TA, TB]) -> (TA, TB) raise {
  let m = x728
  @omap.min_binding(m)
}

///|
/// `min_binding_opt`
pub fn[TA, TB] min_binding_opt_v1(x729 : @omap.T[TA, TB]) -> (TA, TB)? raise {
  let m = x729
  @omap.min_binding_opt(m)
}

///|
/// `max_binding`
pub fn[TA, TB] max_binding_v1(x730 : @omap.T[TA, TB]) -> (TA, TB) raise {
  let m = x730
  @omap.max_binding(m)
}

///|
/// `max_binding_opt`
pub fn[TA, TB] max_binding_opt_v1(x731 : @omap.T[TA, TB]) -> (TA, TB)? raise {
  let m = x731
  @omap.max_binding_opt(m)
}

///|
/// `choose`
pub fn[TA, TB] choose_v1(x732 : @omap.T[TA, TB]) -> (TA, TB) raise {
  let m = x732
  @omap.choose(m)
}

///|
/// `choose_opt`
pub fn[TA, TB] choose_opt_v1(x733 : @omap.T[TA, TB]) -> (TA, TB)? raise {
  let m = x733
  @omap.choose_opt(m)
}

///|
/// `split`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB] split_v1(
  x734 : TA,
  x735 : @omap.T[TA, TB],
) -> (@omap.T[TA, TB], TB?, @omap.T[TA, TB]) raise {
  let x = x734
  let m = x735
  @omap.split(compare_v5, x, m)
}

///|
/// `find`
pub fn[TA, TB : Eq + @lib.OCompare + @lib.OHash] find_v2(
  x736 : TB,
  x737 : @omap.T[TB, TA],
) -> TA raise {
  let x = x736
  let m = x737
  @omap.find(compare_v5, x, m)
}

///|
/// `find_opt`
pub fn[TA, TB : Eq + @lib.OCompare + @lib.OHash] find_opt_v1(
  x738 : TB,
  x739 : @omap.T[TB, TA],
) -> TA? raise {
  let x = x738
  let m = x739
  @omap.find_opt(compare_v5, x, m)
}

///|
/// `find_first`
pub fn[TA, TB] find_first_v1(
  x740 : (TA) -> Bool raise,
  x741 : @omap.T[TA, TB],
) -> (TA, TB) raise {
  let f = x740
  let m = x741
  @omap.find_first(f, m)
}

///|
/// `find_first_opt`
pub fn[TA, TB] find_first_opt_v1(
  x742 : (TA) -> Bool raise,
  x743 : @omap.T[TA, TB],
) -> (TA, TB)? raise {
  let f = x742
  let m = x743
  @omap.find_first_opt(f, m)
}

///|
/// `find_last`
pub fn[TA, TB] find_last_v1(
  x744 : (TA) -> Bool raise,
  x745 : @omap.T[TA, TB],
) -> (TA, TB) raise {
  let f = x744
  let m = x745
  @omap.find_last(f, m)
}

///|
/// `find_last_opt`
pub fn[TA, TB] find_last_opt_v1(
  x746 : (TA) -> Bool raise,
  x747 : @omap.T[TA, TB],
) -> (TA, TB)? raise {
  let f = x746
  let m = x747
  @omap.find_last_opt(f, m)
}

///|
/// `map`
pub fn[TA, TB, TC] map_v3(
  x748 : (TC) -> TB raise,
  x749 : @omap.T[TA, TC],
) -> @omap.T[TA, TB] raise {
  let f = x748
  let m = x749
  @omap.map(f, m)
}

///|
/// `mapi`
pub fn[TA, TB, TC] mapi_v1(
  x750 : (TA) -> ((TC) -> TB raise) raise,
  x751 : @omap.T[TA, TC],
) -> @omap.T[TA, TB] raise {
  let f = x750
  let m = x751
  @omap.mapi(f, m)
}

///|
/// `map`
pub type Map3[TA] = T3[TA]

///|
/// `newMap`
pub fn[TA, TB] newmap_v2(x752 : Unit) -> @omap.T[TA, TB] raise {
  let _ = x752
  empty_v2()
}

///|
/// `null`
pub fn[TA, TB] null_v4(x : @omap.T[TA, TB]) -> Bool raise {
  let f : (@omap.T[TA, TB]) -> Bool raise = is_empty_v1
  f(x)
}

///|
/// `singleton`
pub fn[TA, TB] singleton_v5(x753 : TA, x754 : TB) -> @omap.T[TA, TB] raise {
  let (k, x) = (x753, x754)
  singleton_v4(k, x)
}

///|
/// `size`
pub fn[TA, TB] size_v3(x : @omap.T[TA, TB]) -> Int64 raise {
  let f : (@omap.T[TA, TB]) -> Int64 raise = cardinal_v1
  f(x)
}

///|
/// `get`
pub fn[TA, TB : Eq + @lib.OCompare + @lib.OHash] get_v2(
  x755 : @omap.T[TB, TA],
  x756 : TB,
) -> TA raise {
  let m = x755
  let k = x756
  find_v2(k, m) catch {
    @lib.NotFound => raise Failure("Mmap.get: element not found")
    e => raise e
  }
}

///|
/// `peek`
pub fn[TA, TB : Eq + @lib.OCompare + @lib.OHash] peek_v3(
  x757 : @omap.T[TB, TA],
  x758 : TB,
) -> TA? raise {
  let m = x757
  let k = x758
  Some(find_v2(k, m)) catch {
    @lib.NotFound => None
    e => raise e
  }
}

///|
/// `insert`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB] insert_v2(
  x759 : @omap.T[TA, TB],
  x760 : (TA, TB),
) -> @omap.T[TA, TB] raise {
  let m = x759
  let (k, v) = x760
  add_v2(k, v, m)
}

///|
/// `toList`
pub fn[TA, TB] tolist_v3(x : @omap.T[TA, TB]) -> @list.List[(TA, TB)] raise {
  let f : (@omap.T[TA, TB]) -> @list.List[(TA, TB)] raise = bindings_v1
  f(x)
}

///|
/// `fromList`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB] fromlist_v3(
  x761 : @list.List[(TA, TB)],
) -> @omap.T[TA, TB] raise {
  let l = x761
  @lib.itlist(
    fn(x762 : (TA, TB), x763 : @omap.T[TA, TB]) -> @omap.T[TA, TB] raise {
      let (v, tm) = x762
      ((x764 : @omap.T[TA, TB]) => add_v2(v, tm, x764))(x763)
    },
    l,
    empty_v2(),
  )
}

///|
/// `foldl`
pub fn[TA, TB, TC] foldl_v4(
  x765 : ((TB, TC, TA)) -> TA raise,
  x766 : TA,
  x767 : @omap.T[TB, TC],
) -> TA raise {
  let f = x765
  let b = x766
  let m = x767
  @lib.fold_left(
    fn(x768 : TA, x769 : (TB, TC)) -> TA raise {
      let s = x768
      let (v, tm) = x769
      f((v, tm, s))
    },
    b,
    bindings_v1(m),
  )
}

///|
/// `foldr`
pub fn[TA, TB, TC] foldr_v4(
  x : ((TB, TC, TA)) -> TA raise,
) -> ((TA) -> ((@omap.T[TB, TC]) -> TA raise) raise) raise {
  let f : (((TB, TC, TA)) -> TA raise) -> ((TA) -> ((@omap.T[TB, TC]) -> TA raise) raise) raise = x770 => {
    x771 => x772 => foldl_v4(x770, x771, x772)
  }
  f(x)
}

///|
/// `filter`
pub fn[TA, TB] filter_v5(
  x773 : ((TA, TB)) -> Bool raise,
) -> ((@omap.T[TA, TB]) -> @omap.T[TA, TB] raise) raise {
  let f = x773
  (x777 : @omap.T[TA, TB]) => {
    filter_v4(
      fn(x775 : TA) -> ((TB) -> Bool raise) raise {
        let x = x775
        fn(x776 : TB) -> Bool raise {
          let y = x776
          f((x, y))
        }
      },
      x777,
    )
  }
}

///|
/// `inDomain`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB] indomain_v2(
  x : TA,
) -> ((@omap.T[TA, TB]) -> Bool raise) raise {
  let f : (TA) -> ((@omap.T[TA, TB]) -> Bool raise) raise = x778 => {
    x779 => mem_v1(x778, x779)
  }
  f(x)
}

///|
/// `union`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB] union_v5(
  x780 : (((TA, TB), (TA, TB))) -> TB? raise,
  x781 : @omap.T[TA, TB],
  x782 : @omap.T[TA, TB],
) -> @omap.T[TA, TB] raise {
  let f = x780
  let m1 = x781
  let m2 = x782
  let f_p : (TA) -> (((TB?, TB?)) -> TB? raise) raise = fn(
    x783 : TA,
  ) -> (((TB?, TB?)) -> TB? raise) raise {
    let k = x783
    fn(x784 : (TB?, TB?)) -> TB? raise {
      match x784 {
        (Some(x), Some(y)) => f(((k, x), (k, y)))
        (Some(x_1), None) => Some(x_1)
        (None, Some(y_1)) => Some(y_1)
        (None, None) => None
      }
    }
  }
  merge_v2(
    fn(x785 : TA) -> ((TB?) -> ((TB?) -> TB? raise) raise) raise {
      let k_1 = x785
      fn(x786 : TB?) -> ((TB?) -> TB? raise) raise {
        let x_2 = x786
        fn(x787 : TB?) -> TB? raise {
          let y_2 = x787
          f_p(k_1)((x_2, y_2))
        }
      }
    },
    m1,
    m2,
  )
}

///|
/// `delete`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB] delete_v3(
  x788 : @omap.T[TA, TB],
  x789 : TA,
) -> @omap.T[TA, TB] raise {
  let m = x788
  let k = x789
  remove_v3(k, m)
}

///|
/// `mapPartial`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB, TC] mappartial_v3(
  x790 : ((TA, TC)) -> TB? raise,
  x791 : @omap.T[TA, TC],
) -> @omap.T[TA, TB] raise {
  let f = x790
  let m = x791
  fold_v1(
    fn(
      x792 : TA,
    ) -> ((TC) -> ((@omap.T[TA, TB]) -> @omap.T[TA, TB] raise) raise) raise {
      let k = x792
      fn(x793 : TC) -> ((@omap.T[TA, TB]) -> @omap.T[TA, TB] raise) raise {
        let x = x793
        fn(x794 : @omap.T[TA, TB]) -> @omap.T[TA, TB] raise {
          let acc = x794
          match f((k, x)) {
            Some(y) => add_v2(k, y, acc)
            None => acc
          }
        }
      }
    },
    m,
    empty_v2(),
  )
}

///|
/// `transform`
pub fn[TA, TB, TC] transform_v3(
  x : (TC) -> TB raise,
) -> ((@omap.T[TA, TC]) -> @omap.T[TA, TB] raise) raise {
  let f : ((TC) -> TB raise) -> ((@omap.T[TA, TC]) -> @omap.T[TA, TB] raise) raise = x795 => {
    x796 => map_v3(x795, x796)
  }
  f(x)
}

///|
/// `exists`
pub fn[TA, TB] exists_v5(
  x797 : ((TA, TB)) -> Bool raise,
) -> ((@omap.T[TA, TB]) -> Bool raise) raise {
  let f = x797
  (x801 : @omap.T[TA, TB]) => {
    exists_v4(
      fn(x799 : TA) -> ((TB) -> Bool raise) raise {
        let k = x799
        fn(x800 : TB) -> Bool raise {
          let m = x800
          f((k, m))
        }
      },
      x801,
    )
  }
}

///|
/// `t`
pub type T4 = Int64

///|
/// `compare`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] compare_v7(
  x : TA,
) -> ((TA) -> Int64 raise) raise {
  let f : (TA) -> ((TA) -> Int64 raise) raise = x802 => {
    x803 => Int::to_int64(@lib.compare(x802, x803))
  }
  f(x)
}

///|
/// `elt`
pub type Elt = T4

///|
/// `t`
pub type T5 = @oset.T[Elt]

///|
/// `empty`
pub fn[TA] empty_v3() -> @oset.T[TA] {
  @oset.empty()
}

///|
/// `is_empty`
pub fn[TA] is_empty_v2(x804 : @oset.T[TA]) -> Bool raise {
  let s = x804
  @oset.is_empty(s)
}

///|
/// `mem`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] mem_v2(
  x805 : TA,
  x806 : @oset.T[TA],
) -> Bool raise {
  let x = x805
  let s = x806
  @oset.mem(compare_v7, x, s)
}

///|
/// `add`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] add_v3(
  x807 : TA,
  x808 : @oset.T[TA],
) -> @oset.T[TA] raise {
  let x = x807
  let s = x808
  @oset.add(compare_v7, x, s)
}

///|
/// `singleton`
pub fn[TA] singleton_v6(x809 : TA) -> @oset.T[TA] raise {
  let x = x809
  @oset.singleton(x)
}

///|
/// `remove`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] remove_v4(
  x810 : TA,
  x811 : @oset.T[TA],
) -> @oset.T[TA] raise {
  let x = x810
  let s = x811
  @oset.remove(compare_v7, x, s)
}

///|
/// `union`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] union_v6(
  x812 : @oset.T[TA],
  x813 : @oset.T[TA],
) -> @oset.T[TA] raise {
  let s1 = x812
  let s2 = x813
  @oset.union(compare_v7, s1, s2)
}

///|
/// `inter`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] inter(
  x814 : @oset.T[TA],
  x815 : @oset.T[TA],
) -> @oset.T[TA] raise {
  let s1 = x814
  let s2 = x815
  @oset.inter(compare_v7, s1, s2)
}

///|
/// `disjoint`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] disjoint_v1(
  x816 : @oset.T[TA],
  x817 : @oset.T[TA],
) -> Bool raise {
  let s1 = x816
  let s2 = x817
  @oset.disjoint(compare_v7, s1, s2)
}

///|
/// `diff`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] diff(
  x818 : @oset.T[TA],
  x819 : @oset.T[TA],
) -> @oset.T[TA] raise {
  let s1 = x818
  let s2 = x819
  @oset.diff(compare_v7, s1, s2)
}

///|
/// `compare`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] compare_v8(
  x820 : @oset.T[TA],
  x821 : @oset.T[TA],
) -> Int64 raise {
  let s1 = x820
  let s2 = x821
  @oset.compare(compare_v7, s1, s2)
}

///|
/// `equal`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] equal_v4(
  x822 : @oset.T[TA],
  x823 : @oset.T[TA],
) -> Bool raise {
  let s1 = x822
  let s2 = x823
  @oset.equal(compare_v7, s1, s2)
}

///|
/// `subset`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] subset_v1(
  x824 : @oset.T[TA],
  x825 : @oset.T[TA],
) -> Bool raise {
  let s1 = x824
  let s2 = x825
  @oset.subset(compare_v7, s1, s2)
}

///|
/// `iter`
pub fn[TA, TB] iter_v2(
  x826 : (TB) -> TA raise,
  x827 : @oset.T[TB],
) -> Unit raise {
  let f = x826
  let s = x827
  @oset.iter(f, s)
}

///|
/// `map`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] map_v4(
  x828 : (TA) -> TA raise,
  x829 : @oset.T[TA],
) -> @oset.T[TA] raise {
  let f = x828
  let s = x829
  @oset.map(compare_v7, f, s)
}

///|
/// `fold`
pub fn[TA, TB] fold_v2(
  x830 : (TB) -> ((TA) -> TA raise) raise,
  x831 : @oset.T[TB],
  x832 : TA,
) -> TA raise {
  let f = x830
  let s = x831
  let accu = x832
  @oset.fold(f, s, accu)
}

///|
/// `for_all`
pub fn[TA] for_all_v2(
  x833 : (TA) -> Bool raise,
  x834 : @oset.T[TA],
) -> Bool raise {
  let p = x833
  let s = x834
  @oset.for_all(p, s)
}

///|
/// `exists`
pub fn[TA] exists_v6(
  x835 : (TA) -> Bool raise,
  x836 : @oset.T[TA],
) -> Bool raise {
  let p = x835
  let s = x836
  @oset.exists(p, s)
}

///|
/// `filter`
pub fn[TA] filter_v6(
  x837 : (TA) -> Bool raise,
  x838 : @oset.T[TA],
) -> @oset.T[TA] raise {
  let p = x837
  let s = x838
  @oset.filter(p, s)
}

///|
/// `filter_map`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] filter_map_v2(
  x839 : (TA) -> TA? raise,
  x840 : @oset.T[TA],
) -> @oset.T[TA] raise {
  let f = x839
  let s = x840
  @oset.filter_map(compare_v7, f, s)
}

///|
/// `partition`
pub fn[TA] partition_v4(
  x841 : (TA) -> Bool raise,
  x842 : @oset.T[TA],
) -> (@oset.T[TA], @oset.T[TA]) raise {
  let p = x841
  let s = x842
  @oset.partition(p, s)
}

///|
/// `cardinal`
pub fn[TA] cardinal_v2(x843 : @oset.T[TA]) -> Int64 raise {
  let s = x843
  @oset.cardinal(s)
}

///|
/// `elements`
pub fn[TA] elements(x844 : @oset.T[TA]) -> @list.List[TA] raise {
  let s = x844
  @oset.elements(s)
}

///|
/// `min_elt`
pub fn[TA] min_elt(x845 : @oset.T[TA]) -> TA raise {
  let s = x845
  @oset.min_elt(s)
}

///|
/// `min_elt_opt`
pub fn[TA] min_elt_opt(x846 : @oset.T[TA]) -> TA? raise {
  let s = x846
  @oset.min_elt_opt(s)
}

///|
/// `max_elt`
pub fn[TA] max_elt(x847 : @oset.T[TA]) -> TA raise {
  let s = x847
  @oset.max_elt(s)
}

///|
/// `max_elt_opt`
pub fn[TA] max_elt_opt(x848 : @oset.T[TA]) -> TA? raise {
  let s = x848
  @oset.max_elt_opt(s)
}

///|
/// `choose`
pub fn[TA] choose_v2(x849 : @oset.T[TA]) -> TA raise {
  let s = x849
  @oset.choose(s)
}

///|
/// `choose_opt`
pub fn[TA] choose_opt_v2(x850 : @oset.T[TA]) -> TA? raise {
  let s = x850
  @oset.choose_opt(s)
}

///|
/// `split`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] split_v2(
  x851 : TA,
  x852 : @oset.T[TA],
) -> (@oset.T[TA], Bool, @oset.T[TA]) raise {
  let x = x851
  let s = x852
  @oset.split(compare_v7, x, s)
}

///|
/// `find`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] find_v3(
  x853 : TA,
  x854 : @oset.T[TA],
) -> TA raise {
  let x = x853
  let s = x854
  @oset.find(compare_v7, x, s)
}

///|
/// `find_opt`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] find_opt_v2(
  x855 : TA,
  x856 : @oset.T[TA],
) -> TA? raise {
  let x = x855
  let s = x856
  @oset.find_opt(compare_v7, x, s)
}

///|
/// `find_first`
pub fn[TA] find_first_v2(
  x857 : (TA) -> Bool raise,
  x858 : @oset.T[TA],
) -> TA raise {
  let f = x857
  let s = x858
  @oset.find_first(f, s)
}

///|
/// `find_first_opt`
pub fn[TA] find_first_opt_v2(
  x859 : (TA) -> Bool raise,
  x860 : @oset.T[TA],
) -> TA? raise {
  let f = x859
  let s = x860
  @oset.find_first_opt(f, s)
}

///|
/// `find_last`
pub fn[TA] find_last_v2(
  x861 : (TA) -> Bool raise,
  x862 : @oset.T[TA],
) -> TA raise {
  let f = x861
  let s = x862
  @oset.find_last(f, s)
}

///|
/// `find_last_opt`
pub fn[TA] find_last_opt_v2(
  x863 : (TA) -> Bool raise,
  x864 : @oset.T[TA],
) -> TA? raise {
  let f = x863
  let s = x864
  @oset.find_last_opt(f, s)
}

///|
/// `set`
pub type Set1 = T5

///|
/// `compare`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] compare_v9(
  x : @oset.T[TA],
) -> ((@oset.T[TA]) -> Int64 raise) raise {
  let f : (@oset.T[TA]) -> ((@oset.T[TA]) -> Int64 raise) raise = x865 => {
    x866 => compare_v8(x865, x866)
  }
  f(x)
}

///|
/// `add`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] add_v4(
  x867 : @oset.T[TA],
  x868 : TA,
) -> @oset.T[TA] raise {
  let s = x867
  let x = x868
  add_v3(x, s)
}

///|
/// `foldr`
pub fn[TA, TB] foldr_v5(
  x869 : ((TB, TA)) -> TA raise,
  x870 : TA,
  x871 : @oset.T[TB],
) -> TA raise {
  let f = x869
  let a = x870
  let s = x871
  fold_v2(
    fn(x872 : TB) -> ((TA) -> TA raise) raise {
      let x = x872
      fn(x873 : TA) -> TA raise {
        let acc = x873
        f((x, acc))
      }
    },
    s,
    a,
  )
}

///|
/// `foldl`
pub fn[TA, TB] foldl_v5(
  x : ((TB, TA)) -> TA raise,
) -> ((TA) -> ((@oset.T[TB]) -> TA raise) raise) raise {
  let f : (((TB, TA)) -> TA raise) -> ((TA) -> ((@oset.T[TB]) -> TA raise) raise) raise = x874 => {
    x875 => x876 => foldr_v5(x874, x875, x876)
  }
  f(x)
}

///|
/// `member`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] member_v1(
  x : TA,
) -> ((@oset.T[TA]) -> Bool raise) raise {
  let f : (TA) -> ((@oset.T[TA]) -> Bool raise) raise = x877 => {
    x878 => mem_v2(x877, x878)
  }
  f(x)
}

///|
/// `empty`
pub fn[TA] empty_v4() -> @oset.T[TA] {
  empty_v3()
}

///|
/// `union`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] union_v7(
  x : @oset.T[TA],
) -> ((@oset.T[TA]) -> @oset.T[TA] raise) raise {
  let f : (@oset.T[TA]) -> ((@oset.T[TA]) -> @oset.T[TA] raise) raise = x879 => {
    x880 => union_v6(x879, x880)
  }
  f(x)
}

///|
/// `difference`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] difference_v1(
  x : @oset.T[TA],
) -> ((@oset.T[TA]) -> @oset.T[TA] raise) raise {
  let f : (@oset.T[TA]) -> ((@oset.T[TA]) -> @oset.T[TA] raise) raise = x881 => {
    x882 => diff(x881, x882)
  }
  f(x)
}

///|
/// `toList`
pub fn[TA] tolist_v4(x : @oset.T[TA]) -> @list.List[TA] raise {
  let f : (@oset.T[TA]) -> @list.List[TA] raise = elements
  f(x)
}

///|
/// `singleton`
pub fn[TA] singleton_v7(x : TA) -> @oset.T[TA] raise {
  let f : (TA) -> @oset.T[TA] raise = singleton_v6
  f(x)
}

///|
/// `null`
pub fn[TA] null_v5(x : @oset.T[TA]) -> Bool raise {
  let f : (@oset.T[TA]) -> Bool raise = is_empty_v2
  f(x)
}

///|
/// `size`
pub fn[TA] size_v4(x : @oset.T[TA]) -> Int64 raise {
  let f : (@oset.T[TA]) -> Int64 raise = cardinal_v2
  f(x)
}

///|
/// `pick`
pub fn[TA] pick_v2(x : @oset.T[TA]) -> TA raise {
  let f : (@oset.T[TA]) -> TA raise = choose_v2
  f(x)
}

///|
/// `equal`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] equal_v5(
  x : @oset.T[TA],
) -> ((@oset.T[TA]) -> Bool raise) raise {
  let f : (@oset.T[TA]) -> ((@oset.T[TA]) -> Bool raise) raise = x883 => {
    x884 => equal_v4(x883, x884)
  }
  f(x)
}

///|
/// `exists`
pub fn[TA] exists_v7(
  x : (TA) -> Bool raise,
) -> ((@oset.T[TA]) -> Bool raise) raise {
  let f : ((TA) -> Bool raise) -> ((@oset.T[TA]) -> Bool raise) raise = x885 => {
    x886 => exists_v6(x885, x886)
  }
  f(x)
}

///|
/// `fromList`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] fromlist_v4(
  x887 : @list.List[TA],
) -> @oset.T[TA] raise {
  let l = x887
  @lib.itlist(add_v3, l, empty_v3())
}

///|
/// `delete`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] delete_v4(
  x888 : @oset.T[TA],
  x889 : TA,
) -> @oset.T[TA] raise {
  let s = x888
  let x = x889
  remove_v4(x, s)
}

///|
/// `subset`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] subset_v2(
  x : @oset.T[TA],
) -> ((@oset.T[TA]) -> Bool raise) raise {
  let f : (@oset.T[TA]) -> ((@oset.T[TA]) -> Bool raise) raise = x890 => {
    x891 => subset_v1(x890, x891)
  }
  f(x)
}

///|
/// `intersect`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] intersect_v2(
  x : @oset.T[TA],
) -> ((@oset.T[TA]) -> @oset.T[TA] raise) raise {
  let f : (@oset.T[TA]) -> ((@oset.T[TA]) -> @oset.T[TA] raise) raise = x892 => {
    x893 => inter(x892, x893)
  }
  f(x)
}

///|
/// `intersectList`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] intersectlist_v1(
  x894 : @list.List[@oset.T[TA]],
) -> @oset.T[TA] raise {
  match x894 {
    Empty => empty_v3()
    More(s, tail=ss) => @lib.itlist(inter, ss, s)
  }
}

///|
/// `findl`
pub fn[TA] findl_v2(x895 : (TA) -> Bool raise, x896 : @oset.T[TA]) -> TA? raise {
  let p = x895
  let s = x896
  let go : (TA) -> ((TA?) -> TA? raise) raise = fn(
    x897 : TA,
  ) -> ((TA?) -> TA? raise) raise {
    let x = x897
    fn(x898 : TA?) -> TA? raise {
      match x898 {
        Some(_) as s_1 => s_1
        None => if p(x) { Some(x) } else { None }
      }
    }
  }
  fold_v2(go, s, None)
}

///|
/// `firstl`
pub fn[TA, TB] firstl_v2(
  x899 : (TB) -> TA? raise,
  x900 : @oset.T[TB],
) -> TA? raise {
  let f = x899
  let s = x900
  let go : (TB) -> ((TA?) -> TA? raise) raise = fn(
    x901 : TB,
  ) -> ((TA?) -> TA? raise) raise {
    let x = x901
    fn(x902 : TA?) -> TA? raise {
      match x902 {
        Some(_) as s_1 => s_1
        None => f(x)
      }
    }
  }
  fold_v2(go, s, None)
}

///|
/// `transform`
pub fn[TA, TB] transform_v4(
  x903 : (TB) -> TA raise,
  x904 : @oset.T[TB],
) -> @list.List[TA] raise {
  let f = x903
  let s = x904
  fold_v2(
    fn(x905 : TB) -> ((@list.List[TA]) -> @list.List[TA] raise) raise {
      let x = x905
      fn(x906 : @list.List[TA]) -> @list.List[TA] raise {
        let acc = x906
        acc.prepend(f(x))
      }
    },
    s,
    @list.List([]),
  )
}

///|
/// `all`
pub fn[TA] all_v2(
  x : (TA) -> Bool raise,
) -> ((@oset.T[TA]) -> Bool raise) raise {
  let f : ((TA) -> Bool raise) -> ((@oset.T[TA]) -> Bool raise) raise = x907 => {
    x908 => for_all_v2(x907, x908)
  }
  f(x)
}

///|
/// `count`
pub fn[TA] count_v2(
  x909 : (TA) -> Bool raise,
  x910 : @oset.T[TA],
) -> Int64 raise {
  let p = x909
  let s = x910
  fold_v2(
    fn(x911 : TA) -> ((Int64) -> Int64 raise) raise {
      let x = x911
      fn(x912 : Int64) -> Int64 raise {
        let c = x912
        if p(x) {
          @lib.add63(c, 1L)
        } else {
          c
        }
      }
    },
    s,
    0L,
  )
}

///|
/// `exception Empty`
pub(all) suberror Empty {
  Empty
}

///|
/// `node`
#derive(Eq, Debug)
pub(all) enum Node1[TA] {
  Em
  Tr(Int64, TA, Node1[TA], Node1[TA])
}

///|
pub extend Node1 with Eq::{not_equal, equal}

///|
pub extend Node1 with Debug::{to_repr}

///|
pub extend Node1 with @lib.OCompare::{ocompare}

///|
pub extend Node1 with @lib.OHash::{ohash_visit}

///|
fn[TA] ocaml_rank_Node1(x : Node1[TA]) -> Int {
  match x {
    Em => 0
    Tr(_, _, _, _) => 1000000
  }
}

///|
pub impl[TA : @lib.OCompare] @lib.OCompare for Node1[TA] with fn ocompare(
  self,
  other,
) {
  match (self, other) {
    (Tr(a0, a1, a2, a3), Tr(b0, b1, b2, b3)) => {
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
    _ => ocaml_rank_Node1(self).compare(ocaml_rank_Node1(other))
  }
}

///|
pub impl[TA : @lib.OHash] @lib.OHash for Node1[TA] with fn ohash_visit(self, h) {
  match self {
    Em => h.int(0L)
    Tr(a0, a1, a2, a3) => {
      h.block(0, 4)
      h.field(a0)
      h.field(a1)
      h.field(a2)
      h.field(a3)
    }
  }
}

///|
/// `heap`
pub(all) enum Heap[TA] {
  Heap((TA) -> ((TA) -> Int64 raise) raise, Int64, Node1[TA])
}

///|
/// `rank`
pub fn[TA] rank(x913 : Node1[TA]) -> Int64 raise {
  match x913 {
    Node1::Em => 0L
    Node1::Tr(r, _, _, _) => r
  }
}

///|
/// `makeT`
pub fn[TA] maket(
  x914 : TA,
  x915 : Node1[TA],
  x916 : Node1[TA],
) -> Node1[TA] raise {
  let (x, a, b) = (x914, x915, x916)
  let t917 = rank(b)
  if rank(a) >= t917 {
    Node1::Tr(@lib.add63(rank(b), 1L), x, a, b)
  } else {
    Node1::Tr(@lib.add63(rank(a), 1L), x, b, a)
  }
}

///|
/// `merge`
pub fn[TA] merge_v3(
  x918 : (TA) -> ((TA) -> Int64 raise) raise,
) -> (((Node1[TA], Node1[TA])) -> Node1[TA] raise) raise {
  let cmp = x918
  fn mrg(x920 : (Node1[TA], Node1[TA])) -> Node1[TA] raise {
    match x920 {
      (h, Node1::Em) => h
      (Node1::Em, h_1) => h_1
      (Node1::Tr(_, x, a1, b1) as h1, Node1::Tr(_, y, a2, b2) as h2) =>
        if cmp(x)(y) > 0L {
          maket(y, a2, mrg((h1, b2)))
        } else {
          maket(x, a1, mrg((b1, h2)))
        }
    }
  }
  mrg
}

///|
/// `newHeap`
pub fn[TA] newheap(
  x921 : (TA) -> ((TA) -> Int64 raise) raise,
) -> Heap[TA] raise {
  let cmp = x921
  Heap::Heap(cmp, 0L, Node1::Em)
}

///|
/// `add`
pub fn[TA] add_v5(x922 : Heap[TA]) -> ((TA) -> Heap[TA] raise) raise {
  match x922 {
    Heap::Heap(f, n, a) =>
      fn(x923 : TA) -> Heap[TA] raise {
        let x = x923
        let t924 = (Node1::Tr(1L, x, Node1::Em, Node1::Em), a)
        let t925 = merge_v3(f)(t924)
        Heap::Heap(f, @lib.add63(n, 1L), t925)
      }
  }
}

///|
/// `size`
pub fn[TA] size_v5(x926 : Heap[TA]) -> Int64 raise {
  match x926 {
    Heap::Heap(_, n, _) => n
  }
}

///|
/// `null`
pub fn[TA] null_v6(x927 : Heap[TA]) -> Bool raise {
  let h = x927
  size_v5(h) == 0L
}

///|
/// `top`
pub fn[TA] top(x928 : Heap[TA]) -> TA raise {
  match x928 {
    Heap::Heap(_, _, Node1::Em) => raise Empty::Empty
    Heap::Heap(_, _, Node1::Tr(_, x, _, _)) => x
  }
}

///|
/// `remove`
pub fn[TA] remove_v5(x929 : Heap[TA]) -> (TA, Heap[TA]) raise {
  match x929 {
    Heap::Heap(_, _, Node1::Em) => raise Empty::Empty
    Heap::Heap(f, n, Node1::Tr(_, x, a, b)) => {
      let t930 = merge_v3(f)((a, b))
      (x, Heap::Heap(f, @lib.sub63(n, 1L), t930))
    }
  }
}

///|
/// `app`
pub fn[TA, TB] app_v2(
  x931 : (TA) -> TB raise,
) -> ((Heap[TA]) -> Unit raise) raise {
  let f = x931
  fn ap(x933 : @list.List[Node1[TA]]) -> Unit raise {
    match x933 {
      Empty => ()
      More(Node1::Em, tail=rest) => ap(rest)
      More(Node1::Tr(_, d, a, b), tail=rest_1) => {
        ignore(f(d))
        ap(rest_1.prepend(b).prepend(a))
      }
    }
  }
  fn(x934 : Heap[TA]) -> Unit raise {
    match x934 {
      Heap::Heap(_, _, a_1) => ap(@list.List([a_1]))
    }
  }
}

///|
/// `toList`
pub fn[TA] tolist_v5(x935 : Heap[TA]) -> @list.List[TA] raise {
  let h = x935
  if null_v6(h) {
    @list.List([])
  } else {
    let (x, h_1) = remove_v5(h)
    tolist_v5(h_1).prepend(x)
  }
}

///|
/// `toString`
pub fn[TA] tostring_v2(x936 : Heap[TA]) -> String raise {
  let h = x936
  "Heap[" + ((if null_v6(h) { "" } else { Int64::to_string(size_v5(h)) }) + "]")
}

///|
/// `name`
pub type Name = String

///|
/// compare
fn step_6() -> Unit raise {
  compare_v10_c.set(fn(x937 : String) -> ((String) -> Int64 raise) raise {
    fn(x938 : String) -> Int64 raise { Int::to_int64(@lib.compare(x937, x938)) }
  })
}

///|
let compare_v10_c : @lib.Cell[(Name) -> ((Name) -> Int64 raise) raise] = @lib.Cell::new(
  "compare",
)

///|
/// `compare`
pub fn compare_v10(x : Name) -> ((Name) -> Int64 raise) raise {
  compare_v10_c.get()(x)
}

///|
/// `equal`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] equal_v6(
  x939 : TA,
  x940 : TA,
) -> Bool raise {
  let n1 = x939
  let n2 = x940
  n1 == n2
}

///|
/// prefix
fn step_7() -> Unit raise {
  prefix_c.set("_")
}

///|
let prefix_c : @lib.Cell[String] = @lib.Cell::new("prefix")

///|
/// `prefix`
pub fn prefix() -> String {
  prefix_c.get()
}

///|
/// `numName`
pub fn numname(x941 : Int64) -> String raise {
  let i = x941
  mkprefix(prefix(), Int64::to_string(i))
}

///|
/// `newName`
pub fn newname(x942 : Unit) -> String raise {
  let _ = x942
  numname(newint(()))
}

///|
/// `newNames`
pub fn newnames(x943 : Int64) -> @list.List[String] raise {
  let n = x943
  @lib.map(numname, newints(n))
}

///|
/// `variantPrime`
pub fn variantprime(
  x944 : (String) -> Bool raise,
) -> ((String) -> String raise) raise {
  let avoid = x944
  fn variant(x946 : String) -> String raise {
    let n = x946
    if avoid(n) {
      variant(n + "'")
    } else {
      n
    }
  }
  variant
}

///|
/// `variantNum`
pub fn variantnum(x947 : (String) -> Bool raise, x948 : String) -> String raise {
  let avoid = x947
  let n = x948
  let isdigitorprime : (Char) -> Bool raise = fn(x949 : Char) -> Bool raise {
    let c = x949
    c == '\'' || isdigit(c)
  }
  if !avoid(n) {
    n
  } else {
    let n_1 = stripsuffix(isdigitorprime, n)
    fn variant(x950 : Int64) -> String raise {
      let i = x950
      let n_i = n_1 + Int64::to_string(i)
      if avoid(n_i) {
        variant(@lib.add63(i, 1L))
      } else {
        n_i
      }
    }
    variant(0L)
  }
}

///|
/// `toString`
pub fn tostring_v3(x951 : String) -> String raise {
  let s = x951
  s
}

///|
/// `fromString`
pub fn fromstring(x952 : String) -> Name raise {
  let s = x952
  s
}

///|
/// `t`
pub type T6 = Name

///|
/// compare
fn step_8() -> Unit raise {
  compare_v11_c.set(compare_v10)
}

///|
let compare_v11_c : @lib.Cell[(Name) -> ((Name) -> Int64 raise) raise] = @lib.Cell::new(
  "compare",
)

///|
/// `compare`
pub fn compare_v11(x : Name) -> ((Name) -> Int64 raise) raise {
  compare_v11_c.get()(x)
}

///|
/// `key`
pub type Key2 = T6

///|
/// `t`
pub type T7[TA] = @omap.T[Key2, TA]

///|
/// `empty`
pub fn[TA, TB] empty_v5() -> @omap.T[TA, TB] {
  @omap.empty()
}

///|
/// `is_empty`
pub fn[TA, TB] is_empty_v3(x953 : @omap.T[TA, TB]) -> Bool raise {
  let m = x953
  @omap.is_empty(m)
}

///|
/// `mem`
pub fn[TA] mem_v3(x954 : String, x955 : @omap.T[String, TA]) -> Bool raise {
  let x = x954
  let m = x955
  @omap.mem(compare_v11, x, m)
}

///|
/// `add`
pub fn[TA] add_v6(
  x956 : String,
  x957 : TA,
  x958 : @omap.T[String, TA],
) -> @omap.T[Name, TA] raise {
  let x = x956
  let data = x957
  let m = x958
  @omap.add(compare_v11, x, data, m)
}

///|
/// `update`
pub fn[TA] update_v2(
  x959 : String,
  x960 : (TA?) -> TA? raise,
  x961 : @omap.T[String, TA],
) -> @omap.T[Name, TA] raise {
  let x = x959
  let f = x960
  let m = x961
  @omap.update(compare_v11, x, f, m)
}

///|
/// `singleton`
pub fn[TA, TB] singleton_v8(x962 : TA, x963 : TB) -> @omap.T[TA, TB] raise {
  let x = x962
  let d = x963
  @omap.singleton(x, d)
}

///|
/// `remove`
pub fn[TA] remove_v6(
  x964 : String,
  x965 : @omap.T[String, TA],
) -> @omap.T[Name, TA] raise {
  let x = x964
  let m = x965
  @omap.remove(compare_v11, x, m)
}

///|
/// `merge`
pub fn[TA, TB, TC] merge_v4(
  x966 : (String) -> ((TC?) -> ((TB?) -> TA? raise) raise) raise,
  x967 : @omap.T[String, TC],
  x968 : @omap.T[String, TB],
) -> @omap.T[Name, TA] raise {
  let f = x966
  let s1 = x967
  let s2 = x968
  @omap.merge(compare_v11, f, s1, s2)
}

///|
/// `union`
pub fn[TA] union_v8(
  x969 : (String) -> ((TA) -> ((TA) -> TA? raise) raise) raise,
  x970 : @omap.T[String, TA],
  x971 : @omap.T[String, TA],
) -> @omap.T[Name, TA] raise {
  let f = x969
  let s1 = x970
  let s2 = x971
  @omap.union(compare_v11, f, s1, s2)
}

///|
/// `compare`
pub fn[TA, TB] compare_v12(
  x972 : (TB) -> ((TA) -> Int64 raise) raise,
  x973 : @omap.T[String, TB],
  x974 : @omap.T[String, TA],
) -> Int64 raise {
  let cmp = x972
  let m1 = x973
  let m2 = x974
  @omap.compare(compare_v11, cmp, m1, m2)
}

///|
/// `equal`
pub fn[TA, TB] equal_v7(
  x975 : (TB) -> ((TA) -> Bool raise) raise,
  x976 : @omap.T[String, TB],
  x977 : @omap.T[String, TA],
) -> Bool raise {
  let cmp = x975
  let m1 = x976
  let m2 = x977
  @omap.equal(compare_v11, cmp, m1, m2)
}

///|
/// `iter`
pub fn[TA, TB, TC] iter_v3(
  x978 : (TC) -> ((TB) -> TA raise) raise,
  x979 : @omap.T[TC, TB],
) -> Unit raise {
  let f = x978
  let m = x979
  @omap.iter(f, m)
}

///|
/// `fold`
pub fn[TA, TB, TC] fold_v3(
  x980 : (TC) -> ((TB) -> ((TA) -> TA raise) raise) raise,
  x981 : @omap.T[TC, TB],
  x982 : TA,
) -> TA raise {
  let f = x980
  let m = x981
  let accu = x982
  @omap.fold(f, m, accu)
}

///|
/// `for_all`
pub fn[TA, TB] for_all_v3(
  x983 : (TB) -> ((TA) -> Bool raise) raise,
  x984 : @omap.T[TB, TA],
) -> Bool raise {
  let p = x983
  let m = x984
  @omap.for_all(p, m)
}

///|
/// `exists`
pub fn[TA, TB] exists_v8(
  x985 : (TB) -> ((TA) -> Bool raise) raise,
  x986 : @omap.T[TB, TA],
) -> Bool raise {
  let p = x985
  let m = x986
  @omap.exists(p, m)
}

///|
/// `filter`
pub fn[TA, TB] filter_v7(
  x987 : (TA) -> ((TB) -> Bool raise) raise,
  x988 : @omap.T[TA, TB],
) -> @omap.T[TA, TB] raise {
  let p = x987
  let m = x988
  @omap.filter(p, m)
}

///|
/// `filter_map`
pub fn[TA, TB, TC] filter_map_v3(
  x989 : (TA) -> ((TC) -> TB? raise) raise,
  x990 : @omap.T[TA, TC],
) -> @omap.T[TA, TB] raise {
  let f = x989
  let m = x990
  @omap.filter_map(f, m)
}

///|
/// `partition`
pub fn[TA, TB] partition_v5(
  x991 : (TA) -> ((TB) -> Bool raise) raise,
  x992 : @omap.T[TA, TB],
) -> (@omap.T[TA, TB], @omap.T[TA, TB]) raise {
  let p = x991
  let m = x992
  @omap.partition(p, m)
}

///|
/// `cardinal`
pub fn[TA, TB] cardinal_v3(x993 : @omap.T[TA, TB]) -> Int64 raise {
  let m = x993
  @omap.cardinal(m)
}

///|
/// `bindings`
pub fn[TA, TB] bindings_v2(
  x994 : @omap.T[TA, TB],
) -> @list.List[(TA, TB)] raise {
  let s = x994
  @omap.bindings(s)
}

///|
/// `min_binding`
pub fn[TA, TB] min_binding_v2(x995 : @omap.T[TA, TB]) -> (TA, TB) raise {
  let m = x995
  @omap.min_binding(m)
}

///|
/// `min_binding_opt`
pub fn[TA, TB] min_binding_opt_v2(x996 : @omap.T[TA, TB]) -> (TA, TB)? raise {
  let m = x996
  @omap.min_binding_opt(m)
}

///|
/// `max_binding`
pub fn[TA, TB] max_binding_v2(x997 : @omap.T[TA, TB]) -> (TA, TB) raise {
  let m = x997
  @omap.max_binding(m)
}

///|
/// `max_binding_opt`
pub fn[TA, TB] max_binding_opt_v2(x998 : @omap.T[TA, TB]) -> (TA, TB)? raise {
  let m = x998
  @omap.max_binding_opt(m)
}

///|
/// `choose`
pub fn[TA, TB] choose_v3(x999 : @omap.T[TA, TB]) -> (TA, TB) raise {
  let m = x999
  @omap.choose(m)
}

///|
/// `choose_opt`
pub fn[TA, TB] choose_opt_v3(x1000 : @omap.T[TA, TB]) -> (TA, TB)? raise {
  let m = x1000
  @omap.choose_opt(m)
}

///|
/// `split`
pub fn[TA] split_v3(
  x1001 : String,
  x1002 : @omap.T[String, TA],
) -> (@omap.T[Name, TA], TA?, @omap.T[Name, TA]) raise {
  let x = x1001
  let m = x1002
  @omap.split(compare_v11, x, m)
}

///|
/// `find`
pub fn[TA] find_v4(x1003 : String, x1004 : @omap.T[String, TA]) -> TA raise {
  let x = x1003
  let m = x1004
  @omap.find(compare_v11, x, m)
}

///|
/// `find_opt`
pub fn[TA] find_opt_v3(
  x1005 : String,
  x1006 : @omap.T[String, TA],
) -> TA? raise {
  let x = x1005
  let m = x1006
  @omap.find_opt(compare_v11, x, m)
}

///|
/// `find_first`
pub fn[TA, TB] find_first_v3(
  x1007 : (TA) -> Bool raise,
  x1008 : @omap.T[TA, TB],
) -> (TA, TB) raise {
  let f = x1007
  let m = x1008
  @omap.find_first(f, m)
}

///|
/// `find_first_opt`
pub fn[TA, TB] find_first_opt_v3(
  x1009 : (TA) -> Bool raise,
  x1010 : @omap.T[TA, TB],
) -> (TA, TB)? raise {
  let f = x1009
  let m = x1010
  @omap.find_first_opt(f, m)
}

///|
/// `find_last`
pub fn[TA, TB] find_last_v3(
  x1011 : (TA) -> Bool raise,
  x1012 : @omap.T[TA, TB],
) -> (TA, TB) raise {
  let f = x1011
  let m = x1012
  @omap.find_last(f, m)
}

///|
/// `find_last_opt`
pub fn[TA, TB] find_last_opt_v3(
  x1013 : (TA) -> Bool raise,
  x1014 : @omap.T[TA, TB],
) -> (TA, TB)? raise {
  let f = x1013
  let m = x1014
  @omap.find_last_opt(f, m)
}

///|
/// `map`
pub fn[TA, TB, TC] map_v5(
  x1015 : (TC) -> TB raise,
  x1016 : @omap.T[TA, TC],
) -> @omap.T[TA, TB] raise {
  let f = x1015
  let m = x1016
  @omap.map(f, m)
}

///|
/// `mapi`
pub fn[TA, TB, TC] mapi_v2(
  x1017 : (TA) -> ((TC) -> TB raise) raise,
  x1018 : @omap.T[TA, TC],
) -> @omap.T[TA, TB] raise {
  let f = x1017
  let m = x1018
  @omap.mapi(f, m)
}

///|
/// `map`
pub type Map4[TA] = T7[TA]

///|
/// `newMap`
pub fn[TA, TB] newmap_v3(x1019 : Unit) -> @omap.T[TA, TB] raise {
  let _ = x1019
  empty_v5()
}

///|
/// `null`
pub fn[TA, TB] null_v7(x : @omap.T[TA, TB]) -> Bool raise {
  let f : (@omap.T[TA, TB]) -> Bool raise = is_empty_v3
  f(x)
}

///|
/// `singleton`
pub fn[TA, TB] singleton_v9(x1020 : TA, x1021 : TB) -> @omap.T[TA, TB] raise {
  let (k, x) = (x1020, x1021)
  singleton_v8(k, x)
}

///|
/// `size`
pub fn[TA, TB] size_v6(x : @omap.T[TA, TB]) -> Int64 raise {
  let f : (@omap.T[TA, TB]) -> Int64 raise = cardinal_v3
  f(x)
}

///|
/// `get`
pub fn[TA] get_v3(x1022 : @omap.T[String, TA], x1023 : String) -> TA raise {
  let m = x1022
  let k = x1023
  find_v4(k, m) catch {
    @lib.NotFound => raise Failure("Mmap.get: element not found")
    e => raise e
  }
}

///|
/// `peek`
pub fn[TA] peek_v4(x1024 : @omap.T[String, TA], x1025 : String) -> TA? raise {
  let m = x1024
  let k = x1025
  Some(find_v4(k, m)) catch {
    @lib.NotFound => None
    e => raise e
  }
}

///|
/// `insert`
pub fn[TA] insert_v3(
  x1026 : @omap.T[String, TA],
  x1027 : (String, TA),
) -> @omap.T[Name, TA] raise {
  let m = x1026
  let (k, v) = x1027
  add_v6(k, v, m)
}

///|
/// `toList`
pub fn[TA, TB] tolist_v6(x : @omap.T[TA, TB]) -> @list.List[(TA, TB)] raise {
  let f : (@omap.T[TA, TB]) -> @list.List[(TA, TB)] raise = bindings_v2
  f(x)
}

///|
/// `fromList`
pub fn[TA] fromlist_v5(
  x1028 : @list.List[(String, TA)],
) -> @omap.T[Name, TA] raise {
  let l = x1028
  @lib.itlist(
    fn(
      x1029 : (String, TA),
      x1030 : @omap.T[String, TA],
    ) -> @omap.T[String, TA] raise {
      let (v, tm) = x1029
      ((x1031 : @omap.T[String, TA]) => add_v6(v, tm, x1031))(x1030)
    },
    l,
    empty_v5(),
  )
}

///|
/// `foldl`
pub fn[TA, TB, TC] foldl_v6(
  x1032 : ((TB, TC, TA)) -> TA raise,
  x1033 : TA,
  x1034 : @omap.T[TB, TC],
) -> TA raise {
  let f = x1032
  let b = x1033
  let m = x1034
  @lib.fold_left(
    fn(x1035 : TA, x1036 : (TB, TC)) -> TA raise {
      let s = x1035
      let (v, tm) = x1036
      f((v, tm, s))
    },
    b,
    bindings_v2(m),
  )
}

///|
/// `foldr`
pub fn[TA, TB, TC] foldr_v6(
  x : ((TB, TC, TA)) -> TA raise,
) -> ((TA) -> ((@omap.T[TB, TC]) -> TA raise) raise) raise {
  let f : (((TB, TC, TA)) -> TA raise) -> ((TA) -> ((@omap.T[TB, TC]) -> TA raise) raise) raise = x1037 => {
    x1038 => x1039 => foldl_v6(x1037, x1038, x1039)
  }
  f(x)
}

///|
/// `filter`
pub fn[TA, TB] filter_v8(
  x1040 : ((TA, TB)) -> Bool raise,
) -> ((@omap.T[TA, TB]) -> @omap.T[TA, TB] raise) raise {
  let f = x1040
  (x1044 : @omap.T[TA, TB]) => {
    filter_v7(
      fn(x1042 : TA) -> ((TB) -> Bool raise) raise {
        let x = x1042
        fn(x1043 : TB) -> Bool raise {
          let y = x1043
          f((x, y))
        }
      },
      x1044,
    )
  }
}

///|
/// `inDomain`
pub fn[TA] indomain_v3(x : Name) -> ((@omap.T[Name, TA]) -> Bool raise) raise {
  let f : (Name) -> ((@omap.T[Name, TA]) -> Bool raise) raise = (x1045 : String) => {
    x1046 => mem_v3(x1045, x1046)
  }
  f(x)
}

///|
/// `union`
pub fn[TA] union_v9(
  x1047 : (((String, TA), (String, TA))) -> TA? raise,
  x1048 : @omap.T[String, TA],
  x1049 : @omap.T[String, TA],
) -> @omap.T[Name, TA] raise {
  let f = x1047
  let m1 = x1048
  let m2 = x1049
  let f_p : (String) -> (((TA?, TA?)) -> TA? raise) raise = fn(
    x1050 : String,
  ) -> (((TA?, TA?)) -> TA? raise) raise {
    let k = x1050
    fn(x1051 : (TA?, TA?)) -> TA? raise {
      match x1051 {
        (Some(x), Some(y)) => f(((k, x), (k, y)))
        (Some(x_1), None) => Some(x_1)
        (None, Some(y_1)) => Some(y_1)
        (None, None) => None
      }
    }
  }
  merge_v4(
    fn(x1052 : String) -> ((TA?) -> ((TA?) -> TA? raise) raise) raise {
      let k_1 = x1052
      fn(x1053 : TA?) -> ((TA?) -> TA? raise) raise {
        let x_2 = x1053
        fn(x1054 : TA?) -> TA? raise {
          let y_2 = x1054
          f_p(k_1)((x_2, y_2))
        }
      }
    },
    m1,
    m2,
  )
}

///|
/// `delete`
pub fn[TA] delete_v5(
  x1055 : @omap.T[String, TA],
  x1056 : String,
) -> @omap.T[Name, TA] raise {
  let m = x1055
  let k = x1056
  remove_v6(k, m)
}

///|
/// `mapPartial`
pub fn[TA, TB] mappartial_v4(
  x1057 : ((String, TB)) -> TA? raise,
  x1058 : @omap.T[String, TB],
) -> @omap.T[Name, TA] raise {
  let f = x1057
  let m = x1058
  fold_v3(
    fn(
      x1059 : String,
    ) -> ((TB) -> ((@omap.T[String, TA]) -> @omap.T[String, TA] raise) raise) raise {
      let k = x1059
      fn(
        x1060 : TB,
      ) -> ((@omap.T[String, TA]) -> @omap.T[String, TA] raise) raise {
        let x = x1060
        fn(x1061 : @omap.T[String, TA]) -> @omap.T[String, TA] raise {
          let acc = x1061
          match f((k, x)) {
            Some(y) => add_v6(k, y, acc)
            None => acc
          }
        }
      }
    },
    m,
    empty_v5(),
  )
}

///|
/// `transform`
pub fn[TA, TB, TC] transform_v5(
  x : (TC) -> TB raise,
) -> ((@omap.T[TA, TC]) -> @omap.T[TA, TB] raise) raise {
  let f : ((TC) -> TB raise) -> ((@omap.T[TA, TC]) -> @omap.T[TA, TB] raise) raise = x1062 => {
    x1063 => map_v5(x1062, x1063)
  }
  f(x)
}

///|
/// `exists`
pub fn[TA, TB] exists_v9(
  x1064 : ((TA, TB)) -> Bool raise,
) -> ((@omap.T[TA, TB]) -> Bool raise) raise {
  let f = x1064
  (x1068 : @omap.T[TA, TB]) => {
    exists_v8(
      fn(x1066 : TA) -> ((TB) -> Bool raise) raise {
        let k = x1066
        fn(x1067 : TB) -> Bool raise {
          let m = x1067
          f((k, m))
        }
      },
      x1068,
    )
  }
}

///|
/// `elt`
pub type Elt1 = T6

///|
/// `t`
pub type T8 = @oset.T[Elt1]

///|
/// `empty`
pub fn[TA] empty_v6() -> @oset.T[TA] {
  @oset.empty()
}

///|
/// `is_empty`
pub fn[TA] is_empty_v4(x1069 : @oset.T[TA]) -> Bool raise {
  let s = x1069
  @oset.is_empty(s)
}

///|
/// `mem`
pub fn mem_v4(x1070 : String, x1071 : @oset.T[String]) -> Bool raise {
  let x = x1070
  let s = x1071
  @oset.mem(compare_v11, x, s)
}

///|
/// `add`
pub fn add_v7(x1072 : String, x1073 : @oset.T[String]) -> @oset.T[Name] raise {
  let x = x1072
  let s = x1073
  @oset.add(compare_v11, x, s)
}

///|
/// `singleton`
pub fn[TA] singleton_v10(x1074 : TA) -> @oset.T[TA] raise {
  let x = x1074
  @oset.singleton(x)
}

///|
/// `remove`
pub fn remove_v7(
  x1075 : String,
  x1076 : @oset.T[String],
) -> @oset.T[Name] raise {
  let x = x1075
  let s = x1076
  @oset.remove(compare_v11, x, s)
}

///|
/// `union`
pub fn union_v10(
  x1077 : @oset.T[String],
  x1078 : @oset.T[String],
) -> @oset.T[Name] raise {
  let s1 = x1077
  let s2 = x1078
  @oset.union(compare_v11, s1, s2)
}

///|
/// `inter`
pub fn inter_v1(
  x1079 : @oset.T[String],
  x1080 : @oset.T[String],
) -> @oset.T[Name] raise {
  let s1 = x1079
  let s2 = x1080
  @oset.inter(compare_v11, s1, s2)
}

///|
/// `disjoint`
pub fn disjoint_v2(
  x1081 : @oset.T[String],
  x1082 : @oset.T[String],
) -> Bool raise {
  let s1 = x1081
  let s2 = x1082
  @oset.disjoint(compare_v11, s1, s2)
}

///|
/// `diff`
pub fn diff_v1(
  x1083 : @oset.T[String],
  x1084 : @oset.T[String],
) -> @oset.T[Name] raise {
  let s1 = x1083
  let s2 = x1084
  @oset.diff(compare_v11, s1, s2)
}

///|
/// `compare`
pub fn compare_v13(
  x1085 : @oset.T[String],
  x1086 : @oset.T[String],
) -> Int64 raise {
  let s1 = x1085
  let s2 = x1086
  @oset.compare(compare_v11, s1, s2)
}

///|
/// `equal`
pub fn equal_v8(x1087 : @oset.T[String], x1088 : @oset.T[String]) -> Bool raise {
  let s1 = x1087
  let s2 = x1088
  @oset.equal(compare_v11, s1, s2)
}

///|
/// `subset`
pub fn subset_v3(
  x1089 : @oset.T[String],
  x1090 : @oset.T[String],
) -> Bool raise {
  let s1 = x1089
  let s2 = x1090
  @oset.subset(compare_v11, s1, s2)
}

///|
/// `iter`
pub fn[TA, TB] iter_v4(
  x1091 : (TB) -> TA raise,
  x1092 : @oset.T[TB],
) -> Unit raise {
  let f = x1091
  let s = x1092
  @oset.iter(f, s)
}

///|
/// `map`
pub fn map_v6(
  x1093 : (String) -> String raise,
  x1094 : @oset.T[String],
) -> @oset.T[Name] raise {
  let f = x1093
  let s = x1094
  @oset.map(compare_v11, f, s)
}

///|
/// `fold`
pub fn[TA, TB] fold_v4(
  x1095 : (TB) -> ((TA) -> TA raise) raise,
  x1096 : @oset.T[TB],
  x1097 : TA,
) -> TA raise {
  let f = x1095
  let s = x1096
  let accu = x1097
  @oset.fold(f, s, accu)
}

///|
/// `for_all`
pub fn[TA] for_all_v4(
  x1098 : (TA) -> Bool raise,
  x1099 : @oset.T[TA],
) -> Bool raise {
  let p = x1098
  let s = x1099
  @oset.for_all(p, s)
}

///|
/// `exists`
pub fn[TA] exists_v10(
  x1100 : (TA) -> Bool raise,
  x1101 : @oset.T[TA],
) -> Bool raise {
  let p = x1100
  let s = x1101
  @oset.exists(p, s)
}

///|
/// `filter`
pub fn[TA] filter_v9(
  x1102 : (TA) -> Bool raise,
  x1103 : @oset.T[TA],
) -> @oset.T[TA] raise {
  let p = x1102
  let s = x1103
  @oset.filter(p, s)
}

///|
/// `filter_map`
pub fn filter_map_v4(
  x1104 : (String) -> String? raise,
  x1105 : @oset.T[String],
) -> @oset.T[Name] raise {
  let f = x1104
  let s = x1105
  @oset.filter_map(compare_v11, f, s)
}

///|
/// `partition`
pub fn[TA] partition_v6(
  x1106 : (TA) -> Bool raise,
  x1107 : @oset.T[TA],
) -> (@oset.T[TA], @oset.T[TA]) raise {
  let p = x1106
  let s = x1107
  @oset.partition(p, s)
}

///|
/// `cardinal`
pub fn[TA] cardinal_v4(x1108 : @oset.T[TA]) -> Int64 raise {
  let s = x1108
  @oset.cardinal(s)
}

///|
/// `elements`
pub fn[TA] elements_v1(x1109 : @oset.T[TA]) -> @list.List[TA] raise {
  let s = x1109
  @oset.elements(s)
}

///|
/// `min_elt`
pub fn[TA] min_elt_v1(x1110 : @oset.T[TA]) -> TA raise {
  let s = x1110
  @oset.min_elt(s)
}

///|
/// `min_elt_opt`
pub fn[TA] min_elt_opt_v1(x1111 : @oset.T[TA]) -> TA? raise {
  let s = x1111
  @oset.min_elt_opt(s)
}

///|
/// `max_elt`
pub fn[TA] max_elt_v1(x1112 : @oset.T[TA]) -> TA raise {
  let s = x1112
  @oset.max_elt(s)
}

///|
/// `max_elt_opt`
pub fn[TA] max_elt_opt_v1(x1113 : @oset.T[TA]) -> TA? raise {
  let s = x1113
  @oset.max_elt_opt(s)
}

///|
/// `choose`
pub fn[TA] choose_v4(x1114 : @oset.T[TA]) -> TA raise {
  let s = x1114
  @oset.choose(s)
}

///|
/// `choose_opt`
pub fn[TA] choose_opt_v4(x1115 : @oset.T[TA]) -> TA? raise {
  let s = x1115
  @oset.choose_opt(s)
}

///|
/// `split`
pub fn split_v4(
  x1116 : String,
  x1117 : @oset.T[String],
) -> (@oset.T[Name], Bool, @oset.T[Name]) raise {
  let x = x1116
  let s = x1117
  @oset.split(compare_v11, x, s)
}

///|
/// `find`
pub fn find_v5(x1118 : String, x1119 : @oset.T[String]) -> Name raise {
  let x = x1118
  let s = x1119
  @oset.find(compare_v11, x, s)
}

///|
/// `find_opt`
pub fn find_opt_v4(x1120 : String, x1121 : @oset.T[String]) -> Name? raise {
  let x = x1120
  let s = x1121
  @oset.find_opt(compare_v11, x, s)
}

///|
/// `find_first`
pub fn[TA] find_first_v4(
  x1122 : (TA) -> Bool raise,
  x1123 : @oset.T[TA],
) -> TA raise {
  let f = x1122
  let s = x1123
  @oset.find_first(f, s)
}

///|
/// `find_first_opt`
pub fn[TA] find_first_opt_v4(
  x1124 : (TA) -> Bool raise,
  x1125 : @oset.T[TA],
) -> TA? raise {
  let f = x1124
  let s = x1125
  @oset.find_first_opt(f, s)
}

///|
/// `find_last`
pub fn[TA] find_last_v4(
  x1126 : (TA) -> Bool raise,
  x1127 : @oset.T[TA],
) -> TA raise {
  let f = x1126
  let s = x1127
  @oset.find_last(f, s)
}

///|
/// `find_last_opt`
pub fn[TA] find_last_opt_v4(
  x1128 : (TA) -> Bool raise,
  x1129 : @oset.T[TA],
) -> TA? raise {
  let f = x1128
  let s = x1129
  @oset.find_last_opt(f, s)
}

///|
/// `set`
pub type Set2 = T8

///|
/// compare
fn step_9() -> Unit raise {
  compare_v14_c.set(fn(
    x1130 : @oset.T[String],
  ) -> ((@oset.T[String]) -> Int64 raise) raise {
    fn(x1131 : @oset.T[String]) -> Int64 raise { compare_v13(x1130, x1131) }
  })
}

///|
let compare_v14_c : @lib.Cell[
  (@oset.T[Name]) -> ((@oset.T[Name]) -> Int64 raise) raise,
] = @lib.Cell::new("compare")

///|
/// `compare`
pub fn compare_v14(x : @oset.T[Name]) -> ((@oset.T[Name]) -> Int64 raise) raise {
  compare_v14_c.get()(x)
}

///|
/// `add`
pub fn add_v8(x1132 : @oset.T[String], x1133 : String) -> @oset.T[Name] raise {
  let s = x1132
  let x = x1133
  add_v7(x, s)
}

///|
/// `foldr`
pub fn[TA, TB] foldr_v7(
  x1134 : ((TB, TA)) -> TA raise,
  x1135 : TA,
  x1136 : @oset.T[TB],
) -> TA raise {
  let f = x1134
  let a = x1135
  let s = x1136
  fold_v4(
    fn(x1137 : TB) -> ((TA) -> TA raise) raise {
      let x = x1137
      fn(x1138 : TA) -> TA raise {
        let acc = x1138
        f((x, acc))
      }
    },
    s,
    a,
  )
}

///|
/// `foldl`
pub fn[TA, TB] foldl_v7(
  x : ((TB, TA)) -> TA raise,
) -> ((TA) -> ((@oset.T[TB]) -> TA raise) raise) raise {
  let f : (((TB, TA)) -> TA raise) -> ((TA) -> ((@oset.T[TB]) -> TA raise) raise) raise = x1139 => {
    x1140 => x1141 => foldr_v7(x1139, x1140, x1141)
  }
  f(x)
}

///|
/// member
fn step_10() -> Unit raise {
  member_v2_c.set(fn(
    x1142 : String,
  ) -> ((@oset.T[String]) -> Bool raise) raise {
    fn(x1143 : @oset.T[String]) -> Bool raise { mem_v4(x1142, x1143) }
  })
}

///|
let member_v2_c : @lib.Cell[(Name) -> ((@oset.T[Name]) -> Bool raise) raise] = @lib.Cell::new(
  "member",
)

///|
/// `member`
pub fn member_v2(x : Name) -> ((@oset.T[Name]) -> Bool raise) raise {
  member_v2_c.get()(x)
}

///|
/// `empty`
pub fn[TA] empty_v7() -> @oset.T[TA] {
  empty_v6()
}

///|
/// union
fn step_11() -> Unit raise {
  union_v11_c.set(fn(
    x1144 : @oset.T[String],
  ) -> ((@oset.T[String]) -> @oset.T[String] raise) raise {
    fn(x1145 : @oset.T[String]) -> @oset.T[String] raise {
      union_v10(x1144, x1145)
    }
  })
}

///|
let union_v11_c : @lib.Cell[
  (@oset.T[Name]) -> ((@oset.T[Name]) -> @oset.T[Name] raise) raise,
] = @lib.Cell::new("union")

///|
/// `union`
pub fn union_v11(
  x : @oset.T[Name],
) -> ((@oset.T[Name]) -> @oset.T[Name] raise) raise {
  union_v11_c.get()(x)
}

///|
/// difference
fn step_12() -> Unit raise {
  difference_v2_c.set(fn(
    x1146 : @oset.T[String],
  ) -> ((@oset.T[String]) -> @oset.T[String] raise) raise {
    fn(x1147 : @oset.T[String]) -> @oset.T[String] raise {
      diff_v1(x1146, x1147)
    }
  })
}

///|
let difference_v2_c : @lib.Cell[
  (@oset.T[Name]) -> ((@oset.T[Name]) -> @oset.T[Name] raise) raise,
] = @lib.Cell::new("difference")

///|
/// `difference`
pub fn difference_v2(
  x : @oset.T[Name],
) -> ((@oset.T[Name]) -> @oset.T[Name] raise) raise {
  difference_v2_c.get()(x)
}

///|
/// `toList`
pub fn[TA] tolist_v7(x : @oset.T[TA]) -> @list.List[TA] raise {
  let f : (@oset.T[TA]) -> @list.List[TA] raise = elements_v1
  f(x)
}

///|
/// `singleton`
pub fn[TA] singleton_v11(x : TA) -> @oset.T[TA] raise {
  let f : (TA) -> @oset.T[TA] raise = singleton_v10
  f(x)
}

///|
/// `null`
pub fn[TA] null_v8(x : @oset.T[TA]) -> Bool raise {
  let f : (@oset.T[TA]) -> Bool raise = is_empty_v4
  f(x)
}

///|
/// `size`
pub fn[TA] size_v7(x : @oset.T[TA]) -> Int64 raise {
  let f : (@oset.T[TA]) -> Int64 raise = cardinal_v4
  f(x)
}

///|
/// `pick`
pub fn[TA] pick_v3(x : @oset.T[TA]) -> TA raise {
  let f : (@oset.T[TA]) -> TA raise = choose_v4
  f(x)
}

///|
/// equal
fn step_13() -> Unit raise {
  equal_v9_c.set(fn(
    x1148 : @oset.T[String],
  ) -> ((@oset.T[String]) -> Bool raise) raise {
    fn(x1149 : @oset.T[String]) -> Bool raise { equal_v8(x1148, x1149) }
  })
}

///|
let equal_v9_c : @lib.Cell[
  (@oset.T[Name]) -> ((@oset.T[Name]) -> Bool raise) raise,
] = @lib.Cell::new("equal")

///|
/// `equal`
pub fn equal_v9(x : @oset.T[Name]) -> ((@oset.T[Name]) -> Bool raise) raise {
  equal_v9_c.get()(x)
}

///|
/// `exists`
pub fn[TA] exists_v11(
  x : (TA) -> Bool raise,
) -> ((@oset.T[TA]) -> Bool raise) raise {
  let f : ((TA) -> Bool raise) -> ((@oset.T[TA]) -> Bool raise) raise = x1150 => {
    x1151 => exists_v10(x1150, x1151)
  }
  f(x)
}

///|
/// `fromList`
pub fn fromlist_v6(x1152 : @list.List[String]) -> @oset.T[Name] raise {
  let l = x1152
  @lib.itlist(add_v7, l, empty_v6())
}

///|
/// `delete`
pub fn delete_v6(
  x1153 : @oset.T[String],
  x1154 : String,
) -> @oset.T[Name] raise {
  let s = x1153
  let x = x1154
  remove_v7(x, s)
}

///|
/// subset
fn step_14() -> Unit raise {
  subset_v4_c.set(fn(
    x1155 : @oset.T[String],
  ) -> ((@oset.T[String]) -> Bool raise) raise {
    fn(x1156 : @oset.T[String]) -> Bool raise { subset_v3(x1155, x1156) }
  })
}

///|
let subset_v4_c : @lib.Cell[
  (@oset.T[Name]) -> ((@oset.T[Name]) -> Bool raise) raise,
] = @lib.Cell::new("subset")

///|
/// `subset`
pub fn subset_v4(x : @oset.T[Name]) -> ((@oset.T[Name]) -> Bool raise) raise {
  subset_v4_c.get()(x)
}

///|
/// intersect
fn step_15() -> Unit raise {
  intersect_v3_c.set(fn(
    x1157 : @oset.T[String],
  ) -> ((@oset.T[String]) -> @oset.T[String] raise) raise {
    fn(x1158 : @oset.T[String]) -> @oset.T[String] raise {
      inter_v1(x1157, x1158)
    }
  })
}

///|
let intersect_v3_c : @lib.Cell[
  (@oset.T[Name]) -> ((@oset.T[Name]) -> @oset.T[Name] raise) raise,
] = @lib.Cell::new("intersect")

///|
/// `intersect`
pub fn intersect_v3(
  x : @oset.T[Name],
) -> ((@oset.T[Name]) -> @oset.T[Name] raise) raise {
  intersect_v3_c.get()(x)
}

///|
/// `intersectList`
pub fn intersectlist_v2(
  x1159 : @list.List[@oset.T[String]],
) -> @oset.T[Name] raise {
  match x1159 {
    Empty => empty_v6()
    More(s, tail=ss) => @lib.itlist(inter_v1, ss, s)
  }
}

///|
/// `findl`
pub fn[TA] findl_v3(
  x1160 : (TA) -> Bool raise,
  x1161 : @oset.T[TA],
) -> TA? raise {
  let p = x1160
  let s = x1161
  let go : (TA) -> ((TA?) -> TA? raise) raise = fn(
    x1162 : TA,
  ) -> ((TA?) -> TA? raise) raise {
    let x = x1162
    fn(x1163 : TA?) -> TA? raise {
      match x1163 {
        Some(_) as s_1 => s_1
        None => if p(x) { Some(x) } else { None }
      }
    }
  }
  fold_v4(go, s, None)
}

///|
/// `firstl`
pub fn[TA, TB] firstl_v3(
  x1164 : (TB) -> TA? raise,
  x1165 : @oset.T[TB],
) -> TA? raise {
  let f = x1164
  let s = x1165
  let go : (TB) -> ((TA?) -> TA? raise) raise = fn(
    x1166 : TB,
  ) -> ((TA?) -> TA? raise) raise {
    let x = x1166
    fn(x1167 : TA?) -> TA? raise {
      match x1167 {
        Some(_) as s_1 => s_1
        None => f(x)
      }
    }
  }
  fold_v4(go, s, None)
}

///|
/// `transform`
pub fn[TA, TB] transform_v6(
  x1168 : (TB) -> TA raise,
  x1169 : @oset.T[TB],
) -> @list.List[TA] raise {
  let f = x1168
  let s = x1169
  fold_v4(
    fn(x1170 : TB) -> ((@list.List[TA]) -> @list.List[TA] raise) raise {
      let x = x1170
      fn(x1171 : @list.List[TA]) -> @list.List[TA] raise {
        let acc = x1171
        acc.prepend(f(x))
      }
    },
    s,
    @list.List([]),
  )
}

///|
/// `all`
pub fn[TA] all_v3(
  x : (TA) -> Bool raise,
) -> ((@oset.T[TA]) -> Bool raise) raise {
  let f : ((TA) -> Bool raise) -> ((@oset.T[TA]) -> Bool raise) raise = x1172 => {
    x1173 => for_all_v4(x1172, x1173)
  }
  f(x)
}

///|
/// `count`
pub fn[TA] count_v3(
  x1174 : (TA) -> Bool raise,
  x1175 : @oset.T[TA],
) -> Int64 raise {
  let p = x1174
  let s = x1175
  fold_v4(
    fn(x1176 : TA) -> ((Int64) -> Int64 raise) raise {
      let x = x1176
      fn(x1177 : Int64) -> Int64 raise {
        let c = x1177
        if p(x) {
          @lib.add63(c, 1L)
        } else {
          c
        }
      }
    },
    s,
    0L,
  )
}

///|
/// `nameArity`
pub type NameArity = (Name, Int64)

///|
/// `name`
pub fn name(x1178 : String, x1179 : Int64) -> Name raise {
  let (n, _) = (x1178, x1179)
  n
}

///|
/// `arity`
pub fn arity(x1180 : String, x1181 : Int64) -> Int64 raise {
  let (_, i) = (x1180, x1181)
  i
}

///|
/// `nary`
pub fn nary(x1182 : Int64, x1183 : (String, Int64)) -> Bool raise {
  let i = x1182
  let n_i = x1183
  arity(n_i.0, n_i.1) == i
}

///|
/// nullary
fn step_16() -> Unit raise {
  nullary_c.set((x1184 : (String, Int64)) => nary(0L, x1184))
}

///|
let nullary_c : @lib.Cell[(NameArity) -> Bool raise] = @lib.Cell::new("nullary")

///|
/// `nullary`
pub fn nullary(x : NameArity) -> Bool raise {
  nullary_c.get()(x)
}

///|
/// unary
fn step_17() -> Unit raise {
  unary_c.set((x1185 : (String, Int64)) => nary(1L, x1185))
}

///|
let unary_c : @lib.Cell[(NameArity) -> Bool raise] = @lib.Cell::new("unary")

///|
/// `unary`
pub fn unary(x : NameArity) -> Bool raise {
  unary_c.get()(x)
}

///|
/// binary
fn step_18() -> Unit raise {
  binary_c.set((x1186 : (String, Int64)) => nary(2L, x1186))
}

///|
let binary_c : @lib.Cell[(NameArity) -> Bool raise] = @lib.Cell::new("binary")

///|
/// `binary`
pub fn binary(x : NameArity) -> Bool raise {
  binary_c.get()(x)
}

///|
/// ternary
fn step_19() -> Unit raise {
  ternary_c.set((x1187 : (String, Int64)) => nary(3L, x1187))
}

///|
let ternary_c : @lib.Cell[(NameArity) -> Bool raise] = @lib.Cell::new("ternary")

///|
/// `ternary`
pub fn ternary(x : NameArity) -> Bool raise {
  ternary_c.get()(x)
}

///|
/// `compare`
pub fn compare_v15(
  x1188 : (String, Int64),
  x1189 : (String, Int64),
) -> Int64 raise {
  let (n1, i1) = x1188
  let (n2, i2) = x1189
  let c = compare_v10(n1)(n2)
  if c != 0L {
    c
  } else {
    intcompare(i1, i2)
  }
}

///|
/// `equal`
pub fn[
  TA : Eq + @lib.OCompare + @lib.OHash,
  TB : Eq + @lib.OCompare + @lib.OHash,
] equal_v10(
  x1190 : (TA, TB),
  x1191 : (TA, TB),
) -> Bool raise {
  let (n1, i1) = x1190
  let (n2, i2) = x1191
  i1 == i2 && equal_v6(n1, n2)
}

///|
/// `t`
pub type T9 = NameArity

///|
/// compare
fn step_20() -> Unit raise {
  compare_v16_c.set(fn(
    x1192 : (String, Int64),
  ) -> (((String, Int64)) -> Int64 raise) raise {
    fn(x1193 : (String, Int64)) -> Int64 raise { compare_v15(x1192, x1193) }
  })
}

///|
let compare_v16_c : @lib.Cell[
  ((Name, Int64)) -> (((Name, Int64)) -> Int64 raise) raise,
] = @lib.Cell::new("compare")

///|
/// `compare`
pub fn compare_v16(x : (Name, Int64)) -> (((Name, Int64)) -> Int64 raise) raise {
  compare_v16_c.get()(x)
}

///|
/// `key`
pub type Key3 = T9

///|
/// `t`
pub type T10[TA] = @omap.T[Key3, TA]

///|
/// `empty`
pub fn[TA, TB] empty_v8() -> @omap.T[TA, TB] {
  @omap.empty()
}

///|
/// `is_empty`
pub fn[TA, TB] is_empty_v5(x1194 : @omap.T[TA, TB]) -> Bool raise {
  let m = x1194
  @omap.is_empty(m)
}

///|
/// `mem`
pub fn[TA] mem_v5(
  x1195 : (String, Int64),
  x1196 : @omap.T[(String, Int64), TA],
) -> Bool raise {
  let x = x1195
  let m = x1196
  @omap.mem(compare_v16, x, m)
}

///|
/// `add`
pub fn[TA] add_v9(
  x1197 : (String, Int64),
  x1198 : TA,
  x1199 : @omap.T[(String, Int64), TA],
) -> @omap.T[(Name, Int64), TA] raise {
  let x = x1197
  let data = x1198
  let m = x1199
  @omap.add(compare_v16, x, data, m)
}

///|
/// `update`
pub fn[TA] update_v3(
  x1200 : (String, Int64),
  x1201 : (TA?) -> TA? raise,
  x1202 : @omap.T[(String, Int64), TA],
) -> @omap.T[(Name, Int64), TA] raise {
  let x = x1200
  let f = x1201
  let m = x1202
  @omap.update(compare_v16, x, f, m)
}

///|
/// `singleton`
pub fn[TA, TB] singleton_v12(x1203 : TA, x1204 : TB) -> @omap.T[TA, TB] raise {
  let x = x1203
  let d = x1204
  @omap.singleton(x, d)
}

///|
/// `remove`
pub fn[TA] remove_v8(
  x1205 : (String, Int64),
  x1206 : @omap.T[(String, Int64), TA],
) -> @omap.T[(Name, Int64), TA] raise {
  let x = x1205
  let m = x1206
  @omap.remove(compare_v16, x, m)
}

///|
/// `merge`
pub fn[TA, TB, TC] merge_v5(
  x1207 : ((String, Int64)) -> ((TC?) -> ((TB?) -> TA? raise) raise) raise,
  x1208 : @omap.T[(String, Int64), TC],
  x1209 : @omap.T[(String, Int64), TB],
) -> @omap.T[(Name, Int64), TA] raise {
  let f = x1207
  let s1 = x1208
  let s2 = x1209
  @omap.merge(compare_v16, f, s1, s2)
}

///|
/// `union`
pub fn[TA] union_v12(
  x1210 : ((String, Int64)) -> ((TA) -> ((TA) -> TA? raise) raise) raise,
  x1211 : @omap.T[(String, Int64), TA],
  x1212 : @omap.T[(String, Int64), TA],
) -> @omap.T[(Name, Int64), TA] raise {
  let f = x1210
  let s1 = x1211
  let s2 = x1212
  @omap.union(compare_v16, f, s1, s2)
}

///|
/// `compare`
pub fn[TA, TB] compare_v17(
  x1213 : (TB) -> ((TA) -> Int64 raise) raise,
  x1214 : @omap.T[(String, Int64), TB],
  x1215 : @omap.T[(String, Int64), TA],
) -> Int64 raise {
  let cmp = x1213
  let m1 = x1214
  let m2 = x1215
  @omap.compare(compare_v16, cmp, m1, m2)
}

///|
/// `equal`
pub fn[TA, TB] equal_v11(
  x1216 : (TB) -> ((TA) -> Bool raise) raise,
  x1217 : @omap.T[(String, Int64), TB],
  x1218 : @omap.T[(String, Int64), TA],
) -> Bool raise {
  let cmp = x1216
  let m1 = x1217
  let m2 = x1218
  @omap.equal(compare_v16, cmp, m1, m2)
}

///|
/// `iter`
pub fn[TA, TB, TC] iter_v5(
  x1219 : (TC) -> ((TB) -> TA raise) raise,
  x1220 : @omap.T[TC, TB],
) -> Unit raise {
  let f = x1219
  let m = x1220
  @omap.iter(f, m)
}

///|
/// `fold`
pub fn[TA, TB, TC] fold_v5(
  x1221 : (TC) -> ((TB) -> ((TA) -> TA raise) raise) raise,
  x1222 : @omap.T[TC, TB],
  x1223 : TA,
) -> TA raise {
  let f = x1221
  let m = x1222
  let accu = x1223
  @omap.fold(f, m, accu)
}

///|
/// `for_all`
pub fn[TA, TB] for_all_v5(
  x1224 : (TB) -> ((TA) -> Bool raise) raise,
  x1225 : @omap.T[TB, TA],
) -> Bool raise {
  let p = x1224
  let m = x1225
  @omap.for_all(p, m)
}

///|
/// `exists`
pub fn[TA, TB] exists_v12(
  x1226 : (TB) -> ((TA) -> Bool raise) raise,
  x1227 : @omap.T[TB, TA],
) -> Bool raise {
  let p = x1226
  let m = x1227
  @omap.exists(p, m)
}

///|
/// `filter`
pub fn[TA, TB] filter_v10(
  x1228 : (TA) -> ((TB) -> Bool raise) raise,
  x1229 : @omap.T[TA, TB],
) -> @omap.T[TA, TB] raise {
  let p = x1228
  let m = x1229
  @omap.filter(p, m)
}

///|
/// `filter_map`
pub fn[TA, TB, TC] filter_map_v5(
  x1230 : (TA) -> ((TC) -> TB? raise) raise,
  x1231 : @omap.T[TA, TC],
) -> @omap.T[TA, TB] raise {
  let f = x1230
  let m = x1231
  @omap.filter_map(f, m)
}

///|
/// `partition`
pub fn[TA, TB] partition_v7(
  x1232 : (TA) -> ((TB) -> Bool raise) raise,
  x1233 : @omap.T[TA, TB],
) -> (@omap.T[TA, TB], @omap.T[TA, TB]) raise {
  let p = x1232
  let m = x1233
  @omap.partition(p, m)
}

///|
/// `cardinal`
pub fn[TA, TB] cardinal_v5(x1234 : @omap.T[TA, TB]) -> Int64 raise {
  let m = x1234
  @omap.cardinal(m)
}

///|
/// `bindings`
pub fn[TA, TB] bindings_v3(
  x1235 : @omap.T[TA, TB],
) -> @list.List[(TA, TB)] raise {
  let s = x1235
  @omap.bindings(s)
}

///|
/// `min_binding`
pub fn[TA, TB] min_binding_v3(x1236 : @omap.T[TA, TB]) -> (TA, TB) raise {
  let m = x1236
  @omap.min_binding(m)
}

///|
/// `min_binding_opt`
pub fn[TA, TB] min_binding_opt_v3(x1237 : @omap.T[TA, TB]) -> (TA, TB)? raise {
  let m = x1237
  @omap.min_binding_opt(m)
}

///|
/// `max_binding`
pub fn[TA, TB] max_binding_v3(x1238 : @omap.T[TA, TB]) -> (TA, TB) raise {
  let m = x1238
  @omap.max_binding(m)
}

///|
/// `max_binding_opt`
pub fn[TA, TB] max_binding_opt_v3(x1239 : @omap.T[TA, TB]) -> (TA, TB)? raise {
  let m = x1239
  @omap.max_binding_opt(m)
}

///|
/// `choose`
pub fn[TA, TB] choose_v5(x1240 : @omap.T[TA, TB]) -> (TA, TB) raise {
  let m = x1240
  @omap.choose(m)
}

///|
/// `choose_opt`
pub fn[TA, TB] choose_opt_v5(x1241 : @omap.T[TA, TB]) -> (TA, TB)? raise {
  let m = x1241
  @omap.choose_opt(m)
}

///|
/// `split`
pub fn[TA] split_v5(
  x1242 : (String, Int64),
  x1243 : @omap.T[(String, Int64), TA],
) -> (@omap.T[(Name, Int64), TA], TA?, @omap.T[(Name, Int64), TA]) raise {
  let x = x1242
  let m = x1243
  @omap.split(compare_v16, x, m)
}

///|
/// `find`
pub fn[TA] find_v6(
  x1244 : (String, Int64),
  x1245 : @omap.T[(String, Int64), TA],
) -> TA raise {
  let x = x1244
  let m = x1245
  @omap.find(compare_v16, x, m)
}

///|
/// `find_opt`
pub fn[TA] find_opt_v5(
  x1246 : (String, Int64),
  x1247 : @omap.T[(String, Int64), TA],
) -> TA? raise {
  let x = x1246
  let m = x1247
  @omap.find_opt(compare_v16, x, m)
}

///|
/// `find_first`
pub fn[TA, TB] find_first_v5(
  x1248 : (TA) -> Bool raise,
  x1249 : @omap.T[TA, TB],
) -> (TA, TB) raise {
  let f = x1248
  let m = x1249
  @omap.find_first(f, m)
}

///|
/// `find_first_opt`
pub fn[TA, TB] find_first_opt_v5(
  x1250 : (TA) -> Bool raise,
  x1251 : @omap.T[TA, TB],
) -> (TA, TB)? raise {
  let f = x1250
  let m = x1251
  @omap.find_first_opt(f, m)
}

///|
/// `find_last`
pub fn[TA, TB] find_last_v5(
  x1252 : (TA) -> Bool raise,
  x1253 : @omap.T[TA, TB],
) -> (TA, TB) raise {
  let f = x1252
  let m = x1253
  @omap.find_last(f, m)
}

///|
/// `find_last_opt`
pub fn[TA, TB] find_last_opt_v5(
  x1254 : (TA) -> Bool raise,
  x1255 : @omap.T[TA, TB],
) -> (TA, TB)? raise {
  let f = x1254
  let m = x1255
  @omap.find_last_opt(f, m)
}

///|
/// `map`
pub fn[TA, TB, TC] map_v7(
  x1256 : (TC) -> TB raise,
  x1257 : @omap.T[TA, TC],
) -> @omap.T[TA, TB] raise {
  let f = x1256
  let m = x1257
  @omap.map(f, m)
}

///|
/// `mapi`
pub fn[TA, TB, TC] mapi_v3(
  x1258 : (TA) -> ((TC) -> TB raise) raise,
  x1259 : @omap.T[TA, TC],
) -> @omap.T[TA, TB] raise {
  let f = x1258
  let m = x1259
  @omap.mapi(f, m)
}

///|
/// `map`
pub type Map5[TA] = T10[TA]

///|
/// `newMap`
pub fn[TA, TB] newmap_v4(x1260 : Unit) -> @omap.T[TA, TB] raise {
  let _ = x1260
  empty_v8()
}

///|
/// `null`
pub fn[TA, TB] null_v9(x : @omap.T[TA, TB]) -> Bool raise {
  let f : (@omap.T[TA, TB]) -> Bool raise = is_empty_v5
  f(x)
}

///|
/// `singleton`
pub fn[TA, TB] singleton_v13(x1261 : TA, x1262 : TB) -> @omap.T[TA, TB] raise {
  let (k, x) = (x1261, x1262)
  singleton_v12(k, x)
}

///|
/// `size`
pub fn[TA, TB] size_v8(x : @omap.T[TA, TB]) -> Int64 raise {
  let f : (@omap.T[TA, TB]) -> Int64 raise = cardinal_v5
  f(x)
}

///|
/// `get`
pub fn[TA] get_v4(
  x1263 : @omap.T[(String, Int64), TA],
  x1264 : (String, Int64),
) -> TA raise {
  let m = x1263
  let k = x1264
  find_v6(k, m) catch {
    @lib.NotFound => raise Failure("Mmap.get: element not found")
    e => raise e
  }
}

///|
/// `peek`
pub fn[TA] peek_v5(
  x1265 : @omap.T[(String, Int64), TA],
  x1266 : (String, Int64),
) -> TA? raise {
  let m = x1265
  let k = x1266
  Some(find_v6(k, m)) catch {
    @lib.NotFound => None
    e => raise e
  }
}

///|
/// `insert`
pub fn[TA] insert_v4(
  x1267 : @omap.T[(String, Int64), TA],
  x1268 : ((String, Int64), TA),
) -> @omap.T[(Name, Int64), TA] raise {
  let m = x1267
  let (k, v) = x1268
  add_v9(k, v, m)
}

///|
/// `toList`
pub fn[TA, TB] tolist_v8(x : @omap.T[TA, TB]) -> @list.List[(TA, TB)] raise {
  let f : (@omap.T[TA, TB]) -> @list.List[(TA, TB)] raise = bindings_v3
  f(x)
}

///|
/// `fromList`
pub fn[TA] fromlist_v7(
  x1269 : @list.List[((String, Int64), TA)],
) -> @omap.T[(Name, Int64), TA] raise {
  let l = x1269
  @lib.itlist(
    fn(
      x1270 : ((String, Int64), TA),
      x1271 : @omap.T[(String, Int64), TA],
    ) -> @omap.T[(String, Int64), TA] raise {
      let (v, tm) = x1270
      ((x1272 : @omap.T[(String, Int64), TA]) => add_v9(v, tm, x1272))(x1271)
    },
    l,
    empty_v8(),
  )
}

///|
/// `foldl`
pub fn[TA, TB, TC] foldl_v8(
  x1273 : ((TB, TC, TA)) -> TA raise,
  x1274 : TA,
  x1275 : @omap.T[TB, TC],
) -> TA raise {
  let f = x1273
  let b = x1274
  let m = x1275
  @lib.fold_left(
    fn(x1276 : TA, x1277 : (TB, TC)) -> TA raise {
      let s = x1276
      let (v, tm) = x1277
      f((v, tm, s))
    },
    b,
    bindings_v3(m),
  )
}

///|
/// `foldr`
pub fn[TA, TB, TC] foldr_v8(
  x : ((TB, TC, TA)) -> TA raise,
) -> ((TA) -> ((@omap.T[TB, TC]) -> TA raise) raise) raise {
  let f : (((TB, TC, TA)) -> TA raise) -> ((TA) -> ((@omap.T[TB, TC]) -> TA raise) raise) raise = x1278 => {
    x1279 => x1280 => foldl_v8(x1278, x1279, x1280)
  }
  f(x)
}

///|
/// `filter`
pub fn[TA, TB] filter_v11(
  x1281 : ((TA, TB)) -> Bool raise,
) -> ((@omap.T[TA, TB]) -> @omap.T[TA, TB] raise) raise {
  let f = x1281
  (x1285 : @omap.T[TA, TB]) => {
    filter_v10(
      fn(x1283 : TA) -> ((TB) -> Bool raise) raise {
        let x = x1283
        fn(x1284 : TB) -> Bool raise {
          let y = x1284
          f((x, y))
        }
      },
      x1285,
    )
  }
}

///|
/// `inDomain`
pub fn[TA] indomain_v4(
  x : (Name, Int64),
) -> ((@omap.T[(Name, Int64), TA]) -> Bool raise) raise {
  let f : ((Name, Int64)) -> ((@omap.T[(Name, Int64), TA]) -> Bool raise) raise = (
    x1286 : (String, Int64),
  ) => x1287 => mem_v5(x1286, x1287)
  f(x)
}

///|
/// `union`
pub fn[TA] union_v13(
  x1288 : ((((String, Int64), TA), ((String, Int64), TA))) -> TA? raise,
  x1289 : @omap.T[(String, Int64), TA],
  x1290 : @omap.T[(String, Int64), TA],
) -> @omap.T[(Name, Int64), TA] raise {
  let f = x1288
  let m1 = x1289
  let m2 = x1290
  let f_p : ((String, Int64)) -> (((TA?, TA?)) -> TA? raise) raise = fn(
    x1291 : (String, Int64),
  ) -> (((TA?, TA?)) -> TA? raise) raise {
    let k = x1291
    fn(x1292 : (TA?, TA?)) -> TA? raise {
      match x1292 {
        (Some(x), Some(y)) => f(((k, x), (k, y)))
        (Some(x_1), None) => Some(x_1)
        (None, Some(y_1)) => Some(y_1)
        (None, None) => None
      }
    }
  }
  merge_v5(
    fn(x1293 : (String, Int64)) -> ((TA?) -> ((TA?) -> TA? raise) raise) raise {
      let k_1 = x1293
      fn(x1294 : TA?) -> ((TA?) -> TA? raise) raise {
        let x_2 = x1294
        fn(x1295 : TA?) -> TA? raise {
          let y_2 = x1295
          f_p(k_1)((x_2, y_2))
        }
      }
    },
    m1,
    m2,
  )
}

///|
/// `delete`
pub fn[TA] delete_v7(
  x1296 : @omap.T[(String, Int64), TA],
  x1297 : (String, Int64),
) -> @omap.T[(Name, Int64), TA] raise {
  let m = x1296
  let k = x1297
  remove_v8(k, m)
}

///|
/// `mapPartial`
pub fn[TA, TB] mappartial_v5(
  x1298 : (((String, Int64), TB)) -> TA? raise,
  x1299 : @omap.T[(String, Int64), TB],
) -> @omap.T[(Name, Int64), TA] raise {
  let f = x1298
  let m = x1299
  fold_v5(
    fn(
      x1300 : (String, Int64),
    ) -> ((TB) -> ((@omap.T[(String, Int64), TA]) -> @omap.T[
      (String, Int64),
      TA,
    ] raise) raise) raise {
      let k = x1300
      fn(
        x1301 : TB,
      ) -> ((@omap.T[(String, Int64), TA]) -> @omap.T[(String, Int64), TA] raise) raise {
        let x = x1301
        fn(
          x1302 : @omap.T[(String, Int64), TA],
        ) -> @omap.T[(String, Int64), TA] raise {
          let acc = x1302
          match f((k, x)) {
            Some(y) => add_v9(k, y, acc)
            None => acc
          }
        }
      }
    },
    m,
    empty_v8(),
  )
}

///|
/// `transform`
pub fn[TA, TB, TC] transform_v7(
  x : (TC) -> TB raise,
) -> ((@omap.T[TA, TC]) -> @omap.T[TA, TB] raise) raise {
  let f : ((TC) -> TB raise) -> ((@omap.T[TA, TC]) -> @omap.T[TA, TB] raise) raise = x1303 => {
    x1304 => map_v7(x1303, x1304)
  }
  f(x)
}

///|
/// `exists`
pub fn[TA, TB] exists_v13(
  x1305 : ((TA, TB)) -> Bool raise,
) -> ((@omap.T[TA, TB]) -> Bool raise) raise {
  let f = x1305
  (x1309 : @omap.T[TA, TB]) => {
    exists_v12(
      fn(x1307 : TA) -> ((TB) -> Bool raise) raise {
        let k = x1307
        fn(x1308 : TB) -> Bool raise {
          let m = x1308
          f((k, m))
        }
      },
      x1309,
    )
  }
}

///|
/// `compose`
pub fn[TA] compose(
  x1310 : @omap.T[(String, Int64), String],
  x1311 : @omap.T[(String, Int64), TA],
) -> @omap.T[(Name, Int64), TA] raise {
  let m1 = x1310
  let m2 = x1311
  mappartial_v5(
    fn(x1314 : ((String, Int64), String)) -> TA? raise {
      ((x1312, x1313) => pk_l(m2, x1312, x1313))(x1314.0, x1314.1)
    },
    m1,
  )
}

///|
fn[TA, TB] pk_l(
  m2 : @omap.T[(String, Int64), TA],
  x1312 : (TB, Int64),
  x1313 : String,
) -> TA? raise {
  let ((_, a), n) = (x1312, x1313)
  peek_v5(m2, (n, a))
}

///|
/// `elt`
pub type Elt2 = T9

///|
/// `t`
pub type T11 = @oset.T[Elt2]

///|
/// `empty`
pub fn[TA] empty_v9() -> @oset.T[TA] {
  @oset.empty()
}

///|
/// `is_empty`
pub fn[TA] is_empty_v6(x1315 : @oset.T[TA]) -> Bool raise {
  let s = x1315
  @oset.is_empty(s)
}

///|
/// `mem`
pub fn mem_v6(
  x1316 : (String, Int64),
  x1317 : @oset.T[(String, Int64)],
) -> Bool raise {
  let x = x1316
  let s = x1317
  @oset.mem(compare_v16, x, s)
}

///|
/// `add`
pub fn add_v10(
  x1318 : (String, Int64),
  x1319 : @oset.T[(String, Int64)],
) -> @oset.T[(Name, Int64)] raise {
  let x = x1318
  let s = x1319
  @oset.add(compare_v16, x, s)
}

///|
/// `singleton`
pub fn[TA] singleton_v14(x1320 : TA) -> @oset.T[TA] raise {
  let x = x1320
  @oset.singleton(x)
}

///|
/// `remove`
pub fn remove_v9(
  x1321 : (String, Int64),
  x1322 : @oset.T[(String, Int64)],
) -> @oset.T[(Name, Int64)] raise {
  let x = x1321
  let s = x1322
  @oset.remove(compare_v16, x, s)
}

///|
/// `union`
pub fn union_v14(
  x1323 : @oset.T[(String, Int64)],
  x1324 : @oset.T[(String, Int64)],
) -> @oset.T[(Name, Int64)] raise {
  let s1 = x1323
  let s2 = x1324
  @oset.union(compare_v16, s1, s2)
}

///|
/// `inter`
pub fn inter_v2(
  x1325 : @oset.T[(String, Int64)],
  x1326 : @oset.T[(String, Int64)],
) -> @oset.T[(Name, Int64)] raise {
  let s1 = x1325
  let s2 = x1326
  @oset.inter(compare_v16, s1, s2)
}

///|
/// `disjoint`
pub fn disjoint_v3(
  x1327 : @oset.T[(String, Int64)],
  x1328 : @oset.T[(String, Int64)],
) -> Bool raise {
  let s1 = x1327
  let s2 = x1328
  @oset.disjoint(compare_v16, s1, s2)
}

///|
/// `diff`
pub fn diff_v2(
  x1329 : @oset.T[(String, Int64)],
  x1330 : @oset.T[(String, Int64)],
) -> @oset.T[(Name, Int64)] raise {
  let s1 = x1329
  let s2 = x1330
  @oset.diff(compare_v16, s1, s2)
}

///|
/// `compare`
pub fn compare_v18(
  x1331 : @oset.T[(String, Int64)],
  x1332 : @oset.T[(String, Int64)],
) -> Int64 raise {
  let s1 = x1331
  let s2 = x1332
  @oset.compare(compare_v16, s1, s2)
}

///|
/// `equal`
pub fn equal_v12(
  x1333 : @oset.T[(String, Int64)],
  x1334 : @oset.T[(String, Int64)],
) -> Bool raise {
  let s1 = x1333
  let s2 = x1334
  @oset.equal(compare_v16, s1, s2)
}

///|
/// `subset`
pub fn subset_v5(
  x1335 : @oset.T[(String, Int64)],
  x1336 : @oset.T[(String, Int64)],
) -> Bool raise {
  let s1 = x1335
  let s2 = x1336
  @oset.subset(compare_v16, s1, s2)
}

///|
/// `iter`
pub fn[TA, TB] iter_v6(
  x1337 : (TB) -> TA raise,
  x1338 : @oset.T[TB],
) -> Unit raise {
  let f = x1337
  let s = x1338
  @oset.iter(f, s)
}

///|
/// `map`
pub fn map_v8(
  x1339 : ((String, Int64)) -> (String, Int64) raise,
  x1340 : @oset.T[(String, Int64)],
) -> @oset.T[(Name, Int64)] raise {
  let f = x1339
  let s = x1340
  @oset.map(compare_v16, f, s)
}

///|
/// `fold`
pub fn[TA, TB] fold_v6(
  x1341 : (TB) -> ((TA) -> TA raise) raise,
  x1342 : @oset.T[TB],
  x1343 : TA,
) -> TA raise {
  let f = x1341
  let s = x1342
  let accu = x1343
  @oset.fold(f, s, accu)
}

///|
/// `for_all`
pub fn[TA] for_all_v6(
  x1344 : (TA) -> Bool raise,
  x1345 : @oset.T[TA],
) -> Bool raise {
  let p = x1344
  let s = x1345
  @oset.for_all(p, s)
}

///|
/// `exists`
pub fn[TA] exists_v14(
  x1346 : (TA) -> Bool raise,
  x1347 : @oset.T[TA],
) -> Bool raise {
  let p = x1346
  let s = x1347
  @oset.exists(p, s)
}

///|
/// `filter`
pub fn[TA] filter_v12(
  x1348 : (TA) -> Bool raise,
  x1349 : @oset.T[TA],
) -> @oset.T[TA] raise {
  let p = x1348
  let s = x1349
  @oset.filter(p, s)
}

///|
/// `filter_map`
pub fn filter_map_v6(
  x1350 : ((String, Int64)) -> (String, Int64)? raise,
  x1351 : @oset.T[(String, Int64)],
) -> @oset.T[(Name, Int64)] raise {
  let f = x1350
  let s = x1351
  @oset.filter_map(compare_v16, f, s)
}

///|
/// `partition`
pub fn[TA] partition_v8(
  x1352 : (TA) -> Bool raise,
  x1353 : @oset.T[TA],
) -> (@oset.T[TA], @oset.T[TA]) raise {
  let p = x1352
  let s = x1353
  @oset.partition(p, s)
}

///|
/// `cardinal`
pub fn[TA] cardinal_v6(x1354 : @oset.T[TA]) -> Int64 raise {
  let s = x1354
  @oset.cardinal(s)
}

///|
/// `elements`
pub fn[TA] elements_v2(x1355 : @oset.T[TA]) -> @list.List[TA] raise {
  let s = x1355
  @oset.elements(s)
}

///|
/// `min_elt`
pub fn[TA] min_elt_v2(x1356 : @oset.T[TA]) -> TA raise {
  let s = x1356
  @oset.min_elt(s)
}

///|
/// `min_elt_opt`
pub fn[TA] min_elt_opt_v2(x1357 : @oset.T[TA]) -> TA? raise {
  let s = x1357
  @oset.min_elt_opt(s)
}

///|
/// `max_elt`
pub fn[TA] max_elt_v2(x1358 : @oset.T[TA]) -> TA raise {
  let s = x1358
  @oset.max_elt(s)
}

///|
/// `max_elt_opt`
pub fn[TA] max_elt_opt_v2(x1359 : @oset.T[TA]) -> TA? raise {
  let s = x1359
  @oset.max_elt_opt(s)
}

///|
/// `choose`
pub fn[TA] choose_v6(x1360 : @oset.T[TA]) -> TA raise {
  let s = x1360
  @oset.choose(s)
}

///|
/// `choose_opt`
pub fn[TA] choose_opt_v6(x1361 : @oset.T[TA]) -> TA? raise {
  let s = x1361
  @oset.choose_opt(s)
}

///|
/// `split`
pub fn split_v6(
  x1362 : (String, Int64),
  x1363 : @oset.T[(String, Int64)],
) -> (@oset.T[(Name, Int64)], Bool, @oset.T[(Name, Int64)]) raise {
  let x = x1362
  let s = x1363
  @oset.split(compare_v16, x, s)
}

///|
/// `find`
pub fn find_v7(
  x1364 : (String, Int64),
  x1365 : @oset.T[(String, Int64)],
) -> (Name, Int64) raise {
  let x = x1364
  let s = x1365
  @oset.find(compare_v16, x, s)
}

///|
/// `find_opt`
pub fn find_opt_v6(
  x1366 : (String, Int64),
  x1367 : @oset.T[(String, Int64)],
) -> (Name, Int64)? raise {
  let x = x1366
  let s = x1367
  @oset.find_opt(compare_v16, x, s)
}

///|
/// `find_first`
pub fn[TA] find_first_v6(
  x1368 : (TA) -> Bool raise,
  x1369 : @oset.T[TA],
) -> TA raise {
  let f = x1368
  let s = x1369
  @oset.find_first(f, s)
}

///|
/// `find_first_opt`
pub fn[TA] find_first_opt_v6(
  x1370 : (TA) -> Bool raise,
  x1371 : @oset.T[TA],
) -> TA? raise {
  let f = x1370
  let s = x1371
  @oset.find_first_opt(f, s)
}

///|
/// `find_last`
pub fn[TA] find_last_v6(
  x1372 : (TA) -> Bool raise,
  x1373 : @oset.T[TA],
) -> TA raise {
  let f = x1372
  let s = x1373
  @oset.find_last(f, s)
}

///|
/// `find_last_opt`
pub fn[TA] find_last_opt_v6(
  x1374 : (TA) -> Bool raise,
  x1375 : @oset.T[TA],
) -> TA? raise {
  let f = x1374
  let s = x1375
  @oset.find_last_opt(f, s)
}

///|
/// `set`
pub type Set3 = T11

///|
/// compare
fn step_21() -> Unit raise {
  compare_v19_c.set(fn(
    x1376 : @oset.T[(String, Int64)],
  ) -> ((@oset.T[(String, Int64)]) -> Int64 raise) raise {
    fn(x1377 : @oset.T[(String, Int64)]) -> Int64 raise {
      compare_v18(x1376, x1377)
    }
  })
}

///|
let compare_v19_c : @lib.Cell[
  (@oset.T[(Name, Int64)]) -> ((@oset.T[(Name, Int64)]) -> Int64 raise) raise,
] = @lib.Cell::new("compare")

///|
/// `compare`
pub fn compare_v19(
  x : @oset.T[(Name, Int64)],
) -> ((@oset.T[(Name, Int64)]) -> Int64 raise) raise {
  compare_v19_c.get()(x)
}

///|
/// `add`
pub fn add_v11(
  x1378 : @oset.T[(String, Int64)],
  x1379 : (String, Int64),
) -> @oset.T[(Name, Int64)] raise {
  let s = x1378
  let x = x1379
  add_v10(x, s)
}

///|
/// `foldr`
pub fn[TA, TB] foldr_v9(
  x1380 : ((TB, TA)) -> TA raise,
  x1381 : TA,
  x1382 : @oset.T[TB],
) -> TA raise {
  let f = x1380
  let a = x1381
  let s = x1382
  fold_v6(
    fn(x1383 : TB) -> ((TA) -> TA raise) raise {
      let x = x1383
      fn(x1384 : TA) -> TA raise {
        let acc = x1384
        f((x, acc))
      }
    },
    s,
    a,
  )
}

///|
/// `foldl`
pub fn[TA, TB] foldl_v9(
  x : ((TB, TA)) -> TA raise,
) -> ((TA) -> ((@oset.T[TB]) -> TA raise) raise) raise {
  let f : (((TB, TA)) -> TA raise) -> ((TA) -> ((@oset.T[TB]) -> TA raise) raise) raise = x1385 => {
    x1386 => x1387 => foldr_v9(x1385, x1386, x1387)
  }
  f(x)
}

///|
/// member
fn step_22() -> Unit raise {
  member_v3_c.set(fn(
    x1388 : (String, Int64),
  ) -> ((@oset.T[(String, Int64)]) -> Bool raise) raise {
    fn(x1389 : @oset.T[(String, Int64)]) -> Bool raise { mem_v6(x1388, x1389) }
  })
}

///|
let member_v3_c : @lib.Cell[
  ((Name, Int64)) -> ((@oset.T[(Name, Int64)]) -> Bool raise) raise,
] = @lib.Cell::new("member")

///|
/// `member`
pub fn member_v3(
  x : (Name, Int64),
) -> ((@oset.T[(Name, Int64)]) -> Bool raise) raise {
  member_v3_c.get()(x)
}

///|
/// `empty`
pub fn[TA] empty_v10() -> @oset.T[TA] {
  empty_v9()
}

///|
/// union
fn step_23() -> Unit raise {
  union_v15_c.set(fn(
    x1390 : @oset.T[(String, Int64)],
  ) -> ((@oset.T[(String, Int64)]) -> @oset.T[(String, Int64)] raise) raise {
    fn(x1391 : @oset.T[(String, Int64)]) -> @oset.T[(String, Int64)] raise {
      union_v14(x1390, x1391)
    }
  })
}

///|
let union_v15_c : @lib.Cell[
  (@oset.T[(Name, Int64)]) -> ((@oset.T[(Name, Int64)]) -> @oset.T[
    (Name, Int64),
  ] raise) raise,
] = @lib.Cell::new("union")

///|
/// `union`
pub fn union_v15(
  x : @oset.T[(Name, Int64)],
) -> ((@oset.T[(Name, Int64)]) -> @oset.T[(Name, Int64)] raise) raise {
  union_v15_c.get()(x)
}

///|
/// difference
fn step_24() -> Unit raise {
  difference_v3_c.set(fn(
    x1392 : @oset.T[(String, Int64)],
  ) -> ((@oset.T[(String, Int64)]) -> @oset.T[(String, Int64)] raise) raise {
    fn(x1393 : @oset.T[(String, Int64)]) -> @oset.T[(String, Int64)] raise {
      diff_v2(x1392, x1393)
    }
  })
}

///|
let difference_v3_c : @lib.Cell[
  (@oset.T[(Name, Int64)]) -> ((@oset.T[(Name, Int64)]) -> @oset.T[
    (Name, Int64),
  ] raise) raise,
] = @lib.Cell::new("difference")

///|
/// `difference`
pub fn difference_v3(
  x : @oset.T[(Name, Int64)],
) -> ((@oset.T[(Name, Int64)]) -> @oset.T[(Name, Int64)] raise) raise {
  difference_v3_c.get()(x)
}

///|
/// `toList`
pub fn[TA] tolist_v9(x : @oset.T[TA]) -> @list.List[TA] raise {
  let f : (@oset.T[TA]) -> @list.List[TA] raise = elements_v2
  f(x)
}

///|
/// `singleton`
pub fn[TA] singleton_v15(x : TA) -> @oset.T[TA] raise {
  let f : (TA) -> @oset.T[TA] raise = singleton_v14
  f(x)
}

///|
/// `null`
pub fn[TA] null_v10(x : @oset.T[TA]) -> Bool raise {
  let f : (@oset.T[TA]) -> Bool raise = is_empty_v6
  f(x)
}

///|
/// `size`
pub fn[TA] size_v9(x : @oset.T[TA]) -> Int64 raise {
  let f : (@oset.T[TA]) -> Int64 raise = cardinal_v6
  f(x)
}

///|
/// `pick`
pub fn[TA] pick_v4(x : @oset.T[TA]) -> TA raise {
  let f : (@oset.T[TA]) -> TA raise = choose_v6
  f(x)
}

///|
/// equal
fn step_25() -> Unit raise {
  equal_v13_c.set(fn(
    x1394 : @oset.T[(String, Int64)],
  ) -> ((@oset.T[(String, Int64)]) -> Bool raise) raise {
    fn(x1395 : @oset.T[(String, Int64)]) -> Bool raise {
      equal_v12(x1394, x1395)
    }
  })
}

///|
let equal_v13_c : @lib.Cell[
  (@oset.T[(Name, Int64)]) -> ((@oset.T[(Name, Int64)]) -> Bool raise) raise,
] = @lib.Cell::new("equal")

///|
/// `equal`
pub fn equal_v13(
  x : @oset.T[(Name, Int64)],
) -> ((@oset.T[(Name, Int64)]) -> Bool raise) raise {
  equal_v13_c.get()(x)
}

///|
/// `exists`
pub fn[TA] exists_v15(
  x : (TA) -> Bool raise,
) -> ((@oset.T[TA]) -> Bool raise) raise {
  let f : ((TA) -> Bool raise) -> ((@oset.T[TA]) -> Bool raise) raise = x1396 => {
    x1397 => exists_v14(x1396, x1397)
  }
  f(x)
}

///|
/// `fromList`
pub fn fromlist_v8(
  x1398 : @list.List[(String, Int64)],
) -> @oset.T[(Name, Int64)] raise {
  let l = x1398
  @lib.itlist(add_v10, l, empty_v9())
}

///|
/// `delete`
pub fn delete_v8(
  x1399 : @oset.T[(String, Int64)],
  x1400 : (String, Int64),
) -> @oset.T[(Name, Int64)] raise {
  let s = x1399
  let x = x1400
  remove_v9(x, s)
}

///|
/// subset
fn step_26() -> Unit raise {
  subset_v6_c.set(fn(
    x1401 : @oset.T[(String, Int64)],
  ) -> ((@oset.T[(String, Int64)]) -> Bool raise) raise {
    fn(x1402 : @oset.T[(String, Int64)]) -> Bool raise {
      subset_v5(x1401, x1402)
    }
  })
}

///|
let subset_v6_c : @lib.Cell[
  (@oset.T[(Name, Int64)]) -> ((@oset.T[(Name, Int64)]) -> Bool raise) raise,
] = @lib.Cell::new("subset")

///|
/// `subset`
pub fn subset_v6(
  x : @oset.T[(Name, Int64)],
) -> ((@oset.T[(Name, Int64)]) -> Bool raise) raise {
  subset_v6_c.get()(x)
}

///|
/// intersect
fn step_27() -> Unit raise {
  intersect_v4_c.set(fn(
    x1403 : @oset.T[(String, Int64)],
  ) -> ((@oset.T[(String, Int64)]) -> @oset.T[(String, Int64)] raise) raise {
    fn(x1404 : @oset.T[(String, Int64)]) -> @oset.T[(String, Int64)] raise {
      inter_v2(x1403, x1404)
    }
  })
}

///|
let intersect_v4_c : @lib.Cell[
  (@oset.T[(Name, Int64)]) -> ((@oset.T[(Name, Int64)]) -> @oset.T[
    (Name, Int64),
  ] raise) raise,
] = @lib.Cell::new("intersect")

///|
/// `intersect`
pub fn intersect_v4(
  x : @oset.T[(Name, Int64)],
) -> ((@oset.T[(Name, Int64)]) -> @oset.T[(Name, Int64)] raise) raise {
  intersect_v4_c.get()(x)
}

///|
/// `intersectList`
pub fn intersectlist_v3(
  x1405 : @list.List[@oset.T[(String, Int64)]],
) -> @oset.T[(Name, Int64)] raise {
  match x1405 {
    Empty => empty_v9()
    More(s, tail=ss) => @lib.itlist(inter_v2, ss, s)
  }
}

///|
/// `findl`
pub fn[TA] findl_v4(
  x1406 : (TA) -> Bool raise,
  x1407 : @oset.T[TA],
) -> TA? raise {
  let p = x1406
  let s = x1407
  let go : (TA) -> ((TA?) -> TA? raise) raise = fn(
    x1408 : TA,
  ) -> ((TA?) -> TA? raise) raise {
    let x = x1408
    fn(x1409 : TA?) -> TA? raise {
      match x1409 {
        Some(_) as s_1 => s_1
        None => if p(x) { Some(x) } else { None }
      }
    }
  }
  fold_v6(go, s, None)
}

///|
/// `firstl`
pub fn[TA, TB] firstl_v4(
  x1410 : (TB) -> TA? raise,
  x1411 : @oset.T[TB],
) -> TA? raise {
  let f = x1410
  let s = x1411
  let go : (TB) -> ((TA?) -> TA? raise) raise = fn(
    x1412 : TB,
  ) -> ((TA?) -> TA? raise) raise {
    let x = x1412
    fn(x1413 : TA?) -> TA? raise {
      match x1413 {
        Some(_) as s_1 => s_1
        None => f(x)
      }
    }
  }
  fold_v6(go, s, None)
}

///|
/// `transform`
pub fn[TA, TB] transform_v8(
  x1414 : (TB) -> TA raise,
  x1415 : @oset.T[TB],
) -> @list.List[TA] raise {
  let f = x1414
  let s = x1415
  fold_v6(
    fn(x1416 : TB) -> ((@list.List[TA]) -> @list.List[TA] raise) raise {
      let x = x1416
      fn(x1417 : @list.List[TA]) -> @list.List[TA] raise {
        let acc = x1417
        acc.prepend(f(x))
      }
    },
    s,
    @list.List([]),
  )
}

///|
/// `all`
pub fn[TA] all_v4(
  x : (TA) -> Bool raise,
) -> ((@oset.T[TA]) -> Bool raise) raise {
  let f : ((TA) -> Bool raise) -> ((@oset.T[TA]) -> Bool raise) raise = x1418 => {
    x1419 => for_all_v6(x1418, x1419)
  }
  f(x)
}

///|
/// `count`
pub fn[TA] count_v4(
  x1420 : (TA) -> Bool raise,
  x1421 : @oset.T[TA],
) -> Int64 raise {
  let p = x1420
  let s = x1421
  fold_v6(
    fn(x1422 : TA) -> ((Int64) -> Int64 raise) raise {
      let x = x1422
      fn(x1423 : Int64) -> Int64 raise {
        let c = x1423
        if p(x) {
          @lib.add63(c, 1L)
        } else {
          c
        }
      }
    },
    s,
    0L,
  )
}

///|
/// allNullary
fn step_28() -> Unit raise {
  allnullary_c.set(all_v4(nullary))
}

///|
let allnullary_c : @lib.Cell[(@oset.T[NameArity]) -> Bool raise] = @lib.Cell::new(
  "allNullary",
)

///|
/// `allNullary`
pub fn allnullary(x : @oset.T[NameArity]) -> Bool raise {
  allnullary_c.get()(x)
}

///|
/// `var`
pub type Var = Name

///|
/// `functionName`
pub type FunctionName = Name

///|
/// `function_t`
pub type FunctionT = (FunctionName, Int64)

///|
/// `const`
pub type Const = FunctionName

///|
/// `term`
#derive(Eq, Debug)
pub(all) enum Term {
  Var(Name)
  Fn((Name, @list.List[Term]))
}

///|
pub extend Term with Eq::{not_equal, equal}

///|
pub extend Term with Debug::{to_repr}

///|
pub extend Term with @lib.OCompare::{ocompare}

///|
pub extend Term with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_Term(x : Term) -> Int {
  match x {
    Var(_) => 1000000
    Fn(_) => 1000001
  }
}

///|
pub impl @lib.OCompare for Term with fn ocompare(self, other) {
  match (self, other) {
    (Var(a0), Var(b0)) => @lib.compare(a0, b0)
    (Fn(a0), Fn(b0)) => @lib.compare(a0, b0)
    _ => ocaml_rank_Term(self).compare(ocaml_rank_Term(other))
  }
}

///|
pub impl @lib.OHash for Term with fn ohash_visit(self, h) {
  match self {
    Var(a0) => {
      h.block(0, 1)
      h.field(a0)
    }
    Fn(a0) => {
      h.block(1, 1)
      h.field(a0)
    }
  }
}

///|
/// `destVar`
pub fn destvar(x1424 : Term) -> Name raise {
  match x1424 {
    Term::Var(v) => v
    Term::Fn(_) => raise Failure("destVar")
  }
}

///|
/// isVar
fn step_29() -> Unit raise {
  isvar_c.set((x1425 : Term) => @lib.can(destvar, x1425))
}

///|
let isvar_c : @lib.Cell[(Term) -> Bool raise] = @lib.Cell::new("isVar")

///|
/// `isVar`
pub fn isvar(x : Term) -> Bool raise {
  isvar_c.get()(x)
}

///|
/// `equalVar`
pub fn equalvar(x1426 : String, x1427 : Term) -> Bool raise {
  let v = x1426
  match x1427 {
    Term::Var(v_p) => equal_v6(v, v_p)
    _ => false
  }
}

///|
/// `destFn`
pub fn destfn(x1428 : Term) -> (Name, @list.List[Term]) raise {
  match x1428 {
    Term::Fn(f) => f
    Term::Var(_) => raise Failure("destFn")
  }
}

///|
/// isFn
fn step_30() -> Unit raise {
  isfn_c.set((x1429 : Term) => @lib.can(destfn, x1429))
}

///|
let isfn_c : @lib.Cell[(Term) -> Bool raise] = @lib.Cell::new("isFn")

///|
/// `isFn`
pub fn isfn(x : Term) -> Bool raise {
  isfn_c.get()(x)
}

///|
/// `fnName`
pub fn fnname(x1430 : Term) -> Name raise {
  let tm = x1430
  destfn(tm).0
}

///|
/// `fnArguments`
pub fn fnarguments(x1431 : Term) -> @list.List[Term] raise {
  let tm = x1431
  destfn(tm).1
}

///|
/// `fnArity`
pub fn fnarity(x1432 : Term) -> Int64 raise {
  let tm = x1432
  Int::to_int64(@lib.length(fnarguments(tm)))
}

///|
/// `fnFunction`
pub fn fnfunction(x1433 : Term) -> (Name, Int64) raise {
  let tm = x1433
  let t1434 = fnarity(tm)
  (fnname(tm), t1434)
}

///|
/// `functions`
pub fn functions(x1435 : Term) -> @oset.T[(Name, Int64)] raise {
  let tm = x1435
  fn letc(
    x1436 : @oset.T[(String, Int64)],
    x1437 : @list.List[Term],
  ) -> @oset.T[(Name, Int64)] raise {
    let fs = x1436
    match x1437 {
      Empty => fs
      More(Term::Var(_), tail=tms) => letc(fs, tms)
      More(Term::Fn((n, l)), tail=tms_1) =>
        letc(add_v11(fs, (n, Int::to_int64(@lib.length(l)))), l.concat(tms_1))
    }
  }
  letc(empty_v10(), @list.List([tm]))
}

///|
/// `functionNames`
pub fn functionnames(x1438 : Term) -> @oset.T[Name] raise {
  let tm = x1438
  fn letc(
    x1439 : @oset.T[String],
    x1440 : @list.List[Term],
  ) -> @oset.T[Name] raise {
    let fs = x1439
    match x1440 {
      Empty => fs
      More(Term::Var(_), tail=tms) => letc(fs, tms)
      More(Term::Fn((n, l)), tail=tms_1) => letc(add_v8(fs, n), l.concat(tms_1))
    }
  }
  letc(empty_v7(), @list.List([tm]))
}

///|
/// `mkConst`
pub fn mkconst(x1441 : String) -> Term raise {
  let c = x1441
  Term::Fn((c, @list.List([])))
}

///|
/// `destConst`
pub fn destconst(x1442 : Term) -> Name raise {
  match x1442 {
    Term::Fn((c, Empty)) => c
    _ => raise Failure("destConst")
  }
}

///|
/// isConst
fn step_31() -> Unit raise {
  isconst_c.set((x1443 : Term) => @lib.can(destconst, x1443))
}

///|
let isconst_c : @lib.Cell[(Term) -> Bool raise] = @lib.Cell::new("isConst")

///|
/// `isConst`
pub fn isconst(x : Term) -> Bool raise {
  isconst_c.get()(x)
}

///|
/// `mkBinop`
pub fn mkbinop(x1444 : String, x1445 : (Term, Term)) -> Term raise {
  let f = x1444
  let (a, b) = x1445
  Term::Fn((f, @list.List([a, b])))
}

///|
/// `destBinop`
pub fn destbinop(x1446 : String, x1447 : Term) -> (Term, Term) raise {
  let f = x1446
  match x1447 {
    Term::Fn((x, More(a, tail=More(b, tail=Empty)))) =>
      if equal_v6(x, f) {
        (a, b)
      } else {
        raise Failure("Term.destBinop: wrong binop")
      }
    _ => raise Failure("Term.destBinop: not a binop")
  }
}

///|
/// `isBinop`
pub fn isbinop(x1448 : String) -> ((Term) -> Bool raise) raise {
  let f = x1448
  (x1451 : Term) => @lib.can((x1450 : Term) => destbinop(f, x1450), x1451)
}

///|
/// vAR_SYMBOLS
fn step_32() -> Unit raise {
  var_symbols_c.set(1L)
}

///|
let var_symbols_c : @lib.Cell[Int64] = @lib.Cell::new("vAR_SYMBOLS")

///|
/// `vAR_SYMBOLS`
pub fn var_symbols() -> Int64 {
  var_symbols_c.get()
}

///|
/// fN_SYMBOLS
fn step_33() -> Unit raise {
  fn_symbols_c.set(1L)
}

///|
let fn_symbols_c : @lib.Cell[Int64] = @lib.Cell::new("fN_SYMBOLS")

///|
/// `fN_SYMBOLS`
pub fn fn_symbols() -> Int64 {
  fn_symbols_c.get()
}

///|
/// `symbols`
pub fn symbols(x1452 : Term) -> Int64 raise {
  let tm = x1452
  fn sz(x1453 : Int64, x1454 : @list.List[Term]) -> Int64 raise {
    let n = x1453
    match x1454 {
      Empty => n
      More(Term::Var(_), tail=tms) => sz(@lib.add63(n, var_symbols()), tms)
      More(Term::Fn((letc, args)), tail=tms_1) =>
        sz(@lib.add63(n, fn_symbols()), args.concat(tms_1))
    }
  }
  sz(0L, @list.List([tm]))
}

///|
/// `compare`
pub fn compare_v20(x1455 : Term, x1456 : Term) -> Int64 raise {
  let tm1 = x1455
  let tm2 = x1456
  fn cmp(x1457 : (@list.List[Term], @list.List[Term])) -> Int64 raise {
    match x1457 {
      (Empty, Empty) => 0L
      (More(tm1_1, tail=tms1), More(tm2_1, tail=tms2)) =>
        if physical_equal(tm1_1, tm2_1) {
          cmp((tms1, tms2))
        } else {
          match (tm1_1, tm2_1) {
            (Term::Var(v1), Term::Var(v2)) => {
              let c = compare_v10(v1)(v2)
              if c != 0L {
                c
              } else {
                cmp((tms1, tms2))
              }
            }
            (Term::Var(_), Term::Fn(_)) => -1L
            (Term::Fn(_), Term::Var(_)) => 1L
            (Term::Fn((f1, a1)), Term::Fn((f2, a2))) => {
              let c_1 = compare_v10(f1)(f2)
              if c_1 != 0L {
                c_1
              } else {
                let t1458 = Int::to_int64(@lib.length(a2))
                let c_2 = intcompare(Int::to_int64(@lib.length(a1)), t1458)
                if c_2 != 0L {
                  c_2
                } else {
                  cmp((a1.concat(tms1), a2.concat(tms2)))
                }
              }
            }
          }
        }
      _ => raise Bug::Bug("Term.compare")
    }
  }
  cmp((@list.List([tm1]), @list.List([tm2])))
}

///|
/// `equal`
pub fn equal_v14(x1459 : Term, x1460 : Term) -> Bool raise {
  let tm1 = x1459
  let tm2 = x1460
  compare_v20(tm1, tm2) == 0L
}

///|
/// `path`
pub type Path = @list.List[Int64]

///|
/// `subterm'`
pub fn subterm_p(x1461 : (Term, @list.List[Int64])) -> Term raise {
  match x1461 {
    (tm, Empty) => tm
    (Term::Var(_), More(_, tail=_)) => raise Failure("Term.subterm: Var")
    (Term::Fn((_, tms)), More(h, tail=t)) =>
      if h >= Int::to_int64(@lib.length(tms)) {
        raise Failure("Term.replace: Fn")
      } else {
        subterm_p((@lib.list_nth(tms, @lib.int63_to_int(h)), t))
      }
  }
}

///|
/// `subterm`
pub fn subterm(x1462 : Term, x1463 : @list.List[Int64]) -> Term raise {
  let s = x1462
  let t = x1463
  subterm_p((s, t))
}

///|
/// `subterms`
pub fn subterms(x1464 : Term) -> @list.List[(@list.List[Int64], Term)] raise {
  let tm = x1464
  fn subtms(
    x1465 : (
      @list.List[(@list.List[Int64], Term)],
      @list.List[(@list.List[Int64], Term)],
    ),
  ) -> @list.List[(@list.List[Int64], Term)] raise {
    match x1465 {
      (Empty, acc) => acc
      (More((path, tm_1), tail=rest), acc_1) => {
        let acc_2 = acc_1.prepend((@lib.rev(path), tm_1))
        match tm_1 {
          Term::Var(_) => subtms((rest, acc_2))
          Term::Fn((_, args)) =>
            subtms(
              (
                @lib.map(
                  fn(x1468 : (Int64, Term)) -> (@list.List[Int64], Term) raise {
                    ((x1466, x1467) => f_l(path, x1466, x1467))(
                      x1468.0,
                      x1468.1,
                    )
                  },
                  enumerate(args),
                ).concat(rest),
                acc_2,
              ),
            )
        }
      }
    }
  }
  subtms((@list.List([(@list.List([]), tm)]), @list.List([])))
}

///|
fn[TA] f_l(
  path : @list.List[Int64],
  x1466 : Int64,
  x1467 : TA,
) -> (@list.List[Int64], TA) raise {
  let (n, arg) = (x1466, x1467)
  (path.prepend(n), arg)
}

///|
/// `replace`
pub fn replace(x1469 : Term, x1470 : (@list.List[Int64], Term)) -> Term raise {
  let tm = x1469
  match x1470 {
    (Empty, res) => if equal_v14(res, tm) { tm } else { res }
    (More(h, tail=t), res_1) =>
      match tm {
        Term::Var(_) => raise Failure("Term.replace: Var")
        Term::Fn((letc, tms)) =>
          if h >= Int::to_int64(@lib.length(tms)) {
            raise Failure("Term.replace: Fn")
          } else {
            let arg = @lib.list_nth(tms, @lib.int63_to_int(h))
            let arg_p = replace(arg, (t, res_1))
            if physical_equal(arg_p, arg) {
              tm
            } else {
              Term::Fn((letc, updatenth((h, arg_p), tms)))
            }
          }
      }
  }
}

///|
/// `find`
pub fn find_v8(
  x1471 : (Term) -> Bool raise,
) -> ((Term) -> @list.List[Int64]? raise) raise {
  let pred = x1471
  fn search(
    x1473 : @list.List[(@list.List[Int64], Term)],
  ) -> @list.List[Int64]? raise {
    match x1473 {
      Empty => None
      More((path, tm), tail=rest) =>
        if pred(tm) {
          Some(@lib.rev(path))
        } else {
          match tm {
            Term::Var(_) => search(rest)
            Term::Fn((_, a)) => {
              let subtms = @lib.map(
                fn(x1474 : (Int64, Term)) -> (@list.List[Int64], Term) raise {
                  let (i, t) = x1474
                  (path.prepend(i), t)
                },
                enumerate(a),
              )
              search(subtms.concat(rest))
            }
          }
        }
    }
  }
  fn(x1475 : Term) -> @list.List[Int64]? raise {
    let tm_1 = x1475
    search(@list.List([(@list.List([]), tm_1)]))
  }
}

///|
/// `freeIn`
pub fn freein(x1476 : String, x1477 : Term) -> Bool raise {
  let v = x1476
  let tm = x1477
  fn free(x1478 : String, x1479 : @list.List[Term]) -> Bool raise {
    let v_1 = x1478
    match x1479 {
      Empty => false
      More(Term::Var(w), tail=tms) => equal_v6(v_1, w) || free(v_1, tms)
      More(Term::Fn((_, args)), tail=tms_1) => free(v_1, args.concat(tms_1))
    }
  }
  free(v, @list.List([tm]))
}

///|
/// freeVarsList
fn step_34() -> Unit raise {
  fn free(
    x1480 : @oset.T[String],
    x1481 : @list.List[Term],
  ) -> @oset.T[Name] raise {
    let vs = x1480
    match x1481 {
      Empty => vs
      More(Term::Var(v), tail=tms) => free(add_v8(vs, v), tms)
      More(Term::Fn((_, args)), tail=tms_1) => free(vs, args.concat(tms_1))
    }
  }
  freevarslist_c.set((x1482 : @list.List[Term]) => free(empty_v7(), x1482))
}

///|
let freevarslist_c : @lib.Cell[(@list.List[Term]) -> @oset.T[Name] raise] = @lib.Cell::new(
  "freeVarsList",
)

///|
/// `freeVarsList`
pub fn freevarslist(x : @list.List[Term]) -> @oset.T[Name] raise {
  freevarslist_c.get()(x)
}

///|
/// `freeVars`
pub fn freevars(x1483 : Term) -> @oset.T[Name] raise {
  let tm = x1483
  freevarslist(@list.List([tm]))
}

///|
/// `newVar`
pub fn newvar(x1484 : Unit) -> Term raise {
  let _ = x1484
  Term::Var(newname(()))
}

///|
/// `newVars`
pub fn newvars(x1485 : Int64) -> @list.List[Term] raise {
  let n = x1485
  @lib.map(
    fn(x1486 : String) -> Term raise {
      let x = x1486
      Term::Var(x)
    },
    newnames(n),
  )
}

///|
/// `avoid`
pub fn avoid(x1487 : @oset.T[String], x1488 : String) -> Bool raise {
  let av = x1487
  let n = x1488
  member_v2(n)(av)
}

///|
/// `variantPrime`
pub fn variantprime_v1(x1489 : @oset.T[String]) -> ((Name) -> Name raise) raise {
  let av = x1489
  variantprime((x1491 : String) => avoid(av, x1491))
}

///|
/// `variantNum`
pub fn variantnum_v1(x1492 : @oset.T[String]) -> ((Name) -> Name raise) raise {
  let av = x1492
  (x1495 : String) => variantnum((x1494 : String) => avoid(av, x1494), x1495)
}

///|
/// hasTypeFunctionName
fn step_35() -> Unit raise {
  hastypefunctionname_c.set(fromstring(":"))
}

///|
let hastypefunctionname_c : @lib.Cell[Name] = @lib.Cell::new(
  "hasTypeFunctionName",
)

///|
/// `hasTypeFunctionName`
pub fn hastypefunctionname() -> Name {
  hastypefunctionname_c.get()
}

///|
/// hasTypeFunction
fn step_36() -> Unit raise {
  hastypefunction_c.set((hastypefunctionname(), 2L))
}

///|
let hastypefunction_c : @lib.Cell[(Name, Int64)] = @lib.Cell::new(
  "hasTypeFunction",
)

///|
/// `hasTypeFunction`
pub fn hastypefunction() -> (Name, Int64) {
  hastypefunction_c.get()
}

///|
/// `destFnHasType`
pub fn destfnhastype(
  x1496 : String,
  x1497 : @list.List[Term],
) -> (Term, Term) raise {
  let (f, a) = (x1496, x1497)
  if !equal_v6(f, hastypefunctionname()) {
    raise Failure("Term.destFnHasType")
  } else {
    match a {
      More(tm, tail=More(ty, tail=Empty)) => (tm, ty)
      _ => raise Failure("Term.destFnHasType")
    }
  }
}

///|
/// isFnHasType
fn step_37() -> Unit raise {
  isfnhastype_c.set((x1499 : (String, @list.List[Term])) => {
    @lib.can(
      fn(x1498 : (String, @list.List[Term])) -> (Term, Term) raise {
        destfnhastype(x1498.0, x1498.1)
      },
      x1499,
    )
  })
}

///|
let isfnhastype_c : @lib.Cell[((FunctionName, @list.List[Term])) -> Bool raise] = @lib.Cell::new(
  "isFnHasType",
)

///|
/// `isFnHasType`
pub fn isfnhastype(x : (FunctionName, @list.List[Term])) -> Bool raise {
  isfnhastype_c.get()(x)
}

///|
/// `isTypedVar`
pub fn istypedvar(x1500 : Term) -> Bool raise {
  let tm = x1500
  match tm {
    Term::Var(_) => true
    Term::Fn(letc) =>
      match
        total(
          fn(x1501 : (String, @list.List[Term])) -> (Term, Term) raise {
            destfnhastype(x1501.0, x1501.1)
          },
          letc,
        ) {
        Some((Term::Var(_), _)) => true
        _ => false
      }
  }
}

///|
/// `typedSymbols`
pub fn typedsymbols(x1502 : Term) -> Int64 raise {
  let tm = x1502
  fn sz(x1503 : Int64, x1504 : @list.List[Term]) -> Int64 raise {
    let n = x1503
    match x1504 {
      Empty => n
      More(tm_1, tail=tms) =>
        match tm_1 {
          Term::Var(_) => sz(@lib.add63(n, 1L), tms)
          Term::Fn(letc) =>
            match
              total(
                fn(x1505 : (String, @list.List[Term])) -> (Term, Term) raise {
                  destfnhastype(x1505.0, x1505.1)
                },
                letc,
              ) {
              Some((tm_2, _)) => sz(n, tms.prepend(tm_2))
              None => {
                let (_, a) = letc
                sz(@lib.add63(n, 1L), a.concat(tms))
              }
            }
        }
    }
  }
  sz(0L, @list.List([tm]))
}

///|
/// `nonVarTypedSubterms`
pub fn nonvartypedsubterms(
  x1506 : Term,
) -> @list.List[(@list.List[Int64], Term)] raise {
  let tm = x1506
  fn subtms(
    x1507 : (
      @list.List[(@list.List[Int64], Term)],
      @list.List[(@list.List[Int64], Term)],
    ),
  ) -> @list.List[(@list.List[Int64], Term)] raise {
    match x1507 {
      (Empty, acc) => acc
      (More((path, tm_1), tail=rest), acc_1) =>
        match tm_1 {
          Term::Var(_) => subtms((rest, acc_1))
          Term::Fn(letc) =>
            match
              total(
                fn(x1508 : (String, @list.List[Term])) -> (Term, Term) raise {
                  destfnhastype(x1508.0, x1508.1)
                },
                letc,
              ) {
              Some((t, _)) =>
                match t {
                  Term::Var(_) => subtms((rest, acc_1))
                  Term::Fn(_) => {
                    let acc_2 = acc_1.prepend((@lib.rev(path), tm_1))
                    let rest_1 = rest.prepend((path.prepend(0L), t))
                    subtms((rest_1, acc_2))
                  }
                }
              None => {
                let (_, args) = letc
                let acc_3 = acc_1.prepend((@lib.rev(path), tm_1))
                let rest_2 = @lib.map(
                  fn(x1511 : (Int64, Term)) -> (@list.List[Int64], Term) raise {
                    ((x1509, x1510) => f_l_1(path, x1509, x1510))(
                      x1511.0,
                      x1511.1,
                    )
                  },
                  enumerate(args),
                ).concat(rest)
                subtms((rest_2, acc_3))
              }
            }
        }
    }
  }
  subtms((@list.List([(@list.List([]), tm)]), @list.List([])))
}

///|
fn[TA] f_l_1(
  path : @list.List[Int64],
  x1509 : Int64,
  x1510 : TA,
) -> (@list.List[Int64], TA) raise {
  let (n, arg) = (x1509, x1510)
  (path.prepend(n), arg)
}

///|
/// appName
fn step_38() -> Unit raise {
  appname_c.set(fromstring("."))
}

///|
let appname_c : @lib.Cell[Name] = @lib.Cell::new("appName")

///|
/// `appName`
pub fn appname() -> Name {
  appname_c.get()
}

///|
/// `mkFnApp`
pub fn[TA] mkfnapp(x1512 : TA, x1513 : TA) -> (Name, @list.List[TA]) raise {
  let (ftm, atm) = (x1512, x1513)
  (appname(), @list.List([ftm, atm]))
}

///|
/// `mkApp`
pub fn mkapp(x1514 : (Term, Term)) -> Term raise {
  let f_a = x1514
  Term::Fn(mkfnapp(f_a.0, f_a.1))
}

///|
/// `destFnApp`
pub fn destfnapp(
  x1515 : String,
  x1516 : @list.List[Term],
) -> (Term, Term) raise {
  let (f, a) = (x1515, x1516)
  if !equal_v6(f, appname()) {
    raise Failure("Term.destFnApp")
  } else {
    match a {
      More(ftm, tail=More(atm, tail=Empty)) => (ftm, atm)
      _ => raise Failure("Term.destFnApp")
    }
  }
}

///|
/// isFnApp
fn step_39() -> Unit raise {
  isfnapp_c.set((x1518 : (String, @list.List[Term])) => {
    @lib.can(
      fn(x1517 : (String, @list.List[Term])) -> (Term, Term) raise {
        destfnapp(x1517.0, x1517.1)
      },
      x1518,
    )
  })
}

///|
let isfnapp_c : @lib.Cell[((Name, @list.List[Term])) -> Bool raise] = @lib.Cell::new(
  "isFnApp",
)

///|
/// `isFnApp`
pub fn isfnapp(x : (Name, @list.List[Term])) -> Bool raise {
  isfnapp_c.get()(x)
}

///|
/// `destApp`
pub fn destapp(x1519 : Term) -> (Term, Term) raise {
  let tm = x1519
  match tm {
    Term::Var(_) => raise Failure("Term.destApp")
    Term::Fn(letc) => destfnapp(letc.0, letc.1)
  }
}

///|
/// isApp
fn step_40() -> Unit raise {
  isapp_c.set((x1520 : Term) => @lib.can(destapp, x1520))
}

///|
let isapp_c : @lib.Cell[(Term) -> Bool raise] = @lib.Cell::new("isApp")

///|
/// `isApp`
pub fn isapp(x : Term) -> Bool raise {
  isapp_c.get()(x)
}

///|
/// `listMkApp`
pub fn listmkapp(x1521 : Term, x1522 : @list.List[Term]) -> Term raise {
  let (f, l) = (x1521, x1522)
  @lib.fold_left(
    fn(x1523 : Term, x1524 : Term) -> Term raise {
      let acc = x1523
      let x = x1524
      mkapp((x, acc))
    },
    f,
    l,
  )
}

///|
/// `stripApp`
pub fn stripapp(x1525 : Term) -> (Term, @list.List[Term]) raise {
  let tm = x1525
  fn strip(
    x1526 : @list.List[Term],
    x1527 : Term,
  ) -> (Term, @list.List[Term]) raise {
    let tms = x1526
    let tm_1 = x1527
    match total(destapp, tm_1) {
      Some((f, a)) => strip(tms.prepend(a), f)
      None => (tm_1, tms)
    }
  }
  strip(@list.List([]), tm)
}

///|
/// `toString`
pub fn tostring_v4(x1528 : Term) -> Name raise {
  match x1528 {
    Term::Var(v) => v
    Term::Fn((n, Empty)) => n
    Term::Fn((n_1, l)) =>
      n_1 + ("(" + (@lib.string_concat(", ", @lib.map(tostring_v4, l)) + ")"))
  }
}

///|
/// `t`
pub type T12 = Term

///|
/// compare
fn step_41() -> Unit raise {
  compare_v21_c.set(fn(x1529 : Term) -> ((Term) -> Int64 raise) raise {
    fn(x1530 : Term) -> Int64 raise { compare_v20(x1529, x1530) }
  })
}

///|
let compare_v21_c : @lib.Cell[(Term) -> ((Term) -> Int64 raise) raise] = @lib.Cell::new(
  "compare",
)

///|
/// `compare`
pub fn compare_v21(x : Term) -> ((Term) -> Int64 raise) raise {
  compare_v21_c.get()(x)
}

///|
/// `key`
pub type Key4 = T12

///|
/// `t`
pub type T13[TA] = @omap.T[Key4, TA]

///|
/// `empty`
pub fn[TA, TB] empty_v11() -> @omap.T[TA, TB] {
  @omap.empty()
}

///|
/// `is_empty`
pub fn[TA, TB] is_empty_v7(x1531 : @omap.T[TA, TB]) -> Bool raise {
  let m = x1531
  @omap.is_empty(m)
}

///|
/// `mem`
pub fn[TA] mem_v7(x1532 : Term, x1533 : @omap.T[Term, TA]) -> Bool raise {
  let x = x1532
  let m = x1533
  @omap.mem(compare_v21, x, m)
}

///|
/// `add`
pub fn[TA] add_v12(
  x1534 : Term,
  x1535 : TA,
  x1536 : @omap.T[Term, TA],
) -> @omap.T[Term, TA] raise {
  let x = x1534
  let data = x1535
  let m = x1536
  @omap.add(compare_v21, x, data, m)
}

///|
/// `update`
pub fn[TA] update_v4(
  x1537 : Term,
  x1538 : (TA?) -> TA? raise,
  x1539 : @omap.T[Term, TA],
) -> @omap.T[Term, TA] raise {
  let x = x1537
  let f = x1538
  let m = x1539
  @omap.update(compare_v21, x, f, m)
}

///|
/// `singleton`
pub fn[TA, TB] singleton_v16(x1540 : TA, x1541 : TB) -> @omap.T[TA, TB] raise {
  let x = x1540
  let d = x1541
  @omap.singleton(x, d)
}

///|
/// `remove`
pub fn[TA] remove_v10(
  x1542 : Term,
  x1543 : @omap.T[Term, TA],
) -> @omap.T[Term, TA] raise {
  let x = x1542
  let m = x1543
  @omap.remove(compare_v21, x, m)
}

///|
/// `merge`
pub fn[TA, TB, TC] merge_v6(
  x1544 : (Term) -> ((TC?) -> ((TB?) -> TA? raise) raise) raise,
  x1545 : @omap.T[Term, TC],
  x1546 : @omap.T[Term, TB],
) -> @omap.T[Term, TA] raise {
  let f = x1544
  let s1 = x1545
  let s2 = x1546
  @omap.merge(compare_v21, f, s1, s2)
}

///|
/// `union`
pub fn[TA] union_v16(
  x1547 : (Term) -> ((TA) -> ((TA) -> TA? raise) raise) raise,
  x1548 : @omap.T[Term, TA],
  x1549 : @omap.T[Term, TA],
) -> @omap.T[Term, TA] raise {
  let f = x1547
  let s1 = x1548
  let s2 = x1549
  @omap.union(compare_v21, f, s1, s2)
}

///|
/// `compare`
pub fn[TA, TB] compare_v22(
  x1550 : (TB) -> ((TA) -> Int64 raise) raise,
  x1551 : @omap.T[Term, TB],
  x1552 : @omap.T[Term, TA],
) -> Int64 raise {
  let cmp = x1550
  let m1 = x1551
  let m2 = x1552
  @omap.compare(compare_v21, cmp, m1, m2)
}

///|
/// `equal`
pub fn[TA, TB] equal_v15(
  x1553 : (TB) -> ((TA) -> Bool raise) raise,
  x1554 : @omap.T[Term, TB],
  x1555 : @omap.T[Term, TA],
) -> Bool raise {
  let cmp = x1553
  let m1 = x1554
  let m2 = x1555
  @omap.equal(compare_v21, cmp, m1, m2)
}

///|
/// `iter`
pub fn[TA, TB, TC] iter_v7(
  x1556 : (TC) -> ((TB) -> TA raise) raise,
  x1557 : @omap.T[TC, TB],
) -> Unit raise {
  let f = x1556
  let m = x1557
  @omap.iter(f, m)
}

///|
/// `fold`
pub fn[TA, TB, TC] fold_v7(
  x1558 : (TC) -> ((TB) -> ((TA) -> TA raise) raise) raise,
  x1559 : @omap.T[TC, TB],
  x1560 : TA,
) -> TA raise {
  let f = x1558
  let m = x1559
  let accu = x1560
  @omap.fold(f, m, accu)
}

///|
/// `for_all`
pub fn[TA, TB] for_all_v7(
  x1561 : (TB) -> ((TA) -> Bool raise) raise,
  x1562 : @omap.T[TB, TA],
) -> Bool raise {
  let p = x1561
  let m = x1562
  @omap.for_all(p, m)
}

///|
/// `exists`
pub fn[TA, TB] exists_v16(
  x1563 : (TB) -> ((TA) -> Bool raise) raise,
  x1564 : @omap.T[TB, TA],
) -> Bool raise {
  let p = x1563
  let m = x1564
  @omap.exists(p, m)
}

///|
/// `filter`
pub fn[TA, TB] filter_v13(
  x1565 : (TA) -> ((TB) -> Bool raise) raise,
  x1566 : @omap.T[TA, TB],
) -> @omap.T[TA, TB] raise {
  let p = x1565
  let m = x1566
  @omap.filter(p, m)
}

///|
/// `filter_map`
pub fn[TA, TB, TC] filter_map_v7(
  x1567 : (TA) -> ((TC) -> TB? raise) raise,
  x1568 : @omap.T[TA, TC],
) -> @omap.T[TA, TB] raise {
  let f = x1567
  let m = x1568
  @omap.filter_map(f, m)
}

///|
/// `partition`
pub fn[TA, TB] partition_v9(
  x1569 : (TA) -> ((TB) -> Bool raise) raise,
  x1570 : @omap.T[TA, TB],
) -> (@omap.T[TA, TB], @omap.T[TA, TB]) raise {
  let p = x1569
  let m = x1570
  @omap.partition(p, m)
}

///|
/// `cardinal`
pub fn[TA, TB] cardinal_v7(x1571 : @omap.T[TA, TB]) -> Int64 raise {
  let m = x1571
  @omap.cardinal(m)
}

///|
/// `bindings`
pub fn[TA, TB] bindings_v4(
  x1572 : @omap.T[TA, TB],
) -> @list.List[(TA, TB)] raise {
  let s = x1572
  @omap.bindings(s)
}

///|
/// `min_binding`
pub fn[TA, TB] min_binding_v4(x1573 : @omap.T[TA, TB]) -> (TA, TB) raise {
  let m = x1573
  @omap.min_binding(m)
}

///|
/// `min_binding_opt`
pub fn[TA, TB] min_binding_opt_v4(x1574 : @omap.T[TA, TB]) -> (TA, TB)? raise {
  let m = x1574
  @omap.min_binding_opt(m)
}

///|
/// `max_binding`
pub fn[TA, TB] max_binding_v4(x1575 : @omap.T[TA, TB]) -> (TA, TB) raise {
  let m = x1575
  @omap.max_binding(m)
}

///|
/// `max_binding_opt`
pub fn[TA, TB] max_binding_opt_v4(x1576 : @omap.T[TA, TB]) -> (TA, TB)? raise {
  let m = x1576
  @omap.max_binding_opt(m)
}

///|
/// `choose`
pub fn[TA, TB] choose_v7(x1577 : @omap.T[TA, TB]) -> (TA, TB) raise {
  let m = x1577
  @omap.choose(m)
}

///|
/// `choose_opt`
pub fn[TA, TB] choose_opt_v7(x1578 : @omap.T[TA, TB]) -> (TA, TB)? raise {
  let m = x1578
  @omap.choose_opt(m)
}

///|
/// `split`
pub fn[TA] split_v7(
  x1579 : Term,
  x1580 : @omap.T[Term, TA],
) -> (@omap.T[Term, TA], TA?, @omap.T[Term, TA]) raise {
  let x = x1579
  let m = x1580
  @omap.split(compare_v21, x, m)
}

///|
/// `find`
pub fn[TA] find_v9(x1581 : Term, x1582 : @omap.T[Term, TA]) -> TA raise {
  let x = x1581
  let m = x1582
  @omap.find(compare_v21, x, m)
}

///|
/// `find_opt`
pub fn[TA] find_opt_v7(x1583 : Term, x1584 : @omap.T[Term, TA]) -> TA? raise {
  let x = x1583
  let m = x1584
  @omap.find_opt(compare_v21, x, m)
}

///|
/// `find_first`
pub fn[TA, TB] find_first_v7(
  x1585 : (TA) -> Bool raise,
  x1586 : @omap.T[TA, TB],
) -> (TA, TB) raise {
  let f = x1585
  let m = x1586
  @omap.find_first(f, m)
}

///|
/// `find_first_opt`
pub fn[TA, TB] find_first_opt_v7(
  x1587 : (TA) -> Bool raise,
  x1588 : @omap.T[TA, TB],
) -> (TA, TB)? raise {
  let f = x1587
  let m = x1588
  @omap.find_first_opt(f, m)
}

///|
/// `find_last`
pub fn[TA, TB] find_last_v7(
  x1589 : (TA) -> Bool raise,
  x1590 : @omap.T[TA, TB],
) -> (TA, TB) raise {
  let f = x1589
  let m = x1590
  @omap.find_last(f, m)
}

///|
/// `find_last_opt`
pub fn[TA, TB] find_last_opt_v7(
  x1591 : (TA) -> Bool raise,
  x1592 : @omap.T[TA, TB],
) -> (TA, TB)? raise {
  let f = x1591
  let m = x1592
  @omap.find_last_opt(f, m)
}

///|
/// `map`
pub fn[TA, TB, TC] map_v9(
  x1593 : (TC) -> TB raise,
  x1594 : @omap.T[TA, TC],
) -> @omap.T[TA, TB] raise {
  let f = x1593
  let m = x1594
  @omap.map(f, m)
}

///|
/// `mapi`
pub fn[TA, TB, TC] mapi_v4(
  x1595 : (TA) -> ((TC) -> TB raise) raise,
  x1596 : @omap.T[TA, TC],
) -> @omap.T[TA, TB] raise {
  let f = x1595
  let m = x1596
  @omap.mapi(f, m)
}

///|
/// `elt`
pub type Elt3 = T12

///|
/// `t`
pub type T14 = @oset.T[Elt3]

///|
/// `empty`
pub fn[TA] empty_v12() -> @oset.T[TA] {
  @oset.empty()
}

///|
/// `is_empty`
pub fn[TA] is_empty_v8(x1597 : @oset.T[TA]) -> Bool raise {
  let s = x1597
  @oset.is_empty(s)
}

///|
/// `mem`
pub fn mem_v8(x1598 : Term, x1599 : @oset.T[Term]) -> Bool raise {
  let x = x1598
  let s = x1599
  @oset.mem(compare_v21, x, s)
}

///|
/// `add`
pub fn add_v13(x1600 : Term, x1601 : @oset.T[Term]) -> @oset.T[Term] raise {
  let x = x1600
  let s = x1601
  @oset.add(compare_v21, x, s)
}

///|
/// `singleton`
pub fn[TA] singleton_v17(x1602 : TA) -> @oset.T[TA] raise {
  let x = x1602
  @oset.singleton(x)
}

///|
/// `remove`
pub fn remove_v11(x1603 : Term, x1604 : @oset.T[Term]) -> @oset.T[Term] raise {
  let x = x1603
  let s = x1604
  @oset.remove(compare_v21, x, s)
}

///|
/// `union`
pub fn union_v17(
  x1605 : @oset.T[Term],
  x1606 : @oset.T[Term],
) -> @oset.T[Term] raise {
  let s1 = x1605
  let s2 = x1606
  @oset.union(compare_v21, s1, s2)
}

///|
/// `inter`
pub fn inter_v3(
  x1607 : @oset.T[Term],
  x1608 : @oset.T[Term],
) -> @oset.T[Term] raise {
  let s1 = x1607
  let s2 = x1608
  @oset.inter(compare_v21, s1, s2)
}

///|
/// `disjoint`
pub fn disjoint_v4(x1609 : @oset.T[Term], x1610 : @oset.T[Term]) -> Bool raise {
  let s1 = x1609
  let s2 = x1610
  @oset.disjoint(compare_v21, s1, s2)
}

///|
/// `diff`
pub fn diff_v3(
  x1611 : @oset.T[Term],
  x1612 : @oset.T[Term],
) -> @oset.T[Term] raise {
  let s1 = x1611
  let s2 = x1612
  @oset.diff(compare_v21, s1, s2)
}

///|
/// `compare`
pub fn compare_v23(x1613 : @oset.T[Term], x1614 : @oset.T[Term]) -> Int64 raise {
  let s1 = x1613
  let s2 = x1614
  @oset.compare(compare_v21, s1, s2)
}

///|
/// `equal`
pub fn equal_v16(x1615 : @oset.T[Term], x1616 : @oset.T[Term]) -> Bool raise {
  let s1 = x1615
  let s2 = x1616
  @oset.equal(compare_v21, s1, s2)
}

///|
/// `subset`
pub fn subset_v7(x1617 : @oset.T[Term], x1618 : @oset.T[Term]) -> Bool raise {
  let s1 = x1617
  let s2 = x1618
  @oset.subset(compare_v21, s1, s2)
}

///|
/// `iter`
pub fn[TA, TB] iter_v8(
  x1619 : (TB) -> TA raise,
  x1620 : @oset.T[TB],
) -> Unit raise {
  let f = x1619
  let s = x1620
  @oset.iter(f, s)
}

///|
/// `map`
pub fn map_v10(
  x1621 : (Term) -> Term raise,
  x1622 : @oset.T[Term],
) -> @oset.T[Term] raise {
  let f = x1621
  let s = x1622
  @oset.map(compare_v21, f, s)
}

///|
/// `fold`
pub fn[TA, TB] fold_v8(
  x1623 : (TB) -> ((TA) -> TA raise) raise,
  x1624 : @oset.T[TB],
  x1625 : TA,
) -> TA raise {
  let f = x1623
  let s = x1624
  let accu = x1625
  @oset.fold(f, s, accu)
}

///|
/// `for_all`
pub fn[TA] for_all_v8(
  x1626 : (TA) -> Bool raise,
  x1627 : @oset.T[TA],
) -> Bool raise {
  let p = x1626
  let s = x1627
  @oset.for_all(p, s)
}

///|
/// `exists`
pub fn[TA] exists_v17(
  x1628 : (TA) -> Bool raise,
  x1629 : @oset.T[TA],
) -> Bool raise {
  let p = x1628
  let s = x1629
  @oset.exists(p, s)
}

///|
/// `filter`
pub fn[TA] filter_v14(
  x1630 : (TA) -> Bool raise,
  x1631 : @oset.T[TA],
) -> @oset.T[TA] raise {
  let p = x1630
  let s = x1631
  @oset.filter(p, s)
}

///|
/// `filter_map`
pub fn filter_map_v8(
  x1632 : (Term) -> Term? raise,
  x1633 : @oset.T[Term],
) -> @oset.T[Term] raise {
  let f = x1632
  let s = x1633
  @oset.filter_map(compare_v21, f, s)
}

///|
/// `partition`
pub fn[TA] partition_v10(
  x1634 : (TA) -> Bool raise,
  x1635 : @oset.T[TA],
) -> (@oset.T[TA], @oset.T[TA]) raise {
  let p = x1634
  let s = x1635
  @oset.partition(p, s)
}

///|
/// `cardinal`
pub fn[TA] cardinal_v8(x1636 : @oset.T[TA]) -> Int64 raise {
  let s = x1636
  @oset.cardinal(s)
}

///|
/// `elements`
pub fn[TA] elements_v3(x1637 : @oset.T[TA]) -> @list.List[TA] raise {
  let s = x1637
  @oset.elements(s)
}

///|
/// `min_elt`
pub fn[TA] min_elt_v3(x1638 : @oset.T[TA]) -> TA raise {
  let s = x1638
  @oset.min_elt(s)
}

///|
/// `min_elt_opt`
pub fn[TA] min_elt_opt_v3(x1639 : @oset.T[TA]) -> TA? raise {
  let s = x1639
  @oset.min_elt_opt(s)
}

///|
/// `max_elt`
pub fn[TA] max_elt_v3(x1640 : @oset.T[TA]) -> TA raise {
  let s = x1640
  @oset.max_elt(s)
}

///|
/// `max_elt_opt`
pub fn[TA] max_elt_opt_v3(x1641 : @oset.T[TA]) -> TA? raise {
  let s = x1641
  @oset.max_elt_opt(s)
}

///|
/// `choose`
pub fn[TA] choose_v8(x1642 : @oset.T[TA]) -> TA raise {
  let s = x1642
  @oset.choose(s)
}

///|
/// `choose_opt`
pub fn[TA] choose_opt_v8(x1643 : @oset.T[TA]) -> TA? raise {
  let s = x1643
  @oset.choose_opt(s)
}

///|
/// `split`
pub fn split_v8(
  x1644 : Term,
  x1645 : @oset.T[Term],
) -> (@oset.T[Term], Bool, @oset.T[Term]) raise {
  let x = x1644
  let s = x1645
  @oset.split(compare_v21, x, s)
}

///|
/// `find`
pub fn find_v10(x1646 : Term, x1647 : @oset.T[Term]) -> Term raise {
  let x = x1646
  let s = x1647
  @oset.find(compare_v21, x, s)
}

///|
/// `find_opt`
pub fn find_opt_v8(x1648 : Term, x1649 : @oset.T[Term]) -> Term? raise {
  let x = x1648
  let s = x1649
  @oset.find_opt(compare_v21, x, s)
}

///|
/// `find_first`
pub fn[TA] find_first_v8(
  x1650 : (TA) -> Bool raise,
  x1651 : @oset.T[TA],
) -> TA raise {
  let f = x1650
  let s = x1651
  @oset.find_first(f, s)
}

///|
/// `find_first_opt`
pub fn[TA] find_first_opt_v8(
  x1652 : (TA) -> Bool raise,
  x1653 : @oset.T[TA],
) -> TA? raise {
  let f = x1652
  let s = x1653
  @oset.find_first_opt(f, s)
}

///|
/// `find_last`
pub fn[TA] find_last_v8(
  x1654 : (TA) -> Bool raise,
  x1655 : @oset.T[TA],
) -> TA raise {
  let f = x1654
  let s = x1655
  @oset.find_last(f, s)
}

///|
/// `find_last_opt`
pub fn[TA] find_last_opt_v8(
  x1656 : (TA) -> Bool raise,
  x1657 : @oset.T[TA],
) -> TA? raise {
  let f = x1656
  let s = x1657
  @oset.find_last_opt(f, s)
}

///|
/// `subst`
#derive(Eq, Debug)
pub(all) enum Subst {
  Subst(Map4[Term])
}

///|
pub extend Subst with Eq::{not_equal, equal}

///|
pub extend Subst with Debug::{to_repr}

///|
pub extend Subst with @lib.OCompare::{ocompare}

///|
pub extend Subst with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_Subst(x : Subst) -> Int {
  match x {
    Subst(_) => 1000000
  }
}

///|
pub impl @lib.OCompare for Subst with fn ocompare(self, other) {
  match (self, other) {
    (Subst(a0), Subst(b0)) => @lib.compare(a0, b0)
    _ => ocaml_rank_Subst(self).compare(ocaml_rank_Subst(other))
  }
}

///|
pub impl @lib.OHash for Subst with fn ohash_visit(self, h) {
  match self {
    Subst(a0) => {
      h.block(0, 1)
      h.field(a0)
    }
  }
}

///|
/// empty
fn step_42() -> Unit raise {
  empty_v13_c.set(Subst::Subst(newmap_v3(())))
}

///|
let empty_v13_c : @lib.Cell[Subst] = @lib.Cell::new("empty")

///|
/// `empty`
pub fn empty_v13() -> Subst {
  empty_v13_c.get()
}

///|
/// `null`
pub fn null_v11(x1658 : Subst) -> Bool raise {
  match x1658 {
    Subst::Subst(m) => null_v7(m)
  }
}

///|
/// `size`
pub fn size_v10(x1659 : Subst) -> Int64 raise {
  match x1659 {
    Subst::Subst(m) => size_v6(m)
  }
}

///|
/// `peek`
pub fn peek_v6(x1660 : Subst) -> ((Name) -> Term? raise) raise {
  match x1660 {
    Subst::Subst(m) =>
      fn(x1661 : String) -> Term? raise {
        let v = x1661
        peek_v4(m, v)
      }
  }
}

///|
/// `insert`
pub fn insert_v5(x1662 : Subst) -> (((Name, Term)) -> Subst raise) raise {
  match x1662 {
    Subst::Subst(m) =>
      fn(x1663 : (String, Term)) -> Subst raise {
        let v_tm = x1663
        Subst::Subst(insert_v3(m, v_tm))
      }
  }
}

///|
/// `singleton`
pub fn singleton_v18(x1664 : (String, Term)) -> Subst raise {
  let v_tm = x1664
  insert_v5(empty_v13())(v_tm)
}

///|
/// `toList`
pub fn tolist_v10(x1665 : Subst) -> @list.List[(Key2, Term)] raise {
  match x1665 {
    Subst::Subst(m) => tolist_v6(m)
  }
}

///|
/// `fromList`
pub fn fromlist_v9(x1666 : @list.List[(String, Term)]) -> Subst raise {
  let l = x1666
  Subst::Subst(fromlist_v5(l))
}

///|
/// `foldl`
pub fn[TA] foldl_v10(
  x1667 : ((String, Term, TA)) -> TA raise,
  x1668 : TA,
  x1669 : Subst,
) -> TA raise {
  let f = x1667
  let b = x1668
  match x1669 {
    Subst::Subst(m) => foldl_v6(f, b, m)
  }
}

///|
/// `foldr`
pub fn[TA] foldr_v10(
  x1670 : ((String, Term, TA)) -> TA raise,
  x1671 : TA,
  x1672 : Subst,
) -> TA raise {
  let f = x1670
  let b = x1671
  match x1672 {
    Subst::Subst(m) => foldr_v6(f)(b)(m)
  }
}

///|
/// `normalize`
pub fn normalize(x1673 : Subst) -> Subst raise {
  match x1673 {
    Subst::Subst(m) as sub => {
      let isnotid : ((String, Term)) -> Bool raise = fn(
        x1674 : (String, Term),
      ) -> Bool raise {
        let (v, tm) = x1674
        !equalvar(v, tm)
      }
      let m_p = filter_v8(isnotid)(m)
      let t1675 = size_v6(m_p)
      if size_v6(m) == t1675 {
        sub
      } else {
        Subst::Subst(m_p)
      }
    }
  }
}

///|
/// `subst`
pub fn subst(x1676 : Subst) -> ((Term) -> Term raise) raise {
  let sub = x1676
  fn tmsub(x1678 : Term) -> Term raise {
    match x1678 {
      Term::Var(v) as tm =>
        match peek_v6(sub)(v) {
          Some(tm_p) => if physical_equal(tm, tm_p) { tm } else { tm_p }
          None => tm
        }
      Term::Fn((f, args)) as tm_1 => {
        let args_p = @lib.map(tmsub, args)
        if physical_equal(args, args_p) {
          tm_1
        } else {
          Term::Fn((f, args_p))
        }
      }
    }
  }
  fn(x1679 : Term) -> Term raise {
    let tm_2 = x1679
    if null_v11(sub) {
      tm_2
    } else {
      tmsub(tm_2)
    }
  }
}

///|
/// `restrict`
pub fn restrict(x1680 : Subst) -> ((@oset.T[Name]) -> Subst raise) raise {
  match x1680 {
    Subst::Subst(m) as sub =>
      fn(x1681 : @oset.T[String]) -> Subst raise {
        let varset = x1681
        let m_p = filter_v8(fn(x1684 : (String, Term)) -> Bool raise {
          ((x1682, x1683) => isrestrictedvar_l(varset, x1682, x1683))(
            x1684.0,
            x1684.1,
          )
        })(m)
        let t1685 = size_v6(m_p)
        if size_v6(m) == t1685 {
          sub
        } else {
          Subst::Subst(m_p)
        }
      }
  }
}

///|
fn[TA] isrestrictedvar_l(
  varset : @oset.T[String],
  x1682 : String,
  x1683 : TA,
) -> Bool raise {
  let (v, _) = (x1682, x1683)
  member_v2(v)(varset)
}

///|
/// `remove`
pub fn remove_v12(x1686 : Subst) -> ((@oset.T[Name]) -> Subst raise) raise {
  match x1686 {
    Subst::Subst(m) as sub =>
      fn(x1687 : @oset.T[String]) -> Subst raise {
        let varset = x1687
        let m_p = filter_v8(fn(x1690 : (String, Term)) -> Bool raise {
          ((x1688, x1689) => isrestrictedvar_l_1(varset, x1688, x1689))(
            x1690.0,
            x1690.1,
          )
        })(m)
        let t1691 = size_v6(m_p)
        if size_v6(m) == t1691 {
          sub
        } else {
          Subst::Subst(m_p)
        }
      }
  }
}

///|
fn[TA] isrestrictedvar_l_1(
  varset : @oset.T[String],
  x1688 : String,
  x1689 : TA,
) -> Bool raise {
  let (v, _) = (x1688, x1689)
  !member_v2(v)(varset)
}

///|
/// `compose`
pub fn compose_v1(x1692 : Subst) -> ((Subst) -> Subst raise) raise {
  match x1692 {
    Subst::Subst(m1) as sub1 =>
      fn(x1693 : Subst) -> Subst raise {
        let sub2 = x1693
        let f : ((String, Term, Subst)) -> Subst raise = fn(
          x1694 : (String, Term, Subst),
        ) -> Subst raise {
          let (v, tm, s) = x1694
          let t1695 = (v, subst(sub2)(tm))
          insert_v5(s)(t1695)
        }
        if null_v11(sub2) {
          sub1
        } else {
          foldl_v6(f, sub2, m1)
        }
      }
  }
}

///|
/// `union`
pub fn union_v18(x1696 : Subst) -> ((Subst) -> Subst raise) raise {
  match x1696 {
    Subst::Subst(m1) as s1 =>
      fn(x1697 : Subst) -> Subst raise {
        match x1697 {
          Subst::Subst(m2) as s2 =>
            if null_v7(m1) {
              s2
            } else if null_v7(m2) {
              s1
            } else {
              Subst::Subst(
                union_v9(
                  fn(x1700 : ((String, Term), (String, Term))) -> Term? raise {
                    compatible_l(x1700.0, x1700.1)
                  },
                  m1,
                  m2,
                ),
              )
            }
        }
      }
  }
}

///|
fn[TA, TB] compatible_l(x1698 : (TA, Term), x1699 : (TB, Term)) -> Term? raise {
  let ((_, tm1), (_, tm2)) = (x1698, x1699)
  if equal_v14(tm1, tm2) {
    Some(tm1)
  } else {
    raise Failure("Substitute.union: incompatible")
  }
}

///|
/// `invert`
pub fn invert(x1701 : Subst) -> Subst raise {
  match x1701 {
    Subst::Subst(m) => {
      let inv : ((String, Term, @omap.T[String, Term])) -> @omap.T[String, Term] raise = fn(
        x1702 : (String, Term, @omap.T[String, Term]),
      ) -> @omap.T[String, Term] raise {
        match x1702 {
          (v, Term::Var(w), s) =>
            if indomain_v3(w)(s) {
              raise Failure("Substitute.invert: non-injective")
            } else {
              insert_v3(s, (w, Term::Var(v)))
            }
          (_, Term::Fn(_), _) =>
            raise Failure("Substitute.invert: non-variable")
        }
      }
      Subst::Subst(foldl_v6(inv, newmap_v3(()), m))
    }
  }
}

///|
/// isRenaming
fn step_43() -> Unit raise {
  isrenaming_c.set((x1703 : Subst) => @lib.can(invert, x1703))
}

///|
let isrenaming_c : @lib.Cell[(Subst) -> Bool raise] = @lib.Cell::new(
  "isRenaming",
)

///|
/// `isRenaming`
pub fn isrenaming(x : Subst) -> Bool raise {
  isrenaming_c.get()(x)
}

///|
/// `freshVars`
pub fn freshvars(x1704 : @oset.T[String]) -> Subst raise {
  let s = x1704
  let add_1 : ((String, Subst)) -> Subst raise = fn(
    x1705 : (String, Subst),
  ) -> Subst raise {
    let (v, m) = x1705
    let t1706 = (v, newvar(()))
    insert_v5(m)(t1706)
  }
  foldl_v7(add_1)(empty_v13())(s)
}

///|
/// redexes
fn step_44() -> Unit raise {
  redexes_c.set((x1711 : Subst) => {
    foldl_v10(
      fn(x1710 : (String, Term, @oset.T[String])) -> @oset.T[String] raise {
        add_l(x1710.0, x1710.1, x1710.2)
      },
      empty_v7(),
      x1711,
    )
  })
}

///|
let redexes_c : @lib.Cell[(Subst) -> @oset.T[Name] raise] = @lib.Cell::new(
  "redexes",
)

///|
/// `redexes`
pub fn redexes(x : Subst) -> @oset.T[Name] raise {
  redexes_c.get()(x)
}

///|
fn[TA] add_l(
  x1707 : String,
  x1708 : TA,
  x1709 : @oset.T[String],
) -> @oset.T[Name] raise {
  let (v, _, s) = (x1707, x1708, x1709)
  add_v8(s, v)
}

///|
/// residueFreeVars
fn step_45() -> Unit raise {
  residuefreevars_c.set((x1717 : Subst) => {
    foldl_v10(
      fn(x1716 : (String, Term, @oset.T[String])) -> @oset.T[String] raise {
        add_l_1(x1716.0, x1716.1, x1716.2)
      },
      empty_v7(),
      x1717,
    )
  })
}

///|
let residuefreevars_c : @lib.Cell[(Subst) -> @oset.T[Name] raise] = @lib.Cell::new(
  "residueFreeVars",
)

///|
/// `residueFreeVars`
pub fn residuefreevars(x : Subst) -> @oset.T[Name] raise {
  residuefreevars_c.get()(x)
}

///|
fn[TA] add_l_1(
  x1712 : TA,
  x1713 : Term,
  x1714 : @oset.T[String],
) -> @oset.T[Name] raise {
  let (_, t, s) = (x1712, x1713, x1714)
  let t1715 = freevars(t)
  union_v11(s)(t1715)
}

///|
/// freeVars
fn step_46() -> Unit raise {
  let add_1 : ((String, Term, @oset.T[String])) -> @oset.T[String] raise = fn(
    x1718 : (String, Term, @oset.T[String]),
  ) -> @oset.T[String] raise {
    let (v, t, s) = x1718
    let t1719 = freevars(t)
    union_v11(add_v8(s, v))(t1719)
  }
  freevars_v1_c.set((x1720 : Subst) => foldl_v10(add_1, empty_v7(), x1720))
}

///|
let freevars_v1_c : @lib.Cell[(Subst) -> @oset.T[Name] raise] = @lib.Cell::new(
  "freeVars",
)

///|
/// `freeVars`
pub fn freevars_v1(x : Subst) -> @oset.T[Name] raise {
  freevars_v1_c.get()(x)
}

///|
/// functions
fn step_47() -> Unit raise {
  functions_v1_c.set((x1726 : Subst) => {
    foldl_v10(
      fn(
        x1725 : (String, Term, @oset.T[(String, Int64)]),
      ) -> @oset.T[(String, Int64)] raise {
        add_l_2(x1725.0, x1725.1, x1725.2)
      },
      empty_v10(),
      x1726,
    )
  })
}

///|
let functions_v1_c : @lib.Cell[(Subst) -> @oset.T[(Name, Int64)] raise] = @lib.Cell::new(
  "functions",
)

///|
/// `functions`
pub fn functions_v1(x : Subst) -> @oset.T[(Name, Int64)] raise {
  functions_v1_c.get()(x)
}

///|
fn[TA] add_l_2(
  x1721 : TA,
  x1722 : Term,
  x1723 : @oset.T[(String, Int64)],
) -> @oset.T[(Name, Int64)] raise {
  let (_, t, s) = (x1721, x1722, x1723)
  let t1724 = functions(t)
  union_v15(s)(t1724)
}

///|
/// `matchTerms`
pub fn matchterms(x1727 : Subst, x1728 : Term, x1729 : Term) -> Subst raise {
  let sub = x1727
  let tm1 = x1728
  let tm2 = x1729
  fn matchlist(x1730 : Subst, x1731 : @list.List[(Term, Term)]) -> Subst raise {
    let sub_1 = x1730
    match x1731 {
      Empty => sub_1
      More((Term::Var(v), tm), tail=rest) => {
        let sub_2 = match peek_v6(sub_1)(v) {
          None => insert_v5(sub_1)((v, tm))
          Some(tm_p) =>
            if equal_v14(tm, tm_p) {
              sub_1
            } else {
              raise Failure("Substitute.match: incompatible matches")
            }
        }
        matchlist(sub_2, rest)
      }
      More((Term::Fn((f1, args1)), Term::Fn((f2, args2))), tail=rest_1) =>
        if (if equal_v6(f1, f2) {
            let t1732 = Int::to_int64(@lib.length(args2))
            Int::to_int64(@lib.length(args1)) == t1732
          } else {
            false
          }) {
          matchlist(sub_1, @lib.zip(args1, args2).concat(rest_1))
        } else {
          raise Failure("Substitute.match: different structure")
        }
      _ => raise Failure("Substitute.match: functions can't match vars")
    }
  }
  matchlist(sub, @list.List([(tm1, tm2)]))
}

///|
/// `unify`
pub fn unify(x1733 : Subst, x1734 : Term, x1735 : Term) -> Subst raise {
  let sub = x1733
  let tm1 = x1734
  let tm2 = x1735
  let solve = (x1736 : Subst, x1737 : @list.List[(Term, Term)]) => {
    solve_l(x1736, x1737)
  }
  let solve_p = (x1739 : Subst, x1740 : (Term, Term, @list.List[(Term, Term)])) => {
    solve_p_l(x1739, x1740)
  }
  solve(sub, @list.List([(tm1, tm2)]))
}

///|
fn solve_l(x1736 : Subst, x1737 : @list.List[(Term, Term)]) -> Subst raise {
  let solve = (x1736 : Subst, x1737 : @list.List[(Term, Term)]) => {
    solve_l(x1736, x1737)
  }
  let solve_p = (x1739 : Subst, x1740 : (Term, Term, @list.List[(Term, Term)])) => {
    solve_p_l(x1739, x1740)
  }
  let sub_1 = x1736
  match x1737 {
    Empty => sub_1
    More((tm1_1, tm2_1), tail=rest) =>
      if physical_equal(tm1_1, tm2_1) {
        solve(sub_1, rest)
      } else {
        let t1738 = subst(sub_1)(tm2_1)
        solve_p(sub_1, (subst(sub_1)(tm1_1), t1738, rest))
      }
  }
}

///|
fn solve_p_l(
  x1739 : Subst,
  x1740 : (Term, Term, @list.List[(Term, Term)]),
) -> Subst raise {
  let solve = (x1736 : Subst, x1737 : @list.List[(Term, Term)]) => {
    solve_l(x1736, x1737)
  }
  let solve_p = (x1739 : Subst, x1740 : (Term, Term, @list.List[(Term, Term)])) => {
    solve_p_l(x1739, x1740)
  }
  let sub_2 = x1739
  match x1740 {
    (Term::Var(v), tm, rest_1) =>
      if equalvar(v, tm) {
        solve(sub_2, rest_1)
      } else if freein(v, tm) {
        raise Failure("Substitute.unify: occurs check")
      } else {
        match peek_v6(sub_2)(v) {
          None => {
            let t1741 = singleton_v18((v, tm))
            solve(compose_v1(sub_2)(t1741), rest_1)
          }
          Some(tm_p) => solve_p(sub_2, (tm_p, tm, rest_1))
        }
      }
    (tm1_2, Term::Var(_) as tm2_2, rest_2) =>
      solve_p(sub_2, (tm2_2, tm1_2, rest_2))
    (Term::Fn((f1, args1)), Term::Fn((f2, args2)), rest_3) =>
      if (if equal_v6(f1, f2) {
          let t1742 = Int::to_int64(@lib.length(args2))
          Int::to_int64(@lib.length(args1)) == t1742
        } else {
          false
        }) {
        solve(sub_2, @lib.zip(args1, args2).concat(rest_3))
      } else {
        raise Failure("Substitute.unify: different structure")
      }
  }
}

///|
/// `relationName`
pub type RelationName = Name

///|
/// `relation`
pub type Relation = (RelationName, Int64)

///|
/// `atom`
pub type Atom = (RelationName, @list.List[Term])

///|
/// `name`
pub fn name_v1(x1743 : String, x1744 : @list.List[Term]) -> RelationName raise {
  let (rel, _) = (x1743, x1744)
  rel
}

///|
/// `arguments`
pub fn arguments(
  x1745 : String,
  x1746 : @list.List[Term],
) -> @list.List[Term] raise {
  let (_, args) = (x1745, x1746)
  args
}

///|
/// `arity`
pub fn arity_v1(x1747 : (String, @list.List[Term])) -> Int64 raise {
  let atm = x1747
  Int::to_int64(@lib.length(arguments(atm.0, atm.1)))
}

///|
/// `relation`
pub fn relation(
  x1748 : (String, @list.List[Term]),
) -> (RelationName, Int64) raise {
  let atm = x1748
  let t1749 = arity_v1(atm)
  (name_v1(atm.0, atm.1), t1749)
}

///|
/// functions
fn step_48() -> Unit raise {
  let f : ((Term, @oset.T[(String, Int64)])) -> @oset.T[(String, Int64)] raise = fn(
    x1750 : (Term, @oset.T[(String, Int64)]),
  ) -> @oset.T[(String, Int64)] raise {
    let (tm, acc) = x1750
    union_v15(functions(tm))(acc)
  }
  functions_v2_c.set(fn(
    x1751 : (String, @list.List[Term]),
  ) -> @oset.T[(String, Int64)] raise {
    let atm = x1751
    foldl(f, empty_v10(), arguments(atm.0, atm.1))
  })
}

///|
let functions_v2_c : @lib.Cell[(Atom) -> @oset.T[(Name, Int64)] raise] = @lib.Cell::new(
  "functions",
)

///|
/// `functions`
pub fn functions_v2(x : Atom) -> @oset.T[(Name, Int64)] raise {
  functions_v2_c.get()(x)
}

///|
/// functionNames
fn step_49() -> Unit raise {
  let f : ((Term, @oset.T[String])) -> @oset.T[String] raise = fn(
    x1752 : (Term, @oset.T[String]),
  ) -> @oset.T[String] raise {
    let (tm, acc) = x1752
    union_v11(functionnames(tm))(acc)
  }
  functionnames_v1_c.set(fn(
    x1753 : (String, @list.List[Term]),
  ) -> @oset.T[String] raise {
    let atm = x1753
    foldl(f, empty_v7(), arguments(atm.0, atm.1))
  })
}

///|
let functionnames_v1_c : @lib.Cell[(Atom) -> @oset.T[Name] raise] = @lib.Cell::new(
  "functionNames",
)

///|
/// `functionNames`
pub fn functionnames_v1(x : Atom) -> @oset.T[Name] raise {
  functionnames_v1_c.get()(x)
}

///|
/// `mkBinop`
pub fn mkbinop_v1(x1754 : String, x1755 : (Term, Term)) -> Atom raise {
  let p = x1754
  let (a, b) = x1755
  (p, @list.List([a, b]))
}

///|
/// `destBinop`
pub fn[TA, TB : Eq + @lib.OCompare + @lib.OHash] destbinop_v1(
  x1756 : TB,
  x1757 : (TB, @list.List[TA]),
) -> (TA, TA) raise {
  let p = x1756
  match x1757 {
    (x, More(a, tail=More(b, tail=Empty))) =>
      if equal_v6(x, p) {
        (a, b)
      } else {
        raise Failure("Atom.destBinop: wrong binop")
      }
    _ => raise Failure("Atom.destBinop: not a binop")
  }
}

///|
/// `isBinop`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB] isbinop_v1(
  x1758 : TA,
) -> (((TA, @list.List[TB])) -> Bool raise) raise {
  let p = x1758
  (x1761 : (TA, @list.List[TB])) => {
    @lib.can((x1760 : (TA, @list.List[TB])) => destbinop_v1(p, x1760), x1761)
  }
}

///|
/// `symbols`
pub fn symbols_v1(x1762 : (String, @list.List[Term])) -> Int64 raise {
  let atm = x1762
  foldl(
    fn(x1763 : (Term, Int64)) -> Int64 raise {
      let (tm, z) = x1763
      @lib.add63(symbols(tm), z)
    },
    1L,
    arguments(atm.0, atm.1),
  )
}

///|
/// `compare`
pub fn compare_v24(
  x1764 : (String, @list.List[Term]),
  x1765 : (String, @list.List[Term]),
) -> Int64 raise {
  let (p1, tms1) = x1764
  let (p2, tms2) = x1765
  let c = compare_v10(p1)(p2)
  if c != 0L {
    c
  } else {
    lexcompare(fn(x1766 : Term) -> ((Term) -> Int64 raise) raise {
      fn(x1767 : Term) -> Int64 raise { compare_v20(x1766, x1767) }
    })(tms1)(tms2)
  }
}

///|
/// `equal`
pub fn equal_v17(
  x1768 : (String, @list.List[Term]),
  x1769 : (String, @list.List[Term]),
) -> Bool raise {
  let atm1 = x1768
  let atm2 = x1769
  compare_v24(atm1, atm2) == 0L
}

///|
/// `subterm`
pub fn[TA] subterm_v1(
  x : (TA, @list.List[Term]),
) -> ((@list.List[Int64]) -> Term raise) raise {
  let f : ((TA, @list.List[Term])) -> ((@list.List[Int64]) -> Term raise) raise = x1771 => {
    let x = x1771
    fn(x1772 : @list.List[Int64]) -> Term raise {
      let y = x1772
      subterm_p_l((x, y))
    }
  }
  f(x)
}

///|
fn[TB] subterm_p_l(
  x1770 : ((TB, @list.List[Term]), @list.List[Int64]),
) -> Term raise {
  match x1770 {
    (_, Empty) => raise Bug::Bug("Atom.subterm: empty path")
    ((_, tms), More(h, tail=t)) =>
      if h >= Int::to_int64(@lib.length(tms)) {
        raise Failure("Atom.subterm: bad path")
      } else {
        subterm(@lib.list_nth(tms, @lib.int63_to_int(h)), t)
      }
  }
}

///|
/// `subterms`
pub fn subterms_v1(
  x1773 : String,
  x1774 : @list.List[Term],
) -> @list.List[(@list.List[Int64], Term)] raise {
  let (_, tms) = (x1773, x1774)
  let f : (((Int64, Term), @list.List[(@list.List[Int64], Term)])) -> @list.List[
    (@list.List[Int64], Term),
  ] raise = fn(
    x1775 : ((Int64, Term), @list.List[(@list.List[Int64], Term)]),
  ) -> @list.List[(@list.List[Int64], Term)] raise {
    let ((n, tm), l) = x1775
    @lib.map(
      fn(x1776 : (@list.List[Int64], Term)) -> (@list.List[Int64], Term) raise {
        let (p, s) = x1776
        (p.prepend(n), s)
      },
      subterms(tm),
    ).concat(l)
  }
  foldl(f, @list.List([]), enumerate(tms))
}

///|
/// `replace`
pub fn[TA] replace_v1(
  x1777 : (TA, @list.List[Term]),
  x1778 : (@list.List[Int64], Term),
) -> (TA, @list.List[Term]) raise {
  let (rel, tms) as atm = x1777
  match x1778 {
    (Empty, _) => raise Bug::Bug("Atom.replace: empty path")
    (More(h, tail=t), res) =>
      if h >= Int::to_int64(@lib.length(tms)) {
        raise Failure("Atom.replace: bad path")
      } else {
        let tm = @lib.list_nth(tms, @lib.int63_to_int(h))
        let tm_p = replace(tm, (t, res))
        if physical_equal(tm, tm_p) {
          atm
        } else {
          (rel, updatenth((h, tm_p), tms))
        }
      }
  }
}

///|
/// `find`
pub fn[TA] find_v11(
  x1779 : (Term) -> Bool raise,
) -> (((TA, @list.List[Term])) -> @list.List[Int64]? raise) raise {
  let pred = x1779
  let f : ((Int64, Term)) -> @list.List[Int64]? raise = fn(
    x1781 : (Int64, Term),
  ) -> @list.List[Int64]? raise {
    let (i, tm) = x1781
    match find_v8(pred)(tm) {
      Some(path) => Some(path.prepend(i))
      None => None
    }
  }
  fn(x1782 : (TA, @list.List[Term])) -> @list.List[Int64]? raise {
    let (_, tms) = x1782
    first(f, enumerate(tms))
  }
}

///|
/// `freeIn`
pub fn freein_v1(
  x1783 : String,
  x1784 : (String, @list.List[Term]),
) -> Bool raise {
  let v = x1783
  let atm = x1784
  @lib.exists((x1785 : Term) => freein(v, x1785), arguments(atm.0, atm.1))
}

///|
/// freeVars
fn step_50() -> Unit raise {
  let f : ((Term, @oset.T[String])) -> @oset.T[String] raise = fn(
    x1786 : (Term, @oset.T[String]),
  ) -> @oset.T[String] raise {
    let (tm, acc) = x1786
    union_v11(freevars(tm))(acc)
  }
  freevars_v2_c.set(fn(
    x1787 : (String, @list.List[Term]),
  ) -> @oset.T[String] raise {
    let atm = x1787
    foldl(f, empty_v7(), arguments(atm.0, atm.1))
  })
}

///|
let freevars_v2_c : @lib.Cell[(Atom) -> @oset.T[Name] raise] = @lib.Cell::new(
  "freeVars",
)

///|
/// `freeVars`
pub fn freevars_v2(x : Atom) -> @oset.T[Name] raise {
  freevars_v2_c.get()(x)
}

///|
/// `subst`
pub fn subst_v1(
  x1788 : Subst,
  x1789 : (String, @list.List[Term]),
) -> Atom raise {
  let sub = x1788
  let (p, tms) as atm = x1789
  let tms_p = @lib.map(subst(sub), tms)
  if physical_equal(tms_p, tms) {
    atm
  } else {
    (p, tms_p)
  }
}

///|
/// `matchAtoms`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] matchatoms(
  x1790 : Subst,
  x1791 : (TA, @list.List[Term]),
  x1792 : (TA, @list.List[Term]),
) -> Subst raise {
  let sub = x1790
  let (p1, tms1) = x1791
  let (p2, tms2) = x1792
  let matcharg : (((Term, Term), Subst)) -> Subst raise = fn(
    x1793 : ((Term, Term), Subst),
  ) -> Subst raise {
    let ((tm1, tm2), sub_1) = x1793
    matchterms(sub_1, tm1, tm2)
  }
  let _ = (if equal_v6(p1, p2) {
      let t1794 = Int::to_int64(@lib.length(tms2))
      Int::to_int64(@lib.length(tms1)) == t1794
    } else {
      false
    }) ||
    @lib.raise_error(Failure("Atom.match"))
  foldl(matcharg, sub, @lib.zip(tms1, tms2))
}

///|
/// `unify`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] unify_v1(
  x1795 : Subst,
  x1796 : (TA, @list.List[Term]),
  x1797 : (TA, @list.List[Term]),
) -> Subst raise {
  let sub = x1795
  let (p1, tms1) = x1796
  let (p2, tms2) = x1797
  let unifyarg : (((Term, Term), Subst)) -> Subst raise = fn(
    x1798 : ((Term, Term), Subst),
  ) -> Subst raise {
    let ((tm1, tm2), sub_1) = x1798
    unify(sub_1, tm1, tm2)
  }
  let _ = (if equal_v6(p1, p2) {
      let t1799 = Int::to_int64(@lib.length(tms2))
      Int::to_int64(@lib.length(tms1)) == t1799
    } else {
      false
    }) ||
    @lib.raise_error(Failure("Atom.unify"))
  foldl(unifyarg, sub, @lib.zip(tms1, tms2))
}

///|
/// eqRelationName
fn step_51() -> Unit raise {
  eqrelationname_c.set(fromstring("="))
}

///|
let eqrelationname_c : @lib.Cell[Name] = @lib.Cell::new("eqRelationName")

///|
/// `eqRelationName`
pub fn eqrelationname() -> Name {
  eqrelationname_c.get()
}

///|
/// eqRelationArity
fn step_52() -> Unit raise {
  eqrelationarity_c.set(2L)
}

///|
let eqrelationarity_c : @lib.Cell[Int64] = @lib.Cell::new("eqRelationArity")

///|
/// `eqRelationArity`
pub fn eqrelationarity() -> Int64 {
  eqrelationarity_c.get()
}

///|
/// eqRelation
fn step_53() -> Unit raise {
  eqrelation_c.set((eqrelationname(), eqrelationarity()))
}

///|
let eqrelation_c : @lib.Cell[(Name, Int64)] = @lib.Cell::new("eqRelation")

///|
/// `eqRelation`
pub fn eqrelation() -> (Name, Int64) {
  eqrelation_c.get()
}

///|
/// mkEq
fn step_54() -> Unit raise {
  mkeq_c.set((x1800 : (Term, Term)) => mkbinop_v1(eqrelationname(), x1800))
}

///|
let mkeq_c : @lib.Cell[((Term, Term)) -> Atom raise] = @lib.Cell::new("mkEq")

///|
/// `mkEq`
pub fn mkeq(x : (Term, Term)) -> Atom raise {
  mkeq_c.get()(x)
}

///|
/// `destEq`
pub fn[TA] desteq(x1801 : (String, @list.List[TA])) -> (TA, TA) raise {
  let x = x1801
  destbinop_v1(eqrelationname(), x)
}

///|
/// `isEq`
pub fn[TA] iseq(x1802 : (String, @list.List[TA])) -> Bool raise {
  let x = x1802
  isbinop_v1(eqrelationname())(x)
}

///|
/// `mkRefl`
pub fn mkrefl(x1803 : Term) -> Atom raise {
  let tm = x1803
  mkeq((tm, tm))
}

///|
/// `destRefl`
pub fn destrefl(x1804 : (String, @list.List[Term])) -> Term raise {
  let atm = x1804
  let (l, r) = desteq(atm)
  let _ = equal_v14(l, r) || @lib.raise_error(Failure("Atom.destRefl"))
  l
}

///|
/// `isRefl`
pub fn isrefl(x1805 : (String, @list.List[Term])) -> Bool raise {
  let x = x1805
  @lib.can(destrefl, x)
}

///|
/// `sym`
pub fn sym(x1806 : (String, @list.List[Term])) -> Atom raise {
  let atm = x1806
  let (l, r) = desteq(atm)
  let _ = !equal_v14(l, r) || @lib.raise_error(Failure("Atom.sym: refl"))
  mkeq((r, l))
}

///|
/// `lhs`
pub fn[TA] lhs(x1807 : (String, @list.List[TA])) -> TA raise {
  let atm = x1807
  desteq(atm).0
}

///|
/// `rhs`
pub fn[TA] rhs(x1808 : (String, @list.List[TA])) -> TA raise {
  let atm = x1808
  desteq(atm).1
}

///|
/// `typedSymbols`
pub fn typedsymbols_v1(x1809 : String, x1810 : @list.List[Term]) -> Int64 raise {
  let (_, tms) = (x1809, x1810)
  foldl(
    fn(x1811 : (Term, Int64)) -> Int64 raise {
      let (tm, z) = x1811
      @lib.add63(typedsymbols(tm), z)
    },
    1L,
    tms,
  )
}

///|
/// `nonVarTypedSubterms`
pub fn[TA] nonvartypedsubterms_v1(
  x1812 : TA,
  x1813 : @list.List[Term],
) -> @list.List[(@list.List[Int64], Term)] raise {
  let (_, tms) = (x1812, x1813)
  let addarg : (((Int64, Term), @list.List[(@list.List[Int64], Term)])) -> @list.List[
    (@list.List[Int64], Term),
  ] raise = fn(
    x1814 : ((Int64, Term), @list.List[(@list.List[Int64], Term)]),
  ) -> @list.List[(@list.List[Int64], Term)] raise {
    let ((n, arg), acc) = x1814
    foldl(
      fn(
        x1817 : (
          (@list.List[Int64], Term),
          @list.List[(@list.List[Int64], Term)],
        ),
      ) -> @list.List[(@list.List[Int64], Term)] raise {
        ((x1815, x1816) => addtm_l(n, x1815, x1816))(x1817.0, x1817.1)
      },
      acc,
      nonvartypedsubterms(arg),
    )
  }
  foldl(addarg, @list.List([]), enumerate(tms))
}

///|
fn[TB] addtm_l(
  n : Int64,
  x1815 : (@list.List[Int64], TB),
  x1816 : @list.List[(@list.List[Int64], TB)],
) -> @list.List[(@list.List[Int64], TB)] raise {
  let ((path, tm), acc_1) = (x1815, x1816)
  acc_1.prepend((path.prepend(n), tm))
}

///|
/// `t`
pub type T15 = Atom

///|
/// compare
fn step_55() -> Unit raise {
  compare_v25_c.set(fn(
    x1818 : (String, @list.List[Term]),
  ) -> (((String, @list.List[Term])) -> Int64 raise) raise {
    fn(x1819 : (String, @list.List[Term])) -> Int64 raise {
      compare_v24(x1818, x1819)
    }
  })
}

///|
let compare_v25_c : @lib.Cell[
  ((Name, @list.List[Term])) -> (((Name, @list.List[Term])) -> Int64 raise) raise,
] = @lib.Cell::new("compare")

///|
/// `compare`
pub fn compare_v25(
  x : (Name, @list.List[Term]),
) -> (((Name, @list.List[Term])) -> Int64 raise) raise {
  compare_v25_c.get()(x)
}

///|
/// `key`
pub type Key5 = T15

///|
/// `t`
pub type T16[TA] = @omap.T[Key5, TA]

///|
/// `empty`
pub fn[TA, TB] empty_v14() -> @omap.T[TA, TB] {
  @omap.empty()
}

///|
/// `is_empty`
pub fn[TA, TB] is_empty_v9(x1820 : @omap.T[TA, TB]) -> Bool raise {
  let m = x1820
  @omap.is_empty(m)
}

///|
/// `mem`
pub fn[TA] mem_v9(
  x1821 : (String, @list.List[Term]),
  x1822 : @omap.T[(String, @list.List[Term]), TA],
) -> Bool raise {
  let x = x1821
  let m = x1822
  @omap.mem(compare_v25, x, m)
}

///|
/// `add`
pub fn[TA] add_v14(
  x1823 : (String, @list.List[Term]),
  x1824 : TA,
  x1825 : @omap.T[(String, @list.List[Term]), TA],
) -> @omap.T[(Name, @list.List[Term]), TA] raise {
  let x = x1823
  let data = x1824
  let m = x1825
  @omap.add(compare_v25, x, data, m)
}

///|
/// `update`
pub fn[TA] update_v5(
  x1826 : (String, @list.List[Term]),
  x1827 : (TA?) -> TA? raise,
  x1828 : @omap.T[(String, @list.List[Term]), TA],
) -> @omap.T[(Name, @list.List[Term]), TA] raise {
  let x = x1826
  let f = x1827
  let m = x1828
  @omap.update(compare_v25, x, f, m)
}

///|
/// `singleton`
pub fn[TA, TB] singleton_v19(x1829 : TA, x1830 : TB) -> @omap.T[TA, TB] raise {
  let x = x1829
  let d = x1830
  @omap.singleton(x, d)
}

///|
/// `remove`
pub fn[TA] remove_v13(
  x1831 : (String, @list.List[Term]),
  x1832 : @omap.T[(String, @list.List[Term]), TA],
) -> @omap.T[(Name, @list.List[Term]), TA] raise {
  let x = x1831
  let m = x1832
  @omap.remove(compare_v25, x, m)
}

///|
/// `merge`
pub fn[TA, TB, TC] merge_v7(
  x1833 : ((String, @list.List[Term])) -> ((TC?) -> ((TB?) -> TA? raise) raise) raise,
  x1834 : @omap.T[(String, @list.List[Term]), TC],
  x1835 : @omap.T[(String, @list.List[Term]), TB],
) -> @omap.T[(Name, @list.List[Term]), TA] raise {
  let f = x1833
  let s1 = x1834
  let s2 = x1835
  @omap.merge(compare_v25, f, s1, s2)
}

///|
/// `union`
pub fn[TA] union_v19(
  x1836 : ((String, @list.List[Term])) -> ((TA) -> ((TA) -> TA? raise) raise) raise,
  x1837 : @omap.T[(String, @list.List[Term]), TA],
  x1838 : @omap.T[(String, @list.List[Term]), TA],
) -> @omap.T[(Name, @list.List[Term]), TA] raise {
  let f = x1836
  let s1 = x1837
  let s2 = x1838
  @omap.union(compare_v25, f, s1, s2)
}

///|
/// `compare`
pub fn[TA, TB] compare_v26(
  x1839 : (TB) -> ((TA) -> Int64 raise) raise,
  x1840 : @omap.T[(String, @list.List[Term]), TB],
  x1841 : @omap.T[(String, @list.List[Term]), TA],
) -> Int64 raise {
  let cmp = x1839
  let m1 = x1840
  let m2 = x1841
  @omap.compare(compare_v25, cmp, m1, m2)
}

///|
/// `equal`
pub fn[TA, TB] equal_v18(
  x1842 : (TB) -> ((TA) -> Bool raise) raise,
  x1843 : @omap.T[(String, @list.List[Term]), TB],
  x1844 : @omap.T[(String, @list.List[Term]), TA],
) -> Bool raise {
  let cmp = x1842
  let m1 = x1843
  let m2 = x1844
  @omap.equal(compare_v25, cmp, m1, m2)
}

///|
/// `iter`
pub fn[TA, TB, TC] iter_v9(
  x1845 : (TC) -> ((TB) -> TA raise) raise,
  x1846 : @omap.T[TC, TB],
) -> Unit raise {
  let f = x1845
  let m = x1846
  @omap.iter(f, m)
}

///|
/// `fold`
pub fn[TA, TB, TC] fold_v9(
  x1847 : (TC) -> ((TB) -> ((TA) -> TA raise) raise) raise,
  x1848 : @omap.T[TC, TB],
  x1849 : TA,
) -> TA raise {
  let f = x1847
  let m = x1848
  let accu = x1849
  @omap.fold(f, m, accu)
}

///|
/// `for_all`
pub fn[TA, TB] for_all_v9(
  x1850 : (TB) -> ((TA) -> Bool raise) raise,
  x1851 : @omap.T[TB, TA],
) -> Bool raise {
  let p = x1850
  let m = x1851
  @omap.for_all(p, m)
}

///|
/// `exists`
pub fn[TA, TB] exists_v18(
  x1852 : (TB) -> ((TA) -> Bool raise) raise,
  x1853 : @omap.T[TB, TA],
) -> Bool raise {
  let p = x1852
  let m = x1853
  @omap.exists(p, m)
}

///|
/// `filter`
pub fn[TA, TB] filter_v15(
  x1854 : (TA) -> ((TB) -> Bool raise) raise,
  x1855 : @omap.T[TA, TB],
) -> @omap.T[TA, TB] raise {
  let p = x1854
  let m = x1855
  @omap.filter(p, m)
}

///|
/// `filter_map`
pub fn[TA, TB, TC] filter_map_v9(
  x1856 : (TA) -> ((TC) -> TB? raise) raise,
  x1857 : @omap.T[TA, TC],
) -> @omap.T[TA, TB] raise {
  let f = x1856
  let m = x1857
  @omap.filter_map(f, m)
}

///|
/// `partition`
pub fn[TA, TB] partition_v11(
  x1858 : (TA) -> ((TB) -> Bool raise) raise,
  x1859 : @omap.T[TA, TB],
) -> (@omap.T[TA, TB], @omap.T[TA, TB]) raise {
  let p = x1858
  let m = x1859
  @omap.partition(p, m)
}

///|
/// `cardinal`
pub fn[TA, TB] cardinal_v9(x1860 : @omap.T[TA, TB]) -> Int64 raise {
  let m = x1860
  @omap.cardinal(m)
}

///|
/// `bindings`
pub fn[TA, TB] bindings_v5(
  x1861 : @omap.T[TA, TB],
) -> @list.List[(TA, TB)] raise {
  let s = x1861
  @omap.bindings(s)
}

///|
/// `min_binding`
pub fn[TA, TB] min_binding_v5(x1862 : @omap.T[TA, TB]) -> (TA, TB) raise {
  let m = x1862
  @omap.min_binding(m)
}

///|
/// `min_binding_opt`
pub fn[TA, TB] min_binding_opt_v5(x1863 : @omap.T[TA, TB]) -> (TA, TB)? raise {
  let m = x1863
  @omap.min_binding_opt(m)
}

///|
/// `max_binding`
pub fn[TA, TB] max_binding_v5(x1864 : @omap.T[TA, TB]) -> (TA, TB) raise {
  let m = x1864
  @omap.max_binding(m)
}

///|
/// `max_binding_opt`
pub fn[TA, TB] max_binding_opt_v5(x1865 : @omap.T[TA, TB]) -> (TA, TB)? raise {
  let m = x1865
  @omap.max_binding_opt(m)
}

///|
/// `choose`
pub fn[TA, TB] choose_v9(x1866 : @omap.T[TA, TB]) -> (TA, TB) raise {
  let m = x1866
  @omap.choose(m)
}

///|
/// `choose_opt`
pub fn[TA, TB] choose_opt_v9(x1867 : @omap.T[TA, TB]) -> (TA, TB)? raise {
  let m = x1867
  @omap.choose_opt(m)
}

///|
/// `split`
pub fn[TA] split_v9(
  x1868 : (String, @list.List[Term]),
  x1869 : @omap.T[(String, @list.List[Term]), TA],
) -> (
  @omap.T[(Name, @list.List[Term]), TA],
  TA?,
  @omap.T[(Name, @list.List[Term]), TA],
) raise {
  let x = x1868
  let m = x1869
  @omap.split(compare_v25, x, m)
}

///|
/// `find`
pub fn[TA] find_v12(
  x1870 : (String, @list.List[Term]),
  x1871 : @omap.T[(String, @list.List[Term]), TA],
) -> TA raise {
  let x = x1870
  let m = x1871
  @omap.find(compare_v25, x, m)
}

///|
/// `find_opt`
pub fn[TA] find_opt_v9(
  x1872 : (String, @list.List[Term]),
  x1873 : @omap.T[(String, @list.List[Term]), TA],
) -> TA? raise {
  let x = x1872
  let m = x1873
  @omap.find_opt(compare_v25, x, m)
}

///|
/// `find_first`
pub fn[TA, TB] find_first_v9(
  x1874 : (TA) -> Bool raise,
  x1875 : @omap.T[TA, TB],
) -> (TA, TB) raise {
  let f = x1874
  let m = x1875
  @omap.find_first(f, m)
}

///|
/// `find_first_opt`
pub fn[TA, TB] find_first_opt_v9(
  x1876 : (TA) -> Bool raise,
  x1877 : @omap.T[TA, TB],
) -> (TA, TB)? raise {
  let f = x1876
  let m = x1877
  @omap.find_first_opt(f, m)
}

///|
/// `find_last`
pub fn[TA, TB] find_last_v9(
  x1878 : (TA) -> Bool raise,
  x1879 : @omap.T[TA, TB],
) -> (TA, TB) raise {
  let f = x1878
  let m = x1879
  @omap.find_last(f, m)
}

///|
/// `find_last_opt`
pub fn[TA, TB] find_last_opt_v9(
  x1880 : (TA) -> Bool raise,
  x1881 : @omap.T[TA, TB],
) -> (TA, TB)? raise {
  let f = x1880
  let m = x1881
  @omap.find_last_opt(f, m)
}

///|
/// `map`
pub fn[TA, TB, TC] map_v11(
  x1882 : (TC) -> TB raise,
  x1883 : @omap.T[TA, TC],
) -> @omap.T[TA, TB] raise {
  let f = x1882
  let m = x1883
  @omap.map(f, m)
}

///|
/// `mapi`
pub fn[TA, TB, TC] mapi_v5(
  x1884 : (TA) -> ((TC) -> TB raise) raise,
  x1885 : @omap.T[TA, TC],
) -> @omap.T[TA, TB] raise {
  let f = x1884
  let m = x1885
  @omap.mapi(f, m)
}

///|
/// `map`
pub type Map6[TA] = T16[TA]

///|
/// `newMap`
pub fn[TA, TB] newmap_v5(x1886 : Unit) -> @omap.T[TA, TB] raise {
  let _ = x1886
  empty_v14()
}

///|
/// `null`
pub fn[TA, TB] null_v12(x : @omap.T[TA, TB]) -> Bool raise {
  let f : (@omap.T[TA, TB]) -> Bool raise = is_empty_v9
  f(x)
}

///|
/// `singleton`
pub fn[TA, TB] singleton_v20(x1887 : TA, x1888 : TB) -> @omap.T[TA, TB] raise {
  let (k, x) = (x1887, x1888)
  singleton_v19(k, x)
}

///|
/// `size`
pub fn[TA, TB] size_v11(x : @omap.T[TA, TB]) -> Int64 raise {
  let f : (@omap.T[TA, TB]) -> Int64 raise = cardinal_v9
  f(x)
}

///|
/// `get`
pub fn[TA] get_v5(
  x1889 : @omap.T[(String, @list.List[Term]), TA],
  x1890 : (String, @list.List[Term]),
) -> TA raise {
  let m = x1889
  let k = x1890
  find_v12(k, m) catch {
    @lib.NotFound => raise Failure("Mmap.get: element not found")
    e => raise e
  }
}

///|
/// `peek`
pub fn[TA] peek_v7(
  x1891 : @omap.T[(String, @list.List[Term]), TA],
  x1892 : (String, @list.List[Term]),
) -> TA? raise {
  let m = x1891
  let k = x1892
  Some(find_v12(k, m)) catch {
    @lib.NotFound => None
    e => raise e
  }
}

///|
/// `insert`
pub fn[TA] insert_v6(
  x1893 : @omap.T[(String, @list.List[Term]), TA],
  x1894 : ((String, @list.List[Term]), TA),
) -> @omap.T[(Name, @list.List[Term]), TA] raise {
  let m = x1893
  let (k, v) = x1894
  add_v14(k, v, m)
}

///|
/// `toList`
pub fn[TA, TB] tolist_v11(x : @omap.T[TA, TB]) -> @list.List[(TA, TB)] raise {
  let f : (@omap.T[TA, TB]) -> @list.List[(TA, TB)] raise = bindings_v5
  f(x)
}

///|
/// `fromList`
pub fn[TA] fromlist_v10(
  x1895 : @list.List[((String, @list.List[Term]), TA)],
) -> @omap.T[(Name, @list.List[Term]), TA] raise {
  let l = x1895
  @lib.itlist(
    fn(
      x1896 : ((String, @list.List[Term]), TA),
      x1897 : @omap.T[(String, @list.List[Term]), TA],
    ) -> @omap.T[(String, @list.List[Term]), TA] raise {
      let (v, tm) = x1896
      ((x1898 : @omap.T[(String, @list.List[Term]), TA]) => {
        add_v14(v, tm, x1898)
      })(x1897)
    },
    l,
    empty_v14(),
  )
}

///|
/// `foldl`
pub fn[TA, TB, TC] foldl_v11(
  x1899 : ((TB, TC, TA)) -> TA raise,
  x1900 : TA,
  x1901 : @omap.T[TB, TC],
) -> TA raise {
  let f = x1899
  let b = x1900
  let m = x1901
  @lib.fold_left(
    fn(x1902 : TA, x1903 : (TB, TC)) -> TA raise {
      let s = x1902
      let (v, tm) = x1903
      f((v, tm, s))
    },
    b,
    bindings_v5(m),
  )
}

///|
/// `foldr`
pub fn[TA, TB, TC] foldr_v11(
  x : ((TB, TC, TA)) -> TA raise,
) -> ((TA) -> ((@omap.T[TB, TC]) -> TA raise) raise) raise {
  let f : (((TB, TC, TA)) -> TA raise) -> ((TA) -> ((@omap.T[TB, TC]) -> TA raise) raise) raise = x1904 => {
    x1905 => x1906 => foldl_v11(x1904, x1905, x1906)
  }
  f(x)
}

///|
/// `filter`
pub fn[TA, TB] filter_v16(
  x1907 : ((TA, TB)) -> Bool raise,
) -> ((@omap.T[TA, TB]) -> @omap.T[TA, TB] raise) raise {
  let f = x1907
  (x1911 : @omap.T[TA, TB]) => {
    filter_v15(
      fn(x1909 : TA) -> ((TB) -> Bool raise) raise {
        let x = x1909
        fn(x1910 : TB) -> Bool raise {
          let y = x1910
          f((x, y))
        }
      },
      x1911,
    )
  }
}

///|
/// `inDomain`
pub fn[TA] indomain_v5(
  x : (Name, @list.List[Term]),
) -> ((@omap.T[(Name, @list.List[Term]), TA]) -> Bool raise) raise {
  let f : ((Name, @list.List[Term])) -> ((@omap.T[(Name, @list.List[Term]), TA]) -> Bool raise) raise = (
    x1912 : (String, @list.List[Term]),
  ) => x1913 => mem_v9(x1912, x1913)
  f(x)
}

///|
/// `union`
pub fn[TA] union_v20(
  x1914 : ((((String, @list.List[Term]), TA), ((String, @list.List[Term]), TA))) -> TA? raise,
  x1915 : @omap.T[(String, @list.List[Term]), TA],
  x1916 : @omap.T[(String, @list.List[Term]), TA],
) -> @omap.T[(Name, @list.List[Term]), TA] raise {
  let f = x1914
  let m1 = x1915
  let m2 = x1916
  let f_p : ((String, @list.List[Term])) -> (((TA?, TA?)) -> TA? raise) raise = fn(
    x1917 : (String, @list.List[Term]),
  ) -> (((TA?, TA?)) -> TA? raise) raise {
    let k = x1917
    fn(x1918 : (TA?, TA?)) -> TA? raise {
      match x1918 {
        (Some(x), Some(y)) => f(((k, x), (k, y)))
        (Some(x_1), None) => Some(x_1)
        (None, Some(y_1)) => Some(y_1)
        (None, None) => None
      }
    }
  }
  merge_v7(
    fn(
      x1919 : (String, @list.List[Term]),
    ) -> ((TA?) -> ((TA?) -> TA? raise) raise) raise {
      let k_1 = x1919
      fn(x1920 : TA?) -> ((TA?) -> TA? raise) raise {
        let x_2 = x1920
        fn(x1921 : TA?) -> TA? raise {
          let y_2 = x1921
          f_p(k_1)((x_2, y_2))
        }
      }
    },
    m1,
    m2,
  )
}

///|
/// `delete`
pub fn[TA] delete_v9(
  x1922 : @omap.T[(String, @list.List[Term]), TA],
  x1923 : (String, @list.List[Term]),
) -> @omap.T[(Name, @list.List[Term]), TA] raise {
  let m = x1922
  let k = x1923
  remove_v13(k, m)
}

///|
/// `mapPartial`
pub fn[TA, TB] mappartial_v6(
  x1924 : (((String, @list.List[Term]), TB)) -> TA? raise,
  x1925 : @omap.T[(String, @list.List[Term]), TB],
) -> @omap.T[(Name, @list.List[Term]), TA] raise {
  let f = x1924
  let m = x1925
  fold_v9(
    fn(
      x1926 : (String, @list.List[Term]),
    ) -> ((TB) -> ((@omap.T[(String, @list.List[Term]), TA]) -> @omap.T[
      (String, @list.List[Term]),
      TA,
    ] raise) raise) raise {
      let k = x1926
      fn(
        x1927 : TB,
      ) -> ((@omap.T[(String, @list.List[Term]), TA]) -> @omap.T[
        (String, @list.List[Term]),
        TA,
      ] raise) raise {
        let x = x1927
        fn(
          x1928 : @omap.T[(String, @list.List[Term]), TA],
        ) -> @omap.T[(String, @list.List[Term]), TA] raise {
          let acc = x1928
          match f((k, x)) {
            Some(y) => add_v14(k, y, acc)
            None => acc
          }
        }
      }
    },
    m,
    empty_v14(),
  )
}

///|
/// `transform`
pub fn[TA, TB, TC] transform_v9(
  x : (TC) -> TB raise,
) -> ((@omap.T[TA, TC]) -> @omap.T[TA, TB] raise) raise {
  let f : ((TC) -> TB raise) -> ((@omap.T[TA, TC]) -> @omap.T[TA, TB] raise) raise = x1929 => {
    x1930 => map_v11(x1929, x1930)
  }
  f(x)
}

///|
/// `exists`
pub fn[TA, TB] exists_v19(
  x1931 : ((TA, TB)) -> Bool raise,
) -> ((@omap.T[TA, TB]) -> Bool raise) raise {
  let f = x1931
  (x1935 : @omap.T[TA, TB]) => {
    exists_v18(
      fn(x1933 : TA) -> ((TB) -> Bool raise) raise {
        let k = x1933
        fn(x1934 : TB) -> Bool raise {
          let m = x1934
          f((k, m))
        }
      },
      x1935,
    )
  }
}

///|
/// `elt`
pub type Elt4 = T15

///|
/// `t`
pub type T17 = @oset.T[Elt4]

///|
/// `empty`
pub fn[TA] empty_v15() -> @oset.T[TA] {
  @oset.empty()
}

///|
/// `is_empty`
pub fn[TA] is_empty_v10(x1936 : @oset.T[TA]) -> Bool raise {
  let s = x1936
  @oset.is_empty(s)
}

///|
/// `mem`
pub fn mem_v10(
  x1937 : (String, @list.List[Term]),
  x1938 : @oset.T[(String, @list.List[Term])],
) -> Bool raise {
  let x = x1937
  let s = x1938
  @oset.mem(compare_v25, x, s)
}

///|
/// `add`
pub fn add_v15(
  x1939 : (String, @list.List[Term]),
  x1940 : @oset.T[(String, @list.List[Term])],
) -> @oset.T[(Name, @list.List[Term])] raise {
  let x = x1939
  let s = x1940
  @oset.add(compare_v25, x, s)
}

///|
/// `singleton`
pub fn[TA] singleton_v21(x1941 : TA) -> @oset.T[TA] raise {
  let x = x1941
  @oset.singleton(x)
}

///|
/// `remove`
pub fn remove_v14(
  x1942 : (String, @list.List[Term]),
  x1943 : @oset.T[(String, @list.List[Term])],
) -> @oset.T[(Name, @list.List[Term])] raise {
  let x = x1942
  let s = x1943
  @oset.remove(compare_v25, x, s)
}

///|
/// `union`
pub fn union_v21(
  x1944 : @oset.T[(String, @list.List[Term])],
  x1945 : @oset.T[(String, @list.List[Term])],
) -> @oset.T[(Name, @list.List[Term])] raise {
  let s1 = x1944
  let s2 = x1945
  @oset.union(compare_v25, s1, s2)
}

///|
/// `inter`
pub fn inter_v4(
  x1946 : @oset.T[(String, @list.List[Term])],
  x1947 : @oset.T[(String, @list.List[Term])],
) -> @oset.T[(Name, @list.List[Term])] raise {
  let s1 = x1946
  let s2 = x1947
  @oset.inter(compare_v25, s1, s2)
}

///|
/// `disjoint`
pub fn disjoint_v5(
  x1948 : @oset.T[(String, @list.List[Term])],
  x1949 : @oset.T[(String, @list.List[Term])],
) -> Bool raise {
  let s1 = x1948
  let s2 = x1949
  @oset.disjoint(compare_v25, s1, s2)
}

///|
/// `diff`
pub fn diff_v4(
  x1950 : @oset.T[(String, @list.List[Term])],
  x1951 : @oset.T[(String, @list.List[Term])],
) -> @oset.T[(Name, @list.List[Term])] raise {
  let s1 = x1950
  let s2 = x1951
  @oset.diff(compare_v25, s1, s2)
}

///|
/// `compare`
pub fn compare_v27(
  x1952 : @oset.T[(String, @list.List[Term])],
  x1953 : @oset.T[(String, @list.List[Term])],
) -> Int64 raise {
  let s1 = x1952
  let s2 = x1953
  @oset.compare(compare_v25, s1, s2)
}

///|
/// `equal`
pub fn equal_v19(
  x1954 : @oset.T[(String, @list.List[Term])],
  x1955 : @oset.T[(String, @list.List[Term])],
) -> Bool raise {
  let s1 = x1954
  let s2 = x1955
  @oset.equal(compare_v25, s1, s2)
}

///|
/// `subset`
pub fn subset_v8(
  x1956 : @oset.T[(String, @list.List[Term])],
  x1957 : @oset.T[(String, @list.List[Term])],
) -> Bool raise {
  let s1 = x1956
  let s2 = x1957
  @oset.subset(compare_v25, s1, s2)
}

///|
/// `iter`
pub fn[TA, TB] iter_v10(
  x1958 : (TB) -> TA raise,
  x1959 : @oset.T[TB],
) -> Unit raise {
  let f = x1958
  let s = x1959
  @oset.iter(f, s)
}

///|
/// `map`
pub fn map_v12(
  x1960 : ((String, @list.List[Term])) -> (String, @list.List[Term]) raise,
  x1961 : @oset.T[(String, @list.List[Term])],
) -> @oset.T[(Name, @list.List[Term])] raise {
  let f = x1960
  let s = x1961
  @oset.map(compare_v25, f, s)
}

///|
/// `fold`
pub fn[TA, TB] fold_v10(
  x1962 : (TB) -> ((TA) -> TA raise) raise,
  x1963 : @oset.T[TB],
  x1964 : TA,
) -> TA raise {
  let f = x1962
  let s = x1963
  let accu = x1964
  @oset.fold(f, s, accu)
}

///|
/// `for_all`
pub fn[TA] for_all_v10(
  x1965 : (TA) -> Bool raise,
  x1966 : @oset.T[TA],
) -> Bool raise {
  let p = x1965
  let s = x1966
  @oset.for_all(p, s)
}

///|
/// `exists`
pub fn[TA] exists_v20(
  x1967 : (TA) -> Bool raise,
  x1968 : @oset.T[TA],
) -> Bool raise {
  let p = x1967
  let s = x1968
  @oset.exists(p, s)
}

///|
/// `filter`
pub fn[TA] filter_v17(
  x1969 : (TA) -> Bool raise,
  x1970 : @oset.T[TA],
) -> @oset.T[TA] raise {
  let p = x1969
  let s = x1970
  @oset.filter(p, s)
}

///|
/// `filter_map`
pub fn filter_map_v10(
  x1971 : ((String, @list.List[Term])) -> (String, @list.List[Term])? raise,
  x1972 : @oset.T[(String, @list.List[Term])],
) -> @oset.T[(Name, @list.List[Term])] raise {
  let f = x1971
  let s = x1972
  @oset.filter_map(compare_v25, f, s)
}

///|
/// `partition`
pub fn[TA] partition_v12(
  x1973 : (TA) -> Bool raise,
  x1974 : @oset.T[TA],
) -> (@oset.T[TA], @oset.T[TA]) raise {
  let p = x1973
  let s = x1974
  @oset.partition(p, s)
}

///|
/// `cardinal`
pub fn[TA] cardinal_v10(x1975 : @oset.T[TA]) -> Int64 raise {
  let s = x1975
  @oset.cardinal(s)
}

///|
/// `elements`
pub fn[TA] elements_v4(x1976 : @oset.T[TA]) -> @list.List[TA] raise {
  let s = x1976
  @oset.elements(s)
}

///|
/// `min_elt`
pub fn[TA] min_elt_v4(x1977 : @oset.T[TA]) -> TA raise {
  let s = x1977
  @oset.min_elt(s)
}

///|
/// `min_elt_opt`
pub fn[TA] min_elt_opt_v4(x1978 : @oset.T[TA]) -> TA? raise {
  let s = x1978
  @oset.min_elt_opt(s)
}

///|
/// `max_elt`
pub fn[TA] max_elt_v4(x1979 : @oset.T[TA]) -> TA raise {
  let s = x1979
  @oset.max_elt(s)
}

///|
/// `max_elt_opt`
pub fn[TA] max_elt_opt_v4(x1980 : @oset.T[TA]) -> TA? raise {
  let s = x1980
  @oset.max_elt_opt(s)
}

///|
/// `choose`
pub fn[TA] choose_v10(x1981 : @oset.T[TA]) -> TA raise {
  let s = x1981
  @oset.choose(s)
}

///|
/// `choose_opt`
pub fn[TA] choose_opt_v10(x1982 : @oset.T[TA]) -> TA? raise {
  let s = x1982
  @oset.choose_opt(s)
}

///|
/// `split`
pub fn split_v10(
  x1983 : (String, @list.List[Term]),
  x1984 : @oset.T[(String, @list.List[Term])],
) -> (
  @oset.T[(Name, @list.List[Term])],
  Bool,
  @oset.T[(Name, @list.List[Term])],
) raise {
  let x = x1983
  let s = x1984
  @oset.split(compare_v25, x, s)
}

///|
/// `find`
pub fn find_v13(
  x1985 : (String, @list.List[Term]),
  x1986 : @oset.T[(String, @list.List[Term])],
) -> (Name, @list.List[Term]) raise {
  let x = x1985
  let s = x1986
  @oset.find(compare_v25, x, s)
}

///|
/// `find_opt`
pub fn find_opt_v10(
  x1987 : (String, @list.List[Term]),
  x1988 : @oset.T[(String, @list.List[Term])],
) -> (Name, @list.List[Term])? raise {
  let x = x1987
  let s = x1988
  @oset.find_opt(compare_v25, x, s)
}

///|
/// `find_first`
pub fn[TA] find_first_v10(
  x1989 : (TA) -> Bool raise,
  x1990 : @oset.T[TA],
) -> TA raise {
  let f = x1989
  let s = x1990
  @oset.find_first(f, s)
}

///|
/// `find_first_opt`
pub fn[TA] find_first_opt_v10(
  x1991 : (TA) -> Bool raise,
  x1992 : @oset.T[TA],
) -> TA? raise {
  let f = x1991
  let s = x1992
  @oset.find_first_opt(f, s)
}

///|
/// `find_last`
pub fn[TA] find_last_v10(
  x1993 : (TA) -> Bool raise,
  x1994 : @oset.T[TA],
) -> TA raise {
  let f = x1993
  let s = x1994
  @oset.find_last(f, s)
}

///|
/// `find_last_opt`
pub fn[TA] find_last_opt_v10(
  x1995 : (TA) -> Bool raise,
  x1996 : @oset.T[TA],
) -> TA? raise {
  let f = x1995
  let s = x1996
  @oset.find_last_opt(f, s)
}

///|
/// `set`
pub type Set4 = T17

///|
/// compare
fn step_56() -> Unit raise {
  compare_v28_c.set(fn(
    x1997 : @oset.T[(String, @list.List[Term])],
  ) -> ((@oset.T[(String, @list.List[Term])]) -> Int64 raise) raise {
    fn(x1998 : @oset.T[(String, @list.List[Term])]) -> Int64 raise {
      compare_v27(x1997, x1998)
    }
  })
}

///|
let compare_v28_c : @lib.Cell[
  (@oset.T[(Name, @list.List[Term])]) -> ((@oset.T[(Name, @list.List[Term])]) -> Int64 raise) raise,
] = @lib.Cell::new("compare")

///|
/// `compare`
pub fn compare_v28(
  x : @oset.T[(Name, @list.List[Term])],
) -> ((@oset.T[(Name, @list.List[Term])]) -> Int64 raise) raise {
  compare_v28_c.get()(x)
}

///|
/// `add`
pub fn add_v16(
  x1999 : @oset.T[(String, @list.List[Term])],
  x2000 : (String, @list.List[Term]),
) -> @oset.T[(Name, @list.List[Term])] raise {
  let s = x1999
  let x = x2000
  add_v15(x, s)
}

///|
/// `foldr`
pub fn[TA, TB] foldr_v12(
  x2001 : ((TB, TA)) -> TA raise,
  x2002 : TA,
  x2003 : @oset.T[TB],
) -> TA raise {
  let f = x2001
  let a = x2002
  let s = x2003
  fold_v10(
    fn(x2004 : TB) -> ((TA) -> TA raise) raise {
      let x = x2004
      fn(x2005 : TA) -> TA raise {
        let acc = x2005
        f((x, acc))
      }
    },
    s,
    a,
  )
}

///|
/// `foldl`
pub fn[TA, TB] foldl_v12(
  x : ((TB, TA)) -> TA raise,
) -> ((TA) -> ((@oset.T[TB]) -> TA raise) raise) raise {
  let f : (((TB, TA)) -> TA raise) -> ((TA) -> ((@oset.T[TB]) -> TA raise) raise) raise = x2006 => {
    x2007 => x2008 => foldr_v12(x2006, x2007, x2008)
  }
  f(x)
}

///|
/// member
fn step_57() -> Unit raise {
  member_v4_c.set(fn(
    x2009 : (String, @list.List[Term]),
  ) -> ((@oset.T[(String, @list.List[Term])]) -> Bool raise) raise {
    fn(x2010 : @oset.T[(String, @list.List[Term])]) -> Bool raise {
      mem_v10(x2009, x2010)
    }
  })
}

///|
let member_v4_c : @lib.Cell[
  ((Name, @list.List[Term])) -> ((@oset.T[(Name, @list.List[Term])]) -> Bool raise) raise,
] = @lib.Cell::new("member")

///|
/// `member`
pub fn member_v4(
  x : (Name, @list.List[Term]),
) -> ((@oset.T[(Name, @list.List[Term])]) -> Bool raise) raise {
  member_v4_c.get()(x)
}

///|
/// `empty`
pub fn[TA] empty_v16() -> @oset.T[TA] {
  empty_v15()
}

///|
/// union
fn step_58() -> Unit raise {
  union_v22_c.set(fn(
    x2011 : @oset.T[(String, @list.List[Term])],
  ) -> ((@oset.T[(String, @list.List[Term])]) -> @oset.T[
    (String, @list.List[Term]),
  ] raise) raise {
    fn(
      x2012 : @oset.T[(String, @list.List[Term])],
    ) -> @oset.T[(String, @list.List[Term])] raise {
      union_v21(x2011, x2012)
    }
  })
}

///|
let union_v22_c : @lib.Cell[
  (@oset.T[(Name, @list.List[Term])]) -> ((@oset.T[(Name, @list.List[Term])]) -> @oset.T[
    (Name, @list.List[Term]),
  ] raise) raise,
] = @lib.Cell::new("union")

///|
/// `union`
pub fn union_v22(
  x : @oset.T[(Name, @list.List[Term])],
) -> ((@oset.T[(Name, @list.List[Term])]) -> @oset.T[(Name, @list.List[Term])] raise) raise {
  union_v22_c.get()(x)
}

///|
/// difference
fn step_59() -> Unit raise {
  difference_v4_c.set(fn(
    x2013 : @oset.T[(String, @list.List[Term])],
  ) -> ((@oset.T[(String, @list.List[Term])]) -> @oset.T[
    (String, @list.List[Term]),
  ] raise) raise {
    fn(
      x2014 : @oset.T[(String, @list.List[Term])],
    ) -> @oset.T[(String, @list.List[Term])] raise {
      diff_v4(x2013, x2014)
    }
  })
}

///|
let difference_v4_c : @lib.Cell[
  (@oset.T[(Name, @list.List[Term])]) -> ((@oset.T[(Name, @list.List[Term])]) -> @oset.T[
    (Name, @list.List[Term]),
  ] raise) raise,
] = @lib.Cell::new("difference")

///|
/// `difference`
pub fn difference_v4(
  x : @oset.T[(Name, @list.List[Term])],
) -> ((@oset.T[(Name, @list.List[Term])]) -> @oset.T[(Name, @list.List[Term])] raise) raise {
  difference_v4_c.get()(x)
}

///|
/// `toList`
pub fn[TA] tolist_v12(x : @oset.T[TA]) -> @list.List[TA] raise {
  let f : (@oset.T[TA]) -> @list.List[TA] raise = elements_v4
  f(x)
}

///|
/// `singleton`
pub fn[TA] singleton_v22(x : TA) -> @oset.T[TA] raise {
  let f : (TA) -> @oset.T[TA] raise = singleton_v21
  f(x)
}

///|
/// `null`
pub fn[TA] null_v13(x : @oset.T[TA]) -> Bool raise {
  let f : (@oset.T[TA]) -> Bool raise = is_empty_v10
  f(x)
}

///|
/// `size`
pub fn[TA] size_v12(x : @oset.T[TA]) -> Int64 raise {
  let f : (@oset.T[TA]) -> Int64 raise = cardinal_v10
  f(x)
}

///|
/// `pick`
pub fn[TA] pick_v5(x : @oset.T[TA]) -> TA raise {
  let f : (@oset.T[TA]) -> TA raise = choose_v10
  f(x)
}

///|
/// equal
fn step_60() -> Unit raise {
  equal_v20_c.set(fn(
    x2015 : @oset.T[(String, @list.List[Term])],
  ) -> ((@oset.T[(String, @list.List[Term])]) -> Bool raise) raise {
    fn(x2016 : @oset.T[(String, @list.List[Term])]) -> Bool raise {
      equal_v19(x2015, x2016)
    }
  })
}

///|
let equal_v20_c : @lib.Cell[
  (@oset.T[(Name, @list.List[Term])]) -> ((@oset.T[(Name, @list.List[Term])]) -> Bool raise) raise,
] = @lib.Cell::new("equal")

///|
/// `equal`
pub fn equal_v20(
  x : @oset.T[(Name, @list.List[Term])],
) -> ((@oset.T[(Name, @list.List[Term])]) -> Bool raise) raise {
  equal_v20_c.get()(x)
}

///|
/// `exists`
pub fn[TA] exists_v21(
  x : (TA) -> Bool raise,
) -> ((@oset.T[TA]) -> Bool raise) raise {
  let f : ((TA) -> Bool raise) -> ((@oset.T[TA]) -> Bool raise) raise = x2017 => {
    x2018 => exists_v20(x2017, x2018)
  }
  f(x)
}

///|
/// `fromList`
pub fn fromlist_v11(
  x2019 : @list.List[(String, @list.List[Term])],
) -> @oset.T[(Name, @list.List[Term])] raise {
  let l = x2019
  @lib.itlist(add_v15, l, empty_v15())
}

///|
/// `delete`
pub fn delete_v10(
  x2020 : @oset.T[(String, @list.List[Term])],
  x2021 : (String, @list.List[Term]),
) -> @oset.T[(Name, @list.List[Term])] raise {
  let s = x2020
  let x = x2021
  remove_v14(x, s)
}

///|
/// subset
fn step_61() -> Unit raise {
  subset_v9_c.set(fn(
    x2022 : @oset.T[(String, @list.List[Term])],
  ) -> ((@oset.T[(String, @list.List[Term])]) -> Bool raise) raise {
    fn(x2023 : @oset.T[(String, @list.List[Term])]) -> Bool raise {
      subset_v8(x2022, x2023)
    }
  })
}

///|
let subset_v9_c : @lib.Cell[
  (@oset.T[(Name, @list.List[Term])]) -> ((@oset.T[(Name, @list.List[Term])]) -> Bool raise) raise,
] = @lib.Cell::new("subset")

///|
/// `subset`
pub fn subset_v9(
  x : @oset.T[(Name, @list.List[Term])],
) -> ((@oset.T[(Name, @list.List[Term])]) -> Bool raise) raise {
  subset_v9_c.get()(x)
}

///|
/// intersect
fn step_62() -> Unit raise {
  intersect_v5_c.set(fn(
    x2024 : @oset.T[(String, @list.List[Term])],
  ) -> ((@oset.T[(String, @list.List[Term])]) -> @oset.T[
    (String, @list.List[Term]),
  ] raise) raise {
    fn(
      x2025 : @oset.T[(String, @list.List[Term])],
    ) -> @oset.T[(String, @list.List[Term])] raise {
      inter_v4(x2024, x2025)
    }
  })
}

///|
let intersect_v5_c : @lib.Cell[
  (@oset.T[(Name, @list.List[Term])]) -> ((@oset.T[(Name, @list.List[Term])]) -> @oset.T[
    (Name, @list.List[Term]),
  ] raise) raise,
] = @lib.Cell::new("intersect")

///|
/// `intersect`
pub fn intersect_v5(
  x : @oset.T[(Name, @list.List[Term])],
) -> ((@oset.T[(Name, @list.List[Term])]) -> @oset.T[(Name, @list.List[Term])] raise) raise {
  intersect_v5_c.get()(x)
}

///|
/// `intersectList`
pub fn intersectlist_v4(
  x2026 : @list.List[@oset.T[(String, @list.List[Term])]],
) -> @oset.T[(Name, @list.List[Term])] raise {
  match x2026 {
    Empty => empty_v15()
    More(s, tail=ss) => @lib.itlist(inter_v4, ss, s)
  }
}

///|
/// `findl`
pub fn[TA] findl_v5(
  x2027 : (TA) -> Bool raise,
  x2028 : @oset.T[TA],
) -> TA? raise {
  let p = x2027
  let s = x2028
  let go : (TA) -> ((TA?) -> TA? raise) raise = fn(
    x2029 : TA,
  ) -> ((TA?) -> TA? raise) raise {
    let x = x2029
    fn(x2030 : TA?) -> TA? raise {
      match x2030 {
        Some(_) as s_1 => s_1
        None => if p(x) { Some(x) } else { None }
      }
    }
  }
  fold_v10(go, s, None)
}

///|
/// `firstl`
pub fn[TA, TB] firstl_v5(
  x2031 : (TB) -> TA? raise,
  x2032 : @oset.T[TB],
) -> TA? raise {
  let f = x2031
  let s = x2032
  let go : (TB) -> ((TA?) -> TA? raise) raise = fn(
    x2033 : TB,
  ) -> ((TA?) -> TA? raise) raise {
    let x = x2033
    fn(x2034 : TA?) -> TA? raise {
      match x2034 {
        Some(_) as s_1 => s_1
        None => f(x)
      }
    }
  }
  fold_v10(go, s, None)
}

///|
/// `transform`
pub fn[TA, TB] transform_v10(
  x2035 : (TB) -> TA raise,
  x2036 : @oset.T[TB],
) -> @list.List[TA] raise {
  let f = x2035
  let s = x2036
  fold_v10(
    fn(x2037 : TB) -> ((@list.List[TA]) -> @list.List[TA] raise) raise {
      let x = x2037
      fn(x2038 : @list.List[TA]) -> @list.List[TA] raise {
        let acc = x2038
        acc.prepend(f(x))
      }
    },
    s,
    @list.List([]),
  )
}

///|
/// `all`
pub fn[TA] all_v5(
  x : (TA) -> Bool raise,
) -> ((@oset.T[TA]) -> Bool raise) raise {
  let f : ((TA) -> Bool raise) -> ((@oset.T[TA]) -> Bool raise) raise = x2039 => {
    x2040 => for_all_v10(x2039, x2040)
  }
  f(x)
}

///|
/// `count`
pub fn[TA] count_v5(
  x2041 : (TA) -> Bool raise,
  x2042 : @oset.T[TA],
) -> Int64 raise {
  let p = x2041
  let s = x2042
  fold_v10(
    fn(x2043 : TA) -> ((Int64) -> Int64 raise) raise {
      let x = x2043
      fn(x2044 : Int64) -> Int64 raise {
        let c = x2044
        if p(x) {
          @lib.add63(c, 1L)
        } else {
          c
        }
      }
    },
    s,
    0L,
  )
}

///|
/// `formula`
#derive(Eq, Debug)
pub(all) enum Formula {
  True
  False
  Atom(Atom)
  Not(Formula)
  And(Formula, Formula)
  Or(Formula, Formula)
  Imp(Formula, Formula)
  Iff(Formula, Formula)
  Forall(Var, Formula)
  Exists(Var, Formula)
}

///|
pub extend Formula with Eq::{not_equal, equal}

///|
pub extend Formula with Debug::{to_repr}

///|
pub extend Formula with @lib.OCompare::{ocompare}

///|
pub extend Formula with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_Formula(x : Formula) -> Int {
  match x {
    True => 0
    False => 1
    Atom(_) => 1000000
    Not(_) => 1000001
    And(_, _) => 1000002
    Or(_, _) => 1000003
    Imp(_, _) => 1000004
    Iff(_, _) => 1000005
    Forall(_, _) => 1000006
    Exists(_, _) => 1000007
  }
}

///|
pub impl @lib.OCompare for Formula with fn ocompare(self, other) {
  match (self, other) {
    (Atom(a0), Atom(b0)) => @lib.compare(a0, b0)
    (Not(a0), Not(b0)) => @lib.compare(a0, b0)
    (And(a0, a1), And(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    (Or(a0, a1), Or(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    (Imp(a0, a1), Imp(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    (Iff(a0, a1), Iff(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    (Forall(a0, a1), Forall(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    (Exists(a0, a1), Exists(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    _ => ocaml_rank_Formula(self).compare(ocaml_rank_Formula(other))
  }
}

///|
pub impl @lib.OHash for Formula with fn ohash_visit(self, h) {
  match self {
    True => h.int(0L)
    False => h.int(1L)
    Atom(a0) => {
      h.block(0, 1)
      h.field(a0)
    }
    Not(a0) => {
      h.block(1, 1)
      h.field(a0)
    }
    And(a0, a1) => {
      h.block(2, 2)
      h.field(a0)
      h.field(a1)
    }
    Or(a0, a1) => {
      h.block(3, 2)
      h.field(a0)
      h.field(a1)
    }
    Imp(a0, a1) => {
      h.block(4, 2)
      h.field(a0)
      h.field(a1)
    }
    Iff(a0, a1) => {
      h.block(5, 2)
      h.field(a0)
      h.field(a1)
    }
    Forall(a0, a1) => {
      h.block(6, 2)
      h.field(a0)
      h.field(a1)
    }
    Exists(a0, a1) => {
      h.block(7, 2)
      h.field(a0)
      h.field(a1)
    }
  }
}

///|
/// `mkBoolean`
pub fn mkboolean(x2045 : Bool) -> Formula raise {
  match x2045 {
    true => Formula::True
    false => Formula::False
  }
}

///|
/// `destBoolean`
pub fn destboolean(x2046 : Formula) -> Bool raise {
  match x2046 {
    Formula::True => true
    Formula::False => false
    _ => raise Failure("destBoolean")
  }
}

///|
/// isBoolean
fn step_63() -> Unit raise {
  isboolean_c.set((x2047 : Formula) => @lib.can(destboolean, x2047))
}

///|
let isboolean_c : @lib.Cell[(Formula) -> Bool raise] = @lib.Cell::new(
  "isBoolean",
)

///|
/// `isBoolean`
pub fn isboolean(x : Formula) -> Bool raise {
  isboolean_c.get()(x)
}

///|
/// `isTrue`
pub fn istrue(x2048 : Formula) -> Bool raise {
  let fm = x2048
  match fm {
    Formula::True => true
    _ => false
  }
}

///|
/// `isFalse`
pub fn isfalse(x2049 : Formula) -> Bool raise {
  let fm = x2049
  match fm {
    Formula::False => true
    _ => false
  }
}

///|
/// `functions`
pub fn functions_v3(x2050 : Formula) -> @oset.T[(Name, Int64)] raise {
  let fm = x2050
  fn funcs(
    x2051 : @oset.T[(String, Int64)],
    x2052 : @list.List[Formula],
  ) -> @oset.T[(Name, Int64)] raise {
    let fs = x2051
    match x2052 {
      Empty => fs
      More(Formula::True, tail=fms) => funcs(fs, fms)
      More(Formula::False, tail=fms_1) => funcs(fs, fms_1)
      More(Formula::Atom(atm), tail=fms_2) =>
        funcs(union_v15(functions_v2(atm))(fs), fms_2)
      More(Formula::Not(p), tail=fms_3) => funcs(fs, fms_3.prepend(p))
      More(Formula::And(p_1, q), tail=fms_4) =>
        funcs(fs, fms_4.prepend(q).prepend(p_1))
      More(Formula::Or(p_2, q_1), tail=fms_5) =>
        funcs(fs, fms_5.prepend(q_1).prepend(p_2))
      More(Formula::Imp(p_3, q_2), tail=fms_6) =>
        funcs(fs, fms_6.prepend(q_2).prepend(p_3))
      More(Formula::Iff(p_4, q_3), tail=fms_7) =>
        funcs(fs, fms_7.prepend(q_3).prepend(p_4))
      More(Formula::Forall(_, p_5), tail=fms_8) => funcs(fs, fms_8.prepend(p_5))
      More(Formula::Exists(_, p_6), tail=fms_9) => funcs(fs, fms_9.prepend(p_6))
    }
  }
  funcs(empty_v10(), @list.List([fm]))
}

///|
/// `functionNames`
pub fn functionnames_v2(x2053 : Formula) -> @oset.T[Name] raise {
  let fm = x2053
  fn funcs(
    x2054 : @oset.T[String],
    x2055 : @list.List[Formula],
  ) -> @oset.T[Name] raise {
    let fs = x2054
    match x2055 {
      Empty => fs
      More(Formula::True, tail=fms) => funcs(fs, fms)
      More(Formula::False, tail=fms_1) => funcs(fs, fms_1)
      More(Formula::Atom(atm), tail=fms_2) =>
        funcs(union_v11(functionnames_v1(atm))(fs), fms_2)
      More(Formula::Not(p), tail=fms_3) => funcs(fs, fms_3.prepend(p))
      More(Formula::And(p_1, q), tail=fms_4) =>
        funcs(fs, fms_4.prepend(q).prepend(p_1))
      More(Formula::Or(p_2, q_1), tail=fms_5) =>
        funcs(fs, fms_5.prepend(q_1).prepend(p_2))
      More(Formula::Imp(p_3, q_2), tail=fms_6) =>
        funcs(fs, fms_6.prepend(q_2).prepend(p_3))
      More(Formula::Iff(p_4, q_3), tail=fms_7) =>
        funcs(fs, fms_7.prepend(q_3).prepend(p_4))
      More(Formula::Forall(_, p_5), tail=fms_8) => funcs(fs, fms_8.prepend(p_5))
      More(Formula::Exists(_, p_6), tail=fms_9) => funcs(fs, fms_9.prepend(p_6))
    }
  }
  funcs(empty_v7(), @list.List([fm]))
}

///|
/// `relations`
pub fn relations(x2056 : Formula) -> @oset.T[(Name, Int64)] raise {
  let fm = x2056
  fn rels(
    x2057 : @oset.T[(String, Int64)],
    x2058 : @list.List[Formula],
  ) -> @oset.T[(Name, Int64)] raise {
    let fs = x2057
    match x2058 {
      Empty => fs
      More(Formula::True, tail=fms) => rels(fs, fms)
      More(Formula::False, tail=fms_1) => rels(fs, fms_1)
      More(Formula::Atom(atm), tail=fms_2) =>
        rels(add_v11(fs, relation(atm)), fms_2)
      More(Formula::Not(p), tail=fms_3) => rels(fs, fms_3.prepend(p))
      More(Formula::And(p_1, q), tail=fms_4) =>
        rels(fs, fms_4.prepend(q).prepend(p_1))
      More(Formula::Or(p_2, q_1), tail=fms_5) =>
        rels(fs, fms_5.prepend(q_1).prepend(p_2))
      More(Formula::Imp(p_3, q_2), tail=fms_6) =>
        rels(fs, fms_6.prepend(q_2).prepend(p_3))
      More(Formula::Iff(p_4, q_3), tail=fms_7) =>
        rels(fs, fms_7.prepend(q_3).prepend(p_4))
      More(Formula::Forall(_, p_5), tail=fms_8) => rels(fs, fms_8.prepend(p_5))
      More(Formula::Exists(_, p_6), tail=fms_9) => rels(fs, fms_9.prepend(p_6))
    }
  }
  rels(empty_v10(), @list.List([fm]))
}

///|
/// `relationNames`
pub fn relationnames(x2059 : Formula) -> @oset.T[Name] raise {
  let fm = x2059
  fn rels(
    x2060 : @oset.T[String],
    x2061 : @list.List[Formula],
  ) -> @oset.T[Name] raise {
    let fs = x2060
    match x2061 {
      Empty => fs
      More(Formula::True, tail=fms) => rels(fs, fms)
      More(Formula::False, tail=fms_1) => rels(fs, fms_1)
      More(Formula::Atom(atm), tail=fms_2) =>
        rels(add_v8(fs, name_v1(atm.0, atm.1)), fms_2)
      More(Formula::Not(p), tail=fms_3) => rels(fs, fms_3.prepend(p))
      More(Formula::And(p_1, q), tail=fms_4) =>
        rels(fs, fms_4.prepend(q).prepend(p_1))
      More(Formula::Or(p_2, q_1), tail=fms_5) =>
        rels(fs, fms_5.prepend(q_1).prepend(p_2))
      More(Formula::Imp(p_3, q_2), tail=fms_6) =>
        rels(fs, fms_6.prepend(q_2).prepend(p_3))
      More(Formula::Iff(p_4, q_3), tail=fms_7) =>
        rels(fs, fms_7.prepend(q_3).prepend(p_4))
      More(Formula::Forall(_, p_5), tail=fms_8) => rels(fs, fms_8.prepend(p_5))
      More(Formula::Exists(_, p_6), tail=fms_9) => rels(fs, fms_9.prepend(p_6))
    }
  }
  rels(empty_v7(), @list.List([fm]))
}

///|
/// `destAtom`
pub fn destatom(x2062 : Formula) -> Atom raise {
  match x2062 {
    Formula::Atom(atm) => atm
    _ => raise Failure("Formula.destAtom")
  }
}

///|
/// isAtom
fn step_64() -> Unit raise {
  isatom_c.set((x2063 : Formula) => @lib.can(destatom, x2063))
}

///|
let isatom_c : @lib.Cell[(Formula) -> Bool raise] = @lib.Cell::new("isAtom")

///|
/// `isAtom`
pub fn isatom(x : Formula) -> Bool raise {
  isatom_c.get()(x)
}

///|
/// `destNeg`
pub fn destneg(x2064 : Formula) -> Formula raise {
  match x2064 {
    Formula::Not(p) => p
    _ => raise Failure("Formula.destNeg")
  }
}

///|
/// isNeg
fn step_65() -> Unit raise {
  isneg_c.set((x2065 : Formula) => @lib.can(destneg, x2065))
}

///|
let isneg_c : @lib.Cell[(Formula) -> Bool raise] = @lib.Cell::new("isNeg")

///|
/// `isNeg`
pub fn isneg(x : Formula) -> Bool raise {
  isneg_c.get()(x)
}

///|
/// stripNeg
fn step_66() -> Unit raise {
  fn strip(x2066 : Int64, x2067 : Formula) -> (Int64, Formula) raise {
    let n = x2066
    match x2067 {
      Formula::Not(fm) => strip(@lib.add63(n, 1L), fm)
      fm_1 => (n, fm_1)
    }
  }
  stripneg_c.set((x2068 : Formula) => strip(0L, x2068))
}

///|
let stripneg_c : @lib.Cell[(Formula) -> (Int64, Formula) raise] = @lib.Cell::new(
  "stripNeg",
)

///|
/// `stripNeg`
pub fn stripneg(x : Formula) -> (Int64, Formula) raise {
  stripneg_c.get()(x)
}

///|
/// `listMkConj`
pub fn listmkconj(x2069 : @list.List[Formula]) -> Formula raise {
  let fms = x2069
  match @lib.rev(fms) {
    Empty => Formula::True
    More(fm, tail=fms_1) =>
      foldl(
        fn(x2070 : (Formula, Formula)) -> Formula raise {
          let (x, y) = x2070
          Formula::And(x, y)
        },
        fm,
        fms_1,
      )
  }
}

///|
/// stripConj
fn step_67() -> Unit raise {
  fn strip(
    x2071 : @list.List[Formula],
    x2072 : Formula,
  ) -> @list.List[Formula] raise {
    let cs = x2071
    match x2072 {
      Formula::And(p, q) => strip(cs.prepend(p), q)
      fm => @lib.rev(cs.prepend(fm))
    }
  }
  stripconj_c.set(fn(x2073 : Formula) -> @list.List[Formula] raise {
    match x2073 {
      Formula::True => @list.List([])
      fm_1 => strip(@list.List([]), fm_1)
    }
  })
}

///|
let stripconj_c : @lib.Cell[(Formula) -> @list.List[Formula] raise] = @lib.Cell::new(
  "stripConj",
)

///|
/// `stripConj`
pub fn stripconj(x : Formula) -> @list.List[Formula] raise {
  stripconj_c.get()(x)
}

///|
/// flattenConj
fn step_68() -> Unit raise {
  fn flat(
    x2074 : @list.List[Formula],
    x2075 : @list.List[Formula],
  ) -> @list.List[Formula] raise {
    let acc = x2074
    match x2075 {
      Empty => acc
      More(Formula::And(p, q), tail=fms) => flat(acc, fms.prepend(p).prepend(q))
      More(Formula::True, tail=fms_1) => flat(acc, fms_1)
      More(fm, tail=fms_2) => flat(acc.prepend(fm), fms_2)
    }
  }
  flattenconj_c.set(fn(x2076 : Formula) -> @list.List[Formula] raise {
    let fm_1 = x2076
    flat(@list.List([]), @list.List([fm_1]))
  })
}

///|
let flattenconj_c : @lib.Cell[(Formula) -> @list.List[Formula] raise] = @lib.Cell::new(
  "flattenConj",
)

///|
/// `flattenConj`
pub fn flattenconj(x : Formula) -> @list.List[Formula] raise {
  flattenconj_c.get()(x)
}

///|
/// `listMkDisj`
pub fn listmkdisj(x2077 : @list.List[Formula]) -> Formula raise {
  let fms = x2077
  match @lib.rev(fms) {
    Empty => Formula::False
    More(fm, tail=fms_1) =>
      foldl(
        fn(x2078 : (Formula, Formula)) -> Formula raise {
          let (x, y) = x2078
          Formula::Or(x, y)
        },
        fm,
        fms_1,
      )
  }
}

///|
/// stripDisj
fn step_69() -> Unit raise {
  fn strip(
    x2079 : @list.List[Formula],
    x2080 : Formula,
  ) -> @list.List[Formula] raise {
    let cs = x2079
    match x2080 {
      Formula::Or(p, q) => strip(cs.prepend(p), q)
      fm => @lib.rev(cs.prepend(fm))
    }
  }
  stripdisj_c.set(fn(x2081 : Formula) -> @list.List[Formula] raise {
    match x2081 {
      Formula::False => @list.List([])
      fm_1 => strip(@list.List([]), fm_1)
    }
  })
}

///|
let stripdisj_c : @lib.Cell[(Formula) -> @list.List[Formula] raise] = @lib.Cell::new(
  "stripDisj",
)

///|
/// `stripDisj`
pub fn stripdisj(x : Formula) -> @list.List[Formula] raise {
  stripdisj_c.get()(x)
}

///|
/// flattenDisj
fn step_70() -> Unit raise {
  fn flat(
    x2082 : @list.List[Formula],
    x2083 : @list.List[Formula],
  ) -> @list.List[Formula] raise {
    let acc = x2082
    match x2083 {
      Empty => acc
      More(Formula::Or(p, q), tail=fms) => flat(acc, fms.prepend(p).prepend(q))
      More(Formula::False, tail=fms_1) => flat(acc, fms_1)
      More(fm, tail=fms_2) => flat(acc.prepend(fm), fms_2)
    }
  }
  flattendisj_c.set(fn(x2084 : Formula) -> @list.List[Formula] raise {
    let fm_1 = x2084
    flat(@list.List([]), @list.List([fm_1]))
  })
}

///|
let flattendisj_c : @lib.Cell[(Formula) -> @list.List[Formula] raise] = @lib.Cell::new(
  "flattenDisj",
)

///|
/// `flattenDisj`
pub fn flattendisj(x : Formula) -> @list.List[Formula] raise {
  flattendisj_c.get()(x)
}

///|
/// `listMkEquiv`
pub fn listmkequiv(x2085 : @list.List[Formula]) -> Formula raise {
  let fms = x2085
  match @lib.rev(fms) {
    Empty => Formula::True
    More(fm, tail=fms_1) =>
      foldl(
        fn(x2086 : (Formula, Formula)) -> Formula raise {
          let (x, y) = x2086
          Formula::Iff(x, y)
        },
        fm,
        fms_1,
      )
  }
}

///|
/// stripEquiv
fn step_71() -> Unit raise {
  fn strip(
    x2087 : @list.List[Formula],
    x2088 : Formula,
  ) -> @list.List[Formula] raise {
    let cs = x2087
    match x2088 {
      Formula::Iff(p, q) => strip(cs.prepend(p), q)
      fm => @lib.rev(cs.prepend(fm))
    }
  }
  stripequiv_c.set(fn(x2089 : Formula) -> @list.List[Formula] raise {
    match x2089 {
      Formula::True => @list.List([])
      fm_1 => strip(@list.List([]), fm_1)
    }
  })
}

///|
let stripequiv_c : @lib.Cell[(Formula) -> @list.List[Formula] raise] = @lib.Cell::new(
  "stripEquiv",
)

///|
/// `stripEquiv`
pub fn stripequiv(x : Formula) -> @list.List[Formula] raise {
  stripequiv_c.get()(x)
}

///|
/// flattenEquiv
fn step_72() -> Unit raise {
  fn flat(
    x2090 : @list.List[Formula],
    x2091 : @list.List[Formula],
  ) -> @list.List[Formula] raise {
    let acc = x2090
    match x2091 {
      Empty => acc
      More(Formula::Iff(p, q), tail=fms) => flat(acc, fms.prepend(p).prepend(q))
      More(Formula::True, tail=fms_1) => flat(acc, fms_1)
      More(fm, tail=fms_2) => flat(acc.prepend(fm), fms_2)
    }
  }
  flattenequiv_c.set(fn(x2092 : Formula) -> @list.List[Formula] raise {
    let fm_1 = x2092
    flat(@list.List([]), @list.List([fm_1]))
  })
}

///|
let flattenequiv_c : @lib.Cell[(Formula) -> @list.List[Formula] raise] = @lib.Cell::new(
  "flattenEquiv",
)

///|
/// `flattenEquiv`
pub fn flattenequiv(x : Formula) -> @list.List[Formula] raise {
  flattenequiv_c.get()(x)
}

///|
/// `destForall`
pub fn destforall(x2093 : Formula) -> (Var, Formula) raise {
  match x2093 {
    Formula::Forall(v, f) => (v, f)
    _ => raise Failure("destForall")
  }
}

///|
/// isForall
fn step_73() -> Unit raise {
  isforall_c.set((x2094 : Formula) => @lib.can(destforall, x2094))
}

///|
let isforall_c : @lib.Cell[(Formula) -> Bool raise] = @lib.Cell::new("isForall")

///|
/// `isForall`
pub fn isforall(x : Formula) -> Bool raise {
  isforall_c.get()(x)
}

///|
/// `listMkForall`
pub fn listmkforall(x2095 : (@list.List[String], Formula)) -> Formula raise {
  match x2095 {
    (Empty, body) => body
    (More(v, tail=vs), body_1) => Formula::Forall(v, listmkforall((vs, body_1)))
  }
}

///|
/// `setMkForall`
pub fn setmkforall(x2096 : @oset.T[String], x2097 : Formula) -> Formula raise {
  let (vs, body) = (x2096, x2097)
  foldr_v7(
    fn(x2098 : (String, Formula)) -> Formula raise {
      let (x, y) = x2098
      Formula::Forall(x, y)
    },
    body,
    vs,
  )
}

///|
/// stripForall
fn step_74() -> Unit raise {
  fn strip(
    x2099 : @list.List[String],
    x2100 : Formula,
  ) -> (@list.List[Var], Formula) raise {
    let vs = x2099
    match x2100 {
      Formula::Forall(v, b) => strip(vs.prepend(v), b)
      tm => (@lib.rev(vs), tm)
    }
  }
  stripforall_c.set((x2101 : Formula) => strip(@list.List([]), x2101))
}

///|
let stripforall_c : @lib.Cell[(Formula) -> (@list.List[Var], Formula) raise] = @lib.Cell::new(
  "stripForall",
)

///|
/// `stripForall`
pub fn stripforall(x : Formula) -> (@list.List[Var], Formula) raise {
  stripforall_c.get()(x)
}

///|
/// `destExists`
pub fn destexists(x2102 : Formula) -> (Var, Formula) raise {
  match x2102 {
    Formula::Exists(v, f) => (v, f)
    _ => raise Failure("destExists")
  }
}

///|
/// isExists
fn step_75() -> Unit raise {
  isexists_c.set((x2103 : Formula) => @lib.can(destexists, x2103))
}

///|
let isexists_c : @lib.Cell[(Formula) -> Bool raise] = @lib.Cell::new("isExists")

///|
/// `isExists`
pub fn isexists(x : Formula) -> Bool raise {
  isexists_c.get()(x)
}

///|
/// `listMkExists`
pub fn listmkexists(x2104 : (@list.List[String], Formula)) -> Formula raise {
  match x2104 {
    (Empty, body) => body
    (More(v, tail=vs), body_1) => Formula::Exists(v, listmkexists((vs, body_1)))
  }
}

///|
/// `setMkExists`
pub fn setmkexists(x2105 : @oset.T[String], x2106 : Formula) -> Formula raise {
  let (vs, body) = (x2105, x2106)
  foldr_v7(
    fn(x2107 : (String, Formula)) -> Formula raise {
      let (x, y) = x2107
      Formula::Exists(x, y)
    },
    body,
    vs,
  )
}

///|
/// stripExists
fn step_76() -> Unit raise {
  fn strip(
    x2108 : @list.List[String],
    x2109 : Formula,
  ) -> (@list.List[Var], Formula) raise {
    let vs = x2108
    match x2109 {
      Formula::Exists(v, b) => strip(vs.prepend(v), b)
      tm => (@lib.rev(vs), tm)
    }
  }
  stripexists_c.set((x2110 : Formula) => strip(@list.List([]), x2110))
}

///|
let stripexists_c : @lib.Cell[(Formula) -> (@list.List[Var], Formula) raise] = @lib.Cell::new(
  "stripExists",
)

///|
/// `stripExists`
pub fn stripexists(x : Formula) -> (@list.List[Var], Formula) raise {
  stripexists_c.get()(x)
}

///|
/// `symbols`
pub fn symbols_v2(x2111 : Formula) -> Int64 raise {
  let fm = x2111
  fn sz(x2112 : Int64, x2113 : @list.List[Formula]) -> Int64 raise {
    let n = x2112
    match x2113 {
      Empty => n
      More(Formula::True, tail=fms) => sz(@lib.add63(n, 1L), fms)
      More(Formula::False, tail=fms_1) => sz(@lib.add63(n, 1L), fms_1)
      More(Formula::Atom(atm), tail=fms_2) =>
        sz(@lib.add63(n, symbols_v1(atm)), fms_2)
      More(Formula::Not(p), tail=fms_3) =>
        sz(@lib.add63(n, 1L), fms_3.prepend(p))
      More(Formula::And(p_1, q), tail=fms_4) =>
        sz(@lib.add63(n, 1L), fms_4.prepend(q).prepend(p_1))
      More(Formula::Or(p_2, q_1), tail=fms_5) =>
        sz(@lib.add63(n, 1L), fms_5.prepend(q_1).prepend(p_2))
      More(Formula::Imp(p_3, q_2), tail=fms_6) =>
        sz(@lib.add63(n, 1L), fms_6.prepend(q_2).prepend(p_3))
      More(Formula::Iff(p_4, q_3), tail=fms_7) =>
        sz(@lib.add63(n, 1L), fms_7.prepend(q_3).prepend(p_4))
      More(Formula::Forall(_, p_5), tail=fms_8) =>
        sz(@lib.add63(n, 1L), fms_8.prepend(p_5))
      More(Formula::Exists(_, p_6), tail=fms_9) =>
        sz(@lib.add63(n, 1L), fms_9.prepend(p_6))
    }
  }
  sz(0L, @list.List([fm]))
}

///|
/// `compare`
pub fn compare_v29(x2114 : Formula, x2115 : Formula) -> Int64 raise {
  let fm1 = x2114
  let fm2 = x2115
  fn cmp(x2116 : @list.List[(Formula, Formula)]) -> Int64 raise {
    match x2116 {
      Empty => 0L
      More((f1, f2) as f1_f2, tail=fs) =>
        if physical_equal(f1, f2) {
          cmp(fs)
        } else {
          match f1_f2 {
            (Formula::True, Formula::True) => cmp(fs)
            (Formula::True, _) => -1L
            (_, Formula::True) => 1L
            (Formula::False, Formula::False) => cmp(fs)
            (Formula::False, _) => -1L
            (_, Formula::False) => 1L
            (Formula::Atom(atm1), Formula::Atom(atm2)) => {
              let c = compare_v24(atm1, atm2)
              if c != 0L {
                c
              } else {
                cmp(fs)
              }
            }
            (Formula::Atom(_), _) => -1L
            (_, Formula::Atom(_)) => 1L
            (Formula::Not(p1), Formula::Not(p2)) => cmp(fs.prepend((p1, p2)))
            (Formula::Not(_), _) => -1L
            (_, Formula::Not(_)) => 1L
            (Formula::And(p1_1, q1), Formula::And(p2_1, q2)) =>
              cmp(fs.prepend((q1, q2)).prepend((p1_1, p2_1)))
            (Formula::And(_, _), _) => -1L
            (_, Formula::And(_, _)) => 1L
            (Formula::Or(p1_2, q1_1), Formula::Or(p2_2, q2_1)) =>
              cmp(fs.prepend((q1_1, q2_1)).prepend((p1_2, p2_2)))
            (Formula::Or(_, _), _) => -1L
            (_, Formula::Or(_, _)) => 1L
            (Formula::Imp(p1_3, q1_2), Formula::Imp(p2_3, q2_2)) =>
              cmp(fs.prepend((q1_2, q2_2)).prepend((p1_3, p2_3)))
            (Formula::Imp(_, _), _) => -1L
            (_, Formula::Imp(_, _)) => 1L
            (Formula::Iff(p1_4, q1_3), Formula::Iff(p2_4, q2_3)) =>
              cmp(fs.prepend((q1_3, q2_3)).prepend((p1_4, p2_4)))
            (Formula::Iff(_, _), _) => -1L
            (_, Formula::Iff(_, _)) => 1L
            (Formula::Forall(v1, p1_5), Formula::Forall(v2, p2_5)) => {
              let c_1 = compare_v10(v1)(v2)
              if c_1 != 0L {
                c_1
              } else {
                cmp(fs.prepend((p1_5, p2_5)))
              }
            }
            (Formula::Forall(_, _), Formula::Exists(_, _)) => -1L
            (Formula::Exists(_, _), Formula::Forall(_, _)) => 1L
            (Formula::Exists(v1_1, p1_6), Formula::Exists(v2_1, p2_6)) => {
              let c_2 = compare_v10(v1_1)(v2_1)
              if c_2 != 0L {
                c_2
              } else {
                cmp(fs.prepend((p1_6, p2_6)))
              }
            }
          }
        }
    }
  }
  cmp(@list.List([(fm1, fm2)]))
}

///|
/// `equal`
pub fn equal_v21(x2117 : Formula, x2118 : Formula) -> Bool raise {
  let fm1 = x2117
  let fm2 = x2118
  compare_v29(fm1, fm2) == 0L
}

///|
/// `freeIn`
pub fn freein_v2(x2119 : String) -> ((Formula) -> Bool raise) raise {
  let v = x2119
  fn f(x2121 : @list.List[Formula]) -> Bool raise {
    match x2121 {
      Empty => false
      More(Formula::True, tail=fms) => f(fms)
      More(Formula::False, tail=fms_1) => f(fms_1)
      More(Formula::Atom(atm), tail=fms_2) => freein_v1(v, atm) || f(fms_2)
      More(Formula::Not(p), tail=fms_3) => f(fms_3.prepend(p))
      More(Formula::And(p_1, q), tail=fms_4) => f(fms_4.prepend(q).prepend(p_1))
      More(Formula::Or(p_2, q_1), tail=fms_5) =>
        f(fms_5.prepend(q_1).prepend(p_2))
      More(Formula::Imp(p_3, q_2), tail=fms_6) =>
        f(fms_6.prepend(q_2).prepend(p_3))
      More(Formula::Iff(p_4, q_3), tail=fms_7) =>
        f(fms_7.prepend(q_3).prepend(p_4))
      More(Formula::Forall(w, p_5), tail=fms_8) =>
        if equal_v6(v, w) {
          f(fms_8)
        } else {
          f(fms_8.prepend(p_5))
        }
      More(Formula::Exists(w_1, p_6), tail=fms_9) =>
        if equal_v6(v, w_1) {
          f(fms_9)
        } else {
          f(fms_9.prepend(p_6))
        }
    }
  }
  fn(x2122 : Formula) -> Bool raise {
    let fm = x2122
    f(@list.List([fm]))
  }
}

///|
/// `add`
pub fn add_v17(x2123 : Formula, x2124 : @oset.T[String]) -> @oset.T[Name] raise {
  let (fm, vs) = (x2123, x2124)
  fn fv(
    x2125 : @oset.T[String],
    x2126 : @list.List[(@oset.T[String], Formula)],
  ) -> @oset.T[Name] raise {
    let vs_1 = x2125
    match x2126 {
      Empty => vs_1
      More((_, Formula::True), tail=fms) => fv(vs_1, fms)
      More((_, Formula::False), tail=fms_1) => fv(vs_1, fms_1)
      More((bv, Formula::Atom(atm)), tail=fms_2) => {
        let t2127 = difference_v2(freevars_v2(atm))(bv)
        fv(union_v11(vs_1)(t2127), fms_2)
      }
      More((bv_1, Formula::Not(p)), tail=fms_3) =>
        fv(vs_1, fms_3.prepend((bv_1, p)))
      More((bv_2, Formula::And(p_1, q)), tail=fms_4) =>
        fv(vs_1, fms_4.prepend((bv_2, q)).prepend((bv_2, p_1)))
      More((bv_3, Formula::Or(p_2, q_1)), tail=fms_5) =>
        fv(vs_1, fms_5.prepend((bv_3, q_1)).prepend((bv_3, p_2)))
      More((bv_4, Formula::Imp(p_3, q_2)), tail=fms_6) =>
        fv(vs_1, fms_6.prepend((bv_4, q_2)).prepend((bv_4, p_3)))
      More((bv_5, Formula::Iff(p_4, q_3)), tail=fms_7) =>
        fv(vs_1, fms_7.prepend((bv_5, q_3)).prepend((bv_5, p_4)))
      More((bv_6, Formula::Forall(v, p_5)), tail=fms_8) =>
        fv(vs_1, fms_8.prepend((add_v8(bv_6, v), p_5)))
      More((bv_7, Formula::Exists(v_1, p_6)), tail=fms_9) =>
        fv(vs_1, fms_9.prepend((add_v8(bv_7, v_1), p_6)))
    }
  }
  fv(vs, @list.List([(empty_v7(), fm)]))
}

///|
/// `freeVars`
pub fn freevars_v3(x2128 : Formula) -> @oset.T[Name] raise {
  let fm = x2128
  add_v17(fm, empty_v7())
}

///|
/// `freeVarsList`
pub fn freevarslist_v1(x2129 : @list.List[Formula]) -> @oset.T[Name] raise {
  let fms = x2129
  foldl(
    fn(x2130 : (Formula, @oset.T[String])) -> @oset.T[String] raise {
      add_v17(x2130.0, x2130.1)
    },
    empty_v7(),
    fms,
  )
}

///|
/// `specialize`
pub fn specialize(x2131 : Formula) -> Formula raise {
  let fm = x2131
  stripforall(fm).1
}

///|
/// `generalize`
pub fn generalize(x2132 : Formula) -> Formula raise {
  let fm = x2132
  listmkforall((tolist_v7(freevars_v3(fm)), fm))
}

///|
/// `substCheck`
pub fn substcheck(x2133 : Subst, x2134 : Formula) -> Formula raise {
  let sub = x2133
  let fm = x2134
  if null_v11(sub) {
    fm
  } else {
    substfm(sub, fm)
  }
}

///|
/// `substFm`
pub fn substfm(x2135 : Subst, x2136 : Formula) -> Formula raise {
  let sub_1 = x2135
  let fm_1 = x2136
  match fm_1 {
    Formula::True => fm_1
    Formula::False => fm_1
    Formula::Atom((p, tms)) => {
      let tms_p = @lib.map(subst(sub_1), tms)
      if physical_equal(tms, tms_p) {
        fm_1
      } else {
        Formula::Atom((p, tms_p))
      }
    }
    Formula::Not(p_1) => {
      let p_p = substfm(sub_1, p_1)
      if physical_equal(p_1, p_p) {
        fm_1
      } else {
        Formula::Not(p_p)
      }
    }
    Formula::And(p_2, q) =>
      substconn(
        sub_1,
        fm_1,
        fn(x2137 : (Formula, Formula)) -> Formula raise {
          let (x, y) = x2137
          Formula::And(x, y)
        },
        p_2,
        q,
      )
    Formula::Or(p_3, q_1) =>
      substconn(
        sub_1,
        fm_1,
        fn(x2138 : (Formula, Formula)) -> Formula raise {
          let (x_1, y_1) = x2138
          Formula::Or(x_1, y_1)
        },
        p_3,
        q_1,
      )
    Formula::Imp(p_4, q_2) =>
      substconn(
        sub_1,
        fm_1,
        fn(x2139 : (Formula, Formula)) -> Formula raise {
          let (x_2, y_2) = x2139
          Formula::Imp(x_2, y_2)
        },
        p_4,
        q_2,
      )
    Formula::Iff(p_5, q_3) =>
      substconn(
        sub_1,
        fm_1,
        fn(x2140 : (Formula, Formula)) -> Formula raise {
          let (x_3, y_3) = x2140
          Formula::Iff(x_3, y_3)
        },
        p_5,
        q_3,
      )
    Formula::Forall(v, p_6) =>
      substquant(
        sub_1,
        fm_1,
        fn(x2141 : (String, Formula)) -> Formula raise {
          let (x_4, y_4) = x2141
          Formula::Forall(x_4, y_4)
        },
        v,
        p_6,
      )
    Formula::Exists(v_1, p_7) =>
      substquant(
        sub_1,
        fm_1,
        fn(x2142 : (String, Formula)) -> Formula raise {
          let (x_5, y_5) = x2142
          Formula::Exists(x_5, y_5)
        },
        v_1,
        p_7,
      )
  }
}

///|
/// `substConn`
pub fn substconn(
  x2143 : Subst,
  x2144 : Formula,
  x2145 : ((Formula, Formula)) -> Formula raise,
  x2146 : Formula,
  x2147 : Formula,
) -> Formula raise {
  let sub_2 = x2143
  let fm_2 = x2144
  let conn = x2145
  let p_8 = x2146
  let q_4 = x2147
  let p_p_1 = substfm(sub_2, p_8)
  let q_p = substfm(sub_2, q_4)
  if physical_equal(p_8, p_p_1) && physical_equal(q_4, q_p) {
    fm_2
  } else {
    conn((p_p_1, q_p))
  }
}

///|
/// `substQuant`
pub fn substquant(
  x2148 : Subst,
  x2149 : Formula,
  x2150 : ((String, Formula)) -> Formula raise,
  x2151 : String,
  x2152 : Formula,
) -> Formula raise {
  let sub_3 = x2148
  let fm_3 = x2149
  let quant = x2150
  let v_2 = x2151
  let p_9 = x2152
  let f : ((String, @oset.T[String])) -> @oset.T[String] raise = fn(
    x2153 : (String, @oset.T[String]),
  ) -> @oset.T[String] raise {
    let (w, s) = x2153
    if equal_v6(w, v_2) {
      s
    } else {
      match peek_v6(sub_3)(w) {
        None => add_v8(s, w)
        Some(tm) => {
          let t2154 = freevars(tm)
          union_v11(s)(t2154)
        }
      }
    }
  }
  let vars = freevars_v3(p_9)
  let vars_1 = foldl_v7(f)(empty_v7())(vars)
  let v_p = variantprime_v1(vars_1)(v_2)
  let sub_4 = if equal_v6(v_2, v_p) {
    let t2155 = singleton_v11(v_2)
    remove_v12(sub_3)(t2155)
  } else {
    let t2156 = (v_2, Term::Var(v_p))
    insert_v5(sub_3)(t2156)
  }
  let p_p_2 = substcheck(sub_4, p_9)
  if equal_v6(v_2, v_p) && physical_equal(p_9, p_p_2) {
    fm_3
  } else {
    quant((v_p, p_p_2))
  }
}

///|
/// subst
fn step_77() -> Unit raise {
  subst_v2_c.set(fn(x2157 : Subst) -> ((Formula) -> Formula raise) raise {
    fn(x2158 : Formula) -> Formula raise { substcheck(x2157, x2158) }
  })
}

///|
let subst_v2_c : @lib.Cell[(Subst) -> ((Formula) -> Formula raise) raise] = @lib.Cell::new(
  "subst",
)

///|
/// `subst`
pub fn subst_v2(x : Subst) -> ((Formula) -> Formula raise) raise {
  subst_v2_c.get()(x)
}

///|
/// `mkEq`
pub fn mkeq_v1(x2159 : (Term, Term)) -> Formula raise {
  let a_b = x2159
  Formula::Atom(mkeq(a_b))
}

///|
/// `destEq`
pub fn desteq_v1(x2160 : Formula) -> (Term, Term) raise {
  let fm = x2160
  desteq(destatom(fm))
}

///|
/// isEq
fn step_78() -> Unit raise {
  iseq_v1_c.set((x2161 : Formula) => @lib.can(desteq_v1, x2161))
}

///|
let iseq_v1_c : @lib.Cell[(Formula) -> Bool raise] = @lib.Cell::new("isEq")

///|
/// `isEq`
pub fn iseq_v1(x : Formula) -> Bool raise {
  iseq_v1_c.get()(x)
}

///|
/// `mkNeq`
pub fn mkneq(x2162 : (Term, Term)) -> Formula raise {
  let a_b = x2162
  Formula::Not(mkeq_v1(a_b))
}

///|
/// `destNeq`
pub fn destneq(x2163 : Formula) -> (Term, Term) raise {
  match x2163 {
    Formula::Not(fm) => desteq_v1(fm)
    _ => raise Failure("Formula.destNeq")
  }
}

///|
/// isNeq
fn step_79() -> Unit raise {
  isneq_c.set((x2164 : Formula) => @lib.can(destneq, x2164))
}

///|
let isneq_c : @lib.Cell[(Formula) -> Bool raise] = @lib.Cell::new("isNeq")

///|
/// `isNeq`
pub fn isneq(x : Formula) -> Bool raise {
  isneq_c.get()(x)
}

///|
/// `mkRefl`
pub fn mkrefl_v1(x2165 : Term) -> Formula raise {
  let tm = x2165
  Formula::Atom(mkrefl(tm))
}

///|
/// `destRefl`
pub fn destrefl_v1(x2166 : Formula) -> Term raise {
  let fm = x2166
  destrefl(destatom(fm))
}

///|
/// isRefl
fn step_80() -> Unit raise {
  isrefl_v1_c.set((x2167 : Formula) => @lib.can(destrefl_v1, x2167))
}

///|
let isrefl_v1_c : @lib.Cell[(Formula) -> Bool raise] = @lib.Cell::new("isRefl")

///|
/// `isRefl`
pub fn isrefl_v1(x : Formula) -> Bool raise {
  isrefl_v1_c.get()(x)
}

///|
/// `sym`
pub fn sym_v1(x2168 : Formula) -> Formula raise {
  let fm = x2168
  Formula::Atom(sym(destatom(fm)))
}

///|
/// `lhs`
pub fn lhs_v1(x2169 : Formula) -> Term raise {
  let fm = x2169
  desteq_v1(fm).0
}

///|
/// `rhs`
pub fn rhs_v1(x2170 : Formula) -> Term raise {
  let fm = x2170
  desteq_v1(fm).1
}

///|
/// truthName
fn step_81() -> Unit raise {
  truthname_c.set(fromstring("T"))
}

///|
let truthname_c : @lib.Cell[Name] = @lib.Cell::new("truthName")

///|
/// `truthName`
pub fn truthname() -> Name {
  truthname_c.get()
}

///|
/// falsityName
fn step_82() -> Unit raise {
  falsityname_c.set(fromstring("F"))
}

///|
let falsityname_c : @lib.Cell[Name] = @lib.Cell::new("falsityName")

///|
/// `falsityName`
pub fn falsityname() -> Name {
  falsityname_c.get()
}

///|
/// conjunctionName
fn step_83() -> Unit raise {
  conjunctionname_c.set(fromstring("/\\"))
}

///|
let conjunctionname_c : @lib.Cell[Name] = @lib.Cell::new("conjunctionName")

///|
/// `conjunctionName`
pub fn conjunctionname() -> Name {
  conjunctionname_c.get()
}

///|
/// disjunctionName
fn step_84() -> Unit raise {
  disjunctionname_c.set(fromstring("\\/"))
}

///|
let disjunctionname_c : @lib.Cell[Name] = @lib.Cell::new("disjunctionName")

///|
/// `disjunctionName`
pub fn disjunctionname() -> Name {
  disjunctionname_c.get()
}

///|
/// implicationName
fn step_85() -> Unit raise {
  implicationname_c.set(fromstring("==>"))
}

///|
let implicationname_c : @lib.Cell[Name] = @lib.Cell::new("implicationName")

///|
/// `implicationName`
pub fn implicationname() -> Name {
  implicationname_c.get()
}

///|
/// equivalenceName
fn step_86() -> Unit raise {
  equivalencename_c.set(fromstring("<=>"))
}

///|
let equivalencename_c : @lib.Cell[Name] = @lib.Cell::new("equivalenceName")

///|
/// `equivalenceName`
pub fn equivalencename() -> Name {
  equivalencename_c.get()
}

///|
/// universalName
fn step_87() -> Unit raise {
  universalname_c.set(fromstring("forall"))
}

///|
let universalname_c : @lib.Cell[Name] = @lib.Cell::new("universalName")

///|
/// `universalName`
pub fn universalname() -> Name {
  universalname_c.get()
}

///|
/// existentialName
fn step_88() -> Unit raise {
  existentialname_c.set(fromstring("?"))
}

///|
let existentialname_c : @lib.Cell[Name] = @lib.Cell::new("existentialName")

///|
/// `existentialName`
pub fn existentialname() -> Name {
  existentialname_c.get()
}

///|
/// `demote`
pub fn demote(x2171 : Formula) -> Term raise {
  match x2171 {
    Formula::True => Term::Fn((truthname(), @list.List([])))
    Formula::False => Term::Fn((falsityname(), @list.List([])))
    Formula::Atom((p, tms)) => Term::Fn((p, tms))
    Formula::Not(p_1) => {
      let s = "~"
      let t2172 = @list.List([demote(p_1)])
      Term::Fn((fromstring(s), t2172))
    }
    Formula::And(p_2, q) => {
      let t2173 = demote(q)
      Term::Fn((conjunctionname(), @list.List([demote(p_2), t2173])))
    }
    Formula::Or(p_3, q_1) => {
      let t2174 = demote(q_1)
      Term::Fn((disjunctionname(), @list.List([demote(p_3), t2174])))
    }
    Formula::Imp(p_4, q_2) => {
      let t2175 = demote(q_2)
      Term::Fn((implicationname(), @list.List([demote(p_4), t2175])))
    }
    Formula::Iff(p_5, q_3) => {
      let t2176 = demote(q_3)
      Term::Fn((equivalencename(), @list.List([demote(p_5), t2176])))
    }
    Formula::Forall(v, b) => {
      let t2177 = demote(b)
      Term::Fn((universalname(), @list.List([Term::Var(v), t2177])))
    }
    Formula::Exists(v_1, b_1) => {
      let t2178 = demote(b_1)
      Term::Fn((existentialname(), @list.List([Term::Var(v_1), t2178])))
    }
  }
}

///|
/// `toString`
pub fn tostring_v5(x2179 : Formula) -> Name raise {
  let fm = x2179
  tostring_v4(demote(fm))
}

///|
/// `add_asms`
pub fn add_asms(x2180 : @list.List[Formula], x2181 : Formula) -> Formula raise {
  let asms = x2180
  let goal = x2181
  if null(asms) {
    goal
  } else {
    Formula::Imp(listmkconj(@lib.rev(asms)), goal)
  }
}

///|
/// `add_var_asms`
pub fn add_var_asms(
  x2182 : @list.List[Formula],
  x2183 : String,
  x2184 : Formula,
) -> Formula raise {
  let asms = x2182
  let v = x2183
  let goal = x2184
  add_asms(asms, Formula::Forall(v, goal))
}

///|
/// `split`
pub fn split_v11(
  x2185 : @list.List[Formula],
  x2186 : Bool,
  x2187 : Formula,
) -> @list.List[Formula] raise {
  let asms = x2185
  let pol = x2186
  let fm = x2187
  match (pol, fm) {
    (true, Formula::True) => @list.List([])
    (true, Formula::Not(f)) => split_v11(asms, false, f)
    (true, Formula::And(f1, f2)) => {
      let t2188 = split_v11(asms.prepend(f1), true, f2)
      split_v11(asms, true, f1).concat(t2188)
    }
    (true, Formula::Or(f1_1, f2_1)) =>
      split_v11(asms.prepend(Formula::Not(f1_1)), true, f2_1)
    (true, Formula::Imp(f1_2, f2_2)) =>
      split_v11(asms.prepend(f1_2), true, f2_2)
    (true, Formula::Iff(f1_3, f2_3)) => {
      let t2189 = split_v11(asms.prepend(f2_3), true, f1_3)
      split_v11(asms.prepend(f1_3), true, f2_3).concat(t2189)
    }
    (true, Formula::Forall(v, f_1)) =>
      @lib.map(
        (x2190 : Formula) => add_var_asms(asms, v, x2190),
        split_v11(@list.List([]), true, f_1),
      )
    (false, Formula::False) => @list.List([])
    (false, Formula::Not(f_2)) => split_v11(asms, true, f_2)
    (false, Formula::And(f1_4, f2_4)) =>
      split_v11(asms.prepend(f1_4), false, f2_4)
    (false, Formula::Or(f1_5, f2_5)) => {
      let t2191 = split_v11(asms.prepend(Formula::Not(f1_5)), false, f2_5)
      split_v11(asms, false, f1_5).concat(t2191)
    }
    (false, Formula::Imp(f1_6, f2_6)) => {
      let t2192 = split_v11(asms.prepend(f1_6), false, f2_6)
      split_v11(asms, true, f1_6).concat(t2192)
    }
    (false, Formula::Iff(f1_7, f2_7)) => {
      let t2193 = split_v11(asms.prepend(Formula::Not(f2_7)), true, f1_7)
      split_v11(asms.prepend(f1_7), false, f2_7).concat(t2193)
    }
    (false, Formula::Exists(v_1, f_3)) =>
      @lib.map(
        (x2194 : Formula) => add_var_asms(asms, v_1, x2194),
        split_v11(@list.List([]), false, f_3),
      )
    _ => @list.List([add_asms(asms, if pol { fm } else { Formula::Not(fm) })])
  }
}

///|
/// `splitGoal`
pub fn splitgoal(x2195 : Formula) -> @list.List[Formula] raise {
  let fm = x2195
  split_v11(@list.List([]), true, fm)
}

///|
/// `t`
pub type T18 = Formula

///|
/// compare
fn step_89() -> Unit raise {
  compare_v30_c.set(fn(x2196 : Formula) -> ((Formula) -> Int64 raise) raise {
    fn(x2197 : Formula) -> Int64 raise { compare_v29(x2196, x2197) }
  })
}

///|
let compare_v30_c : @lib.Cell[(Formula) -> ((Formula) -> Int64 raise) raise] = @lib.Cell::new(
  "compare",
)

///|
/// `compare`
pub fn compare_v30(x : Formula) -> ((Formula) -> Int64 raise) raise {
  compare_v30_c.get()(x)
}

///|
/// `key`
pub type Key6 = T18

///|
/// `t`
pub type T19[TA] = @omap.T[Key6, TA]

///|
/// `empty`
pub fn[TA, TB] empty_v17() -> @omap.T[TA, TB] {
  @omap.empty()
}

///|
/// `is_empty`
pub fn[TA, TB] is_empty_v11(x2198 : @omap.T[TA, TB]) -> Bool raise {
  let m = x2198
  @omap.is_empty(m)
}

///|
/// `mem`
pub fn[TA] mem_v11(x2199 : Formula, x2200 : @omap.T[Formula, TA]) -> Bool raise {
  let x = x2199
  let m = x2200
  @omap.mem(compare_v30, x, m)
}

///|
/// `add`
pub fn[TA] add_v18(
  x2201 : Formula,
  x2202 : TA,
  x2203 : @omap.T[Formula, TA],
) -> @omap.T[Formula, TA] raise {
  let x = x2201
  let data = x2202
  let m = x2203
  @omap.add(compare_v30, x, data, m)
}

///|
/// `update`
pub fn[TA] update_v6(
  x2204 : Formula,
  x2205 : (TA?) -> TA? raise,
  x2206 : @omap.T[Formula, TA],
) -> @omap.T[Formula, TA] raise {
  let x = x2204
  let f = x2205
  let m = x2206
  @omap.update(compare_v30, x, f, m)
}

///|
/// `singleton`
pub fn[TA, TB] singleton_v23(x2207 : TA, x2208 : TB) -> @omap.T[TA, TB] raise {
  let x = x2207
  let d = x2208
  @omap.singleton(x, d)
}

///|
/// `remove`
pub fn[TA] remove_v15(
  x2209 : Formula,
  x2210 : @omap.T[Formula, TA],
) -> @omap.T[Formula, TA] raise {
  let x = x2209
  let m = x2210
  @omap.remove(compare_v30, x, m)
}

///|
/// `merge`
pub fn[TA, TB, TC] merge_v8(
  x2211 : (Formula) -> ((TC?) -> ((TB?) -> TA? raise) raise) raise,
  x2212 : @omap.T[Formula, TC],
  x2213 : @omap.T[Formula, TB],
) -> @omap.T[Formula, TA] raise {
  let f = x2211
  let s1 = x2212
  let s2 = x2213
  @omap.merge(compare_v30, f, s1, s2)
}

///|
/// `union`
pub fn[TA] union_v23(
  x2214 : (Formula) -> ((TA) -> ((TA) -> TA? raise) raise) raise,
  x2215 : @omap.T[Formula, TA],
  x2216 : @omap.T[Formula, TA],
) -> @omap.T[Formula, TA] raise {
  let f = x2214
  let s1 = x2215
  let s2 = x2216
  @omap.union(compare_v30, f, s1, s2)
}

///|
/// `compare`
pub fn[TA, TB] compare_v31(
  x2217 : (TB) -> ((TA) -> Int64 raise) raise,
  x2218 : @omap.T[Formula, TB],
  x2219 : @omap.T[Formula, TA],
) -> Int64 raise {
  let cmp = x2217
  let m1 = x2218
  let m2 = x2219
  @omap.compare(compare_v30, cmp, m1, m2)
}

///|
/// `equal`
pub fn[TA, TB] equal_v22(
  x2220 : (TB) -> ((TA) -> Bool raise) raise,
  x2221 : @omap.T[Formula, TB],
  x2222 : @omap.T[Formula, TA],
) -> Bool raise {
  let cmp = x2220
  let m1 = x2221
  let m2 = x2222
  @omap.equal(compare_v30, cmp, m1, m2)
}

///|
/// `iter`
pub fn[TA, TB, TC] iter_v11(
  x2223 : (TC) -> ((TB) -> TA raise) raise,
  x2224 : @omap.T[TC, TB],
) -> Unit raise {
  let f = x2223
  let m = x2224
  @omap.iter(f, m)
}

///|
/// `fold`
pub fn[TA, TB, TC] fold_v11(
  x2225 : (TC) -> ((TB) -> ((TA) -> TA raise) raise) raise,
  x2226 : @omap.T[TC, TB],
  x2227 : TA,
) -> TA raise {
  let f = x2225
  let m = x2226
  let accu = x2227
  @omap.fold(f, m, accu)
}

///|
/// `for_all`
pub fn[TA, TB] for_all_v11(
  x2228 : (TB) -> ((TA) -> Bool raise) raise,
  x2229 : @omap.T[TB, TA],
) -> Bool raise {
  let p = x2228
  let m = x2229
  @omap.for_all(p, m)
}

///|
/// `exists`
pub fn[TA, TB] exists_v22(
  x2230 : (TB) -> ((TA) -> Bool raise) raise,
  x2231 : @omap.T[TB, TA],
) -> Bool raise {
  let p = x2230
  let m = x2231
  @omap.exists(p, m)
}

///|
/// `filter`
pub fn[TA, TB] filter_v18(
  x2232 : (TA) -> ((TB) -> Bool raise) raise,
  x2233 : @omap.T[TA, TB],
) -> @omap.T[TA, TB] raise {
  let p = x2232
  let m = x2233
  @omap.filter(p, m)
}

///|
/// `filter_map`
pub fn[TA, TB, TC] filter_map_v11(
  x2234 : (TA) -> ((TC) -> TB? raise) raise,
  x2235 : @omap.T[TA, TC],
) -> @omap.T[TA, TB] raise {
  let f = x2234
  let m = x2235
  @omap.filter_map(f, m)
}

///|
/// `partition`
pub fn[TA, TB] partition_v13(
  x2236 : (TA) -> ((TB) -> Bool raise) raise,
  x2237 : @omap.T[TA, TB],
) -> (@omap.T[TA, TB], @omap.T[TA, TB]) raise {
  let p = x2236
  let m = x2237
  @omap.partition(p, m)
}

///|
/// `cardinal`
pub fn[TA, TB] cardinal_v11(x2238 : @omap.T[TA, TB]) -> Int64 raise {
  let m = x2238
  @omap.cardinal(m)
}

///|
/// `bindings`
pub fn[TA, TB] bindings_v6(
  x2239 : @omap.T[TA, TB],
) -> @list.List[(TA, TB)] raise {
  let s = x2239
  @omap.bindings(s)
}

///|
/// `min_binding`
pub fn[TA, TB] min_binding_v6(x2240 : @omap.T[TA, TB]) -> (TA, TB) raise {
  let m = x2240
  @omap.min_binding(m)
}

///|
/// `min_binding_opt`
pub fn[TA, TB] min_binding_opt_v6(x2241 : @omap.T[TA, TB]) -> (TA, TB)? raise {
  let m = x2241
  @omap.min_binding_opt(m)
}

///|
/// `max_binding`
pub fn[TA, TB] max_binding_v6(x2242 : @omap.T[TA, TB]) -> (TA, TB) raise {
  let m = x2242
  @omap.max_binding(m)
}

///|
/// `max_binding_opt`
pub fn[TA, TB] max_binding_opt_v6(x2243 : @omap.T[TA, TB]) -> (TA, TB)? raise {
  let m = x2243
  @omap.max_binding_opt(m)
}

///|
/// `choose`
pub fn[TA, TB] choose_v11(x2244 : @omap.T[TA, TB]) -> (TA, TB) raise {
  let m = x2244
  @omap.choose(m)
}

///|
/// `choose_opt`
pub fn[TA, TB] choose_opt_v11(x2245 : @omap.T[TA, TB]) -> (TA, TB)? raise {
  let m = x2245
  @omap.choose_opt(m)
}

///|
/// `split`
pub fn[TA] split_v12(
  x2246 : Formula,
  x2247 : @omap.T[Formula, TA],
) -> (@omap.T[Formula, TA], TA?, @omap.T[Formula, TA]) raise {
  let x = x2246
  let m = x2247
  @omap.split(compare_v30, x, m)
}

///|
/// `find`
pub fn[TA] find_v14(x2248 : Formula, x2249 : @omap.T[Formula, TA]) -> TA raise {
  let x = x2248
  let m = x2249
  @omap.find(compare_v30, x, m)
}

///|
/// `find_opt`
pub fn[TA] find_opt_v11(
  x2250 : Formula,
  x2251 : @omap.T[Formula, TA],
) -> TA? raise {
  let x = x2250
  let m = x2251
  @omap.find_opt(compare_v30, x, m)
}

///|
/// `find_first`
pub fn[TA, TB] find_first_v11(
  x2252 : (TA) -> Bool raise,
  x2253 : @omap.T[TA, TB],
) -> (TA, TB) raise {
  let f = x2252
  let m = x2253
  @omap.find_first(f, m)
}

///|
/// `find_first_opt`
pub fn[TA, TB] find_first_opt_v11(
  x2254 : (TA) -> Bool raise,
  x2255 : @omap.T[TA, TB],
) -> (TA, TB)? raise {
  let f = x2254
  let m = x2255
  @omap.find_first_opt(f, m)
}

///|
/// `find_last`
pub fn[TA, TB] find_last_v11(
  x2256 : (TA) -> Bool raise,
  x2257 : @omap.T[TA, TB],
) -> (TA, TB) raise {
  let f = x2256
  let m = x2257
  @omap.find_last(f, m)
}

///|
/// `find_last_opt`
pub fn[TA, TB] find_last_opt_v11(
  x2258 : (TA) -> Bool raise,
  x2259 : @omap.T[TA, TB],
) -> (TA, TB)? raise {
  let f = x2258
  let m = x2259
  @omap.find_last_opt(f, m)
}

///|
/// `map`
pub fn[TA, TB, TC] map_v13(
  x2260 : (TC) -> TB raise,
  x2261 : @omap.T[TA, TC],
) -> @omap.T[TA, TB] raise {
  let f = x2260
  let m = x2261
  @omap.map(f, m)
}

///|
/// `mapi`
pub fn[TA, TB, TC] mapi_v6(
  x2262 : (TA) -> ((TC) -> TB raise) raise,
  x2263 : @omap.T[TA, TC],
) -> @omap.T[TA, TB] raise {
  let f = x2262
  let m = x2263
  @omap.mapi(f, m)
}

///|
/// `map`
pub type Map7[TA] = T19[TA]

///|
/// `newMap`
pub fn[TA, TB] newmap_v6(x2264 : Unit) -> @omap.T[TA, TB] raise {
  let _ = x2264
  empty_v17()
}

///|
/// `null`
pub fn[TA, TB] null_v14(x : @omap.T[TA, TB]) -> Bool raise {
  let f : (@omap.T[TA, TB]) -> Bool raise = is_empty_v11
  f(x)
}

///|
/// `singleton`
pub fn[TA, TB] singleton_v24(x2265 : TA, x2266 : TB) -> @omap.T[TA, TB] raise {
  let (k, x) = (x2265, x2266)
  singleton_v23(k, x)
}

///|
/// `size`
pub fn[TA, TB] size_v13(x : @omap.T[TA, TB]) -> Int64 raise {
  let f : (@omap.T[TA, TB]) -> Int64 raise = cardinal_v11
  f(x)
}

///|
/// `get`
pub fn[TA] get_v6(x2267 : @omap.T[Formula, TA], x2268 : Formula) -> TA raise {
  let m = x2267
  let k = x2268
  find_v14(k, m) catch {
    @lib.NotFound => raise Failure("Mmap.get: element not found")
    e => raise e
  }
}

///|
/// `peek`
pub fn[TA] peek_v8(x2269 : @omap.T[Formula, TA], x2270 : Formula) -> TA? raise {
  let m = x2269
  let k = x2270
  Some(find_v14(k, m)) catch {
    @lib.NotFound => None
    e => raise e
  }
}

///|
/// `insert`
pub fn[TA] insert_v7(
  x2271 : @omap.T[Formula, TA],
  x2272 : (Formula, TA),
) -> @omap.T[Formula, TA] raise {
  let m = x2271
  let (k, v) = x2272
  add_v18(k, v, m)
}

///|
/// `toList`
pub fn[TA, TB] tolist_v13(x : @omap.T[TA, TB]) -> @list.List[(TA, TB)] raise {
  let f : (@omap.T[TA, TB]) -> @list.List[(TA, TB)] raise = bindings_v6
  f(x)
}

///|
/// `fromList`
pub fn[TA] fromlist_v12(
  x2273 : @list.List[(Formula, TA)],
) -> @omap.T[Formula, TA] raise {
  let l = x2273
  @lib.itlist(
    fn(
      x2274 : (Formula, TA),
      x2275 : @omap.T[Formula, TA],
    ) -> @omap.T[Formula, TA] raise {
      let (v, tm) = x2274
      ((x2276 : @omap.T[Formula, TA]) => add_v18(v, tm, x2276))(x2275)
    },
    l,
    empty_v17(),
  )
}

///|
/// `foldl`
pub fn[TA, TB, TC] foldl_v13(
  x2277 : ((TB, TC, TA)) -> TA raise,
  x2278 : TA,
  x2279 : @omap.T[TB, TC],
) -> TA raise {
  let f = x2277
  let b = x2278
  let m = x2279
  @lib.fold_left(
    fn(x2280 : TA, x2281 : (TB, TC)) -> TA raise {
      let s = x2280
      let (v, tm) = x2281
      f((v, tm, s))
    },
    b,
    bindings_v6(m),
  )
}

///|
/// `foldr`
pub fn[TA, TB, TC] foldr_v13(
  x : ((TB, TC, TA)) -> TA raise,
) -> ((TA) -> ((@omap.T[TB, TC]) -> TA raise) raise) raise {
  let f : (((TB, TC, TA)) -> TA raise) -> ((TA) -> ((@omap.T[TB, TC]) -> TA raise) raise) raise = x2282 => {
    x2283 => x2284 => foldl_v13(x2282, x2283, x2284)
  }
  f(x)
}

///|
/// `filter`
pub fn[TA, TB] filter_v19(
  x2285 : ((TA, TB)) -> Bool raise,
) -> ((@omap.T[TA, TB]) -> @omap.T[TA, TB] raise) raise {
  let f = x2285
  (x2289 : @omap.T[TA, TB]) => {
    filter_v18(
      fn(x2287 : TA) -> ((TB) -> Bool raise) raise {
        let x = x2287
        fn(x2288 : TB) -> Bool raise {
          let y = x2288
          f((x, y))
        }
      },
      x2289,
    )
  }
}

///|
/// `inDomain`
pub fn[TA] indomain_v6(
  x : Formula,
) -> ((@omap.T[Formula, TA]) -> Bool raise) raise {
  let f : (Formula) -> ((@omap.T[Formula, TA]) -> Bool raise) raise = (
    x2290 : Formula,
  ) => x2291 => mem_v11(x2290, x2291)
  f(x)
}

///|
/// `union`
pub fn[TA] union_v24(
  x2292 : (((Formula, TA), (Formula, TA))) -> TA? raise,
  x2293 : @omap.T[Formula, TA],
  x2294 : @omap.T[Formula, TA],
) -> @omap.T[Formula, TA] raise {
  let f = x2292
  let m1 = x2293
  let m2 = x2294
  let f_p : (Formula) -> (((TA?, TA?)) -> TA? raise) raise = fn(
    x2295 : Formula,
  ) -> (((TA?, TA?)) -> TA? raise) raise {
    let k = x2295
    fn(x2296 : (TA?, TA?)) -> TA? raise {
      match x2296 {
        (Some(x), Some(y)) => f(((k, x), (k, y)))
        (Some(x_1), None) => Some(x_1)
        (None, Some(y_1)) => Some(y_1)
        (None, None) => None
      }
    }
  }
  merge_v8(
    fn(x2297 : Formula) -> ((TA?) -> ((TA?) -> TA? raise) raise) raise {
      let k_1 = x2297
      fn(x2298 : TA?) -> ((TA?) -> TA? raise) raise {
        let x_2 = x2298
        fn(x2299 : TA?) -> TA? raise {
          let y_2 = x2299
          f_p(k_1)((x_2, y_2))
        }
      }
    },
    m1,
    m2,
  )
}

///|
/// `delete`
pub fn[TA] delete_v11(
  x2300 : @omap.T[Formula, TA],
  x2301 : Formula,
) -> @omap.T[Formula, TA] raise {
  let m = x2300
  let k = x2301
  remove_v15(k, m)
}

///|
/// `mapPartial`
pub fn[TA, TB] mappartial_v7(
  x2302 : ((Formula, TB)) -> TA? raise,
  x2303 : @omap.T[Formula, TB],
) -> @omap.T[Formula, TA] raise {
  let f = x2302
  let m = x2303
  fold_v11(
    fn(
      x2304 : Formula,
    ) -> ((TB) -> ((@omap.T[Formula, TA]) -> @omap.T[Formula, TA] raise) raise) raise {
      let k = x2304
      fn(
        x2305 : TB,
      ) -> ((@omap.T[Formula, TA]) -> @omap.T[Formula, TA] raise) raise {
        let x = x2305
        fn(x2306 : @omap.T[Formula, TA]) -> @omap.T[Formula, TA] raise {
          let acc = x2306
          match f((k, x)) {
            Some(y) => add_v18(k, y, acc)
            None => acc
          }
        }
      }
    },
    m,
    empty_v17(),
  )
}

///|
/// `transform`
pub fn[TA, TB, TC] transform_v11(
  x : (TC) -> TB raise,
) -> ((@omap.T[TA, TC]) -> @omap.T[TA, TB] raise) raise {
  let f : ((TC) -> TB raise) -> ((@omap.T[TA, TC]) -> @omap.T[TA, TB] raise) raise = x2307 => {
    x2308 => map_v13(x2307, x2308)
  }
  f(x)
}

///|
/// `exists`
pub fn[TA, TB] exists_v23(
  x2309 : ((TA, TB)) -> Bool raise,
) -> ((@omap.T[TA, TB]) -> Bool raise) raise {
  let f = x2309
  (x2313 : @omap.T[TA, TB]) => {
    exists_v22(
      fn(x2311 : TA) -> ((TB) -> Bool raise) raise {
        let k = x2311
        fn(x2312 : TB) -> Bool raise {
          let m = x2312
          f((k, m))
        }
      },
      x2313,
    )
  }
}

///|
/// `elt`
pub type Elt5 = T18

///|
/// `t`
pub type T20 = @oset.T[Elt5]

///|
/// `empty`
pub fn[TA] empty_v18() -> @oset.T[TA] {
  @oset.empty()
}

///|
/// `is_empty`
pub fn[TA] is_empty_v12(x2314 : @oset.T[TA]) -> Bool raise {
  let s = x2314
  @oset.is_empty(s)
}

///|
/// `mem`
pub fn mem_v12(x2315 : Formula, x2316 : @oset.T[Formula]) -> Bool raise {
  let x = x2315
  let s = x2316
  @oset.mem(compare_v30, x, s)
}

///|
/// `add`
pub fn add_v19(
  x2317 : Formula,
  x2318 : @oset.T[Formula],
) -> @oset.T[Formula] raise {
  let x = x2317
  let s = x2318
  @oset.add(compare_v30, x, s)
}

///|
/// `singleton`
pub fn[TA] singleton_v25(x2319 : TA) -> @oset.T[TA] raise {
  let x = x2319
  @oset.singleton(x)
}

///|
/// `remove`
pub fn remove_v16(
  x2320 : Formula,
  x2321 : @oset.T[Formula],
) -> @oset.T[Formula] raise {
  let x = x2320
  let s = x2321
  @oset.remove(compare_v30, x, s)
}

///|
/// `union`
pub fn union_v25(
  x2322 : @oset.T[Formula],
  x2323 : @oset.T[Formula],
) -> @oset.T[Formula] raise {
  let s1 = x2322
  let s2 = x2323
  @oset.union(compare_v30, s1, s2)
}

///|
/// `inter`
pub fn inter_v5(
  x2324 : @oset.T[Formula],
  x2325 : @oset.T[Formula],
) -> @oset.T[Formula] raise {
  let s1 = x2324
  let s2 = x2325
  @oset.inter(compare_v30, s1, s2)
}

///|
/// `disjoint`
pub fn disjoint_v6(
  x2326 : @oset.T[Formula],
  x2327 : @oset.T[Formula],
) -> Bool raise {
  let s1 = x2326
  let s2 = x2327
  @oset.disjoint(compare_v30, s1, s2)
}

///|
/// `diff`
pub fn diff_v5(
  x2328 : @oset.T[Formula],
  x2329 : @oset.T[Formula],
) -> @oset.T[Formula] raise {
  let s1 = x2328
  let s2 = x2329
  @oset.diff(compare_v30, s1, s2)
}

///|
/// `compare`
pub fn compare_v32(
  x2330 : @oset.T[Formula],
  x2331 : @oset.T[Formula],
) -> Int64 raise {
  let s1 = x2330
  let s2 = x2331
  @oset.compare(compare_v30, s1, s2)
}

///|
/// `equal`
pub fn equal_v23(
  x2332 : @oset.T[Formula],
  x2333 : @oset.T[Formula],
) -> Bool raise {
  let s1 = x2332
  let s2 = x2333
  @oset.equal(compare_v30, s1, s2)
}

///|
/// `subset`
pub fn subset_v10(
  x2334 : @oset.T[Formula],
  x2335 : @oset.T[Formula],
) -> Bool raise {
  let s1 = x2334
  let s2 = x2335
  @oset.subset(compare_v30, s1, s2)
}

///|
/// `iter`
pub fn[TA, TB] iter_v12(
  x2336 : (TB) -> TA raise,
  x2337 : @oset.T[TB],
) -> Unit raise {
  let f = x2336
  let s = x2337
  @oset.iter(f, s)
}

///|
/// `map`
pub fn map_v14(
  x2338 : (Formula) -> Formula raise,
  x2339 : @oset.T[Formula],
) -> @oset.T[Formula] raise {
  let f = x2338
  let s = x2339
  @oset.map(compare_v30, f, s)
}

///|
/// `fold`
pub fn[TA, TB] fold_v12(
  x2340 : (TB) -> ((TA) -> TA raise) raise,
  x2341 : @oset.T[TB],
  x2342 : TA,
) -> TA raise {
  let f = x2340
  let s = x2341
  let accu = x2342
  @oset.fold(f, s, accu)
}

///|
/// `for_all`
pub fn[TA] for_all_v12(
  x2343 : (TA) -> Bool raise,
  x2344 : @oset.T[TA],
) -> Bool raise {
  let p = x2343
  let s = x2344
  @oset.for_all(p, s)
}

///|
/// `exists`
pub fn[TA] exists_v24(
  x2345 : (TA) -> Bool raise,
  x2346 : @oset.T[TA],
) -> Bool raise {
  let p = x2345
  let s = x2346
  @oset.exists(p, s)
}

///|
/// `filter`
pub fn[TA] filter_v20(
  x2347 : (TA) -> Bool raise,
  x2348 : @oset.T[TA],
) -> @oset.T[TA] raise {
  let p = x2347
  let s = x2348
  @oset.filter(p, s)
}

///|
/// `filter_map`
pub fn filter_map_v12(
  x2349 : (Formula) -> Formula? raise,
  x2350 : @oset.T[Formula],
) -> @oset.T[Formula] raise {
  let f = x2349
  let s = x2350
  @oset.filter_map(compare_v30, f, s)
}

///|
/// `partition`
pub fn[TA] partition_v14(
  x2351 : (TA) -> Bool raise,
  x2352 : @oset.T[TA],
) -> (@oset.T[TA], @oset.T[TA]) raise {
  let p = x2351
  let s = x2352
  @oset.partition(p, s)
}

///|
/// `cardinal`
pub fn[TA] cardinal_v12(x2353 : @oset.T[TA]) -> Int64 raise {
  let s = x2353
  @oset.cardinal(s)
}

///|
/// `elements`
pub fn[TA] elements_v5(x2354 : @oset.T[TA]) -> @list.List[TA] raise {
  let s = x2354
  @oset.elements(s)
}

///|
/// `min_elt`
pub fn[TA] min_elt_v5(x2355 : @oset.T[TA]) -> TA raise {
  let s = x2355
  @oset.min_elt(s)
}

///|
/// `min_elt_opt`
pub fn[TA] min_elt_opt_v5(x2356 : @oset.T[TA]) -> TA? raise {
  let s = x2356
  @oset.min_elt_opt(s)
}

///|
/// `max_elt`
pub fn[TA] max_elt_v5(x2357 : @oset.T[TA]) -> TA raise {
  let s = x2357
  @oset.max_elt(s)
}

///|
/// `max_elt_opt`
pub fn[TA] max_elt_opt_v5(x2358 : @oset.T[TA]) -> TA? raise {
  let s = x2358
  @oset.max_elt_opt(s)
}

///|
/// `choose`
pub fn[TA] choose_v12(x2359 : @oset.T[TA]) -> TA raise {
  let s = x2359
  @oset.choose(s)
}

///|
/// `choose_opt`
pub fn[TA] choose_opt_v12(x2360 : @oset.T[TA]) -> TA? raise {
  let s = x2360
  @oset.choose_opt(s)
}

///|
/// `split`
pub fn split_v13(
  x2361 : Formula,
  x2362 : @oset.T[Formula],
) -> (@oset.T[Formula], Bool, @oset.T[Formula]) raise {
  let x = x2361
  let s = x2362
  @oset.split(compare_v30, x, s)
}

///|
/// `find`
pub fn find_v15(x2363 : Formula, x2364 : @oset.T[Formula]) -> Formula raise {
  let x = x2363
  let s = x2364
  @oset.find(compare_v30, x, s)
}

///|
/// `find_opt`
pub fn find_opt_v12(
  x2365 : Formula,
  x2366 : @oset.T[Formula],
) -> Formula? raise {
  let x = x2365
  let s = x2366
  @oset.find_opt(compare_v30, x, s)
}

///|
/// `find_first`
pub fn[TA] find_first_v12(
  x2367 : (TA) -> Bool raise,
  x2368 : @oset.T[TA],
) -> TA raise {
  let f = x2367
  let s = x2368
  @oset.find_first(f, s)
}

///|
/// `find_first_opt`
pub fn[TA] find_first_opt_v12(
  x2369 : (TA) -> Bool raise,
  x2370 : @oset.T[TA],
) -> TA? raise {
  let f = x2369
  let s = x2370
  @oset.find_first_opt(f, s)
}

///|
/// `find_last`
pub fn[TA] find_last_v12(
  x2371 : (TA) -> Bool raise,
  x2372 : @oset.T[TA],
) -> TA raise {
  let f = x2371
  let s = x2372
  @oset.find_last(f, s)
}

///|
/// `find_last_opt`
pub fn[TA] find_last_opt_v12(
  x2373 : (TA) -> Bool raise,
  x2374 : @oset.T[TA],
) -> TA? raise {
  let f = x2373
  let s = x2374
  @oset.find_last_opt(f, s)
}

///|
/// `set`
pub type Set5 = T20

///|
/// compare
fn step_90() -> Unit raise {
  compare_v33_c.set(fn(
    x2375 : @oset.T[Formula],
  ) -> ((@oset.T[Formula]) -> Int64 raise) raise {
    fn(x2376 : @oset.T[Formula]) -> Int64 raise { compare_v32(x2375, x2376) }
  })
}

///|
let compare_v33_c : @lib.Cell[
  (@oset.T[Formula]) -> ((@oset.T[Formula]) -> Int64 raise) raise,
] = @lib.Cell::new("compare")

///|
/// `compare`
pub fn compare_v33(
  x : @oset.T[Formula],
) -> ((@oset.T[Formula]) -> Int64 raise) raise {
  compare_v33_c.get()(x)
}

///|
/// `add`
pub fn add_v20(
  x2377 : @oset.T[Formula],
  x2378 : Formula,
) -> @oset.T[Formula] raise {
  let s = x2377
  let x = x2378
  add_v19(x, s)
}

///|
/// `foldr`
pub fn[TA, TB] foldr_v14(
  x2379 : ((TB, TA)) -> TA raise,
  x2380 : TA,
  x2381 : @oset.T[TB],
) -> TA raise {
  let f = x2379
  let a = x2380
  let s = x2381
  fold_v12(
    fn(x2382 : TB) -> ((TA) -> TA raise) raise {
      let x = x2382
      fn(x2383 : TA) -> TA raise {
        let acc = x2383
        f((x, acc))
      }
    },
    s,
    a,
  )
}

///|
/// `foldl`
pub fn[TA, TB] foldl_v14(
  x : ((TB, TA)) -> TA raise,
) -> ((TA) -> ((@oset.T[TB]) -> TA raise) raise) raise {
  let f : (((TB, TA)) -> TA raise) -> ((TA) -> ((@oset.T[TB]) -> TA raise) raise) raise = x2384 => {
    x2385 => x2386 => foldr_v14(x2384, x2385, x2386)
  }
  f(x)
}

///|
/// member
fn step_91() -> Unit raise {
  member_v5_c.set(fn(
    x2387 : Formula,
  ) -> ((@oset.T[Formula]) -> Bool raise) raise {
    fn(x2388 : @oset.T[Formula]) -> Bool raise { mem_v12(x2387, x2388) }
  })
}

///|
let member_v5_c : @lib.Cell[
  (Formula) -> ((@oset.T[Formula]) -> Bool raise) raise,
] = @lib.Cell::new("member")

///|
/// `member`
pub fn member_v5(x : Formula) -> ((@oset.T[Formula]) -> Bool raise) raise {
  member_v5_c.get()(x)
}

///|
/// `empty`
pub fn[TA] empty_v19() -> @oset.T[TA] {
  empty_v18()
}

///|
/// union
fn step_92() -> Unit raise {
  union_v26_c.set(fn(
    x2389 : @oset.T[Formula],
  ) -> ((@oset.T[Formula]) -> @oset.T[Formula] raise) raise {
    fn(x2390 : @oset.T[Formula]) -> @oset.T[Formula] raise {
      union_v25(x2389, x2390)
    }
  })
}

///|
let union_v26_c : @lib.Cell[
  (@oset.T[Formula]) -> ((@oset.T[Formula]) -> @oset.T[Formula] raise) raise,
] = @lib.Cell::new("union")

///|
/// `union`
pub fn union_v26(
  x : @oset.T[Formula],
) -> ((@oset.T[Formula]) -> @oset.T[Formula] raise) raise {
  union_v26_c.get()(x)
}

///|
/// difference
fn step_93() -> Unit raise {
  difference_v5_c.set(fn(
    x2391 : @oset.T[Formula],
  ) -> ((@oset.T[Formula]) -> @oset.T[Formula] raise) raise {
    fn(x2392 : @oset.T[Formula]) -> @oset.T[Formula] raise {
      diff_v5(x2391, x2392)
    }
  })
}

///|
let difference_v5_c : @lib.Cell[
  (@oset.T[Formula]) -> ((@oset.T[Formula]) -> @oset.T[Formula] raise) raise,
] = @lib.Cell::new("difference")

///|
/// `difference`
pub fn difference_v5(
  x : @oset.T[Formula],
) -> ((@oset.T[Formula]) -> @oset.T[Formula] raise) raise {
  difference_v5_c.get()(x)
}

///|
/// `toList`
pub fn[TA] tolist_v14(x : @oset.T[TA]) -> @list.List[TA] raise {
  let f : (@oset.T[TA]) -> @list.List[TA] raise = elements_v5
  f(x)
}

///|
/// `singleton`
pub fn[TA] singleton_v26(x : TA) -> @oset.T[TA] raise {
  let f : (TA) -> @oset.T[TA] raise = singleton_v25
  f(x)
}

///|
/// `null`
pub fn[TA] null_v15(x : @oset.T[TA]) -> Bool raise {
  let f : (@oset.T[TA]) -> Bool raise = is_empty_v12
  f(x)
}

///|
/// `size`
pub fn[TA] size_v14(x : @oset.T[TA]) -> Int64 raise {
  let f : (@oset.T[TA]) -> Int64 raise = cardinal_v12
  f(x)
}

///|
/// `pick`
pub fn[TA] pick_v6(x : @oset.T[TA]) -> TA raise {
  let f : (@oset.T[TA]) -> TA raise = choose_v12
  f(x)
}

///|
/// equal
fn step_94() -> Unit raise {
  equal_v24_c.set(fn(
    x2393 : @oset.T[Formula],
  ) -> ((@oset.T[Formula]) -> Bool raise) raise {
    fn(x2394 : @oset.T[Formula]) -> Bool raise { equal_v23(x2393, x2394) }
  })
}

///|
let equal_v24_c : @lib.Cell[
  (@oset.T[Formula]) -> ((@oset.T[Formula]) -> Bool raise) raise,
] = @lib.Cell::new("equal")

///|
/// `equal`
pub fn equal_v24(
  x : @oset.T[Formula],
) -> ((@oset.T[Formula]) -> Bool raise) raise {
  equal_v24_c.get()(x)
}

///|
/// `exists`
pub fn[TA] exists_v25(
  x : (TA) -> Bool raise,
) -> ((@oset.T[TA]) -> Bool raise) raise {
  let f : ((TA) -> Bool raise) -> ((@oset.T[TA]) -> Bool raise) raise = x2395 => {
    x2396 => exists_v24(x2395, x2396)
  }
  f(x)
}

///|
/// `fromList`
pub fn fromlist_v13(x2397 : @list.List[Formula]) -> @oset.T[Formula] raise {
  let l = x2397
  @lib.itlist(add_v19, l, empty_v18())
}

///|
/// `delete`
pub fn delete_v12(
  x2398 : @oset.T[Formula],
  x2399 : Formula,
) -> @oset.T[Formula] raise {
  let s = x2398
  let x = x2399
  remove_v16(x, s)
}

///|
/// subset
fn step_95() -> Unit raise {
  subset_v11_c.set(fn(
    x2400 : @oset.T[Formula],
  ) -> ((@oset.T[Formula]) -> Bool raise) raise {
    fn(x2401 : @oset.T[Formula]) -> Bool raise { subset_v10(x2400, x2401) }
  })
}

///|
let subset_v11_c : @lib.Cell[
  (@oset.T[Formula]) -> ((@oset.T[Formula]) -> Bool raise) raise,
] = @lib.Cell::new("subset")

///|
/// `subset`
pub fn subset_v11(
  x : @oset.T[Formula],
) -> ((@oset.T[Formula]) -> Bool raise) raise {
  subset_v11_c.get()(x)
}

///|
/// intersect
fn step_96() -> Unit raise {
  intersect_v6_c.set(fn(
    x2402 : @oset.T[Formula],
  ) -> ((@oset.T[Formula]) -> @oset.T[Formula] raise) raise {
    fn(x2403 : @oset.T[Formula]) -> @oset.T[Formula] raise {
      inter_v5(x2402, x2403)
    }
  })
}

///|
let intersect_v6_c : @lib.Cell[
  (@oset.T[Formula]) -> ((@oset.T[Formula]) -> @oset.T[Formula] raise) raise,
] = @lib.Cell::new("intersect")

///|
/// `intersect`
pub fn intersect_v6(
  x : @oset.T[Formula],
) -> ((@oset.T[Formula]) -> @oset.T[Formula] raise) raise {
  intersect_v6_c.get()(x)
}

///|
/// `intersectList`
pub fn intersectlist_v5(
  x2404 : @list.List[@oset.T[Formula]],
) -> @oset.T[Formula] raise {
  match x2404 {
    Empty => empty_v18()
    More(s, tail=ss) => @lib.itlist(inter_v5, ss, s)
  }
}

///|
/// `findl`
pub fn[TA] findl_v6(
  x2405 : (TA) -> Bool raise,
  x2406 : @oset.T[TA],
) -> TA? raise {
  let p = x2405
  let s = x2406
  let go : (TA) -> ((TA?) -> TA? raise) raise = fn(
    x2407 : TA,
  ) -> ((TA?) -> TA? raise) raise {
    let x = x2407
    fn(x2408 : TA?) -> TA? raise {
      match x2408 {
        Some(_) as s_1 => s_1
        None => if p(x) { Some(x) } else { None }
      }
    }
  }
  fold_v12(go, s, None)
}

///|
/// `firstl`
pub fn[TA, TB] firstl_v6(
  x2409 : (TB) -> TA? raise,
  x2410 : @oset.T[TB],
) -> TA? raise {
  let f = x2409
  let s = x2410
  let go : (TB) -> ((TA?) -> TA? raise) raise = fn(
    x2411 : TB,
  ) -> ((TA?) -> TA? raise) raise {
    let x = x2411
    fn(x2412 : TA?) -> TA? raise {
      match x2412 {
        Some(_) as s_1 => s_1
        None => f(x)
      }
    }
  }
  fold_v12(go, s, None)
}

///|
/// `transform`
pub fn[TA, TB] transform_v12(
  x2413 : (TB) -> TA raise,
  x2414 : @oset.T[TB],
) -> @list.List[TA] raise {
  let f = x2413
  let s = x2414
  fold_v12(
    fn(x2415 : TB) -> ((@list.List[TA]) -> @list.List[TA] raise) raise {
      let x = x2415
      fn(x2416 : @list.List[TA]) -> @list.List[TA] raise {
        let acc = x2416
        acc.prepend(f(x))
      }
    },
    s,
    @list.List([]),
  )
}

///|
/// `all`
pub fn[TA] all_v6(
  x : (TA) -> Bool raise,
) -> ((@oset.T[TA]) -> Bool raise) raise {
  let f : ((TA) -> Bool raise) -> ((@oset.T[TA]) -> Bool raise) raise = x2417 => {
    x2418 => for_all_v12(x2417, x2418)
  }
  f(x)
}

///|
/// `count`
pub fn[TA] count_v6(
  x2419 : (TA) -> Bool raise,
  x2420 : @oset.T[TA],
) -> Int64 raise {
  let p = x2419
  let s = x2420
  fold_v12(
    fn(x2421 : TA) -> ((Int64) -> Int64 raise) raise {
      let x = x2421
      fn(x2422 : Int64) -> Int64 raise {
        let c = x2422
        if p(x) {
          @lib.add63(c, 1L)
        } else {
          c
        }
      }
    },
    s,
    0L,
  )
}

///|
/// `polarity`
pub type Polarity = Bool

///|
/// `literal`
pub type Literal = (Polarity, Atom)

///|
/// `polarity`
pub fn polarity(
  x2423 : Bool,
  x2424 : (String, @list.List[Term]),
) -> Polarity raise {
  let (pol, _) = (x2423, x2424)
  pol
}

///|
/// `atom`
pub fn atom(x2425 : Bool, x2426 : (String, @list.List[Term])) -> Atom raise {
  let (_, atm) = (x2425, x2426)
  atm
}

///|
/// `name`
pub fn name_v2(
  x2427 : (Bool, (String, @list.List[Term])),
) -> RelationName raise {
  let lit = x2427
  let t2428 = atom(lit.0, lit.1)
  name_v1(t2428.0, t2428.1)
}

///|
/// `arguments`
pub fn arguments_v1(
  x2429 : (Bool, (String, @list.List[Term])),
) -> @list.List[Term] raise {
  let lit = x2429
  let t2430 = atom(lit.0, lit.1)
  arguments(t2430.0, t2430.1)
}

///|
/// `arity`
pub fn arity_v2(x2431 : (Bool, (String, @list.List[Term]))) -> Int64 raise {
  let lit = x2431
  arity_v1(atom(lit.0, lit.1))
}

///|
/// `positive`
pub fn positive(x2432 : (Bool, (String, @list.List[Term]))) -> Polarity raise {
  let lit = x2432
  polarity(lit.0, lit.1)
}

///|
/// `negative`
pub fn negative(x2433 : (Bool, (String, @list.List[Term]))) -> Bool raise {
  let lit = x2433
  !polarity(lit.0, lit.1)
}

///|
/// `negate`
pub fn negate(
  x2434 : Bool,
  x2435 : (String, @list.List[Term]),
) -> Literal raise {
  let (pol, atm) = (x2434, x2435)
  (!pol, atm)
}

///|
/// `relation`
pub fn relation_v1(
  x2436 : (Bool, (String, @list.List[Term])),
) -> (RelationName, Int64) raise {
  let lit = x2436
  relation(atom(lit.0, lit.1))
}

///|
/// `functions`
pub fn functions_v4(
  x2437 : (Bool, (String, @list.List[Term])),
) -> @oset.T[(Name, Int64)] raise {
  let lit = x2437
  functions_v2(atom(lit.0, lit.1))
}

///|
/// `functionNames`
pub fn functionnames_v3(
  x2438 : (Bool, (String, @list.List[Term])),
) -> @oset.T[Name] raise {
  let lit = x2438
  functionnames_v1(atom(lit.0, lit.1))
}

///|
/// `mkBinop`
pub fn mkbinop_v2(x2439 : String, x2440 : (Bool, Term, Term)) -> Literal raise {
  let rel = x2439
  let (pol, a, b) = x2440
  (pol, mkbinop_v1(rel, (a, b)))
}

///|
/// `destBinop`
pub fn destbinop_v2(
  x2441 : String,
  x2442 : (Bool, (String, @list.List[Term])),
) -> (Polarity, Term, Term) raise {
  let rel = x2441
  let (pol, atm) = x2442
  match destbinop_v1(rel, atm) {
    (a, b) => (pol, a, b)
  }
}

///|
/// `isBinop`
pub fn isbinop_v2(x2443 : String) -> ((Literal) -> Bool raise) raise {
  let rel = x2443
  (x2446 : (Bool, (String, @list.List[Term]))) => {
    @lib.can(
      (x2445 : (Bool, (String, @list.List[Term]))) => destbinop_v2(rel, x2445),
      x2446,
    )
  }
}

///|
/// `toFormula`
pub fn toformula(x2447 : (Bool, (String, @list.List[Term]))) -> Formula raise {
  match x2447 {
    (true, atm) => Formula::Atom(atm)
    (false, atm_1) => Formula::Not(Formula::Atom(atm_1))
  }
}

///|
/// `fromFormula`
pub fn fromformula(x2448 : Formula) -> (Bool, Atom) raise {
  match x2448 {
    Formula::Atom(atm) => (true, atm)
    Formula::Not(Formula::Atom(atm_1)) => (false, atm_1)
    _ => raise Failure("Literal.fromFormula")
  }
}

///|
/// `symbols`
pub fn symbols_v3(
  x2449 : Bool,
  x2450 : (String, @list.List[Term]),
) -> Int64 raise {
  let (_, atm) = (x2449, x2450)
  symbols_v1(atm)
}

///|
/// compare
fn step_97() -> Unit raise {
  compare_v34_c.set(fn(
    x2457 : (Bool, (String, @list.List[Term])),
  ) -> (((Bool, (String, @list.List[Term]))) -> Int64 raise) raise {
    fn(x2458 : (Bool, (String, @list.List[Term]))) -> Int64 raise {
      ((
        x2455 : (Bool, (String, @list.List[Term])),
        x2456 : (Bool, (String, @list.List[Term])),
      ) => {
        prodcompare(
          fn(x2451 : Bool) -> ((Bool) -> Int64 raise) raise {
            fn(x2452 : Bool) -> Int64 raise { boolcompare(x2451, x2452) }
          },
          fn(
            x2453 : (String, @list.List[Term]),
          ) -> (((String, @list.List[Term])) -> Int64 raise) raise {
            fn(x2454 : (String, @list.List[Term])) -> Int64 raise {
              compare_v24(x2453, x2454)
            }
          },
          x2455,
          x2456,
        )
      })(x2457, x2458)
    }
  })
}

///|
let compare_v34_c : @lib.Cell[
  ((Bool, (Name, @list.List[Term]))) -> (((Bool, (Name, @list.List[Term]))) -> Int64 raise) raise,
] = @lib.Cell::new("compare")

///|
/// `compare`
pub fn compare_v34(
  x : (Bool, (Name, @list.List[Term])),
) -> (((Bool, (Name, @list.List[Term]))) -> Int64 raise) raise {
  compare_v34_c.get()(x)
}

///|
/// `equal`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] equal_v25(
  x2459 : (TA, (String, @list.List[Term])),
  x2460 : (TA, (String, @list.List[Term])),
) -> Bool raise {
  let (p1, atm1) = x2459
  let (p2, atm2) = x2460
  p1 == p2 && equal_v17(atm1, atm2)
}

///|
/// `subterm`
pub fn subterm_v2(
  x2461 : (Bool, (String, @list.List[Term])),
  x2462 : @list.List[Int64],
) -> Term raise {
  let lit = x2461
  let path = x2462
  subterm_v1(atom(lit.0, lit.1))(path)
}

///|
/// `subterms`
pub fn subterms_v2(
  x2463 : (Bool, (String, @list.List[Term])),
) -> @list.List[(@list.List[Int64], Term)] raise {
  let lit = x2463
  let t2464 = atom(lit.0, lit.1)
  subterms_v1(t2464.0, t2464.1)
}

///|
/// `replace`
pub fn[TA, TB] replace_v2(
  x2465 : (TA, (TB, @list.List[Term])),
  x2466 : (@list.List[Int64], Term),
) -> (TA, (TB, @list.List[Term])) raise {
  let (pol, atm) as lit = x2465
  let path_tm = x2466
  let atm_p = replace_v1(atm, path_tm)
  if physical_equal(atm, atm_p) {
    lit
  } else {
    (pol, atm_p)
  }
}

///|
/// `freeIn`
pub fn freein_v3(
  x2467 : String,
  x2468 : (Bool, (String, @list.List[Term])),
) -> Bool raise {
  let v = x2467
  let lit = x2468
  freein_v1(v, atom(lit.0, lit.1))
}

///|
/// `freeVars`
pub fn freevars_v4(
  x2469 : (Bool, (String, @list.List[Term])),
) -> @oset.T[Name] raise {
  let lit = x2469
  freevars_v2(atom(lit.0, lit.1))
}

///|
/// `subst`
pub fn subst_v3(
  x2470 : Subst,
  x2471 : (Bool, (String, @list.List[Term])),
) -> Literal raise {
  let sub = x2470
  let (pol, atm) as lit = x2471
  let atm_p = subst_v1(sub, atm)
  if physical_equal(atm_p, atm) {
    lit
  } else {
    (pol, atm_p)
  }
}

///|
/// `matchLiterals`
pub fn matchliterals(
  x2472 : Subst,
  x2473 : (Bool, (String, @list.List[Term])),
  x2474 : (Bool, (String, @list.List[Term])),
) -> Subst raise {
  let sub = x2472
  let (pol1, atm1) = x2473
  let (pol2, atm2) = x2474
  let _ = pol1 == pol2 || @lib.raise_error(Failure("Literal.match"))
  matchatoms(sub, atm1, atm2)
}

///|
/// `unify`
pub fn unify_v2(
  x2475 : Subst,
  x2476 : (Bool, (String, @list.List[Term])),
  x2477 : (Bool, (String, @list.List[Term])),
) -> Subst raise {
  let sub = x2475
  let (pol1, atm1) = x2476
  let (pol2, atm2) = x2477
  let _ = pol1 == pol2 || @lib.raise_error(Failure("Literal.unify"))
  unify_v1(sub, atm1, atm2)
}

///|
/// `mkEq`
pub fn mkeq_v2(x2478 : (Term, Term)) -> Literal raise {
  let l_r = x2478
  (true, mkeq(l_r))
}

///|
/// `destEq`
pub fn desteq_v2(
  x2479 : (Bool, (String, @list.List[Term])),
) -> (Term, Term) raise {
  match x2479 {
    (true, atm) => desteq(atm)
    (false, _) => raise Failure("Literal.destEq")
  }
}

///|
/// isEq
fn step_98() -> Unit raise {
  iseq_v2_c.set((x2480 : (Bool, (String, @list.List[Term]))) => {
    @lib.can(desteq_v2, x2480)
  })
}

///|
let iseq_v2_c : @lib.Cell[(Literal) -> Bool raise] = @lib.Cell::new("isEq")

///|
/// `isEq`
pub fn iseq_v2(x : Literal) -> Bool raise {
  iseq_v2_c.get()(x)
}

///|
/// `mkNeq`
pub fn mkneq_v1(x2481 : (Term, Term)) -> Literal raise {
  let l_r = x2481
  (false, mkeq(l_r))
}

///|
/// `destNeq`
pub fn destneq_v1(
  x2482 : (Bool, (String, @list.List[Term])),
) -> (Term, Term) raise {
  match x2482 {
    (false, atm) => desteq(atm)
    (true, _) => raise Failure("Literal.destNeq")
  }
}

///|
/// isNeq
fn step_99() -> Unit raise {
  isneq_v1_c.set((x2483 : (Bool, (String, @list.List[Term]))) => {
    @lib.can(destneq_v1, x2483)
  })
}

///|
let isneq_v1_c : @lib.Cell[(Literal) -> Bool raise] = @lib.Cell::new("isNeq")

///|
/// `isNeq`
pub fn isneq_v1(x : Literal) -> Bool raise {
  isneq_v1_c.get()(x)
}

///|
/// `mkRefl`
pub fn mkrefl_v2(x2484 : Term) -> (Bool, Atom) raise {
  let tm = x2484
  (true, mkrefl(tm))
}

///|
/// `destRefl`
pub fn destrefl_v2(x2485 : (Bool, (String, @list.List[Term]))) -> Term raise {
  match x2485 {
    (true, atm) => destrefl(atm)
    (false, _) => raise Failure("Literal.destRefl")
  }
}

///|
/// isRefl
fn step_100() -> Unit raise {
  isrefl_v2_c.set((x2486 : (Bool, (String, @list.List[Term]))) => {
    @lib.can(destrefl_v2, x2486)
  })
}

///|
let isrefl_v2_c : @lib.Cell[((Bool, (Name, @list.List[Term]))) -> Bool raise] = @lib.Cell::new(
  "isRefl",
)

///|
/// `isRefl`
pub fn isrefl_v2(x : (Bool, (Name, @list.List[Term]))) -> Bool raise {
  isrefl_v2_c.get()(x)
}

///|
/// `mkIrrefl`
pub fn mkirrefl(x2487 : Term) -> (Bool, Atom) raise {
  let tm = x2487
  (false, mkrefl(tm))
}

///|
/// `destIrrefl`
pub fn destirrefl(x2488 : (Bool, (String, @list.List[Term]))) -> Term raise {
  match x2488 {
    (true, _) => raise Failure("Literal.destIrrefl")
    (false, atm) => destrefl(atm)
  }
}

///|
/// isIrrefl
fn step_101() -> Unit raise {
  isirrefl_c.set((x2489 : (Bool, (String, @list.List[Term]))) => {
    @lib.can(destirrefl, x2489)
  })
}

///|
let isirrefl_c : @lib.Cell[((Bool, (Name, @list.List[Term]))) -> Bool raise] = @lib.Cell::new(
  "isIrrefl",
)

///|
/// `isIrrefl`
pub fn isirrefl(x : (Bool, (Name, @list.List[Term]))) -> Bool raise {
  isirrefl_c.get()(x)
}

///|
/// `sym`
pub fn sym_v2(
  x2490 : Bool,
  x2491 : (String, @list.List[Term]),
) -> Literal raise {
  let (pol, atm) = (x2490, x2491)
  (pol, sym(atm))
}

///|
/// `lhs`
pub fn lhs_v2(x2492 : Bool, x2493 : (String, @list.List[Term])) -> Term raise {
  let (_, atm) = (x2492, x2493)
  lhs(atm)
}

///|
/// `rhs`
pub fn rhs_v2(x2494 : Bool, x2495 : (String, @list.List[Term])) -> Term raise {
  let (_, atm) = (x2494, x2495)
  rhs(atm)
}

///|
/// `typedSymbols`
pub fn typedsymbols_v2(
  x2496 : Bool,
  x2497 : (String, @list.List[Term]),
) -> Int64 raise {
  let (_, atm) = (x2496, x2497)
  typedsymbols_v1(atm.0, atm.1)
}

///|
/// `nonVarTypedSubterms`
pub fn nonvartypedsubterms_v2(
  x2498 : Bool,
  x2499 : (String, @list.List[Term]),
) -> @list.List[(@list.List[Int64], Term)] raise {
  let (_, atm) = (x2498, x2499)
  nonvartypedsubterms_v1(atm.0, atm.1)
}

///|
/// `toString`
pub fn tostring_v6(x2500 : (Bool, (String, @list.List[Term]))) -> Name raise {
  let literal = x2500
  tostring_v5(toformula(literal))
}

///|
/// `t`
pub type T21 = Literal

///|
/// compare
fn step_102() -> Unit raise {
  compare_v35_c.set(compare_v34)
}

///|
let compare_v35_c : @lib.Cell[
  ((Bool, (Name, @list.List[Term]))) -> (((Bool, (Name, @list.List[Term]))) -> Int64 raise) raise,
] = @lib.Cell::new("compare")

///|
/// `compare`
pub fn compare_v35(
  x : (Bool, (Name, @list.List[Term])),
) -> (((Bool, (Name, @list.List[Term]))) -> Int64 raise) raise {
  compare_v35_c.get()(x)
}

///|
/// `key`
pub type Key7 = T21

///|
/// `t`
pub type T22[TA] = @omap.T[Key7, TA]

///|
/// `empty`
pub fn[TA, TB] empty_v20() -> @omap.T[TA, TB] {
  @omap.empty()
}

///|
/// `is_empty`
pub fn[TA, TB] is_empty_v13(x2501 : @omap.T[TA, TB]) -> Bool raise {
  let m = x2501
  @omap.is_empty(m)
}

///|
/// `mem`
pub fn[TA] mem_v13(
  x2502 : (Bool, (String, @list.List[Term])),
  x2503 : @omap.T[(Bool, (String, @list.List[Term])), TA],
) -> Bool raise {
  let x = x2502
  let m = x2503
  @omap.mem(compare_v35, x, m)
}

///|
/// `add`
pub fn[TA] add_v21(
  x2504 : (Bool, (String, @list.List[Term])),
  x2505 : TA,
  x2506 : @omap.T[(Bool, (String, @list.List[Term])), TA],
) -> @omap.T[(Bool, (Name, @list.List[Term])), TA] raise {
  let x = x2504
  let data = x2505
  let m = x2506
  @omap.add(compare_v35, x, data, m)
}

///|
/// `update`
pub fn[TA] update_v7(
  x2507 : (Bool, (String, @list.List[Term])),
  x2508 : (TA?) -> TA? raise,
  x2509 : @omap.T[(Bool, (String, @list.List[Term])), TA],
) -> @omap.T[(Bool, (Name, @list.List[Term])), TA] raise {
  let x = x2507
  let f = x2508
  let m = x2509
  @omap.update(compare_v35, x, f, m)
}

///|
/// `singleton`
pub fn[TA, TB] singleton_v27(x2510 : TA, x2511 : TB) -> @omap.T[TA, TB] raise {
  let x = x2510
  let d = x2511
  @omap.singleton(x, d)
}

///|
/// `remove`
pub fn[TA] remove_v17(
  x2512 : (Bool, (String, @list.List[Term])),
  x2513 : @omap.T[(Bool, (String, @list.List[Term])), TA],
) -> @omap.T[(Bool, (Name, @list.List[Term])), TA] raise {
  let x = x2512
  let m = x2513
  @omap.remove(compare_v35, x, m)
}

///|
/// `merge`
pub fn[TA, TB, TC] merge_v9(
  x2514 : ((Bool, (String, @list.List[Term]))) -> ((TC?) -> ((TB?) -> TA? raise) raise) raise,
  x2515 : @omap.T[(Bool, (String, @list.List[Term])), TC],
  x2516 : @omap.T[(Bool, (String, @list.List[Term])), TB],
) -> @omap.T[(Bool, (Name, @list.List[Term])), TA] raise {
  let f = x2514
  let s1 = x2515
  let s2 = x2516
  @omap.merge(compare_v35, f, s1, s2)
}

///|
/// `union`
pub fn[TA] union_v27(
  x2517 : ((Bool, (String, @list.List[Term]))) -> ((TA) -> ((TA) -> TA? raise) raise) raise,
  x2518 : @omap.T[(Bool, (String, @list.List[Term])), TA],
  x2519 : @omap.T[(Bool, (String, @list.List[Term])), TA],
) -> @omap.T[(Bool, (Name, @list.List[Term])), TA] raise {
  let f = x2517
  let s1 = x2518
  let s2 = x2519
  @omap.union(compare_v35, f, s1, s2)
}

///|
/// `compare`
pub fn[TA, TB] compare_v36(
  x2520 : (TB) -> ((TA) -> Int64 raise) raise,
  x2521 : @omap.T[(Bool, (String, @list.List[Term])), TB],
  x2522 : @omap.T[(Bool, (String, @list.List[Term])), TA],
) -> Int64 raise {
  let cmp = x2520
  let m1 = x2521
  let m2 = x2522
  @omap.compare(compare_v35, cmp, m1, m2)
}

///|
/// `equal`
pub fn[TA, TB] equal_v26(
  x2523 : (TB) -> ((TA) -> Bool raise) raise,
  x2524 : @omap.T[(Bool, (String, @list.List[Term])), TB],
  x2525 : @omap.T[(Bool, (String, @list.List[Term])), TA],
) -> Bool raise {
  let cmp = x2523
  let m1 = x2524
  let m2 = x2525
  @omap.equal(compare_v35, cmp, m1, m2)
}

///|
/// `iter`
pub fn[TA, TB, TC] iter_v13(
  x2526 : (TC) -> ((TB) -> TA raise) raise,
  x2527 : @omap.T[TC, TB],
) -> Unit raise {
  let f = x2526
  let m = x2527
  @omap.iter(f, m)
}

///|
/// `fold`
pub fn[TA, TB, TC] fold_v13(
  x2528 : (TC) -> ((TB) -> ((TA) -> TA raise) raise) raise,
  x2529 : @omap.T[TC, TB],
  x2530 : TA,
) -> TA raise {
  let f = x2528
  let m = x2529
  let accu = x2530
  @omap.fold(f, m, accu)
}

///|
/// `for_all`
pub fn[TA, TB] for_all_v13(
  x2531 : (TB) -> ((TA) -> Bool raise) raise,
  x2532 : @omap.T[TB, TA],
) -> Bool raise {
  let p = x2531
  let m = x2532
  @omap.for_all(p, m)
}

///|
/// `exists`
pub fn[TA, TB] exists_v26(
  x2533 : (TB) -> ((TA) -> Bool raise) raise,
  x2534 : @omap.T[TB, TA],
) -> Bool raise {
  let p = x2533
  let m = x2534
  @omap.exists(p, m)
}

///|
/// `filter`
pub fn[TA, TB] filter_v21(
  x2535 : (TA) -> ((TB) -> Bool raise) raise,
  x2536 : @omap.T[TA, TB],
) -> @omap.T[TA, TB] raise {
  let p = x2535
  let m = x2536
  @omap.filter(p, m)
}

///|
/// `filter_map`
pub fn[TA, TB, TC] filter_map_v13(
  x2537 : (TA) -> ((TC) -> TB? raise) raise,
  x2538 : @omap.T[TA, TC],
) -> @omap.T[TA, TB] raise {
  let f = x2537
  let m = x2538
  @omap.filter_map(f, m)
}

///|
/// `partition`
pub fn[TA, TB] partition_v15(
  x2539 : (TA) -> ((TB) -> Bool raise) raise,
  x2540 : @omap.T[TA, TB],
) -> (@omap.T[TA, TB], @omap.T[TA, TB]) raise {
  let p = x2539
  let m = x2540
  @omap.partition(p, m)
}

///|
/// `cardinal`
pub fn[TA, TB] cardinal_v13(x2541 : @omap.T[TA, TB]) -> Int64 raise {
  let m = x2541
  @omap.cardinal(m)
}

///|
/// `bindings`
pub fn[TA, TB] bindings_v7(
  x2542 : @omap.T[TA, TB],
) -> @list.List[(TA, TB)] raise {
  let s = x2542
  @omap.bindings(s)
}

///|
/// `min_binding`
pub fn[TA, TB] min_binding_v7(x2543 : @omap.T[TA, TB]) -> (TA, TB) raise {
  let m = x2543
  @omap.min_binding(m)
}

///|
/// `min_binding_opt`
pub fn[TA, TB] min_binding_opt_v7(x2544 : @omap.T[TA, TB]) -> (TA, TB)? raise {
  let m = x2544
  @omap.min_binding_opt(m)
}

///|
/// `max_binding`
pub fn[TA, TB] max_binding_v7(x2545 : @omap.T[TA, TB]) -> (TA, TB) raise {
  let m = x2545
  @omap.max_binding(m)
}

///|
/// `max_binding_opt`
pub fn[TA, TB] max_binding_opt_v7(x2546 : @omap.T[TA, TB]) -> (TA, TB)? raise {
  let m = x2546
  @omap.max_binding_opt(m)
}

///|
/// `choose`
pub fn[TA, TB] choose_v13(x2547 : @omap.T[TA, TB]) -> (TA, TB) raise {
  let m = x2547
  @omap.choose(m)
}

///|
/// `choose_opt`
pub fn[TA, TB] choose_opt_v13(x2548 : @omap.T[TA, TB]) -> (TA, TB)? raise {
  let m = x2548
  @omap.choose_opt(m)
}

///|
/// `split`
pub fn[TA] split_v14(
  x2549 : (Bool, (String, @list.List[Term])),
  x2550 : @omap.T[(Bool, (String, @list.List[Term])), TA],
) -> (
  @omap.T[(Bool, (Name, @list.List[Term])), TA],
  TA?,
  @omap.T[(Bool, (Name, @list.List[Term])), TA],
) raise {
  let x = x2549
  let m = x2550
  @omap.split(compare_v35, x, m)
}

///|
/// `find`
pub fn[TA] find_v16(
  x2551 : (Bool, (String, @list.List[Term])),
  x2552 : @omap.T[(Bool, (String, @list.List[Term])), TA],
) -> TA raise {
  let x = x2551
  let m = x2552
  @omap.find(compare_v35, x, m)
}

///|
/// `find_opt`
pub fn[TA] find_opt_v13(
  x2553 : (Bool, (String, @list.List[Term])),
  x2554 : @omap.T[(Bool, (String, @list.List[Term])), TA],
) -> TA? raise {
  let x = x2553
  let m = x2554
  @omap.find_opt(compare_v35, x, m)
}

///|
/// `find_first`
pub fn[TA, TB] find_first_v13(
  x2555 : (TA) -> Bool raise,
  x2556 : @omap.T[TA, TB],
) -> (TA, TB) raise {
  let f = x2555
  let m = x2556
  @omap.find_first(f, m)
}

///|
/// `find_first_opt`
pub fn[TA, TB] find_first_opt_v13(
  x2557 : (TA) -> Bool raise,
  x2558 : @omap.T[TA, TB],
) -> (TA, TB)? raise {
  let f = x2557
  let m = x2558
  @omap.find_first_opt(f, m)
}

///|
/// `find_last`
pub fn[TA, TB] find_last_v13(
  x2559 : (TA) -> Bool raise,
  x2560 : @omap.T[TA, TB],
) -> (TA, TB) raise {
  let f = x2559
  let m = x2560
  @omap.find_last(f, m)
}

///|
/// `find_last_opt`
pub fn[TA, TB] find_last_opt_v13(
  x2561 : (TA) -> Bool raise,
  x2562 : @omap.T[TA, TB],
) -> (TA, TB)? raise {
  let f = x2561
  let m = x2562
  @omap.find_last_opt(f, m)
}

///|
/// `map`
pub fn[TA, TB, TC] map_v15(
  x2563 : (TC) -> TB raise,
  x2564 : @omap.T[TA, TC],
) -> @omap.T[TA, TB] raise {
  let f = x2563
  let m = x2564
  @omap.map(f, m)
}

///|
/// `mapi`
pub fn[TA, TB, TC] mapi_v7(
  x2565 : (TA) -> ((TC) -> TB raise) raise,
  x2566 : @omap.T[TA, TC],
) -> @omap.T[TA, TB] raise {
  let f = x2565
  let m = x2566
  @omap.mapi(f, m)
}

///|
/// `map`
pub type Map8[TA] = T22[TA]

///|
/// `newMap`
pub fn[TA, TB] newmap_v7(x2567 : Unit) -> @omap.T[TA, TB] raise {
  let _ = x2567
  empty_v20()
}

///|
/// `null`
pub fn[TA, TB] null_v16(x : @omap.T[TA, TB]) -> Bool raise {
  let f : (@omap.T[TA, TB]) -> Bool raise = is_empty_v13
  f(x)
}

///|
/// `singleton`
pub fn[TA, TB] singleton_v28(x2568 : TA, x2569 : TB) -> @omap.T[TA, TB] raise {
  let (k, x) = (x2568, x2569)
  singleton_v27(k, x)
}

///|
/// `size`
pub fn[TA, TB] size_v15(x : @omap.T[TA, TB]) -> Int64 raise {
  let f : (@omap.T[TA, TB]) -> Int64 raise = cardinal_v13
  f(x)
}

///|
/// `get`
pub fn[TA] get_v7(
  x2570 : @omap.T[(Bool, (String, @list.List[Term])), TA],
  x2571 : (Bool, (String, @list.List[Term])),
) -> TA raise {
  let m = x2570
  let k = x2571
  find_v16(k, m) catch {
    @lib.NotFound => raise Failure("Mmap.get: element not found")
    e => raise e
  }
}

///|
/// `peek`
pub fn[TA] peek_v9(
  x2572 : @omap.T[(Bool, (String, @list.List[Term])), TA],
  x2573 : (Bool, (String, @list.List[Term])),
) -> TA? raise {
  let m = x2572
  let k = x2573
  Some(find_v16(k, m)) catch {
    @lib.NotFound => None
    e => raise e
  }
}

///|
/// `insert`
pub fn[TA] insert_v8(
  x2574 : @omap.T[(Bool, (String, @list.List[Term])), TA],
  x2575 : ((Bool, (String, @list.List[Term])), TA),
) -> @omap.T[(Bool, (Name, @list.List[Term])), TA] raise {
  let m = x2574
  let (k, v) = x2575
  add_v21(k, v, m)
}

///|
/// `toList`
pub fn[TA, TB] tolist_v15(x : @omap.T[TA, TB]) -> @list.List[(TA, TB)] raise {
  let f : (@omap.T[TA, TB]) -> @list.List[(TA, TB)] raise = bindings_v7
  f(x)
}

///|
/// `fromList`
pub fn[TA] fromlist_v14(
  x2576 : @list.List[((Bool, (String, @list.List[Term])), TA)],
) -> @omap.T[(Bool, (Name, @list.List[Term])), TA] raise {
  let l = x2576
  @lib.itlist(
    fn(
      x2577 : ((Bool, (String, @list.List[Term])), TA),
      x2578 : @omap.T[(Bool, (String, @list.List[Term])), TA],
    ) -> @omap.T[(Bool, (String, @list.List[Term])), TA] raise {
      let (v, tm) = x2577
      ((x2579 : @omap.T[(Bool, (String, @list.List[Term])), TA]) => {
        add_v21(v, tm, x2579)
      })(x2578)
    },
    l,
    empty_v20(),
  )
}

///|
/// `foldl`
pub fn[TA, TB, TC] foldl_v15(
  x2580 : ((TB, TC, TA)) -> TA raise,
  x2581 : TA,
  x2582 : @omap.T[TB, TC],
) -> TA raise {
  let f = x2580
  let b = x2581
  let m = x2582
  @lib.fold_left(
    fn(x2583 : TA, x2584 : (TB, TC)) -> TA raise {
      let s = x2583
      let (v, tm) = x2584
      f((v, tm, s))
    },
    b,
    bindings_v7(m),
  )
}

///|
/// `foldr`
pub fn[TA, TB, TC] foldr_v15(
  x : ((TB, TC, TA)) -> TA raise,
) -> ((TA) -> ((@omap.T[TB, TC]) -> TA raise) raise) raise {
  let f : (((TB, TC, TA)) -> TA raise) -> ((TA) -> ((@omap.T[TB, TC]) -> TA raise) raise) raise = x2585 => {
    x2586 => x2587 => foldl_v15(x2585, x2586, x2587)
  }
  f(x)
}

///|
/// `filter`
pub fn[TA, TB] filter_v22(
  x2588 : ((TA, TB)) -> Bool raise,
) -> ((@omap.T[TA, TB]) -> @omap.T[TA, TB] raise) raise {
  let f = x2588
  (x2592 : @omap.T[TA, TB]) => {
    filter_v21(
      fn(x2590 : TA) -> ((TB) -> Bool raise) raise {
        let x = x2590
        fn(x2591 : TB) -> Bool raise {
          let y = x2591
          f((x, y))
        }
      },
      x2592,
    )
  }
}

///|
/// `inDomain`
pub fn[TA] indomain_v7(
  x : (Bool, (Name, @list.List[Term])),
) -> ((@omap.T[(Bool, (Name, @list.List[Term])), TA]) -> Bool raise) raise {
  let f : ((Bool, (Name, @list.List[Term]))) -> ((
    @omap.T[(Bool, (Name, @list.List[Term])), TA],
  ) -> Bool raise) raise = (x2593 : (Bool, (String, @list.List[Term]))) => {
    x2594 => mem_v13(x2593, x2594)
  }
  f(x)
}

///|
/// `union`
pub fn[TA] union_v28(
  x2595 : (
    (
      ((Bool, (String, @list.List[Term])), TA),
      ((Bool, (String, @list.List[Term])), TA),
    ),
  ) -> TA? raise,
  x2596 : @omap.T[(Bool, (String, @list.List[Term])), TA],
  x2597 : @omap.T[(Bool, (String, @list.List[Term])), TA],
) -> @omap.T[(Bool, (Name, @list.List[Term])), TA] raise {
  let f = x2595
  let m1 = x2596
  let m2 = x2597
  let f_p : ((Bool, (String, @list.List[Term]))) -> (((TA?, TA?)) -> TA? raise) raise = fn(
    x2598 : (Bool, (String, @list.List[Term])),
  ) -> (((TA?, TA?)) -> TA? raise) raise {
    let k = x2598
    fn(x2599 : (TA?, TA?)) -> TA? raise {
      match x2599 {
        (Some(x), Some(y)) => f(((k, x), (k, y)))
        (Some(x_1), None) => Some(x_1)
        (None, Some(y_1)) => Some(y_1)
        (None, None) => None
      }
    }
  }
  merge_v9(
    fn(
      x2600 : (Bool, (String, @list.List[Term])),
    ) -> ((TA?) -> ((TA?) -> TA? raise) raise) raise {
      let k_1 = x2600
      fn(x2601 : TA?) -> ((TA?) -> TA? raise) raise {
        let x_2 = x2601
        fn(x2602 : TA?) -> TA? raise {
          let y_2 = x2602
          f_p(k_1)((x_2, y_2))
        }
      }
    },
    m1,
    m2,
  )
}

///|
/// `delete`
pub fn[TA] delete_v13(
  x2603 : @omap.T[(Bool, (String, @list.List[Term])), TA],
  x2604 : (Bool, (String, @list.List[Term])),
) -> @omap.T[(Bool, (Name, @list.List[Term])), TA] raise {
  let m = x2603
  let k = x2604
  remove_v17(k, m)
}

///|
/// `mapPartial`
pub fn[TA, TB] mappartial_v8(
  x2605 : (((Bool, (String, @list.List[Term])), TB)) -> TA? raise,
  x2606 : @omap.T[(Bool, (String, @list.List[Term])), TB],
) -> @omap.T[(Bool, (Name, @list.List[Term])), TA] raise {
  let f = x2605
  let m = x2606
  fold_v13(
    fn(
      x2607 : (Bool, (String, @list.List[Term])),
    ) -> ((TB) -> ((@omap.T[(Bool, (String, @list.List[Term])), TA]) -> @omap.T[
      (Bool, (String, @list.List[Term])),
      TA,
    ] raise) raise) raise {
      let k = x2607
      fn(
        x2608 : TB,
      ) -> ((@omap.T[(Bool, (String, @list.List[Term])), TA]) -> @omap.T[
        (Bool, (String, @list.List[Term])),
        TA,
      ] raise) raise {
        let x = x2608
        fn(
          x2609 : @omap.T[(Bool, (String, @list.List[Term])), TA],
        ) -> @omap.T[(Bool, (String, @list.List[Term])), TA] raise {
          let acc = x2609
          match f((k, x)) {
            Some(y) => add_v21(k, y, acc)
            None => acc
          }
        }
      }
    },
    m,
    empty_v20(),
  )
}

///|
/// `transform`
pub fn[TA, TB, TC] transform_v13(
  x : (TC) -> TB raise,
) -> ((@omap.T[TA, TC]) -> @omap.T[TA, TB] raise) raise {
  let f : ((TC) -> TB raise) -> ((@omap.T[TA, TC]) -> @omap.T[TA, TB] raise) raise = x2610 => {
    x2611 => map_v15(x2610, x2611)
  }
  f(x)
}

///|
/// `exists`
pub fn[TA, TB] exists_v27(
  x2612 : ((TA, TB)) -> Bool raise,
) -> ((@omap.T[TA, TB]) -> Bool raise) raise {
  let f = x2612
  (x2616 : @omap.T[TA, TB]) => {
    exists_v26(
      fn(x2614 : TA) -> ((TB) -> Bool raise) raise {
        let k = x2614
        fn(x2615 : TB) -> Bool raise {
          let m = x2615
          f((k, m))
        }
      },
      x2616,
    )
  }
}

///|
/// `elt`
pub type Elt6 = T21

///|
/// `t`
pub type T23 = @oset.T[Elt6]

///|
/// `empty`
pub fn[TA] empty_v21() -> @oset.T[TA] {
  @oset.empty()
}

///|
/// `is_empty`
pub fn[TA] is_empty_v14(x2617 : @oset.T[TA]) -> Bool raise {
  let s = x2617
  @oset.is_empty(s)
}

///|
/// `mem`
pub fn mem_v14(
  x2618 : (Bool, (String, @list.List[Term])),
  x2619 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> Bool raise {
  let x = x2618
  let s = x2619
  @oset.mem(compare_v35, x, s)
}

///|
/// `add`
pub fn add_v22(
  x2620 : (Bool, (String, @list.List[Term])),
  x2621 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> @oset.T[(Bool, (Name, @list.List[Term]))] raise {
  let x = x2620
  let s = x2621
  @oset.add(compare_v35, x, s)
}

///|
/// `singleton`
pub fn[TA] singleton_v29(x2622 : TA) -> @oset.T[TA] raise {
  let x = x2622
  @oset.singleton(x)
}

///|
/// `remove`
pub fn remove_v18(
  x2623 : (Bool, (String, @list.List[Term])),
  x2624 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> @oset.T[(Bool, (Name, @list.List[Term]))] raise {
  let x = x2623
  let s = x2624
  @oset.remove(compare_v35, x, s)
}

///|
/// `union`
pub fn union_v29(
  x2625 : @oset.T[(Bool, (String, @list.List[Term]))],
  x2626 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> @oset.T[(Bool, (Name, @list.List[Term]))] raise {
  let s1 = x2625
  let s2 = x2626
  @oset.union(compare_v35, s1, s2)
}

///|
/// `inter`
pub fn inter_v6(
  x2627 : @oset.T[(Bool, (String, @list.List[Term]))],
  x2628 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> @oset.T[(Bool, (Name, @list.List[Term]))] raise {
  let s1 = x2627
  let s2 = x2628
  @oset.inter(compare_v35, s1, s2)
}

///|
/// `disjoint`
pub fn disjoint_v7(
  x2629 : @oset.T[(Bool, (String, @list.List[Term]))],
  x2630 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> Bool raise {
  let s1 = x2629
  let s2 = x2630
  @oset.disjoint(compare_v35, s1, s2)
}

///|
/// `diff`
pub fn diff_v6(
  x2631 : @oset.T[(Bool, (String, @list.List[Term]))],
  x2632 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> @oset.T[(Bool, (Name, @list.List[Term]))] raise {
  let s1 = x2631
  let s2 = x2632
  @oset.diff(compare_v35, s1, s2)
}

///|
/// `compare`
pub fn compare_v37(
  x2633 : @oset.T[(Bool, (String, @list.List[Term]))],
  x2634 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> Int64 raise {
  let s1 = x2633
  let s2 = x2634
  @oset.compare(compare_v35, s1, s2)
}

///|
/// `equal`
pub fn equal_v27(
  x2635 : @oset.T[(Bool, (String, @list.List[Term]))],
  x2636 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> Bool raise {
  let s1 = x2635
  let s2 = x2636
  @oset.equal(compare_v35, s1, s2)
}

///|
/// `subset`
pub fn subset_v12(
  x2637 : @oset.T[(Bool, (String, @list.List[Term]))],
  x2638 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> Bool raise {
  let s1 = x2637
  let s2 = x2638
  @oset.subset(compare_v35, s1, s2)
}

///|
/// `iter`
pub fn[TA, TB] iter_v14(
  x2639 : (TB) -> TA raise,
  x2640 : @oset.T[TB],
) -> Unit raise {
  let f = x2639
  let s = x2640
  @oset.iter(f, s)
}

///|
/// `map`
pub fn map_v16(
  x2641 : ((Bool, (String, @list.List[Term]))) -> (
    Bool,
    (String, @list.List[Term]),
  ) raise,
  x2642 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> @oset.T[(Bool, (Name, @list.List[Term]))] raise {
  let f = x2641
  let s = x2642
  @oset.map(compare_v35, f, s)
}

///|
/// `fold`
pub fn[TA, TB] fold_v14(
  x2643 : (TB) -> ((TA) -> TA raise) raise,
  x2644 : @oset.T[TB],
  x2645 : TA,
) -> TA raise {
  let f = x2643
  let s = x2644
  let accu = x2645
  @oset.fold(f, s, accu)
}

///|
/// `for_all`
pub fn[TA] for_all_v14(
  x2646 : (TA) -> Bool raise,
  x2647 : @oset.T[TA],
) -> Bool raise {
  let p = x2646
  let s = x2647
  @oset.for_all(p, s)
}

///|
/// `exists`
pub fn[TA] exists_v28(
  x2648 : (TA) -> Bool raise,
  x2649 : @oset.T[TA],
) -> Bool raise {
  let p = x2648
  let s = x2649
  @oset.exists(p, s)
}

///|
/// `filter`
pub fn[TA] filter_v23(
  x2650 : (TA) -> Bool raise,
  x2651 : @oset.T[TA],
) -> @oset.T[TA] raise {
  let p = x2650
  let s = x2651
  @oset.filter(p, s)
}

///|
/// `filter_map`
pub fn filter_map_v14(
  x2652 : ((Bool, (String, @list.List[Term]))) -> (
    Bool,
    (String, @list.List[Term]),
  )? raise,
  x2653 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> @oset.T[(Bool, (Name, @list.List[Term]))] raise {
  let f = x2652
  let s = x2653
  @oset.filter_map(compare_v35, f, s)
}

///|
/// `partition`
pub fn[TA] partition_v16(
  x2654 : (TA) -> Bool raise,
  x2655 : @oset.T[TA],
) -> (@oset.T[TA], @oset.T[TA]) raise {
  let p = x2654
  let s = x2655
  @oset.partition(p, s)
}

///|
/// `cardinal`
pub fn[TA] cardinal_v14(x2656 : @oset.T[TA]) -> Int64 raise {
  let s = x2656
  @oset.cardinal(s)
}

///|
/// `elements`
pub fn[TA] elements_v6(x2657 : @oset.T[TA]) -> @list.List[TA] raise {
  let s = x2657
  @oset.elements(s)
}

///|
/// `min_elt`
pub fn[TA] min_elt_v6(x2658 : @oset.T[TA]) -> TA raise {
  let s = x2658
  @oset.min_elt(s)
}

///|
/// `min_elt_opt`
pub fn[TA] min_elt_opt_v6(x2659 : @oset.T[TA]) -> TA? raise {
  let s = x2659
  @oset.min_elt_opt(s)
}

///|
/// `max_elt`
pub fn[TA] max_elt_v6(x2660 : @oset.T[TA]) -> TA raise {
  let s = x2660
  @oset.max_elt(s)
}

///|
/// `max_elt_opt`
pub fn[TA] max_elt_opt_v6(x2661 : @oset.T[TA]) -> TA? raise {
  let s = x2661
  @oset.max_elt_opt(s)
}

///|
/// `choose`
pub fn[TA] choose_v14(x2662 : @oset.T[TA]) -> TA raise {
  let s = x2662
  @oset.choose(s)
}

///|
/// `choose_opt`
pub fn[TA] choose_opt_v14(x2663 : @oset.T[TA]) -> TA? raise {
  let s = x2663
  @oset.choose_opt(s)
}

///|
/// `split`
pub fn split_v15(
  x2664 : (Bool, (String, @list.List[Term])),
  x2665 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> (
  @oset.T[(Bool, (Name, @list.List[Term]))],
  Bool,
  @oset.T[(Bool, (Name, @list.List[Term]))],
) raise {
  let x = x2664
  let s = x2665
  @oset.split(compare_v35, x, s)
}

///|
/// `find`
pub fn find_v17(
  x2666 : (Bool, (String, @list.List[Term])),
  x2667 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> (Bool, (Name, @list.List[Term])) raise {
  let x = x2666
  let s = x2667
  @oset.find(compare_v35, x, s)
}

///|
/// `find_opt`
pub fn find_opt_v14(
  x2668 : (Bool, (String, @list.List[Term])),
  x2669 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> (Bool, (Name, @list.List[Term]))? raise {
  let x = x2668
  let s = x2669
  @oset.find_opt(compare_v35, x, s)
}

///|
/// `find_first`
pub fn[TA] find_first_v14(
  x2670 : (TA) -> Bool raise,
  x2671 : @oset.T[TA],
) -> TA raise {
  let f = x2670
  let s = x2671
  @oset.find_first(f, s)
}

///|
/// `find_first_opt`
pub fn[TA] find_first_opt_v14(
  x2672 : (TA) -> Bool raise,
  x2673 : @oset.T[TA],
) -> TA? raise {
  let f = x2672
  let s = x2673
  @oset.find_first_opt(f, s)
}

///|
/// `find_last`
pub fn[TA] find_last_v14(
  x2674 : (TA) -> Bool raise,
  x2675 : @oset.T[TA],
) -> TA raise {
  let f = x2674
  let s = x2675
  @oset.find_last(f, s)
}

///|
/// `find_last_opt`
pub fn[TA] find_last_opt_v14(
  x2676 : (TA) -> Bool raise,
  x2677 : @oset.T[TA],
) -> TA? raise {
  let f = x2676
  let s = x2677
  @oset.find_last_opt(f, s)
}

///|
/// `set`
pub type Set6 = T23

///|
/// compare
fn step_103() -> Unit raise {
  compare_v38_c.set(fn(
    x2678 : @oset.T[(Bool, (String, @list.List[Term]))],
  ) -> ((@oset.T[(Bool, (String, @list.List[Term]))]) -> Int64 raise) raise {
    fn(x2679 : @oset.T[(Bool, (String, @list.List[Term]))]) -> Int64 raise {
      compare_v37(x2678, x2679)
    }
  })
}

///|
let compare_v38_c : @lib.Cell[
  (@oset.T[(Bool, (Name, @list.List[Term]))]) -> ((
    @oset.T[(Bool, (Name, @list.List[Term]))],
  ) -> Int64 raise) raise,
] = @lib.Cell::new("compare")

///|
/// `compare`
pub fn compare_v38(
  x : @oset.T[(Bool, (Name, @list.List[Term]))],
) -> ((@oset.T[(Bool, (Name, @list.List[Term]))]) -> Int64 raise) raise {
  compare_v38_c.get()(x)
}

///|
/// `add`
pub fn add_v23(
  x2680 : @oset.T[(Bool, (String, @list.List[Term]))],
  x2681 : (Bool, (String, @list.List[Term])),
) -> @oset.T[(Bool, (Name, @list.List[Term]))] raise {
  let s = x2680
  let x = x2681
  add_v22(x, s)
}

///|
/// `foldr`
pub fn[TA, TB] foldr_v16(
  x2682 : ((TB, TA)) -> TA raise,
  x2683 : TA,
  x2684 : @oset.T[TB],
) -> TA raise {
  let f = x2682
  let a = x2683
  let s = x2684
  fold_v14(
    fn(x2685 : TB) -> ((TA) -> TA raise) raise {
      let x = x2685
      fn(x2686 : TA) -> TA raise {
        let acc = x2686
        f((x, acc))
      }
    },
    s,
    a,
  )
}

///|
/// `foldl`
pub fn[TA, TB] foldl_v16(
  x : ((TB, TA)) -> TA raise,
) -> ((TA) -> ((@oset.T[TB]) -> TA raise) raise) raise {
  let f : (((TB, TA)) -> TA raise) -> ((TA) -> ((@oset.T[TB]) -> TA raise) raise) raise = x2687 => {
    x2688 => x2689 => foldr_v16(x2687, x2688, x2689)
  }
  f(x)
}

///|
/// member
fn step_104() -> Unit raise {
  member_v6_c.set(fn(
    x2690 : (Bool, (String, @list.List[Term])),
  ) -> ((@oset.T[(Bool, (String, @list.List[Term]))]) -> Bool raise) raise {
    fn(x2691 : @oset.T[(Bool, (String, @list.List[Term]))]) -> Bool raise {
      mem_v14(x2690, x2691)
    }
  })
}

///|
let member_v6_c : @lib.Cell[
  ((Bool, (Name, @list.List[Term]))) -> ((
    @oset.T[(Bool, (Name, @list.List[Term]))],
  ) -> Bool raise) raise,
] = @lib.Cell::new("member")

///|
/// `member`
pub fn member_v6(
  x : (Bool, (Name, @list.List[Term])),
) -> ((@oset.T[(Bool, (Name, @list.List[Term]))]) -> Bool raise) raise {
  member_v6_c.get()(x)
}

///|
/// `empty`
pub fn[TA] empty_v22() -> @oset.T[TA] {
  empty_v21()
}

///|
/// union
fn step_105() -> Unit raise {
  union_v30_c.set(fn(
    x2692 : @oset.T[(Bool, (String, @list.List[Term]))],
  ) -> ((@oset.T[(Bool, (String, @list.List[Term]))]) -> @oset.T[
    (Bool, (String, @list.List[Term])),
  ] raise) raise {
    fn(
      x2693 : @oset.T[(Bool, (String, @list.List[Term]))],
    ) -> @oset.T[(Bool, (String, @list.List[Term]))] raise {
      union_v29(x2692, x2693)
    }
  })
}

///|
let union_v30_c : @lib.Cell[
  (@oset.T[(Bool, (Name, @list.List[Term]))]) -> ((
    @oset.T[(Bool, (Name, @list.List[Term]))],
  ) -> @oset.T[(Bool, (Name, @list.List[Term]))] raise) raise,
] = @lib.Cell::new("union")

///|
/// `union`
pub fn union_v30(
  x : @oset.T[(Bool, (Name, @list.List[Term]))],
) -> ((@oset.T[(Bool, (Name, @list.List[Term]))]) -> @oset.T[
  (Bool, (Name, @list.List[Term])),
] raise) raise {
  union_v30_c.get()(x)
}

///|
/// difference
fn step_106() -> Unit raise {
  difference_v6_c.set(fn(
    x2694 : @oset.T[(Bool, (String, @list.List[Term]))],
  ) -> ((@oset.T[(Bool, (String, @list.List[Term]))]) -> @oset.T[
    (Bool, (String, @list.List[Term])),
  ] raise) raise {
    fn(
      x2695 : @oset.T[(Bool, (String, @list.List[Term]))],
    ) -> @oset.T[(Bool, (String, @list.List[Term]))] raise {
      diff_v6(x2694, x2695)
    }
  })
}

///|
let difference_v6_c : @lib.Cell[
  (@oset.T[(Bool, (Name, @list.List[Term]))]) -> ((
    @oset.T[(Bool, (Name, @list.List[Term]))],
  ) -> @oset.T[(Bool, (Name, @list.List[Term]))] raise) raise,
] = @lib.Cell::new("difference")

///|
/// `difference`
pub fn difference_v6(
  x : @oset.T[(Bool, (Name, @list.List[Term]))],
) -> ((@oset.T[(Bool, (Name, @list.List[Term]))]) -> @oset.T[
  (Bool, (Name, @list.List[Term])),
] raise) raise {
  difference_v6_c.get()(x)
}

///|
/// `toList`
pub fn[TA] tolist_v16(x : @oset.T[TA]) -> @list.List[TA] raise {
  let f : (@oset.T[TA]) -> @list.List[TA] raise = elements_v6
  f(x)
}

///|
/// `singleton`
pub fn[TA] singleton_v30(x : TA) -> @oset.T[TA] raise {
  let f : (TA) -> @oset.T[TA] raise = singleton_v29
  f(x)
}

///|
/// `null`
pub fn[TA] null_v17(x : @oset.T[TA]) -> Bool raise {
  let f : (@oset.T[TA]) -> Bool raise = is_empty_v14
  f(x)
}

///|
/// `size`
pub fn[TA] size_v16(x : @oset.T[TA]) -> Int64 raise {
  let f : (@oset.T[TA]) -> Int64 raise = cardinal_v14
  f(x)
}

///|
/// `pick`
pub fn[TA] pick_v7(x : @oset.T[TA]) -> TA raise {
  let f : (@oset.T[TA]) -> TA raise = choose_v14
  f(x)
}

///|
/// equal
fn step_107() -> Unit raise {
  equal_v28_c.set(fn(
    x2696 : @oset.T[(Bool, (String, @list.List[Term]))],
  ) -> ((@oset.T[(Bool, (String, @list.List[Term]))]) -> Bool raise) raise {
    fn(x2697 : @oset.T[(Bool, (String, @list.List[Term]))]) -> Bool raise {
      equal_v27(x2696, x2697)
    }
  })
}

///|
let equal_v28_c : @lib.Cell[
  (@oset.T[(Bool, (Name, @list.List[Term]))]) -> ((
    @oset.T[(Bool, (Name, @list.List[Term]))],
  ) -> Bool raise) raise,
] = @lib.Cell::new("equal")

///|
/// `equal`
pub fn equal_v28(
  x : @oset.T[(Bool, (Name, @list.List[Term]))],
) -> ((@oset.T[(Bool, (Name, @list.List[Term]))]) -> Bool raise) raise {
  equal_v28_c.get()(x)
}

///|
/// `exists`
pub fn[TA] exists_v29(
  x : (TA) -> Bool raise,
) -> ((@oset.T[TA]) -> Bool raise) raise {
  let f : ((TA) -> Bool raise) -> ((@oset.T[TA]) -> Bool raise) raise = x2698 => {
    x2699 => exists_v28(x2698, x2699)
  }
  f(x)
}

///|
/// `fromList`
pub fn fromlist_v15(
  x2700 : @list.List[(Bool, (String, @list.List[Term]))],
) -> @oset.T[(Bool, (Name, @list.List[Term]))] raise {
  let l = x2700
  @lib.itlist(add_v22, l, empty_v21())
}

///|
/// `delete`
pub fn delete_v14(
  x2701 : @oset.T[(Bool, (String, @list.List[Term]))],
  x2702 : (Bool, (String, @list.List[Term])),
) -> @oset.T[(Bool, (Name, @list.List[Term]))] raise {
  let s = x2701
  let x = x2702
  remove_v18(x, s)
}

///|
/// subset
fn step_108() -> Unit raise {
  subset_v13_c.set(fn(
    x2703 : @oset.T[(Bool, (String, @list.List[Term]))],
  ) -> ((@oset.T[(Bool, (String, @list.List[Term]))]) -> Bool raise) raise {
    fn(x2704 : @oset.T[(Bool, (String, @list.List[Term]))]) -> Bool raise {
      subset_v12(x2703, x2704)
    }
  })
}

///|
let subset_v13_c : @lib.Cell[
  (@oset.T[(Bool, (Name, @list.List[Term]))]) -> ((
    @oset.T[(Bool, (Name, @list.List[Term]))],
  ) -> Bool raise) raise,
] = @lib.Cell::new("subset")

///|
/// `subset`
pub fn subset_v13(
  x : @oset.T[(Bool, (Name, @list.List[Term]))],
) -> ((@oset.T[(Bool, (Name, @list.List[Term]))]) -> Bool raise) raise {
  subset_v13_c.get()(x)
}

///|
/// intersect
fn step_109() -> Unit raise {
  intersect_v7_c.set(fn(
    x2705 : @oset.T[(Bool, (String, @list.List[Term]))],
  ) -> ((@oset.T[(Bool, (String, @list.List[Term]))]) -> @oset.T[
    (Bool, (String, @list.List[Term])),
  ] raise) raise {
    fn(
      x2706 : @oset.T[(Bool, (String, @list.List[Term]))],
    ) -> @oset.T[(Bool, (String, @list.List[Term]))] raise {
      inter_v6(x2705, x2706)
    }
  })
}

///|
let intersect_v7_c : @lib.Cell[
  (@oset.T[(Bool, (Name, @list.List[Term]))]) -> ((
    @oset.T[(Bool, (Name, @list.List[Term]))],
  ) -> @oset.T[(Bool, (Name, @list.List[Term]))] raise) raise,
] = @lib.Cell::new("intersect")

///|
/// `intersect`
pub fn intersect_v7(
  x : @oset.T[(Bool, (Name, @list.List[Term]))],
) -> ((@oset.T[(Bool, (Name, @list.List[Term]))]) -> @oset.T[
  (Bool, (Name, @list.List[Term])),
] raise) raise {
  intersect_v7_c.get()(x)
}

///|
/// `intersectList`
pub fn intersectlist_v6(
  x2707 : @list.List[@oset.T[(Bool, (String, @list.List[Term]))]],
) -> @oset.T[(Bool, (Name, @list.List[Term]))] raise {
  match x2707 {
    Empty => empty_v21()
    More(s, tail=ss) => @lib.itlist(inter_v6, ss, s)
  }
}

///|
/// `findl`
pub fn[TA] findl_v7(
  x2708 : (TA) -> Bool raise,
  x2709 : @oset.T[TA],
) -> TA? raise {
  let p = x2708
  let s = x2709
  let go : (TA) -> ((TA?) -> TA? raise) raise = fn(
    x2710 : TA,
  ) -> ((TA?) -> TA? raise) raise {
    let x = x2710
    fn(x2711 : TA?) -> TA? raise {
      match x2711 {
        Some(_) as s_1 => s_1
        None => if p(x) { Some(x) } else { None }
      }
    }
  }
  fold_v14(go, s, None)
}

///|
/// `firstl`
pub fn[TA, TB] firstl_v7(
  x2712 : (TB) -> TA? raise,
  x2713 : @oset.T[TB],
) -> TA? raise {
  let f = x2712
  let s = x2713
  let go : (TB) -> ((TA?) -> TA? raise) raise = fn(
    x2714 : TB,
  ) -> ((TA?) -> TA? raise) raise {
    let x = x2714
    fn(x2715 : TA?) -> TA? raise {
      match x2715 {
        Some(_) as s_1 => s_1
        None => f(x)
      }
    }
  }
  fold_v14(go, s, None)
}

///|
/// `transform`
pub fn[TA, TB] transform_v14(
  x2716 : (TB) -> TA raise,
  x2717 : @oset.T[TB],
) -> @list.List[TA] raise {
  let f = x2716
  let s = x2717
  fold_v14(
    fn(x2718 : TB) -> ((@list.List[TA]) -> @list.List[TA] raise) raise {
      let x = x2718
      fn(x2719 : @list.List[TA]) -> @list.List[TA] raise {
        let acc = x2719
        acc.prepend(f(x))
      }
    },
    s,
    @list.List([]),
  )
}

///|
/// `all`
pub fn[TA] all_v7(
  x : (TA) -> Bool raise,
) -> ((@oset.T[TA]) -> Bool raise) raise {
  let f : ((TA) -> Bool raise) -> ((@oset.T[TA]) -> Bool raise) raise = x2720 => {
    x2721 => for_all_v14(x2720, x2721)
  }
  f(x)
}

///|
/// `count`
pub fn[TA] count_v7(
  x2722 : (TA) -> Bool raise,
  x2723 : @oset.T[TA],
) -> Int64 raise {
  let p = x2722
  let s = x2723
  fold_v14(
    fn(x2724 : TA) -> ((Int64) -> Int64 raise) raise {
      let x = x2724
      fn(x2725 : Int64) -> Int64 raise {
        let c = x2725
        if p(x) {
          @lib.add63(c, 1L)
        } else {
          c
        }
      }
    },
    s,
    0L,
  )
}

///|
/// `negateMember`
pub fn negatemember(
  x2726 : (Bool, (String, @list.List[Term])),
  x2727 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> Bool raise {
  let lit = x2726
  let set = x2727
  member_v6(negate(lit.0, lit.1))(set)
}

///|
/// negate
fn step_110() -> Unit raise {
  let f : (
    (
      (Bool, (String, @list.List[Term])),
      @oset.T[(Bool, (String, @list.List[Term]))],
    ),
  ) -> @oset.T[(Bool, (String, @list.List[Term]))] raise = fn(
    x2728 : (
      (Bool, (String, @list.List[Term])),
      @oset.T[(Bool, (String, @list.List[Term]))],
    ),
  ) -> @oset.T[(Bool, (String, @list.List[Term]))] raise {
    let (lit, set) = x2728
    add_v23(set, negate(lit.0, lit.1))
  }
  negate_v1_c.set(foldl_v16(f)(empty_v22()))
}

///|
let negate_v1_c : @lib.Cell[(@oset.T[(Bool, Atom)]) -> @oset.T[Literal] raise] = @lib.Cell::new(
  "negate",
)

///|
/// `negate`
pub fn negate_v1(x : @oset.T[(Bool, Atom)]) -> @oset.T[Literal] raise {
  negate_v1_c.get()(x)
}

///|
/// relations
fn step_111() -> Unit raise {
  let f : (((Bool, (String, @list.List[Term])), @oset.T[(String, Int64)])) -> @oset.T[
    (String, Int64),
  ] raise = fn(
    x2729 : ((Bool, (String, @list.List[Term])), @oset.T[(String, Int64)]),
  ) -> @oset.T[(String, Int64)] raise {
    let (lit, set) = x2729
    add_v11(set, relation_v1(lit))
  }
  relations_v1_c.set(foldl_v16(f)(empty_v10()))
}

///|
let relations_v1_c : @lib.Cell[
  (@oset.T[Literal]) -> @oset.T[(Name, Int64)] raise,
] = @lib.Cell::new("relations")

///|
/// `relations`
pub fn relations_v1(x : @oset.T[Literal]) -> @oset.T[(Name, Int64)] raise {
  relations_v1_c.get()(x)
}

///|
/// functions
fn step_112() -> Unit raise {
  let f : (((Bool, (String, @list.List[Term])), @oset.T[(String, Int64)])) -> @oset.T[
    (String, Int64),
  ] raise = fn(
    x2730 : ((Bool, (String, @list.List[Term])), @oset.T[(String, Int64)]),
  ) -> @oset.T[(String, Int64)] raise {
    let (lit, set) = x2730
    let t2731 = functions_v4(lit)
    union_v15(set)(t2731)
  }
  functions_v5_c.set(foldl_v16(f)(empty_v10()))
}

///|
let functions_v5_c : @lib.Cell[
  (@oset.T[Literal]) -> @oset.T[(Name, Int64)] raise,
] = @lib.Cell::new("functions")

///|
/// `functions`
pub fn functions_v5(x : @oset.T[Literal]) -> @oset.T[(Name, Int64)] raise {
  functions_v5_c.get()(x)
}

///|
/// `freeIn`
pub fn freein_v4(x2732 : String) -> ((@oset.T[Literal]) -> Bool raise) raise {
  let v = x2732
  exists_v29((x2734 : (Bool, (String, @list.List[Term]))) => freein_v3(v, x2734))
}

///|
/// freeVars
fn step_113() -> Unit raise {
  let f : (((Bool, (String, @list.List[Term])), @oset.T[String])) -> @oset.T[
    String,
  ] raise = fn(
    x2735 : ((Bool, (String, @list.List[Term])), @oset.T[String]),
  ) -> @oset.T[String] raise {
    let (lit, set) = x2735
    let t2736 = freevars_v4(lit)
    union_v11(set)(t2736)
  }
  freevars_v5_c.set(foldl_v16(f)(empty_v7()))
}

///|
let freevars_v5_c : @lib.Cell[(@oset.T[Literal]) -> @oset.T[Name] raise] = @lib.Cell::new(
  "freeVars",
)

///|
/// `freeVars`
pub fn freevars_v5(x : @oset.T[Literal]) -> @oset.T[Name] raise {
  freevars_v5_c.get()(x)
}

///|
/// freeVarsList
fn step_114() -> Unit raise {
  let f : ((@oset.T[(Bool, (String, @list.List[Term]))], @oset.T[String])) -> @oset.T[
    String,
  ] raise = fn(
    x2737 : (@oset.T[(Bool, (String, @list.List[Term]))], @oset.T[String]),
  ) -> @oset.T[String] raise {
    let (lits, set) = x2737
    let t2738 = freevars_v5(lits)
    union_v11(set)(t2738)
  }
  freevarslist_v2_c.set((
    x2739 : @list.List[@oset.T[(Bool, (String, @list.List[Term]))]],
  ) => foldl(f, empty_v7(), x2739))
}

///|
let freevarslist_v2_c : @lib.Cell[
  (@list.List[@oset.T[Literal]]) -> @oset.T[Name] raise,
] = @lib.Cell::new("freeVarsList")

///|
/// `freeVarsList`
pub fn freevarslist_v2(x : @list.List[@oset.T[Literal]]) -> @oset.T[Name] raise {
  freevarslist_v2_c.get()(x)
}

///|
/// symbols
fn step_115() -> Unit raise {
  let f : (((Bool, (String, @list.List[Term])), Int64)) -> Int64 raise = fn(
    x2740 : ((Bool, (String, @list.List[Term])), Int64),
  ) -> Int64 raise {
    let (lit, z) = x2740
    @lib.add63(symbols_v3(lit.0, lit.1), z)
  }
  symbols_v4_c.set(foldl_v16(f)(0L))
}

///|
let symbols_v4_c : @lib.Cell[(@oset.T[Literal]) -> Int64 raise] = @lib.Cell::new(
  "symbols",
)

///|
/// `symbols`
pub fn symbols_v4(x : @oset.T[Literal]) -> Int64 raise {
  symbols_v4_c.get()(x)
}

///|
/// typedSymbols
fn step_116() -> Unit raise {
  let f : (((Bool, (String, @list.List[Term])), Int64)) -> Int64 raise = fn(
    x2741 : ((Bool, (String, @list.List[Term])), Int64),
  ) -> Int64 raise {
    let (lit, z) = x2741
    @lib.add63(typedsymbols_v2(lit.0, lit.1), z)
  }
  typedsymbols_v3_c.set(foldl_v16(f)(0L))
}

///|
let typedsymbols_v3_c : @lib.Cell[(@oset.T[Literal]) -> Int64 raise] = @lib.Cell::new(
  "typedSymbols",
)

///|
/// `typedSymbols`
pub fn typedsymbols_v3(x : @oset.T[Literal]) -> Int64 raise {
  typedsymbols_v3_c.get()(x)
}

///|
/// `subst`
pub fn subst_v4(
  x2742 : Subst,
  x2743 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> @oset.T[Literal] raise {
  let sub = x2742
  let lits = x2743
  let substlit : (
    (
      (Bool, (String, @list.List[Term])),
      (Bool, @oset.T[(Bool, (String, @list.List[Term]))]),
    ),
  ) -> (Bool, @oset.T[(Bool, (String, @list.List[Term]))]) raise = fn(
    x2744 : (
      (Bool, (String, @list.List[Term])),
      (Bool, @oset.T[(Bool, (String, @list.List[Term]))]),
    ),
  ) -> (Bool, @oset.T[(Bool, (String, @list.List[Term]))]) raise {
    let (lit, (eq, lits_p)) = x2744
    let lit_p = subst_v3(sub, lit)
    let eq_1 = eq && physical_equal(lit, lit_p)
    (eq_1, add_v23(lits_p, lit_p))
  }
  let (eq_2, lits_p_1) = foldl_v16(substlit)((true, empty_v22()))(lits)
  if eq_2 {
    lits
  } else {
    lits_p_1
  }
}

///|
/// `conjoin`
pub fn conjoin(
  x2745 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> Formula raise {
  let set = x2745
  listmkconj(@lib.map(toformula, tolist_v16(set)))
}

///|
/// `disjoin`
pub fn disjoin(
  x2746 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> Formula raise {
  let set = x2746
  listmkdisj(@lib.map(toformula, tolist_v16(set)))
}

///|
/// `toString`
pub fn tostring_v7(
  x2747 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> String raise {
  let cl = x2747
  "{" + (@lib.string_concat(", ", @lib.map(tostring_v6, tolist_v16(cl))) + "}")
}

///|
/// `t`
pub type T24 = Set6

///|
/// compare
fn step_117() -> Unit raise {
  compare_v39_c.set(compare_v38)
}

///|
let compare_v39_c : @lib.Cell[
  (@oset.T[(Bool, (Name, @list.List[Term]))]) -> ((
    @oset.T[(Bool, (Name, @list.List[Term]))],
  ) -> Int64 raise) raise,
] = @lib.Cell::new("compare")

///|
/// `compare`
pub fn compare_v39(
  x : @oset.T[(Bool, (Name, @list.List[Term]))],
) -> ((@oset.T[(Bool, (Name, @list.List[Term]))]) -> Int64 raise) raise {
  compare_v39_c.get()(x)
}

///|
/// `key`
pub type Key8 = T24

///|
/// `t`
pub type T25[TA] = @omap.T[Key8, TA]

///|
/// `empty`
pub fn[TA, TB] empty_v23() -> @omap.T[TA, TB] {
  @omap.empty()
}

///|
/// `is_empty`
pub fn[TA, TB] is_empty_v15(x2748 : @omap.T[TA, TB]) -> Bool raise {
  let m = x2748
  @omap.is_empty(m)
}

///|
/// `mem`
pub fn[TA] mem_v15(
  x2749 : @oset.T[(Bool, (String, @list.List[Term]))],
  x2750 : @omap.T[@oset.T[(Bool, (String, @list.List[Term]))], TA],
) -> Bool raise {
  let x = x2749
  let m = x2750
  @omap.mem(compare_v39, x, m)
}

///|
/// `add`
pub fn[TA] add_v24(
  x2751 : @oset.T[(Bool, (String, @list.List[Term]))],
  x2752 : TA,
  x2753 : @omap.T[@oset.T[(Bool, (String, @list.List[Term]))], TA],
) -> @omap.T[@oset.T[(Bool, (Name, @list.List[Term]))], TA] raise {
  let x = x2751
  let data = x2752
  let m = x2753
  @omap.add(compare_v39, x, data, m)
}

///|
/// `update`
pub fn[TA] update_v8(
  x2754 : @oset.T[(Bool, (String, @list.List[Term]))],
  x2755 : (TA?) -> TA? raise,
  x2756 : @omap.T[@oset.T[(Bool, (String, @list.List[Term]))], TA],
) -> @omap.T[@oset.T[(Bool, (Name, @list.List[Term]))], TA] raise {
  let x = x2754
  let f = x2755
  let m = x2756
  @omap.update(compare_v39, x, f, m)
}

///|
/// `singleton`
pub fn[TA, TB] singleton_v31(x2757 : TA, x2758 : TB) -> @omap.T[TA, TB] raise {
  let x = x2757
  let d = x2758
  @omap.singleton(x, d)
}

///|
/// `remove`
pub fn[TA] remove_v19(
  x2759 : @oset.T[(Bool, (String, @list.List[Term]))],
  x2760 : @omap.T[@oset.T[(Bool, (String, @list.List[Term]))], TA],
) -> @omap.T[@oset.T[(Bool, (Name, @list.List[Term]))], TA] raise {
  let x = x2759
  let m = x2760
  @omap.remove(compare_v39, x, m)
}

///|
/// `merge`
pub fn[TA, TB, TC] merge_v10(
  x2761 : (@oset.T[(Bool, (String, @list.List[Term]))]) -> ((TC?) -> ((TB?) -> TA? raise) raise) raise,
  x2762 : @omap.T[@oset.T[(Bool, (String, @list.List[Term]))], TC],
  x2763 : @omap.T[@oset.T[(Bool, (String, @list.List[Term]))], TB],
) -> @omap.T[@oset.T[(Bool, (Name, @list.List[Term]))], TA] raise {
  let f = x2761
  let s1 = x2762
  let s2 = x2763
  @omap.merge(compare_v39, f, s1, s2)
}

///|
/// `union`
pub fn[TA] union_v31(
  x2764 : (@oset.T[(Bool, (String, @list.List[Term]))]) -> ((TA) -> ((TA) -> TA? raise) raise) raise,
  x2765 : @omap.T[@oset.T[(Bool, (String, @list.List[Term]))], TA],
  x2766 : @omap.T[@oset.T[(Bool, (String, @list.List[Term]))], TA],
) -> @omap.T[@oset.T[(Bool, (Name, @list.List[Term]))], TA] raise {
  let f = x2764
  let s1 = x2765
  let s2 = x2766
  @omap.union(compare_v39, f, s1, s2)
}

///|
/// `compare`
pub fn[TA, TB] compare_v40(
  x2767 : (TB) -> ((TA) -> Int64 raise) raise,
  x2768 : @omap.T[@oset.T[(Bool, (String, @list.List[Term]))], TB],
  x2769 : @omap.T[@oset.T[(Bool, (String, @list.List[Term]))], TA],
) -> Int64 raise {
  let cmp = x2767
  let m1 = x2768
  let m2 = x2769
  @omap.compare(compare_v39, cmp, m1, m2)
}

///|
/// `equal`
pub fn[TA, TB] equal_v29(
  x2770 : (TB) -> ((TA) -> Bool raise) raise,
  x2771 : @omap.T[@oset.T[(Bool, (String, @list.List[Term]))], TB],
  x2772 : @omap.T[@oset.T[(Bool, (String, @list.List[Term]))], TA],
) -> Bool raise {
  let cmp = x2770
  let m1 = x2771
  let m2 = x2772
  @omap.equal(compare_v39, cmp, m1, m2)
}

///|
/// `iter`
pub fn[TA, TB, TC] iter_v15(
  x2773 : (TC) -> ((TB) -> TA raise) raise,
  x2774 : @omap.T[TC, TB],
) -> Unit raise {
  let f = x2773
  let m = x2774
  @omap.iter(f, m)
}

///|
/// `fold`
pub fn[TA, TB, TC] fold_v15(
  x2775 : (TC) -> ((TB) -> ((TA) -> TA raise) raise) raise,
  x2776 : @omap.T[TC, TB],
  x2777 : TA,
) -> TA raise {
  let f = x2775
  let m = x2776
  let accu = x2777
  @omap.fold(f, m, accu)
}

///|
/// `for_all`
pub fn[TA, TB] for_all_v15(
  x2778 : (TB) -> ((TA) -> Bool raise) raise,
  x2779 : @omap.T[TB, TA],
) -> Bool raise {
  let p = x2778
  let m = x2779
  @omap.for_all(p, m)
}

///|
/// `exists`
pub fn[TA, TB] exists_v30(
  x2780 : (TB) -> ((TA) -> Bool raise) raise,
  x2781 : @omap.T[TB, TA],
) -> Bool raise {
  let p = x2780
  let m = x2781
  @omap.exists(p, m)
}

///|
/// `filter`
pub fn[TA, TB] filter_v24(
  x2782 : (TA) -> ((TB) -> Bool raise) raise,
  x2783 : @omap.T[TA, TB],
) -> @omap.T[TA, TB] raise {
  let p = x2782
  let m = x2783
  @omap.filter(p, m)
}

///|
/// `filter_map`
pub fn[TA, TB, TC] filter_map_v15(
  x2784 : (TA) -> ((TC) -> TB? raise) raise,
  x2785 : @omap.T[TA, TC],
) -> @omap.T[TA, TB] raise {
  let f = x2784
  let m = x2785
  @omap.filter_map(f, m)
}

///|
/// `partition`
pub fn[TA, TB] partition_v17(
  x2786 : (TA) -> ((TB) -> Bool raise) raise,
  x2787 : @omap.T[TA, TB],
) -> (@omap.T[TA, TB], @omap.T[TA, TB]) raise {
  let p = x2786
  let m = x2787
  @omap.partition(p, m)
}

///|
/// `cardinal`
pub fn[TA, TB] cardinal_v15(x2788 : @omap.T[TA, TB]) -> Int64 raise {
  let m = x2788
  @omap.cardinal(m)
}

///|
/// `bindings`
pub fn[TA, TB] bindings_v8(
  x2789 : @omap.T[TA, TB],
) -> @list.List[(TA, TB)] raise {
  let s = x2789
  @omap.bindings(s)
}

///|
/// `min_binding`
pub fn[TA, TB] min_binding_v8(x2790 : @omap.T[TA, TB]) -> (TA, TB) raise {
  let m = x2790
  @omap.min_binding(m)
}

///|
/// `min_binding_opt`
pub fn[TA, TB] min_binding_opt_v8(x2791 : @omap.T[TA, TB]) -> (TA, TB)? raise {
  let m = x2791
  @omap.min_binding_opt(m)
}

///|
/// `max_binding`
pub fn[TA, TB] max_binding_v8(x2792 : @omap.T[TA, TB]) -> (TA, TB) raise {
  let m = x2792
  @omap.max_binding(m)
}

///|
/// `max_binding_opt`
pub fn[TA, TB] max_binding_opt_v8(x2793 : @omap.T[TA, TB]) -> (TA, TB)? raise {
  let m = x2793
  @omap.max_binding_opt(m)
}

///|
/// `choose`
pub fn[TA, TB] choose_v15(x2794 : @omap.T[TA, TB]) -> (TA, TB) raise {
  let m = x2794
  @omap.choose(m)
}

///|
/// `choose_opt`
pub fn[TA, TB] choose_opt_v15(x2795 : @omap.T[TA, TB]) -> (TA, TB)? raise {
  let m = x2795
  @omap.choose_opt(m)
}

///|
/// `split`
pub fn[TA] split_v16(
  x2796 : @oset.T[(Bool, (String, @list.List[Term]))],
  x2797 : @omap.T[@oset.T[(Bool, (String, @list.List[Term]))], TA],
) -> (
  @omap.T[@oset.T[(Bool, (Name, @list.List[Term]))], TA],
  TA?,
  @omap.T[@oset.T[(Bool, (Name, @list.List[Term]))], TA],
) raise {
  let x = x2796
  let m = x2797
  @omap.split(compare_v39, x, m)
}

///|
/// `find`
pub fn[TA] find_v18(
  x2798 : @oset.T[(Bool, (String, @list.List[Term]))],
  x2799 : @omap.T[@oset.T[(Bool, (String, @list.List[Term]))], TA],
) -> TA raise {
  let x = x2798
  let m = x2799
  @omap.find(compare_v39, x, m)
}

///|
/// `find_opt`
pub fn[TA] find_opt_v15(
  x2800 : @oset.T[(Bool, (String, @list.List[Term]))],
  x2801 : @omap.T[@oset.T[(Bool, (String, @list.List[Term]))], TA],
) -> TA? raise {
  let x = x2800
  let m = x2801
  @omap.find_opt(compare_v39, x, m)
}

///|
/// `find_first`
pub fn[TA, TB] find_first_v15(
  x2802 : (TA) -> Bool raise,
  x2803 : @omap.T[TA, TB],
) -> (TA, TB) raise {
  let f = x2802
  let m = x2803
  @omap.find_first(f, m)
}

///|
/// `find_first_opt`
pub fn[TA, TB] find_first_opt_v15(
  x2804 : (TA) -> Bool raise,
  x2805 : @omap.T[TA, TB],
) -> (TA, TB)? raise {
  let f = x2804
  let m = x2805
  @omap.find_first_opt(f, m)
}

///|
/// `find_last`
pub fn[TA, TB] find_last_v15(
  x2806 : (TA) -> Bool raise,
  x2807 : @omap.T[TA, TB],
) -> (TA, TB) raise {
  let f = x2806
  let m = x2807
  @omap.find_last(f, m)
}

///|
/// `find_last_opt`
pub fn[TA, TB] find_last_opt_v15(
  x2808 : (TA) -> Bool raise,
  x2809 : @omap.T[TA, TB],
) -> (TA, TB)? raise {
  let f = x2808
  let m = x2809
  @omap.find_last_opt(f, m)
}

///|
/// `map`
pub fn[TA, TB, TC] map_v17(
  x2810 : (TC) -> TB raise,
  x2811 : @omap.T[TA, TC],
) -> @omap.T[TA, TB] raise {
  let f = x2810
  let m = x2811
  @omap.map(f, m)
}

///|
/// `mapi`
pub fn[TA, TB, TC] mapi_v8(
  x2812 : (TA) -> ((TC) -> TB raise) raise,
  x2813 : @omap.T[TA, TC],
) -> @omap.T[TA, TB] raise {
  let f = x2812
  let m = x2813
  @omap.mapi(f, m)
}

///|
/// `map`
pub type Map9[TA] = T25[TA]

///|
/// `newMap`
pub fn[TA, TB] newmap_v8(x2814 : Unit) -> @omap.T[TA, TB] raise {
  let _ = x2814
  empty_v23()
}

///|
/// `null`
pub fn[TA, TB] null_v18(x : @omap.T[TA, TB]) -> Bool raise {
  let f : (@omap.T[TA, TB]) -> Bool raise = is_empty_v15
  f(x)
}

///|
/// `singleton`
pub fn[TA, TB] singleton_v32(x2815 : TA, x2816 : TB) -> @omap.T[TA, TB] raise {
  let (k, x) = (x2815, x2816)
  singleton_v31(k, x)
}

///|
/// `size`
pub fn[TA, TB] size_v17(x : @omap.T[TA, TB]) -> Int64 raise {
  let f : (@omap.T[TA, TB]) -> Int64 raise = cardinal_v15
  f(x)
}

///|
/// `get`
pub fn[TA] get_v8(
  x2817 : @omap.T[@oset.T[(Bool, (String, @list.List[Term]))], TA],
  x2818 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> TA raise {
  let m = x2817
  let k = x2818
  find_v18(k, m) catch {
    @lib.NotFound => raise Failure("Mmap.get: element not found")
    e => raise e
  }
}

///|
/// `peek`
pub fn[TA] peek_v10(
  x2819 : @omap.T[@oset.T[(Bool, (String, @list.List[Term]))], TA],
  x2820 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> TA? raise {
  let m = x2819
  let k = x2820
  Some(find_v18(k, m)) catch {
    @lib.NotFound => None
    e => raise e
  }
}

///|
/// `insert`
pub fn[TA] insert_v9(
  x2821 : @omap.T[@oset.T[(Bool, (String, @list.List[Term]))], TA],
  x2822 : (@oset.T[(Bool, (String, @list.List[Term]))], TA),
) -> @omap.T[@oset.T[(Bool, (Name, @list.List[Term]))], TA] raise {
  let m = x2821
  let (k, v) = x2822
  add_v24(k, v, m)
}

///|
/// `toList`
pub fn[TA, TB] tolist_v17(x : @omap.T[TA, TB]) -> @list.List[(TA, TB)] raise {
  let f : (@omap.T[TA, TB]) -> @list.List[(TA, TB)] raise = bindings_v8
  f(x)
}

///|
/// `fromList`
pub fn[TA] fromlist_v16(
  x2823 : @list.List[(@oset.T[(Bool, (String, @list.List[Term]))], TA)],
) -> @omap.T[@oset.T[(Bool, (Name, @list.List[Term]))], TA] raise {
  let l = x2823
  @lib.itlist(
    fn(
      x2824 : (@oset.T[(Bool, (String, @list.List[Term]))], TA),
      x2825 : @omap.T[@oset.T[(Bool, (String, @list.List[Term]))], TA],
    ) -> @omap.T[@oset.T[(Bool, (String, @list.List[Term]))], TA] raise {
      let (v, tm) = x2824
      ((x2826 : @omap.T[@oset.T[(Bool, (String, @list.List[Term]))], TA]) => {
        add_v24(v, tm, x2826)
      })(x2825)
    },
    l,
    empty_v23(),
  )
}

///|
/// `foldl`
pub fn[TA, TB, TC] foldl_v17(
  x2827 : ((TB, TC, TA)) -> TA raise,
  x2828 : TA,
  x2829 : @omap.T[TB, TC],
) -> TA raise {
  let f = x2827
  let b = x2828
  let m = x2829
  @lib.fold_left(
    fn(x2830 : TA, x2831 : (TB, TC)) -> TA raise {
      let s = x2830
      let (v, tm) = x2831
      f((v, tm, s))
    },
    b,
    bindings_v8(m),
  )
}

///|
/// `foldr`
pub fn[TA, TB, TC] foldr_v17(
  x : ((TB, TC, TA)) -> TA raise,
) -> ((TA) -> ((@omap.T[TB, TC]) -> TA raise) raise) raise {
  let f : (((TB, TC, TA)) -> TA raise) -> ((TA) -> ((@omap.T[TB, TC]) -> TA raise) raise) raise = x2832 => {
    x2833 => x2834 => foldl_v17(x2832, x2833, x2834)
  }
  f(x)
}

///|
/// `filter`
pub fn[TA, TB] filter_v25(
  x2835 : ((TA, TB)) -> Bool raise,
) -> ((@omap.T[TA, TB]) -> @omap.T[TA, TB] raise) raise {
  let f = x2835
  (x2839 : @omap.T[TA, TB]) => {
    filter_v24(
      fn(x2837 : TA) -> ((TB) -> Bool raise) raise {
        let x = x2837
        fn(x2838 : TB) -> Bool raise {
          let y = x2838
          f((x, y))
        }
      },
      x2839,
    )
  }
}

///|
/// `inDomain`
pub fn[TA] indomain_v8(
  x : @oset.T[(Bool, (Name, @list.List[Term]))],
) -> ((@omap.T[@oset.T[(Bool, (Name, @list.List[Term]))], TA]) -> Bool raise) raise {
  let f : (@oset.T[(Bool, (Name, @list.List[Term]))]) -> ((
    @omap.T[@oset.T[(Bool, (Name, @list.List[Term]))], TA],
  ) -> Bool raise) raise = (x2840 : @oset.T[(Bool, (String, @list.List[Term]))]) => {
    x2841 => mem_v15(x2840, x2841)
  }
  f(x)
}

///|
/// `union`
pub fn[TA] union_v32(
  x2842 : (
    (
      (@oset.T[(Bool, (String, @list.List[Term]))], TA),
      (@oset.T[(Bool, (String, @list.List[Term]))], TA),
    ),
  ) -> TA? raise,
  x2843 : @omap.T[@oset.T[(Bool, (String, @list.List[Term]))], TA],
  x2844 : @omap.T[@oset.T[(Bool, (String, @list.List[Term]))], TA],
) -> @omap.T[@oset.T[(Bool, (Name, @list.List[Term]))], TA] raise {
  let f = x2842
  let m1 = x2843
  let m2 = x2844
  let f_p : (@oset.T[(Bool, (String, @list.List[Term]))]) -> (((TA?, TA?)) -> TA? raise) raise = fn(
    x2845 : @oset.T[(Bool, (String, @list.List[Term]))],
  ) -> (((TA?, TA?)) -> TA? raise) raise {
    let k = x2845
    fn(x2846 : (TA?, TA?)) -> TA? raise {
      match x2846 {
        (Some(x), Some(y)) => f(((k, x), (k, y)))
        (Some(x_1), None) => Some(x_1)
        (None, Some(y_1)) => Some(y_1)
        (None, None) => None
      }
    }
  }
  merge_v10(
    fn(
      x2847 : @oset.T[(Bool, (String, @list.List[Term]))],
    ) -> ((TA?) -> ((TA?) -> TA? raise) raise) raise {
      let k_1 = x2847
      fn(x2848 : TA?) -> ((TA?) -> TA? raise) raise {
        let x_2 = x2848
        fn(x2849 : TA?) -> TA? raise {
          let y_2 = x2849
          f_p(k_1)((x_2, y_2))
        }
      }
    },
    m1,
    m2,
  )
}

///|
/// `delete`
pub fn[TA] delete_v15(
  x2850 : @omap.T[@oset.T[(Bool, (String, @list.List[Term]))], TA],
  x2851 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> @omap.T[@oset.T[(Bool, (Name, @list.List[Term]))], TA] raise {
  let m = x2850
  let k = x2851
  remove_v19(k, m)
}

///|
/// `mapPartial`
pub fn[TA, TB] mappartial_v9(
  x2852 : ((@oset.T[(Bool, (String, @list.List[Term]))], TB)) -> TA? raise,
  x2853 : @omap.T[@oset.T[(Bool, (String, @list.List[Term]))], TB],
) -> @omap.T[@oset.T[(Bool, (Name, @list.List[Term]))], TA] raise {
  let f = x2852
  let m = x2853
  fold_v15(
    fn(
      x2854 : @oset.T[(Bool, (String, @list.List[Term]))],
    ) -> ((TB) -> ((@omap.T[@oset.T[(Bool, (String, @list.List[Term]))], TA]) -> @omap.T[
      @oset.T[(Bool, (String, @list.List[Term]))],
      TA,
    ] raise) raise) raise {
      let k = x2854
      fn(
        x2855 : TB,
      ) -> ((@omap.T[@oset.T[(Bool, (String, @list.List[Term]))], TA]) -> @omap.T[
        @oset.T[(Bool, (String, @list.List[Term]))],
        TA,
      ] raise) raise {
        let x = x2855
        fn(
          x2856 : @omap.T[@oset.T[(Bool, (String, @list.List[Term]))], TA],
        ) -> @omap.T[@oset.T[(Bool, (String, @list.List[Term]))], TA] raise {
          let acc = x2856
          match f((k, x)) {
            Some(y) => add_v24(k, y, acc)
            None => acc
          }
        }
      }
    },
    m,
    empty_v23(),
  )
}

///|
/// `transform`
pub fn[TA, TB, TC] transform_v15(
  x : (TC) -> TB raise,
) -> ((@omap.T[TA, TC]) -> @omap.T[TA, TB] raise) raise {
  let f : ((TC) -> TB raise) -> ((@omap.T[TA, TC]) -> @omap.T[TA, TB] raise) raise = x2857 => {
    x2858 => map_v17(x2857, x2858)
  }
  f(x)
}

///|
/// `exists`
pub fn[TA, TB] exists_v31(
  x2859 : ((TA, TB)) -> Bool raise,
) -> ((@omap.T[TA, TB]) -> Bool raise) raise {
  let f = x2859
  (x2863 : @omap.T[TA, TB]) => {
    exists_v30(
      fn(x2861 : TA) -> ((TB) -> Bool raise) raise {
        let k = x2861
        fn(x2862 : TB) -> Bool raise {
          let m = x2862
          f((k, m))
        }
      },
      x2863,
    )
  }
}

///|
/// `elt`
pub type Elt7 = T24

///|
/// `t`
pub type T26 = @oset.T[Elt7]

///|
/// `empty`
pub fn[TA] empty_v24() -> @oset.T[TA] {
  @oset.empty()
}

///|
/// `is_empty`
pub fn[TA] is_empty_v16(x2864 : @oset.T[TA]) -> Bool raise {
  let s = x2864
  @oset.is_empty(s)
}

///|
/// `mem`
pub fn mem_v16(
  x2865 : @oset.T[(Bool, (String, @list.List[Term]))],
  x2866 : @oset.T[@oset.T[(Bool, (String, @list.List[Term]))]],
) -> Bool raise {
  let x = x2865
  let s = x2866
  @oset.mem(compare_v39, x, s)
}

///|
/// `add`
pub fn add_v25(
  x2867 : @oset.T[(Bool, (String, @list.List[Term]))],
  x2868 : @oset.T[@oset.T[(Bool, (String, @list.List[Term]))]],
) -> @oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]] raise {
  let x = x2867
  let s = x2868
  @oset.add(compare_v39, x, s)
}

///|
/// `singleton`
pub fn[TA] singleton_v33(x2869 : TA) -> @oset.T[TA] raise {
  let x = x2869
  @oset.singleton(x)
}

///|
/// `remove`
pub fn remove_v20(
  x2870 : @oset.T[(Bool, (String, @list.List[Term]))],
  x2871 : @oset.T[@oset.T[(Bool, (String, @list.List[Term]))]],
) -> @oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]] raise {
  let x = x2870
  let s = x2871
  @oset.remove(compare_v39, x, s)
}

///|
/// `union`
pub fn union_v33(
  x2872 : @oset.T[@oset.T[(Bool, (String, @list.List[Term]))]],
  x2873 : @oset.T[@oset.T[(Bool, (String, @list.List[Term]))]],
) -> @oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]] raise {
  let s1 = x2872
  let s2 = x2873
  @oset.union(compare_v39, s1, s2)
}

///|
/// `inter`
pub fn inter_v7(
  x2874 : @oset.T[@oset.T[(Bool, (String, @list.List[Term]))]],
  x2875 : @oset.T[@oset.T[(Bool, (String, @list.List[Term]))]],
) -> @oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]] raise {
  let s1 = x2874
  let s2 = x2875
  @oset.inter(compare_v39, s1, s2)
}

///|
/// `disjoint`
pub fn disjoint_v8(
  x2876 : @oset.T[@oset.T[(Bool, (String, @list.List[Term]))]],
  x2877 : @oset.T[@oset.T[(Bool, (String, @list.List[Term]))]],
) -> Bool raise {
  let s1 = x2876
  let s2 = x2877
  @oset.disjoint(compare_v39, s1, s2)
}

///|
/// `diff`
pub fn diff_v7(
  x2878 : @oset.T[@oset.T[(Bool, (String, @list.List[Term]))]],
  x2879 : @oset.T[@oset.T[(Bool, (String, @list.List[Term]))]],
) -> @oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]] raise {
  let s1 = x2878
  let s2 = x2879
  @oset.diff(compare_v39, s1, s2)
}

///|
/// `compare`
pub fn compare_v41(
  x2880 : @oset.T[@oset.T[(Bool, (String, @list.List[Term]))]],
  x2881 : @oset.T[@oset.T[(Bool, (String, @list.List[Term]))]],
) -> Int64 raise {
  let s1 = x2880
  let s2 = x2881
  @oset.compare(compare_v39, s1, s2)
}

///|
/// `equal`
pub fn equal_v30(
  x2882 : @oset.T[@oset.T[(Bool, (String, @list.List[Term]))]],
  x2883 : @oset.T[@oset.T[(Bool, (String, @list.List[Term]))]],
) -> Bool raise {
  let s1 = x2882
  let s2 = x2883
  @oset.equal(compare_v39, s1, s2)
}

///|
/// `subset`
pub fn subset_v14(
  x2884 : @oset.T[@oset.T[(Bool, (String, @list.List[Term]))]],
  x2885 : @oset.T[@oset.T[(Bool, (String, @list.List[Term]))]],
) -> Bool raise {
  let s1 = x2884
  let s2 = x2885
  @oset.subset(compare_v39, s1, s2)
}

///|
/// `iter`
pub fn[TA, TB] iter_v16(
  x2886 : (TB) -> TA raise,
  x2887 : @oset.T[TB],
) -> Unit raise {
  let f = x2886
  let s = x2887
  @oset.iter(f, s)
}

///|
/// `map`
pub fn map_v18(
  x2888 : (@oset.T[(Bool, (String, @list.List[Term]))]) -> @oset.T[
    (Bool, (String, @list.List[Term])),
  ] raise,
  x2889 : @oset.T[@oset.T[(Bool, (String, @list.List[Term]))]],
) -> @oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]] raise {
  let f = x2888
  let s = x2889
  @oset.map(compare_v39, f, s)
}

///|
/// `fold`
pub fn[TA, TB] fold_v16(
  x2890 : (TB) -> ((TA) -> TA raise) raise,
  x2891 : @oset.T[TB],
  x2892 : TA,
) -> TA raise {
  let f = x2890
  let s = x2891
  let accu = x2892
  @oset.fold(f, s, accu)
}

///|
/// `for_all`
pub fn[TA] for_all_v16(
  x2893 : (TA) -> Bool raise,
  x2894 : @oset.T[TA],
) -> Bool raise {
  let p = x2893
  let s = x2894
  @oset.for_all(p, s)
}

///|
/// `exists`
pub fn[TA] exists_v32(
  x2895 : (TA) -> Bool raise,
  x2896 : @oset.T[TA],
) -> Bool raise {
  let p = x2895
  let s = x2896
  @oset.exists(p, s)
}

///|
/// `filter`
pub fn[TA] filter_v26(
  x2897 : (TA) -> Bool raise,
  x2898 : @oset.T[TA],
) -> @oset.T[TA] raise {
  let p = x2897
  let s = x2898
  @oset.filter(p, s)
}

///|
/// `filter_map`
pub fn filter_map_v16(
  x2899 : (@oset.T[(Bool, (String, @list.List[Term]))]) -> @oset.T[
    (Bool, (String, @list.List[Term])),
  ]? raise,
  x2900 : @oset.T[@oset.T[(Bool, (String, @list.List[Term]))]],
) -> @oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]] raise {
  let f = x2899
  let s = x2900
  @oset.filter_map(compare_v39, f, s)
}

///|
/// `partition`
pub fn[TA] partition_v18(
  x2901 : (TA) -> Bool raise,
  x2902 : @oset.T[TA],
) -> (@oset.T[TA], @oset.T[TA]) raise {
  let p = x2901
  let s = x2902
  @oset.partition(p, s)
}

///|
/// `cardinal`
pub fn[TA] cardinal_v16(x2903 : @oset.T[TA]) -> Int64 raise {
  let s = x2903
  @oset.cardinal(s)
}

///|
/// `elements`
pub fn[TA] elements_v7(x2904 : @oset.T[TA]) -> @list.List[TA] raise {
  let s = x2904
  @oset.elements(s)
}

///|
/// `min_elt`
pub fn[TA] min_elt_v7(x2905 : @oset.T[TA]) -> TA raise {
  let s = x2905
  @oset.min_elt(s)
}

///|
/// `min_elt_opt`
pub fn[TA] min_elt_opt_v7(x2906 : @oset.T[TA]) -> TA? raise {
  let s = x2906
  @oset.min_elt_opt(s)
}

///|
/// `max_elt`
pub fn[TA] max_elt_v7(x2907 : @oset.T[TA]) -> TA raise {
  let s = x2907
  @oset.max_elt(s)
}

///|
/// `max_elt_opt`
pub fn[TA] max_elt_opt_v7(x2908 : @oset.T[TA]) -> TA? raise {
  let s = x2908
  @oset.max_elt_opt(s)
}

///|
/// `choose`
pub fn[TA] choose_v16(x2909 : @oset.T[TA]) -> TA raise {
  let s = x2909
  @oset.choose(s)
}

///|
/// `choose_opt`
pub fn[TA] choose_opt_v16(x2910 : @oset.T[TA]) -> TA? raise {
  let s = x2910
  @oset.choose_opt(s)
}

///|
/// `split`
pub fn split_v17(
  x2911 : @oset.T[(Bool, (String, @list.List[Term]))],
  x2912 : @oset.T[@oset.T[(Bool, (String, @list.List[Term]))]],
) -> (
  @oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]],
  Bool,
  @oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]],
) raise {
  let x = x2911
  let s = x2912
  @oset.split(compare_v39, x, s)
}

///|
/// `find`
pub fn find_v19(
  x2913 : @oset.T[(Bool, (String, @list.List[Term]))],
  x2914 : @oset.T[@oset.T[(Bool, (String, @list.List[Term]))]],
) -> @oset.T[(Bool, (Name, @list.List[Term]))] raise {
  let x = x2913
  let s = x2914
  @oset.find(compare_v39, x, s)
}

///|
/// `find_opt`
pub fn find_opt_v16(
  x2915 : @oset.T[(Bool, (String, @list.List[Term]))],
  x2916 : @oset.T[@oset.T[(Bool, (String, @list.List[Term]))]],
) -> @oset.T[(Bool, (Name, @list.List[Term]))]? raise {
  let x = x2915
  let s = x2916
  @oset.find_opt(compare_v39, x, s)
}

///|
/// `find_first`
pub fn[TA] find_first_v16(
  x2917 : (TA) -> Bool raise,
  x2918 : @oset.T[TA],
) -> TA raise {
  let f = x2917
  let s = x2918
  @oset.find_first(f, s)
}

///|
/// `find_first_opt`
pub fn[TA] find_first_opt_v16(
  x2919 : (TA) -> Bool raise,
  x2920 : @oset.T[TA],
) -> TA? raise {
  let f = x2919
  let s = x2920
  @oset.find_first_opt(f, s)
}

///|
/// `find_last`
pub fn[TA] find_last_v16(
  x2921 : (TA) -> Bool raise,
  x2922 : @oset.T[TA],
) -> TA raise {
  let f = x2921
  let s = x2922
  @oset.find_last(f, s)
}

///|
/// `find_last_opt`
pub fn[TA] find_last_opt_v16(
  x2923 : (TA) -> Bool raise,
  x2924 : @oset.T[TA],
) -> TA? raise {
  let f = x2923
  let s = x2924
  @oset.find_last_opt(f, s)
}

///|
/// `set`
pub type Set7 = T26

///|
/// compare
fn step_118() -> Unit raise {
  compare_v42_c.set(fn(
    x2925 : @oset.T[@oset.T[(Bool, (String, @list.List[Term]))]],
  ) -> ((@oset.T[@oset.T[(Bool, (String, @list.List[Term]))]]) -> Int64 raise) raise {
    fn(
      x2926 : @oset.T[@oset.T[(Bool, (String, @list.List[Term]))]],
    ) -> Int64 raise {
      compare_v41(x2925, x2926)
    }
  })
}

///|
let compare_v42_c : @lib.Cell[
  (@oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]]) -> ((
    @oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]],
  ) -> Int64 raise) raise,
] = @lib.Cell::new("compare")

///|
/// `compare`
pub fn compare_v42(
  x : @oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]],
) -> ((@oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]]) -> Int64 raise) raise {
  compare_v42_c.get()(x)
}

///|
/// `add`
pub fn add_v26(
  x2927 : @oset.T[@oset.T[(Bool, (String, @list.List[Term]))]],
  x2928 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> @oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]] raise {
  let s = x2927
  let x = x2928
  add_v25(x, s)
}

///|
/// `foldr`
pub fn[TA, TB] foldr_v18(
  x2929 : ((TB, TA)) -> TA raise,
  x2930 : TA,
  x2931 : @oset.T[TB],
) -> TA raise {
  let f = x2929
  let a = x2930
  let s = x2931
  fold_v16(
    fn(x2932 : TB) -> ((TA) -> TA raise) raise {
      let x = x2932
      fn(x2933 : TA) -> TA raise {
        let acc = x2933
        f((x, acc))
      }
    },
    s,
    a,
  )
}

///|
/// `foldl`
pub fn[TA, TB] foldl_v18(
  x : ((TB, TA)) -> TA raise,
) -> ((TA) -> ((@oset.T[TB]) -> TA raise) raise) raise {
  let f : (((TB, TA)) -> TA raise) -> ((TA) -> ((@oset.T[TB]) -> TA raise) raise) raise = x2934 => {
    x2935 => x2936 => foldr_v18(x2934, x2935, x2936)
  }
  f(x)
}

///|
/// member
fn step_119() -> Unit raise {
  member_v7_c.set(fn(
    x2937 : @oset.T[(Bool, (String, @list.List[Term]))],
  ) -> ((@oset.T[@oset.T[(Bool, (String, @list.List[Term]))]]) -> Bool raise) raise {
    fn(
      x2938 : @oset.T[@oset.T[(Bool, (String, @list.List[Term]))]],
    ) -> Bool raise {
      mem_v16(x2937, x2938)
    }
  })
}

///|
let member_v7_c : @lib.Cell[
  (@oset.T[(Bool, (Name, @list.List[Term]))]) -> ((
    @oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]],
  ) -> Bool raise) raise,
] = @lib.Cell::new("member")

///|
/// `member`
pub fn member_v7(
  x : @oset.T[(Bool, (Name, @list.List[Term]))],
) -> ((@oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]]) -> Bool raise) raise {
  member_v7_c.get()(x)
}

///|
/// `empty`
pub fn[TA] empty_v25() -> @oset.T[TA] {
  empty_v24()
}

///|
/// union
fn step_120() -> Unit raise {
  union_v34_c.set(fn(
    x2939 : @oset.T[@oset.T[(Bool, (String, @list.List[Term]))]],
  ) -> ((@oset.T[@oset.T[(Bool, (String, @list.List[Term]))]]) -> @oset.T[
    @oset.T[(Bool, (String, @list.List[Term]))],
  ] raise) raise {
    fn(
      x2940 : @oset.T[@oset.T[(Bool, (String, @list.List[Term]))]],
    ) -> @oset.T[@oset.T[(Bool, (String, @list.List[Term]))]] raise {
      union_v33(x2939, x2940)
    }
  })
}

///|
let union_v34_c : @lib.Cell[
  (@oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]]) -> ((
    @oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]],
  ) -> @oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]] raise) raise,
] = @lib.Cell::new("union")

///|
/// `union`
pub fn union_v34(
  x : @oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]],
) -> ((@oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]]) -> @oset.T[
  @oset.T[(Bool, (Name, @list.List[Term]))],
] raise) raise {
  union_v34_c.get()(x)
}

///|
/// difference
fn step_121() -> Unit raise {
  difference_v7_c.set(fn(
    x2941 : @oset.T[@oset.T[(Bool, (String, @list.List[Term]))]],
  ) -> ((@oset.T[@oset.T[(Bool, (String, @list.List[Term]))]]) -> @oset.T[
    @oset.T[(Bool, (String, @list.List[Term]))],
  ] raise) raise {
    fn(
      x2942 : @oset.T[@oset.T[(Bool, (String, @list.List[Term]))]],
    ) -> @oset.T[@oset.T[(Bool, (String, @list.List[Term]))]] raise {
      diff_v7(x2941, x2942)
    }
  })
}

///|
let difference_v7_c : @lib.Cell[
  (@oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]]) -> ((
    @oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]],
  ) -> @oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]] raise) raise,
] = @lib.Cell::new("difference")

///|
/// `difference`
pub fn difference_v7(
  x : @oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]],
) -> ((@oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]]) -> @oset.T[
  @oset.T[(Bool, (Name, @list.List[Term]))],
] raise) raise {
  difference_v7_c.get()(x)
}

///|
/// `toList`
pub fn[TA] tolist_v18(x : @oset.T[TA]) -> @list.List[TA] raise {
  let f : (@oset.T[TA]) -> @list.List[TA] raise = elements_v7
  f(x)
}

///|
/// `singleton`
pub fn[TA] singleton_v34(x : TA) -> @oset.T[TA] raise {
  let f : (TA) -> @oset.T[TA] raise = singleton_v33
  f(x)
}

///|
/// `null`
pub fn[TA] null_v19(x : @oset.T[TA]) -> Bool raise {
  let f : (@oset.T[TA]) -> Bool raise = is_empty_v16
  f(x)
}

///|
/// `size`
pub fn[TA] size_v18(x : @oset.T[TA]) -> Int64 raise {
  let f : (@oset.T[TA]) -> Int64 raise = cardinal_v16
  f(x)
}

///|
/// `pick`
pub fn[TA] pick_v8(x : @oset.T[TA]) -> TA raise {
  let f : (@oset.T[TA]) -> TA raise = choose_v16
  f(x)
}

///|
/// equal
fn step_122() -> Unit raise {
  equal_v31_c.set(fn(
    x2943 : @oset.T[@oset.T[(Bool, (String, @list.List[Term]))]],
  ) -> ((@oset.T[@oset.T[(Bool, (String, @list.List[Term]))]]) -> Bool raise) raise {
    fn(
      x2944 : @oset.T[@oset.T[(Bool, (String, @list.List[Term]))]],
    ) -> Bool raise {
      equal_v30(x2943, x2944)
    }
  })
}

///|
let equal_v31_c : @lib.Cell[
  (@oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]]) -> ((
    @oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]],
  ) -> Bool raise) raise,
] = @lib.Cell::new("equal")

///|
/// `equal`
pub fn equal_v31(
  x : @oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]],
) -> ((@oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]]) -> Bool raise) raise {
  equal_v31_c.get()(x)
}

///|
/// `exists`
pub fn[TA] exists_v33(
  x : (TA) -> Bool raise,
) -> ((@oset.T[TA]) -> Bool raise) raise {
  let f : ((TA) -> Bool raise) -> ((@oset.T[TA]) -> Bool raise) raise = x2945 => {
    x2946 => exists_v32(x2945, x2946)
  }
  f(x)
}

///|
/// `fromList`
pub fn fromlist_v17(
  x2947 : @list.List[@oset.T[(Bool, (String, @list.List[Term]))]],
) -> @oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]] raise {
  let l = x2947
  @lib.itlist(add_v25, l, empty_v24())
}

///|
/// `delete`
pub fn delete_v16(
  x2948 : @oset.T[@oset.T[(Bool, (String, @list.List[Term]))]],
  x2949 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> @oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]] raise {
  let s = x2948
  let x = x2949
  remove_v20(x, s)
}

///|
/// subset
fn step_123() -> Unit raise {
  subset_v15_c.set(fn(
    x2950 : @oset.T[@oset.T[(Bool, (String, @list.List[Term]))]],
  ) -> ((@oset.T[@oset.T[(Bool, (String, @list.List[Term]))]]) -> Bool raise) raise {
    fn(
      x2951 : @oset.T[@oset.T[(Bool, (String, @list.List[Term]))]],
    ) -> Bool raise {
      subset_v14(x2950, x2951)
    }
  })
}

///|
let subset_v15_c : @lib.Cell[
  (@oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]]) -> ((
    @oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]],
  ) -> Bool raise) raise,
] = @lib.Cell::new("subset")

///|
/// `subset`
pub fn subset_v15(
  x : @oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]],
) -> ((@oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]]) -> Bool raise) raise {
  subset_v15_c.get()(x)
}

///|
/// intersect
fn step_124() -> Unit raise {
  intersect_v8_c.set(fn(
    x2952 : @oset.T[@oset.T[(Bool, (String, @list.List[Term]))]],
  ) -> ((@oset.T[@oset.T[(Bool, (String, @list.List[Term]))]]) -> @oset.T[
    @oset.T[(Bool, (String, @list.List[Term]))],
  ] raise) raise {
    fn(
      x2953 : @oset.T[@oset.T[(Bool, (String, @list.List[Term]))]],
    ) -> @oset.T[@oset.T[(Bool, (String, @list.List[Term]))]] raise {
      inter_v7(x2952, x2953)
    }
  })
}

///|
let intersect_v8_c : @lib.Cell[
  (@oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]]) -> ((
    @oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]],
  ) -> @oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]] raise) raise,
] = @lib.Cell::new("intersect")

///|
/// `intersect`
pub fn intersect_v8(
  x : @oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]],
) -> ((@oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]]) -> @oset.T[
  @oset.T[(Bool, (Name, @list.List[Term]))],
] raise) raise {
  intersect_v8_c.get()(x)
}

///|
/// `intersectList`
pub fn intersectlist_v7(
  x2954 : @list.List[@oset.T[@oset.T[(Bool, (String, @list.List[Term]))]]],
) -> @oset.T[@oset.T[(Bool, (Name, @list.List[Term]))]] raise {
  match x2954 {
    Empty => empty_v24()
    More(s, tail=ss) => @lib.itlist(inter_v7, ss, s)
  }
}

///|
/// `findl`
pub fn[TA] findl_v8(
  x2955 : (TA) -> Bool raise,
  x2956 : @oset.T[TA],
) -> TA? raise {
  let p = x2955
  let s = x2956
  let go : (TA) -> ((TA?) -> TA? raise) raise = fn(
    x2957 : TA,
  ) -> ((TA?) -> TA? raise) raise {
    let x = x2957
    fn(x2958 : TA?) -> TA? raise {
      match x2958 {
        Some(_) as s_1 => s_1
        None => if p(x) { Some(x) } else { None }
      }
    }
  }
  fold_v16(go, s, None)
}

///|
/// `firstl`
pub fn[TA, TB] firstl_v8(
  x2959 : (TB) -> TA? raise,
  x2960 : @oset.T[TB],
) -> TA? raise {
  let f = x2959
  let s = x2960
  let go : (TB) -> ((TA?) -> TA? raise) raise = fn(
    x2961 : TB,
  ) -> ((TA?) -> TA? raise) raise {
    let x = x2961
    fn(x2962 : TA?) -> TA? raise {
      match x2962 {
        Some(_) as s_1 => s_1
        None => f(x)
      }
    }
  }
  fold_v16(go, s, None)
}

///|
/// `transform`
pub fn[TA, TB] transform_v16(
  x2963 : (TB) -> TA raise,
  x2964 : @oset.T[TB],
) -> @list.List[TA] raise {
  let f = x2963
  let s = x2964
  fold_v16(
    fn(x2965 : TB) -> ((@list.List[TA]) -> @list.List[TA] raise) raise {
      let x = x2965
      fn(x2966 : @list.List[TA]) -> @list.List[TA] raise {
        let acc = x2966
        acc.prepend(f(x))
      }
    },
    s,
    @list.List([]),
  )
}

///|
/// `all`
pub fn[TA] all_v8(
  x : (TA) -> Bool raise,
) -> ((@oset.T[TA]) -> Bool raise) raise {
  let f : ((TA) -> Bool raise) -> ((@oset.T[TA]) -> Bool raise) raise = x2967 => {
    x2968 => for_all_v16(x2967, x2968)
  }
  f(x)
}

///|
/// `count`
pub fn[TA] count_v8(
  x2969 : (TA) -> Bool raise,
  x2970 : @oset.T[TA],
) -> Int64 raise {
  let p = x2969
  let s = x2970
  fold_v16(
    fn(x2971 : TA) -> ((Int64) -> Int64 raise) raise {
      let x = x2971
      fn(x2972 : Int64) -> Int64 raise {
        let c = x2972
        if p(x) {
          @lib.add63(c, 1L)
        } else {
          c
        }
      }
    },
    s,
    0L,
  )
}

///|
/// `clause`
pub type Clause = Set6

///|
/// `inferenceType`
#derive(Eq, Debug)
pub(all) enum InferenceType {
  Axiom
  Assume
  Subst
  Factor
  Resolve
  Refl
  Equality
}

///|
pub extend InferenceType with Eq::{not_equal, equal}

///|
pub extend InferenceType with Debug::{to_repr}

///|
pub extend InferenceType with @lib.OCompare::{ocompare}

///|
pub extend InferenceType with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_InferenceType(x : InferenceType) -> Int {
  match x {
    Axiom => 0
    Assume => 1
    Subst => 2
    Factor => 3
    Resolve => 4
    Refl => 5
    Equality => 6
  }
}

///|
pub impl @lib.OCompare for InferenceType with fn ocompare(self, other) {
  match (self, other) {
    _ => ocaml_rank_InferenceType(self).compare(ocaml_rank_InferenceType(other))
  }
}

///|
pub impl @lib.OHash for InferenceType with fn ohash_visit(self, h) {
  match self {
    Axiom => h.int(0L)
    Assume => h.int(1L)
    Subst => h.int(2L)
    Factor => h.int(3L)
    Resolve => h.int(4L)
    Refl => h.int(5L)
    Equality => h.int(6L)
  }
}

///|
/// `thm`
#derive(Eq, Debug)
pub(all) enum Thm {
  Thm(Clause, (InferenceType, @list.List[Thm]))
}

///|
pub extend Thm with Eq::{not_equal, equal}

///|
pub extend Thm with Debug::{to_repr}

///|
pub extend Thm with @lib.OCompare::{ocompare}

///|
pub extend Thm with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_Thm(x : Thm) -> Int {
  match x {
    Thm(_, _) => 1000000
  }
}

///|
pub impl @lib.OCompare for Thm with fn ocompare(self, other) {
  match (self, other) {
    (Thm(a0, a1), Thm(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    _ => ocaml_rank_Thm(self).compare(ocaml_rank_Thm(other))
  }
}

///|
pub impl @lib.OHash for Thm with fn ohash_visit(self, h) {
  match self {
    Thm(a0, a1) => {
      h.block(0, 2)
      h.field(a0)
      h.field(a1)
    }
  }
}

///|
/// `inference`
pub type Inference = (InferenceType, @list.List[Thm])

///|
/// `clause`
pub fn clause(x2973 : Thm) -> Clause raise {
  match x2973 {
    Thm::Thm(cl, _) => cl
  }
}

///|
/// `inference`
pub fn inference(x2974 : Thm) -> (InferenceType, @list.List[Thm]) raise {
  match x2974 {
    Thm::Thm(_, inf) => inf
  }
}

///|
/// `isTautology`
pub fn istautology(x2975 : Thm) -> Bool raise {
  let th = x2975
  let chk : (
    ((Bool, (String, @list.List[Term])), @oset.T[(String, @list.List[Term])]?),
  ) -> @oset.T[(String, @list.List[Term])]? raise = fn(
    x2976 : (
      (Bool, (String, @list.List[Term])),
      @oset.T[(String, @list.List[Term])]?,
    ),
  ) -> @oset.T[(String, @list.List[Term])]? raise {
    match x2976 {
      (_, None) => None
      ((pol, atm), Some(set)) =>
        if (pol && isrefl(atm)) || member_v4(atm)(set) {
          None
        } else {
          Some(add_v16(set, atm))
        }
    }
  }
  let t2977 = clause(th)
  let t2978 = Some(empty_v16())
  match foldl_v16(chk)(t2978)(t2977) {
    Some(_) => false
    None => true
  }
}

///|
/// `isContradiction`
pub fn iscontradiction(x2979 : Thm) -> Bool raise {
  let th = x2979
  null_v17(clause(th))
}

///|
/// `destUnit`
pub fn destunit(x2980 : Thm) -> Elt6 raise {
  match x2980 {
    Thm::Thm(cl, _) =>
      if size_v16(cl) == 1L {
        pick_v7(cl)
      } else {
        raise Failure("Thm.destUnit")
      }
  }
}

///|
/// isUnit
fn step_125() -> Unit raise {
  isunit_c.set((x2981 : Thm) => @lib.can(destunit, x2981))
}

///|
let isunit_c : @lib.Cell[(Thm) -> Bool raise] = @lib.Cell::new("isUnit")

///|
/// `isUnit`
pub fn isunit(x : Thm) -> Bool raise {
  isunit_c.get()(x)
}

///|
/// `destUnitEq`
pub fn destuniteq(x2982 : Thm) -> (Term, Term) raise {
  let th = x2982
  desteq_v2(destunit(th))
}

///|
/// isUnitEq
fn step_126() -> Unit raise {
  isuniteq_c.set((x2983 : Thm) => @lib.can(destuniteq, x2983))
}

///|
let isuniteq_c : @lib.Cell[(Thm) -> Bool raise] = @lib.Cell::new("isUnitEq")

///|
/// `isUnitEq`
pub fn isuniteq(x : Thm) -> Bool raise {
  isuniteq_c.get()(x)
}

///|
/// `member`
pub fn member_v8(
  x2984 : (Bool, (String, @list.List[Term])),
  x2985 : Thm,
) -> Bool raise {
  let lit = x2984
  match x2985 {
    Thm::Thm(cl, _) => member_v6(lit)(cl)
  }
}

///|
/// `negateMember`
pub fn negatemember_v1(
  x2986 : (Bool, (String, @list.List[Term])),
  x2987 : Thm,
) -> Bool raise {
  let lit = x2986
  match x2987 {
    Thm::Thm(cl, _) => negatemember(lit, cl)
  }
}

///|
/// `compare`
pub fn compare_v43(x2988 : Thm, x2989 : Thm) -> Int64 raise {
  let th1 = x2988
  let th2 = x2989
  let t2990 = clause(th2)
  compare_v38(clause(th1))(t2990)
}

///|
/// `equal`
pub fn equal_v32(x2991 : Thm, x2992 : Thm) -> Bool raise {
  let th1 = x2991
  let th2 = x2992
  let t2993 = clause(th2)
  equal_v28(clause(th1))(t2993)
}

///|
/// `freeIn`
pub fn freein_v5(x2994 : String, x2995 : Thm) -> Bool raise {
  let v = x2994
  match x2995 {
    Thm::Thm(cl, _) => freein_v4(v)(cl)
  }
}

///|
/// `freeVars`
pub fn freevars_v6(x2996 : Thm) -> @oset.T[Name] raise {
  match x2996 {
    Thm::Thm(cl, _) => freevars_v5(cl)
  }
}

///|
/// `inferenceTypeToString`
pub fn inferencetypetostring(x2997 : InferenceType) -> String raise {
  match x2997 {
    InferenceType::Axiom => "axiom"
    InferenceType::Assume => "assume"
    InferenceType::Subst => "subst"
    InferenceType::Factor => "factor"
    InferenceType::Resolve => "resolve"
    InferenceType::Refl => "refl"
    InferenceType::Equality => "equality"
  }
}

///|
/// `toString`
pub fn tostring_v8(x2998 : Thm) -> String raise {
  match x2998 {
    Thm::Thm(cl, (inftype, ths)) => {
      let t2999 = ": " + tostring_v7(cl)
      inferencetypetostring(inftype) + t2999
    }
  }
}

///|
/// `print_proof`
pub fn print_proof(x3000 : Thm) -> Unit raise {
  match x3000 {
    Thm::Thm(cl, (inftype, ths)) => {
      @pp.std_formatter.print_string(
        "Inference: " + inferencetypetostring(inftype),
      )
      @pp.std_formatter.print_break(0, 0)
      @pp.std_formatter.print_string("Clauses: " + tostring_v7(cl))
      @pp.std_formatter.print_break(0, 0)
      @pp.std_formatter.print_string("Theorems: ")
      if ths == @list.List([]) {
        @pp.std_formatter.print_string("<none>")
      } else {
        @pp.std_formatter.print_break(0, 0)
        @pp.std_formatter.open_vbox(2)
        @pp.std_formatter.print_break(0, 0)
        @lib.do_list(print_proof, ths)
        @pp.std_formatter.close_box()
      }
      @pp.std_formatter.print_break(0, 0)
    }
  }
}

///|
/// `axiom`
pub fn axiom(x3001 : @oset.T[(Bool, (String, @list.List[Term]))]) -> Thm raise {
  let cl = x3001
  Thm::Thm(cl, (InferenceType::Axiom, @list.List([])))
}

///|
/// `assume`
pub fn assume_(x3002 : (Bool, (String, @list.List[Term]))) -> Thm raise {
  let lit = x3002
  Thm::Thm(
    fromlist_v15(@list.List([lit, negate(lit.0, lit.1)])),
    (InferenceType::Assume, @list.List([])),
  )
}

///|
/// `subst`
pub fn subst_v5(x3003 : Subst, x3004 : Thm) -> Thm raise {
  let sub = x3003
  match x3004 {
    Thm::Thm(cl, inf) as th => {
      let cl_p = subst_v4(sub, cl)
      if physical_equal(cl, cl_p) {
        th
      } else {
        match inf {
          (InferenceType::Subst, _) => Thm::Thm(cl_p, inf)
          _ => Thm::Thm(cl_p, (InferenceType::Subst, @list.List([th])))
        }
      }
    }
  }
}

///|
/// `resolve`
pub fn resolve(
  x3005 : (Bool, (String, @list.List[Term])),
  x3006 : Thm,
) -> ((Thm) -> Thm raise) raise {
  let lit = x3005
  match x3006 {
    Thm::Thm(cl1, _) as th1 =>
      fn(x3007 : Thm) -> Thm raise {
        match x3007 {
          Thm::Thm(cl2, _) as th2 => {
            let cl1_p = delete_v14(cl1, lit)
            let cl2_p = delete_v14(cl2, negate(lit.0, lit.1))
            Thm::Thm(
              union_v30(cl1_p)(cl2_p),
              (InferenceType::Resolve, @list.List([th1, th2])),
            )
          }
        }
      }
  }
}

///|
/// `refl`
pub fn refl(x3008 : Term) -> Thm raise {
  let tm = x3008
  Thm::Thm(
    singleton_v30((true, mkrefl(tm))),
    (InferenceType::Refl, @list.List([])),
  )
}

///|
/// `equality`
pub fn equality(
  x3009 : (Bool, (String, @list.List[Term])),
  x3010 : @list.List[Int64],
  x3011 : Term,
) -> Thm raise {
  let lit = x3009
  let path = x3010
  let t = x3011
  let s = subterm_v2(lit, path)
  let lit_p = replace_v2(lit, (path, t))
  let eqlit = mkneq_v1((s, t))
  let cl = fromlist_v15(@list.List([eqlit, negate(lit.0, lit.1), lit_p]))
  Thm::Thm(cl, (InferenceType::Equality, @list.List([])))
}

///|
/// `inference`
#derive(Eq, Debug)
pub(all) enum Inference1 {
  Axiom(Set6)
  Assume(Atom)
  Subst(Subst, Thm)
  Resolve(Atom, Thm, Thm)
  Refl(Term)
  Equality(Literal, Path, Term)
}

///|
pub extend Inference1 with Eq::{not_equal, equal}

///|
pub extend Inference1 with Debug::{to_repr}

///|
pub extend Inference1 with @lib.OCompare::{ocompare}

///|
pub extend Inference1 with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_Inference1(x : Inference1) -> Int {
  match x {
    Axiom(_) => 1000000
    Assume(_) => 1000001
    Subst(_, _) => 1000002
    Resolve(_, _, _) => 1000003
    Refl(_) => 1000004
    Equality(_, _, _) => 1000005
  }
}

///|
pub impl @lib.OCompare for Inference1 with fn ocompare(self, other) {
  match (self, other) {
    (Axiom(a0), Axiom(b0)) => @lib.compare(a0, b0)
    (Assume(a0), Assume(b0)) => @lib.compare(a0, b0)
    (Subst(a0, a1), Subst(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    (Resolve(a0, a1, a2), Resolve(b0, b1, b2)) => {
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
    (Refl(a0), Refl(b0)) => @lib.compare(a0, b0)
    (Equality(a0, a1, a2), Equality(b0, b1, b2)) => {
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
    _ => ocaml_rank_Inference1(self).compare(ocaml_rank_Inference1(other))
  }
}

///|
pub impl @lib.OHash for Inference1 with fn ohash_visit(self, h) {
  match self {
    Axiom(a0) => {
      h.block(0, 1)
      h.field(a0)
    }
    Assume(a0) => {
      h.block(1, 1)
      h.field(a0)
    }
    Subst(a0, a1) => {
      h.block(2, 2)
      h.field(a0)
      h.field(a1)
    }
    Resolve(a0, a1, a2) => {
      h.block(3, 3)
      h.field(a0)
      h.field(a1)
      h.field(a2)
    }
    Refl(a0) => {
      h.block(4, 1)
      h.field(a0)
    }
    Equality(a0, a1, a2) => {
      h.block(5, 3)
      h.field(a0)
      h.field(a1)
      h.field(a2)
    }
  }
}

///|
/// `proof`
pub type Proof = @list.List[(Thm, Inference1)]

///|
/// `parents`
pub fn parents(x3012 : Inference1) -> @list.List[Thm] raise {
  match x3012 {
    Inference1::Axiom(_) => @list.List([])
    Inference1::Assume(_) => @list.List([])
    Inference1::Subst(_, th) => @list.List([th])
    Inference1::Resolve(_, th_1, th_p) => @list.List([th_1, th_p])
    Inference1::Refl(_) => @list.List([])
    Inference1::Equality(_, _, _) => @list.List([])
  }
}

///|
/// `inferenceToThm`
pub fn inferencetothm(x3013 : Inference1) -> Thm raise {
  match x3013 {
    Inference1::Axiom(cl) => axiom(cl)
    Inference1::Assume(atm) => assume_((true, atm))
    Inference1::Subst(sub, th) => subst_v5(sub, th)
    Inference1::Resolve(atm_1, th_1, th_p) => resolve((true, atm_1), th_1)(th_p)
    Inference1::Refl(tm) => refl(tm)
    Inference1::Equality(lit, path, r) => equality(lit, path, r)
  }
}

///|
/// `reconstructSubst`
pub fn reconstructsubst(
  x3014 : @oset.T[(Bool, (String, @list.List[Term]))],
  x3015 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> Subst raise {
  let cl = x3014
  let cl_p = x3015
  fn recon(
    x3016 : @list.List[(@list.List[(Bool, (String, @list.List[Term]))], Subst)],
  ) -> Subst raise {
    match x3016 {
      Empty => raise Bug::Bug("can't reconstruct Subst rule")
      More((Empty, sub), tail=others) =>
        if equal_v28(subst_v4(sub, cl))(cl_p) {
          sub
        } else {
          recon(others)
        }
      More((More(lit, tail=lits), sub_1), tail=others_1) => {
        let checklit : (
          (
            (Bool, (String, @list.List[Term])),
            @list.List[(@list.List[(Bool, (String, @list.List[Term]))], Subst)],
          ),
        ) -> @list.List[(@list.List[(Bool, (String, @list.List[Term]))], Subst)] raise = fn(
          x3017 : (
            (Bool, (String, @list.List[Term])),
            @list.List[(@list.List[(Bool, (String, @list.List[Term]))], Subst)],
          ),
        ) -> @list.List[(@list.List[(Bool, (String, @list.List[Term]))], Subst)] raise {
          let (lit_p, acc) = x3017
          match
            total(
              (x3018 : (Bool, (String, @list.List[Term]))) => {
                matchliterals(sub_1, lit, x3018)
              },
              lit_p,
            ) {
            None => acc
            Some(sub_2) => acc.prepend((lits, sub_2))
          }
        }
        recon(foldl_v16(checklit)(others_1)(cl_p))
      }
    }
  }
  normalize(recon(@list.List([(tolist_v16(cl), empty_v13())])))
}

///|
/// `reconstructResolvant`
pub fn reconstructresolvant(
  x3019 : @oset.T[(Bool, (String, @list.List[Term]))],
  x3020 : @oset.T[(Bool, (String, @list.List[Term]))],
  x3021 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> Literal raise {
  let cl1 = x3019
  let cl2 = x3020
  let cl = x3021
  if !subset_v13(cl1)(cl) {
    pick_v7(difference_v6(cl1)(cl))
  } else if !subset_v13(cl2)(cl) {
    let t3022 = pick_v7(difference_v6(cl2)(cl))
    negate(t3022.0, t3022.1)
  } else {
    let cl1_p = negate_v1(cl1)
    let cl2_p = negate_v1(cl2)
    let lits = intersectlist_v6(@list.List([cl1, cl1_p, cl2, cl2_p]))
    if !null_v17(lits) {
      pick_v7(lits)
    } else {
      raise Bug::Bug("can't reconstruct Resolve rule")
    }
  }
}

///|
/// `reconstructEquality`
pub fn reconstructequality(
  x3023 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> ((Polarity, Atom), @list.List[Int64], Term) raise {
  let cl = x3023
  fn sync(
    x3024 : Term,
    x3025 : Term,
    x3026 : @list.List[Int64],
    x3027 : (String, @list.List[Term]),
    x3028 : (String, @list.List[Term]),
  ) -> @list.List[Int64]? raise {
    let s = x3024
    let t = x3025
    let path = x3026
    let (f, a) = x3027
    let (f_p, a_p) = x3028
    if !(if equal_v6(f, f_p) {
        let t3029 = Int::to_int64(@lib.length(a_p))
        Int::to_int64(@lib.length(a)) == t3029
      } else {
        false
      }) {
      None
    } else {
      let itms = enumerate(@lib.zip(a, a_p))
      match
        @lib.list_filter(
          fn(x3030 : (Int64, (Term, Term))) -> Bool raise {
            let x = x3030
            !@lib.uncurry(equal_v14, x.1)
          },
          itms,
        ) {
        More((i, (tm, tm_p)), tail=Empty) => {
          let path_1 = path.prepend(i)
          if equal_v14(tm, s) && equal_v14(tm_p, t) {
            Some(@lib.rev(path_1))
          } else {
            match (tm, tm_p) {
              (Term::Fn(f_a), Term::Fn(f_a_p)) => sync(s, t, path_1, f_a, f_a_p)
              _ => None
            }
          }
        }
        _ => None
      }
    }
  }
  let candidates = match @lib.list_partition(isneq_v1, tolist_v16(cl)) {
    (More(l1, tail=Empty), More(l2, tail=More(l3, tail=Empty))) =>
      @list.List([(l1, l2, l3), (l1, l3, l2)])
    (More(l1_1, tail=More(l2_1, tail=Empty)), More(l3_1, tail=Empty)) =>
      @list.List([
        (l1_1, l2_1, l3_1),
        (l1_1, l3_1, l2_1),
        (l2_1, l1_1, l3_1),
        (l2_1, l3_1, l1_1),
      ])
    (More(l1_2, tail=Empty), More(l2_2, tail=Empty)) =>
      @list.List([(l1_2, l1_2, l2_2), (l1_2, l2_2, l1_2)])
    _ => raise Bug::Bug("reconstructEquality: malformed")
  }
  match
    first(
      fn(
        x3035 : (
          (Bool, (String, @list.List[Term])),
          (Bool, (String, @list.List[Term])),
          (Bool, (String, @list.List[Term])),
        ),
      ) -> ((Bool, (String, @list.List[Term])), @list.List[Int64], Term)? raise {
        ((x3031, x3032, x3033) => recon_l(sync, x3031, x3032, x3033))(
          x3035.0,
          x3035.1,
          x3035.2,
        )
      },
      candidates,
    ) {
    Some(info) => info
    None => raise Bug::Bug("can't reconstruct Equality rule")
  }
}

///|
fn[TA : Eq + @lib.OCompare + @lib.OHash] recon_l(
  sync : (
    Term,
    Term,
    @list.List[Int64],
    (String, @list.List[Term]),
    (String, @list.List[Term]),
  ) -> @list.List[Int64]? raise,
  x3031 : (Bool, (String, @list.List[Term])),
  x3032 : (TA, (String, @list.List[Term])),
  x3033 : (TA, (String, @list.List[Term])),
) -> ((TA, (Name, @list.List[Term])), @list.List[Int64], Term)? raise {
  let (neq, (pol, atm), (pol_p, atm_p)) = (x3031, x3032, x3033)
  if pol == pol_p {
    None
  } else {
    let (s_1, t_1) = destneq_v1(neq)
    let path_2 = if !equal_v14(s_1, t_1) {
      sync(s_1, t_1, @list.List([]), atm, atm_p)
    } else if !equal_v17(atm, atm_p) {
      None
    } else {
      find_v11((x3034 : Term) => equal_v14(s_1, x3034))(atm)
    }
    match path_2 {
      Some(path_3) => Some(((pol_p, atm), path_3, t_1))
      None => None
    }
  }
}

///|
/// `reconstruct`
pub fn reconstruct(
  x3036 : @oset.T[(Bool, (String, @list.List[Term]))],
  x3037 : (InferenceType, @list.List[Thm]),
) -> Inference1 raise {
  let cl = x3036
  match x3037 {
    (InferenceType::Axiom, Empty) => Inference1::Axiom(cl)
    (InferenceType::Assume, Empty) =>
      match findl_v7(positive, cl) {
        Some((_, atm)) => Inference1::Assume(atm)
        None => raise Bug::Bug("malformed Assume inference")
      }
    (InferenceType::Subst, More(th, tail=Empty)) =>
      Inference1::Subst(reconstructsubst(clause(th), cl), th)
    (InferenceType::Resolve, More(th1, tail=More(th2, tail=Empty))) => {
      let cl1 = clause(th1)
      let cl2 = clause(th2)
      let (pol, atm_1) = reconstructresolvant(cl1, cl2, cl)
      if pol {
        Inference1::Resolve(atm_1, th1, th2)
      } else {
        Inference1::Resolve(atm_1, th2, th1)
      }
    }
    (InferenceType::Refl, Empty) =>
      match
        findl_v7(
          fn(x3038 : (Bool, (String, @list.List[Term]))) -> Bool raise { true },
          cl,
        ) {
        Some(lit) => Inference1::Refl(destrefl_v2(lit))
        None => raise Bug::Bug("malformed Refl inference")
      }
    (InferenceType::Equality, Empty) => {
      let (x, y, z) = reconstructequality(cl)
      Inference1::Equality(x, y, z)
    }
    _ => raise Bug::Bug("malformed inference")
  }
}

///|
/// `thmToInference`
pub fn thmtoinference(x3039 : Thm) -> Inference1 raise {
  let th = x3039
  let cl = clause(th)
  let thminf = inference(th)
  let inf = reconstruct(cl, thminf)
  inf
}

///|
/// `proof`
pub fn proof(x3040 : Thm) -> @list.List[(Thm, Inference1)] raise {
  let th = x3040
  let emptythms = newmap_v8(())
  fn addthms(
    x3041 : Thm,
    x3042 : @omap.T[@oset.T[(Bool, (String, @list.List[Term]))], Thm],
  ) -> @omap.T[Clause, Thm] raise {
    let (th_1, ths) = (x3041, x3042)
    let cl = clause(th_1)
    if indomain_v8(cl)(ths) {
      ths
    } else {
      let (_, pars) = inference(th_1)
      let ths_1 = foldl(
        fn(
          x3043 : (
            Thm,
            @omap.T[@oset.T[(Bool, (String, @list.List[Term]))], Thm],
          ),
        ) -> @omap.T[@oset.T[(Bool, (String, @list.List[Term]))], Thm] raise {
          addthms(x3043.0, x3043.1)
        },
        ths,
        pars,
      )
      if indomain_v8(cl)(ths_1) {
        ths_1
      } else {
        insert_v9(ths_1, (cl, th_1))
      }
    }
  }
  let mkthms : (Thm) -> @omap.T[
    @oset.T[(Bool, (String, @list.List[Term]))],
    Thm,
  ] raise = fn(
    x3044 : Thm,
  ) -> @omap.T[@oset.T[(Bool, (String, @list.List[Term]))], Thm] raise {
    let th_2 = x3044
    addthms(th_2, emptythms)
  }
  fn addproof(
    x3045 : Thm,
    x3046 : (
      @omap.T[@oset.T[(Bool, (String, @list.List[Term]))], Thm],
      @list.List[(Thm, Inference1)],
    ),
  ) -> (
    @omap.T[@oset.T[(Bool, (Name, @list.List[Term]))], Thm],
    @list.List[(Thm, Inference1)],
  ) raise {
    let (th_3, (ths_2, acc)) = (x3045, x3046)
    let cl_1 = clause(th_3)
    match peek_v10(ths_2, cl_1) {
      None => (ths_2, acc)
      Some(th_4) => {
        let (_, pars_1) = inference(th_4)
        let (ths_3, acc_1) = foldl(
          fn(
            x3047 : (
              Thm,
              (
                @omap.T[@oset.T[(Bool, (String, @list.List[Term]))], Thm],
                @list.List[(Thm, Inference1)],
              ),
            ),
          ) -> (
            @omap.T[@oset.T[(Bool, (String, @list.List[Term]))], Thm],
            @list.List[(Thm, Inference1)],
          ) raise {
            addproof(x3047.0, x3047.1)
          },
          (ths_2, acc),
          pars_1,
        )
        let ths_4 = delete_v15(ths_3, cl_1)
        let acc_2 = acc_1.prepend((th_4, thmtoinference(th_4)))
        (ths_4, acc_2)
      }
    }
  }
  let mkproof : (@omap.T[@oset.T[(Bool, (String, @list.List[Term]))], Thm]) -> ((
    Thm,
  ) -> @list.List[(Thm, Inference1)] raise) raise = fn(
    x3048 : @omap.T[@oset.T[(Bool, (String, @list.List[Term]))], Thm],
  ) -> ((Thm) -> @list.List[(Thm, Inference1)] raise) raise {
    let ths_5 = x3048
    fn(x3049 : Thm) -> @list.List[(Thm, Inference1)] raise {
      let th_5 = x3049
      let (ths_6, acc_3) = addproof(th_5, (ths_5, @list.List([])))
      @lib.rev(acc_3)
    }
  }
  let ths_7 = mkthms(th)
  let infs = mkproof(ths_7)(th)
  infs
}

///|
/// `freeIn`
pub fn freein_v6(
  x3050 : String,
) -> ((@list.List[(Thm, Inference1)]) -> Bool raise) raise {
  let v = x3050
  let free : ((Thm, Inference1)) -> Bool raise = fn(
    x3052 : (Thm, Inference1),
  ) -> Bool raise {
    let th_inf = x3052
    match th_inf {
      (_, Inference1::Axiom(lits)) => freein_v4(v)(lits)
      (_, Inference1::Assume(atm)) => freein_v1(v, atm)
      (th, Inference1::Subst(_, _)) => freein_v5(v, th)
      (_, Inference1::Resolve(_, _, _)) => false
      (_, Inference1::Refl(tm)) => freein(v, tm)
      (_, Inference1::Equality(lit, _, tm_1)) =>
        freein_v3(v, lit) || freein(v, tm_1)
    }
  }
  x3053 => @lib.exists(free, x3053)
}

///|
/// freeVars
fn step_127() -> Unit raise {
  let inc : (((Thm, Inference1), @oset.T[String])) -> @oset.T[String] raise = fn(
    x3054 : ((Thm, Inference1), @oset.T[String]),
  ) -> @oset.T[String] raise {
    let (th_inf, set) = x3054
    let t3056 = match th_inf {
      (_, Inference1::Axiom(lits)) => freevars_v5(lits)
      (_, Inference1::Assume(atm)) => freevars_v2(atm)
      (th, Inference1::Subst(_, _)) => freevars_v6(th)
      (_, Inference1::Resolve(_, _, _)) => empty_v7()
      (_, Inference1::Refl(tm)) => freevars(tm)
      (_, Inference1::Equality(lit, _, tm_1)) => {
        let t3055 = freevars(tm_1)
        union_v11(freevars_v4(lit))(t3055)
      }
    }
    union_v11(set)(t3056)
  }
  freevars_v7_c.set((x3057 : @list.List[(Thm, Inference1)]) => {
    foldl(inc, empty_v7(), x3057)
  })
}

///|
let freevars_v7_c : @lib.Cell[
  (@list.List[(Thm, Inference1)]) -> @oset.T[Name] raise,
] = @lib.Cell::new("freeVars")

///|
/// `freeVars`
pub fn freevars_v7(x : @list.List[(Thm, Inference1)]) -> @oset.T[Name] raise {
  freevars_v7_c.get()(x)
}

///|
/// xVarName
fn step_128() -> Unit raise {
  xvarname_c.set(fromstring("x"))
}

///|
let xvarname_c : @lib.Cell[Name] = @lib.Cell::new("xVarName")

///|
/// `xVarName`
pub fn xvarname() -> Name {
  xvarname_c.get()
}

///|
/// xVar
fn step_129() -> Unit raise {
  xvar_c.set(Term::Var(xvarname()))
}

///|
let xvar_c : @lib.Cell[Term] = @lib.Cell::new("xVar")

///|
/// `xVar`
pub fn xvar() -> Term {
  xvar_c.get()
}

///|
/// yVarName
fn step_130() -> Unit raise {
  yvarname_c.set(fromstring("y"))
}

///|
let yvarname_c : @lib.Cell[Name] = @lib.Cell::new("yVarName")

///|
/// `yVarName`
pub fn yvarname() -> Name {
  yvarname_c.get()
}

///|
/// yVar
fn step_131() -> Unit raise {
  yvar_c.set(Term::Var(yvarname()))
}

///|
let yvar_c : @lib.Cell[Term] = @lib.Cell::new("yVar")

///|
/// `yVar`
pub fn yvar() -> Term {
  yvar_c.get()
}

///|
/// zVarName
fn step_132() -> Unit raise {
  zvarname_c.set(fromstring("z"))
}

///|
let zvarname_c : @lib.Cell[Name] = @lib.Cell::new("zVarName")

///|
/// `zVarName`
pub fn zvarname() -> Name {
  zvarname_c.get()
}

///|
/// zVar
fn step_133() -> Unit raise {
  zvar_c.set(Term::Var(zvarname()))
}

///|
let zvar_c : @lib.Cell[Term] = @lib.Cell::new("zVar")

///|
/// `zVar`
pub fn zvar() -> Term {
  zvar_c.get()
}

///|
/// `xIVarName`
pub fn xivarname(x3058 : Int64) -> Name raise {
  let i = x3058
  fromstring("x" + Int64::to_string(i))
}

///|
/// `xIVar`
pub fn xivar(x3059 : Int64) -> Term raise {
  let i = x3059
  Term::Var(xivarname(i))
}

///|
/// `yIVarName`
pub fn yivarname(x3060 : Int64) -> Name raise {
  let i = x3060
  fromstring("y" + Int64::to_string(i))
}

///|
/// `yIVar`
pub fn yivar(x3061 : Int64) -> Term raise {
  let i = x3061
  Term::Var(yivarname(i))
}

///|
/// `reflexivityRule`
pub fn reflexivityrule(x3062 : Term) -> Thm raise {
  let x = x3062
  refl(x)
}

///|
/// reflexivity
fn step_134() -> Unit raise {
  reflexivity_c.set(reflexivityrule(xvar()))
}

///|
let reflexivity_c : @lib.Cell[Thm] = @lib.Cell::new("reflexivity")

///|
/// `reflexivity`
pub fn reflexivity() -> Thm {
  reflexivity_c.get()
}

///|
/// `symmetryRule`
pub fn symmetryrule(x3063 : Term, x3064 : Term) -> Thm raise {
  let x = x3063
  let y = x3064
  let reflth = reflexivityrule(x)
  let refllit = destunit(reflth)
  let eqth = equality(refllit, @list.List([0L]), y)
  resolve(refllit, reflth)(eqth)
}

///|
/// symmetry
fn step_135() -> Unit raise {
  symmetry_c.set(symmetryrule(xvar(), yvar()))
}

///|
let symmetry_c : @lib.Cell[Thm] = @lib.Cell::new("symmetry")

///|
/// `symmetry`
pub fn symmetry() -> Thm {
  symmetry_c.get()
}

///|
/// transitivity
fn step_136() -> Unit raise {
  let eqth = equality(mkeq_v2((yvar(), zvar())), @list.List([0L]), xvar())
  transitivity_c.set(resolve(mkeq_v2((yvar(), xvar())), symmetry())(eqth))
}

///|
let transitivity_c : @lib.Cell[Thm] = @lib.Cell::new("transitivity")

///|
/// `transitivity`
pub fn transitivity() -> Thm {
  transitivity_c.get()
}

///|
/// `symEq`
pub fn symeq(
  x3065 : (Bool, (String, @list.List[Term])),
  x3066 : Thm,
) -> Thm raise {
  let lit = x3065
  let th = x3066
  let (x, y) = desteq_v2(lit)
  if equal_v14(x, y) {
    th
  } else {
    let sub = fromlist_v9(@list.List([(xvarname(), x), (yvarname(), y)]))
    let symth = subst_v5(sub, symmetry())
    resolve(lit, th)(symth)
  }
}

///|
/// `equation`
pub type Equation = ((Term, Term), Thm)

///|
/// `equationLiteral`
pub fn equationliteral(x3067 : (Term, Term), x3068 : Thm) -> Literal? raise {
  let (t_u, th) = (x3067, x3068)
  let lit = mkeq_v2(t_u)
  let t3069 = clause(th)
  if member_v6(lit)(t3069) {
    Some(lit)
  } else {
    None
  }
}

///|
/// `reflEqn`
pub fn refleqn(x3070 : Term) -> ((Term, Term), Thm) raise {
  let t = x3070
  ((t, t), refl(t))
}

///|
/// `symEqn`
pub fn symeqn(x3071 : ((Term, Term), Thm)) -> ((Term, Term), Thm) raise {
  let ((t, u), th) as eqn = x3071
  if equal_v14(t, u) {
    eqn
  } else {
    (
      (u, t),
      match equationliteral(eqn.0, eqn.1) {
        Some(t_u) => symeq(t_u, th)
        None => th
      },
    )
  }
}

///|
/// `transEqn`
pub fn transeqn(
  x3072 : ((Term, Term), Thm),
  x3073 : ((Term, Term), Thm),
) -> ((Term, Term), Thm) raise {
  let ((x, y), th1) as eqn1 = x3072
  let ((_, z), th2) as eqn2 = x3073
  if equal_v14(x, y) {
    eqn2
  } else if equal_v14(y, z) {
    eqn1
  } else if equal_v14(x, z) {
    refleqn(x)
  } else {
    (
      (x, z),
      match equationliteral(eqn1.0, eqn1.1) {
        None => th1
        Some(x_y) =>
          match equationliteral(eqn2.0, eqn2.1) {
            None => th2
            Some(y_z) => {
              let sub = fromlist_v9(
                @list.List([(xvarname(), x), (yvarname(), y), (zvarname(), z)]),
              )
              let th = subst_v5(sub, transitivity())
              let th_1 = resolve(x_y, th1)(th)
              let th_2 = resolve(y_z, th2)(th_1)
              th_2
            }
          }
      },
    )
  }
}

///|
/// `conv`
pub type Conv = (Term) -> (Term, Thm) raise

///|
/// `allConv`
pub fn allconv(x3074 : Term) -> (Term, Thm) raise {
  let tm = x3074
  (tm, refl(tm))
}

///|
/// `noConv`
pub fn noconv(x3075 : Term) -> (Term, Thm) raise {
  raise Failure("noConv")
}

///|
/// `thenConvTrans`
pub fn thenconvtrans(
  x3076 : Term,
  x3077 : (Term, Thm),
  x3078 : (Term, Thm),
) -> (Term, Thm) raise {
  let tm = x3076
  let (tm_p, th1) = x3077
  let (tm_p_p, th2) = x3078
  let eqn1 = ((tm, tm_p), th1)
  let eqn2 = ((tm_p, tm_p_p), th2)
  let (_, th) = transeqn(eqn1, eqn2)
  (tm_p_p, th)
}

///|
/// `thenConv`
pub fn thenconv(
  x3079 : (Term) -> (Term, Thm) raise,
  x3080 : (Term) -> (Term, Thm) raise,
  x3081 : Term,
) -> (Term, Thm) raise {
  let conv1 = x3079
  let conv2 = x3080
  let tm = x3081
  let (tm_p, _) as res1 = conv1(tm)
  let res2 = conv2(tm_p)
  thenconvtrans(tm, res1, res2)
}

///|
/// `orelseConv`
pub fn orelseconv(
  x3082 : (Term) -> (Term, Thm) raise,
  x3083 : (Term) -> (Term, Thm) raise,
  x3084 : Term,
) -> (Term, Thm) raise {
  let _ as conv1 = x3082
  let conv2 = x3083
  let tm = x3084
  conv1(tm) catch {
    Failure(_) => conv2(tm)
    e => raise e
  }
}

///|
/// `tryConv`
pub fn tryconv(
  x3085 : (Term) -> (Term, Thm) raise,
) -> ((Term) -> (Term, Thm) raise) raise {
  let conv = x3085
  (x3087 : Term) => orelseconv(conv, allconv, x3087)
}

///|
/// `changedConv`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB] changedconv(
  x3088 : (TA) -> (TA, TB) raise,
  x3089 : TA,
) -> (TA, TB) raise {
  let conv = x3088
  let tm = x3089
  let (tm_p, _) as res = conv(tm)
  if tm == tm_p {
    raise Failure("changedConv")
  } else {
    res
  }
}

///|
/// `repeatConv`
pub fn repeatconv(
  x3090 : (Term) -> (Term, Thm) raise,
  x3091 : Term,
) -> (Term, Thm) raise {
  let conv = x3090
  let tm = x3091
  tryconv((x3093 : Term) => {
    thenconv(conv, (x3092 : Term) => repeatconv(conv, x3092), x3093)
  })(tm)
}

///|
/// `flip`
pub fn[TA, TB, TC] flip(
  x3094 : (TC) -> ((TB) -> TA raise) raise,
  x3095 : TB,
  x3096 : TC,
) -> TA raise {
  let f = x3094
  let x = x3095
  let y = x3096
  f(y)(x)
}

///|
/// `firstConv`
pub fn firstconv(
  x3097 : Term,
  x3098 : @list.List[(Term) -> (Term, Thm) raise],
) -> (Term, Thm) raise {
  let tm = x3097
  match x3098 {
    Empty => raise Failure("firstConv")
    More(conv, tail=Empty) => conv(tm)
    More(conv_1, tail=convs) =>
      orelseconv(
        conv_1,
        (x3101 : Term) => {
          flip(
            fn(
              x3099 : Term,
            ) -> ((@list.List[(Term) -> (Term, Thm) raise]) -> (Term, Thm) raise) raise {
              fn(
                x3100 : @list.List[(Term) -> (Term, Thm) raise],
              ) -> (Term, Thm) raise {
                firstconv(x3099, x3100)
              }
            },
            convs,
            x3101,
          )
        },
        tm,
      )
  }
}

///|
/// `firstConv`
pub fn firstconv_v1(
  x3102 : @list.List[(Term) -> (Term, Thm) raise],
  x3103 : Term,
) -> (Term, Thm) raise {
  let convs = x3102
  let tm = x3103
  firstconv(tm, convs)
}

///|
/// `everyConv`
pub fn everyconv(
  x3104 : Term,
  x3105 : @list.List[(Term) -> (Term, Thm) raise],
) -> (Term, Thm) raise {
  let tm = x3104
  match x3105 {
    Empty => allconv(tm)
    More(conv, tail=Empty) => conv(tm)
    More(conv_1, tail=convs) =>
      thenconv(
        conv_1,
        (x3108 : Term) => {
          flip(
            fn(
              x3106 : Term,
            ) -> ((@list.List[(Term) -> (Term, Thm) raise]) -> (Term, Thm) raise) raise {
              fn(
                x3107 : @list.List[(Term) -> (Term, Thm) raise],
              ) -> (Term, Thm) raise {
                everyconv(x3106, x3107)
              }
            },
            convs,
            x3108,
          )
        },
        tm,
      )
  }
}

///|
/// `everyConv`
pub fn everyconv_v1(
  x3109 : @list.List[(Term) -> (Term, Thm) raise],
  x3110 : Term,
) -> (Term, Thm) raise {
  let convs = x3109
  let tm = x3110
  everyconv(tm, convs)
}

///|
/// `rewrConv`
pub fn rewrconv(
  x3111 : ((Term, Term), Thm),
  x3112 : @list.List[Int64],
  x3113 : Term,
) -> (Term, Thm) raise {
  let ((x, y), eqth) as eqn = x3111
  let path = x3112
  let tm = x3113
  if equal_v14(x, y) {
    allconv(tm)
  } else if null(path) {
    (y, eqth)
  } else {
    let reflth = refl(tm)
    let refllit = destunit(reflth)
    let th = equality(refllit, path.prepend(1L), y)
    let th_1 = resolve(refllit, reflth)(th)
    let th_2 = match equationliteral(eqn.0, eqn.1) {
      None => th_1
      Some(x_y) => resolve(x_y, eqth)(th_1)
    }
    let tm_p = replace(tm, (path, y))
    (tm_p, th_2)
  }
}

///|
/// `pathConv`
pub fn pathconv(
  x3114 : (Term) -> (Term, Thm) raise,
  x3115 : @list.List[Int64],
  x3116 : Term,
) -> (Term, Thm) raise {
  let conv = x3114
  let path = x3115
  let tm = x3116
  let x = subterm(tm, path)
  let (y, th) = conv(x)
  rewrconv(((x, y), th), path, tm)
}

///|
/// `subtermConv`
pub fn subtermconv(
  x3117 : (Term) -> (Term, Thm) raise,
  x3118 : Int64,
) -> ((Term) -> (Term, Thm) raise) raise {
  let conv = x3117
  let i = x3118
  (x3120 : Term) => pathconv(conv, @list.List([i]), x3120)
}

///|
/// `subtermsConv`
pub fn subtermsconv(
  x3121 : (Term) -> (Term, Thm) raise,
  x3122 : Term,
) -> (Term, Thm) raise {
  let conv = x3121
  match x3122 {
    Term::Var(_) as tm => allconv(tm)
    Term::Fn((_, a)) as tm_1 =>
      everyconv_v1(
        @lib.map(
          (x3123 : Int64) => subtermconv(conv, x3123),
          interval(0L, Int::to_int64(@lib.length(a))),
        ),
        tm_1,
      )
  }
}

///|
/// `bottomUpConv`
pub fn bottomupconv(
  x3124 : (Term) -> (Term, Thm) raise,
  x3125 : Term,
) -> (Term, Thm) raise {
  let conv = x3124
  let tm = x3125
  thenconv(
    (x3127 : Term) => {
      subtermsconv((x3126 : Term) => bottomupconv(conv, x3126), x3127)
    },
    (x3128 : Term) => repeatconv(conv, x3128),
    tm,
  )
}

///|
/// `topDownConv`
pub fn topdownconv(
  x3129 : (Term) -> (Term, Thm) raise,
  x3130 : Term,
) -> (Term, Thm) raise {
  let conv = x3129
  let tm = x3130
  thenconv(
    (x3131 : Term) => repeatconv(conv, x3131),
    (x3133 : Term) => {
      subtermsconv((x3132 : Term) => topdownconv(conv, x3132), x3133)
    },
    tm,
  )
}

///|
/// `repeatTopDownConv`
pub fn repeattopdownconv(
  x3134 : (Term) -> (Term, Thm) raise,
) -> ((Term) -> (Term, Thm) raise) raise {
  let conv = x3134
  let f = (x3136 : Term) => f_l_2(conv, x3136)
  let g = (x3138 : Term) => g_l(conv, x3138)
  let h = (x3140 : Term) => h_l(conv, x3140)
  f
}

///|
fn f_l_2(conv : (Term) -> (Term, Thm) raise, x3136 : Term) -> (Term, Thm) raise {
  let g = (x3138 : Term) => g_l(conv, x3138)
  let tm = x3136
  thenconv((x3137 : Term) => repeatconv(conv, x3137), g, tm)
}

///|
fn g_l(conv : (Term) -> (Term, Thm) raise, x3138 : Term) -> (Term, Thm) raise {
  let f = (x3136 : Term) => f_l_2(conv, x3136)
  let h = (x3140 : Term) => h_l(conv, x3140)
  let tm_1 = x3138
  thenconv((x3139 : Term) => subtermsconv(f, x3139), h, tm_1)
}

///|
fn h_l(conv : (Term) -> (Term, Thm) raise, x3140 : Term) -> (Term, Thm) raise {
  let f = (x3136 : Term) => f_l_2(conv, x3136)
  let tm_2 = x3140
  tryconv((x3141 : Term) => thenconv(conv, f, x3141))(tm_2)
}

///|
/// `literule`
pub type Literule = (Literal) -> (Literal, Thm) raise

///|
/// `allLiterule`
pub fn allliterule(
  x3142 : (Bool, (String, @list.List[Term])),
) -> (Literal, Thm) raise {
  let lit = x3142
  (lit, assume_(lit))
}

///|
/// `noLiterule`
pub fn noliterule(
  x3143 : (Bool, (String, @list.List[Term])),
) -> (Literal, Thm) raise {
  raise Failure("noLiterule")
}

///|
/// `thenLiterule`
pub fn thenliterule(
  x3144 : ((Bool, (String, @list.List[Term]))) -> (
    (Bool, (String, @list.List[Term])),
    Thm,
  ) raise,
  x3145 : ((Bool, (String, @list.List[Term]))) -> (
    (Bool, (String, @list.List[Term])),
    Thm,
  ) raise,
  x3146 : (Bool, (String, @list.List[Term])),
) -> (Literal, Thm) raise {
  let literule1 = x3144
  let literule2 = x3145
  let lit = x3146
  let (lit_p, th1) as res1 = literule1(lit)
  let (lit_p_p, th2) as res2 = literule2(lit_p)
  if equal_v25(lit, lit_p) {
    res2
  } else if equal_v25(lit_p, lit_p_p) {
    res1
  } else if equal_v25(lit, lit_p_p) {
    allliterule(lit)
  } else {
    (
      lit_p_p,
      if !member_v8(lit_p, th1) {
        th1
      } else if !negatemember_v1(lit_p, th2) {
        th2
      } else {
        resolve(lit_p, th1)(th2)
      },
    )
  }
}

///|
/// `orelseLiterule`
pub fn orelseliterule(
  x3147 : ((Bool, (String, @list.List[Term]))) -> (
    (Bool, (String, @list.List[Term])),
    Thm,
  ) raise,
  x3148 : ((Bool, (String, @list.List[Term]))) -> (
    (Bool, (String, @list.List[Term])),
    Thm,
  ) raise,
  x3149 : (Bool, (String, @list.List[Term])),
) -> (Literal, Thm) raise {
  let _ as literule1 = x3147
  let literule2 = x3148
  let lit = x3149
  literule1(lit) catch {
    Failure(_) => literule2(lit)
    e => raise e
  }
}

///|
/// `tryLiterule`
pub fn tryliterule(
  x3150 : ((Bool, (String, @list.List[Term]))) -> (
    (Bool, (String, @list.List[Term])),
    Thm,
  ) raise,
) -> ((Literal) -> (Literal, Thm) raise) raise {
  let literule = x3150
  (x3152 : (Bool, (String, @list.List[Term]))) => {
    orelseliterule(literule, allliterule, x3152)
  }
}

///|
/// `changedLiterule`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB] changedliterule(
  x3153 : (TA) -> (TA, TB) raise,
  x3154 : TA,
) -> (TA, TB) raise {
  let literule = x3153
  let lit = x3154
  let (lit_p, _) as res = literule(lit)
  if lit == lit_p {
    raise Failure("changedLiterule")
  } else {
    res
  }
}

///|
/// `repeatLiterule`
pub fn repeatliterule(
  x3155 : ((Bool, (String, @list.List[Term]))) -> (
    (Bool, (String, @list.List[Term])),
    Thm,
  ) raise,
  x3156 : (Bool, (String, @list.List[Term])),
) -> (Literal, Thm) raise {
  let literule = x3155
  let lit = x3156
  tryliterule((x3158 : (Bool, (String, @list.List[Term]))) => {
    thenliterule(
      literule,
      (x3157 : (Bool, (String, @list.List[Term]))) => {
        repeatliterule(literule, x3157)
      },
      x3158,
    )
  })(lit)
}

///|
/// `firstLiterule`
pub fn firstliterule(
  x3159 : (Bool, (String, @list.List[Term])),
  x3160 : @list.List[
    ((Bool, (String, @list.List[Term]))) -> (
      (Bool, (String, @list.List[Term])),
      Thm,
    ) raise,
  ],
) -> (Literal, Thm) raise {
  let lit = x3159
  match x3160 {
    Empty => raise Failure("firstLiterule")
    More(literule, tail=Empty) => literule(lit)
    More(literule_1, tail=literules) =>
      orelseliterule(
        literule_1,
        (x3163 : (Bool, (String, @list.List[Term]))) => {
          flip(
            fn(
              x3161 : (Bool, (String, @list.List[Term])),
            ) -> ((
              @list.List[
                ((Bool, (String, @list.List[Term]))) -> (
                  (Bool, (String, @list.List[Term])),
                  Thm,
                ) raise,
              ],
            ) -> ((Bool, (String, @list.List[Term])), Thm) raise) raise {
              fn(
                x3162 : @list.List[
                  ((Bool, (String, @list.List[Term]))) -> (
                    (Bool, (String, @list.List[Term])),
                    Thm,
                  ) raise,
                ],
              ) -> ((Bool, (String, @list.List[Term])), Thm) raise {
                firstliterule(x3161, x3162)
              }
            },
            literules,
            x3163,
          )
        },
        lit,
      )
  }
}

///|
/// `firstLiterule`
pub fn firstliterule_v1(
  x3164 : @list.List[
    ((Bool, (String, @list.List[Term]))) -> (
      (Bool, (String, @list.List[Term])),
      Thm,
    ) raise,
  ],
  x3165 : (Bool, (String, @list.List[Term])),
) -> (Literal, Thm) raise {
  let literules = x3164
  let lit = x3165
  firstliterule(lit, literules)
}

///|
/// `everyLiterule`
pub fn everyliterule(
  x3166 : (Bool, (String, @list.List[Term])),
  x3167 : @list.List[
    ((Bool, (String, @list.List[Term]))) -> (
      (Bool, (String, @list.List[Term])),
      Thm,
    ) raise,
  ],
) -> (Literal, Thm) raise {
  let lit = x3166
  match x3167 {
    Empty => allliterule(lit)
    More(literule, tail=Empty) => literule(lit)
    More(literule_1, tail=literules) =>
      thenliterule(
        literule_1,
        (x3170 : (Bool, (String, @list.List[Term]))) => {
          flip(
            fn(
              x3168 : (Bool, (String, @list.List[Term])),
            ) -> ((
              @list.List[
                ((Bool, (String, @list.List[Term]))) -> (
                  (Bool, (String, @list.List[Term])),
                  Thm,
                ) raise,
              ],
            ) -> ((Bool, (String, @list.List[Term])), Thm) raise) raise {
              fn(
                x3169 : @list.List[
                  ((Bool, (String, @list.List[Term]))) -> (
                    (Bool, (String, @list.List[Term])),
                    Thm,
                  ) raise,
                ],
              ) -> ((Bool, (String, @list.List[Term])), Thm) raise {
                everyliterule(x3168, x3169)
              }
            },
            literules,
            x3170,
          )
        },
        lit,
      )
  }
}

///|
/// `everyLiterule`
pub fn everyliterule_v1(
  x3171 : @list.List[
    ((Bool, (String, @list.List[Term]))) -> (
      (Bool, (String, @list.List[Term])),
      Thm,
    ) raise,
  ],
  x3172 : (Bool, (String, @list.List[Term])),
) -> (Literal, Thm) raise {
  let literules = x3171
  let lit = x3172
  everyliterule(lit, literules)
}

///|
/// `rewrLiterule`
pub fn rewrliterule(
  x3173 : ((Term, Term), Thm),
  x3174 : @list.List[Int64],
  x3175 : (Bool, (String, @list.List[Term])),
) -> (Literal, Thm) raise {
  let ((x, y), eqth) as eqn = x3173
  let path = x3174
  let lit = x3175
  if equal_v14(x, y) {
    allliterule(lit)
  } else {
    let th = equality(lit, path, y)
    let th_1 = match equationliteral(eqn.0, eqn.1) {
      None => th
      Some(x_y) => resolve(x_y, eqth)(th)
    }
    let lit_p = replace_v2(lit, (path, y))
    (lit_p, th_1)
  }
}

///|
/// `pathLiterule`
pub fn pathliterule(
  x3176 : (Term) -> (Term, Thm) raise,
  x3177 : @list.List[Int64],
  x3178 : (Bool, (String, @list.List[Term])),
) -> (Literal, Thm) raise {
  let conv = x3176
  let path = x3177
  let lit = x3178
  let tm = subterm_v2(lit, path)
  let (tm_p, th) = conv(tm)
  rewrliterule(((tm, tm_p), th), path, lit)
}

///|
/// `argumentLiterule`
pub fn argumentliterule(
  x3179 : (Term) -> (Term, Thm) raise,
  x3180 : Int64,
) -> ((Literal) -> (Literal, Thm) raise) raise {
  let conv = x3179
  let i = x3180
  (x3182 : (Bool, (String, @list.List[Term]))) => {
    pathliterule(conv, @list.List([i]), x3182)
  }
}

///|
/// `allArgumentsLiterule`
pub fn allargumentsliterule(
  x3183 : (Term) -> (Term, Thm) raise,
  x3184 : (Bool, (String, @list.List[Term])),
) -> (Literal, Thm) raise {
  let conv = x3183
  let lit = x3184
  everyliterule_v1(
    @lib.map(
      (x3185 : Int64) => argumentliterule(conv, x3185),
      interval(0L, arity_v2(lit)),
    ),
    lit,
  )
}

///|
/// `rule`
pub type Rule = (Thm) -> Thm raise

///|
/// `allRule`
pub fn allrule(x3186 : Thm) -> Thm raise {
  let th = x3186
  th
}

///|
/// `noRule`
pub fn norule(x3187 : Thm) -> Thm raise {
  raise Failure("noRule")
}

///|
/// `thenRule`
pub fn thenrule(
  x3188 : (Thm) -> Thm raise,
  x3189 : (Thm) -> Thm raise,
  x3190 : Thm,
) -> Thm raise {
  let _ as rule1 = x3188
  let _ as rule2 = x3189
  let th = x3190
  rule1(rule2(th))
}

///|
/// `orelseRule`
pub fn orelserule(
  x3191 : (Thm) -> Thm raise,
  x3192 : (Thm) -> Thm raise,
  x3193 : Thm,
) -> Thm raise {
  let _ as rule1 = x3191
  let rule2 = x3192
  let th = x3193
  rule1(th) catch {
    Failure(_) => rule2(th)
    e => raise e
  }
}

///|
/// `tryRule`
pub fn tryrule(x3194 : (Thm) -> Thm raise) -> ((Thm) -> Thm raise) raise {
  let rule = x3194
  (x3196 : Thm) => orelserule(rule, allrule, x3196)
}

///|
/// `changedRule`
pub fn changedrule(x3197 : (Thm) -> Thm raise, x3198 : Thm) -> Thm raise {
  let rule = x3197
  let th = x3198
  let th_p = rule(th)
  let t3199 = clause(th_p)
  if !equal_v28(clause(th))(t3199) {
    th_p
  } else {
    raise Failure("changedRule")
  }
}

///|
/// `repeatRule`
pub fn repeatrule(x3200 : (Thm) -> Thm raise, x3201 : Thm) -> Thm raise {
  let rule = x3200
  let lit = x3201
  tryrule((x3203 : Thm) => {
    thenrule(rule, (x3202 : Thm) => repeatrule(rule, x3202), x3203)
  })(lit)
}

///|
/// `firstRule`
pub fn firstrule(
  x3204 : Thm,
  x3205 : @list.List[(Thm) -> Thm raise],
) -> Thm raise {
  let th = x3204
  match x3205 {
    Empty => raise Failure("firstRule")
    More(rule, tail=Empty) => rule(th)
    More(rule_1, tail=rules) =>
      orelserule(
        rule_1,
        (x3208 : Thm) => {
          flip(
            fn(
              x3206 : Thm,
            ) -> ((@list.List[(Thm) -> Thm raise]) -> Thm raise) raise {
              fn(x3207 : @list.List[(Thm) -> Thm raise]) -> Thm raise {
                firstrule(x3206, x3207)
              }
            },
            rules,
            x3208,
          )
        },
        th,
      )
  }
}

///|
/// `firstRule`
pub fn firstrule_v1(
  x3209 : @list.List[(Thm) -> Thm raise],
  x3210 : Thm,
) -> Thm raise {
  let rules = x3209
  let th = x3210
  firstrule(th, rules)
}

///|
/// `everyRule`
pub fn everyrule(
  x3211 : Thm,
  x3212 : @list.List[(Thm) -> Thm raise],
) -> Thm raise {
  let th = x3211
  match x3212 {
    Empty => allrule(th)
    More(rule, tail=Empty) => rule(th)
    More(rule_1, tail=rules) =>
      thenrule(
        rule_1,
        (x3215 : Thm) => {
          flip(
            fn(
              x3213 : Thm,
            ) -> ((@list.List[(Thm) -> Thm raise]) -> Thm raise) raise {
              fn(x3214 : @list.List[(Thm) -> Thm raise]) -> Thm raise {
                everyrule(x3213, x3214)
              }
            },
            rules,
            x3215,
          )
        },
        th,
      )
  }
}

///|
/// `everyRule`
pub fn everyrule_v1(
  x3216 : @list.List[(Thm) -> Thm raise],
  x3217 : Thm,
) -> Thm raise {
  let rules = x3216
  let th = x3217
  everyrule(th, rules)
}

///|
/// `literalRule`
pub fn literalrule(
  x3218 : ((Bool, (String, @list.List[Term]))) -> (
    (Bool, (String, @list.List[Term])),
    Thm,
  ) raise,
  x3219 : (Bool, (String, @list.List[Term])),
  x3220 : Thm,
) -> Thm raise {
  let literule = x3218
  let lit = x3219
  let th = x3220
  let (lit_p, litth) = literule(lit)
  if equal_v25(lit, lit_p) {
    th
  } else if !negatemember_v1(lit, litth) {
    litth
  } else {
    resolve(lit, th)(litth)
  }
}

///|
/// `rewrRule`
pub fn rewrrule(
  x3221 : ((Term, Term), Thm),
  x3222 : (Bool, (String, @list.List[Term])),
  x3223 : @list.List[Int64],
) -> ((Thm) -> Thm raise) raise {
  let eqth = x3221
  let lit = x3222
  let path = x3223
  (x3226 : Thm) => {
    literalrule(
      (x3225 : (Bool, (String, @list.List[Term]))) => {
        rewrliterule(eqth, path, x3225)
      },
      lit,
      x3226,
    )
  }
}

///|
/// `pathRule`
pub fn pathrule(
  x3227 : (Term) -> (Term, Thm) raise,
  x3228 : (Bool, (String, @list.List[Term])),
  x3229 : @list.List[Int64],
) -> ((Thm) -> Thm raise) raise {
  let conv = x3227
  let lit = x3228
  let path = x3229
  (x3232 : Thm) => {
    literalrule(
      (x3231 : (Bool, (String, @list.List[Term]))) => {
        pathliterule(conv, path, x3231)
      },
      lit,
      x3232,
    )
  }
}

///|
/// `literalsRule`
pub fn literalsrule(
  x3233 : ((Bool, (String, @list.List[Term]))) -> (
    (Bool, (String, @list.List[Term])),
    Thm,
  ) raise,
) -> ((@oset.T[(Bool, Atom)]) -> ((Thm) -> Thm raise) raise) raise {
  let literule = x3233
  let f : (((Bool, (String, @list.List[Term])), Thm)) -> Thm raise = fn(
    x3235 : ((Bool, (String, @list.List[Term])), Thm),
  ) -> Thm raise {
    let (lit, th) = x3235
    if member_v8(lit, th) {
      literalrule(literule, lit, th)
    } else {
      th
    }
  }
  fn(
    x3236 : @oset.T[(Bool, (String, @list.List[Term]))],
  ) -> ((Thm) -> Thm raise) raise {
    let lits = x3236
    fn(x3237 : Thm) -> Thm raise {
      let th_1 = x3237
      foldl_v16(f)(th_1)(lits)
    }
  }
}

///|
/// `allLiteralsRule`
pub fn allliteralsrule(
  x3238 : ((Bool, (String, @list.List[Term]))) -> (
    (Bool, (String, @list.List[Term])),
    Thm,
  ) raise,
  x3239 : Thm,
) -> Thm raise {
  let literule = x3238
  let th = x3239
  let t3240 = clause(th)
  literalsrule(literule)(t3240)(th)
}

///|
/// `convRule`
pub fn convrule(
  x3241 : (Term) -> (Term, Thm) raise,
) -> ((Thm) -> Thm raise) raise {
  let conv = x3241
  (x3244 : Thm) => {
    allliteralsrule(
      (x3243 : (Bool, (String, @list.List[Term]))) => {
        allargumentsliterule(conv, x3243)
      },
      x3244,
    )
  }
}

///|
/// `functionCongruence`
pub fn functioncongruence(x3245 : String, x3246 : Int64) -> Thm raise {
  let (f, n) = (x3245, x3246)
  let xs = tabulate(n, xivar)
  let ys = tabulate(n, yivar)
  let cong : (((Int64, Term), (Thm, (Bool, (String, @list.List[Term]))))) -> (
    Thm,
    (Bool, (String, @list.List[Term])),
  ) raise = fn(
    x3247 : ((Int64, Term), (Thm, (Bool, (String, @list.List[Term])))),
  ) -> (Thm, (Bool, (String, @list.List[Term]))) raise {
    let ((i, yi), (th, lit)) = x3247
    let path = @list.List([1L, i])
    let t3248 = equality(lit, path, yi)
    let th_1 = resolve(lit, th)(t3248)
    let lit_1 = replace_v2(lit, (path, yi))
    (th_1, lit_1)
  }
  let reflth = refl(Term::Fn((f, xs)))
  let refllit = destunit(reflth)
  foldl(cong, (reflth, refllit), enumerate(ys)).0
}

///|
/// `relationCongruence`
pub fn relationcongruence(x3249 : String, x3250 : Int64) -> Thm raise {
  let (r, n) = (x3249, x3250)
  let xs = tabulate(n, xivar)
  let ys = tabulate(n, yivar)
  let cong : (((Int64, Term), (Thm, (Bool, (String, @list.List[Term]))))) -> (
    Thm,
    (Bool, (String, @list.List[Term])),
  ) raise = fn(
    x3251 : ((Int64, Term), (Thm, (Bool, (String, @list.List[Term])))),
  ) -> (Thm, (Bool, (String, @list.List[Term]))) raise {
    let ((i, yi), (th, lit)) = x3251
    let path = @list.List([i])
    let t3252 = equality(lit, path, yi)
    let th_1 = resolve(lit, th)(t3252)
    let lit_1 = replace_v2(lit, (path, yi))
    (th_1, lit_1)
  }
  let assumelit = (false, (r, xs))
  let assumeth = assume_(assumelit)
  foldl(cong, (assumeth, assumelit), enumerate(ys)).0
}

///|
/// `symNeq`
pub fn symneq(
  x3253 : (Bool, (String, @list.List[Term])),
  x3254 : Thm,
) -> Thm raise {
  let lit = x3253
  let th = x3254
  let (x, y) = destneq_v1(lit)
  if equal_v14(x, y) {
    th
  } else {
    let sub = fromlist_v9(@list.List([(xvarname(), y), (yvarname(), x)]))
    let symth = subst_v5(sub, symmetry())
    resolve(lit, th)(symth)
  }
}

///|
/// `sym`
pub fn sym_v3(
  x3255 : (Bool, (String, @list.List[Term])),
  x3256 : Thm,
) -> Thm raise {
  let (pol, _) as lit = x3255
  let th = x3256
  if pol {
    symeq(lit, th)
  } else {
    symneq(lit, th)
  }
}

///|
/// `removeIrrefl`
pub fn removeirrefl(x3257 : Thm) -> Thm raise {
  let th = x3257
  let irrefl : (((Bool, (String, @list.List[Term])), Thm)) -> Thm raise = fn(
    x3258 : ((Bool, (String, @list.List[Term])), Thm),
  ) -> Thm raise {
    match x3258 {
      ((true, _), th_1) => th_1
      ((false, atm) as lit, th_2) =>
        match total(destrefl, atm) {
          Some(x) => {
            let t3259 = refl(x)
            resolve(lit, th_2)(t3259)
          }
          None => th_2
        }
    }
  }
  let t3260 = clause(th)
  foldl_v16(irrefl)(th)(t3260)
}

///|
/// `removeSym`
pub fn removesym(x3261 : Thm) -> Thm raise {
  let th = x3261
  let rem : (
    (
      (Bool, (String, @list.List[Term])),
      (@oset.T[(Bool, (String, @list.List[Term]))], Thm),
    ),
  ) -> (@oset.T[(Bool, (String, @list.List[Term]))], Thm) raise = fn(
    x3262 : (
      (Bool, (String, @list.List[Term])),
      (@oset.T[(Bool, (String, @list.List[Term]))], Thm),
    ),
  ) -> (@oset.T[(Bool, (String, @list.List[Term]))], Thm) raise {
    let ((pol, atm) as lit, (eqs, th_1)) = x3262
    match total(sym, atm) {
      None => (eqs, th_1)
      Some(atm_p) =>
        if member_v6(lit)(eqs) {
          (eqs, if pol { symeq(lit, th_1) } else { symneq(lit, th_1) })
        } else {
          (add_v23(eqs, (pol, atm_p)), th_1)
        }
    }
  }
  let t3263 = clause(th)
  foldl_v16(rem)((empty_v22(), th))(t3263).1
}

///|
/// `expandAbbrevs`
pub fn expandabbrevs(x3264 : Thm) -> Thm raise {
  let th = x3264
  let expand : ((Bool, (String, @list.List[Term]))) -> Subst raise = fn(
    x3265 : (Bool, (String, @list.List[Term])),
  ) -> Subst raise {
    let lit = x3265
    let (x, y) = destneq_v1(lit)
    let _ = istypedvar(x) ||
      istypedvar(y) ||
      @lib.raise_error(Failure("Rule.expandAbbrevs: no vars"))
    let _ = !equal_v14(x, y) ||
      @lib.raise_error(Failure("Rule.expandAbbrevs: equal vars"))
    unify(empty_v13(), x, y)
  }
  match
    firstl_v7(
      (x3266 : (Bool, (String, @list.List[Term]))) => total(expand, x3266),
      clause(th),
    ) {
    None => removeirrefl(th)
    Some(sub) => expandabbrevs(subst_v5(sub, th))
  }
}

///|
/// `simplify`
pub fn simplify(x3267 : Thm) -> Thm? raise {
  let th = x3267
  if istautology(th) {
    None
  } else {
    let th_p = th
    let th_p_1 = expandabbrevs(th_p)
    let th_p_2 = removesym(th_p_1)
    if equal_v32(th, th_p_2) {
      Some(th)
    } else {
      simplify(th_p_2)
    }
  }
}

///|
/// `freshVars`
pub fn freshvars_v1(x3268 : Thm) -> Thm raise {
  let th = x3268
  subst_v5(freshvars(freevars_v6(th)), th)
}

///|
/// `edge`
#derive(Eq, Debug)
pub(all) enum Edge {
  Factor_edge(Atom, Atom)
  Refl_edge(Term, Term)
}

///|
pub extend Edge with Eq::{not_equal, equal}

///|
pub extend Edge with Debug::{to_repr}

///|
pub extend Edge with @lib.OCompare::{ocompare}

///|
pub extend Edge with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_Edge(x : Edge) -> Int {
  match x {
    Factor_edge(_, _) => 1000000
    Refl_edge(_, _) => 1000001
  }
}

///|
pub impl @lib.OCompare for Edge with fn ocompare(self, other) {
  match (self, other) {
    (Factor_edge(a0, a1), Factor_edge(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    (Refl_edge(a0, a1), Refl_edge(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    _ => ocaml_rank_Edge(self).compare(ocaml_rank_Edge(other))
  }
}

///|
pub impl @lib.OHash for Edge with fn ohash_visit(self, h) {
  match self {
    Factor_edge(a0, a1) => {
      h.block(0, 2)
      h.field(a0)
      h.field(a1)
    }
    Refl_edge(a0, a1) => {
      h.block(1, 2)
      h.field(a0)
      h.field(a1)
    }
  }
}

///|
/// `joinStatus`
#derive(Eq, Debug)
pub(all) enum JoinStatus {
  Joined
  Joinable(Subst)
  Apart
}

///|
pub extend JoinStatus with Eq::{not_equal, equal}

///|
pub extend JoinStatus with Debug::{to_repr}

///|
pub extend JoinStatus with @lib.OCompare::{ocompare}

///|
pub extend JoinStatus with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_JoinStatus(x : JoinStatus) -> Int {
  match x {
    Joined => 0
    Joinable(_) => 1000000
    Apart => 1
  }
}

///|
pub impl @lib.OCompare for JoinStatus with fn ocompare(self, other) {
  match (self, other) {
    (Joinable(a0), Joinable(b0)) => @lib.compare(a0, b0)
    _ => ocaml_rank_JoinStatus(self).compare(ocaml_rank_JoinStatus(other))
  }
}

///|
pub impl @lib.OHash for JoinStatus with fn ohash_visit(self, h) {
  match self {
    Joined => h.int(0L)
    Joinable(a0) => {
      h.block(0, 1)
      h.field(a0)
    }
    Apart => h.int(1L)
  }
}

///|
/// `joinEdge`
pub fn joinedge(x3269 : Subst, x3270 : Edge) -> JoinStatus raise {
  let sub = x3269
  let edge = x3270
  let result = match edge {
    Edge::Factor_edge(atm, atm_p) =>
      total(
        (x3271 : (String, @list.List[Term])) => unify_v1(sub, atm, x3271),
        atm_p,
      )
    Edge::Refl_edge(tm, tm_p) =>
      total((x3272 : Term) => unify(sub, tm, x3272), tm_p)
  }
  match result {
    None => JoinStatus::Apart
    Some(sub_p) =>
      if physical_equal(sub, sub_p) {
        JoinStatus::Joined
      } else {
        JoinStatus::Joinable(sub_p)
      }
  }
}

///|
/// `updateApart`
pub fn updateapart(
  x3273 : Subst,
) -> ((@list.List[Edge]) -> @list.List[Edge]? raise) raise {
  let sub = x3273
  fn update_1(
    x3275 : @list.List[Edge],
    x3276 : @list.List[Edge],
  ) -> @list.List[Edge]? raise {
    let acc = x3275
    match x3276 {
      Empty => Some(acc)
      More(edge, tail=edges) =>
        match joinedge(sub, edge) {
          JoinStatus::Joined => None
          JoinStatus::Joinable(_) => update_1(acc.prepend(edge), edges)
          JoinStatus::Apart => update_1(acc, edges)
        }
    }
  }
  (x3277 : @list.List[Edge]) => update_1(@list.List([]), x3277)
}

///|
/// `addFactorEdge`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] addfactoredge(
  x3278 : (TA, (String, @list.List[Term])),
  x3279 : ((TA, (String, @list.List[Term])), @list.List[(Subst, Edge)]),
) -> @list.List[(Subst, Edge)] raise {
  let (pol, atm) = x3278
  let ((pol_p, atm_p), acc) = x3279
  if pol != pol_p {
    acc
  } else {
    let edge = Edge::Factor_edge(atm, atm_p)
    match joinedge(empty_v13(), edge) {
      JoinStatus::Joined => raise Bug::Bug("addFactorEdge: joined")
      JoinStatus::Joinable(sub) => acc.prepend((sub, edge))
      JoinStatus::Apart => acc
    }
  }
}

///|
/// `addReflEdge`
pub fn addrefledge(
  x3280 : ((Bool, (String, @list.List[Term])), @list.List[Edge]),
) -> @list.List[Edge] raise {
  match x3280 {
    ((false, _), acc) => acc
    ((true, atm), acc_1) => {
      let (x, y) = desteq(atm)
      let edge = Edge::Refl_edge(x, y)
      match joinedge(empty_v13(), edge) {
        JoinStatus::Joined => raise Bug::Bug("addRefl: joined")
        JoinStatus::Joinable(_) => acc_1.prepend(edge)
        JoinStatus::Apart => acc_1
      }
    }
  }
}

///|
/// addReflEdge
fn step_137() -> Unit raise {
  addrefledge_v1_c.set(fn(
    x3283 : (Bool, (String, @list.List[Term])),
  ) -> ((@list.List[Edge]) -> @list.List[Edge] raise) raise {
    fn(x3284 : @list.List[Edge]) -> @list.List[Edge] raise {
      ((x3281 : (Bool, (String, @list.List[Term])), x3282 : @list.List[Edge]) => {
        @lib.curry(addrefledge, x3281, x3282)
      })(x3283, x3284)
    }
  })
}

///|
let addrefledge_v1_c : @lib.Cell[
  ((Bool, (Name, @list.List[Term]))) -> ((@list.List[Edge]) -> @list.List[Edge] raise) raise,
] = @lib.Cell::new("addReflEdge")

///|
/// `addReflEdge`
pub fn addrefledge_v1(
  x : (Bool, (Name, @list.List[Term])),
) -> ((@list.List[Edge]) -> @list.List[Edge] raise) raise {
  addrefledge_v1_c.get()(x)
}

///|
/// `addIrreflEdge`
pub fn addirrefledge(
  x3285 : ((Bool, (String, @list.List[Term])), @list.List[(Subst, Edge)]),
) -> @list.List[(Subst, Edge)] raise {
  match x3285 {
    ((true, _), acc) => acc
    ((false, atm), acc_1) => {
      let (x, y) = desteq(atm)
      let edge = Edge::Refl_edge(x, y)
      match joinedge(empty_v13(), edge) {
        JoinStatus::Joined => raise Bug::Bug("addRefl: joined")
        JoinStatus::Joinable(sub) => acc_1.prepend((sub, edge))
        JoinStatus::Apart => acc_1
      }
    }
  }
}

///|
/// addIrreflEdge
fn step_138() -> Unit raise {
  addirrefledge_v1_c.set(fn(
    x3288 : (Bool, (String, @list.List[Term])),
  ) -> ((@list.List[(Subst, Edge)]) -> @list.List[(Subst, Edge)] raise) raise {
    fn(x3289 : @list.List[(Subst, Edge)]) -> @list.List[(Subst, Edge)] raise {
      ((
        x3286 : (Bool, (String, @list.List[Term])),
        x3287 : @list.List[(Subst, Edge)],
      ) => @lib.curry(addirrefledge, x3286, x3287))(x3288, x3289)
    }
  })
}

///|
let addirrefledge_v1_c : @lib.Cell[
  ((Bool, (Name, @list.List[Term]))) -> ((@list.List[(Subst, Edge)]) -> @list.List[
    (Subst, Edge),
  ] raise) raise,
] = @lib.Cell::new("addIrreflEdge")

///|
/// `addIrreflEdge`
pub fn addirrefledge_v1(
  x : (Bool, (Name, @list.List[Term])),
) -> ((@list.List[(Subst, Edge)]) -> @list.List[(Subst, Edge)] raise) raise {
  addirrefledge_v1_c.get()(x)
}

///|
/// `init_edges`
pub fn init_edges(
  x3290 : @list.List[(@list.List[Edge], Subst, Edge)],
  x3291 : @list.List[Edge],
  x3292 : @list.List[(Subst, Edge)],
) -> @list.List[(@list.List[Edge], Subst, @list.List[Edge])] raise {
  let acc = x3290
  let apart = x3291
  match x3292 {
    Empty =>
      foldl(
        fn(
          x3295 : (
            (@list.List[Edge], Subst, Edge),
            (
              @list.List[Edge],
              @list.List[(@list.List[Edge], Subst, @list.List[Edge])],
            ),
          ),
        ) -> (
          @list.List[Edge],
          @list.List[(@list.List[Edge], Subst, @list.List[Edge])],
        ) raise {
          init__l(x3295.0, x3295.1)
        },
        (@list.List([]), @list.List([])),
        acc,
      ).1
    More((sub_1, edge_1), tail=sub_edges) => {
      let (acc_2, apart_2) = match updateapart(sub_1)(apart) {
        Some(apart_p) =>
          (acc.prepend((apart_p, sub_1, edge_1)), apart.prepend(edge_1))
        None => (acc, apart)
      }
      init_edges(acc_2, apart_2, sub_edges)
    }
  }
}

///|
fn[TA, TB, TC] init__l(
  x3293 : (TB, TC, TA),
  x3294 : (@list.List[TA], @list.List[(TB, TC, @list.List[TA])]),
) -> (@list.List[TA], @list.List[(TB, TC, @list.List[TA])]) raise {
  let ((apart_1, sub, edge), (edges, acc_1)) = (x3293, x3294)
  (edges.prepend(edge), acc_1.prepend((apart_1, sub, edges)))
}

///|
/// `mk_edges`
pub fn mk_edges(
  x3296 : @list.List[Edge],
  x3297 : @list.List[(Subst, Edge)],
  x3298 : @list.List[(Bool, (String, @list.List[Term]))],
) -> @list.List[(@list.List[Edge], Subst, @list.List[Edge])] raise {
  let apart = x3296
  let sub_edges = x3297
  match x3298 {
    Empty => init_edges(@list.List([]), apart, sub_edges)
    More(lit, tail=lits) => {
      let sub_edges_1 = foldl(
        (
          x3299 : (
            (Bool, (String, @list.List[Term])),
            @list.List[(Subst, Edge)],
          ),
        ) => addfactoredge(lit, x3299),
        sub_edges,
        lits,
      )
      let (apart_2, sub_edges_4) = match
        total(
          fn(
            x3300 : (Bool, (String, @list.List[Term])),
          ) -> (Bool, (String, @list.List[Term])) raise {
            sym_v2(x3300.0, x3300.1)
          },
          lit,
        ) {
        None => (apart, sub_edges_1)
        Some(lit_p) => {
          let apart_1 = addrefledge_v1(lit)(apart)
          let sub_edges_2 = addirrefledge_v1(lit)(sub_edges_1)
          let sub_edges_3 = foldl(
            (
              x3301 : (
                (Bool, (String, @list.List[Term])),
                @list.List[(Subst, Edge)],
              ),
            ) => addfactoredge(lit_p, x3301),
            sub_edges_2,
            lits,
          )
          (apart_1, sub_edges_3)
        }
      }
      mk_edges(apart_2, sub_edges_4, lits)
    }
  }
}

///|
/// `fact`
pub fn fact(
  x3302 : @list.List[Subst],
  x3303 : @list.List[(@list.List[Edge], Subst, @list.List[Edge])],
) -> @list.List[Subst] raise {
  let acc = x3302
  match x3303 {
    Empty => acc
    More((_, sub, Empty), tail=others) => fact(acc.prepend(sub), others)
    More((apart, sub_1, More(edge, tail=edges)), tail=others_1) => {
      let others_3 = match joinedge(sub_1, edge) {
        JoinStatus::Joinable(sub_p) => {
          let others_2 = others_1.prepend((apart.prepend(edge), sub_1, edges))
          match updateapart(sub_p)(apart) {
            None => others_2
            Some(apart_p) => others_2.prepend((apart_p, sub_p, edges))
          }
        }
        _ => others_1.prepend((apart, sub_1, edges))
      }
      fact(acc, others_3)
    }
  }
}

///|
/// `factor'`
pub fn factor_p(
  x3304 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> @list.List[Subst] raise {
  let cl = x3304
  let edges = mk_edges(@list.List([]), @list.List([]), tolist_v16(cl))
  let result = fact(@list.List([]), edges)
  result
}

///|
/// `factor`
pub fn factor(x3305 : Thm) -> @list.List[Thm] raise {
  let th = x3305
  let fact_1 : (Subst) -> Thm raise = fn(x3306 : Subst) -> Thm raise {
    let sub = x3306
    removeirrefl(removesym(subst_v5(sub, th)))
  }
  @lib.map(fact_1, factor_p(clause(th)))
}

///|
/// maxSpace
fn step_139() -> Unit raise {
  maxspace_c.set(1000L)
}

///|
let maxspace_c : @lib.Cell[Int64] = @lib.Cell::new("maxSpace")

///|
/// `maxSpace`
pub fn maxspace() -> Int64 {
  maxspace_c.get()
}

///|
/// `multInt`
pub fn multint(x3307 : Int64, x3308 : Int64) -> Int64? raise {
  let x = x3307
  let y = x3308
  let m = @lib.norm63(
    Double::to_int64(
      Double::floor(Double::sqrt(Int64::to_double(@lib.max_int63))),
    ),
  )
  if x <= m && y <= m {
    Some(@lib.mul63(x, y))
  } else {
    None
  }
}

///|
/// `iexp`
pub fn iexp(x3309 : Int64, x3310 : Int64, x3311 : Int64) -> Int64? raise {
  let x = x3309
  let y = x3310
  let acc = x3311
  if @lib.mod63(y, 2L) == 0L {
    iexp_p(x, y, acc)
  } else {
    match multint(acc, x) {
      Some(acc_1) => iexp_p(x, y, acc_1)
      None => None
    }
  }
}

///|
/// `iexp'`
pub fn iexp_p(x3312 : Int64, x3313 : Int64, x3314 : Int64) -> Int64? raise {
  let x_1 = x3312
  let y_1 = x3313
  let acc_2 = x3314
  if y_1 == 1L {
    Some(acc_2)
  } else {
    let y_2 = @lib.div63(y_1, 2L)
    match multint(x_1, x_1) {
      Some(x_2) => iexp(x_2, y_2, acc_2)
      None => None
    }
  }
}

///|
/// `expInt`
pub fn expint(x3315 : Int64, x3316 : Int64) -> Int64? raise {
  let x = x3315
  let y = x3316
  if y <= 1L {
    if y == 0L {
      Some(1L)
    } else if y == 1L {
      Some(x)
    } else {
      raise Bug::Bug("expInt: negative exponent")
    }
  } else if x <= 1L {
    if 0L <= x {
      Some(x)
    } else {
      raise Bug::Bug("expInt: negative exponand")
    }
  } else {
    iexp(x, y, 1L)
  }
}

///|
/// `boolToInt`
pub fn booltoint(x3317 : Bool) -> Int64 raise {
  match x3317 {
    true => 1L
    false => 0L
  }
}

///|
/// `intToBool`
pub fn inttobool(x3318 : Int64) -> Bool raise {
  match x3318 {
    1L => true
    0L => false
    _ => raise Bug::Bug("Model.intToBool")
  }
}

///|
/// `minMaxInterval`
pub fn minmaxinterval(x3319 : Int64, x3320 : Int64) -> @list.List[Int64] raise {
  let i = x3319
  let j = x3320
  interval(i, @lib.sub63(@lib.add63(1L, j), i))
}

///|
/// `size`
#derive(Eq, Debug)
pub(all) struct Size {
  size : Int64
}

///|
pub extend Size with Eq::{not_equal, equal}

///|
pub extend Size with Debug::{to_repr}

///|
pub extend Size with @lib.OCompare::{ocompare}

///|
pub extend Size with @lib.OHash::{ohash_visit}

///|
pub impl @lib.OCompare for Size with fn ocompare(self, other) {
  @lib.compare(self.size, other.size)
}

///|
pub impl @lib.OHash for Size with fn ohash_visit(self, h) {
  h.block(0, 1)
  h.field(self.size)
}

///|
/// `element`
pub type Element = Int64

///|
/// zeroElement
fn step_140() -> Unit raise {
  zeroelement_c.set(0L)
}

///|
let zeroelement_c : @lib.Cell[Int64] = @lib.Cell::new("zeroElement")

///|
/// `zeroElement`
pub fn zeroelement() -> Int64 {
  zeroelement_c.get()
}

///|
/// `incrementElement`
pub fn incrementelement(x3321 : Size) -> ((Int64) -> Int64? raise) raise {
  match x3321 {
    { size: n } =>
      fn(x3322 : Int64) -> Int64? raise {
        let i = x3322
        let i_1 = @lib.add63(i, 1L)
        if i_1 == n {
          None
        } else {
          Some(i_1)
        }
      }
  }
}

///|
/// `elementListSpace`
pub fn elementlistspace(x3323 : Size) -> ((Int64) -> Int64? raise) raise {
  match x3323 {
    { size: n } =>
      fn(x3324 : Int64) -> Int64? raise {
        let arity_1 = x3324
        match expint(n, arity_1) {
          None => None
          Some(m) as s => if m <= maxspace() { s } else { None }
        }
      }
  }
}

///|
/// `elementListIndex`
pub fn elementlistindex(
  x3325 : Size,
) -> ((@list.List[Int64]) -> Int64 raise) raise {
  match x3325 {
    { size: n } => {
      fn f(x3327 : Int64, x3328 : @list.List[Int64]) -> Int64 raise {
        let acc = x3327
        let elts = x3328
        match elts {
          Empty => acc
          More(elt, tail=elts_1) =>
            f(@lib.add63(@lib.mul63(n, acc), elt), elts_1)
        }
      }
      (x3329 : @list.List[Int64]) => f(0L, x3329)
    }
  }
}

///|
/// `fixedFunction`
pub type FixedFunction = (Size) -> ((@list.List[Element]) -> Element? raise) raise

///|
/// `fixedRelation`
pub type FixedRelation = (Size) -> ((@list.List[Element]) -> Bool? raise) raise

///|
/// `fixed`
pub(all) struct Fixed {
  functions : Map5[FixedFunction]
  relations : Map5[FixedRelation]
}

///|
/// uselessFixedFunction
fn step_141() -> Unit raise {
  uselessfixedfunction_c.set(fn(
    x3331 : Size,
  ) -> ((@list.List[Int64]) -> Int64? raise) raise {
    fn(x3330 : @list.List[Int64]) -> Int64? raise { None }
  })
}

///|
let uselessfixedfunction_c : @lib.Cell[FixedFunction] = @lib.Cell::new(
  "uselessFixedFunction",
)

///|
/// `uselessFixedFunction`
pub fn uselessfixedfunction(
  x : Size,
) -> ((@list.List[Element]) -> Element? raise) raise {
  uselessfixedfunction_c.get()(x)
}

///|
/// uselessFixedRelation
fn step_142() -> Unit raise {
  uselessfixedrelation_c.set(fn(
    x3333 : Size,
  ) -> ((@list.List[Int64]) -> Bool? raise) raise {
    fn(x3332 : @list.List[Int64]) -> Bool? raise { None }
  })
}

///|
let uselessfixedrelation_c : @lib.Cell[FixedRelation] = @lib.Cell::new(
  "uselessFixedRelation",
)

///|
/// `uselessFixedRelation`
pub fn uselessfixedrelation(
  x : Size,
) -> ((@list.List[Element]) -> Bool? raise) raise {
  uselessfixedrelation_c.get()(x)
}

///|
/// emptyFunctions
fn step_143() -> Unit raise {
  emptyfunctions_c.set(newmap_v4(()))
}

///|
let emptyfunctions_c : @lib.Cell[Map5[FixedFunction]] = @lib.Cell::new(
  "emptyFunctions",
)

///|
/// `emptyFunctions`
pub fn emptyfunctions() -> Map5[FixedFunction] {
  emptyfunctions_c.get()
}

///|
/// emptyRelations
fn step_144() -> Unit raise {
  emptyrelations_c.set(newmap_v4(()))
}

///|
let emptyrelations_c : @lib.Cell[Map5[FixedRelation]] = @lib.Cell::new(
  "emptyRelations",
)

///|
/// `emptyRelations`
pub fn emptyrelations() -> Map5[FixedRelation] {
  emptyrelations_c.get()
}

///|
/// `fixed0`
pub fn[TA, TB, TC] fixed0(
  x3334 : (TB) -> TA raise,
  x3335 : TB,
  x3336 : @list.List[TC],
) -> TA raise {
  let f = x3334
  let sz = x3335
  let elts = x3336
  match elts {
    Empty => f(sz)
    _ => raise Bug::Bug("Model.fixed0: wrong arity")
  }
}

///|
/// `fixed1`
pub fn[TA, TB, TC] fixed1(
  x3337 : (TC) -> ((TB) -> TA raise) raise,
  x3338 : TC,
  x3339 : @list.List[TB],
) -> TA raise {
  let f = x3337
  let sz = x3338
  let elts = x3339
  match elts {
    More(x, tail=Empty) => f(sz)(x)
    _ => raise Bug::Bug("Model.fixed1: wrong arity")
  }
}

///|
/// `fixed2`
pub fn[TA, TB, TC] fixed2(
  x3340 : (TC) -> ((TB) -> ((TB) -> TA raise) raise) raise,
  x3341 : TC,
  x3342 : @list.List[TB],
) -> TA raise {
  let f = x3340
  let sz = x3341
  let elts = x3342
  match elts {
    More(x, tail=More(y, tail=Empty)) => f(sz)(x)(y)
    _ => raise Bug::Bug("Model.fixed2: wrong arity")
  }
}

///|
/// emptyFixed
fn step_145() -> Unit raise {
  let fns = emptyfunctions()
  let rels = emptyrelations()
  emptyfixed_c.set(Fixed::{ functions: fns, relations: rels, })
}

///|
let emptyfixed_c : @lib.Cell[Fixed] = @lib.Cell::new("emptyFixed")

///|
/// `emptyFixed`
pub fn emptyfixed() -> Fixed {
  emptyfixed_c.get()
}

///|
/// `peekFunctionFixed`
pub fn peekfunctionfixed(
  x3343 : Fixed,
  x3344 : (String, Int64),
) -> FixedFunction? raise {
  let fix = x3343
  let name_arity = x3344
  match fix {
    { functions: fns, .. } => peek_v5(fns, name_arity)
    _ => raise @lib.MatchFailure("tscript.ml:5127")
  }
}

///|
/// `peekRelationFixed`
pub fn peekrelationfixed(
  x3345 : Fixed,
  x3346 : (String, Int64),
) -> FixedRelation? raise {
  let fix = x3345
  let name_arity = x3346
  match fix {
    { relations: rels, .. } => peek_v5(rels, name_arity)
    _ => raise @lib.MatchFailure("tscript.ml:5133")
  }
}

///|
/// `getFunctionFixed`
pub fn getfunctionfixed(
  x3347 : Fixed,
  x3348 : (String, Int64),
) -> FixedFunction raise {
  let fix = x3347
  let name_arity = x3348
  match peekfunctionfixed(fix, name_arity) {
    Some(f) => f
    None => uselessfixedfunction
  }
}

///|
/// `getRelationFixed`
pub fn getrelationfixed(
  x3350 : Fixed,
  x3351 : (String, Int64),
) -> FixedRelation raise {
  let fix = x3350
  let name_arity = x3351
  match peekrelationfixed(fix, name_arity) {
    Some(rel) => rel
    None => uselessfixedrelation
  }
}

///|
/// `insertFunctionFixed`
pub fn insertfunctionfixed(
  x3353 : Fixed,
  x3354 : (
    (String, Int64),
    (Size) -> ((@list.List[Int64]) -> Int64? raise) raise,
  ),
) -> Fixed raise {
  let fix = x3353
  let name_arity_fun = x3354
  match fix {
    { functions: fns, relations: rels } => {
      let fns_1 = insert_v4(fns, name_arity_fun)
      Fixed::{ functions: fns_1, relations: rels, }
    }
    _ => raise @lib.MatchFailure("tscript.ml:5149")
  }
}

///|
/// `insertRelationFixed`
pub fn insertrelationfixed(
  x3355 : Fixed,
  x3356 : (
    (String, Int64),
    (Size) -> ((@list.List[Int64]) -> Bool? raise) raise,
  ),
) -> Fixed raise {
  let fix = x3355
  let name_arity_rel = x3356
  match fix {
    { functions: fns, relations: rels } => {
      let rels_1 = insert_v4(rels, name_arity_rel)
      Fixed::{ functions: fns, relations: rels_1, }
    }
    _ => raise @lib.MatchFailure("tscript.ml:5158")
  }
}

///|
/// `union`
pub fn[TA, TB] union_v35(x3357 : TB) -> TA raise {
  raise Bug::Bug("Model.unionFixed: nameArity clash")
}

///|
/// `unionFixed`
pub fn unionfixed(x3358 : Fixed, x3359 : Fixed) -> Fixed raise {
  let fix1 = x3358
  let fix2 = x3359
  match fix1 {
    { functions: fns1, relations: rels1 } =>
      match fix2 {
        { functions: fns2, relations: rels2 } => {
          let fns = union_v13(union_v35, fns1, fns2)
          let rels = union_v13(union_v35, rels1, rels2)
          Fixed::{ functions: fns, relations: rels, }
        }
        _ => raise @lib.MatchFailure("tscript.ml:5169")
      }
    _ => raise @lib.MatchFailure("tscript.ml:5168")
  }
}

///|
/// unionListFixed
fn step_146() -> Unit raise {
  let union_1 : ((Fixed, Fixed)) -> Fixed raise = fn(
    x3360 : (Fixed, Fixed),
  ) -> Fixed raise {
    let (fix, acc) = x3360
    unionfixed(acc, fix)
  }
  unionlistfixed_c.set((x3361 : @list.List[Fixed]) => {
    foldl(union_1, emptyfixed(), x3361)
  })
}

///|
let unionlistfixed_c : @lib.Cell[(@list.List[Fixed]) -> Fixed raise] = @lib.Cell::new(
  "unionListFixed",
)

///|
/// `unionListFixed`
pub fn unionlistfixed(x : @list.List[Fixed]) -> Fixed raise {
  unionlistfixed_c.get()(x)
}

///|
/// `hasTypeFn`
pub fn[TA, TB] hastypefn(x3362 : TB, x3363 : @list.List[TA]) -> TA? raise {
  let elts = x3363
  match elts {
    More(x, tail=More(_, tail=Empty)) => Some(x)
    _ => raise Bug::Bug("Model.hasTypeFn: wrong arity")
  }
}

///|
/// `eqRel`
pub fn[TA, TB : Eq + @lib.OCompare + @lib.OHash] eqrel(
  x3364 : TA,
  x3365 : @list.List[TB],
) -> Bool? raise {
  let elts = x3365
  match elts {
    More(x, tail=More(y, tail=Empty)) => Some(x == y)
    _ => raise Bug::Bug("Model.eqRel: wrong arity")
  }
}

///|
/// basicFixed
fn step_147() -> Unit raise {
  let fns = singleton_v13(hastypefunction(), fn(
    x3366 : Size,
  ) -> ((@list.List[Int64]) -> Int64? raise) raise {
    fn(x3367 : @list.List[Int64]) -> Int64? raise { hastypefn(x3366, x3367) }
  })
  let rels = singleton_v13(eqrelation(), fn(
    x3368 : Size,
  ) -> ((@list.List[Int64]) -> Bool? raise) raise {
    fn(x3369 : @list.List[Int64]) -> Bool? raise { eqrel(x3368, x3369) }
  })
  basicfixed_c.set(Fixed::{ functions: fns, relations: rels, })
}

///|
let basicfixed_c : @lib.Cell[Fixed] = @lib.Cell::new("basicFixed")

///|
/// `basicFixed`
pub fn basicfixed() -> Fixed {
  basicfixed_c.get()
}

///|
/// `fixedMap`
#derive(Eq, Debug)
pub(all) struct FixedMap {
  functionmap : Map5[Name]
  relationmap : Map5[Name]
}

///|
pub extend FixedMap with Eq::{not_equal, equal}

///|
pub extend FixedMap with Debug::{to_repr}

///|
pub extend FixedMap with @lib.OCompare::{ocompare}

///|
pub extend FixedMap with @lib.OHash::{ohash_visit}

///|
pub impl @lib.OCompare for FixedMap with fn ocompare(self, other) {
  let c = @lib.compare(self.functionmap, other.functionmap)
  if c != 0 {
    return c
  }
  @lib.compare(self.relationmap, other.relationmap)
}

///|
pub impl @lib.OHash for FixedMap with fn ohash_visit(self, h) {
  h.block(0, 2)
  h.field(self.functionmap)
  h.field(self.relationmap)
}

///|
/// `mapFixed`
pub fn mapfixed(x3370 : FixedMap, x3371 : Fixed) -> Fixed raise {
  let fixmap = x3370
  let fix = x3371
  match fixmap {
    { functionmap: fnmap, relationmap: relmap } =>
      match fix {
        { functions: fns, relations: rels } => {
          let fns_1 = compose(fnmap, fns)
          let rels_1 = compose(relmap, rels)
          Fixed::{ functions: fns_1, relations: rels_1, }
        }
        _ => raise @lib.MatchFailure("tscript.ml:5214")
      }
    _ => raise @lib.MatchFailure("tscript.ml:5213")
  }
}

///|
/// projectionMin
fn step_148() -> Unit raise {
  projectionmin_c.set(1L)
}

///|
let projectionmin_c : @lib.Cell[Int64] = @lib.Cell::new("projectionMin")

///|
/// `projectionMin`
pub fn projectionmin() -> Int64 {
  projectionmin_c.get()
}

///|
/// projectionMax
fn step_149() -> Unit raise {
  projectionmax_c.set(9L)
}

///|
let projectionmax_c : @lib.Cell[Int64] = @lib.Cell::new("projectionMax")

///|
/// `projectionMax`
pub fn projectionmax() -> Int64 {
  projectionmax_c.get()
}

///|
/// projectionList
fn step_150() -> Unit raise {
  projectionlist_c.set(minmaxinterval(projectionmin(), projectionmax()))
}

///|
let projectionlist_c : @lib.Cell[@list.List[Int64]] = @lib.Cell::new(
  "projectionList",
)

///|
/// `projectionList`
pub fn projectionlist() -> @list.List[Int64] {
  projectionlist_c.get()
}

///|
/// `projectionName`
pub fn projectionname(x3372 : Int64) -> Name raise {
  let i = x3372
  let _ = projectionmin() <= i ||
    @lib.raise_error(Bug::Bug("Model.projectionName: less than projectionMin"))
  let _ = i <= projectionmax() ||
    @lib.raise_error(
      Bug::Bug("Model.projectionName: greater than projectionMax"),
    )
  fromstring("project" + Int64::to_string(i))
}

///|
/// `projectionFn`
pub fn[TA, TB] projectionfn(
  x3373 : Int64,
  x3374 : TB,
  x3375 : @list.List[TA],
) -> TA? raise {
  let i = x3373
  let elts = x3375
  Some(@lib.list_nth(elts, @lib.int63_to_int(@lib.sub63(i, 1L))))
}

///|
/// `arityProjectionFixed`
pub fn arityprojectionfixed(x3376 : Int64) -> Fixed raise {
  let arity_1 = x3376
  let fns = ((x3382, x3383) => addproj_l(arity_1, x3382, x3383))(
    projectionmin(),
    emptyfunctions(),
  )
  let rels = emptyrelations()
  Fixed::{ functions: fns, relations: rels, }
}

///|
fn[TA, TB] mkproj_l(
  arity_1 : Int64,
  x3377 : Int64,
) -> ((Name, Int64), (TB) -> ((@list.List[TA]) -> TA? raise) raise) raise {
  let i = x3377
  (
    (projectionname(i), arity_1),
    fn(x3380 : TB) -> ((@list.List[TA]) -> TA? raise) raise {
      fn(x3381 : @list.List[TA]) -> TA? raise {
        ((x3378 : TB, x3379 : @list.List[TA]) => projectionfn(i, x3378, x3379))(
          x3380, x3381,
        )
      }
    },
  )
}

///|
fn[TC, TD] addproj_l(
  arity_1 : Int64,
  x3382 : Int64,
  x3383 : @omap.T[
    (String, Int64),
    (TD) -> ((@list.List[TC]) -> TC? raise) raise,
  ],
) -> @omap.T[(Name, Int64), (TD) -> ((@list.List[TC]) -> TC? raise) raise] raise {
  let addproj = (
    x3382 : Int64,
    x3383 : @omap.T[
      (String, Int64),
      (TD) -> ((@list.List[TC]) -> TC? raise) raise,
    ],
  ) => addproj_l(arity_1, x3382, x3383)
  let i_1 = x3382
  let acc = x3383
  if i_1 > arity_1 {
    acc
  } else {
    let t3384 = insert_v4(acc, (x3377 => mkproj_l(arity_1, x3377))(i_1))
    addproj(@lib.add63(i_1, 1L), t3384)
  }
}

///|
/// projectionFixed
fn step_151() -> Unit raise {
  projectionfixed_c.set(
    unionlistfixed(@lib.map(arityprojectionfixed, projectionlist())),
  )
}

///|
let projectionfixed_c : @lib.Cell[Fixed] = @lib.Cell::new("projectionFixed")

///|
/// `projectionFixed`
pub fn projectionfixed() -> Fixed {
  projectionfixed_c.get()
}

///|
/// numeralMin
fn step_152() -> Unit raise {
  numeralmin_c.set(-100L)
}

///|
let numeralmin_c : @lib.Cell[Int64] = @lib.Cell::new("numeralMin")

///|
/// `numeralMin`
pub fn numeralmin() -> Int64 {
  numeralmin_c.get()
}

///|
/// numeralMax
fn step_153() -> Unit raise {
  numeralmax_c.set(100L)
}

///|
let numeralmax_c : @lib.Cell[Int64] = @lib.Cell::new("numeralMax")

///|
/// `numeralMax`
pub fn numeralmax() -> Int64 {
  numeralmax_c.get()
}

///|
/// numeralList
fn step_154() -> Unit raise {
  numerallist_c.set(minmaxinterval(numeralmin(), numeralmax()))
}

///|
let numerallist_c : @lib.Cell[@list.List[Int64]] = @lib.Cell::new("numeralList")

///|
/// `numeralList`
pub fn numerallist() -> @list.List[Int64] {
  numerallist_c.get()
}

///|
/// `numeralName`
pub fn numeralname(x3385 : Int64) -> Name raise {
  let i = x3385
  let _ = numeralmin() <= i ||
    @lib.raise_error(Bug::Bug("Model.numeralName: less than numeralMin"))
  let _ = i <= numeralmax() ||
    @lib.raise_error(Bug::Bug("Model.numeralName: greater than numeralMax"))
  let s = if i < 0L {
    "negative" + Int64::to_string(@lib.neg63(i))
  } else {
    Int64::to_string(i)
  }
  fromstring(s)
}

///|
/// addName
fn step_155() -> Unit raise {
  addname_c.set(fromstring("+"))
}

///|
let addname_c : @lib.Cell[Name] = @lib.Cell::new("addName")

///|
/// `addName`
pub fn addname() -> Name {
  addname_c.get()
}

///|
/// divName
fn step_156() -> Unit raise {
  divname_c.set(fromstring("div"))
}

///|
let divname_c : @lib.Cell[Name] = @lib.Cell::new("divName")

///|
/// `divName`
pub fn divname() -> Name {
  divname_c.get()
}

///|
/// dividesName
fn step_157() -> Unit raise {
  dividesname_c.set(fromstring("divides"))
}

///|
let dividesname_c : @lib.Cell[Name] = @lib.Cell::new("dividesName")

///|
/// `dividesName`
pub fn dividesname() -> Name {
  dividesname_c.get()
}

///|
/// evenName
fn step_158() -> Unit raise {
  evenname_c.set(fromstring("even"))
}

///|
let evenname_c : @lib.Cell[Name] = @lib.Cell::new("evenName")

///|
/// `evenName`
pub fn evenname() -> Name {
  evenname_c.get()
}

///|
/// expName
fn step_159() -> Unit raise {
  expname_c.set(fromstring("exp"))
}

///|
let expname_c : @lib.Cell[Name] = @lib.Cell::new("expName")

///|
/// `expName`
pub fn expname() -> Name {
  expname_c.get()
}

///|
/// geName
fn step_160() -> Unit raise {
  gename_c.set(fromstring(">="))
}

///|
let gename_c : @lib.Cell[Name] = @lib.Cell::new("geName")

///|
/// `geName`
pub fn gename() -> Name {
  gename_c.get()
}

///|
/// gtName
fn step_161() -> Unit raise {
  gtname_c.set(fromstring(">"))
}

///|
let gtname_c : @lib.Cell[Name] = @lib.Cell::new("gtName")

///|
/// `gtName`
pub fn gtname() -> Name {
  gtname_c.get()
}

///|
/// isZeroName
fn step_162() -> Unit raise {
  iszeroname_c.set(fromstring("isZero"))
}

///|
let iszeroname_c : @lib.Cell[Name] = @lib.Cell::new("isZeroName")

///|
/// `isZeroName`
pub fn iszeroname() -> Name {
  iszeroname_c.get()
}

///|
/// leName
fn step_163() -> Unit raise {
  lename_c.set(fromstring("<="))
}

///|
let lename_c : @lib.Cell[Name] = @lib.Cell::new("leName")

///|
/// `leName`
pub fn lename() -> Name {
  lename_c.get()
}

///|
/// ltName
fn step_164() -> Unit raise {
  ltname_c.set(fromstring("<"))
}

///|
let ltname_c : @lib.Cell[Name] = @lib.Cell::new("ltName")

///|
/// `ltName`
pub fn ltname() -> Name {
  ltname_c.get()
}

///|
/// modName
fn step_165() -> Unit raise {
  modname_c.set(fromstring("mod"))
}

///|
let modname_c : @lib.Cell[Name] = @lib.Cell::new("modName")

///|
/// `modName`
pub fn modname() -> Name {
  modname_c.get()
}

///|
/// multName
fn step_166() -> Unit raise {
  multname_c.set(fromstring("*"))
}

///|
let multname_c : @lib.Cell[Name] = @lib.Cell::new("multName")

///|
/// `multName`
pub fn multname() -> Name {
  multname_c.get()
}

///|
/// negName
fn step_167() -> Unit raise {
  negname_c.set(fromstring("~"))
}

///|
let negname_c : @lib.Cell[Name] = @lib.Cell::new("negName")

///|
/// `negName`
pub fn negname() -> Name {
  negname_c.get()
}

///|
/// oddName
fn step_168() -> Unit raise {
  oddname_c.set(fromstring("odd"))
}

///|
let oddname_c : @lib.Cell[Name] = @lib.Cell::new("oddName")

///|
/// `oddName`
pub fn oddname() -> Name {
  oddname_c.get()
}

///|
/// preName
fn step_169() -> Unit raise {
  prename_c.set(fromstring("pre"))
}

///|
let prename_c : @lib.Cell[Name] = @lib.Cell::new("preName")

///|
/// `preName`
pub fn prename() -> Name {
  prename_c.get()
}

///|
/// subName
fn step_170() -> Unit raise {
  subname_c.set(fromstring("-"))
}

///|
let subname_c : @lib.Cell[Name] = @lib.Cell::new("subName")

///|
/// `subName`
pub fn subname() -> Name {
  subname_c.get()
}

///|
/// sucName
fn step_171() -> Unit raise {
  sucname_c.set(fromstring("suc"))
}

///|
let sucname_c : @lib.Cell[Name] = @lib.Cell::new("sucName")

///|
/// `sucName`
pub fn sucname() -> Name {
  sucname_c.get()
}

///|
/// `modN`
pub fn modn(x3386 : Size) -> ((Int64) -> Int64 raise) raise {
  match x3386 {
    { size: n } =>
      fn(x3387 : Int64) -> Int64 raise {
        let x = x3387
        @lib.mod63(x, n)
      }
  }
}

///|
/// `oneN`
pub fn onen(x3388 : Size) -> Int64 raise {
  let sz = x3388
  modn(sz)(1L)
}

///|
/// `multN`
pub fn multn(x3389 : Size, x3390 : (Int64, Int64)) -> Int64 raise {
  let sz = x3389
  let (x, y) = x3390
  let t3391 = @lib.mul63(x, y)
  modn(sz)(t3391)
}

///|
/// `numeralFn`
pub fn numeralfn(x3392 : Int64, x3393 : Size) -> Int64? raise {
  let i = x3392
  let sz = x3393
  Some(modn(sz)(i))
}

///|
/// `addFn`
pub fn addfn(x3394 : Size, x3395 : Int64, x3396 : Int64) -> Int64? raise {
  let sz = x3394
  let x = x3395
  let y = x3396
  let t3397 = @lib.add63(x, y)
  Some(modn(sz)(t3397))
}

///|
/// `divFn`
pub fn divfn(
  x3398 : Size,
) -> ((Int64) -> ((Int64) -> Int64? raise) raise) raise {
  match x3398 {
    { size: n } =>
      fn(x3399 : Int64) -> ((Int64) -> Int64? raise) raise {
        let x = x3399
        fn(x3400 : Int64) -> Int64? raise {
          let y = x3400
          let y_1 = if y == 0L { n } else { y }
          Some(@lib.div63(x, y_1))
        }
      }
  }
}

///|
/// `expFn`
pub fn expfn(x3401 : Size, x3402 : Int64, x3403 : Int64) -> Int64? raise {
  let sz = x3401
  let x = x3402
  let y = x3403
  let t3405 = onen(sz)
  Some(exp((x3404 : (Int64, Int64)) => multn(sz, x3404))(x)(y)(t3405))
}

///|
/// `modFn`
pub fn modfn(
  x3406 : Size,
) -> ((Int64) -> ((Int64) -> Int64? raise) raise) raise {
  match x3406 {
    { size: n } =>
      fn(x3407 : Int64) -> ((Int64) -> Int64? raise) raise {
        let x = x3407
        fn(x3408 : Int64) -> Int64? raise {
          let y = x3408
          let y_1 = if y == 0L { n } else { y }
          Some(@lib.mod63(x, y_1))
        }
      }
  }
}

///|
/// `multFn`
pub fn multfn(x3409 : Size, x3410 : Int64, x3411 : Int64) -> Int64? raise {
  let sz = x3409
  let x = x3410
  let y = x3411
  Some(multn(sz, (x, y)))
}

///|
/// `negFn`
pub fn negfn(x3412 : Size) -> ((Int64) -> Int64? raise) raise {
  match x3412 {
    { size: n } =>
      fn(x3413 : Int64) -> Int64? raise {
        let x = x3413
        Some(if x == 0L { 0L } else { @lib.sub63(n, x) })
      }
  }
}

///|
/// `preFn`
pub fn prefn(x3414 : Size) -> ((Int64) -> Int64? raise) raise {
  match x3414 {
    { size: n } =>
      fn(x3415 : Int64) -> Int64? raise {
        let x = x3415
        Some(if x == 0L { @lib.sub63(n, 1L) } else { @lib.sub63(x, 1L) })
      }
  }
}

///|
/// `subFn`
pub fn subfn(
  x3416 : Size,
) -> ((Int64) -> ((Int64) -> Int64? raise) raise) raise {
  match x3416 {
    { size: n } =>
      fn(x3417 : Int64) -> ((Int64) -> Int64? raise) raise {
        let x = x3417
        fn(x3418 : Int64) -> Int64? raise {
          let y = x3418
          Some(
            if x < y {
              @lib.sub63(@lib.add63(n, x), y)
            } else {
              @lib.sub63(x, y)
            },
          )
        }
      }
  }
}

///|
/// `sucFn`
pub fn sucfn(x3419 : Size) -> ((Int64) -> Int64? raise) raise {
  match x3419 {
    { size: n } =>
      fn(x3420 : Int64) -> Int64? raise {
        let x = x3420
        Some(if x == @lib.sub63(n, 1L) { 0L } else { @lib.add63(x, 1L) })
      }
  }
}

///|
/// `dividesRel`
pub fn[TA] dividesrel(x3421 : TA, x3422 : Int64, x3423 : Int64) -> Bool? raise {
  let x = x3422
  let y = x3423
  Some(divides_v1(x)(y))
}

///|
/// `evenRel`
pub fn[TA] evenrel(x3424 : TA, x3425 : Int64) -> Bool? raise {
  let x = x3425
  Some(@lib.mod63(x, 2L) == 0L)
}

///|
/// `geRel`
pub fn[TA, TB : Eq + @lib.OCompare + @lib.OHash] gerel(
  x3426 : TA,
  x3427 : TB,
  x3428 : TB,
) -> Bool? raise {
  let x = x3427
  let y = x3428
  Some(@lib.compare(x, y) >= 0)
}

///|
/// `gtRel`
pub fn[TA, TB : Eq + @lib.OCompare + @lib.OHash] gtrel(
  x3429 : TA,
  x3430 : TB,
  x3431 : TB,
) -> Bool? raise {
  let x = x3430
  let y = x3431
  Some(@lib.compare(x, y) > 0)
}

///|
/// `isZeroRel`
pub fn[TA] iszerorel(x3432 : TA, x3433 : Int64) -> Bool? raise {
  let x = x3433
  Some(x == 0L)
}

///|
/// `leRel`
pub fn[TA, TB : Eq + @lib.OCompare + @lib.OHash] lerel(
  x3434 : TA,
  x3435 : TB,
  x3436 : TB,
) -> Bool? raise {
  let x = x3435
  let y = x3436
  Some(@lib.compare(x, y) <= 0)
}

///|
/// `ltRel`
pub fn[TA, TB : Eq + @lib.OCompare + @lib.OHash] ltrel(
  x3437 : TA,
  x3438 : TB,
  x3439 : TB,
) -> Bool? raise {
  let x = x3438
  let y = x3439
  Some(@lib.compare(x, y) < 0)
}

///|
/// `oddRel`
pub fn[TA] oddrel(x3440 : TA, x3441 : Int64) -> Bool? raise {
  let x = x3441
  Some(@lib.mod63(x, 2L) == 1L)
}

///|
/// modularFixed
fn step_172() -> Unit raise {
  let fns = fromlist_v7(
    @lib.map(
      fn(
        x3442 : Int64,
      ) -> (
        (String, Int64),
        (Size) -> ((@list.List[Int64]) -> Int64? raise) raise,
      ) raise {
        let i = x3442
        (
          (numeralname(i), 0L),
          fn(x3446 : Size) -> ((@list.List[Int64]) -> Int64? raise) raise {
            fn(x3447 : @list.List[Int64]) -> Int64? raise {
              ((x3444 : Size, x3445 : @list.List[Int64]) => {
                fixed0((x3443 : Size) => numeralfn(i, x3443), x3444, x3445)
              })(x3446, x3447)
            }
          },
        )
      },
      numerallist(),
    ).concat(
      @list.List([
        (
          (addname(), 2L),
          fn(x3453 : Size) -> ((@list.List[Int64]) -> Int64? raise) raise {
            fn(x3454 : @list.List[Int64]) -> Int64? raise {
              ((x3451 : Size, x3452 : @list.List[Int64]) => {
                fixed2(
                  fn(
                    x3448 : Size,
                  ) -> ((Int64) -> ((Int64) -> Int64? raise) raise) raise {
                    fn(x3449 : Int64) -> ((Int64) -> Int64? raise) raise {
                      fn(x3450 : Int64) -> Int64? raise {
                        addfn(x3448, x3449, x3450)
                      }
                    }
                  },
                  x3451,
                  x3452,
                )
              })(x3453, x3454)
            }
          },
        ),
        (
          (divname(), 2L),
          fn(x3457 : Size) -> ((@list.List[Int64]) -> Int64? raise) raise {
            fn(x3458 : @list.List[Int64]) -> Int64? raise {
              ((x3455 : Size, x3456 : @list.List[Int64]) => {
                fixed2(divfn, x3455, x3456)
              })(x3457, x3458)
            }
          },
        ),
        (
          (expname(), 2L),
          fn(x3464 : Size) -> ((@list.List[Int64]) -> Int64? raise) raise {
            fn(x3465 : @list.List[Int64]) -> Int64? raise {
              ((x3462 : Size, x3463 : @list.List[Int64]) => {
                fixed2(
                  fn(
                    x3459 : Size,
                  ) -> ((Int64) -> ((Int64) -> Int64? raise) raise) raise {
                    fn(x3460 : Int64) -> ((Int64) -> Int64? raise) raise {
                      fn(x3461 : Int64) -> Int64? raise {
                        expfn(x3459, x3460, x3461)
                      }
                    }
                  },
                  x3462,
                  x3463,
                )
              })(x3464, x3465)
            }
          },
        ),
        (
          (modname(), 2L),
          fn(x3468 : Size) -> ((@list.List[Int64]) -> Int64? raise) raise {
            fn(x3469 : @list.List[Int64]) -> Int64? raise {
              ((x3466 : Size, x3467 : @list.List[Int64]) => {
                fixed2(modfn, x3466, x3467)
              })(x3468, x3469)
            }
          },
        ),
        (
          (multname(), 2L),
          fn(x3475 : Size) -> ((@list.List[Int64]) -> Int64? raise) raise {
            fn(x3476 : @list.List[Int64]) -> Int64? raise {
              ((x3473 : Size, x3474 : @list.List[Int64]) => {
                fixed2(
                  fn(
                    x3470 : Size,
                  ) -> ((Int64) -> ((Int64) -> Int64? raise) raise) raise {
                    fn(x3471 : Int64) -> ((Int64) -> Int64? raise) raise {
                      fn(x3472 : Int64) -> Int64? raise {
                        multfn(x3470, x3471, x3472)
                      }
                    }
                  },
                  x3473,
                  x3474,
                )
              })(x3475, x3476)
            }
          },
        ),
        (
          (negname(), 1L),
          fn(x3479 : Size) -> ((@list.List[Int64]) -> Int64? raise) raise {
            fn(x3480 : @list.List[Int64]) -> Int64? raise {
              ((x3477 : Size, x3478 : @list.List[Int64]) => {
                fixed1(negfn, x3477, x3478)
              })(x3479, x3480)
            }
          },
        ),
        (
          (prename(), 1L),
          fn(x3483 : Size) -> ((@list.List[Int64]) -> Int64? raise) raise {
            fn(x3484 : @list.List[Int64]) -> Int64? raise {
              ((x3481 : Size, x3482 : @list.List[Int64]) => {
                fixed1(prefn, x3481, x3482)
              })(x3483, x3484)
            }
          },
        ),
        (
          (subname(), 2L),
          fn(x3487 : Size) -> ((@list.List[Int64]) -> Int64? raise) raise {
            fn(x3488 : @list.List[Int64]) -> Int64? raise {
              ((x3485 : Size, x3486 : @list.List[Int64]) => {
                fixed2(subfn, x3485, x3486)
              })(x3487, x3488)
            }
          },
        ),
        (
          (sucname(), 1L),
          fn(x3491 : Size) -> ((@list.List[Int64]) -> Int64? raise) raise {
            fn(x3492 : @list.List[Int64]) -> Int64? raise {
              ((x3489 : Size, x3490 : @list.List[Int64]) => {
                fixed1(sucfn, x3489, x3490)
              })(x3491, x3492)
            }
          },
        ),
      ]),
    ),
  )
  let rels = fromlist_v7(
    @list.List([
      (
        (dividesname(), 2L),
        fn(x3498 : Size) -> ((@list.List[Int64]) -> Bool? raise) raise {
          fn(x3499 : @list.List[Int64]) -> Bool? raise {
            ((x3496 : Size, x3497 : @list.List[Int64]) => {
              fixed2(
                fn(
                  x3493 : Size,
                ) -> ((Int64) -> ((Int64) -> Bool? raise) raise) raise {
                  fn(x3494 : Int64) -> ((Int64) -> Bool? raise) raise {
                    fn(x3495 : Int64) -> Bool? raise {
                      dividesrel(x3493, x3494, x3495)
                    }
                  }
                },
                x3496,
                x3497,
              )
            })(x3498, x3499)
          }
        },
      ),
      (
        (evenname(), 1L),
        fn(x3504 : Size) -> ((@list.List[Int64]) -> Bool? raise) raise {
          fn(x3505 : @list.List[Int64]) -> Bool? raise {
            ((x3502 : Size, x3503 : @list.List[Int64]) => {
              fixed1(
                fn(x3500 : Size) -> ((Int64) -> Bool? raise) raise {
                  fn(x3501 : Int64) -> Bool? raise { evenrel(x3500, x3501) }
                },
                x3502,
                x3503,
              )
            })(x3504, x3505)
          }
        },
      ),
      (
        (gename(), 2L),
        fn(x3511 : Size) -> ((@list.List[Int64]) -> Bool? raise) raise {
          fn(x3512 : @list.List[Int64]) -> Bool? raise {
            ((x3509 : Size, x3510 : @list.List[Int64]) => {
              fixed2(
                fn(
                  x3506 : Size,
                ) -> ((Int64) -> ((Int64) -> Bool? raise) raise) raise {
                  fn(x3507 : Int64) -> ((Int64) -> Bool? raise) raise {
                    fn(x3508 : Int64) -> Bool? raise {
                      gerel(x3506, x3507, x3508)
                    }
                  }
                },
                x3509,
                x3510,
              )
            })(x3511, x3512)
          }
        },
      ),
      (
        (gtname(), 2L),
        fn(x3518 : Size) -> ((@list.List[Int64]) -> Bool? raise) raise {
          fn(x3519 : @list.List[Int64]) -> Bool? raise {
            ((x3516 : Size, x3517 : @list.List[Int64]) => {
              fixed2(
                fn(
                  x3513 : Size,
                ) -> ((Int64) -> ((Int64) -> Bool? raise) raise) raise {
                  fn(x3514 : Int64) -> ((Int64) -> Bool? raise) raise {
                    fn(x3515 : Int64) -> Bool? raise {
                      gtrel(x3513, x3514, x3515)
                    }
                  }
                },
                x3516,
                x3517,
              )
            })(x3518, x3519)
          }
        },
      ),
      (
        (iszeroname(), 1L),
        fn(x3524 : Size) -> ((@list.List[Int64]) -> Bool? raise) raise {
          fn(x3525 : @list.List[Int64]) -> Bool? raise {
            ((x3522 : Size, x3523 : @list.List[Int64]) => {
              fixed1(
                fn(x3520 : Size) -> ((Int64) -> Bool? raise) raise {
                  fn(x3521 : Int64) -> Bool? raise { iszerorel(x3520, x3521) }
                },
                x3522,
                x3523,
              )
            })(x3524, x3525)
          }
        },
      ),
      (
        (lename(), 2L),
        fn(x3531 : Size) -> ((@list.List[Int64]) -> Bool? raise) raise {
          fn(x3532 : @list.List[Int64]) -> Bool? raise {
            ((x3529 : Size, x3530 : @list.List[Int64]) => {
              fixed2(
                fn(
                  x3526 : Size,
                ) -> ((Int64) -> ((Int64) -> Bool? raise) raise) raise {
                  fn(x3527 : Int64) -> ((Int64) -> Bool? raise) raise {
                    fn(x3528 : Int64) -> Bool? raise {
                      lerel(x3526, x3527, x3528)
                    }
                  }
                },
                x3529,
                x3530,
              )
            })(x3531, x3532)
          }
        },
      ),
      (
        (ltname(), 2L),
        fn(x3538 : Size) -> ((@list.List[Int64]) -> Bool? raise) raise {
          fn(x3539 : @list.List[Int64]) -> Bool? raise {
            ((x3536 : Size, x3537 : @list.List[Int64]) => {
              fixed2(
                fn(
                  x3533 : Size,
                ) -> ((Int64) -> ((Int64) -> Bool? raise) raise) raise {
                  fn(x3534 : Int64) -> ((Int64) -> Bool? raise) raise {
                    fn(x3535 : Int64) -> Bool? raise {
                      ltrel(x3533, x3534, x3535)
                    }
                  }
                },
                x3536,
                x3537,
              )
            })(x3538, x3539)
          }
        },
      ),
      (
        (oddname(), 1L),
        fn(x3544 : Size) -> ((@list.List[Int64]) -> Bool? raise) raise {
          fn(x3545 : @list.List[Int64]) -> Bool? raise {
            ((x3542 : Size, x3543 : @list.List[Int64]) => {
              fixed1(
                fn(x3540 : Size) -> ((Int64) -> Bool? raise) raise {
                  fn(x3541 : Int64) -> Bool? raise { oddrel(x3540, x3541) }
                },
                x3542,
                x3543,
              )
            })(x3544, x3545)
          }
        },
      ),
    ]),
  )
  modularfixed_c.set(Fixed::{ functions: fns, relations: rels, })
}

///|
let modularfixed_c : @lib.Cell[Fixed] = @lib.Cell::new("modularFixed")

///|
/// `modularFixed`
pub fn modularfixed() -> Fixed {
  modularfixed_c.get()
}

///|
/// `cutN`
pub fn cutn(x3546 : Size) -> ((Int64) -> Int64 raise) raise {
  match x3546 {
    { size: n } =>
      fn(x3547 : Int64) -> Int64 raise {
        let x = x3547
        if x >= n {
          @lib.sub63(n, 1L)
        } else {
          x
        }
      }
  }
}

///|
/// `oneN`
pub fn onen_v1(x3548 : Size) -> Int64 raise {
  let sz = x3548
  cutn(sz)(1L)
}

///|
/// `multN`
pub fn multn_v1(x3549 : Size, x3550 : (Int64, Int64)) -> Int64 raise {
  let sz = x3549
  let (x, y) = x3550
  let t3551 = @lib.mul63(x, y)
  cutn(sz)(t3551)
}

///|
/// `numeralFn`
pub fn numeralfn_v1(x3552 : Int64, x3553 : Size) -> Int64? raise {
  let i = x3552
  let sz = x3553
  if i < 0L {
    None
  } else {
    Some(cutn(sz)(i))
  }
}

///|
/// `addFn`
pub fn addfn_v1(x3554 : Size, x3555 : Int64, x3556 : Int64) -> Int64? raise {
  let sz = x3554
  let x = x3555
  let y = x3556
  let t3557 = @lib.add63(x, y)
  Some(cutn(sz)(t3557))
}

///|
/// `divFn`
pub fn[TA] divfn_v1(x3558 : TA, x3559 : Int64, x3560 : Int64) -> Int64? raise {
  let x = x3559
  let y = x3560
  if y == 0L {
    None
  } else {
    Some(@lib.div63(x, y))
  }
}

///|
/// `expFn`
pub fn expfn_v1(x3561 : Size, x3562 : Int64, x3563 : Int64) -> Int64? raise {
  let sz = x3561
  let x = x3562
  let y = x3563
  let t3565 = onen_v1(sz)
  Some(exp((x3564 : (Int64, Int64)) => multn_v1(sz, x3564))(x)(y)(t3565))
}

///|
/// `modFn`
pub fn modfn_v1(
  x3566 : Size,
) -> ((Int64) -> ((Int64) -> Int64? raise) raise) raise {
  match x3566 {
    { size: n } =>
      fn(x3567 : Int64) -> ((Int64) -> Int64? raise) raise {
        let x = x3567
        fn(x3568 : Int64) -> Int64? raise {
          let y = x3568
          if y == 0L || x == @lib.sub63(n, 1L) {
            None
          } else {
            Some(@lib.mod63(x, y))
          }
        }
      }
  }
}

///|
/// `multFn`
pub fn multfn_v1(x3569 : Size, x3570 : Int64, x3571 : Int64) -> Int64? raise {
  let sz = x3569
  let x = x3570
  let y = x3571
  Some(multn_v1(sz, (x, y)))
}

///|
/// `negFn`
pub fn[TA] negfn_v1(x3572 : TA, x3573 : Int64) -> Int64? raise {
  let x = x3573
  if x == 0L {
    Some(0L)
  } else {
    None
  }
}

///|
/// `preFn`
pub fn[TA] prefn_v1(x3574 : TA, x3575 : Int64) -> Int64? raise {
  let x = x3575
  if x == 0L {
    None
  } else {
    Some(@lib.sub63(x, 1L))
  }
}

///|
/// `subFn`
pub fn subfn_v1(
  x3576 : Size,
) -> ((Int64) -> ((Int64) -> Int64? raise) raise) raise {
  match x3576 {
    { size: n } =>
      fn(x3577 : Int64) -> ((Int64) -> Int64? raise) raise {
        let x = x3577
        fn(x3578 : Int64) -> Int64? raise {
          let y = x3578
          if y == 0L {
            Some(x)
          } else if x == @lib.sub63(n, 1L) || x < y {
            None
          } else {
            Some(@lib.sub63(x, y))
          }
        }
      }
  }
}

///|
/// `sucFn`
pub fn sucfn_v1(x3579 : Size, x3580 : Int64) -> Int64? raise {
  let sz = x3579
  let x = x3580
  let t3581 = @lib.add63(x, 1L)
  Some(cutn(sz)(t3581))
}

///|
/// `dividesRel`
pub fn dividesrel_v1(
  x3582 : Size,
) -> ((Int64) -> ((Int64) -> Bool? raise) raise) raise {
  match x3582 {
    { size: n } =>
      fn(x3583 : Int64) -> ((Int64) -> Bool? raise) raise {
        let x = x3583
        fn(x3584 : Int64) -> Bool? raise {
          let y = x3584
          if x == 1L || y == 0L {
            Some(true)
          } else if x == 0L {
            Some(false)
          } else if y == @lib.sub63(n, 1L) {
            None
          } else {
            Some(divides_v1(x)(y))
          }
        }
      }
  }
}

///|
/// `evenRel`
pub fn evenrel_v1(x3585 : Size) -> ((Int64) -> Bool? raise) raise {
  match x3585 {
    { size: n } =>
      fn(x3586 : Int64) -> Bool? raise {
        let x = x3586
        if x == @lib.sub63(n, 1L) {
          None
        } else {
          Some(@lib.mod63(x, 2L) == 0L)
        }
      }
  }
}

///|
/// `geRel`
pub fn gerel_v1(
  x3587 : Size,
) -> ((Int64) -> ((Int64) -> Bool? raise) raise) raise {
  match x3587 {
    { size: n } =>
      fn(x3588 : Int64) -> ((Int64) -> Bool? raise) raise {
        let y = x3588
        fn(x3589 : Int64) -> Bool? raise {
          let x = x3589
          if x == @lib.sub63(n, 1L) {
            if y == @lib.sub63(n, 1L) {
              None
            } else {
              Some(false)
            }
          } else if y == @lib.sub63(n, 1L) {
            Some(true)
          } else {
            Some(x <= y)
          }
        }
      }
  }
}

///|
/// `gtRel`
pub fn gtrel_v1(
  x3590 : Size,
) -> ((Int64) -> ((Int64) -> Bool? raise) raise) raise {
  match x3590 {
    { size: n } =>
      fn(x3591 : Int64) -> ((Int64) -> Bool? raise) raise {
        let y = x3591
        fn(x3592 : Int64) -> Bool? raise {
          let x = x3592
          if x == @lib.sub63(n, 1L) {
            if y == @lib.sub63(n, 1L) {
              None
            } else {
              Some(false)
            }
          } else if y == @lib.sub63(n, 1L) {
            Some(true)
          } else {
            Some(x < y)
          }
        }
      }
  }
}

///|
/// `isZeroRel`
pub fn[TA] iszerorel_v1(x3593 : TA, x3594 : Int64) -> Bool? raise {
  let x = x3594
  Some(x == 0L)
}

///|
/// `leRel`
pub fn lerel_v1(
  x3595 : Size,
) -> ((Int64) -> ((Int64) -> Bool? raise) raise) raise {
  match x3595 {
    { size: n } =>
      fn(x3596 : Int64) -> ((Int64) -> Bool? raise) raise {
        let x = x3596
        fn(x3597 : Int64) -> Bool? raise {
          let y = x3597
          if x == @lib.sub63(n, 1L) {
            if y == @lib.sub63(n, 1L) {
              None
            } else {
              Some(false)
            }
          } else if y == @lib.sub63(n, 1L) {
            Some(true)
          } else {
            Some(x <= y)
          }
        }
      }
  }
}

///|
/// `ltRel`
pub fn ltrel_v1(
  x3598 : Size,
) -> ((Int64) -> ((Int64) -> Bool? raise) raise) raise {
  match x3598 {
    { size: n } =>
      fn(x3599 : Int64) -> ((Int64) -> Bool? raise) raise {
        let x = x3599
        fn(x3600 : Int64) -> Bool? raise {
          let y = x3600
          if x == @lib.sub63(n, 1L) {
            if y == @lib.sub63(n, 1L) {
              None
            } else {
              Some(false)
            }
          } else if y == @lib.sub63(n, 1L) {
            Some(true)
          } else {
            Some(x < y)
          }
        }
      }
  }
}

///|
/// `oddRel`
pub fn oddrel_v1(x3601 : Size) -> ((Int64) -> Bool? raise) raise {
  match x3601 {
    { size: n } =>
      fn(x3602 : Int64) -> Bool? raise {
        let x = x3602
        if x == @lib.sub63(n, 1L) {
          None
        } else {
          Some(@lib.mod63(x, 2L) == 1L)
        }
      }
  }
}

///|
/// overflowFixed
fn step_173() -> Unit raise {
  let fns = fromlist_v7(
    @lib.map(
      fn(
        x3603 : Int64,
      ) -> (
        (String, Int64),
        (Size) -> ((@list.List[Int64]) -> Int64? raise) raise,
      ) raise {
        let i = x3603
        (
          (numeralname(i), 0L),
          fn(x3607 : Size) -> ((@list.List[Int64]) -> Int64? raise) raise {
            fn(x3608 : @list.List[Int64]) -> Int64? raise {
              ((x3605 : Size, x3606 : @list.List[Int64]) => {
                fixed0((x3604 : Size) => numeralfn_v1(i, x3604), x3605, x3606)
              })(x3607, x3608)
            }
          },
        )
      },
      numerallist(),
    ).concat(
      @list.List([
        (
          (addname(), 2L),
          fn(x3614 : Size) -> ((@list.List[Int64]) -> Int64? raise) raise {
            fn(x3615 : @list.List[Int64]) -> Int64? raise {
              ((x3612 : Size, x3613 : @list.List[Int64]) => {
                fixed2(
                  fn(
                    x3609 : Size,
                  ) -> ((Int64) -> ((Int64) -> Int64? raise) raise) raise {
                    fn(x3610 : Int64) -> ((Int64) -> Int64? raise) raise {
                      fn(x3611 : Int64) -> Int64? raise {
                        addfn_v1(x3609, x3610, x3611)
                      }
                    }
                  },
                  x3612,
                  x3613,
                )
              })(x3614, x3615)
            }
          },
        ),
        (
          (divname(), 2L),
          fn(x3621 : Size) -> ((@list.List[Int64]) -> Int64? raise) raise {
            fn(x3622 : @list.List[Int64]) -> Int64? raise {
              ((x3619 : Size, x3620 : @list.List[Int64]) => {
                fixed2(
                  fn(
                    x3616 : Size,
                  ) -> ((Int64) -> ((Int64) -> Int64? raise) raise) raise {
                    fn(x3617 : Int64) -> ((Int64) -> Int64? raise) raise {
                      fn(x3618 : Int64) -> Int64? raise {
                        divfn_v1(x3616, x3617, x3618)
                      }
                    }
                  },
                  x3619,
                  x3620,
                )
              })(x3621, x3622)
            }
          },
        ),
        (
          (expname(), 2L),
          fn(x3628 : Size) -> ((@list.List[Int64]) -> Int64? raise) raise {
            fn(x3629 : @list.List[Int64]) -> Int64? raise {
              ((x3626 : Size, x3627 : @list.List[Int64]) => {
                fixed2(
                  fn(
                    x3623 : Size,
                  ) -> ((Int64) -> ((Int64) -> Int64? raise) raise) raise {
                    fn(x3624 : Int64) -> ((Int64) -> Int64? raise) raise {
                      fn(x3625 : Int64) -> Int64? raise {
                        expfn_v1(x3623, x3624, x3625)
                      }
                    }
                  },
                  x3626,
                  x3627,
                )
              })(x3628, x3629)
            }
          },
        ),
        (
          (modname(), 2L),
          fn(x3632 : Size) -> ((@list.List[Int64]) -> Int64? raise) raise {
            fn(x3633 : @list.List[Int64]) -> Int64? raise {
              ((x3630 : Size, x3631 : @list.List[Int64]) => {
                fixed2(modfn_v1, x3630, x3631)
              })(x3632, x3633)
            }
          },
        ),
        (
          (multname(), 2L),
          fn(x3639 : Size) -> ((@list.List[Int64]) -> Int64? raise) raise {
            fn(x3640 : @list.List[Int64]) -> Int64? raise {
              ((x3637 : Size, x3638 : @list.List[Int64]) => {
                fixed2(
                  fn(
                    x3634 : Size,
                  ) -> ((Int64) -> ((Int64) -> Int64? raise) raise) raise {
                    fn(x3635 : Int64) -> ((Int64) -> Int64? raise) raise {
                      fn(x3636 : Int64) -> Int64? raise {
                        multfn_v1(x3634, x3635, x3636)
                      }
                    }
                  },
                  x3637,
                  x3638,
                )
              })(x3639, x3640)
            }
          },
        ),
        (
          (negname(), 1L),
          fn(x3645 : Size) -> ((@list.List[Int64]) -> Int64? raise) raise {
            fn(x3646 : @list.List[Int64]) -> Int64? raise {
              ((x3643 : Size, x3644 : @list.List[Int64]) => {
                fixed1(
                  fn(x3641 : Size) -> ((Int64) -> Int64? raise) raise {
                    fn(x3642 : Int64) -> Int64? raise { negfn_v1(x3641, x3642) }
                  },
                  x3643,
                  x3644,
                )
              })(x3645, x3646)
            }
          },
        ),
        (
          (prename(), 1L),
          fn(x3651 : Size) -> ((@list.List[Int64]) -> Int64? raise) raise {
            fn(x3652 : @list.List[Int64]) -> Int64? raise {
              ((x3649 : Size, x3650 : @list.List[Int64]) => {
                fixed1(
                  fn(x3647 : Size) -> ((Int64) -> Int64? raise) raise {
                    fn(x3648 : Int64) -> Int64? raise { prefn_v1(x3647, x3648) }
                  },
                  x3649,
                  x3650,
                )
              })(x3651, x3652)
            }
          },
        ),
        (
          (subname(), 2L),
          fn(x3655 : Size) -> ((@list.List[Int64]) -> Int64? raise) raise {
            fn(x3656 : @list.List[Int64]) -> Int64? raise {
              ((x3653 : Size, x3654 : @list.List[Int64]) => {
                fixed2(subfn_v1, x3653, x3654)
              })(x3655, x3656)
            }
          },
        ),
        (
          (sucname(), 1L),
          fn(x3661 : Size) -> ((@list.List[Int64]) -> Int64? raise) raise {
            fn(x3662 : @list.List[Int64]) -> Int64? raise {
              ((x3659 : Size, x3660 : @list.List[Int64]) => {
                fixed1(
                  fn(x3657 : Size) -> ((Int64) -> Int64? raise) raise {
                    fn(x3658 : Int64) -> Int64? raise { sucfn_v1(x3657, x3658) }
                  },
                  x3659,
                  x3660,
                )
              })(x3661, x3662)
            }
          },
        ),
      ]),
    ),
  )
  let rels = fromlist_v7(
    @list.List([
      (
        (dividesname(), 2L),
        fn(x3665 : Size) -> ((@list.List[Int64]) -> Bool? raise) raise {
          fn(x3666 : @list.List[Int64]) -> Bool? raise {
            ((x3663 : Size, x3664 : @list.List[Int64]) => {
              fixed2(dividesrel_v1, x3663, x3664)
            })(x3665, x3666)
          }
        },
      ),
      (
        (evenname(), 1L),
        fn(x3669 : Size) -> ((@list.List[Int64]) -> Bool? raise) raise {
          fn(x3670 : @list.List[Int64]) -> Bool? raise {
            ((x3667 : Size, x3668 : @list.List[Int64]) => {
              fixed1(evenrel_v1, x3667, x3668)
            })(x3669, x3670)
          }
        },
      ),
      (
        (gename(), 2L),
        fn(x3673 : Size) -> ((@list.List[Int64]) -> Bool? raise) raise {
          fn(x3674 : @list.List[Int64]) -> Bool? raise {
            ((x3671 : Size, x3672 : @list.List[Int64]) => {
              fixed2(gerel_v1, x3671, x3672)
            })(x3673, x3674)
          }
        },
      ),
      (
        (gtname(), 2L),
        fn(x3677 : Size) -> ((@list.List[Int64]) -> Bool? raise) raise {
          fn(x3678 : @list.List[Int64]) -> Bool? raise {
            ((x3675 : Size, x3676 : @list.List[Int64]) => {
              fixed2(gtrel_v1, x3675, x3676)
            })(x3677, x3678)
          }
        },
      ),
      (
        (iszeroname(), 1L),
        fn(x3683 : Size) -> ((@list.List[Int64]) -> Bool? raise) raise {
          fn(x3684 : @list.List[Int64]) -> Bool? raise {
            ((x3681 : Size, x3682 : @list.List[Int64]) => {
              fixed1(
                fn(x3679 : Size) -> ((Int64) -> Bool? raise) raise {
                  fn(x3680 : Int64) -> Bool? raise {
                    iszerorel_v1(x3679, x3680)
                  }
                },
                x3681,
                x3682,
              )
            })(x3683, x3684)
          }
        },
      ),
      (
        (lename(), 2L),
        fn(x3687 : Size) -> ((@list.List[Int64]) -> Bool? raise) raise {
          fn(x3688 : @list.List[Int64]) -> Bool? raise {
            ((x3685 : Size, x3686 : @list.List[Int64]) => {
              fixed2(lerel_v1, x3685, x3686)
            })(x3687, x3688)
          }
        },
      ),
      (
        (ltname(), 2L),
        fn(x3691 : Size) -> ((@list.List[Int64]) -> Bool? raise) raise {
          fn(x3692 : @list.List[Int64]) -> Bool? raise {
            ((x3689 : Size, x3690 : @list.List[Int64]) => {
              fixed2(ltrel_v1, x3689, x3690)
            })(x3691, x3692)
          }
        },
      ),
      (
        (oddname(), 1L),
        fn(x3695 : Size) -> ((@list.List[Int64]) -> Bool? raise) raise {
          fn(x3696 : @list.List[Int64]) -> Bool? raise {
            ((x3693 : Size, x3694 : @list.List[Int64]) => {
              fixed1(oddrel_v1, x3693, x3694)
            })(x3695, x3696)
          }
        },
      ),
    ]),
  )
  overflowfixed_c.set(Fixed::{ functions: fns, relations: rels, })
}

///|
let overflowfixed_c : @lib.Cell[Fixed] = @lib.Cell::new("overflowFixed")

///|
/// `overflowFixed`
pub fn overflowfixed() -> Fixed {
  overflowfixed_c.get()
}

///|
/// cardName
fn step_174() -> Unit raise {
  cardname_c.set(fromstring("card"))
}

///|
let cardname_c : @lib.Cell[Name] = @lib.Cell::new("cardName")

///|
/// `cardName`
pub fn cardname() -> Name {
  cardname_c.get()
}

///|
/// complementName
fn step_175() -> Unit raise {
  complementname_c.set(fromstring("complement"))
}

///|
let complementname_c : @lib.Cell[Name] = @lib.Cell::new("complementName")

///|
/// `complementName`
pub fn complementname() -> Name {
  complementname_c.get()
}

///|
/// differenceName
fn step_176() -> Unit raise {
  differencename_c.set(fromstring("difference"))
}

///|
let differencename_c : @lib.Cell[Name] = @lib.Cell::new("differenceName")

///|
/// `differenceName`
pub fn differencename() -> Name {
  differencename_c.get()
}

///|
/// emptyName
fn step_177() -> Unit raise {
  emptyname_c.set(fromstring("empty"))
}

///|
let emptyname_c : @lib.Cell[Name] = @lib.Cell::new("emptyName")

///|
/// `emptyName`
pub fn emptyname() -> Name {
  emptyname_c.get()
}

///|
/// memberName
fn step_178() -> Unit raise {
  membername_c.set(fromstring("member"))
}

///|
let membername_c : @lib.Cell[Name] = @lib.Cell::new("memberName")

///|
/// `memberName`
pub fn membername() -> Name {
  membername_c.get()
}

///|
/// insertName
fn step_179() -> Unit raise {
  insertname_c.set(fromstring("insert"))
}

///|
let insertname_c : @lib.Cell[Name] = @lib.Cell::new("insertName")

///|
/// `insertName`
pub fn insertname() -> Name {
  insertname_c.get()
}

///|
/// intersectName
fn step_180() -> Unit raise {
  intersectname_c.set(fromstring("intersect"))
}

///|
let intersectname_c : @lib.Cell[Name] = @lib.Cell::new("intersectName")

///|
/// `intersectName`
pub fn intersectname() -> Name {
  intersectname_c.get()
}

///|
/// singletonName
fn step_181() -> Unit raise {
  singletonname_c.set(fromstring("singleton"))
}

///|
let singletonname_c : @lib.Cell[Name] = @lib.Cell::new("singletonName")

///|
/// `singletonName`
pub fn singletonname() -> Name {
  singletonname_c.get()
}

///|
/// subsetName
fn step_182() -> Unit raise {
  subsetname_c.set(fromstring("subset"))
}

///|
let subsetname_c : @lib.Cell[Name] = @lib.Cell::new("subsetName")

///|
/// `subsetName`
pub fn subsetname() -> Name {
  subsetname_c.get()
}

///|
/// symmetricDifferenceName
fn step_183() -> Unit raise {
  symmetricdifferencename_c.set(fromstring("symmetricDifference"))
}

///|
let symmetricdifferencename_c : @lib.Cell[Name] = @lib.Cell::new(
  "symmetricDifferenceName",
)

///|
/// `symmetricDifferenceName`
pub fn symmetricdifferencename() -> Name {
  symmetricdifferencename_c.get()
}

///|
/// unionName
fn step_184() -> Unit raise {
  unionname_c.set(fromstring("union"))
}

///|
let unionname_c : @lib.Cell[Name] = @lib.Cell::new("unionName")

///|
/// `unionName`
pub fn unionname() -> Name {
  unionname_c.get()
}

///|
/// universeName
fn step_185() -> Unit raise {
  universename_c.set(fromstring("universe"))
}

///|
let universename_c : @lib.Cell[Name] = @lib.Cell::new("universeName")

///|
/// `universeName`
pub fn universename() -> Name {
  universename_c.get()
}

///|
/// `eltN`
pub fn eltn(x3697 : Size) -> Int64 raise {
  match x3697 {
    { size: n } => {
      fn f(x3698 : Int64, x3699 : Int64) -> Int64 raise {
        let acc = x3698
        match x3699 {
          0L => acc
          x => {
            let t3700 = @lib.div63(x, 2L)
            f(@lib.add63(acc, 1L), t3700)
          }
        }
      }
      f(-1L, n)
    }
  }
}

///|
/// `posN`
pub fn posn(x3701 : Int64) -> Int64 raise {
  let i = x3701
  shiftleft(1L, fromint(i))
}

///|
/// `univN`
pub fn univn(x3702 : Size) -> Int64 raise {
  let sz = x3702
  minus(posn(eltn(sz)), 1L)
}

///|
/// `setN`
pub fn setn(x3703 : Size, x3704 : Int64) -> Int64 raise {
  let sz = x3703
  let x = x3704
  let t3705 = univn(sz)
  andb(fromint(x), t3705)
}

///|
/// `cardFn`
pub fn cardfn(x3706 : Size, x3707 : Int64) -> Int64? raise {
  let sz = x3706
  let x = x3707
  fn f(x3708 : Int64, x3709 : Int64) -> Int64 raise {
    let acc = x3708
    match x3709 {
      0L => acc
      s => {
        let acc_1 = if andb(s, 1L) == 0L { acc } else { @lib.add63(acc, 1L) }
        f(acc_1, shiftright(s, 1L))
      }
    }
  }
  Some(f(setn(sz, x), 0L))
}

///|
/// `complementFn`
pub fn complementfn(x3710 : Size, x3711 : Int64) -> Int64? raise {
  let sz = x3710
  let x = x3711
  let t3712 = setn(sz, x)
  Some(toint(xorb(univn(sz), t3712)))
}

///|
/// `differenceFn`
pub fn differencefn(x3713 : Size, x3714 : Int64, x3715 : Int64) -> Int64? raise {
  let sz = x3713
  let x = x3714
  let y = x3715
  let x_1 = setn(sz, x)
  let y_1 = setn(sz, y)
  Some(toint(andb(x_1, notb(y_1))))
}

///|
/// `emptyFn`
pub fn[TA] emptyfn(x3716 : TA) -> Int64? raise {
  Some(0L)
}

///|
/// `insertFn`
pub fn insertfn(x3717 : Size, x3718 : Int64, x3719 : Int64) -> Int64? raise {
  let sz = x3717
  let x = x3718
  let y = x3719
  let x_1 = @lib.mod63(x, eltn(sz))
  let y_1 = setn(sz, y)
  Some(toint(orb(posn(x_1), y_1)))
}

///|
/// `intersectFn`
pub fn intersectfn(x3720 : Size, x3721 : Int64, x3722 : Int64) -> Int64? raise {
  let sz = x3720
  let x = x3721
  let y = x3722
  let t3723 = setn(sz, y)
  Some(toint(andb(setn(sz, x), t3723)))
}

///|
/// `singletonFn`
pub fn singletonfn(x3724 : Size, x3725 : Int64) -> Int64? raise {
  let sz = x3724
  let x = x3725
  let x_1 = @lib.mod63(x, eltn(sz))
  Some(toint(posn(x_1)))
}

///|
/// `symmetricDifferenceFn`
pub fn symmetricdifferencefn(
  x3726 : Size,
  x3727 : Int64,
  x3728 : Int64,
) -> Int64? raise {
  let sz = x3726
  let x = x3727
  let y = x3728
  let x_1 = setn(sz, x)
  let y_1 = setn(sz, y)
  Some(toint(xorb(x_1, y_1)))
}

///|
/// `unionFn`
pub fn unionfn(x3729 : Size, x3730 : Int64, x3731 : Int64) -> Int64? raise {
  let sz = x3729
  let x = x3730
  let y = x3731
  let t3732 = setn(sz, y)
  Some(toint(orb(setn(sz, x), t3732)))
}

///|
/// `universeFn`
pub fn universefn(x3733 : Size) -> Int64? raise {
  let sz = x3733
  Some(toint(univn(sz)))
}

///|
/// `memberRel`
pub fn memberrel(x3734 : Size, x3735 : Int64, x3736 : Int64) -> Bool? raise {
  let sz = x3734
  let x = x3735
  let y = x3736
  let x_1 = @lib.mod63(x, eltn(sz))
  let y_1 = setn(sz, y)
  Some(andb(posn(x_1), y_1) != 0L)
}

///|
/// `subsetRel`
pub fn subsetrel(x3737 : Size, x3738 : Int64, x3739 : Int64) -> Bool? raise {
  let sz = x3737
  let x = x3738
  let y = x3739
  let x_1 = setn(sz, x)
  let y_1 = setn(sz, y)
  Some(andb(x_1, notb(y_1)) == 0L)
}

///|
/// setFixed
fn step_186() -> Unit raise {
  let fns = fromlist_v7(
    @list.List([
      (
        (cardname(), 1L),
        fn(x3744 : Size) -> ((@list.List[Int64]) -> Int64? raise) raise {
          fn(x3745 : @list.List[Int64]) -> Int64? raise {
            ((x3742 : Size, x3743 : @list.List[Int64]) => {
              fixed1(
                fn(x3740 : Size) -> ((Int64) -> Int64? raise) raise {
                  fn(x3741 : Int64) -> Int64? raise { cardfn(x3740, x3741) }
                },
                x3742,
                x3743,
              )
            })(x3744, x3745)
          }
        },
      ),
      (
        (complementname(), 1L),
        fn(x3750 : Size) -> ((@list.List[Int64]) -> Int64? raise) raise {
          fn(x3751 : @list.List[Int64]) -> Int64? raise {
            ((x3748 : Size, x3749 : @list.List[Int64]) => {
              fixed1(
                fn(x3746 : Size) -> ((Int64) -> Int64? raise) raise {
                  fn(x3747 : Int64) -> Int64? raise {
                    complementfn(x3746, x3747)
                  }
                },
                x3748,
                x3749,
              )
            })(x3750, x3751)
          }
        },
      ),
      (
        (differencename(), 2L),
        fn(x3757 : Size) -> ((@list.List[Int64]) -> Int64? raise) raise {
          fn(x3758 : @list.List[Int64]) -> Int64? raise {
            ((x3755 : Size, x3756 : @list.List[Int64]) => {
              fixed2(
                fn(
                  x3752 : Size,
                ) -> ((Int64) -> ((Int64) -> Int64? raise) raise) raise {
                  fn(x3753 : Int64) -> ((Int64) -> Int64? raise) raise {
                    fn(x3754 : Int64) -> Int64? raise {
                      differencefn(x3752, x3753, x3754)
                    }
                  }
                },
                x3755,
                x3756,
              )
            })(x3757, x3758)
          }
        },
      ),
      (
        (emptyname(), 0L),
        fn(x3761 : Size) -> ((@list.List[Int64]) -> Int64? raise) raise {
          fn(x3762 : @list.List[Int64]) -> Int64? raise {
            ((x3759 : Size, x3760 : @list.List[Int64]) => {
              fixed0(emptyfn, x3759, x3760)
            })(x3761, x3762)
          }
        },
      ),
      (
        (insertname(), 2L),
        fn(x3768 : Size) -> ((@list.List[Int64]) -> Int64? raise) raise {
          fn(x3769 : @list.List[Int64]) -> Int64? raise {
            ((x3766 : Size, x3767 : @list.List[Int64]) => {
              fixed2(
                fn(
                  x3763 : Size,
                ) -> ((Int64) -> ((Int64) -> Int64? raise) raise) raise {
                  fn(x3764 : Int64) -> ((Int64) -> Int64? raise) raise {
                    fn(x3765 : Int64) -> Int64? raise {
                      insertfn(x3763, x3764, x3765)
                    }
                  }
                },
                x3766,
                x3767,
              )
            })(x3768, x3769)
          }
        },
      ),
      (
        (intersectname(), 2L),
        fn(x3775 : Size) -> ((@list.List[Int64]) -> Int64? raise) raise {
          fn(x3776 : @list.List[Int64]) -> Int64? raise {
            ((x3773 : Size, x3774 : @list.List[Int64]) => {
              fixed2(
                fn(
                  x3770 : Size,
                ) -> ((Int64) -> ((Int64) -> Int64? raise) raise) raise {
                  fn(x3771 : Int64) -> ((Int64) -> Int64? raise) raise {
                    fn(x3772 : Int64) -> Int64? raise {
                      intersectfn(x3770, x3771, x3772)
                    }
                  }
                },
                x3773,
                x3774,
              )
            })(x3775, x3776)
          }
        },
      ),
      (
        (singletonname(), 1L),
        fn(x3781 : Size) -> ((@list.List[Int64]) -> Int64? raise) raise {
          fn(x3782 : @list.List[Int64]) -> Int64? raise {
            ((x3779 : Size, x3780 : @list.List[Int64]) => {
              fixed1(
                fn(x3777 : Size) -> ((Int64) -> Int64? raise) raise {
                  fn(x3778 : Int64) -> Int64? raise {
                    singletonfn(x3777, x3778)
                  }
                },
                x3779,
                x3780,
              )
            })(x3781, x3782)
          }
        },
      ),
      (
        (symmetricdifferencename(), 2L),
        fn(x3788 : Size) -> ((@list.List[Int64]) -> Int64? raise) raise {
          fn(x3789 : @list.List[Int64]) -> Int64? raise {
            ((x3786 : Size, x3787 : @list.List[Int64]) => {
              fixed2(
                fn(
                  x3783 : Size,
                ) -> ((Int64) -> ((Int64) -> Int64? raise) raise) raise {
                  fn(x3784 : Int64) -> ((Int64) -> Int64? raise) raise {
                    fn(x3785 : Int64) -> Int64? raise {
                      symmetricdifferencefn(x3783, x3784, x3785)
                    }
                  }
                },
                x3786,
                x3787,
              )
            })(x3788, x3789)
          }
        },
      ),
      (
        (unionname(), 2L),
        fn(x3795 : Size) -> ((@list.List[Int64]) -> Int64? raise) raise {
          fn(x3796 : @list.List[Int64]) -> Int64? raise {
            ((x3793 : Size, x3794 : @list.List[Int64]) => {
              fixed2(
                fn(
                  x3790 : Size,
                ) -> ((Int64) -> ((Int64) -> Int64? raise) raise) raise {
                  fn(x3791 : Int64) -> ((Int64) -> Int64? raise) raise {
                    fn(x3792 : Int64) -> Int64? raise {
                      unionfn(x3790, x3791, x3792)
                    }
                  }
                },
                x3793,
                x3794,
              )
            })(x3795, x3796)
          }
        },
      ),
      (
        (universename(), 0L),
        fn(x3799 : Size) -> ((@list.List[Int64]) -> Int64? raise) raise {
          fn(x3800 : @list.List[Int64]) -> Int64? raise {
            ((x3797 : Size, x3798 : @list.List[Int64]) => {
              fixed0(universefn, x3797, x3798)
            })(x3799, x3800)
          }
        },
      ),
    ]),
  )
  let rels = fromlist_v7(
    @list.List([
      (
        (membername(), 2L),
        fn(x3806 : Size) -> ((@list.List[Int64]) -> Bool? raise) raise {
          fn(x3807 : @list.List[Int64]) -> Bool? raise {
            ((x3804 : Size, x3805 : @list.List[Int64]) => {
              fixed2(
                fn(
                  x3801 : Size,
                ) -> ((Int64) -> ((Int64) -> Bool? raise) raise) raise {
                  fn(x3802 : Int64) -> ((Int64) -> Bool? raise) raise {
                    fn(x3803 : Int64) -> Bool? raise {
                      memberrel(x3801, x3802, x3803)
                    }
                  }
                },
                x3804,
                x3805,
              )
            })(x3806, x3807)
          }
        },
      ),
      (
        (subsetname(), 2L),
        fn(x3813 : Size) -> ((@list.List[Int64]) -> Bool? raise) raise {
          fn(x3814 : @list.List[Int64]) -> Bool? raise {
            ((x3811 : Size, x3812 : @list.List[Int64]) => {
              fixed2(
                fn(
                  x3808 : Size,
                ) -> ((Int64) -> ((Int64) -> Bool? raise) raise) raise {
                  fn(x3809 : Int64) -> ((Int64) -> Bool? raise) raise {
                    fn(x3810 : Int64) -> Bool? raise {
                      subsetrel(x3808, x3809, x3810)
                    }
                  }
                },
                x3811,
                x3812,
              )
            })(x3813, x3814)
          }
        },
      ),
    ]),
  )
  setfixed_c.set(Fixed::{ functions: fns, relations: rels, })
}

///|
let setfixed_c : @lib.Cell[Fixed] = @lib.Cell::new("setFixed")

///|
/// `setFixed`
pub fn setfixed() -> Fixed {
  setfixed_c.get()
}

///|
/// appendName
fn step_187() -> Unit raise {
  appendname_c.set(fromstring("@"))
}

///|
let appendname_c : @lib.Cell[Name] = @lib.Cell::new("appendName")

///|
/// `appendName`
pub fn appendname() -> Name {
  appendname_c.get()
}

///|
/// consName
fn step_188() -> Unit raise {
  consname_c.set(fromstring("::"))
}

///|
let consname_c : @lib.Cell[Name] = @lib.Cell::new("consName")

///|
/// `consName`
pub fn consname() -> Name {
  consname_c.get()
}

///|
/// lengthName
fn step_189() -> Unit raise {
  lengthname_c.set(fromstring("length"))
}

///|
let lengthname_c : @lib.Cell[Name] = @lib.Cell::new("lengthName")

///|
/// `lengthName`
pub fn lengthname() -> Name {
  lengthname_c.get()
}

///|
/// nilName
fn step_190() -> Unit raise {
  nilname_c.set(fromstring("nil"))
}

///|
let nilname_c : @lib.Cell[Name] = @lib.Cell::new("nilName")

///|
/// `nilName`
pub fn nilname() -> Name {
  nilname_c.get()
}

///|
/// nullName
fn step_191() -> Unit raise {
  nullname_c.set(fromstring("null"))
}

///|
let nullname_c : @lib.Cell[Name] = @lib.Cell::new("nullName")

///|
/// `nullName`
pub fn nullname() -> Name {
  nullname_c.get()
}

///|
/// tailName
fn step_192() -> Unit raise {
  tailname_c.set(fromstring("tail"))
}

///|
let tailname_c : @lib.Cell[Name] = @lib.Cell::new("tailName")

///|
/// `tailName`
pub fn tailname() -> Name {
  tailname_c.get()
}

///|
/// baseFix
fn step_193() -> Unit raise {
  let fix = unionfixed(projectionfixed(), overflowfixed())
  let sucfn_1 : (Size) -> ((@list.List[Int64]) -> Int64? raise) raise = getfunctionfixed(
    fix,
    (sucname(), 1L),
  )
  basefix_c.set(
    insertfunctionfixed(
      fix,
      (
        (sucname(), 2L),
        fn(x3823 : Size) -> ((@list.List[Int64]) -> Int64? raise) raise {
          fn(x3824 : @list.List[Int64]) -> Int64? raise {
            ((x3821 : Size, x3822 : @list.List[Int64]) => {
              fixed2(
                fn(
                  x3818 : Size,
                ) -> ((Int64) -> ((Int64) -> Int64? raise) raise) raise {
                  fn(x3819 : Int64) -> ((Int64) -> Int64? raise) raise {
                    fn(x3820 : Int64) -> Int64? raise {
                      ((x3815, x3816, x3817) => {
                        suc2fn_l(sucfn_1, x3815, x3816, x3817)
                      })(x3818, x3819, x3820)
                    }
                  }
                },
                x3821,
                x3822,
              )
            })(x3823, x3824)
          }
        },
      ),
    ),
  )
}

///|
let basefix_c : @lib.Cell[Fixed] = @lib.Cell::new("baseFix")

///|
/// `baseFix`
pub fn basefix() -> Fixed {
  basefix_c.get()
}

///|
fn[TA] suc2fn_l(
  sucfn_1 : (Size) -> ((@list.List[Int64]) -> Int64? raise) raise,
  x3815 : Size,
  x3816 : TA,
  x3817 : Int64,
) -> Element? raise {
  let sz = x3815
  let x = x3817
  sucfn_1(sz)(@list.List([x]))
}

///|
/// fixMap
fn step_194() -> Unit raise {
  let t3826 = fromlist_v7(@list.List([((nullname(), 1L), iszeroname())]))
  let t3825 = ((nilname(), 0L), numeralname(0L))
  fixmap_c.set(FixedMap::{
    functionmap: fromlist_v7(
      @list.List([
        ((appendname(), 2L), addname()),
        ((consname(), 2L), sucname()),
        ((lengthname(), 1L), projectionname(1L)),
        t3825,
        ((tailname(), 1L), prename()),
      ]),
    ),
    relationmap: t3826,
  })
}

///|
let fixmap_c : @lib.Cell[FixedMap] = @lib.Cell::new("fixMap")

///|
/// `fixMap`
pub fn fixmap() -> FixedMap {
  fixmap_c.get()
}

///|
/// listFixed
fn step_195() -> Unit raise {
  listfixed_c.set(mapfixed(fixmap(), basefix()))
}

///|
let listfixed_c : @lib.Cell[Fixed] = @lib.Cell::new("listFixed")

///|
/// `listFixed`
pub fn listfixed() -> Fixed {
  listfixed_c.get()
}

///|
/// `valuation`
#derive(Eq, Debug)
pub(all) enum Valuation {
  Valuation(Map4[Element])
}

///|
pub extend Valuation with Eq::{not_equal, equal}

///|
pub extend Valuation with Debug::{to_repr}

///|
pub extend Valuation with @lib.OCompare::{ocompare}

///|
pub extend Valuation with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_Valuation(x : Valuation) -> Int {
  match x {
    Valuation(_) => 1000000
  }
}

///|
pub impl @lib.OCompare for Valuation with fn ocompare(self, other) {
  match (self, other) {
    (Valuation(a0), Valuation(b0)) => @lib.compare(a0, b0)
    _ => ocaml_rank_Valuation(self).compare(ocaml_rank_Valuation(other))
  }
}

///|
pub impl @lib.OHash for Valuation with fn ohash_visit(self, h) {
  match self {
    Valuation(a0) => {
      h.block(0, 1)
      h.field(a0)
    }
  }
}

///|
/// emptyValuation
fn step_196() -> Unit raise {
  emptyvaluation_c.set(Valuation::Valuation(newmap_v3(())))
}

///|
let emptyvaluation_c : @lib.Cell[Valuation] = @lib.Cell::new("emptyValuation")

///|
/// `emptyValuation`
pub fn emptyvaluation() -> Valuation {
  emptyvaluation_c.get()
}

///|
/// `insertValuation`
pub fn insertvaluation(
  x3827 : Valuation,
) -> (((Name, Element)) -> Valuation raise) raise {
  match x3827 {
    Valuation::Valuation(m) =>
      fn(x3828 : (String, Int64)) -> Valuation raise {
        let v_i = x3828
        Valuation::Valuation(insert_v3(m, v_i))
      }
  }
}

///|
/// `peekValuation`
pub fn peekvaluation(x3829 : Valuation) -> ((Name) -> Element? raise) raise {
  match x3829 {
    Valuation::Valuation(m) =>
      fn(x3830 : String) -> Int64? raise {
        let v = x3830
        peek_v4(m, v)
      }
  }
}

///|
/// `constantValuation`
pub fn constantvaluation(
  x3831 : Int64,
) -> ((@oset.T[Name]) -> Valuation raise) raise {
  let i = x3831
  let add_1 : ((String, Valuation)) -> Valuation raise = fn(
    x3833 : (String, Valuation),
  ) -> Valuation raise {
    let (v, v_p) = x3833
    insertvaluation(v_p)((v, i))
  }
  foldl_v7(add_1)(emptyvaluation())
}

///|
/// zeroValuation
fn step_197() -> Unit raise {
  zerovaluation_c.set(constantvaluation(zeroelement()))
}

///|
let zerovaluation_c : @lib.Cell[(@oset.T[Name]) -> Valuation raise] = @lib.Cell::new(
  "zeroValuation",
)

///|
/// `zeroValuation`
pub fn zerovaluation(x : @oset.T[Name]) -> Valuation raise {
  zerovaluation_c.get()(x)
}

///|
/// `getValuation`
pub fn getvaluation(x3834 : Valuation, x3835 : String) -> Element raise {
  let v_p = x3834
  let v = x3835
  match peekvaluation(v_p)(v) {
    Some(i) => i
    None => raise Failure("Model.getValuation: incomplete valuation")
  }
}

///|
/// `randomValuation`
pub fn randomvaluation(
  x3836 : Size,
) -> ((@oset.T[Name]) -> Valuation raise) raise {
  match x3836 {
    { size: n } =>
      fn(x3837 : @oset.T[String]) -> Valuation raise {
        let vs = x3837
        let f : ((String, Valuation)) -> Valuation raise = fn(
          x3838 : (String, Valuation),
        ) -> Valuation raise {
          let (v, v_p) = x3838
          let t3839 = (v, @lib.random_int(n))
          insertvaluation(v_p)(t3839)
        }
        foldl_v7(f)(emptyvaluation())(vs)
      }
  }
}

///|
/// `incrementValuation`
pub fn incrementvaluation(
  x3840 : Size,
  x3841 : @oset.T[String],
) -> ((Valuation) -> Valuation? raise) raise {
  let n = x3840
  let vars = x3841
  fn inc(x3843 : @list.List[String], x3844 : Valuation) -> Valuation? raise {
    let vs = x3843
    let v_p = x3844
    match vs {
      Empty => None
      More(v, tail=vs_1) => {
        let t3845 = getvaluation(v_p, v)
        let (carry, i_1) = match incrementelement(n)(t3845) {
          Some(i) => (false, i)
          None => (true, zeroelement())
        }
        let v_p_1 = insertvaluation(v_p)((v, i_1))
        if carry {
          inc(vs_1, v_p_1)
        } else {
          Some(v_p_1)
        }
      }
    }
  }
  let t3846 = tolist_v7(vars)
  (x3847 : Valuation) => inc(t3846, x3847)
}

///|
/// `foldValuation`
pub fn[TA] foldvaluation(
  x3848 : Size,
  x3849 : @oset.T[String],
  x3850 : ((Valuation, TA)) -> TA raise,
) -> ((TA) -> TA raise) raise {
  let n = x3848
  let vars = x3849
  let f = x3850
  let inc : (Valuation) -> Valuation? raise = incrementvaluation(n, vars)
  fn fold_1(x3852 : Valuation, x3853 : TA) -> TA raise {
    let v_p = x3852
    let acc = x3853
    let acc_1 = f((v_p, acc))
    match inc(v_p) {
      None => acc_1
      Some(v_p_1) => fold_1(v_p_1, acc_1)
    }
  }
  let zero = zerovaluation(vars)
  (x3854 : TA) => fold_1(zero, x3854)
}

///|
/// cUNKNOWN
fn step_198() -> Unit raise {
  cunknown_c.set(-1L)
}

///|
let cunknown_c : @lib.Cell[Int64] = @lib.Cell::new("cUNKNOWN")

///|
/// `cUNKNOWN`
pub fn cunknown() -> Int64 {
  cunknown_c.get()
}

///|
/// `table`
#derive(Eq, Debug)
pub(all) enum Table {
  Forgetful_table
  Array_table(FixedArray[Int64])
}

///|
pub extend Table with Eq::{not_equal, equal}

///|
pub extend Table with Debug::{to_repr}

///|
pub extend Table with @lib.OCompare::{ocompare}

///|
pub extend Table with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_Table(x : Table) -> Int {
  match x {
    Forgetful_table => 0
    Array_table(_) => 1000000
  }
}

///|
pub impl @lib.OCompare for Table with fn ocompare(self, other) {
  match (self, other) {
    (Array_table(a0), Array_table(b0)) => @lib.compare(a0, b0)
    _ => ocaml_rank_Table(self).compare(ocaml_rank_Table(other))
  }
}

///|
pub impl @lib.OHash for Table with fn ohash_visit(self, h) {
  match self {
    Forgetful_table => h.int(0L)
    Array_table(a0) => {
      h.block(0, 1)
      h.field(a0)
    }
  }
}

///|
/// `newTable`
pub fn newtable(x3855 : Int64, x3856 : Int64) -> Table raise {
  let n = x3855
  let arity_1 = x3856
  match elementlistspace(Size::{ size: n, })(arity_1) {
    None => Table::Forgetful_table
    Some(space) => Table::Array_table(@lib.array_make(space, cunknown()))
  }
}

///|
/// `randomResult`
pub fn randomresult(x3857 : Int64) -> Int64 raise {
  let r = x3857
  @lib.random_int(r)
}

///|
/// `lookupTable`
pub fn lookuptable(
  x3858 : Int64,
  x3859 : Int64,
  x3860 : Table,
  x3861 : @list.List[Int64],
) -> Int64 raise {
  let n = x3858
  let vr = x3859
  let table = x3860
  let elts = x3861
  match table {
    Table::Forgetful_table => randomresult(vr)
    Table::Array_table(a) => {
      let i = elementlistindex(Size::{ size: n, })(elts)
      let r = @lib.array_get(a, @lib.int63_to_int(i))
      if r != cunknown() {
        r
      } else {
        let r_1 = randomresult(vr)
        match @lib.array_set(a, @lib.int63_to_int(i), r_1) {
          _ => r_1
        }
      }
    }
  }
}

///|
/// `updateTable`
pub fn updatetable(
  x3862 : Int64,
  x3863 : Table,
  x3864 : (@list.List[Int64], Int64),
) -> Unit raise {
  let n = x3862
  let table = x3863
  let (elts, r) = x3864
  match table {
    Table::Forgetful_table => ()
    Table::Array_table(a) => {
      let i = elementlistindex(Size::{ size: n, })(elts)
      match @lib.array_set(a, @lib.int63_to_int(i), r) {
        _ => ()
      }
    }
  }
}

///|
/// `tables`
pub(all) struct Tables {
  domainsize : Int64
  rangesize : Int64
  tablemap : Ref[Map5[Table]]
}

///|
pub extend Tables with @lib.OCompare::{ocompare}

///|
pub extend Tables with @lib.OHash::{ohash_visit}

///|
pub impl @lib.OCompare for Tables with fn ocompare(self, other) {
  let c = @lib.compare(self.domainsize, other.domainsize)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.rangesize, other.rangesize)
  if c != 0 {
    return c
  }
  @lib.compare(self.tablemap, other.tablemap)
}

///|
pub impl @lib.OHash for Tables with fn ohash_visit(self, h) {
  h.block(0, 3)
  h.field(self.domainsize)
  h.field(self.rangesize)
  h.field(self.tablemap)
}

///|
/// `newTables`
pub fn newtables(x3865 : Int64, x3866 : Int64) -> Tables raise {
  let n = x3865
  let vr = x3866
  Tables::{
    domainsize: n,
    rangesize: vr,
    tablemap: Ref::{ val: newmap_v4(()), },
  }
}

///|
/// `getTables`
pub fn gettables(x3867 : Tables, x3868 : (String, Int64)) -> Table raise {
  let tables = x3867
  let n_a = x3868
  match tables {
    { domainsize: n, rangesize: _, tablemap: tm } => {
      let m = tm.val
      match peek_v5(m, n_a) {
        Some(t) => t
        None => {
          let (_, a) = n_a
          let t_1 = newtable(n, a)
          let m_1 = insert_v4(m, (n_a, t_1))
          match
            ({
              tm.val = m_1
              ()
            }) {
            _ => t_1
          }
        }
      }
    }
    _ => raise @lib.MatchFailure("tscript.ml:5761")
  }
}

///|
/// `lookupTables`
pub fn lookuptables(
  x3869 : Tables,
  x3870 : (String, @list.List[Int64]),
) -> Int64 raise {
  let tables = x3869
  let (n, elts) = x3870
  match tables {
    { domainsize: vn, rangesize: vr, .. } => {
      let a = Int::to_int64(@lib.length(elts))
      let table = gettables(tables, (n, a))
      lookuptable(vn, vr, table, elts)
    }
    _ => raise @lib.MatchFailure("tscript.ml:5780")
  }
}

///|
/// `updateTables`
pub fn updatetables(
  x3871 : Tables,
  x3872 : ((String, @list.List[Int64]), Int64),
) -> Unit raise {
  let tables = x3871
  let ((n, elts), r) = x3872
  match tables {
    { domainsize: vn, .. } => {
      let a = Int::to_int64(@lib.length(elts))
      let table = gettables(tables, (n, a))
      updatetable(vn, table, (elts, r))
    }
    _ => raise @lib.MatchFailure("tscript.ml:5790")
  }
}

///|
/// `parameters`
pub(all) struct Parameters {
  sizep : Int64
  fixed : Fixed
}

///|
/// `model`
pub(all) struct Model {
  sizem : Int64
  fixedfunctions : Map5[(@list.List[Element]) -> Element? raise]
  fixedrelations : Map5[(@list.List[Element]) -> Bool? raise]
  randomfunctions : Tables
  randomrelations : Tables
}

///|
/// `newModel`
pub fn newmodel(x3873 : Parameters) -> Model raise {
  match x3873 {
    { sizep: vn, fixed } =>
      match fixed {
        { functions: fns, relations: rels } => {
          let fixfns = transform_v7(fn(
            x3874 : (Size) -> ((@list.List[Int64]) -> Int64? raise) raise,
          ) -> ((@list.List[Int64]) -> Int64? raise) raise {
            let f = x3874
            f(Size::{ size: vn, })
          })(fns)
          let fixrels = transform_v7(fn(
            x3876 : (Size) -> ((@list.List[Int64]) -> Bool? raise) raise,
          ) -> ((@list.List[Int64]) -> Bool? raise) raise {
            let r = x3876
            r(Size::{ size: vn, })
          })(rels)
          let rndfns = newtables(vn, vn)
          let rndrels = newtables(vn, 2L)
          Model::{
            sizem: vn,
            fixedfunctions: fixfns,
            fixedrelations: fixrels,
            randomfunctions: rndfns,
            randomrelations: rndrels,
          }
        }
        _ => raise @lib.MatchFailure("tscript.ml:5813")
      }
  }
}

///|
/// `msize`
pub fn msize(x3878 : Model) -> Int64 raise {
  match x3878 {
    { sizem: vn, .. } => vn
  }
}

///|
/// `psize`
pub fn psize(x3879 : Parameters) -> Int64 raise {
  match x3879 {
    { sizep: vn, .. } => vn
  }
}

///|
/// `peekFixedFunction`
pub fn peekfixedfunction(
  x3880 : Model,
  x3881 : (String, @list.List[Int64]),
) -> Element? raise {
  let vm = x3880
  let (n, elts) = x3881
  match vm {
    { fixedfunctions: fixfns, .. } =>
      match peek_v5(fixfns, (n, Int::to_int64(@lib.length(elts)))) {
        None => None
        Some(fixfn) => fixfn(elts)
      }
    _ => raise @lib.MatchFailure("tscript.ml:5832")
  }
}

///|
/// `isFixedFunction`
pub fn isfixedfunction(
  x3882 : Model,
  x3883 : (String, @list.List[Int64]),
) -> Bool raise {
  let vm = x3882
  let n_elts = x3883
  is_some(peekfixedfunction(vm, n_elts))
}

///|
/// `peekFixedRelation`
pub fn peekfixedrelation(
  x3884 : Model,
  x3885 : (String, @list.List[Int64]),
) -> Bool? raise {
  let vm = x3884
  let (n, elts) = x3885
  match vm {
    { fixedrelations: fixrels, .. } =>
      match peek_v5(fixrels, (n, Int::to_int64(@lib.length(elts)))) {
        None => None
        Some(fixrel) => fixrel(elts)
      }
    _ => raise @lib.MatchFailure("tscript.ml:5842")
  }
}

///|
/// `isFixedRelation`
pub fn isfixedrelation(
  x3886 : Model,
  x3887 : (String, @list.List[Int64]),
) -> Bool raise {
  let vm = x3886
  let n_elts = x3887
  is_some(peekfixedrelation(vm, n_elts))
}

///|
/// defaultSize
fn step_199() -> Unit raise {
  defaultsize_c.set(8L)
}

///|
let defaultsize_c : @lib.Cell[Int64] = @lib.Cell::new("defaultSize")

///|
/// `defaultSize`
pub fn defaultsize() -> Int64 {
  defaultsize_c.get()
}

///|
/// defaultFixed
fn step_200() -> Unit raise {
  defaultfixed_c.set(
    unionlistfixed(
      @list.List([
        basicfixed(),
        projectionfixed(),
        modularfixed(),
        setfixed(),
        listfixed(),
      ]),
    ),
  )
}

///|
let defaultfixed_c : @lib.Cell[Fixed] = @lib.Cell::new("defaultFixed")

///|
/// `defaultFixed`
pub fn defaultfixed() -> Fixed {
  defaultfixed_c.get()
}

///|
/// default
fn step_201() -> Unit raise {
  default_c.set(Parameters::{ sizep: defaultsize(), fixed: defaultfixed(), })
}

///|
let default_c : @lib.Cell[Parameters] = @lib.Cell::new("default")

///|
/// `default`
pub fn default() -> Parameters {
  default_c.get()
}

///|
/// `destTerm`
pub fn destterm(x3888 : Term) -> Term raise {
  let tm = x3888
  match tm {
    Term::Var(_) => tm
    Term::Fn(f_tms) =>
      match stripapp(tm) {
        (_, Empty) => tm
        (Term::Var(_) as v, tms) => Term::Fn((appname(), tms.prepend(v)))
        (Term::Fn((f, tms_1)), tms_p) => Term::Fn((f, tms_1.concat(tms_p)))
      }
  }
}

///|
/// `interpretFunction`
pub fn interpretfunction(
  x3889 : Model,
  x3890 : (String, @list.List[Int64]),
) -> Element raise {
  let vm = x3889
  let n_elts = x3890
  match peekfixedfunction(vm, n_elts) {
    Some(r) => r
    None =>
      match vm {
        { randomfunctions: rndfns, .. } => lookuptables(rndfns, n_elts)
        _ => raise @lib.MatchFailure("tscript.ml:5886")
      }
  }
}

///|
/// `interpretRelation`
pub fn interpretrelation(
  x3891 : Model,
  x3892 : (String, @list.List[Int64]),
) -> Bool raise {
  let vm = x3891
  let n_elts = x3892
  match peekfixedrelation(vm, n_elts) {
    Some(r) => r
    None =>
      match vm {
        { randomrelations: rndrels, .. } =>
          inttobool(lookuptables(rndrels, n_elts))
        _ => raise @lib.MatchFailure("tscript.ml:5895")
      }
  }
}

///|
/// `interpretTerm`
pub fn interpretterm(
  x3893 : Model,
  x3894 : Valuation,
) -> ((Term) -> Element raise) raise {
  let vm = x3893
  let vv = x3894
  fn interpret(x3896 : Term) -> Element raise {
    let tm = x3896
    match destterm(tm) {
      Term::Var(v) => getvaluation(vv, v)
      Term::Fn((f, tms)) => interpretfunction(vm, (f, @lib.map(interpret, tms)))
    }
  }
  interpret
}

///|
/// `interpretAtom`
pub fn interpretatom(
  x3897 : Model,
  x3898 : Valuation,
  x3899 : (String, @list.List[Term]),
) -> Bool raise {
  let vm = x3897
  let vv = x3898
  let (r, tms) = x3899
  interpretrelation(vm, (r, @lib.map(interpretterm(vm, vv), tms)))
}

///|
/// `interpretFormula`
pub fn interpretformula(
  x3900 : Model,
) -> ((Valuation) -> ((Formula) -> Bool raise) raise) raise {
  let vm = x3900
  let vn = msize(vm)
  let interpret = (x3902 : Valuation, x3903 : Formula) => {
    interpret_l(vm, vn, x3902, x3903)
  }
  let interpret_p = (
    x3905 : Valuation,
    x3906 : Formula,
    x3907 : String,
    x3908 : Int64,
  ) => interpret_p_l(vm, vn, x3905, x3906, x3907, x3908)
  fn(x3909 : Valuation) -> ((Formula) -> Bool raise) raise {
    fn(x3910 : Formula) -> Bool raise { interpret(x3909, x3910) }
  }
}

///|
fn interpret_l(
  vm : Model,
  vn : Int64,
  x3902 : Valuation,
  x3903 : Formula,
) -> Bool raise {
  let interpret = (x3902 : Valuation, x3903 : Formula) => {
    interpret_l(vm, vn, x3902, x3903)
  }
  let interpret_p = (
    x3905 : Valuation,
    x3906 : Formula,
    x3907 : String,
    x3908 : Int64,
  ) => interpret_p_l(vm, vn, x3905, x3906, x3907, x3908)
  let vv = x3902
  let fm = x3903
  match fm {
    Formula::True => true
    Formula::False => false
    Formula::Atom(atm) => interpretatom(vm, vv, atm)
    Formula::Not(p) => !interpret(vv, p)
    Formula::Or(p_1, q) => interpret(vv, p_1) || interpret(vv, q)
    Formula::And(p_2, q_1) => interpret(vv, p_2) && interpret(vv, q_1)
    Formula::Imp(p_3, q_2) => interpret(vv, Formula::Or(Formula::Not(p_3), q_2))
    Formula::Iff(p_4, q_3) => {
      let t3904 = interpret(vv, q_3)
      interpret(vv, p_4) == t3904
    }
    Formula::Forall(v, p_5) => interpret_p(vv, p_5, v, vn)
    Formula::Exists(v_1, p_6) =>
      interpret(vv, Formula::Not(Formula::Forall(v_1, Formula::Not(p_6))))
  }
}

///|
fn interpret_p_l(
  vm : Model,
  vn : Int64,
  x3905 : Valuation,
  x3906 : Formula,
  x3907 : String,
  x3908 : Int64,
) -> Bool raise {
  let interpret = (x3902 : Valuation, x3903 : Formula) => {
    interpret_l(vm, vn, x3902, x3903)
  }
  let interpret_p = (
    x3905 : Valuation,
    x3906 : Formula,
    x3907 : String,
    x3908 : Int64,
  ) => interpret_p_l(vm, vn, x3905, x3906, x3907, x3908)
  let vv_1 = x3905
  let fm_1 = x3906
  let v_2 = x3907
  let i = x3908
  if i == 0L {
    true
  } else {
    let i_1 = @lib.sub63(i, 1L)
    let vv_p = insertvaluation(vv_1)((v_2, i_1))
    interpret(vv_p, fm_1) && interpret_p(vv_1, fm_1, v_2, i_1)
  }
}

///|
/// `interpretLiteral`
pub fn interpretliteral(
  x3911 : Model,
  x3912 : Valuation,
  x3913 : (Bool, (String, @list.List[Term])),
) -> Bool raise {
  let vm = x3911
  let vv = x3912
  let (pol, atm) = x3913
  let b = interpretatom(vm, vv, atm)
  if pol {
    b
  } else {
    !b
  }
}

///|
/// `interpretClause`
pub fn interpretclause(
  x3914 : Model,
  x3915 : Valuation,
  x3916 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> Bool raise {
  let vm = x3914
  let vv = x3915
  let cl = x3916
  exists_v29((x3917 : (Bool, (String, @list.List[Term]))) => {
    interpretliteral(vm, vv, x3917)
  })(cl)
}

///|
/// `check`
pub fn[TA] check(
  x3918 : (Model) -> ((Valuation) -> ((TA) -> Bool raise) raise) raise,
  x3919 : Int64?,
  x3920 : Model,
  x3921 : @oset.T[String],
  x3922 : TA,
) -> (Int64, Int64) raise {
  let interpret = x3918
  let maxchecks = x3919
  let vm = x3920
  let fv = x3921
  let x = x3922
  let vn = msize(vm)
  let score : ((Valuation, (Int64, Int64))) -> (Int64, Int64) raise = fn(
    x3923 : (Valuation, (Int64, Int64)),
  ) -> (Int64, Int64) raise {
    let (vv, (vt, vf)) = x3923
    if interpret(vm)(vv)(x) {
      (@lib.add63(vt, 1L), vf)
    } else {
      (vt, @lib.add63(vf, 1L))
    }
  }
  let randomcheck : ((Int64, Int64)) -> (Int64, Int64) raise = fn(
    x3924 : (Int64, Int64),
  ) -> (Int64, Int64) raise {
    let acc = x3924
    score((randomvaluation(Size::{ size: vn, })(fv), acc))
  }
  let maxchecks_1 = match maxchecks {
    None => maxchecks
    Some(m) =>
      match expint(vn, size_v7(fv)) {
        Some(n) => if n <= m { None } else { maxchecks }
        None => maxchecks
      }
  }
  match maxchecks_1 {
    Some(m_1) => @lib.funpow(@lib.int63_to_int(m_1), randomcheck, (0L, 0L))
    None => foldvaluation(Size::{ size: vn, }, fv, score)((0L, 0L))
  }
}

///|
/// `checkAtom`
pub fn checkatom(
  x3925 : Int64?,
  x3926 : Model,
  x3927 : (String, @list.List[Term]),
) -> (Int64, Int64) raise {
  let maxchecks = x3925
  let vm = x3926
  let atm = x3927
  check(
    fn(
      x3928 : Model,
    ) -> ((Valuation) -> (((String, @list.List[Term])) -> Bool raise) raise) raise {
      fn(
        x3929 : Valuation,
      ) -> (((String, @list.List[Term])) -> Bool raise) raise {
        fn(x3930 : (String, @list.List[Term])) -> Bool raise {
          interpretatom(x3928, x3929, x3930)
        }
      }
    },
    maxchecks,
    vm,
    freevars_v2(atm),
    atm,
  )
}

///|
/// `checkFormula`
pub fn checkformula(
  x3931 : Int64?,
  x3932 : Model,
  x3933 : Formula,
) -> (Int64, Int64) raise {
  let maxchecks = x3931
  let vm = x3932
  let fm = x3933
  check(interpretformula, maxchecks, vm, freevars_v3(fm), fm)
}

///|
/// `checkLiteral`
pub fn checkliteral(
  x3934 : Int64?,
  x3935 : Model,
  x3936 : (Bool, (String, @list.List[Term])),
) -> (Int64, Int64) raise {
  let maxchecks = x3934
  let vm = x3935
  let lit = x3936
  check(
    fn(
      x3937 : Model,
    ) -> ((Valuation) -> (((Bool, (String, @list.List[Term]))) -> Bool raise) raise) raise {
      fn(
        x3938 : Valuation,
      ) -> (((Bool, (String, @list.List[Term]))) -> Bool raise) raise {
        fn(x3939 : (Bool, (String, @list.List[Term]))) -> Bool raise {
          interpretliteral(x3937, x3938, x3939)
        }
      }
    },
    maxchecks,
    vm,
    freevars_v4(lit),
    lit,
  )
}

///|
/// `checkClause`
pub fn checkclause(
  x3940 : Int64?,
  x3941 : Model,
  x3942 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> (Int64, Int64) raise {
  let maxchecks = x3940
  let vm = x3941
  let cl = x3942
  check(
    fn(
      x3943 : Model,
    ) -> ((Valuation) -> ((@oset.T[(Bool, (String, @list.List[Term]))]) -> Bool raise) raise) raise {
      fn(
        x3944 : Valuation,
      ) -> ((@oset.T[(Bool, (String, @list.List[Term]))]) -> Bool raise) raise {
        fn(x3945 : @oset.T[(Bool, (String, @list.List[Term]))]) -> Bool raise {
          interpretclause(x3943, x3944, x3945)
        }
      }
    },
    maxchecks,
    vm,
    freevars_v5(cl),
    cl,
  )
}

///|
/// `updateFunction`
pub fn updatefunction(
  x3946 : Model,
  x3947 : ((String, @list.List[Int64]), Int64),
) -> Unit raise {
  let vm = x3946
  let func_elts_elt = x3947
  match vm {
    { randomfunctions: rndfns, .. } =>
      match updatetables(rndfns, func_elts_elt) {
        _ => ()
      }
    _ => raise @lib.MatchFailure("tscript.ml:5991")
  }
}

///|
/// `updateRelation`
pub fn updaterelation(
  x3948 : Model,
  x3949 : ((String, @list.List[Int64]), Bool),
) -> Unit raise {
  let vm = x3948
  let (rel_elts, pol) = x3949
  match vm {
    { randomrelations: rndrels, .. } =>
      match updatetables(rndrels, (rel_elts, booltoint(pol))) {
        _ => ()
      }
    _ => raise @lib.MatchFailure("tscript.ml:5999")
  }
}

///|
/// `modelTerm`
#derive(Eq, Debug)
pub(all) enum ModelTerm {
  Model_var
  Model_fn(FunctionName, @list.List[ModelTerm], @list.List[Int64])
}

///|
pub extend ModelTerm with Eq::{not_equal, equal}

///|
pub extend ModelTerm with Debug::{to_repr}

///|
pub extend ModelTerm with @lib.OCompare::{ocompare}

///|
pub extend ModelTerm with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_ModelTerm(x : ModelTerm) -> Int {
  match x {
    Model_var => 0
    Model_fn(_, _, _) => 1000000
  }
}

///|
pub impl @lib.OCompare for ModelTerm with fn ocompare(self, other) {
  match (self, other) {
    (Model_fn(a0, a1, a2), Model_fn(b0, b1, b2)) => {
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
    _ => ocaml_rank_ModelTerm(self).compare(ocaml_rank_ModelTerm(other))
  }
}

///|
pub impl @lib.OHash for ModelTerm with fn ohash_visit(self, h) {
  match self {
    Model_var => h.int(0L)
    Model_fn(a0, a1, a2) => {
      h.block(0, 3)
      h.field(a0)
      h.field(a1)
      h.field(a2)
    }
  }
}

///|
/// `modelTerm`
pub fn modelterm(
  x3950 : Model,
  x3951 : Valuation,
) -> ((Term) -> (ModelTerm, Element) raise) raise {
  let vm = x3950
  let vv = x3951
  fn modeltm(x3953 : Term) -> (ModelTerm, Element) raise {
    let tm = x3953
    match destterm(tm) {
      Term::Var(v) => (ModelTerm::Model_var, getvaluation(vv, v))
      Term::Fn((f, tms)) => {
        let (tms_1, xs) = @lib.unzip(@lib.map(modeltm, tms))
        let t3954 = interpretfunction(vm, (f, xs))
        (ModelTerm::Model_fn(f, tms_1, xs), t3954)
      }
    }
  }
  modeltm
}

///|
/// `perturbation`
#derive(Eq, Debug)
pub(all) enum Perturbation {
  Function_perturbation((FunctionName, @list.List[Element]), Element)
  Relation_perturbation((RelationName, @list.List[Element]), Bool)
}

///|
pub extend Perturbation with Eq::{not_equal, equal}

///|
pub extend Perturbation with Debug::{to_repr}

///|
pub extend Perturbation with @lib.OCompare::{ocompare}

///|
pub extend Perturbation with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_Perturbation(x : Perturbation) -> Int {
  match x {
    Function_perturbation(_, _) => 1000000
    Relation_perturbation(_, _) => 1000001
  }
}

///|
pub impl @lib.OCompare for Perturbation with fn ocompare(self, other) {
  match (self, other) {
    (Function_perturbation(a0, a1), Function_perturbation(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    (Relation_perturbation(a0, a1), Relation_perturbation(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    _ => ocaml_rank_Perturbation(self).compare(ocaml_rank_Perturbation(other))
  }
}

///|
pub impl @lib.OHash for Perturbation with fn ohash_visit(self, h) {
  match self {
    Function_perturbation(a0, a1) => {
      h.block(0, 2)
      h.field(a0)
      h.field(a1)
    }
    Relation_perturbation(a0, a1) => {
      h.block(1, 2)
      h.field(a0)
      h.field(a1)
    }
  }
}

///|
/// `perturb`
pub fn perturb(x3955 : Model, x3956 : Perturbation) -> Unit raise {
  let vm = x3955
  let pert = x3956
  match pert {
    Perturbation::Function_perturbation((func, elts), elt) =>
      updatefunction(vm, ((func, elts), elt))
    Perturbation::Relation_perturbation((rel, elts_1), pol) =>
      updaterelation(vm, ((rel, elts_1), pol))
  }
}

///|
/// `pertTerm`
pub fn pertterm(
  x3957 : Model,
  x3958 : @list.List[Int64],
  x3959 : ModelTerm,
  x3960 : @list.List[Perturbation],
) -> @list.List[Perturbation] raise {
  let vm = x3957
  let target = x3958
  let tm = x3959
  let acc = x3960
  match target {
    Empty => acc
    _ =>
      match tm {
        ModelTerm::Model_var => acc
        ModelTerm::Model_fn(func, tms, xs) => {
          let ontarget : (@list.List[Int64]) -> Bool raise = fn(
            x3961 : @list.List[Int64],
          ) -> Bool raise {
            let ys = x3961
            @lib.mem(interpretfunction(vm, (func, ys)), target)
          }
          let func_xs = (func, xs)
          let acc_2 = if isfixedfunction(vm, func_xs) {
            acc
          } else {
            let add_1 : ((Int64, @list.List[Perturbation])) -> @list.List[
              Perturbation,
            ] raise = fn(
              x3962 : (Int64, @list.List[Perturbation]),
            ) -> @list.List[Perturbation] raise {
              let (y, acc_1) = x3962
              acc_1.prepend(Perturbation::Function_perturbation(func_xs, y))
            }
            foldl(add_1, acc, target)
          }
          pertterms(vm, ontarget)(tms)(xs)(acc_2)
        }
      }
  }
}

///|
/// `pertTerms`
pub fn pertterms(
  x3963 : Model,
  x3964 : (@list.List[Int64]) -> Bool raise,
) -> ((@list.List[ModelTerm]) -> ((@list.List[Element]) -> ((
  @list.List[Perturbation],
) -> @list.List[Perturbation] raise) raise) raise) raise {
  let vm_1 = x3963
  let ontarget_1 = x3964
  let vn = msize(vm_1)
  let filterelements : ((Int64) -> Bool raise) -> @list.List[Int64] raise = fn(
    x3966 : (Int64) -> Bool raise,
  ) -> @list.List[Int64] raise {
    let pred = x3966
    fn filt(
      x3967 : Int64,
      x3968 : @list.List[Int64],
    ) -> @list.List[Int64] raise {
      let i = x3967
      let acc_3 = x3968
      match i {
        0L => acc_3
        _ => {
          let i_1 = @lib.sub63(i, 1L)
          let acc_4 = if pred(i_1) { acc_3.prepend(i_1) } else { acc_3 }
          filt(i_1, acc_4)
        }
      }
    }
    filt(vn, @list.List([]))
  }
  fn pert(
    x3969 : (
      @list.List[Int64],
      @list.List[ModelTerm],
      @list.List[Int64],
      @list.List[Perturbation],
    ),
  ) -> @list.List[Perturbation] raise {
    match x3969 {
      (_, Empty, Empty, acc_5) => acc_5
      (ys_1, More(tm_1, tail=tms_1), More(x, tail=xs_1), acc_6) => {
        let pred_1 : (Int64) -> Bool raise = fn(x3970 : Int64) -> Bool raise {
          let y_1 = x3970
          y_1 != x && ontarget_1(@lib.rev_append(ys_1, xs_1.prepend(y_1)))
        }
        let target_1 = filterelements(pred_1)
        let acc_7 = pertterm(vm_1, target_1, tm_1, acc_6)
        pert((ys_1.prepend(x), tms_1, xs_1, acc_7))
      }
      (_, _, _, _) => raise Bug::Bug("Model.pertTerms.pert")
    }
  }
  fn(
    x3971 : @list.List[ModelTerm],
  ) -> ((@list.List[Int64]) -> ((@list.List[Perturbation]) -> @list.List[
    Perturbation,
  ] raise) raise) raise {
    let x_1 = x3971
    fn(
      x3972 : @list.List[Int64],
    ) -> ((@list.List[Perturbation]) -> @list.List[Perturbation] raise) raise {
      let y_2 = x3972
      fn(x3973 : @list.List[Perturbation]) -> @list.List[Perturbation] raise {
        let z = x3973
        pert((@list.List([]), x_1, y_2, z))
      }
    }
  }
}

///|
/// `pertAtom`
pub fn pertatom(
  x3974 : Model,
  x3975 : Valuation,
  x3976 : Bool,
  x3977 : (String, @list.List[Term]),
  x3978 : @list.List[Perturbation],
) -> @list.List[Perturbation] raise {
  let vm = x3974
  let vv = x3975
  let target = x3976
  let (rel, tms) = x3977
  let acc = x3978
  let ontarget : (@list.List[Int64]) -> Bool raise = fn(
    x3979 : @list.List[Int64],
  ) -> Bool raise {
    let ys = x3979
    interpretrelation(vm, (rel, ys)) == target
  }
  let (tms_1, xs) = @lib.unzip(@lib.map(modelterm(vm, vv), tms))
  let rel_xs = (rel, xs)
  let acc_1 = if isfixedrelation(vm, rel_xs) {
    acc
  } else {
    acc.prepend(Perturbation::Relation_perturbation(rel_xs, target))
  }
  pertterms(vm, ontarget)(tms_1)(xs)(acc_1)
}

///|
/// `pertLiteral`
pub fn pertliteral(
  x3980 : Model,
  x3981 : Valuation,
  x3982 : ((Bool, (String, @list.List[Term])), @list.List[Perturbation]),
) -> @list.List[Perturbation] raise {
  let vm = x3980
  let vv = x3981
  let ((pol, atm), acc) = x3982
  pertatom(vm, vv, pol, atm, acc)
}

///|
/// `pertClause`
pub fn pertclause(
  x3983 : Model,
  x3984 : Valuation,
  x3985 : @oset.T[(Bool, (String, @list.List[Term]))],
  x3986 : @list.List[Perturbation],
) -> @list.List[Perturbation] raise {
  let vm = x3983
  let vv = x3984
  let cl = x3985
  let acc = x3986
  foldl_v16((
    x3987 : ((Bool, (String, @list.List[Term])), @list.List[Perturbation]),
  ) => pertliteral(vm, vv, x3987))(acc)(cl)
}

///|
/// `pickPerturb`
pub fn pickperturb(
  x3988 : Model,
  x3989 : @list.List[Perturbation],
) -> Unit raise {
  let vm = x3988
  let perts = x3989
  if null(perts) {
    ()
  } else {
    perturb(
      vm,
      @lib.list_nth(
        perts,
        @lib.int63_to_int(@lib.random_int(Int::to_int64(@lib.length(perts)))),
      ),
    )
  }
}

///|
/// `perturbTerm`
pub fn perturbterm(
  x3990 : Model,
  x3991 : Valuation,
  x3992 : (Term, @list.List[Int64]),
) -> Unit raise {
  let vm = x3990
  let vv = x3991
  let (tm, target) = x3992
  pickperturb(vm, pertterm(vm, target, modelterm(vm, vv)(tm).0, @list.List([])))
}

///|
/// `perturbAtom`
pub fn perturbatom(
  x3993 : Model,
  x3994 : Valuation,
  x3995 : ((String, @list.List[Term]), Bool),
) -> Unit raise {
  let vm = x3993
  let vv = x3994
  let (atm, target) = x3995
  pickperturb(vm, pertatom(vm, vv, target, atm, @list.List([])))
}

///|
/// `perturbLiteral`
pub fn perturbliteral(
  x3996 : Model,
  x3997 : Valuation,
  x3998 : (Bool, (String, @list.List[Term])),
) -> Unit raise {
  let vm = x3996
  let vv = x3997
  let lit = x3998
  pickperturb(vm, pertliteral(vm, vv, (lit, @list.List([]))))
}

///|
/// `perturbClause`
pub fn perturbclause(
  x3999 : Model,
  x4000 : Valuation,
  x4001 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> Unit raise {
  let vm = x3999
  let vv = x4000
  let cl = x4001
  pickperturb(vm, pertclause(vm, vv, cl, @list.List([])))
}

///|
/// anonymousName
fn step_202() -> Unit raise {
  anonymousname_c.set(fromstring("_"))
}

///|
let anonymousname_c : @lib.Cell[Name] = @lib.Cell::new("anonymousName")

///|
/// `anonymousName`
pub fn anonymousname() -> Name {
  anonymousname_c.get()
}

///|
/// anonymousVar
fn step_203() -> Unit raise {
  anonymousvar_c.set(Term::Var(anonymousname()))
}

///|
let anonymousvar_c : @lib.Cell[Term] = @lib.Cell::new("anonymousVar")

///|
/// `anonymousVar`
pub fn anonymousvar() -> Term {
  anonymousvar_c.get()
}

///|
/// `qterm`
#derive(Eq, Debug)
pub(all) enum Qterm {
  Var
  Fn(NameArity, @list.List[Qterm])
}

///|
pub extend Qterm with Eq::{not_equal, equal}

///|
pub extend Qterm with Debug::{to_repr}

///|
pub extend Qterm with @lib.OCompare::{ocompare}

///|
pub extend Qterm with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_Qterm(x : Qterm) -> Int {
  match x {
    Var => 0
    Fn(_, _) => 1000000
  }
}

///|
pub impl @lib.OCompare for Qterm with fn ocompare(self, other) {
  match (self, other) {
    (Fn(a0, a1), Fn(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    _ => ocaml_rank_Qterm(self).compare(ocaml_rank_Qterm(other))
  }
}

///|
pub impl @lib.OHash for Qterm with fn ohash_visit(self, h) {
  match self {
    Var => h.int(0L)
    Fn(a0, a1) => {
      h.block(0, 2)
      h.field(a0)
      h.field(a1)
    }
  }
}

///|
/// `cmp`
pub fn cmp(x4002 : @list.List[(Qterm, Qterm)]) -> Int64 raise {
  match x4002 {
    Empty => 0L
    More((q1, q2) as q1_q2, tail=qs) =>
      if physical_equal(q1, q2) {
        cmp(qs)
      } else {
        match q1_q2 {
          (Qterm::Var, Qterm::Var) => 0L
          (Qterm::Var, Qterm::Fn(_, _)) => -1L
          (Qterm::Fn(_, _), Qterm::Var) => 1L
          (Qterm::Fn(f1, f1_p), Qterm::Fn(f2, f2_p)) =>
            fncmp((f1, f1_p), (f2, f2_p), qs)
        }
      }
  }
}

///|
/// `fnCmp`
pub fn fncmp(
  x4003 : ((String, Int64), @list.List[Qterm]),
  x4004 : ((String, Int64), @list.List[Qterm]),
  x4005 : @list.List[(Qterm, Qterm)],
) -> Int64 raise {
  let (n1, q1_1) = x4003
  let (n2, q2_1) = x4004
  let qs_1 = x4005
  let c = compare_v15(n1, n2)
  if c != 0L {
    c
  } else {
    cmp(@lib.zip(q1_1, q2_1).concat(qs_1))
  }
}

///|
/// `compareQterm`
pub fn compareqterm(x4006 : Qterm, x4007 : Qterm) -> Int64 raise {
  let q1 = x4006
  let q2 = x4007
  cmp(@list.List([(q1, q2)]))
}

///|
/// `compareFnQterm`
pub fn comparefnqterm(
  x4008 : ((String, Int64), @list.List[Qterm]),
  x4009 : ((String, Int64), @list.List[Qterm]),
) -> Int64 raise {
  let f1 = x4008
  let f2 = x4009
  fncmp(f1, f2, @list.List([]))
}

///|
/// `equalQterm`
pub fn equalqterm(x4010 : Qterm, x4011 : Qterm) -> Bool raise {
  let q1 = x4010
  let q2 = x4011
  compareqterm(q1, q2) == 0L
}

///|
/// `equalFnQterm`
pub fn equalfnqterm(
  x4012 : ((String, Int64), @list.List[Qterm]),
  x4013 : ((String, Int64), @list.List[Qterm]),
) -> Bool raise {
  let f1 = x4012
  let f2 = x4013
  comparefnqterm(f1, f2) == 0L
}

///|
/// `termToQterm`
pub fn termtoqterm(x4014 : Term) -> Qterm raise {
  match x4014 {
    Term::Var(_) => Qterm::Var
    Term::Fn((f, l)) => {
      let t4015 = @lib.map(termtoqterm, l)
      Qterm::Fn((f, Int::to_int64(@lib.length(l))), t4015)
    }
  }
}

///|
/// `qm`
pub fn qm(x4016 : @list.List[(Qterm, Qterm)]) -> Bool raise {
  match x4016 {
    Empty => true
    More((Qterm::Var, _), tail=rest) => qm(rest)
    More((Qterm::Fn(_, _), Qterm::Var), tail=_) => false
    More((Qterm::Fn(f, a), Qterm::Fn(g, b)), tail=rest_1) =>
      equal_v10(f, g) && qm(@lib.zip(a, b).concat(rest_1))
  }
}

///|
/// `matchQtermQterm`
pub fn matchqtermqterm(x4017 : Qterm, x4018 : Qterm) -> Bool raise {
  let qtm = x4017
  let qtm_p = x4018
  qm(@list.List([(qtm, qtm_p)]))
}

///|
/// `qm`
pub fn qm_v1(x4019 : @list.List[(Qterm, Term)]) -> Bool raise {
  match x4019 {
    Empty => true
    More((Qterm::Var, _), tail=rest) => qm_v1(rest)
    More((Qterm::Fn(_, _), Term::Var(_)), tail=_) => false
    More((Qterm::Fn((f, n), a), Term::Fn((g, b))), tail=rest_1) =>
      equal_v6(f, g) &&
      n == Int::to_int64(@lib.length(b)) &&
      qm_v1(@lib.zip(a, b).concat(rest_1))
  }
}

///|
/// `matchQtermTerm`
pub fn matchqtermterm(x4020 : Qterm, x4021 : Term) -> Bool raise {
  let qtm = x4020
  let tm = x4021
  qm_v1(@list.List([(qtm, tm)]))
}

///|
/// `qn`
pub fn qn(
  x4022 : @omap.T[String, Qterm],
  x4023 : @list.List[(Term, Qterm)],
) -> @omap.T[Name, Qterm]? raise {
  let qsub = x4022
  match x4023 {
    Empty => Some(qsub)
    More((Term::Var(v), qtm), tail=rest) =>
      match peek_v4(qsub, v) {
        None => qn(insert_v3(qsub, (v, qtm)), rest)
        Some(qtm_p) =>
          if equalqterm(qtm, qtm_p) {
            qn(qsub, rest)
          } else {
            None
          }
      }
    More((Term::Fn(_), Qterm::Var), tail=_) => None
    More((Term::Fn((f, a)), Qterm::Fn((g, n), b)), tail=rest_1) =>
      if equal_v6(f, g) && Int::to_int64(@lib.length(a)) == n {
        qn(qsub, @lib.zip(a, b).concat(rest_1))
      } else {
        None
      }
  }
}

///|
/// `matchTermQterm`
pub fn matchtermqterm(
  x4024 : @omap.T[String, Qterm],
  x4025 : Term,
  x4026 : Qterm,
) -> @omap.T[Name, Qterm]? raise {
  let qsub = x4024
  let tm = x4025
  let qtm = x4026
  qn(qsub, @list.List([(tm, qtm)]))
}

///|
/// `qv`
pub fn qv(x4027 : Qterm, x4028 : Qterm) -> Qterm raise {
  let s = x4027
  let t = x4028
  match (s, t) {
    (Qterm::Var, x) => x
    (x_1, Qterm::Var) => x_1
    (Qterm::Fn(f, a), Qterm::Fn(g, b)) => {
      let _ = equal_v10(f, g) || @lib.raise_error(Failure("Term_net.qv"))
      Qterm::Fn(f, @lib.map2(qv, a, b))
    }
  }
}

///|
/// `qu`
pub fn qu(
  x4029 : @omap.T[String, Qterm],
  x4030 : @list.List[(Qterm, Term)],
) -> @omap.T[Name, Qterm] raise {
  let qsub = x4029
  match x4030 {
    Empty => qsub
    More((Qterm::Var, _), tail=rest) => qu(qsub, rest)
    More((qtm, Term::Var(v)), tail=rest_1) => {
      let qtm_1 = match peek_v4(qsub, v) {
        None => qtm
        Some(qtm_p) => qv(qtm, qtm_p)
      }
      qu(insert_v3(qsub, (v, qtm_1)), rest_1)
    }
    More((Qterm::Fn((f, n), a), Term::Fn((g, b))), tail=rest_2) =>
      if equal_v6(f, g) && n == Int::to_int64(@lib.length(b)) {
        qu(qsub, @lib.zip(a, b).concat(rest_2))
      } else {
        raise Failure("Term_net.qu")
      }
  }
}

///|
/// `unifyQtermQterm`
pub fn unifyqtermqterm(x4031 : Qterm, x4032 : Qterm) -> Qterm? raise {
  let qtm = x4031
  let qtm_p = x4032
  total((x4033 : Qterm) => qv(qtm, x4033), qtm_p)
}

///|
/// `unifyQtermTerm`
pub fn unifyqtermterm(
  x4034 : @omap.T[String, Qterm],
  x4035 : Qterm,
  x4036 : Term,
) -> @omap.T[Name, Qterm]? raise {
  let qsub = x4034
  let qtm = x4035
  let tm = x4036
  total(
    (x4037 : @list.List[(Qterm, Term)]) => qu(qsub, x4037),
    @list.List([(qtm, tm)]),
  )
}

///|
/// `qtermToTerm`
pub fn qtermtoterm(x4038 : Qterm) -> Term raise {
  match x4038 {
    Qterm::Var => anonymousvar()
    Qterm::Fn((f, _), l) => Term::Fn((f, @lib.map(qtermtoterm, l)))
  }
}

///|
/// `parameters`
#derive(Eq, Debug)
pub(all) struct Parameters1 {
  fifo : Bool
}

///|
pub extend Parameters1 with Eq::{not_equal, equal}

///|
pub extend Parameters1 with Debug::{to_repr}

///|
pub extend Parameters1 with @lib.OCompare::{ocompare}

///|
pub extend Parameters1 with @lib.OHash::{ohash_visit}

///|
pub impl @lib.OCompare for Parameters1 with fn ocompare(self, other) {
  @lib.compare(self.fifo, other.fifo)
}

///|
pub impl @lib.OHash for Parameters1 with fn ohash_visit(self, h) {
  h.block(0, 1)
  h.field(self.fifo)
}

///|
/// `net`
#derive(Eq, Debug)
pub(all) enum Net[TA] {
  Result(@list.List[TA])
  Single(Qterm, Net[TA])
  Multiple(Net[TA]?, Map5[Net[TA]])
}

///|
pub extend Net with Eq::{not_equal, equal}

///|
pub extend Net with Debug::{to_repr}

///|
pub extend Net with @lib.OCompare::{ocompare}

///|
pub extend Net with @lib.OHash::{ohash_visit}

///|
fn[TA] ocaml_rank_Net(x : Net[TA]) -> Int {
  match x {
    Result(_) => 1000000
    Single(_, _) => 1000001
    Multiple(_, _) => 1000002
  }
}

///|
pub impl[TA : @lib.OCompare] @lib.OCompare for Net[TA] with fn ocompare(
  self,
  other,
) {
  match (self, other) {
    (Result(a0), Result(b0)) => @lib.compare(a0, b0)
    (Single(a0, a1), Single(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    (Multiple(a0, a1), Multiple(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    _ => ocaml_rank_Net(self).compare(ocaml_rank_Net(other))
  }
}

///|
pub impl[TA : @lib.OHash] @lib.OHash for Net[TA] with fn ohash_visit(self, h) {
  match self {
    Result(a0) => {
      h.block(0, 1)
      h.field(a0)
    }
    Single(a0, a1) => {
      h.block(1, 2)
      h.field(a0)
      h.field(a1)
    }
    Multiple(a0, a1) => {
      h.block(2, 2)
      h.field(a0)
      h.field(a1)
    }
  }
}

///|
/// `termNet`
#derive(Eq, Debug)
pub(all) enum TermNet[TA] {
  Net(Parameters1, Int64, (Int64, Net[(Int64, TA)])?)
}

///|
pub extend TermNet with Eq::{not_equal, equal}

///|
pub extend TermNet with Debug::{to_repr}

///|
pub extend TermNet with @lib.OCompare::{ocompare}

///|
pub extend TermNet with @lib.OHash::{ohash_visit}

///|
fn[TA] ocaml_rank_TermNet(x : TermNet[TA]) -> Int {
  match x {
    Net(_, _, _) => 1000000
  }
}

///|
pub impl[TA : @lib.OCompare] @lib.OCompare for TermNet[TA] with fn ocompare(
  self,
  other,
) {
  match (self, other) {
    (Net(a0, a1, a2), Net(b0, b1, b2)) => {
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
    _ => ocaml_rank_TermNet(self).compare(ocaml_rank_TermNet(other))
  }
}

///|
pub impl[TA : @lib.OHash] @lib.OHash for TermNet[TA] with fn ohash_visit(
  self,
  h,
) {
  match self {
    Net(a0, a1, a2) => {
      h.block(0, 3)
      h.field(a0)
      h.field(a1)
      h.field(a2)
    }
  }
}

///|
/// `newNet`
pub fn[TA] newnet(x4039 : Parameters1) -> TermNet[TA] raise {
  let parm = x4039
  TermNet::Net(parm, 0L, None)
}

///|
/// `computeSize`
pub fn[TA] computesize(x4040 : Net[TA]) -> Int64 raise {
  match x4040 {
    Net::Result(l) => Int::to_int64(@lib.length(l))
    Net::Single(_, n) => computesize(n)
    Net::Multiple(vs, fs) =>
      foldl_v8(
        fn(x4041 : ((String, Int64), Net[TA], Int64)) -> Int64 raise {
          let (_, n_1, acc) = x4041
          @lib.add63(acc, computesize(n_1))
        },
        match vs {
          Some(n_2) => computesize(n_2)
          None => 0L
        },
        fs,
      )
  }
}

///|
/// `netSize`
pub fn[TA] netsize(x4042 : Net[TA]?) -> (Int64, Net[TA])? raise {
  match x4042 {
    None => None
    Some(n) => Some((computesize(n), n))
  }
}

///|
/// `size`
pub fn[TA] size_v19(x4043 : TermNet[TA]) -> Int64 raise {
  match x4043 {
    TermNet::Net(_, _, None) => 0L
    TermNet::Net(_, _, Some((i, _))) => i
  }
}

///|
/// `null`
pub fn[TA] null_v20(x4044 : TermNet[TA]) -> Bool raise {
  let net = x4044
  size_v19(net) == 0L
}

///|
/// `singles`
pub fn[TA] singles(x4045 : @list.List[Qterm], x4046 : Net[TA]) -> Net[TA] raise {
  let qtms = x4045
  let a = x4046
  foldr(
    fn(x4047 : (Qterm, Net[TA])) -> Net[TA] raise {
      let (x, y) = x4047
      Net::Single(x, y)
    },
    a,
    qtms,
  )
}

///|
/// `pre`
pub fn[TA] pre(x4048 : (Int64, TA)?) -> (Int64, TA?) raise {
  match x4048 {
    None => (0L, None)
    Some((i, n)) => (i, Some(n))
  }
}

///|
/// `add`
pub fn[TA] add_v27(
  x4049 : Net[TA],
  x4050 : @list.List[Qterm],
  x4051 : Net[TA],
) -> Net[TA] raise {
  let a = x4049
  let b = x4050
  let c = x4051
  match (a, b, c) {
    (Net::Result(l), Empty, Net::Result(l_p)) => Net::Result(l.concat(l_p))
    (a_1, More(qtm, tail=qtms) as input1, Net::Single(qtm_p, n)) =>
      if equalqterm(qtm, qtm_p) {
        Net::Single(qtm, add_v27(a_1, qtms, n))
      } else {
        add_v27(
          a_1,
          input1,
          add_v27(n, @list.List([qtm_p]), Net::Multiple(None, newmap_v4(()))),
        )
      }
    (a_2, More(Qterm::Var, tail=qtms_1), Net::Multiple(vs, fs)) =>
      Net::Multiple(Some(oadd(a_2, qtms_1, vs)), fs)
    (a_3, More(Qterm::Fn(f, l_1), tail=qtms_2), Net::Multiple(vs_1, fs_1)) => {
      let n_1 = peek_v5(fs_1, f)
      Net::Multiple(
        vs_1,
        insert_v4(fs_1, (f, oadd(a_3, l_1.concat(qtms_2), n_1))),
      )
    }
    _ => raise Bug::Bug("Term_net.insert: Match")
  }
}

///|
/// `oadd`
pub fn[TA] oadd(
  x4052 : Net[TA],
  x4053 : @list.List[Qterm],
  x4054 : Net[TA]?,
) -> Net[TA] raise {
  let a_4 = x4052
  let qtms_3 = x4053
  match x4054 {
    None => singles(qtms_3, a_4)
    Some(n_2) => add_v27(a_4, qtms_3, n_2)
  }
}

///|
/// `ins`
pub fn[TA] ins(
  x4055 : TA,
  x4056 : Qterm,
  x4057 : (Int64, Net[TA]?),
) -> (Int64, Net[TA])? raise {
  let a = x4055
  let qtm = x4056
  let (i, n) = x4057
  let t4058 = oadd(Net::Result(@list.List([a])), @list.List([qtm]), n)
  Some((@lib.add63(i, 1L), t4058))
}

///|
/// `insert`
pub fn[TA] insert_v10(
  x4059 : TermNet[TA],
) -> (((Term, TA)) -> TermNet[TA] raise) raise {
  match x4059 {
    TermNet::Net(p, k, n) =>
      fn(x4060 : (Term, TA)) -> TermNet[TA] raise {
        let (tm, a) = x4060
        try {
          let t4061 = pre(n)
          let t4062 = ins((k, a), termtoqterm(tm), t4061)
          TermNet::Net(p, @lib.add63(k, 1L), t4062)
        } catch {
          Failure(_) => raise Bug::Bug("Term_net.insert: should never fail")
          e => raise e
        }
      }
  }
}

///|
/// `fromList`
pub fn[TA] fromlist_v18(
  x4063 : Parameters1,
  x4064 : @list.List[(Term, TA)],
) -> TermNet[TA] raise {
  let parm = x4063
  let l = x4064
  foldl(
    fn(x4065 : ((Term, TA), TermNet[TA])) -> TermNet[TA] raise {
      let (tm_a, n) = x4065
      insert_v10(n)(tm_a)
    },
    newnet(parm),
    l,
  )
}

///|
/// `filter`
pub fn[TA] filter_v27(
  x4066 : (TA) -> Bool raise,
) -> ((TermNet[TA]) -> TermNet[TA] raise) raise {
  let pred = x4066
  (fn(x4071 : TermNet[TA]) -> TermNet[TA] raise {
    match x4071 {
      TermNet::Net(_, _, None) as net => net
      TermNet::Net(p, k, Some((_, n_3))) =>
        TermNet::Net(p, k, netsize((x4068 => filt_l(pred, x4068))(n_3)))
    }
  }) catch {
    Failure(_) => raise Bug::Bug("Term_net.filter: should never fail")
    e => raise e
  }
}

///|
fn[TA, TB] filt_l(
  pred : (TA) -> Bool raise,
  x4068 : Net[(TB, TA)],
) -> Net[(TB, TA)]? raise {
  let filt = (x4068 : Net[(TB, TA)]) => filt_l(pred, x4068)
  match x4068 {
    Net::Result(l) =>
      match
        @lib.list_filter(
          fn(x4069 : (TB, TA)) -> Bool raise {
            let (_, a) = x4069
            pred(a)
          },
          l,
        ) {
        Empty => None
        l_1 => Some(Net::Result(l_1))
      }
    Net::Single(qtm, n) =>
      match filt(n) {
        None => None
        Some(n_1) => Some(Net::Single(qtm, n_1))
      }
    Net::Multiple(vs, fs) => {
      let vs_1 = bind(vs, filt)
      let fs_1 = mappartial_v5(
        fn(x4070 : ((String, Int64), Net[(TB, TA)])) -> Net[(TB, TA)]? raise {
          let (_, n_2) = x4070
          filt(n_2)
        },
        fs,
      )
      if !is_some(vs_1) && null_v9(fs_1) {
        None
      } else {
        Some(Net::Multiple(vs_1, fs_1))
      }
    }
  }
}

///|
/// `toString`
pub fn[TA] tostring_v9(x4072 : TermNet[TA]) -> String raise {
  let net = x4072
  "Term_net[" + (Int64::to_string(size_v19(net)) + "]")
}

///|
/// `norm`
pub fn norm(
  x4073 : (@list.List[Int64], @list.List[(String, Int64)], @list.List[Qterm]),
) -> (@list.List[Int64], @list.List[(Name, Int64)], @list.List[Qterm]) raise {
  match x4073 {
    (More(0L, tail=ks), More((_, n) as f, tail=fs), qtms) => {
      let (a, qtms_1) = revdivide(qtms)(n)
      addqterm(Qterm::Fn(f, a), (ks, fs, qtms_1))
    }
    stack => stack
  }
}

///|
/// `addQterm`
pub fn addqterm(
  x4074 : Qterm,
  x4075 : (@list.List[Int64], @list.List[(String, Int64)], @list.List[Qterm]),
) -> (@list.List[Int64], @list.List[(Name, Int64)], @list.List[Qterm]) raise {
  let qtm = x4074
  let (ks_1, fs_1, qtms_2) = x4075
  let ks_3 = match ks_1 {
    Empty => @list.List([])
    More(k, tail=ks_2) => ks_2.prepend(@lib.sub63(k, 1L))
  }
  norm((ks_3, fs_1, qtms_2.prepend(qtm)))
}

///|
/// `addFn`
pub fn addfn_v2(
  x4076 : (String, Int64),
  x4077 : (@list.List[Int64], @list.List[(String, Int64)], @list.List[Qterm]),
) -> (@list.List[Int64], @list.List[(Name, Int64)], @list.List[Qterm]) raise {
  let (_, n_1) as f_1 = x4076
  let (ks_4, fs_2, qtms_3) = x4077
  norm((ks_4.prepend(n_1), fs_2.prepend(f_1), qtms_3))
}

///|
/// `stackEmpty`
pub fn[TA, TB, TC] stackempty() -> (
  @list.List[TA],
  @list.List[TB],
  @list.List[TC],
) {
  (@list.List([]), @list.List([]), @list.List([]))
}

///|
/// stackAddQterm
fn step_204() -> Unit raise {
  stackaddqterm_c.set(fn(
    x4078 : Qterm,
  ) -> (((@list.List[Int64], @list.List[(String, Int64)], @list.List[Qterm])) -> (
    @list.List[Int64],
    @list.List[(String, Int64)],
    @list.List[Qterm],
  ) raise) raise {
    fn(
      x4079 : (
        @list.List[Int64],
        @list.List[(String, Int64)],
        @list.List[Qterm],
      ),
    ) -> (@list.List[Int64], @list.List[(String, Int64)], @list.List[Qterm]) raise {
      addqterm(x4078, x4079)
    }
  })
}

///|
let stackaddqterm_c : @lib.Cell[
  (Qterm) -> ((
    (@list.List[Int64], @list.List[(Name, Int64)], @list.List[Qterm]),
  ) -> (@list.List[Int64], @list.List[(Name, Int64)], @list.List[Qterm]) raise) raise,
] = @lib.Cell::new("stackAddQterm")

///|
/// `stackAddQterm`
pub fn stackaddqterm(
  x : Qterm,
) -> (((@list.List[Int64], @list.List[(Name, Int64)], @list.List[Qterm])) -> (
  @list.List[Int64],
  @list.List[(Name, Int64)],
  @list.List[Qterm],
) raise) raise {
  stackaddqterm_c.get()(x)
}

///|
/// stackAddFn
fn step_205() -> Unit raise {
  stackaddfn_c.set(fn(
    x4080 : (String, Int64),
  ) -> (((@list.List[Int64], @list.List[(String, Int64)], @list.List[Qterm])) -> (
    @list.List[Int64],
    @list.List[(String, Int64)],
    @list.List[Qterm],
  ) raise) raise {
    fn(
      x4081 : (
        @list.List[Int64],
        @list.List[(String, Int64)],
        @list.List[Qterm],
      ),
    ) -> (@list.List[Int64], @list.List[(String, Int64)], @list.List[Qterm]) raise {
      addfn_v2(x4080, x4081)
    }
  })
}

///|
let stackaddfn_c : @lib.Cell[
  ((Name, Int64)) -> ((
    (@list.List[Int64], @list.List[(Name, Int64)], @list.List[Qterm]),
  ) -> (@list.List[Int64], @list.List[(Name, Int64)], @list.List[Qterm]) raise) raise,
] = @lib.Cell::new("stackAddFn")

///|
/// `stackAddFn`
pub fn stackaddfn(
  x : (Name, Int64),
) -> (((@list.List[Int64], @list.List[(Name, Int64)], @list.List[Qterm])) -> (
  @list.List[Int64],
  @list.List[(Name, Int64)],
  @list.List[Qterm],
) raise) raise {
  stackaddfn_c.get()(x)
}

///|
/// `stackValue`
pub fn[TA, TB, TC] stackvalue(
  x4082 : (@list.List[TB], @list.List[TC], @list.List[TA]),
) -> TA raise {
  match x4082 {
    (Empty, Empty, More(qtm, tail=Empty)) => qtm
    _ => raise Bug::Bug("Term_net.stackValue")
  }
}

///|
/// `fold`
pub fn[TA, TB] fold_v17(
  x4083 : ((Qterm, Net[TB], TA)) -> TA raise,
  x4084 : TA,
  x4085 : @list.List[
    (
      Int64,
      (@list.List[Int64], @list.List[(String, Int64)], @list.List[Qterm]),
      Net[TB],
    ),
  ],
) -> TA raise {
  let inc = x4083
  let acc = x4084
  match x4085 {
    Empty => acc
    More((0L, stack, net), tail=rest) =>
      fold_v17(inc, inc((stackvalue(stack), net, acc)), rest)
    More((n, stack_1, Net::Single(qtm, net_1)), tail=rest_1) => {
      let t4086 = stackaddqterm(qtm)(stack_1)
      fold_v17(inc, acc, rest_1.prepend((@lib.sub63(n, 1L), t4086, net_1)))
    }
    More((n_1, stack_2, Net::Multiple(v, fns)), tail=rest_2) => {
      let n_2 = @lib.sub63(n_1, 1L)
      let rest_3 = match v {
        None => rest_2
        Some(net_2) =>
          rest_2.prepend((n_2, stackaddqterm(Qterm::Var)(stack_2), net_2))
      }
      fold_v17(
        inc,
        acc,
        foldr_v8(fn(
          x4091 : (
            (String, Int64),
            Net[TB],
            @list.List[
              (
                Int64,
                (
                  @list.List[Int64],
                  @list.List[(String, Int64)],
                  @list.List[Qterm],
                ),
                Net[TB],
              ),
            ],
          ),
        ) -> @list.List[
          (
            Int64,
            (@list.List[Int64], @list.List[(String, Int64)], @list.List[Qterm]),
            Net[TB],
          ),
        ] raise {
          ((x4087, x4088, x4089) => getfns_l(n_2, stack_2, x4087, x4088, x4089))(
            x4091.0,
            x4091.1,
            x4091.2,
          )
        })(rest_3)(fns),
      )
    }
    _ => raise Bug::Bug("Term_net.foldTerms.fold")
  }
}

///|
fn[TC] getfns_l(
  n_2 : Int64,
  stack_2 : (@list.List[Int64], @list.List[(String, Int64)], @list.List[Qterm]),
  x4087 : (String, Int64),
  x4088 : TC,
  x4089 : @list.List[
    (
      Int64,
      (@list.List[Int64], @list.List[(String, Int64)], @list.List[Qterm]),
      TC,
    ),
  ],
) -> @list.List[
  (Int64, (@list.List[Int64], @list.List[(Name, Int64)], @list.List[Qterm]), TC),
] raise {
  let ((_, k) as f, net_3, x) = (x4087, x4088, x4089)
  let t4090 = stackaddfn(f)(stack_2)
  x.prepend((@lib.add63(k, n_2), t4090, net_3))
}

///|
/// `foldTerms`
pub fn[TA, TB] foldterms(
  x4092 : ((Qterm, Net[TB], TA)) -> TA raise,
  x4093 : TA,
  x4094 : Net[TB],
) -> TA raise {
  let inc = x4092
  let acc = x4093
  let net = x4094
  fold_v17(inc, acc, @list.List([(1L, stackempty(), net)]))
}

///|
/// `foldEqualTerms`
pub fn[TA, TB] foldequalterms(
  x4095 : Qterm,
  x4096 : ((Qterm, Net[TB], TA)) -> TA raise,
  x4097 : TA,
) -> ((Net[TB]) -> TA raise) raise {
  let pat = x4095
  let inc = x4096
  let acc = x4097
  fn fold_1(x4099 : (@list.List[Qterm], Net[TB])) -> TA raise {
    match x4099 {
      (Empty, net) => inc((pat, net, acc))
      (More(pat_1, tail=pats), Net::Single(qtm, net_1)) =>
        if equalqterm(pat_1, qtm) {
          fold_1((pats, net_1))
        } else {
          acc
        }
      (More(Qterm::Var, tail=pats_1), Net::Multiple(v, _)) =>
        match v {
          None => acc
          Some(net_2) => fold_1((pats_1, net_2))
        }
      (More(Qterm::Fn(f, a), tail=pats_2), Net::Multiple(_, fns)) =>
        match peek_v5(fns, f) {
          None => acc
          Some(net_3) => fold_1((a.concat(pats_2), net_3))
        }
      _ => raise Bug::Bug("Term_net.foldEqualTerms.fold")
    }
  }
  fn(x4100 : Net[TB]) -> TA raise {
    let net_4 = x4100
    fold_1((@list.List([pat]), net_4))
  }
}

///|
/// `fold`
pub fn[TA, TB] fold_v18(
  x4101 : ((Qterm, Net[TB], TA)) -> TA raise,
  x4102 : TA,
  x4103 : @list.List[
    (
      @list.List[Qterm],
      (@list.List[Int64], @list.List[(String, Int64)], @list.List[Qterm]),
      Net[TB],
    ),
  ],
) -> TA raise {
  let inc = x4101
  let acc = x4102
  match x4103 {
    Empty => acc
    More((Empty, stack, net), tail=rest) =>
      fold_v18(inc, inc((stackvalue(stack), net, acc)), rest)
    More((More(Qterm::Var, tail=pats), stack_1, net_1), tail=rest_1) =>
      fold_v18(
        inc,
        acc,
        foldterms(
          fn(
            x4107 : (
              Qterm,
              Net[TB],
              @list.List[
                (
                  @list.List[Qterm],
                  (
                    @list.List[Int64],
                    @list.List[(String, Int64)],
                    @list.List[Qterm],
                  ),
                  Net[TB],
                ),
              ],
            ),
          ) -> @list.List[
            (
              @list.List[Qterm],
              (
                @list.List[Int64],
                @list.List[(String, Int64)],
                @list.List[Qterm],
              ),
              Net[TB],
            ),
          ] raise {
            ((x4104, x4105, x4106) => {
              harvest_l(pats, stack_1, x4104, x4105, x4106)
            })(x4107.0, x4107.1, x4107.2)
          },
          rest_1,
          net_1,
        ),
      )
    More(
      (More(pat, tail=pats_1), stack_2, Net::Single(qtm_1, net_2)),
      tail=rest_2
    ) =>
      match unifyqtermqterm(pat, qtm_1) {
        None => fold_v18(inc, acc, rest_2)
        Some(qtm_2) =>
          fold_v18(
            inc,
            acc,
            rest_2.prepend((pats_1, stackaddqterm(qtm_2)(stack_2), net_2)),
          )
      }
    More(
      (
        More(Qterm::Fn(f, a) as pat_1, tail=pats_2),
        stack_3,
        Net::Multiple(v, fns),
      ),
      tail=rest_3
    ) => {
      let rest_4 = match v {
        None => rest_3
        Some(net_3) =>
          rest_3.prepend((pats_2, stackaddqterm(pat_1)(stack_3), net_3))
      }
      let rest_5 = match peek_v5(fns, f) {
        None => rest_4
        Some(net_4) =>
          rest_4.prepend((a.concat(pats_2), stackaddfn(f)(stack_3), net_4))
      }
      fold_v18(inc, acc, rest_5)
    }
    _ => raise Bug::Bug("Term_net.foldUnifiableTerms.fold")
  }
}

///|
fn[TC] harvest_l(
  pats : @list.List[Qterm],
  stack_1 : (@list.List[Int64], @list.List[(String, Int64)], @list.List[Qterm]),
  x4104 : Qterm,
  x4105 : TC,
  x4106 : @list.List[
    (
      @list.List[Qterm],
      (@list.List[Int64], @list.List[(String, Int64)], @list.List[Qterm]),
      TC,
    ),
  ],
) -> @list.List[
  (
    @list.List[Qterm],
    (@list.List[Int64], @list.List[(Name, Int64)], @list.List[Qterm]),
    TC,
  ),
] raise {
  let (qtm, n, l) = (x4104, x4105, x4106)
  l.prepend((pats, stackaddqterm(qtm)(stack_1), n))
}

///|
/// `foldUnifiableTerms`
pub fn[TA, TB] foldunifiableterms(
  x4108 : Qterm,
  x4109 : ((Qterm, Net[TB], TA)) -> TA raise,
  x4110 : TA,
  x4111 : Net[TB],
) -> TA raise {
  let pat = x4108
  let inc = x4109
  let acc = x4110
  let net = x4111
  fold_v18(inc, acc, @list.List([(@list.List([pat]), stackempty(), net)]))
}

///|
/// `idwise`
pub fn[TA, TB] idwise(x4112 : (Int64, TA), x4113 : (Int64, TB)) -> Int64 raise {
  let (m, _) = x4112
  let (n, _) = x4113
  intcompare(m, n)
}

///|
/// `fifoize`
pub fn[TA] fifoize(
  x4114 : Parameters1,
) -> ((@list.List[(Int64, TA)]) -> @list.List[(Int64, TA)] raise) raise {
  match x4114 {
    { fifo } =>
      fn(x4115 : @list.List[(Int64, TA)]) -> @list.List[(Int64, TA)] raise {
        let l = x4115
        if fifo {
          @lib.list_sort(
            fn(x4116 : (Int64, TA), x4117 : (Int64, TA)) -> Int raise {
              @lib.int63_to_int(idwise(x4116, x4117))
            },
            l,
          )
        } else {
          l
        }
      }
  }
}

///|
/// `finally`
pub fn[TA] finally_(
  x4118 : Parameters1,
  x4119 : @list.List[(Int64, TA)],
) -> @list.List[TA] raise {
  let parm = x4118
  let l = x4119
  @lib.map(fn(x4120 : (Int64, TA)) -> TA raise { x4120.1 }, fifoize(parm)(l))
}

///|
/// `mat`
pub fn[TA] mat(
  x4121 : @list.List[TA],
  x4122 : @list.List[(Net[TA], @list.List[Term])],
) -> @list.List[TA] raise {
  let acc = x4121
  match x4122 {
    Empty => acc
    More((Net::Result(l), Empty), tail=rest) => mat(l.concat(acc), rest)
    More((Net::Single(qtm, n), More(tm, tail=tms)), tail=rest_1) =>
      mat(
        acc,
        if matchqtermterm(qtm, tm) {
          rest_1.prepend((n, tms))
        } else {
          rest_1
        },
      )
    More((Net::Multiple(vs, fs), More(tm_1, tail=tms_1)), tail=rest_2) => {
      let rest_3 = match vs {
        None => rest_2
        Some(n_1) => rest_2.prepend((n_1, tms_1))
      }
      let rest_4 = match tm_1 {
        Term::Var(_) => rest_3
        Term::Fn((f, l_1)) =>
          match peek_v5(fs, (f, Int::to_int64(@lib.length(l_1)))) {
            None => rest_3
            Some(n_2) => rest_3.prepend((n_2, l_1.concat(tms_1)))
          }
      }
      mat(acc, rest_4)
    }
    _ => raise Bug::Bug("Term_net.match: Match")
  }
}

///|
/// `matchNet`
pub fn[TA] matchnet(x4123 : TermNet[TA], x4124 : Term) -> @list.List[TA] raise {
  let x = x4123
  let y = x4124
  match (x, y) {
    (TermNet::Net(_, _, None), _) => @list.List([])
    (TermNet::Net(p, _, Some((_, n))), tm) =>
      finally_(p, mat(@list.List([]), @list.List([(n, @list.List([tm]))]))) catch {
        Failure(_) => raise Bug::Bug("Term_net.match: should never fail")
        e => raise e
      }
  }
}

///|
/// `unseenInc`
pub fn[TA, TB, TC] unseeninc(
  x4125 : @omap.T[String, TA],
  x4126 : String,
  x4127 : TC,
  x4128 : (TA, TB, @list.List[(@omap.T[String, TA], TB, TC)]),
) -> @list.List[(@omap.T[Name, TA], TB, TC)] raise {
  let qsub = x4125
  let v = x4126
  let tms = x4127
  let (qtm, net, rest) = x4128
  rest.prepend((insert_v3(qsub, (v, qtm)), net, tms))
}

///|
/// `seenInc`
pub fn[TA, TB, TC, TD] seeninc(
  x4129 : TA,
  x4130 : TC,
  x4131 : (TD, TB, @list.List[(TA, TB, TC)]),
) -> @list.List[(TA, TB, TC)] raise {
  let qsub = x4129
  let tms = x4130
  let (_, net, rest) = x4131
  rest.prepend((qsub, net, tms))
}

///|
/// `mat`
pub fn[TA] mat_v1(
  x4132 : @list.List[TA],
  x4133 : @list.List[(@omap.T[String, Qterm], Net[TA], @list.List[Term])],
) -> @list.List[TA] raise {
  let acc = x4132
  match x4133 {
    Empty => acc
    More((_, Net::Result(l), Empty), tail=rest) => mat_v1(l.concat(acc), rest)
    More((qsub, Net::Single(qtm, net), More(tm, tail=tms)), tail=rest_1) =>
      match matchtermqterm(qsub, tm, qtm) {
        None => mat_v1(acc, rest_1)
        Some(qsub_1) => mat_v1(acc, rest_1.prepend((qsub_1, net, tms)))
      }
    More(
      (qsub_2, Net::Multiple(_, _) as net_1, More(Term::Var(v), tail=tms_1)),
      tail=rest_2
    ) =>
      match peek_v4(qsub_2, v) {
        None =>
          mat_v1(
            acc,
            foldterms(
              (
                x4134 : (
                  Qterm,
                  Net[TA],
                  @list.List[
                    (@omap.T[String, Qterm], Net[TA], @list.List[Term]),
                  ],
                ),
              ) => unseeninc(qsub_2, v, tms_1, x4134),
              rest_2,
              net_1,
            ),
          )
        Some(qtm_1) =>
          mat_v1(
            acc,
            foldequalterms(
              qtm_1,
              (
                x4135 : (
                  Qterm,
                  Net[TA],
                  @list.List[
                    (@omap.T[String, Qterm], Net[TA], @list.List[Term]),
                  ],
                ),
              ) => seeninc(qsub_2, tms_1, x4135),
              rest_2,
            )(net_1),
          )
      }
    More(
      (qsub_3, Net::Multiple(_, fns), More(Term::Fn((f, a)), tail=tms_2)),
      tail=rest_3
    ) => {
      let rest_4 = match peek_v5(fns, (f, Int::to_int64(@lib.length(a)))) {
        None => rest_3
        Some(net_2) => rest_3.prepend((qsub_3, net_2, a.concat(tms_2)))
      }
      mat_v1(acc, rest_4)
    }
    _ => raise Bug::Bug("Term_net.matched.mat")
  }
}

///|
/// `matched`
pub fn[TA] matched(x4136 : TermNet[TA], x4137 : Term) -> @list.List[TA] raise {
  let x = x4136
  let tm = x4137
  match x {
    TermNet::Net(_, _, None) => @list.List([])
    TermNet::Net(parm, _, Some((_, net))) =>
      finally_(
        parm,
        mat_v1(
          @list.List([]),
          @list.List([(newmap_v3(()), net, @list.List([tm]))]),
        ),
      ) catch {
        Failure(_) => raise Bug::Bug("Term_net.matched: should never fail")
        e => raise e
      }
  }
}

///|
/// `inc`
pub fn[TA, TB, TC] inc(
  x4138 : @omap.T[String, TA],
  x4139 : String,
  x4140 : TC,
  x4141 : (TA, TB, @list.List[(@omap.T[String, TA], TB, TC)]),
) -> @list.List[(@omap.T[Name, TA], TB, TC)] raise {
  let qsub = x4138
  let v = x4139
  let tms = x4140
  let (qtm, net, rest) = x4141
  rest.prepend((insert_v3(qsub, (v, qtm)), net, tms))
}

///|
/// `mat`
pub fn[TA] mat_v2(
  x4142 : @list.List[TA],
  x4143 : @list.List[(@omap.T[String, Qterm], Net[TA], @list.List[Term])],
) -> @list.List[TA] raise {
  let acc = x4142
  match x4143 {
    Empty => acc
    More((_, Net::Result(l), Empty), tail=rest) => mat_v2(l.concat(acc), rest)
    More((qsub, Net::Single(qtm, net), More(tm, tail=tms)), tail=rest_1) =>
      match unifyqtermterm(qsub, qtm, tm) {
        None => mat_v2(acc, rest_1)
        Some(qsub_1) => mat_v2(acc, rest_1.prepend((qsub_1, net, tms)))
      }
    More(
      (qsub_2, Net::Multiple(_, _) as net_1, More(Term::Var(v), tail=tms_1)),
      tail=rest_2
    ) =>
      match peek_v4(qsub_2, v) {
        None =>
          mat_v2(
            acc,
            foldterms(
              (
                x4144 : (
                  Qterm,
                  Net[TA],
                  @list.List[
                    (@omap.T[String, Qterm], Net[TA], @list.List[Term]),
                  ],
                ),
              ) => inc(qsub_2, v, tms_1, x4144),
              rest_2,
              net_1,
            ),
          )
        Some(qtm_1) =>
          mat_v2(
            acc,
            foldunifiableterms(
              qtm_1,
              (
                x4145 : (
                  Qterm,
                  Net[TA],
                  @list.List[
                    (@omap.T[String, Qterm], Net[TA], @list.List[Term]),
                  ],
                ),
              ) => inc(qsub_2, v, tms_1, x4145),
              rest_2,
              net_1,
            ),
          )
      }
    More(
      (qsub_3, Net::Multiple(v_1, fns), More(Term::Fn((f, a)), tail=tms_2)),
      tail=rest_3
    ) => {
      let rest_4 = match v_1 {
        None => rest_3
        Some(net_2) => rest_3.prepend((qsub_3, net_2, tms_2))
      }
      let rest_5 = match peek_v5(fns, (f, Int::to_int64(@lib.length(a)))) {
        None => rest_4
        Some(net_3) => rest_4.prepend((qsub_3, net_3, a.concat(tms_2)))
      }
      mat_v2(acc, rest_5)
    }
    _ => raise Bug::Bug("Term_net.unify.mat")
  }
}

///|
/// `unify`
pub fn[TA] unify_v3(x4146 : TermNet[TA], x4147 : Term) -> @list.List[TA] raise {
  let x = x4146
  let tm = x4147
  match x {
    TermNet::Net(_, _, None) => @list.List([])
    TermNet::Net(parm, _, Some((_, net))) =>
      finally_(
        parm,
        mat_v2(
          @list.List([]),
          @list.List([(newmap_v3(()), net, @list.List([tm]))]),
        ),
      ) catch {
        Failure(_) => raise Bug::Bug("Term_net.unify: should never fail")
        e => raise e
      }
  }
}

///|
/// `atomToTerm`
pub fn atomtoterm(x4148 : (String, @list.List[Term])) -> Term raise {
  let atom_1 = x4148
  Term::Fn(atom_1)
}

///|
/// `termToAtom`
pub fn termtoatom(x4149 : Term) -> (Name, @list.List[Term]) raise {
  match x4149 {
    Term::Var(_) => raise Bug::Bug("Atom_net.termToAtom")
    Term::Fn(atom_1) => atom_1
  }
}

///|
/// `parameters`
pub type Parameters2 = Parameters1

///|
/// `atomNet`
pub type AtomNet[TA] = TermNet[TA]

///|
/// `newNet`
pub fn[TA] newnet_v1(x : Parameters1) -> TermNet[TA] raise {
  let f : (Parameters1) -> TermNet[TA] raise = newnet
  f(x)
}

///|
/// `size`
pub fn[TA] size_v20(x : TermNet[TA]) -> Int64 raise {
  let f : (TermNet[TA]) -> Int64 raise = size_v19
  f(x)
}

///|
/// `insert`
pub fn[TA] insert_v11(
  x4150 : TermNet[TA],
  x4151 : ((String, @list.List[Term]), TA),
) -> TermNet[TA] raise {
  let net = x4150
  let (atm, a) = x4151
  let t4152 = (atomtoterm(atm), a)
  insert_v10(net)(t4152)
}

///|
/// `fromList`
pub fn[TA] fromlist_v19(
  x4153 : Parameters1,
  x4154 : @list.List[((String, @list.List[Term]), TA)],
) -> TermNet[TA] raise {
  let parm = x4153
  let l = x4154
  foldl(
    fn(
      x4155 : (((String, @list.List[Term]), TA), TermNet[TA]),
    ) -> TermNet[TA] raise {
      let (atm_a, n) = x4155
      insert_v11(n, atm_a)
    },
    newnet_v1(parm),
    l,
  )
}

///|
/// `filter`
pub fn[TA] filter_v28(
  x : (TA) -> Bool raise,
) -> ((TermNet[TA]) -> TermNet[TA] raise) raise {
  let f : ((TA) -> Bool raise) -> ((TermNet[TA]) -> TermNet[TA] raise) raise = filter_v27
  f(x)
}

///|
/// `toString`
pub fn[TA] tostring_v10(x4156 : TermNet[TA]) -> String raise {
  let net = x4156
  "Atom_net[" + (Int64::to_string(size_v20(net)) + "]")
}

///|
/// `matchNet`
pub fn[TA] matchnet_v1(
  x4157 : TermNet[TA],
  x4158 : (String, @list.List[Term]),
) -> @list.List[TA] raise {
  let net = x4157
  let atm = x4158
  matchnet(net, atomtoterm(atm))
}

///|
/// `matched`
pub fn[TA] matched_v1(
  x4159 : TermNet[TA],
  x4160 : (String, @list.List[Term]),
) -> @list.List[TA] raise {
  let net = x4159
  let atm = x4160
  matched(net, atomtoterm(atm))
}

///|
/// `unify`
pub fn[TA] unify_v4(
  x4161 : TermNet[TA],
  x4162 : (String, @list.List[Term]),
) -> @list.List[TA] raise {
  let net = x4161
  let atm = x4162
  unify_v3(net, atomtoterm(atm))
}

///|
/// `parameters`
pub type Parameters3 = Parameters2

///|
/// `literalNet`
#derive(Eq, Debug)
pub(all) struct LiteralNet[TA] {
  positive : AtomNet[TA]
  negative : AtomNet[TA]
}

///|
pub extend LiteralNet with Eq::{not_equal, equal}

///|
pub extend LiteralNet with Debug::{to_repr}

///|
pub extend LiteralNet with @lib.OCompare::{ocompare}

///|
pub extend LiteralNet with @lib.OHash::{ohash_visit}

///|
pub impl[TA : @lib.OCompare] @lib.OCompare for LiteralNet[TA] with fn ocompare(
  self,
  other,
) {
  let c = @lib.compare(self.positive, other.positive)
  if c != 0 {
    return c
  }
  @lib.compare(self.negative, other.negative)
}

///|
pub impl[TA : @lib.OHash] @lib.OHash for LiteralNet[TA] with fn ohash_visit(
  self,
  h,
) {
  h.block(0, 2)
  h.field(self.positive)
  h.field(self.negative)
}

///|
/// `newNet`
pub fn[TA] newnet_v2(x4163 : Parameters1) -> LiteralNet[TA] raise {
  let parm = x4163
  let t4164 = newnet_v1(parm)
  LiteralNet::{ positive: newnet_v1(parm), negative: t4164, }
}

///|
/// `pos`
pub fn[TA] pos(x4165 : LiteralNet[TA]) -> Int64 raise {
  match x4165 {
    { positive: positive_1, .. } => size_v20(positive_1)
  }
}

///|
/// `neg`
pub fn[TA] neg(x4166 : LiteralNet[TA]) -> Int64 raise {
  match x4166 {
    { negative: negative_1, .. } => size_v20(negative_1)
  }
}

///|
/// `size`
pub fn[TA] size_v21(x4167 : LiteralNet[TA]) -> Int64 raise {
  let net = x4167
  let t4168 = neg(net)
  @lib.add63(pos(net), t4168)
}

///|
/// `insert`
pub fn[TA] insert_v12(
  x4169 : LiteralNet[TA],
) -> ((((Bool, (Name, @list.List[Term])), TA)) -> LiteralNet[TA] raise) raise {
  match x4169 {
    { positive: positive_1, negative: negative_1 } =>
      fn(
        x4170 : ((Bool, (String, @list.List[Term])), TA),
      ) -> LiteralNet[TA] raise {
        match x4170 {
          ((true, atm), a) =>
            LiteralNet::{
              positive: insert_v11(positive_1, (atm, a)),
              negative: negative_1,
            }
          ((false, atm_1), a_1) =>
            LiteralNet::{
              positive: positive_1,
              negative: insert_v11(negative_1, (atm_1, a_1)),
            }
        }
      }
  }
}

///|
/// `fromList`
pub fn[TA] fromlist_v20(
  x4171 : Parameters1,
  x4172 : @list.List[((Bool, (String, @list.List[Term])), TA)],
) -> LiteralNet[TA] raise {
  let parm = x4171
  let l = x4172
  foldl(
    fn(
      x4173 : (((Bool, (String, @list.List[Term])), TA), LiteralNet[TA]),
    ) -> LiteralNet[TA] raise {
      let (lit_a, n) = x4173
      insert_v12(n)(lit_a)
    },
    newnet_v2(parm),
    l,
  )
}

///|
/// `filter`
pub fn[TA] filter_v29(
  x4174 : (TA) -> Bool raise,
  x4175 : LiteralNet[TA],
) -> LiteralNet[TA] raise {
  let pred = x4174
  match x4175 {
    { positive: positive_1, negative: negative_1 } => {
      let t4176 = filter_v28(pred)(negative_1)
      LiteralNet::{ positive: filter_v28(pred)(positive_1), negative: t4176, }
    }
  }
}

///|
/// `toString`
pub fn[TA] tostring_v11(x4177 : LiteralNet[TA]) -> String raise {
  let net = x4177
  "Literal_net[" + (Int64::to_string(size_v21(net)) + "]")
}

///|
/// `matchNet`
pub fn[TA] matchnet_v2(
  x4178 : LiteralNet[TA],
) -> (((Bool, (Name, @list.List[Term]))) -> @list.List[TA] raise) raise {
  match x4178 {
    { positive: positive_1, negative: negative_1 } =>
      fn(x4179 : (Bool, (String, @list.List[Term]))) -> @list.List[TA] raise {
        match x4179 {
          (true, atm) => matchnet_v1(positive_1, atm)
          (false, atm_1) => matchnet_v1(negative_1, atm_1)
        }
      }
  }
}

///|
/// `matched`
pub fn[TA] matched_v2(
  x4180 : LiteralNet[TA],
) -> (((Bool, (Name, @list.List[Term]))) -> @list.List[TA] raise) raise {
  match x4180 {
    { positive: positive_1, negative: negative_1 } =>
      fn(x4181 : (Bool, (String, @list.List[Term]))) -> @list.List[TA] raise {
        match x4181 {
          (true, atm) => matched_v1(positive_1, atm)
          (false, atm_1) => matched_v1(negative_1, atm_1)
        }
      }
  }
}

///|
/// `unify`
pub fn[TA] unify_v5(
  x4182 : LiteralNet[TA],
) -> (((Bool, (Name, @list.List[Term]))) -> @list.List[TA] raise) raise {
  match x4182 {
    { positive: positive_1, negative: negative_1 } =>
      fn(x4183 : (Bool, (String, @list.List[Term]))) -> @list.List[TA] raise {
        match x4183 {
          (true, atm) => unify_v4(positive_1, atm)
          (false, atm_1) => unify_v4(negative_1, atm_1)
        }
      }
  }
}

///|
/// `findRest`
pub fn[TA] findrest(
  x4184 : (TA) -> Bool raise,
) -> ((@list.List[TA]) -> (TA, @list.List[TA])? raise) raise {
  let pred = x4184
  fn f(
    x4186 : @list.List[TA],
    x4187 : @list.List[TA],
  ) -> (TA, @list.List[TA])? raise {
    let ys = x4186
    match x4187 {
      Empty => None
      More(x, tail=xs) =>
        if pred(x) {
          Some((x, @lib.rev_append(ys, xs)))
        } else {
          f(ys.prepend(x), xs)
        }
    }
  }
  (x4188 : @list.List[TA]) => f(@list.List([]), x4188)
}

///|
/// `addSym`
pub fn addsym(
  x4189 : (Bool, (String, @list.List[Term])),
  x4190 : @list.List[(Bool, (String, @list.List[Term]))],
) -> @list.List[Literal] raise {
  let (lit, acc) = (x4189, x4190)
  match
    total(
      fn(
        x4191 : (Bool, (String, @list.List[Term])),
      ) -> (Bool, (String, @list.List[Term])) raise {
        sym_v2(x4191.0, x4191.1)
      },
      lit,
    ) {
    None => acc
    Some(lit_1) => acc.prepend(lit_1)
  }
}

///|
/// `clauseSym`
pub fn clausesym(
  x4192 : @list.List[(Bool, (String, @list.List[Term]))],
) -> @list.List[Literal] raise {
  let lits = x4192
  foldl(
    fn(
      x4193 : (
        (Bool, (String, @list.List[Term])),
        @list.List[(Bool, (String, @list.List[Term]))],
      ),
    ) -> @list.List[(Bool, (String, @list.List[Term]))] raise {
      addsym(x4193.0, x4193.1)
    },
    lits,
    lits,
  )
}

///|
/// `sortClause`
pub fn sortclause(
  x4194 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> @list.List[Literal] raise {
  let cl = x4194
  let lits = tolist_v16(cl)
  sortmap(
    fn(x4195 : (Bool, (String, @list.List[Term]))) -> Int64 raise {
      typedsymbols_v2(x4195.0, x4195.1)
    },
    fn(x4200 : Int64) -> ((Int64) -> Int64 raise) raise {
      fn(x4201 : Int64) -> Int64 raise {
        ((x4198 : Int64, x4199 : Int64) => {
          revcompare(
            fn(x4196 : Int64) -> ((Int64) -> Int64 raise) raise {
              fn(x4197 : Int64) -> Int64 raise { intcompare(x4196, x4197) }
            },
            x4198,
            x4199,
          )
        })(x4200, x4201)
      }
    },
    lits,
  )
}

///|
/// `incompatible`
pub fn incompatible(
  x4202 : (Bool, (String, @list.List[Term])),
) -> ((Literal) -> Bool raise) raise {
  let lit = x4202
  let lits = clausesym(@list.List([lit]))
  fn(x4204 : (Bool, (String, @list.List[Term]))) -> Bool raise {
    let lit_p = x4204
    !@lib.exists(
      (x4206 : (Bool, (String, @list.List[Term]))) => {
        @lib.can(
          (x4205 : (Bool, (String, @list.List[Term]))) => {
            unify_v2(empty_v13(), lit_p, x4205)
          },
          x4206,
        )
      },
      lits,
    )
  }
}

///|
/// `clauseId`
pub type ClauseId = Int64

///|
/// `clauseLength`
pub type ClauseLength = Int64

///|
/// `idSet`
pub type IdSet = Set[(ClauseId, ClauseLength)]

///|
/// `idCompare`
pub fn idcompare(x4207 : (Int64, Int64), x4208 : (Int64, Int64)) -> Int64 raise {
  let (id1, len1) = x4207
  let (id2, len2) = x4208
  let c = intcompare(len1, len2)
  if c != 0L {
    c
  } else {
    intcompare(id1, id2)
  }
}

///|
/// idSetEmpty
fn step_206() -> Unit raise {
  idsetempty_c.set(
    empty(fn(
      x4209 : (Int64, Int64),
    ) -> (((Int64, Int64)) -> Int64 raise) raise {
      fn(x4210 : (Int64, Int64)) -> Int64 raise { idcompare(x4209, x4210) }
    }),
  )
}

///|
let idsetempty_c : @lib.Cell[IdSet] = @lib.Cell::new("idSetEmpty")

///|
/// `idSetEmpty`
pub fn idsetempty() -> IdSet {
  idsetempty_c.get()
}

///|
/// `idSetAdd`
pub fn idsetadd(
  x4211 : (Int64, Int64),
  x4212 : Set[(Int64, Int64)],
) -> IdSet raise {
  let (id_len, set) = (x4211, x4212)
  add(set)(id_len)
}

///|
/// `idSetAddMax`
pub fn idsetaddmax(
  x4213 : Int64,
  x4214 : ((Int64, Int64), Set[(Int64, Int64)]),
) -> IdSet raise {
  let max = x4213
  let ((_, len) as id_len, set) = x4214
  if len <= max {
    add(set)(id_len)
  } else {
    set
  }
}

///|
/// `idSetIntersect`
pub fn idsetintersect(
  x4215 : Set[(Int64, Int64)],
  x4216 : Set[(Int64, Int64)],
) -> IdSet raise {
  let set1 = x4215
  let set2 = x4216
  intersect_v1(set1)(set2)
}

///|
/// `nonunit_t`
#derive(Eq, Debug)
pub(all) struct NonunitT[TA] {
  nextid : ClauseId
  clauses : Map2[(@list.List[Literal], Clause, TA)]
  fstlits : LiteralNet[(ClauseId, ClauseLength)]
  sndlits : LiteralNet[(ClauseId, ClauseLength)]
}

///|
pub extend NonunitT with Eq::{not_equal, equal}

///|
pub extend NonunitT with Debug::{to_repr}

///|
pub extend NonunitT with @lib.OCompare::{ocompare}

///|
pub extend NonunitT with @lib.OHash::{ohash_visit}

///|
pub impl[TA : @lib.OCompare] @lib.OCompare for NonunitT[TA] with fn ocompare(
  self,
  other,
) {
  let c = @lib.compare(self.nextid, other.nextid)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.clauses, other.clauses)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.fstlits, other.fstlits)
  if c != 0 {
    return c
  }
  @lib.compare(self.sndlits, other.sndlits)
}

///|
pub impl[TA : @lib.OHash] @lib.OHash for NonunitT[TA] with fn ohash_visit(
  self,
  h,
) {
  h.block(0, 4)
  h.field(self.nextid)
  h.field(self.clauses)
  h.field(self.fstlits)
  h.field(self.sndlits)
}

///|
/// `subsume`
#derive(Eq, Debug)
pub(all) struct Subsume[TA] {
  empty : @list.List[(Clause, Subst, TA)]
  unitn : LiteralNet[(Literal, Clause, TA)]
  nonunit : NonunitT[TA]
}

///|
pub extend Subsume with Eq::{not_equal, equal}

///|
pub extend Subsume with Debug::{to_repr}

///|
pub extend Subsume with @lib.OCompare::{ocompare}

///|
pub extend Subsume with @lib.OHash::{ohash_visit}

///|
pub impl[TA : @lib.OCompare] @lib.OCompare for Subsume[TA] with fn ocompare(
  self,
  other,
) {
  let c = @lib.compare(self.empty, other.empty)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.unitn, other.unitn)
  if c != 0 {
    return c
  }
  @lib.compare(self.nonunit, other.nonunit)
}

///|
pub impl[TA : @lib.OHash] @lib.OHash for Subsume[TA] with fn ohash_visit(
  self,
  h,
) {
  h.block(0, 3)
  h.field(self.empty)
  h.field(self.unitn)
  h.field(self.nonunit)
}

///|
/// `newSubsume`
pub fn[TA] newsubsume(x4217 : Unit) -> Subsume[TA] raise {
  let _ = x4217
  let t4218 = newnet_v2(Parameters1::{ fifo: false, })
  let t4219 = newnet_v2(Parameters1::{ fifo: false, })
  let t4220 = NonunitT::{
    nextid: 0L,
    clauses: newmap_v1(()),
    fstlits: t4219,
    sndlits: t4218,
  }
  Subsume::{
    empty: @list.List([]),
    unitn: newnet_v2(Parameters1::{ fifo: false, }),
    nonunit: t4220,
  }
}

///|
/// `size`
pub fn[TA] size_v22(x4221 : Subsume[TA]) -> Int64 raise {
  match x4221 {
    { empty: empty_1, unitn, nonunit: { clauses } } => {
      let t4223 = size_v2(clauses)
      let t4222 = size_v21(unitn)
      @lib.add63(@lib.add63(Int::to_int64(@lib.length(empty_1)), t4222), t4223)
    }
  }
}

///|
/// `insert`
pub fn[TA] insert_v13(
  x4224 : Subsume[TA],
) -> (((Clause, TA)) -> Subsume[TA] raise) raise {
  match x4224 {
    { empty: empty_1, unitn, nonunit } =>
      fn(
        x4225 : (@oset.T[(Bool, (String, @list.List[Term]))], TA),
      ) -> Subsume[TA] raise {
        let (cl_p, a) = x4225
        match sortclause(cl_p) {
          Empty => {
            let empty_2 = empty_1.prepend((cl_p, empty_v13(), a))
            Subsume::{ empty: empty_2, unitn, nonunit, }
          }
          More(lit, tail=Empty) => {
            let unitn_1 = insert_v12(unitn)((lit, (lit, cl_p, a)))
            Subsume::{ empty: empty_1, unitn: unitn_1, nonunit, }
          }
          More(fstlit, tail=More(sndlit, tail=otherlits) as nonfstlits) =>
            match nonunit {
              { nextid, clauses, fstlits, sndlits } => {
                let id_length = (nextid, size_v16(cl_p))
                let fstlits_1 = insert_v12(fstlits)((fstlit, id_length))
                let (sndlit_1, otherlits_1) = match
                  findrest(incompatible(fstlit))(nonfstlits) {
                  Some(sndlit_otherlits) => sndlit_otherlits
                  None => (sndlit, otherlits)
                }
                let sndlits_1 = insert_v12(sndlits)((sndlit_1, id_length))
                let lits_p = otherlits_1.concat(@list.List([fstlit, sndlit_1]))
                let clauses_1 = insert_v1(clauses, (nextid, (lits_p, cl_p, a)))
                let nextid_1 = @lib.add63(nextid, 1L)
                let nonunit_1 = NonunitT::{
                  nextid: nextid_1,
                  clauses: clauses_1,
                  fstlits: fstlits_1,
                  sndlits: sndlits_1,
                }
                Subsume::{ empty: empty_1, unitn, nonunit: nonunit_1, }
              }
              _ => raise @lib.MatchFailure("tscript.ml:6763")
            }
        }
      }
  }
}

///|
/// `filter`
pub fn[TA] filter_v30(
  x4226 : (TA) -> Bool raise,
  x4227 : Subsume[TA],
) -> Subsume[TA] raise {
  let pred = x4226
  match x4227 {
    { empty: empty_1, unitn, nonunit } => {
      let empty_2 = @lib.list_filter(
        fn(
          x4231 : (@oset.T[(Bool, (String, @list.List[Term]))], Subst, TA),
        ) -> Bool raise {
          ((x4228, x4229, x4230) => pred3_l(pred, x4228, x4229, x4230))(
            x4231.0,
            x4231.1,
            x4231.2,
          )
        },
        empty_1,
      )
      let unitn_1 = filter_v29(
        fn(
          x4232 : (
            (Bool, (String, @list.List[Term])),
            @oset.T[(Bool, (String, @list.List[Term]))],
            TA,
          ),
        ) -> Bool raise {
          ((x4228, x4229, x4230) => pred3_l(pred, x4228, x4229, x4230))(
            x4232.0,
            x4232.1,
            x4232.2,
          )
        },
        unitn,
      )
      let nonunit_1 = match nonunit {
        { nextid, clauses, fstlits, sndlits } => {
          let clauses_p = filter_v3(fn(
            x4233 : (
              Int64,
              (
                @list.List[(Bool, (String, @list.List[Term]))],
                @oset.T[(Bool, (String, @list.List[Term]))],
                TA,
              ),
            ),
          ) -> Bool raise {
            let x_1 = x4233
            ((x4228, x4229, x4230) => pred3_l(pred, x4228, x4229, x4230))(
              x_1.1.0,
              x_1.1.1,
              x_1.1.2,
            )
          })(clauses)
          let t4234 = size_v2(clauses_p)
          if size_v2(clauses) == t4234 {
            nonunit
          } else {
            let fstlits_1 = filter_v29(
              fn(x4237 : (Int64, Int64)) -> Bool raise {
                ((x4235, x4236) => predid_l(clauses_p, x4235, x4236))(
                  x4237.0,
                  x4237.1,
                )
              },
              fstlits,
            )
            let sndlits_1 = filter_v29(
              fn(x4238 : (Int64, Int64)) -> Bool raise {
                ((x4235, x4236) => predid_l(clauses_p, x4235, x4236))(
                  x4238.0,
                  x4238.1,
                )
              },
              sndlits,
            )
            NonunitT::{
              nextid,
              clauses: clauses_p,
              fstlits: fstlits_1,
              sndlits: sndlits_1,
            }
          }
        }
        _ => raise @lib.MatchFailure("tscript.ml:6787")
      }
      Subsume::{ empty: empty_2, unitn: unitn_1, nonunit: nonunit_1, }
    }
  }
}

///|
fn[TA, TB, TC] pred3_l(
  pred : (TA) -> Bool raise,
  x4228 : TB,
  x4229 : TC,
  x4230 : TA,
) -> Bool raise {
  let (_, _, x) = (x4228, x4229, x4230)
  pred(x)
}

///|
fn[TA, TD] predid_l(
  clauses_p : @omap.T[
    Int64,
    (
      @list.List[(Bool, (String, @list.List[Term]))],
      @oset.T[(Bool, (String, @list.List[Term]))],
      TA,
    ),
  ],
  x4235 : Int64,
  x4236 : TD,
) -> Bool raise {
  let (id, _) = (x4235, x4236)
  indomain_v1(id)(clauses_p)
}

///|
/// `toString`
pub fn[TA] tostring_v12(x4239 : Subsume[TA]) -> String raise {
  let subsume = x4239
  "Subsume{" + (Int64::to_string(size_v22(subsume)) + "}")
}

///|
/// `matchLit`
pub fn matchlit(
  x4240 : (Bool, (String, @list.List[Term])),
  x4241 : ((Bool, (String, @list.List[Term])), @list.List[Subst]),
) -> @list.List[Subst] raise {
  let lit_p = x4240
  let (lit, acc) = x4241
  match
    total(
      (x4242 : (Bool, (String, @list.List[Term]))) => {
        matchliterals(empty_v13(), lit_p, x4242)
      },
      lit,
    ) {
    Some(sub) => acc.prepend(sub)
    None => acc
  }
}

///|
/// `genClauseSubsumes`
pub fn[TA, TB] genclausesubsumes(
  x4243 : ((TA, Subst, TB)) -> Bool raise,
  x4244 : TA,
  x4245 : @list.List[(Bool, (String, @list.List[Term]))],
  x4246 : @list.List[(Bool, (String, @list.List[Term]))],
  x4247 : TB,
) -> (TA, Subst, TB)? raise {
  let pred = x4243
  let cl_p = x4244
  let lits_p = x4245
  let cl = x4246
  let a = x4247
  fn mksubsl(
    x4248 : @list.List[@list.List[Subst]],
    x4249 : Subst,
    x4250 : @list.List[(Bool, (String, @list.List[Term]))],
  ) -> (Subst, @list.List[@list.List[Subst]])? raise {
    let acc = x4248
    let sub = x4249
    match x4250 {
      Empty =>
        Some(
          (
            sub,
            sortmap(
              fn(x4251 : @list.List[Subst]) -> Int64 raise {
                Int::to_int64(@lib.length(x4251))
              },
              fn(x4252 : Int64) -> ((Int64) -> Int64 raise) raise {
                fn(x4253 : Int64) -> Int64 raise { intcompare(x4252, x4253) }
              },
              acc,
            ),
          ),
        )
      More(lit_p, tail=lits_p_1) =>
        match
          foldl(
            (x4254 : ((Bool, (String, @list.List[Term])), @list.List[Subst])) => {
              matchlit(lit_p, x4254)
            },
            @list.List([]),
            cl,
          ) {
          Empty => None
          More(sub_p, tail=Empty) =>
            match total(union_v18(sub), sub_p) {
              None => None
              Some(sub_1) => mksubsl(acc, sub_1, lits_p_1)
            }
          subs => mksubsl(acc.prepend(subs), sub, lits_p_1)
        }
    }
  }
  fn search(
    x4255 : @list.List[(Subst, @list.List[@list.List[Subst]])],
  ) -> (TA, Subst, TB)? raise {
    match x4255 {
      Empty => None
      More((sub_2, Empty), tail=others) => {
        let x = (cl_p, sub_2, a)
        if pred(x) {
          Some(x)
        } else {
          search(others)
        }
      }
      More((_, More(Empty, tail=_)), tail=others_1) => search(others_1)
      More((sub_3, More(More(sub_p_1, tail=subs_1), tail=subsl)), tail=others_2) => {
        let others_3 = others_2.prepend((sub_3, subsl.prepend(subs_1)))
        match total(union_v18(sub_3), sub_p_1) {
          None => search(others_3)
          Some(sub_4) => search(others_3.prepend((sub_4, subsl)))
        }
      }
    }
  }
  match mksubsl(@list.List([]), empty_v13(), lits_p) {
    None => None
    Some(sub_subsl) => search(@list.List([sub_subsl]))
  }
}

///|
/// `emptySubsumes`
pub fn[TA] emptysubsumes(
  x4256 : (TA) -> Bool raise,
  x4257 : @list.List[TA],
) -> TA? raise {
  let pred = x4256
  let empty_1 = x4257
  find(pred, empty_1)
}

///|
/// `unitSubsumes`
pub fn[TA, TB] unitsubsumes(
  x4258 : ((TA, Subst, TB)) -> Bool raise,
  x4259 : LiteralNet[((Bool, (String, @list.List[Term])), TA, TB)],
) -> ((@list.List[(Polarity, (Name, @list.List[Term]))]) -> (TA, Subst, TB)? raise) raise {
  let pred = x4258
  let unitn = x4259
  let sublit : ((Bool, (String, @list.List[Term]))) -> (TA, Subst, TB)? raise = fn(
    x4261 : (Bool, (String, @list.List[Term])),
  ) -> (TA, Subst, TB)? raise {
    let lit = x4261
    let subunit : (((Bool, (String, @list.List[Term])), TA, TB)) -> (
      TA,
      Subst,
      TB,
    )? raise = fn(
      x4262 : ((Bool, (String, @list.List[Term])), TA, TB),
    ) -> (TA, Subst, TB)? raise {
      let (lit_p, cl_p, a) = x4262
      match
        total(
          (x4263 : (Bool, (String, @list.List[Term]))) => {
            matchliterals(empty_v13(), lit_p, x4263)
          },
          lit,
        ) {
        None => None
        Some(sub) => {
          let x = (cl_p, sub, a)
          if pred(x) {
            Some(x)
          } else {
            None
          }
        }
      }
    }
    first(subunit, matchnet_v2(unitn)(lit))
  }
  (x4264 : @list.List[(Bool, (String, @list.List[Term]))]) => {
    first(sublit, x4264)
  }
}

///|
/// `nonunitSubsumes`
pub fn[TA] nonunitsubsumes(
  x4265 : ((@oset.T[(Bool, (String, @list.List[Term]))], Subst, TA)) -> Bool raise,
  x4266 : NonunitT[TA],
  x4267 : Int64?,
  x4268 : @list.List[(Bool, (String, @list.List[Term]))],
) -> (Clause, Subst, TA)? raise {
  let pred = x4265
  let nonunit = x4266
  let max = x4267
  let cl = x4268
  let addid : (((Int64, Int64), Set[(Int64, Int64)])) -> Set[(Int64, Int64)] raise = match
    max {
    None =>
      fn(
        x4269 : ((Int64, Int64), Set[(Int64, Int64)]),
      ) -> Set[(Int64, Int64)] raise {
        idsetadd(x4269.0, x4269.1)
      }
    Some(n) =>
      (x4270 : ((Int64, Int64), Set[(Int64, Int64)])) => idsetaddmax(n, x4270)
  }
  let sublit : (LiteralNet[(Int64, Int64)]) -> ((
    ((Bool, (String, @list.List[Term])), Set[(Int64, Int64)]),
  ) -> Set[(Int64, Int64)] raise) raise = fn(
    x4271 : LiteralNet[(Int64, Int64)],
  ) -> ((((Bool, (String, @list.List[Term])), Set[(Int64, Int64)])) -> Set[
    (Int64, Int64),
  ] raise) raise {
    let lits = x4271
    fn(
      x4272 : ((Bool, (String, @list.List[Term])), Set[(Int64, Int64)]),
    ) -> Set[(Int64, Int64)] raise {
      let (lit, acc) = x4272
      foldl(addid, acc, matchnet_v2(lits)(lit))
    }
  }
  match nonunit {
    { nextid: _, clauses, fstlits, sndlits } => {
      let fstcands = foldl(sublit(fstlits), idsetempty(), cl)
      let sndcands = foldl(sublit(sndlits), idsetempty(), cl)
      let cands = idsetintersect(fstcands, sndcands)
      firstl_v1(fn(
        x4275 : (Int64, Int64),
      ) -> (@oset.T[(Bool, (String, @list.List[Term]))], Subst, TA)? raise {
        ((x4273, x4274) => subcl_p_l(clauses, pred, cl, x4273, x4274))(
          x4275.0,
          x4275.1,
        )
      })(cands)
    }
    _ => raise @lib.MatchFailure("tscript.ml:6869")
  }
}

///|
fn[TA, TB] subcl_p_l(
  clauses : @omap.T[
    Int64,
    (
      @list.List[(Bool, (String, @list.List[Term]))],
      @oset.T[(Bool, (String, @list.List[Term]))],
      TA,
    ),
  ],
  pred : ((@oset.T[(Bool, (String, @list.List[Term]))], Subst, TA)) -> Bool raise,
  cl : @list.List[(Bool, (String, @list.List[Term]))],
  x4273 : Int64,
  x4274 : TB,
) -> (Clause, Subst, TA)? raise {
  let (id, _) = (x4273, x4274)
  let (lits_p, cl_p, a) = get_v1(clauses, id)
  genclausesubsumes(pred, cl_p, lits_p, cl, a)
}

///|
/// `genSubsumes`
pub fn[TA] gensubsumes(
  x4276 : ((@oset.T[(Bool, (String, @list.List[Term]))], Subst, TA)) -> Bool raise,
  x4277 : Subsume[TA],
) -> ((ClauseLength?) -> ((@oset.T[Literal]) -> (Clause, Subst, TA)? raise) raise) raise {
  let pred = x4276
  match x4277 {
    { empty: empty_1, unitn, nonunit } =>
      fn(
        x4278 : Int64?,
      ) -> ((@oset.T[(Bool, (String, @list.List[Term]))]) -> (
        @oset.T[(Bool, (String, @list.List[Term]))],
        Subst,
        TA,
      )? raise) raise {
        let max = x4278
        fn(
          x4279 : @oset.T[(Bool, (String, @list.List[Term]))],
        ) -> (@oset.T[(Bool, (String, @list.List[Term]))], Subst, TA)? raise {
          let cl = x4279
          match emptysubsumes(pred, empty_1) {
            Some(_) as s => s
            None =>
              if max == Some(0L) {
                None
              } else {
                let cl_1 = clausesym(tolist_v16(cl))
                match unitsubsumes(pred, unitn)(cl_1) {
                  Some(_) as s_1 => s_1
                  None =>
                    if max == Some(1L) {
                      None
                    } else {
                      nonunitsubsumes(pred, nonunit, max, cl_1)
                    }
                }
              }
          }
        }
      }
  }
}

///|
/// `subsumes`
pub fn[TA] subsumes(
  x4280 : ((@oset.T[(Bool, (String, @list.List[Term]))], Subst, TA)) -> Bool raise,
  x4281 : Subsume[TA],
  x4282 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> (Clause, Subst, TA)? raise {
  let pred = x4280
  let subsume = x4281
  let cl = x4282
  gensubsumes(pred, subsume)(None)(cl)
}

///|
/// `strictlySubsumes`
pub fn[TA] strictlysubsumes(
  x4283 : ((@oset.T[(Bool, (String, @list.List[Term]))], Subst, TA)) -> Bool raise,
  x4284 : Subsume[TA],
  x4285 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> (Clause, Subst, TA)? raise {
  let pred = x4283
  let subsume = x4284
  let cl = x4285
  let t4286 = Some(size_v16(cl))
  gensubsumes(pred, subsume)(t4286)(cl)
}

///|
/// `isSubsumed`
pub fn[TA] issubsumed(
  x4287 : Subsume[TA],
  x4288 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> Bool raise {
  let subs = x4287
  let cl = x4288
  is_some(
    subsumes(
      fn(
        x4289 : (@oset.T[(Bool, (String, @list.List[Term]))], Subst, TA),
      ) -> Bool raise {
        true
      },
      subs,
      cl,
    ),
  )
}

///|
/// `isStrictlySubsumed`
pub fn[TA] isstrictlysubsumed(
  x4290 : Subsume[TA],
  x4291 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> Bool raise {
  let subs = x4290
  let cl = x4291
  is_some(
    strictlysubsumes(
      fn(
        x4292 : (@oset.T[(Bool, (String, @list.List[Term]))], Subst, TA),
      ) -> Bool raise {
        true
      },
      subs,
      cl,
    ),
  )
}

///|
/// `clauseSubsumes`
pub fn clausesubsumes(
  x4293 : @oset.T[(Bool, (String, @list.List[Term]))],
  x4294 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> Subst? raise {
  let cl_p = x4293
  let cl = x4294
  let lits_p = sortclause(cl_p)
  let lits = clausesym(tolist_v16(cl))
  match
    genclausesubsumes(
      fn(
        x4295 : (@oset.T[(Bool, (String, @list.List[Term]))], Subst, Unit),
      ) -> Bool raise {
        true
      },
      cl_p,
      lits_p,
      lits,
      (),
    ) {
    Some((_, sub, _)) => Some(sub)
    None => None
  }
}

///|
/// `clauseStrictlySubsumes`
pub fn clausestrictlysubsumes(
  x4296 : @oset.T[(Bool, (String, @list.List[Term]))],
  x4297 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> Subst? raise {
  let cl_p = x4296
  let cl = x4297
  let t4298 = size_v16(cl)
  if size_v16(cl_p) > t4298 {
    None
  } else {
    clausesubsumes(cl_p, cl)
  }
}

///|
/// `notEqualTerm`
pub fn notequalterm(x4299 : Term, x4300 : Term) -> Bool raise {
  let (x, y) = (x4299, x4300)
  !equal_v14(x, y)
}

///|
/// `firstNotEqualTerm`
pub fn[TA] firstnotequalterm(
  x4301 : (Term) -> ((Term) -> TA raise) raise,
  x4302 : @list.List[(Term, Term)],
) -> TA raise {
  let f = x4301
  let l = x4302
  match
    find(
      fn(x4303 : (Term, Term)) -> Bool raise { notequalterm(x4303.0, x4303.1) },
      l,
    ) {
    Some((x, y)) => f(x)(y)
    None => raise Bug::Bug("firstNotEqualTerm")
  }
}

///|
/// `kbo`
pub(all) struct Kbo {
  weight : (FunctionT) -> Int64 raise
  precedence : (FunctionT) -> ((FunctionT) -> Int64 raise) raise
}

///|
/// uniformWeight
fn step_207() -> Unit raise {
  uniformweight_c.set(fn(x4304 : (String, Int64)) -> Int64 raise { 1L })
}

///|
let uniformweight_c : @lib.Cell[(FunctionT) -> Int64 raise] = @lib.Cell::new(
  "uniformWeight",
)

///|
/// `uniformWeight`
pub fn uniformweight(x : FunctionT) -> Int64 raise {
  uniformweight_c.get()(x)
}

///|
/// `arityPrecedence`
pub fn arityprecedence(
  x4305 : (String, Int64),
  x4306 : (String, Int64),
) -> Int64 raise {
  let (f1, n1) = x4305
  let (f2, n2) = x4306
  let c = intcompare(n1, n2)
  if c != 0L {
    c
  } else {
    compare_v10(f1)(f2)
  }
}

///|
/// default
fn step_208() -> Unit raise {
  default_v1_c.set(Kbo::{
    weight: uniformweight,
    precedence: fn(
      x4307 : (String, Int64),
    ) -> (((String, Int64)) -> Int64 raise) raise {
      fn(x4308 : (String, Int64)) -> Int64 raise {
        arityprecedence(x4307, x4308)
      }
    },
  })
}

///|
let default_v1_c : @lib.Cell[Kbo] = @lib.Cell::new("default")

///|
/// `default`
pub fn default_v1() -> Kbo {
  default_v1_c.get()
}

///|
/// `weight`
#derive(Eq, Debug)
pub(all) enum Weight {
  Weight(Map4[Int64], Int64)
}

///|
pub extend Weight with Eq::{not_equal, equal}

///|
pub extend Weight with Debug::{to_repr}

///|
pub extend Weight with @lib.OCompare::{ocompare}

///|
pub extend Weight with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_Weight(x : Weight) -> Int {
  match x {
    Weight(_, _) => 1000000
  }
}

///|
pub impl @lib.OCompare for Weight with fn ocompare(self, other) {
  match (self, other) {
    (Weight(a0, a1), Weight(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    _ => ocaml_rank_Weight(self).compare(ocaml_rank_Weight(other))
  }
}

///|
pub impl @lib.OHash for Weight with fn ohash_visit(self, h) {
  match self {
    Weight(a0, a1) => {
      h.block(0, 2)
      h.field(a0)
      h.field(a1)
    }
  }
}

///|
/// weightEmpty
fn step_209() -> Unit raise {
  weightempty_c.set(newmap_v3(()))
}

///|
let weightempty_c : @lib.Cell[Map4[Int64]] = @lib.Cell::new("weightEmpty")

///|
/// `weightEmpty`
pub fn weightempty() -> Map4[Int64] {
  weightempty_c.get()
}

///|
/// weightZero
fn step_210() -> Unit raise {
  weightzero_c.set(Weight::Weight(weightempty(), 0L))
}

///|
let weightzero_c : @lib.Cell[Weight] = @lib.Cell::new("weightZero")

///|
/// `weightZero`
pub fn weightzero() -> Weight {
  weightzero_c.get()
}

///|
/// `weightIsZero`
pub fn weightiszero(x4309 : Weight) -> Bool raise {
  match x4309 {
    Weight::Weight(m, c) => c == 0L && null_v7(m)
  }
}

///|
/// `weightNeg`
pub fn weightneg(x4310 : Weight) -> Weight raise {
  match x4310 {
    Weight::Weight(m, c) => {
      let t4312 = @lib.neg63(c)
      Weight::Weight(
        transform_v5(fn(x4311 : Int64) -> Int64 raise {
          let x = x4311
          @lib.neg63(x)
        })(m),
        t4312,
      )
    }
  }
}

///|
/// `add`
pub fn[TA, TB] add_v28(
  x4313 : (TA, Int64),
  x4314 : (TB, Int64),
) -> Int64? raise {
  let ((_, n1), (_, n2)) = (x4313, x4314)
  let n = @lib.add63(n1, n2)
  if n == 0L {
    None
  } else {
    Some(n)
  }
}

///|
/// `weightAdd`
pub fn weightadd(x4315 : Weight) -> ((Weight) -> Weight raise) raise {
  match x4315 {
    Weight::Weight(m1, c1) =>
      fn(x4316 : Weight) -> Weight raise {
        match x4316 {
          Weight::Weight(m2, c2) => {
            let t4318 = @lib.add63(c1, c2)
            Weight::Weight(
              union_v9(
                fn(x4317 : ((String, Int64), (String, Int64))) -> Int64? raise {
                  add_v28(x4317.0, x4317.1)
                },
                m1,
                m2,
              ),
              t4318,
            )
          }
        }
      }
  }
}

///|
/// `weightSubtract`
pub fn weightsubtract(x4319 : Weight, x4320 : Weight) -> Weight raise {
  let w1 = x4319
  let w2 = x4320
  let t4321 = weightneg(w2)
  weightadd(w1)(t4321)
}

///|
/// `weightTerm`
pub fn weightterm(
  x4322 : ((String, Int64)) -> Int64 raise,
) -> ((Term) -> Weight raise) raise {
  let weight = x4322
  fn wt(
    x4324 : @omap.T[String, Int64],
    x4325 : Int64,
    x4326 : @list.List[Term],
  ) -> Weight raise {
    let m = x4324
    let c = x4325
    match x4326 {
      Empty => Weight::Weight(m, c)
      More(Term::Var(v), tail=tms) => {
        let n = value(peek_v4(m, v), 0L)
        let t4327 = @lib.add63(c, 1L)
        wt(insert_v3(m, (v, @lib.add63(n, 1L))), t4327, tms)
      }
      More(Term::Fn((f, a)), tail=tms_1) =>
        wt(
          m,
          @lib.add63(c, weight((f, Int::to_int64(@lib.length(a))))),
          a.concat(tms_1),
        )
    }
  }
  fn(x4328 : Term) -> Weight raise {
    let tm = x4328
    wt(weightempty(), -1L, @list.List([tm]))
  }
}

///|
/// `weightLowerBound`
pub fn weightlowerbound(x4329 : Weight) -> Int64? raise {
  match x4329 {
    Weight::Weight(m, c) =>
      if exists_v9(fn(x4330 : (String, Int64)) -> Bool raise {
          let (_, n) = x4330
          n < 0L
        })(m) {
        None
      } else {
        Some(c)
      }
  }
}

///|
/// `compare`
pub fn compare_v44(
  x4331 : Kbo,
) -> ((Term) -> ((Term) -> Int64? raise) raise) raise {
  match x4331 {
    { weight, precedence } => {
      let weightdifference : (Term) -> ((Term) -> Weight raise) raise = fn(
        x4333 : Term,
      ) -> ((Term) -> Weight raise) raise {
        let tm1 = x4333
        fn(x4334 : Term) -> Weight raise {
          let tm2 = x4334
          let w1 = weightterm(weight)(tm1)
          let w2 = weightterm(weight)(tm2)
          weightsubtract(w2, w1)
        }
      }
      let weightless = (x4335 : Term, x4336 : Term) => {
        weightless_l(weightdifference, precedence, x4335, x4336)
      }
      let weightdiffless = (x4337 : Weight, x4338 : Term, x4339 : Term) => {
        weightdiffless_l(weightdifference, precedence, x4337, x4338, x4339)
      }
      let precedenceless = (x4340 : Term, x4341 : Term) => {
        precedenceless_l(weightdifference, precedence, x4340, x4341)
      }
      let weightdiffgreater : (Weight) -> ((Term) -> ((Term) -> Bool raise) raise) raise = fn(
        x4345 : Weight,
      ) -> ((Term) -> ((Term) -> Bool raise) raise) raise {
        let w_2 = x4345
        fn(x4346 : Term) -> ((Term) -> Bool raise) raise {
          let tm1_3 = x4346
          fn(x4347 : Term) -> Bool raise {
            let tm2_3 = x4347
            weightdiffless(weightneg(w_2), tm2_3, tm1_3)
          }
        }
      }
      let weightcmp = (x4348 : Term, x4349 : Term) => {
        weightcmp_l(
          weightdifference, weightdiffless, weightdiffgreater, precedence, x4348,
          x4349,
        )
      }
      let precedencecmp = (x4350 : Term, x4351 : Term) => {
        precedencecmp_l(
          weightdifference, weightdiffless, weightdiffgreater, precedence, x4350,
          x4351,
        )
      }
      fn(x4355 : Term) -> ((Term) -> Int64? raise) raise {
        let tm1_5 = x4355
        fn(x4356 : Term) -> Int64? raise {
          let tm2_5 = x4356
          if equal_v14(tm1_5, tm2_5) {
            Some(0L)
          } else {
            weightcmp(tm1_5, tm2_5)
          }
        }
      }
    }
  }
}

///|
fn weightless_l(
  weightdifference : (Term) -> ((Term) -> Weight raise) raise,
  precedence : ((String, Int64)) -> (((String, Int64)) -> Int64 raise) raise,
  x4335 : Term,
  x4336 : Term,
) -> Bool raise {
  let weightdiffless = (x4337 : Weight, x4338 : Term, x4339 : Term) => {
    weightdiffless_l(weightdifference, precedence, x4337, x4338, x4339)
  }
  let precedenceless = (x4340 : Term, x4341 : Term) => {
    precedenceless_l(weightdifference, precedence, x4340, x4341)
  }
  let tm1_1 = x4335
  let tm2_1 = x4336
  let w = weightdifference(tm1_1)(tm2_1)
  if weightiszero(w) {
    precedenceless(tm1_1, tm2_1)
  } else {
    weightdiffless(w, tm1_1, tm2_1)
  }
}

///|
fn weightdiffless_l(
  weightdifference : (Term) -> ((Term) -> Weight raise) raise,
  precedence : ((String, Int64)) -> (((String, Int64)) -> Int64 raise) raise,
  x4337 : Weight,
  x4338 : Term,
  x4339 : Term,
) -> Bool raise {
  let precedenceless = (x4340 : Term, x4341 : Term) => {
    precedenceless_l(weightdifference, precedence, x4340, x4341)
  }
  let w_1 = x4337
  let tm1_2 = x4338
  let tm2_2 = x4339
  match weightlowerbound(w_1) {
    None => false
    Some(0L) => precedenceless(tm1_2, tm2_2)
    Some(n) => n > 0L
  }
}

///|
fn precedenceless_l(
  weightdifference : (Term) -> ((Term) -> Weight raise) raise,
  precedence : ((String, Int64)) -> (((String, Int64)) -> Int64 raise) raise,
  x4340 : Term,
  x4341 : Term,
) -> Bool raise {
  let weightless = (x4335 : Term, x4336 : Term) => {
    weightless_l(weightdifference, precedence, x4335, x4336)
  }
  let x = x4340
  let y = x4341
  match (x, y) {
    (Term::Fn((f1, a1)), Term::Fn((f2, a2))) => {
      let t4342 = (f2, Int::to_int64(@lib.length(a2)))
      let c = precedence((f1, Int::to_int64(@lib.length(a1))))(t4342)
      if c < 0L {
        true
      } else if c == 0L {
        firstnotequalterm(
          fn(x4343 : Term) -> ((Term) -> Bool raise) raise {
            fn(x4344 : Term) -> Bool raise { weightless(x4343, x4344) }
          },
          @lib.zip(a1, a2),
        )
      } else {
        false
      }
    }
    _ => false
  }
}

///|
fn weightcmp_l(
  weightdifference : (Term) -> ((Term) -> Weight raise) raise,
  weightdiffless : (Weight, Term, Term) -> Bool raise,
  weightdiffgreater : (Weight) -> ((Term) -> ((Term) -> Bool raise) raise) raise,
  precedence : ((String, Int64)) -> (((String, Int64)) -> Int64 raise) raise,
  x4348 : Term,
  x4349 : Term,
) -> Int64? raise {
  let precedencecmp = (x4350 : Term, x4351 : Term) => {
    precedencecmp_l(
      weightdifference, weightdiffless, weightdiffgreater, precedence, x4350, x4351,
    )
  }
  let tm1_4 = x4348
  let tm2_4 = x4349
  let w_3 = weightdifference(tm1_4)(tm2_4)
  if weightiszero(w_3) {
    precedencecmp(tm1_4, tm2_4)
  } else if weightdiffless(w_3, tm1_4, tm2_4) {
    Some(-1L)
  } else if weightdiffgreater(w_3)(tm1_4)(tm2_4) {
    Some(1L)
  } else {
    None
  }
}

///|
fn precedencecmp_l(
  weightdifference : (Term) -> ((Term) -> Weight raise) raise,
  weightdiffless : (Weight, Term, Term) -> Bool raise,
  weightdiffgreater : (Weight) -> ((Term) -> ((Term) -> Bool raise) raise) raise,
  precedence : ((String, Int64)) -> (((String, Int64)) -> Int64 raise) raise,
  x4350 : Term,
  x4351 : Term,
) -> Int64? raise {
  let weightcmp = (x4348 : Term, x4349 : Term) => {
    weightcmp_l(
      weightdifference, weightdiffless, weightdiffgreater, precedence, x4348, x4349,
    )
  }
  let x_1 = x4350
  let y_1 = x4351
  match (x_1, y_1) {
    (Term::Fn((f1_1, a1_1)), Term::Fn((f2_1, a2_1))) => {
      let t4352 = (f2_1, Int::to_int64(@lib.length(a2_1)))
      let c_1 = precedence((f1_1, Int::to_int64(@lib.length(a1_1))))(t4352)
      if c_1 < 0L {
        Some(-1L)
      } else if c_1 == 0L {
        firstnotequalterm(
          fn(x4353 : Term) -> ((Term) -> Int64? raise) raise {
            fn(x4354 : Term) -> Int64? raise { weightcmp(x4353, x4354) }
          },
          @lib.zip(a1_1, a2_1),
        )
      } else {
        Some(1L)
      }
    }
    _ => raise Bug::Bug("kboOrder.precendenceCmp")
  }
}

///|
/// `orient`
#derive(Eq, Debug)
pub(all) enum Orient {
  Left_to_right
  Right_to_left
}

///|
pub extend Orient with Eq::{not_equal, equal}

///|
pub extend Orient with Debug::{to_repr}

///|
pub extend Orient with @lib.OCompare::{ocompare}

///|
pub extend Orient with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_Orient(x : Orient) -> Int {
  match x {
    Left_to_right => 0
    Right_to_left => 1
  }
}

///|
pub impl @lib.OCompare for Orient with fn ocompare(self, other) {
  match (self, other) {
    _ => ocaml_rank_Orient(self).compare(ocaml_rank_Orient(other))
  }
}

///|
pub impl @lib.OHash for Orient with fn ohash_visit(self, h) {
  match self {
    Left_to_right => h.int(0L)
    Right_to_left => h.int(1L)
  }
}

///|
/// `toStringOrient`
pub fn tostringorient(x4357 : Orient) -> String raise {
  let ort = x4357
  match ort {
    Orient::Left_to_right => "-->"
    Orient::Right_to_left => "<--"
  }
}

///|
/// `toStringOrientOption`
pub fn tostringorientoption(x4358 : Orient?) -> String raise {
  let orto = x4358
  match orto {
    Some(ort) => tostringorient(ort)
    None => "<->"
  }
}

///|
/// `reductionOrder`
pub type ReductionOrder = (Term) -> ((Term) -> Int64? raise) raise

///|
/// `equationId`
pub type EquationId = Int64

///|
/// `equation`
pub type Equation1 = Equation

///|
/// `rewrite_t`
pub(all) struct RewriteT {
  order : ReductionOrder
  known : Map2[(Equation1, Orient?)]
  redexes : TermNet[(EquationId, Orient)]
  subterms : TermNet[(EquationId, Bool, Path)]
  waiting : Set1
}

///|
/// `rewrite`
pub(all) enum Rewrite {
  Rewrite(RewriteT)
}

///|
/// `updateWaiting`
pub fn updatewaiting(x4359 : Rewrite, x4360 : @oset.T[Int64]) -> Rewrite raise {
  let rw = x4359
  let waiting = x4360
  match rw {
    Rewrite::Rewrite(
      { order, known, redexes: redexes_1, subterms: subterms_1, waiting: _ }
    ) =>
      Rewrite::Rewrite(RewriteT::{
        order,
        known,
        redexes: redexes_1,
        subterms: subterms_1,
        waiting,
      })
  }
}

///|
/// `deleteWaiting`
pub fn deletewaiting(x4361 : Rewrite) -> ((Elt) -> Rewrite raise) raise {
  match x4361 {
    Rewrite::Rewrite({ waiting, .. }) as rw =>
      fn(x4362 : Int64) -> Rewrite raise {
        let id = x4362
        updatewaiting(rw, delete_v4(waiting, id))
      }
  }
}

///|
/// `newRewrite`
pub fn newrewrite(
  x4363 : (Term) -> ((Term) -> Int64? raise) raise,
) -> Rewrite raise {
  let order = x4363
  let t4364 = newnet(Parameters1::{ fifo: false, })
  let t4365 = newnet(Parameters1::{ fifo: false, })
  Rewrite::Rewrite(RewriteT::{
    order,
    known: newmap_v1(()),
    redexes: t4365,
    subterms: t4364,
    waiting: empty_v4(),
  })
}

///|
/// `peek`
pub fn peek_v11(
  x4366 : Rewrite,
) -> ((Key) -> (Equation1, Orient?)? raise) raise {
  match x4366 {
    Rewrite::Rewrite({ known, .. }) =>
      fn(x4367 : Int64) -> (((Term, Term), Thm), Orient?)? raise {
        let id = x4367
        peek_v2(known, id)
      }
  }
}

///|
/// `size`
pub fn size_v23(x4368 : Rewrite) -> Int64 raise {
  match x4368 {
    Rewrite::Rewrite({ known, .. }) => size_v2(known)
  }
}

///|
/// `equations`
pub fn equations(x4369 : Rewrite) -> @list.List[Equation1] raise {
  match x4369 {
    Rewrite::Rewrite({ known, .. }) =>
      foldr_v3(fn(
        x4370 : (
          Int64,
          (((Term, Term), Thm), Orient?),
          @list.List[((Term, Term), Thm)],
        ),
      ) -> @list.List[((Term, Term), Thm)] raise {
        let (_, (eqn, _), eqns) = x4370
        eqns.prepend(eqn)
      })(@list.List([]))(known)
  }
}

///|
/// `termReducible`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] termreducible(
  x4371 : (Term) -> ((Term) -> Int64? raise) raise,
  x4372 : @omap.T[TA, (((Term, Term), Thm), Orient?)],
  x4373 : TA,
) -> ((Term) -> Bool raise) raise {
  let order = x4371
  let known = x4372
  let id = x4373
  let knownred : (Term) -> (((TA, (((Term, Term), Thm), Orient?))) -> Bool raise) raise = fn(
    x4380 : Term,
  ) -> (((TA, (((Term, Term), Thm), Orient?))) -> Bool raise) raise {
    let tm_1 = x4380
    fn(x4381 : (TA, (((Term, Term), Thm), Orient?))) -> Bool raise {
      let (eqnid, (eqn, ort)) = x4381
      eqnid != id &&
      (
        (
          ort != Some(Orient::Right_to_left) &&
          ((x4375, x4376) => eqnred_l(order, x4375, x4376))(eqn, tm_1)
        ) ||
        (
          ort != Some(Orient::Left_to_right) &&
          ((x4375, x4376) => eqnred_l(order, x4375, x4376))(symeqn(eqn), tm_1)
        )
      )
    }
  }
  let termred = (x4382 : Term) => termred_l(knownred, known, x4382)
  let subtermred = (x4383 : Term) => subtermred_l(knownred, known, x4383)
  termred
}

///|
fn[TB] eqnred_l(
  order : (Term) -> ((Term) -> Int64? raise) raise,
  x4375 : ((Term, Term), TB),
  x4376 : Term,
) -> Bool raise {
  let ((l, r), _) = x4375
  let tm = x4376
  match total((x4377 : Term) => matchterms(empty_v13(), l, x4377), tm) {
    None => false
    Some(sub) => {
      let t4379 = Some(1L)
      let t4378 = subst(normalize(sub))(r)
      order(tm)(t4378) == t4379
    }
  }
}

///|
fn[TA] termred_l(
  knownred : (Term) -> (((TA, (((Term, Term), Thm), Orient?))) -> Bool raise) raise,
  known : @omap.T[TA, (((Term, Term), Thm), Orient?)],
  x4382 : Term,
) -> Bool raise {
  let subtermred = (x4383 : Term) => subtermred_l(knownred, known, x4383)
  let tm_2 = x4382
  exists_v3(knownred(tm_2))(known) || subtermred(tm_2)
}

///|
fn[TA] subtermred_l(
  knownred : (Term) -> (((TA, (((Term, Term), Thm), Orient?))) -> Bool raise) raise,
  known : @omap.T[TA, (((Term, Term), Thm), Orient?)],
  x4383 : Term,
) -> Bool raise {
  let termred = (x4382 : Term) => termred_l(knownred, known, x4382)
  match x4383 {
    Term::Var(_) => false
    Term::Fn((_, tms)) => @lib.exists(termred, tms)
  }
}

///|
/// `literalReducible`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] literalreducible(
  x4384 : (Term) -> ((Term) -> Int64? raise) raise,
  x4385 : @omap.T[TA, (((Term, Term), Thm), Orient?)],
  x4386 : TA,
  x4387 : (Bool, (String, @list.List[Term])),
) -> Bool raise {
  let order = x4384
  let known = x4385
  let id = x4386
  let lit = x4387
  let t4388 = arguments_v1(lit)
  @lib.exists(termreducible(order, known, id), t4388)
}

///|
/// `literalsReducible`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] literalsreducible(
  x4389 : (Term) -> ((Term) -> Int64? raise) raise,
  x4390 : @omap.T[TA, (((Term, Term), Thm), Orient?)],
  x4391 : TA,
  x4392 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> Bool raise {
  let order = x4389
  let known = x4390
  let id = x4391
  let lits = x4392
  exists_v29((x4393 : (Bool, (String, @list.List[Term]))) => {
    literalreducible(order, known, id, x4393)
  })(lits)
}

///|
/// `thmReducible`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] thmreducible(
  x4394 : (Term) -> ((Term) -> Int64? raise) raise,
  x4395 : @omap.T[TA, (((Term, Term), Thm), Orient?)],
  x4396 : TA,
  x4397 : Thm,
) -> Bool raise {
  let order = x4394
  let known = x4395
  let id = x4396
  let th = x4397
  literalsreducible(order, known, id, clause(th))
}

///|
/// `orderToOrient`
pub fn ordertoorient(x4398 : Int64?) -> Orient? raise {
  match x4398 {
    Some(0L) => raise Failure("Rewrite.orient: reflexive")
    Some(c) if c > 0L => Some(Orient::Left_to_right)
    Some(_) => Some(Orient::Right_to_left)
    None => None
  }
}

///|
/// `ins`
pub fn[TA, TB] ins_v1(
  x4399 : TermNet[(TA, TB)],
  x4400 : Term,
  x4401 : TA,
  x4402 : TB,
) -> TermNet[(TA, TB)] raise {
  let redexes_1 = x4399
  let redex = x4400
  let id = x4401
  let ort = x4402
  insert_v10(redexes_1)((redex, (id, ort)))
}

///|
/// `addRedexes`
pub fn[TA, TB] addredexes(
  x4403 : TA,
  x4404 : (((Term, Term), TB), Orient?),
  x4405 : TermNet[(TA, Orient)],
) -> TermNet[(TA, Orient)] raise {
  let id = x4403
  let (((l, r), _), ort) = x4404
  let redexes_1 = x4405
  match ort {
    Some(Orient::Left_to_right) =>
      ins_v1(redexes_1, l, id, Orient::Left_to_right)
    Some(Orient::Right_to_left) =>
      ins_v1(redexes_1, r, id, Orient::Right_to_left)
    None =>
      ins_v1(
        ins_v1(redexes_1, l, id, Orient::Left_to_right),
        r,
        id,
        Orient::Right_to_left,
      )
  }
}

///|
/// `add`
pub fn add_v29(x4406 : Rewrite) -> (((Key, Equation1)) -> Rewrite raise) raise {
  match x4406 {
    Rewrite::Rewrite({ known, .. }) as rw =>
      fn(x4407 : (Int64, ((Term, Term), Thm))) -> Rewrite raise {
        let (id, eqn) = x4407
        if indomain_v1(id)(known) {
          rw
        } else {
          match rw {
            Rewrite::Rewrite(
              { order, redexes: redexes_1, subterms: subterms_1, waiting, .. }
            ) => {
              let (l, r) = eqn.0
              let ort = ordertoorient(order(l)(r))
              let known_1 = insert_v1(known, (id, (eqn, ort)))
              let redexes_2 = addredexes(id, (eqn, ort), redexes_1)
              let waiting_1 = add_v4(waiting, id)
              let rw_1 = Rewrite::Rewrite(RewriteT::{
                order,
                known: known_1,
                redexes: redexes_2,
                subterms: subterms_1,
                waiting: waiting_1,
              })
              rw_1
            }
          }
        }
      }
  }
}

///|
/// `uncurriedAdd`
pub fn uncurriedadd_v1(
  x4408 : (Int64, ((Term, Term), Thm)),
  x4409 : Rewrite,
) -> Rewrite raise {
  let (eqn, rw) = (x4408, x4409)
  add_v29(rw)(eqn)
}

///|
/// `addList`
pub fn addlist_v1(
  x4410 : Rewrite,
) -> ((@list.List[(Key, Equation1)]) -> Rewrite raise) raise {
  let rw = x4410
  (x4413 : @list.List[(Int64, ((Term, Term), Thm))]) => {
    foldl(
      fn(x4412 : ((Int64, ((Term, Term), Thm)), Rewrite)) -> Rewrite raise {
        uncurriedadd_v1(x4412.0, x4412.1)
      },
      rw,
      x4413,
    )
  }
}

///|
/// `reorder`
pub fn[TA, TB] reorder(x4414 : (Int64, TA), x4415 : (Int64, TB)) -> Int64 raise {
  let (i, _) = x4414
  let (j, _) = x4415
  intcompare(j, i)
}

///|
/// `matchingRedexes`
pub fn[TA] matchingredexes(
  x4416 : TermNet[(Int64, TA)],
  x4417 : Term,
) -> @list.List[(Int64, TA)] raise {
  let redexes_1 = x4416
  let tm = x4417
  @lib.list_sort(
    fn(x4418 : (Int64, TA), x4419 : (Int64, TA)) -> Int raise {
      @lib.int63_to_int(reorder(x4418, x4419))
    },
    matchnet(redexes_1, tm),
  )
}

///|
/// `wellOriented`
pub fn welloriented(x4420 : Orient?, x4421 : Orient) -> Bool raise {
  let x = x4420
  let y = x4421
  match (x, y) {
    (None, _) => true
    (Some(Orient::Left_to_right), Orient::Left_to_right) => true
    (Some(Orient::Right_to_left), Orient::Right_to_left) => true
    _ => false
  }
}

///|
/// `redexResidue`
pub fn redexresidue(
  x4422 : Orient,
  x4423 : ((Term, Term), Thm),
) -> (Term, Term) raise {
  let x = x4422
  let y = x4423
  match (x, y) {
    (Orient::Left_to_right, (l_r, _)) => l_r
    (Orient::Right_to_left, ((l, r), _)) => (r, l)
  }
}

///|
/// `orientedEquation`
pub fn orientedequation(
  x4424 : Orient,
  x4425 : ((Term, Term), Thm),
) -> ((Term, Term), Thm) raise {
  let dir = x4424
  let eqn = x4425
  match dir {
    Orient::Left_to_right => eqn
    Orient::Right_to_left => symeqn(eqn)
  }
}

///|
/// `rewrIdConv'`
pub fn rewridconv_p(
  x4426 : (Term) -> ((Term) -> Int64? raise) raise,
  x4427 : @omap.T[Int64, (((Term, Term), Thm), Orient?)],
  x4428 : TermNet[(Int64, Orient)],
  x4429 : Int64,
  x4430 : Term,
) -> (Term, Thm) raise {
  let order = x4426
  let known = x4427
  let redexes_1 = x4428
  let id = x4429
  let tm = x4430
  let rewr : ((Int64, Orient)) -> (Term, Thm) raise = fn(
    x4431 : (Int64, Orient),
  ) -> (Term, Thm) raise {
    let (id_p, lr) = x4431
    let _ = id != id_p || @lib.raise_error(Failure("same theorem"))
    let (eqn, ort) = get_v1(known, id_p)
    let _ = welloriented(ort, lr) || @lib.raise_error(Failure("orientation"))
    let (l, r) = redexresidue(lr, eqn)
    let sub = normalize(matchterms(empty_v13(), l, tm))
    let tm_p = subst(sub)(r)
    let _ = if is_some(ort) {
      true
    } else {
      let t4432 = Some(1L)
      order(tm)(tm_p) == t4432 || @lib.raise_error(Failure("order"))
    }
    let (_, th) = orientedequation(lr, eqn)
    (tm_p, subst_v5(sub, th))
  }
  match
    first(
      (x4433 : (Int64, Orient)) => total(rewr, x4433),
      matchingredexes(redexes_1, tm),
    ) {
    None => raise Failure("Rewrite.rewrIdConv: no matching rewrites")
    Some(res) => res
  }
}

///|
/// `rewriteIdConv'`
pub fn rewriteidconv_p(
  x4434 : (Term) -> ((Term) -> Int64? raise) raise,
  x4435 : @omap.T[Int64, (((Term, Term), Thm), Orient?)],
  x4436 : TermNet[(Int64, Orient)],
  x4437 : Int64,
) -> ((Term) -> (Term, Thm) raise) raise {
  let order = x4434
  let known = x4435
  let redexes_1 = x4436
  let id = x4437
  if null_v3(known) {
    allconv
  } else {
    repeattopdownconv((x4439 : Term) => {
      rewridconv_p(order, known, redexes_1, id, x4439)
    })
  }
}

///|
/// `mkNeqConv`
pub fn mkneqconv(
  x4440 : (Term) -> ((Term) -> Int64? raise) raise,
  x4441 : (Bool, (String, @list.List[Term])),
) -> ((Term) -> (Term, Thm) raise) raise {
  let order = x4440
  let lit = x4441
  let (l, r) = destneq_v1(lit)
  match order(l)(r) {
    None => raise Failure("incomparable")
    Some(c) if c < 0L => {
      let th = symmetryrule(l, r)
      fn(x4443 : Term) -> (Term, Thm) raise {
        let tm = x4443
        if equal_v14(tm, r) {
          (l, th)
        } else {
          raise Failure("mkNeqConv: RL")
        }
      }
    }
    Some(0L) => raise Failure("irreflexive")
    Some(_) => {
      let th_1 = assume_(lit)
      fn(x4444 : Term) -> (Term, Thm) raise {
        let tm_1 = x4444
        if equal_v14(tm_1, l) {
          (r, th_1)
        } else {
          raise Failure("mkNeqConv: LR")
        }
      }
    }
  }
}

///|
/// `neqConvs`
pub(all) enum NeqConvs {
  Neq_convs(Map8[Conv])
}

///|
/// neqConvsEmpty
fn step_211() -> Unit raise {
  neqconvsempty_c.set(NeqConvs::Neq_convs(newmap_v7(())))
}

///|
let neqconvsempty_c : @lib.Cell[NeqConvs] = @lib.Cell::new("neqConvsEmpty")

///|
/// `neqConvsEmpty`
pub fn neqconvsempty() -> NeqConvs {
  neqconvsempty_c.get()
}

///|
/// `neqConvsNull`
pub fn neqconvsnull(x4445 : NeqConvs) -> Bool raise {
  match x4445 {
    NeqConvs::Neq_convs(m) => null_v16(m)
  }
}

///|
/// `neqConvsAdd`
pub fn neqconvsadd(
  x4446 : (Term) -> ((Term) -> Int64? raise) raise,
  x4447 : NeqConvs,
) -> ((Literal) -> NeqConvs? raise) raise {
  let order = x4446
  match x4447 {
    NeqConvs::Neq_convs(m) =>
      fn(x4448 : (Bool, (String, @list.List[Term]))) -> NeqConvs? raise {
        let lit = x4448
        match
          total(
            (x4449 : (Bool, (String, @list.List[Term]))) => {
              mkneqconv(order, x4449)
            },
            lit,
          ) {
          None => None
          Some(conv) => Some(NeqConvs::Neq_convs(insert_v8(m, (lit, conv))))
        }
      }
  }
}

///|
/// `mkNeqConvs`
pub fn mkneqconvs(
  x4450 : (Term) -> ((Term) -> Int64? raise) raise,
) -> ((@oset.T[Literal]) -> (NeqConvs, @oset.T[Literal]) raise) raise {
  let order = x4450
  let add_1 : (
    (
      (Bool, (String, @list.List[Term])),
      (NeqConvs, @oset.T[(Bool, (String, @list.List[Term]))]),
    ),
  ) -> (NeqConvs, @oset.T[(Bool, (String, @list.List[Term]))]) raise = fn(
    x4452 : (
      (Bool, (String, @list.List[Term])),
      (NeqConvs, @oset.T[(Bool, (String, @list.List[Term]))]),
    ),
  ) -> (NeqConvs, @oset.T[(Bool, (String, @list.List[Term]))]) raise {
    let (lit, (neq, lits)) = x4452
    match neqconvsadd(order, neq)(lit) {
      Some(neq_1) => (neq_1, lits)
      None => (neq, add_v23(lits, lit))
    }
  }
  foldl_v16(add_1)((neqconvsempty(), empty_v22()))
}

///|
/// `neqConvsDelete`
pub fn neqconvsdelete(
  x4453 : NeqConvs,
) -> (((Bool, (Name, @list.List[Term]))) -> NeqConvs raise) raise {
  match x4453 {
    NeqConvs::Neq_convs(m) =>
      fn(x4454 : (Bool, (String, @list.List[Term]))) -> NeqConvs raise {
        let lit = x4454
        NeqConvs::Neq_convs(delete_v13(m, lit))
      }
  }
}

///|
/// `neqConvsToConv`
pub fn neqconvstoconv(x4455 : NeqConvs) -> ((Term) -> (Term, Thm) raise) raise {
  match x4455 {
    NeqConvs::Neq_convs(m) => {
      let t4458 = foldr_v15(fn(
        x4457 : (
          (Bool, (String, @list.List[Term])),
          (Term) -> (Term, Thm) raise,
          @list.List[(Term) -> (Term, Thm) raise],
        ),
      ) -> @list.List[(Term) -> (Term, Thm) raise] raise {
        let (_, c, l) = x4457
        l.prepend(c)
      })(@list.List([]))(m)
      (x4459 : Term) => firstconv_v1(t4458, x4459)
    }
  }
}

///|
/// `neqConvsFoldl`
pub fn[TA] neqconvsfoldl(
  x4460 : (((Bool, (String, @list.List[Term])), TA)) -> TA raise,
  x4461 : TA,
  x4462 : NeqConvs,
) -> TA raise {
  let f = x4460
  let b = x4461
  match x4462 {
    NeqConvs::Neq_convs(m) =>
      foldl_v15(
        fn(
          x4463 : (
            (Bool, (String, @list.List[Term])),
            (Term) -> (Term, Thm) raise,
            TA,
          ),
        ) -> TA raise {
          let (l, _, z) = x4463
          f((l, z))
        },
        b,
        m,
      )
  }
}

///|
/// `neqConvsRewrIdLiterule`
pub fn neqconvsrewridliterule(
  x4464 : (Term) -> ((Term) -> Int64? raise) raise,
  x4465 : @omap.T[Int64, (((Term, Term), Thm), Orient?)],
  x4466 : TermNet[(Int64, Orient)],
  x4467 : Int64,
  x4468 : NeqConvs,
) -> ((Literal) -> (Literal, Thm) raise) raise {
  let order = x4464
  let known = x4465
  let redexes_1 = x4466
  let id = x4467
  let neq = x4468
  if null_v3(known) && neqconvsnull(neq) {
    allliterule
  } else {
    let neq_conv : (Term) -> (Term, Thm) raise = neqconvstoconv(neq)
    let rewr_conv : (Term) -> (Term, Thm) raise = (x4470 : Term) => {
      rewridconv_p(order, known, redexes_1, id, x4470)
    }
    let conv : (Term) -> (Term, Thm) raise = (x4471 : Term) => {
      orelseconv(neq_conv, rewr_conv, x4471)
    }
    let conv_1 : (Term) -> (Term, Thm) raise = repeattopdownconv(conv)
    (x4472 : (Bool, (String, @list.List[Term]))) => {
      allargumentsliterule(conv_1, x4472)
    }
  }
}

///|
/// `rewriteIdEqn'`
pub fn rewriteideqn_p(
  x4473 : (Term) -> ((Term) -> Int64? raise) raise,
  x4474 : @omap.T[Int64, (((Term, Term), Thm), Orient?)],
  x4475 : TermNet[(Int64, Orient)],
  x4476 : Int64,
  x4477 : ((Term, Term), Thm),
) -> ((Term, Term), Thm) raise {
  let order = x4473
  let known = x4474
  let redexes_1 = x4475
  let id = x4476
  let (l_r, th) as eqn = x4477
  let t4478 = clause(th)
  let (neq, _) = mkneqconvs(order)(t4478)
  let literule : ((Bool, (String, @list.List[Term]))) -> (
    (Bool, (String, @list.List[Term])),
    Thm,
  ) raise = neqconvsrewridliterule(order, known, redexes_1, id, neq)
  let (strongeqn, lit_1) = match equationliteral(eqn.0, eqn.1) {
    None => (true, mkeq_v2(l_r))
    Some(lit) => (false, lit)
  }
  let (lit_p, litth) = literule(lit_1)
  if equal_v25(lit_1, lit_p) {
    eqn
  } else {
    let t4479 = if strongeqn {
      th
    } else if !negatemember_v1(lit_1, litth) {
      litth
    } else {
      resolve(lit_1, th)(litth)
    }
    (desteq_v2(lit_p), t4479)
  }
}

///|
/// `rewriteIdLiteralsRule'`
pub fn rewriteidliteralsrule_p(
  x4480 : (Term) -> ((Term) -> Int64? raise) raise,
  x4481 : @omap.T[Int64, (((Term, Term), Thm), Orient?)],
  x4482 : TermNet[(Int64, Orient)],
  x4483 : Int64,
  x4484 : @oset.T[(Bool, (String, @list.List[Term]))],
  x4485 : Thm,
) -> Thm raise {
  let order = x4480
  let known = x4481
  let redexes_1 = x4482
  let id = x4483
  let lits = x4484
  let th = x4485
  let mk_literule : (NeqConvs) -> (((Bool, (String, @list.List[Term]))) -> (
    (Bool, (String, @list.List[Term])),
    Thm,
  ) raise) raise = (x4486 : NeqConvs) => {
    neqconvsrewridliterule(order, known, redexes_1, id, x4486)
  }
  let rewr_neq_lit : (
    (
      (Bool, (String, @list.List[Term])),
      (Bool, NeqConvs, @oset.T[(Bool, (String, @list.List[Term]))], Thm),
    ),
  ) -> (Bool, NeqConvs, @oset.T[(Bool, (String, @list.List[Term]))], Thm) raise = fn(
    x4487 : (
      (Bool, (String, @list.List[Term])),
      (Bool, NeqConvs, @oset.T[(Bool, (String, @list.List[Term]))], Thm),
    ),
  ) -> (Bool, NeqConvs, @oset.T[(Bool, (String, @list.List[Term]))], Thm) raise {
    let (lit, (changed, neq, lits_1, th_1) as acc) = x4487
    let neq_1 = neqconvsdelete(neq)(lit)
    let (lit_p, litth) = mk_literule(neq_1)(lit)
    if equal_v25(lit, lit_p) {
      acc
    } else {
      let th_2 = if member_v8(lit, th_1) {
        resolve(lit, th_1)(litth)
      } else {
        th_1
      }
      match neqconvsadd(order, neq_1)(lit_p) {
        Some(neq_2) => (true, neq_2, lits_1, th_2)
        None => (changed, neq_1, add_v23(lits_1, lit_p), th_2)
      }
    }
  }
  fn rewr_neq_lits(
    x4488 : NeqConvs,
    x4489 : @oset.T[(Bool, (String, @list.List[Term]))],
    x4490 : Thm,
  ) -> (NeqConvs, @oset.T[Literal], Thm) raise {
    let neq_3 = x4488
    let lits_2 = x4489
    let th_3 = x4490
    let (changed_1, neq_4, lits_3, th_4) = neqconvsfoldl(
      rewr_neq_lit,
      (false, neq_3, lits_2, th_3),
      neq_3,
    )
    if changed_1 {
      rewr_neq_lits(neq_4, lits_3, th_4)
    } else {
      (neq_4, lits_3, th_4)
    }
  }
  let (neq_5, lits_4) = mkneqconvs(order)(lits)
  let (neq_6, lits_5, th_5) = rewr_neq_lits(neq_5, lits_4, th)
  let rewr_literule : ((Bool, (String, @list.List[Term]))) -> (
    (Bool, (String, @list.List[Term])),
    Thm,
  ) raise = mk_literule(neq_6)
  let rewr_lit : (((Bool, (String, @list.List[Term])), Thm)) -> Thm raise = fn(
    x4491 : ((Bool, (String, @list.List[Term])), Thm),
  ) -> Thm raise {
    let (lit_1, th_6) = x4491
    if member_v8(lit_1, th_6) {
      literalrule(rewr_literule, lit_1, th_6)
    } else {
      th_6
    }
  }
  foldl_v16(rewr_lit)(th_5)(lits_5)
}

///|
/// `rewriteIdRule'`
pub fn rewriteidrule_p(
  x4492 : (Term) -> ((Term) -> Int64? raise) raise,
  x4493 : @omap.T[Int64, (((Term, Term), Thm), Orient?)],
  x4494 : TermNet[(Int64, Orient)],
  x4495 : Int64,
  x4496 : Thm,
) -> Thm raise {
  let order = x4492
  let known = x4493
  let redexes_1 = x4494
  let id = x4495
  let th = x4496
  rewriteidliteralsrule_p(order, known, redexes_1, id, clause(th), th)
}

///|
/// `rewrIdConv`
pub fn rewridconv(
  x4497 : Rewrite,
) -> (((Term) -> ((Term) -> Int64? raise) raise) -> ((Key) -> ((Term) -> (
  Term,
  Thm,
) raise) raise) raise) raise {
  match x4497 {
    Rewrite::Rewrite({ known, redexes: redexes_1, .. }) =>
      fn(
        x4498 : (Term) -> ((Term) -> Int64? raise) raise,
      ) -> ((Int64) -> ((Term) -> (Term, Thm) raise) raise) raise {
        let order = x4498
        fn(x4502 : Int64) -> ((Term) -> (Term, Thm) raise) raise {
          fn(x4503 : Term) -> (Term, Thm) raise {
            ((x4500 : Int64, x4501 : Term) => {
              rewridconv_p(order, known, redexes_1, x4500, x4501)
            })(x4502, x4503)
          }
        }
      }
  }
}

///|
/// `rewrConv`
pub fn rewrconv_v1(
  x4504 : Rewrite,
  x4505 : (Term) -> ((Term) -> Int64? raise) raise,
) -> ((Term) -> (Term, Thm) raise) raise {
  let rewrite = x4504
  let order = x4505
  rewridconv(rewrite)(order)(-1L)
}

///|
/// `rewriteIdConv`
pub fn rewriteidconv(
  x4507 : Rewrite,
) -> (((Term) -> ((Term) -> Int64? raise) raise) -> ((Key) -> ((Term) -> (
  Term,
  Thm,
) raise) raise) raise) raise {
  match x4507 {
    Rewrite::Rewrite({ known, redexes: redexes_1, .. }) =>
      fn(
        x4508 : (Term) -> ((Term) -> Int64? raise) raise,
      ) -> ((Int64) -> ((Term) -> (Term, Thm) raise) raise) raise {
        let order = x4508
        (x4510 : Int64) => rewriteidconv_p(order, known, redexes_1, x4510)
      }
  }
}

///|
/// `rewriteConv`
pub fn rewriteconv(
  x4511 : Rewrite,
  x4512 : (Term) -> ((Term) -> Int64? raise) raise,
) -> ((Term) -> (Term, Thm) raise) raise {
  let rewrite = x4511
  let order = x4512
  rewriteidconv(rewrite)(order)(-1L)
}

///|
/// `rewriteIdLiteralsRule`
pub fn rewriteidliteralsrule(
  x4514 : Rewrite,
) -> (((Term) -> ((Term) -> Int64? raise) raise) -> ((Key) -> ((
  @oset.T[Literal],
) -> ((Thm) -> Thm raise) raise) raise) raise) raise {
  match x4514 {
    Rewrite::Rewrite({ known, redexes: redexes_1, .. }) =>
      fn(
        x4515 : (Term) -> ((Term) -> Int64? raise) raise,
      ) -> ((Int64) -> ((@oset.T[(Bool, (String, @list.List[Term]))]) -> ((Thm) -> Thm raise) raise) raise) raise {
        let order = x4515
        fn(
          x4520 : Int64,
        ) -> ((@oset.T[(Bool, (String, @list.List[Term]))]) -> ((Thm) -> Thm raise) raise) raise {
          fn(
            x4521 : @oset.T[(Bool, (String, @list.List[Term]))],
          ) -> ((Thm) -> Thm raise) raise {
            fn(x4522 : Thm) -> Thm raise {
              ((
                x4517 : Int64,
                x4518 : @oset.T[(Bool, (String, @list.List[Term]))],
                x4519 : Thm,
              ) => {
                rewriteidliteralsrule_p(
                  order, known, redexes_1, x4517, x4518, x4519,
                )
              })(x4520, x4521, x4522)
            }
          }
        }
      }
  }
}

///|
/// `rewriteLiteralsRule`
pub fn rewriteliteralsrule(
  x4523 : Rewrite,
  x4524 : (Term) -> ((Term) -> Int64? raise) raise,
) -> ((@oset.T[Literal]) -> ((Thm) -> Thm raise) raise) raise {
  let rewrite = x4523
  let order = x4524
  rewriteidliteralsrule(rewrite)(order)(-1L)
}

///|
/// `rewriteIdRule`
pub fn rewriteidrule(
  x4526 : Rewrite,
) -> (((Term) -> ((Term) -> Int64? raise) raise) -> ((Key) -> ((Thm) -> Thm raise) raise) raise) raise {
  match x4526 {
    Rewrite::Rewrite({ known, redexes: redexes_1, .. }) =>
      fn(
        x4527 : (Term) -> ((Term) -> Int64? raise) raise,
      ) -> ((Int64) -> ((Thm) -> Thm raise) raise) raise {
        let order = x4527
        fn(x4531 : Int64) -> ((Thm) -> Thm raise) raise {
          fn(x4532 : Thm) -> Thm raise {
            ((x4529 : Int64, x4530 : Thm) => {
              rewriteidrule_p(order, known, redexes_1, x4529, x4530)
            })(x4531, x4532)
          }
        }
      }
  }
}

///|
/// `rewriteRule`
pub fn rewriterule(
  x4533 : Rewrite,
  x4534 : (Term) -> ((Term) -> Int64? raise) raise,
) -> ((Thm) -> Thm raise) raise {
  let rewrite = x4533
  let order = x4534
  rewriteidrule(rewrite)(order)(-1L)
}

///|
/// `addSubterms`
pub fn[TA] addsubterms(
  x4536 : TA,
  x4537 : ((Term, Term), Thm),
  x4538 : TermNet[(TA, Bool, @list.List[Int64])],
) -> TermNet[(TA, Bool, @list.List[Int64])] raise {
  let id = x4536
  let ((l, r), _) = x4537
  let subterms_1 = x4538
  let subterms_2 = foldl(
    (
      x4541 : (
        (@list.List[Int64], Term),
        TermNet[(TA, Bool, @list.List[Int64])],
      ),
    ) => ((x4539, x4540) => addsubterm_l(id, x4539, x4540))(true, x4541),
    subterms_1,
    subterms(l),
  )
  let subterms_3 = foldl(
    (
      x4542 : (
        (@list.List[Int64], Term),
        TermNet[(TA, Bool, @list.List[Int64])],
      ),
    ) => ((x4539, x4540) => addsubterm_l(id, x4539, x4540))(false, x4542),
    subterms_2,
    subterms(r),
  )
  subterms_3
}

///|
fn[TA, TB, TC] addsubterm_l(
  id : TA,
  x4539 : TB,
  x4540 : ((TC, Term), TermNet[(TA, TB, TC)]),
) -> TermNet[(TA, TB, TC)] raise {
  let b = x4539
  let ((path, tm), net) = x4540
  insert_v10(net)((tm, (id, b, path)))
}

///|
/// `sameRedexes`
pub fn sameredexes(
  x4543 : Orient?,
  x4544 : (Term, Term),
  x4545 : (Term, Term),
) -> Bool raise {
  let x = x4543
  let y = x4544
  let z = x4545
  match (x, y, z) {
    (None, _, _) => false
    (Some(Orient::Left_to_right), (l0, _), (l, _)) => equal_v14(l0, l)
    (Some(Orient::Right_to_left), (_, r0), (_, r)) => equal_v14(r0, r)
  }
}

///|
/// `redexResidues`
pub fn[TA] redexresidues(
  x4546 : Orient?,
  x4547 : (TA, TA),
) -> @list.List[(TA, TA, Bool)] raise {
  let x = x4546
  let (l, r) = x4547
  match x {
    None => @list.List([(l, r, false), (r, l, false)])
    Some(Orient::Left_to_right) => @list.List([(l, r, true)])
    Some(Orient::Right_to_left) => @list.List([(r, l, true)])
  }
}

///|
/// `findReducibles`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB, TC] findreducibles(
  x4548 : (Term) -> ((Term) -> Int64? raise) raise,
  x4549 : @omap.T[TA, (((Term, Term), TB), TC)],
  x4550 : TermNet[(TA, Bool, @list.List[Int64])],
  x4551 : TA,
) -> ((@oset.T[TA]) -> ((@list.List[(Term, Term, Bool)]) -> @oset.T[TA] raise) raise) raise {
  let order = x4548
  let known = x4549
  let subterms_1 = x4550
  let id = x4551
  let checkvalidrewr : ((Term, Term, Bool)) -> ((TA) -> ((Bool) -> ((
    @list.List[Int64],
  ) -> Unit raise) raise) raise) raise = fn(
    x4553 : (Term, Term, Bool),
  ) -> ((TA) -> ((Bool) -> ((@list.List[Int64]) -> Unit raise) raise) raise) raise {
    let (l, r, ord) = x4553
    fn(
      x4554 : TA,
    ) -> ((Bool) -> ((@list.List[Int64]) -> Unit raise) raise) raise {
      let id_p = x4554
      fn(x4555 : Bool) -> ((@list.List[Int64]) -> Unit raise) raise {
        let left = x4555
        fn(x4556 : @list.List[Int64]) -> Unit raise {
          let path = x4556
          let (((x, y), _), _) = get_v1(known, id_p)
          let tm = subterm(if left { x } else { y }, path)
          let sub = matchterms(empty_v13(), l, tm)
          if ord {
            ()
          } else {
            let tm_p = subst(normalize(sub))(r)
            let t4557 = Some(1L)
            if order(tm)(tm_p) == t4557 {
              ()
            } else {
              raise Failure("order")
            }
          }
        }
      }
    }
  }
  let addred : ((Term, Term, Bool)) -> ((
    ((TA, Bool, @list.List[Int64]), @oset.T[TA]),
  ) -> @oset.T[TA] raise) raise = fn(
    x4558 : (Term, Term, Bool),
  ) -> ((((TA, Bool, @list.List[Int64]), @oset.T[TA])) -> @oset.T[TA] raise) raise {
    let lr = x4558
    fn(
      x4559 : ((TA, Bool, @list.List[Int64]), @oset.T[TA]),
    ) -> @oset.T[TA] raise {
      let ((id_p_1, left_1, path_1), todo) = x4559
      if id != id_p_1 &&
        !member_v1(id_p_1)(todo) &&
        @lib.can(checkvalidrewr(lr)(id_p_1)(left_1), path_1) {
        add_v4(todo, id_p_1)
      } else {
        todo
      }
    }
  }
  let findred : (((Term, Term, Bool), @oset.T[TA])) -> @oset.T[TA] raise = fn(
    x4560 : ((Term, Term, Bool), @oset.T[TA]),
  ) -> @oset.T[TA] raise {
    let ((l_1, _, _) as lr_1, todo_1) = x4560
    let t4561 = matched(subterms_1, l_1)
    foldl(addred(lr_1), todo_1, t4561)
  }
  fn(
    x4564 : @oset.T[TA],
  ) -> ((@list.List[(Term, Term, Bool)]) -> @oset.T[TA] raise) raise {
    fn(x4565 : @list.List[(Term, Term, Bool)]) -> @oset.T[TA] raise {
      ((x4562 : @oset.T[TA], x4563 : @list.List[(Term, Term, Bool)]) => {
        foldl(findred, x4562, x4563)
      })(x4564, x4565)
    }
  }
}

///|
/// `reduce1`
pub fn reduce1(
  x4566 : Bool,
  x4567 : Int64,
  x4568 : (((Term, Term), Thm), Orient?),
  x4569 : (
    @oset.T[Int64],
    @oset.T[Int64],
    @oset.T[Int64],
    Rewrite,
    @oset.T[Int64],
  ),
) -> (@oset.T[Key], @oset.T[Key], @oset.T[Key], Rewrite, @oset.T[Key]) raise {
  let newx = x4566
  let id = x4567
  let (eqn0, ort0) = x4568
  let (rpl, spl, todo, rw, changed) = x4569
  let (eq0, _) = eqn0
  match rw {
    Rewrite::Rewrite(
      { order, known, redexes: redexes_1, subterms: subterms_1, waiting }
    ) => {
      let (eq, _) as eqn = rewriteideqn_p(order, known, redexes_1, id, eqn0)
      let (l0, r0) = eq0
      let (l, r) = eq
      let identical = equal_v14(l, l0) && equal_v14(r, r0)
      let same_redexes = identical || sameredexes(ort0, eq0, eq)
      let rpl_1 = if same_redexes { rpl } else { add_v4(rpl, id) }
      let spl_1 = if newx || identical { spl } else { add_v4(spl, id) }
      let changed_1 = if !newx && identical {
        changed
      } else {
        add_v4(changed, id)
      }
      let ort = if same_redexes {
        Some(ort0)
      } else {
        let (l_1, r_1) = eq
        total(ordertoorient, order(l_1)(r_1))
      }
      match ort {
        None => {
          let known_1 = delete_v2(known, id)
          let rw_1 = Rewrite::Rewrite(RewriteT::{
            order,
            known: known_1,
            redexes: redexes_1,
            subterms: subterms_1,
            waiting,
          })
          (rpl_1, spl_1, todo, rw_1, changed_1)
        }
        Some(ort_1) => {
          let todo_1 = if !newx && same_redexes {
            todo
          } else {
            let t4570 = redexresidues(ort_1, eq)
            findreducibles(order, known, subterms_1, id)(todo)(t4570)
          }
          let known_2 = if identical {
            known
          } else {
            insert_v1(known, (id, (eqn, ort_1)))
          }
          let redexes_2 = if same_redexes {
            redexes_1
          } else {
            addredexes(id, (eqn, ort_1), redexes_1)
          }
          let subterms_2 = if newx || !identical {
            addsubterms(id, eqn, subterms_1)
          } else {
            subterms_1
          }
          let rw_2 = Rewrite::Rewrite(RewriteT::{
            order,
            known: known_2,
            redexes: redexes_2,
            subterms: subterms_2,
            waiting,
          })
          (rpl_1, spl_1, todo_1, rw_2, changed_1)
        }
      }
    }
  }
}

///|
/// `pick`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB, TC] pick_v9(
  x4571 : @omap.T[TA, (TB, TC?)],
  x4572 : @oset.T[TA],
) -> (TA, (TB, TC?))? raise {
  let known = x4571
  let set = x4572
  let oriented : (TA) -> (TA, (TB, TC?))? raise = fn(
    x4573 : TA,
  ) -> (TA, (TB, TC?))? raise {
    let id = x4573
    match peek_v2(known, id) {
      Some((_, Some(_)) as x) => Some((id, x))
      _ => None
    }
  }
  let any : (TA) -> (TA, (TB, TC?))? raise = fn(
    x4574 : TA,
  ) -> (TA, (TB, TC?))? raise {
    let id_1 = x4574
    match peek_v2(known, id_1) {
      Some(x_1) => Some((id_1, x_1))
      _ => None
    }
  }
  match firstl_v2(oriented, set) {
    Some(_) as x_2 => x_2
    None => firstl_v2(any, set)
  }
}

///|
/// `cleanRedexes`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB] cleanredexes(
  x4575 : @omap.T[TA, (((Term, Term), TB), Orient?)],
  x4576 : TermNet[(TA, Orient)],
  x4577 : @oset.T[TA],
) -> TermNet[(TA, Orient)] raise {
  let known = x4575
  let redexes_1 = x4576
  let rpl = x4577
  if null_v5(rpl) {
    redexes_1
  } else {
    let addreds : ((TA, TermNet[(TA, Orient)])) -> TermNet[(TA, Orient)] raise = fn(
      x4580 : (TA, TermNet[(TA, Orient)]),
    ) -> TermNet[(TA, Orient)] raise {
      let (id_1, reds) = x4580
      match peek_v2(known, id_1) {
        None => reds
        Some(eqn_ort) => addredexes(id_1, eqn_ort, reds)
      }
    }
    let redexes_2 = filter_v27(fn(x4581 : (TA, Orient)) -> Bool raise {
      ((x4578, x4579) => filt_l_1(rpl, x4578, x4579))(x4581.0, x4581.1)
    })(redexes_1)
    let redexes_3 = foldl_v5(addreds)(redexes_2)(rpl)
    redexes_3
  }
}

///|
fn[TA : Eq + @lib.OCompare + @lib.OHash, TC] filt_l_1(
  rpl : @oset.T[TA],
  x4578 : TA,
  x4579 : TC,
) -> Bool raise {
  let (id, _) = (x4578, x4579)
  !member_v1(id)(rpl)
}

///|
/// `cleanSubterms`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB] cleansubterms(
  x4582 : @omap.T[TA, (((Term, Term), Thm), TB)],
  x4583 : TermNet[(TA, Bool, @list.List[Int64])],
  x4584 : @oset.T[TA],
) -> TermNet[(TA, Bool, @list.List[Int64])] raise {
  let known = x4582
  let subterms_1 = x4583
  let spl = x4584
  if null_v5(spl) {
    subterms_1
  } else {
    let addsubtms : ((TA, TermNet[(TA, Bool, @list.List[Int64])])) -> TermNet[
      (TA, Bool, @list.List[Int64]),
    ] raise = fn(
      x4588 : (TA, TermNet[(TA, Bool, @list.List[Int64])]),
    ) -> TermNet[(TA, Bool, @list.List[Int64])] raise {
      let (id_1, subtms) = x4588
      match peek_v2(known, id_1) {
        None => subtms
        Some((eqn, _)) => addsubterms(id_1, eqn, subtms)
      }
    }
    let subterms_2 = filter_v27(fn(
      x4589 : (TA, Bool, @list.List[Int64]),
    ) -> Bool raise {
      ((x4585, x4586, x4587) => filt_l_2(spl, x4585, x4586, x4587))(
        x4589.0,
        x4589.1,
        x4589.2,
      )
    })(subterms_1)
    let subterms_3 = foldl_v5(addsubtms)(subterms_2)(spl)
    subterms_3
  }
}

///|
fn[TA : Eq + @lib.OCompare + @lib.OHash, TC, TD] filt_l_2(
  spl : @oset.T[TA],
  x4585 : TA,
  x4586 : TC,
  x4587 : TD,
) -> Bool raise {
  let (id, _, _) = (x4585, x4586, x4587)
  !member_v1(id)(spl)
}

///|
/// `rebuild`
pub fn rebuild(
  x4590 : @oset.T[Int64],
  x4591 : @oset.T[Int64],
  x4592 : Rewrite,
) -> Rewrite raise {
  let rpl = x4590
  let spl = x4591
  let rw = x4592
  match rw {
    Rewrite::Rewrite(
      { order, known, redexes: redexes_1, subterms: subterms_1, waiting }
    ) => {
      let redexes_2 = cleanredexes(known, redexes_1, rpl)
      let subterms_2 = cleansubterms(known, subterms_1, spl)
      Rewrite::Rewrite(RewriteT::{
        order,
        known,
        redexes: redexes_2,
        subterms: subterms_2,
        waiting,
      })
    }
  }
}

///|
/// `reduceAcc`
pub fn reduceacc(
  x4593 : @oset.T[Int64],
  x4594 : @oset.T[Int64],
  x4595 : @oset.T[Int64],
  x4596 : Rewrite,
  x4597 : @oset.T[Int64],
) -> (Rewrite, @list.List[Key]) raise {
  match (x4593, x4594, x4595, x4596, x4597) {
    (rpl, spl, todo, Rewrite::Rewrite({ known, waiting, .. }) as rw, changed) =>
      match pick_v9(known, todo) {
        Some((id, eqn_ort)) => {
          let todo_1 = delete_v4(todo, id)
          let t4598 = reduce1(
            false,
            id,
            eqn_ort,
            (rpl, spl, todo_1, rw, changed),
          )
          reduceacc(t4598.0, t4598.1, t4598.2, t4598.3, t4598.4)
        }
        None =>
          match pick_v9(known, waiting) {
            Some((id_1, eqn_ort_1)) => {
              let rw_1 = deletewaiting(rw)(id_1)
              let t4599 = reduce1(
                true,
                id_1,
                eqn_ort_1,
                (rpl, spl, todo, rw_1, changed),
              )
              reduceacc(t4599.0, t4599.1, t4599.2, t4599.3, t4599.4)
            }
            None => {
              let t4600 = tolist_v4(changed)
              (rebuild(rpl, spl, rw), t4600)
            }
          }
      }
  }
}

///|
/// `isReduced`
pub fn isreduced(x4601 : Rewrite) -> Bool raise {
  match x4601 {
    Rewrite::Rewrite({ waiting, .. }) => null_v5(waiting)
  }
}

///|
/// `reduce'`
pub fn reduce_p(x4602 : Rewrite) -> (Rewrite, @list.List[Key]) raise {
  let rw = x4602
  if isreduced(rw) {
    (rw, @list.List([]))
  } else {
    reduceacc(empty_v4(), empty_v4(), empty_v4(), rw, empty_v4())
  }
}

///|
/// `reduce`
pub fn reduce(x4603 : Rewrite) -> Rewrite raise {
  let rw = x4603
  reduce_p(rw).0
}

///|
/// `addEqn`
pub fn addeqn(
  x4604 : (Int64, ((Term, Term), Thm)),
  x4605 : Rewrite,
) -> Rewrite raise {
  let (id_eqn, rw) = (x4604, x4605)
  add_v29(rw)(id_eqn)
}

///|
/// `orderedRewrite`
pub fn orderedrewrite(
  x4606 : (Term) -> ((Term) -> Int64? raise) raise,
  x4607 : @list.List[((Term, Term), Thm)],
) -> ((Thm) -> Thm raise) raise {
  let order = x4606
  let ths = x4607
  let t4610 = enumerate(ths)
  let rw = foldl(
    fn(x4609 : ((Int64, ((Term, Term), Thm)), Rewrite)) -> Rewrite raise {
      addeqn(x4609.0, x4609.1)
    },
    newrewrite(order),
    t4610,
  )
  rewriterule(rw, order)
}

///|
/// `order`
pub fn order(x4611 : Term, x4612 : Term) -> Int64? raise {
  Some(1L)
}

///|
/// rewrite
fn step_212() -> Unit raise {
  rewrite_c.set((x4615 : @list.List[((Term, Term), Thm)]) => {
    orderedrewrite(
      fn(x4613 : Term) -> ((Term) -> Int64? raise) raise {
        fn(x4614 : Term) -> Int64? raise { order(x4613, x4614) }
      },
      x4615,
    )
  })
}

///|
let rewrite_c : @lib.Cell[(@list.List[Equation1]) -> ((Thm) -> Thm raise) raise] = @lib.Cell::new(
  "rewrite",
)

///|
/// `rewrite`
pub fn rewrite(x : @list.List[Equation1]) -> ((Thm) -> Thm raise) raise {
  rewrite_c.get()(x)
}

///|
/// `unitThm`
pub type UnitThm = (Literal, Thm)

///|
/// `units`
#derive(Eq, Debug)
pub(all) enum Units {
  Units(LiteralNet[UnitThm])
}

///|
pub extend Units with Eq::{not_equal, equal}

///|
pub extend Units with Debug::{to_repr}

///|
pub extend Units with @lib.OCompare::{ocompare}

///|
pub extend Units with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_Units(x : Units) -> Int {
  match x {
    Units(_) => 1000000
  }
}

///|
pub impl @lib.OCompare for Units with fn ocompare(self, other) {
  match (self, other) {
    (Units(a0), Units(b0)) => @lib.compare(a0, b0)
    _ => ocaml_rank_Units(self).compare(ocaml_rank_Units(other))
  }
}

///|
pub impl @lib.OHash for Units with fn ohash_visit(self, h) {
  match self {
    Units(a0) => {
      h.block(0, 1)
      h.field(a0)
    }
  }
}

///|
/// empty
fn step_213() -> Unit raise {
  empty_v26_c.set(Units::Units(newnet_v2(Parameters1::{ fifo: false, })))
}

///|
let empty_v26_c : @lib.Cell[Units] = @lib.Cell::new("empty")

///|
/// `empty`
pub fn empty_v26() -> Units {
  empty_v26_c.get()
}

///|
/// `size`
pub fn size_v24(x4616 : Units) -> Int64 raise {
  match x4616 {
    Units::Units(net) => size_v21(net)
  }
}

///|
/// `toString`
pub fn tostring_v13(x4617 : Units) -> String raise {
  let units = x4617
  "U{" + (Int64::to_string(size_v24(units)) + "}")
}

///|
/// `add`
pub fn add_v30(x4618 : Units) -> (((Literal, Thm)) -> Units raise) raise {
  match x4618 {
    Units::Units(net) =>
      fn(x4619 : ((Bool, (String, @list.List[Term])), Thm)) -> Units raise {
        let (lit, th) as uth = x4619
        let net_1 = insert_v12(net)((lit, uth))
        match
          total(
            fn(
              x4620 : (Bool, (String, @list.List[Term])),
            ) -> (Bool, (String, @list.List[Term])) raise {
              sym_v2(x4620.0, x4620.1)
            },
            lit,
          ) {
          None => Units::Units(net_1)
          Some((pol, _) as lit_p) => {
            let th_p = (if pol {
              fn(
                x4621 : (Bool, (String, @list.List[Term])),
              ) -> ((Thm) -> Thm raise) raise {
                fn(x4622 : Thm) -> Thm raise { symeq(x4621, x4622) }
              }
            } else {
              fn(
                x4623 : (Bool, (String, @list.List[Term])),
              ) -> ((Thm) -> Thm raise) raise {
                fn(x4624 : Thm) -> Thm raise { symneq(x4623, x4624) }
              }
            })(lit)(th)
            let net_2 = insert_v12(net_1)((lit_p, (lit_p, th_p)))
            Units::Units(net_2)
          }
        }
      }
  }
}

///|
/// addList
fn step_214() -> Unit raise {
  addlist_v2_c.set(fn(
    x4628 : Units,
  ) -> ((@list.List[((Bool, (String, @list.List[Term])), Thm)]) -> Units raise) raise {
    fn(
      x4629 : @list.List[((Bool, (String, @list.List[Term])), Thm)],
    ) -> Units raise {
      ((
        x4626 : Units,
        x4627 : @list.List[((Bool, (String, @list.List[Term])), Thm)],
      ) => {
        foldl(
          fn(
            x4625 : (((Bool, (String, @list.List[Term])), Thm), Units),
          ) -> Units raise {
            let (th, u) = x4625
            add_v30(u)(th)
          },
          x4626,
          x4627,
        )
      })(x4628, x4629)
    }
  })
}

///|
let addlist_v2_c : @lib.Cell[
  (Units) -> ((@list.List[(Literal, Thm)]) -> Units raise) raise,
] = @lib.Cell::new("addList")

///|
/// `addList`
pub fn addlist_v2(
  x : Units,
) -> ((@list.List[(Literal, Thm)]) -> Units raise) raise {
  addlist_v2_c.get()(x)
}

///|
/// `matchUnits`
pub fn matchunits(
  x4630 : Units,
) -> (((Polarity, (Name, @list.List[Term]))) -> ((Literal, Thm), Subst)? raise) raise {
  match x4630 {
    Units::Units(net) =>
      fn(
        x4631 : (Bool, (String, @list.List[Term])),
      ) -> (((Bool, (String, @list.List[Term])), Thm), Subst)? raise {
        let lit = x4631
        first(x4632 => check_1_l(lit, x4632), matchnet_v2(net)(lit))
      }
  }
}

///|
fn[TA] check_1_l(
  lit : (Bool, (String, @list.List[Term])),
  x4632 : ((Bool, (String, @list.List[Term])), TA),
) -> ((Literal, TA), Subst)? raise {
  let (lit_p, _) as uth = x4632
  match
    total(
      (x4633 : (Bool, (String, @list.List[Term]))) => {
        matchliterals(empty_v13(), lit_p, x4633)
      },
      lit,
    ) {
    None => None
    Some(sub) => Some((uth, sub))
  }
}

///|
/// `reduce`
pub fn reduce_v1(x4634 : Units) -> ((Thm) -> Thm raise) raise {
  let units = x4634
  let red1 : (
    (
      (Bool, (String, @list.List[Term])),
      (@oset.T[(Bool, (String, @list.List[Term]))], Thm),
    ),
  ) -> (@oset.T[(Bool, (String, @list.List[Term]))], Thm) raise = fn(
    x4636 : (
      (Bool, (String, @list.List[Term])),
      (@oset.T[(Bool, (String, @list.List[Term]))], Thm),
    ),
  ) -> (@oset.T[(Bool, (String, @list.List[Term]))], Thm) raise {
    let (lit, news_th) = x4636
    match total(destirrefl, lit) {
      Some(tm) => {
        let (news, th) = news_th
        let t4637 = refl(tm)
        let th_1 = resolve(lit, th)(t4637)
        (news, th_1)
      }
      None => {
        let lit_p = negate(lit.0, lit.1)
        match matchunits(units)(lit_p) {
          None => news_th
          Some(((_, rth), sub)) => {
            let (news_1, th_2) = news_th
            let rth_1 = subst_v5(sub, rth)
            let th_3 = resolve(lit, th_2)(rth_1)
            let newlits = delete_v14(clause(rth_1), lit_p)
            let news_2 = union_v30(newlits)(news_1)
            (news_2, th_3)
          }
        }
      }
    }
  }
  fn red(
    x4638 : @oset.T[(Bool, (String, @list.List[Term]))],
    x4639 : Thm,
  ) -> Thm raise {
    let (news_3, th_4) = (x4638, x4639)
    if null_v17(news_3) {
      th_4
    } else {
      let t4640 = foldl_v16(red1)((empty_v22(), th_4))(news_3)
      red(t4640.0, t4640.1)
    }
  }
  fn(x4641 : Thm) -> Thm raise {
    let th_5 = x4641
    removesym(red(clause(th_5), th_5))
  }
}

///|
/// newId
fn step_215() -> Unit raise {
  let r = Ref::{ val: 0L, }
  let newi : (Unit) -> Int64 raise = fn(x4642 : Unit) -> Int64 raise {
    let _ = x4642
    let n = r.val
    match
      ({
        r.val = @lib.add63(n, 1L)
        ()
      }) {
      _ => n
    }
  }
  newid_c.set(fn(x4643 : Unit) -> Int64 raise {
    let _ = x4643
    critical(newi)(())
  })
}

///|
let newid_c : @lib.Cell[(Unit) -> Int64 raise] = @lib.Cell::new("newId")

///|
/// `newId`
pub fn newid(x : Unit) -> Int64 raise {
  newid_c.get()(x)
}

///|
/// `literalOrder`
#derive(Eq, Debug)
pub(all) enum LiteralOrder {
  No_literal_order
  Unsigned_literal_order
  Positive_literal_order
}

///|
pub extend LiteralOrder with Eq::{not_equal, equal}

///|
pub extend LiteralOrder with Debug::{to_repr}

///|
pub extend LiteralOrder with @lib.OCompare::{ocompare}

///|
pub extend LiteralOrder with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_LiteralOrder(x : LiteralOrder) -> Int {
  match x {
    No_literal_order => 0
    Unsigned_literal_order => 1
    Positive_literal_order => 2
  }
}

///|
pub impl @lib.OCompare for LiteralOrder with fn ocompare(self, other) {
  match (self, other) {
    _ => ocaml_rank_LiteralOrder(self).compare(ocaml_rank_LiteralOrder(other))
  }
}

///|
pub impl @lib.OHash for LiteralOrder with fn ohash_visit(self, h) {
  match self {
    No_literal_order => h.int(0L)
    Unsigned_literal_order => h.int(1L)
    Positive_literal_order => h.int(2L)
  }
}

///|
/// `parameters`
pub(all) struct Parameters4 {
  ordering : Kbo
  orderliterals : LiteralOrder
  orderterms : Bool
}

///|
/// `clauseId`
pub type ClauseId1 = Int64

///|
/// `clauseInfo`
pub(all) struct ClauseInfo {
  parameters : Parameters4
  id : ClauseId1
  thm : Thm
}

///|
/// `clause`
pub(all) enum Clause1 {
  Clause(ClauseInfo)
}

///|
/// `toString`
pub fn tostring_v14(x4644 : Clause1) -> String raise {
  match x4644 {
    Clause1::Clause({ id, thm, .. }) => tostring_v8(thm)
  }
}

///|
/// default
fn step_216() -> Unit raise {
  default_v2_c.set(Parameters4::{
    ordering: default_v1(),
    orderliterals: LiteralOrder::Positive_literal_order,
    orderterms: true,
  })
}

///|
let default_v2_c : @lib.Cell[Parameters4] = @lib.Cell::new("default")

///|
/// `default`
pub fn default_v2() -> Parameters4 {
  default_v2_c.get()
}

///|
/// `mk`
pub fn mk(x4645 : ClauseInfo) -> Clause1 raise {
  let info = x4645
  Clause1::Clause(info)
}

///|
/// `dest`
pub fn dest_v1(x4646 : Clause1) -> ClauseInfo raise {
  match x4646 {
    Clause1::Clause(info) => info
  }
}

///|
/// `id`
pub fn id(x4647 : Clause1) -> ClauseId1 raise {
  match x4647 {
    Clause1::Clause({ id: i, .. }) => i
  }
}

///|
/// `thm`
pub fn thm(x4648 : Clause1) -> Thm raise {
  match x4648 {
    Clause1::Clause({ thm: th, .. }) => th
  }
}

///|
/// `equalThms`
pub fn equalthms(x4649 : Clause1, x4650 : Clause1) -> Bool raise {
  let cl = x4649
  let cl_p = x4650
  let t4651 = thm(cl_p)
  equal_v32(thm(cl), t4651)
}

///|
/// `newClause`
pub fn newclause(x4652 : Parameters4, x4653 : Thm) -> Clause1 raise {
  let parameters = x4652
  let thm_1 = x4653
  Clause1::Clause(ClauseInfo::{ parameters, id: newid(()), thm: thm_1, })
}

///|
/// `literals`
pub fn literals(x4654 : Clause1) -> Clause raise {
  let cl = x4654
  clause(thm(cl))
}

///|
/// `isTautology`
pub fn istautology_v1(x4655 : Clause1) -> Bool raise {
  match x4655 {
    Clause1::Clause({ thm: thm_1, .. }) => istautology(thm_1)
  }
}

///|
/// `isContradiction`
pub fn iscontradiction_v1(x4656 : Clause1) -> Bool raise {
  match x4656 {
    Clause1::Clause({ thm: thm_1, .. }) => iscontradiction(thm_1)
  }
}

///|
/// `strictlyLess`
pub fn strictlyless(x4657 : Kbo, x4658 : Term, x4659 : Term) -> Bool raise {
  let ordering = x4657
  let x = x4658
  let y = x4659
  match compare_v44(ordering)(x)(y) {
    Some(c) if c < 0L => true
    _ => false
  }
}

///|
/// `isLargerTerm`
pub fn islargerterm(
  x4660 : Parameters4,
) -> (((Term, Term)) -> Bool raise) raise {
  match x4660 {
    { ordering, orderterms, .. } =>
      fn(x4661 : (Term, Term)) -> Bool raise {
        let (l, r) = x4661
        !orderterms || !strictlyless(ordering, l, r)
      }
  }
}

///|
/// `atomToTerms`
pub fn atomtoterms(
  x4662 : (String, @list.List[Term]),
) -> @list.List[Term] raise {
  let atm = x4662
  match total(desteq, atm) {
    None => @list.List([Term::Fn(atm)])
    Some((l, r)) => @list.List([l, r])
  }
}

///|
/// `notStrictlyLess`
pub fn notstrictlyless(
  x4663 : Kbo,
  x4664 : (@list.List[Term], @list.List[Term]),
) -> Bool raise {
  let ordering = x4663
  let (xs, ys) = x4664
  let less : (Term) -> Bool raise = fn(x4665 : Term) -> Bool raise {
    let x = x4665
    @lib.exists(
      fn(x4666 : Term) -> Bool raise {
        let y = x4666
        strictlyless(ordering, x, y)
      },
      ys,
    )
  }
  !@lib.forall(less, xs)
}

///|
/// `isLargerLiteral`
pub fn islargerliteral(
  x4667 : Parameters4,
) -> ((@oset.T[(Bool, (Name, @list.List[Term]))]) -> ((
  (Bool, (Name, @list.List[Term])),
) -> Bool raise) raise) raise {
  match x4667 {
    { ordering, orderliterals, .. } =>
      fn(
        x4668 : @oset.T[(Bool, (String, @list.List[Term]))],
      ) -> (((Bool, (String, @list.List[Term]))) -> Bool raise) raise {
        let lits = x4668
        match orderliterals {
          LiteralOrder::No_literal_order =>
            fn(x4670 : (Bool, (String, @list.List[Term]))) -> Bool raise {
              true
            }
          LiteralOrder::Unsigned_literal_order => {
            let tms = foldl_v16(fn(
              x4673 : ((Bool, (String, @list.List[Term])), @list.List[Term]),
            ) -> @list.List[Term] raise {
              addlit_l(x4673.0, x4673.1)
            })(@list.List([]))(lits)
            fn(x4674 : (Bool, (String, @list.List[Term]))) -> Bool raise {
              let (_, atm_p) = x4674
              notstrictlyless(ordering, (atomtoterms(atm_p), tms))
            }
          }
          LiteralOrder::Positive_literal_order =>
            match
              findl_v7(
                fn(x4675 : (Bool, (String, @list.List[Term]))) -> Bool raise {
                  true
                },
                lits,
              ) {
              None =>
                fn(x4676 : (Bool, (String, @list.List[Term]))) -> Bool raise {
                  true
                }
              Some((pol, _)) => {
                let addlit : (
                  ((Bool, (String, @list.List[Term])), @list.List[Term]),
                ) -> @list.List[Term] raise = fn(
                  x4677 : ((Bool, (String, @list.List[Term])), @list.List[Term]),
                ) -> @list.List[Term] raise {
                  let ((p, atm_1), acc_1) = x4677
                  if p == pol {
                    atomtoterms(atm_1).concat(acc_1)
                  } else {
                    acc_1
                  }
                }
                let tms_1 = foldl_v16(addlit)(@list.List([]))(lits)
                fn(x4678 : (Bool, (String, @list.List[Term]))) -> Bool raise {
                  let (pol_p, atm_p_1) = x4678
                  if pol != pol_p {
                    pol
                  } else {
                    notstrictlyless(ordering, (atomtoterms(atm_p_1), tms_1))
                  }
                }
              }
            }
        }
      }
  }
}

///|
fn[TA] addlit_l(
  x4671 : (TA, (String, @list.List[Term])),
  x4672 : @list.List[Term],
) -> @list.List[Term] raise {
  let ((_, atm), acc) = (x4671, x4672)
  atomtoterms(atm).concat(acc)
}

///|
/// `largestLiterals`
pub fn largestliterals(x4679 : Clause1) -> @oset.T[Elt6] raise {
  match x4679 {
    Clause1::Clause({ parameters, thm: thm_1, .. }) => {
      let litset = clause(thm_1)
      let islarger : ((Bool, (String, @list.List[Term]))) -> Bool raise = islargerliteral(
        parameters,
      )(litset)
      let addlit : (
        (
          (Bool, (String, @list.List[Term])),
          @oset.T[(Bool, (String, @list.List[Term]))],
        ),
      ) -> @oset.T[(Bool, (String, @list.List[Term]))] raise = fn(
        x4680 : (
          (Bool, (String, @list.List[Term])),
          @oset.T[(Bool, (String, @list.List[Term]))],
        ),
      ) -> @oset.T[(Bool, (String, @list.List[Term]))] raise {
        let (lit, s) = x4680
        if islarger(lit) {
          add_v23(s, lit)
        } else {
          s
        }
      }
      foldr_v16(addlit, empty_v22(), litset)
    }
  }
}

///|
/// `largestEquations`
pub fn largestequations(
  x4681 : Clause1,
) -> @list.List[(Literal, Orient, Term)] raise {
  match x4681 {
    Clause1::Clause({ parameters, .. }) as cl => {
      let addlit : (
        (
          (Bool, (String, @list.List[Term])),
          @list.List[((Bool, (String, @list.List[Term])), Orient, Term)],
        ),
      ) -> @list.List[((Bool, (String, @list.List[Term])), Orient, Term)] raise = fn(
        x4686 : (
          (Bool, (String, @list.List[Term])),
          @list.List[((Bool, (String, @list.List[Term])), Orient, Term)],
        ),
      ) -> @list.List[((Bool, (String, @list.List[Term])), Orient, Term)] raise {
        let (lit_1, acc_1) = x4686
        match total(desteq_v2, lit_1) {
          None => acc_1
          Some((l_1, r)) => {
            let acc_2 = ((x4682, x4683, x4684, x4685) => {
              addeq_l(parameters, x4682, x4683, x4684, x4685)
            })(lit_1, Orient::Right_to_left, (r, l_1), acc_1)
            let acc_3 = ((x4682, x4683, x4684, x4685) => {
              addeq_l(parameters, x4682, x4683, x4684, x4685)
            })(lit_1, Orient::Left_to_right, (l_1, r), acc_2)
            acc_3
          }
        }
      }
      foldr_v16(addlit, @list.List([]), largestliterals(cl))
    }
  }
}

///|
fn[TA, TB] addeq_l(
  parameters : Parameters4,
  x4682 : TA,
  x4683 : TB,
  x4684 : (Term, Term),
  x4685 : @list.List[(TA, TB, Term)],
) -> @list.List[(TA, TB, Term)] raise {
  let lit = x4682
  let ort = x4683
  let (l, _) as l_r = x4684
  let acc = x4685
  if islargerterm(parameters)(l_r) {
    acc.prepend((lit, ort, l))
  } else {
    acc
  }
}

///|
/// `addLit`
pub fn addlit(
  x4687 : (Bool, (String, @list.List[Term])),
  x4688 : @list.List[
    ((Bool, (String, @list.List[Term])), @list.List[Int64], Term),
  ],
) -> @list.List[(Literal, @list.List[Int64], Term)] raise {
  let (lit, acc) = (x4687, x4688)
  foldl(
    fn(
      x4691 : (
        (@list.List[Int64], Term),
        @list.List[
          ((Bool, (String, @list.List[Term])), @list.List[Int64], Term),
        ],
      ),
    ) -> @list.List[
      ((Bool, (String, @list.List[Term])), @list.List[Int64], Term),
    ] raise {
      ((x4689, x4690) => addtm_l_1(lit, x4689, x4690))(x4691.0, x4691.1)
    },
    acc,
    nonvartypedsubterms_v2(lit.0, lit.1),
  )
}

///|
fn[TA, TB] addtm_l_1(
  lit : (Bool, (String, @list.List[Term])),
  x4689 : (TA, TB),
  x4690 : @list.List[((Bool, (String, @list.List[Term])), TA, TB)],
) -> @list.List[(Literal, TA, TB)] raise {
  let ((path, tm), acc_1) = (x4689, x4690)
  acc_1.prepend((lit, path, tm))
}

///|
/// `largestSubterms`
pub fn largestsubterms(
  x4692 : Clause1,
) -> @list.List[(Literal, @list.List[Int64], Term)] raise {
  let cl = x4692
  let t4694 = largestliterals(cl)
  foldl_v16(fn(
    x4693 : (
      (Bool, (String, @list.List[Term])),
      @list.List[((Bool, (String, @list.List[Term])), @list.List[Int64], Term)],
    ),
  ) -> @list.List[((Bool, (String, @list.List[Term])), @list.List[Int64], Term)] raise {
    addlit(x4693.0, x4693.1)
  })(@list.List([]))(t4694)
}

///|
/// `allSubterms`
pub fn allsubterms(
  x4695 : Clause1,
) -> @list.List[(Literal, @list.List[Int64], Term)] raise {
  let cl = x4695
  let t4697 = literals(cl)
  foldl_v16(fn(
    x4696 : (
      (Bool, (String, @list.List[Term])),
      @list.List[((Bool, (String, @list.List[Term])), @list.List[Int64], Term)],
    ),
  ) -> @list.List[((Bool, (String, @list.List[Term])), @list.List[Int64], Term)] raise {
    addlit(x4696.0, x4696.1)
  })(@list.List([]))(t4697)
}

///|
/// `subsumes`
pub fn subsumes_v1(x4698 : Subsume[Clause1], x4699 : Clause1) -> Bool raise {
  let _ as subs = x4698
  let cl = x4699
  isstrictlysubsumed(subs, literals(cl))
}

///|
/// `freshVars`
pub fn freshvars_v2(x4700 : Clause1) -> Clause1 raise {
  match x4700 {
    Clause1::Clause({ parameters, id: id_1, thm: thm_1 }) =>
      Clause1::Clause(ClauseInfo::{
        parameters,
        id: id_1,
        thm: freshvars_v1(thm_1),
      })
  }
}

///|
/// `simplify`
pub fn simplify_v1(x4701 : Clause1) -> Clause1? raise {
  match x4701 {
    Clause1::Clause({ parameters, id: id_1, thm: thm_1 }) =>
      match simplify(thm_1) {
        None => None
        Some(thm_2) =>
          Some(
            Clause1::Clause(ClauseInfo::{ parameters, id: id_1, thm: thm_2, }),
          )
      }
  }
}

///|
/// `reduce`
pub fn reduce_v2(x4702 : Units, x4703 : Clause1) -> Clause1 raise {
  let units = x4702
  match x4703 {
    Clause1::Clause({ parameters, id: id_1, thm: thm_1 }) =>
      Clause1::Clause(ClauseInfo::{
        parameters,
        id: id_1,
        thm: reduce_v1(units)(thm_1),
      })
  }
}

///|
/// `rewrite`
pub fn rewrite_v1(x4704 : Rewrite, x4705 : Clause1) -> Clause1 raise {
  let rewr = x4704
  match x4705 {
    Clause1::Clause({ parameters, id: id_1, thm: thm_1 }) => {
      let simp : (Thm) -> Thm raise = fn(x4706 : Thm) -> Thm raise {
        let th = x4706
        match parameters {
          { ordering, .. } => {
            let cmp_1 : (Term) -> ((Term) -> Int64? raise) raise = compare_v44(
              ordering,
            )
            rewriteidrule(rewr)(cmp_1)(id_1)(th)
          }
          _ => raise @lib.MatchFailure("tscript.ml:8066")
        }
      }
      let thm_3 = match peek_v11(rewr)(id_1) {
        None => simp(thm_1)
        Some(((_, thm_2), _)) =>
          if isreduced(rewr) {
            thm_2
          } else {
            simp(thm_2)
          }
      }
      let result = Clause1::Clause(ClauseInfo::{
        parameters,
        id: id_1,
        thm: thm_3,
      })
      result
    }
  }
}

///|
/// `factor`
pub fn factor_v1(x4707 : Clause1) -> @list.List[Clause1] raise {
  match x4707 {
    Clause1::Clause({ parameters, thm: thm_1, .. }) as cl => {
      let lits = largestliterals(cl)
      let apply : (Subst) -> Clause1 raise = fn(
        x4708 : Subst,
      ) -> Clause1 raise {
        let sub = x4708
        newclause(parameters, subst_v5(sub, thm_1))
      }
      @lib.map(apply, factor_p(lits))
    }
  }
}

///|
/// `resolve`
pub fn resolve_v1(
  x4709 : (Clause1, (Bool, (String, @list.List[Term]))),
  x4710 : (Clause1, (Bool, (String, @list.List[Term]))),
) -> Clause1 raise {
  let (cl1, lit1) = x4709
  let (cl2, lit2) = x4710
  match cl1 {
    Clause1::Clause({ parameters, thm: th1, .. }) =>
      match cl2 {
        Clause1::Clause({ thm: th2, .. }) => {
          let sub = unify_v2(empty_v13(), lit1, negate(lit2.0, lit2.1))
          let lit1_1 = subst_v3(sub, lit1)
          let lit2_1 = negate(lit1_1.0, lit1_1.1)
          let th1_1 = subst_v5(sub, th1)
          let th2_1 = subst_v5(sub, th2)
          let t4711 = clause(th1_1)
          let _ = islargerliteral(parameters)(t4711)(lit1_1) ||
            @lib.raise_error(Failure("resolve: clause1: ordering constraints"))
          let t4712 = clause(th2_1)
          let _ = islargerliteral(parameters)(t4712)(lit2_1) ||
            @lib.raise_error(Failure("resolve: clause2: ordering constraints"))
          let th = resolve(lit1_1, th1_1)(th2_1)
          let cl = Clause1::Clause(ClauseInfo::{
            parameters,
            id: newid(()),
            thm: th,
          })
          cl
        }
        _ => raise @lib.MatchFailure("tscript.ml:8124")
      }
    _ => raise @lib.MatchFailure("tscript.ml:8123")
  }
}

///|
/// `paramodulate`
pub fn paramodulate(
  x4713 : (Clause1, (Bool, (String, @list.List[Term])), Orient, Term),
  x4714 : (Clause1, (Bool, (String, @list.List[Term])), @list.List[Int64], Term),
) -> Clause1 raise {
  let (cl1, lit1, ort1, tm1) = x4713
  let (cl2, lit2, path2, tm2) = x4714
  match cl1 {
    Clause1::Clause({ parameters, thm: th1, .. }) =>
      match cl2 {
        Clause1::Clause({ thm: th2, .. }) => {
          let sub = unify(empty_v13(), tm1, tm2)
          let lit1_1 = subst_v3(sub, lit1)
          let lit2_1 = subst_v3(sub, lit2)
          let th1_1 = subst_v5(sub, th1)
          let th2_1 = subst_v5(sub, th2)
          let t4715 = clause(th1_1)
          let _ = islargerliteral(parameters)(t4715)(lit1_1) ||
            @lib.raise_error(
              Failure("Clause.paramodulate: with clause: ordering"),
            )
          let t4716 = clause(th2_1)
          let _ = islargerliteral(parameters)(t4716)(lit2_1) ||
            @lib.raise_error(
              Failure("Clause.paramodulate: into clause: ordering"),
            )
          let eqn = (desteq_v2(lit1_1), th1_1)
          let (l_r, _) as eqn_1 = match ort1 {
            Orient::Left_to_right => eqn
            Orient::Right_to_left => symeqn(eqn)
          }
          let _ = islargerterm(parameters)(l_r) ||
            @lib.raise_error(
              Failure("Clause.paramodulate: equation: ordering constraints"),
            )
          let th = rewrrule(eqn_1, lit2_1, path2)(th2_1)
          Clause1::Clause(ClauseInfo::{ parameters, id: newid(()), thm: th, })
        }
        _ => raise @lib.MatchFailure("tscript.ml:8167")
      }
    _ => raise @lib.MatchFailure("tscript.ml:8166")
  }
}

///|
/// `ax_cj_thm`
#derive(Eq, Debug)
pub(all) struct AxCjThm {
  axioms_thm : @list.List[Thm]
  conjecture_thm : @list.List[Thm]
}

///|
pub extend AxCjThm with Eq::{not_equal, equal}

///|
pub extend AxCjThm with Debug::{to_repr}

///|
pub extend AxCjThm with @lib.OCompare::{ocompare}

///|
pub extend AxCjThm with @lib.OHash::{ohash_visit}

///|
pub impl @lib.OCompare for AxCjThm with fn ocompare(self, other) {
  let c = @lib.compare(self.axioms_thm, other.axioms_thm)
  if c != 0 {
    return c
  }
  @lib.compare(self.conjecture_thm, other.conjecture_thm)
}

///|
pub impl @lib.OHash for AxCjThm with fn ohash_visit(self, h) {
  h.block(0, 2)
  h.field(self.axioms_thm)
  h.field(self.conjecture_thm)
}

///|
/// `ax_cj_cl`
pub(all) struct AxCjCl {
  axioms_cl : @list.List[Clause1]
  conjecture_cl : @list.List[Clause1]
}

///|
/// `simplify`
#derive(Eq, Debug)
pub(all) struct Simplify {
  subsumes : Bool
  reduce : Bool
  rewrites : Bool
}

///|
pub extend Simplify with Eq::{not_equal, equal}

///|
pub extend Simplify with Debug::{to_repr}

///|
pub extend Simplify with @lib.OCompare::{ocompare}

///|
pub extend Simplify with @lib.OHash::{ohash_visit}

///|
pub impl @lib.OCompare for Simplify with fn ocompare(self, other) {
  let c = @lib.compare(self.subsumes, other.subsumes)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.reduce, other.reduce)
  if c != 0 {
    return c
  }
  @lib.compare(self.rewrites, other.rewrites)
}

///|
pub impl @lib.OHash for Simplify with fn ohash_visit(self, h) {
  h.block(0, 3)
  h.field(self.subsumes)
  h.field(self.reduce)
  h.field(self.rewrites)
}

///|
/// `parameters`
pub(all) struct Parameters5 {
  clause : Parameters4
  prefactor : Simplify
  postfactor : Simplify
}

///|
/// `active_t`
pub(all) struct ActiveT {
  parameters : Parameters5
  clauses : Map2[Clause1]
  units : Units
  rewrite : Rewrite
  subsume : Subsume[Clause1]
  literals : LiteralNet[(Clause1, Literal)]
  equations : TermNet[(Clause1, Literal, Orient, Term)]
  subterms : TermNet[(Clause1, Literal, Path, Term)]
  allsubterms : TermNet[(Clause1, Term)]
}

///|
/// `active`
pub(all) enum Active {
  Active(ActiveT)
}

///|
/// `getSubsume`
pub fn getsubsume(x4717 : Active) -> Subsume[Clause1] raise {
  match x4717 {
    Active::Active({ subsume: s, .. }) => s
  }
}

///|
/// `setRewrite`
pub fn setrewrite(x4718 : Active, x4719 : Rewrite) -> Active raise {
  let active = x4718
  let rewrite_1 = x4719
  match active {
    Active::Active(
      {
        parameters,
        clauses,
        units,
        subsume,
        literals: literals_1,
        equations: equations_1,
        subterms: subterms_1,
        allsubterms: allsubterms_1,
        ..
      }
    ) =>
      Active::Active(ActiveT::{
        parameters,
        clauses,
        units,
        rewrite: rewrite_1,
        subsume,
        literals: literals_1,
        equations: equations_1,
        subterms: subterms_1,
        allsubterms: allsubterms_1,
      })
  }
}

///|
/// maxSimplify
fn step_217() -> Unit raise {
  maxsimplify_c.set(Simplify::{ subsumes: true, reduce: true, rewrites: true, })
}

///|
let maxsimplify_c : @lib.Cell[Simplify] = @lib.Cell::new("maxSimplify")

///|
/// `maxSimplify`
pub fn maxsimplify() -> Simplify {
  maxsimplify_c.get()
}

///|
/// default
fn step_218() -> Unit raise {
  default_v3_c.set(Parameters5::{
    clause: default_v2(),
    prefactor: maxsimplify(),
    postfactor: maxsimplify(),
  })
}

///|
let default_v3_c : @lib.Cell[Parameters5] = @lib.Cell::new("default")

///|
/// `default`
pub fn default_v3() -> Parameters5 {
  default_v3_c.get()
}

///|
/// `empty`
pub fn empty_v27(x4720 : Parameters5) -> Active raise {
  let parameters = x4720
  match parameters {
    { clause: clause_1, .. } =>
      match clause_1 {
        { ordering, .. } => {
          let t4721 = newnet(Parameters1::{ fifo: false, })
          let t4722 = newnet(Parameters1::{ fifo: false, })
          let t4723 = newnet(Parameters1::{ fifo: false, })
          let t4724 = newnet_v2(Parameters1::{ fifo: false, })
          let t4725 = newsubsume(())
          let t4726 = newrewrite(compare_v44(ordering))
          Active::Active(ActiveT::{
            parameters,
            clauses: newmap_v1(()),
            units: empty_v26(),
            rewrite: t4726,
            subsume: t4725,
            literals: t4724,
            equations: t4723,
            subterms: t4722,
            allsubterms: t4721,
          })
        }
        _ => raise @lib.MatchFailure("tscript.ml:8475")
      }
    _ => raise @lib.MatchFailure("tscript.ml:8474")
  }
}

///|
/// `size`
pub fn size_v25(x4727 : Active) -> Int64 raise {
  match x4727 {
    Active::Active({ clauses, .. }) => size_v2(clauses)
  }
}

///|
/// `clauses`
pub fn clauses(x4728 : Active) -> @list.List[Clause1] raise {
  match x4728 {
    Active::Active({ clauses: cls, .. }) =>
      foldr_v3(fn(
        x4732 : (Int64, Clause1, @list.List[Clause1]),
      ) -> @list.List[Clause1] raise {
        add_l_3(x4732.0, x4732.1, x4732.2)
      })(@list.List([]))(cls)
  }
}

///|
fn[TA, TB] add_l_3(
  x4729 : TB,
  x4730 : TA,
  x4731 : @list.List[TA],
) -> @list.List[TA] raise {
  let (_, cl, acc) = (x4729, x4730, x4731)
  acc.prepend(cl)
}

///|
/// `saturation`
pub fn saturation(x4733 : Active) -> @list.List[Clause1] raise {
  let active = x4733
  let remove_1 : ((Clause1, (@list.List[Clause1], Subsume[Unit]))) -> (
    @list.List[Clause1],
    Subsume[Unit],
  ) raise = fn(
    x4734 : (Clause1, (@list.List[Clause1], Subsume[Unit])),
  ) -> (@list.List[Clause1], Subsume[Unit]) raise {
    let (cl, (cls, subs)) = x4734
    let lits = literals(cl)
    if isstrictlysubsumed(subs, lits) {
      (cls, subs)
    } else {
      (cls.prepend(cl), insert_v13(subs)((lits, ())))
    }
  }
  let cls_1 = clauses(active)
  let (cls_2, _) = foldl(remove_1, (@list.List([]), newsubsume(())), cls_1)
  let (cls_3, subs_1) = foldl(remove_1, (@list.List([]), newsubsume(())), cls_2)
  cls_3
}

///|
/// `toString`
pub fn tostring_v15(x4735 : Active) -> String raise {
  let active = x4735
  "Active{" + (Int64::to_string(size_v25(active)) + "}")
}

///|
/// `simplify`
pub fn simplify_v2(
  x4736 : Simplify,
  x4737 : Units,
  x4738 : Rewrite,
  x4739 : Subsume[Clause1],
) -> ((Clause1) -> Clause1? raise) raise {
  let simp = x4736
  let units = x4737
  let rewr = x4738
  let subs = x4739
  match simp {
    { subsumes: s, reduce: r, rewrites: w } => {
      fn rewrite_1(x4741 : Clause1) -> Clause1? raise {
        let cl = x4741
        let cl_p = rewrite_v1(rewr, cl)
        if equalthms(cl, cl_p) {
          Some(cl)
        } else {
          match simplify_v1(cl_p) {
            None => None
            Some(cl_p_p) =>
              if equalthms(cl_p, cl_p_p) {
                Some(cl_p)
              } else {
                rewrite_1(cl_p_p)
              }
          }
        }
      }
      fn(x4742 : Clause1) -> Clause1? raise {
        let cl_1 = x4742
        match simplify_v1(cl_1) {
          None => None
          Some(cl_2) =>
            match (if w { rewrite_1(cl_2) } else { Some(cl_2) }) {
              None => None
              Some(cl_3) => {
                let cl_4 = if r { reduce_v2(units, cl_3) } else { cl_3 }
                if s && subsumes_v1(subs, cl_4) {
                  None
                } else {
                  Some(cl_4)
                }
              }
            }
        }
      }
    }
    _ => raise @lib.MatchFailure("tscript.ml:8531")
  }
}

///|
/// `simplifyActive`
pub fn simplifyactive(
  x4743 : Simplify,
  x4744 : Active,
) -> ((Clause1) -> Clause1? raise) raise {
  let simp = x4743
  let active = x4744
  match active {
    Active::Active({ units, rewrite: rewrite_1, subsume, .. }) =>
      simplify_v2(simp, units, rewrite_1, subsume)
  }
}

///|
/// `addUnit`
pub fn addunit(x4746 : Units, x4747 : Clause1) -> Units raise {
  let units = x4746
  let cl = x4747
  let th = thm(cl)
  match total(destunit, th) {
    Some(lit) => add_v30(units)((lit, th))
    None => units
  }
}

///|
/// `addRewrite`
pub fn addrewrite(x4748 : Rewrite, x4749 : Clause1) -> Rewrite raise {
  let rewrite_1 = x4748
  let cl = x4749
  let th = thm(cl)
  match total(destuniteq, th) {
    Some(l_r) => {
      let t4750 = (id(cl), (l_r, th))
      add_v29(rewrite_1)(t4750)
    }
    None => rewrite_1
  }
}

///|
/// `addSubsume`
pub fn addsubsume(
  x4751 : Subsume[Clause1],
  x4752 : Clause1,
) -> Subsume[Clause1] raise {
  let subsume = x4751
  let cl = x4752
  let t4753 = (literals(cl), cl)
  insert_v13(subsume)(t4753)
}

///|
/// `addLiterals`
pub fn addliterals(
  x4754 : LiteralNet[(Clause1, (Bool, (String, @list.List[Term])))],
  x4755 : Clause1,
) -> LiteralNet[(Clause1, (Polarity, Atom))] raise {
  let literals_1 = x4754
  let cl = x4755
  let add_1 : (
    (
      (Bool, (String, @list.List[Term])),
      LiteralNet[(Clause1, (Bool, (String, @list.List[Term])))],
    ),
  ) -> LiteralNet[(Clause1, (Bool, (String, @list.List[Term])))] raise = fn(
    x4756 : (
      (Bool, (String, @list.List[Term])),
      LiteralNet[(Clause1, (Bool, (String, @list.List[Term])))],
    ),
  ) -> LiteralNet[(Clause1, (Bool, (String, @list.List[Term])))] raise {
    let ((_, atm) as lit, literals_2) = x4756
    if iseq(atm) {
      literals_2
    } else {
      insert_v12(literals_2)((lit, (cl, lit)))
    }
  }
  let t4757 = largestliterals(cl)
  foldl_v16(add_1)(literals_1)(t4757)
}

///|
/// `addEquations`
pub fn addequations(
  x4758 : TermNet[(Clause1, (Bool, (String, @list.List[Term])), Orient, Term)],
  x4759 : Clause1,
) -> TermNet[(Clause1, Literal, Orient, Term)] raise {
  let equations_1 = x4758
  let cl = x4759
  foldl(
    fn(
      x4762 : (
        ((Bool, (String, @list.List[Term])), Orient, Term),
        TermNet[(Clause1, (Bool, (String, @list.List[Term])), Orient, Term)],
      ),
    ) -> TermNet[(Clause1, (Bool, (String, @list.List[Term])), Orient, Term)] raise {
      ((x4760, x4761) => add_1_l(cl, x4760, x4761))(x4762.0, x4762.1)
    },
    equations_1,
    largestequations(cl),
  )
}

///|
fn[TA, TB] add_1_l(
  cl : Clause1,
  x4760 : (TA, TB, Term),
  x4761 : TermNet[(Clause1, TA, TB, Term)],
) -> TermNet[(Clause1, TA, TB, Term)] raise {
  let ((lit, ort, tm), equations_2) = (x4760, x4761)
  insert_v10(equations_2)((tm, (cl, lit, ort, tm)))
}

///|
/// `addSubterms`
pub fn addsubterms_v1(
  x4763 : TermNet[
    (Clause1, (Bool, (String, @list.List[Term])), @list.List[Int64], Term),
  ],
  x4764 : Clause1,
) -> TermNet[(Clause1, Literal, @list.List[Int64], Term)] raise {
  let subterms_1 = x4763
  let cl = x4764
  foldl(
    fn(
      x4767 : (
        ((Bool, (String, @list.List[Term])), @list.List[Int64], Term),
        TermNet[
          (Clause1, (Bool, (String, @list.List[Term])), @list.List[Int64], Term),
        ],
      ),
    ) -> TermNet[
      (Clause1, (Bool, (String, @list.List[Term])), @list.List[Int64], Term),
    ] raise {
      ((x4765, x4766) => add_1_l_1(cl, x4765, x4766))(x4767.0, x4767.1)
    },
    subterms_1,
    largestsubterms(cl),
  )
}

///|
fn[TA, TB] add_1_l_1(
  cl : Clause1,
  x4765 : (TA, TB, Term),
  x4766 : TermNet[(Clause1, TA, TB, Term)],
) -> TermNet[(Clause1, TA, TB, Term)] raise {
  let ((lit, path, tm), subterms_2) = (x4765, x4766)
  insert_v10(subterms_2)((tm, (cl, lit, path, tm)))
}

///|
/// `addAllSubterms`
pub fn addallsubterms(
  x4768 : TermNet[(Clause1, Term)],
  x4769 : Clause1,
) -> TermNet[(Clause1, Term)] raise {
  let allsubterms_1 = x4768
  let cl = x4769
  foldl(
    fn(
      x4772 : (
        ((Bool, (String, @list.List[Term])), @list.List[Int64], Term),
        TermNet[(Clause1, Term)],
      ),
    ) -> TermNet[(Clause1, Term)] raise {
      ((x4770, x4771) => add_1_l_2(cl, x4770, x4771))(x4772.0, x4772.1)
    },
    allsubterms_1,
    allsubterms(cl),
  )
}

///|
fn[TA, TB] add_1_l_2(
  cl : Clause1,
  x4770 : (TA, TB, Term),
  x4771 : TermNet[(Clause1, Term)],
) -> TermNet[(Clause1, Term)] raise {
  let ((_, _, tm), allsubterms_2) = (x4770, x4771)
  insert_v10(allsubterms_2)((tm, (cl, tm)))
}

///|
/// `addClause`
pub fn addclause(x4773 : Active, x4774 : Clause1) -> Active raise {
  let active = x4773
  let cl = x4774
  match active {
    Active::Active(
      {
        parameters,
        clauses: clauses_1,
        units,
        rewrite: rewrite_1,
        subsume,
        literals: literals_1,
        equations: equations_1,
        subterms: subterms_1,
        allsubterms: allsubterms_1
      }
    ) => {
      let clauses_2 = insert_v1(clauses_1, (id(cl), cl))
      let subsume_1 = addsubsume(subsume, cl)
      let literals_2 = addliterals(literals_1, cl)
      let equations_2 = addequations(equations_1, cl)
      let subterms_2 = addsubterms_v1(subterms_1, cl)
      let allsubterms_2 = addallsubterms(allsubterms_1, cl)
      Active::Active(ActiveT::{
        parameters,
        clauses: clauses_2,
        units,
        rewrite: rewrite_1,
        subsume: subsume_1,
        literals: literals_2,
        equations: equations_2,
        subterms: subterms_2,
        allsubterms: allsubterms_2,
      })
    }
  }
}

///|
/// `addFactorClause`
pub fn addfactorclause(x4775 : Active, x4776 : Clause1) -> Active raise {
  let active = x4775
  let cl = x4776
  match active {
    Active::Active(
      {
        parameters,
        clauses: clauses_1,
        units,
        rewrite: rewrite_1,
        subsume,
        literals: literals_1,
        equations: equations_1,
        subterms: subterms_1,
        allsubterms: allsubterms_1
      }
    ) => {
      let units_1 = addunit(units, cl)
      let rewrite_2 = addrewrite(rewrite_1, cl)
      Active::Active(ActiveT::{
        parameters,
        clauses: clauses_1,
        units: units_1,
        rewrite: rewrite_2,
        subsume,
        literals: literals_1,
        equations: equations_1,
        subterms: subterms_1,
        allsubterms: allsubterms_1,
      })
    }
  }
}

///|
/// `deduceResolution`
pub fn deduceresolution(
  x4777 : LiteralNet[(Clause1, (Bool, (String, @list.List[Term])))],
  x4778 : Clause1,
  x4779 : ((Bool, (String, @list.List[Term])), @list.List[Clause1]),
) -> @list.List[Clause1] raise {
  let literals_1 = x4777
  let cl = x4778
  let ((_, atm) as lit, acc) = x4779
  let resolve_1 : (
    ((Clause1, (Bool, (String, @list.List[Term]))), @list.List[Clause1]),
  ) -> @list.List[Clause1] raise = fn(
    x4780 : ((Clause1, (Bool, (String, @list.List[Term]))), @list.List[Clause1]),
  ) -> @list.List[Clause1] raise {
    let (cl_lit, acc_1) = x4780
    match
      total(
        (x4781 : (Clause1, (Bool, (String, @list.List[Term])))) => {
          resolve_v1(cl_lit, x4781)
        },
        (cl, lit),
      ) {
      Some(cl_p) => acc_1.prepend(cl_p)
      None => acc_1
    }
  }
  if iseq(atm) {
    acc
  } else {
    let t4782 = negate(lit.0, lit.1)
    foldl(resolve_1, acc, unify_v5(literals_1)(t4782))
  }
}

///|
/// `deduceParamodulationWith`
pub fn deduceparamodulationwith(
  x4783 : TermNet[
    (Clause1, (Bool, (String, @list.List[Term])), @list.List[Int64], Term),
  ],
  x4784 : Clause1,
  x4785 : (
    ((Bool, (String, @list.List[Term])), Orient, Term),
    @list.List[Clause1],
  ),
) -> @list.List[Clause1] raise {
  let subterms_1 = x4783
  let cl = x4784
  let ((lit, ort, tm), acc) = x4785
  let para : (
    (
      (Clause1, (Bool, (String, @list.List[Term])), @list.List[Int64], Term),
      @list.List[Clause1],
    ),
  ) -> @list.List[Clause1] raise = fn(
    x4786 : (
      (Clause1, (Bool, (String, @list.List[Term])), @list.List[Int64], Term),
      @list.List[Clause1],
    ),
  ) -> @list.List[Clause1] raise {
    let (cl_lit_path_tm, acc_1) = x4786
    match
      total(
        (
          x4787 : (
            Clause1,
            (Bool, (String, @list.List[Term])),
            @list.List[Int64],
            Term,
          ),
        ) => paramodulate((cl, lit, ort, tm), x4787),
        cl_lit_path_tm,
      ) {
      Some(cl_p) => acc_1.prepend(cl_p)
      None => acc_1
    }
  }
  foldl(para, acc, unify_v3(subterms_1, tm))
}

///|
/// `deduceParamodulationInto`
pub fn deduceparamodulationinto(
  x4788 : TermNet[(Clause1, (Bool, (String, @list.List[Term])), Orient, Term)],
  x4789 : Clause1,
  x4790 : (
    ((Bool, (String, @list.List[Term])), @list.List[Int64], Term),
    @list.List[Clause1],
  ),
) -> @list.List[Clause1] raise {
  let equations_1 = x4788
  let cl = x4789
  let ((lit, path, tm), acc) = x4790
  let para : (
    (
      (Clause1, (Bool, (String, @list.List[Term])), Orient, Term),
      @list.List[Clause1],
    ),
  ) -> @list.List[Clause1] raise = fn(
    x4791 : (
      (Clause1, (Bool, (String, @list.List[Term])), Orient, Term),
      @list.List[Clause1],
    ),
  ) -> @list.List[Clause1] raise {
    let (cl_lit_ort_tm, acc_1) = x4791
    match
      total(
        (
          x4792 : (
            Clause1,
            (Bool, (String, @list.List[Term])),
            @list.List[Int64],
            Term,
          ),
        ) => paramodulate(cl_lit_ort_tm, x4792),
        (cl, lit, path, tm),
      ) {
      Some(cl_p) => acc_1.prepend(cl_p)
      None => acc_1
    }
  }
  foldl(para, acc, unify_v3(equations_1, tm))
}

///|
/// `deduce`
pub fn deduce(x4793 : Active, x4794 : Clause1) -> @list.List[Clause1] raise {
  let active = x4793
  let cl = x4794
  match active {
    Active::Active(
      {
        parameters,
        literals: literals_1,
        equations: equations_1,
        subterms: subterms_1,
        ..
      }
    ) => {
      let lits = largestliterals(cl)
      let eqns = largestequations(cl)
      let subtms = if null_v20(equations_1) {
        @list.List([])
      } else {
        largestsubterms(cl)
      }
      let acc = @list.List([])
      let acc_1 = foldl_v16((
        x4795 : ((Bool, (String, @list.List[Term])), @list.List[Clause1]),
      ) => deduceresolution(literals_1, cl, x4795))(acc)(lits)
      let acc_2 = foldl(
        (
          x4796 : (
            ((Bool, (String, @list.List[Term])), Orient, Term),
            @list.List[Clause1],
          ),
        ) => deduceparamodulationwith(subterms_1, cl, x4796),
        acc_1,
        eqns,
      )
      let acc_3 = foldl(
        (
          x4797 : (
            ((Bool, (String, @list.List[Term])), @list.List[Int64], Term),
            @list.List[Clause1],
          ),
        ) => deduceparamodulationinto(equations_1, cl, x4797),
        acc_2,
        subtms,
      )
      let acc_4 = @lib.rev(acc_3)
      acc_4
    }
  }
}

///|
/// `clause_rewritables`
pub fn clause_rewritables(x4798 : Active) -> @oset.T[Key] raise {
  let active = x4798
  match active {
    Active::Active({ clauses: clauses_1, rewrite: rewrite_1, .. }) =>
      foldr_v3(fn(
        x4802 : (Int64, Clause1, @oset.T[Int64]),
      ) -> @oset.T[Int64] raise {
        ((x4799, x4800, x4801) => rewr_l(rewrite_1, x4799, x4800, x4801))(
          x4802.0,
          x4802.1,
          x4802.2,
        )
      })(empty_v4())(clauses_1)
  }
}

///|
fn[TA : Eq + @lib.OCompare + @lib.OHash] rewr_l(
  rewrite_1 : Rewrite,
  x4799 : TA,
  x4800 : Clause1,
  x4801 : @oset.T[TA],
) -> @oset.T[TA] raise {
  let (id_1, cl, ids) = (x4799, x4800, x4801)
  let cl_p = rewrite_v1(rewrite_1, cl)
  if equalthms(cl, cl_p) {
    ids
  } else {
    add_v4(ids, id_1)
  }
}

///|
/// `orderedRedexResidues`
pub fn[TA, TB] orderedredexresidues(
  x4803 : ((TA, TA), TB),
  x4804 : Orient?,
) -> @list.List[(TA, TA, Bool)] raise {
  let (((l, r), _), ort) = (x4803, x4804)
  match ort {
    None => @list.List([])
    Some(Orient::Left_to_right) => @list.List([(l, r, true)])
    Some(Orient::Right_to_left) => @list.List([(r, l, true)])
  }
}

///|
/// `unorderedRedexResidues`
pub fn[TA, TB, TC] unorderedredexresidues(
  x4805 : ((TA, TA), TB),
  x4806 : TC?,
) -> @list.List[(TA, TA, Bool)] raise {
  let (((l, r), _), ort) = (x4805, x4806)
  match ort {
    None => @list.List([(l, r, false), (r, l, false)])
    Some(_) => @list.List([])
  }
}

///|
/// `rewrite_rewritables`
pub fn rewrite_rewritables(
  x4807 : Active,
  x4808 : @list.List[Int64],
) -> @oset.T[ClauseId1] raise {
  let active = x4807
  let rewr_ids = x4808
  match active {
    Active::Active(
      {
        parameters,
        clauses: clauses_1,
        rewrite: rewrite_1,
        allsubterms: allsubterms_1,
        ..
      }
    ) =>
      match parameters {
        { clause: { ordering, .. }, .. } => {
          let order_1 : (Term) -> ((Term) -> Int64? raise) raise = compare_v44(
            ordering,
          )
          let addrewr : ((Int64, @oset.T[Int64])) -> @oset.T[Int64] raise = fn(
            x4809 : (Int64, @oset.T[Int64]),
          ) -> @oset.T[Int64] raise {
            let (id_1, acc) = x4809
            if indomain_v1(id_1)(clauses_1) {
              add_v4(acc, id_1)
            } else {
              acc
            }
          }
          let addreduce : (((Term, Term, Bool), @oset.T[Int64])) -> @oset.T[
            Int64,
          ] raise = fn(
            x4810 : ((Term, Term, Bool), @oset.T[Int64]),
          ) -> @oset.T[Int64] raise {
            let ((l, r, ord), acc_1) = x4810
            let isvalidrewr : (Term) -> Bool raise = fn(
              x4811 : Term,
            ) -> Bool raise {
              let tm = x4811
              match
                total((x4812 : Term) => matchterms(empty_v13(), l, x4812), tm) {
                None => false
                Some(sub) =>
                  if ord {
                    true
                  } else {
                    let tm_p = subst(normalize(sub))(r)
                    let t4813 = Some(1L)
                    order_1(tm)(tm_p) == t4813
                  }
              }
            }
            let addred : (((Clause1, Term), @oset.T[Int64])) -> @oset.T[Int64] raise = fn(
              x4814 : ((Clause1, Term), @oset.T[Int64]),
            ) -> @oset.T[Int64] raise {
              let ((cl, tm_1), acc_2) = x4814
              let id_2 = id(cl)
              if member_v1(id_2)(acc_2) {
                acc_2
              } else if !isvalidrewr(tm_1) {
                acc_2
              } else {
                add_v4(acc_2, id_2)
              }
            }
            foldl(addred, acc_1, matched(allsubterms_1, l))
          }
          let addequation : (
            ((((Term, Term), Thm), Orient?)) -> @list.List[(Term, Term, Bool)] raise,
          ) -> (((Int64, @oset.T[Int64])) -> @oset.T[Int64] raise) raise = fn(
            x4815 : ((((Term, Term), Thm), Orient?)) -> @list.List[
              (Term, Term, Bool),
            ] raise,
          ) -> (((Int64, @oset.T[Int64])) -> @oset.T[Int64] raise) raise {
            let redexresidues_1 = x4815
            fn(x4816 : (Int64, @oset.T[Int64])) -> @oset.T[Int64] raise {
              let (id_3, acc_3) = x4816
              match peek_v11(rewrite_1)(id_3) {
                None => acc_3
                Some(eqn_ort) =>
                  foldl(addreduce, acc_3, redexresidues_1(eqn_ort))
              }
            }
          }
          let addordered : ((Int64, @oset.T[Int64])) -> @oset.T[Int64] raise = addequation(fn(
              x4817 : (((Term, Term), Thm), Orient?),
            ) -> @list.List[(Term, Term, Bool)] raise {
              orderedredexresidues(x4817.0, x4817.1)
            },
          )
          let addunordered : ((Int64, @oset.T[Int64])) -> @oset.T[Int64] raise = addequation(fn(
              x4818 : (((Term, Term), Thm), Orient?),
            ) -> @list.List[(Term, Term, Bool)] raise {
              unorderedredexresidues(x4818.0, x4818.1)
            },
          )
          let ids = empty_v4()
          let ids_1 = foldl(addrewr, ids, rewr_ids)
          let ids_2 = foldl(addordered, ids_1, rewr_ids)
          let ids_3 = foldl(addunordered, ids_2, rewr_ids)
          ids_3
        }
        _ => raise @lib.MatchFailure("tscript.ml:8797")
      }
  }
}

///|
/// `choose_clause_rewritables`
pub fn[TA] choose_clause_rewritables(
  x4819 : Active,
  x4820 : @list.List[TA],
) -> Bool raise {
  let active = x4819
  let ids = x4820
  let t4821 = Int::to_int64(@lib.length(ids))
  size_v25(active) <= t4821
}

///|
/// `rewritables`
pub fn rewritables(
  x4822 : Active,
  x4823 : @list.List[Int64],
) -> @oset.T[Key] raise {
  let active = x4822
  let ids = x4823
  if choose_clause_rewritables(active, ids) {
    clause_rewritables(active)
  } else {
    rewrite_rewritables(active, ids)
  }
}

///|
/// `delete`
pub fn delete_v17(x4824 : Active, x4825 : @oset.T[Int64]) -> Active raise {
  let active = x4824
  let ids = x4825
  if null_v5(ids) {
    active
  } else {
    let idpred : (Int64) -> Bool raise = fn(x4826 : Int64) -> Bool raise {
      let id_1 = x4826
      !member_v1(id_1)(ids)
    }
    let clausepred : (Clause1) -> Bool raise = fn(
      x4827 : Clause1,
    ) -> Bool raise {
      let cl = x4827
      idpred(id(cl))
    }
    match active {
      Active::Active(
        {
          parameters,
          clauses: clauses_1,
          units,
          rewrite: rewrite_1,
          subsume,
          literals: literals_1,
          equations: equations_1,
          subterms: subterms_1,
          allsubterms: allsubterms_1
        }
      ) => {
        let clauses_2 = filter_v3(fn(x4834 : (Int64, Clause1)) -> Bool raise {
          let x_2 = x4834
          idpred(x_2.0)
        })(clauses_1)
        let subsume_1 = filter_v30(clausepred, subsume)
        let literals_2 = filter_v29(
          fn(
            x4835 : (Clause1, (Bool, (String, @list.List[Term]))),
          ) -> Bool raise {
            ((x4828, x4829) => cp1_l(clausepred, x4828, x4829))(
              x4835.0,
              x4835.1,
            )
          },
          literals_1,
        )
        let equations_2 = filter_v27(fn(
          x4836 : (Clause1, (Bool, (String, @list.List[Term])), Orient, Term),
        ) -> Bool raise {
          ((x4830, x4831, x4832, x4833) => {
            cp1_4_l(clausepred, x4830, x4831, x4832, x4833)
          })(x4836.0, x4836.1, x4836.2, x4836.3)
        })(equations_1)
        let subterms_2 = filter_v27(fn(
          x4837 : (
            Clause1,
            (Bool, (String, @list.List[Term])),
            @list.List[Int64],
            Term,
          ),
        ) -> Bool raise {
          ((x4830, x4831, x4832, x4833) => {
            cp1_4_l(clausepred, x4830, x4831, x4832, x4833)
          })(x4837.0, x4837.1, x4837.2, x4837.3)
        })(subterms_1)
        let allsubterms_2 = filter_v27(fn(
          x4838 : (Clause1, Term),
        ) -> Bool raise {
          ((x4828, x4829) => cp1_l(clausepred, x4828, x4829))(x4838.0, x4838.1)
        })(allsubterms_1)
        Active::Active(ActiveT::{
          parameters,
          clauses: clauses_2,
          units,
          rewrite: rewrite_1,
          subsume: subsume_1,
          literals: literals_2,
          equations: equations_2,
          subterms: subterms_2,
          allsubterms: allsubterms_2,
        })
      }
    }
  }
}

///|
fn[TA] cp1_l(
  clausepred : (Clause1) -> Bool raise,
  x4828 : Clause1,
  x4829 : TA,
) -> Bool raise {
  let (x, _) = (x4828, x4829)
  clausepred(x)
}

///|
fn[TB, TC, TD] cp1_4_l(
  clausepred : (Clause1) -> Bool raise,
  x4830 : Clause1,
  x4831 : TB,
  x4832 : TC,
  x4833 : TD,
) -> Bool raise {
  let (x_1, _, _, _) = (x4830, x4831, x4832, x4833)
  clausepred(x_1)
}

///|
/// `extract_rewritables`
pub fn extract_rewritables(
  x4839 : Active,
) -> (Active, @list.List[Clause1]) raise {
  match x4839 {
    Active::Active({ clauses: clauses_1, rewrite: rewrite_1, .. }) as active =>
      if isreduced(rewrite_1) {
        (active, @list.List([]))
      } else {
        let (rewrite_2, ids) = reduce_p(rewrite_1)
        let active_1 = setrewrite(active, rewrite_2)
        let ids_1 = rewritables(active_1, ids)
        let cls = transform_v4(
          (x4840 : Int64) => get_v1(clauses_1, x4840),
          ids_1,
        )
        (delete_v17(active_1, ids_1), cls)
      }
  }
}

///|
/// `prefactor_simplify`
pub fn prefactor_simplify(
  x4841 : Active,
  x4842 : Subsume[Clause1],
) -> ((Clause1) -> Clause1? raise) raise {
  let active = x4841
  let subsume = x4842
  match active {
    Active::Active({ parameters, units, rewrite: rewrite_1, .. }) =>
      match parameters {
        { prefactor, .. } => simplify_v2(prefactor, units, rewrite_1, subsume)
        _ => raise @lib.MatchFailure("tscript.ml:8948")
      }
  }
}

///|
/// `postfactor_simplify`
pub fn postfactor_simplify(
  x4844 : Active,
  x4845 : Subsume[Clause1],
) -> ((Clause1) -> Clause1? raise) raise {
  let active = x4844
  let subsume = x4845
  match active {
    Active::Active({ parameters, units, rewrite: rewrite_1, .. }) =>
      match parameters {
        { postfactor, .. } => simplify_v2(postfactor, units, rewrite_1, subsume)
        _ => raise @lib.MatchFailure("tscript.ml:8955")
      }
  }
}

///|
/// sort_utilitywise
fn step_219() -> Unit raise {
  let utility : (Clause1) -> Int64 raise = fn(x4847 : Clause1) -> Int64 raise {
    let cl = x4847
    match size_v16(literals(cl)) {
      0L => -1L
      1L => if isuniteq(thm(cl)) { 0L } else { 1L }
      n => n
    }
  }
  sort_utilitywise_c.set((x4850 : @list.List[Clause1]) => {
    sortmap(
      utility,
      fn(x4848 : Int64) -> ((Int64) -> Int64 raise) raise {
        fn(x4849 : Int64) -> Int64 raise { intcompare(x4848, x4849) }
      },
      x4850,
    )
  })
}

///|
let sort_utilitywise_c : @lib.Cell[
  (@list.List[Clause1]) -> @list.List[Clause1] raise,
] = @lib.Cell::new("sort_utilitywise")

///|
/// `sort_utilitywise`
pub fn sort_utilitywise(x : @list.List[Clause1]) -> @list.List[Clause1] raise {
  sort_utilitywise_c.get()(x)
}

///|
/// `post_factor`
pub fn post_factor(
  x4851 : Clause1,
  x4852 : (Active, Subsume[Clause1], @list.List[Clause1]),
) -> (Active, Subsume[Clause1], @list.List[Clause1]) raise {
  let (cl, (active, subsume, acc) as active_subsume_acc) = (x4851, x4852)
  match postfactor_simplify(active, subsume)(cl) {
    None => active_subsume_acc
    Some(cl_p) =>
      if equalthms(cl_p, cl) {
        let active_1 = addfactorclause(active, cl)
        let subsume_1 = addsubsume(subsume, cl)
        let acc_1 = acc.prepend(cl)
        (active_1, subsume_1, acc_1)
      } else {
        factor1(cl_p, active_subsume_acc)
      }
  }
}

///|
/// `factor1`
pub fn factor1(
  x4853 : Clause1,
  x4854 : (Active, Subsume[Clause1], @list.List[Clause1]),
) -> (Active, Subsume[Clause1], @list.List[Clause1]) raise {
  let (cl_1, active_subsume_acc_1) = (x4853, x4854)
  let cls = sort_utilitywise(factor_v1(cl_1).prepend(cl_1))
  foldl(
    fn(
      x4855 : (Clause1, (Active, Subsume[Clause1], @list.List[Clause1])),
    ) -> (Active, Subsume[Clause1], @list.List[Clause1]) raise {
      post_factor(x4855.0, x4855.1)
    },
    active_subsume_acc_1,
    cls,
  )
}

///|
/// `pre_factor`
pub fn pre_factor(
  x4856 : Clause1,
  x4857 : (Active, Subsume[Clause1], @list.List[Clause1]),
) -> (Active, Subsume[Clause1], @list.List[Clause1]) raise {
  let (cl, (active, subsume, _) as active_subsume_acc) = (x4856, x4857)
  match prefactor_simplify(active, subsume)(cl) {
    None => active_subsume_acc
    Some(cl_1) => factor1(cl_1, active_subsume_acc)
  }
}

///|
/// `factor'`
pub fn factor_p_v1(
  x4858 : Active,
  x4859 : @list.List[Clause1],
  x4860 : @list.List[Clause1],
) -> (Active, @list.List[Clause1]) raise {
  let active = x4858
  let acc = x4859
  match x4860 {
    Empty => (active, @lib.rev(acc))
    cls => {
      let cls_1 = sort_utilitywise(cls)
      let subsume = getsubsume(active)
      let (active_1, _, acc_1) = foldl(
        fn(
          x4861 : (Clause1, (Active, Subsume[Clause1], @list.List[Clause1])),
        ) -> (Active, Subsume[Clause1], @list.List[Clause1]) raise {
          pre_factor(x4861.0, x4861.1)
        },
        (active, subsume, acc),
        cls_1,
      )
      let (active_2, cls_2) = extract_rewritables(active_1)
      factor_p_v1(active_2, acc_1, cls_2)
    }
  }
}

///|
/// `factor`
pub fn factor_v2(
  x4862 : Active,
  x4863 : @list.List[Clause1],
) -> (Active, @list.List[Clause1]) raise {
  let active = x4862
  let cls = x4863
  factor_p_v1(active, @list.List([]), cls)
}

///|
/// `mk_clause`
pub fn mk_clause(x4864 : Parameters4, x4865 : Thm) -> Clause1 raise {
  let params = x4864
  let th = x4865
  mk(ClauseInfo::{ parameters: params, id: newid(()), thm: th, })
}

///|
/// `newActive`
pub fn newactive(
  x4866 : Parameters5,
  x4867 : AxCjThm,
) -> (Active, AxCjCl) raise {
  let parameters = x4866
  match x4867 {
    { axioms_thm, conjecture_thm } =>
      match parameters {
        { clause: clause_1, .. } => {
          let mk_clause_1 : (Thm) -> Clause1 raise = (x4868 : Thm) => {
            mk_clause(clause_1, x4868)
          }
          let active = empty_v27(parameters)
          let (active_1, axioms) = factor_v2(
            active,
            @lib.map(mk_clause_1, axioms_thm),
          )
          let (active_2, conjecture) = factor_v2(
            active_1,
            @lib.map(mk_clause_1, conjecture_thm),
          )
          (active_2, AxCjCl::{ axioms_cl: axioms, conjecture_cl: conjecture, })
        }
        _ => raise @lib.MatchFailure("tscript.ml:9037")
      }
  }
}

///|
/// `add`
pub fn add_v31(
  x4869 : Active,
  x4870 : Clause1,
) -> (Active, @list.List[Clause1]) raise {
  let active = x4869
  let cl = x4870
  match simplifyactive(maxsimplify(), active)(cl) {
    None => (active, @list.List([]))
    Some(cl_p) =>
      if iscontradiction_v1(cl_p) {
        (active, @list.List([cl_p]))
      } else if !equalthms(cl, cl_p) {
        factor_v2(active, @list.List([cl_p]))
      } else {
        let active_1 = addclause(active, cl)
        let cl_1 = freshvars_v2(cl)
        let cls = deduce(active_1, cl_1)
        let (active_2, cls_1) = factor_v2(active_1, cls)
        (active_2, cls_1)
      }
  }
}

///|
/// `weight`
pub type Weight1 = Double

///|
/// `modelParameters`
pub(all) struct ModelParameters {
  model : Parameters
  initialperturbations : Int64
  maxchecks : Int64?
  perturbations : Int64
  weight : Weight1
}

///|
/// `parameters`
pub(all) struct Parameters6 {
  symbolsweight : Weight1
  variablesweight : Weight1
  literalsweight : Weight1
  modelsp : @list.List[ModelParameters]
}

///|
/// `distance`
pub type Distance = Double

///|
/// `waiting_t`
pub(all) struct WaitingT {
  parameters : Parameters6
  clauses : Heap[(Weight1, (Distance, Clause1))]
  models : @list.List[Model]
}

///|
/// `waiting`
pub(all) enum Waiting {
  Waiting(WaitingT)
}

///|
/// defaultModels
fn step_220() -> Unit raise {
  defaultmodels_c.set(
    @list.List([
      ModelParameters::{
        model: default(),
        initialperturbations: 100L,
        maxchecks: Some(20L),
        perturbations: 0L,
        weight: 1.0,
      },
    ]),
  )
}

///|
let defaultmodels_c : @lib.Cell[@list.List[ModelParameters]] = @lib.Cell::new(
  "defaultModels",
)

///|
/// `defaultModels`
pub fn defaultmodels() -> @list.List[ModelParameters] {
  defaultmodels_c.get()
}

///|
/// default
fn step_221() -> Unit raise {
  default_v4_c.set(Parameters6::{
    symbolsweight: 1.0,
    variablesweight: 1.0,
    literalsweight: 1.0,
    modelsp: defaultmodels(),
  })
}

///|
let default_v4_c : @lib.Cell[Parameters6] = @lib.Cell::new("default")

///|
/// `default`
pub fn default_v4() -> Parameters6 {
  default_v4_c.get()
}

///|
/// `size`
pub fn size_v26(x4871 : Waiting) -> Int64 raise {
  match x4871 {
    Waiting::Waiting({ clauses: clauses_1, .. }) => size_v5(clauses_1)
  }
}

///|
/// `toString`
pub fn tostring_v16(x4872 : Waiting) -> String raise {
  let w = x4872
  "Waiting{" + (Int64::to_string(size_v26(w)) + "}")
}

///|
/// `modelClause`
pub type ModelClause = (Set2, Clause)

///|
/// `mkModelClause`
pub fn mkmodelclause(x4873 : Clause1) -> (@oset.T[Name], Clause) raise {
  let cl = x4873
  let lits = literals(cl)
  let fvs = freevars_v5(lits)
  (fvs, lits)
}

///|
/// mkModelClauses
fn step_222() -> Unit raise {
  mkmodelclauses_c.set(x4874 => @lib.map(mkmodelclause, x4874))
}

///|
let mkmodelclauses_c : @lib.Cell[
  (@list.List[Clause1]) -> @list.List[(@oset.T[Name], Clause)] raise,
] = @lib.Cell::new("mkModelClauses")

///|
/// `mkModelClauses`
pub fn mkmodelclauses(
  x : @list.List[Clause1],
) -> @list.List[(@oset.T[Name], Clause)] raise {
  mkmodelclauses_c.get()(x)
}

///|
/// `perturbModel`
pub fn perturbmodel(
  x4875 : Model,
  x4876 : @list.List[
    (@oset.T[String], @oset.T[(Bool, (String, @list.List[Term]))]),
  ],
) -> ((Int64) -> Unit raise) raise {
  let vm = x4875
  let cls = x4876
  if null(cls) {
    fn(x4878 : Int64) -> Unit raise { () }
  } else {
    let vn = Size::{ size: msize(vm), }
    let perturbclause_1 : (
      (@oset.T[String], @oset.T[(Bool, (String, @list.List[Term]))]),
    ) -> Unit raise = fn(
      x4879 : (@oset.T[String], @oset.T[(Bool, (String, @list.List[Term]))]),
    ) -> Unit raise {
      let (fv, cl) = x4879
      let vv = randomvaluation(vn)(fv)
      if interpretclause(vm, vv, cl) {
        ()
      } else {
        perturbclause(vm, vv, cl)
      }
    }
    let perturbclauses : (Unit) -> Unit raise = fn(x4880 : Unit) -> Unit raise {
      let _ = x4880
      @lib.do_list(perturbclause_1, cls)
    }
    fn(x4881 : Int64) -> Unit raise {
      let n = x4881
      @lib.funpow(@lib.int63_to_int(n), perturbclauses, ())
    }
  }
}

///|
/// `initialModel`
pub fn initialmodel(
  x4882 : @list.List[
    (@oset.T[String], @oset.T[(Bool, (String, @list.List[Term]))]),
  ],
  x4883 : @list.List[
    (@oset.T[String], @oset.T[(Bool, (String, @list.List[Term]))]),
  ],
  x4884 : ModelParameters,
) -> Model raise {
  let axioms = x4882
  let conjecture = x4883
  let parm = x4884
  match parm {
    { model, initialperturbations, .. } => {
      let m = newmodel(model)
      match perturbmodel(m, conjecture)(initialperturbations) {
        _ =>
          match perturbmodel(m, axioms)(initialperturbations) {
            _ => m
          }
      }
    }
    _ => raise @lib.MatchFailure("tscript.ml:9178")
  }
}

///|
/// `checkModels`
pub fn checkmodels(
  x4885 : @list.List[ModelParameters],
  x4886 : @list.List[Model],
  x4887 : (@oset.T[String], @oset.T[(Bool, (String, @list.List[Term]))]),
) -> Double raise {
  let parms = x4885
  let models = x4886
  let (fv, cl) = x4887
  let check_1 : (((ModelParameters, Model), Double)) -> Double raise = fn(
    x4888 : ((ModelParameters, Model), Double),
  ) -> Double raise {
    let ((parm, model), z) = x4888
    match parm {
      { maxchecks, weight, .. } => {
        let n = maxchecks
        let (vt, vf) = check(
          fn(
            x4889 : Model,
          ) -> ((Valuation) -> ((@oset.T[(Bool, (String, @list.List[Term]))]) -> Bool raise) raise) raise {
            fn(
              x4890 : Valuation,
            ) -> ((@oset.T[(Bool, (String, @list.List[Term]))]) -> Bool raise) raise {
              fn(
                x4891 : @oset.T[(Bool, (String, @list.List[Term]))],
              ) -> Bool raise {
                interpretclause(x4889, x4890, x4891)
              }
            }
          },
          n,
          model,
          fv,
          cl,
        )
        let t4892 = @lib.float_pow(Int64::to_double(@lib.add63(vt, vf)), weight)
        (1.0 + Int64::to_double(vt) / t4892) * z
      }
      _ => raise @lib.MatchFailure("tscript.ml:9188")
    }
  }
  foldl(check_1, 1.0, @lib.zip(parms, models))
}

///|
/// `perturbModels`
pub fn perturbmodels(
  x4893 : @list.List[ModelParameters],
  x4894 : @list.List[Model],
  x4895 : @list.List[
    (@oset.T[String], @oset.T[(Bool, (String, @list.List[Term]))]),
  ],
) -> Unit raise {
  let parms = x4893
  let models = x4894
  let cls = x4895
  let perturb_1 : ((ModelParameters, Model)) -> Unit raise = fn(
    x4896 : (ModelParameters, Model),
  ) -> Unit raise {
    let (parm, model) = x4896
    match parm {
      { perturbations, .. } => perturbmodel(model, cls)(perturbations)
      _ => raise @lib.MatchFailure("tscript.ml:9199")
    }
  }
  @lib.do_list(perturb_1, @lib.zip(parms, models))
}

///|
/// `clauseSymbols`
pub fn clausesymbols(
  x4897 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> Double raise {
  let cl = x4897
  Int64::to_double(typedsymbols_v3(cl))
}

///|
/// `clauseVariables`
pub fn clausevariables(
  x4898 : @oset.T[(Bool, (String, @list.List[Term]))],
) -> Double raise {
  let cl = x4898
  Int64::to_double(@lib.add63(size_v7(freevars_v5(cl)), 1L))
}

///|
/// `clauseLiterals`
pub fn[TA] clauseliterals(x4899 : @oset.T[TA]) -> Double raise {
  let cl = x4899
  Int64::to_double(size_v16(cl))
}

///|
/// `clausePriority`
pub fn clausepriority(x4900 : Clause1) -> Double raise {
  let cl = x4900
  1.0e-12 * Int64::to_double(id(cl))
}

///|
/// `clauseWeight`
pub fn clauseweight(
  x4901 : Parameters6,
  x4902 : @list.List[Model],
  x4903 : Double,
  x4904 : (@oset.T[String], @oset.T[(Bool, (String, @list.List[Term]))]),
  x4905 : Clause1,
) -> Double raise {
  let _ as parm = x4901
  let mods = x4902
  let dist = x4903
  let mcl = x4904
  let cl = x4905
  match parm {
    { symbolsweight, variablesweight, literalsweight, modelsp } => {
      let lits = literals(cl)
      let symbolsw = @lib.float_pow(clausesymbols(lits), symbolsweight)
      let variablesw = @lib.float_pow(clausevariables(lits), variablesweight)
      let literalsw = @lib.float_pow(clauseliterals(lits), literalsweight)
      let modelsw = checkmodels(modelsp, mods, mcl)
      let weight = dist * symbolsw * variablesw * literalsw * modelsw
      let weight_1 = weight + clausepriority(cl)
      weight_1
    }
    _ => raise @lib.MatchFailure("tscript.ml:9223")
  }
}

///|
/// `add'`
pub fn add_p(
  x4906 : Waiting,
  x4907 : Double,
  x4908 : @list.List[
    (@oset.T[String], @oset.T[(Bool, (String, @list.List[Term]))]),
  ],
  x4909 : @list.List[Clause1],
) -> Waiting raise {
  let waiting = x4906
  let dist = x4907
  let mcls = x4908
  let cls = x4909
  match waiting {
    Waiting::Waiting({ parameters, clauses: clauses_1, models }) =>
      match parameters {
        { modelsp: modelparameters, .. } => {
          let dist_1 = dist +
            @lib.float_log(Int64::to_double(Int::to_int64(@lib.length(cls))))
          let addcl : (
            (
              (
                (@oset.T[String], @oset.T[(Bool, (String, @list.List[Term]))]),
                Clause1,
              ),
              Heap[(Double, (Double, Clause1))],
            ),
          ) -> Heap[(Double, (Double, Clause1))] raise = fn(
            x4910 : (
              (
                (@oset.T[String], @oset.T[(Bool, (String, @list.List[Term]))]),
                Clause1,
              ),
              Heap[(Double, (Double, Clause1))],
            ),
          ) -> Heap[(Double, (Double, Clause1))] raise {
            let ((mcl, cl), acc) = x4910
            let weight = clauseweight(parameters, models, dist_1, mcl, cl)
            add_v5(acc)((weight, (dist_1, cl)))
          }
          let clauses_2 = foldl(addcl, clauses_1, @lib.zip(mcls, cls))
          match perturbmodels(modelparameters, models, mcls) {
            _ =>
              Waiting::Waiting(WaitingT::{
                parameters,
                clauses: clauses_2,
                models,
              })
          }
        }
        _ => raise @lib.MatchFailure("tscript.ml:9257")
      }
  }
}

///|
/// `add`
pub fn add_v32(
  x4911 : Waiting,
  x4912 : (Double, @list.List[Clause1]),
) -> Waiting raise {
  let waiting = x4911
  let (dist, cls) = x4912
  if null(cls) {
    waiting
  } else {
    let waiting_1 = add_p(waiting, dist, mkmodelclauses(cls), cls)
    waiting_1
  }
}

///|
/// `cmp`
pub fn[TA, TB] cmp_v1(
  x4913 : (Double, TA),
  x4914 : (Double, TB),
) -> Int64 raise {
  let (_ as w1, _) = x4913
  let (w2, _) = x4914
  Int::to_int64(@lib.compare(w1, w2))
}

///|
/// `empty`
pub fn empty_v28(
  x4915 : Parameters6,
  x4916 : @list.List[
    (@oset.T[String], @oset.T[(Bool, (String, @list.List[Term]))]),
  ],
  x4917 : @list.List[
    (@oset.T[String], @oset.T[(Bool, (String, @list.List[Term]))]),
  ],
) -> Waiting raise {
  let parameters = x4915
  let axioms = x4916
  let conjecture = x4917
  match parameters {
    { modelsp: modelparameters, .. } => {
      let clauses_1 = newheap(fn(
        x4918 : (Double, (Double, Clause1)),
      ) -> (((Double, (Double, Clause1))) -> Int64 raise) raise {
        fn(x4919 : (Double, (Double, Clause1))) -> Int64 raise {
          cmp_v1(x4918, x4919)
        }
      })
      let models = @lib.map(
        (x4920 : ModelParameters) => initialmodel(axioms, conjecture, x4920),
        modelparameters,
      )
      Waiting::Waiting(WaitingT::{ parameters, clauses: clauses_1, models, })
    }
    _ => raise @lib.MatchFailure("tscript.ml:9301")
  }
}

///|
/// `newWaiting`
pub fn newwaiting(x4921 : Parameters6, x4922 : AxCjCl) -> Waiting raise {
  let parameters = x4921
  match x4922 {
    { axioms_cl, conjecture_cl } => {
      let maxioms = mkmodelclauses(axioms_cl)
      let mconjecture = mkmodelclauses(conjecture_cl)
      let waiting = empty_v28(parameters, maxioms, mconjecture)
      if null(axioms_cl) && null(conjecture_cl) {
        waiting
      } else {
        add_p(
          waiting,
          0.0,
          maxioms.concat(mconjecture),
          axioms_cl.concat(conjecture_cl),
        )
      }
    }
  }
}

///|
/// `remove`
pub fn remove_v21(x4923 : Waiting) -> ((Distance, Clause1), Waiting)? raise {
  match x4923 {
    Waiting::Waiting({ parameters, clauses: clauses_1, models }) =>
      if null_v6(clauses_1) {
        None
      } else {
        let ((_, dcl), clauses_2) = remove_v5(clauses_1)
        let waiting = Waiting::Waiting(WaitingT::{
          parameters,
          clauses: clauses_2,
          models,
        })
        Some((dcl, waiting))
      }
  }
}

///|
/// `parameters`
pub(all) struct Parameters7 {
  activep : Parameters5
  waitingp : Parameters6
}

///|
/// `resolution_t`
pub(all) struct ResolutionT {
  parameters : Parameters7
  active : Active
  waiting : Waiting
}

///|
/// `resolution`
pub(all) enum Resolution {
  Resolution(ResolutionT)
}

///|
/// default
fn step_223() -> Unit raise {
  default_v5_c.set(Parameters7::{
    activep: default_v3(),
    waitingp: default_v4(),
  })
}

///|
let default_v5_c : @lib.Cell[Parameters7] = @lib.Cell::new("default")

///|
/// `default`
pub fn default_v5() -> Parameters7 {
  default_v5_c.get()
}

///|
/// `newResolution`
pub fn newresolution(x4924 : Parameters7, x4925 : AxCjThm) -> Resolution raise {
  let parameters = x4924
  let ths = x4925
  match parameters {
    { activep: activeparm, waitingp: waitingparm } => {
      let (active, cls) = newactive(activeparm, ths)
      let waiting = newwaiting(waitingparm, cls)
      Resolution::Resolution(ResolutionT::{ parameters, active, waiting, })
    }
    _ => raise @lib.MatchFailure("tscript.ml:9377")
  }
}

///|
/// `active`
pub fn active(x4926 : Resolution) -> Active raise {
  match x4926 {
    Resolution::Resolution({ active: a, .. }) => a
  }
}

///|
/// `waiting`
pub fn waiting(x4927 : Resolution) -> Waiting raise {
  match x4927 {
    Resolution::Resolution({ waiting: w, .. }) => w
  }
}

///|
/// `decision`
#derive(Eq, Debug)
pub(all) enum Decision {
  Contradiction(Thm)
  Satisfiable(@list.List[Thm])
}

///|
pub extend Decision with Eq::{not_equal, equal}

///|
pub extend Decision with Debug::{to_repr}

///|
pub extend Decision with @lib.OCompare::{ocompare}

///|
pub extend Decision with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_Decision(x : Decision) -> Int {
  match x {
    Contradiction(_) => 1000000
    Satisfiable(_) => 1000001
  }
}

///|
pub impl @lib.OCompare for Decision with fn ocompare(self, other) {
  match (self, other) {
    (Contradiction(a0), Contradiction(b0)) => @lib.compare(a0, b0)
    (Satisfiable(a0), Satisfiable(b0)) => @lib.compare(a0, b0)
    _ => ocaml_rank_Decision(self).compare(ocaml_rank_Decision(other))
  }
}

///|
pub impl @lib.OHash for Decision with fn ohash_visit(self, h) {
  match self {
    Contradiction(a0) => {
      h.block(0, 1)
      h.field(a0)
    }
    Satisfiable(a0) => {
      h.block(1, 1)
      h.field(a0)
    }
  }
}

///|
/// `state`
pub(all) enum State {
  Decided(Decision)
  Undecided(Resolution)
}

///|
/// `iterate`
pub fn iterate(x4928 : Resolution) -> State raise {
  let res = x4928
  match res {
    Resolution::Resolution(
      { parameters, active: active_1, waiting: waiting_1 }
    ) =>
      match remove_v21(waiting_1) {
        None => {
          let sat = Decision::Satisfiable(@lib.map(thm, saturation(active_1)))
          State::Decided(sat)
        }
        Some(((d, cl), waiting_2)) =>
          if iscontradiction_v1(cl) {
            State::Decided(Decision::Contradiction(thm(cl)))
          } else {
            let (active_2, cls) = add_v31(active_1, cl)
            let waiting_3 = add_v32(waiting_2, (d, cls))
            let res_1 = Resolution::Resolution(ResolutionT::{
              parameters,
              active: active_2,
              waiting: waiting_3,
            })
            State::Undecided(res_1)
          }
      }
  }
}

///|
/// `loop`
pub fn loop_(x4929 : Resolution) -> Decision raise {
  let res = x4929
  match iterate(res) {
    State::Decided(dec) => dec
    State::Undecided(res_1) => loop_(res_1)
  }
}

///|
/// `loop`
pub fn loop__v1(x4930 : Resolution) -> Decision? raise {
  let res = x4930
  match iterate(res) {
    State::Decided(dec) => Some(dec)
    State::Undecided(res_1) => loop__v1(res_1)
  }
}

///|
/// `run`
pub fn run(x4931 : @list.List[Thm]) -> Thm raise {
  let rules = x4931
  let ths = AxCjThm::{ axioms_thm: rules, conjecture_thm: @list.List([]), }
  let res = newresolution(default_v5(), ths)
  match loop__v1(res) {
    None => raise Failure("metis: timeout")
    Some(Decision::Contradiction(thm_1)) => thm_1
    Some(Decision::Satisfiable(_)) =>
      raise Failure("metis: found satisfiable assignment")
  }
}

///|
/// `print_varandtype`
pub fn print_varandtype(
  x4932 : @pp.Formatter,
  x4933 : @kernel.Term,
) -> Unit raise {
  let fmt = x4932
  let tm = x4933
  let (hop, args) = @basics.strip_comb(tm)
  let s = @printer.name_of(hop)
  let ty = @kernel.type_of(hop)
  if @kernel.is_var(hop) && args == @list.List([]) {
    @pp.Formatter::print_string(fmt, "(")
    @pp.Formatter::print_string(fmt, s)
    @pp.Formatter::print_string(fmt, ":")
    @printer.pp_print_type(fmt, ty)
    @pp.Formatter::print_string(fmt, ")")
  } else {
    @lib.failure()
  }
}

///|
let show_types_c : @lib.Cell[(Unit) -> Unit raise] = @lib.Cell::new(
  "show_types",
)

///|
/// `show_types`
pub fn show_types(x : Unit) -> Unit raise {
  show_types_c.get()(x)
}

///|
let hide_types_c : @lib.Cell[(Unit) -> Unit raise] = @lib.Cell::new(
  "hide_types",
)

///|
/// `hide_types`
pub fn hide_types(x : Unit) -> Unit raise {
  hide_types_c.get()(x)
}

///|
/// show_types, hide_types
fn step_224() -> Unit raise {
  let (show_types, hide_types) = (
    fn(x4934 : Unit) -> Unit raise {
      let _ = x4934
      @printer.install_user_printer("Show Types", print_varandtype)
    },
    fn(x4935 : Unit) -> Unit raise {
      let _ = x4935
      @printer.delete_user_printer("Show Types") catch {
        Failure(_) =>
          raise Failure("hide_types: " + "Types are already hidden.")
        e => raise e
      }
    },
  )
  show_types_c.set(show_types)
  hide_types_c.set(hide_types)
}

///|
/// `mk_negp`
pub fn mk_negp(x4936 : @preterm.Preterm) -> @preterm.Preterm raise {
  let pt = x4936
  @preterm.Preterm::Combp(@preterm.preterm_of_term(@term_syntax.parse_term("op_tilde")), pt)
}

///|
/// `mk_eqp`
pub fn mk_eqp(
  x4937 : @preterm.Preterm,
  x4938 : @preterm.Preterm,
) -> @preterm.Preterm raise {
  let (ps, pt) = (x4937, x4938)
  @preterm.Preterm::Combp(
    @preterm.Preterm::Combp(@preterm.Preterm::Constp("=", @preterm.dpty), ps),
    pt,
  )
}

///|
/// `mk_conjp`
pub fn mk_conjp(
  x4939 : @preterm.Preterm,
  x4940 : @preterm.Preterm,
) -> @preterm.Preterm raise {
  let (ps, pt) = (x4939, x4940)
  @preterm.Preterm::Combp(
    @preterm.Preterm::Combp(
      @preterm.preterm_of_term(@term_syntax.parse_term("op_slash_bslash")),
      ps,
    ),
    pt,
  )
}

///|
/// `mk_disjp`
pub fn mk_disjp(
  x4941 : @preterm.Preterm,
  x4942 : @preterm.Preterm,
) -> @preterm.Preterm raise {
  let (ps, pt) = (x4941, x4942)
  @preterm.Preterm::Combp(
    @preterm.Preterm::Combp(
      @preterm.preterm_of_term(@term_syntax.parse_term("op_bslash_slash")),
      ps,
    ),
    pt,
  )
}

///|
/// `list_mk_combp`
pub fn list_mk_combp(
  x4943 : @preterm.Preterm,
  x4944 : @list.List[@preterm.Preterm],
) -> @preterm.Preterm raise {
  let (h, t) = (x4943, x4944)
  @lib.rev_itlist(
    fn(
      x4945 : @preterm.Preterm,
      x4946 : @preterm.Preterm,
    ) -> @preterm.Preterm raise {
      let x = x4945
      let acc = x4946
      @preterm.Preterm::Combp(acc, x)
    },
    t,
    h,
  )
}

///|
/// metis.ml:9519
fn step_225() -> Unit raise {
  let t4950 = @preterm.Preterm::Varp(
    "3",
    @preterm.Pretype::Ptycon("", @list.List([])),
  )
  let t4949 = @preterm.Preterm::Varp(
    "2",
    @preterm.Pretype::Ptycon("", @list.List([])),
  )
  let t4951 = @preterm.Preterm::Combp(
    @preterm.Preterm::Combp(
      @preterm.Preterm::Varp("1", @preterm.Pretype::Ptycon("", @list.List([]))),
      t4949,
    ),
    t4950,
  )
  let t4947 = @preterm.Preterm::Varp("3", @preterm.dpty)
  let t4948 = @list.List([@preterm.Preterm::Varp("2", @preterm.dpty), t4947])
  if list_mk_combp(@preterm.Preterm::Varp("1", @preterm.dpty), t4948) == t4951 {
    ()
  } else {
    raise @lib.AssertFailure("tscript.ml:9519:0")
  }
}

///|
/// `list_mk_disjp`
pub fn list_mk_disjp(
  x4952 : @list.List[@preterm.Preterm],
) -> @preterm.Preterm raise {
  match x4952 {
    Empty => @preterm.preterm_of_term(@term_syntax.parse_term("false"))
    More(h, tail=t) =>
      @lib.itlist(
        (x4954 : @preterm.Preterm, x4955 : @preterm.Preterm) => {
          @lib.curry(
            fn(
              x4953 : (@preterm.Preterm, @preterm.Preterm),
            ) -> @preterm.Preterm raise {
              mk_disjp(x4953.0, x4953.1)
            },
            x4954,
            x4955,
          )
        },
        t,
        h,
      )
  }
}

///|
/// `unconst_preterm`
pub fn unconst_preterm(x4956 : @preterm.Preterm) -> @preterm.Preterm raise {
  match x4956 {
    @preterm.Preterm::Varp(s, pty) => @preterm.Preterm::Varp(s, pty)
    @preterm.Preterm::Constp(s_1, pty_1) => @preterm.Preterm::Varp(s_1, pty_1)
    @preterm.Preterm::Combp(l, r) => {
      let t4957 = unconst_preterm(r)
      @preterm.Preterm::Combp(unconst_preterm(l), t4957)
    }
    @preterm.Preterm::Typing(ptm, pty_2) =>
      @preterm.Preterm::Typing(unconst_preterm(ptm), pty_2)
    _ => raise Failure("unconst_preterm")
  }
}

///|
/// `env_of_preterm`
pub fn env_of_preterm(
  x4958 : @preterm.Preterm,
) -> @list.List[(String, @preterm.Pretype)] raise {
  match x4958 {
    @preterm.Preterm::Varp(s, pty) => @list.List([(s, pty)])
    @preterm.Preterm::Constp(s_1, pty_1) => @list.List([])
    @preterm.Preterm::Combp(l, r) => {
      let t4959 = env_of_preterm(r)
      env_of_preterm(l).concat(t4959)
    }
    @preterm.Preterm::Typing(ptm, pty_2) => env_of_preterm(ptm)
    _ => raise Failure("env_of_preterm")
  }
}

///|
/// env_of_th
fn step_226() -> Unit raise {
  env_of_th_c.set(fn(
    x4963 : @kernel.Thm,
  ) -> @list.List[(String, @preterm.Pretype)] raise {
    (fn(x4961 : @kernel.Term) -> @list.List[(String, @preterm.Pretype)] raise {
      env_of_preterm(
        (fn(x4960 : @kernel.Term) -> @preterm.Preterm raise {
          @preterm.preterm_of_term(x4960)
        })(x4961),
      )
    })(
      (fn(x4962 : @kernel.Thm) -> @kernel.Term raise { @kernel.concl(x4962) })(
        x4963,
      ),
    )
  })
}

///|
let env_of_th_c : @lib.Cell[
  (@kernel.Thm) -> @list.List[(String, @preterm.Pretype)] raise,
] = @lib.Cell::new("env_of_th")

///|
/// `env_of_th`
pub fn env_of_th(
  x : @kernel.Thm,
) -> @list.List[(String, @preterm.Pretype)] raise {
  env_of_th_c.get()(x)
}

///|
/// env_of_ths
fn step_227() -> Unit raise {
  env_of_ths_c.set(fn(
    x4966 : @list.List[@kernel.Thm],
  ) -> @list.List[(String, @preterm.Pretype)] raise {
    (fn(
      x4964 : @list.List[@list.List[(String, @preterm.Pretype)]],
    ) -> @list.List[(String, @preterm.Pretype)] raise {
      @lib.flat(x4964)
    })((x4965 => @lib.map(env_of_th, x4965))(x4966))
  })
}

///|
let env_of_ths_c : @lib.Cell[
  (@list.List[@kernel.Thm]) -> @list.List[(String, @preterm.Pretype)] raise,
] = @lib.Cell::new("env_of_ths")

///|
/// `env_of_ths`
pub fn env_of_ths(
  x : @list.List[@kernel.Thm],
) -> @list.List[(String, @preterm.Pretype)] raise {
  env_of_ths_c.get()(x)
}

///|
let reset_consts_c : @lib.Cell[(Unit) -> Unit raise] = @lib.Cell::new(
  "reset_consts",
)

///|
/// `reset_consts`
pub fn reset_consts(x : Unit) -> Unit raise {
  reset_consts_c.get()(x)
}

///|
let fol_of_const_c : @lib.Cell[(@kernel.Term) -> Int64 raise] = @lib.Cell::new(
  "fol_of_const",
)

///|
/// `fol_of_const`
pub fn fol_of_const(x : @kernel.Term) -> Int64 raise {
  fol_of_const_c.get()(x)
}

///|
let hol_of_const_c : @lib.Cell[(Int64) -> @kernel.Term raise] = @lib.Cell::new(
  "hol_of_const",
)

///|
/// `hol_of_const`
pub fn hol_of_const(x : Int64) -> @kernel.Term raise {
  hol_of_const_c.get()(x)
}

///|
/// reset_consts, fol_of_const, hol_of_const
fn step_228() -> Unit raise {
  let (reset_consts, fol_of_const, hol_of_const) = (
    @meson.reset_consts, @meson.fol_of_const, @meson.hol_of_const,
  )
  reset_consts_c.set(reset_consts)
  fol_of_const_c.set(fol_of_const)
  hol_of_const_c.set(hol_of_const)
}

///|
/// preterm_of_const
fn step_229() -> Unit raise {
  preterm_of_const_c.set(fn(x4970 : String) -> @preterm.Preterm raise {
    (fn(x4968 : Int64) -> @preterm.Preterm raise {
      (fn(x4967 : @kernel.Term) -> @preterm.Preterm raise {
        @preterm.preterm_of_term(x4967)
      })(hol_of_const(x4968))
    })(
      (fn(x4969 : String) -> Int64 raise { @lib.int63_of_string(x4969) })(x4970),
    )
  })
}

///|
let preterm_of_const_c : @lib.Cell[(String) -> @preterm.Preterm raise] = @lib.Cell::new(
  "preterm_of_const",
)

///|
/// `preterm_of_const`
pub fn preterm_of_const(x : String) -> @preterm.Preterm raise {
  preterm_of_const_c.get()(x)
}

///|
/// `prefix`
pub fn prefix_v1(x4971 : String) -> String raise {
  let s = x4971
  "__" + s
}

///|
/// `preterm_of_fol_term`
pub fn preterm_of_fol_term(x4972 : Term) -> @preterm.Preterm raise {
  match x4972 {
    Term::Var(x) => @preterm.Preterm::Varp(prefix_v1(x), @preterm.dpty)
    Term::Fn((f, args)) => {
      let pf = preterm_of_const(f)
      let pargs = @lib.map(preterm_of_fol_term, args)
      list_mk_combp(pf, pargs)
    }
  }
}

///|
/// `preterm_of_predicate`
pub fn preterm_of_predicate(x4973 : String) -> @preterm.Preterm raise {
  match x4973 {
    "=" => @preterm.Preterm::Constp("=", @preterm.dpty)
    p => preterm_of_const(p)
  }
}

///|
/// `preterm_of_atom`
pub fn preterm_of_atom(
  x4974 : String,
  x4975 : @list.List[Term],
) -> @preterm.Preterm raise {
  let (p, args) = (x4974, x4975)
  let pp = preterm_of_predicate(p)
  let pargs = @lib.map(preterm_of_fol_term, args)
  let t4976 = @preterm.pretype_of_type(@kernel.bool_ty)
  @preterm.Preterm::Typing(list_mk_combp(pp, pargs), t4976)
}

///|
/// `preterm_of_literal`
pub fn preterm_of_literal(
  x4977 : Bool,
  x4978 : (String, @list.List[Term]),
) -> @preterm.Preterm raise {
  let (pol, fat) = (x4977, x4978)
  let pat = preterm_of_atom(fat.0, fat.1)
  if pol {
    pat
  } else {
    mk_negp(pat)
  }
}

///|
/// `preterm_of_eq`
pub fn preterm_of_eq(x4979 : Term, x4980 : Term) -> @preterm.Preterm raise {
  let (s, t) = (x4979, x4980)
  let t4981 = preterm_of_fol_term(t)
  mk_eqp(preterm_of_fol_term(s), t4981)
}

///|
/// `typecheck`
pub fn typecheck(
  x4982 : @list.List[(String, @preterm.Pretype)],
) -> ((@preterm.Preterm) -> @kernel.Term raise) raise {
  let env = x4982
  fn(x4986 : @preterm.Preterm) -> @kernel.Term raise {
    (fn(x4985 : @preterm.Preterm) -> @kernel.Term raise {
      @preterm.term_of_preterm(
        ((x4984 : @preterm.Preterm) => @preterm.retypecheck(env, x4984))(x4985),
      )
    })(unconst_preterm(x4986))
  }
}

///|
/// `typecheckl`
pub fn typecheckl(
  x4987 : @list.List[(String, @preterm.Pretype)],
  x4988 : @list.List[@preterm.Preterm],
) -> @list.List[@kernel.Term] raise {
  let env = x4987
  match x4988 {
    Empty => @list.List([])
    xs => {
      let t4989 = typecheck(env)
      @lib.op_bar_gt(@lib.op_bar_gt(list_mk_disjp(xs), t4989), fn(
        x4990 : @kernel.Term,
      ) -> @list.List[@kernel.Term] raise {
        @basics.disjuncts(x4990)
      })
    }
  }
}

///|
/// `hol_of_term`
pub fn hol_of_term(
  x4991 : @list.List[(String, @preterm.Pretype)],
) -> ((Term) -> @kernel.Term raise) raise {
  let env = x4991
  let t4993 = typecheck(env)
  fn(x4994 : Term) -> @kernel.Term raise { t4993(preterm_of_fol_term(x4994)) }
}

///|
/// `hol_of_atom`
pub fn hol_of_atom(
  x4995 : @list.List[(String, @preterm.Pretype)],
) -> (((String, @list.List[Term])) -> @kernel.Term raise) raise {
  let env = x4995
  let t4998 = typecheck(env)
  fn(x4999 : (String, @list.List[Term])) -> @kernel.Term raise {
    t4998(
      (fn(x4997 : (String, @list.List[Term])) -> @preterm.Preterm raise {
        preterm_of_atom(x4997.0, x4997.1)
      })(x4999),
    )
  }
}

///|
/// `hol_of_literal`
pub fn hol_of_literal(
  x5000 : @list.List[(String, @preterm.Pretype)],
) -> (((Bool, (String, @list.List[Term]))) -> @kernel.Term raise) raise {
  let env = x5000
  let t5003 = typecheck(env)
  fn(x5004 : (Bool, (String, @list.List[Term]))) -> @kernel.Term raise {
    t5003(
      (fn(
        x5002 : (Bool, (String, @list.List[Term])),
      ) -> @preterm.Preterm raise {
        preterm_of_literal(x5002.0, x5002.1)
      })(x5004),
    )
  }
}

///|
/// `hol_of_clause`
pub fn hol_of_clause(
  x5005 : @list.List[(String, @preterm.Pretype)],
) -> ((@list.List[(Bool, (String, @list.List[Term]))]) -> @kernel.Term raise) raise {
  let env = x5005
  let t5007 = typecheck(env)
  fn(
    x5011 : @list.List[(Bool, (String, @list.List[Term]))],
  ) -> @kernel.Term raise {
    (fn(x5008 : @list.List[@preterm.Preterm]) -> @kernel.Term raise {
      t5007(list_mk_disjp(x5008))
    })(
      ((x5010 : @list.List[(Bool, (String, @list.List[Term]))]) => {
        @lib.map(
          fn(
            x5009 : (Bool, (String, @list.List[Term])),
          ) -> @preterm.Preterm raise {
            preterm_of_literal(x5009.0, x5009.1)
          },
          x5010,
        )
      })(x5011),
    )
  }
}

///|
/// `hol_of_substitution`
pub fn hol_of_substitution(
  x5012 : @list.List[(String, @preterm.Pretype)],
) -> ((@list.List[(Term, Term)]) -> @list.List[(@kernel.Term, @kernel.Term)] raise) raise {
  let env = x5012
  fn(
    x5019 : @list.List[(Term, Term)],
  ) -> @list.List[(@kernel.Term, @kernel.Term)] raise {
    (fn(
      x5016 : @list.List[@preterm.Preterm],
    ) -> @list.List[(@kernel.Term, @kernel.Term)] raise {
      ((x5014 : @list.List[@kernel.Term]) => @lib.map(@kernel.dest_eq, x5014))(
        ((x5015 : @list.List[@preterm.Preterm]) => typecheckl(env, x5015))(
          x5016,
        ),
      )
    })(
      ((x5018 : @list.List[(Term, Term)]) => {
        @lib.map(
          fn(x5017 : (Term, Term)) -> @preterm.Preterm raise {
            preterm_of_eq(x5017.0, x5017.1)
          },
          x5018,
        )
      })(x5019),
    )
  }
}

///|
/// `hol_of_term_path`
pub fn hol_of_term_path(
  x5020 : Term,
  x5021 : @list.List[Int64],
) -> (Term, String) raise {
  let tm = x5020
  let path = x5021
  match (tm, path) {
    (tm_1, Empty) => (tm_1, "")
    (Term::Fn((f, args)), More(i, tail=is_)) => {
      let arity_1 = Int::to_int64(@lib.length(args))
      if i < arity_1 {
        ()
      } else {
        raise @lib.AssertFailure("tscript.ml:9629:6")
      }
      let (tm_p, path_p) = hol_of_term_path(
        @lib.list_nth(args, @lib.int63_to_int(i)),
        is_,
      )
      let t5022 = "r" + path_p
      (
        tm_p,
        @lib.string_make(@lib.sub63(@lib.sub63(arity_1, i), 1L), 'l') + t5022,
      )
    }
    _ => raise Failure("hol_of_term_path")
  }
}

///|
/// `hol_of_atom_path`
pub fn hol_of_atom_path(
  x5023 : String,
  x5024 : @list.List[Term],
) -> ((@list.List[Int64]) -> (Term, String) raise) raise {
  let (p, args) = (x5023, x5024)
  let t5026 = Term::Fn((p, args))
  (x5027 : @list.List[Int64]) => hol_of_term_path(t5026, x5027)
}

///|
/// `hol_of_literal_path`
pub fn hol_of_literal_path(
  x5028 : (Bool, (String, @list.List[Term])),
  x5029 : @list.List[Int64],
) -> (Term, String) raise {
  let (pol, atom_1) = x5028
  let path = x5029
  let (s, path_1) = hol_of_atom_path(atom_1.0, atom_1.1)(path)
  (s, if pol { path_1 } else { "r" + path_1 })
}

///|
/// verb
fn step_230() -> Unit raise {
  verb_c.set(Ref::{ val: false, })
}

///|
let verb_c : @lib.Cell[Ref[Bool]] = @lib.Cell::new("verb")

///|
/// `verb`
pub fn verb() -> Ref[Bool] {
  verb_c.get()
}

///|
/// `exception Unify`
pub(all) suberror Unify {
  Unify
}

///|
/// `unify_fo_ho_term`
pub fn unify_fo_ho_term(
  x5030 : @list.List[@kernel.Term],
  x5031 : Term,
  x5032 : @kernel.Term,
  x5033 : @list.List[(String, @kernel.Term)],
) -> @list.List[(Name, @kernel.Term)] raise {
  let vars = x5030
  let fat = x5031
  let tm = x5032
  let m = x5033
  if verb().val {
    let t5034 = @printer.string_of_term(tm)
    let t5035 = tostring_v4(fat)
    @pp.std_formatter.print_string(
      "unify_fo_ho_term: fat = " + t5035 + ", tm = " + t5034 + "\n",
    )
    @pp.std_formatter.print_flush()
    ()
  } else {
    ()
  }
  match fat {
    Term::Var(v) if @lib.list_mem_assoc(v, m) => {
      if verb().val {
        @pp.std_formatter.print_string("var_assoc\n")
        @pp.std_formatter.print_flush()
        ()
      } else {
        ()
      }
      let tm_p = @lib.list_assoc(v, m)
      if tm == tm_p {
        m
      } else {
        raise Unify::Unify
      }
    }
    Term::Var(v_1) => {
      if verb().val {
        @pp.std_formatter.print_string("var\n")
        @pp.std_formatter.print_flush()
        ()
      } else {
        ()
      }
      if @kernel.is_var(tm) && !@lib.mem(tm, vars) {
        m.prepend((v_1, tm))
      } else {
        if verb().val {
          @pp.std_formatter.print_string("Unify!\n")
          @pp.std_formatter.print_flush()
          ()
        } else {
          ()
        }
        raise Unify::Unify
      }
    }
    Term::Fn((f, args)) => {
      if verb().val {
        @pp.std_formatter.print_string("fn\n")
        @pp.std_formatter.print_flush()
        ()
      } else {
        ()
      }
      let (hf, hargs) = @basics.strip_comb(tm) catch {
        Failure(_) => raise Unify::Unify
        e => raise e
      }
      if verb().val {
        let t5036 = @printer.string_of_term(hf)
        {
          @pp.std_formatter.print_string("hf = " + t5036 + "\n")
          @pp.std_formatter.print_flush()
          ()
        }
        let t5037 = if @kernel.is_var(hf) { "true" } else { "false" }
        @pp.std_formatter.print_string("is_var: " + t5037 + "\n")
        @pp.std_formatter.print_flush()
        ()
      } else {
        ()
      }
      if @kernel.is_const(hf) || @kernel.is_var(hf) {
        ()
      } else {
        raise @lib.AssertFailure("tscript.ml:9670:6")
      }
      if hf == hol_of_const(@lib.int63_of_string(f)) {
        @lib.itlist2(
          (
            x5038 : Term,
            x5039 : @kernel.Term,
            x5040 : @list.List[(String, @kernel.Term)],
          ) => unify_fo_ho_term(vars, x5038, x5039, x5040),
          args,
          hargs,
          m,
        )
      } else {
        raise Unify::Unify
      }
    }
  }
}

///|
/// `unify_fo_ho_atom`
pub fn unify_fo_ho_atom(
  x5041 : @list.List[@kernel.Term],
  x5042 : (String, @list.List[Term]),
  x5043 : @kernel.Term,
  x5044 : @list.List[(String, @kernel.Term)],
) -> @list.List[(Name, @kernel.Term)] raise {
  let vars = x5041
  let (p, args) = x5042
  let htm = x5043
  let m = x5044
  if p == "=" {
    try {
      let (hl, hr) = @kernel.dest_eq(htm)
      @lib.itlist2(
        (
          x5045 : Term,
          x5046 : @kernel.Term,
          x5047 : @list.List[(String, @kernel.Term)],
        ) => unify_fo_ho_term(vars, x5045, x5046, x5047),
        args,
        @list.List([hl, hr]),
        m,
      )
    } catch {
      Failure(_) => raise Unify::Unify
      e => raise e
    }
  } else {
    unify_fo_ho_term(vars, Term::Fn((p, args)), htm, m)
  }
}

///|
/// `unify_fo_ho_literal`
pub fn unify_fo_ho_literal(
  x5048 : @list.List[@kernel.Term],
  x5049 : (Bool, (String, @list.List[Term])),
  x5050 : @kernel.Term,
  x5051 : @list.List[(String, @kernel.Term)],
) -> @list.List[(Name, @kernel.Term)] raise {
  let vars = x5048
  let (pol, atom_1) = x5049
  let htm = x5050
  let m = x5051
  let htm_p = if pol {
    htm
  } else {
    @basics.dest_neg(htm) catch {
      Failure(_) => raise Unify::Unify
      e => raise e
    }
  }
  unify_fo_ho_atom(vars, atom_1, htm_p, m)
}

///|
/// `FRONT`
pub fn front(
  x5052 : @kernel.Term,
  x5053 : @kernel.Thm,
) -> (@kernel.Thm, @list.List[@kernel.Term]) raise {
  let lit = x5052
  let thm_1 = x5053
  let conc = @kernel.concl(thm_1)
  let disj = @basics.disjuncts(@kernel.concl(thm_1))
  let rest = match
    @lib.partition(
      fn(x5054 : @kernel.Term) -> Bool raise {
        let l = x5054
        l == lit
      },
      disj,
    ) {
    (Empty, _) => raise Failure("FRONT: literal not in disjunction")
    (_, r) => r
  }
  let disj_p = rest.prepend(lit)
  let conc_p = @bool.list_mk_disj(disj_p)
  let eq = @canon.disj_aci_rule(@basics.mk_eq(conc, conc_p))
  (@simp.pure_once_rewrite_rule(@list.List([eq]))(thm_1), rest)
}

///|
/// RESOLVE_N
fn step_231() -> Unit raise {
  let resolve_1 = @class.taut(@term_syntax.parse_term("∀ a : Bool, a → !a → false"))
  let resolve_2l = @class.taut(@term_syntax.parse_term("∀ a : Bool, ∀ b : Bool, a || b → !a → b"))
  let resolve_2r = @class.taut(@term_syntax.parse_term("∀ a : Bool, ∀ c : Bool, a → !a || c → c"))
  let resolve_3 = @class.taut(
    @term_syntax.parse_term("∀ a : Bool, ∀ b : Bool, ∀ c : Bool, a || b → !a || c → b || c"),
  )
  resolve_n_c.set(fn(
    x5055 : @kernel.Term,
  ) -> (((@list.List[@kernel.Term], @list.List[@kernel.Term])) -> @kernel.Thm raise) raise {
    let atom_1 = x5055
    fn(
      x5056 : (@list.List[@kernel.Term], @list.List[@kernel.Term]),
    ) -> @kernel.Thm raise {
      match x5056 {
        (Empty, Empty) => @bool.spec(atom_1, resolve_1)
        (r1, Empty) =>
          @bool.specl(@list.List([atom_1, @bool.list_mk_disj(r1)]), resolve_2l)
        (Empty, r2) =>
          @bool.specl(@list.List([atom_1, @bool.list_mk_disj(r2)]), resolve_2r)
        (r1_1, r2_1) => {
          let t5057 = @bool.list_mk_disj(r2_1)
          @bool.specl(
            @list.List([atom_1, @bool.list_mk_disj(r1_1), t5057]),
            resolve_3,
          )
        }
      }
    }
  })
}

///|
let resolve_n_c : @lib.Cell[
  (@kernel.Term) -> (((@list.List[@kernel.Term], @list.List[@kernel.Term])) -> @kernel.Thm raise) raise,
] = @lib.Cell::new("RESOLVE_N")

///|
/// `RESOLVE_N`
pub fn resolve_n(
  x : @kernel.Term,
) -> (((@list.List[@kernel.Term], @list.List[@kernel.Term])) -> @kernel.Thm raise) raise {
  resolve_n_c.get()(x)
}

///|
/// `RESOLVE`
pub fn resolve_v2(
  x5058 : @kernel.Term,
  x5059 : @kernel.Thm,
  x5060 : @kernel.Thm,
) -> @kernel.Thm raise {
  let atom_1 = x5058
  let th1 = x5059
  let th2 = x5060
  try {
    let (th1_p, r1) = front(atom_1, th1)
    let (th2_p, r2) = front(@bool.mk_neg(atom_1), th2)
    let res = resolve_n(atom_1)((r1, r2))
    @bool.mp(@bool.mp(res, th1_p), th2_p)
  } catch {
    Failure(_) => raise Failure("resolve")
    e => raise e
  }
}

///|
/// DISCH_DISJ
fn step_232() -> Unit raise {
  let impl_not_l = @class.taut(
    @term_syntax.parse_term("∀ a : Bool, ∀ b : Bool, (!a → b) == (a || b)"),
  )
  let impl_not_r = @class.taut(
    @term_syntax.parse_term("∀ a : Bool, ∀ b : Bool, (a → b) == (!a || b)"),
  )
  disch_disj_c.set(fn(
    x5061 : @kernel.Term,
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let tm = x5061
    fn(x5062 : @kernel.Thm) -> @kernel.Thm raise {
      let th = x5062
      let impl_ = @bool.disch(tm, th)
      let (tm_p, impl_not) = (@basics.dest_neg(tm), impl_not_l) catch {
        Failure(_) => (tm, impl_not_r)
        e => raise e
      }
      let eq = @bool.specl(@list.List([tm_p, @kernel.concl(th)]), impl_not)
      @simp.pure_once_rewrite_rule(@list.List([eq]))(impl_)
    }
  })
}

///|
let disch_disj_c : @lib.Cell[
  (@kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
] = @lib.Cell::new("DISCH_DISJ")

///|
/// `DISCH_DISJ`
pub fn disch_disj(
  x : @kernel.Term,
) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
  disch_disj_c.get()(x)
}

///|
/// `DISCH_DISJS`
pub fn disch_disjs(
  x5063 : @list.List[@kernel.Term],
  x5064 : @kernel.Thm,
) -> @kernel.Thm raise {
  let tms = x5063
  let th = x5064
  @lib.itlist(
    fn(x5065 : @kernel.Term, x5066 : @kernel.Thm) -> @kernel.Thm raise {
      let s5067 = disch_disj(x5065)
      s5067(x5066)
    },
    tms,
    th,
  )
}

///|
/// `term_eq_mod_type`
pub fn term_eq_mod_type(
  x5068 : @kernel.Term,
  x5069 : @kernel.Term,
  x5070 : @list.List[(@kernel.HolType, @kernel.HolType)],
) -> @list.List[(@kernel.HolType, @kernel.HolType)]? raise {
  let t1 = x5068
  let t2 = x5069
  let tyinsts = x5070
  try {
    let (_, tminsts, tyinsts_1) = @drule.term_type_unify(
      t1,
      t2,
      (@list.List([]), @list.List([]), tyinsts),
    )
    if metisverb().val {
      let t5071 = Int::to_int64(@lib.length(tminsts))
      {
        @pp.std_formatter.print_string(
          "unified with |tminsts| = " + Int64::to_string(t5071) + "!\n",
        )
        @pp.std_formatter.print_flush()
        ()
      }
      @lib.do_list(
        fn(x5072 : (@kernel.Term, @kernel.Term)) -> Unit raise {
          let (t1_1, t2_1) = x5072
          let t5073 = @printer.string_of_term(t2_1)
          let t5074 = @printer.string_of_term(t1_1)
          @pp.std_formatter.print_string(t5074 + " <- " + t5073 + "\n")
          @pp.std_formatter.print_flush()
          ()
        },
        tminsts,
      )
    } else {
      ()
    }
    if tminsts == @list.List([]) {
      Some(tyinsts_1)
    } else {
      None
    }
  } catch {
    Failure(_) => None
    e => raise e
  }
}

///|
/// `match_elems`
pub fn[TA, TB, TC] match_elems(
  x5075 : (TC) -> ((TB) -> ((TA) -> TA? raise) raise) raise,
  x5076 : TA,
  x5077 : (@list.List[TC], @list.List[TB]),
) -> @list.List[TA] raise {
  let f = x5075
  let m = x5076
  match x5077 {
    (Empty, Empty) => @list.List([m])
    (Empty, _) => @list.List([])
    (More(x, tail=xs), ys) =>
      @lib.op_bar_gt(
        @lib.map(
          fn(x5078 : TB) -> @list.List[TA] raise {
            let y = x5078
            match f(x)(y)(m) {
              Some(m_p) =>
                match_elems(
                  f,
                  m_p,
                  (
                    xs,
                    @lib.list_filter(
                      fn(x5079 : TB) -> Bool raise { !physical_equal(y, x5079) },
                      ys,
                    ),
                  ),
                )
              None => @list.List([])
            }
          },
          ys,
        ),
        fn(x5080 : @list.List[@list.List[TA]]) -> @list.List[TA] raise {
          @lib.flat(x5080)
        },
      )
  }
}

///|
/// `match_fo_ho_clause`
pub fn match_fo_ho_clause(
  x5081 : @list.List[@kernel.Term],
) -> (((@list.List[(Bool, (Name, @list.List[Term]))], @list.List[@kernel.Term])) -> @list.List[
  @list.List[(Name, @kernel.Term)],
] raise) raise {
  let vars = x5081
  (
    x5086 : (
      @list.List[(Bool, (String, @list.List[Term]))],
      @list.List[@kernel.Term],
    ),
  ) => {
    match_elems(
      fn(
        x5083 : (Bool, (String, @list.List[Term])),
      ) -> ((@kernel.Term) -> ((@list.List[(String, @kernel.Term)]) -> @list.List[
        (String, @kernel.Term),
      ]? raise) raise) raise {
        let ft = x5083
        fn(
          x5084 : @kernel.Term,
        ) -> ((@list.List[(String, @kernel.Term)]) -> @list.List[
          (String, @kernel.Term),
        ]? raise) raise {
          let ht = x5084
          fn(
            x5085 : @list.List[(String, @kernel.Term)],
          ) -> @list.List[(String, @kernel.Term)]? raise {
            let m = x5085
            Some(unify_fo_ho_literal(vars, ft, ht, m)) catch {
              Unify::Unify => None
              e => raise e
            }
          }
        }
      },
      @list.List([]),
      x5086,
    )
  }
}

///|
/// string_of_tminst
fn step_233() -> Unit raise {
  string_of_tminst_c.set(fn(
    x5091 : @list.List[(@kernel.Term, @kernel.Term)],
  ) -> String raise {
    (fn(x5087 : @list.List[String]) -> String raise {
      @lib.string_concat(", ", x5087)
    })(
      ((x5090 : @list.List[(@kernel.Term, @kernel.Term)]) => {
        @lib.map(
          fn(x5088 : (@kernel.Term, @kernel.Term)) -> String raise {
            let (tm, v) = x5088
            let t5089 = " <- " + @printer.string_of_term(v)
            @printer.string_of_term(tm) + t5089
          },
          x5090,
        )
      })(x5091),
    )
  })
}

///|
let string_of_tminst_c : @lib.Cell[
  (@list.List[(@kernel.Term, @kernel.Term)]) -> String raise,
] = @lib.Cell::new("string_of_tminst")

///|
/// `string_of_tminst`
pub fn string_of_tminst(
  x : @list.List[(@kernel.Term, @kernel.Term)],
) -> String raise {
  string_of_tminst_c.get()(x)
}

///|
/// string_of_tyinst
fn step_234() -> Unit raise {
  string_of_tyinst_c.set(fn(
    x5096 : @list.List[(@kernel.HolType, @kernel.HolType)],
  ) -> String raise {
    (fn(x5092 : @list.List[String]) -> String raise {
      @lib.string_concat(", ", x5092)
    })(
      ((x5095 : @list.List[(@kernel.HolType, @kernel.HolType)]) => {
        @lib.map(
          fn(x5093 : (@kernel.HolType, @kernel.HolType)) -> String raise {
            let (ty, v) = x5093
            let t5094 = " <- " + @printer.string_of_type(v)
            @printer.string_of_type(ty) + t5094
          },
          x5095,
        )
      })(x5096),
    )
  })
}

///|
let string_of_tyinst_c : @lib.Cell[
  (@list.List[(@kernel.HolType, @kernel.HolType)]) -> String raise,
] = @lib.Cell::new("string_of_tyinst")

///|
/// `string_of_tyinst`
pub fn string_of_tyinst(
  x : @list.List[(@kernel.HolType, @kernel.HolType)],
) -> String raise {
  string_of_tyinst_c.get()(x)
}

///|
/// `string_of_instantiation`
pub fn[TA] string_of_instantiation(
  x5097 : TA,
  x5098 : @list.List[(@kernel.Term, @kernel.Term)],
  x5099 : @list.List[(@kernel.HolType, @kernel.HolType)],
) -> String raise {
  let (it, tminst, tyinst) = (x5097, x5098, x5099)
  let t5100 = "], [" + (string_of_tyinst(tyinst) + "])")
  "([" + (string_of_tminst(tminst) + t5100)
}

///|
/// `reorient_tysubst`
pub fn reorient_tysubst(
  x5101 : @list.List[@kernel.HolType],
  x5102 : @list.List[(@kernel.HolType, @kernel.HolType)],
) -> @list.List[(@kernel.HolType, @kernel.HolType)] raise {
  let vars = x5101
  let sub = x5102
  let sub_p = @lib.map(
    fn(
      x5103 : (@kernel.HolType, @kernel.HolType),
    ) -> (@kernel.HolType, @kernel.HolType) raise {
      let (ty, v) = x5103
      if @lib.mem(v, vars) && @kernel.is_vartype(ty) {
        (v, ty)
      } else {
        (ty, v)
      }
    },
    sub,
  )
  @lib.map(
    fn(
      x5104 : (@kernel.HolType, @kernel.HolType),
    ) -> (@kernel.HolType, @kernel.HolType) raise {
      let (ty_1, v_1) = x5104
      (@basics.tysubst(sub_p, ty_1), v_1)
    },
    sub_p,
  )
}

///|
/// `hol_of_thm`
pub fn hol_of_thm(
  x5105 : @list.List[@kernel.Thm],
  x5106 : Thm,
) -> @kernel.Thm raise {
  let axioms = x5105
  let fth = x5106
  if metisverb().val {
    let t5107 = tostring_v8(fth)
    @pp.std_formatter.print_string("hol_of_thm: " + t5107 + "\n")
    @pp.std_formatter.print_flush()
    ()
  } else {
    ()
  }
  let env = env_of_ths(axioms)
  let hth = match thmtoinference(fth) {
    Inference1::Axiom(clause_1) => {
      let clausel = tolist_v16(clause_1)
      let maxs = @firstorder.concat_map(
        fn(
          x5108 : @kernel.Thm,
        ) -> @list.List[(@list.List[(String, @kernel.Term)], @kernel.Thm)] raise {
          let ax = x5108
          let disjs = @lib.op_bar_gt(@kernel.concl(ax), (x5109 : @kernel.Term) => {
            @lib.striplist(@basics.dest_disj, x5109)
          })
          let tmvars = @kernel.freesl(@kernel.hyp(ax))
          let ms = match_fo_ho_clause(tmvars)((clausel, disjs))
          @lib.map(
            fn(
              x5110 : @list.List[(String, @kernel.Term)],
            ) -> (@list.List[(String, @kernel.Term)], @kernel.Thm) raise {
              let m = x5110
              (m, ax)
            },
            ms,
          )
        },
        axioms,
      )
      if Int::to_int64(@lib.length(maxs)) > 0L {
        ()
      } else {
        raise @lib.AssertFailure("tscript.ml:9802:6")
      }
      let tminst : (@list.List[(String, @kernel.Term)]) -> @list.List[
        (@kernel.Term, @kernel.Term),
      ] raise = x5113 => {
        @lib.map(
          fn(
            x5111 : (String, @kernel.Term),
          ) -> (@kernel.Term, @kernel.Term) raise {
            let (v, tm) = x5111
            let t5112 = @kernel.type_of(tm)
            (@kernel.mk_var(prefix_v1(v), t5112), tm)
          },
          x5113,
        )
      }
      if metisverb().val {
        let t5114 = Int::to_int64(@lib.length(maxs))
        @pp.std_formatter.print_string(
          "length maxs = " + Int64::to_string(t5114) + "\n",
        )
        @pp.std_formatter.print_flush()
        ()
      } else {
        ()
      }
      if metisverb().val {
        @lib.do_list(
          fn(
            x5115 : (@list.List[(String, @kernel.Term)], @kernel.Thm),
          ) -> Unit raise {
            let (m_1, ax_1) = x5115
            let t5116 = string_of_tminst(tminst(m_1))
            let t5117 = @printer.string_of_thm(ax_1)
            @pp.std_formatter.print_string(
              "max: " + t5117 + " with m = " + t5116 + "\n",
            )
            @pp.std_formatter.print_flush()
            ()
          },
          maxs,
        )
      } else {
        ()
      }
      let (m_2, ax_2) = @lib.hd(maxs)
      @kernel.inst_rule(tminst(m_2), ax_2)
    }
    Inference1::Subst(fsub, fth1) => {
      let th1 = hol_of_thm(axioms, fth1)
      if metisverb().val {
        let t5118 = @printer.string_of_thm(th1)
        @pp.std_formatter.print_string("subst with th1 = " + t5118 + "\n")
        @pp.std_formatter.print_flush()
        ()
      } else {
        ()
      }
      let fsubl = tolist_v10(fsub)
      if metisverb().val {
        @pp.std_formatter.print_string("before substitution lifting\n")
        @pp.std_formatter.print_flush()
        ()
      } else {
        ()
      }
      let t5120 = hol_of_substitution(env)
      let hsub = @lib.op_bar_gt(
        @lib.map(
          fn(x5119 : (String, Term)) -> (Term, Term) raise {
            let (v_1, t) = x5119
            (t, Term::Var(v_1))
          },
          fsubl,
        ),
        t5120,
      )
      if metisverb().val {
        let t5121 = string_of_tminst(hsub)
        @pp.std_formatter.print_string("subst: " + t5121 + "\n")
        @pp.std_formatter.print_flush()
        ()
      } else {
        ()
      }
      let tyinst = @lib.itlist(
        fn(
          x5122 : (@kernel.Term, @kernel.Term),
          x5123 : @list.List[(@kernel.HolType, @kernel.HolType)],
        ) -> @list.List[(@kernel.HolType, @kernel.HolType)] raise {
          let (t_1, v_2) = x5122
          let m_3 = x5123
          let v_p_1 = @lib.find(
            fn(x5124 : @kernel.Term) -> Bool raise {
              let v_p = x5124
              let t5125 = @printer.name_of(v_2)
              @printer.name_of(v_p) == t5125
            },
            @kernel.frees(@kernel.concl(th1)),
          )
          let t5126 = @kernel.type_of(v_p_1)
          @drule.type_unify(@kernel.type_of(v_2), t5126, m_3)
        },
        hsub,
        @list.List([]),
      )
      let tminst_1 = @lib.map(
        fn(
          x5127 : (@kernel.Term, @kernel.Term),
        ) -> (@kernel.Term, @kernel.Term) raise {
          let (t_2, v_3) = x5127
          let t5128 = @kernel.inst(tyinst, v_3)
          (@kernel.inst(tyinst, t_2), t5128)
        },
        hsub,
      )
      if metisverb().val {
        let t5129 = string_of_instantiation(@list.List([]), tminst_1, tyinst)
        let t5130 = @printer.string_of_thm(th1)
        @pp.std_formatter.print_string(
          "before instantiate of th1 = " + t5130 + " with " + t5129 + "\n",
        )
        @pp.std_formatter.print_flush()
        ()
      } else {
        ()
      }
      @drule.instantiate_rule((@list.List([]), tminst_1, tyinst), th1)
    }
    Inference1::Resolve(atom_1, fth1_1, fth2) => {
      let th1_1 = hol_of_thm(axioms, fth1_1)
      let th2 = hol_of_thm(axioms, fth2)
      let env_1 = env_of_ths(@list.List([th1_1, th2])).concat(env)
      if metisverb().val {
        @lib.do_list(
          fn(x5131 : (String, @preterm.Pretype)) -> Unit raise {
            let (s, pty) = x5131
            let t5132 = @printer.string_of_type(@preterm.type_of_pretype(pty))
            @pp.std_formatter.print_string(s + " <- " + t5132 + "\n")
            @pp.std_formatter.print_flush()
            ()
          },
          env_1,
        )
      } else {
        ()
      }
      if metisverb().val {
        @pp.std_formatter.print_string("before resolving\n")
        @pp.std_formatter.print_flush()
        ()
      } else {
        ()
      }
      if metisverb().val {
        let t5133 = @printer.string_of_thm(th1_1)
        @pp.std_formatter.print_string("th1 = " + t5133 + "\n")
        @pp.std_formatter.print_flush()
        ()
      } else {
        ()
      }
      if metisverb().val {
        let t5134 = @printer.string_of_thm(th2)
        @pp.std_formatter.print_string("th2 = " + t5134 + "\n")
        @pp.std_formatter.print_flush()
        ()
      } else {
        ()
      }
      let tm1 = @lib.op_bar_gt(
        @lib.striplist(@basics.dest_disj, @kernel.concl(th1_1)),
        x5138 => {
          @lib.list_filter(
            fn(x5137 : @kernel.Term) -> Bool raise {
              (fn(x5135 : Bool) -> Bool raise { !x5135 })(
                (fn(x5136 : @kernel.Term) -> Bool raise {
                  @basics.is_neg(x5136)
                })(x5137),
              )
            },
            x5138,
          )
        },
      )
      let tm2 = @lib.op_bar_gt(
        @lib.op_bar_gt(@lib.striplist(@basics.dest_disj, @kernel.concl(th2)), x5140 => {
          @lib.list_filter(
            fn(x5139 : @kernel.Term) -> Bool raise { @basics.is_neg(x5139) },
            x5140,
          )
        }),
        x5141 => @lib.map(@basics.dest_neg, x5141),
      )
      if metisverb().val {
        @lib.do_list(
          fn(x5143 : @kernel.Term) -> Unit raise {
            ((x5142 : String) => {
              @pp.std_formatter.print_string("tm1: " + x5142 + "\n")
              @pp.std_formatter.print_flush()
              ()
            })(@printer.string_of_term(x5143))
          },
          tm1,
        )
      } else {
        ()
      }
      if metisverb().val {
        @lib.do_list(
          fn(x5145 : @kernel.Term) -> Unit raise {
            ((x5144 : String) => {
              @pp.std_formatter.print_string("tm2: " + x5144 + "\n")
              @pp.std_formatter.print_flush()
              ()
            })(@printer.string_of_term(x5145))
          },
          tm2,
        )
      } else {
        ()
      }
      let hatom = hol_of_atom(env_1)(atom_1)
      if metisverb().val {
        let t5146 = @printer.string_of_term(hatom)
        @pp.std_formatter.print_string("hatom: " + t5146 + "\n")
        @pp.std_formatter.print_flush()
        ()
      } else {
        ()
      }
      let cands = @firstorder.concat_map(
        fn(
          x5147 : @kernel.Term,
        ) -> @list.List[@list.List[(@kernel.HolType, @kernel.HolType)]] raise {
          let x = x5147
          match term_eq_mod_type(hatom, x, @list.List([])) {
            None => @list.List([])
            Some(m_4) =>
              @firstorder.filter_map(
                fn(
                  x5148 : @kernel.Term,
                ) -> @list.List[(@kernel.HolType, @kernel.HolType)]? raise {
                  let y = x5148
                  term_eq_mod_type(hatom, y, m_4)
                },
                tm2,
              )
          }
        },
        tm1,
      )
      if metisverb().val {
        let t5149 = Int::to_int64(@lib.length(cands))
        @pp.std_formatter.print_string(
          Int64::to_string(t5149) + " candidates available\n",
        )
        @pp.std_formatter.print_flush()
        ()
      } else {
        ()
      }
      if Int::to_int64(@lib.length(cands)) > 0L {
        ()
      } else {
        raise @lib.AssertFailure("tscript.ml:9847:6")
      }
      let h = @lib.hd(cands)
      if @lib.forall(
          fn(
            x5150 : @list.List[(@kernel.HolType, @kernel.HolType)],
          ) -> Bool raise {
            h == x5150
          },
          cands,
        ) {
        ()
      } else {
        raise @lib.AssertFailure("tscript.ml:9848:6")
      }
      let tyinsts = @lib.hd(cands)
      let tyvars = @lib.op_bar_gt(
        @lib.op_bar_gt(
          @lib.op_bar_gt(
            @lib.map(
              fn(x5151 : @kernel.Thm) -> @list.List[@kernel.Term] raise {
                @kernel.hyp(x5151)
              },
              axioms,
            ),
            fn(
              x5152 : @list.List[@list.List[@kernel.Term]],
            ) -> @list.List[@kernel.Term] raise {
              @lib.flat(x5152)
            },
          ),
          (x5154 : @list.List[@kernel.Term]) => {
            @lib.map(
              fn(x5153 : @kernel.Term) -> @list.List[@kernel.HolType] raise {
                @kernel.type_vars_in_term(x5153)
              },
              x5154,
            )
          },
        ),
        fn(
          x5155 : @list.List[@list.List[@kernel.HolType]],
        ) -> @list.List[@kernel.HolType] raise {
          @lib.flat(x5155)
        },
      )
      if metisverb().val {
        @pp.std_formatter.print_string("Reorienting type substitution ...\n")
        @pp.std_formatter.print_flush()
        ()
      } else {
        ()
      }
      let tyinsts_1 = reorient_tysubst(tyvars, tyinsts)
      if metisverb().val {
        @pp.std_formatter.print_string("Resolving ...\n")
        @pp.std_formatter.print_flush()
        ()
      } else {
        ()
      }
      let t5156 = @kernel.inst_type(tyinsts_1, th2)
      let t5157 = @kernel.inst_type(tyinsts_1, th1_1)
      resolve_v2(@kernel.inst(tyinsts_1, hatom), t5157, t5156)
    }
    Inference1::Refl(term) => @kernel.refl(hol_of_term(env)(term))
    Inference1::Assume(atom_2) =>
      @bool.spec(hol_of_atom(env)(atom_2), @class.excluded_middle())
    Inference1::Equality(flit, fpath, ft) => {
      let hlit = hol_of_literal(env)(flit)
      let (fs, hpath) = hol_of_literal_path(flit, fpath)
      let hs = @basics.follow_path(hpath, hlit)
      let ht = hol_of_term(env)(ft)
      let t5158 = @kernel.type_of(hs)
      let m_5 = @drule.type_unify(@kernel.type_of(ht), t5158, @list.List([]))
      let t5159 = @kernel.inst(m_5, ht)
      let t5160 = @kernel.inst(m_5, hs)
      let (hlit_1, hs_1, ht_1) = (@kernel.inst(m_5, hlit), t5160, t5159)
      if metisverb().val {
        let t5161 = @printer.string_of_type(@kernel.type_of(ht_1))
        let t5162 = @printer.string_of_term(ht_1)
        let t5163 = @printer.string_of_type(@kernel.type_of(hs_1))
        let t5164 = @printer.string_of_term(hs_1)
        {
          @pp.std_formatter.print_string(
            "Trying to replace " +
            t5164 +
            " : " +
            t5163 +
            " with " +
            t5162 +
            " : " +
            t5161 +
            "\n",
          )
          @pp.std_formatter.print_flush()
          ()
        }
        let t5165 = @printer.string_of_term(hlit_1)
        @pp.std_formatter.print_string("In " + t5165 + "\n")
        @pp.std_formatter.print_flush()
        ()
      } else {
        ()
      }
      let heq = @basics.mk_eq(hs_1, ht_1)
      let conv : (@kernel.Term) -> @kernel.Thm raise = @equal.path_conv(
        hpath,
        @simp.pure_once_rewrite_conv(@list.List([@kernel.assume_rule(heq)])),
      )
      let hlit_p = @equal.conv_rule(conv, @kernel.assume_rule(hlit_1))
      if metisverb().val {
        let t5166 = @printer.string_of_thm(hlit_p)
        let t5167 = @printer.string_of_term(hlit_1)
        @pp.std_formatter.print_string(
          "hlit = " + t5167 + ", hlit' = " + t5166 + "\n",
        )
        @pp.std_formatter.print_flush()
        ()
      } else {
        ()
      }
      if hs_1 != ht_1 {
        if @kernel.concl(hlit_p) != hlit_1 {
          ()
        } else {
          raise @lib.AssertFailure("tscript.ml:9882:23")
        }
      } else {
        ()
      }
      disch_disjs(@list.List([heq, hlit_1]), hlit_p) catch {
        Failure(_) => raise Failure("equality")
        e => raise e
      }
    }
  }
  let hth_1 = @equal.conv_rule(@canon.disj_canon_conv, hth)
  if metisverb().val {
    {
      @pp.std_formatter.print_string("hol_of_thm finished\n")
      @pp.std_formatter.print_flush()
      ()
    }
    let t5168 = hol_of_clause(env)
    let hth_p = @lib.op_bar_gt(@lib.op_bar_gt(clause(fth), tolist_v16), t5168)
    let t5169 = @printer.string_of_term(hth_p)
    let t5170 = @printer.string_of_term(@kernel.concl(hth_1))
    @pp.std_formatter.print_string(
      "hol_of_thm returned:\n" + t5170 + "\n for\n" + t5169 + "\n",
    )
    @pp.std_formatter.print_flush()
    ()
  } else {
    ()
  }
  hth_1
}

///|
/// metis_name
fn step_235() -> Unit raise {
  metis_name_c.set(fn(x5171 : Int64) -> String raise { Int64::to_string(x5171) })
}

///|
let metis_name_c : @lib.Cell[(Int64) -> String raise] = @lib.Cell::new(
  "metis_name",
)

///|
/// `metis_name`
pub fn metis_name(x : Int64) -> String raise {
  metis_name_c.get()(x)
}

///|
/// `metis_of_term`
pub fn metis_of_term(
  x5172 : @list.List[@kernel.Term],
  x5173 : @list.List[@kernel.Term],
  x5174 : @kernel.Term,
) -> Term raise {
  let env = x5172
  let consts = x5173
  let tm = x5174
  if @kernel.is_var(tm) && !@lib.mem(tm, consts) {
    Term::Var(metis_name(@meson.fol_of_var(tm)))
  } else {
    let (f, args) = @basics.strip_comb(tm)
    if @lib.mem(f, env) {
      raise Failure("metis_of_term: higher order")
    } else {
      let ff = @meson.fol_of_const(f)
      let t5176 = @lib.map(
        (x5175 : @kernel.Term) => metis_of_term(env, consts, x5175),
        args,
      )
      Term::Fn((metis_name(ff), t5176))
    }
  }
}

///|
/// `metis_of_atom`
pub fn metis_of_atom(
  x5177 : @list.List[@kernel.Term],
  x5178 : @list.List[@kernel.Term],
  x5179 : @kernel.Term,
) -> Atom raise {
  let env = x5177
  let consts = x5178
  let tm = x5179
  try {
    let (l, r) = @kernel.dest_eq(tm)
    let l_p = metis_of_term(env, consts, l)
    let r_p = metis_of_term(env, consts, r)
    mkeq((l_p, r_p))
  } catch {
    Failure(_) => {
      let (f, args) = @basics.strip_comb(tm)
      if @lib.mem(f, env) {
        raise Failure("metis_of_atom: higher order")
      } else {
        let ff = @meson.fol_of_const(f)
        let t5181 = @lib.map(
          (x5180 : @kernel.Term) => metis_of_term(env, consts, x5180),
          args,
        )
        (metis_name(ff), t5181)
      }
    }
    e => raise e
  }
}

///|
/// `metis_of_literal`
pub fn metis_of_literal(
  x5182 : @list.List[@kernel.Term],
  x5183 : @list.List[@kernel.Term],
  x5184 : @kernel.Term,
) -> (Bool, Atom) raise {
  let env = x5182
  let consts = x5183
  let tm = x5184
  let (pol, tm_p) = (false, @basics.dest_neg(tm)) catch {
    Failure(_) => (true, tm)
    e => raise e
  }
  (pol, metis_of_atom(env, consts, tm_p))
}

///|
/// `metis_of_clause`
pub fn metis_of_clause(x5185 : @kernel.Thm) -> Thm raise {
  let th = x5185
  let lconsts = @kernel.freesl(@kernel.hyp(th))
  let tm = @kernel.concl(th)
  let hlits = @basics.disjuncts(tm)
  let flits = @lib.map(
    (x5186 : @kernel.Term) => metis_of_literal(@list.List([]), lconsts, x5186),
    hlits,
  )
  let set = fromlist_v15(flits)
  axiom(set)
}

///|
/// metis_of_clauses
fn step_236() -> Unit raise {
  metis_of_clauses_c.set((x5187 : @list.List[@kernel.Thm]) => {
    @lib.map(metis_of_clause, x5187)
  })
}

///|
let metis_of_clauses_c : @lib.Cell[
  (@list.List[@kernel.Thm]) -> @list.List[Thm] raise,
] = @lib.Cell::new("metis_of_clauses")

///|
/// `metis_of_clauses`
pub fn metis_of_clauses(x : @list.List[@kernel.Thm]) -> @list.List[Thm] raise {
  metis_of_clauses_c.get()(x)
}

///|
/// split_limit
fn step_237() -> Unit raise {
  split_limit_c.set(Ref::{ val: 0L, })
}

///|
let split_limit_c : @lib.Cell[Ref[Int64]] = @lib.Cell::new("split_limit")

///|
/// `split_limit`
pub fn split_limit() -> Ref[Int64] {
  split_limit_c.get()
}

///|
/// `PRINT_TAC`
pub fn print_tac(
  x5188 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
) -> @tactics.Goalstate raise {
  let g = x5188
  @tactics.print_goal(g)
  @tactics.all_tac(g)
}

///|
/// `PRINT_ID_TAC`
pub fn print_id_tac(
  x5189 : String,
  x5190 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
) -> @tactics.Goalstate raise {
  let s = x5189
  let g = x5190
  @pp.print_string(s + "\n")
  print_tac(g)
}

///|
/// `FOL_PREPARE_TAC`
pub fn fol_prepare_tac(
  x5191 : @list.List[@kernel.Thm],
) -> @tactics.Tactic raise {
  let ths = x5191
  let t5236 = @canon.assoc_conv(@theorems.disj_assoc())
  let t5238 = @tactics.rule_assum_tac((x5237 : @kernel.Thm) => {
    @equal.conv_rule(t5236, x5237)
  })
  let t5235 = @tactics.repeat_tac(
    @tactics.first_x_assum((x5234 : @kernel.Thm) => {
      @meson.conjuncts_then_p(
        fn(
          x5231 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s5232 = @tactics.assume_tac(x5231)
          fn(
            x5233 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s5232(x5233)
          }
        },
        x5234,
      )
    }),
  )
  let t5230 = @tactics.rule_assum_tac((x5229 : @kernel.Thm) => {
    @lib.repeat(
      fn(x5228 : @kernel.Thm) -> @kernel.Thm raise {
        let th = x5228
        @bool.spec(
          @basics.genvar(
            @kernel.type_of(@basics.dest_forall(@kernel.concl(th)).0),
          ),
          th,
        )
      },
      x5229,
    )
  })
  let t5225 = @equal.thenc(@canon.prenex_conv, @canon.weak_cnf_conv)
  let t5227 = @tactics.rule_assum_tac((x5226 : @kernel.Thm) => {
    @equal.conv_rule(t5225, x5226)
  })
  let t5223 = split_limit().val
  let t5222 = @tactics.repeat_tac(@tactics.first_x_assum(@tactics.choose_tac))
  let t5219 = @equal.thenc(@canon.nnf_conv, @canon.skolem_conv)
  let t5221 = @tactics.rule_assum_tac((x5220 : @kernel.Thm) => {
    @equal.conv_rule(t5219, x5220)
  })
  let t5218 = @class.refute_then(fn(
    x5215 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s5216 = @tactics.assume_tac(x5215)
    fn(
      x5217 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s5216(x5217)
    }
  })
  let t5214 = @tactics.repeat_tac(
    @tactics.orelse_tac(@tactics.gen_tac, @tactics.disch_tac),
  )
  let t5213 = @tactics.conv_tac(
    @equal.thenc(
      @equal.thenc(
        @equal.thenc(
          @equal.thenc(
            @canon.presimp_conv,
            @equal.top_depth_conv(@equal.beta_conv),
          ),
          @canon.lambda_elim_conv,
        ),
        @canon.conds_celim_conv,
      ),
      @meson.quant_bool_conv,
    ),
  )
  let t5196 = @meson.poly_assume_tac(@lib.map(@bool.gen_all, ths))
  @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.then_tac(
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @class.refute_then(fn(
                                  x5193 : @kernel.Thm,
                                ) -> ((
                                  (
                                    @list.List[(String, @kernel.Thm)],
                                    @kernel.Term,
                                  ),
                                ) -> (
                                  (
                                    @list.List[@kernel.Term],
                                    (
                                      @list.List[(Int64, @kernel.Term)],
                                      @list.List[(@kernel.Term, @kernel.Term)],
                                      @list.List[
                                        (@kernel.HolType, @kernel.HolType),
                                      ],
                                    ),
                                  ),
                                  @list.List[
                                    (
                                      @list.List[(String, @kernel.Thm)],
                                      @kernel.Term,
                                    ),
                                  ],
                                  (
                                    (
                                      @list.List[(Int64, @kernel.Term)],
                                      @list.List[(@kernel.Term, @kernel.Term)],
                                      @list.List[
                                        (@kernel.HolType, @kernel.HolType),
                                      ],
                                    ),
                                    @list.List[@kernel.Thm],
                                  ) -> @kernel.Thm raise,
                                ) raise) raise {
                                  let s5194 = @tactics.assume_tac(x5193)
                                  fn(
                                    x5195 : (
                                      @list.List[(String, @kernel.Thm)],
                                      @kernel.Term,
                                    ),
                                  ) -> (
                                    (
                                      @list.List[@kernel.Term],
                                      (
                                        @list.List[(Int64, @kernel.Term)],
                                        @list.List[(@kernel.Term, @kernel.Term)],
                                        @list.List[
                                          (@kernel.HolType, @kernel.HolType),
                                        ],
                                      ),
                                    ),
                                    @list.List[
                                      (
                                        @list.List[(String, @kernel.Thm)],
                                        @kernel.Term,
                                      ),
                                    ],
                                    (
                                      (
                                        @list.List[(Int64, @kernel.Term)],
                                        @list.List[(@kernel.Term, @kernel.Term)],
                                        @list.List[
                                          (@kernel.HolType, @kernel.HolType),
                                        ],
                                      ),
                                      @list.List[@kernel.Thm],
                                    ) -> @kernel.Thm raise,
                                  ) raise {
                                    s5194(x5195)
                                  }
                                }),
                                t5196,
                              ),
                              fn(
                                x5207 : (
                                  @list.List[(String, @kernel.Thm)],
                                  @kernel.Term,
                                ),
                              ) -> (
                                (
                                  @list.List[@kernel.Term],
                                  (
                                    @list.List[(Int64, @kernel.Term)],
                                    @list.List[(@kernel.Term, @kernel.Term)],
                                    @list.List[
                                      (@kernel.HolType, @kernel.HolType),
                                    ],
                                  ),
                                ),
                                @list.List[
                                  (
                                    @list.List[(String, @kernel.Thm)],
                                    @kernel.Term,
                                  ),
                                ],
                                (
                                  (
                                    @list.List[(Int64, @kernel.Term)],
                                    @list.List[(@kernel.Term, @kernel.Term)],
                                    @list.List[
                                      (@kernel.HolType, @kernel.HolType),
                                    ],
                                  ),
                                  @list.List[@kernel.Thm],
                                ) -> @kernel.Thm raise,
                              ) raise {
                                (fn(
                                  x5206 : (
                                    @list.List[(String, @kernel.Thm)],
                                    @kernel.Term,
                                  ),
                                ) -> ((
                                  (
                                    @list.List[(String, @kernel.Thm)],
                                    @kernel.Term,
                                  ),
                                ) -> (
                                  (
                                    @list.List[@kernel.Term],
                                    (
                                      @list.List[(Int64, @kernel.Term)],
                                      @list.List[(@kernel.Term, @kernel.Term)],
                                      @list.List[
                                        (@kernel.HolType, @kernel.HolType),
                                      ],
                                    ),
                                  ),
                                  @list.List[
                                    (
                                      @list.List[(String, @kernel.Thm)],
                                      @kernel.Term,
                                    ),
                                  ],
                                  (
                                    (
                                      @list.List[(Int64, @kernel.Term)],
                                      @list.List[(@kernel.Term, @kernel.Term)],
                                      @list.List[
                                        (@kernel.HolType, @kernel.HolType),
                                      ],
                                    ),
                                    @list.List[@kernel.Thm],
                                  ) -> @kernel.Thm raise,
                                ) raise) raise {
                                  ((x5204 : @list.List[(String, @kernel.Thm)]) => {
                                    @tactics.map_every(
                                      fn(
                                        x5203 : (String, @kernel.Thm),
                                      ) -> ((
                                        (
                                          @list.List[(String, @kernel.Thm)],
                                          @kernel.Term,
                                        ),
                                      ) -> (
                                        (
                                          @list.List[@kernel.Term],
                                          (
                                            @list.List[(Int64, @kernel.Term)],
                                            @list.List[
                                              (@kernel.Term, @kernel.Term),
                                            ],
                                            @list.List[
                                              (@kernel.HolType, @kernel.HolType),
                                            ],
                                          ),
                                        ),
                                        @list.List[
                                          (
                                            @list.List[(String, @kernel.Thm)],
                                            @kernel.Term,
                                          ),
                                        ],
                                        (
                                          (
                                            @list.List[(Int64, @kernel.Term)],
                                            @list.List[
                                              (@kernel.Term, @kernel.Term),
                                            ],
                                            @list.List[
                                              (@kernel.HolType, @kernel.HolType),
                                            ],
                                          ),
                                          @list.List[@kernel.Thm],
                                        ) -> @kernel.Thm raise,
                                      ) raise) raise {
                                        (fn(
                                          x5201 : @kernel.Thm,
                                        ) -> ((
                                          (
                                            @list.List[(String, @kernel.Thm)],
                                            @kernel.Term,
                                          ),
                                        ) -> (
                                          (
                                            @list.List[@kernel.Term],
                                            (
                                              @list.List[(Int64, @kernel.Term)],
                                              @list.List[
                                                (@kernel.Term, @kernel.Term),
                                              ],
                                              @list.List[
                                                (
                                                  @kernel.HolType,
                                                  @kernel.HolType,
                                                ),
                                              ],
                                            ),
                                          ),
                                          @list.List[
                                            (
                                              @list.List[(String, @kernel.Thm)],
                                              @kernel.Term,
                                            ),
                                          ],
                                          (
                                            (
                                              @list.List[(Int64, @kernel.Term)],
                                              @list.List[
                                                (@kernel.Term, @kernel.Term),
                                              ],
                                              @list.List[
                                                (
                                                  @kernel.HolType,
                                                  @kernel.HolType,
                                                ),
                                              ],
                                            ),
                                            @list.List[@kernel.Thm],
                                          ) -> @kernel.Thm raise,
                                        ) raise) raise {
                                          (fn(
                                            x5197 : @kernel.Term,
                                          ) -> ((
                                            (
                                              @list.List[(String, @kernel.Thm)],
                                              @kernel.Term,
                                            ),
                                          ) -> (
                                            (
                                              @list.List[@kernel.Term],
                                              (
                                                @list.List[
                                                  (Int64, @kernel.Term),
                                                ],
                                                @list.List[
                                                  (@kernel.Term, @kernel.Term),
                                                ],
                                                @list.List[
                                                  (
                                                    @kernel.HolType,
                                                    @kernel.HolType,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            @list.List[
                                              (
                                                @list.List[
                                                  (String, @kernel.Thm),
                                                ],
                                                @kernel.Term,
                                              ),
                                            ],
                                            (
                                              (
                                                @list.List[
                                                  (Int64, @kernel.Term),
                                                ],
                                                @list.List[
                                                  (@kernel.Term, @kernel.Term),
                                                ],
                                                @list.List[
                                                  (
                                                    @kernel.HolType,
                                                    @kernel.HolType,
                                                  ),
                                                ],
                                              ),
                                              @list.List[@kernel.Thm],
                                            ) -> @kernel.Thm raise,
                                          ) raise) raise {
                                            let s5198 = @tactics.undisch_tac(
                                              x5197,
                                            )
                                            fn(
                                              x5199 : (
                                                @list.List[
                                                  (String, @kernel.Thm),
                                                ],
                                                @kernel.Term,
                                              ),
                                            ) -> (
                                              (
                                                @list.List[@kernel.Term],
                                                (
                                                  @list.List[
                                                    (Int64, @kernel.Term),
                                                  ],
                                                  @list.List[
                                                    (@kernel.Term, @kernel.Term),
                                                  ],
                                                  @list.List[
                                                    (
                                                      @kernel.HolType,
                                                      @kernel.HolType,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              @list.List[
                                                (
                                                  @list.List[
                                                    (String, @kernel.Thm),
                                                  ],
                                                  @kernel.Term,
                                                ),
                                              ],
                                              (
                                                (
                                                  @list.List[
                                                    (Int64, @kernel.Term),
                                                  ],
                                                  @list.List[
                                                    (@kernel.Term, @kernel.Term),
                                                  ],
                                                  @list.List[
                                                    (
                                                      @kernel.HolType,
                                                      @kernel.HolType,
                                                    ),
                                                  ],
                                                ),
                                                @list.List[@kernel.Thm],
                                              ) -> @kernel.Thm raise,
                                            ) raise {
                                              s5198(x5199)
                                            }
                                          })(
                                            (fn(
                                              x5200 : @kernel.Thm,
                                            ) -> @kernel.Term raise {
                                              @kernel.concl(x5200)
                                            })(x5201),
                                          )
                                        })(
                                          (fn(
                                            x5202 : (String, @kernel.Thm),
                                          ) -> @kernel.Thm raise {
                                            x5202.1
                                          })(x5203),
                                        )
                                      },
                                      x5204,
                                    )
                                  })(
                                    (fn(
                                      x5205 : (
                                        @list.List[(String, @kernel.Thm)],
                                        @kernel.Term,
                                      ),
                                    ) -> @list.List[(String, @kernel.Thm)] raise {
                                      x5205.0
                                    })(x5206),
                                  )
                                })(x5207)(x5207)
                              },
                            ),
                            @canon.select_elim_tac,
                          ),
                          fn(
                            x5212 : (
                              @list.List[(String, @kernel.Thm)],
                              @kernel.Term,
                            ),
                          ) -> (
                            (
                              @list.List[@kernel.Term],
                              (
                                @list.List[(Int64, @kernel.Term)],
                                @list.List[(@kernel.Term, @kernel.Term)],
                                @list.List[(@kernel.HolType, @kernel.HolType)],
                              ),
                            ),
                            @list.List[
                              (@list.List[(String, @kernel.Thm)], @kernel.Term),
                            ],
                            (
                              (
                                @list.List[(Int64, @kernel.Term)],
                                @list.List[(@kernel.Term, @kernel.Term)],
                                @list.List[(@kernel.HolType, @kernel.HolType)],
                              ),
                              @list.List[@kernel.Thm],
                            ) -> @kernel.Thm raise,
                          ) raise {
                            (fn(
                              x5208 : (
                                @list.List[(String, @kernel.Thm)],
                                @kernel.Term,
                              ),
                            ) -> ((
                              (@list.List[(String, @kernel.Thm)], @kernel.Term),
                            ) -> (
                              (
                                @list.List[@kernel.Term],
                                (
                                  @list.List[(Int64, @kernel.Term)],
                                  @list.List[(@kernel.Term, @kernel.Term)],
                                  @list.List[(@kernel.HolType, @kernel.HolType)],
                                ),
                              ),
                              @list.List[
                                (
                                  @list.List[(String, @kernel.Thm)],
                                  @kernel.Term,
                                ),
                              ],
                              (
                                (
                                  @list.List[(Int64, @kernel.Term)],
                                  @list.List[(@kernel.Term, @kernel.Term)],
                                  @list.List[(@kernel.HolType, @kernel.HolType)],
                                ),
                                @list.List[@kernel.Thm],
                              ) -> @kernel.Thm raise,
                            ) raise) raise {
                              let (asl, w) = x5208
                              @tactics.map_every(
                                fn(
                                  x5210 : @kernel.Term,
                                ) -> ((
                                  (
                                    @list.List[(String, @kernel.Thm)],
                                    @kernel.Term,
                                  ),
                                ) -> (
                                  (
                                    @list.List[@kernel.Term],
                                    (
                                      @list.List[(Int64, @kernel.Term)],
                                      @list.List[(@kernel.Term, @kernel.Term)],
                                      @list.List[
                                        (@kernel.HolType, @kernel.HolType),
                                      ],
                                    ),
                                  ),
                                  @list.List[
                                    (
                                      @list.List[(String, @kernel.Thm)],
                                      @kernel.Term,
                                    ),
                                  ],
                                  (
                                    (
                                      @list.List[(Int64, @kernel.Term)],
                                      @list.List[(@kernel.Term, @kernel.Term)],
                                      @list.List[
                                        (@kernel.HolType, @kernel.HolType),
                                      ],
                                    ),
                                    @list.List[@kernel.Thm],
                                  ) -> @kernel.Thm raise,
                                ) raise) raise {
                                  let v = x5210
                                  @tactics.spec_tac(v, v)
                                },
                                @kernel.frees(w),
                              )
                            })(x5212)(x5212)
                          },
                        ),
                        t5213,
                      ),
                      t5214,
                    ),
                    t5218,
                  ),
                  t5221,
                ),
                t5222,
              ),
              @canon.asm_fol_tac,
            ),
            (x5224 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => {
              @meson.split_tac(t5223, x5224)
            },
          ),
          t5227,
        ),
        t5230,
      ),
      t5235,
    ),
    t5238,
  )
}

///|
/// `without_warnings`
pub fn[TA] without_warnings(x5239 : (Unit) -> TA raise) -> TA raise {
  let f = x5239
  let tiv = @preterm.type_invention_warning.val
  let reset : (Unit) -> Unit raise = fn(x5240 : Unit) -> Unit raise {
    let _ = x5240
    @preterm.type_invention_warning.val = tiv
    ()
  }
  {
    @preterm.type_invention_warning.val = false
    ()
  }
  try {
    let y = f(())
    reset(())
    y
  } catch {
    e => {
      reset(())
      raise e
    }
  }
}

///|
/// `SIMPLE_METIS_REFUTE`
pub fn simple_metis_refute(
  x5241 : @list.List[@kernel.Thm],
) -> @kernel.Thm raise {
  let ths = x5241
  @meson.clear_contrapos_cache(())
  @lib.random_init(0L)
  let rules = metis_of_clauses(ths)
  if metisverb().val {
    {
      @pp.std_formatter.print_string("Original ths:\n")
      @pp.std_formatter.print_flush()
      ()
    }
    @lib.do_list(
      fn(x5243 : @kernel.Thm) -> Unit raise {
        ((x5242 : String) => {
          @pp.std_formatter.print_string(x5242 + "\n")
          @pp.std_formatter.print_flush()
          ()
        })(@printer.string_of_thm(x5243))
      },
      ths,
    )
  } else {
    ()
  }
  let res = run(rules)
  if metisverb().val {
    print_proof(res)
  } else {
    ()
  }
  let ths_1 = @lib.map(
    (x5244 : @kernel.Thm) => @equal.conv_rule(@canon.disj_canon_conv, x5244),
    ths,
  )
  let proof_1 = without_warnings(fn(x5245 : Unit) -> @kernel.Thm raise {
    let _ = x5245
    hol_of_thm(ths_1, res)
  })
  if metisverb().val {
    {
      @pp.std_formatter.print_string("ths:\n")
      @pp.std_formatter.print_flush()
      ()
    }
    @lib.do_list(
      fn(x5246 : @kernel.Thm) -> Unit raise {
        let t = x5246
        @printer.print_thm(t)
        @pp.std_formatter.print_string("\n")
        @pp.std_formatter.print_flush()
        ()
      },
      ths_1,
    )
    {
      @pp.std_formatter.print_string("Metis theorem:\n")
      @pp.std_formatter.print_flush()
      ()
    }
    @printer.print_thm(proof_1)
    @pp.std_formatter.print_string("Metis end.\n")
    @pp.std_formatter.print_flush()
    ()
  } else {
    ()
  }
  let allhyps = @lib.flat(
    @lib.map(
      fn(x5247 : @kernel.Thm) -> @list.List[@kernel.Term] raise {
        @kernel.hyp(x5247)
      },
      ths_1,
    ),
  )
  if @lib.forall(
      fn(x5248 : @kernel.Term) -> Bool raise {
        let h = x5248
        @lib.mem(h, allhyps)
      },
      @kernel.hyp(proof_1),
    ) {
    ()
  } else {
    raise @lib.AssertFailure("tscript.ml:10071:2")
  }
  let t5249 = @term_syntax.parse_term("false")
  if @kernel.concl(proof_1) == t5249 {
    ()
  } else {
    raise @lib.AssertFailure("tscript.ml:10072:2")
  }
  proof_1
}

///|
/// `PURE_METIS_TAC`
pub fn pure_metis_tac(
  x5250 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
) -> @tactics.Goalstate raise {
  let g = x5250
  @meson.reset_vars(())
  @meson.reset_consts(())
  @tactics.orelse_tac(
    @tactics.first_assum(fn(
      x5251 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s5252 = @tactics.contr_tac(x5251)
      fn(
        x5253 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s5252(x5253)
      }
    }),
    fn(
      x5263 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      (fn(
        x5262 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        (fn(
          x5260 : @list.List[(String, @kernel.Thm)],
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          (fn(
            x5257 : @list.List[@kernel.Thm],
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            (fn(
              x5254 : @kernel.Thm,
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              let s5255 = @tactics.accept_tac(x5254)
              fn(
                x5256 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
              ) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise {
                s5255(x5256)
              }
            })(simple_metis_refute(x5257))
          })(
            ((x5259 : @list.List[(String, @kernel.Thm)]) => {
              @lib.map(
                fn(x5258 : (String, @kernel.Thm)) -> @kernel.Thm raise {
                  x5258.1
                },
                x5259,
              )
            })(x5260),
          )
        })(
          (fn(
            x5261 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> @list.List[(String, @kernel.Thm)] raise {
            x5261.0
          })(x5262),
        )
      })(x5263)(x5263)
    },
  )(g)
}

///|
/// `GEN_METIS_TAC`
pub fn gen_metis_tac(x5264 : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  let ths = x5264
  @tactics.then_tac(fol_prepare_tac(ths), pure_metis_tac)
}

///|
/// ASM_METIS_TAC
fn step_238() -> Unit raise {
  asm_metis_tac_c.set(gen_metis_tac)
}

///|
let asm_metis_tac_c : @lib.Cell[
  (@list.List[@kernel.Thm]) -> @tactics.Tactic raise,
] = @lib.Cell::new("ASM_METIS_TAC")

///|
/// `ASM_METIS_TAC`
pub fn asm_metis_tac(x : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  asm_metis_tac_c.get()(x)
}

///|
/// `METIS_TAC`
pub fn metis_tac(x5266 : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  let ths = x5266
  let t5269 = asm_metis_tac(ths)
  @tactics.then_tac(
    @tactics.pop_assum_list(fn(
      x5268 : @list.List[@kernel.Thm],
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      @tactics.all_tac
    }),
    t5269,
  )
}

///|
/// `METIS`
pub fn metis(
  x5270 : @list.List[@kernel.Thm],
  x5271 : @kernel.Term,
) -> @kernel.Thm raise {
  let ths = x5270
  let tm = x5271
  @tactics.prove(tm, metis_tac(ths))
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
  step_3()
  step_4()
  step_5()
  step_6()
  step_7()
  step_8()
  step_9()
  step_10()
  step_11()
  step_12()
  step_13()
  step_14()
  step_15()
  step_16()
  step_17()
  step_18()
  step_19()
  step_20()
  step_21()
  step_22()
  step_23()
  step_24()
  step_25()
  step_26()
  step_27()
  step_28()
  step_29()
  step_30()
  step_31()
  step_32()
  step_33()
  step_34()
  step_35()
  step_36()
  step_37()
  step_38()
  step_39()
  step_40()
  step_41()
  step_42()
  step_43()
  step_44()
  step_45()
  step_46()
  step_47()
  step_48()
  step_49()
  step_50()
  step_51()
  step_52()
  step_53()
  step_54()
  step_55()
  step_56()
  step_57()
  step_58()
  step_59()
  step_60()
  step_61()
  step_62()
  step_63()
  step_64()
  step_65()
  step_66()
  step_67()
  step_68()
  step_69()
  step_70()
  step_71()
  step_72()
  step_73()
  step_74()
  step_75()
  step_76()
  step_77()
  step_78()
  step_79()
  step_80()
  step_81()
  step_82()
  step_83()
  step_84()
  step_85()
  step_86()
  step_87()
  step_88()
  step_89()
  step_90()
  step_91()
  step_92()
  step_93()
  step_94()
  step_95()
  step_96()
  step_97()
  step_98()
  step_99()
  step_100()
  step_101()
  step_102()
  step_103()
  step_104()
  step_105()
  step_106()
  step_107()
  step_108()
  step_109()
  step_110()
  step_111()
  step_112()
  step_113()
  step_114()
  step_115()
  step_116()
  step_117()
  step_118()
  step_119()
  step_120()
  step_121()
  step_122()
  step_123()
  step_124()
  step_125()
  step_126()
  step_127()
  step_128()
  step_129()
  step_130()
  step_131()
  step_132()
  step_133()
  step_134()
  step_135()
  step_136()
  step_137()
  step_138()
  step_139()
  step_140()
  step_141()
  step_142()
  step_143()
  step_144()
  step_145()
  step_146()
  step_147()
  step_148()
  step_149()
  step_150()
  step_151()
  step_152()
  step_153()
  step_154()
  step_155()
  step_156()
  step_157()
  step_158()
  step_159()
  step_160()
  step_161()
  step_162()
  step_163()
  step_164()
  step_165()
  step_166()
  step_167()
  step_168()
  step_169()
  step_170()
  step_171()
  step_172()
  step_173()
  step_174()
  step_175()
  step_176()
  step_177()
  step_178()
  step_179()
  step_180()
  step_181()
  step_182()
  step_183()
  step_184()
  step_185()
  step_186()
  step_187()
  step_188()
  step_189()
  step_190()
  step_191()
  step_192()
  step_193()
  step_194()
  step_195()
  step_196()
  step_197()
  step_198()
  step_199()
  step_200()
  step_201()
  step_202()
  step_203()
  step_204()
  step_205()
  step_206()
  step_207()
  step_208()
  step_209()
  step_210()
  step_211()
  step_212()
  step_213()
  step_214()
  step_215()
  step_216()
  step_217()
  step_218()
  step_219()
  step_220()
  step_221()
  step_222()
  step_223()
  step_224()
  step_225()
  step_226()
  step_227()
  step_228()
  step_229()
  step_230()
  step_231()
  step_232()
  step_233()
  step_234()
  step_235()
  step_236()
  step_237()
  step_238()
}
