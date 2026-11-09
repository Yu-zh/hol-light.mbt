// Formal_ineqs/trig/matan.hl in its directory's load order: the test block of
// formal_ineqs/trig/matan/matan_ref_test.mbt (tools/ocaml_ref/chain_test.py), with the same golden
// (tools/ocaml_ref/Formal_ineqs_trig_matan_ref.expected).

///|
test "Formal_ineqs/trig/matan matches Formal_ineqs/trig/matan.ml" {
  @testkit.release_output()
  @matan.load()
  let log = @testkit.Log::new()
  log.capture_reports()
  for th in ["Formal_ineqs/trig/matan"] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("Formal_ineqs/trig/matan")
  log.capture_stdout()
  // BEGIN generated theorem list
  log.attempt("Matan.matan", () => sthm(@matan.matan()))
  log.attempt("Matan.dmatan", () => sthm(@matan.dmatan()))
  log.attempt("Matan.ddmatan", () => sthm(@matan.ddmatan()))
  log.attempt("Matan.log_matan_series", () => sthm(@matan.log_matan_series()))
  log.attempt("Matan.matan_power_series", () => {
    sthm(@matan.matan_power_series())
  })
  log.attempt("Matan.matan_abs1_bound", () => sthm(@matan.matan_abs1_bound()))
  log.attempt("Matan.matan_has_derivative_gt0", () => {
    sthm(@matan.matan_has_derivative_gt0())
  })
  log.attempt("Matan.matan_real_derivative_gt0", () => {
    sthm(@matan.matan_real_derivative_gt0())
  })
  log.attempt("Matan.matan_real_derivative_abs1", () => {
    sthm(@matan.matan_real_derivative_abs1())
  })
  log.attempt("Matan.matan_real_derivative_abs1_bound", () => {
    sthm(@matan.matan_real_derivative_abs1_bound())
  })
  log.attempt("Matan.matan_has_derivative2_gt0", () => {
    sthm(@matan.matan_has_derivative2_gt0())
  })
  log.attempt("Matan.matan_second_derivative_gt0", () => {
    sthm(@matan.matan_second_derivative_gt0())
  })
  log.attempt("Matan.matan_second_derivative_abs1", () => {
    sthm(@matan.matan_second_derivative_abs1())
  })
  log.attempt("Matan.matan_second_derivative_abs1_alt", () => {
    sthm(@matan.matan_second_derivative_abs1_alt())
  })
  log.attempt("Matan.matan_d2_bound_ge1_high", () => {
    sthm(@matan.matan_d2_bound_ge1_high())
  })
  log.attempt("Matan.matan_d2_bound_ge1_low", () => {
    sthm(@matan.matan_d2_bound_ge1_low())
  })
  log.attempt("Matan.matan_d2_bound_01", () => sthm(@matan.matan_d2_bound_01()))
  log.attempt("Matan.matan_d2_bound_neg_low", () => {
    sthm(@matan.matan_d2_bound_neg_low())
  })
  log.attempt("Matan.matan_d2_bound_neg_high", () => {
    sthm(@matan.matan_d2_bound_neg_high())
  })
  log.attempt("Matan.matan_d2_bound", () => sthm(@matan.matan_d2_bound()))
  // END generated theorem list
  let tm = @term_syntax.parse_term
  log.attempt("types", () => {
    @kernel.types().map(p => p.0 + "/" + p.1.to_string()).to_array().join(" ")
  })
  log.attempt("constants", () => {
    @kernel.constants().map(c => c.0).to_array().join(" ")
  })
  log.attempt("definitions", () => @kernel.definitions().length().to_string())
  // BEGIN EXTRA
  // END EXTRA
  log.probe_counters()
  @testkit.check_axioms()
  inspect(
    @testkit.normalize_times(log.contents()),
    content=(
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|5 basis elements and 5 critical pairs
      #|6 basis elements and 7 critical pairs
      #|6 basis elements and 6 critical pairs
      #|6 basis elements and 5 critical pairs
      #|7 basis elements and 6 critical pairs
      #|8 basis elements and 8 critical pairs
      #|9 basis elements and 11 critical pairs
      #|9 basis elements and 10 critical pairs
      #|10 basis elements and 12 critical pairs
      #|10 basis elements and 11 critical pairs
      #|11 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|5 basis elements and 5 critical pairs
      #|6 basis elements and 7 critical pairs
      #|6 basis elements and 6 critical pairs
      #|7 basis elements and 7 critical pairs
      #|7 basis elements and 6 critical pairs
      #|8 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|4 basis elements and 0 critical pairs
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|5 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|5 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|5 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|4 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|6 basis elements and 6 critical pairs
      #|6 basis elements and 5 critical pairs
      #|6 basis elements and 4 critical pairs
      #|6 basis elements and 3 critical pairs
      #|6 basis elements and 2 critical pairs
      #|6 basis elements and 1 critical pairs
      #|6 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|6 basis elements and 1 critical pairs
      #|7 basis elements and 1 critical pairs
      #|7 basis elements and 0 critical pairs
      #|4 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|7 basis elements and 9 critical pairs
      #|8 basis elements and 10 critical pairs
      #|8 basis elements and 9 critical pairs
      #|9 basis elements and 10 critical pairs
      #|9 basis elements and 9 critical pairs
      #|9 basis elements and 8 critical pairs
      #|10 basis elements and 11 critical pairs
      #|10 basis elements and 10 critical pairs
      #|10 basis elements and 9 critical pairs
      #|10 basis elements and 8 critical pairs
      #|10 basis elements and 7 critical pairs
      #|11 basis elements and 9 critical pairs
      #|11 basis elements and 8 critical pairs
      #|11 basis elements and 7 critical pairs
      #|11 basis elements and 6 critical pairs
      #|12 basis elements and 6 critical pairs
      #|12 basis elements and 5 critical pairs
      #|13 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|4 basis elements and 1 critical pairs
      #|4 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|5 basis elements and 2 critical pairs
      #|5 basis elements and 1 critical pairs
      #|5 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|5 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|1 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|5 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|6 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|4 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|7 basis elements and 10 critical pairs
      #|7 basis elements and 9 critical pairs
      #|7 basis elements and 8 critical pairs
      #|7 basis elements and 7 critical pairs
      #|7 basis elements and 6 critical pairs
      #|7 basis elements and 5 critical pairs
      #|7 basis elements and 4 critical pairs
      #|7 basis elements and 3 critical pairs
      #|7 basis elements and 2 critical pairs
      #|7 basis elements and 1 critical pairs
      #|7 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|7 basis elements and 1 critical pairs
      #|8 basis elements and 1 critical pairs
      #|8 basis elements and 0 critical pairs
      #|4 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|8 basis elements and 13 critical pairs
      #|9 basis elements and 13 critical pairs
      #|9 basis elements and 12 critical pairs
      #|10 basis elements and 13 critical pairs
      #|10 basis elements and 12 critical pairs
      #|11 basis elements and 14 critical pairs
      #|11 basis elements and 13 critical pairs
      #|11 basis elements and 12 critical pairs
      #|12 basis elements and 14 critical pairs
      #|12 basis elements and 13 critical pairs
      #|12 basis elements and 12 critical pairs
      #|12 basis elements and 11 critical pairs
      #|12 basis elements and 10 critical pairs
      #|12 basis elements and 9 critical pairs
      #|12 basis elements and 8 critical pairs
      #|12 basis elements and 7 critical pairs
      #|13 basis elements and 8 critical pairs
      #|13 basis elements and 7 critical pairs
      #|13 basis elements and 6 critical pairs
      #|13 basis elements and 5 critical pairs
      #|14 basis elements and 5 critical pairs
      #|14 basis elements and 4 critical pairs
      #|15 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 0 critical pairs
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|Formal_ineqs/trig/matan quotations (226):
      #|  (matan : (Real) -> Real)((x : Real)) == (if x == real_of_num(0) { real_of_num(1) } else { if x > real_of_num(0) { atn(sqrt(x)) / sqrt(x) } else { log((real_of_num(1) + sqrt(-x)) / (real_of_num(1) - sqrt(-x))) / (real_of_num(2) * sqrt(-x)) } })
      #|  (dmatan : (Real) -> Real) == real_derivative(matan)
      #|  (ddmatan : (Real) -> Real) == real_derivative(real_derivative(matan))
      #|  (f : (Real) -> Real)(real_of_num(0)) == real_of_num(0)
      #|  (x : Real)
      #|  abs(-real_of_num(1)) == real_of_num(1)
      #|  pow((t : Real), 2)
      #|  0
      #|  abs((t : Real)) < real_of_num(1) \226\134\146 !(real_of_num(1) - t == real_of_num(0))
      #|  (t : Real)
      #|  real_of_num(1)
      #|  (UNIV : (Num) -> Bool)
      #|  (i : Num) => if EVEN(i) { real_of_num(1) } else { real_of_num(0) }
      #|  (x : Real) => inv(real_of_num(1) - pow(x, 2))
      #|  (f : (Real) -> Real)
      #|  (f : (Real) -> Real) == ((x : Real) => log((real_of_num(1) + x) / (real_of_num(1) - x)) / real_of_num(2))
      #|  (a : Real) * (x : Real) / (b : Real) * inv(x) == x * inv(x) * (a / b)
      #|  (k : Num)
      #|  (k : Num) => pow((x : Real), 2 * k + 1) / real_of_num(2 * k + 1) * inv(x)
      #|  \226\136\128 x : Real, abs(x) < real_of_num(1) && !(x == real_of_num(0)) \226\134\146 real_sums((k : Num) => pow(x, 2 * k) / real_of_num(2 * k + 1), log((real_of_num(1) + x) / (real_of_num(1) - x)) / (real_of_num(2) * x), UNIV)
      #|  !((x : Real) > real_of_num(0)) \226\134\146 abs(-x) == -x
      #|  real_of_num(1) == abs(real_of_num(1))
      #|  sqrt(-(x : Real))
      #|  pow(sqrt((x : Real)), 2) == x
      #|  (real_of_num(0) < (x : Real)) == (x > real_of_num(0))
      #|  sqrt((x : Real))
      #|  (y : Real) > real_of_num(0) \226\134\146 !(y == real_of_num(0))
      #|  (k : Num)
      #|  (k : Num) => pow(-real_of_num(1), k) / real_of_num(2 * k + 1) * pow((y : Real), 2 * k + 1) * inv(y)
      #|  \226\136\128 y : Real, y > real_of_num(0) && y < real_of_num(1) \226\134\146 real_sums((k : Num) => pow(-real_of_num(1), k) / real_of_num(2 * k + 1) * pow(pow(y, 2), k), atn(y) / y, UNIV)
      #|  (x : Real) > real_of_num(0)
      #|  (i : Num) => real_of_num(0)
      #|  0 < 1
      #|  real_of_num(1) == real_of_num(0) + sum(op_dot_dot(0, 1 - 1), (h : (Num) -> Real))
      #|  !(1 <= 0)
      #|  1 <= (i : Num) \226\134\146 !(i == 0)
      #|  (h : (Num) -> Real)(0) == real_of_num(1) && (\226\136\128 i : Num, 1 <= i \226\134\146 h(i) == real_of_num(0))
      #|  (h : (Num) -> Real) == ((k : Num) => pow(-real_of_num(1), k) / real_of_num(2 * k + 1) * pow(real_of_num(0), k))
      #|  (x : Real) == real_of_num(0)
      #|  \226\136\128 x : Real, abs(x) < real_of_num(1) \226\134\146 real_sums((k : Num) => pow(-real_of_num(1), k) / real_of_num(2 * k + 1) * pow(x, k), matan(x), UNIV)
      #|  2 * SUC((m : Num)) + 1 == 2 * m + 3
      #|  abs(-real_of_num(1)) == real_of_num(1)
      #|  0 < SUC((m : Num))
      #|  SUC((m : Num))
      #|  0
      #|  (x : Real)
      #|  matan((x : Real))
      #|  (k : Num) => pow(-real_of_num(1), k) / real_of_num(2 * k + 1)
      #|  2 * SUC((m : Num)) + 1 == 2 * m + 3
      #|  abs(-real_of_num(1)) == real_of_num(1)
      #|  inv(real_of_num(2 * (m : Num) + 3)) == abs(((k : Num) => pow(-real_of_num(1), k) / real_of_num(2 * k + 1))(SUC(m)))
      #|  SUC((m : Num)) - 1 == m
      #|  \226\136\128 f : (Num) -> Real, sum(op_dot_dot(0, (m : Num)), f) == sum(op_dot_dot(0, SUC(m) - 1), f)
      #|  (a : Real) * (inv((c : Real)) * (b : Real)) == inv(c) * (a * b)
      #|  \226\136\128 m : Num, \226\136\128 x : Real, abs(x) < real_of_num(1) \226\134\146 abs(matan(x) - sum(op_dot_dot(0, m), (k : Num) => pow(-real_of_num(1), k) / real_of_num(2 * k + 1) * pow(x, k))) <= pow(abs(x), SUC(m)) / (real_of_num(2 * m + 3) * (real_of_num(1) - abs(x)))
      #|  real_of_num(0) < (x : Real) \226\134\146 real_of_num(0) <= x
      #|  real_of_num(0) < (x : Real) \226\134\146 !(x == real_of_num(0))
      #|  !(sqrt((x : Real)) == real_of_num(0))
      #|  !((x' : Real) == real_of_num(0)) && x' > real_of_num(0)
      #|  (x : Real)
      #|  (x : Real) => atn(sqrt(x)) / sqrt(x)
      #|  \226\136\128 x : Real, real_of_num(0) < x \226\134\146 has_real_derivative(matan, inv(real_of_num(2) * (x * (x + real_of_num(1)))) - atn(sqrt(x)) / (real_of_num(2) * (x * sqrt(x))), atreal(x))
      #|  \226\136\128 x : Real, real_of_num(0) < x \226\134\146 real_derivative(matan, x) == inv(real_of_num(2) * (x * (x + real_of_num(1)))) - atn(sqrt(x)) / (real_of_num(2) * (x * sqrt(x)))
      #|  (a : Real) * ((b : Real) / (c : Real)) == b * (a / c)
      #|  2 * (i : Num) + 3 == 2 * SUC(i) + 1
      #|  real_derivative(matan, (x : Real)) == (f' : (Real) -> Real)(x)
      #|  (f' : (Real) -> Real)((x : Real))
      #|  (x : Real)
      #|  \226\136\128 x : Real, abs(x) < real_of_num(1) \226\134\146 real_differentiable(matan, atreal(x)) && real_sums((i : Num) => pow(-real_of_num(1), SUC(i)) * (real_of_num(SUC(i)) / real_of_num(2 * i + 3)) * pow(x, i), real_derivative(matan, x), from(0))
      #|  inv(real_of_num(2)) * (real_of_num(2) * (a : Real) + (b : Real)) == a + inv(real_of_num(2)) * b
      #|  real_of_num(0) < abs(real_of_num(2 * (i : Num) + 3))
      #|  abs(-real_of_num(1)) == real_of_num(1) && abs(real_of_num(1)) == real_of_num(1)
      #|  0 < SUC((m : Num))
      #|  SUC((m : Num)) - 1 == m
      #|  \226\136\128 f : (Num) -> Real, sum(op_dot_dot(0, (m : Num)), f) == sum(op_dot_dot(0, SUC(m) - 1), f)
      #|  (a : Real) * (inv(real_of_num(2)) * (b : Real)) == inv(real_of_num(2)) * (a * b)
      #|  \226\136\128 x : Real, \226\136\128 m : Num, abs(x) < real_of_num(1) \226\134\146 abs(real_derivative(matan, x) - sum(op_dot_dot(0, m), (i : Num) => pow(-real_of_num(1), SUC(i)) * (real_of_num(SUC(i)) / real_of_num(2 * i + 3)) * pow(x, i))) <= pow(abs(x), SUC(m)) / (real_of_num(2) * (real_of_num(1) - abs(x)))
      #|  real_of_num(0) < (x : Real) \226\134\146 real_of_num(0) <= x
      #|  (s : Real) * ((x : Real) * inv((t : Real)) + s) == s * (x * inv(t)) + pow(s, 2)
      #|  sqrt((x : Real))
      #|  (x : Real) * inv(real_of_num(2) * sqrt(x)) + sqrt(x) == real_of_num(3) / real_of_num(2) * (x / sqrt(x))
      #|  real_of_num(0) < (x : Real) \226\134\146 real_of_num(0) <= x
      #|  !(sqrt((x : Real)) == real_of_num(0))
      #|  real_of_num(0) < (x : Real) \226\134\146 !(x == real_of_num(0))
      #|  \226\136\128 x : Real, real_of_num(0) < x \226\134\146 has_real_derivative((x : Real) => inv(real_of_num(2) * (x * (x + real_of_num(1)))) - atn(sqrt(x)) / (real_of_num(2) * (x * sqrt(x))), real_of_num(3) / real_of_num(4) * (atn(sqrt(x)) / (pow(x, 2) * sqrt(x))) - real_of_num(3) / real_of_num(4) * inv(pow(x, 2) * (x + real_of_num(1))) - real_of_num(1) / real_of_num(2) * inv(x * pow(x + real_of_num(1), 2)), atreal(x))
      #|  real_of_num(0) < (x' : Real)
      #|  (x : Real)
      #|  (x : Real) => inv(real_of_num(2) * (x * (x + real_of_num(1)))) - atn(sqrt(x)) / (real_of_num(2) * (x * sqrt(x)))
      #|  \226\136\128 x : Real, real_of_num(0) < x \226\134\146 real_derivative(real_derivative(matan), x) == real_of_num(3) / real_of_num(4) * (atn(sqrt(x)) / (pow(x, 2) * sqrt(x))) - real_of_num(3) / real_of_num(4) * inv(pow(x, 2) * (x + real_of_num(1))) - real_of_num(1) / real_of_num(2) * inv(x * pow(x + real_of_num(1), 2))
      #|  (a : Real) * ((b : Real) * (d : Real) / (c : Real)) == b * (a * (d / c))
      #|  (i : Num) + 2 == SUC(SUC(i)) && 2 * i + 5 == 2 * SUC(i) + 3 && i + 1 == SUC(i)
      #|  real_derivative(real_derivative(matan), (x : Real)) == (f' : (Real) -> Real)(x)
      #|  (f' : (Real) -> Real)((x : Real))
      #|  (x : Real)
      #|  (x' : Real)
      #|  real_of_num(1)
      #|  (i : Num) => pow(-real_of_num(1), SUC(i)) * (real_of_num(SUC(i)) / real_of_num(2 * i + 3))
      #|  real_derivative(matan)
      #|  \226\136\128 x : Real, abs(x) < real_of_num(1) \226\134\146 real_differentiable(real_derivative(matan), atreal(x)) && real_sums((i : Num) => pow(-real_of_num(1), i + 2) * (real_of_num((i + 1) * (i + 2)) / real_of_num(2 * i + 5)) * pow(x, i), real_derivative(real_derivative(matan), x), from(0))
      #|  (real_of_num(1) / (a : Real) <= real_of_num(1)) == (inv(a) <= inv(real_of_num(1)))
      #|  ((a : Real) <= (b : Real)) == (a <= real_of_num(1) * b)
      #|  0
      #|  (i : Num) => pow(abs((x : Real)), i)
      #|  -((x : Real) / pow(real_of_num(1) + x, 2))
      #|  real_of_num(1) / (real_of_num(1) + (x : Real))
      #|  real_summable(UNIV, (f : (Num) -> Real)) && real_summable(UNIV, (g : (Num) -> Real)) && real_summable(UNIV, (h : (Num) -> Real))
      #|  (x : Real)
      #|  (x : Real)
      #|  \226\136\128 i : Num, pow(-real_of_num(1), i) / real_of_num(2 * i + 5) * pow((x : Real), i) == (h : (Num) -> Real)(i)
      #|  \226\136\128 i : Num, pow(-real_of_num(1), i) * (real_of_num((i + 1) * (i + 2)) / real_of_num(2 * i + 5)) * pow((x : Real), i) == real_of_num(1) / real_of_num(4) * (f : (Num) -> Real)(i) + (real_of_num(1) / real_of_num(2) * (g : (Num) -> Real)(i) + real_of_num(3) / real_of_num(4) * (h : (Num) -> Real)(i))
      #|  (h : (Num) -> Real) == ((i : Num) => pow(-real_of_num(1), i) * (real_of_num(1) / real_of_num(2 * i + 5)) * pow((x : Real), i))
      #|  (g : (Num) -> Real) == ((i : Num) => pow(-real_of_num(1), i) * real_of_num(i) * pow((x : Real), i))
      #|  (f : (Num) -> Real) == ((i : Num) => pow(-real_of_num(1), i) * pow((x : Real), i))
      #|  abs((x : Real)) < real_of_num(1) \226\134\146 (real_of_num(1) - x) / (real_of_num(4) * pow(real_of_num(1) + x, 2)) == real_of_num(1) / real_of_num(4) * (real_of_num(1) / (real_of_num(1) + x)) - real_of_num(1) / real_of_num(2) * (x / pow(real_of_num(1) + x, 2))
      #|  pow(-real_of_num(1), 2) == real_of_num(1)
      #|  \226\136\128 i : Num, pow(-real_of_num(1), i + 2) == pow(-real_of_num(1), i)
      #|  \226\136\128 x : Real, abs(x) < real_of_num(1) \226\134\146 real_derivative(real_derivative(matan), x) == (real_of_num(1) - x) / (real_of_num(4) * pow(real_of_num(1) + x, 2)) + real_of_num(3) / real_of_num(4) * real_infsum(UNIV, (i : Num) => pow(-real_of_num(1), i) / real_of_num(2 * i + 5) * pow(x, i)) && real_summable(UNIV, (i : Num) => pow(-real_of_num(1), i) / real_of_num(2 * i + 5) * pow(x, i))
      #|  pi / real_of_num(4)
      #|  (real_of_num(1) <= real_of_num(5) * (x : Real)) == (real_of_num(1) / real_of_num(5) <= x)
      #|  real_of_num(1) <= (t : Real) && real_of_num(0) <= pow(t - real_of_num(1), 2) \226\134\146 t <= pow(t, 2) + real_of_num(1)
      #|  real_of_num(1) <= (t : Real)
      #|  real_of_num(0) < pow((t : Real), 2) + real_of_num(1)
      #|  real_of_num(1)
      #|  inv(pow((t : Real), 5)) * pow(t, 6) == t
      #|  (a : Real) * ((b : Real) * (c : Real)) == a * c * b
      #|  real_of_num(0) < (a : Real) \226\134\146 !(a == real_of_num(0))
      #|  pow((t : Real), 6)
      #|  real_of_num(1) <= (t : Real) \226\134\146 real_of_num(0) < t
      #|  \226\136\128 n : Num, real_of_num(0) < pow((t : Real), n)
      #|  (real_of_num(0) <= (a : Real) - (b : Real)) == (b <= a)
      #|  (t : Real)
      #|  pow(inv((x' : Real)), 5) * pow(x', 10) == pow(x', 5)
      #|  pow(inv((x' : Real)), 6) * pow(x', 10) == pow(x', 4)
      #|  (real_of_num(5) * ((a : Real) * (p6 : Real)) - (ip5 : Real) * (t : Real)) * (p10 : Real) == real_of_num(5) * (a * (p6 * p10)) - ip5 * p10 * t
      #|  pow((x' : Real), 10)
      #|  real_of_num(1) <= (x' : Real)
      #|  \226\136\128 n : Num, !(pow((x' : Real), n) == real_of_num(0))
      #|  5 - 1 == 4 && 5 * 2 == 10
      #|  real_of_num(1) <= (x' : Real) \226\134\146 !(x' == real_of_num(0))
      #|  real_interval([(real_of_num(1), (y : Real))])
      #|  (y : Real) => real_of_num(5) * (atn(y) / pow(y, 6)) - inv(pow(y, 5) * (pow(y, 2) + real_of_num(1)))
      #|  \226\136\128 x : Real, -(atn(x) / pow(x, 5)) == (f : (Real) -> Real)(x)
      #|  (f : (Real) -> Real) == ((y : Real) => -(atn(y) / pow(y, 5)))
      #|  atn(real_of_num(1)) / pow(real_of_num(1), 5)
      #|  real_of_num(1) <= (y : Real)
      #|  DECIMAL(65, 100) == real_of_num(3) / real_of_num(4) * (DECIMAL(65, 100) * (real_of_num(4) / real_of_num(3)))
      #|  real_of_num(1) <= (x : Real) \226\134\146 real_of_num(0) <= x
      #|  (x : Real)
      #|  pow((x : Real), 2) * (y : Real) == pow(y, 5)
      #|  (y : Real) == sqrt((x : Real))
      #|  ((a : Real) - (b : Real) - (c : Real) <= a) == (real_of_num(0) <= b + c)
      #|  real_of_num(3) / real_of_num(4) * (atn(sqrt((x : Real))) / (pow(x, 2) * sqrt(x)))
      #|  real_of_num(1) <= (x : Real) \226\134\146 real_of_num(0) < x
      #|  \226\136\128 x : Real, real_of_num(1) <= x \226\134\146 real_derivative(real_derivative(matan), x) <= DECIMAL(65, 100)
      #|  real_of_num(1) <= (x : Real) \226\134\146 real_of_num(0) <= x
      #|  real_of_num(1) <= (x : Real) \226\134\146 real_of_num(0) <= x
      #|  (-(real_of_num(3) / real_of_num(4)) * (a : Real) - (b : Real) <= (c : Real) - real_of_num(3) / real_of_num(4) * a - b) == (real_of_num(0) <= c)
      #|  real_of_num(2) == real_of_num(2) * real_of_num(1)
      #|  real_of_num(2) == real_of_num(1) * real_of_num(2)
      #|  real_of_num(0) < real_of_num(2)
      #|  real_of_num(3) * inv(real_of_num(2)) + real_of_num(2) * inv(real_of_num(2))
      #|  (-DECIMAL(65, 100) <= -(real_of_num(3) / real_of_num(4)) * (a : Real) - real_of_num(1) / real_of_num(2) * (b : Real)) == (real_of_num(3) * a + real_of_num(2) * b <= DECIMAL(26, 10))
      #|  -(real_of_num(3) / real_of_num(4)) * inv(pow((x : Real), 2) * (x + real_of_num(1))) - real_of_num(1) / real_of_num(2) * inv(x * pow(x + real_of_num(1), 2))
      #|  real_of_num(1) <= (x : Real) \226\134\146 real_of_num(0) < x
      #|  \226\136\128 x : Real, real_of_num(1) <= x \226\134\146 -DECIMAL(65, 100) <= real_derivative(real_derivative(matan), x)
      #|  real_of_num(0) <= (x : Real) && x < real_of_num(1)
      #|  inv(real_of_num((n : Num))) == inv(real_of_num(n)) * real_of_num(1)
      #|  1
      #|  (n : Num) => inv(real_of_num(n))
      #|  SUC((n : Num) + 1 + n) == 2 * (n + 1)
      #|  ((a : Real) * (b : Real) <= real_of_num(0)) == (real_of_num(0) <= -real_of_num(1) * a * b)
      #|  (a : Real) * (b : Real) * (c : Real) * ((d : Real) * (e : Real) * (f : Real)) == a * d * (c * f * (b * e))
      #|  real_of_num(0) <= (x : Real) && x < real_of_num(1)
      #|  ((x : Real) * (y : Real) <= y) == (x * y <= real_of_num(1) * y)
      #|  real_of_num(1) / real_of_num(5) == abs(((i : Num) => pow(-real_of_num(1), i) / real_of_num(2 * i + 5) * pow((x : Real), i))(0))
      #|  real_of_num(3) / real_of_num(20) == abs(real_of_num(3) / real_of_num(4)) * (real_of_num(1) / real_of_num(5))
      #|  real_of_num(1) <= (a : Real) \226\134\146 real_of_num(1) <= abs(a)
      #|  real_of_num(0) <= (x : Real) && x < real_of_num(1)
      #|  real_of_num(1)
      #|  real_of_num(0) <= (x : Real) && x < real_of_num(1)
      #|  real_of_num(0) < (x : Real) \226\134\146 real_of_num(0) < abs(x)
      #|  real_of_num(0) < real_of_num(4) && real_of_num(0) < real_of_num(4) * abs(pow(real_of_num(1) + (x : Real), 2))
      #|  abs((f : Real)) + abs(real_of_num(3) / real_of_num(4) * (r : Real))
      #|  (r : Real) == real_infsum(UNIV, (i : Num) => pow(-real_of_num(1), i) / real_of_num(2 * i + 5) * pow((x : Real), i))
      #|  (f : Real) == (real_of_num(1) - (x : Real)) / (real_of_num(4) * pow(real_of_num(1) + x, 2))
      #|  real_of_num(1) / real_of_num(4) + real_of_num(3) / real_of_num(20)
      #|  (x : Real)
      #|  \226\136\128 x : Real, real_of_num(0) <= x && x < real_of_num(1) \226\134\146 abs(real_derivative(real_derivative(matan), x)) <= DECIMAL(65, 100)
      #|  (i : Num) + 2 + i == 2 * (i + 1)
      #|  -real_of_num(1) * -(x : Real) == x
      #|  pow((x : Real), (i : Num)) == pow(-real_of_num(1), i) * pow(-x, i)
      #|  (a : Real) * (b : Real) * pow((x : Real), (i : Num)) == a * pow(x, i) * b
      #|  from(0)
      #|  (i : Num) => pow(-real_of_num(1), i + 2) * (real_of_num((i + 1) * (i + 2)) / real_of_num(2 * i + 5)) * pow((x : Real), i)
      #|  (x : Real)
      #|  \226\136\128 x : Real, -real_of_num(1) < x && x < real_of_num(0) \226\134\146 real_of_num(0) <= real_derivative(real_derivative(matan), x)
      #|  2 * 1 + 5 == 7
      #|  0
      #|  1
      #|  -DECIMAL(2, 10)
      #|  (i : Num) => pow(-real_of_num(1), i) / real_of_num(2 * i + 5)
      #|  0 < 1
      #|  (i : Num) => pow(-real_of_num(1), i) / real_of_num(2 * i + 5) * pow(-DECIMAL(2, 10), i)
      #|  1
      #|  0
      #|  (a : Real) <= real_of_num(15) / real_of_num(32) && (b : Real) <= real_of_num(1) / real_of_num(5) + real_of_num(1) / real_of_num(28) \226\134\146 a + real_of_num(3) / real_of_num(4) * b <= DECIMAL(65, 100)
      #|  -DECIMAL(2, 10)
      #|  -real_of_num(1) * (y : Real) == -y
      #|  pow(-real_of_num(1), 2) == real_of_num(1)
      #|  \226\136\128 y : Real, pow(-real_of_num(1), (i : Num) + 2) * pow(y, i) == pow(-y, i)
      #|  (a : Real) * (b : Real) * pow((x : Real), (i : Num)) == a * pow(x, i) * b
      #|  abs(-DECIMAL(2, 10)) < real_of_num(1)
      #|  -DECIMAL(2, 10) <= (x : Real) && x < real_of_num(0) \226\134\146 abs(x) < real_of_num(1)
      #|  from(0)
      #|  (i : Num) => pow(-real_of_num(1), i + 2) * (real_of_num((i + 1) * (i + 2)) / real_of_num(2 * i + 5)) * pow(-DECIMAL(2, 10), i)
      #|  (i : Num) => pow(-real_of_num(1), i + 2) * (real_of_num((i + 1) * (i + 2)) / real_of_num(2 * i + 5)) * pow((x : Real), i)
      #|  real_derivative(real_derivative(matan), -DECIMAL(2, 10))
      #|  \226\136\128 x : Real, -DECIMAL(2, 10) <= x && x < real_of_num(0) \226\134\146 real_derivative(real_derivative(matan), x) <= DECIMAL(65, 100)
      #|  (x : Real)
      #|  (x : Real)
      #|  (x : Real)
      #|  (x : Real) < real_of_num(1)
      #|  (x : Real)
      #|  (x : Real)
      #|  (x : Real) < real_of_num(0)
      #|  \226\136\128 x : Real, -DECIMAL(2, 10) <= x \226\134\146 abs(real_derivative(real_derivative(matan), x)) <= DECIMAL(65, 100)
      #|Matan.matan =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#matan:fun(real,real) x:real)) (((#COND:fun(bool,fun(real,fun(real,real))) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (((#COND:fun(bool,fun(real,fun(real,real))) ((#real_gt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#real_div:fun(real,fun(real,real)) (#atn:fun(real,real) (#sqrt:fun(real,real) x:real))) (#sqrt:fun(real,real) x:real))) ((#real_div:fun(real,fun(real,real)) (#log:fun(real,real) ((#real_div:fun(real,fun(real,real)) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#sqrt:fun(real,real) (#real_neg:fun(real,real) x:real)))) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#sqrt:fun(real,real) (#real_neg:fun(real,real) x:real)))))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#sqrt:fun(real,real) (#real_neg:fun(real,real) x:real)))))))))
      #|Matan.dmatan =  |- ((#=:fun(fun(real,real),fun(fun(real,real),bool)) #dmatan:fun(real,real)) (#real_derivative:fun(fun(real,real),fun(real,real)) #matan:fun(real,real)))
      #|Matan.ddmatan =  |- ((#=:fun(fun(real,real),fun(fun(real,real),bool)) #ddmatan:fun(real,real)) (#real_derivative:fun(fun(real,real),fun(real,real)) (#real_derivative:fun(fun(real,real),fun(real,real)) #matan:fun(real,real))))
      #|Matan.log_matan_series =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\k:num. ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) x:real) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) k:num))) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) k:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_div:fun(real,fun(real,real)) (#log:fun(real,real) ((#real_div:fun(real,fun(real,real)) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real)) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real)))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) x:real))) #UNIV:fun(num,bool)))))
      #|Matan.matan_power_series =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\k:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) k:num)) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) k:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_pow:fun(real,fun(num,real)) x:real) k:num)))) (#matan:fun(real,real) x:real)) #UNIV:fun(num,bool)))))
      #|Matan.matan_abs1_bound =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (#matan:fun(real,real) x:real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) m:num)) (\k:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) k:num)) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) k:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_pow:fun(real,fun(num,real)) x:real) k:num))))))) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_abs:fun(real,real) x:real)) (#SUC:fun(num,num) m:num))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) m:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#real_abs:fun(real,real) x:real))))))))))
      #|Matan.matan_has_derivative_gt0 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) #matan:fun(real,real)) ((#real_sub:fun(real,fun(real,real)) (#real_inv:fun(real,real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_mul:fun(real,fun(real,real)) x:real) ((#real_add:fun(real,fun(real,real)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#real_div:fun(real,fun(real,real)) (#atn:fun(real,real) (#sqrt:fun(real,real) x:real))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_mul:fun(real,fun(real,real)) x:real) (#sqrt:fun(real,real) x:real)))))) (#atreal:fun(real,net(real)) x:real)))))
      #|Matan.matan_real_derivative_gt0 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#=:fun(real,fun(real,bool)) ((#real_derivative:fun(fun(real,real),fun(real,real)) #matan:fun(real,real)) x:real)) ((#real_sub:fun(real,fun(real,real)) (#real_inv:fun(real,real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_mul:fun(real,fun(real,real)) x:real) ((#real_add:fun(real,fun(real,real)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#real_div:fun(real,fun(real,real)) (#atn:fun(real,real) (#sqrt:fun(real,real) x:real))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_mul:fun(real,fun(real,real)) x:real) (#sqrt:fun(real,real) x:real)))))))))
      #|Matan.matan_real_derivative_abs1 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) #matan:fun(real,real)) (#atreal:fun(real,net(real)) x:real))) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#SUC:fun(num,num) i:num))) ((#real_div:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#SUC:fun(num,num) i:num))) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) i:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#real_pow:fun(real,fun(num,real)) x:real) i:num)))) ((#real_derivative:fun(fun(real,real),fun(real,real)) #matan:fun(real,real)) x:real)) (#from:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)))))))
      #|Matan.matan_real_derivative_abs1_bound =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) ((#real_derivative:fun(fun(real,real),fun(real,real)) #matan:fun(real,real)) x:real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) m:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#SUC:fun(num,num) i:num))) ((#real_div:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#SUC:fun(num,num) i:num))) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) i:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#real_pow:fun(real,fun(num,real)) x:real) i:num))))))) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_abs:fun(real,real) x:real)) (#SUC:fun(num,num) m:num))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#real_abs:fun(real,real) x:real))))))))))
      #|Matan.matan_has_derivative2_gt0 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) (\x:real. ((#real_sub:fun(real,fun(real,real)) (#real_inv:fun(real,real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_mul:fun(real,fun(real,real)) x:real) ((#real_add:fun(real,fun(real,real)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#real_div:fun(real,fun(real,real)) (#atn:fun(real,real) (#sqrt:fun(real,real) x:real))) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_mul:fun(real,fun(real,real)) x:real) (#sqrt:fun(real,real) x:real))))))) ((#real_sub:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_div:fun(real,fun(real,real)) (#atn:fun(real,real) (#sqrt:fun(real,real) x:real))) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#sqrt:fun(real,real) x:real))))) ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) (#real_inv:fun(real,real) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_add:fun(real,fun(real,real)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_inv:fun(real,real) ((#real_mul:fun(real,fun(real,real)) x:real) ((#real_pow:fun(real,fun(num,real)) ((#real_add:fun(real,fun(real,real)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) (#atreal:fun(real,net(real)) x:real)))))
      #|Matan.matan_second_derivative_gt0 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#=:fun(real,fun(real,bool)) ((#real_derivative:fun(fun(real,real),fun(real,real)) (#real_derivative:fun(fun(real,real),fun(real,real)) #matan:fun(real,real))) x:real)) ((#real_sub:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_div:fun(real,fun(real,real)) (#atn:fun(real,real) (#sqrt:fun(real,real) x:real))) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#sqrt:fun(real,real) x:real))))) ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) (#real_inv:fun(real,real) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_add:fun(real,fun(real,real)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_inv:fun(real,real) ((#real_mul:fun(real,fun(real,real)) x:real) ((#real_pow:fun(real,fun(num,real)) ((#real_add:fun(real,fun(real,real)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))
      #|Matan.matan_second_derivative_abs1 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#real_differentiable:fun(fun(real,real),fun(net(real),bool)) (#real_derivative:fun(fun(real,real),fun(real,real)) #matan:fun(real,real))) (#atreal:fun(real,net(real)) x:real))) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#+:fun(num,fun(num,num)) i:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_div:fun(real,fun(real,real)) (#real_of_num:fun(num,real) ((#*:fun(num,fun(num,num)) ((#+:fun(num,fun(num,num)) i:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#+:fun(num,fun(num,num)) i:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) i:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) ((#real_pow:fun(real,fun(num,real)) x:real) i:num)))) ((#real_derivative:fun(fun(real,real),fun(real,real)) (#real_derivative:fun(fun(real,real),fun(real,real)) #matan:fun(real,real))) x:real)) (#from:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)))))))
      #|Matan.matan_second_derivative_abs1_alt =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) ((#=:fun(real,fun(real,bool)) ((#real_derivative:fun(fun(real,real),fun(real,real)) (#real_derivative:fun(fun(real,real),fun(real,real)) #matan:fun(real,real))) x:real)) ((#real_add:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_pow:fun(real,fun(num,real)) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_infsum:fun(fun(num,bool),fun(fun(num,real),real)) #UNIV:fun(num,bool)) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) i:num)) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) i:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#real_pow:fun(real,fun(num,real)) x:real) i:num)))))))) ((#real_summable:fun(fun(num,bool),fun(fun(num,real),bool)) #UNIV:fun(num,bool)) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) i:num)) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) i:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#real_pow:fun(real,fun(num,real)) x:real) i:num))))))))
      #|Matan.matan_d2_bound_ge1_high =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real)) ((#real_le:fun(real,fun(real,bool)) ((#real_derivative:fun(fun(real,real),fun(real,real)) (#real_derivative:fun(fun(real,real),fun(real,real)) #matan:fun(real,real))) x:real)) ((#DECIMAL:fun(num,fun(num,real)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))))
      #|Matan.matan_d2_bound_ge1_low =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real)) ((#real_le:fun(real,fun(real,bool)) (#real_neg:fun(real,real) ((#DECIMAL:fun(num,fun(num,real)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))) ((#real_derivative:fun(fun(real,real),fun(real,real)) (#real_derivative:fun(fun(real,real),fun(real,real)) #matan:fun(real,real))) x:real)))))
      #|Matan.matan_d2_bound_01 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_derivative:fun(fun(real,real),fun(real,real)) (#real_derivative:fun(fun(real,real),fun(real,real)) #matan:fun(real,real))) x:real))) ((#DECIMAL:fun(num,fun(num,real)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))))
      #|Matan.matan_d2_bound_neg_low =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_derivative:fun(fun(real,real),fun(real,real)) (#real_derivative:fun(fun(real,real),fun(real,real)) #matan:fun(real,real))) x:real)))))
      #|Matan.matan_d2_bound_neg_high =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_neg:fun(real,real) ((#DECIMAL:fun(num,fun(num,real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) x:real)) ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#real_le:fun(real,fun(real,bool)) ((#real_derivative:fun(fun(real,real),fun(real,real)) (#real_derivative:fun(fun(real,real),fun(real,real)) #matan:fun(real,real))) x:real)) ((#DECIMAL:fun(num,fun(num,real)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))))
      #|Matan.matan_d2_bound =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_neg:fun(real,real) ((#DECIMAL:fun(num,fun(num,real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) x:real)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_derivative:fun(fun(real,real),fun(real,real)) (#real_derivative:fun(fun(real,real),fun(real,real)) #matan:fun(real,real))) x:real))) ((#DECIMAL:fun(num,fun(num,real)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT0:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))))
      #|types = multivector/1 matroid/1 group/1 frag/1 metric/1 net/1 topology/1 tybit1/1 tybit0/1 finite_prod/2 finite_diff/2 finite_sum/2 cart/2 finite_image/1 int/0 real/0 hreal/0 nadd/0 char/0 list/1 option/1 sum/2 recspace/1 num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = ddmatan dmatan matan halfatn4 halfatn poly_f_odd poly_f_even poly_f real_zero l_seq TABLE REVERSE_TABLE mod_plus arith_base float_num min_exp interval_gt interval_neg interval_pos interval_not_zero iabs bounded_on_int bounded_on interval_arith num_exp D199 D198 D197 D196 D195 D194 D193 D192 D191 D190 D189 D188 D187 D186 D185 D184 D183 D182 D181 D180 D179 D178 D177 D176 D175 D174 D173 D172 D171 D170 D169 D168 D167 D166 D165 D164 D163 D162 D161 D160 D159 D158 D157 D156 D155 D154 D153 D152 D151 D150 D149 D148 D147 D146 D145 D144 D143 D142 D141 D140 D139 D138 D137 D136 D135 D134 D133 D132 D131 D130 D129 D128 D127 D126 D125 D124 D123 D122 D121 D120 D119 D118 D117 D116 D115 D114 D113 D112 D111 D110 D109 D108 D107 D106 D105 D104 D103 D102 D101 D100 D99 D98 D97 D96 D95 D94 D93 D92 D91 D90 D89 D88 D87 D86 D85 D84 D83 D82 D81 D80 D79 D78 D77 D76 D75 D74 D73 D72 D71 D70 D69 D68 D67 D66 D65 D64 D63 D62 D61 D60 D59 D58 D57 D56 D55 D54 D53 D52 D51 D50 D49 D48 D47 D46 D45 D44 D43 D42 D41 D40 D39 D38 D37 D36 D35 D34 D33 D32 D31 D30 D29 D28 D27 D26 D25 D24 D23 D22 D21 D20 D19 D18 D17 D16 D15 D14 D13 D12 D11 D10 D9 D8 D7 D6 D5 D4 D3 D2 D1 D0 NUM200 real_variation has_bounded_real_variation_on real_lebesgue_measurable real_measurable_on bernoulli vector_polynomial_function real_polynomial_function bernstein slice real_measure real_measurable has_real_measure absolutely_real_integrable_on real_negligible real_integral real_integrable_on has_real_integral real_log_convex_on log_convex_on real_convex_on open_real_segment closed_real_segment has_liminf has_limsup real_differentiable_on higher_real_derivative real_derivative real_differentiable has_real_derivative real_uniformly_continuous_on real_continuous_on real_continuous atreal binom rpow root acs asn cacs casn atn catn unwinding cpow clog tan ctan rotate2d Arg pi log cos sin exp csin ccos cexp analytic_on holomorphic_on higher_complex_derivative complex_derivative complex_differentiable has_complex_derivative cproduct real csqrt cnj complex_pow complex_div complex_inv complex_mul ii Cx complex Im Re lebesgue_measurable measurable_on measure measurable has_measure path_length rectifiable_path absolutely_continuous_on absolutely_setcontinuous_on vector_variation has_bounded_variation_on equiintegrable_on absolutely_integrable_on has_bounded_setvariation_on set_variation negligible division_points lifted operative integral integrable_on has_integral has_integral_compact_interval fine tagged_division_of tagged_partial_division_of division_of gauge content interval_lowerbound interval_upperbound reversion outermorphism seqiterate inner outer geom_mul Product grade multivector multivec mbasis lambdas $$ codeset setcode dest_multivector mk_multivector binarysum bitset vector_derivative has_vector_derivative jacobian frechet_derivative differentiable_on differentiable has_derivative interval_bij ENR ANR AR retract_of retraction brouwer_degree brouwer_degree1 triangulation simplicial_complex simplex polyhedron polytope edge_of facet_of extreme_point_of exposed_face_of face_of covering_space dimension contractible homotopy_equivalent fundamental_group simply_connected homotopic_loops homotopic_paths outside inside path_connected path_components path_component linepath subpath shiftpath arc simple_path ++ reversepath path_image pathfinish pathstart path barycentre relative_frontier relative_interior starlike epigraph convex_cone polar_dual aff_dim convex_on coplanar affine_dependent conic convex affine analytic borel_measurable_on baire borel fsigma gdelta locally hausdist setdist closest_point summable infsum sums homeomorphic homeomorphism is_interval diameter components connected_component uniformly_continuous_on continuous_on continuous complete cauchy compact bounded condensation_point_of lim --> in_direction at_neginfinity at_posinfinity at_infinity at frontier closure interior limit_point_of connected open_segment closed_segment manhattan sphere cball ball closed euclidean_metric euclidean open reflect_along rotoinversion_matrix rotation_matrix orthogonal_matrix orthogonal_transformation positive_definite positive_semidefinite diagonal_matrix cofactor det trace sign evenperm permutation swapseq three_cycle swap inverse permutes closed_interval open_interval midpoint between collinear infnorm matrix_inv rank columnvector rowvector euclidean_matroid dim independent dependent span subspace pushin dropout indicator drop lift onorm matrix invertible normal_matrix symmetric_matrix columns rows column row transp mat vector_matrix_mul matrix_vector_mul matrix_mul matrix_sub matrix_add matrix_neg %% adjoint bilinear linear orthogonal basis vsum distance vector_norm dot vec % vector_neg vector_sub vector_add matroid_dim matroid_finite_dim matroid_dimension matroid_finite_dimensional submatroid matroid_subspace matroid_dependent matroid_basis matroid_independent matroid_spanning matroid_span matroid_set dest_matroid matroid brouwer_degree2 reduced_homology_group hom_relboundary hom_induced hom_boundary homology_group relative_homology_group relcycle_group chain_group singular_subdivision simplicial_subdivision simplicial_vertex simplicial_cone simplex_cone simplicial_chain simplicial_simplex oriented_simplex chain_map simplex_map homologous_rel singular_relboundary singular_relcycle mod_subset chain_boundary singular_chain singular_face singular_simplex simplicial_face standard_simplex short_exact_sequence group_exactness solvable_group free_abelian_group pgroup integer_mod_group integer_group finitely_generated_group cyclic_group group_element_order trivial_homomorphism group_image group_kernel quotient_group group_normalizer group_centralizer group_conjugate normal_subgroup_of left_coset right_coset group_orbit group_stabilizer group_action group_setmul group_setinv isomorphic_group group_automorphism group_isomorphism group_isomorphisms group_endomorphism group_epimorphism group_monomorphism group_homomorphism sum_group product_group prod_group subgroup_generated subgroup_of group_conjugation group_sum group_product group_nmul group_add group_neg abelian_group group_zpow group_pow group_div opposite_group trivial_group singleton_group group_mul group_inv group_id group_carrier group_operations group index frag_extend frag_sub frag_add frag_cmul frag_neg frag_of frag_0 frag_support dest_frag mk_frag cantor_set cantor_map cantor_term cantor_space dimension_le sigma_locally_finite_in paracompact_space cfunspace funspace nsphere euclidean_space capped_metric fccoverable_in ulc_space fccoverable_space mdiameter cauchy_continuous_map uniformly_continuous_map lipschitz_continuous_map prod_metric completely_metrizable_space contractible_space homotopy_equivalent_space homotopic_with alexandroff_compactification kification k_space quasi_components_of quasi_component_of locally_connected_space locally_connected_at weakly_locally_connected_at locally_path_connected_space locally_path_connected_at weakly_locally_path_connected_at completely_regular_space normal_space path_components_of path_component_of path_connected_in path_connected_space path_in real_summable real_infsum real_sums reallim ---> topcontinuous_at totally_bounded_in mcomplete cauchy_in limit atpointof real_compact real_bounded real_euclidean_metric euclideanreal real_closed real_open locally_compact_space regular_space kolmogorov_quotient t0_space neighbourhood_base_of neighbourhood_base_at monotone_map connected_components_of connected_component_of separated_between connected_in connected_space metrizable_space discrete_metric mbounded msphere mcball mtopology submetric mball mdist mspace dest_metric metric is_metric_space borel_measurable_map borel_in gdelta_in fsigma_in sequentially trivial_limit eventually within netlimit netlimits netfilter dest_net mk_net separable_space first_countable second_countable lindelof_space perfect_map proper_map kc_space hausdorff_space t1_space separated_in compact_space compact_in retract_of_space retraction_map section_map retraction_maps embedding_map homeomorphic_space homeomorphic_maps homeomorphic_map sum_topology product_topology prod_topology quotient_map closed_map open_map continuous_map locally_finite_in frontier_of interior_of closure_of derived_set_of hereditarily subtopology discrete_space discrete_topology closed_in topspace open_in topology istopology ITER suslin suslin_operation relative_to from hull matrify vectorize closed_real_interval open_real_interval is_realinterval frac floor rational ^_c *_c +_c ordinal linseg inseg properly strictly antichain chain wqoset woset toset poset qoset fld superadmissible tailadmissible admissible CASEWISE PCROSS vector mktybit1 _100531 _dest_tybit1 _mk_tybit1 mktybit0 _100512 _dest_tybit0 _mk_tybit0 dest_finite_prod mk_finite_prod dest_finite_diff mk_finite_diff sndcart fstcart pastecart dest_finite_sum mk_finite_sum lambda $ dest_cart mk_cart dest_finite_image finite_index dimindex polynomial_function sum nsum isum product iproduct nproduct iterato iterate support monoidal neutral .. has_sup has_inf inf sup COUNTABLE >_c >=_c =_c <_c <=_c ARBITRARY INTERSECTION_OF UNION_OF pairwise list_of_set set_of_list disjoint_union product_map cartesian_product RESTRICTION EXTENSIONAL ARB CROSS HAS_SIZE CARD ITSET FINREC REST CHOICE BIJ SURJ INJ IMAGE INFINITE FINITE SING DISJOINT PSUBSET SUBSET DELETE DIFF INTERS INTER UNIONS UNION UNIV INSERT EMPTY SETSPEC GSPEC IN real_zpow prime num_lcm num_gcd num_coprime num_mod num_divides num_of_int int_lcm int_gcd int_coprime int_mod int_divides real_mod == rem div int_pow int_min int_max int_sgn int_abs int_mul int_sub int_add int_neg int_of_num int_gt int_ge int_lt int_le real_of_int int_of_real integer DECIMAL sqrt real_sgn real_min real_max real_div real_pow real_abs real_gt real_ge real_lt real_sub real_inv real_le real_mul real_add real_neg real_of_num dest_real mk_real treal_eq treal_inv treal_le treal_mul treal_add treal_neg treal_of_num hreal_inv hreal_le hreal_mul hreal_add hreal_of_num dest_hreal mk_hreal nadd_inv nadd_rinv nadd_mul nadd_add nadd_le nadd_of_num nadd_eq dest_nadd mk_nadd is_nadd dist ASCII _22943 _dest_char _mk_char list_of_seq PAIRWISE ALLPAIRS ZIP ITLIST2 ASSOC FILTER EL MAP2 ALL2 MEM ITLIST EX ALL NULL REPLICATE BUTLAST LAST MAP LENGTH REVERSE APPEND TL HD ISO CONS NIL _dest_list _mk_list SOME NONE _dest_option _mk_option OUTR OUTL INR INL _dest_sum _mk_sum FNIL FCONS CONSTR BOTTOM _dest_rec _mk_rec ZRECSPACE ZBOT ZCONSTR INJP INJF INJA INJN NUMRIGHT NUMLEFT NUMSUM NUMSND NUMFST NUMPAIR MEASURE WF minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|definitions = 1064
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?1
      #|counter_genvar = _3718044:bool
      #|
    ),
  )
}
