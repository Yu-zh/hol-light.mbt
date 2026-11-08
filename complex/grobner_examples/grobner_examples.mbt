// Translated from upstream Complex/grobner_examples.ml; edit this file directly.

///|
/// Complex/grobner_examples.ml:5
fn step_1() -> Unit raise {
  ignore(@lib.time(@complex_grobner.complex_arith, @term_syntax.parse_term("∀ a : Complex, ∀ b : Complex, ∀ c : Complex, a * pow((x : Complex), 2) + (b * x + c) == Cx(real_of_num(0)) && a * pow((y : Complex), 2) + (b * y + c) == Cx(real_of_num(0)) && !(x == y) → a * (x + y) + b == Cx(real_of_num(0))")))
}

///|
/// Complex/grobner_examples.ml:12
fn step_2() -> Unit raise {
  ignore(@lib.time(@complex_grobner.complex_arith, @term_syntax.parse_term("∀ a : Complex, ∀ b : Complex, ∀ c : Complex, a * pow((x : Complex), 2) + (b * x + c) == Cx(real_of_num(0)) && Cx(real_of_num(2)) * (a * pow((y : Complex), 2)) + (Cx(real_of_num(2)) * (b * y) + Cx(real_of_num(2)) * c) == Cx(real_of_num(0)) && !(x == y) → a * (x + y) + b == Cx(real_of_num(0))")))
}

///|
/// Complex/grobner_examples.ml:23
fn step_3() -> Unit raise {
  ignore(@lib.time(@complex_grobner.complex_arith, @term_syntax.parse_term("!((y_1 : Complex) == Cx(real_of_num(2)) * (y_3 : Complex) && (y_2 : Complex) == Cx(real_of_num(2)) * (y_4 : Complex) && y_1 * y_3 == y_2 * y_4 && (pow(y_1, 2) - pow(y_2, 2)) * (z : Complex) == Cx(real_of_num(1)))")))
}

///|
/// Complex/grobner_examples.ml:29
fn step_4() -> Unit raise {
  ignore(@lib.time(@complex_grobner.complex_arith, @term_syntax.parse_term("∀ y_1 : Complex, ∀ y_2 : Complex, ∀ y_3 : Complex, ∀ y_4 : Complex, y_1 == Cx(real_of_num(2)) * y_3 && y_2 == Cx(real_of_num(2)) * y_4 && y_1 * y_3 == y_2 * y_4 → pow(y_1, 2) == pow(y_2, 2)")))
}

///|
/// Complex/grobner_examples.ml:41
fn step_5() -> Unit raise {
  ignore(@lib.time(@complex_grobner.complex_arith, @term_syntax.parse_term("!(pow((c : Complex), 2) == pow((a : Complex), 2) + pow((b : Complex), 2) && pow(c, 2) == pow((x0 : Complex), 2) + pow((y0 : Complex) - b, 2) && y0 * (t1 : Complex) == a + x0 && y0 * (t2 : Complex) == a - x0 && (Cx(real_of_num(1)) - t1 * t2) * (t : Complex) == t1 + t2 && (u : Complex) * (b * t - a) == Cx(real_of_num(1)) && (v1 : Complex) * a + ((v2 : Complex) * x0 + (v3 : Complex) * y0) == Cx(real_of_num(1)))")))
}

///|
/// Complex/grobner_examples.ml:50
fn step_6() -> Unit raise {
  ignore(@lib.time(@complex_grobner.complex_arith, @term_syntax.parse_term("pow((c : Complex), 2) == pow((a : Complex), 2) + pow((b : Complex), 2) && pow(c, 2) == pow((x0 : Complex), 2) + pow((y0 : Complex) - b, 2) && y0 * (t1 : Complex) == a + x0 && y0 * (t2 : Complex) == a - x0 && (Cx(real_of_num(1)) - t1 * t2) * (t : Complex) == t1 + t2 && (!(a == Cx(real_of_num(0))) || !(x0 == Cx(real_of_num(0))) || !(y0 == Cx(real_of_num(0)))) → b * t == a")))
}

///|
/// Complex/grobner_examples.ml:59
fn step_7() -> Unit raise {
  ignore(@lib.time(@complex_grobner.complex_arith, @term_syntax.parse_term("pow((c : Complex), 2) == pow((a : Complex), 2) + pow((b : Complex), 2) && pow(c, 2) == pow((x0 : Complex), 2) + pow((y0 : Complex) - b, 2) && y0 * (t1 : Complex) == a + x0 && y0 * (t2 : Complex) == a - x0 && (Cx(real_of_num(1)) - t1 * t2) * (t : Complex) == t1 + t2 && !(a == Cx(real_of_num(0))) && !(x0 == Cx(real_of_num(0))) && !(y0 == Cx(real_of_num(0))) → b * t == a")))
}

///|
/// Complex/grobner_examples.ml:72
fn step_8() -> Unit raise {
  ignore(@lib.time(@complex_grobner.complex_arith, @term_syntax.parse_term("pow((x1 : Complex) - (x0 : Complex), 2) + pow((y1 : Complex) - (y0 : Complex), 2) == pow((x2 : Complex) - x0, 2) + pow((y2 : Complex) - y0, 2) && pow(x2 - x0, 2) + pow(y2 - y0, 2) == pow((x3 : Complex) - x0, 2) + pow((y3 : Complex) - y0, 2) && pow(x1 - (x0' : Complex), 2) + pow(y1 - (y0' : Complex), 2) == pow(x2 - x0', 2) + pow(y2 - y0', 2) && pow(x2 - x0', 2) + pow(y2 - y0', 2) == pow(x3 - x0', 2) + pow(y3 - y0', 2) && (a12 : Complex) * (x1 - x2) + (b12 : Complex) * (y1 - y2) == Cx(real_of_num(1)) && (a13 : Complex) * (x1 - x3) + (b13 : Complex) * (y1 - y3) == Cx(real_of_num(1)) && (a23 : Complex) * (x2 - x3) + (b23 : Complex) * (y2 - y3) == Cx(real_of_num(1)) && !(pow(x1 - x0, 2) + pow(y1 - y0, 2) == Cx(real_of_num(0))) → x0' == x0 && y0' == y0")))
}

///|
/// Complex/grobner_examples.ml:87
fn step_9() -> Unit raise {
  ignore(@lib.time(@complex_grobner.complex_arith, @term_syntax.parse_term("!(pow((x1 : Complex) - (x0 : Complex), 2) + pow((y1 : Complex) - (y0 : Complex), 2) == pow((x2 : Complex) - x0, 2) + pow((y2 : Complex) - y0, 2) && pow(x2 - x0, 2) + pow(y2 - y0, 2) == pow((x3 : Complex) - x0, 2) + pow((y3 : Complex) - y0, 2) && pow(x1 - (x0' : Complex), 2) + pow(y1 - (y0' : Complex), 2) == pow(x2 - x0', 2) + pow(y2 - y0', 2) && pow(x2 - x0', 2) + pow(y2 - y0', 2) == pow(x3 - x0', 2) + pow(y3 - y0', 2) && (a12 : Complex) * (x1 - x2) + (b12 : Complex) * (y1 - y2) == Cx(real_of_num(1)) && (a13 : Complex) * (x1 - x3) + (b13 : Complex) * (y1 - y3) == Cx(real_of_num(1)) && (a23 : Complex) * (x2 - x3) + (b23 : Complex) * (y2 - y3) == Cx(real_of_num(1)) && (z : Complex) * (x0' - x0) == Cx(real_of_num(1)) && (z' : Complex) * (y0' - y0) == Cx(real_of_num(1)) && (z'' : Complex) * (pow(x1 - x0, 2) + pow(y1 - y0, 2)) == Cx(real_of_num(1)) && (z''' : Complex) * (pow(x1 - (x09 : Complex), 2) + pow(y1 - (y09 : Complex), 2)) == Cx(real_of_num(1)))")))
}

///|
/// LAGRANGE_4
fn step_10() -> Unit raise {
  lagrange_4_c.set(@lib.time(@complex_grobner.complex_arith, @term_syntax.parse_term("(pow((x1 : Complex), 2) + (pow((x2 : Complex), 2) + (pow((x3 : Complex), 2) + pow((x4 : Complex), 2)))) * (pow((y1 : Complex), 2) + (pow((y2 : Complex), 2) + (pow((y3 : Complex), 2) + pow((y4 : Complex), 2)))) == pow(x1 * y1 - x2 * y2 - x3 * y3 - x4 * y4, 2) + (pow(x1 * y2 + x2 * y1 + x3 * y4 - x4 * y3, 2) + (pow(x1 * y3 - x2 * y4 + x3 * y1 + x4 * y2, 2) + pow(x1 * y4 + x2 * y3 - x3 * y2 + x4 * y1, 2)))")))
}

///|
let lagrange_4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LAGRANGE_4")

///|
/// `LAGRANGE_4`
pub fn lagrange_4() -> @kernel.Thm {
  lagrange_4_c.get()
}

///|
/// LAGRANGE_8
fn step_11() -> Unit raise {
  lagrange_8_c.set(@lib.time(@complex_grobner.complex_arith, @term_syntax.parse_term("(pow((p1 : Complex), 2) + (pow((q1 : Complex), 2) + (pow((r1 : Complex), 2) + (pow((s1 : Complex), 2) + (pow((t1 : Complex), 2) + (pow((u1 : Complex), 2) + (pow((v1 : Complex), 2) + pow((w1 : Complex), 2)))))))) * (pow((p2 : Complex), 2) + (pow((q2 : Complex), 2) + (pow((r2 : Complex), 2) + (pow((s2 : Complex), 2) + (pow((t2 : Complex), 2) + (pow((u2 : Complex), 2) + (pow((v2 : Complex), 2) + pow((w2 : Complex), 2)))))))) == pow(p1 * p2 - q1 * q2 - r1 * r2 - s1 * s2 - t1 * t2 - u1 * u2 - v1 * v2 - w1 * w2, 2) + (pow(p1 * q2 + (q1 * p2 + (r1 * s2 - s1 * r2 + (t1 * u2 - u1 * t2 - v1 * w2 + w1 * v2))), 2) + (pow(p1 * r2 - q1 * s2 + (r1 * p2 + (s1 * q2 + (t1 * v2 + (u1 * w2 - v1 * t2 - w1 * u2)))), 2) + (pow(p1 * s2 + (q1 * r2 - r1 * q2 + (s1 * p2 + (t1 * w2 - u1 * v2 + (v1 * u2 - w1 * t2)))), 2) + (pow(p1 * t2 - q1 * u2 - r1 * v2 - s1 * w2 + (t1 * p2 + (u1 * q2 + (v1 * r2 + w1 * s2))), 2) + (pow(p1 * u2 + (q1 * t2 - r1 * w2 + (s1 * v2 - t1 * q2 + (u1 * p2 - v1 * s2 + w1 * r2))), 2) + (pow(p1 * v2 + (q1 * w2 + (r1 * t2 - s1 * u2 - t1 * r2 + (u1 * s2 + (v1 * p2 - w1 * q2)))), 2) + pow(p1 * w2 - q1 * v2 + (r1 * u2 + (s1 * t2 - t1 * s2 - u1 * r2 + (v1 * q2 + w1 * p2))), 2)))))))")))
}

///|
let lagrange_8_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LAGRANGE_8")

///|
/// `LAGRANGE_8`
pub fn lagrange_8() -> @kernel.Thm {
  lagrange_8_c.get()
}

///|
/// LIOUVILLE
fn step_12() -> Unit raise {
  liouville_c.set(@lib.time(@complex_grobner.complex_arith, @term_syntax.parse_term("pow(pow((x1 : Complex), 2) + (pow((x2 : Complex), 2) + (pow((x3 : Complex), 2) + pow((x4 : Complex), 2))), 2) == Cx(real_of_num(1) / real_of_num(6)) * (pow(x1 + x2, 4) + (pow(x1 + x3, 4) + (pow(x1 + x4, 4) + (pow(x2 + x3, 4) + (pow(x2 + x4, 4) + pow(x3 + x4, 4)))))) + Cx(real_of_num(1) / real_of_num(6)) * (pow(x1 - x2, 4) + (pow(x1 - x3, 4) + (pow(x1 - x4, 4) + (pow(x2 - x3, 4) + (pow(x2 - x4, 4) + pow(x3 - x4, 4))))))")))
}

///|
let liouville_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIOUVILLE")

///|
/// `LIOUVILLE`
pub fn liouville() -> @kernel.Thm {
  liouville_c.get()
}

///|
/// FLECK
fn step_13() -> Unit raise {
  fleck_c.set(@lib.time(@complex_grobner.complex_arith, @term_syntax.parse_term("pow(pow((x1 : Complex), 2) + (pow((x2 : Complex), 2) + (pow((x3 : Complex), 2) + pow((x4 : Complex), 2))), 3) == Cx(real_of_num(1) / real_of_num(60)) * (pow(x1 + (x2 + x3), 6) + (pow(x1 + (x2 - x3), 6) + (pow(x1 - x2 + x3, 6) + (pow(x1 - x2 - x3, 6) + (pow(x1 + (x2 + x4), 6) + (pow(x1 + (x2 - x4), 6) + (pow(x1 - x2 + x4, 6) + (pow(x1 - x2 - x4, 6) + (pow(x1 + (x3 + x4), 6) + (pow(x1 + (x3 - x4), 6) + (pow(x1 - x3 + x4, 6) + (pow(x1 - x3 - x4, 6) + (pow(x2 + (x3 + x4), 6) + (pow(x2 + (x3 - x4), 6) + (pow(x2 - x3 + x4, 6) + pow(x2 - x3 - x4, 6)))))))))))))))) + (Cx(real_of_num(1) / real_of_num(30)) * (pow(x1 + x2, 6) + (pow(x1 - x2, 6) + (pow(x1 + x3, 6) + (pow(x1 - x3, 6) + (pow(x1 + x4, 6) + (pow(x1 - x4, 6) + (pow(x2 + x3, 6) + (pow(x2 - x3, 6) + (pow(x2 + x4, 6) + (pow(x2 - x4, 6) + (pow(x3 + x4, 6) + pow(x3 - x4, 6)))))))))))) + Cx(real_of_num(3) / real_of_num(5)) * (pow(x1, 6) + (pow(x2, 6) + (pow(x3, 6) + pow(x4, 6)))))")))
}

///|
let fleck_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLECK")

///|
/// `FLECK`
pub fn fleck() -> @kernel.Thm {
  fleck_c.get()
}

///|
/// HURWITZ
fn step_14() -> Unit raise {
  hurwitz_c.set(@lib.time(@complex_grobner.complex_arith, @term_syntax.parse_term("∀ x1 : Complex, ∀ x2 : Complex, ∀ x3 : Complex, ∀ x4 : Complex, pow(pow(x1, 2) + (pow(x2, 2) + (pow(x3, 2) + pow(x4, 2))), 4) == Cx(real_of_num(1) / real_of_num(840)) * (pow(x1 + (x2 + (x3 + x4)), 8) + (pow(x1 + (x2 + (x3 - x4)), 8) + (pow(x1 + (x2 - x3 + x4), 8) + (pow(x1 + (x2 - x3 - x4), 8) + (pow(x1 - x2 + (x3 + x4), 8) + (pow(x1 - x2 + (x3 - x4), 8) + (pow(x1 - x2 - x3 + x4, 8) + pow(x1 - x2 - x3 - x4, 8)))))))) + (Cx(real_of_num(1) / real_of_num(5040)) * (pow(Cx(real_of_num(2)) * x1 + (x2 + x3), 8) + (pow(Cx(real_of_num(2)) * x1 + (x2 - x3), 8) + (pow(Cx(real_of_num(2)) * x1 - x2 + x3, 8) + (pow(Cx(real_of_num(2)) * x1 - x2 - x3, 8) + (pow(Cx(real_of_num(2)) * x1 + (x2 + x4), 8) + (pow(Cx(real_of_num(2)) * x1 + (x2 - x4), 8) + (pow(Cx(real_of_num(2)) * x1 - x2 + x4, 8) + (pow(Cx(real_of_num(2)) * x1 - x2 - x4, 8) + (pow(Cx(real_of_num(2)) * x1 + (x3 + x4), 8) + (pow(Cx(real_of_num(2)) * x1 + (x3 - x4), 8) + (pow(Cx(real_of_num(2)) * x1 - x3 + x4, 8) + (pow(Cx(real_of_num(2)) * x1 - x3 - x4, 8) + (pow(Cx(real_of_num(2)) * x2 + (x3 + x4), 8) + (pow(Cx(real_of_num(2)) * x2 + (x3 - x4), 8) + (pow(Cx(real_of_num(2)) * x2 - x3 + x4, 8) + (pow(Cx(real_of_num(2)) * x2 - x3 - x4, 8) + (pow(x1 + (Cx(real_of_num(2)) * x2 + x3), 8) + (pow(x1 + (Cx(real_of_num(2)) * x2 - x3), 8) + (pow(x1 - Cx(real_of_num(2)) * x2 + x3, 8) + (pow(x1 - Cx(real_of_num(2)) * x2 - x3, 8) + (pow(x1 + (Cx(real_of_num(2)) * x2 + x4), 8) + (pow(x1 + (Cx(real_of_num(2)) * x2 - x4), 8) + (pow(x1 - Cx(real_of_num(2)) * x2 + x4, 8) + (pow(x1 - Cx(real_of_num(2)) * x2 - x4, 8) + (pow(x1 + (Cx(real_of_num(2)) * x3 + x4), 8) + (pow(x1 + (Cx(real_of_num(2)) * x3 - x4), 8) + (pow(x1 - Cx(real_of_num(2)) * x3 + x4, 8) + (pow(x1 - Cx(real_of_num(2)) * x3 - x4, 8) + (pow(x2 + (Cx(real_of_num(2)) * x3 + x4), 8) + (pow(x2 + (Cx(real_of_num(2)) * x3 - x4), 8) + (pow(x2 - Cx(real_of_num(2)) * x3 + x4, 8) + (pow(x2 - Cx(real_of_num(2)) * x3 - x4, 8) + (pow(x1 + (x2 + Cx(real_of_num(2)) * x3), 8) + (pow(x1 + (x2 - Cx(real_of_num(2)) * x3), 8) + (pow(x1 - x2 + Cx(real_of_num(2)) * x3, 8) + (pow(x1 - x2 - Cx(real_of_num(2)) * x3, 8) + (pow(x1 + (x2 + Cx(real_of_num(2)) * x4), 8) + (pow(x1 + (x2 - Cx(real_of_num(2)) * x4), 8) + (pow(x1 - x2 + Cx(real_of_num(2)) * x4, 8) + (pow(x1 - x2 - Cx(real_of_num(2)) * x4, 8) + (pow(x1 + (x3 + Cx(real_of_num(2)) * x4), 8) + (pow(x1 + (x3 - Cx(real_of_num(2)) * x4), 8) + (pow(x1 - x3 + Cx(real_of_num(2)) * x4, 8) + (pow(x1 - x3 - Cx(real_of_num(2)) * x4, 8) + (pow(x2 + (x3 + Cx(real_of_num(2)) * x4), 8) + (pow(x2 + (x3 - Cx(real_of_num(2)) * x4), 8) + (pow(x2 - x3 + Cx(real_of_num(2)) * x4, 8) + pow(x2 - x3 - Cx(real_of_num(2)) * x4, 8)))))))))))))))))))))))))))))))))))))))))))))))) + (Cx(real_of_num(1) / real_of_num(84)) * (pow(x1 + x2, 8) + (pow(x1 - x2, 8) + (pow(x1 + x3, 8) + (pow(x1 - x3, 8) + (pow(x1 + x4, 8) + (pow(x1 - x4, 8) + (pow(x2 + x3, 8) + (pow(x2 - x3, 8) + (pow(x2 + x4, 8) + (pow(x2 - x4, 8) + (pow(x3 + x4, 8) + pow(x3 - x4, 8)))))))))))) + Cx(real_of_num(1) / real_of_num(840)) * (pow(Cx(real_of_num(2)) * x1, 8) + (pow(Cx(real_of_num(2)) * x2, 8) + (pow(Cx(real_of_num(2)) * x3, 8) + pow(Cx(real_of_num(2)) * x4, 8))))))")))
}

///|
let hurwitz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HURWITZ")

///|
/// `HURWITZ`
pub fn hurwitz() -> @kernel.Thm {
  hurwitz_c.get()
}

///|
/// SCHUR
fn step_15() -> Unit raise {
  schur_c.set(@lib.time(@complex_grobner.complex_arith, @term_syntax.parse_term("Cx(real_of_num(22680)) * pow(pow((x1 : Complex), 2) + (pow((x2 : Complex), 2) + (pow((x3 : Complex), 2) + pow((x4 : Complex), 2))), 5) == Cx(real_of_num(9)) * (pow(Cx(real_of_num(2)) * x1, 10) + (pow(Cx(real_of_num(2)) * x2, 10) + (pow(Cx(real_of_num(2)) * x3, 10) + pow(Cx(real_of_num(2)) * x4, 10)))) + (Cx(real_of_num(180)) * (pow(x1 + x2, 10) + (pow(x1 - x2, 10) + (pow(x1 + x3, 10) + (pow(x1 - x3, 10) + (pow(x1 + x4, 10) + (pow(x1 - x4, 10) + (pow(x2 + x3, 10) + (pow(x2 - x3, 10) + (pow(x2 + x4, 10) + (pow(x2 - x4, 10) + (pow(x3 + x4, 10) + pow(x3 - x4, 10)))))))))))) + (pow(Cx(real_of_num(2)) * x1 + (x2 + x3), 10) + (pow(Cx(real_of_num(2)) * x1 + (x2 - x3), 10) + (pow(Cx(real_of_num(2)) * x1 - x2 + x3, 10) + (pow(Cx(real_of_num(2)) * x1 - x2 - x3, 10) + (pow(Cx(real_of_num(2)) * x1 + (x2 + x4), 10) + (pow(Cx(real_of_num(2)) * x1 + (x2 - x4), 10) + (pow(Cx(real_of_num(2)) * x1 - x2 + x4, 10) + (pow(Cx(real_of_num(2)) * x1 - x2 - x4, 10) + (pow(Cx(real_of_num(2)) * x1 + (x3 + x4), 10) + (pow(Cx(real_of_num(2)) * x1 + (x3 - x4), 10) + (pow(Cx(real_of_num(2)) * x1 - x3 + x4, 10) + (pow(Cx(real_of_num(2)) * x1 - x3 - x4, 10) + (pow(Cx(real_of_num(2)) * x2 + (x3 + x4), 10) + (pow(Cx(real_of_num(2)) * x2 + (x3 - x4), 10) + (pow(Cx(real_of_num(2)) * x2 - x3 + x4, 10) + (pow(Cx(real_of_num(2)) * x2 - x3 - x4, 10) + (pow(x1 + (Cx(real_of_num(2)) * x2 + x3), 10) + (pow(x1 + (Cx(real_of_num(2)) * x2 - x3), 10) + (pow(x1 - Cx(real_of_num(2)) * x2 + x3, 10) + (pow(x1 - Cx(real_of_num(2)) * x2 - x3, 10) + (pow(x1 + (Cx(real_of_num(2)) * x2 + x4), 10) + (pow(x1 + (Cx(real_of_num(2)) * x2 - x4), 10) + (pow(x1 - Cx(real_of_num(2)) * x2 + x4, 10) + (pow(x1 - Cx(real_of_num(2)) * x2 - x4, 10) + (pow(x1 + (Cx(real_of_num(2)) * x3 + x4), 10) + (pow(x1 + (Cx(real_of_num(2)) * x3 - x4), 10) + (pow(x1 - Cx(real_of_num(2)) * x3 + x4, 10) + (pow(x1 - Cx(real_of_num(2)) * x3 - x4, 10) + (pow(x2 + (Cx(real_of_num(2)) * x3 + x4), 10) + (pow(x2 + (Cx(real_of_num(2)) * x3 - x4), 10) + (pow(x2 - Cx(real_of_num(2)) * x3 + x4, 10) + (pow(x2 - Cx(real_of_num(2)) * x3 - x4, 10) + (pow(x1 + (x2 + Cx(real_of_num(2)) * x3), 10) + (pow(x1 + (x2 - Cx(real_of_num(2)) * x3), 10) + (pow(x1 - x2 + Cx(real_of_num(2)) * x3, 10) + (pow(x1 - x2 - Cx(real_of_num(2)) * x3, 10) + (pow(x1 + (x2 + Cx(real_of_num(2)) * x4), 10) + (pow(x1 + (x2 - Cx(real_of_num(2)) * x4), 10) + (pow(x1 - x2 + Cx(real_of_num(2)) * x4, 10) + (pow(x1 - x2 - Cx(real_of_num(2)) * x4, 10) + (pow(x1 + (x3 + Cx(real_of_num(2)) * x4), 10) + (pow(x1 + (x3 - Cx(real_of_num(2)) * x4), 10) + (pow(x1 - x3 + Cx(real_of_num(2)) * x4, 10) + (pow(x1 - x3 - Cx(real_of_num(2)) * x4, 10) + (pow(x2 + (x3 + Cx(real_of_num(2)) * x4), 10) + (pow(x2 + (x3 - Cx(real_of_num(2)) * x4), 10) + (pow(x2 - x3 + Cx(real_of_num(2)) * x4, 10) + pow(x2 - x3 - Cx(real_of_num(2)) * x4, 10))))))))))))))))))))))))))))))))))))))))))))))) + Cx(real_of_num(9)) * (pow(x1 + (x2 + (x3 + x4)), 10) + (pow(x1 + (x2 + (x3 - x4)), 10) + (pow(x1 + (x2 - x3 + x4), 10) + (pow(x1 + (x2 - x3 - x4), 10) + (pow(x1 - x2 + (x3 + x4), 10) + (pow(x1 - x2 + (x3 - x4), 10) + (pow(x1 - x2 - x3 + x4, 10) + pow(x1 - x2 - x3 - x4, 10))))))))))")))
}

///|
let schur_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SCHUR")

///|
/// `SCHUR`
pub fn schur() -> @kernel.Thm {
  schur_c.get()
}

///|
/// Complex/grobner_examples.ml:295
fn step_16() -> Unit raise {
  ignore(@lib.time(@complex_grobner.complex_arith, @term_syntax.parse_term("(x1 : Complex) == (u3 : Complex) && x1 * ((u2 : Complex) - (u1 : Complex)) == (x2 : Complex) * u3 && (x4 : Complex) * (x2 - u1) == x1 * ((x3 : Complex) - u1) && x3 * u3 == x4 * u2 && !(u1 == Cx(real_of_num(0))) && !(u3 == Cx(real_of_num(0))) → pow(x3, 2) + pow(x4, 2) == pow(u2 - x3, 2) + pow(u3 - x4, 2)")))
}

///|
/// Complex/grobner_examples.ml:308
fn step_17() -> Unit raise {
  ignore(@lib.time(@complex_grobner.complex_arith, @term_syntax.parse_term("(u1 : Complex) * (x1 : Complex) - u1 * (u3 : Complex) == Cx(real_of_num(0)) && u3 * (x2 : Complex) - ((u2 : Complex) - u1) * x1 == Cx(real_of_num(0)) && x1 * (x4 : Complex) - (x2 - u1) * (x3 : Complex) - u1 * x1 == Cx(real_of_num(0)) && u3 * x4 - u2 * x3 == Cx(real_of_num(0)) && !(u1 == Cx(real_of_num(0))) && !(u3 == Cx(real_of_num(0))) → Cx(real_of_num(2)) * (u2 * x4) + (Cx(real_of_num(2)) * (u3 * x3) - pow(u3, 2) - pow(u2, 2)) == Cx(real_of_num(0))")))
}

///|
/// Complex/grobner_examples.ml:321
fn step_18() -> Unit raise {
  ignore(@lib.time(@complex_grobner.complex_arith, @term_syntax.parse_term("(y1 : Complex) * (y3 : Complex) + (x1 : Complex) * (x3 : Complex) == Cx(real_of_num(0)) && y3 * ((y2 : Complex) - y3) + ((x2 : Complex) - x3) * x3 == Cx(real_of_num(0)) && !(x3 == Cx(real_of_num(0))) && !(y3 == Cx(real_of_num(0))) → y1 * (x2 - x3) == x1 * (y2 - y3)")))
}

///|
/// Complex/grobner_examples.ml:332
fn step_19() -> Unit raise {
  ignore(@lib.time(@complex_grobner.complex_arith, @term_syntax.parse_term("Cx(real_of_num(2)) * ((u2 : Complex) * (x2 : Complex)) + (Cx(real_of_num(2)) * ((u3 : Complex) * (x1 : Complex)) - pow(u3, 2) - pow(u2, 2)) == Cx(real_of_num(0)) && Cx(real_of_num(2)) * ((u1 : Complex) * x2) - pow(u1, 2) == Cx(real_of_num(0)) && -pow((x3 : Complex), 2) + (Cx(real_of_num(2)) * (x2 * x3) + (Cx(real_of_num(2)) * ((u4 : Complex) * x1) - pow(u4, 2))) == Cx(real_of_num(0)) && u3 * (x5 : Complex) + ((-u2 + u1) * (x4 : Complex) - u1 * u3) == Cx(real_of_num(0)) && (u2 - u1) * x5 + (u3 * x4 + ((-u2 + u1) * x3 - u3 * u4)) == Cx(real_of_num(0)) && u3 * (x7 : Complex) - u2 * (x6 : Complex) == Cx(real_of_num(0)) && u2 * x7 + (u3 * x6 - u2 * x3 - u3 * u4) == Cx(real_of_num(0)) && !(Cx(real_of_num(4)) * (u1 * u3) == Cx(real_of_num(0))) && !(Cx(real_of_num(2)) * u1 == Cx(real_of_num(0))) && !(-pow(u3, 2) - pow(u2, 2) + (Cx(real_of_num(2)) * (u1 * u2) - pow(u1, 2)) == Cx(real_of_num(0))) && !(u3 == Cx(real_of_num(0))) && !(-pow(u3, 2) - pow(u2, 2) == Cx(real_of_num(0))) && !(u2 == Cx(real_of_num(0))) → x4 * x7 + ((-x5 + x3) * x6 - x3 * x4) == Cx(real_of_num(0))")))
}

///|
/// det3
fn step_20() -> Unit raise {
  det3_c.set(@pair.new_definition(@term_syntax.parse_term("(det3 : ((Complex, Complex, Complex, Complex, Complex, Complex, Complex, Complex, Complex)) -> Complex)(((a11 : Complex), (a12 : Complex), (a13 : Complex), (a21 : Complex), (a22 : Complex), (a23 : Complex), (a31 : Complex), (a32 : Complex), (a33 : Complex))) == a11 * (a22 * a33 - a32 * a23) - a12 * (a21 * a33 - a31 * a23) + a13 * (a21 * a32 - a31 * a22)")))
}

///|
let det3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("det3")

///|
/// `det3`
pub fn det3() -> @kernel.Thm {
  det3_c.get()
}

///|
/// DET_TRANSPOSE
fn step_21() -> Unit raise {
  let t2 = @tactics.conv_tac((x1 : @kernel.Term) => @lib.time(@complex_grobner.complex_arith, x1))
  let t3 = @tactics.then_tac(@simp.rewrite_tac(@list.List([det3()])), t2)
  det_transpose_c.set(@tactics.prove(@term_syntax.parse_term("det3(((a1 : Complex), (b1 : Complex), (c1 : Complex), (a2 : Complex), (b2 : Complex), (c2 : Complex), (a3 : Complex), (b3 : Complex), (c3 : Complex))) == det3((a1, a2, a3, b1, b2, b3, c1, c2, c3))"), t3))
}

///|
let det_transpose_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DET_TRANSPOSE")

///|
/// `DET_TRANSPOSE`
pub fn det_transpose() -> @kernel.Thm {
  det_transpose_c.get()
}

///|
/// sdet3
fn step_22() -> Unit raise {
  sdet3_c.set(@pair.new_definition(@term_syntax.parse_term("(sdet3 : (((Complex, Complex), (Complex, Complex), Complex, Complex)) -> Complex)(((p : (Complex, Complex)), (q : (Complex, Complex)), (r : (Complex, Complex)))) == det3((FST(p), SND(p), Cx(real_of_num(1)), FST(q), SND(q), Cx(real_of_num(1)), FST(r), SND(r), Cx(real_of_num(1))))")))
}

///|
let sdet3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("sdet3")

///|
/// `sdet3`
pub fn sdet3() -> @kernel.Thm {
  sdet3_c.get()
}

///|
/// SDET3_PERMUTE_1
fn step_23() -> Unit raise {
  let t5 = @tactics.conv_tac((x4 : @kernel.Term) => @lib.time(@complex_grobner.complex_arith, x4))
  let t6 = @tactics.then_tac(@simp.rewrite_tac(@list.List([sdet3(), det3()])), t5)
  sdet3_permute_1_c.set(@tactics.prove(@term_syntax.parse_term("sdet3(((p : (Complex, Complex)), (q : (Complex, Complex)), (r : (Complex, Complex)))) == sdet3((q, r, p))"), t6))
}

///|
let sdet3_permute_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SDET3_PERMUTE_1")

///|
/// `SDET3_PERMUTE_1`
pub fn sdet3_permute_1() -> @kernel.Thm {
  sdet3_permute_1_c.get()
}

///|
/// SDET3_PERMUTE_2
fn step_24() -> Unit raise {
  let t8 = @tactics.conv_tac((x7 : @kernel.Term) => @lib.time(@complex_grobner.complex_arith, x7))
  let t9 = @tactics.then_tac(@simp.rewrite_tac(@list.List([sdet3(), det3()])), t8)
  sdet3_permute_2_c.set(@tactics.prove(@term_syntax.parse_term("sdet3(((p : (Complex, Complex)), (q : (Complex, Complex)), (r : (Complex, Complex)))) == -sdet3((p, r, q))"), t9))
}

///|
let sdet3_permute_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SDET3_PERMUTE_2")

///|
/// `SDET3_PERMUTE_2`
pub fn sdet3_permute_2() -> @kernel.Thm {
  sdet3_permute_2_c.get()
}

///|
/// SDET_SUM
fn step_25() -> Unit raise {
  let t11 = @tactics.conv_tac((x10 : @kernel.Term) => @lib.time(@complex_grobner.complex_arith, x10))
  let t12 = @tactics.then_tac(@simp.rewrite_tac(@list.List([sdet3(), det3()])), t11)
  sdet_sum_c.set(@tactics.prove(@term_syntax.parse_term("sdet3(((p : (Complex, Complex)), (q : (Complex, Complex)), (r : (Complex, Complex)))) - sdet3(((t : (Complex, Complex)), q, r)) - sdet3((p, t, r)) - sdet3((p, q, t)) == Cx(real_of_num(0))"), t12))
}

///|
let sdet_sum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SDET_SUM")

///|
/// `SDET_SUM`
pub fn sdet_sum() -> @kernel.Thm {
  sdet_sum_c.get()
}

///|
/// SDET_CRAMER
fn step_26() -> Unit raise {
  let t14 = @tactics.conv_tac((x13 : @kernel.Term) => @lib.time(@complex_grobner.complex_arith, x13))
  let t15 = @tactics.then_tac(@simp.rewrite_tac(@list.List([sdet3(), det3()])), t14)
  sdet_cramer_c.set(@tactics.prove(@term_syntax.parse_term("sdet3(((s : (Complex, Complex)), (t : (Complex, Complex)), (q : (Complex, Complex)))) * sdet3((t, (p : (Complex, Complex)), (r : (Complex, Complex)))) == sdet3((t, q, r)) * sdet3((s, t, p)) + sdet3((t, p, q)) * sdet3((s, t, r))"), t15))
}

///|
let sdet_cramer_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SDET_CRAMER")

///|
/// `SDET_CRAMER`
pub fn sdet_cramer() -> @kernel.Thm {
  sdet_cramer_c.get()
}

///|
/// SDET_NZ
fn step_27() -> Unit raise {
  let t17 = @tactics.conv_tac((x16 : @kernel.Term) => @lib.time(@complex_grobner.complex_arith, x16))
  let t18 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@pair.forall_pair_thm(), @pair.pair_eq(), sdet3(), det3()])), t17)
  sdet_nz_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (Complex, Complex), ∀ q : (Complex, Complex), ∀ r : (Complex, Complex), !(sdet3((p, q, r)) == Cx(real_of_num(0))) → !(p == q) && !(q == r) && !(r == p)"), t18))
}

///|
let sdet_nz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SDET_NZ")

///|
/// `SDET_NZ`
pub fn sdet_nz() -> @kernel.Thm {
  sdet_nz_c.get()
}

///|
/// SDET_LINCOMB
fn step_28() -> Unit raise {
  let t20 = @tactics.conv_tac((x19 : @kernel.Term) => @lib.time(@complex_grobner.complex_arith, x19))
  let t21 = @tactics.then_tac(@simp.rewrite_tac(@list.List([sdet3(), det3()])), t20)
  sdet_lincomb_c.set(@tactics.prove(@term_syntax.parse_term("FST((p : (Complex, Complex))) * sdet3(((i : (Complex, Complex)), (j : (Complex, Complex)), (k : (Complex, Complex)))) == FST(i) * sdet3((j, k, p)) + (FST(j) * sdet3((k, i, p)) + FST(k) * sdet3((i, j, p))) && SND(p) * sdet3((i, j, k)) == SND(i) * sdet3((j, k, p)) + (SND(j) * sdet3((k, i, p)) + SND(k) * sdet3((i, j, p)))"), t21))
}

///|
let sdet_lincomb_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SDET_LINCOMB")

///|
/// `SDET_LINCOMB`
pub fn sdet_lincomb() -> @kernel.Thm {
  sdet_lincomb_c.get()
}

///|
/// Complex/grobner_examples.ml:425
fn step_29() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// collinear
fn step_30() -> Unit raise {
  collinear_c.set(@pair.new_definition(@term_syntax.parse_term("(collinear : ((Real, Real), (Real, Real), (Real, Real)) -> Bool)((a : (Real, Real)), (b : (Real, Real)), (c : (Real, Real))) == ((FST(a) - FST(b)) * (SND(b) - SND(c)) == (SND(a) - SND(b)) * (FST(b) - FST(c)))")))
}

///|
let collinear_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("collinear")

///|
/// `collinear`
pub fn collinear() -> @kernel.Thm {
  collinear_c.get()
}

///|
/// parallel
fn step_31() -> Unit raise {
  parallel_c.set(@pair.new_definition(@term_syntax.parse_term("(parallel : (((Real, Real), Real, Real), ((Real, Real), Real, Real)) -> Bool)(((a : (Real, Real)), (b : (Real, Real))), ((c : (Real, Real)), (d : (Real, Real)))) == ((FST(a) - FST(b)) * (SND(c) - SND(d)) == (SND(a) - SND(b)) * (FST(c) - FST(d)))")))
}

///|
let parallel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("parallel")

///|
/// `parallel`
pub fn parallel() -> @kernel.Thm {
  parallel_c.get()
}

///|
/// perpendicular
fn step_32() -> Unit raise {
  perpendicular_c.set(@pair.new_definition(@term_syntax.parse_term("(perpendicular : (((Real, Real), Real, Real), ((Real, Real), Real, Real)) -> Bool)(((a : (Real, Real)), (b : (Real, Real))), ((c : (Real, Real)), (d : (Real, Real)))) == ((FST(a) - FST(b)) * (FST(c) - FST(d)) + (SND(a) - SND(b)) * (SND(c) - SND(d)) == real_of_num(0))")))
}

///|
let perpendicular_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("perpendicular")

///|
/// `perpendicular`
pub fn perpendicular() -> @kernel.Thm {
  perpendicular_c.get()
}

///|
/// oncircle_with_diagonal
fn step_33() -> Unit raise {
  oncircle_with_diagonal_c.set(@pair.new_definition(@term_syntax.parse_term("(oncircle_with_diagonal : ((Real, Real), ((Real, Real), Real, Real)) -> Bool)((a : (Real, Real)), ((b : (Real, Real)), (c : (Real, Real)))) == perpendicular((b, a), (c, a))")))
}

///|
let oncircle_with_diagonal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("oncircle_with_diagonal")

///|
/// `oncircle_with_diagonal`
pub fn oncircle_with_diagonal() -> @kernel.Thm {
  oncircle_with_diagonal_c.get()
}

///|
/// length
fn step_34() -> Unit raise {
  length_c.set(@pair.new_definition(@term_syntax.parse_term("(length : (((Real, Real), Real, Real)) -> Real)(((a : (Real, Real)), (b : (Real, Real)))) == sqrt(pow(FST(a) - FST(b), 2) + pow(SND(a) - SND(b), 2))")))
}

///|
let length_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("length")

///|
/// `length`
pub fn length() -> @kernel.Thm {
  length_c.get()
}

///|
/// lengths_eq
fn step_35() -> Unit raise {
  lengths_eq_c.set(@pair.new_definition(@term_syntax.parse_term("(lengths_eq : (((Real, Real), Real, Real), ((Real, Real), Real, Real)) -> Bool)(((a : (Real, Real)), (b : (Real, Real))), ((c : (Real, Real)), (d : (Real, Real)))) == (pow(FST(a) - FST(b), 2) + pow(SND(a) - SND(b), 2) == pow(FST(c) - FST(d), 2) + pow(SND(c) - SND(d), 2))")))
}

///|
let lengths_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("lengths_eq")

///|
/// `lengths_eq`
pub fn lengths_eq() -> @kernel.Thm {
  lengths_eq_c.get()
}

///|
/// is_midpoint
fn step_36() -> Unit raise {
  is_midpoint_c.set(@pair.new_definition(@term_syntax.parse_term("(is_midpoint : ((Real, Real), ((Real, Real), Real, Real)) -> Bool)((b : (Real, Real)), ((a : (Real, Real)), (c : (Real, Real)))) == (real_of_num(2) * FST(b) == FST(a) + FST(c) && real_of_num(2) * SND(b) == SND(a) + SND(c))")))
}

///|
let is_midpoint_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_midpoint")

///|
/// `is_midpoint`
pub fn is_midpoint() -> @kernel.Thm {
  is_midpoint_c.get()
}

///|
/// is_intersection
fn step_37() -> Unit raise {
  is_intersection_c.set(@pair.new_definition(@term_syntax.parse_term("(is_intersection : ((Real, Real), ((Real, Real), Real, Real), ((Real, Real), Real, Real)) -> Bool)((p : (Real, Real)), ((a : (Real, Real)), (b : (Real, Real))), ((c : (Real, Real)), (d : (Real, Real)))) == (collinear(a, p, b) && collinear(c, p, d))")))
}

///|
let is_intersection_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_intersection")

///|
/// `is_intersection`
pub fn is_intersection() -> @kernel.Thm {
  is_intersection_c.get()
}

///|
/// isotropic
fn step_38() -> Unit raise {
  isotropic_c.set(@pair.new_definition(@term_syntax.parse_term("(isotropic : (((Real, Real), Real, Real)) -> Bool)(((a : (Real, Real)), (b : (Real, Real)))) == perpendicular((a, b), (a, b))")))
}

///|
let isotropic_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("isotropic")

///|
/// `isotropic`
pub fn isotropic() -> @kernel.Thm {
  isotropic_c.get()
}

///|
/// distinctpairs
fn step_39() -> Unit raise {
  distinctpairs_c.set(@pair.new_definition(@term_syntax.parse_term("(distinctpairs : (List[((Real, Real), Real, Real)]) -> Bool)((pprs : List[((Real, Real), Real, Real)])) == !(ITLIST(GABS((f : (((Real, Real), Real, Real), Real) -> Real) => ∀ a : (Real, Real), ∀ b : (Real, Real), GEQ(f((a, b)), (pr : Real) => (pow(FST(a) - FST(b), 2) + pow(SND(a) - SND(b), 2)) * pr)), pprs, real_of_num(1)) == real_of_num(0))")))
}

///|
let distinctpairs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("distinctpairs")

///|
/// `distinctpairs`
pub fn distinctpairs() -> @kernel.Thm {
  distinctpairs_c.get()
}

///|
/// EXPAND_COORDS_TAC
fn step_40() -> Unit raise {
  let complex2_ty = @term_syntax.parse_type("(Real, Real)")
  expand_coords_tac_c.set(fn(x22 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    let (asl, w) = x22
    let fvs = @lib.filter(fn(x23 : @kernel.Term) -> Bool raise {
      let v = x23
      (@kernel.type_of(v) == complex2_ty)
    }, @kernel.frees(w))
    let t30 = @tactics.repeat_tac(@tactics.gen_tac)
    let t29 = @simp.gen_rewrite_tac(fn(x26 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s27 = @equal.depth_conv(x26)
      fn(x28 : @kernel.Term) -> @kernel.Thm raise {
        s27(x28)
      }
    }, @list.List([@pair.forall_pair_thm(), @pair.exists_pair_thm()]))
    @tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x24 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let v_1 = x24
      @tactics.spec_tac(v_1, v_1)
    }, fvs), t29), t30)((asl, w))
  })
}

///|
let expand_coords_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("EXPAND_COORDS_TAC")

///|
/// `EXPAND_COORDS_TAC`
pub fn expand_coords_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (expand_coords_tac_c.get())(x)
}

///|
/// PAIR_BETA_THM
fn step_41() -> Unit raise {
  let t31 = @tactics.then_tac(@tactics.conv_tac(@equal.land_conv(@pair.gen_beta_conv)), @tactics.refl_tac)
  pair_beta_thm_c.set(@tactics.prove(@term_syntax.parse_term("GABS((f : ((_, _)) -> _) => ∀ x : _, ∀ y : _, GEQ(f((x, y)), (P : (_, _) -> _)(x, y)), ((a : _), (b : _))) == P(a, b)"), t31))
}

///|
let pair_beta_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PAIR_BETA_THM")

///|
/// `PAIR_BETA_THM`
pub fn pair_beta_thm() -> @kernel.Thm {
  pair_beta_thm_c.get()
}

///|
/// GEOM_TAC
fn step_42() -> Unit raise {
  geom_tac_c.set(@tactics.then_tac(expand_coords_tac, @simp.gen_rewrite_tac(fn(x32 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s33 = @equal.top_depth_conv(x32)
    fn(x34 : @kernel.Term) -> @kernel.Thm raise {
      s33(x34)
    }
  }, @list.List([collinear(), parallel(), perpendicular(), oncircle_with_diagonal(), length(), lengths_eq(), is_midpoint(), is_intersection(), distinctpairs(), isotropic(), @lists.itlist(), pair_beta_thm(), @theorems.beta_thm(), @pair.pair_eq(), @pair.fst(), @pair.snd()]))))
}

///|
let geom_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("GEOM_TAC")

///|
/// `GEOM_TAC`
pub fn geom_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (geom_tac_c.get())(x)
}

///|
/// CENTROID
fn step_43() -> Unit raise {
  let t36 = @tactics.then_tac(geom_tac, @tactics.conv_tac(@complex_real.grobner_real_arith))
  centroid_c.set(@lib.time(fn(x35 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x35.0, x35.1)
  }, (@term_syntax.parse_term("is_midpoint((d : (Real, Real)), ((b : (Real, Real)), (c : (Real, Real)))) && is_midpoint((e : (Real, Real)), ((a : (Real, Real)), c)) && is_midpoint((f : (Real, Real)), (a, b)) && is_intersection((m : (Real, Real)), (b, e), (a, d)) → collinear(c, f, m)"), t36)))
}

///|
let centroid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CENTROID")

///|
/// `CENTROID`
pub fn centroid() -> @kernel.Thm {
  centroid_c.get()
}

///|
/// GAUSS
fn step_44() -> Unit raise {
  let t38 = @tactics.then_tac(geom_tac, @tactics.conv_tac(@complex_real.grobner_real_arith))
  gauss_c.set(@lib.time(fn(x37 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x37.0, x37.1)
  }, (@term_syntax.parse_term("collinear((x : (Real, Real)), (a0 : (Real, Real)), (a3 : (Real, Real))) && collinear(x, (a1 : (Real, Real)), (a2 : (Real, Real))) && collinear((y : (Real, Real)), a2, a3) && collinear(y, a1, a0) && is_midpoint((m1 : (Real, Real)), (a1, a3)) && is_midpoint((m2 : (Real, Real)), (a0, a2)) && is_midpoint((m3 : (Real, Real)), (x, y)) → collinear(m1, m2, m3)"), t38)))
}

///|
let gauss_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GAUSS")

///|
/// `GAUSS`
pub fn gauss() -> @kernel.Thm {
  gauss_c.get()
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
}
