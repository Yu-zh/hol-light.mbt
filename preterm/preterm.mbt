// ===========================================================================
// Preterms and pretypes; typechecking; translation to types and terms
// (port of preterm.ml).
//
// The global type-variable counter determines the names of invented type
// variables (`?n`), which appear in printed output and error messages, so
// every `new_type_var` call happens in OCaml's evaluation order. In
// particular OCaml evaluates constructor arguments and tuples right to
// left, which is reproduced explicitly below.
// ===========================================================================

///|
using @kernel {type Term, type HolType}

///|
using @list {type List}

///|
/// Warn when type variables are invented in quotations.
pub let type_invention_warning : Ref[Bool] = Ref::{ val: true, }

///|
/// Fail when type variables are invented in quotations.
pub let type_invention_error : Ref[Bool] = Ref::{ val: false, }

// ---------------------------------------------------------------------------
// Overloading and interface mapping.
// ---------------------------------------------------------------------------

///|
pub fn make_overloadable(s : String, gty : HolType) -> Unit raise {
  if @lib.can(n => @lib.assoc(n, @printer.the_overload_skeletons.val), s) {
    if @lib.assoc(s, @printer.the_overload_skeletons.val) != gty {
      raise Failure("make_overloadable: differs from existing skeleton")
    }
  } else {
    @printer.the_overload_skeletons.val = @printer.the_overload_skeletons.val.prepend(
      (s, gty),
    )
  }
}

///|
pub fn remove_interface(sym : String) -> Unit {
  @printer.the_interface.val = @lib.filter(
    (e : (String, (String, HolType))) => e.0 != sym,
    @printer.the_interface.val,
  )
}

///|
fn dest_const_or_var(tm : Term) -> (String, HolType) raise {
  @kernel.dest_const(tm) catch {
    Failure(_) => @kernel.dest_var(tm)
    e => raise e
  }
}

///|
pub fn reduce_interface(sym : String, tm : Term) -> Unit raise {
  let namty = dest_const_or_var(tm)
  @printer.the_interface.val = @lib.filter(
    (e : (String, (String, HolType))) => e != (sym, namty),
    @printer.the_interface.val,
  )
}

///|
/// Every entry the interface was given (override_interface,
/// overload_interface), kept when it is later replaced, removed or
/// reordered: the term syntax reads overloaded names through it, so that
/// they mean the same whenever they are read.
pub let overload_registry : Ref[@list.List[(String, (String, HolType))]] = Ref::{
  val: @list.List([]),
}

///|
fn register_overload(sym : String, namty : (String, HolType)) -> Unit {
  if !overload_registry.val.iter().any(e => e == (sym, namty)) {
    overload_registry.val = overload_registry.val.prepend((sym, namty))
  }
}

///|
pub fn override_interface(sym : String, tm : Term) -> Unit raise {
  let namty = dest_const_or_var(tm)
  register_overload(sym, namty)
  let interface = @lib.filter(
    (e : (String, (String, HolType))) => e.0 != sym,
    @printer.the_interface.val,
  )
  @printer.the_interface.val = interface.prepend((sym, namty))
}

///|
pub fn overload_interface(sym : String, tm : Term) -> Unit raise {
  let gty = @lib.assoc(sym, @printer.the_overload_skeletons.val) catch {
    Failure(_) => raise Failure("symbol \"" + sym + "\" is not overloadable")
    e => raise e
  }
  let namty = dest_const_or_var(tm)
  register_overload(sym, namty)
  if !@lib.can(t => @basics.type_match(gty, t, @list.List([])), namty.1) {
    raise Failure("Not an instance of type skeleton")
  }
  let interface = @lib.filter(
    (e : (String, (String, HolType))) => e != (sym, namty),
    @printer.the_interface.val,
  )
  @printer.the_interface.val = interface.prepend((sym, namty))
}

///|
pub fn prioritize_overload(ty : HolType) -> Unit raise {
  for sk in @printer.the_overload_skeletons.val {
    let (s, gty) = sk
    let found = Some(
      @lib.find(
        (e : (String, (String, HolType))) => {
          let (s1, (_, t)) = e
          s1 == s &&
          @lib.mem(
            ty,
            @lib.map(
              (p : (HolType, HolType)) => p.0,
              @basics.type_match(gty, t, @list.List([])),
            ),
          )
        },
        @printer.the_interface.val,
      ),
    ) catch {
      Failure(_) => None
      e => raise e
    }
    match found {
      Some((_, (n, t))) =>
        overload_interface(s, @kernel.mk_var(n, t)) catch {
          Failure(_) => ()
          e => raise e
        }
      None => ()
    }
  }
}

///|
/// Run `f`, then restore the interface map as it was before, also when `f`
/// raises, so overload priorities set inside `f` do not leak.
pub fn[T] with_interface_restored(f : () -> T raise) -> T raise {
  let saved = @printer.the_interface.val
  defer { @printer.the_interface.val = saved }
  f()
}

// ---------------------------------------------------------------------------
// Type abbreviations.
// ---------------------------------------------------------------------------

///|
let the_type_abbreviations : Ref[List[(String, HolType)]] = Ref::{
  val: @list.List([]),
}

///|
pub fn remove_type_abbrev(s : String) -> Unit {
  the_type_abbreviations.val = @lib.filter(
    (e : (String, HolType)) => e.0 != s,
    the_type_abbreviations.val,
  )
}

///|
pub fn new_type_abbrev(s : String, ty : HolType) -> Unit {
  remove_type_abbrev(s)
  the_type_abbreviations.val = @lib.merge(
    (x : (String, HolType), y : (String, HolType)) => @lib.compare(x, y) < 0,
    @list.singleton((s, ty)),
    the_type_abbreviations.val,
  )
}

///|
pub fn type_abbrevs() -> List[(String, HolType)] {
  the_type_abbreviations.val
}

// ---------------------------------------------------------------------------
// Pretypes and preterms.
// ---------------------------------------------------------------------------

///|
pub(all) enum Pretype {
  Utv(String) // user type variable
  Ptycon(String, List[Pretype]) // type constructor
  Stv(Int64) // system type variable (an OCaml int)
} derive(Eq, Debug)

///|
pub extend Pretype with Eq::{equal, not_equal}

///|
pub extend Pretype with @debug.Debug::{to_repr}

///|
/// Dummy pretype for the parser to use before typing.
pub let dpty : Pretype = Ptycon("", @list.List([]))

///|
pub fn pretype_of_type(ty : HolType) -> Pretype {
  match ty {
    Tyvar(s) => Utv(s)
    Tyapp(con, args) => Ptycon(con, args.map(pretype_of_type))
  }
}

///|
pub(all) enum Preterm {
  Varp(String, Pretype)
  Constp(String, Pretype)
  Combp(Preterm, Preterm)
  Absp(Preterm, Preterm)
  Typing(Preterm, Pretype)
} derive(Eq, Debug)

///|
pub extend Preterm with Eq::{equal, not_equal}

///|
pub extend Preterm with @debug.Debug::{to_repr}

///|
pub fn preterm_of_term(tm : Term) -> Preterm {
  match tm {
    Var(n, ty) => Varp(n, pretype_of_type(ty))
    Const(n, ty) => Constp(n, pretype_of_type(ty))
    Abs(v, bod) => Absp(preterm_of_term(v), preterm_of_term(bod))
    Comb(l, r) => Combp(preterm_of_term(l), preterm_of_term(r))
  }
}

// ---------------------------------------------------------------------------
// Pretype -> type, preterm -> term and retypechecking.
// ---------------------------------------------------------------------------

///|
let tyv_num : Ref[Int64] = Ref::{ val: 0, }

///|
/// A fresh type variable of elaboration (`?n` if nothing solves it).
pub fn new_type_var() -> Pretype {
  let n = tyv_num.val
  tyv_num.val = @lib.add63(n, 1L)
  Stv(n)
}

///|
fn pmk_cv(s : String, pty : Pretype) -> Preterm {
  try @kernel.get_const_type(s) catch {
    _ => Varp(s, pty)
  } noraise {
    _ => Constp(s, pty)
  }
}

///|
fn pmk_numeral(n : @num.Num) -> Preterm raise {
  let num_pty = Ptycon("num", @list.List([]))
  let fun_pty = Ptycon("fun", @list.List([num_pty, num_pty]))
  let numeral = Constp("NUMERAL", fun_pty)
  let bit0 = Constp("BIT0", fun_pty)
  let bit1 = Constp("BIT1", fun_pty)
  let t_0 = Constp("_0", num_pty)
  let ops = []
  let mut n = n
  while n != @num.num_0 {
    let m = @num.quo_num(n, @num.num_2)
    let b = @num.mod_num(n, @num.num_2)
    ops.push(if b == @num.num_0 { bit0 } else { bit1 })
    n = m
  }
  let mut t = t_0
  for i = ops.length() - 1; i >= 0; i = i - 1 {
    t = Combp(ops[i], t)
  }
  Combp(numeral, t)
}

///|
fn pretype_subst(th : List[(Pretype, Pretype)], ty : Pretype) -> Pretype raise {
  match ty {
    Ptycon(tycon, args) =>
      Ptycon(tycon, @lib.map(a => pretype_subst(th, a), args))
    Utv(_) => {
      for p in th {
        if p.1 == ty {
          return p.0
        }
      }
      ty
    }
    _ => raise Failure("pretype_subst: Unexpected form of pretype")
  }
}

///|
/// A pretype with fresh system type variables for the type variables of
/// `ty` (numbered in `tyvars` order).
fn pretype_instance(ty : HolType) -> Pretype raise {
  let gty = pretype_of_type(ty)
  let tyvs = @kernel.tyvars(ty).map(pretype_of_type)
  let subs = @lib.map(tv => (new_type_var(), tv), tyvs)
  pretype_subst(subs, gty)
}

///|
fn get_generic_type(cname : String) -> HolType raise {
  match
    @lib.filter(
      (e : (String, (String, HolType))) => e.0 == cname,
      @printer.the_interface.val,
    ) {
    More((_, (_, ty)), tail=Empty) => ty
    More(_, tail=More(_)) =>
      @lib.assoc(cname, @printer.the_overload_skeletons.val)
    Empty => @kernel.get_const_type(cname)
  }
}

///|
type Env = @lib.Func[Int64, Pretype]

///|
fn solve(env : Env, pty : Pretype) -> Pretype {
  match pty {
    Ptycon(f, args) => Ptycon(f, args.map(a => solve(env, a)))
    Stv(i) =>
      match @lib.apply_opt(env, i) {
        Some(p) => solve(env, p)
        None => pty
      }
    _ => pty
  }
}

///|
fn free_stvs(ty : Pretype) -> List[Int64] {
  fn go(ty : Pretype) -> List[Int64] {
    match ty {
      Stv(n) => @list.singleton(n)
      Utv(_) => @list.List([])
      Ptycon(_, args) => @lib.flat(args.map(go))
    }
  }

  @lib.setify(go(ty))
}

///|
fn string_of_pretype(stvs : List[Int64], ty : Pretype) -> String raise {
  fn conv(ty : Pretype) -> HolType raise {
    match ty {
      Stv(n) =>
        @kernel.mk_vartype(
          if @lib.mem(n, stvs) {
            "?" + n.to_string()
          } else {
            "_"
          },
        )
      Utv(v) => @kernel.mk_vartype(v)
      Ptycon(con, args) => @kernel.mk_type(con, @lib.map(conv, args))
    }
  }

  @printer.string_of_type(conv(ty))
}

///|
fn untyped_t_of_pt(ptm : Preterm) -> Term raise {
  match ptm {
    Varp(s, _) => @kernel.mk_var(s, @kernel.aty)
    Constp(s, _) => @basics.mk_mconst(s, @kernel.get_const_type(s))
    Combp(l, r) => {
      // OCaml evaluates the arguments right to left.
      let r1 = untyped_t_of_pt(r)
      @kernel.mk_comb(untyped_t_of_pt(l), r1)
    }
    Absp(v, bod) => {
      let b1 = untyped_t_of_pt(bod)
      @basics.mk_gabs(untyped_t_of_pt(v), b1)
    }
    Typing(p, _) => untyped_t_of_pt(p)
  }
}

///|
fn string_of_preterm(ptm : Preterm) -> String raise {
  @printer.string_of_term(untyped_t_of_pt(ptm))
}

///|
type TyError = (Preterm, Pretype, Pretype)?

///|
fn string_of_ty_error(env : Env, err : TyError) -> String raise {
  match err {
    None =>
      "unify: types cannot be unified " +
      "(you should not see this message, please report)"
    Some((t, ty1, ty2)) => {
      let ty1 = solve(env, ty1)
      let ty2 = solve(env, ty2)
      let sty1 = string_of_pretype(free_stvs(ty2), ty1)
      let sty2 = string_of_pretype(free_stvs(ty1), ty2)
      let default_msg = (s : String) => {
        " " +
        s +
        " cannot have type " +
        sty1 +
        " and " +
        sty2 +
        " simultaneously"
      }
      match t {
        Constp(s, _) =>
          " " +
          s +
          " has type " +
          @printer.string_of_type(@kernel.get_const_type(s)) +
          ", " +
          "it cannot be used with type " +
          sty2
        Varp(s, _) => default_msg(s)
        t => default_msg(string_of_preterm(t))
      }
    }
  }
}

///|
fn istrivial(err : TyError, env : Env, x : Int64, ty : Pretype) -> Bool raise {
  match ty {
    Stv(y) =>
      y == x ||
      (@lib.defined(env, y) && istrivial(err, env, x, @lib.apply(env, y)))
    Ptycon(_, args) =>
      if @lib.exists(a => istrivial(err, env, x, a), args) {
        raise Failure(string_of_ty_error(env, err))
      } else {
        false
      }
    Utv(_) => false
  }
}

///|
fn unify(ptm : Preterm?, env : Env, ty1 : Pretype, ty2 : Pretype) -> Env raise {
  let err : TyError = match ptm {
    None => None
    Some(t) => Some((t, ty1, ty2))
  }
  let mut env = env
  let mut work : List[(Pretype, Pretype, TyError)] = @list.singleton(
    (ty1, ty2, err),
  )
  while work is More(item, tail=oth) {
    match item {
      (t1, t2, _) if t1 == t2 => work = oth
      (Ptycon(f, fargs), Ptycon(g, gargs), e) =>
        if f == g && fargs.length() == gargs.length() {
          work = @lib.map2((x, y) => (x, y, e), fargs, gargs).concat(oth)
        } else {
          raise Failure(string_of_ty_error(env, e))
        }
      (Stv(x), t, e) =>
        if @lib.defined(env, x) {
          work = oth.prepend((@lib.apply(env, x), t, e))
        } else {
          if !istrivial(e, env, x, t) {
            env = @lib.update(x, t, env)
          }
          work = oth
        }
      (t, Stv(x), e) => work = oth.prepend((Stv(x), t, e))
      (_, _, e) => raise Failure(string_of_ty_error(env, e))
    }
  }
  env
}

///|
/// Attach the type `ty` to `ptm`; returns the typed preterm, the variables
/// it binds freely (with their types) and the new unification environment.
fn typify(
  ty : Pretype,
  ptm : Preterm,
  venv : List[(String, Pretype)],
  uenv : Env,
) -> (Preterm, List[(String, Pretype)], Env) raise {
  match ptm {
    Varp(s, _) if @lib.can(n => @lib.assoc(n, venv), s) => {
      let ty1 = @lib.assoc(s, venv)
      (Varp(s, ty1), @list.List([]), unify(Some(ptm), uenv, ty1, ty))
    }
    Varp(s, _) if @lib.can(@num.num_of_string, s) => {
      let t = pmk_numeral(@num.num_of_string(s))
      let ty1 = Ptycon("num", @list.List([]))
      (t, @list.List([]), unify(Some(ptm), uenv, ty1, ty))
    }
    Varp(s, _) => {
      @lib.warn(s != "" && @printer.isnum(s), "Non-numeral begins with a digit")
      if @lib.can(get_generic_type, s) {
        let pty = pretype_instance(get_generic_type(s))
        let ptm = Constp(s, pty)
        (ptm, @list.List([]), unify(Some(ptm), uenv, pty, ty))
      } else {
        (Varp(s, ty), @list.singleton((s, ty)), uenv)
      }
    }
    Combp(f, x) => {
      let ty2 = new_type_var()
      let ty1 = Ptycon("fun", @list.List([ty2, ty]))
      let (f1, venv1, uenv1) = typify(ty1, f, venv, uenv)
      let (x1, venv2, uenv2) = typify(ty2, x, venv1.concat(venv), uenv1)
      (Combp(f1, x1), venv1.concat(venv2), uenv2)
    }
    Typing(tm, pty) => typify(ty, tm, venv, unify(Some(tm), uenv, ty, pty))
    Absp(v, bod) => {
      let (ty1, ty2) = match ty {
        Ptycon("fun", More(a, tail=More(b, tail=Empty))) => (a, b)
        _ => {
          // OCaml evaluates `new_type_var(), new_type_var()` right to left.
          let second = new_type_var()
          (new_type_var(), second)
        }
      }
      let ty3 = Ptycon("fun", @list.List([ty1, ty2]))
      let uenv0 = unify(Some(ptm), uenv, ty3, ty)
      let (v1, venv1, uenv1) = {
        let (v1, venv1, uenv1) = typify(ty1, v, @list.List([]), uenv0)
        // A constant bound by a lambda is treated as a variable.
        match v1 {
          Constp(s, _) => (Varp(s, ty1), @list.singleton((s, ty1)), uenv0)
          _ => (v1, venv1, uenv1)
        }
      }
      let (bod1, venv2, uenv2) = typify(ty2, bod, venv1.concat(venv), uenv1)
      (Absp(v1, bod1), venv2, uenv2)
    }
    // a constant the term syntax resolved itself (true, false), which no
    // binder can capture; HOL's parser leaves every name to this function
    Constp(_, pty) => (ptm, @list.List([]), unify(Some(ptm), uenv, pty, ty))
  }
}

///|
/// Resolve overloadings: the first choice of a meaning for each overloaded
/// name, in the order the walk meets them (function before argument,
/// binder before body), under which every choice's type unifies.
///
/// preterm.ml does this continuation-passing, `tryfind` at each overloaded
/// name calling the rest of the walk. That needs OCaml's tail calls, which
/// MoonBit's wasm backends do not make through closures: ported as it was,
/// it took a stack frame per node of the term and overflowed the wasm stack
/// on large terms (a 3000-character statement in a debug build). Here the
/// walk is a loop that lists the overloaded names, and the search over
/// their choices keeps its own stack. The order of the calls is the same, `pretype_instance` and
/// `unify` included (`pretype_instance` numbers fresh type variables), and
/// so is every result and error: a choice is abandoned on `Failure` only,
/// and when the first name's choices run out the search fails as the
/// outermost `tryfind` would.
fn resolve_interface(ptm : Preterm, env : Env) -> Env raise {
  // the overloaded names, with the meanings to try for each; the walk
  // stops at a `Typing` node, which the search reports once it gets there
  let points : Array[(Preterm, Pretype, List[(String, (String, HolType))])] = []
  let mut typing = false
  let todo = [ptm]
  while todo.pop() is Some(t) {
    match t {
      Combp(f, x) => {
        todo.push(x)
        todo.push(f)
      }
      Absp(v, bod) => {
        todo.push(bod)
        todo.push(v)
      }
      Varp(_) => ()
      Constp(s, ty) => {
        let maps = @lib.filter(
          (e : (String, (String, HolType))) => e.0 == s,
          @printer.the_interface.val,
        )
        if !maps.is_empty() {
          points.push((t, ty, maps))
        }
      }
      Typing(_) => {
        typing = true
        break
      }
    }
  }
  // depth-first search: envs[i] is the environment before name i, and
  // left[i] the meanings of name i not tried yet
  let envs = [env]
  let left : Array[List[(String, (String, HolType))]] = []
  let mut i = 0
  while true {
    if i == points.length() {
      if typing {
        raise @lib.MatchFailure("preterm.ml: resolve_interface")
      }
      return envs[i]
    }
    if left.length() == i {
      left.push(points[i].2)
    }
    match left[i] {
      More(m, tail~) => {
        left[i] = tail
        let (ptm_i, ty, _) = points[i]
        let next = try {
          let ty1 = pretype_instance(m.1.1)
          Some(unify(Some(ptm_i), envs[i], ty1, ty))
        } catch {
          Failure(_) => None
          e => raise e
        }
        if next is Some(e) {
          envs.push(e)
          i = i + 1
        }
      }
      Empty => {
        // every meaning of name i failed: back to the name before it
        if i == 0 {
          raise Failure("tryfind")
        }
        ignore(left.pop())
        ignore(envs.pop())
        i = i - 1
      }
    }
  }
  envs[i]
}

///|
fn solve_preterm(env : Env, ptm : Preterm) -> Preterm raise {
  match ptm {
    Varp(s, ty) => Varp(s, solve(env, ty))
    Combp(f, x) => {
      // Constructor arguments are evaluated right to left in OCaml, and
      // `pretype_instance` below advances the type-variable counter.
      let x1 = solve_preterm(env, x)
      Combp(solve_preterm(env, f), x1)
    }
    Absp(v, bod) => {
      let b1 = solve_preterm(env, bod)
      Absp(solve_preterm(env, v), b1)
    }
    Constp(s, ty) => {
      let tys = solve(env, ty)
      let found = Some(
        @lib.find(
          (e : (String, (String, HolType))) => {
            let (s1, (_, ty1)) = e
            s == s1 &&
            @lib.can(t => unify(None, env, pretype_instance(ty1), t), ty)
          },
          @printer.the_interface.val,
        ),
      ) catch {
        Failure(_) => None
        e => raise e
      }
      match found {
        Some((_, (c1, _))) => pmk_cv(c1, tys)
        None => Constp(s, tys)
      }
    }
    Typing(_) => raise @lib.MatchFailure("preterm.ml: solve_preterm")
  }
}

///|
fn type_of_pretype_base(ty : Pretype) -> (HolType, Bool) raise {
  match ty {
    Stv(n) => (@kernel.mk_vartype("?" + n.to_string()), true)
    Utv(v) => (@kernel.mk_vartype(v), false)
    Ptycon(con, args) => {
      let (args1, translated) = @lib.unzip(@lib.map(type_of_pretype_base, args))
      (@kernel.mk_type(con, args1), translated.any(b => b))
    }
  }
}

///|
pub fn type_of_pretype(ty : Pretype) -> HolType raise {
  type_of_pretype_base(ty).0
}

///|
let stvs_translated_terms : Ref[List[String]] = Ref::{ val: @list.List([]), }

///|
fn note_translated(s : String, translated : Bool) -> Unit {
  if translated && !stvs_translated_terms.val.any(s1 => s == s1) {
    stvs_translated_terms.val = stvs_translated_terms.val.prepend(s)
  }
}

///|
fn term_of_preterm_rec(ptm : Preterm) -> Term raise {
  match ptm {
    Varp(s, pty) => {
      let (ty, translated) = type_of_pretype_base(pty)
      let v = @kernel.mk_var(s, ty)
      note_translated(s, translated)
      v
    }
    Constp(s, pty) => {
      let (ty, translated) = type_of_pretype_base(pty)
      let c = @basics.mk_mconst(s, ty)
      note_translated(s, translated)
      c
    }
    Combp(l, r) => {
      // OCaml evaluates the arguments right to left.
      let r1 = term_of_preterm_rec(r)
      @kernel.mk_comb(term_of_preterm_rec(l), r1)
    }
    Absp(v, bod) => {
      let b1 = term_of_preterm_rec(bod)
      @basics.mk_gabs(term_of_preterm_rec(v), b1)
    }
    Typing(p, _) => term_of_preterm_rec(p)
  }
}

///|
/// Translate a (fully typed) preterm to a term, reporting invented type
/// variables.
pub fn term_of_preterm(ptm : Preterm) -> Term raise {
  stvs_translated_terms.val = @list.List([])
  let tm = term_of_preterm_rec(ptm)
  if !stvs_translated_terms.val.is_empty() {
    if type_invention_error.val {
      raise Failure(
        "typechecking error (cannot infer type of variables): " +
        stvs_translated_terms.val.to_array().join(", "),
      )
    } else {
      @lib.warn(type_invention_warning.val, "inventing type variables")
    }
  }
  tm
}

///|
/// Typecheck a preterm in the variable environment `venv`: initial type
/// assignment, then overload resolution.
pub fn retypecheck(
  venv : List[(String, Pretype)],
  ptm : Preterm,
) -> Preterm raise {
  let ty = new_type_var()
  let (ptm1, _, env) = typify(ty, ptm, venv, @lib.undefined()) catch {
    Failure(e) =>
      raise Failure("typechecking error (initial type assignment):" + e)
    e => raise e
  }
  let env1 = resolve_interface(ptm1, env) catch {
    Failure(_) => raise Failure("typechecking error (overload resolution)")
    e => raise e
  }
  solve_preterm(env1, ptm1)
}

// ---------------------------------------------------------------------------
// OCaml `compare` on pretypes and preterms (used by the parser's set
// operations on preterms).
// ---------------------------------------------------------------------------

///|
fn pretype_tag(t : Pretype) -> Int {
  match t {
    Utv(_) => 0
    Ptycon(_) => 1
    Stv(_) => 2
  }
}

///|
pub impl @lib.OCompare for Pretype with fn ocompare(self, other) {
  match (self, other) {
    (Utv(a), Utv(b)) => @kernel.compare_string(a, b)
    (Ptycon(a, xs), Ptycon(b, ys)) => {
      let c = @kernel.compare_string(a, b)
      if c != 0 {
        c
      } else {
        @lib.compare(xs, ys)
      }
    }
    (Stv(a), Stv(b)) => a.compare(b)
    _ => pretype_tag(self).compare(pretype_tag(other))
  }
}

///|
pub extend Pretype with @lib.OCompare::{ocompare}

///|
fn preterm_tag(t : Preterm) -> Int {
  match t {
    Varp(_) => 0
    Constp(_) => 1
    Combp(_) => 2
    Absp(_) => 3
    Typing(_) => 4
  }
}

///|
pub impl @lib.OCompare for Preterm with fn ocompare(self, other) {
  match (self, other) {
    (Varp(a, x), Varp(b, y)) | (Constp(a, x), Constp(b, y)) => {
      let c = @kernel.compare_string(a, b)
      if c != 0 {
        c
      } else {
        @lib.compare(x, y)
      }
    }
    (Combp(a, x), Combp(b, y)) | (Absp(a, x), Absp(b, y)) => {
      let c = @lib.compare(a, b)
      if c != 0 {
        c
      } else {
        @lib.compare(x, y)
      }
    }
    (Typing(a, x), Typing(b, y)) => {
      let c = @lib.compare(a, b)
      if c != 0 {
        c
      } else {
        @lib.compare(x, y)
      }
    }
    _ => preterm_tag(self).compare(preterm_tag(other))
  }
}

///|
pub extend Preterm with @lib.OCompare::{ocompare}

///|
/// The type-variable counter (for differential tests of load order).
pub fn type_var_counter() -> Int64 {
  tyv_num.val
}
