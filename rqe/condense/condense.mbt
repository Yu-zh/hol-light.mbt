// Translated from upstream Rqe/condense.ml; edit this file directly.

///|
/// `triple_index`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] triple_index(x1 : @list.List[TA]) -> Int64 raise {
  let l = x1
  match l {
    Empty => raise Failure("triple_index")
    More(x, tail=Empty) => raise Failure("triple_index")
    More(x_1, tail=More(y, tail=Empty)) => raise Failure("triple_index")
    More(x_2, tail=More(y_1, tail=More(z, tail=rest))) => {
      if ((x_2 == y_1) && (y_1 == z)) {
        0L
      } else {
        @lib.add63(1L, triple_index((rest.prepend(z)).prepend(y_1)))
      }
    }
  }
}

///|
/// tmp
fn step_1() -> Unit raise {
  tmp_c.set(Ref::{ val: @bool.truth() })
}

///|
let tmp_c : @lib.Cell[Ref[@kernel.Thm]] = @lib.Cell::new("tmp")

///|
/// `tmp`
pub fn tmp() -> Ref[@kernel.Thm] {
  tmp_c.get()
}

///|
let condense_v1_c : @lib.Cell[(@kernel.Thm) -> @kernel.Thm raise] = @lib.Cell::new("CONDENSE")

///|
/// `CONDENSE`
pub fn condense_v1(x : @kernel.Thm) -> @kernel.Thm raise {
  (condense_v1_c.get())(x)
}

///|
/// CONDENSE
fn step_2() -> Unit raise {
  let real_app = @term_syntax.parse_term("(APPEND : (List[Real], List[Real]) -> List[Real])")
  let sign_app = @term_syntax.parse_term("(APPEND : (List[List[Sign]], List[List[Sign]]) -> List[List[Sign]])")
  let real_len = @term_syntax.parse_term("(LENGTH : (List[Real]) -> Num)")
  let sign_len = @term_syntax.parse_term("(LENGTH : (List[List[Sign]]) -> Num)")
  let num_mul = @term_syntax.parse_term("(op_star : (Num, Num) -> Num)")
  let real_ty = @term_syntax.parse_type("Real")
  let two = @term_syntax.parse_term("2")
  let sl_ty = @term_syntax.parse_type("List[Sign]")
  fn condense_rec(x2 : @kernel.Thm) -> @kernel.Thm raise {
    let mat_thm = x2
    try {
      {
        tmp().val = mat_thm
        ()
      }
      let (pts, _, sgns) = @defs.dest_interpmat(@kernel.concl(mat_thm))
      let sgnl = @basics.dest_list(sgns)
      let ptl = @basics.dest_list(pts)
      let i = triple_index(sgnl)
      if !((@lib.mod63(i, 2L) == 0L)) {
        raise Failure("misshifted matrix")
      } else {
        if (i == 0L) {
          if (Int::to_int64(@lib.length(ptl)) == 1L) {
            @drule.match_mp(@work_thms.interpmat_sing())(mat_thm)
          } else {
            condense_rec(@drule.match_mp(@work_thms.interpmat_trio())(mat_thm))
          }
        } else {
          let (l, r) = @lib.chop_list(@lib.int63_to_int(@lib.sub63(i, 2L)), sgnl)
          let t3 = @lists.mk_list(r, sl_ty)
          let (sgn1, sgn2) = (@lists.mk_list(l, sl_ty), t3)
          let sgns_p = @kernel.mk_comb(@kernel.mk_comb(sign_app, sgn1), sgn2)
          let t4 = @simp.rewrite_tac(@list.List([@lists.append()]))
          let sgn_thm = @tactics.prove(@basics.mk_eq(sgns, sgns_p), t4)
          let (l_p, r_p) = @lib.chop_list(@lib.int63_to_int(@lib.sub63(@lib.div63(i, 2L), 1L)), ptl)
          let t5 = @lists.mk_list(r_p, real_ty)
          let (pt1, pt2) = (@lists.mk_list(l_p, real_ty), t5)
          let pts_p = @kernel.mk_comb(@kernel.mk_comb(real_app, pt1), pt2)
          let t6 = @simp.rewrite_tac(@list.List([@lists.append()]))
          let pt_thm = @tactics.prove(@basics.mk_eq(pts, pts_p), t6)
          let mat_thm_p = @simp.once_rewrite_rule(@list.List([sgn_thm, pt_thm]))(mat_thm)
          let t8 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@lists.length()])), @int.arith_tac)
          let t7 = @basics.mk_binop(num_mul, two, @kernel.mk_comb(real_len, pt1))
          let len_thm = @tactics.prove(@basics.mk_eq(@kernel.mk_comb(sign_len, sgn1), t7), t8)
          let t9 = @drule.match_mp(@drule.match_mp(@work_thms.interpmat_trio_inner())(mat_thm_p))(len_thm)
          condense_rec(@simp.rewrite_rule(@list.List([@lists.append()]))(t9))
        }
      }
    } catch {
      Failure("triple_index") => mat_thm
      Failure(x) => raise Failure(("CONDENSE: " + x))
      e => raise e
    }
  }
  let condense = condense_rec
  condense_v1_c.set(condense)
}

///|
/// `CONDENSE`
pub fn condense(x10 : @kernel.Thm) -> @kernel.Thm raise {
  let mat_thm = x10
  let start_time = {
    (@lib.cpu_time.val)()
  }
  let res = condense_v1(mat_thm)
  @rqe_lib.op_plus_dot_eq(@timers.condense_timer(), (({
    (@lib.cpu_time.val)()
  }) - start_time))
  res
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
}
