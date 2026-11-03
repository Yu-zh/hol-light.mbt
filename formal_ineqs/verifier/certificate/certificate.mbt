// Translated from upstream Formal_ineqs/verifier/certificate.hl; edit this file directly.

///|
/// `mono_status`
#derive(Eq, Debug)
pub(all) struct MonoStatus {
  variable : Int64
  decr_flag : Bool
  df0_flag : Bool
  ti_flag : Bool
}

///|
pub extend MonoStatus with Eq::{not_equal, equal}

///|
pub extend MonoStatus with Debug::{to_repr}

///|
pub extend MonoStatus with @lib.OCompare::{ocompare}

///|
pub extend MonoStatus with @lib.OHash::{ohash_visit}

///|
pub impl @lib.OCompare for MonoStatus with fn ocompare(self, other) {
  let c = @lib.compare(self.variable, other.variable)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.decr_flag, other.decr_flag)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.df0_flag, other.df0_flag)
  if c != 0 {
    return c
  }
  @lib.compare(self.ti_flag, other.ti_flag)
}

///|
pub impl @lib.OHash for MonoStatus with fn ohash_visit(self, h) {
  h.block(0, 4)
  h.field(self.variable)
  h.field(self.decr_flag)
  h.field(self.df0_flag)
  h.field(self.ti_flag)
}

///|
/// `result_tree`
#derive(Eq, Debug)
pub(all) enum ResultTree {
  Result_false((@list.List[Double], @list.List[Double]))
  Result_pass((Int64, Bool))
  Result_pass_mono(MonoStatus)
  Result_pass_ref(Int64)
  Result_mono(@list.List[MonoStatus], ResultTree)
  Result_glue((Int64, Bool, ResultTree, ResultTree))
}

///|
pub extend ResultTree with Eq::{not_equal, equal}

///|
pub extend ResultTree with Debug::{to_repr}

///|
pub extend ResultTree with @lib.OCompare::{ocompare}

///|
pub extend ResultTree with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_ResultTree(x : ResultTree) -> Int {
  match x {
    Result_false(_) => 1000000
    Result_pass(_) => 1000001
    Result_pass_mono(_) => 1000002
    Result_pass_ref(_) => 1000003
    Result_mono(_, _) => 1000004
    Result_glue(_) => 1000005
  }
}

///|
pub impl @lib.OCompare for ResultTree with fn ocompare(self, other) {
  match (self, other) {
    (Result_false(a0), Result_false(b0)) => {
      
      @lib.compare(a0, b0)
    }
    (Result_pass(a0), Result_pass(b0)) => {
      
      @lib.compare(a0, b0)
    }
    (Result_pass_mono(a0), Result_pass_mono(b0)) => {
      
      @lib.compare(a0, b0)
    }
    (Result_pass_ref(a0), Result_pass_ref(b0)) => {
      
      @lib.compare(a0, b0)
    }
    (Result_mono(a0, a1), Result_mono(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    (Result_glue(a0), Result_glue(b0)) => {
      
      @lib.compare(a0, b0)
    }
    _ => ocaml_rank_ResultTree(self).compare(ocaml_rank_ResultTree(other))
  }
}

///|
pub impl @lib.OHash for ResultTree with fn ohash_visit(self, h) {
  match self {
    Result_false(a0) => {
      h.block(0, 1)
      h.field(a0)
    }
    Result_pass(a0) => {
      h.block(1, 1)
      h.field(a0)
    }
    Result_pass_mono(a0) => {
      h.block(2, 1)
      h.field(a0)
    }
    Result_pass_ref(a0) => {
      h.block(3, 1)
      h.field(a0)
    }
    Result_mono(a0, a1) => {
      h.block(4, 2)
      h.field(a0)
      h.field(a1)
    }
    Result_glue(a0) => {
      h.block(5, 1)
      h.field(a0)
    }
  }
}

///|
/// `p_status`
#derive(Eq, Debug)
pub(all) struct PStatus {
  pp : Int64
}

///|
pub extend PStatus with Eq::{not_equal, equal}

///|
pub extend PStatus with Debug::{to_repr}

///|
pub extend PStatus with @lib.OCompare::{ocompare}

///|
pub extend PStatus with @lib.OHash::{ohash_visit}

///|
pub impl @lib.OCompare for PStatus with fn ocompare(self, other) {
  
  @lib.compare(self.pp, other.pp)
}

///|
pub impl @lib.OHash for PStatus with fn ohash_visit(self, h) {
  h.block(0, 1)
  h.field(self.pp)
}

///|
/// `p_result_tree`
#derive(Eq, Debug)
pub(all) enum PResultTree {
  P_result_pass(PStatus, Int64, Bool)
  P_result_mono(PStatus, @list.List[MonoStatus], PResultTree)
  P_result_glue(PStatus, Int64, Bool, PResultTree, PResultTree)
  P_result_ref(Int64)
}

///|
pub extend PResultTree with Eq::{not_equal, equal}

///|
pub extend PResultTree with Debug::{to_repr}

///|
pub extend PResultTree with @lib.OCompare::{ocompare}

///|
pub extend PResultTree with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_PResultTree(x : PResultTree) -> Int {
  match x {
    P_result_pass(_, _, _) => 1000000
    P_result_mono(_, _, _) => 1000001
    P_result_glue(_, _, _, _, _) => 1000002
    P_result_ref(_) => 1000003
  }
}

///|
pub impl @lib.OCompare for PResultTree with fn ocompare(self, other) {
  match (self, other) {
    (P_result_pass(a0, a1, a2), P_result_pass(b0, b1, b2)) => {
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
    (P_result_mono(a0, a1, a2), P_result_mono(b0, b1, b2)) => {
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
    (P_result_glue(a0, a1, a2, a3, a4), P_result_glue(b0, b1, b2, b3, b4)) => {
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
    (P_result_ref(a0), P_result_ref(b0)) => {
      
      @lib.compare(a0, b0)
    }
    _ => ocaml_rank_PResultTree(self).compare(ocaml_rank_PResultTree(other))
  }
}

///|
pub impl @lib.OHash for PResultTree with fn ohash_visit(self, h) {
  match self {
    P_result_pass(a0, a1, a2) => {
      h.block(0, 3)
      h.field(a0)
      h.field(a1)
      h.field(a2)
    }
    P_result_mono(a0, a1, a2) => {
      h.block(1, 3)
      h.field(a0)
      h.field(a1)
      h.field(a2)
    }
    P_result_glue(a0, a1, a2, a3, a4) => {
      h.block(2, 5)
      h.field(a0)
      h.field(a1)
      h.field(a2)
      h.field(a3)
      h.field(a4)
    }
    P_result_ref(a0) => {
      h.block(3, 1)
      h.field(a0)
    }
  }
}

///|
/// `result_size`
pub fn result_size(x1 : ResultTree) -> Int64 raise {
  let r = x1
  match r {
    ResultTree::Result_false(_) => raise Failure("False result detected")
    ResultTree::Result_mono(_, r1) => result_size(r1)
    ResultTree::Result_glue((_, _, r1_1, r2)) => {
      let t2 = result_size(r2)
      @lib.add63(result_size(r1_1), t2)
    }
    ResultTree::Result_pass_mono(_) => 1L
    ResultTree::Result_pass(_) => 1L
    _ => 0L
  }
}

///|
/// `p_result_size`
pub fn p_result_size(x3 : PResultTree) -> Int64 raise {
  let r = x3
  match r {
    PResultTree::P_result_pass(_, _, _) => 1L
    PResultTree::P_result_mono(_, _, r1) => p_result_size(r1)
    PResultTree::P_result_glue(_, _, _, r1_1, r2) => {
      let t4 = p_result_size(r2)
      @lib.add63(p_result_size(r1_1), t4)
    }
    _ => 0L
  }
}

///|
/// `certificate_stats`
#derive(Eq, Debug)
pub(all) struct CertificateStats {
  pass : Int64
  pass_raw : Int64
  pass_mono : Int64
  mono : Int64
  glue : Int64
  glue_convex : Int64
}

///|
pub extend CertificateStats with Eq::{not_equal, equal}

///|
pub extend CertificateStats with Debug::{to_repr}

///|
pub extend CertificateStats with @lib.OCompare::{ocompare}

///|
pub extend CertificateStats with @lib.OHash::{ohash_visit}

///|
pub impl @lib.OCompare for CertificateStats with fn ocompare(self, other) {
  let c = @lib.compare(self.pass, other.pass)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.pass_raw, other.pass_raw)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.pass_mono, other.pass_mono)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.mono, other.mono)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.glue, other.glue)
  if c != 0 {
    return c
  }
  @lib.compare(self.glue_convex, other.glue_convex)
}

///|
pub impl @lib.OHash for CertificateStats with fn ohash_visit(self, h) {
  h.block(0, 6)
  h.field(self.pass)
  h.field(self.pass_raw)
  h.field(self.pass_mono)
  h.field(self.mono)
  h.field(self.glue)
  h.field(self.glue_convex)
}

///|
/// dummy_stats
fn step_1() -> Unit raise {
  dummy_stats_c.set(CertificateStats::{ pass: 0L, pass_raw: 0L, pass_mono: 0L, mono: 0L, glue: 0L, glue_convex: 0L })
}

///|
let dummy_stats_c : @lib.Cell[CertificateStats] = @lib.Cell::new("dummy_stats")

///|
/// `Certificate.dummy_stats`
pub fn dummy_stats() -> CertificateStats {
  dummy_stats_c.get()
}

///|
/// `result_stats`
pub fn result_stats(x5 : ResultTree) -> CertificateStats raise {
  let result = x5
  let pass = Ref::{ val: 0L }
  let mono = Ref::{ val: 0L }
  let glue = Ref::{ val: 0L }
  let pass_mono = Ref::{ val: 0L }
  let pass_raw = Ref::{ val: 0L }
  let glue_convex = Ref::{ val: 0L }
  fn count(x6 : ResultTree) -> Unit raise {
    let r = x6
    match r {
      ResultTree::Result_false(_) => raise Failure("False result")
      ResultTree::Result_pass((_, flag)) => {
        {
          pass.val = @lib.add63(pass.val, 1L)
          ()
        }
        if flag {
          {
            pass_raw.val = @lib.add63(pass_raw.val, 1L)
            ()
          }
        } else {
          ()
        }
      }
      ResultTree::Result_pass_mono(_) => {
        {
          pass_mono.val = @lib.add63(pass_mono.val, 1L)
          ()
        }
      }
      ResultTree::Result_pass_ref(_) => ()
      ResultTree::Result_mono(_, r1) => {
        {
          mono.val = @lib.add63(mono.val, 1L)
          ()
        }
        count(r1)
      }
      ResultTree::Result_glue((_, flag_1, r1_1, r2)) => {
        {
          glue.val = @lib.add63(glue.val, 1L)
          ()
        }
        if flag_1 {
          {
            glue_convex.val = @lib.add63(glue_convex.val, 1L)
            ()
          }
        } else {
          ()
        }
        count(r1_1)
        count(r2)
      }
    }
  }
  let _ = count(result)
  let t7 = glue_convex.val
  let t8 = glue.val
  let t9 = mono.val
  let t10 = pass_mono.val
  let t11 = pass_raw.val
  CertificateStats::{ pass: pass.val, pass_raw: t11, pass_mono: t10, mono: t9, glue: t8, glue_convex: t7 }
}

///|
/// `report_stats`
pub fn report_stats(x12 : CertificateStats) -> Unit raise {
  let stats = x12
  let t13 = stats.pass_mono
  let t14 = stats.glue_convex
  let t15 = stats.glue
  let t16 = stats.mono
  let t17 = stats.pass_raw
  let s = ((((((((((("pass = " + Int64::to_string(stats.pass)) + " (pass_raw = ") + Int64::to_string(t17)) + ")\nmono = ") + Int64::to_string(t16)) + "\nglue = ") + Int64::to_string(t15)) + " (glue_convex = ") + Int64::to_string(t14)) + ")\npass_mono = ") + Int64::to_string(t13))
  @report.report(s)
}

///|
/// `result_p_stats`
pub fn result_p_stats(x18 : Bool, x19 : PResultTree) -> Unit raise {
  let glue_flag = x18
  let p_result = x19
  let p_table = @lib.hashtbl_create(10)
  let add1 : (Int64) -> Unit raise = fn(x20 : Int64) -> Unit raise {
    let p = x20
    let c = if @lib.hashtbl_mem(p_table, p) {
      @lib.hashtbl_find(p_table, p)
    } else {
      0L
    }
    @lib.hashtbl_replace(p_table, p, @lib.succ63(c))
  }
  fn count(x21 : PResultTree) -> Unit raise {
    let r = x21
    match r {
      PResultTree::P_result_ref(_) => ()
      PResultTree::P_result_pass(pp, _, _) => add1(pp.pp)
      PResultTree::P_result_mono(pp_1, _, r1) => {
        add1(pp_1.pp)
        count(r1)
      }
      PResultTree::P_result_glue(pp_2, _, _, r1_1, r2) => {
        if glue_flag {
          add1(pp_2.pp)
        } else {
          ()
        }
        count(r1_1)
        count(r2)
      }
    }
  }
  let _ = count(p_result)
  let s_1 = @lib.hashtbl_fold(fn(x22 : Int64, x23 : Int64, x24 : String) -> String raise {
    let p_1 = x22
    let c_1 = x23
    let s = x24
    ((((("p = " + Int64::to_string(p_1)) + ": ") + Int64::to_string(c_1)) + "\n") + s)
  }, p_table, "")
  @report.report(s_1)
}

///|
/// `domain_str`
pub fn domain_str(x25 : @list.List[Double], x26 : @list.List[Double]) -> String raise {
  let x = x25
  let z = x26
  let s1 = @lib.map(fn(x27 : Double) -> String raise {
    @lib.string_of_float(x27)
  }, x)
  let s2 = @lib.map(fn(x28 : Double) -> String raise {
    @lib.string_of_float(x28)
  }, z)
  let t29 = @lib.string_concat("; ", s2)
  (((("[" + @lib.string_concat("; ", s1)) + "], [") + t29) + "]")
}

///|
/// `path_str`
pub fn path_str(x30 : @list.List[(String, Int64)]) -> String raise {
  let p = x30
  @lib.string_concat(",", @lib.map(fn(x31 : (String, Int64)) -> String raise {
    let (s, j) = x31
    (((s + "(") + Int64::to_string(j)) + ")")
  }, p))
}

///|
/// `get_results0`
pub fn get_results0(x32 : @list.List[(String, Int64)], x33 : ResultTree, x34 : @list.List[(@list.List[(String, Int64)], ResultTree)]) -> ((Bool, @list.List[(@list.List[(String, Int64)], ResultTree)], ResultTree)) raise {
  let path = x32
  let r = x33
  let acc = x34
  let dummy_tree = ResultTree::Result_false((@list.List([]), @list.List([])))
  let is_ref : (ResultTree) -> Bool raise = fn(x35 : ResultTree) -> Bool raise {
    let r_1 = x35
    match r_1 {
      ResultTree::Result_pass_ref(_) => true
      _ => false
    }
  }
  fn get_rec(x36 : @list.List[(String, Int64)], x37 : ResultTree, x38 : @list.List[(@list.List[(String, Int64)], ResultTree)]) -> ((Bool, @list.List[(@list.List[(String, Int64)], ResultTree)], ResultTree)) raise {
    let path_1 = x36
    let r_2 = x37
    let acc_1 = x38
    match r_2 {
      ResultTree::Result_mono(mono, r1) => {
        let get_m : (MonoStatus) -> (String, Int64) raise = fn(x39 : MonoStatus) -> (String, Int64) raise {
          let m = x39
          let t40 = m.variable
          (if m.decr_flag {
            "ml"
          } else {
            "mr"
          }, t40)
        }
        let path_p = @lib.rev_itlist(fn(x41 : MonoStatus, x42 : @list.List[(String, Int64)]) -> @list.List[(String, Int64)] raise {
          let m_1 = x41
          let l = x42
          l.prepend(get_m(m_1))
        }, mono, path_1)
        let (flag, acc_p, tree) = get_rec(path_p, r1, acc_1)
        if flag {
          (true, acc_p, dummy_tree)
        } else {
          (false, acc_p, ResultTree::Result_mono(mono, tree))
        }
      }
      ResultTree::Result_glue((j, convex_flag, r1_1, r2)) => {
        let (s1, s2) = if convex_flag {
          ("ml", "mr")
        } else {
          ("l", "r")
        }
        let t43 = path_1.prepend((s2, @lib.add63(j, 1L)))
        let (p1, p2) = (path_1.prepend((s1, @lib.add63(j, 1L))), t43)
        let (flag1, acc1, tree1) = get_rec(p1, r1_1, acc_1)
        let (flag2, acc_p_1, tree2) = get_rec(p2, r2, acc1)
        let n = @lib.add63(Int::to_int64(@lib.length(acc_p_1)), 1L)
        if flag1 {
          if flag2 {
            (true, acc_p_1, dummy_tree)
          } else {
            if is_ref(r1_1) {
              (false, acc_p_1, ResultTree::Result_glue((j, convex_flag, r1_1, tree2)))
            } else {
              let t44 = ResultTree::Result_glue((j, convex_flag, ResultTree::Result_pass_ref(n), tree2))
              (false, acc_p_1.concat(@list.List([(@lib.rev(p1), r1_1)])), t44)
            }
          }
        } else {
          if flag2 {
            if is_ref(r2) {
              (false, acc_p_1, ResultTree::Result_glue((j, convex_flag, tree1, r2)))
            } else {
              let t45 = ResultTree::Result_glue((j, convex_flag, tree1, ResultTree::Result_pass_ref(n)))
              (false, acc_p_1.concat(@list.List([(@lib.rev(p2), r2)])), t45)
            }
          } else {
            (false, acc_p_1, ResultTree::Result_glue((j, convex_flag, tree1, tree2)))
          }
        }
      }
      ResultTree::Result_pass_mono(_) => (false, acc_1, r_2)
      _ => (true, acc_1, dummy_tree)
    }
  }
  get_rec(path, r, acc)
}

///|
/// `transform_result`
pub fn transform_result(x46 : @list.List[Double], x47 : @list.List[Double], x48 : ResultTree) -> @list.List[(@list.List[(String, Int64)], ResultTree)] raise {
  let x = x46
  let z = x47
  let r = x48
  let domain_hash = @lib.hashtbl_create(1000)
  let (find_hash, mem_hash, add_hash) = (fn(x49 : String) -> (@list.List[Double], @list.List[Double]) raise {
    @lib.hashtbl_find(domain_hash, x49)
  }, fn(x50 : String) -> Bool raise {
    @lib.hashtbl_mem(domain_hash, x50)
  }, fn(x51 : String) -> (((@list.List[Double], @list.List[Double])) -> Unit raise) raise {
    fn(x52 : (@list.List[Double], @list.List[Double])) -> Unit raise {
      @lib.hashtbl_add(domain_hash, x51, x52)
    }
  })
  let get_domain : (@list.List[(String, Int64)]) -> (@list.List[Double], @list.List[Double]) raise = fn(x53 : @list.List[(String, Int64)]) -> (@list.List[Double], @list.List[Double]) raise {
    let path = x53
    let n = Int::to_int64(@lib.length(x))
    fn rec_domain(x55 : (@list.List[Double], @list.List[Double]), x56 : @list.List[(String, Int64)], x57 : String) -> ((@list.List[Double], @list.List[Double])) raise {
      let (x_1, z_1) = x55
      let path_1 = x56
      let hash = x57
      match path_1 {
        Empty => (x_1, z_1)
        More((s, j), tail=ps) => {
          let hash_p = (hash + (s + Int64::to_string(j)))
          if mem_hash(hash_p) {
            rec_domain(find_hash(hash_p), ps, hash_p)
          } else {
            let j_1 = @lib.sub63(j, 1L)
            let domain_p = if ((s == "l") || (s == "r")) {
              let (op_plus_plus, op_slash) = (fn(x58 : Double) -> ((Double) -> Double raise) raise {
                fn(x59 : Double) -> Double raise {
                  (x58 + x59)
                }
              }, fn(x60 : Double) -> ((Double) -> Double raise) raise {
                fn(x61 : Double) -> Double raise {
                  (x60 / x61)
                }
              })
              let t62 = @lib.list_nth(z_1, @lib.int63_to_int(j_1))
              let yj = op_slash(op_plus_plus(@lib.list_nth(x_1, @lib.int63_to_int(j_1)))(t62))(2.0)
              let delta : (Bool) -> ((@list.List[Double]) -> @list.List[Double] raise) raise = fn(x63 : Bool) -> ((@list.List[Double]) -> @list.List[Double] raise) raise {
                let b = x63
                fn(x64 : @list.List[Double]) -> @list.List[Double] raise {
                  let v = x64
                  ((x54) => table_l(n, x54))(fn(x65 : Int64) -> Double raise {
                    let i = x65
                    if ((i == j_1) && b) {
                      yj
                    } else {
                      @lib.list_nth(v, @lib.int63_to_int(i))
                    }
                  })
                }
              }
              if (s == "l") {
                let t66 = delta(true)(z_1)
                (delta(false)(x_1), t66)
              } else {
                let t67 = delta(false)(z_1)
                (delta(true)(x_1), t67)
              }
            } else {
              if (s == "ml") {
                (x_1, ((x54) => table_l(n, x54))(fn(x68 : Int64) -> Double raise {
                  let i_1 = x68
                  if (i_1 == j_1) {
                    @lib.list_nth(x_1, @lib.int63_to_int(i_1))
                  } else {
                    @lib.list_nth(z_1, @lib.int63_to_int(i_1))
                  }
                }))
              } else {
                (((x54) => table_l(n, x54))(fn(x69 : Int64) -> Double raise {
                  let i_2 = x69
                  if (i_2 == j_1) {
                    @lib.list_nth(z_1, @lib.int63_to_int(i_2))
                  } else {
                    @lib.list_nth(x_1, @lib.int63_to_int(i_2))
                  }
                }), z_1)
              }
            }
            let _ = add_hash(hash_p)(domain_p)
            rec_domain(domain_p, ps, hash_p)
          }
        }
      }
    }
    rec_domain((x, z), path, "")
  }
  let transform_pass_mono : (@list.List[Double]) -> ((@list.List[Double]) -> ((@list.List[(@list.List[Double], @list.List[Double])]) -> ((ResultTree) -> ResultTree raise) raise) raise) raise = fn(x77 : @list.List[Double]) -> ((@list.List[Double]) -> ((@list.List[(@list.List[Double], @list.List[Double])]) -> ((ResultTree) -> ResultTree raise) raise) raise) raise {
    let x_3 = x77
    fn(x78 : @list.List[Double]) -> ((@list.List[(@list.List[Double], @list.List[Double])]) -> ((ResultTree) -> ResultTree raise) raise) raise {
      let z_3 = x78
      fn(x79 : @list.List[(@list.List[Double], @list.List[Double])]) -> ((ResultTree) -> ResultTree raise) raise {
        let domains = x79
        fn(x80 : ResultTree) -> ResultTree raise {
          let r_1 = x80
          let domains_i = @lib.zip(domains, @lib.range(1L, Int::to_int64(@lib.length(domains))))
          let find_domain : (@list.List[Double]) -> ((@list.List[Double]) -> ((@list.List[Double], @list.List[Double]), Int64) raise) raise = fn(x81 : @list.List[Double]) -> ((@list.List[Double]) -> ((@list.List[Double], @list.List[Double]), Int64) raise) raise {
            let x_p_1 = x81
            fn(x82 : @list.List[Double]) -> ((@list.List[Double], @list.List[Double]), Int64) raise {
              let z_p_1 = x82
              try {
                @lib.find(fn(x83 : ((@list.List[Double], @list.List[Double]), Int64)) -> Bool raise {
                  let (d, _) = x83
                  sub_domain_l((x_p_1, z_p_1), d)
                }, domains_i)
              } catch {
                Failure(_) => ((x_3, z_3), (-1L))
                e => raise e
              }
            }
          }
          let get_m : (MonoStatus) -> (String, Int64) raise = fn(x84 : MonoStatus) -> (String, Int64) raise {
            let m = x84
            let t85 = m.variable
            (if m.decr_flag {
              "ml"
            } else {
              "mr"
            }, t85)
          }
          fn rec_transform(x86 : @list.List[(String, Int64)], x87 : ResultTree) -> ResultTree raise {
            let path_2 = x86
            let r_2 = x87
            match r_2 {
              ResultTree::Result_mono(mono, r1) => {
                let path_p = @lib.rev_itlist(fn(x88 : MonoStatus, x89 : @list.List[(String, Int64)]) -> @list.List[(String, Int64)] raise {
                  let m_1 = x88
                  let l = x89
                  l.prepend(get_m(m_1))
                }, mono, path_2)
                ResultTree::Result_mono(mono, rec_transform(path_p, r1))
              }
              ResultTree::Result_glue((j_2, convex_flag, r1_1, r2)) => {
                let (s1, s2) = if convex_flag {
                  ("ml", "mr")
                } else {
                  ("l", "r")
                }
                let t90 = path_2.prepend((s2, @lib.add63(j_2, 1L)))
                let (p1, p2) = (path_2.prepend((s1, @lib.add63(j_2, 1L))), t90)
                let t1 = rec_transform(p1, r1_1)
                let t2 = rec_transform(p2, r2)
                ResultTree::Result_glue((j_2, convex_flag, t1, t2))
              }
              ResultTree::Result_pass_mono(m_2) => {
                let path_p_1 = @lib.rev(path_2.prepend(get_m(m_2)))
                let (x_p_2, z_p_2) = get_domain(path_p_1)
                let (_, i_3) = find_domain(x_p_2)(z_p_2)
                if (i_3 >= 0L) {
                  ResultTree::Result_mono(@list.List([m_2]), ResultTree::Result_pass_ref(@lib.neg63(i_3)))
                } else {
                  r_2
                }
              }
              _ => r_2
            }
          }
          rec_transform(@list.List([]), r_1)
        }
      }
    }
  }
  fn transform(x91 : @list.List[(@list.List[(String, Int64)], ResultTree)], x92 : ResultTree) -> @list.List[(@list.List[(String, Int64)], ResultTree)] raise {
    let acc = x91
    let r_3 = x92
    let (flag, rs, r_p) = get_results0(@list.List([]), r_3, acc)
    if flag {
      rs.concat(@list.List([(@list.List([]), r_3)]))
    } else {
      let domains_1 = @lib.map(fn(x93 : (@list.List[(String, Int64)], ResultTree)) -> (@list.List[Double], @list.List[Double]) raise {
        let (p, _) = x93
        get_domain(p)
      }, rs)
      let r_next = transform_pass_mono(x)(z)(domains_1)(r_p)
      let _ = ((r_next != r_p) || @lib.raise_error(Failure("transform_result: deadlock")))
      transform(rs, r_next)
    }
  }
  transform(@list.List([]), r)
}

///|
fn[TB] table_l(n : Int64, x54 : (Int64) -> TB raise) -> @list.List[TB] raise {
  let f = x54
  @lib.map(f, @lib.range(0L, @lib.sub63(n, 1L)))
}

///|
fn[TH : Eq + @lib.OCompare + @lib.OHash] le_l(x72 : @list.List[TH], x73 : @list.List[TH]) -> Bool raise {
  let a = x72
  let b_1 = x73
  @lib.itlist2(fn(x74 : TH, x75 : TH, x76 : Bool) -> Bool raise {
    let a_1 = x74
    let b_2 = x75
    let c = x76
    (c && (@lib.compare(a_1, b_2) <= 0))
  }, a, b_1, true)
}

///|
fn[TF : Eq + @lib.OCompare + @lib.OHash, TG : Eq + @lib.OCompare + @lib.OHash] sub_domain_l(x70 : (@list.List[TF], @list.List[TG]), x71 : (@list.List[TF], @list.List[TG])) -> Bool raise {
  let (x_p, z_p) = x70
  let (x_2, z_2) = x71
  (le_l(x_2, x_p) && le_l(z_p, z_2))
}

///|
fn load_steps() -> Unit raise {
  step_1()
}
