// Translated from upstream Minisat/minisat_parse.ml; edit this file directly.

///|
/// `rootc`
#derive(Eq, Debug)
pub(all) enum Rootc {
  Rthm(@kernel.Thm, @sat_common_tools.T3, @kernel.Term, @kernel.Thm)
  Ll(@kernel.Term, @sat_common_tools.T3)
}

///|
pub extend Rootc with Eq::{not_equal, equal}

///|
pub extend Rootc with Debug::{to_repr}

///|
pub extend Rootc with @lib.OCompare::{ocompare}

///|
pub extend Rootc with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_Rootc(x : Rootc) -> Int {
  match x {
    Rthm(_, _, _, _) => 1000000
    Ll(_, _) => 1000001
  }
}

///|
pub impl @lib.OCompare for Rootc with fn ocompare(self, other) {
  match (self, other) {
    (Rthm(a0, a1, a2, a3), Rthm(b0, b1, b2, b3)) => {
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
    (Ll(a0, a1), Ll(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    _ => ocaml_rank_Rootc(self).compare(ocaml_rank_Rootc(other))
  }
}

///|
pub impl @lib.OHash for Rootc with fn ohash_visit(self, h) {
  match self {
    Rthm(a0, a1, a2, a3) => {
      h.block(0, 4)
      h.field(a0)
      h.field(a1)
      h.field(a2)
      h.field(a3)
    }
    Ll(a0, a1) => {
      h.block(1, 2)
      h.field(a0)
      h.field(a1)
    }
  }
}

///|
/// `clause`
#derive(Eq, Debug)
pub(all) enum Clause {
  Blank
  Chain(@list.List[(Int64, Int64)], Int64)
  Root(Rootc)
  Learnt(@kernel.Thm, @sat_common_tools.T3)
}

///|
pub extend Clause with Eq::{not_equal, equal}

///|
pub extend Clause with Debug::{to_repr}

///|
pub extend Clause with @lib.OCompare::{ocompare}

///|
pub extend Clause with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_Clause(x : Clause) -> Int {
  match x {
    Blank => 0
    Chain(_, _) => 1000000
    Root(_) => 1000001
    Learnt(_, _) => 1000002
  }
}

///|
pub impl @lib.OCompare for Clause with fn ocompare(self, other) {
  match (self, other) {
    (Chain(a0, a1), Chain(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    (Root(a0), Root(b0)) => {
      
      @lib.compare(a0, b0)
    }
    (Learnt(a0, a1), Learnt(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    _ => ocaml_rank_Clause(self).compare(ocaml_rank_Clause(other))
  }
}

///|
pub impl @lib.OHash for Clause with fn ohash_visit(self, h) {
  match self {
    Blank => h.int(0L)
    Chain(a0, a1) => {
      h.block(0, 2)
      h.field(a0)
      h.field(a1)
    }
    Root(a0) => {
      h.block(1, 1)
      h.field(a0)
    }
    Learnt(a0, a1) => {
      h.block(2, 2)
      h.field(a0)
      h.field(a1)
    }
  }
}

///|
/// `sat_fileopen`
pub fn sat_fileopen(x1 : String) -> @lib.InChannel raise {
  let s = x1
  @lib.open_in(s)
}

///|
/// `sat_fileclose`
pub fn sat_fileclose(x2 : @lib.InChannel) -> Unit raise {
  let is_ = x2
  @lib.close_in(is_)
}

///|
/// `sat_getChar`
pub fn sat_getchar(x3 : @lib.InChannel) -> Int raise {
  let is_ = x3
  Int64::to_int(@lib.input_byte(is_))
}

///|
/// `sat_getint`
pub fn sat_getint(x4 : @lib.InChannel) -> Int64 raise {
  let is_ = x4
  let land : (Int) -> ((Int) -> Int raise) raise = fn(x5 : Int) -> ((Int) -> Int raise) raise {
    fn(x6 : Int) -> Int raise {
      (x5 & x6)
    }
  }
  let lor : (Int) -> ((Int) -> Int raise) raise = fn(x7 : Int) -> ((Int) -> Int raise) raise {
    fn(x8 : Int) -> Int raise {
      (x7 | x8)
    }
  }
  let lsl : (Int) -> ((Int64) -> Int raise) raise = fn(x9 : Int) -> ((Int64) -> Int raise) raise {
    fn(x10 : Int64) -> Int raise {
      (x9 << @lib.int63_to_int(x10))
    }
  }
  let lsr : (Int) -> ((Int64) -> Int raise) raise = fn(x11 : Int) -> ((Int64) -> Int raise) raise {
    fn(x12 : Int64) -> Int raise {
      (x11 >> @lib.int63_to_int(x12))
    }
  }
  let byte0 = sat_getchar(is_)
  let t14 = Int64::to_int(0L)
  let t13 = Int64::to_int(128L)
  if (land(byte0)(t13) == t14) {
    Int::to_int64(byte0)
  } else {
    let t15 = Int64::to_int(96L)
    match Int::to_int64(lsr(land(byte0)(t15))(5L)) {
      0L => {
        let byte1 = sat_getchar(is_)
        let t16 = Int64::to_int(31L)
        Int::to_int64(lor(lsl(land(byte0)(t16))(8L))(byte1))
      }
      1L => {
        let byte1_1 = sat_getchar(is_)
        let byte2 = sat_getchar(is_)
        let t18 = lsl(byte1_1)(8L)
        let t17 = Int64::to_int(31L)
        Int::to_int64(lor(lor(lsl(land(byte0)(t17))(16L))(t18))(byte2))
      }
      2L => {
        let byte1_2 = sat_getchar(is_)
        let byte2_1 = sat_getchar(is_)
        let byte3 = sat_getchar(is_)
        let t21 = lsl(byte2_1)(8L)
        let t20 = lsl(byte1_2)(16L)
        let t19 = Int64::to_int(31L)
        Int::to_int64(lor(lor(lor(lsl(land(byte0)(t19))(24L))(t20))(t21))(byte3))
      }
      _ => {
        let byte0_1 = sat_getchar(is_)
        let byte1_3 = sat_getchar(is_)
        let byte2_2 = sat_getchar(is_)
        let byte3_1 = sat_getchar(is_)
        let byte4 = sat_getchar(is_)
        let byte5 = sat_getchar(is_)
        let byte6 = sat_getchar(is_)
        let byte7 = sat_getchar(is_)
        let t25 = lsl(byte6)(8L)
        let t24 = lsl(byte5)(16L)
        let t26 = lor(lor(lor(lsl(byte4)(24L))(t24))(t25))(byte7)
        let t23 = lsl(byte2_2)(8L)
        let t22 = lsl(byte1_3)(16L)
        Int::to_int64(lor(lsl(lor(lor(lor(lsl(byte0_1)(24L))(t22))(t23))(byte3_1))(32L))(t26))
      }
    }
  }
}

///|
/// `isRootClauseIdx`
pub fn isrootclauseidx(x27 : FixedArray[Clause], x28 : Int64) -> Bool raise {
  let cl = x27
  let ci = x28
  match @lib.array_get(cl, @lib.int63_to_int(ci)) {
    Clause::Root(_) => true
    _ => false
  }
}

///|
/// `literalToInt2`
pub fn literaltoint2(x29 : @kernel.Term) -> Int64 raise {
  let p = x29
  let (sign, vnum) = @dimacs_tools.literaltoint(p)
  let t30 = if sign {
    1L
  } else {
    0L
  }
  @lib.add63(@lib.mul63(2L, @lib.sub63(vnum, 1L)), t30)
}

///|
/// `literalToInt3`
pub fn literaltoint3(x31 : @kernel.Term) -> ((Bool, Int64)) raise {
  let p = x31
  let (sign, vnum) = @dimacs_tools.literaltoint(p)
  (sign, @lib.sub63(vnum, 1L))
}

///|
/// `getIntRoot`
pub fn getintroot(x32 : @lib.InChannel, x33 : Int64) -> @list.List[Int64] raise {
  let fin = x32
  let idx = x33
  fn loop_(x34 : Int64, x35 : @list.List[Int64]) -> @list.List[Int64] raise {
    let idx_p = x34
    let acc = x35
    let v = sat_getint(fin)
    if (v == 0L) {
      @lib.rev(acc).prepend(idx)
    } else {
      let t36 = acc.prepend(@lib.add63(idx_p, v))
      loop_(@lib.add63(idx_p, v), t36)
    }
  }
  let res = loop_(idx, @list.List([]))
  res
}

///|
/// `is_compl`
pub fn is_compl(x37 : Int64, x38 : Int64) -> Bool raise {
  let l1 = x37
  let l2 = x38
  ((@lib.abs63(@lib.sub63(l2, l1)) == 1L) && (@lib.mod63(l1, 2L) == 0L))
}

///|
/// `isSameClause`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] issameclause(x39 : TA, x40 : TA) -> Bool raise {
  let (il, sl) = (x39, x40)
  (Int::to_int64(@lib.compare(il, sl)) == 0L)
}

///|
/// `getNextRootClause`
pub fn[TA, TB] getnextrootclause(x41 : FixedArray[TA], x42 : TB, x43 : TA, x44 : Int64, x45 : @list.List[Int64], x46 : FixedArray[@kernel.Term]) -> ((Int64, (@kernel.Term, @oset.T[(Bool, Int64)]))) raise {
  let scl = x41
  let vc = x42
  let cc = x43
  let lr = x44
  let il = x45
  let rcv = x46
  let rc = @lib.array_get(rcv, @lib.int63_to_int(lr))
  let rcl = @basics.disjuncts(rc)
  let lnl = @lib.map(literaltoint3, rcl)
  let lns = @lib.fold_left(fn(x47 : @oset.T[(Bool, Int64)], x48 : (Bool, Int64)) -> @oset.T[(Bool, Int64)] raise {
    let s = x47
    let e = x48
    @sat_common_tools.add_v1(e, s)
  }, @sat_common_tools.empty_v1(), lnl)
  let slnl = @lib.list_sort(fn(x51 : Int64, x52 : Int64) -> Int raise {
    let s53 = (fn(x49 : Int64) -> ((Int64) -> Int64 raise) raise {
      fn(x50 : Int64) -> Int64 raise {
        Int::to_int64(@lib.compare(x49, x50))
      }
    })(x51)
    @lib.int63_to_int(s53(x52))
  }, @lib.setify(@lib.map(fn(x54 : (Bool, Int64)) -> Int64 raise {
    let (isn, vi) = x54
    if isn {
      @lib.add63(@lib.mul63(2L, vi), 1L)
    } else {
      @lib.mul63(2L, vi)
    }
  }, lnl)))
  if issameclause(il, slnl) {
    @lib.array_set(scl, @lib.int63_to_int(lr), cc)
    (lr, (rc, lns))
  } else {
    getnextrootclause(scl, vc, cc, @lib.add63(lr, 1L), il, rcv)
  }
}

///|
/// `addClause`
pub fn[TA] addclause(x55 : FixedArray[Int64], x56 : TA, x57 : Int64, x58 : Int64, x59 : FixedArray[@kernel.Term], x60 : @lib.InChannel, x61 : @list.List[Clause], x62 : Int64) -> ((Int64, Int64, @list.List[Clause])) raise {
  let scl = x55
  let vc = x56
  let cc = x57
  let lr = x58
  let rcv = x59
  let fin = x60
  let sr = x61
  let lit1 = x62
  let l = getintroot(fin, @lib.lsr63(lit1, 1L))
  let res = match l {
    Empty => raise Failure(("addClause:Failed parsing clause " + (Int64::to_string(cc) + "\n")))
    _ => {
      let (lr_1, (t, lns)) = getnextrootclause(scl, vc, cc, lr, l, rcv)
      let t63 = sr.prepend(Clause::Root(Rootc::Ll(t, lns)))
      let t64 = @lib.add63(lr_1, 1L)
      (@lib.add63(cc, 1L), t64, t63)
    }
  }
  res
}

///|
/// `getIntBranch`
pub fn getintbranch(x65 : @lib.InChannel, x66 : Int64, x67 : Int64) -> ((@list.List[(Int64, Int64)], Int64)) raise {
  let fin = x65
  let id = x66
  let h = x67
  fn loop_(x68 : @list.List[(Int64, Int64)], x69 : Int64) -> ((@list.List[(Int64, Int64)], Int64)) raise {
    let acc = x68
    let len = x69
    let v = @lib.sub63(sat_getint(fin), 1L)
    if (v == (-1L)) {
      let t70 = @lib.add63(len, 1L)
      (@lib.rev(acc).prepend((v, h)), t70)
    } else {
      let ci = @lib.sub63(id, sat_getint(fin))
      loop_(acc.prepend((v, ci)), @lib.add63(len, 1L))
    }
  }
  let res = loop_(@list.List([]), 0L)
  res
}

///|
/// `addBranch`
pub fn addbranch(x71 : @lib.InChannel, x72 : @list.List[Clause], x73 : Int64, x74 : Int64, x75 : Int64) -> ((Int64, Bool, @list.List[Clause])) raise {
  let fin = x71
  let sr = x72
  let cc = x73
  let id = x74
  let tc = x75
  let (br, brl) = getintbranch(fin, id, @lib.sub63(id, @lib.lsr63(tc, 1L)))
  let res = if (brl == 1L) {
    (cc, false, sr)
  } else {
    let t76 = sr.prepend(Clause::Chain(br, brl))
    (@lib.add63(cc, 1L), true, t76)
  }
  res
}

///|
/// `readTrace_aux`
pub fn[TA] readtrace_aux(x77 : FixedArray[Int64], x78 : TA, x79 : Int64, x80 : Int64, x81 : FixedArray[@kernel.Term], x82 : @lib.InChannel, x83 : @list.List[Clause], x84 : Int64) -> ((Int64, @list.List[Clause])) raise {
  let scl = x77
  let vc = x78
  let cc = x79
  let lr = x80
  let rcv = x81
  let fin = x82
  let sr = x83
  let id = x84
  let (tmp, eof) = try {
    (sat_getint(fin), false)
  } catch {
    @lib.EndOfFile => (42L, true)
    e => raise e
  }
  if eof {
    (cc, sr)
  } else {
    if ((tmp & 1L) == 0L) {
      let (cc_1, lr_1, sr_1) = addclause(scl, vc, cc, lr, rcv, fin, sr, tmp)
      readtrace_aux(scl, vc, cc_1, lr_1, rcv, fin, sr_1, @lib.add63(id, 1L))
    } else {
      let (cc_2, isch, sr_p) = addbranch(fin, sr, cc, id, tmp)
      if isch {
        readtrace_aux(scl, vc, cc_2, lr, rcv, fin, sr_p, @lib.add63(id, 1L))
      } else {
        readtrace_aux(scl, vc, cc_2, lr, rcv, fin, sr_p, id)
      }
    }
  }
}

///|
/// `parseTrace`
pub fn[TA] parsetrace(x85 : Int64, x86 : String, x87 : TA, x88 : FixedArray[@kernel.Term]) -> ((Int64, @list.List[Clause], FixedArray[Int64])?) raise {
  let nr = x85
  let fname = x86
  let vc = x87
  let rcv = x88
  try {
    let fin = sat_fileopen(fname)
    let scl = @lib.array_make(nr, (-1L))
    let (cc, sr) = readtrace_aux(scl, vc, 0L, 0L, rcv, fin, @list.List([]), 0L)
    let _ = sat_fileclose(fin)
    Some((cc, sr, scl))
  } catch {
    @lib.SysError(_) => None
    e => raise e
  }
}

///|
/// `getChain`
pub fn getchain(x89 : Clause) -> @list.List[(Int64, Int64)] raise {
  match x89 {
    Clause::Chain(vcl, vcll) => vcl
    _ => raise Failure("getChain: not a Chain")
  }
}

///|
/// `mk_sk`
pub fn mk_sk(x90 : FixedArray[Clause], x91 : FixedArray[Bool], x92 : Int64) -> @list.List[Int64] raise {
  let cl = x90
  let ca = x91
  let ci = x92
  let ch_1 = @lib.fold_left(fn(x93 : @list.List[@list.List[Int64]], x94 : (Int64, Int64)) -> @list.List[@list.List[Int64]] raise {
    let ch = x93
    let (v, cci) = x94
    if (@lib.array_get(ca, @lib.int63_to_int(cci)) || isrootclauseidx(cl, cci)) {
      ch
    } else {
      ch.prepend(mk_sk(cl, ca, cci))
    }
  }, @list.List([]), getchain(@lib.array_get(cl, @lib.int63_to_int(ci))))
  @lib.array_set(ca, @lib.int63_to_int(ci), true)
  @lib.flat(ch_1).prepend(ci)
}

///|
/// `parseMinisatProof`
pub fn[TA] parseminisatproof(x95 : Int64, x96 : String, x97 : TA, x98 : FixedArray[@kernel.Term]) -> ((FixedArray[Clause], @list.List[Int64], FixedArray[Int64], Int64, Int64)?) raise {
  let nr = x95
  let fname = x96
  let vc = x97
  let rcv = x98
  match parsetrace(nr, fname, vc, rcv) {
    Some((cc, sr, scl)) => {
      let srl = Int::to_int64(@lib.length(sr))
      let cl = @lib.array_make(srl, Clause::Blank)
      let _ = @lib.fold_left(fn(x99 : Int64, x100 : Clause) -> Int64 raise {
        let i = x99
        let c = x100
        @lib.array_set(cl, @lib.int63_to_int(@lib.sub63(i, 1L)), c)
        @lib.sub63(i, 1L)
      }, cc, sr)
      let t101 = @lib.sub63(cc, 1L)
      let sk = mk_sk(cl, @lib.array_make(srl, false), t101)
      Some((cl, sk, scl, srl, cc))
    }
    None => None
  }
}

///|
fn load_steps() -> Unit raise {
  ()
}
