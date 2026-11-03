// Differential test against lib.ml, including the order in which callbacks
// are applied. Replays tools/ocaml_ref/lib_ref.ml; keep the two in sync.

///|
priv struct Rec {
  buf : StringBuilder
  calls : Array[String]
}

///|
fn Rec::note(self : Rec, s : String) -> Unit {
  self.calls.push(s)
}

///|
fn Rec::tr(self : Rec, name : String, f : () -> String raise) -> Unit {
  let line = try f() catch {
    Failure(msg) => name + " ! " + msg
    e => name + " !! " + e.to_string()
  } noraise {
    s => name + " = " + s
  }
  self.buf.write_string(line + "\n")
  self.buf.write_string(name + " calls: " + self.calls.join(" ") + "\n")
  self.calls.clear()
}

///|
fn[T : Show] il(l : @list.List[T]) -> String {
  "[" + l.map(x => x.to_string()).to_array().join(";") + "]"
}

///|
fn sl(l : @list.List[String]) -> String {
  "[" + l.to_array().join(";") + "]"
}

///|
fn[T : Show] si(x : T) -> String {
  x.to_string()
}

///|
fn showf(f : @lib.Func[String, Int32]) -> String {
  let items = @lib.foldl(
    (a : @list.List[String], x, y) => a.prepend(x + "=" + si(y)),
    @list.List([]),
    f,
  )
  "[" + items.rev().to_array().join(";") + "]"
}

///|
fn[K : @lib.OCompare + @lib.OHash, V] build(
  l : Array[(K, V)],
) -> @lib.Func[K, V] {
  @lib.itlist(
    (p : (K, V), f : @lib.Func[K, V]) => @lib.update(p.0, p.1, f),
    @list.List(l),
    @lib.undefined(),
  )
}

///|
test "lib matches lib.ml" {
  let r : Rec = { buf: StringBuilder(), calls: [], }
  let l5 = @list.List([3, 1, 4, 1, 5])
  let l = (xs : Array[Int32]) => @list.List(xs)
  r.tr("map", () => {
    il(
      @lib.map(
        x => {
          r.note(si(x))
          x * 2
        },
        l5,
      ),
    )
  })
  r.tr("filter", () => {
    il(
      @lib.filter(
        x => {
          r.note(si(x))
          x > 1
        },
        l5,
      ),
    )
  })
  r.tr("partition", () => {
    let (a, b) = @lib.partition(
      x => {
        r.note(si(x))
        x > 2
      },
      l5,
    )
    il(a) + il(b)
  })
  r.tr("mapfilter", () => {
    il(
      @lib.mapfilter(
        x => {
          r.note(si(x))
          if x == 1 {
            @lib.failwith("no")
          } else {
            x
          }
        },
        l5,
      ),
    )
  })
  r.tr("mapi", () => {
    il(
      @lib.mapi(
        (i, x) => {
          r.note(si(i))
          i * x
        },
        l5,
      ),
    )
  })
  r.tr("map2", () => {
    il(
      @lib.map2(
        (x, y) => {
          r.note(si(x))
          x + y
        },
        l([1, 2, 3]),
        l([4, 5, 6]),
      ),
    )
  })
  r.tr("map2_bad", () => {
    il(
      @lib.map2(
        (x, y) => {
          r.note(si(x))
          x + y
        },
        l([1, 2, 3]),
        l([4, 5]),
      ),
    )
  })
  let minus = (x : Int32, a : Int32) => {
    r.note(si(x))
    x - a
  }
  r.tr("itlist", () => si(@lib.itlist(minus, l5, 0)))
  r.tr("rev_itlist", () => si(@lib.rev_itlist(minus, l5, 0)))
  r.tr("end_itlist", () => si(@lib.end_itlist(minus, l5)))
  r.tr("end_itlist_empty", () => {
    si(@lib.end_itlist((x : Int32, a : Int32) => x - a, @list.List([])))
  })
  let f3 = (x : Int32, y : Int32, a : Int32) => {
    r.note(si(x))
    x * y - a
  }
  r.tr("itlist2", () => si(@lib.itlist2(f3, l([1, 2, 3]), l([4, 5, 6]), 0)))
  r.tr("itlist2_bad", () => si(@lib.itlist2(f3, l([1, 2, 3]), l([4, 5]), 0)))
  r.tr("rev_itlist2_bad", () => {
    si(@lib.rev_itlist2(f3, l([1, 2, 3]), l([4, 5]), 0))
  })
  r.tr("allpairs", () => {
    sl(
      @lib.allpairs(
        (x : Int32, y : Int32) => {
          r.note(si(x) + si(y))
          si(x) + si(y)
        },
        l([1, 2]),
        l([3, 4, 5]),
      ),
    )
  })
  r.tr("sort", () => {
    il(
      @lib.sort(
        (x : Int32, y : Int32) => {
          r.note(si(x) + "<=" + si(y))
          x <= y
        },
        l5,
      ),
    )
  })
  r.tr("sort_partial", () => {
    il(
      @lib.sort(
        (x : Int32, y : Int32) => x % 3 <= y % 3,
        l([5, 3, 9, 1, 4, 7, 2]),
      ),
    )
  })
  r.tr("mergesort", () => {
    il(
      @lib.mergesort(
        (x : Int32, y : Int32) => {
          r.note(si(x) + si(y))
          x <= y
        },
        l5,
      ),
    )
  })
  r.tr("setify", () => {
    sl(@lib.setify(@list.List(["b", "aa", "a", "b", "", "ab"])))
  })
  r.tr("uniq", () => il(@lib.uniq(l([1, 1, 2, 3, 3, 3, 1]))))
  r.tr("union", () => il(@lib.union(l([1, 2, 3, 2]), l([3, 4]))))
  r.tr("unions", () => {
    il(@lib.unions(@list.List([l([1, 2]), l([2, 3]), l([4, 1])])))
  })
  r.tr("subtract", () => il(@lib.subtract(l([1, 2, 3, 2, 4]), l([2]))))
  r.tr("intersect", () => il(@lib.intersect(l([1, 2, 3, 2, 4]), l([2, 4, 5]))))
  r.tr("striplist", () => {
    il(
      @lib.striplist(
        x => {
          r.note(si(x))
          if x < 2 {
            @lib.failwith("leaf")
          } else {
            (x / 2, x - x / 2)
          }
        },
        7,
      ),
    )
  })
  r.tr("splitlist", () => {
    let (ls, rest) = @lib.splitlist(
      x => if x == 0 { @lib.failwith("z") } else { (x, x - 1) },
      3,
    )
    il(ls) + si(rest)
  })
  r.tr("rev_splitlist", () => {
    let (rest, ls) = @lib.rev_splitlist(
      x => if x == 0 { @lib.failwith("z") } else { (x - 1, x) },
      3,
    )
    si(rest) + il(ls)
  })
  r.tr("nsplit", () => {
    let (ls, rest) = @lib.nsplit(
      (x : Int32) => (x, x + 1),
      @list.List(["a", "b"]),
      10,
    )
    il(ls) + si(rest)
  })
  r.tr("chop_list", () => {
    let (a, b) = @lib.chop_list(2, l5)
    il(a) + il(b)
  })
  r.tr("chop_list_bad", () => {
    let (a, b) = @lib.chop_list(6, l5)
    il(a) + il(b)
  })
  r.tr("chop_list_neg", () => {
    let (a, b) = @lib.chop_list(-1, l5)
    il(a) + il(b)
  })
  r.tr("range", () => il(@lib.range(3, 6)) + il(@lib.range(6, 3)))
  r.tr("replicate", () => il(@lib.replicate(7, 3)))
  r.tr("el", () => si(@lib.el(2, l5)))
  r.tr("el_bad", () => si(@lib.el(9, l5)))
  r.tr("last_butlast", () => si(@lib.last(l5)) + il(@lib.butlast(l5)))
  r.tr("assoc", () => @lib.assoc(2, @list.List([(1, "a"), (2, "b"), (2, "c")])))
  r.tr("assoc_bad", () => @lib.assoc(9, @list.List([(1, "a")])))
  r.tr("rev_assoc", () => {
    si(@lib.rev_assoc("b", @list.List([(1, "a"), (2, "b")])))
  })
  r.tr("index", () => si(@lib.index("c", @list.List(["a", "b", "c"]))))
  r.tr("index_bad", () => si(@lib.index("z", @list.List(["a"]))))
  r.tr("remove", () => {
    let (x, rest) = @lib.remove(x => x == 4, l5)
    si(x) + il(rest)
  })
  r.tr("tryfind", () => {
    si(
      @lib.tryfind(
        x => {
          r.note(si(x))
          if x < 4 {
            @lib.failwith("s")
          } else {
            x
          }
        },
        l5,
      ),
    )
  })
  r.tr("find_bad", () => si(@lib.find(x => x > 9, l5)))
  r.tr("zip_bad", () => si(@lib.length(@lib.zip(l([1]), l([1, 2])))))
  r.tr("shareout", () => {
    @lib.shareout(@list.List([l([0, 0]), l([]), l([0])]), l([1, 2, 3]))
    .map(il)
    .to_array()
    .join("|")
  })
  r.tr("explode", () => {
    sl(@lib.explode("a b")) + @lib.implode(@list.List(["x", "y"]))
  })
  r.tr("gcd", () => {
    il(
      @list.List([
        @lib.gcd(12, 18),
        @lib.gcd(-12, 18),
        @lib.gcd(0, 0),
        @lib.gcd(7, 0),
      ]),
    )
  })
  r.tr("repeat", () => {
    si(@lib.repeat(x => if x > 10 { @lib.failwith("s") } else { x * 2 }, 1))
  })
  r.tr("funpow", () => si(@lib.funpow(3, x => x * 3, 1)))
  r.tr("increasing", () => {
    @lib.increasing(
      x => {
        r.note(si(x))
        -x
      },
      1,
      2,
    ).to_string()
  })
  // Patricia trees.
  let f1 = build([
    ("apple", 1),
    ("b", 2),
    ("c", 3),
    ("dd", 4),
    ("e", 5),
    ("apple", 6),
    ("zz", 7),
  ])
  r.tr("func_foldl", () => showf(f1))
  r.tr("func_foldr", () => {
    @lib.foldr(
      (x, y, a : @list.List[String]) => a.prepend(x + si(y)),
      f1,
      @list.List([]),
    )
    .to_array()
    .join(";")
  })
  r.tr("func_graph", () => {
    @lib.graph(f1).map(p => p.0 + si(p.1)).to_array().join(";")
  })
  r.tr("func_dom", () => sl(@lib.dom(f1)))
  r.tr("func_ran", () => il(@lib.ran(f1)))
  r.tr("func_choose", () => {
    let (x, y) = @lib.choose(f1)
    x + si(y)
  })
  r.tr("func_apply", () => {
    si(@lib.apply(f1, "dd")) + si(@lib.tryapplyd(f1, "nope", 0))
  })
  r.tr("func_apply_bad", () => si(@lib.apply(f1, "nope")))
  r.tr("func_defined", () => {
    @lib.defined(f1, "e").to_string() + @lib.defined(f1, "q").to_string()
  })
  r.tr("func_undefine", () => showf(@lib.undefine("c", @lib.undefine("zz", f1))))
  let f2 = build([("b", 10), ("q", 20), ("e", -5), ("r", 1)])
  r.tr("func_combine", () => {
    showf(
      @lib.combine(
        (x, y) => {
          r.note(si(x) + "+" + si(y))
          x + y
        },
        x => x == 0,
        f1,
        f2,
      ),
    )
  })
  r.tr("func_mapf", () => {
    showf(
      @lib.mapf(
        x => {
          r.note(si(x))
          x * 10
        },
        f1,
      ),
    )
  })
  let f3 = @lib.itlist(
    (i, f) => @lib.update(i, i * i, f),
    @lib.range(1, 40),
    @lib.undefined(),
  )
  r.tr("func_int_foldl", () => {
    il(
      @lib.foldl(
        (a : @list.List[Int64], x, _) => a.prepend(x),
        @list.List([]),
        f3,
      ),
    )
  })
  r.tr("func_choose_int", () => si(@lib.choose(f3).0))
  let a = @kernel.aty
  let x = @kernel.mk_var("x", a)
  let y = @kernel.mk_var("y", a)
  let z = @kernel.mk_var("z", @kernel.bool_ty)
  let f4 = build([(x, 1), (y, 2), (z, 3), (@kernel.mk_var("w", a), 4)])
  r.tr("func_term_foldl", () => {
    @lib.foldl(
      (acc : @list.List[String], k, v) => {
        acc.prepend(@kernel.dest_var(k).0 + si(v))
      },
      @list.List([]),
      f4,
    )
    .to_array()
    .join(";")
  })
  r.tr("single", () => showf(@lib.single("k", 9)))
  r.tr("choose_bad", () => {
    @lib.choose((@lib.undefined() : @lib.Func[String, Int32])).0
  })
  inspect(
    r.buf.to_string(),
    content=(
      #|map = [6;2;8;2;10]
      #|map calls: 3 1 4 1 5
      #|filter = [3;4;5]
      #|filter calls: 5 1 4 1 3
      #|partition = [3;4;5][1;1]
      #|partition calls: 5 1 4 1 3
      #|mapfilter = [3;4;5]
      #|mapfilter calls: 5 1 4 1 3
      #|mapi = [0;1;8;3;20]
      #|mapi calls: 4 3 2 1 0
      #|map2 = [5;7;9]
      #|map2 calls: 1 2 3
      #|map2_bad ! map2: length mismatch
      #|map2_bad calls: 1 2
      #|itlist = 10
      #|itlist calls: 5 1 4 1 3
      #|rev_itlist = 10
      #|rev_itlist calls: 3 1 4 1 5
      #|end_itlist = 10
      #|end_itlist calls: 1 4 1 3
      #|end_itlist_empty ! end_itlist
      #|end_itlist_empty calls: 
      #|itlist2 = 12
      #|itlist2 calls: 3 2 1
      #|itlist2_bad ! itlist2
      #|itlist2_bad calls: 
      #|rev_itlist2_bad ! rev_itlist2
      #|rev_itlist2_bad calls: 1 2
      #|allpairs = [13;14;15;23;24;25]
      #|allpairs calls: 25 24 23 15 14 13
      #|sort = [1;1;3;4;5]
      #|sort calls: 3<=5 3<=1 3<=4 3<=1 4<=5 1<=1
      #|sort_partial = [3;9;1;4;7;5;2]
      #|sort_partial calls: 
      #|mergesort = [1;1;3;4;5]
      #|mergesort calls: 31 41 51 54 11 31 34
      #|setify = [;a;aa;ab;b]
      #|setify calls: 
      #|uniq = [1;2;3;1]
      #|uniq calls: 
      #|union = [1;2;3;4]
      #|union calls: 
      #|unions = [2;3;4;1]
      #|unions calls: 
      #|subtract = [1;3;4]
      #|subtract calls: 
      #|intersect = [2;2;4]
      #|intersect calls: 
      #|striplist = [1;1;1;1;1;1;1]
      #|striplist calls: 7 4 2 1 1 2 1 1 3 2 1 1 1
      #|splitlist = [3;2;1]0
      #|splitlist calls: 
      #|rev_splitlist = 0[1;2;3]
      #|rev_splitlist calls: 
      #|nsplit = [10;11]12
      #|nsplit calls: 
      #|chop_list = [3;1][4;1;5]
      #|chop_list calls: 
      #|chop_list_bad ! chop_list
      #|chop_list_bad calls: 
      #|chop_list_neg ! chop_list
      #|chop_list_neg calls: 
      #|range = [3;4;5;6][]
      #|range calls: 
      #|replicate = [7;7;7]
      #|replicate calls: 
      #|el = 4
      #|el calls: 
      #|el_bad ! tl
      #|el_bad calls: 
      #|last_butlast = 5[3;1;4;1]
      #|last_butlast calls: 
      #|assoc = b
      #|assoc calls: 
      #|assoc_bad ! find
      #|assoc_bad calls: 
      #|rev_assoc = 2
      #|rev_assoc calls: 
      #|index = 2
      #|index calls: 
      #|index_bad ! index
      #|index_bad calls: 
      #|remove = 4[3;1;1;5]
      #|remove calls: 
      #|tryfind = 4
      #|tryfind calls: 3 1 4
      #|find_bad ! find
      #|find_bad calls: 
      #|zip_bad ! zip
      #|zip_bad calls: 
      #|shareout = [1;2]|[]|[3]
      #|shareout calls: 
      #|explode = [a; ;b]xy
      #|explode calls: 
      #|gcd = [6;6;0;7]
      #|gcd calls: 
      #|repeat = 16
      #|repeat calls: 
      #|funpow = 27
      #|funpow calls: 
      #|increasing = false
      #|increasing calls: 2 1
      #|func_foldl = [e=5;apple=1;zz=7;c=3;b=2;dd=4]
      #|func_foldl calls: 
      #|func_foldr = e5;apple1;zz7;c3;b2;dd4
      #|func_foldr calls: 
      #|func_graph = apple1;b2;c3;dd4;e5;zz7
      #|func_graph calls: 
      #|func_dom = [apple;b;c;dd;e;zz]
      #|func_dom calls: 
      #|func_ran = [1;2;3;4;5;7]
      #|func_ran calls: 
      #|func_choose = e5
      #|func_choose calls: 
      #|func_apply = 40
      #|func_apply calls: 
      #|func_apply_bad ! apply
      #|func_apply_bad calls: 
      #|func_defined = truefalse
      #|func_defined calls: 
      #|func_undefine = [e=5;apple=1;b=2;dd=4]
      #|func_undefine calls: 
      #|func_combine = [apple=1;zz=7;c=3;q=20;b=12;dd=4;r=1]
      #|func_combine calls: 5+-5 2+10
      #|func_mapf = [e=50;apple=10;zz=70;c=30;b=20;dd=40]
      #|func_mapf calls: 4 2 3 7 1 5
      #|func_int_foldl = [22;15;4;5;12;1;28;38;26;10;14;21;33;37;18;32;19;27;30;3;34;7;40;36;13;39;25;23;11;29;17;16;24;8;35;31;9;6;20;2]
      #|func_int_foldl calls: 
      #|func_choose_int = 2
      #|func_choose_int calls: 
      #|func_term_foldl = x1;z3;y2;w4
      #|func_term_foldl calls: 
      #|single = [k=9]
      #|single calls: 
      #|choose_bad ! choose: completely undefined function
      #|choose_bad calls: 
      #|
    ),
  )
}
