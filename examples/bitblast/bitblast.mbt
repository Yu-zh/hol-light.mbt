// Translated from upstream Examples/bitblast.ml; edit this file directly.

///|
/// `BITBLAST`
pub fn bitblast(x1 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x1
  let th = @equal.thenc(@equal.once_depth_conv(@calc_num.expand_cases_conv), @calc_num.num_reduce_conv)(tm)
  let t2 = @words.bitblast_rule(@kernel.rand(@kernel.concl(th)))
  @kernel.eq_mp(@equal.sym(th), t2)
}

///|
/// Examples/bitblast.ml:54
fn step_1() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("word_xor((x : Word[64]), (y : Word[64])) == word_sub(word_or(x, y), word_and(x, y))")))
}

///|
/// Examples/bitblast.ml:56
fn step_2() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("word_add((x : Word[64]), (y : Word[64])) == word_sub(word_shl(word_or(x, y), 1), word_xor(x, y))")))
}

///|
/// Examples/bitblast.ml:59
fn step_3() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("word_and(word_not((x : Word[64])), word_sub(x, word(1))) == word_not(word_or(x, word_neg(x)))")))
}

///|
/// Examples/bitblast.ml:63
fn step_4() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("word_not(word_or((x : Word[64]), word_neg(x))) == word_sub(word_and(x, word_neg(x)), word(1))")))
}

///|
/// Examples/bitblast.ml:71
fn step_5() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ x : Word[64], ∀ y : Word[64], (val(word_add(x, y)) < val(x)) == !(val(word_add(x, y)) == val(x) + val(y))")))
}

///|
/// Examples/bitblast.ml:75
fn step_6() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ x : Word[64], ∀ y : Word[64], (val(word_add(x, y)) >= val(y)) == (val(word_add(x, y)) == val(x) + val(y))")))
}

///|
/// Examples/bitblast.ml:83
fn step_7() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("(word_sub : (Word[64], Word[64]) -> Word[64])((word_xor : (Word[64], Word[64]) -> Word[64])((word_zx : (Word[32]) -> Word[64])((x : Word[32])), (word : (Num) -> Word[64])(2147483648)), (word : (Num) -> Word[64])(2147483648)) == (word_sx : (Word[32]) -> Word[64])(x)")))
}

///|
/// Examples/bitblast.ml:92
fn step_8() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("LET((m : Word[64]) => LET_END(word_sub(word_xor((x : Word[64]), m), m) == word_xor(word_add(x, m), m)), word_neg(word(bitval((b : Bool)))))")))
}

///|
/// Examples/bitblast.ml:100
fn step_9() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ x : Word[64], (word_ushr(word_or(word_neg(x), x), 63) == word(1)) == !(x == word(0)) && (word_ushr(word_or(word_neg(x), x), 63) == word(0)) == (x == word(0))")))
}

///|
/// Examples/bitblast.ml:105
fn step_10() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ x : Word[64], (word_ishr(word_or(word_neg(x), x), 63) == word(18446744073709551615)) == !(x == word(0)) && (word_ishr(word_or(word_neg(x), x), 63) == word(0)) == (x == word(0))")))
}

///|
/// Examples/bitblast.ml:115
fn step_11() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ x : Word[64], LET((x2 : Word[64]) => LET_END(LET((x4 : Word[64]) => LET_END(LET((x8 : Word[64]) => LET_END(LET((x64 : Word[64]) => LET_END(LET((y : Word[64]) => LET_END(y == word(word_popcount(x))), word_ushr(x64, 56))), word_mul(x8, word(72340172838076673)))), word_and(word_add(x4, word_ushr(x4, 4)), word(1085102592571150095)))), word_add(word_and(x2, word(3689348814741910323)), word_ushr(word_and(x2, word(14757395258967641292)), 2)))), word_sub(x, word_ushr(word_and(x, word(12297829382473034410)), 1)))")))
}

///|
/// Examples/bitblast.ml:126
fn step_12() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ x : Word[15], LET((u : Word[64]) => LET_END(LET((v : Word[64]) => LET_END(LET((w : Word[64]) => LET_END(LET((y : Word[64]) => LET_END(y == word(word_popcount(x))), word_ushr(w, 60))), word_mul(v, word(1229782938247303441)))), word_and(u, word(1229782938247303441)))), word_mul(word_zx(x), word(562967133814800)))")))
}

///|
/// Examples/bitblast.ml:138
fn step_13() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ x : Word[4], ∀ y : Word[4], val(x) * val(y) == 13 → val(x) == 1 || val(y) == 1")))
}

///|
/// Examples/bitblast.ml:141
fn step_14() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ x : Word[8], ∀ y : Word[8], val(x) * val(y) == 241 → val(x) == 1 || val(y) == 1")))
}

///|
/// Examples/bitblast.ml:148
fn step_15() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ x : Word[64], LET((x1 : Word[64]) => LET_END(LET((x2 : Word[64]) => LET_END(LET((x4 : Word[64]) => LET_END(LET((x8 : Word[64]) => LET_END(LET((x16 : Word[64]) => LET_END(LET((x32 : Word[64]) => LET_END(LET((y : Word[64]) => LET_END(y == word(bitval(word_oddparity(x)))), word_and(x32, word(1)))), word_xor(x16, word_ushr(x16, 32)))), word_xor(x8, word_ushr(x8, 16)))), word_xor(x4, word_ushr(x4, 8)))), word_xor(x2, word_ushr(x2, 4)))), word_xor(x1, word_ushr(x1, 2)))), word_xor(x, word_ushr(x, 1)))")))
}

///|
/// Examples/bitblast.ml:159
fn step_16() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ x : Word[32], LET((x1 : Word[32]) => LET_END(LET((x2 : Word[32]) => LET_END(LET((x4 : Word[32]) => LET_END(LET((y : Word[32]) => LET_END(y == word(bitval(word_oddparity(x)))), word_and(word_ushr(x4, 28), word(1)))), word_mul(x2, word(286331153)))), word_and(word_xor(x1, word_ushr(x1, 2)), word(286331153)))), word_xor(x, word_ushr(x, 1)))")))
}

///|
/// Examples/bitblast.ml:167
fn step_17() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ x : Word[32], LET((x1 : Word[32]) => LET_END(LET((x2 : Word[32]) => LET_END(LET((x4 : Word[32]) => LET_END(LET((y : Word[32]) => LET_END(y == word(bitval(word_oddparity(x)))), word_ushr(x4, 31))), word_mul(x2, word(2290649224)))), word_and(word_xor(x1, word_ushr(x1, 2)), word(286331153)))), word_xor(x, word_ushr(x, 1)))")))
}

///|
/// Examples/bitblast.ml:179
fn step_18() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ x : Word[64], ∀ y : Word[64], (word_ushr : (Word[65], Num) -> Word[65])((word_add : (Word[65], Word[65]) -> Word[65])((word_zx : (Word[64]) -> Word[65])(x), (word_zx : (Word[64]) -> Word[65])(y)), 1) == (word_zx : (Word[64]) -> Word[65])((word_add : (Word[64], Word[64]) -> Word[64])((word_and : (Word[64], Word[64]) -> Word[64])(x, y), (word_ushr : (Word[64], Num) -> Word[64])((word_xor : (Word[64], Word[64]) -> Word[64])(x, y), 1)))")))
}

///|
/// Examples/bitblast.ml:184
fn step_19() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ x : Word[64], ∀ y : Word[64], (word_ushr : (Word[128], Num) -> Word[128])((word_add : (Word[128], Word[128]) -> Word[128])((word_zx : (Word[64]) -> Word[128])(x), (word_zx : (Word[64]) -> Word[128])(y)), 1) == (word_zx : (Word[64]) -> Word[128])((word_add : (Word[64], Word[64]) -> Word[64])((word_and : (Word[64], Word[64]) -> Word[64])(x, y), (word_ushr : (Word[64], Num) -> Word[64])((word_xor : (Word[64], Word[64]) -> Word[64])(x, y), 1)))")))
}

///|
/// Examples/bitblast.ml:189
fn step_20() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ x : Word[64], ∀ y : Word[64], (word_ushr : (Word[65], Num) -> Word[65])((word_add : (Word[65], Word[65]) -> Word[65])((word_zx : (Word[64]) -> Word[65])(x), (word_zx : (Word[64]) -> Word[65])(y)), 1) == (word_zx : (Word[64]) -> Word[65])((word_add : (Word[64], Word[64]) -> Word[64])((word_add : (Word[64], Word[64]) -> Word[64])((word_ushr : (Word[64], Num) -> Word[64])(x, 1), (word_ushr : (Word[64], Num) -> Word[64])(y, 1)), (word_and : (Word[64], Word[64]) -> Word[64])((word_and : (Word[64], Word[64]) -> Word[64])(x, y), (word : (Num) -> Word[64])(1))))")))
}

///|
/// Examples/bitblast.ml:199
fn step_21() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ x : Word[64], LET((x' : Word[64]) => LET_END(word_and(x', word_neg(x')) == word_and(word_xor(x, word_add(x, word(1))), word_not(x))), word_not(x))")))
}

///|
/// Examples/bitblast.ml:208
fn step_22() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("LET((gray : (Word[64]) -> Word[64]) => LET_END(gray((x : Word[64])) == gray((y : Word[64])) → x == y), (x : Word[64]) => word_xor(x, word_ushr(x, 1)))")))
}

///|
/// Examples/bitblast.ml:216
fn step_23() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("(LET : (((Word[64]) -> Word[64]) -> Bool, (Word[64]) -> Word[64]) -> Bool)((gray : (Word[64]) -> Word[64]) => (LET_END : (Bool) -> Bool)((word : (Num) -> Word[8])(bitval((word_oddparity : (Word[64]) -> Bool)(gray((x : Word[64]))))) == (word : (Num) -> Word[8])(bitval((bit : (Num, Word[64]) -> Bool)(0, x)))), (x : Word[64]) => (word_xor : (Word[64], Word[64]) -> Word[64])(x, (word_ushr : (Word[64], Num) -> Word[64])(x, 1)))")))
}

///|
/// Examples/bitblast.ml:225
fn step_24() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("((word_and : (Word[64], Word[64]) -> Word[64])((x : Word[64]), (word_sub : (Word[64], Word[64]) -> Word[64])(x, (word : (Num) -> Word[64])(1))) == (word : (Num) -> Word[64])(0)) == ((word_and : (Word[8], Word[8]) -> Word[8])((word : (Num) -> Word[8])((word_popcount : (Word[64]) -> Num)(x)), (word_not : (Word[8]) -> Word[8])((word : (Num) -> Word[8])(1))) == (word : (Num) -> Word[8])(0))")))
}

///|
/// Examples/bitblast.ml:229
fn step_25() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("(word_and((x : Word[64]), word_sub(x, word(1))) == word(0)) == (word_popcount(x) == 0 || word_popcount(x) == 1)")))
}

///|
/// Examples/bitblast.ml:237
fn step_26() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("LET((gray : (Word[64]) -> Word[64]) => (pow2orzero : (Word[64]) -> Bool) => LET_END(pow2orzero(word_xor(gray((x : Word[64])), gray(word_add(x, word(1)))))), (x : Word[64]) => word_xor(x, word_ushr(x, 1)), (x : Word[64]) => word_and(x, word_sub(x, word(1))) == word(0))")))
}

///|
/// Examples/bitblast.ml:242
fn step_27() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("LET((gray : (Word[64]) -> Word[64]) => (pow2 : (Word[64]) -> Bool) => LET_END(pow2(word_xor(gray((x : Word[64])), gray(word_add(x, word(1)))))), (x : Word[64]) => word_xor(x, word_ushr(x, 1)), (x : Word[64]) => word_and(x, word_sub(x, word(1))) == word(0) && !(x == word(0)))")))
}

///|
/// Examples/bitblast.ml:248
fn step_28() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("(LET : (((Word[64]) -> Word[64]) -> Bool, (Word[64]) -> Word[64]) -> Bool)((gray : (Word[64]) -> Word[64]) => (LET_END : (Bool) -> Bool)((word : (Num) -> Word[8])((word_popcount : (Word[64]) -> Num)((word_xor : (Word[64], Word[64]) -> Word[64])(gray((x : Word[64])), gray((word_add : (Word[64], Word[64]) -> Word[64])(x, (word : (Num) -> Word[64])(1)))))) == (word : (Num) -> Word[8])(1)), (x : Word[64]) => (word_xor : (Word[64], Word[64]) -> Word[64])(x, (word_ushr : (Word[64], Num) -> Word[64])(x, 1)))")))
}

///|
/// Examples/bitblast.ml:257
fn step_29() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("LET((gray : (Word[64]) -> Word[64]) => LET_END(gray(gray((x : Word[64]))) == word_xor(x, word_ushr(x, 2))), (x : Word[64]) => word_xor(x, word_ushr(x, 1)))")))
}

///|
/// Examples/bitblast.ml:261
fn step_30() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("LET((gray : (Word[8]) -> Word[8]) => LET_END(gray(gray(gray(gray(gray(gray(gray(gray((x : Word[8]))))))))) == x), (x : Word[8]) => word_xor(x, word_ushr(x, 1)))")))
}

///|
/// Examples/bitblast.ml:269
fn step_31() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ x : Word[64], ∀ y : Word[64], word_clz(word_or(x, y)) <= word_clz(x)")))
}

///|
/// Examples/bitblast.ml:272
fn step_32() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ x : Word[32], word_popcount(word_add(x, word(1))) == 1 → word_ctz(x) == 0 || word_ctz(x) == 32")))
}

///|
/// Examples/bitblast.ml:276
fn step_33() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ x : Word[32], !(x == word(0)) → word_popcount(word_sub(x, word(1))) + 1 == word_popcount(x) + word_ctz(x)")))
}

///|
/// Examples/bitblast.ml:281
fn step_34() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ x : Word[32], (word_clz(x) + (word_popcount(x) + word_ctz(x)) == 32) == (!(x == word(0)) && word_and(word_add(word_or(x, word_sub(x, word(1))), word(1)), x) == word(0))")))
}

///|
/// Examples/bitblast.ml:287
fn step_35() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ x : Word[32], (word_popcount(x) == 0 || word_popcount(x) == 1) == (word_and(x, word_sub(x, word(1))) == word(0))")))
}

///|
/// Examples/bitblast.ml:291
fn step_36() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ x : Word[32], (word_popcount(x) == 1) == (word_or(word_not(word_ishr(word_or(x, word_neg(x)), 31)), word_and(x, word_sub(x, word(1)))) == word(0))")))
}

///|
/// Examples/bitblast.ml:305
fn step_37() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ x : Word[32], (word : (Num) -> Word[8])((word_ctz : (Word[32]) -> Num)(x)) == (word : (Num) -> Word[8])((word_popcount : (Word[32]) -> Num)((word_sub : (Word[32], Word[32]) -> Word[32])((word_and : (Word[32], Word[32]) -> Word[32])(x, (word_neg : (Word[32]) -> Word[32])(x)), (word : (Num) -> Word[32])(1))))")))
}

///|
/// Examples/bitblast.ml:309
fn step_38() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ x : Word[64], (word : (Num) -> Word[8])((word_ctz : (Word[64]) -> Num)(x)) == (word : (Num) -> Word[8])((word_popcount : (Word[64]) -> Num)((word_sub : (Word[64], Word[64]) -> Word[64])((word_and : (Word[64], Word[64]) -> Word[64])(x, (word_neg : (Word[64]) -> Word[64])(x)), (word : (Num) -> Word[64])(1))))")))
}

///|
/// Examples/bitblast.ml:317
fn step_39() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ x : Word[64], ∀ y : Word[64], (word_clz(x) == word_clz(y)) == (val(word_xor(x, y)) <= val(word_and(x, y)))")))
}

///|
/// Examples/bitblast.ml:321
fn step_40() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ x : Word[64], ∀ y : Word[64], (word_clz(x) < word_clz(y)) == (val(word_and(x, word_not(y))) > val(y))")))
}

///|
/// Examples/bitblast.ml:325
fn step_41() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ x : Word[64], ∀ y : Word[64], (word_clz(x) <= word_clz(y)) == (val(word_and(word_not(x), y)) <= val(x))")))
}

///|
/// Examples/bitblast.ml:336
fn step_42() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ x : Word[64], ∀ y : Word[64], (LET : ((Word[64], Word[_]) -> Bool, Word[64], Word[_]) -> Bool)((h : Word[64]) => (l : Word[_]) => (LET_END : (Bool) -> Bool)((LET : ((Word[64], Word[64]) -> Bool, Word[64], Word[64]) -> Bool)((s : Word[64]) => (t : Word[64]) => (LET_END : (Bool) -> Bool)((LET : ((Word[64]) -> Bool, Word[64]) -> Bool)((z : Word[64]) => (LET_END : (Bool) -> Bool)(∀ i : Num, i < 8 → (word_subword : (Word[64], (Num, Num)) -> Word[8])(z, (8 * i, 8)) == (word_add : (Word[8], Word[8]) -> Word[8])((word_subword : (Word[64], (Num, Num)) -> Word[8])(x, (8 * i, 8)), (word_subword : (Word[64], (Num, Num)) -> Word[8])(y, (8 * i, 8)))), (word_xor : (Word[64], Word[64]) -> Word[64])(s, t))), (word_add : (Word[64], Word[64]) -> Word[64])((word_and : (Word[64], Word[64]) -> Word[64])(x, (word_not : (Word[64]) -> Word[64])(h)), (word_and : (Word[64], Word[64]) -> Word[64])(y, (word_not : (Word[64]) -> Word[64])(h))), (word_and : (Word[64], Word[64]) -> Word[64])((word_xor : (Word[64], Word[64]) -> Word[64])(x, y), h))), (word : (Num) -> Word[64])(9259542123273814144), (word : (Num) -> Word[_])(72340172838076673))")))
}

///|
/// Examples/bitblast.ml:348
fn step_43() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ x : Word[64], ∀ y : Word[64], (LET : ((Word[64], Word[_]) -> Bool, Word[64], Word[_]) -> Bool)((h : Word[64]) => (l : Word[_]) => (LET_END : (Bool) -> Bool)((LET : ((Word[64], Word[64]) -> Bool, Word[64], Word[64]) -> Bool)((s : Word[64]) => (t : Word[64]) => (LET_END : (Bool) -> Bool)((LET : ((Word[64]) -> Bool, Word[64]) -> Bool)((z : Word[64]) => (LET_END : (Bool) -> Bool)(∀ i : Num, i < 8 → (word_subword : (Word[64], (Num, Num)) -> Word[8])(z, (8 * i, 8)) == (word_sub : (Word[8], Word[8]) -> Word[8])((word_subword : (Word[64], (Num, Num)) -> Word[8])(x, (8 * i, 8)), (word_subword : (Word[64], (Num, Num)) -> Word[8])(y, (8 * i, 8)))), (word_xor : (Word[64], Word[64]) -> Word[64])(s, t))), (word_sub : (Word[64], Word[64]) -> Word[64])((word_or : (Word[64], Word[64]) -> Word[64])(x, h), (word_and : (Word[64], Word[64]) -> Word[64])(y, (word_not : (Word[64]) -> Word[64])(h))), (word_and : (Word[64], Word[64]) -> Word[64])((word_xor : (Word[64], Word[64]) -> Word[64])(x, (word_not : (Word[64]) -> Word[64])(y)), h))), (word : (Num) -> Word[64])(9259542123273814144), (word : (Num) -> Word[_])(72340172838076673))")))
}

///|
/// Examples/bitblast.ml:360
fn step_44() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ x : Word[64], ∀ y : Word[64], (LET : ((Word[64]) -> Bool, Word[64]) -> Bool)((l : Word[64]) => (LET_END : (Bool) -> Bool)((LET : ((Word[64]) -> Bool, Word[64]) -> Bool)((z : Word[64]) => (LET_END : (Bool) -> Bool)(∀ i : Num, i < 8 → (word_zx : (Word[8]) -> Word[9])((word_subword : (Word[64], (Num, Num)) -> Word[8])(z, (8 * i, 8))) == (word_ushr : (Word[9], Num) -> Word[9])((word_add : (Word[9], Word[9]) -> Word[9])((word_zx : (Word[8]) -> Word[9])((word_subword : (Word[64], (Num, Num)) -> Word[8])(x, (8 * i, 8))), (word_zx : (Word[8]) -> Word[9])((word_subword : (Word[64], (Num, Num)) -> Word[8])(y, (8 * i, 8)))), 1)), (word_add : (Word[64], Word[64]) -> Word[64])((word_and : (Word[64], Word[64]) -> Word[64])(x, y), (word_ushr : (Word[64], Num) -> Word[64])((word_and : (Word[64], Word[64]) -> Word[64])((word_xor : (Word[64], Word[64]) -> Word[64])(x, y), (word_not : (Word[64]) -> Word[64])(l)), 1)))), (word : (Num) -> Word[64])(72340172838076673))")))
}

///|
/// Examples/bitblast.ml:375
fn step_45() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ x : Word[64], ∀ y : Word[64], (LET : ((Word[64]) -> Bool, Word[64]) -> Bool)((m : Word[64]) => (LET_END : (Bool) -> Bool)((LET : ((Word[64]) -> Bool, Word[64]) -> Bool)((d : Word[64]) => (LET_END : (Bool) -> Bool)((LET : ((Word[64]) -> Bool, Word[64]) -> Bool)((w : Word[64]) => (LET_END : (Bool) -> Bool)((LET : ((Word[64]) -> Bool, Word[64]) -> Bool)((z : Word[64]) => (LET_END : (Bool) -> Bool)(∀ i : Num, i < 8 → ((word_subword : (Word[64], (Num, Num)) -> Word[8])(z, (8 * i, 8)) == (word : (Num) -> Word[8])(0)) == !((word_subword : (Word[64], (Num, Num)) -> Word[8])(x, (8 * i, 8)) == (word_subword : (Word[64], (Num, Num)) -> Word[8])(y, (8 * i, 8))) && ((word_subword : (Word[64], (Num, Num)) -> Word[8])(z, (8 * i, 8)) == (word : (Num) -> Word[8])(128)) == ((word_subword : (Word[64], (Num, Num)) -> Word[8])(x, (8 * i, 8)) == (word_subword : (Word[64], (Num, Num)) -> Word[8])(y, (8 * i, 8)))), (word_not : (Word[64]) -> Word[64])((word_or : (Word[64], Word[64]) -> Word[64])((word_or : (Word[64], Word[64]) -> Word[64])(d, m), w)))), (word_add : (Word[64], Word[64]) -> Word[64])((word_and : (Word[64], Word[64]) -> Word[64])(d, m), m))), (word_xor : (Word[64], Word[64]) -> Word[64])(x, y))), (word : (Num) -> Word[64])(9187201950435737471))")))
}

///|
/// Examples/bitblast.ml:387
fn step_46() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ x : Word[64], ∀ y : Word[64], (LET : ((Word[64]) -> Bool, Word[64]) -> Bool)((h : Word[64]) => (LET_END : (Bool) -> Bool)((LET : ((Word[64]) -> Bool, Word[64]) -> Bool)((d : Word[64]) => (LET_END : (Bool) -> Bool)((LET : ((Word[64]) -> Bool, Word[64]) -> Bool)((w : Word[64]) => (LET_END : (Bool) -> Bool)((LET : ((Word[64]) -> Bool, Word[64]) -> Bool)((z : Word[64]) => (LET_END : (Bool) -> Bool)(∀ i : Num, i < 8 → ((word_subword : (Word[64], (Num, Num)) -> Word[8])(z, (8 * i, 8)) == (word : (Num) -> Word[8])(0)) == !((word_subword : (Word[64], (Num, Num)) -> Word[8])(x, (8 * i, 8)) == (word_subword : (Word[64], (Num, Num)) -> Word[8])(y, (8 * i, 8))) && ((word_subword : (Word[64], (Num, Num)) -> Word[8])(z, (8 * i, 8)) == (word : (Num) -> Word[8])(255)) == ((word_subword : (Word[64], (Num, Num)) -> Word[8])(x, (8 * i, 8)) == (word_subword : (Word[64], (Num, Num)) -> Word[8])(y, (8 * i, 8)))), (word_sub : (Word[64], Word[64]) -> Word[64])((word_shl : (Word[64], Num) -> Word[64])(w, 1), (word_ushr : (Word[64], Num) -> Word[64])(w, 7)))), (word_and : (Word[64], Word[64]) -> Word[64])((word_sub : (Word[64], Word[64]) -> Word[64])((word_or : (Word[64], Word[64]) -> Word[64])((word_ushr : (Word[64], Num) -> Word[64])(d, 1), h), d), h))), (word_xor : (Word[64], Word[64]) -> Word[64])(x, y))), (word : (Num) -> Word[64])(9259542123273814144))")))
}

///|
/// Examples/bitblast.ml:399
fn step_47() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ x : Word[64], ∀ y : Word[64], (LET : ((Word[64]) -> Bool, Word[64]) -> Bool)((h : Word[64]) => (LET_END : (Bool) -> Bool)((LET : ((Word[64]) -> Bool, Word[64]) -> Bool)((m : Word[64]) => (LET_END : (Bool) -> Bool)((LET : ((Word[64]) -> Bool, Word[64]) -> Bool)((d : Word[64]) => (LET_END : (Bool) -> Bool)((LET : ((Word[64]) -> Bool, Word[64]) -> Bool)((w : Word[64]) => (LET_END : (Bool) -> Bool)((LET : ((Word[64]) -> Bool, Word[64]) -> Bool)((z : Word[64]) => (LET_END : (Bool) -> Bool)(∀ i : Num, i < 8 → ((word_subword : (Word[64], (Num, Num)) -> Word[8])(z, (8 * i, 8)) == (word : (Num) -> Word[8])(0)) == ((word_subword : (Word[64], (Num, Num)) -> Word[8])(x, (8 * i, 8)) == (word_subword : (Word[64], (Num, Num)) -> Word[8])(y, (8 * i, 8))) && ((word_subword : (Word[64], (Num, Num)) -> Word[8])(z, (8 * i, 8)) == (word : (Num) -> Word[8])(128)) == !((word_subword : (Word[64], (Num, Num)) -> Word[8])(x, (8 * i, 8)) == (word_subword : (Word[64], (Num, Num)) -> Word[8])(y, (8 * i, 8)))), (word_and : (Word[64], Word[64]) -> Word[64])((word_or : (Word[64], Word[64]) -> Word[64])(w, d), h))), (word_add : (Word[64], Word[64]) -> Word[64])((word_and : (Word[64], Word[64]) -> Word[64])(d, m), m))), (word_xor : (Word[64], Word[64]) -> Word[64])(x, y))), (word_not : (Word[64]) -> Word[64])(h))), (word : (Num) -> Word[64])(9259542123273814144))")))
}

///|
/// Examples/bitblast.ml:416
fn step_48() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("(LET : ((Word[64], Word[64]) -> Bool, Word[64], Word[64]) -> Bool)((h : Word[64]) => (l : Word[64]) => (LET_END : (Bool) -> Bool)(((word_and : (Word[64], Word[64]) -> Word[64])(h, (word_and : (Word[64], Word[64]) -> Word[64])((word_sub : (Word[64], Word[64]) -> Word[64])((x : Word[64]), l), (word_not : (Word[64]) -> Word[64])(x))) == (word : (Num) -> Word[64])(0)) == (∀ i : Num, i < 8 → !((word_subword : (Word[64], (Num, Num)) -> Word[8])(x, (8 * i, 8)) == (word : (Num) -> Word[8])(0)))), (word : (Num) -> Word[64])(9259542123273814144), (word : (Num) -> Word[64])(72340172838076673))")))
}

///|
/// Examples/bitblast.ml:428
fn step_49() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ a : Word[32], (LET : ((Word[32]) -> Bool, Word[32]) -> Bool)((w : Word[32]) => (LET_END : (Bool) -> Bool)((LET : ((Word[32]) -> Bool, Word[32]) -> Bool)((z : Word[32]) => (LET_END : (Bool) -> Bool)((∀ i : Num, i < 7 → (val : (Word[4]) -> Num)((word_subword : (Word[32], (Num, Num)) -> Word[4])(a, (4 * i, 4))) < 10) == (z == (word : (Num) -> Word[32])(0))), (word_and : (Word[32], Word[32]) -> Word[32])(w, (word : (Num) -> Word[32])(286331152)))), (word_xor : (Word[32], Word[32]) -> Word[32])((word_add : (Word[32], Word[32]) -> Word[32])(a, (word : (Num) -> Word[32])(107374182)), a))")))
}

///|
/// Examples/bitblast.ml:438
fn step_50() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ a : Word[32], (LET : ((Word[32]) -> Bool, Word[32]) -> Bool)((a' : Word[32]) => (LET_END : (Bool) -> Bool)((LET : ((Word[32]) -> Bool, Word[32]) -> Bool)((w : Word[32]) => (LET_END : (Bool) -> Bool)((LET : ((Word[32]) -> Bool, Word[32]) -> Bool)((z : Word[32]) => (LET_END : (Bool) -> Bool)((∀ i : Num, i < 8 → (val : (Word[4]) -> Num)((word_subword : (Word[32], (Num, Num)) -> Word[4])(a, (4 * i, 4))) < 10) == (z == (word : (Num) -> Word[32])(0))), (word_and : (Word[32], Word[32]) -> Word[32])(w, (word : (Num) -> Word[32])(2290649224)))), (word_xor : (Word[32], Word[32]) -> Word[32])((word_add : (Word[32], Word[32]) -> Word[32])(a', (word : (Num) -> Word[32])(858993459)), a'))), (word_ushr : (Word[32], Num) -> Word[32])(a, 1))")))
}

///|
/// Examples/bitblast.ml:451
fn step_51() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ a : Word[5], LET((x : Word[5]) => LET_END(bit(0, a) → word_mul(a, x) == word_neg(word(1))), word_xor(word_sub(a, word_shl(a, 2)), word(2)))")))
}

///|
/// Examples/bitblast.ml:456
fn step_52() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ a : Word[4], LET((x : Word[4]) => LET_END(bit(0, a) → word_mul(a, x) == word_neg(word(1))), word_sub(word_shl(word_and(word_sub(word(1), a), word(4)), 1), a))")))
}

///|
/// Examples/bitblast.ml:465
fn step_53() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ x : Word[64], LET((x1 : Word[64]) => LET_END(LET((x2 : Word[64]) => LET_END(LET((x4 : Word[64]) => LET_END(LET((x8 : Word[64]) => LET_END(LET((x16 : Word[64]) => LET_END(LET((x32 : Word[64]) => LET_END(word_popcount(word_not(x32)) == word_clz(x)), word_or(x16, word_ushr(x16, 32)))), word_or(x8, word_ushr(x8, 16)))), word_or(x4, word_ushr(x4, 8)))), word_or(x2, word_ushr(x2, 4)))), word_or(x1, word_ushr(x1, 2)))), word_or(x, word_ushr(x, 1)))")))
}

///|
/// Examples/bitblast.ml:475
fn step_54() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ x : Word[64], LET((x1 : Word[64]) => LET_END(LET((x2 : Word[64]) => LET_END(LET((x4 : Word[64]) => LET_END(LET((x8 : Word[64]) => LET_END(LET((x16 : Word[64]) => LET_END(LET((x32 : Word[64]) => LET_END(word_popcount(word_not(x32)) == word_clz(x)), word_or(x16, word_ushr(x16, 1)))), word_or(x8, word_ushr(x8, 2)))), word_or(x4, word_ushr(x4, 4)))), word_or(x2, word_ushr(x2, 8)))), word_or(x1, word_ushr(x1, 16)))), word_or(x, word_ushr(x, 32)))")))
}

///|
/// Examples/bitblast.ml:485
fn step_55() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ x : Word[64], (if x == word(0) { word(64) } else { LET((n : Word[64]) => LET_END(LET(GABS((f : ((Word[64], Word[64])) -> Word[64]) => ∀ x0 : Word[64], ∀ n0 : Word[64], GEQ(f((x0, n0)), LET_END(LET(GABS((f : ((Word[64], Word[64])) -> Word[64]) => ∀ x1 : Word[64], ∀ n1 : Word[64], GEQ(f((x1, n1)), LET_END(LET(GABS((f : ((Word[64], Word[64])) -> Word[64]) => ∀ x2 : Word[64], ∀ n2 : Word[64], GEQ(f((x2, n2)), LET_END(LET(GABS((f : ((Word[64], Word[64])) -> Word[64]) => ∀ x3 : Word[64], ∀ n3 : Word[64], GEQ(f((x3, n3)), LET_END(LET(GABS((f : ((Word[64], Word[64])) -> Word[64]) => ∀ x4 : Word[64], ∀ n4 : Word[64], GEQ(f((x4, n4)), LET_END(if val(x4) <= 9223372036854775807 { word_add(n4, word(1)) } else { n4 }))), if val(x3) <= 4611686018427387903 { (word_shl(x3, 2), word_add(n3, word(2))) } else { (x3, n3) })))), if val(x2) <= 1152921504606846975 { (word_shl(x2, 4), word_add(n2, word(4))) } else { (x2, n2) })))), if val(x1) <= 72057594037927935 { (word_shl(x1, 8), word_add(n1, word(8))) } else { (x1, n1) })))), if val(x0) <= 281474976710655 { (word_shl(x0, 16), word_add(n0, word(16))) } else { (x0, n0) })))), if val(x) <= 4294967295 { (word_shl(x, 32), word_add(n, word(32))) } else { (x, n) })), word(0)) }) == word(word_clz(x))")))
}

///|
/// Examples/bitblast.ml:502
fn step_56() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ x : Word[64], LET((MASK32 : Word[64]) => (MASK16 : Word[64]) => (MASK8 : Word[64]) => (MASK4 : Word[64]) => (MASK2 : Word[64]) => (MASK1 : Word[64]) => LET_END((if x == word(0) { 64 } else { (if val(word_and(x, MASK32)) < val(word_and(x, word_not(MASK32))) { 32 } else { 0 }) + ((if val(word_and(x, MASK16)) < val(word_and(x, word_not(MASK16))) { 16 } else { 0 }) + ((if val(word_and(x, MASK8)) < val(word_and(x, word_not(MASK8))) { 8 } else { 0 }) + ((if val(word_and(x, MASK4)) < val(word_and(x, word_not(MASK4))) { 4 } else { 0 }) + ((if val(word_and(x, MASK2)) < val(word_and(x, word_not(MASK2))) { 2 } else { 0 }) + (if val(word_and(x, MASK1)) < val(word_and(x, word_not(MASK1))) { 1 } else { 0 }))))) }) == word_clz(x)), word(18446744069414584320), word(18446462603027742720), word(18374966859414961920), word(17361641481138401520), word(14757395258967641292), word(12297829382473034410))")))
}

///|
/// Examples/bitblast.ml:530
fn step_57() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ x : Word[8], LET((f : Word[64]) => LET_END(LET((s : Word[64]) => LET_END(LET((m : Word[64]) => LET_END(LET((l : Word[64]) => LET_END(word_zx(l) == word_reversefields(1, x)), word_ushr(m, 32))), word_mul(s, word(4311810305)))), word_and(f, word(36578664720)))), word_mul(word_zx(x), word(2149582850)))")))
}

///|
/// Examples/bitblast.ml:538
fn step_58() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ x : Word[8], LET((f : Word[64]) => LET_END(LET((s : Word[64]) => LET_END(LET((m : Word[64]) => LET_END(LET((l : Word[64]) => LET_END(l == word_zx(word_reversefields(1, x))), word_and(word_ushr(m, 32), word(255)))), word_mul(s, word(4311810305)))), word_and(f, word(36578664720)))), word_mul(word_zx(x), word(2149582850)))")))
}

///|
/// Examples/bitblast.ml:551
fn step_59() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ x : Word[8], (LET : ((Word[64]) -> Bool, Word[64]) -> Bool)((f : Word[64]) => (LET_END : (Bool) -> Bool)((LET : ((Word[64]) -> Bool, Word[64]) -> Bool)((s : Word[64]) => (LET_END : (Bool) -> Bool)((LET : ((Word[64]) -> Bool, Word[64]) -> Bool)((m : Word[64]) => (LET_END : (Bool) -> Bool)((LET : ((Word[64]) -> Bool, Word[64]) -> Bool)((l : Word[64]) => (LET_END : (Bool) -> Bool)((word_zx : (Word[64]) -> Word[8])(l) == (word_or : (Word[8], Word[8]) -> Word[8])((word_and : (Word[8], Word[8]) -> Word[8])(x, (word : (Num) -> Word[8])(1)), (word_shl : (Word[8], Num) -> Word[8])((word_zx : (Word[7]) -> Word[8])((word_reversefields : (Num, Word[7]) -> Word[7])(1, (word_zx : (Word[8]) -> Word[7])((word_ushr : (Word[8], Num) -> Word[8])(x, 1)))), 1))), (word_ushr : (Word[64], Num) -> Word[64])(m, 32))), (word_mul : (Word[64], Word[64]) -> Word[64])(s, (word : (Num) -> Word[64])(4311810305)))), (word_and : (Word[64], Word[64]) -> Word[64])(f, (word : (Num) -> Word[64])(36578664465)))), (word_mul : (Word[64], Word[64]) -> Word[64])((word_zx : (Word[8]) -> Word[64])(x), (word : (Num) -> Word[64])(1074791425)))")))
}

///|
/// Examples/bitblast.ml:568
fn step_60() -> Unit raise {
  ignore(bitblast(@term_syntax.parse_term("∀ a : Word[32], LET((ML_DSA_Q : Int) => LET_END(LET((t : Word[32]) => LET_END(LET((r : Word[32]) => LET_END(ival(a) < int_of_num(2143289344) → ival(a) - ML_DSA_Q * ival(t) == ival(r) && -int_of_num(6283009) <= ival(r) && ival(r) <= int_of_num(6283008)), word_sub(a, word_mul(t, iword(ML_DSA_Q))))), word_ishr(word_add(a, word_shl(word(1), 22)), 23))), int_of_num(8380417))")))
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
  step_37()
  step_38()
  step_39()
  step_40()
  step_41()
  step_42()
  step_43()
  step_44()
  step_45()
  step_46()
  step_47()
  step_48()
  step_49()
  step_50()
  step_51()
  step_52()
  step_53()
  step_54()
  step_55()
  step_56()
  step_57()
  step_58()
  step_59()
  step_60()
}
