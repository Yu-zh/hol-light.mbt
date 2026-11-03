// Parser/printer differential test: interprets
// tools/ocaml_ref/parse_cases.txt like tools/ocaml_ref/parser_ref.ml and
// compares with the upstream output. Keep the two interpreters in sync.

///|
let cases : String =
  #|# Shared parser/printer cases: interpreted by tools/ocaml_ref/parser_ref.ml
  #|# and parser/parser_ref_test.mbt. Commands:
  #|#   newtype NAME ARITY | const NAME : TYPE | infix NAME PREC ASSOC
  #|#   binder NAME | prefix NAME | overloadable SYM : TYPE
  #|#   overload SYM TERM | override SYM TERM | abbrev NAME : TYPE
  #|#   prioritize TYPE | margin N | Y: TYPE | T: TERM
  #|newtype num 0
  #|newtype prod 2
  #|newtype sum 2
  #|newtype cart 2
  #|newtype list 1
  #|newtype char 0
  #|newtype 1 0
  #|newtype tybit0 1
  #|newtype tybit1 1
  #|newtype int 0
  #|newtype real 0
  #|const T : bool
  #|const F : bool
  #|const ~ : bool->bool
  #|const /\ : bool->bool->bool
  #|const \/ : bool->bool->bool
  #|const ==> : bool->bool->bool
  #|const forall : (A->bool)->bool
  #|const ? : (A->bool)->bool
  #|const ?! : (A->bool)->bool
  #|const @ : (A->bool)->A
  #|const COND : bool->A->A->A
  #|const LET : (A->B)->A->B
  #|const LET_END : A->A
  #|const GEQ : A->A->bool
  #|const GABS : (A->bool)->A
  #|const _MATCH : A->(A->B->bool)->B
  #|const _FUNCTION : (A->B->bool)->A->B
  #|const _SEQPATTERN : (A->B->bool)->(A->B->bool)->A->B->bool
  #|const _UNGUARDED_PATTERN : bool->bool->bool
  #|const _GUARDED_PATTERN : bool->bool->bool->bool
  #|const NUMERAL : num->num
  #|const BIT0 : num->num
  #|const BIT1 : num->num
  #|const _0 : num
  #|const SUC : num->num
  #|const + : num->num->num
  #|const * : num->num->num
  #|const - : num->num->num
  #|const < : num->num->bool
  #|const <= : num->num->bool
  #|const EXP : num->num->num
  #|const DECIMAL : num->num->real
  #|const , : A->B->A#B
  #|const FST : A#B->A
  #|const SND : A#B->B
  #|const INSERT : A->(A->bool)->A->bool
  #|const EMPTY : A->bool
  #|const UNIV : A->bool
  #|const GSPEC : (A->bool)->A->bool
  #|const SETSPEC : A->bool->A->bool
  #|const IN : A->(A->bool)->bool
  #|const UNION : (A->bool)->(A->bool)->A->bool
  #|const CONS : A->(A)list->(A)list
  #|const NIL : (A)list
  #|const ASCII : bool->bool->bool->bool->bool->bool->bool->bool->char
  #|const int_add : int->int->int
  #|const int_of_num : num->int
  #|const int_neg : int->int
  #|const real_add : real->real->real
  #|const real_of_num : num->real
  #|const real_neg : real->real
  #|const real_lt : real->real->bool
  #|prefix ~
  #|binder \
  #|binder forall
  #|binder ?
  #|binder ?!
  #|binder @
  #|infix ==> 4 right
  #|infix \/ 6 right
  #|infix /\ 8 right
  #|infix <=> 2 right
  #|override <=> (=):bool->bool->bool
  #|infix = 12 right
  #|infix < 12 right
  #|infix <= 12 right
  #|infix + 16 right
  #|infix - 18 left
  #|infix * 20 right
  #|infix EXP 24 left
  #|infix IN 11 right
  #|infix UNION 16 right
  #|overloadable + : A->A->A
  #|overloadable -- : A->A
  #|overloadable & : num->A
  #|overloadable < : A->A->bool
  #|overload + (+):num->num->num
  #|overload < (<):num->num->bool
  #|overload + int_add
  #|overload + real_add
  #|overload -- int_neg
  #|overload -- real_neg
  #|overload & int_of_num
  #|overload & real_of_num
  #|overload < real_lt
  #|prefix --
  #|prioritize num
  #|Y: num
  #|Y: A
  #|Y: A->B->C
  #|Y: (A->B)->C
  #|Y: A#B#C
  #|Y: (A#B)#C
  #|Y: A+B#C->D
  #|Y: (num)list
  #|Y: num list
  #|Y: (A,B)prod
  #|Y: A^3
  #|Y: num^12
  #|Y: (A->B)list
  #|Y: A->
  #|Y: (A,B)
  #|Y: foo bar
  #|T: x
  #|T: T
  #|T: p /\ q ==> r
  #|T: p ==> q ==> r
  #|T: (p ==> q) ==> r
  #|T: p \/ q /\ r
  #|T: ~p
  #|T: ~ ~p
  #|T: ~(p /\ q)
  #|T: x = y
  #|T: x + y + z
  #|T: (x + y) + z
  #|T: x - y - z
  #|T: x - (y - z)
  #|T: x * y + z * w
  #|T: (x + y) * z
  #|T: x EXP 2 EXP 3
  #|T: SUC (SUC 0)
  #|T: SUC x + 1
  #|T: 0
  #|T: 12345678901234567890
  #|T: 0x1F
  #|T: 0b101
  #|T: forall x. x = x
  #|T: forall x y. x = y ==> y = x
  #|T: ?x. x < 1
  #|T: ?!x. x = 0
  #|T: @x. x < 5
  #|T: \x. x + 1
  #|T: \x y. x + y
  #|T: (\x. x) 1
  #|T: \(x,y). x + y
  #|T: forall(x,y). x = y
  #|T: x,y
  #|T: x,y,z
  #|T: FST (x,y)
  #|T: if p then x else y
  #|T: if p then if q then 1 else 2 else 3
  #|T: if a then 1 else if b then 2 else if c then 3 else if d then 4 else if e then 5 else 6
  #|T: let x = 1 in x + x
  #|T: let x = 1 and y = 2 in x + y
  #|T: let f x = x + 1 in f 2
  #|T: let x = 1 and x = 2 in x
  #|T: [x; y; z]
  #|T: []
  #|T: [1]
  #|T: "hello"
  #|T: "a\nb\t\"c\"\\"
  #|T: "\065\x42"
  #|T: ""
  #|T: {x, y}
  #|T: {}
  #|T: {x | x < 5}
  #|T: {x + y | x < y}
  #|T: {x + y | x | x < y}
  #|T: {(x,y) | x < y}
  #|T: x IN {1, 2, 3}
  #|T: s UNION t
  #|T: (:num)
  #|T: (:A->bool)
  #|T: x:num
  #|T: (x:num) = y
  #|T: (f:num->num) x
  #|T: \x:num. x
  #|T: x + (y:int)
  #|T: (x:int) + y
  #|T: (x:real) + &1
  #|T: &1 + &2
  #|T: --x
  #|T: -- &1
  #|T: --(x:int)
  #|T: (x:real) < y
  #|T: x < y
  #|T: #1.25
  #|T: #3
  #|T: #0.001
  #|T: match x with 0 -> 1 | SUC n -> n
  #|T: match x with | 0 -> T | n -> F
  #|T: match x with n when n < 2 -> 0 | n -> 1
  #|T: function 0 -> 1 | SUC n -> n
  #|T: x + y = y + x <=> T
  #|T: (p <=> q) <=> r
  #|T: f x y z
  #|T: f (g x) (h y z)
  #|T: (+)
  #|T: (+) 1 2
  #|T: (forall)
  #|T: (~)
  #|T: (x)
  #|T: ((x))
  #|T: a // comment here
  #|T: x _y
  #|T: x' + y''
  #|T: _foo
  #|T: a_b_c
  #|T: ++
  #|T: x +
  #|T: (x
  #|T: [x;
  #|T: if p then x
  #|T: if p
  #|T: {x
  #|T: (:
  #|T: (:num
  #|T: match x
  #|T: #x
  #|T: "abc
  #|T: "\q"
  #|T: x = 1 x
  #|T: f :num
  #|T: 1 + T
  #|T: SUC T
  #|T: x < 1 /\ x
  #|T: let x in y
  #|T: \x. 
  #|T: 1abc
  #|T: a $ b
  #|margin 30
  #|T: forall x y z. x + y + z = z + y + x /\ x * y * z = z * y * x
  #|T: if long_condition_name then first_branch_value else second_branch_value
  #|margin 78
  #|T: forall aaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbb. aaaaaaaaaaaaaaa + bbbbbbbbbbbbbbbbbb = bbbbbbbbbbbbbbbbbb + aaaaaaaaaaaaaaa
  #|prioritize int
  #|T: x + y
  #|T: x < y
  #|prioritize num
  #|override + (+):num->num->num
  #|T: x + y
  #|abbrev nn : num#num
  #|Y: nn
  #|Y: nn->bool
  #|T: (x:nn) = y
  #|T: "é"
  #|T: "\195\169"
  #|T: "\xe9!"
  #|T: "\xé"
  #|T: "a\xFF\128"
  #|T: é
  #|T: xé

///|
using @kernel {type Term, type HolType}

///|
fn sty(ty : HolType) -> String {
  match ty {
    Tyvar(s) => "'" + s
    Tyapp(s, Empty) => s
    Tyapp(s, args) => s + "(" + args.map(sty).to_array().join(",") + ")"
  }
}

///|
fn stm(tm : Term) -> String {
  match tm {
    Var(s, ty) => s + ":" + sty(ty)
    Const(s, ty) => "#" + s + ":" + sty(ty)
    Comb(f, x) => "(" + stm(f) + " " + stm(x) + ")"
    Abs(v, b) => "(\\" + stm(v) + ". " + stm(b) + ")"
  }
}

///|
priv struct Log {
  buf : StringBuilder
}

///|
fn Log::out(self : Log, s : String) -> Unit {
  self.buf.write_string(s + "\n")
}

///|
fn Log::attempt(self : Log, name : String, f : () -> String raise) -> Unit {
  let line = try f() catch {
    Failure(msg) => name + " ! " + msg
    @parserutil.Noparse => name + " !! Noparse"
    @lib.MatchFailure(_) => name + " !! Match_failure"
    @num.InvalidArgument(m) => name + " !! Invalid_argument(\"" + m + "\")"
    e => name + " !! " + e.to_string()
  } noraise {
    s => name + " = " + s
  }
  self.out(line)
}

///|
fn split_colon(s : String) -> (String, String) {
  match s.find(":") {
    Some(i) => (s[:i].trim().to_owned(), s[i + 1:].trim().to_owned())
    None => (s, "")
  }
}

///|
fn run(log : Log, line : String) -> Unit raise {
  if line == "" || line.has_prefix("#") {
    return
  }
  if line.has_prefix("Y: ") {
    log.attempt(line, () => {
      let ty = @parser.parse_type(line[3:].to_owned())
      sty(ty) + " | " + @printer.string_of_type(ty)
    })
    return
  }
  if line.has_prefix("T: ") {
    log.attempt(line, () => {
      let tm = @parser.parse_term(line[3:].to_owned())
      stm(tm) + " | " + @printer.string_of_term(tm)
    })
    return
  }
  let words = line
    .split(" ")
    .filter(w => w != "")
    .map(w => w.to_owned())
    .collect()
  let after = (p : String) => line[p.length():].to_owned()
  try {
    match words {
      ["newtype", n, a] => @kernel.new_type(n, @string.parse_int(a).to_int64())
      ["const", ..] => {
        let (n, t) = split_colon(after("const "))
        @kernel.new_constant(n, @parser.parse_type(t))
      }
      ["infix", n, p, a] =>
        @printer.parse_as_infix(n, (@string.parse_int(p).to_int64(), a))
      ["binder", n] => @printer.parse_as_binder(n)
      ["prefix", n] => @printer.parse_as_prefix(n)
      ["overloadable", ..] => {
        let (n, t) = split_colon(after("overloadable "))
        @preterm.make_overloadable(n, @parser.parse_type(t))
      }
      ["overload", s, ..] =>
        @preterm.overload_interface(
          s,
          @parser.parse_term(after("overload " + s + " ")),
        )
      ["override", s, ..] =>
        @preterm.override_interface(
          s,
          @parser.parse_term(after("override " + s + " ")),
        )
      ["abbrev", ..] => {
        let (n, t) = split_colon(after("abbrev "))
        @preterm.new_type_abbrev(n, @parser.parse_type(t))
      }
      ["prioritize", ..] =>
        @preterm.prioritize_overload(@parser.parse_type(after("prioritize ")))
      ["margin", n] => @pp.std_formatter.set_margin(@string.parse_int(n))
      _ => fail("bad command: " + line)
    }
  } catch {
    Failure(s) => log.out(line + " ! " + s)
    e => raise e
  }
}

///|
test "parser and printer match upstream on parse_cases.txt" {
  let log = { buf: StringBuilder(), }
  @lib.report_sink.val = s => log.out(s)
  for line in cases.split("\n") {
    run(log, line.to_owned())
  }
  inspect(
    log.buf.to_string(),
    content=(
      #|Y: num = num | num
      #|Y: A = 'A | A
      #|Y: A->B->C = fun('A,fun('B,'C)) | A->B->C
      #|Y: (A->B)->C = fun(fun('A,'B),'C) | (A->B)->C
      #|Y: A#B#C = prod('A,prod('B,'C)) | A#B#C
      #|Y: (A#B)#C = prod(prod('A,'B),'C) | (A#B)#C
      #|Y: A+B#C->D = fun(sum('A,prod('B,'C)),'D) | A+B#C->D
      #|Y: (num)list = list(num) | (num)list
      #|Y: num list = list(num) | (num)list
      #|Y: (A,B)prod = prod('A,'B) | A#B
      #|Y: A^3 = cart('A,tybit1(1)) | A^3
      #|Y: num^12 = cart(num,tybit0(tybit0(tybit1(1)))) | num^12
      #|Y: (A->B)list = list(fun('A,'B)) | (A->B)list
      #|Y: A-> ! proper use of type operator (->) expected
      #|Y: (A,B) ! Bad type construction
      #|Y: foo bar ! Unparsed input following type
      #|Warning: inventing type variables
      #|T: x = x:'?11 | (x:?11)
      #|T: T = #T:bool | T
      #|T: p /\ q ==> r = ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) p:bool) q:bool)) r:bool) | p /\ q ==> r
      #|T: p ==> q ==> r = ((#==>:fun(bool,fun(bool,bool)) p:bool) ((#==>:fun(bool,fun(bool,bool)) q:bool) r:bool)) | p ==> q ==> r
      #|T: (p ==> q) ==> r = ((#==>:fun(bool,fun(bool,bool)) ((#==>:fun(bool,fun(bool,bool)) p:bool) q:bool)) r:bool) | (p ==> q) ==> r
      #|T: p \/ q /\ r = ((#\/:fun(bool,fun(bool,bool)) p:bool) ((#/\:fun(bool,fun(bool,bool)) q:bool) r:bool)) | p \/ q /\ r
      #|T: ~p = (#~:fun(bool,bool) p:bool) | ~p
      #|T: ~ ~p = (#~:fun(bool,bool) (#~:fun(bool,bool) p:bool)) | ~ ~p
      #|T: ~(p /\ q) = (#~:fun(bool,bool) ((#/\:fun(bool,fun(bool,bool)) p:bool) q:bool)) | ~(p /\ q)
      #|Warning: inventing type variables
      #|T: x = y = ((#=:fun('?43,fun('?43,bool)) x:'?43) y:'?43) | (x:?43) = (y:?43)
      #|T: x + y + z = ((#+:fun(num,fun(num,num)) x:num) ((#+:fun(num,fun(num,num)) y:num) z:num)) | x + y + z
      #|T: (x + y) + z = ((#+:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) x:num) y:num)) z:num) | (x + y) + z
      #|T: x - y - z = ((#-:fun(num,fun(num,num)) ((#-:fun(num,fun(num,num)) x:num) y:num)) z:num) | x - y - z
      #|T: x - (y - z) = ((#-:fun(num,fun(num,num)) x:num) ((#-:fun(num,fun(num,num)) y:num) z:num)) | x - (y - z)
      #|T: x * y + z * w = ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) x:num) y:num)) ((#*:fun(num,fun(num,num)) z:num) w:num)) | x * y + z * w
      #|T: (x + y) * z = ((#*:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) x:num) y:num)) z:num) | (x + y) * z
      #|T: x EXP 2 EXP 3 = ((#EXP:fun(num,fun(num,num)) ((#EXP:fun(num,fun(num,num)) x:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) | x EXP 2 EXP 3
      #|T: SUC (SUC 0) = (#SUC:fun(num,num) (#SUC:fun(num,num) (#NUMERAL:fun(num,num) #_0:num))) | SUC (SUC 0)
      #|T: SUC x + 1 = ((#+:fun(num,fun(num,num)) (#SUC:fun(num,num) x:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) | SUC x + 1
      #|T: 0 = (#NUMERAL:fun(num,num) #_0:num) | 0
      #|T: 12345678901234567890 = (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) | 12345678901234567890
      #|T: 0x1F = (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) | 31
      #|T: 0b101 = (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) | 5
      #|Warning: inventing type variables
      #|T: forall x. x = x = (#forall:fun(fun('?106,bool),bool) (\x:'?106. ((#=:fun('?106,fun('?106,bool)) x:'?106) x:'?106))) | forall (x:?106). (x:?106) = (x:?106)
      #|Warning: inventing type variables
      #|T: forall x y. x = y ==> y = x = (#forall:fun(fun('?123,bool),bool) (\x:'?123. (#forall:fun(fun('?123,bool),bool) (\y:'?123. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun('?123,fun('?123,bool)) x:'?123) y:'?123)) ((#=:fun('?123,fun('?123,bool)) y:'?123) x:'?123)))))) | forall (x:?123) (y:?123). (x:?123) = (y:?123) ==> (y:?123) = (x:?123)
      #|T: ?x. x < 1 = (#?:fun(fun(num,bool),bool) (\x:num. ((#<:fun(num,fun(num,bool)) x:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) | ?x. x < 1
      #|T: ?!x. x = 0 = (#?!:fun(fun(num,bool),bool) (\x:num. ((#=:fun(num,fun(num,bool)) x:num) (#NUMERAL:fun(num,num) #_0:num)))) | ?!x. x = 0
      #|T: @x. x < 5 = (#@:fun(fun(num,bool),num) (\x:num. ((#<:fun(num,fun(num,bool)) x:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) | @x. x < 5
      #|T: \x. x + 1 = (\x:num. ((#+:fun(num,fun(num,num)) x:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) | \x. x + 1
      #|T: \x y. x + y = (\x:num. (\y:num. ((#+:fun(num,fun(num,num)) x:num) y:num))) | \x y. x + y
      #|T: (\x. x) 1 = ((\x:num. x:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) | (\x. x) 1
      #|T: \(x,y). x + y = (#GABS:fun(fun(fun(prod(num,num),num),bool),fun(prod(num,num),num)) (\f:fun(prod(num,num),num). (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. ((#GEQ:fun(num,fun(num,bool)) (f:fun(prod(num,num),num) ((#,:fun(num,fun(num,prod(num,num))) x:num) y:num))) ((#+:fun(num,fun(num,num)) x:num) y:num)))))))) | \(x,y). x + y
      #|Warning: inventing type variables
      #|T: forall(x,y). x = y = (#forall:fun(fun(prod('?185,'?185),bool),bool) (#GABS:fun(fun(fun(prod('?185,'?185),bool),bool),fun(prod('?185,'?185),bool)) (\f:fun(prod('?185,'?185),bool). (#forall:fun(fun('?185,bool),bool) (\x:'?185. (#forall:fun(fun('?185,bool),bool) (\y:'?185. ((#GEQ:fun(bool,fun(bool,bool)) (f:fun(prod('?185,'?185),bool) ((#,:fun('?185,fun('?185,prod('?185,'?185))) x:'?185) y:'?185))) ((#=:fun('?185,fun('?185,bool)) x:'?185) y:'?185))))))))) | forall ((x:?185),(y:?185)). (x:?185) = (y:?185)
      #|Warning: inventing type variables
      #|T: x,y = ((#,:fun('?190,fun('?189,prod('?190,'?189))) x:'?190) y:'?189) | (x:?190),(y:?189)
      #|Warning: inventing type variables
      #|T: x,y,z = ((#,:fun('?195,fun(prod('?199,'?198),prod('?195,prod('?199,'?198)))) x:'?195) ((#,:fun('?199,fun('?198,prod('?199,'?198))) y:'?199) z:'?198)) | (x:?195),(y:?199),(z:?198)
      #|Warning: inventing type variables
      #|T: FST (x,y) = (#FST:fun(prod('?207,'?206),'?207) ((#,:fun('?207,fun('?206,prod('?207,'?206))) x:'?207) y:'?206)) | (FST:?207#?206->?207) ((x:?207),(y:?206))
      #|Warning: inventing type variables
      #|T: if p then x else y = (((#COND:fun(bool,fun('?210,fun('?210,'?210))) p:bool) x:'?210) y:'?210) | if p then (x:?210) else (y:?210)
      #|T: if p then if q then 1 else 2 else 3 = (((#COND:fun(bool,fun(num,fun(num,num))) p:bool) (((#COND:fun(bool,fun(num,fun(num,num))) q:bool) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) | if p then if q then 1 else 2 else 3
      #|T: if a then 1 else if b then 2 else if c then 3 else if d then 4 else if e then 5 else 6 = (((#COND:fun(bool,fun(num,fun(num,num))) a:bool) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (((#COND:fun(bool,fun(num,fun(num,num))) b:bool) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (((#COND:fun(bool,fun(num,fun(num,num))) c:bool) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (((#COND:fun(bool,fun(num,fun(num,num))) d:bool) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (((#COND:fun(bool,fun(num,fun(num,num))) e:bool) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) | if a then 1
      #| else if b then 2
      #| else if c then 3
      #| else if d then 4
      #| else if e then 5
      #| else 6
      #|T: let x = 1 in x + x = ((#LET:fun(fun(num,num),fun(num,num)) (\x:num. (#LET_END:fun(num,num) ((#+:fun(num,fun(num,num)) x:num) x:num)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) | let x = 1 in x + x
      #|T: let x = 1 and y = 2 in x + y = (((#LET:fun(fun(num,fun(num,num)),fun(num,fun(num,num))) (\x:num. (\y:num. (#LET_END:fun(num,num) ((#+:fun(num,fun(num,num)) x:num) y:num))))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) | let x = 1 and y = 2 in x + y
      #|T: let f x = x + 1 in f 2 = ((#LET:fun(fun(num,num),fun(num,num)) (#GABS:fun(fun(fun(num,num),bool),fun(num,num)) (\f':fun(num,num). (#forall:fun(fun(fun(num,num),bool),bool) (\f:fun(num,num). (#forall:fun(fun(num,bool),bool) (\x:num. ((#GEQ:fun(num,fun(num,bool)) (f':fun(num,num) (f:fun(num,num) x:num))) (#LET_END:fun(num,num) (f:fun(num,num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))) ((#+:fun(num,fun(num,num)) x:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) | let f x = x + 1 in f 2
      #|Warning: duplicate names on left of let-binding: latest is used
      #|T: let x = 1 and x = 2 in x = (((#LET:fun(fun(num,fun(num,num)),fun(num,fun(num,num))) (\x:num. (\x:num. (#LET_END:fun(num,num) x:num)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) | let x = 1 and x = 2 in x
      #|Warning: inventing type variables
      #|T: [x; y; z] = ((#CONS:fun('?308,fun(list('?308),list('?308))) x:'?308) ((#CONS:fun('?308,fun(list('?308),list('?308))) y:'?308) ((#CONS:fun('?308,fun(list('?308),list('?308))) z:'?308) #NIL:list('?308)))) | [(x:?308); (y:?308); (z:?308)]
      #|Warning: inventing type variables
      #|T: [] = #NIL:list('?310) | []
      #|T: [1] = ((#CONS:fun(num,fun(list(num),list(num))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) #NIL:list(num)) | [1]
      #|T: "hello" = ((#CONS:fun(char,fun(list(char),list(char))) ((((((((#ASCII:fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,char)))))))) #F:bool) #T:bool) #T:bool) #F:bool) #T:bool) #F:bool) #F:bool) #F:bool)) ((#CONS:fun(char,fun(list(char),list(char))) ((((((((#ASCII:fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,char)))))))) #F:bool) #T:bool) #T:bool) #F:bool) #F:bool) #T:bool) #F:bool) #T:bool)) ((#CONS:fun(char,fun(list(char),list(char))) ((((((((#ASCII:fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,char)))))))) #F:bool) #T:bool) #T:bool) #F:bool) #T:bool) #T:bool) #F:bool) #F:bool)) ((#CONS:fun(char,fun(list(char),list(char))) ((((((((#ASCII:fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,char)))))))) #F:bool) #T:bool) #T:bool) #F:bool) #T:bool) #T:bool) #F:bool) #F:bool)) ((#CONS:fun(char,fun(list(char),list(char))) ((((((((#ASCII:fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,char)))))))) #F:bool) #T:bool) #T:bool) #F:bool) #T:bool) #T:bool) #T:bool) #T:bool)) #NIL:list(char)))))) | "hello"
      #|T: "a\nb\t\"c\"\\" = ((#CONS:fun(char,fun(list(char),list(char))) ((((((((#ASCII:fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,char)))))))) #F:bool) #T:bool) #T:bool) #F:bool) #F:bool) #F:bool) #F:bool) #T:bool)) ((#CONS:fun(char,fun(list(char),list(char))) ((((((((#ASCII:fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,char)))))))) #F:bool) #F:bool) #F:bool) #F:bool) #T:bool) #F:bool) #T:bool) #F:bool)) ((#CONS:fun(char,fun(list(char),list(char))) ((((((((#ASCII:fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,char)))))))) #F:bool) #T:bool) #T:bool) #F:bool) #F:bool) #F:bool) #T:bool) #F:bool)) ((#CONS:fun(char,fun(list(char),list(char))) ((((((((#ASCII:fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,char)))))))) #F:bool) #F:bool) #F:bool) #F:bool) #T:bool) #F:bool) #F:bool) #T:bool)) ((#CONS:fun(char,fun(list(char),list(char))) ((((((((#ASCII:fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,char)))))))) #F:bool) #F:bool) #T:bool) #F:bool) #F:bool) #F:bool) #T:bool) #F:bool)) ((#CONS:fun(char,fun(list(char),list(char))) ((((((((#ASCII:fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,char)))))))) #F:bool) #T:bool) #T:bool) #F:bool) #F:bool) #F:bool) #T:bool) #T:bool)) ((#CONS:fun(char,fun(list(char),list(char))) ((((((((#ASCII:fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,char)))))))) #F:bool) #F:bool) #T:bool) #F:bool) #F:bool) #F:bool) #T:bool) #F:bool)) ((#CONS:fun(char,fun(list(char),list(char))) ((((((((#ASCII:fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,char)))))))) #F:bool) #T:bool) #F:bool) #T:bool) #T:bool) #T:bool) #F:bool) #F:bool)) #NIL:list(char))))))))) | "a\nb\t\"c\"\\"
      #|T: "\065\x42" = ((#CONS:fun(char,fun(list(char),list(char))) ((((((((#ASCII:fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,char)))))))) #F:bool) #T:bool) #F:bool) #F:bool) #F:bool) #F:bool) #F:bool) #T:bool)) ((#CONS:fun(char,fun(list(char),list(char))) ((((((((#ASCII:fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,char)))))))) #F:bool) #T:bool) #F:bool) #F:bool) #F:bool) #F:bool) #T:bool) #F:bool)) #NIL:list(char))) | "AB"
      #|Warning: inventing type variables
      #|T: "" = #NIL:list('?488) | []
      #|Warning: inventing type variables
      #|T: {x, y} = ((#INSERT:fun('?496,fun(fun('?496,bool),fun('?496,bool))) x:'?496) ((#INSERT:fun('?496,fun(fun('?496,bool),fun('?496,bool))) y:'?496) #EMPTY:fun('?496,bool))) | {(x:?496), (y:?496)}
      #|Warning: inventing type variables
      #|T: {} = #EMPTY:fun('?498,bool) | {}
      #|T: {x | x < 5} = (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%0:num. (#?:fun(fun(num,bool),bool) (\x:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%0:num) ((#<:fun(num,fun(num,bool)) x:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) x:num))))) | {x | x < 5}
      #|T: {x + y | x < y} = (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%1:num. (#?:fun(fun(num,bool),bool) (\x:num. (#?:fun(fun(num,bool),bool) (\y:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%1:num) ((#<:fun(num,fun(num,bool)) x:num) y:num)) ((#+:fun(num,fun(num,num)) x:num) y:num)))))))) | {x + y | x < y}
      #|T: {x + y | x | x < y} = (#GSPEC:fun(fun(num,bool),fun(num,bool)) (\GEN%PVAR%2:num. (#?:fun(fun(num,bool),bool) (\x:num. (((#SETSPEC:fun(num,fun(bool,fun(num,bool))) GEN%PVAR%2:num) ((#<:fun(num,fun(num,bool)) x:num) y:num)) ((#+:fun(num,fun(num,num)) x:num) y:num)))))) | {x + y | x | x < y}
      #|T: {(x,y) | x < y} = (#GSPEC:fun(fun(prod(num,num),bool),fun(prod(num,num),bool)) (\GEN%PVAR%3:prod(num,num). (#?:fun(fun(num,bool),bool) (\x:num. (#?:fun(fun(num,bool),bool) (\y:num. (((#SETSPEC:fun(prod(num,num),fun(bool,fun(prod(num,num),bool))) GEN%PVAR%3:prod(num,num)) ((#<:fun(num,fun(num,bool)) x:num) y:num)) ((#,:fun(num,fun(num,prod(num,num))) x:num) y:num)))))))) | {x,y | x < y}
      #|T: x IN {1, 2, 3} = ((#IN:fun(num,fun(fun(num,bool),bool)) x:num) ((#INSERT:fun(num,fun(fun(num,bool),fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) ((#INSERT:fun(num,fun(fun(num,bool),fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#INSERT:fun(num,fun(fun(num,bool),fun(num,bool))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) #EMPTY:fun(num,bool))))) | x IN {1, 2, 3}
      #|Warning: inventing type variables
      #|T: s UNION t = ((#UNION:fun(fun('?598,bool),fun(fun('?598,bool),fun('?598,bool))) s:fun('?598,bool)) t:fun('?598,bool)) | (s:?598->bool) UNION (t:?598->bool)
      #|T: (:num) = #UNIV:fun(num,bool) | (:num)
      #|T: (:A->bool) = #UNIV:fun(fun('A,bool),bool) | (:A->bool)
      #|T: x:num = x:num | x
      #|T: (x:num) = y = ((#=:fun(num,fun(num,bool)) x:num) y:num) | x = y
      #|T: (f:num->num) x = (f:fun(num,num) x:num) | f x
      #|T: \x:num. x = (\x:num. x:num) | \x. x
      #|T: x + (y:int) = ((#int_add:fun(int,fun(int,int)) x:int) y:int) | x + y
      #|T: (x:int) + y = ((#int_add:fun(int,fun(int,int)) x:int) y:int) | x + y
      #|T: (x:real) + &1 = ((#real_add:fun(real,fun(real,real)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) | x + &1
      #|T: &1 + &2 = ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) | &1 + &2
      #|T: --x = (#real_neg:fun(real,real) x:real) | --x
      #|T: -- &1 = (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) | -- &1
      #|T: --(x:int) = (#int_neg:fun(int,int) x:int) | --x
      #|T: (x:real) < y = ((#real_lt:fun(real,fun(real,bool)) x:real) y:real) | x < y
      #|T: x < y = ((#<:fun(num,fun(num,bool)) x:num) y:num) | x < y
      #|T: #1.25 = ((#DECIMAL:fun(num,fun(num,real)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) | #1.25
      #|T: #3 = ((#DECIMAL:fun(num,fun(num,real)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) | #3
      #|T: #0.001 = ((#DECIMAL:fun(num,fun(num,real)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))) | #0.001
      #|T: match x with 0 -> 1 | SUC n -> n = ((#_MATCH:fun(num,fun(fun(num,fun(num,bool)),num)) x:num) ((#_SEQPATTERN:fun(fun(num,fun(num,bool)),fun(fun(num,fun(num,bool)),fun(num,fun(num,bool)))) (\GEN%PVAR%4:num. (\GEN%PVAR%5:num. ((#_UNGUARDED_PATTERN:fun(bool,fun(bool,bool)) ((#GEQ:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) GEN%PVAR%4:num)) ((#GEQ:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) GEN%PVAR%5:num))))) (\GEN%PVAR%6:num. (\GEN%PVAR%7:num. (#?:fun(fun(num,bool),bool) (\n:num. ((#_UNGUARDED_PATTERN:fun(bool,fun(bool,bool)) ((#GEQ:fun(num,fun(num,bool)) (#SUC:fun(num,num) n:num)) GEN%PVAR%6:num)) ((#GEQ:fun(num,fun(num,bool)) n:num) GEN%PVAR%7:num)))))))) | match x with 0 -> 1 | SUC n -> n
      #|T: match x with | 0 -> T | n -> F = ((#_MATCH:fun(num,fun(fun(num,fun(bool,bool)),bool)) x:num) ((#_SEQPATTERN:fun(fun(num,fun(bool,bool)),fun(fun(num,fun(bool,bool)),fun(num,fun(bool,bool)))) (\GEN%PVAR%8:num. (\GEN%PVAR%9:bool. ((#_UNGUARDED_PATTERN:fun(bool,fun(bool,bool)) ((#GEQ:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) GEN%PVAR%8:num)) ((#GEQ:fun(bool,fun(bool,bool)) #T:bool) GEN%PVAR%9:bool))))) (\GEN%PVAR%10:num. (\GEN%PVAR%11:bool. (#?:fun(fun(num,bool),bool) (\n:num. ((#_UNGUARDED_PATTERN:fun(bool,fun(bool,bool)) ((#GEQ:fun(num,fun(num,bool)) n:num) GEN%PVAR%10:num)) ((#GEQ:fun(bool,fun(bool,bool)) #F:bool) GEN%PVAR%11:bool)))))))) | match x with 0 -> T | n -> F
      #|T: match x with n when n < 2 -> 0 | n -> 1 = ((#_MATCH:fun(num,fun(fun(num,fun(num,bool)),num)) x:num) ((#_SEQPATTERN:fun(fun(num,fun(num,bool)),fun(fun(num,fun(num,bool)),fun(num,fun(num,bool)))) (\GEN%PVAR%12:num. (\GEN%PVAR%13:num. (#?:fun(fun(num,bool),bool) (\n:num. (((#_GUARDED_PATTERN:fun(bool,fun(bool,fun(bool,bool))) ((#GEQ:fun(num,fun(num,bool)) n:num) GEN%PVAR%12:num)) ((#<:fun(num,fun(num,bool)) n:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#GEQ:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) GEN%PVAR%13:num))))))) (\GEN%PVAR%14:num. (\GEN%PVAR%15:num. (#?:fun(fun(num,bool),bool) (\n:num. ((#_UNGUARDED_PATTERN:fun(bool,fun(bool,bool)) ((#GEQ:fun(num,fun(num,bool)) n:num) GEN%PVAR%14:num)) ((#GEQ:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) GEN%PVAR%15:num)))))))) | match x with n when n < 2 -> 0 | n -> 1
      #|T: function 0 -> 1 | SUC n -> n = (#_FUNCTION:fun(fun(num,fun(num,bool)),fun(num,num)) ((#_SEQPATTERN:fun(fun(num,fun(num,bool)),fun(fun(num,fun(num,bool)),fun(num,fun(num,bool)))) (\GEN%PVAR%16:num. (\GEN%PVAR%17:num. ((#_UNGUARDED_PATTERN:fun(bool,fun(bool,bool)) ((#GEQ:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) GEN%PVAR%16:num)) ((#GEQ:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) GEN%PVAR%17:num))))) (\GEN%PVAR%18:num. (\GEN%PVAR%19:num. (#?:fun(fun(num,bool),bool) (\n:num. ((#_UNGUARDED_PATTERN:fun(bool,fun(bool,bool)) ((#GEQ:fun(num,fun(num,bool)) (#SUC:fun(num,num) n:num)) GEN%PVAR%18:num)) ((#GEQ:fun(num,fun(num,bool)) n:num) GEN%PVAR%19:num)))))))) | function 0 -> 1 | SUC n -> n
      #|T: x + y = y + x <=> T = ((#=:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) x:num) y:num)) ((#+:fun(num,fun(num,num)) y:num) x:num))) #T:bool) | x + y = y + x <=> T
      #|T: (p <=> q) <=> r = ((#=:fun(bool,fun(bool,bool)) ((#=:fun(bool,fun(bool,bool)) p:bool) q:bool)) r:bool) | (p <=> q) <=> r
      #|Warning: inventing type variables
      #|T: f x y z = (((f:fun('?840,fun('?839,fun('?838,'?837))) x:'?840) y:'?839) z:'?838) | (f:?840->?839->?838->?837) (x:?840) (y:?839) (z:?838)
      #|Warning: inventing type variables
      #|T: f (g x) (h y z) = ((f:fun('?843,fun('?842,'?841)) (g:fun('?844,'?843) x:'?844)) ((h:fun('?846,fun('?845,'?842)) y:'?846) z:'?845)) | (f:?843->?842->?841) ((g:?844->?843) (x:?844))
      #|((h:?846->?845->?842) (y:?846) (z:?845))
      #|T: (+) = #+:fun(num,fun(num,num)) | (+)
      #|T: (+) 1 2 = ((#+:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) | 1 + 2
      #|Warning: inventing type variables
      #|T: (forall) = #forall:fun(fun('?854,bool),bool) | ((forall):(?854->bool)->bool)
      #|T: (~) = #~:fun(bool,bool) | (~)
      #|Warning: inventing type variables
      #|T: (x) = x:'?856 | (x:?856)
      #|Warning: inventing type variables
      #|T: ((x)) = x:'?857 | (x:?857)
      #|Warning: inventing type variables
      #|T: a // comment here = a:'?858 | (a:?858)
      #|Warning: inventing type variables
      #|T: x _y = (x:fun('?860,'?859) _y:'?860) | (x:?860->?859) (_y:?860)
      #|T: x' + y'' = ((#+:fun(num,fun(num,num)) x':num) y'':num) | x' + y''
      #|Warning: inventing type variables
      #|T: _foo = _foo:'?865 | (_foo:?865)
      #|Warning: inventing type variables
      #|T: a_b_c = a_b_c:'?866 | (a_b_c:?866)
      #|Warning: inventing type variables
      #|T: ++ = ++:'?867 | (++ :?867)
      #|T: x + ! term after binary operator expected
      #|T: (x !! Noparse
      #|T: [x; ! semicolon separated list of terms expected
      #|T: if p then x ! missing else following then clause
      #|T: if p ! missing 'then' reserved word in if-then-else statement
      #|T: {x ! malformed set {}
      #|T: (: ! type in universe construction expected
      #|T: (:num ! closing right parenthesis on universe expected
      #|T: match x ! malformed match-with statement
      #|T: #x = ((#DECIMAL:fun(num,fun(num,real)) x:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))) | DECIMAL x 1
      #|T: "abc ! Unparsed input
      #|T: "\q" ! lex:unrecognized OCaml-style escape in string
      #|T: x = 1 x ! typechecking error (initial type assignment): 1 cannot have type num and _->_ simultaneously
      #|T: f :num = f:num | f
      #|T: 1 + T ! typechecking error (initial type assignment): T has type bool, it cannot be used with type num
      #|T: SUC T ! typechecking error (initial type assignment): T has type bool, it cannot be used with type num
      #|T: x < 1 /\ x ! typechecking error (initial type assignment): x cannot have type num and bool simultaneously
      #|T: let x in y !! Match_failure
      #|T: \x.  !! Noparse
      #|Warning: Non-numeral begins with a digit
      #|Warning: inventing type variables
      #|T: 1abc = 1abc:'?889 | (1abc:?889)
      #|Warning: inventing type variables
      #|T: a $ b = ((a:fun('?892,fun('?891,'?890)) $:'?892) b:'?891) | (a:?892->?891->?890) ($ :?892) (b:?891)
      #|T: forall x y z. x + y + z = z + y + x /\ x * y * z = z * y * x = (#forall:fun(fun(num,bool),bool) (\x:num. (#forall:fun(fun(num,bool),bool) (\y:num. (#forall:fun(fun(num,bool),bool) (\z:num. ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) x:num) ((#+:fun(num,fun(num,num)) y:num) z:num))) ((#+:fun(num,fun(num,num)) z:num) ((#+:fun(num,fun(num,num)) y:num) x:num)))) ((#=:fun(num,fun(num,bool)) ((#*:fun(num,fun(num,num)) x:num) ((#*:fun(num,fun(num,num)) y:num) z:num))) ((#*:fun(num,fun(num,num)) z:num) ((#*:fun(num,fun(num,num)) y:num) x:num)))))))))) | forall x y z.
      #|    x + y + z = z + y + x /\
      #|    x * y * z = z * y * x
      #|Warning: inventing type variables
      #|T: if long_condition_name then first_branch_value else second_branch_value = (((#COND:fun(bool,fun('?934,fun('?934,'?934))) long_condition_name:bool) first_branch_value:'?934) second_branch_value:'?934) | if long_condition_name
      #| then (first_branch_value:?934)
      #| else (second_branch_value:?934)
      #|T: forall aaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbb. aaaaaaaaaaaaaaa + bbbbbbbbbbbbbbbbbb = bbbbbbbbbbbbbbbbbb + aaaaaaaaaaaaaaa = (#forall:fun(fun(num,bool),bool) (\aaaaaaaaaaaaaaa:num. (#forall:fun(fun(num,bool),bool) (\bbbbbbbbbbbbbbbbbb:num. ((#=:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) aaaaaaaaaaaaaaa:num) bbbbbbbbbbbbbbbbbb:num)) ((#+:fun(num,fun(num,num)) bbbbbbbbbbbbbbbbbb:num) aaaaaaaaaaaaaaa:num)))))) | forall aaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbb.
      #|    aaaaaaaaaaaaaaa + bbbbbbbbbbbbbbbbbb =
      #|    bbbbbbbbbbbbbbbbbb + aaaaaaaaaaaaaaa
      #|T: x + y = ((#int_add:fun(int,fun(int,int)) x:int) y:int) | x + y
      #|T: x < y = ((#<:fun(num,fun(num,bool)) x:num) y:num) | x < y
      #|T: x + y = ((#+:fun(num,fun(num,num)) x:num) y:num) | x + y
      #|Y: nn = prod(num,num) | num#num
      #|Y: nn->bool = fun(prod(num,num),bool) | num#num->bool
      #|T: (x:nn) = y = ((#=:fun(prod(num,num),fun(prod(num,num),bool)) x:prod(num,num)) y:prod(num,num)) | x = y
      #|T: "é" = ((#CONS:fun(char,fun(list(char),list(char))) ((((((((#ASCII:fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,char)))))))) #T:bool) #T:bool) #F:bool) #F:bool) #F:bool) #F:bool) #T:bool) #T:bool)) ((#CONS:fun(char,fun(list(char),list(char))) ((((((((#ASCII:fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,char)))))))) #T:bool) #F:bool) #T:bool) #F:bool) #T:bool) #F:bool) #F:bool) #T:bool)) #NIL:list(char))) | "\195\169"
      #|T: "\195\169" = ((#CONS:fun(char,fun(list(char),list(char))) ((((((((#ASCII:fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,char)))))))) #T:bool) #T:bool) #F:bool) #F:bool) #F:bool) #F:bool) #T:bool) #T:bool)) ((#CONS:fun(char,fun(list(char),list(char))) ((((((((#ASCII:fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,char)))))))) #T:bool) #F:bool) #T:bool) #F:bool) #T:bool) #F:bool) #F:bool) #T:bool)) #NIL:list(char))) | "\195\169"
      #|T: "\xe9!" = ((#CONS:fun(char,fun(list(char),list(char))) ((((((((#ASCII:fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,char)))))))) #T:bool) #T:bool) #T:bool) #F:bool) #T:bool) #F:bool) #F:bool) #T:bool)) ((#CONS:fun(char,fun(list(char),list(char))) ((((((((#ASCII:fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,char)))))))) #F:bool) #F:bool) #T:bool) #F:bool) #F:bool) #F:bool) #F:bool) #T:bool)) #NIL:list(char))) | "\233!"
      #|T: "\xé" ! int_of_string
      #|T: "a\xFF\128" = ((#CONS:fun(char,fun(list(char),list(char))) ((((((((#ASCII:fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,char)))))))) #F:bool) #T:bool) #T:bool) #F:bool) #F:bool) #F:bool) #F:bool) #T:bool)) ((#CONS:fun(char,fun(list(char),list(char))) ((((((((#ASCII:fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,char)))))))) #T:bool) #T:bool) #T:bool) #T:bool) #T:bool) #T:bool) #T:bool) #T:bool)) ((#CONS:fun(char,fun(list(char),list(char))) ((((((((#ASCII:fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,fun(bool,char)))))))) #T:bool) #F:bool) #F:bool) #F:bool) #F:bool) #F:bool) #F:bool) #F:bool)) #NIL:list(char)))) | "a\255\128"
      #|T: é ! Unparsed input
      #|T: xé ! Unparsed input
      #|
    ),
  )
}
