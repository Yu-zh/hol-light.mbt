// Translated from upstream Library/records.ml; edit this file directly.

///|
/// parse_record_specification
fn step_1() -> Unit raise {
  let ptype : (ArrayView[@lexer.Lexcode]) -> (
    @kernel.HolType,
    ArrayView[@lexer.Lexcode],
  ) raise = fn(
    x1 : ArrayView[@lexer.Lexcode],
  ) -> (@kernel.HolType, ArrayView[@lexer.Lexcode]) raise {
    let src = x1
    let (pty, rst) = @parser.parse_pretype(src)
    (@preterm.type_of_pretype(pty), rst)
  }
  let recordelement : (ArrayView[@lexer.Lexcode]) -> (
    (String, @kernel.HolType),
    ArrayView[@lexer.Lexcode],
  ) raise = fn(
    x2 : ArrayView[@lexer.Lexcode],
  ) -> ((String, @kernel.HolType), ArrayView[@lexer.Lexcode]) raise {
    let src_1 = x2
    match src_1 {
      [@lexer.Lexcode::Ident(t), @lexer.Lexcode::Resword(":"), ..rst_1] => {
        let (ty, ors) = ptype(rst_1)
        ((t, ty), ors)
      }
      _ => raise @parserutil.Noparse
    }
  }
  let recordelements : (ArrayView[@lexer.Lexcode]) -> (
    @list.List[(String, @kernel.HolType)],
    ArrayView[@lexer.Lexcode],
  ) raise = @parserutil.listof(
    recordelement,
    @parserutil.a(@lexer.Lexcode::Resword(";")),
    "';' or '}'",
  )
  let t3 = @parserutil.a(@lexer.Lexcode::Resword("}"))
  let recspec : (ArrayView[@lexer.Lexcode]) -> (
    @list.List[(String, @kernel.HolType)],
    ArrayView[@lexer.Lexcode],
  ) raise = @parserutil.map(
    @parserutil.seq(
      @parserutil.seq(@parserutil.a(@lexer.Lexcode::Resword("{")), recordelements),
      t3,
    ),
    fn(
      x4 : (
        (@lexer.Lexcode, @list.List[(String, @kernel.HolType)]),
        @lexer.Lexcode,
      ),
    ) -> @list.List[(String, @kernel.HolType)] raise {
      let ((_, s), _) = x4
      s
    },
  )
  parse_record_specification_c.set(fn(
    x5 : String,
  ) -> (String, @list.List[(String, @kernel.HolType)]) raise {
    let s_1 = x5
    match @lexer.lex(s_1) {
      [@lexer.Lexcode::Ident(tyname), @lexer.Lexcode::Ident("="), ..rst_2] => {
        let (rs, er) = recspec(rst_2)
        if !er.is_empty() {
          raise Failure("Stuff after record spec")
        } else {
          (tyname, rs)
        }
      }
      _ => raise @parserutil.Noparse
    }
  })
}

///|
let parse_record_specification_c : @lib.Cell[
  (String) -> (String, @list.List[(String, @kernel.HolType)]) raise,
] = @lib.Cell::new("parse_record_specification")

///|
/// `parse_record_specification`
pub fn parse_record_specification(
  x : String,
) -> (String, @list.List[(String, @kernel.HolType)]) raise {
  parse_record_specification_c.get()(x)
}

///|
/// the_record_types
fn step_2() -> Unit raise {
  the_record_types_c.set(Ref::{ val: @list.List([]), })
}

///|
let the_record_types_c : @lib.Cell[
  Ref[
    @list.List[
      (
        String,
        (
          @list.List[(String, @kernel.HolType)],
          (@kernel.Thm, @kernel.Thm, @kernel.Thm),
        ),
      ),
    ],
  ],
] = @lib.Cell::new("the_record_types")

///|
/// `the_record_types`
pub fn the_record_types() -> Ref[
  @list.List[
    (
      String,
      (
        @list.List[(String, @kernel.HolType)],
        (@kernel.Thm, @kernel.Thm, @kernel.Thm),
      ),
    ),
  ],
] {
  the_record_types_c.get()
}

///|
/// define_record_type
fn step_3() -> Unit raise {
  let t7 = @meson.meson_tac(@list.List([]))
  let t8 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([
        @components.exists_component(),
        @components.read(),
        @components.write(),
      ]),
    ),
    t7,
  )
  let t9 = (
    @term_syntax.parse_term("(∃ r : (_) -> _, (P : ((_) -> _) -> Bool)(r)) && (∃ w : (_, _) -> _, (Q : ((_, _) -> _) -> Bool)(w)) → (∃ c : Component[_, _], P(read(c)) && Q(write(c)))"),
    t8,
  )
  let tweak : (@kernel.Thm) -> @kernel.Thm raise = @drule.match_mp(
    (fn(
      x6 : (
        @kernel.Term,
        ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
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
        ) raise,
      ),
    ) -> @kernel.Thm raise {
      @tactics.prove(x6.0, x6.1)
    })(t9),
  )
  define_record_type_c.set(fn(
    x10 : String,
  ) -> (@kernel.Thm, @kernel.Thm, @kernel.Thm) raise {
    let s = x10
    let (tyname, fields) = @term_syntax.parse_record_definition(s)
    if @lib.can(
        (
          x11 : @list.List[
            (
              String,
              (
                @list.List[(String, @kernel.HolType)],
                (@kernel.Thm, @kernel.Thm, @kernel.Thm),
              ),
            ),
          ],
        ) => @lib.assoc(tyname, x11),
        the_record_types().val,
      ) {
      let (ofields, othms) = @lib.assoc(tyname, the_record_types().val)
      if ofields == fields {
        @lib.warn(true, "Benign redefinition of record type")
        othms
      } else {
        raise Failure(
          "define_record_type: type " +
          (tyname + " already defined with different fields"),
        )
      }
    } else {
      let tyname_rec = tyname + "_RECORD"
      let t13 = @list.List([
        (
          tyname_rec,
          @lib.map(
            fn(x12 : (String, @kernel.HolType)) -> @kernel.HolType raise {
              x12.1
            },
            fields,
          ),
        ),
      ])
      let (ith, rth) = @ind_types.define_type_raw(
        @list.List([(@kernel.mk_vartype(tyname), t13)]),
      )
      let (f, ebod) = @basics.dest_forall(@kernel.concl(rth))
      let (fn_, abod) = @basics.dest_exists(ebod)
      let (avs, eqn) = @basics.strip_forall(abod)
      let left = @kernel.rand(@equal.lhand(eqn))
      let t14 = @kernel.type_of(left)
      let leftys = @basics.mk_fun_ty(@kernel.type_of(left), t14)
      let fnms = @lib.map(
        fn(x15 : (String, @kernel.HolType)) -> String raise { x15.0 },
        fields,
      )
      let defs = @lib.map2(
        fn(x16 : String, x17 : @kernel.Term) -> @kernel.Thm raise {
          let fnm = x16
          let v = x17
          let (vn, vty) = @kernel.dest_var(v)
          let v_p = @kernel.mk_var(vn + "'", vty)
          let right = @basics.subst(@list.List([(v_p, v)]), left)
          let wfn = @kernel.mk_var(
            "writer",
            @basics.mk_fun_ty(@kernel.type_of(v), leftys),
          )
          let wdef = @basics.mk_eq(
            @kernel.mk_comb(@kernel.mk_comb(wfn, v_p), left),
            right,
          )
          let wcdef = @bool.list_mk_forall(avs.prepend(v_p), wdef)
          let wethm = @recursion.prove_recursive_functions_exist(rth)(wcdef)
          let t18 = @kernel.type_of(v)
          let rfn = @kernel.mk_var(
            "reader",
            @basics.mk_fun_ty(@kernel.type_of(left), t18),
          )
          let rdef = @basics.mk_eq(@kernel.mk_comb(rfn, left), v)
          let rcdef = @bool.list_mk_forall(avs, rdef)
          let rethm = @recursion.prove_recursive_functions_exist(rth)(rcdef)
          let t19 = tweak(@bool.conj(rethm, wethm))
          @nums.new_specification(@list.List([fnm]))(t19)
        },
        fnms,
        avs,
      )
      let result = (ith, rth, @lib.end_itlist(@bool.conj, defs))
      {
        the_record_types().val = the_record_types().val.prepend(
          (tyname, (fields, result)),
        )
        ()
      }
      result
    }
  })
}

///|
let define_record_type_c : @lib.Cell[
  (String) -> (@kernel.Thm, @kernel.Thm, @kernel.Thm) raise,
] = @lib.Cell::new("define_record_type")

///|
/// `define_record_type`, with the record written as a MoonBit struct (term
/// syntax): `define_record_type("struct Point { x : Num; y : Num }")`.
pub fn define_record_type(
  x : String,
) -> (@kernel.Thm, @kernel.Thm, @kernel.Thm) raise {
  define_record_type_c.get()(x)
}

///|
/// `get_record_components`
pub fn get_record_components(
  x20 : @kernel.Thm,
) -> @list.List[@kernel.Term] raise {
  let cth = x20
  let cjs = @basics.conjuncts(@kernel.concl(cth))
  let n = @lib.div63(Int::to_int64(@lib.length(cjs)), 2L)
  let rcjs = @lib.map(
    fn(x21 : Int64) -> @kernel.Term raise {
      let i = x21
      @lib.el(@lib.int63_to_int(@lib.mul63(2L, i)), cjs)
    },
    @lib.range(0L, @lib.sub63(n, 1L)),
  )
  @lib.map(
    fn(x26 : @kernel.Term) -> @kernel.Term raise {
      (fn(
        x24 : (@list.List[@kernel.Term], @kernel.Term),
      ) -> @kernel.Term raise {
        (fn(x22 : @kernel.Term) -> @kernel.Term raise {
          @equal.lhand(@equal.lhand(x22))
        })(
          (fn(
            x23 : (@list.List[@kernel.Term], @kernel.Term),
          ) -> @kernel.Term raise {
            x23.1
          })(x24),
        )
      })(
        (fn(
          x25 : @kernel.Term,
        ) -> (@list.List[@kernel.Term], @kernel.Term) raise {
          @basics.strip_forall(x25)
        })(x26),
      )
    },
    rcjs,
  )
}

///|
/// `record_read_write_thms`
pub fn record_read_write_thms(
  x27 : @kernel.Thm,
  x28 : @kernel.Thm,
) -> @list.List[@kernel.Thm] raise {
  let (ith, cth) = (x27, x28)
  let pat = @term_syntax.parse_term("∀ y : B, ∀ s : A, read((c : Component[A, B]), write(c, y, s)) == y")
  let ctm = @term_syntax.parse_term("(c : Component[A, B])")
  let rule : (@kernel.Term) -> @kernel.Thm raise = fn(
    x29 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let tm = x29
    let t30 = @simp.rewrite_tac(@list.List([cth]))
    let t31 = @tactics.then_tac(
      @tactics.then_tac(
        @tactics.repeat_tac(
          @tactics.orelse_tac(@tactics.match_mp_tac(ith), @tactics.gen_tac),
        ),
        t30,
      ),
      @tactics.no_tac,
    )
    @tactics.prove(
      @drule.instantiate(@drule.term_match(@list.List([]), ctm, tm), pat),
      t31,
    )
  }
  @lib.map(rule, get_record_components(cth))
}

///|
/// `record_strongly_valid_component_thms`
pub fn record_strongly_valid_component_thms(
  x32 : @kernel.Thm,
  x33 : @kernel.Thm,
) -> @list.List[@kernel.Thm] raise {
  let (ith, cth) = (x32, x33)
  let rule : (@kernel.Term) -> @kernel.Thm raise = fn(
    x34 : @kernel.Term,
  ) -> @kernel.Thm raise {
    let tm = x34
    let t38 = @simp.rewrite_tac(@list.List([cth]))
    let t37 = @tactics.repeat_tac(
      @tactics.orelse_tac(@tactics.match_mp_tac(ith), @tactics.gen_tac),
    )
    let t36 = @tactics.repeat_tac(@tactics.conj_tac)
    let t39 = @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.gen_rewrite_tac(
              fn(
                x35 : (@kernel.Term) -> @kernel.Thm raise,
              ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                x35
              },
              @list.List([@components.strongly_valid_component()]),
            ),
            t36,
          ),
          t37,
        ),
        t38,
      ),
      @tactics.no_tac,
    )
    @tactics.prove(
      @basics.list_mk_icomb("strongly_valid_component", @list.List([tm])),
      t39,
    )
  }
  @lib.map(rule, get_record_components(cth))
}

///|
/// `record_valid_component_thms`
pub fn record_valid_component_thms(
  x40 : @kernel.Thm,
  x41 : @kernel.Thm,
) -> @list.List[@kernel.Thm] raise {
  let (ith, cth) = (x40, x41)
  let t42 = record_strongly_valid_component_thms(ith, cth)
  @lib.map(
    @drule.match_mp(@components.strongly_valid_imp_valid_component()),
    t42,
  )
}

///|
/// `record_extensionally_valid_component_thms`
pub fn record_extensionally_valid_component_thms(
  x43 : @kernel.Thm,
  x44 : @kernel.Thm,
) -> @list.List[@kernel.Thm] raise {
  let (ith, cth) = (x43, x44)
  let t45 = record_strongly_valid_component_thms(ith, cth)
  @lib.map(
    @drule.match_mp(
      @components.strongly_valid_imp_extensionally_valid_component(),
    ),
    t45,
  )
}

///|
/// `record_weakly_valid_component_thms`
pub fn record_weakly_valid_component_thms(
  x46 : @kernel.Thm,
  x47 : @kernel.Thm,
) -> @list.List[@kernel.Thm] raise {
  let (ith, cth) = (x46, x47)
  let t48 = record_valid_component_thms(ith, cth)
  @lib.map(@drule.match_mp(@components.valid_imp_weakly_valid_component()), t48)
}

///|
/// `record_orthogonality_thms`
pub fn record_orthogonality_thms(
  x49 : @kernel.Thm,
  x50 : @kernel.Thm,
) -> @list.List[@kernel.Thm] raise {
  let (ith, cth) = (x49, x50)
  let cmps = get_record_components(cth)
  let dps = @lib.filter(
    fn(x51 : (@kernel.Term, @kernel.Term)) -> Bool raise {
      let (a, b) = x51
      a != b
    },
    @lib.allpairs(
      fn(
        x52 : @kernel.Term,
        x53 : @kernel.Term,
      ) -> (@kernel.Term, @kernel.Term) raise {
        let a_1 = x52
        let b_1 = x53
        (a_1, b_1)
      },
      cmps,
      cmps,
    ),
  )
  let cjs = @lib.map(
    fn(x54 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
      let (a_2, b_2) = x54
      @basics.list_mk_icomb("orthogonal_components", @list.List([a_2, b_2]))
    },
    dps,
  )
  let t56 = @simp.rewrite_tac(@list.List([cth]))
  let t55 = @tactics.repeat_tac(
    @tactics.orelse_tac(
      @tactics.orelse_tac(@tactics.conj_tac, @tactics.match_mp_tac(ith)),
      @tactics.gen_tac,
    ),
  )
  let tac : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
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
  ) raise = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@components.orthogonal_components()])),
      t55,
    ),
    t56,
  )
  @lib.map(
    fn(x57 : @kernel.Term) -> @kernel.Thm raise {
      let tm = x57
      @tactics.prove(tm, tac)
    },
    cjs,
  )
}

///|
/// `define_auto_record_type`
pub fn define_auto_record_type(
  x58 : String,
) -> (@kernel.Thm, @kernel.Thm, @kernel.Thm) raise {
  let def = x58
  let (ith, rth, cth) = define_record_type(def)
  @components.add_component_read_write_thms(record_read_write_thms(ith, cth))
  @components.add_strongly_valid_component_thms(
    record_strongly_valid_component_thms(ith, cth),
  )
  @components.add_valid_component_thms(record_valid_component_thms(ith, cth))
  @components.add_extensionally_valid_component_thms(
    record_extensionally_valid_component_thms(ith, cth),
  )
  @components.add_weakly_valid_component_thms(
    record_weakly_valid_component_thms(ith, cth),
  )
  @components.add_component_orthogonality_thms(
    record_orthogonality_thms(ith, cth),
  )
  (ith, rth, cth)
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
  step_3()
}
