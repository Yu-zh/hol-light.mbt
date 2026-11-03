// Translated from upstream Jordan/lib_ext.ml; edit this file directly.

///|
/// `drop`
pub fn[TA] drop_(x1 : Int64, x2 : @list.List[TA]) -> @list.List[TA] raise {
  let i = x1
  let list = x2
  match (i, list) {
    (_, Empty) => raise Failure("drop null")
    (0L, More(a, tail=b)) => b
    (i_1, More(a_1, tail=b_1)) => drop_(@lib.sub63(i_1, 1L), b_1).prepend(a_1)
  }
}

///|
/// `take`
pub fn[TA] take(x3 : Int64, x4 : Int64, x5 : @list.List[TA]) -> @list.List[TA] raise {
  let i = x3
  let j = x4
  match x5 {
    Empty => @list.List([])
    More(a, tail=b) => {
      match (i, j) {
        (0L, 0L) => @list.List([])
        (0L, j_1) => take(0L, @lib.sub63(j_1, 1L), b).prepend(a)
        _ => {
          let t6 = @lib.sub63(j, 1L)
          take(@lib.sub63(i, 1L), t6, b)
        }
      }
    }
  }
}

///|
/// `cannot`
pub fn[TA, TB] cannot(x7 : (TB) -> TA raise, x8 : TB) -> Bool raise {
  let f = x7
  let x = x8
  try {
    ignore(f(x))
    false
  } catch {
    Failure(_) => true
    e => raise e
  }
}

///|
/// `new_test_suite`
pub fn new_test_suite(x9 : Unit) -> ((((String, Bool)) -> Unit raise, (Unit) -> Unit raise)) raise {
  let _ = x9
  let t = Ref::{ val: @list.List([]) }
  let add_test : ((String, Bool)) -> Unit raise = fn(x10 : (String, Bool)) -> Unit raise {
    let (s, f) = x10
    {
      t.val = (t.val).prepend((s, f))
      ()
    }
  }
  let eval : ((String, Bool)) -> Unit raise = fn(x11 : (String, Bool)) -> Unit raise {
    let (s_1, f_1) = x11
    if f_1 {
      ()
    } else {
      raise Failure(("test suite: " + s_1))
    }
  }
  let test_ : (Unit) -> Unit raise = fn(x12 : Unit) -> Unit raise {
    let _ = x12
    ignore(@lib.map(eval, t.val))
    ()
  }
  (add_test, test_)
}

///|
let add_test_c : @lib.Cell[((String, Bool)) -> Unit raise] = @lib.Cell::new("add_test")

///|
/// `add_test`
pub fn add_test(x : (String, Bool)) -> Unit raise {
  (add_test_c.get())(x)
}

///|
let test__c : @lib.Cell[(Unit) -> Unit raise] = @lib.Cell::new("test")

///|
/// `test`
pub fn test_(x : Unit) -> Unit raise {
  (test__c.get())(x)
}

///|
/// add_test, test
fn step_1() -> Unit raise {
  let (add_test, test_) = new_test_suite(())
  add_test_c.set(add_test)
  test__c.set(test_)
}

///|
/// local_defs
fn step_2() -> Unit raise {
  local_defs_c.set(Ref::{ val: @list.List([]) })
}

///|
let local_defs_c : @lib.Cell[Ref[@list.List[(String, (String, @kernel.Term))]]] = @lib.Cell::new("local_defs")

///|
/// The names local_definition's constants have upstream (package'name).
/// The port joins package and name with `_`, which the term syntax can
/// write; tactics_fix's hash_of_term hashes a constant under its upstream
/// name, since Jordan's proofs pick hypotheses by those hashes (UNDH 3313).
let upstream_names : Map[String, String] = Map([])

///|
/// The upstream name of the constant `name`: its own unless
/// local_definition made it.
pub fn upstream_name(name : String) -> String {
  upstream_names.get(name).unwrap_or(name)
}

///|
/// `local_defs`
pub fn local_defs() -> Ref[@list.List[(String, (String, @kernel.Term))]] {
  local_defs_c.get()
}

///|
/// `add_interface`
pub fn add_interface(x13 : String, x14 : @kernel.Term) -> Unit raise {
  let (sym, tm) = (x13, x14)
  if @lib.can((x15 : @list.List[(String, @kernel.HolType)]) => @lib.assoc(sym, x15), @printer.the_overload_skeletons.val) {
    @preterm.overload_interface(sym, tm)
  } else {
    @preterm.override_interface(sym, tm)
  }
}

///|
/// `local_definition`
pub fn local_definition(x16 : String, x17 : @kernel.Term) -> @kernel.Thm raise {
  let package_name = x16
  let tm = x17
  let list_mk_forall : ((@list.List[@kernel.Term], @kernel.Term)) -> @kernel.Term raise = fn(x18 : (@list.List[@kernel.Term], @kernel.Term)) -> @kernel.Term raise {
    let (vars, bod) = x18
    @lib.itlist((x20 : @kernel.Term, x21 : @kernel.Term) => @lib.curry(fn(x19 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
      @bool.mk_forall(x19.0, x19.1)
    }, x20, x21), vars, bod)
  }
  let (avs, bod_1) = @basics.strip_forall(tm)
  let (l, r) = try {
    @kernel.dest_eq(bod_1)
  } catch {
    Failure(_) => raise Failure("new_local_definition: Not an equation")
    e => raise e
  }
  let (lv, largs) = @basics.strip_comb(l)
  let (cname, ty) = @kernel.dest_var(lv)
  // a package name has no _, so package_name splits one way only
  let cname_p = if package_name.contains("_") {
    raise Failure("local_definition: a package name with _")
  } else {
    package_name + "_" + cname
  }
  let lv_p = @kernel.mk_var(cname_p, ty)
  let l_p = @basics.list_mk_comb(lv_p, largs)
  let bod_p = @basics.mk_eq(l_p, r)
  let tm_p = list_mk_forall((avs, bod_p))
  let thm = @pair.new_definition(tm_p)
  let _ = {
    local_defs().val = (local_defs().val).prepend((package_name, (cname, lv_p)))
    upstream_names[cname_p] = package_name + "'" + cname
    ()
  }
  let _ = add_interface(cname, lv_p)
  thm
}

///|
/// `reduce_local_interface`
pub fn reduce_local_interface(x22 : String) -> @list.List[Unit] raise {
  let package_name = x22
  @lib.map(fn(x25 : (String, (String, @kernel.Term))) -> Unit raise {
    (fn(x23 : (String, @kernel.Term)) -> Unit raise {
      @preterm.reduce_interface(x23.0, x23.1)
    })((fn(x24 : (String, (String, @kernel.Term))) -> (String, @kernel.Term) raise {
      x24.1
    })(x25))
  }, @lib.filter(fn(x26 : (String, (String, @kernel.Term))) -> Bool raise {
    let x = x26
    (x.0 == package_name)
  }, local_defs().val))
}

///|
/// `mk_local_interface`
pub fn mk_local_interface(x27 : String) -> @list.List[Unit] raise {
  let package_name = x27
  @lib.map(fn(x30 : (String, (String, @kernel.Term))) -> Unit raise {
    (fn(x28 : (String, @kernel.Term)) -> Unit raise {
      add_interface(x28.0, x28.1)
    })((fn(x29 : (String, (String, @kernel.Term))) -> (String, @kernel.Term) raise {
      x29.1
    })(x30))
  }, @lib.filter(fn(x31 : (String, (String, @kernel.Term))) -> Bool raise {
    let x = x31
    (x.0 == package_name)
  }, local_defs().val))
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
}
