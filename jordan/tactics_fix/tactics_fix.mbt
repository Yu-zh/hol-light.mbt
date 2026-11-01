// Translated from upstream Jordan/tactics_fix.ml; edit this file directly.

///|
/// hash_of_string
fn step_1() -> Unit raise {
  let prime200 = 1223L
  let prime = 8831L
  fn hashll(x1 : @list.List[String]) -> Int64 raise {
    let v = x1
    match v {
      Empty => 0L
      More(h, tail=t) => {
        let t2 = @lib.mul63(prime200, hashll(t))
        @lib.mod63(@lib.add63(Int::to_int64(Char::to_int(@lib.ocaml_string_get(h, 0))), t2), prime)
      }
    }
  }
  hash_of_string_c.set(fn(x3 : String) -> Int64 raise {
    let s = x3
    let slt = @lib.explode(s)
    hashll(slt)
  })
}

///|
let hash_of_string_c : @lib.Cell[(String) -> Int64 raise] = @lib.Cell::new("hash_of_string")

///|
/// `hash_of_string`
pub fn hash_of_string(x : String) -> Int64 raise {
  (hash_of_string_c.get())(x)
}

///|
/// saved_hashstring
fn step_2() -> Unit raise {
  saved_hashstring_c.set(Ref::{ val: @lib.hashtbl_create(300) })
}

///|
let saved_hashstring_c : @lib.Cell[Ref[@lib.OHashtbl[String, Int64]]] = @lib.Cell::new("saved_hashstring")

///|
/// `saved_hashstring`
pub fn saved_hashstring() -> Ref[@lib.OHashtbl[String, Int64]] {
  saved_hashstring_c.get()
}

///|
/// `save_hashstring`
pub fn save_hashstring(x4 : String) -> Unit raise {
  let string = x4
  let t5 = hash_of_string(string)
  @lib.hashtbl_add(saved_hashstring().val, string, t5)
}

///|
/// `mem_hashstring`
pub fn mem_hashstring(x6 : String) -> Bool raise {
  let s = x6
  @lib.hashtbl_mem(saved_hashstring().val, s)
}

///|
/// `remove_hashstring`
pub fn remove_hashstring(x7 : String) -> Unit raise {
  let s = x7
  @lib.hashtbl_remove(saved_hashstring().val, s)
}

///|
/// `find_hashstring`
pub fn find_hashstring(x8 : String) -> Int64 raise {
  let s = x8
  @lib.hashtbl_find(saved_hashstring().val, s)
}

///|
/// A free variable's upstream name, for `hash_of_term`: Jordan's proofs pick
/// hypotheses by hash numbers (UNDH 3313), and the variable fn is fn_ in
/// the port (fn is a MoonBit keyword, issue #140).
fn upstream_variable(s : String) -> String {
  if s.has_prefix("fn_") {
    let primes = s[3:].to_owned()
    if primes.iter().all(c => c == '\'') {
      return "fn" + primes
    }
  }
  s
}

///|
/// `memhash_of_string`
pub fn memhash_of_string(x9 : String) -> Int64 raise {
  let s = x9
  if !mem_hashstring(s) {
    save_hashstring(s)
  } else {
    ()
  }
  find_hashstring(s)
}

///|
/// hash_of_type
fn step_3() -> Unit raise {
  let prime150 = 863L
  let prime160 = 941L
  let prime180 = 1069L
  let prime190 = 1151L
  let prime1200 = 9733L
  let hashl = (x10 : @list.List[@kernel.HolType]) => hashl_l(prime190, prime1200, prime150, prime160, prime180, x10)
  let hasht = (x12 : @kernel.HolType) => hasht_l(prime190, prime1200, prime150, prime160, prime180, x12)
  hash_of_type_c.set(hasht)
}

///|
let hash_of_type_c : @lib.Cell[(@kernel.HolType) -> Int64 raise] = @lib.Cell::new("hash_of_type")

///|
/// `hash_of_type`
pub fn hash_of_type(x : @kernel.HolType) -> Int64 raise {
  (hash_of_type_c.get())(x)
}

///|
fn hashl_l(prime190 : Int64, prime1200 : Int64, prime150 : Int64, prime160 : Int64, prime180 : Int64, x10 : @list.List[@kernel.HolType]) -> Int64 raise {
  let hashl = (x10 : @list.List[@kernel.HolType]) => hashl_l(prime190, prime1200, prime150, prime160, prime180, x10)
  let hasht = (x12 : @kernel.HolType) => hasht_l(prime190, prime1200, prime150, prime160, prime180, x12)
  let u = x10
  match u {
    Empty => 0L
    More(h, tail=t) => {
      let t11 = @lib.mul63(prime190, hashl(t))
      @lib.mod63(@lib.add63(hasht(h), t11), prime1200)
    }
  }
}

///|
fn hasht_l(prime190 : Int64, prime1200 : Int64, prime150 : Int64, prime160 : Int64, prime180 : Int64, x12 : @kernel.HolType) -> Int64 raise {
  let hashl = (x10 : @list.List[@kernel.HolType]) => hashl_l(prime190, prime1200, prime150, prime160, prime180, x10)
  let v = x12
  match v {
    @kernel.HolType::Tyvar(s) => @lib.mod63(@lib.add63(@lib.mul63(prime150, memhash_of_string(s)), prime160), prime1200)
    @kernel.HolType::Tyapp(s_1, tlt) => {
      let h_1 = memhash_of_string(s_1)
      let h2 = @lib.mod63(@lib.mul63(h_1, h_1), prime1200)
      let t13 = hashl(tlt)
      @lib.mod63(@lib.add63(@lib.mul63(prime180, h2), t13), prime1200)
    }
  }
}

///|
/// `rename_var`
pub fn rename_var(x14 : Int64, x15 : @kernel.Term) -> @kernel.Term raise {
  let n = x14
  let v = x15
  let t16 = @kernel.type_of(v)
  @kernel.mk_var(("??_" + Int64::to_string(n)), t16)
}

///|
/// paform
fn step_4() -> Unit raise {
  fn raform(x17 : Int64, x18 : @list.List[(@kernel.Term, @kernel.Term)], x19 : @kernel.Term) -> @kernel.Term raise {
    let n = x17
    let env = x18
    let tm = x19
    match tm {
      @kernel.Term::Var(_, _) => @lib.assocd(tm, env, tm)
      @kernel.Term::Const(_, _) => tm
      @kernel.Term::Comb(s, t) => {
        let t20 = raform(n, env, t)
        @kernel.mk_comb(raform(n, env, s), t20)
      }
      @kernel.Term::Abs(x, t_1) => {
        let x1 = rename_var(n, x)
        @kernel.mk_abs(x1, raform(@lib.add63(n, 1L), env.prepend((x, x1)), t_1))
      }
    }
  }
  paform_c.set((x21 : @kernel.Term) => raform(0L, @list.List([]), x21))
}

///|
let paform_c : @lib.Cell[(@kernel.Term) -> @kernel.Term raise] = @lib.Cell::new("paform")

///|
/// `paform`
pub fn paform(x : @kernel.Term) -> @kernel.Term raise {
  (paform_c.get())(x)
}

///|
/// hash_of_term
fn step_5() -> Unit raise {
  let prime1220 = 9887L
  let prime210 = 1291L
  let prime220 = 1373L
  let prime230 = 1451L
  let prime240 = 1511L
  let prime250 = 1583L
  let prime260 = 1657L
  let prime270 = 1733L
  let prime280 = 1811L
  fn hasht(x22 : @kernel.Term) -> Int64 raise {
    let u = x22
    match u {
      @kernel.Term::Var(s, t) => {
        let t23 = hash_of_type(t)
        @lib.mod63(@lib.add63(@lib.mul63(prime210, memhash_of_string(upstream_variable(s))), t23), prime1220)
      }
      @kernel.Term::Const(s_1, t_1) => {
        let t24 = hash_of_type(t_1)
        // Stable symbol code used by existing Jordan proof labels: upstream's
        // names (! and local definitions' package'name).
        let symbol_hash = if s_1 == "forall" {
          33L
        } else {
          memhash_of_string(@lib_ext.upstream_name(s_1))
        }
        @lib.mod63(@lib.add63(@lib.mul63(prime220, symbol_hash), t24), prime1220)
      }
      @kernel.Term::Comb(s_2, t_2) => {
        let h = hasht(s_2)
        let h2 = @lib.mod63(@lib.mul63(h, h), prime1220)
        let t25 = @lib.mul63(prime240, hasht(t_2))
        @lib.mod63(@lib.add63(@lib.add63(@lib.mul63(prime230, h2), t25), prime250), prime1220)
      }
      @kernel.Term::Abs(s_3, t_3) => {
        let h_1 = hasht(s_3)
        let h2_1 = @lib.mod63(@lib.mul63(h_1, h_1), prime1220)
        let t26 = @lib.mul63(prime270, hasht(t_3))
        @lib.mod63(@lib.add63(@lib.add63(@lib.mul63(prime260, h2_1), t26), prime280), prime1220)
      }
    }
  }
  hash_of_term_c.set(fn(x27 : @kernel.Term) -> Int64 raise {
    hasht(paform(x27))
  })
}

///|
let hash_of_term_c : @lib.Cell[(@kernel.Term) -> Int64 raise] = @lib.Cell::new("hash_of_term")

///|
/// `hash_of_term`
pub fn hash_of_term(x : @kernel.Term) -> Int64 raise {
  (hash_of_term_c.get())(x)
}

///|
/// `print_hyp`
pub fn[TA] print_hyp(x28 : TA, x29 : (String, @kernel.Thm)) -> Unit raise {
  let n = x28
  let (s, th) = x29
  {
    @pp.std_formatter.open_hbox()
  }
  @pp.std_formatter.print_string(" ")
  @pp.std_formatter.print_as(4, Int64::to_string(hash_of_term(@kernel.concl(th))))
  @pp.std_formatter.print_string(" [")
  @printer.print_qterm(@kernel.concl(th))
  @pp.std_formatter.print_string("]")
  if !((s == "")) {
    @pp.std_formatter.print_string((" (" + (s + ")")))
  } else {
    ()
  }
  {
    @pp.std_formatter.close_box()
  }
  {
    @pp.std_formatter.print_newline()
  }
}

///|
/// `print_hyps`
pub fn print_hyps(x30 : Int64, x31 : @list.List[(String, @kernel.Thm)]) -> Unit raise {
  let n = x30
  let asl = x31
  if @list.List::is_empty(asl) {
    ()
  } else {
    print_hyp(n, @lib.hd(asl))
    let t32 = @lib.tl(asl)
    print_hyps(@lib.add63(n, 1L), t32)
  }
}

///|
/// `print_goal_hashed`
pub fn print_goal_hashed(x33 : @list.List[(String, @kernel.Thm)], x34 : @kernel.Term) -> Unit raise {
  let (asl, w) = (x33, x34)
  {
    @pp.std_formatter.print_newline()
  }
  if !@list.List::is_empty(asl) {
    print_hyps(0L, asl)
    {
      @pp.std_formatter.print_newline()
    }
  } else {
    ()
  }
  @printer.print_qterm(w)
  {
    @pp.std_formatter.print_newline()
  }
}

///|
/// `print_goalstate_hashed`
pub fn print_goalstate_hashed(x35 : Int64, x36 : ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise)) -> Unit raise {
  let k = x35
  let gs = x36
  let (_, gl, _) = gs
  let n = Int::to_int64(@lib.length(gl))
  let s = if (n == 0L) {
    "No subgoals"
  } else {
    let t37 = (" (" + (Int64::to_string(n) + " total)"))
    let t38 = (" subgoal" + ((if (k > 1L) {
      "s"
    } else {
      ""
    }) + t37))
    (Int64::to_string(k) + t38)
  }
  @pp.std_formatter.print_string(s)
  {
    @pp.std_formatter.print_newline()
  }
  if @list.List::is_empty(gl) {
    ()
  } else {
    @lib.do_list(fn(x43 : Int64) -> Unit raise {
      (fn(x39 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> Unit raise {
        print_goal_hashed(x39.0, x39.1)
      })((fn(x42 : Int64) -> (@list.List[(String, @kernel.Thm)], @kernel.Term) raise {
        (fn(x40 : Int64) -> ((@list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)]) -> (@list.List[(String, @kernel.Thm)], @kernel.Term) raise) raise {
          fn(x41 : @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)]) -> (@list.List[(String, @kernel.Thm)], @kernel.Term) raise {
            @lib.el(@lib.int63_to_int(x40), x41)
          }
        })(x42)(gl)
      })(x43))
    }, @lib.rev(@lib.range(0L, @lib.sub63(k, 1L))))
  }
}

///|
/// `print_goalstack_hashed`
pub fn print_goalstack_hashed(x44 : @list.List[((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise)]) -> Unit raise {
  let l = x44
  if @list.List::is_empty(l) {
    @pp.std_formatter.print_string("Empty goalstack")
  } else {
    if @list.List::is_empty(@lib.tl(l)) {
      let (_, gl, _) as gs = @lib.hd(l)
      print_goalstate_hashed(1L, gs)
    } else {
      let (_, gl_1, _) as gs_1 = @lib.hd(l)
      let (_, gl0, _) = @lib.hd(@lib.tl(l))
      let t45 = Int::to_int64(@lib.length(gl0))
      let p = @lib.sub63(Int::to_int64(@lib.length(gl_1)), t45)
      let p_p = if (p < 1L) {
        1L
      } else {
        @lib.add63(p, 1L)
      }
      print_goalstate_hashed(p_p, gs_1)
    }
  }
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
  step_3()
  step_4()
  step_5()
}
