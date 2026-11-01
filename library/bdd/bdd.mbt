// Translated from upstream Library/bdd.ml; edit this file directly.

///|
/// `tfst`
pub fn[TA, TB, TC] tfst(x1 : TA, x2 : TB, x3 : TC) -> TA raise {
  let (a, b, c) = (x1, x2, x3)
  a
}

///|
/// `tsnd`
pub fn[TA, TB, TC] tsnd(x4 : TB, x5 : TA, x6 : TC) -> TA raise {
  let (a, b, c) = (x4, x5, x6)
  b
}

///|
/// `var_of_num`
pub fn[TA] var_of_num(x7 : FixedArray[TA], x8 : Int64) -> TA raise {
  let varray = x7
  let n = x8
  @lib.array_get(varray, @lib.int63_to_int(n))
}

///|
/// `num_of_var`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] num_of_var(
  x9 : (FixedArray[TA], Ref[Int64], @lib.OHashtbl[TA, Int64]),
  x10 : TA,
) -> Int64 raise {
  let (varray, vnext, vhash) = x9
  let v = x10
  @lib.hashtbl_find(vhash, v) catch {
    not_found => {
      let n = vnext.val
      {
        vnext.val = @lib.add63(n, 1L)
        ()
      }
      @lib.array_set(varray, @lib.int63_to_int(n), v)
      @lib.hashtbl_add(vhash, v, n)
      n
    }
  }
}

///|
/// `mk_vtable`
pub fn mk_vtable(
  x11 : Int64,
) -> (FixedArray[@kernel.Term], Ref[Int64], @lib.OHashtbl[@kernel.Term, Int64]) raise {
  let n = x11
  let t13 = @lib.hashtbl_create(@lib.int63_to_int(@lib.add63(n, 1L)))
  let t14 = Ref::{ val: 1L, }
  let t12 = @term_syntax.parse_term("true")
  (@lib.array_make(@lib.add63(n, 1L), t12), t14, t13)
}

///|
/// BDD_1
fn step_1() -> Unit raise {
  bdd_1_c.set(@lib.max_int63)
}

///|
let bdd_1_c : @lib.Cell[Int64] = @lib.Cell::new("BDD_1")

///|
/// `BDD_1`
pub fn bdd_1() -> Int64 {
  bdd_1_c.get()
}

///|
/// BDD_0
fn step_2() -> Unit raise {
  bdd_0_c.set(@lib.neg63(bdd_1()))
}

///|
let bdd_0_c : @lib.Cell[Int64] = @lib.Cell::new("BDD_0")

///|
/// `BDD_0`
pub fn bdd_0() -> Int64 {
  bdd_0_c.get()
}

///|
/// btm_of_int
fn step_3() -> Unit raise {
  let true_tm = @term_syntax.parse_term("true")
  btm_of_int_c.set(x17 => {
    fn(x18 : Int64) -> @kernel.Term raise {
      ((x15, x16) => btm_of_int_1_l(true_tm, x15, x16))(x17, x18)
    }
  })
}

///|
let btm_of_int_c : @lib.Cell[
  (Ref[@lib.Func[Int64, ((Int64, Int64, Int64), @kernel.Thm)]]) -> ((Int64) -> @kernel.Term raise) raise,
] = @lib.Cell::new("btm_of_int")

///|
/// `btm_of_int`
pub fn btm_of_int(
  x : Ref[@lib.Func[Int64, ((Int64, Int64, Int64), @kernel.Thm)]],
) -> ((Int64) -> @kernel.Term raise) raise {
  btm_of_int_c.get()(x)
}

///|
fn[TB : Eq + @lib.OCompare + @lib.OHash] btm_of_int_1_l(
  true_tm : @kernel.Term,
  x15 : Ref[@lib.Func[Int64, (TB, @kernel.Thm)]],
  x16 : Int64,
) -> @kernel.Term raise {
  let btm_of_int_1 = (
    x15 : Ref[@lib.Func[Int64, (TB, @kernel.Thm)]],
    x16 : Int64,
  ) => btm_of_int_1_l(true_tm, x15, x16)
  let uarray = x15
  let n = x16
  if n < 0L {
    @bool.mk_neg(btm_of_int_1(uarray, @lib.neg63(n)))
  } else if n == bdd_1() {
    true_tm
  } else {
    @kernel.rand(@kernel.rator(@kernel.concl(@lib.apply(uarray.val, n).1)))
  }
}

///|
/// `lookup_triple`
pub fn lookup_triple(
  x19 : FixedArray[@kernel.Term],
  x20 : (
    Ref[@lib.Func[Int64, ((Int64, Int64, Int64), @kernel.Thm)]],
    Ref[Int64],
    Ref[@lib.Func[(Int64, Int64, Int64), Int64]],
  ),
  x21 : (Int64, Int64, Int64),
) -> Int64 raise {
  let varray = x19
  let (uarray, unext, uhash) = x20
  let (v, y, n) as tr = x21
  @lib.apply(uhash.val, tr) catch {
    not_found => {
      let ytm = btm_of_int(uarray)(y)
      let ntm = btm_of_int(uarray)(n)
      let vtm = @lib.array_get(varray, @lib.int63_to_int(v))
      let m = unext.val
      let ltm = @class.mk_cond(vtm, ytm, ntm)
      let dth = @kernel.refl(ltm)
      {
        unext.val = @lib.add63(m, 1L)
        ()
      }
      {
        uarray.val = @lib.update(m, (tr, dth), uarray.val)
        ()
      }
      {
        uhash.val = @lib.update(tr, m, uhash.val)
        ()
      }
      m
    }
  }
}

///|
/// `bdd_expand`
pub fn[
  TA : Eq + @lib.OCompare + @lib.OHash,
  TB : Eq + @lib.OCompare + @lib.OHash,
] bdd_expand(
  x22 : Ref[@lib.Func[Int64, ((TA, Int64, Int64), TB)]],
  x23 : Int64,
) -> (TA, Int64, Int64) raise {
  let uarray = x22
  let b = x23
  if b < 0L {
    let t24 = @lib.neg63(b)
    let (v, l, r) = @lib.apply(uarray.val, t24).0
    let t25 = @lib.neg63(r)
    (v, @lib.neg63(l), t25)
  } else {
    @lib.apply(uarray.val, b).0
  }
}

///|
/// BDD_EXPAND
fn step_4() -> Unit raise {
  let pth1 = @class.taut(
    @term_syntax.parse_term("!(if (v : Bool) { (b1 : Bool) } else { (b2 : Bool) }) == (if v { !b1 } else { !b2 })"),
  )
  let pth2 = @class.taut(
    @term_syntax.parse_term("!(if (v : Bool) { (b1 : Bool) } else { !(b2 : Bool) }) == (if v { !b1 } else { b2 })"),
  )
  let pth3 = @class.taut(
    @term_syntax.parse_term("!(if (v : Bool) { !(b1 : Bool) } else { (b2 : Bool) }) == (if v { b1 } else { !b2 })"),
  )
  let pth4 = @class.taut(
    @term_syntax.parse_term("!(if (v : Bool) { !(b1 : Bool) } else { !(b2 : Bool) }) == (if v { b1 } else { b2 })"),
  )
  let neg_tm = @term_syntax.parse_term("op_tilde")
  let v_tm = @term_syntax.parse_term("(v : Bool)")
  let b1_tm = @term_syntax.parse_term("(b1 : Bool)")
  let b2_tm = @term_syntax.parse_term("(b2 : Bool)")
  bdd_expand_v1_c.set(x30 => {
    fn(x31 : Int64) -> @kernel.Thm raise {
      ((x26, x27) => {
        bdd_expand_1_l(
          v_tm, b1_tm, b2_tm, pth4, pth3, pth2, pth1, neg_tm, x26, x27,
        )
      })(x30, x31)
    }
  })
}

///|
let bdd_expand_v1_c : @lib.Cell[
  (Ref[@lib.Func[Int64, ((Int64, Int64, Int64), @kernel.Thm)]]) -> ((Int64) -> @kernel.Thm raise) raise,
] = @lib.Cell::new("BDD_EXPAND")

///|
/// `BDD_EXPAND`
pub fn bdd_expand_v1(
  x : Ref[@lib.Func[Int64, ((Int64, Int64, Int64), @kernel.Thm)]],
) -> ((Int64) -> @kernel.Thm raise) raise {
  bdd_expand_v1_c.get()(x)
}

///|
fn[TB : Eq + @lib.OCompare + @lib.OHash] bdd_expand_1_l(
  v_tm : @kernel.Term,
  b1_tm : @kernel.Term,
  b2_tm : @kernel.Term,
  pth4 : @kernel.Thm,
  pth3 : @kernel.Thm,
  pth2 : @kernel.Thm,
  pth1 : @kernel.Thm,
  neg_tm : @kernel.Term,
  x26 : Ref[@lib.Func[Int64, (TB, @kernel.Thm)]],
  x27 : Int64,
) -> @kernel.Thm raise {
  let uarray = x26
  let b = x27
  if b < 0L {
    let t28 = @lib.neg63(b)
    let def = @lib.apply(uarray.val, t28).1
    let (v, (y, n)) = @class.dest_cond(@kernel.rand(@kernel.concl(def)))
    let pth = if @basics.is_neg(y) {
      if @basics.is_neg(n) {
        let t29 = (@kernel.rand(n), b2_tm)
        @kernel.inst_rule(
          @list.List([(v, v_tm), (@kernel.rand(y), b1_tm), t29]),
          pth4,
        )
      } else {
        @kernel.inst_rule(
          @list.List([(v, v_tm), (@kernel.rand(y), b1_tm), (n, b2_tm)]),
          pth3,
        )
      }
    } else if @basics.is_neg(n) {
      @kernel.inst_rule(
        @list.List([(v, v_tm), (y, b1_tm), (@kernel.rand(n), b2_tm)]),
        pth2,
      )
    } else {
      @kernel.inst_rule(@list.List([(v, v_tm), (y, b1_tm), (n, b2_tm)]), pth1)
    }
    @kernel.trans(@equal.ap_term(neg_tm, def), pth)
  } else {
    @lib.apply(uarray.val, b).1
  }
}

///|
/// BDD_LOOKUP
fn step_5() -> Unit raise {
  let pth1 = @class.taut(@term_syntax.parse_term("(b : Bool) == (if (v : Bool) { b } else { b })"))
  let pth2 = @class.taut(
    @term_syntax.parse_term("(b : Bool) == (if (v : Bool) { (l : Bool) } else { (r : Bool) }) → !b == (if v { !l } else { !r })"),
  )
  let pth3 = @class.taut(
    @term_syntax.parse_term("(b : Bool) == (if (v : Bool) { (l : Bool) } else { !(r : Bool) }) → !b == (if v { !l } else { r })"),
  )
  let b_tm = @term_syntax.parse_term("(b : Bool)")
  let v_tm = @term_syntax.parse_term("(v : Bool)")
  let l_tm = @term_syntax.parse_term("(l : Bool)")
  let r_tm = @term_syntax.parse_term("(r : Bool)")
  fn bdd_lookup_1(
    x32 : FixedArray[@kernel.Term],
    x33 : (
      Ref[@lib.Func[Int64, ((Int64, Int64, Int64), @kernel.Thm)]],
      Ref[Int64],
      Ref[@lib.Func[(Int64, Int64, Int64), Int64]],
    ),
    x34 : (Int64, Int64, Int64),
  ) -> (@kernel.Thm, Int64, Int64) raise {
    let varray = x32
    let utable = x33
    let (v, l, r) = x34
    if l == r {
      let t35 = (btm_of_int(tfst(utable.0, utable.1, utable.2))(l), b_tm)
      (
        @kernel.inst_rule(
          @list.List([(var_of_num(varray, v), v_tm), t35]),
          pth1,
        ),
        l,
        0L,
      )
    } else if l < 0L {
      let t36 = @lib.neg63(r)
      let i = lookup_triple(varray, utable, (v, @lib.neg63(l), t36))
      let dth = @lib.apply(tfst(utable.0, utable.1, utable.2).val, i).1
      let t38 = @kernel.dest_eq(@kernel.concl(dth))
      let t39 = @class.dest_cond(t38.1)
      let (ctm, (vtm, (ltm, rtm))) = (
        (fn(x37 : @kernel.Term) -> @kernel.Term raise { x37 })(t38.0),
        t39,
      )
      if r < 0L {
        let t40 = @lib.neg63(i)
        (
          @bool.mp(
            @kernel.inst_rule(
              @list.List([(ctm, b_tm), (vtm, v_tm), (ltm, l_tm), (rtm, r_tm)]),
              pth2,
            ),
            dth,
          ),
          t40,
          i,
        )
      } else {
        let t41 = @lib.neg63(i)
        (
          @bool.mp(
            @kernel.inst_rule(
              @list.List([
                (ctm, b_tm),
                (vtm, v_tm),
                (ltm, l_tm),
                (@kernel.rand(rtm), r_tm),
              ]),
              pth3,
            ),
            dth,
          ),
          t41,
          i,
        )
      }
    } else {
      let i_1 = lookup_triple(varray, utable, (v, l, r))
      let dth_1 = @lib.apply(tfst(utable.0, utable.1, utable.2).val, i_1).1
      (dth_1, i_1, i_1)
    }
  }
  bdd_lookup_c.set(fn(
    x42 : FixedArray[@kernel.Term],
  ) -> ((
    (
      Ref[@lib.Func[Int64, ((Int64, Int64, Int64), @kernel.Thm)]],
      Ref[Int64],
      Ref[@lib.Func[(Int64, Int64, Int64), Int64]],
    ),
  ) -> (((Int64, Int64, Int64)) -> (@kernel.Thm, Int64, Int64) raise) raise) raise {
    fn(
      x43 : (
        Ref[@lib.Func[Int64, ((Int64, Int64, Int64), @kernel.Thm)]],
        Ref[Int64],
        Ref[@lib.Func[(Int64, Int64, Int64), Int64]],
      ),
    ) -> (((Int64, Int64, Int64)) -> (@kernel.Thm, Int64, Int64) raise) raise {
      fn(x44 : (Int64, Int64, Int64)) -> (@kernel.Thm, Int64, Int64) raise {
        bdd_lookup_1(x42, x43, x44)
      }
    }
  })
}

///|
let bdd_lookup_c : @lib.Cell[
  (FixedArray[@kernel.Term]) -> ((
    (
      Ref[@lib.Func[Int64, ((Int64, Int64, Int64), @kernel.Thm)]],
      Ref[Int64],
      Ref[@lib.Func[(Int64, Int64, Int64), Int64]],
    ),
  ) -> (((Int64, Int64, Int64)) -> (@kernel.Thm, Int64, Int64) raise) raise) raise,
] = @lib.Cell::new("BDD_LOOKUP")

///|
/// `BDD_LOOKUP`
pub fn bdd_lookup(
  x : FixedArray[@kernel.Term],
) -> ((
  (
    Ref[@lib.Func[Int64, ((Int64, Int64, Int64), @kernel.Thm)]],
    Ref[Int64],
    Ref[@lib.Func[(Int64, Int64, Int64), Int64]],
  ),
) -> (((Int64, Int64, Int64)) -> (@kernel.Thm, Int64, Int64) raise) raise) raise {
  bdd_lookup_c.get()(x)
}

///|
/// `mk_utable`
pub fn[TA, TB] mk_utable(
  x45 : Unit,
) -> (
  Ref[@lib.Func[Int64, ((Int64, Int64, Int64), @kernel.Thm)]],
  Ref[Int64],
  Ref[@lib.Func[TA, TB]],
) raise {
  let _ = x45
  let t46 = Ref::{ val: @lib.undefined(), }
  let t47 = Ref::{ val: 1L, }
  (Ref::{ val: @lib.single(0L, ((0L, 0L, 0L), @bool.truth())), }, t47, t46)
}

///|
/// bdd_and
fn step_6() -> Unit raise {
  let pth1 = @class.taut(@term_syntax.parse_term("(!true && (r1 : Bool)) == !true"))
  let pth2 = @class.taut(@term_syntax.parse_term("((l1 : Bool) && true) == l1"))
  let pth3 = @class.taut(@term_syntax.parse_term("((l1 : Bool) && l1) == l1"))
  let pth4 = @class.taut(@term_syntax.parse_term("(!(r1 : Bool) && r1) == !true"))
  let pth5 = @class.taut(
    @term_syntax.parse_term("(b1 : Bool) == (if (v : Bool) { (l1 : Bool) } else { (r1 : Bool) }) → (b2 : Bool) == (if v { (l2 : Bool) } else { (r2 : Bool) }) → (b3 : Bool) == (if v { (l3 : Bool) } else { (r3 : Bool) }) → (l1 && l2) == l3 → (r1 && r2) == r3 → (b1 && b2) == b3"),
  )
  let pth6 = @class.taut(
    @term_syntax.parse_term("(b1 : Bool) == (if (v : Bool) { (l1 : Bool) } else { (r1 : Bool) }) → (b3 : Bool) == (if v { (l3 : Bool) } else { (r3 : Bool) }) → (l1 && (b2 : Bool)) == l3 → (r1 && b2) == r3 → (b1 && b2) == b3"),
  )
  let pth7 = @class.taut(
    @term_syntax.parse_term("(b2 : Bool) == (if (v : Bool) { (l2 : Bool) } else { (r2 : Bool) }) → (b3 : Bool) == (if v { (l3 : Bool) } else { (r3 : Bool) }) → ((b1 : Bool) && l2) == l3 → (b1 && r2) == r3 → (b1 && b2) == b3"),
  )
  let pth8 = @class.taut(@term_syntax.parse_term("((l1 : Bool) && (r1 : Bool)) == (r1 && l1)"))
  let b1_tm = @term_syntax.parse_term("(b1 : Bool)")
  let b2_tm = @term_syntax.parse_term("(b2 : Bool)")
  let b3_tm = @term_syntax.parse_term("(b3 : Bool)")
  let l1_tm = @term_syntax.parse_term("(l1 : Bool)")
  let l2_tm = @term_syntax.parse_term("(l2 : Bool)")
  let l3_tm = @term_syntax.parse_term("(l3 : Bool)")
  let r1_tm = @term_syntax.parse_term("(r1 : Bool)")
  let r2_tm = @term_syntax.parse_term("(r2 : Bool)")
  let r3_tm = @term_syntax.parse_term("(r3 : Bool)")
  let v_tm = @term_syntax.parse_term("(v : Bool)")
  let bdd_and_1 = (
    x50 : (
      FixedArray[@kernel.Term],
      (
        Ref[@lib.Func[Int64, ((Int64, Int64, Int64), @kernel.Thm)]],
        Ref[Int64],
        Ref[@lib.Func[(Int64, Int64, Int64), Int64]],
      ),
      (
        Ref[
          @lib.Func[
            Int64,
            (Int64, (@kernel.Thm, @list.List[Int64], @list.List[Int64])),
          ],
        ],
        Ref[Int64],
        Ref[@lib.Func[(Int64, Int64), Int64]],
      ),
    ),
    x51 : (Int64, Int64),
  ) => {
    bdd_and_1_l(
      r1_tm, pth1, l1_tm, pth2, pth3, pth4, b1_tm, b2_tm, b3_tm, l2_tm, l3_tm, r2_tm,
      r3_tm, v_tm, pth5, pth6, pth7, pth8, x50, x51,
    )
  }
  let bdd_ands = (
    x86 : (
      FixedArray[@kernel.Term],
      (
        Ref[@lib.Func[Int64, ((Int64, Int64, Int64), @kernel.Thm)]],
        Ref[Int64],
        Ref[@lib.Func[(Int64, Int64, Int64), Int64]],
      ),
      (
        Ref[
          @lib.Func[
            Int64,
            (Int64, (@kernel.Thm, @list.List[Int64], @list.List[Int64])),
          ],
        ],
        Ref[Int64],
        Ref[@lib.Func[(Int64, Int64), Int64]],
      ),
    ),
    x87 : (Int64, Int64),
  ) => {
    bdd_ands_l(
      r1_tm, pth1, l1_tm, pth2, pth3, pth4, b1_tm, b2_tm, b3_tm, l2_tm, l3_tm, r2_tm,
      r3_tm, v_tm, pth5, pth6, pth7, pth8, x86, x87,
    )
  }
  bdd_and_c.set(fn(
    x93 : (
      FixedArray[@kernel.Term],
      (
        Ref[@lib.Func[Int64, ((Int64, Int64, Int64), @kernel.Thm)]],
        Ref[Int64],
        Ref[@lib.Func[(Int64, Int64, Int64), Int64]],
      ),
      (
        Ref[
          @lib.Func[
            Int64,
            (Int64, (@kernel.Thm, @list.List[Int64], @list.List[Int64])),
          ],
        ],
        Ref[Int64],
        Ref[@lib.Func[(Int64, Int64), Int64]],
      ),
    ),
  ) -> (((Int64, Int64)) -> (Int64, Int64) raise) raise {
    fn(x94 : (Int64, Int64)) -> (Int64, Int64) raise { bdd_and_1(x93, x94) }
  })
}

///|
let bdd_and_c : @lib.Cell[
  (
    (
      FixedArray[@kernel.Term],
      (
        Ref[@lib.Func[Int64, ((Int64, Int64, Int64), @kernel.Thm)]],
        Ref[Int64],
        Ref[@lib.Func[(Int64, Int64, Int64), Int64]],
      ),
      (
        Ref[
          @lib.Func[
            Int64,
            (Int64, (@kernel.Thm, @list.List[Int64], @list.List[Int64])),
          ],
        ],
        Ref[Int64],
        Ref[@lib.Func[(Int64, Int64), Int64]],
      ),
    ),
  ) -> (((Int64, Int64)) -> (Int64, Int64) raise) raise,
] = @lib.Cell::new("bdd_and")

///|
/// `bdd_and`
pub fn bdd_and(
  x : (
    FixedArray[@kernel.Term],
    (
      Ref[@lib.Func[Int64, ((Int64, Int64, Int64), @kernel.Thm)]],
      Ref[Int64],
      Ref[@lib.Func[(Int64, Int64, Int64), Int64]],
    ),
    (
      Ref[
        @lib.Func[
          Int64,
          (Int64, (@kernel.Thm, @list.List[Int64], @list.List[Int64])),
        ],
      ],
      Ref[Int64],
      Ref[@lib.Func[(Int64, Int64), Int64]],
    ),
  ),
) -> (((Int64, Int64)) -> (Int64, Int64) raise) raise {
  bdd_and_c.get()(x)
}

///|
fn[
  TA : Eq + @lib.OCompare + @lib.OHash,
  TB : Eq + @lib.OCompare + @lib.OHash,
  TC : Eq + @lib.OCompare + @lib.OHash,
  TD : Eq + @lib.OCompare + @lib.OHash,
  TE : Eq + @lib.OCompare + @lib.OHash,
  TF,
] lookup_pair_l(
  x48 : (Ref[@lib.Func[TB, (TA, TE)]], TF, Ref[@lib.Func[(TC, TD), TB]]),
  x49 : (TC, TD),
) -> (TA, TB) raise {
  let (carray, cnext, chash) = x48
  let (l, r) = x49
  try {
    let i = @lib.apply(chash.val, (l, r))
    (@lib.apply(carray.val, i).0, i)
  } catch {
    not_found => raise Failure("lookup_pair")
  }
}

///|
fn bdd_and_1_l(
  r1_tm : @kernel.Term,
  pth1 : @kernel.Thm,
  l1_tm : @kernel.Term,
  pth2 : @kernel.Thm,
  pth3 : @kernel.Thm,
  pth4 : @kernel.Thm,
  b1_tm : @kernel.Term,
  b2_tm : @kernel.Term,
  b3_tm : @kernel.Term,
  l2_tm : @kernel.Term,
  l3_tm : @kernel.Term,
  r2_tm : @kernel.Term,
  r3_tm : @kernel.Term,
  v_tm : @kernel.Term,
  pth5 : @kernel.Thm,
  pth6 : @kernel.Thm,
  pth7 : @kernel.Thm,
  pth8 : @kernel.Thm,
  x50 : (
    FixedArray[@kernel.Term],
    (
      Ref[@lib.Func[Int64, ((Int64, Int64, Int64), @kernel.Thm)]],
      Ref[Int64],
      Ref[@lib.Func[(Int64, Int64, Int64), Int64]],
    ),
    (
      Ref[
        @lib.Func[
          Int64,
          (Int64, (@kernel.Thm, @list.List[Int64], @list.List[Int64])),
        ],
      ],
      Ref[Int64],
      Ref[@lib.Func[(Int64, Int64), Int64]],
    ),
  ),
  x51 : (Int64, Int64),
) -> (Int64, Int64) raise {
  let bdd_ands = (
    x86 : (
      FixedArray[@kernel.Term],
      (
        Ref[@lib.Func[Int64, ((Int64, Int64, Int64), @kernel.Thm)]],
        Ref[Int64],
        Ref[@lib.Func[(Int64, Int64, Int64), Int64]],
      ),
      (
        Ref[
          @lib.Func[
            Int64,
            (Int64, (@kernel.Thm, @list.List[Int64], @list.List[Int64])),
          ],
        ],
        Ref[Int64],
        Ref[@lib.Func[(Int64, Int64), Int64]],
      ),
    ),
    x87 : (Int64, Int64),
  ) => {
    bdd_ands_l(
      r1_tm, pth1, l1_tm, pth2, pth3, pth4, b1_tm, b2_tm, b3_tm, l2_tm, l3_tm, r2_tm,
      r3_tm, v_tm, pth5, pth6, pth7, pth8, x86, x87,
    )
  }
  let (varray, utable, (carray_1, cnext_1, chash_1) as ctable) = x50
  let (l_1, r_1) = x51
  lookup_pair_l(ctable, (l_1, r_1)) catch {
    Failure(_) => {
      let (ans, thm, uargs, cargs) = if l_1 == bdd_0() {
        (
          bdd_0(),
          @kernel.inst_rule(
            @list.List([
              (btm_of_int(tfst(utable.0, utable.1, utable.2))(r_1), r1_tm),
            ]),
            pth1,
          ),
          @list.List([]),
          @list.List([]),
        )
      } else if r_1 == bdd_1() {
        (
          l_1,
          @kernel.inst_rule(
            @list.List([
              (btm_of_int(tfst(utable.0, utable.1, utable.2))(l_1), l1_tm),
            ]),
            pth2,
          ),
          @list.List([]),
          @list.List([]),
        )
      } else if l_1 == r_1 {
        (
          l_1,
          @kernel.inst_rule(
            @list.List([
              (btm_of_int(tfst(utable.0, utable.1, utable.2))(l_1), l1_tm),
            ]),
            pth3,
          ),
          @list.List([]),
          @list.List([]),
        )
      } else if l_1 == @lib.neg63(r_1) {
        (
          bdd_0(),
          @kernel.inst_rule(
            @list.List([
              (btm_of_int(tfst(utable.0, utable.1, utable.2))(r_1), r1_tm),
            ]),
            pth4,
          ),
          @list.List([]),
          @list.List([]),
        )
      } else {
        let (lv, ly, ln) = bdd_expand(tfst(utable.0, utable.1, utable.2), l_1)
        let (rv, ry, rn) = bdd_expand(tfst(utable.0, utable.1, utable.2), r_1)
        if lv == rv {
          let (thy, cy, jy) = bdd_ands((varray, utable, ctable), (ly, ry))
          let (thn, cn, jn) = bdd_ands((varray, utable, ctable), (ln, rn))
          let thl = bdd_expand_v1(tfst(utable.0, utable.1, utable.2))(l_1)
          let thr = bdd_expand_v1(tfst(utable.0, utable.1, utable.2))(r_1)
          let (thc, c, jc) = bdd_lookup(varray)(utable)((lv, cy, cn))
          let t53 = @kernel.dest_eq(@kernel.concl(thl))
          let t54 = @class.dest_cond(t53.1)
          let (b1, (v1, (l1, r1))) = (
            (fn(x52 : @kernel.Term) -> @kernel.Term raise { x52 })(t53.0),
            t54,
          )
          let t56 = @kernel.dest_eq(@kernel.concl(thr))
          let t57 = @class.dest_cond(t56.1)
          let (b2, (v2, (l2, r2))) = (
            (fn(x55 : @kernel.Term) -> @kernel.Term raise { x55 })(t56.0),
            t57,
          )
          let t59 = @kernel.dest_eq(@kernel.concl(thc))
          let t60 = @class.dest_cond(t59.1)
          let (b3, (v3, (l3, r3))) = (
            (fn(x58 : @kernel.Term) -> @kernel.Term raise { x58 })(t59.0),
            t60,
          )
          let ith = @kernel.inst_rule(
            @list.List([
              (b1, b1_tm),
              (b2, b2_tm),
              (b3, b3_tm),
              (l1, l1_tm),
              (l2, l2_tm),
              (l3, l3_tm),
              (r1, r1_tm),
              (r2, r2_tm),
              (r3, r3_tm),
              (v3, v_tm),
            ]),
            pth5,
          )
          let lis = @list.List([thl, thr, thc, thy, thn])
          let xth = @lib.rev_itlist(
            fn(x63 : @kernel.Thm, x64 : @kernel.Thm) -> @kernel.Thm raise {
              (fn(
                x61 : @kernel.Thm,
              ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
                fn(x62 : @kernel.Thm) -> @kernel.Thm raise {
                  @bool.mp(x61, x62)
                }
              })(x64)(x63)
            },
            lis,
            ith,
          )
          let t65 = @lib.abs63(r_1)
          (c, xth, @list.List([@lib.abs63(l_1), t65, jc]), @list.List([jy, jn]))
        } else if lv > rv {
          let (thy_1, cy_1, jy_1) = bdd_ands(
            (varray, utable, ctable),
            (ly, r_1),
          )
          let (thn_1, cn_1, jn_1) = bdd_ands(
            (varray, utable, ctable),
            (ln, r_1),
          )
          let thl_1 = bdd_expand_v1(tfst(utable.0, utable.1, utable.2))(l_1)
          let (thc_1, c_1, jc_1) = bdd_lookup(varray)(utable)((lv, cy_1, cn_1))
          let t67 = @kernel.dest_eq(@kernel.concl(thl_1))
          let t68 = @class.dest_cond(t67.1)
          let (b1_1, (v1_1, (l1_1, r1_1))) = (
            (fn(x66 : @kernel.Term) -> @kernel.Term raise { x66 })(t67.0),
            t68,
          )
          let t70 = @kernel.dest_eq(@kernel.concl(thc_1))
          let t71 = @class.dest_cond(t70.1)
          let (b3_1, (v3_1, (l3_1, r3_1))) = (
            (fn(x69 : @kernel.Term) -> @kernel.Term raise { x69 })(t70.0),
            t71,
          )
          let b2_1 = @kernel.rand(
            @kernel.rand(@kernel.rator(@kernel.concl(thy_1))),
          )
          let ith_1 = @kernel.inst_rule(
            @list.List([
              (b1_1, b1_tm),
              (b2_1, b2_tm),
              (b3_1, b3_tm),
              (l1_1, l1_tm),
              (l3_1, l3_tm),
              (r1_1, r1_tm),
              (r3_1, r3_tm),
              (v3_1, v_tm),
            ]),
            pth6,
          )
          let lis_1 = @list.List([thl_1, thc_1, thy_1, thn_1])
          let xth_1 = @lib.rev_itlist(
            fn(x74 : @kernel.Thm, x75 : @kernel.Thm) -> @kernel.Thm raise {
              (fn(
                x72 : @kernel.Thm,
              ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
                fn(x73 : @kernel.Thm) -> @kernel.Thm raise {
                  @bool.mp(x72, x73)
                }
              })(x75)(x74)
            },
            lis_1,
            ith_1,
          )
          (
            c_1,
            xth_1,
            @list.List([@lib.abs63(l_1), jc_1]),
            @list.List([jy_1, jn_1]),
          )
        } else {
          let (thy_2, cy_2, jy_2) = bdd_ands(
            (varray, utable, ctable),
            (l_1, ry),
          )
          let (thn_2, cn_2, jn_2) = bdd_ands(
            (varray, utable, ctable),
            (l_1, rn),
          )
          let thr_1 = bdd_expand_v1(tfst(utable.0, utable.1, utable.2))(r_1)
          let (thc_2, c_2, jc_2) = bdd_lookup(varray)(utable)((rv, cy_2, cn_2))
          let t77 = @kernel.dest_eq(@kernel.concl(thr_1))
          let t78 = @class.dest_cond(t77.1)
          let (b2_2, (v2_1, (l2_1, r2_1))) = (
            (fn(x76 : @kernel.Term) -> @kernel.Term raise { x76 })(t77.0),
            t78,
          )
          let t80 = @kernel.dest_eq(@kernel.concl(thc_2))
          let t81 = @class.dest_cond(t80.1)
          let (b3_2, (v3_2, (l3_2, r3_2))) = (
            (fn(x79 : @kernel.Term) -> @kernel.Term raise { x79 })(t80.0),
            t81,
          )
          let b1_2 = @kernel.rand(
            @kernel.rator(@kernel.rand(@kernel.rator(@kernel.concl(thy_2)))),
          )
          let ith_2 = @kernel.inst_rule(
            @list.List([
              (b1_2, b1_tm),
              (b2_2, b2_tm),
              (b3_2, b3_tm),
              (l2_1, l2_tm),
              (l3_2, l3_tm),
              (r2_1, r2_tm),
              (r3_2, r3_tm),
              (v3_2, v_tm),
            ]),
            pth7,
          )
          let lis_2 = @list.List([thr_1, thc_2, thy_2, thn_2])
          let xth_2 = @lib.rev_itlist(
            fn(x84 : @kernel.Thm, x85 : @kernel.Thm) -> @kernel.Thm raise {
              (fn(
                x82 : @kernel.Thm,
              ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
                fn(x83 : @kernel.Thm) -> @kernel.Thm raise {
                  @bool.mp(x82, x83)
                }
              })(x85)(x84)
            },
            lis_2,
            ith_2,
          )
          (
            c_2,
            xth_2,
            @list.List([@lib.abs63(r_1), jc_2]),
            @list.List([jy_2, jn_2]),
          )
        }
      }
      let m = cnext_1.val
      {
        cnext_1.val = @lib.add63(m, 1L)
        ()
      }
      {
        carray_1.val = @lib.update(m, (ans, (thm, uargs, cargs)), carray_1.val)
        ()
      }
      {
        chash_1.val = @lib.update((l_1, r_1), m, chash_1.val)
        ()
      }
      (ans, m)
    }
    e => raise e
  }
}

///|
fn bdd_ands_l(
  r1_tm : @kernel.Term,
  pth1 : @kernel.Thm,
  l1_tm : @kernel.Term,
  pth2 : @kernel.Thm,
  pth3 : @kernel.Thm,
  pth4 : @kernel.Thm,
  b1_tm : @kernel.Term,
  b2_tm : @kernel.Term,
  b3_tm : @kernel.Term,
  l2_tm : @kernel.Term,
  l3_tm : @kernel.Term,
  r2_tm : @kernel.Term,
  r3_tm : @kernel.Term,
  v_tm : @kernel.Term,
  pth5 : @kernel.Thm,
  pth6 : @kernel.Thm,
  pth7 : @kernel.Thm,
  pth8 : @kernel.Thm,
  x86 : (
    FixedArray[@kernel.Term],
    (
      Ref[@lib.Func[Int64, ((Int64, Int64, Int64), @kernel.Thm)]],
      Ref[Int64],
      Ref[@lib.Func[(Int64, Int64, Int64), Int64]],
    ),
    (
      Ref[
        @lib.Func[
          Int64,
          (Int64, (@kernel.Thm, @list.List[Int64], @list.List[Int64])),
        ],
      ],
      Ref[Int64],
      Ref[@lib.Func[(Int64, Int64), Int64]],
    ),
  ),
  x87 : (Int64, Int64),
) -> (@kernel.Thm, Int64, Int64) raise {
  let bdd_and_1 = (
    x50 : (
      FixedArray[@kernel.Term],
      (
        Ref[@lib.Func[Int64, ((Int64, Int64, Int64), @kernel.Thm)]],
        Ref[Int64],
        Ref[@lib.Func[(Int64, Int64, Int64), Int64]],
      ),
      (
        Ref[
          @lib.Func[
            Int64,
            (Int64, (@kernel.Thm, @list.List[Int64], @list.List[Int64])),
          ],
        ],
        Ref[Int64],
        Ref[@lib.Func[(Int64, Int64), Int64]],
      ),
    ),
    x51 : (Int64, Int64),
  ) => {
    bdd_and_1_l(
      r1_tm, pth1, l1_tm, pth2, pth3, pth4, b1_tm, b2_tm, b3_tm, l2_tm, l3_tm, r2_tm,
      r3_tm, v_tm, pth5, pth6, pth7, pth8, x50, x51,
    )
  }
  let (varray_1, utable_1, ctable_1) = x86
  let (l_2, r_2) = x87
  if l_2 <= r_2 {
    let (ans_1, i_1) = bdd_and_1((varray_1, utable_1, ctable_1), (l_2, r_2))
    let t88 = @lib.apply(tfst(ctable_1.0, ctable_1.1, ctable_1.2).val, i_1).1
    let th = tfst(t88.0, t88.1, t88.2)
    (th, ans_1, i_1)
  } else {
    let (ans_2, i_2) = bdd_and_1((varray_1, utable_1, ctable_1), (r_2, l_2))
    let t89 = @lib.apply(tfst(ctable_1.0, ctable_1.1, ctable_1.2).val, i_2).1
    let th_1 = tfst(t89.0, t89.1, t89.2)
    let t91 = @kernel.dest_eq(@kernel.concl(th_1))
    let t92 = (fn(x90 : @kernel.Term) -> @kernel.Term raise { x90 })(t91.1)
    let ((ltm, rtm), ctm) = (@basics.dest_conj(t91.0), t92)
    let eth = @kernel.inst_rule(@list.List([(rtm, l1_tm), (ltm, r1_tm)]), pth8)
    (@kernel.trans(eth, th_1), ans_2, i_2)
  }
}

///|
/// `mk_ctable`
pub fn[TA, TB, TC, TD] mk_ctable(
  x95 : Unit,
) -> (Ref[@lib.Func[TA, TB]], Ref[Int64], Ref[@lib.Func[TC, TD]]) raise {
  let _ = x95
  let t96 = Ref::{ val: @lib.undefined(), }
  let t97 = Ref::{ val: 0L, }
  (Ref::{ val: @lib.undefined(), }, t97, t96)
}

///|
/// BDD_TRUE
fn step_7() -> Unit raise {
  bdd_true_c.set((bdd_1(), @kernel.refl(@term_syntax.parse_term("true"))))
}

///|
let bdd_true_c : @lib.Cell[(Int64, @kernel.Thm)] = @lib.Cell::new("BDD_TRUE")

///|
/// `BDD_TRUE`
pub fn bdd_true() -> (Int64, @kernel.Thm) {
  bdd_true_c.get()
}

///|
/// BDD_FALSE
fn step_8() -> Unit raise {
  bdd_false_c.set((bdd_0(), @class.taut(@term_syntax.parse_term("false == !true"))))
}

///|
let bdd_false_c : @lib.Cell[(Int64, @kernel.Thm)] = @lib.Cell::new("BDD_FALSE")

///|
/// `BDD_FALSE`
pub fn bdd_false() -> (Int64, @kernel.Thm) {
  bdd_false_c.get()
}

///|
/// BDD_VAR
fn step_9() -> Unit raise {
  let pth = @class.taut(
    @term_syntax.parse_term("(x : Bool) == (if (v : Bool) { true } else { !true }) → v == x"),
  )
  let x_tm = @term_syntax.parse_term("(x : Bool)")
  let v_tm = @term_syntax.parse_term("(v : Bool)")
  bdd_var_c.set(x98 => {
    let (vtable, utable, ctable) = x98
    fn(x99 : @kernel.Term) -> (Int64, @kernel.Thm) raise {
      let tm = x99
      let v = num_of_var(vtable, tm)
      let u = lookup_triple(
        tfst(vtable.0, vtable.1, vtable.2),
        utable,
        (v, bdd_1(), bdd_0()),
      )
      let ltm = btm_of_int(tfst(utable.0, utable.1, utable.2))(u)
      let sth = @kernel.inst_rule(@list.List([(ltm, x_tm), (tm, v_tm)]), pth)
      let th = @lib.apply(tfst(utable.0, utable.1, utable.2).val, u).1
      (u, @bool.mp(sth, th))
    }
  })
}

///|
let bdd_var_c : @lib.Cell[
  (
    (
      (FixedArray[@kernel.Term], Ref[Int64], @lib.OHashtbl[@kernel.Term, Int64]),
      (
        Ref[@lib.Func[Int64, ((Int64, Int64, Int64), @kernel.Thm)]],
        Ref[Int64],
        Ref[@lib.Func[(Int64, Int64, Int64), Int64]],
      ),
      (
        Ref[
          @lib.Func[
            Int64,
            (Int64, (@kernel.Thm, @list.List[Int64], @list.List[Int64])),
          ],
        ],
        Ref[Int64],
        Ref[@lib.Func[(Int64, Int64), Int64]],
      ),
    ),
  ) -> ((@kernel.Term) -> (Int64, @kernel.Thm) raise) raise,
] = @lib.Cell::new("BDD_VAR")

///|
/// `BDD_VAR`
pub fn bdd_var(
  x : (
    (FixedArray[@kernel.Term], Ref[Int64], @lib.OHashtbl[@kernel.Term, Int64]),
    (
      Ref[@lib.Func[Int64, ((Int64, Int64, Int64), @kernel.Thm)]],
      Ref[Int64],
      Ref[@lib.Func[(Int64, Int64, Int64), Int64]],
    ),
    (
      Ref[
        @lib.Func[
          Int64,
          (Int64, (@kernel.Thm, @list.List[Int64], @list.List[Int64])),
        ],
      ],
      Ref[Int64],
      Ref[@lib.Func[(Int64, Int64), Int64]],
    ),
  ),
) -> ((@kernel.Term) -> (Int64, @kernel.Thm) raise) raise {
  bdd_var_c.get()(x)
}

///|
/// BDD_NEG
fn step_10() -> Unit raise {
  let neg_tm = @term_syntax.parse_term("op_tilde")
  let x_tm = @term_syntax.parse_term("(x : Bool)")
  let pth = @class.taut(@term_syntax.parse_term("!!(x : Bool) == x"))
  bdd_neg_c.set(x100 => {
    let (vtable, utable, ctable) = x100
    fn(x101 : (Int64, @kernel.Thm)) -> (Int64, @kernel.Thm) raise {
      let (i, fth) = x101
      if i < 0L {
        let t102 = @lib.neg63(i)
        let utm = btm_of_int(tfst(utable.0, utable.1, utable.2))(t102)
        let th = @kernel.inst_rule(@list.List([(utm, x_tm)]), pth)
        let t103 = @kernel.trans(@equal.ap_term(neg_tm, fth), th)
        (@lib.neg63(i), t103)
      } else {
        let t104 = @equal.ap_term(neg_tm, fth)
        (@lib.neg63(i), t104)
      }
    }
  })
}

///|
let bdd_neg_c : @lib.Cell[
  (
    (
      (FixedArray[@kernel.Term], Ref[Int64], @lib.OHashtbl[@kernel.Term, Int64]),
      (
        Ref[@lib.Func[Int64, ((Int64, Int64, Int64), @kernel.Thm)]],
        Ref[Int64],
        Ref[@lib.Func[(Int64, Int64, Int64), Int64]],
      ),
      (
        Ref[
          @lib.Func[
            Int64,
            (Int64, (@kernel.Thm, @list.List[Int64], @list.List[Int64])),
          ],
        ],
        Ref[Int64],
        Ref[@lib.Func[(Int64, Int64), Int64]],
      ),
    ),
  ) -> (((Int64, @kernel.Thm)) -> (Int64, @kernel.Thm) raise) raise,
] = @lib.Cell::new("BDD_NEG")

///|
/// `BDD_NEG`
pub fn bdd_neg(
  x : (
    (FixedArray[@kernel.Term], Ref[Int64], @lib.OHashtbl[@kernel.Term, Int64]),
    (
      Ref[@lib.Func[Int64, ((Int64, Int64, Int64), @kernel.Thm)]],
      Ref[Int64],
      Ref[@lib.Func[(Int64, Int64, Int64), Int64]],
    ),
    (
      Ref[
        @lib.Func[
          Int64,
          (Int64, (@kernel.Thm, @list.List[Int64], @list.List[Int64])),
        ],
      ],
      Ref[Int64],
      Ref[@lib.Func[(Int64, Int64), Int64]],
    ),
  ),
) -> (((Int64, @kernel.Thm)) -> (Int64, @kernel.Thm) raise) raise {
  bdd_neg_c.get()(x)
}

///|
/// BDD_AND
fn step_11() -> Unit raise {
  let and_tm = @term_syntax.parse_term("op_slash_bslash")
  let t1_tm = @term_syntax.parse_term("(t1 : Bool)")
  let t2_tm = @term_syntax.parse_term("(t2 : Bool)")
  let pth = @bool.specl(@list.List([t1_tm, t2_tm]), @theorems.conj_sym())
  bdd_and_v1_c.set(x105 => {
    let (vtable, utable, ctable) = x105
    fn(
      x106 : ((Int64, @kernel.Thm), (Int64, @kernel.Thm)),
    ) -> (Int64, @kernel.Thm) raise {
      let ((i1, th1), (i2, th2)) = x106
      if i2 < i1 {
        let (i3, j) = bdd_and(
          (tfst(vtable.0, vtable.1, vtable.2), utable, ctable),
        )((i2, i1))
        let t107 = (btm_of_int(tfst(utable.0, utable.1, utable.2))(i2), t2_tm)
        let sth = @kernel.inst_rule(
          @list.List([
            (btm_of_int(tfst(utable.0, utable.1, utable.2))(i1), t1_tm),
            t107,
          ]),
          pth,
        )
        let t108 = @lib.apply(tfst(ctable.0, ctable.1, ctable.2).val, j).1
        let th = tfst(t108.0, t108.1, t108.2)
        let t109 = @kernel.trans(sth, th)
        (
          i3,
          @kernel.trans(
            @kernel.mk_comb_rule(@equal.ap_term(and_tm, th1), th2),
            t109,
          ),
        )
      } else {
        let (i3_1, j_1) = bdd_and(
          (tfst(vtable.0, vtable.1, vtable.2), utable, ctable),
        )((i1, i2))
        let t110 = @lib.apply(tfst(ctable.0, ctable.1, ctable.2).val, j_1).1
        let th_1 = tfst(t110.0, t110.1, t110.2)
        (
          i3_1,
          @kernel.trans(
            @kernel.mk_comb_rule(@equal.ap_term(and_tm, th1), th2),
            th_1,
          ),
        )
      }
    }
  })
}

///|
let bdd_and_v1_c : @lib.Cell[
  (
    (
      (FixedArray[@kernel.Term], Ref[Int64], @lib.OHashtbl[@kernel.Term, Int64]),
      (
        Ref[@lib.Func[Int64, ((Int64, Int64, Int64), @kernel.Thm)]],
        Ref[Int64],
        Ref[@lib.Func[(Int64, Int64, Int64), Int64]],
      ),
      (
        Ref[
          @lib.Func[
            Int64,
            (Int64, (@kernel.Thm, @list.List[Int64], @list.List[Int64])),
          ],
        ],
        Ref[Int64],
        Ref[@lib.Func[(Int64, Int64), Int64]],
      ),
    ),
  ) -> ((((Int64, @kernel.Thm), (Int64, @kernel.Thm))) -> (Int64, @kernel.Thm) raise) raise,
] = @lib.Cell::new("BDD_AND")

///|
/// `BDD_AND`
pub fn bdd_and_v1(
  x : (
    (FixedArray[@kernel.Term], Ref[Int64], @lib.OHashtbl[@kernel.Term, Int64]),
    (
      Ref[@lib.Func[Int64, ((Int64, Int64, Int64), @kernel.Thm)]],
      Ref[Int64],
      Ref[@lib.Func[(Int64, Int64, Int64), Int64]],
    ),
    (
      Ref[
        @lib.Func[
          Int64,
          (Int64, (@kernel.Thm, @list.List[Int64], @list.List[Int64])),
        ],
      ],
      Ref[Int64],
      Ref[@lib.Func[(Int64, Int64), Int64]],
    ),
  ),
) -> ((((Int64, @kernel.Thm), (Int64, @kernel.Thm))) -> (Int64, @kernel.Thm) raise) raise {
  bdd_and_v1_c.get()(x)
}

///|
/// BDD_OR
fn step_12() -> Unit raise {
  let pth = @class.taut(@term_syntax.parse_term("!(!(a : Bool) && !(b : Bool)) == (a || b)"))
  let rew : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(pth)
  let rewl : (@kernel.Term) -> @kernel.Thm raise = @equal.land_conv(rew)
  let rule : (@kernel.Thm) -> @kernel.Thm raise = (x111 : @kernel.Thm) => {
    @equal.conv_rule(rewl, x111)
  }
  bdd_or_c.set(x112 => {
    let tt = x112
    fn(
      x113 : ((Int64, @kernel.Thm), (Int64, @kernel.Thm)),
    ) -> (Int64, @kernel.Thm) raise {
      let (b1, b2) = x113
      let t114 = bdd_neg(tt)(b2)
      let t115 = (bdd_neg(tt)(b1), t114)
      let t116 = bdd_and_v1(tt)(t115)
      let (i, fth) = bdd_neg(tt)(t116)
      (i, rule(fth))
    }
  })
}

///|
let bdd_or_c : @lib.Cell[
  (
    (
      (FixedArray[@kernel.Term], Ref[Int64], @lib.OHashtbl[@kernel.Term, Int64]),
      (
        Ref[@lib.Func[Int64, ((Int64, Int64, Int64), @kernel.Thm)]],
        Ref[Int64],
        Ref[@lib.Func[(Int64, Int64, Int64), Int64]],
      ),
      (
        Ref[
          @lib.Func[
            Int64,
            (Int64, (@kernel.Thm, @list.List[Int64], @list.List[Int64])),
          ],
        ],
        Ref[Int64],
        Ref[@lib.Func[(Int64, Int64), Int64]],
      ),
    ),
  ) -> ((((Int64, @kernel.Thm), (Int64, @kernel.Thm))) -> (Int64, @kernel.Thm) raise) raise,
] = @lib.Cell::new("BDD_OR")

///|
/// `BDD_OR`
pub fn bdd_or(
  x : (
    (FixedArray[@kernel.Term], Ref[Int64], @lib.OHashtbl[@kernel.Term, Int64]),
    (
      Ref[@lib.Func[Int64, ((Int64, Int64, Int64), @kernel.Thm)]],
      Ref[Int64],
      Ref[@lib.Func[(Int64, Int64, Int64), Int64]],
    ),
    (
      Ref[
        @lib.Func[
          Int64,
          (Int64, (@kernel.Thm, @list.List[Int64], @list.List[Int64])),
        ],
      ],
      Ref[Int64],
      Ref[@lib.Func[(Int64, Int64), Int64]],
    ),
  ),
) -> ((((Int64, @kernel.Thm), (Int64, @kernel.Thm))) -> (Int64, @kernel.Thm) raise) raise {
  bdd_or_c.get()(x)
}

///|
/// BDD_IMP
fn step_13() -> Unit raise {
  let pth = @class.taut(@term_syntax.parse_term("!((a : Bool) && !(b : Bool)) == (a → b)"))
  let rew : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(pth)
  let rewl : (@kernel.Term) -> @kernel.Thm raise = @equal.land_conv(rew)
  let rule : (@kernel.Thm) -> @kernel.Thm raise = (x117 : @kernel.Thm) => {
    @equal.conv_rule(rewl, x117)
  }
  bdd_imp_c.set(x118 => {
    let tt = x118
    fn(
      x119 : ((Int64, @kernel.Thm), (Int64, @kernel.Thm)),
    ) -> (Int64, @kernel.Thm) raise {
      let (b1, b2) = x119
      let t120 = (b1, bdd_neg(tt)(b2))
      let t121 = bdd_and_v1(tt)(t120)
      let (i, fth) = bdd_neg(tt)(t121)
      (i, rule(fth))
    }
  })
}

///|
let bdd_imp_c : @lib.Cell[
  (
    (
      (FixedArray[@kernel.Term], Ref[Int64], @lib.OHashtbl[@kernel.Term, Int64]),
      (
        Ref[@lib.Func[Int64, ((Int64, Int64, Int64), @kernel.Thm)]],
        Ref[Int64],
        Ref[@lib.Func[(Int64, Int64, Int64), Int64]],
      ),
      (
        Ref[
          @lib.Func[
            Int64,
            (Int64, (@kernel.Thm, @list.List[Int64], @list.List[Int64])),
          ],
        ],
        Ref[Int64],
        Ref[@lib.Func[(Int64, Int64), Int64]],
      ),
    ),
  ) -> ((((Int64, @kernel.Thm), (Int64, @kernel.Thm))) -> (Int64, @kernel.Thm) raise) raise,
] = @lib.Cell::new("BDD_IMP")

///|
/// `BDD_IMP`
pub fn bdd_imp(
  x : (
    (FixedArray[@kernel.Term], Ref[Int64], @lib.OHashtbl[@kernel.Term, Int64]),
    (
      Ref[@lib.Func[Int64, ((Int64, Int64, Int64), @kernel.Thm)]],
      Ref[Int64],
      Ref[@lib.Func[(Int64, Int64, Int64), Int64]],
    ),
    (
      Ref[
        @lib.Func[
          Int64,
          (Int64, (@kernel.Thm, @list.List[Int64], @list.List[Int64])),
        ],
      ],
      Ref[Int64],
      Ref[@lib.Func[(Int64, Int64), Int64]],
    ),
  ),
) -> ((((Int64, @kernel.Thm), (Int64, @kernel.Thm))) -> (Int64, @kernel.Thm) raise) raise {
  bdd_imp_c.get()(x)
}

///|
/// BDD_IFF
fn step_14() -> Unit raise {
  let pth = @class.taut(
    @term_syntax.parse_term("(!((a : Bool) && !(b : Bool)) && !(!a && b)) == (a == b)"),
  )
  let rew : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(pth)
  let rewl : (@kernel.Term) -> @kernel.Thm raise = @equal.land_conv(rew)
  let rule : (@kernel.Thm) -> @kernel.Thm raise = (x122 : @kernel.Thm) => {
    @equal.conv_rule(rewl, x122)
  }
  bdd_iff_c.set(x123 => {
    let tt = x123
    fn(
      x124 : ((Int64, @kernel.Thm), (Int64, @kernel.Thm)),
    ) -> (Int64, @kernel.Thm) raise {
      let (b1, b2) = x124
      let t127 = (bdd_neg(tt)(b1), b2)
      let t128 = bdd_and_v1(tt)(t127)
      let t129 = bdd_neg(tt)(t128)
      let t125 = (b1, bdd_neg(tt)(b2))
      let t126 = bdd_and_v1(tt)(t125)
      let t130 = (bdd_neg(tt)(t126), t129)
      let (i, fth) = bdd_and_v1(tt)(t130)
      (i, rule(fth))
    }
  })
}

///|
let bdd_iff_c : @lib.Cell[
  (
    (
      (FixedArray[@kernel.Term], Ref[Int64], @lib.OHashtbl[@kernel.Term, Int64]),
      (
        Ref[@lib.Func[Int64, ((Int64, Int64, Int64), @kernel.Thm)]],
        Ref[Int64],
        Ref[@lib.Func[(Int64, Int64, Int64), Int64]],
      ),
      (
        Ref[
          @lib.Func[
            Int64,
            (Int64, (@kernel.Thm, @list.List[Int64], @list.List[Int64])),
          ],
        ],
        Ref[Int64],
        Ref[@lib.Func[(Int64, Int64), Int64]],
      ),
    ),
  ) -> ((((Int64, @kernel.Thm), (Int64, @kernel.Thm))) -> (Int64, @kernel.Thm) raise) raise,
] = @lib.Cell::new("BDD_IFF")

///|
/// `BDD_IFF`
pub fn bdd_iff(
  x : (
    (FixedArray[@kernel.Term], Ref[Int64], @lib.OHashtbl[@kernel.Term, Int64]),
    (
      Ref[@lib.Func[Int64, ((Int64, Int64, Int64), @kernel.Thm)]],
      Ref[Int64],
      Ref[@lib.Func[(Int64, Int64, Int64), Int64]],
    ),
    (
      Ref[
        @lib.Func[
          Int64,
          (Int64, (@kernel.Thm, @list.List[Int64], @list.List[Int64])),
        ],
      ],
      Ref[Int64],
      Ref[@lib.Func[(Int64, Int64), Int64]],
    ),
  ),
) -> ((((Int64, @kernel.Thm), (Int64, @kernel.Thm))) -> (Int64, @kernel.Thm) raise) raise {
  bdd_iff_c.get()(x)
}

///|
/// `BDD_OF_TERM`
pub fn bdd_of_term(
  x131 : @lib.Func[@kernel.Term, (Int64, @kernel.Thm)],
  x132 : (
    (FixedArray[@kernel.Term], Ref[Int64], @lib.OHashtbl[@kernel.Term, Int64]),
    (
      Ref[@lib.Func[Int64, ((Int64, Int64, Int64), @kernel.Thm)]],
      Ref[Int64],
      Ref[@lib.Func[(Int64, Int64, Int64), Int64]],
    ),
    (
      Ref[
        @lib.Func[
          Int64,
          (Int64, (@kernel.Thm, @list.List[Int64], @list.List[Int64])),
        ],
      ],
      Ref[Int64],
      Ref[@lib.Func[(Int64, Int64), Int64]],
    ),
  ),
  x133 : @kernel.Term,
) -> (Int64, @kernel.Thm) raise {
  let defs = x131
  let tt = x132
  let tm = x133
  match tm {
    @kernel.Term::Const("T", _) => bdd_true()
    @kernel.Term::Const("F", _) => bdd_false()
    @kernel.Term::Comb(@kernel.Term::Comb(@kernel.Term::Const("/\\", _), l), r) => {
      let t134 = bdd_of_term(defs, tt, r)
      let t135 = (bdd_of_term(defs, tt, l), t134)
      bdd_and_v1(tt)(t135)
    }
    @kernel.Term::Comb(
      @kernel.Term::Comb(@kernel.Term::Const("\\/", _), l_1),
      r_1
    ) => {
      let t136 = bdd_of_term(defs, tt, r_1)
      let t137 = (bdd_of_term(defs, tt, l_1), t136)
      bdd_or(tt)(t137)
    }
    @kernel.Term::Comb(
      @kernel.Term::Comb(@kernel.Term::Const("==>", _), l_2),
      r_2
    ) => {
      let t138 = bdd_of_term(defs, tt, r_2)
      let t139 = (bdd_of_term(defs, tt, l_2), t138)
      bdd_imp(tt)(t139)
    }
    @kernel.Term::Comb(
      @kernel.Term::Comb(
        @kernel.Term::Const(
          "=",
          @kernel.HolType::Tyapp(
            "fun",
            More(
              @kernel.HolType::Tyapp("bool", Empty),
              tail=More(_, tail=Empty)
            )
          )
        ),
        l_3
      ),
      r_3
    ) => {
      let t140 = bdd_of_term(defs, tt, r_3)
      let t141 = (bdd_of_term(defs, tt, l_3), t140)
      bdd_iff(tt)(t141)
    }
    @kernel.Term::Comb(@kernel.Term::Const("~", _), l_4) => {
      let t142 = bdd_of_term(defs, tt, @kernel.rand(tm))
      bdd_neg(tt)(t142)
    }
    _ =>
      @lib.apply(defs, tm) catch {
        Failure(_) => bdd_var(tt)(tm)
        e => raise e
      }
  }
}

///|
/// BDD_EXISTS
fn step_15() -> Unit raise {
  let t148 = @term_syntax.parse_term("(∃ p : Bool, !true) == !true")
  let t149 = @term_syntax.parse_term("(∃ p : Bool, true) == true")
  let t150 = @term_syntax.parse_term("(∃ p : _, (if (x : Bool) { (q : (_) -> Bool)(p) } else { (r : (_) -> Bool)(p) })) == (if x { ∃ p : _, q(p) } else { ∃ p : _, r(p) })")
  bdd_exists_c.set(
    match
      @lib.map(
        fn(x143 : @kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
          let t = x143
          @simp.gen_rewrite_rule(
            fn(
              x145 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s146 = @equal.rand_conv(x145)
              fn(x147 : @kernel.Term) -> @kernel.Thm raise { s146(x147) }
            },
            @list.List([@meson.meson(@list.List([]), t)]),
          )
        },
        @list.List([
          @term_syntax.parse_term("(∃ p : Bool, (if p { (q : Bool) } else { (r : Bool) })) == (q || r)"),
          t150,
          t149,
          t148,
        ]),
      ) {
      More(
        rule_e,
        tail=More(rule_d, tail=More(rule_t, tail=More(rule_f, tail=Empty)))
      ) =>
        fn(
          x151 : (
            (
              FixedArray[@kernel.Term],
              Ref[Int64],
              @lib.OHashtbl[@kernel.Term, Int64],
            ),
            (
              Ref[@lib.Func[Int64, ((Int64, Int64, Int64), @kernel.Thm)]],
              Ref[Int64],
              Ref[@lib.Func[(Int64, Int64, Int64), Int64]],
            ),
            (
              Ref[
                @lib.Func[
                  Int64,
                  (Int64, (@kernel.Thm, @list.List[Int64], @list.List[Int64])),
                ],
              ],
              Ref[Int64],
              Ref[@lib.Func[(Int64, Int64), Int64]],
            ),
          ),
        ) -> ((@kernel.Term) -> (((Int64, @kernel.Thm)) -> (Int64, @kernel.Thm) raise) raise) raise {
          let (vtable, utable, ctable) = x151
          fn(
            x152 : @kernel.Term,
          ) -> (((Int64, @kernel.Thm)) -> (Int64, @kernel.Thm) raise) raise {
            let x = x152
            let etable = Ref::{ val: @lib.undefined(), }
            let xn = num_of_var(vtable, x)
            fn bdd_exists_1(
              x154 : Int64,
              x155 : @kernel.Thm,
            ) -> (Int64, @kernel.Thm) raise {
              let (n, th) = (x154, x155)
              @lib.apply(etable.val, n) catch {
                Failure(_) => {
                  let res = if n == bdd_0() {
                    (bdd_0(), rule_f(@drule.mk_exists_rule(x, th)))
                  } else if n == bdd_1() {
                    (bdd_1(), rule_t(@drule.mk_exists_rule(x, th)))
                  } else {
                    let (v, nt, nf) = bdd_expand(
                      tfst(utable.0, utable.1, utable.2),
                      n,
                    )
                    let eth = @kernel.trans(
                      th,
                      bdd_expand_v1(tfst(utable.0, utable.1, utable.2))(n),
                    )
                    let (_, (ntm, nfm)) = @class.dest_cond(
                      @kernel.rand(@kernel.concl(eth)),
                    )
                    if v == xn {
                      let t156 = (nf, @kernel.refl(nfm))
                      let t157 = ((nt, @kernel.refl(ntm)), t156)
                      let (onum, oth) = bdd_or((vtable, utable, ctable))(t157)
                      (
                        onum,
                        @kernel.trans(
                          rule_e(@drule.mk_exists_rule(x, eth)),
                          oth,
                        ),
                      )
                    } else {
                      let (lnum, lth) = bdd_exists_1(nt, @kernel.refl(ntm))
                      let (rnum, rth) = bdd_exists_1(nf, @kernel.refl(nfm))
                      let t158 = @kernel.mk_comb_rule(
                        @equal.ap_term(
                          @kernel.rator(
                            @kernel.rator(@kernel.rand(@kernel.concl(eth))),
                          ),
                          lth,
                        ),
                        rth,
                      )
                      let wth = @kernel.trans(
                        rule_d(@drule.mk_exists_rule(x, eth)),
                        t158,
                      )
                      let (fth, wn, _) = bdd_lookup(
                        tfst(vtable.0, vtable.1, vtable.2),
                      )(utable)((v, lnum, rnum))
                      (wn, @kernel.trans(wth, @equal.sym(fth)))
                    }
                  }
                  {
                    etable.val = @lib.update(n, res, etable.val)
                    ()
                  }
                  res
                }
                e => raise e
              }
            }
            fn(x159 : (Int64, @kernel.Thm)) -> (Int64, @kernel.Thm) raise {
              bdd_exists_1(x159.0, x159.1)
            }
          }
        }
      _ => raise @lib.MatchFailure("tscript.ml:343")
    },
  )
}

///|
let bdd_exists_c : @lib.Cell[
  (
    (
      (FixedArray[@kernel.Term], Ref[Int64], @lib.OHashtbl[@kernel.Term, Int64]),
      (
        Ref[@lib.Func[Int64, ((Int64, Int64, Int64), @kernel.Thm)]],
        Ref[Int64],
        Ref[@lib.Func[(Int64, Int64, Int64), Int64]],
      ),
      (
        Ref[
          @lib.Func[
            Int64,
            (Int64, (@kernel.Thm, @list.List[Int64], @list.List[Int64])),
          ],
        ],
        Ref[Int64],
        Ref[@lib.Func[(Int64, Int64), Int64]],
      ),
    ),
  ) -> ((@kernel.Term) -> (((Int64, @kernel.Thm)) -> (Int64, @kernel.Thm) raise) raise) raise,
] = @lib.Cell::new("BDD_EXISTS")

///|
/// `BDD_EXISTS`
pub fn bdd_exists(
  x : (
    (FixedArray[@kernel.Term], Ref[Int64], @lib.OHashtbl[@kernel.Term, Int64]),
    (
      Ref[@lib.Func[Int64, ((Int64, Int64, Int64), @kernel.Thm)]],
      Ref[Int64],
      Ref[@lib.Func[(Int64, Int64, Int64), Int64]],
    ),
    (
      Ref[
        @lib.Func[
          Int64,
          (Int64, (@kernel.Thm, @list.List[Int64], @list.List[Int64])),
        ],
      ],
      Ref[Int64],
      Ref[@lib.Func[(Int64, Int64), Int64]],
    ),
  ),
) -> ((@kernel.Term) -> (((Int64, @kernel.Thm)) -> (Int64, @kernel.Thm) raise) raise) raise {
  bdd_exists_c.get()(x)
}

///|
/// `bdd_stats`
pub fn[TA, TB, TC, TD, TE, TF] bdd_stats(
  x160 : Int64,
  x161 : ((TA, Ref[Int64], TB), (TC, Ref[Int64], TD), (TE, Ref[Int64], TF)),
) -> Unit raise {
  let nd = x160
  let (vt, ct, ut) = x161
  let d = if nd == 0L { "" } else { Int64::to_string(nd) + " definitions, " }
  let t162 = " nodes and " +
    (Int64::to_string(tsnd(ct.0, ct.1, ct.2).val) + " cached results")
  let t163 = " variables, " +
    (Int64::to_string(tsnd(ut.0, ut.1, ut.2).val) + t162)
  @lib.remark(
    "BDD with " + (d + (Int64::to_string(tsnd(vt.0, vt.1, vt.2).val) + t163)),
  )
}

///|
/// `BDD_TAUT`
pub fn bdd_taut(x164 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x164
  let vt = mk_vtable(Int::to_int64(@lib.length(@basics.atoms(tm))))
  let ut = mk_utable(())
  let ct = mk_ctable(())
  let b = bdd_of_term(@lib.undefined(), (vt, ut, ct), tm)
  let _ = bdd_stats(0L, (vt, ct, ut))
  @bool.eqt_elim(b.1)
}

///|
/// BDD_DEFTAUT
fn step_16() -> Unit raise {
  fn bdd_of_defs(
    x169 : @lib.Func[@kernel.Term, (Int64, @kernel.Thm)],
    x170 : (
      (FixedArray[@kernel.Term], Ref[Int64], @lib.OHashtbl[@kernel.Term, Int64]),
      (
        Ref[@lib.Func[Int64, ((Int64, Int64, Int64), @kernel.Thm)]],
        Ref[Int64],
        Ref[@lib.Func[(Int64, Int64, Int64), Int64]],
      ),
      (
        Ref[
          @lib.Func[
            Int64,
            (Int64, (@kernel.Thm, @list.List[Int64], @list.List[Int64])),
          ],
        ],
        Ref[Int64],
        Ref[@lib.Func[(Int64, Int64), Int64]],
      ),
    ),
    x171 : @list.List[@kernel.Thm],
  ) -> @lib.Func[@kernel.Term, (Int64, @kernel.Thm)] raise {
    let defs = x169
    let tt = x170
    let ths = x171
    match ths {
      Empty => defs
      More(th_1, tail=oths) => {
        let (lv, rt) = @kernel.dest_eq(@kernel.concl(th_1))
        let br = bdd_of_term(defs, tt, rt)
        let bl = bdd_def_l(th_1)(br)
        bdd_of_defs(@lib.update(lv, bl, defs), tt, oths)
      }
    }
  }
  let is_atomic : (@kernel.Term) -> Bool raise = fn(
    x172 : @kernel.Term,
  ) -> Bool raise {
    let tm = x172
    !(@basics.is_neg(tm) ||
    @basics.is_conj(tm) ||
    @basics.is_disj(tm) ||
    @basics.is_imp(tm) ||
    @bool.is_iff(tm))
  }
  let is_literal : (@kernel.Term) -> Bool raise = fn(
    x173 : @kernel.Term,
  ) -> Bool raise {
    let tm_1 = x173
    (@basics.is_neg(tm_1) && is_atomic(@kernel.rand(tm_1))) || is_atomic(tm_1)
  }
  let valid_definition : (@kernel.Term) -> Bool raise = fn(
    x174 : @kernel.Term,
  ) -> Bool raise {
    let tm_2 = x174
    (@bool.is_iff(tm_2) && is_literal(@equal.lhand(tm_2))) || is_literal(tm_2)
  }
  let adjust_def : (@kernel.Thm) -> @kernel.Thm raise = fn(
    x175 : @kernel.Thm,
  ) -> @kernel.Thm raise {
    let th_2 = x175
    let tm_3 = @kernel.concl(th_2)
    if @basics.is_neg(tm_3) {
      @bool.eqf_intro(th_2)
    } else if @bool.is_iff(tm_3) {
      th_2
    } else {
      @bool.eqt_intro(th_2)
    }
  }
  fn acyclic(
    x176 : @list.List[@kernel.Term],
    x177 : @list.List[@kernel.Term],
  ) -> Bool raise {
    let oks = x176
    let tms = x177
    match tms {
      Empty => true
      More(tm_4, tail=otms) => {
        let t181 = oks.prepend(@kernel.rand(tm_4))
        let t178 = @equal.lhs(tm_4)
        !@lib.exists(
          fn(x180 : @kernel.Term) -> Bool raise {
            ((x179 : @kernel.Term) => @basics.free_in(t178, x179))(x180)
          },
          t181,
        ) &&
        acyclic(oks.prepend(tm_4), otms)
      }
    }
  }
  let valid_definitions : (@kernel.Term) -> Bool raise = fn(
    x182 : @kernel.Term,
  ) -> Bool raise {
    let tm_5 = x182
    let tms_1 = @lib.map(
      fn(x185 : @kernel.Term) -> @kernel.Term raise {
        (fn(x184 : @kernel.Thm) -> @kernel.Term raise {
          (fn(x183 : @kernel.Thm) -> @kernel.Term raise { @kernel.concl(x183) })(
            adjust_def(x184),
          )
        })(@kernel.assume_rule(x185))
      },
      @basics.conjuncts(tm_5),
    )
    @lib.forall(valid_definition, tms_1) && acyclic(@list.List([]), tms_1)
  }
  bdd_deftaut_c.set(fn(
    x186 : @list.List[@kernel.Term],
  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let ivars = x186
    fn(x187 : @kernel.Term) -> @kernel.Thm raise {
      let tm_6 = x187
      let vars = ivars.concat(@lib.subtract(@basics.atoms(tm_6), ivars))
      let vt = mk_vtable(Int::to_int64(@lib.length(vars)))
      let ut = mk_utable(())
      let ct = mk_ctable(())
      let t189 = bdd_var((vt, ut, ct))
      let _ = @lib.do_list(
        fn(x190 : @kernel.Term) -> Unit raise {
          (fn(x188 : (Int64, @kernel.Thm)) -> Unit raise { ignore(x188) })(
            t189(x190),
          )
        },
        ivars,
      )
      if @basics.is_imp(tm_6) && valid_definitions(@equal.lhand(tm_6)) {
        let ths_1 = @lib.map(
          adjust_def,
          @bool.conjuncts_rule(@kernel.assume_rule(@equal.lhand(tm_6))),
        )
        let defs_1 = bdd_of_defs(@lib.undefined(), (vt, ut, ct), ths_1)
        let b = bdd_of_term(defs_1, (vt, ut, ct), @kernel.rand(tm_6))
        let _ = bdd_stats(
          Int::to_int64(@lib.length(@lib.dom(defs_1))),
          (vt, ct, ut),
        )
        let t191 = @bool.eqt_elim(b.1)
        @bool.disch(@equal.lhand(tm_6), t191)
      } else {
        let b_1 = bdd_of_term(@lib.undefined(), (vt, ut, ct), tm_6)
        let _ = bdd_stats(0L, (vt, ct, ut))
        @bool.eqt_elim(b_1.1)
      }
    }
  })
}

///|
let bdd_deftaut_c : @lib.Cell[
  (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
] = @lib.Cell::new("BDD_DEFTAUT")

///|
/// `BDD_DEFTAUT`
pub fn bdd_deftaut(
  x : @list.List[@kernel.Term],
) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  bdd_deftaut_c.get()(x)
}

///|
fn[TA] bdd_def_l(
  x165 : @kernel.Thm,
) -> (((TA, @kernel.Thm)) -> (TA, @kernel.Thm) raise) raise {
  let th = x165
  let rule : (@kernel.Thm) -> @kernel.Thm raise = (x167 : @kernel.Thm) => {
    @kernel.trans(th, x167)
  }
  fn(x168 : (TA, @kernel.Thm)) -> (TA, @kernel.Thm) raise {
    let (i, fth) = x168
    (i, rule(fth))
  }
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
}
