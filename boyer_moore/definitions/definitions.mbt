// Translated from upstream Boyer_Moore/definitions.ml; edit this file directly.

///|
/// `recursive_calls`
pub fn recursive_calls(x1 : String, x2 : @kernel.Term) -> @list.List[@kernel.Term] raise {
  let name = x1
  let tm = x2
  try {
    let (f, args) = @basics.strip_comb(tm)
    if (try {
      (@kernel.dest_const(f).0 == name)
    } catch {
      Failure(_) => false
      e => raise e
    }) {
      @list.List([tm])
    } else {
      @lib.itlist(fn(x3 : @list.List[@kernel.Term], x4 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
        @lib.list_append(x3, x4)
      }, @lib.map((x5 : @kernel.Term) => recursive_calls(name, x5), args), @list.List([]))
    }
  } catch {
    Failure(_) => @list.List([])
    e => raise e
  }
}

///|
/// `is_subterm`
pub fn is_subterm(x6 : @kernel.Term, x7 : @kernel.Term) -> Bool raise {
  let subterm = x6
  let tm = x7
  try {
    if (tm == subterm) {
      true
    } else {
      (is_subterm(subterm, @kernel.rator(tm)) || is_subterm(subterm, @kernel.rand(tm)))
    }
  } catch {
    Failure(_) => false
    e => raise e
  }
}

///|
/// `no_new_terms`
pub fn no_new_terms(x8 : @kernel.Term, x9 : @kernel.Term) -> Bool raise {
  let app = x8
  let tm = x9
  try {
    let args = @basics.strip_comb(app).1
    @lib.itlist(fn(x10 : Bool, x11 : Bool) -> Bool raise {
      let x = x10
      let y = x11
      (x && y)
    }, @lib.map(fn(x12 : @kernel.Term) -> Bool raise {
      let arg = x12
      is_subterm(arg, tm)
    }, args), true)
  } catch {
    Failure(_) => raise Failure("no_new_terms")
    e => raise e
  }
}

///|
/// `hide_fun_call`
pub fn hide_fun_call(x13 : @kernel.Term, x14 : @kernel.Term) -> @kernel.Term raise {
  let app = x13
  let tm = x14
  let var_ = @basics.genvar(@kernel.type_of(app))
  @basics.subst(@list.List([(var_, app)]), tm)
}

///|
/// `is_explicit_value`
pub fn is_explicit_value(x15 : @kernel.Term) -> Bool raise {
  let tm = x15
  fn is_explicit_value_p(x16 : @list.List[String], x17 : @kernel.Term) -> Bool raise {
    let constructors = x16
    let tm_1 = x17
    (@support.is_t(tm_1) || (@support.is_f(tm_1) || (if (if @kernel.is_const(tm_1) {
      let t18 = @term_syntax.parse_type("Num")
      (@kernel.type_of(tm_1) == t18)
    } else {
      false
    }) {
      true
    } else {
      let (f, args) = @basics.strip_comb(tm_1)
      ((try {
        @lib.mem(@kernel.dest_const(f).0, constructors)
      } catch {
        Failure(_) => false
        e => raise e
      }) && @lib.forall((x19 : @kernel.Term) => is_explicit_value_p(constructors, x19), args))
    })))
  }
  is_explicit_value_p(@shells.all_constructors(()), tm)
}

///|
/// `more_explicit_values`
pub fn more_explicit_values(x20 : @kernel.Term, x21 : @kernel.Term) -> Bool raise {
  let old_call = x20
  let new_call = x21
  try {
    let (f1, args1) = @basics.strip_comb(old_call)
    let (f2, args2) = @basics.strip_comb(new_call)
    if (f1 == f2) {
      let n1 = Int::to_int64(@lib.length(@lib.filter(is_explicit_value, args1)))
      let n2 = Int::to_int64(@lib.length(@lib.filter(is_explicit_value, args2)))
      (n2 > n1)
    } else {
      raise Failure("")
    }
  } catch {
    Failure(_) => raise Failure("more_explicit_values")
    e => raise e
  }
}

///|
/// `good_properties`
pub fn[TA, TB, TC, TD] good_properties(x22 : TA, x23 : TB, x24 : TC, x25 : TD) -> Bool raise {
  let assumps = x22
  let call = x23
  let body_of_call = x24
  let tm = x25
  true
}

///|
fn load_steps() -> Unit raise {
  ()
}
