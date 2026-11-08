// Translated from upstream Examples/rectypes.ml; edit this file directly.

///|
/// Examples/rectypes.ml:5
fn step_1() -> Unit raise {
  ignore(@lib.time(@ind_types.define_type, "enum `Term` { Var(A, B); App(Bool, `Termlist`) } enum `Termlist` { Empty; Consp(`Term`, `Termlist`) }"))
}

///|
/// Examples/rectypes.ml:8
fn step_2() -> Unit raise {
  ignore(@lib.time(@ind_types.define_type, "enum `List` { Nil; Cons(A, `List`) }"))
}

///|
/// Examples/rectypes.ml:10
fn step_3() -> Unit raise {
  ignore(@lib.time(@ind_types.define_type, "enum `Btree` { Leaf(A); Node(B, `Btree`, `Btree`) }"))
}

///|
/// Examples/rectypes.ml:12
fn step_4() -> Unit raise {
  ignore(@lib.time(@ind_types.define_type, "enum `Command` { Assign(Ind, `Expression`); If(`Expression`, `Command`); Ite(`Expression`, `Command`, `Command`); While(`Expression`, `Command`); Do(`Command`, `Expression`) } enum `Expression` { Constant(Num); Variable(Ind); Summ(`Expression`, `Expression`); Product(`Expression`, `Expression`) }"))
}

///|
/// Examples/rectypes.ml:22
fn step_5() -> Unit raise {
  ignore(@lib.time(@ind_types.define_type, "enum Testa { empty_testa; cons_testa(Testa, Testb) } enum Testb { contentb(L, Testc) } enum Testc { connection(M, Testa) }"))
}

///|
/// Examples/rectypes.ml:26
fn step_6() -> Unit raise {
  ignore(@lib.time(@ind_types.define_type, "enum Atexp { Varb(Ind); Let(Dec, Exp) } enum Exp { Exp1(Atexp); Exp2(Exp, Atexp); Exp3(Matching) } enum Matching { Match1(Rule); Matches(Rule, Matching) } enum Rule { Rule(Pat, Exp) } enum Dec { Val(Valbind); Local(Dec, Dec); Decs(Dec, Dec) } enum Valbind { Single(Pat, Exp); Multi(Pat, Exp, Valbind); Rec(Valbind) } enum Pat { Wild; Varpat(Ind) }"))
}

///|
/// Examples/rectypes.ml:34
fn step_7() -> Unit raise {
  ignore(@lib.time(@ind_types.define_type, "enum Tri { ONE; TWO; THREE }"))
}

///|
/// Examples/rectypes.ml:40
fn step_8() -> Unit raise {
  ignore(@lib.time(@ind_types.define_type, "enum `T` { X1; X2; X3; X4; X5; X6; X7; X8; X9; X10; X11; X12; X13; X14; X15; X16; X17; X18; X19; X20; X21; X22; X23; X24; X25; X26; X27; X28; X29; X30; X31; X32; X33; X34 }"))
}

///|
/// Examples/rectypes.ml:45
fn step_9() -> Unit raise {
  ignore(@lib.time(@ind_types.define_type, "enum `TY1` { NoF__; Fk__(A, `TY2`) } enum `TY2` { Ta__(Bool); Td__(Bool); Tf__(`TY1`); Tk__(Bool); Tp__(Bool); App__(A, `TY1`, `TY2`, `TY3`); Pair__(`TY2`, `TY2`) } enum `TY3` { NoS__; Fresh__(`TY2`); Trustworthy__(A); PrivateKey__(A, B, C); PublicKey__(A, B, C); Conveyed__(A, `TY2`); Possesses__(A, `TY2`); Received__(A, `TY2`); Recognizes__(A, `TY2`); NeverMalFromSelf__(A, B, `TY2`); Sends__(A, `TY2`, B); SharedSecret__(A, `TY2`, B); Believes__(A, `TY3`); And__(`TY3`, `TY3`) }"))
}

///|
let term_induction_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("term_INDUCTION")

///|
/// `term_INDUCTION`
pub fn term_induction() -> @kernel.Thm {
  term_induction_c.get()
}

///|
let term_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("term_RECURSION")

///|
/// `term_RECURSION`
pub fn term_recursion() -> @kernel.Thm {
  term_recursion_c.get()
}

///|
/// term_INDUCTION, term_RECURSION
fn step_10() -> Unit raise {
  let (term_induction, term_recursion) = @lib.time(@ind_types.define_type, "enum `term` { Vari(Int); Fni(Int, List[`term`]) }")
  term_induction_c.set(term_induction)
  term_recursion_c.set(term_recursion)
}

///|
let bintree_induction_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("bintree_INDUCTION")

///|
/// `bintree_INDUCTION`
pub fn bintree_induction() -> @kernel.Thm {
  bintree_induction_c.get()
}

///|
let bintree_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("bintree_RECURSION")

///|
/// `bintree_RECURSION`
pub fn bintree_recursion() -> @kernel.Thm {
  bintree_recursion_c.get()
}

///|
/// bintree_INDUCTION, bintree_RECURSION
fn step_11() -> Unit raise {
  let (bintree_induction, bintree_recursion) = @lib.time(@ind_types.define_type, "enum Bintree { Leafb; Branchb((Bintree, Bintree)) }")
  bintree_induction_c.set(bintree_induction)
  bintree_recursion_c.set(bintree_recursion)
}

///|
let etree_induction_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("etree_INDUCTION")

///|
/// `etree_INDUCTION`
pub fn etree_induction() -> @kernel.Thm {
  etree_induction_c.get()
}

///|
let etree_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("etree_RECURSION")

///|
/// `etree_RECURSION`
pub fn etree_recursion() -> @kernel.Thm {
  etree_recursion_c.get()
}

///|
/// etree_INDUCTION, etree_RECURSION
fn step_12() -> Unit raise {
  let (etree_induction, etree_recursion) = @lib.time(@ind_types.define_type, "enum Etree { Terminal; Nonterminal(Sum[Num, Etree]) }")
  etree_induction_c.set(etree_induction)
  etree_recursion_c.set(etree_recursion)
}

///|
let ptree_induction_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ptree_INDUCTION")

///|
/// `ptree_INDUCTION`
pub fn ptree_induction() -> @kernel.Thm {
  ptree_induction_c.get()
}

///|
let ptree_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ptree_RECURSION")

///|
/// `ptree_RECURSION`
pub fn ptree_recursion() -> @kernel.Thm {
  ptree_recursion_c.get()
}

///|
/// ptree_INDUCTION, ptree_RECURSION
fn step_13() -> Unit raise {
  let (ptree_induction, ptree_recursion) = @lib.time(@ind_types.define_type, "enum Ptree { Only(Option[Ptree]) }")
  ptree_induction_c.set(ptree_induction)
  ptree_recursion_c.set(ptree_recursion)
}

///|
let mut_induction_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("mut_INDUCTION")

///|
/// `mut_INDUCTION`
pub fn mut_induction() -> @kernel.Thm {
  mut_induction_c.get()
}

///|
let mut_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("mut_RECURSION")

///|
/// `mut_RECURSION`
pub fn mut_recursion() -> @kernel.Thm {
  mut_recursion_c.get()
}

///|
/// mut_INDUCTION, mut_RECURSION
fn step_14() -> Unit raise {
  let (mut_induction, mut_recursion) = @lib.time(@ind_types.define_type, "enum Mutual { Mutual(A, Mutual, D, Otherone); Friend(D, Otherone) } enum Otherone { Great(C); Expectations(Mutual, Otherone) }")
  mut_induction_c.set(mut_induction)
  mut_recursion_c.set(mut_recursion)
}

///|
let groof_induction_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("groof_INDUCTION")

///|
/// `groof_INDUCTION`
pub fn groof_induction() -> @kernel.Thm {
  groof_induction_c.get()
}

///|
let groof_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("groof_RECURSION")

///|
/// `groof_RECURSION`
pub fn groof_recursion() -> @kernel.Thm {
  groof_recursion_c.get()
}

///|
/// groof_INDUCTION, groof_RECURSION
fn step_15() -> Unit raise {
  let (groof_induction, groof_recursion) = @lib.time(@ind_types.define_type, "enum Groof { Wu(Bool); Wibble(Mutual[A, Groof, L]); Wobble(Groof, Groof) }")
  groof_induction_c.set(groof_induction)
  groof_recursion_c.set(groof_recursion)
}

///|
let biterm_induction_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("biterm_INDUCTION")

///|
/// `biterm_INDUCTION`
pub fn biterm_induction() -> @kernel.Thm {
  biterm_induction_c.get()
}

///|
let biterm_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("biterm_RECURSION")

///|
/// `biterm_RECURSION`
pub fn biterm_recursion() -> @kernel.Thm {
  biterm_recursion_c.get()
}

///|
/// biterm_INDUCTION, biterm_RECURSION
fn step_16() -> Unit raise {
  let (biterm_induction, biterm_recursion) = @lib.time(@ind_types.define_type, "enum Biterm { Variab(Int); Fnapp(Sum[List[Biterm], List[Biterm]]) }")
  biterm_induction_c.set(biterm_induction)
  biterm_recursion_c.set(biterm_recursion)
}

///|
let triterm_induction_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("triterm_INDUCTION")

///|
/// `triterm_INDUCTION`
pub fn triterm_induction() -> @kernel.Thm {
  triterm_induction_c.get()
}

///|
let triterm_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("triterm_RECURSION")

///|
/// `triterm_RECURSION`
pub fn triterm_recursion() -> @kernel.Thm {
  triterm_recursion_c.get()
}

///|
/// triterm_INDUCTION, triterm_RECURSION
fn step_17() -> Unit raise {
  let (triterm_induction, triterm_recursion) = @lib.time(@ind_types.define_type, "enum Triterm { Var0(Int); Fun2(Sum[List[Triterm], List[Triterm]]); Fun1(List[Triterm]) }")
  triterm_induction_c.set(triterm_induction)
  triterm_recursion_c.set(triterm_recursion)
}

///|
let xtree_induction_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("xtree_INDUCTION")

///|
/// `xtree_INDUCTION`
pub fn xtree_induction() -> @kernel.Thm {
  xtree_induction_c.get()
}

///|
let xtree_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("xtree_RECURSION")

///|
/// `xtree_RECURSION`
pub fn xtree_recursion() -> @kernel.Thm {
  xtree_recursion_c.get()
}

///|
/// xtree_INDUCTION, xtree_RECURSION
fn step_18() -> Unit raise {
  let (xtree_induction, xtree_recursion) = @lib.time(@ind_types.define_type, "enum Xtree { Leafx(A); Branchx(List[Xtree]) }")
  xtree_induction_c.set(xtree_induction)
  xtree_recursion_c.set(xtree_recursion)
}

///|
let simper_induction_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("simper_INDUCTION")

///|
/// `simper_INDUCTION`
pub fn simper_induction() -> @kernel.Thm {
  simper_induction_c.get()
}

///|
let simper_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("simper_RECURSION")

///|
/// `simper_RECURSION`
pub fn simper_recursion() -> @kernel.Thm {
  simper_recursion_c.get()
}

///|
/// simper_INDUCTION, simper_RECURSION
fn step_19() -> Unit raise {
  let (simper_induction, simper_recursion) = @lib.time(@ind_types.define_type, "enum Simper { Leaves(A, B); Bough(Xtree[Simper]) }")
  simper_induction_c.set(simper_induction)
  simper_recursion_c.set(simper_recursion)
}

///|
let array_induction_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("array_INDUCTION")

///|
/// `array_INDUCTION`
pub fn array_induction() -> @kernel.Thm {
  array_induction_c.get()
}

///|
let array_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("array_RECURSION")

///|
/// `array_RECURSION`
pub fn array_recursion() -> @kernel.Thm {
  array_recursion_c.get()
}

///|
/// array_INDUCTION, array_RECURSION
fn step_20() -> Unit raise {
  let (array_induction, array_recursion) = @lib.time(@ind_types.define_type, "enum Array { Array(Num, List[A]) }")
  array_induction_c.set(array_induction)
  array_recursion_c.set(array_recursion)
}

///|
let value_induction_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("value_INDUCTION")

///|
/// `value_INDUCTION`
pub fn value_induction() -> @kernel.Thm {
  value_induction_c.get()
}

///|
let value_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("value_RECURSION")

///|
/// `value_RECURSION`
pub fn value_recursion() -> @kernel.Thm {
  value_recursion_c.get()
}

///|
/// value_INDUCTION, value_RECURSION
fn step_21() -> Unit raise {
  let (value_induction, value_recursion) = @lib.time(@ind_types.define_type, "enum Value { Integer(Num); Boolean(Bool); List_of(List[Value]); Tree_of(Xtree[Value]); Array_of(Array[Value]) }")
  value_induction_c.set(value_induction)
  value_recursion_c.set(value_recursion)
}

///|
let example_induction_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("example_INDUCTION")

///|
/// `example_INDUCTION`
pub fn example_induction() -> @kernel.Thm {
  example_induction_c.get()
}

///|
let example_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("example_RECURSION")

///|
/// `example_RECURSION`
pub fn example_recursion() -> @kernel.Thm {
  example_recursion_c.get()
}

///|
/// example_INDUCTION, example_RECURSION
fn step_22() -> Unit raise {
  let (example_induction, example_recursion) = @lib.time(@ind_types.define_type, "enum `command` { Assignment((List[Num], List[`expression`])); Sequence(List[`command`]) } enum `expression` { Numeral(Num); Plus((`expression`, `expression`)); Valof(`command`) }")
  example_induction_c.set(example_induction)
  example_recursion_c.set(example_recursion)
}

///|
let zonk_induction_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("zonk_INDUCTION")

///|
/// `zonk_INDUCTION`
pub fn zonk_induction() -> @kernel.Thm {
  zonk_induction_c.get()
}

///|
let zonk_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("zonk_RECURSION")

///|
/// `zonk_RECURSION`
pub fn zonk_recursion() -> @kernel.Thm {
  zonk_recursion_c.get()
}

///|
/// zonk_INDUCTION, zonk_RECURSION
fn step_23() -> Unit raise {
  let (zonk_induction, zonk_recursion) = @lib.time(@ind_types.define_type, "enum Zonk { Stonk((List[Mutual[Zonk, Pink, A]], Expression)); Tonk(Zonk, List[Pink]); Honk(Num) } enum Pink { Floyd((Zonk, Pink)); Purple(Num); Rain((A, Pink)) }")
  zonk_induction_c.set(zonk_induction)
  zonk_recursion_c.set(zonk_recursion)
}

///|
/// Examples/rectypes.ml:126
fn step_24() -> Unit raise {
  ignore(@lib.time(@ind_types.define_type, "enum `Size` { Byte; Word; Long }"))
}

///|
/// Examples/rectypes.ml:128
fn step_25() -> Unit raise {
  ignore(@lib.time(@ind_types.define_type, "enum `DataRegister` { RegD0; RegD1; RegD2; RegD3; RegD4; RegD5; RegD6; RegD7 }"))
}

///|
/// Examples/rectypes.ml:138
fn step_26() -> Unit raise {
  ignore(@lib.time(@ind_types.define_type, "enum `AddressRegister` { RegA0; RegA1; RegA2; RegA3; RegA4; RegA5; RegA6; RegA7 }"))
}

///|
/// Examples/rectypes.ml:148
fn step_27() -> Unit raise {
  ignore(@lib.time(@ind_types.define_type, "enum `DataOrAddressRegister` { data(DataRegister); address(AddressRegister) }"))
}

///|
/// Examples/rectypes.ml:152
fn step_28() -> Unit raise {
  ignore(@lib.time(@ind_types.define_type, "enum `Condition` { Hi; Ls; Cc; Cs; Ne; Eq; Vc; Vs; Pl; Mi; Ge; Lt; Gt; Le }"))
}

///|
/// Examples/rectypes.ml:168
fn step_29() -> Unit raise {
  ignore(@lib.time(@ind_types.define_type, "enum `AddressingMode` { immediate(Num); direct(DataOrAddressRegister); indirect(AddressRegister); postinc(AddressRegister); predec(AddressRegister); indirectdisp(Num, AddressRegister); indirectindex(Num, AddressRegister, DataOrAddressRegister, Size); absolute(Num); pcdisp(Num); pcindex(Num, DataOrAddressRegister, Size) }"))
}

///|
/// Examples/rectypes.ml:180
fn step_30() -> Unit raise {
  ignore(@lib.time(@ind_types.define_type, "enum `M68kInstruction` { ABCD(AddressingMode, AddressingMode); ADD(Size, AddressingMode, AddressingMode); ADDA(Size, AddressingMode, AddressRegister); ADDI(Size, Num, AddressingMode); ADDQ(Size, Num, AddressingMode); ADDX(Size, AddressingMode, AddressingMode); AND(Size, AddressingMode, AddressingMode); ANDI(Size, Num, AddressingMode); ANDItoCCR(Num); ANDItoSR(Num); ASL(Size, AddressingMode, DataRegister); ASLW(AddressingMode); ASR(Size, AddressingMode, DataRegister); ASRW(AddressingMode); Bcc(Condition, Size, Num); BTST(Size, AddressingMode, AddressingMode); BCHG(Size, AddressingMode, AddressingMode); BCLR(Size, AddressingMode, AddressingMode); BSET(Size, AddressingMode, AddressingMode); BRA(Size, Num); BSR(Size, Num); CHK(AddressingMode, DataRegister); CLR(Size, AddressingMode); CMP(Size, AddressingMode, DataRegister); CMPA(Size, AddressingMode, AddressRegister); CMPI(Size, Num, AddressingMode); CMPM(Size, AddressRegister, AddressRegister); DBT(DataRegister, Num); DBF(DataRegister, Num); DBcc(Condition, DataRegister, Num); DIVS(AddressingMode, DataRegister); DIVU(AddressingMode, DataRegister); EOR(Size, DataRegister, AddressingMode); EORI(Size, Num, AddressingMode); EORItoCCR(Num); EORItoSR(Num); EXG(DataOrAddressRegister, DataOrAddressRegister); EXT(Size, DataRegister); ILLEGAL; JMP(AddressingMode); JSR(AddressingMode); LEA(AddressingMode, AddressRegister); LINK(AddressRegister, Num); LSL(Size, AddressingMode, DataRegister); LSLW(AddressingMode); LSR(Size, AddressingMode, DataRegister); LSRW(AddressingMode); MOVE(Size, AddressingMode, AddressingMode); MOVEtoCCR(AddressingMode); MOVEtoSR(AddressingMode); MOVEfromSR(AddressingMode); MOVEtoUSP(AddressingMode); MOVEfromUSP(AddressingMode); MOVEA(Size, AddressingMode, AddressRegister); MOVEMto(Size, AddressingMode, List[DataOrAddressRegister]); MOVEMfrom(Size, List[DataOrAddressRegister], AddressingMode); MOVEP(Size, AddressingMode, AddressingMode); MOVEQ(Num, DataRegister); MULS(AddressingMode, DataRegister); MULU(AddressingMode, DataRegister); NBCD(AddressingMode); NEG(Size, AddressingMode); NEGX(Size, AddressingMode); NOP; NOT(Size, AddressingMode); OR(Size, AddressingMode, AddressingMode); ORI(Size, Num, AddressingMode); ORItoCCR(Num); ORItoSR(Num); PEA(AddressingMode); RESET; ROL(Size, AddressingMode, DataRegister); ROLW(AddressingMode); ROR(Size, AddressingMode, DataRegister); RORW(AddressingMode); ROXL(Size, AddressingMode, DataRegister); ROXLW(AddressingMode); ROXR(Size, AddressingMode, DataRegister); ROXRW(AddressingMode); RTE; RTR; RTS; SBCD(AddressingMode, AddressingMode); ST(AddressingMode); SF(AddressingMode); Scc(Condition, AddressingMode); STOP(Num); SUB(Size, AddressingMode, AddressingMode); SUBA(Size, AddressingMode, AddressingMode); SUBI(Size, Num, AddressingMode); SUBQ(Size, Num, AddressingMode); SUBX(Size, AddressingMode, AddressingMode); SWAP(DataRegister); TAS(AddressingMode); TRAP(Num); TRAPV; TST(Size, AddressingMode); UNLK(AddressRegister) }"))
}

///|
let string_induction_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("string_INDUCTION")

///|
/// `string_INDUCTION`
pub fn string_induction() -> @kernel.Thm {
  string_induction_c.get()
}

///|
let string_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("string_RECURSION")

///|
/// `string_RECURSION`
pub fn string_recursion() -> @kernel.Thm {
  string_recursion_c.get()
}

///|
/// string_INDUCTION, string_RECURSION
fn step_31() -> Unit raise {
  let (string_induction, string_recursion) = @lib.time(@ind_types.define_type, "enum String { EMPTY_STRING; CONS_STRING(Num, String) }")
  string_induction_c.set(string_induction)
  string_recursion_c.set(string_recursion)
}

///|
let strid_induction_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("strid_INDUCTION")

///|
/// `strid_INDUCTION`
pub fn strid_induction() -> @kernel.Thm {
  strid_induction_c.get()
}

///|
let strid_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("strid_RECURSION")

///|
/// `strid_RECURSION`
pub fn strid_recursion() -> @kernel.Thm {
  strid_recursion_c.get()
}

///|
/// strid_INDUCTION, strid_RECURSION
fn step_32() -> Unit raise {
  let (strid_induction, strid_recursion) = @lib.time(@ind_types.define_type, "enum Strid { STRID(String) } enum Var { VAR(String) } enum Con { CON(String) } enum Scon { SCINT(Int); SCSTR(String) } enum Excon { EXCON(String) } enum Label { LABEL(String) }")
  strid_induction_c.set(strid_induction)
  strid_recursion_c.set(strid_recursion)
}

///|
let nonemptylist_induction_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("nonemptylist_INDUCTION")

///|
/// `nonemptylist_INDUCTION`
pub fn nonemptylist_induction() -> @kernel.Thm {
  nonemptylist_induction_c.get()
}

///|
let nonemptylist_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("nonemptylist_RECURSION")

///|
/// `nonemptylist_RECURSION`
pub fn nonemptylist_recursion() -> @kernel.Thm {
  nonemptylist_recursion_c.get()
}

///|
/// nonemptylist_INDUCTION, nonemptylist_RECURSION
fn step_33() -> Unit raise {
  let (nonemptylist_induction, nonemptylist_recursion) = @lib.time(@ind_types.define_type, "enum Nonemptylist { Head_and_tail(A, List[A]) }")
  nonemptylist_induction_c.set(nonemptylist_induction)
  nonemptylist_recursion_c.set(nonemptylist_recursion)
}

///|
let long_induction_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("long_INDUCTION")

///|
/// `long_INDUCTION`
pub fn long_induction() -> @kernel.Thm {
  long_induction_c.get()
}

///|
let long_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("long_RECURSION")

///|
/// `long_RECURSION`
pub fn long_recursion() -> @kernel.Thm {
  long_recursion_c.get()
}

///|
/// long_INDUCTION, long_RECURSION
fn step_34() -> Unit raise {
  let (long_induction, long_recursion) = @lib.time(@ind_types.define_type, "enum Long { BASE(A); QUALIFIED(Strid, Long) }")
  long_induction_c.set(long_induction)
  long_recursion_c.set(long_recursion)
}

///|
let myra_induction_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("myra_INDUCTION")

///|
/// `myra_INDUCTION`
pub fn myra_induction() -> @kernel.Thm {
  myra_induction_c.get()
}

///|
let myra_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("myra_RECURSION")

///|
/// `myra_RECURSION`
pub fn myra_recursion() -> @kernel.Thm {
  myra_recursion_c.get()
}

///|
/// myra_INDUCTION, myra_RECURSION
fn step_35() -> Unit raise {
  let (myra_induction, myra_recursion) = @lib.time(@ind_types.define_type, "enum Atpat_e { WILDCARDatpat_e; SCONatpat_e(Scon); VARatpat_e(Var); CONatpat_e(Long[Con]); EXCONatpat_e(Long[Excon]); RECORDatpat_e(Option[Patrow_e]); PARatpat_e(Pat_e) } enum Patrow_e { DOTDOTDOT_e; PATROW_e(Label, Pat_e, Option[Patrow_e]) } enum Pat_e { ATPATpat_e(Atpat_e); CONpat_e(Long[Con], Atpat_e); EXCONpat_e(Long[Excon], Atpat_e); LAYEREDpat_e(Var, Pat_e) } enum Conbind_e { CONBIND_e(Con, Option[Conbind_e]) } enum Datbind_e { DATBIND_e(Conbind_e, Option[Datbind_e]) } enum Exbind_e { EXBIND1_e(Excon, Option[Exbind_e]); EXBIND2_e(Excon, Long[Excon], Option[Exbind_e]) } enum Atexp_e { SCONatexp_e(Scon); VARatexp_e(Long[Var]); CONatexp_e(Long[Con]); EXCONatexp_e(Long[Excon]); RECORDatexp_e(Option[Exprow_e]); LETatexp_e(Dec_e, Exp_e); PARatexp_e(Exp_e) } enum Exprow_e { EXPROW_e(Label, Exp_e, Option[Exprow_e]) } enum Exp_e { ATEXPexp_e(Atexp_e); APPexp_e(Exp_e, Atexp_e); HANDLEexp_e(Exp_e, Match_e); RAISEexp_e(Exp_e); FNexp_e(Match_e) } enum Match_e { MATCH_e(Mrule_e, Option[Match_e]) } enum Mrule_e { MRULE_e(Pat_e, Exp_e) } enum Dec_e { VALdec_e(Valbind_e); DATATYPEdec_e(Datbind_e); ABSTYPEdec_e(Datbind_e, Dec_e); EXCEPTdec_e(Exbind_e); LOCALdec_e(Dec_e, Dec_e); OPENdec_e(Nonemptylist[Long[Strid]]); EMPTYdec_e; SEQdec_e(Dec_e, Dec_e) } enum Valbind_e { PLAINvalbind_e(Pat_e, Exp_e, Option[Valbind_e]); RECvalbind_e(Valbind_e) }")
  myra_induction_c.set(myra_induction)
  myra_recursion_c.set(myra_recursion)
}

///|
let daryl_induction_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("daryl_INDUCTION")

///|
/// `daryl_INDUCTION`
pub fn daryl_induction() -> @kernel.Thm {
  daryl_induction_c.get()
}

///|
let daryl_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("daryl_RECURSION")

///|
/// `daryl_RECURSION`
pub fn daryl_recursion() -> @kernel.Thm {
  daryl_recursion_c.get()
}

///|
/// daryl_INDUCTION, daryl_RECURSION
fn step_36() -> Unit raise {
  let (daryl_induction, daryl_recursion) = @lib.time(@ind_types.define_type, "enum `Source_text` { `module`(String, List[String], List[`Module_item`]); Source_textMeta(String) } enum `Module_item` { declaration(`Declaration`); initial(`Statement`); always(`Statement`); assign(`Lvalue`, `Exprn`); Module_itemMeta(String) } enum `Declaration` { reg_declaration(Option[`Range`], List[String]); net_declaration(Option[`Range`], List[String]); input_declaration(Option[`Range`], List[String]); output_declaration(Option[`Range`], List[String]); DeclarationMeta(String) } enum `Range` { range(`Exprn`, `Exprn`); RangeMeta(String) } enum `Statement` { clock_statement(`Clock`, `Statement_or_null`); blocking_assignment(`Lvalue`, `Exprn`); non_blocking_assignment(`Lvalue`, `Exprn`); conditional_statement(`Exprn`, `Statement_or_null`, Option[`Statement_or_null`]); case_statement(`Exprn`, List[`Case_item`]); while_loop(`Exprn`, `Statement`); repeat_loop(`Exprn`, `Statement`); for_loop(`Lvalue`, `Exprn`, `Exprn`, `Lvalue`, `Exprn`, `Statement`); forever_loop(`Statement`); disable(String); seq_block(Option[String], List[`Statement`]); StatementMeta(String) } enum `Statement_or_null` { statement(`Statement`); null_statement; Statement_or_nullMeta(String) } enum `Clock` { posedge(String); negedge(String); clock(String); ClockMeta(String) } enum `Case_item` { case_item(List[`Exprn`], `Statement_or_null`); default_case_item(`Statement_or_null`); Case_itemMeta(String) } enum `Exprn` { plus(`Exprn`, `Exprn`); minus(`Exprn`, `Exprn`); lshift(`Exprn`, `Exprn`); rshift(`Exprn`, `Exprn`); lt(`Exprn`, `Exprn`); leq(`Exprn`, `Exprn`); gt(`Exprn`, `Exprn`); geq(`Exprn`, `Exprn`); logeq(`Exprn`, `Exprn`); logneq(`Exprn`, `Exprn`); caseeq(`Exprn`, `Exprn`); caseneq(`Exprn`, `Exprn`); bitand(`Exprn`, `Exprn`); bitxor(`Exprn`, `Exprn`); bitor(`Exprn`, `Exprn`); logand(`Exprn`, `Exprn`); logor(`Exprn`, `Exprn`); conditional(`Exprn`, `Exprn`, `Exprn`); positive(`Primary`); negative(`Primary`); lognot(`Primary`); bitnot(`Primary`); reducand(`Primary`); reducxor(`Primary`); reducor(`Primary`); reducnand(`Primary`); reducxnor(`Primary`); reducnor(`Primary`); primary(`Primary`); ExpressionMeta(String) } enum `Primary` { primary_number(`Number`); primary_IDENTIFIER(String); primary_bit_select(String, `Exprn`); primary_part_select(String, `Exprn`, `Exprn`); primary_gen_bit_select(`Exprn`, `Exprn`); primary_gen_part_select(`Exprn`, `Exprn`, `Exprn`); primary_concatenation(`Concatenation`); primary_multiple_concatenation(`Multiple_concatenation`); brackets(`Exprn`); PrimaryMeta(String) } enum `Lvalue` { lvalue(String); lvalue_bit_select(String, `Exprn`); lvalue_part_select(String, `Exprn`, `Exprn`); lvalue_concatenation(`Concatenation`); LvalueMeta(String) } enum `Number` { decimal(String); based(Option[String], String); NumberMeta(String) } enum `Concatenation` { concatenation(List[`Exprn`]); ConcatenationMeta(String) } enum `Multiple_concatenation` { multiple_concatenation(`Exprn`, List[`Exprn`]); Multiple_concatenationMeta(String) } enum Meta { Meta_Source_text(`Source_text`); Meta_Module_item(`Module_item`); Meta_Declaration(`Declaration`); Meta_Range(`Range`); Meta_Statement(`Statement`); Meta_Statement_or_null(`Statement_or_null`); Meta_Clock(`Clock`); Meta_Case_item(`Case_item`); Meta_Expression(`Exprn`); Meta_Primary(`Primary`); Meta_Lvalue(`Lvalue`); Meta_Number(`Number`); Meta_Concatenation(`Concatenation`); Meta_Multiple_concatenation(`Multiple_concatenation`) }")
  daryl_induction_c.set(daryl_induction)
  daryl_recursion_c.set(daryl_recursion)
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
  step_3()
  step_4()
  step_5()
  step_6()
  step_7()
  step_8()
  step_9()
  step_10()
  step_11()
  step_12()
  step_13()
  step_14()
  step_15()
  step_16()
  step_17()
  step_18()
  step_19()
  step_20()
  step_21()
  step_22()
  step_23()
  step_24()
  step_25()
  step_26()
  step_27()
  step_28()
  step_29()
  step_30()
  step_31()
  step_32()
  step_33()
  step_34()
  step_35()
  step_36()
}
