// Translated from upstream Boyer_Moore/shells.ml; edit this file directly.

///|
/// `constructor_info`
pub type ConstructorInfo = (String, @list.List[@kernel.HolType], @list.List[(String, @kernel.Thm)])

///|
/// `shell_info`
pub(all) struct ShellInfo {
  arg_types : @list.List[@kernel.HolType]
  constructors : @list.List[ConstructorInfo]
  induct : @kernel.Thm
  cases : @kernel.Thm
  distinct : @list.List[@kernel.Thm]
  one_one : @list.List[@kernel.Thm]
  struct_conv : (@equal.Conv) -> @equal.Conv raise
}

///|
/// `shell`
pub(all) enum Shell {
  Shell(String, ShellInfo)
}

///|
/// system_shells
fn step_1() -> Unit raise {
  system_shells_c.set(Ref::{ val: @list.List([]) })
}

///|
let system_shells_c : @lib.Cell[Ref[@list.List[Shell]]] = @lib.Cell::new("system_shells")

///|
/// `system_shells`
pub fn system_shells() -> Ref[@list.List[Shell]] {
  system_shells_c.get()
}

///|
/// `shell_info`
pub fn shell_info(x1 : @list.List[Shell], x2 : String) -> ShellInfo raise {
  let _ as shl = x1
  let name = x2
  if @list.List::is_empty(shl) {
    raise Failure("shell_info")
  } else {
    match @lib.hd(shl) {
      Shell::Shell(sh_name, info) => {
        if (sh_name == name) {
          info
        } else {
          shell_info(@lib.tl(shl), name)
        }
      }
    }
  }
}

///|
/// `sys_shell_info`
pub fn sys_shell_info(x3 : String) -> ShellInfo raise {
  let name = x3
  shell_info(system_shells().val, name)
}

///|
/// `shell_constructors`
pub fn shell_constructors(x4 : ShellInfo) -> @list.List[ConstructorInfo] raise {
  let info = x4
  info.constructors
}

///|
/// `shell_accessor_thms`
pub fn shell_accessor_thms(x5 : ShellInfo) -> @list.List[@kernel.Thm] raise {
  let info = x5
  (fn(x12 : @list.List[(String, @list.List[@kernel.HolType], @list.List[(String, @kernel.Thm)])]) -> @list.List[@kernel.Thm] raise {
    (fn(x9 : @list.List[@list.List[(String, @kernel.Thm)]]) -> @list.List[@kernel.Thm] raise {
      ((x7 : @list.List[(String, @kernel.Thm)]) => @lib.map(fn(x6 : (String, @kernel.Thm)) -> @kernel.Thm raise {
        x6.1
      }, x7))((fn(x8 : @list.List[@list.List[(String, @kernel.Thm)]]) -> @list.List[(String, @kernel.Thm)] raise {
        @lib.flat(x8)
      })(x9))
    })(((x11 : @list.List[(String, @list.List[@kernel.HolType], @list.List[(String, @kernel.Thm)])]) => @lib.map(fn(x10 : (String, @list.List[@kernel.HolType], @list.List[(String, @kernel.Thm)])) -> @list.List[(String, @kernel.Thm)] raise {
      @support.thd3(x10.0, x10.1, x10.2)
    }, x11))(x12))
  })(shell_constructors(info))
}

///|
/// `shell_arg_types`
pub fn shell_arg_types(x13 : ShellInfo) -> @list.List[@kernel.HolType] raise {
  let info = x13
  info.arg_types
}

///|
/// `shell_constructor`
pub fn shell_constructor(x14 : String, x15 : ShellInfo) -> ((@list.List[@kernel.HolType], @list.List[(String, @kernel.Thm)])) raise {
  let name = x14
  let _ as info = x15
  shell_constructor_p_l(name, info.constructors)
}

///|
fn[TA, TB, TC : Eq + @lib.OCompare + @lib.OHash] shell_constructor_p_l(x16 : TC, x17 : @list.List[(TC, TA, TB)]) -> ((TA, TB)) raise {
  let name_1 = x16
  let triples = x17
  if @list.List::is_empty(triples) {
    raise Failure("shell_constructor")
  } else {
    let (con_name, arg_types, accessors) = @lib.hd(triples)
    if (con_name == name_1) {
      (arg_types, accessors)
    } else {
      shell_constructor_p_l(name_1, @lib.tl(triples))
    }
  }
}

///|
/// `shell_constructor_arg_types`
pub fn shell_constructor_arg_types(x18 : String, x19 : ShellInfo) -> @list.List[@kernel.HolType] raise {
  let name = x18
  let info = x19
  shell_constructor(name, info).0
}

///|
/// `shell_constructor_accessors`
pub fn shell_constructor_accessors(x20 : String, x21 : ShellInfo) -> @list.List[(String, @kernel.Thm)] raise {
  let name_1 = x20
  let info_1 = x21
  shell_constructor(name_1, info_1).1
}

///|
/// `shells`
pub fn shells(x22 : Unit) -> @list.List[String] raise {
  let _ = x22
  fn shells_p(x23 : @list.List[Shell]) -> @list.List[String] raise {
    let shl = x23
    if @list.List::is_empty(shl) {
      @list.List([])
    } else {
      match @lib.hd(shl) {
        Shell::Shell(name, _) => shells_p(@lib.tl(shl)).prepend(name)
      }
    }
  }
  shells_p(system_shells().val)
}

///|
/// `all_constructors`
pub fn all_constructors(x24 : Unit) -> @list.List[String] raise {
  let _ = x24
  @lib.flat(@lib.map(fn(x28 : String) -> @list.List[String] raise {
    (fn(x27 : ShellInfo) -> @list.List[String] raise {
      ((x26 : @list.List[(String, @list.List[@kernel.HolType], @list.List[(String, @kernel.Thm)])]) => @lib.map(fn(x25 : (String, @list.List[@kernel.HolType], @list.List[(String, @kernel.Thm)])) -> String raise {
        @support.fst3(x25.0, x25.1, x25.2)
      }, x26))(shell_constructors(x27))
    })(sys_shell_info(x28))
  }, shells(())))
}

///|
/// `all_accessors`
pub fn all_accessors(x29 : Unit) -> @list.List[String] raise {
  let _ = x29
  @lib.flat(@lib.map(fn(x38 : String) -> @list.List[String] raise {
    (fn(x37 : ShellInfo) -> @list.List[String] raise {
      (fn(x36 : @list.List[(String, @list.List[@kernel.HolType], @list.List[(String, @kernel.Thm)])]) -> @list.List[String] raise {
        (fn(x30 : @list.List[@list.List[String]]) -> @list.List[String] raise {
          @lib.flat(x30)
        })(((x35 : @list.List[(String, @list.List[@kernel.HolType], @list.List[(String, @kernel.Thm)])]) => @lib.map(fn(x34 : (String, @list.List[@kernel.HolType], @list.List[(String, @kernel.Thm)])) -> @list.List[String] raise {
          ((x32 : @list.List[(String, @kernel.Thm)]) => @lib.map(fn(x31 : (String, @kernel.Thm)) -> String raise {
            x31.0
          }, x32))((fn(x33 : (String, @list.List[@kernel.HolType], @list.List[(String, @kernel.Thm)])) -> @list.List[(String, @kernel.Thm)] raise {
            @support.thd3(x33.0, x33.1, x33.2)
          })(x34))
        }, x35))(x36))
      })(shell_constructors(x37))
    })(sys_shell_info(x38))
  }, shells(())))
}

///|
/// `all_accessor_thms`
pub fn all_accessor_thms(x39 : Unit) -> @list.List[@kernel.Thm] raise {
  let _ = x39
  @lib.flat(@lib.map(fn(x40 : String) -> @list.List[@kernel.Thm] raise {
    shell_accessor_thms(sys_shell_info(x40))
  }, shells(())))
}

///|
/// num_shell
fn step_2() -> Unit raise {
  let induct = @nums.num_induction()
  let cases = @nums.num_cases()
  let distinct = @list.List([@nums.not_suc()])
  let one_one = @list.List([@nums.suc_inj()])
  let t42 = @struct_equal.one_step_recty_eq_conv(induct, distinct, one_one)
  let t41 = @list.List([("PRE", @bool.conjunct2(@arith.pre()))])
  num_shell_c.set(Shell::Shell("num", ShellInfo::{ arg_types: @list.List([]), constructors: @list.List([("0", @list.List([]), @list.List([])), ("SUC", @list.List([@term_syntax.parse_type("Num")]), t41)]), induct: induct, cases: cases, distinct: distinct, one_one: one_one, struct_conv: t42 }))
}

///|
let num_shell_c : @lib.Cell[Shell] = @lib.Cell::new("num_shell")

///|
/// `num_shell`
pub fn num_shell() -> Shell {
  num_shell_c.get()
}

///|
/// list_shell
fn step_3() -> Unit raise {
  let induct = @ind_types.list_induct()
  let cases = @lists.list_cases()
  let distinct = @list.List([@lists.not_cons_nil()])
  let one_one = @list.List([@lists.cons_11()])
  let t44 = @struct_equal.one_step_recty_eq_conv(induct, distinct, one_one)
  let t43 = @term_syntax.parse_type("List[`'a`]")
  let t45 = @list.List([("NIL", @list.List([]), @list.List([])), ("CONS", @list.List([@term_syntax.parse_type("`'a`"), t43]), @list.List([("HD", @lists.hd()), ("TL", @lists.tl())]))])
  list_shell_c.set(Shell::Shell("list", ShellInfo::{ arg_types: @list.List([@term_syntax.parse_type("`'a`")]), constructors: t45, induct: induct, cases: cases, distinct: distinct, one_one: one_one, struct_conv: t44 }))
}

///|
let list_shell_c : @lib.Cell[Shell] = @lib.Cell::new("list_shell")

///|
/// `list_shell`
pub fn list_shell() -> Shell {
  list_shell_c.get()
}

///|
/// Boyer_Moore/shells.ml:199
fn step_4() -> Unit raise {
  {
    system_shells().val = @list.List([list_shell(), num_shell()])
    ()
  }
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
  step_3()
  step_4()
}
