// Formal_ineqs/trig/series.hl in its directory's load order: the test block of
// formal_ineqs/trig/series/series_ref_test.mbt (tools/ocaml_ref/chain_test.py), with the same golden
// (tools/ocaml_ref/Formal_ineqs_trig_series_ref.expected).

///|
test "Formal_ineqs/trig/series matches Formal_ineqs/trig/series.ml" {
  @testkit.release_output()
  @series.load()
  let log = @testkit.Log::new()
  log.capture_reports()
  for th in ["Formal_ineqs/trig/series"] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("Formal_ineqs/trig/series")
  log.capture_stdout()
  // BEGIN generated theorem list
  log.attempt("Series.real_infsum_offset", () => {
    sthm(@series.real_infsum_offset())
  })
  log.attempt("Series.real_infsum_offset_alt", () => {
    sthm(@series.real_infsum_offset_alt())
  })
  log.attempt("Series.power_series_simple_bound", () => {
    sthm(@series.power_series_simple_bound())
  })
  log.attempt("Series.power_series_simple_bound2", () => {
    sthm(@series.power_series_simple_bound2())
  })
  log.attempt("Series.real_sums_simple_bound", () => {
    sthm(@series.real_sums_simple_bound())
  })
  log.attempt("Series.real_sums_simple_bound2", () => {
    sthm(@series.real_sums_simple_bound2())
  })
  log.attempt("Series.abs_sum_lemma_pos", () => {
    sthm(@series.abs_sum_lemma_pos())
  })
  log.attempt("Series.abs_sum_lemma_neg", () => {
    sthm(@series.abs_sum_lemma_neg())
  })
  log.attempt("Series.sign_mul_lemma", () => sthm(@series.sign_mul_lemma()))
  log.attempt("Series.sum_bound_lemma", () => sthm(@series.sum_bound_lemma()))
  log.attempt("Series.alt_sign_converges", () => {
    sthm(@series.alt_sign_converges())
  })
  log.attempt("Series.alt_sign_summable", () => {
    sthm(@series.alt_sign_summable())
  })
  log.attempt("Series.alt_sign_converges2", () => {
    sthm(@series.alt_sign_converges2())
  })
  log.attempt("Series.alt_sign_bound", () => sthm(@series.alt_sign_bound()))
  log.attempt("Series.alt_sign_abs_bound", () => {
    sthm(@series.alt_sign_abs_bound())
  })
  log.attempt("Series.alt_sign_upper_bound", () => {
    sthm(@series.alt_sign_upper_bound())
  })
  log.attempt("Series.alt_sign_lower_bound", () => {
    sthm(@series.alt_sign_lower_bound())
  })
  log.attempt("Series.abs_neg_pow", () => sthm(@series.abs_neg_pow_v1()))
  log.attempt("Series.abs_neg_one_pow", () => sthm(@series.abs_neg_one_pow_v1()))
  log.attempt("Series.integral_uniform_limit", () => {
    sthm(@series.integral_uniform_limit())
  })
  log.attempt("Series.integral_series", () => sthm(@series.integral_series()))
  log.attempt("Series.power_series_uniform", () => {
    sthm(@series.power_series_uniform())
  })
  log.attempt("Series.has_real_integral_pow_pos", () => {
    sthm(@series.has_real_integral_pow_pos())
  })
  log.attempt("Series.has_real_integral_pow_neg", () => {
    sthm(@series.has_real_integral_pow_neg())
  })
  log.attempt("Series.power_series_integral", () => {
    sthm(@series.power_series_integral())
  })
  log.attempt("Series.power_series_integral2", () => {
    sthm(@series.power_series_integral2())
  })
  log.attempt("Series.strict_increasing_num_le", () => {
    sthm(@series.strict_increasing_num_le())
  })
  log.attempt("Series.strict_increasing_num_lt", () => {
    sthm(@series.strict_increasing_num_lt())
  })
  log.attempt("Series.strict_increasing_num_inj", () => {
    sthm(@series.strict_increasing_num_inj())
  })
  log.attempt("Series.strict_increasing_num_le_eq", () => {
    sthm(@series.strict_increasing_num_le_eq())
  })
  log.attempt("Series.strict_increasing_num_lt_eq", () => {
    sthm(@series.strict_increasing_num_lt_eq())
  })
  log.attempt("Series.strict_increasing_num_le2", () => {
    sthm(@series.strict_increasing_num_le2())
  })
  log.attempt("Series.real_sums_image", () => sthm(@series.real_sums_image()))
  log.attempt("Series.real_summable_image", () => {
    sthm(@series.real_summable_image())
  })
  log.attempt("Series.real_sums_image_odd", () => {
    sthm(@series.real_sums_image_odd())
  })
  log.attempt("Series.real_sums_image_even", () => {
    sthm(@series.real_sums_image_even())
  })
  log.attempt("Series.n_le_pow_lemma", () => sthm(@series.n_le_pow_lemma()))
  log.attempt("Series.real_summable_lmul_eq", () => {
    sthm(@series.real_summable_lmul_eq())
  })
  log.attempt("Series.summable_power_series_shift", () => {
    sthm(@series.summable_power_series_shift())
  })
  log.attempt("Series.power_sum_derivative_shift_lemma", () => {
    sthm(@series.power_sum_derivative_shift_lemma())
  })
  log.attempt("Series.power_sum_derivative_shift_lemma2", () => {
    sthm(@series.power_sum_derivative_shift_lemma2())
  })
  log.attempt("Series.power_sum_derivative_shift_lemma3", () => {
    sthm(@series.power_sum_derivative_shift_lemma3())
  })
  log.attempt("Series.power_series_derivative_shift_lemma", () => {
    sthm(@series.power_series_derivative_shift_lemma())
  })
  log.attempt("Series.power_series_derivative_shift", () => {
    sthm(@series.power_series_derivative_shift())
  })
  log.attempt("Series.summable_power_series_derivative", () => {
    sthm(@series.summable_power_series_derivative())
  })
  log.attempt("Series.power_series_has_derivative", () => {
    sthm(@series.power_series_has_derivative())
  })
  log.attempt("Series.power_series_has_derivative2", () => {
    sthm(@series.power_series_has_derivative2())
  })
  log.attempt("Series.real_sums_i_xi", () => sthm(@series.real_sums_i_xi()))
  log.attempt("Series.real_sums_neg_i_xi", () => {
    sthm(@series.real_sums_neg_i_xi())
  })
  log.attempt("Series.real_sums_neg_xi", () => sthm(@series.real_sums_neg_xi()))
  log.attempt("Series.exp_series", () => sthm(@series.exp_series()))
  log.attempt("Series.exp_infsum", () => sthm(@series.exp_infsum()))
  log.attempt("Series.log_derivative_series", () => {
    sthm(@series.log_derivative_series())
  })
  log.attempt("Series.log_series", () => sthm(@series.log_series()))
  log.attempt("Series.log_infsum", () => sthm(@series.log_infsum()))
  log.attempt("Series.atn_derivative_series", () => {
    sthm(@series.atn_derivative_series())
  })
  log.attempt("Series.atn_series", () => sthm(@series.atn_series()))
  log.attempt("Series.atn_infsum", () => sthm(@series.atn_infsum()))
  log.attempt("Series.sin_series", () => sthm(@series.sin_series()))
  log.attempt("Series.sin_infsum", () => sthm(@series.sin_infsum()))
  log.attempt("Series.cos_series", () => sthm(@series.cos_series()))
  log.attempt("Series.cos_infsum", () => sthm(@series.cos_infsum()))
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
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|2 basis elements and 0 critical pairs
      #|0..0..1..7..20..46..solved at 65
      #|0..0..1..7..20..48..126..273..543..1165..solved at 1197
      #|0..0..1..9..24..62..148..319..650..1490..3122..6136..solved at 6441
      #|0..0..1..9..solved at 15
      #|0..0..1..2..6..solved at 13
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|0..0..1..2..solved at 6
      #|2 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|3 basis elements and 1 critical pairs
      #|3 basis elements and 0 critical pairs
      #|Generating HOL version of proof
      #|Formal_ineqs/trig/series quotations (464):
      #|  \226\136\128 x : Real, \226\136\128 n : Num, abs(pow(-x, n)) == pow(abs(x), n)
      #|  abs(real_of_num(1)) == real_of_num(1)
      #|  \226\136\128 n : Num, abs(pow(-real_of_num(1), n)) == real_of_num(1)
      #|  (k : Num) + 1 - 1 == k
      #|  ((m : Num) < (k : Num) + 1) == (m <= k)
      #|  (k : Num) + 1
      #|  (m : Num)
      #|  (l : Real)
      #|  (f : (Num) -> Real)
      #|  real_summable(from((m : Num)), (f : (Num) -> Real))
      #|  (k : Num) + 1
      #|  \226\136\128 m : Num, \226\136\128 k : Num, \226\136\128 f : (Num) -> Real, real_summable(from(m), f) && m <= k \226\134\146 real_infsum(from(m), f) == sum(op_dot_dot(m, k), f) + real_infsum(from(k + 1), f)
      #|  (t : Num) + 1 - 1 == t
      #|  (k : Num) - 1
      #|  \226\136\131 t : Num, (k : Num) == t + 1 && (m : Num) <= t
      #|  \226\136\128 m : Num, \226\136\128 k : Num, \226\136\128 f : (Num) -> Real, real_summable(from(m), f) && m < k \226\134\146 real_infsum(from(m), f) == sum(op_dot_dot(m, k - 1), f) + real_infsum(from(k), f)
      #|  from((m : Num))
      #|  (i : Num) => (u : Real) * pow(abs((x : Real)), i)
      #|  (i : Num) => (a : (Num) -> Real)(i) * pow((x : Real), i)
      #|  \226\136\128 a : (Num) -> Real, \226\136\128 u : Real, \226\136\128 x : Real, \226\136\128 m : Num, real_summable(from(m), (i : Num) => a(i) * pow(x, i)) && (\226\136\128 i : Num, m <= i \226\134\146 abs(a(i)) <= u) && abs(x) < real_of_num(1) \226\134\146 abs(real_infsum(from(m), (i : Num) => a(i) * pow(x, i))) <= u * (pow(abs(x), m) / (real_of_num(1) - abs(x)))
      #|  abs((a : (Num) -> Real)((i : Num)))
      #|  \226\136\128 a : (Num) -> Real, \226\136\128 x : Real, \226\136\128 m : Num, real_summable(from(m), (i : Num) => a(i) * pow(x, i)) && (\226\136\128 i : Num, m <= i \226\134\146 abs(a(SUC(i))) <= abs(a(i))) && abs(x) < real_of_num(1) \226\134\146 abs(real_infsum(from(m), (i : Num) => a(i) * pow(x, i))) <= abs(a(m)) * (pow(abs(x), m) / (real_of_num(1) - abs(x)))
      #|  (n : Num)
      #|  ((a : Real) == (s : Real) + (r : Real)) == (a - s == r)
      #|  (i : Num) => (a : (Num) -> Real)(i) * pow((x : Real), i)
      #|  (m : Num)
      #|  (n : Num)
      #|  \226\136\128 a : (Num) -> Real, \226\136\128 u : Real, \226\136\128 t : Real, \226\136\128 x : Real, \226\136\128 n : Num, \226\136\128 m : Num, real_sums((i : Num) => a(i) * pow(x, i), t, from(n)) && n < m && (\226\136\128 i : Num, m <= i \226\134\146 abs(a(i)) <= u) && abs(x) < real_of_num(1) \226\134\146 abs(t - sum(op_dot_dot(n, m - 1), (i : Num) => a(i) * pow(x, i))) <= u * (pow(abs(x), m) / (real_of_num(1) - abs(x)))
      #|  (n : Num)
      #|  ((a : Real) == (s : Real) + (r : Real)) == (a - s == r)
      #|  (i : Num) => (a : (Num) -> Real)(i) * pow((x : Real), i)
      #|  (m : Num)
      #|  (n : Num)
      #|  \226\136\128 a : (Num) -> Real, \226\136\128 t : Real, \226\136\128 x : Real, \226\136\128 n : Num, \226\136\128 m : Num, real_sums((i : Num) => a(i) * pow(x, i), t, from(n)) && n < m && (\226\136\128 i : Num, m <= i \226\134\146 abs(a(SUC(i))) <= abs(a(i))) && abs(x) < real_of_num(1) \226\134\146 abs(t - sum(op_dot_dot(n, m - 1), (i : Num) => a(i) * pow(x, i))) <= abs(a(m)) * (pow(abs(x), m) / (real_of_num(1) - abs(x)))
      #|  \226\136\128 a : Real, \226\136\128 b : Real, real_of_num(0) <= a * b \226\134\146 abs(a + b) == abs(a) + abs(b)
      #|  ((a : Real) * (b : Real) <= real_of_num(0)) == (real_of_num(0) <= -a * b)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, a * b <= real_of_num(0) \226\134\146 abs(a + b) == abs(abs(a) - abs(b))
      #|  ((b : Real) * b * (x : Real) <= real_of_num(0)) == (real_of_num(0) <= -(b * b) * x)
      #|  (b : Real) * (c : Real) * ((a : Real) * b) == b * b * (a * c)
      #|  real_of_num(0)
      #|  (a : Real) * (b : Real)
      #|  (b : Real) * (c : Real)
      #|  \226\136\128 a : Real, \226\136\128 b : Real, \226\136\128 c : Real, a * b <= real_of_num(0) && real_of_num(0) <= b * c && !(b == real_of_num(0)) \226\134\146 a * c <= real_of_num(0)
      #|  abs((a : Real) * a) == a * a
      #|  ((a : Real) + (c : Real)) * a == a * a + c * a
      #|  abs((b : Real)) <= abs((a : Real))
      #|  abs((c : Real)) <= abs((b : Real))
      #|  abs((a : Real) * (c : Real)) <= abs(a * a)
      #|  abs((b : Real)) <= abs((a : Real))
      #|  abs((c : Real)) <= abs((b : Real))
      #|  (a : Real) * (b : Real) == b * a
      #|  (b : Real)
      #|  (a : Real) * (c : Real) <= real_of_num(0)
      #|  (c : Real) == sum(op_dot_dot((m : Num) + 1, (n : Num)), (f : (Num) -> Real))
      #|  (b : Real) == (f : (Num) -> Real)((m : Num) + 1)
      #|  (a : Real) == (f : (Num) -> Real)((m : Num))
      #|  abs(sum(op_dot_dot((m : Num) + 1, (n : Num)), (f : (Num) -> Real))) <= abs(f(m + 1))
      #|  sum(op_dot_dot((m : Num) + 1, (n : Num)), (f : (Num) -> Real)) == real_of_num(0)
      #|  (f : (Num) -> Real)((m : Num) + 1) == real_of_num(0)
      #|  (m : Num)
      #|  (f : (Num) -> Real)
      #|  (m : Num) + 1
      #|  (n : Num)
      #|  (n : Num) - (m : Num) == SUC((t : Num))
      #|  (m : Num) <= (n : Num) && n - (m + 1) == (t : Num)
      #|  (n : Num) - (m : Num) == 0
      #|  (n : Num) < (m : Num) || n == m
      #|  (t : Num)
      #|  (n : Num)
      #|  (m : Num)
      #|  (t : Num) == (n : Num) - (m : Num)
      #|  \226\136\128 m : Num, \226\136\128 n : Num, \226\136\128 f : (Num) -> Real, (\226\136\128 k : Num, abs(f(k + 1)) <= abs(f(k)) && f(k + 1) * f(k) <= real_of_num(0)) \226\134\146 abs(sum(op_dot_dot(m, n), f)) <= abs(f(m)) && real_of_num(0) <= sum(op_dot_dot(m, n), f) * f(m)
      #|  (m : Num)
      #|  (n : Num)
      #|  (m : Num)
      #|  (k : Num)
      #|  (n : Num)
      #|  (k : Num)
      #|  (N : Num)
      #|  (e : Real)
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 k : Num, (\226\136\128 n : Num, abs(f(n + 1)) <= abs(f(n)) && f(n + 1) * f(n) <= real_of_num(0)) && op_minus_minus_minus_gt(f, real_of_num(0), sequentially) \226\134\146 (\226\136\131 l : Real, real_sums(f, l, from(k)))
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 k : Num, (\226\136\128 n : Num, abs(f(n + 1)) <= abs(f(n)) && f(n + 1) * f(n) <= real_of_num(0)) && op_minus_minus_minus_gt(f, real_of_num(0), sequentially) \226\134\146 real_summable(from(k), f)
      #|  (n : Num)
      #|  (k : Num)
      #|  0
      #|  (n : Num)
      #|  (k : Num)
      #|  0
      #|  0
      #|  abs((f : (Num) -> Real)((k : Num)))
      #|  -abs((f : (Num) -> Real)((k : Num)))
      #|  real_of_num(0)
      #|  (f : (Num) -> Real)((k : Num))
      #|  (l : Real)
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 k : Num, (\226\136\128 n : Num, abs(f(n + 1)) <= abs(f(n)) && f(n + 1) * f(n) <= real_of_num(0)) && op_minus_minus_minus_gt(f, real_of_num(0), sequentially) \226\134\146 (\226\136\131 l : Real, real_sums(f, l, from(k)) && abs(l) <= abs(f(k)) && real_of_num(0) <= l * f(k))
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 k : Num, (\226\136\128 n : Num, abs(f(n + 1)) <= abs(f(n)) && f(n + 1) * f(n) <= real_of_num(0)) && op_minus_minus_minus_gt(f, real_of_num(0), sequentially) \226\134\146 abs(real_infsum(from(k), f)) <= abs(f(k))
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 m : Num, \226\136\128 k : Num, (\226\136\128 n : Num, abs(f(n + 1)) <= abs(f(n)) && f(n + 1) * f(n) <= real_of_num(0)) && op_minus_minus_minus_gt(f, real_of_num(0), sequentially) && m < k \226\134\146 abs(real_infsum(from(m), f) - sum(op_dot_dot(m, k - 1), f)) <= abs(f(k))
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 m : Num, \226\136\128 k : Num, (\226\136\128 n : Num, abs(f(n + 1)) <= abs(f(n)) && f(n + 1) * f(n) <= real_of_num(0)) && op_minus_minus_minus_gt(f, real_of_num(0), sequentially) && m < k \226\134\146 real_infsum(from(m), f) <= sum(op_dot_dot(m, k - 1), f) + abs(f(k))
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 m : Num, \226\136\128 k : Num, (\226\136\128 n : Num, abs(f(n + 1)) <= abs(f(n)) && f(n + 1) * f(n) <= real_of_num(0)) && op_minus_minus_minus_gt(f, real_of_num(0), sequentially) && m < k \226\134\146 sum(op_dot_dot(m, k - 1), f) - abs(f(k)) <= real_infsum(from(m), f)
      #|  \226\136\128 x : Real, \226\136\128 n : Num, abs(pow(-x, n)) == pow(abs(x), n)
      #|  \226\136\128 n : Num, abs(pow(-real_of_num(1), n)) == real_of_num(1)
      #|  !((b : Real) <= (a : Real))
      #|  !((b : Real) <= (a : Real))
      #|  real_of_num(0) < (e : Real)
      #|  (x : Real) => (f : (Num, Real) -> Real)((n : Num), x) - (g : (Real) -> Real)(x)
      #|  !((b : Real) <= (a : Real))
      #|  (e : Real) / real_of_num(2) == e / real_of_num(2) / ((b : Real) - (a : Real)) * (b - a)
      #|  real_of_num(0) < (e : Real)
      #|  (e : Real) / real_of_num(2)
      #|  (N : Num)
      #|  (e : Real) / real_of_num(2) / ((b : Real) - (a : Real))
      #|  real_of_num(0) < (e : Real)
      #|  has_real_integral((g : (Real) -> Real), (y : Real), real_interval([((a : Real), (b : Real))]))
      #|  (n : Num)
      #|  0
      #|  (b : Real) <= (a : Real)
      #|  (y : Real)
      #|  (s : (Num) -> Real)((N : Num))
      #|  abs((a : Real) - (b : Real)) == abs(b - a)
      #|  (N : Num)
      #|  (f : (Num, Real) -> Real)((N : Num))
      #|  (b : Real)
      #|  (a : Real)
      #|  (g : (Real) -> Real)
      #|  \226\136\128 f : (Num, Real) -> Real, \226\136\128 g : (Real) -> Real, \226\136\128 s : (Num) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, (\226\136\128 e : Real, real_of_num(0) < e \226\134\146 (\226\136\131 N : Num, \226\136\128 n : Num, \226\136\128 x : Real, N <= n && IN(x, real_interval([(a, b)])) \226\134\146 abs(f(n, x) - g(x)) < e)) && (\226\136\128 n : Num, has_real_integral(f(n), s(n), real_interval([(a, b)]))) \226\134\146 (\226\136\131 r : Real, has_real_integral(g, r, real_interval([(a, b)])) && op_minus_minus_minus_gt(s, r, sequentially))
      #|  (n : Num) => (x : Real) => sum(INTER((s : (Num) -> Bool), op_dot_dot(0, n)), (i : Num) => (f : (Num, Real) -> Real)(i, x))
      #|  \226\136\128 f : (Num, Real) -> Real, \226\136\128 g : (Real) -> Real, \226\136\128 s : (Num) -> Bool, \226\136\128 r : (Num) -> Real, \226\136\128 a : Real, \226\136\128 b : Real, (\226\136\128 e : Real, real_of_num(0) < e \226\134\146 (\226\136\131 N : Num, \226\136\128 n : Num, \226\136\128 x : Real, N <= n && IN(x, real_interval([(a, b)])) \226\134\146 abs(sum(INTER(s, op_dot_dot(0, n)), (i : Num) => f(i, x)) - g(x)) < e)) && (\226\136\128 n : Num, has_real_integral(f(n), r(n), real_interval([(a, b)]))) \226\134\146 (\226\136\131 v : Real, has_real_integral(g, v, real_interval([(a, b)])) && real_sums(r, v, s))
      #|  ((i : Num) => Cx((a : (Num) -> Real)(i) * pow((x : Real), i))) == o(Cx, (i : Num) => a(i) * pow(x, i))
      #|  (x : Real) <= abs((t : Real))
      #|  -abs((t : Real)) <= (x : Real)
      #|  abs((t : Real)) < abs((y : Real))
      #|  (y : Real)
      #|  real_summable((s : (Num) -> Bool), (i : Num) => (a : (Num) -> Real)(i) * pow((x : Real), i))
      #|  infsum((s : (Num) -> Bool), (i : Num) => Cx((a : (Num) -> Real)(i) * pow((x : Real), i))) == Cx(real_infsum(s, (i : Num) => a(i) * pow(x, i)))
      #|  ((i : Num) => o(Cx, (a : (Num) -> Real), i) * pow(Cx((x : Real)), i)) == ((i : Num) => Cx(a(i) * pow(x, i)))
      #|  (M : Real) * (abs((y : Real)) - abs((t : Real)))
      #|  Cx((x : Real))
      #|  (n : Num)
      #|  (N : Num)
      #|  o(Cx, (i : Num) => (a : (Num) -> Real)(i) * pow((y : Real), i)) == ((i : Num) => Cx(a(i)) * pow(Cx(y), i))
      #|  real_summable((s : (Num) -> Bool), (i : Num) => (a : (Num) -> Real)(i) * pow((y : Real), i))
      #|  (e : Real)
      #|  (s : (Num) -> Bool)
      #|  Cx((y : Real))
      #|  o(Cx, (a : (Num) -> Real))
      #|  (M : Real)
      #|  abs((t : Real)) < abs((y : Real))
      #|  abs((t : Real)) < abs((y : Real))
      #|  real_of_num(0) < (M : Real) && M * (abs((y : Real)) - abs((t : Real))) == abs(y) + abs(t)
      #|  (M : Real) == (abs((y : Real)) + abs((t : Real))) / (abs(y) - abs(t))
      #|  \226\136\128 a : (Num) -> Real, \226\136\128 s : (Num) -> Bool, \226\136\128 t : Real, \226\136\128 y : Real, real_summable(s, (i : Num) => a(i) * pow(y, i)) && abs(t) < abs(y) \226\134\146 (\226\136\128 e : Real, real_of_num(0) < e \226\134\146 (\226\136\131 N : Num, \226\136\128 n : Num, \226\136\128 x : Real, N <= n && IN(x, real_interval([(-abs(t), abs(t))])) \226\134\146 abs(sum(INTER(s, op_dot_dot(0, n)), (i : Num) => a(i) * pow(x, i)) - real_infsum(s, (i : Num) => a(i) * pow(x, i))) < e))
      #|  !((n : Num) + 1 == 0)
      #|  !(real_of_num((n : Num) + 1) == real_of_num(0))
      #|  (a : Real) * (b : Real) * (c : Real) == a * c * b
      #|  (a : Real)
      #|  real_of_num(0)
      #|  (t : Real) => pow(t, (n : Num))
      #|  (t : Real) => pow(t, (n : Num) + 1) / real_of_num(n + 1)
      #|  \226\136\128 n : Num, \226\136\128 a : Real, real_of_num(0) <= a \226\134\146 has_real_integral((x : Real) => pow(x, n), pow(a, n + 1) / real_of_num(n + 1), real_interval([(real_of_num(0), a)]))
      #|  !((n : Num) + 1 == 0)
      #|  !(real_of_num((n : Num) + 1) == real_of_num(0))
      #|  (a : Real) * (b : Real) * (c : Real) == a * c * b
      #|  real_of_num(0)
      #|  (a : Real)
      #|  (t : Real) => pow(t, (n : Num))
      #|  (t : Real) => pow(t, (n : Num) + 1) / real_of_num(n + 1)
      #|  \226\136\128 n : Num, \226\136\128 a : Real, a <= real_of_num(0) \226\134\146 has_real_integral((x : Real) => pow(x, n), -(pow(a, n + 1) / real_of_num(n + 1)), real_interval([(a, real_of_num(0))]))
      #|  -((a : Real) * (-real_of_num(1) * (b : Real))) == a * b
      #|  !((x : Real) < real_of_num(0)) \226\134\146 min(x, real_of_num(0)) == real_of_num(0) && max(x, real_of_num(0)) == x
      #|  (x : Real) < real_of_num(0) \226\134\146 min(x, real_of_num(0)) == x && max(x, real_of_num(0)) == real_of_num(0)
      #|  (v : Real) == (if (x : Real) < real_of_num(0) { -(v' : Real) } else { v' })
      #|  !((x : Real) < real_of_num(0)) \226\134\146 min(x, real_of_num(0)) == real_of_num(0) && max(x, real_of_num(0)) == x
      #|  -real_of_num(1) * (t : Real) == -t
      #|  (x : Real) < real_of_num(0) \226\134\146 min(x, real_of_num(0)) == x && max(x, real_of_num(0)) == real_of_num(0)
      #|  abs((x : Real)) < (r : Real)
      #|  real_infsum((s : (Num) -> Bool), (i : Num) => (a : (Num) -> Real)(i) * pow((x' : Real), i)) == (f : (Real) -> Real)(x')
      #|  (x' : Real)
      #|  (n : Num)
      #|  (N : Num)
      #|  abs((x : Real)) < (r : Real)
      #|  (f : (Real) -> Real)((y : Real))
      #|  abs((x : Real)) < (r : Real)
      #|  (y : Real)
      #|  (x : Real)
      #|  (s : (Num) -> Bool)
      #|  (a : (Num) -> Real)
      #|  (y : Real) == abs((x : Real)) + ((r : Real) - abs(x)) / real_of_num(2)
      #|  max((x : Real), real_of_num(0))
      #|  min((x : Real), real_of_num(0))
      #|  (i : Num) => (a : (Num) -> Real)(i) * ((if (x : Real) < real_of_num(0) { -real_of_num(1) } else { real_of_num(1) }) * (pow(x, i + 1) / real_of_num(i + 1)))
      #|  (s : (Num) -> Bool)
      #|  (f : (Real) -> Real)
      #|  (i : Num) => (x : Real) => (a : (Num) -> Real)(i) * pow(x, i)
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 a : (Num) -> Real, \226\136\128 s : (Num) -> Bool, \226\136\128 r : Real, (\226\136\128 x : Real, abs(x) < r \226\134\146 real_sums((i : Num) => a(i) * pow(x, i), f(x), s)) \226\134\146 (\226\136\128 x : Real, abs(x) < r \226\134\146 LET((v : Real) => LET_END(real_sums((i : Num) => a(i) * (pow(x, i + 1) / real_of_num(i + 1)), v, s)), if x < real_of_num(0) { -real_integral(real_interval([(x, real_of_num(0))]), f) } else { real_integral(real_interval([(real_of_num(0), x)]), f) }))
      #|  (x : Real)
      #|  real_of_num(0)
      #|  (f' : (Real) -> Real)
      #|  (f : (Real) -> Real)
      #|  real_of_num(0)
      #|  (x : Real)
      #|  (f' : (Real) -> Real)
      #|  (f : (Real) -> Real)
      #|  (v : Real) == (f : (Real) -> Real)((x : Real)) - f(real_of_num(0))
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 f' : (Real) -> Real, \226\136\128 a : (Num) -> Real, \226\136\128 s : (Num) -> Bool, \226\136\128 r : Real, (\226\136\128 x : Real, abs(x) < r \226\134\146 has_real_derivative(f, f'(x), atreal(x))) && (\226\136\128 x : Real, abs(x) < r \226\134\146 real_sums((i : Num) => a(i) * pow(x, i), f'(x), s)) \226\134\146 (\226\136\128 x : Real, abs(x) < r \226\134\146 real_sums((i : Num) => a(i) * (pow(x, i + 1) / real_of_num(i + 1)), f(x) - f(real_of_num(0)), s))
      #|  (n : Num)
      #|  \226\136\128 h : (Num) -> Num, (\226\136\128 n : Num, h(n) < h(n + 1)) \226\134\146 (\226\136\128 n : Num, n <= h(n))
      #|  (m : Num)
      #|  SUC((n : Num)) == (m : Num)
      #|  (m : Num) == 0
      #|  (m : Num)
      #|  \226\136\128 h : (Num) -> Num, (\226\136\128 n : Num, h(n) < h(n + 1)) \226\134\146 (\226\136\128 n : Num, \226\136\128 m : Num, n < m \226\134\146 h(n) < h(m))
      #|  (n : Num) == (m : Num) || n < m || m < n
      #|  \226\136\128 h : (Num) -> Num, (\226\136\128 n : Num, h(n) < h(n + 1)) \226\134\146 (\226\136\128 n : Num, \226\136\128 m : Num, h(n) == h(m) \226\134\146 n == m)
      #|  \226\136\128 h : (Num) -> Num, (\226\136\128 n : Num, h(n) < h(n + 1)) \226\134\146 (\226\136\128 n : Num, \226\136\128 m : Num, (h(n) <= h(m)) == (n <= m))
      #|  \226\136\128 h : (Num) -> Num, (\226\136\128 n : Num, h(n) < h(n + 1)) \226\134\146 (\226\136\128 n : Num, \226\136\128 m : Num, (h(n) < h(m)) == (n < m))
      #|  \226\136\128 h : (Num) -> Num, (\226\136\128 n : Num, h(n) < h(n + 1)) \226\134\146 (\226\136\128 n : Num, \226\136\128 m : Num, h(n) <= m \226\134\146 n <= m)
      #|  \226\136\128 x : Num, \226\136\128 y : Num, IN(x, INTER((s : (Num) -> Bool), op_dot_dot(0, (k : Num)))) && IN(y, INTER(s, op_dot_dot(0, k))) && (h : (Num) -> Num)(x) == h(y) \226\134\146 x == y
      #|  (k : Num)
      #|  (k : Num)
      #|  (x' : Num)
      #|  (x' : Num)
      #|  (x : Num) == (h : (Num) -> Num)((x' : Num))
      #|  (x' : Num)
      #|  INTER(IMAGE((h : (Num) -> Num), (s : (Num) -> Bool)), op_dot_dot(0, (n : Num))) == IMAGE(h, INTER(s, op_dot_dot(0, (k : Num))))
      #|  (N : Num)
      #|  (N : Num) <= (k : Num)
      #|  (n : Num)
      #|  (N : Num)
      #|  (h : (Num) -> Num)((k : Num)) <= (n : Num) && (\226\136\128 i : Num, h(i) <= n \226\134\146 i <= k)
      #|  (k : Num) == select((t : Num) => (h : (Num) -> Num)(t) <= (n : Num) && (\226\136\128 i : Num, h(i) <= n \226\134\146 i <= t))
      #|  (h : (Num) -> Num)((N : Num))
      #|  \226\136\128 x : Num, \226\136\128 y : Num, IN(x, INTER((s : (Num) -> Bool), op_dot_dot(0, (n : Num)))) && IN(y, INTER(s, op_dot_dot(0, n))) && (h : (Num) -> Num)(x) == h(y) \226\134\146 x == y
      #|  (m : Num)
      #|  (x' : Num)
      #|  (x' : Num)
      #|  (n : Num)
      #|  (N : Num) <= (n : Num)
      #|  (h : (Num) -> Num)((n : Num))
      #|  \226\136\131 m : Num, (N : Num) <= m && INTER(IMAGE((h : (Num) -> Num), (s : (Num) -> Bool)), op_dot_dot(0, m)) == IMAGE(h, INTER(s, op_dot_dot(0, (n : Num))))
      #|  (N : Num)
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 h : (Num) -> Num, \226\136\128 s : (Num) -> Bool, \226\136\128 l : Real, (\226\136\128 n : Num, h(n) < h(n + 1)) \226\134\146 real_sums(f, l, IMAGE(h, s)) == real_sums(o(f, h), l, s)
      #|  (l : Real)
      #|  (l : Real)
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 h : (Num) -> Num, \226\136\128 s : (Num) -> Bool, (\226\136\128 n : Num, h(n) < h(n + 1)) \226\134\146 real_summable(IMAGE(h, s), f) == real_summable(s, o(f, h))
      #|  o((f : (Num) -> Real), (h : (Num) -> Num)) == ((i : Num) => f(2 * i + 1))
      #|  \226\136\128 n : Num, (h : (Num) -> Num)(n) < h(n + 1)
      #|  ODD == IMAGE((h : (Num) -> Num), UNIV)
      #|  (h : (Num) -> Num) == ((i : Num) => 2 * i + 1)
      #|  ODD
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 l : Real, real_sums((i : Num) => if ODD(i) { f(i) } else { real_of_num(0) }, l, UNIV) == real_sums((i : Num) => f(2 * i + 1), l, UNIV)
      #|  o((f : (Num) -> Real), (h : (Num) -> Num)) == ((i : Num) => f(2 * i))
      #|  \226\136\128 n : Num, (h : (Num) -> Num)(n) < h(n + 1)
      #|  EVEN == IMAGE((h : (Num) -> Num), UNIV)
      #|  (h : (Num) -> Num) == ((i : Num) => 2 * i)
      #|  EVEN
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 l : Real, real_sums((i : Num) => if EVEN(i) { f(i) } else { real_of_num(0) }, l, UNIV) == real_sums((i : Num) => f(2 * i), l, UNIV)
      #|  real_of_num(0) < (e : Real) \226\134\146 real_of_num(0) <= e
      #|  (r : Real) == sum({2}, (i : Num) => r)
      #|  (r : Real) == sum(op_dot_dot(0, (i : Num)), (k : Num) => if IN(k, {2}) { r } else { real_of_num(0) })
      #|  (r : Real) == real_of_num(binom(((i : Num), 2))) * pow((e : Real), 2)
      #|  real_of_num(1) + (e : Real) == e + real_of_num(1)
      #|  (n : Num) <= (i : Num)
      #|  (real_of_num(2) <= real_of_num(2) * real_of_num(1) + (x : Real)) == (real_of_num(0) <= x)
      #|  real_of_num(0) < (e : Real) \226\134\146 !(e == real_of_num(0))
      #|  ((a : Real) / (b : Real) + real_of_num(1)) * b == a * (inv(b) * b) + b
      #|  (real_of_num(2) / pow((e : Real), 2) + real_of_num(1)) * pow(e, 2)
      #|  (real_of_num((n : Num)) - real_of_num(1)) * pow((e : Real), 2)
      #|  ((x : Real) <= x * ((b : Real) / real_of_num(2)) * (c : Real)) == (x * real_of_num(2) <= x * (b * c))
      #|  real_of_num(binom(((i : Num), 2))) == real_of_num(i) * ((real_of_num(i) - real_of_num(1)) / real_of_num(2))
      #|  ((a : Real) <= (b : Real) + a) == (real_of_num(0) <= b)
      #|  real_of_num(2) / pow((e : Real), 2) + real_of_num(2)
      #|  (n : Num)
      #|  2 <= (i : Num)
      #|  real_of_num(binom(((i : Num), 2))) * pow((e : Real), 2)
      #|  (i : Num)
      #|  (n : Num)
      #|  real_of_num(2) / pow((e : Real), 2) + real_of_num(2)
      #|  \226\136\128 e : Real, real_of_num(0) < e \226\134\146 (\226\136\131 N : Num, \226\136\128 n : Num, N <= n \226\134\146 real_of_num(n) <= pow(real_of_num(1) + e, n))
      #|  (f : (Num) -> Real) == ((i : Num) => inv((c : Real)) * (c * f(i)))
      #|  \226\136\128 c : Real, \226\136\128 f : (Num) -> Real, \226\136\128 s : (Num) -> Bool, !(c == real_of_num(0)) \226\134\146 real_summable(s, (i : Num) => c * f(i)) == real_summable(s, f)
      #|  (x : Real) * ((a : Real) * ((x2 : Real) / x)) == x / x * (a * x2)
      #|  (k : Num)
      #|  (s : (Num) -> Bool)
      #|  (i : Num) => pow((x : Real), (k : Num)) * ((a : (Num) -> Real)(i) * pow(x, i - k))
      #|  (i : Num) => (a : (Num) -> Real)(i) * pow((x : Real), i)
      #|  pow((x : Real), (k : Num))
      #|  (n : Num) >= (k : Num) + 2 \226\134\146 !(n - k == 0)
      #|  (k : Num) + 2
      #|  (n : Num) => real_of_num(0)
      #|  (x : Real) == real_of_num(0)
      #|  \226\136\128 k : Num, \226\136\128 s : (Num) -> Bool, \226\136\128 a : (Num) -> Real, \226\136\128 x : Real, real_summable(s, (i : Num) => a(i) * pow(x, i)) \226\134\146 real_summable(s, (i : Num) => a(i) * pow(x, i - k))
      #|  (((A : Bool) && (B : Bool)) && ((!A || (C : Bool)) || !B)) == (A && B && C)
      #|  \226\136\128 a : (Num) -> Real, \226\136\128 s : (Num) -> Bool, \226\136\128 n : Num, sum(INTER(DIFF(s, {0}), op_dot_dot(0, n)), (i : Num) => real_of_num(i) * a(i)) == sum(INTER(s, op_dot_dot(0, n)), (i : Num) => real_of_num(i) * a(i))
      #|  !((x : Num) == 0) \226\134\146 SUC(PRE(x)) == x
      #|  (t : (Num) -> Bool)
      #|  (i : Num) => real_of_num(SUC(i)) * (a : (Num) -> Real)(SUC(i))
      #|  PRE
      #|  (t : (Num) -> Bool) == INTER(DIFF((s : (Num) -> Bool), {0}), op_dot_dot(0, (n : Num)))
      #|  (x' : Num)
      #|  (x' : Num)
      #|  INTER(IMAGE(PRE, DIFF((s : (Num) -> Bool), {0})), op_dot_dot(0, PRE((n : Num)))) == IMAGE(PRE, INTER(DIFF(s, {0}), op_dot_dot(0, n)))
      #|  \226\136\128 a : (Num) -> Real, \226\136\128 s : (Num) -> Bool, \226\136\128 n : Num, 0 < n \226\134\146 sum(INTER(IMAGE(PRE, DIFF(s, {0})), op_dot_dot(0, PRE(n))), (i : Num) => real_of_num(SUC(i)) * a(SUC(i))) == sum(INTER(s, op_dot_dot(0, n)), (i : Num) => real_of_num(i) * a(i))
      #|  SUC((i : Num)) - 1 == i
      #|  (n : Num)
      #|  (s : (Num) -> Bool)
      #|  (i : Num) => (a : (Num) -> Real)(i) * pow((x : Real), i - 1)
      #|  \226\136\128 a : (Num) -> Real, \226\136\128 s : (Num) -> Bool, \226\136\128 n : Num, \226\136\128 x : Real, 0 < n \226\134\146 sum(INTER(IMAGE(PRE, DIFF(s, {0})), op_dot_dot(0, PRE(n))), (i : Num) => real_of_num(SUC(i)) * a(SUC(i)) * pow(x, i)) == sum(INTER(s, op_dot_dot(0, n)), (i : Num) => real_of_num(i) * a(i) * pow(x, i - 1))
      #|  \226\136\128 a : (Num) -> Real, \226\136\128 s : (Num) -> Bool, \226\136\128 l : Real, real_sums((i : Num) => real_of_num(i) * a(i), l, s) == real_sums((i : Num) => real_of_num(i) * a(i), l, DIFF(s, {0}))
      #|  !((a : Num) == 0) \226\134\146 SUC(PRE(a)) == a
      #|  (x : Num)
      #|  PRE((x : Num))
      #|  SUC((n : Num)) < SUC(n + 1)
      #|  (t : (Num) -> Bool)
      #|  SUC
      #|  (i : Num) => real_of_num(i) * (a : (Num) -> Real)(i) * pow((x : Real), i - 1)
      #|  SUC((n : Num)) - 1 == n
      #|  ((i : Num) => real_of_num(SUC(i)) * (a : (Num) -> Real)(SUC(i)) * pow((x : Real), i)) == o((i : Num) => real_of_num(i) * a(i) * pow(x, i - 1), SUC)
      #|  (t : (Num) -> Bool) == IMAGE(PRE, DIFF((s : (Num) -> Bool), {0}))
      #|  \226\136\128 a : (Num) -> Real, \226\136\128 s : (Num) -> Bool, \226\136\128 x : Real, \226\136\128 l : Real, real_sums((i : Num) => real_of_num(i) * a(i) * pow(x, i - 1), l, s) == real_sums((i : Num) => real_of_num(SUC(i)) * a(SUC(i)) * pow(x, i), l, IMAGE(PRE, DIFF(s, {0})))
      #|  abs(real_of_num((n : Num))) == real_of_num(n)
      #|  real_of_num(0) < (e : Real) \226\134\146 abs(real_of_num(1) + e) == real_of_num(1) + e
      #|  abs((a : (Num) -> Real)((n : Num))) * (pow((t : Real), n) * (y : Real)) == y * abs(a(n)) * pow(t, n)
      #|  (N : Num)
      #|  (e : Real)
      #|  abs((x : Real)) < (y : Real) \226\134\146 abs(y) == y
      #|  (y : Real)
      #|  (i : Num) => abs((a : (Num) -> Real)(i) * pow((x : Real) * (real_of_num(1) + (e : Real)), i))
      #|  abs((x : Real)) < (y : Real)
      #|  \226\136\128 x : Real, !(x == real_of_num(0)) \226\134\146 x * (((y : Real) / x - real_of_num(1)) / real_of_num(2)) == (y - x) / real_of_num(2)
      #|  (x : Real) * (real_of_num(1) + (e : Real)) == x + x * e
      #|  real_of_num(0) < (e : Real) \226\134\146 abs(real_of_num(1) + e) == real_of_num(1) + e
      #|  abs((x : Real) * (real_of_num(1) + (e : Real))) < (y : Real)
      #|  (real_of_num(0) < (a : Real) - (b : Real)) == (b < a)
      #|  real_of_num(0) < (e : Real)
      #|  (e : Real) == ((y : Real) / abs((x : Real)) - real_of_num(1)) / real_of_num(2)
      #|  !((y : Real) == real_of_num(0)) && real_of_num(0) < y && real_of_num(0) < abs((x : Real)) && !(abs(x) == real_of_num(0))
      #|  (n : Num) >= 2 \226\134\146 !(n == 0)
      #|  2
      #|  (n : Num) => real_of_num(0)
      #|  (x : Real) == real_of_num(0)
      #|  \226\136\128 a : (Num) -> Real, \226\136\128 s : (Num) -> Bool, \226\136\128 y : Real, real_summable(s, (i : Num) => a(i) * pow(y, i)) \226\134\146 (\226\136\128 x : Real, abs(x) < y \226\134\146 real_summable(s, (i : Num) => real_of_num(i) * a(i) * pow(x, i - 1)))
      #|  (f : (Real) -> Real)((w : Real))
      #|  (w : Real)
      #|  (s : (Num) -> Bool)
      #|  (a : (Num) -> Real)
      #|  abs((x : Real)) < (w : Real)
      #|  IN((x : Real), real_interval((-(w : Real), w))) && real_open(real_interval((-w, w)))
      #|  abs((x : Real)) < (w : Real)
      #|  ((w : Real) - abs((x : Real))) / real_of_num(2)
      #|  (g : (Real) -> Real)
      #|  (x : Real)
      #|  (y : Real)
      #|  (s : (Num) -> Bool)
      #|  (n : Num) => (a : (Num) -> Real)(n) * pow((y : Real), n)
      #|  (y : Real)
      #|  \226\136\128 y : Real, abs(y) < (w : Real) \226\134\146 (g : (Real) -> Real)(y) == (f : (Real) -> Real)(y)
      #|  (x : Real) => real_infsum((s : (Num) -> Bool), (i : Num) => real_of_num(i) * (a : (Num) -> Real)(i) * pow(x, i - 1))
      #|  (n : Num) >= 1 \226\134\146 !(n == 0)
      #|  1
      #|  real_of_num(0)
      #|  (n : Num) => real_of_num(0)
      #|  real_of_num(0)
      #|  (t : Real)
      #|  PRE((n : Num))
      #|  0 < (n : Num)
      #|  (t : Real)
      #|  (N : Num) + 1
      #|  (e : Real)
      #|  (y : Real)
      #|  (w : Real)
      #|  IMAGE(PRE, DIFF((s : (Num) -> Bool), {0}))
      #|  (i : Num) => real_of_num(SUC(i)) * (a : (Num) -> Real)(SUC(i))
      #|  (f : (Real) -> Real)((y2 : Real))
      #|  (y2 : Real)
      #|  (s : (Num) -> Bool)
      #|  (a : (Num) -> Real)
      #|  real_of_num(0) < (y : Real) && abs(y) < (r : Real) && (w : Real) < y && abs(w) < y && abs(w) < abs(y) && real_of_num(0) < (y2 : Real) && abs(y2) < r && y < y2 && abs(y) < abs(y2) && abs(y) < y2
      #|  (y2 : Real) == ((y : Real) + (r : Real)) / real_of_num(2)
      #|  (y : Real) == ((r : Real) + (w : Real)) / real_of_num(2)
      #|  (s : (Num) -> Bool)
      #|  (x : Real) => real_infsum((s : (Num) -> Bool), (i : Num) => real_of_num(i) * (a : (Num) -> Real)(i) * pow(x, i - 1))
      #|  (i : Num) => (x : Real) => real_of_num(i) * (a : (Num) -> Real)(i) * pow(x, i - 1)
      #|  (i : Num) => (x : Real) => (a : (Num) -> Real)(i) * pow(x, i)
      #|  real_interval((-(w : Real), w))
      #|  (abs((x : Real)) + (r : Real)) / real_of_num(2)
      #|  (x : Real) => (p : (Real, Real) -> Real)((abs(x) + (r : Real)) / real_of_num(2), x)
      #|  (p : (Real, Real) -> Real)
      #|  (\226\136\128 w : Real, real_of_num(0) < w && abs(w) < (r : Real) && w < r && abs(w) < abs(r) \226\134\146 (\226\136\131 f' : (Real) -> Real, \226\136\128 x : Real, abs(x) < w \226\134\146 has_real_derivative((f : (Real) -> Real), f'(x), atreal(x)) && real_sums((i : Num) => real_of_num(i) * (a : (Num) -> Real)(i) * pow(x, i - 1), f'(x), (s : (Num) -> Bool)))) \226\134\146 (\226\136\131 f' : (Real) -> Real, \226\136\128 x : Real, abs(x) < r \226\134\146 has_real_derivative(f, f'(x), atreal(x)) && real_sums((i : Num) => real_of_num(i) * a(i) * pow(x, i - 1), f'(x), s))
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 a : (Num) -> Real, \226\136\128 s : (Num) -> Bool, \226\136\128 r : Real, (\226\136\128 x : Real, abs(x) < r \226\134\146 real_sums((i : Num) => a(i) * pow(x, i), f(x), s)) \226\134\146 (\226\136\131 f' : (Real) -> Real, \226\136\128 x : Real, abs(x) < r \226\134\146 has_real_derivative(f, f'(x), atreal(x)) && real_sums((i : Num) => real_of_num(i) * a(i) * pow(x, i - 1), f'(x), s))
      #|  SUC((x : Num))
      #|  IMAGE(PRE, DIFF(UNIV, {0})) == UNIV
      #|  \226\136\128 f : (Real) -> Real, \226\136\128 a : (Num) -> Real, \226\136\128 r : Real, (\226\136\128 x : Real, abs(x) < r \226\134\146 real_sums((i : Num) => a(i) * pow(x, i), f(x), UNIV)) \226\134\146 (\226\136\131 f' : (Real) -> Real, \226\136\128 x : Real, abs(x) < r \226\134\146 has_real_derivative(f, f'(x), atreal(x)) && real_sums((i : Num) => real_of_num(SUC(i)) * a(SUC(i)) * pow(x, i), f'(x), UNIV))
      #|  !((n : Num) == 0) \226\134\146 SUC(n - 1) == n
      #|  (x : Real) * real_of_num((n : Num)) * (t : Real) == real_of_num(n) * (x * t)
      #|  (n : Num) == 0
      #|  \226\136\128 n : Num, (x : Real) * real_of_num(n) * pow(x, n - 1) == real_of_num(n) * pow(x, n)
      #|  (x : Real)
      #|  abs((x : Real)) < real_of_num(1) \226\134\146 !(real_of_num(1) - x == real_of_num(0))
      #|  (x : Real)
      #|  (x : Real) => real_of_num(1) / (real_of_num(1) - x)
      #|  (f' : (Real) -> Real)((x : Real)) == real_of_num(1) / pow(real_of_num(1) - x, 2)
      #|  (x : Real)
      #|  0
      #|  real_of_num(1)
      #|  (UNIV : (Num) -> Bool)
      #|  (i : Num) => real_of_num(1)
      #|  (x : Real) => real_of_num(1) / (real_of_num(1) - x)
      #|  \226\136\128 x : Real, abs(x) < real_of_num(1) \226\134\146 real_sums((i : Num) => real_of_num(i) * pow(x, i), x / pow(real_of_num(1) - x, 2), UNIV)
      #|  -(x : Real) / (a : Real) == -(x / a) && real_of_num(1) - -x == real_of_num(1) + x
      #|  real_of_num((i : Num)) * ((a : Real) * (b : Real)) == a * real_of_num(i) * b
      #|  -real_of_num(1) * (x : Real) == -x
      #|  -(x : Real) == -real_of_num(1) * x
      #|  -(x : Real)
      #|  \226\136\128 x : Real, abs(x) < real_of_num(1) \226\134\146 real_sums((i : Num) => pow(-real_of_num(1), i) * real_of_num(i) * pow(x, i), -(x / pow(real_of_num(1) + x, 2)), UNIV)
      #|  (a : Real) - -(b : Real) == a + b
      #|  -real_of_num(1) * (x : Real) == -x
      #|  -(x : Real) == -real_of_num(1) * x
      #|  -(x : Real)
      #|  0
      #|  \226\136\128 x : Real, abs(x) < real_of_num(1) \226\134\146 real_sums((i : Num) => pow(-real_of_num(1), i) * pow(x, i), real_of_num(1) / (real_of_num(1) + x), UNIV)
      #|  o(lift, (k : Num) => real_of_num(1) / real_of_num(FACT(k)) * pow((x : Real), k)) == ((k : Num) => lift(real_of_num(1) / real_of_num(FACT(k)) * pow(x, k)))
      #|  real_of_num(1) / (a : Real) * (b : Real) == b / a
      #|  \226\136\128 n : Num, pow(Cx((x : Real)), n) / Cx(real_of_num(FACT(n))) == Cx(real_of_num(1) / real_of_num(FACT(n)) * pow(x, n))
      #|  Cx((x : Real))
      #|  \226\136\128 x : Real, real_sums((k : Num) => real_of_num(1) / real_of_num(FACT(k)) * pow(x, k), exp(x), UNIV)
      #|  \226\136\128 x : Real, real_infsum(from(0), (k : Num) => real_of_num(1) / real_of_num(FACT(k)) * pow(x, k)) == exp(x)
      #|  (a : Real) - -real_of_num(1) * (x : Real) == a + x
      #|  abs(-real_of_num(1) * (x : Real)) == abs(x)
      #|  -real_of_num(1) * (x : Real)
      #|  0
      #|  \226\136\128 x : Real, abs(x) < real_of_num(1) \226\134\146 real_sums((k : Num) => pow(-real_of_num(1), k) * pow(x, k), inv(real_of_num(1) + x), UNIV)
      #|  (a : Real) * ((x : Real) / (b : Real)) == a / b * x
      #|  (x : Real)
      #|  real_of_num(1)
      #|  (UNIV : (Num) -> Bool)
      #|  (k : Num) => pow(-real_of_num(1), k)
      #|  (x : Real) => inv(real_of_num(1) + x)
      #|  (x : Real) => log(real_of_num(1) + x)
      #|  \226\136\128 x : Real, abs(x) < real_of_num(1) \226\134\146 real_sums((k : Num) => pow(-real_of_num(1), k) / real_of_num(k + 1) * pow(x, k + 1), log(real_of_num(1) + x), UNIV)
      #|  \226\136\128 x : Real, abs(x) < real_of_num(1) \226\134\146 real_infsum(from(0), (k : Num) => pow(-real_of_num(1), k) / real_of_num(k + 1) * pow(x, k + 1)) == log(real_of_num(1) + x)
      #|  DIV(2 * (k : Num), 2) == k
      #|  abs(-real_of_num(1)) == real_of_num(1)
      #|  -real_of_num(1) * pow((x : Real), 2)
      #|  0
      #|  \226\136\128 x : Real, abs(x) < real_of_num(1) \226\134\146 real_sums((k : Num) => (if EVEN(k) { pow(-real_of_num(1), DIV(k, 2)) } else { real_of_num(0) }) * pow(x, k), inv(real_of_num(1) + pow(x, 2)), UNIV)
      #|  DIV(2 * (i : Num), 2) == i
      #|  (x : Real)
      #|  real_of_num(1)
      #|  (UNIV : (Num) -> Bool)
      #|  (k : Num) => if EVEN(k) { pow(-real_of_num(1), DIV(k, 2)) } else { real_of_num(0) }
      #|  (x : Real) => inv(real_of_num(1) + pow(x, 2))
      #|  atn
      #|  \226\136\128 x : Real, abs(x) < real_of_num(1) \226\134\146 real_sums((k : Num) => pow(-real_of_num(1), k) / real_of_num(2 * k + 1) * pow(x, 2 * k + 1), atn(x), UNIV)
      #|  \226\136\128 x : Real, abs(x) < real_of_num(1) \226\134\146 real_infsum(from(0), (k : Num) => pow(-real_of_num(1), k) / real_of_num(2 * k + 1) * pow(x, 2 * k + 1)) == atn(x)
      #|  o(lift, (k : Num) => pow(-real_of_num(1), k) / real_of_num(FACT(2 * k + 1)) * pow((x : Real), 2 * k + 1)) == ((k : Num) => lift(pow(-real_of_num(1), k) / real_of_num(FACT(2 * k + 1)) * pow(x, 2 * k + 1)))
      #|  \226\136\128 n : Num, pow(-Cx(real_of_num(1)), n) * (pow(Cx((x : Real)), 2 * n + 1) / Cx(real_of_num(FACT(2 * n + 1)))) == Cx(pow(-real_of_num(1), n) / real_of_num(FACT(2 * n + 1)) * pow(x, 2 * n + 1))
      #|  Cx((x : Real))
      #|  \226\136\128 x : Real, real_sums((k : Num) => pow(-real_of_num(1), k) / real_of_num(FACT(2 * k + 1)) * pow(x, 2 * k + 1), sin(x), UNIV)
      #|  \226\136\128 x : Real, real_infsum(from(0), (k : Num) => pow(-real_of_num(1), k) / real_of_num(FACT(2 * k + 1)) * pow(x, 2 * k + 1)) == sin(x)
      #|  o(lift, (k : Num) => pow(-real_of_num(1), k) / real_of_num(FACT(2 * k)) * pow((x : Real), 2 * k)) == ((k : Num) => lift(pow(-real_of_num(1), k) / real_of_num(FACT(2 * k)) * pow(x, 2 * k)))
      #|  \226\136\128 n : Num, pow(-Cx(real_of_num(1)), n) * (pow(Cx((x : Real)), 2 * n) / Cx(real_of_num(FACT(2 * n)))) == Cx(pow(-real_of_num(1), n) / real_of_num(FACT(2 * n)) * pow(x, 2 * n))
      #|  Cx((x : Real))
      #|  \226\136\128 x : Real, real_sums((k : Num) => pow(-real_of_num(1), k) / real_of_num(FACT(2 * k)) * pow(x, 2 * k), cos(x), UNIV)
      #|  \226\136\128 x : Real, real_infsum(from(0), (k : Num) => pow(-real_of_num(1), k) / real_of_num(FACT(2 * k)) * pow(x, 2 * k)) == cos(x)
      #|Series.real_infsum_offset =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\k:num. (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_summable:fun(fun(num,bool),fun(fun(num,real),bool)) (#from:fun(num,fun(num,bool)) m:num)) f:fun(num,real))) ((#<=:fun(num,fun(num,bool)) m:num) k:num))) ((#=:fun(real,fun(real,bool)) ((#real_infsum:fun(fun(num,bool),fun(fun(num,real),real)) (#from:fun(num,fun(num,bool)) m:num)) f:fun(num,real))) ((#real_add:fun(real,fun(real,real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) k:num)) f:fun(num,real))) ((#real_infsum:fun(fun(num,bool),fun(fun(num,real),real)) (#from:fun(num,fun(num,bool)) ((#+:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) f:fun(num,real)))))))))))
      #|Series.real_infsum_offset_alt =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\k:num. (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_summable:fun(fun(num,bool),fun(fun(num,real),bool)) (#from:fun(num,fun(num,bool)) m:num)) f:fun(num,real))) ((#<:fun(num,fun(num,bool)) m:num) k:num))) ((#=:fun(real,fun(real,bool)) ((#real_infsum:fun(fun(num,bool),fun(fun(num,real),real)) (#from:fun(num,fun(num,bool)) m:num)) f:fun(num,real))) ((#real_add:fun(real,fun(real,real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) ((#-:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) f:fun(num,real))) ((#real_infsum:fun(fun(num,bool),fun(fun(num,real),real)) (#from:fun(num,fun(num,bool)) k:num)) f:fun(num,real)))))))))))
      #|Series.power_series_simple_bound =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\a:fun(num,real). (#forall:fun(fun(real,bool),bool) (\u:real. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_summable:fun(fun(num,bool),fun(fun(num,real),bool)) (#from:fun(num,fun(num,bool)) m:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) i:num)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (a:fun(num,real) i:num))) u:real))))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_infsum:fun(fun(num,bool),fun(fun(num,real),real)) (#from:fun(num,fun(num,bool)) m:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num)))))) ((#real_mul:fun(real,fun(real,real)) u:real) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_abs:fun(real,real) x:real)) m:num)) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#real_abs:fun(real,real) x:real))))))))))))))
      #|Series.power_series_simple_bound2 =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\a:fun(num,real). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_summable:fun(fun(num,bool),fun(fun(num,real),bool)) (#from:fun(num,fun(num,bool)) m:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) i:num)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (a:fun(num,real) (#SUC:fun(num,num) i:num)))) (#real_abs:fun(real,real) (a:fun(num,real) i:num))))))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_infsum:fun(fun(num,bool),fun(fun(num,real),real)) (#from:fun(num,fun(num,bool)) m:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num)))))) ((#real_mul:fun(real,fun(real,real)) (#real_abs:fun(real,real) (a:fun(num,real) m:num))) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_abs:fun(real,real) x:real)) m:num)) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#real_abs:fun(real,real) x:real))))))))))))
      #|Series.real_sums_simple_bound =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\a:fun(num,real). (#forall:fun(fun(real,bool),bool) (\u:real. (#forall:fun(fun(real,bool),bool) (\t:real. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num)))) t:real) (#from:fun(num,fun(num,bool)) n:num))) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) m:num)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) i:num)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (a:fun(num,real) i:num))) u:real))))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) t:real) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) n:num) ((#-:fun(num,fun(num,num)) m:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num))))))) ((#real_mul:fun(real,fun(real,real)) u:real) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_abs:fun(real,real) x:real)) m:num)) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#real_abs:fun(real,real) x:real))))))))))))))))))
      #|Series.real_sums_simple_bound2 =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\a:fun(num,real). (#forall:fun(fun(real,bool),bool) (\t:real. (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num)))) t:real) (#from:fun(num,fun(num,bool)) n:num))) ((#/\:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) m:num)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\i:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) m:num) i:num)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (a:fun(num,real) (#SUC:fun(num,num) i:num)))) (#real_abs:fun(real,real) (a:fun(num,real) i:num))))))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) t:real) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) n:num) ((#-:fun(num,fun(num,num)) m:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num))))))) ((#real_mul:fun(real,fun(real,real)) (#real_abs:fun(real,real) (a:fun(num,real) m:num))) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_abs:fun(real,real) x:real)) m:num)) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#real_abs:fun(real,real) x:real))))))))))))))))
      #|Series.abs_sum_lemma_pos =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_mul:fun(real,fun(real,real)) a:real) b:real))) ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_add:fun(real,fun(real,real)) a:real) b:real))) ((#real_add:fun(real,fun(real,real)) (#real_abs:fun(real,real) a:real)) (#real_abs:fun(real,real) b:real))))))))
      #|Series.abs_sum_lemma_neg =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) a:real) b:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_add:fun(real,fun(real,real)) a:real) b:real))) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (#real_abs:fun(real,real) a:real)) (#real_abs:fun(real,real) b:real)))))))))
      #|Series.sign_mul_lemma =  |- (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. (#forall:fun(fun(real,bool),bool) (\c:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) a:real) b:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_mul:fun(real,fun(real,real)) b:real) c:real))) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) b:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) a:real) c:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))))))
      #|Series.sum_bound_lemma =  |- (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\k:num. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun(num,real) ((#+:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_abs:fun(real,real) (f:fun(num,real) k:num)))) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (f:fun(num,real) ((#+:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (f:fun(num,real) k:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) f:fun(num,real)))) (#real_abs:fun(real,real) (f:fun(num,real) m:num)))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_mul:fun(real,fun(real,real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) n:num)) f:fun(num,real))) (f:fun(num,real) m:num)))))))))))
      #|Series.alt_sign_converges =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_abs:fun(real,real) (f:fun(num,real) n:num)))) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (f:fun(num,real) n:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) (((#--->:fun(fun(num,real),fun(real,fun(net(num),bool))) f:fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) #sequentially:net(num)))) (#?:fun(fun(real,bool),bool) (\l:real. (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) f:fun(num,real)) l:real) (#from:fun(num,fun(num,bool)) k:num)))))))))
      #|Series.alt_sign_summable =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_abs:fun(real,real) (f:fun(num,real) n:num)))) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (f:fun(num,real) n:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) (((#--->:fun(fun(num,real),fun(real,fun(net(num),bool))) f:fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) #sequentially:net(num)))) ((#real_summable:fun(fun(num,bool),fun(fun(num,real),bool)) (#from:fun(num,fun(num,bool)) k:num)) f:fun(num,real)))))))
      #|Series.alt_sign_converges2 =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_abs:fun(real,real) (f:fun(num,real) n:num)))) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (f:fun(num,real) n:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) (((#--->:fun(fun(num,real),fun(real,fun(net(num),bool))) f:fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) #sequentially:net(num)))) (#?:fun(fun(real,bool),bool) (\l:real. ((#/\:fun(bool,fun(bool,bool)) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) f:fun(num,real)) l:real) (#from:fun(num,fun(num,bool)) k:num))) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) l:real)) (#real_abs:fun(real,real) (f:fun(num,real) k:num)))) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) ((#real_mul:fun(real,fun(real,real)) l:real) (f:fun(num,real) k:num))))))))))))
      #|Series.alt_sign_bound =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_abs:fun(real,real) (f:fun(num,real) n:num)))) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (f:fun(num,real) n:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) (((#--->:fun(fun(num,real),fun(real,fun(net(num),bool))) f:fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) #sequentially:net(num)))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_infsum:fun(fun(num,bool),fun(fun(num,real),real)) (#from:fun(num,fun(num,bool)) k:num)) f:fun(num,real)))) (#real_abs:fun(real,real) (f:fun(num,real) k:num))))))))
      #|Series.alt_sign_abs_bound =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_abs:fun(real,real) (f:fun(num,real) n:num)))) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (f:fun(num,real) n:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) ((#/\:fun(bool,fun(bool,bool)) (((#--->:fun(fun(num,real),fun(real,fun(net(num),bool))) f:fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) #sequentially:net(num))) ((#<:fun(num,fun(num,bool)) m:num) k:num)))) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) ((#real_infsum:fun(fun(num,bool),fun(fun(num,real),real)) (#from:fun(num,fun(num,bool)) m:num)) f:fun(num,real))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) ((#-:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) f:fun(num,real))))) (#real_abs:fun(real,real) (f:fun(num,real) k:num))))))))))
      #|Series.alt_sign_upper_bound =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_abs:fun(real,real) (f:fun(num,real) n:num)))) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (f:fun(num,real) n:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) ((#/\:fun(bool,fun(bool,bool)) (((#--->:fun(fun(num,real),fun(real,fun(net(num),bool))) f:fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) #sequentially:net(num))) ((#<:fun(num,fun(num,bool)) m:num) k:num)))) ((#real_le:fun(real,fun(real,bool)) ((#real_infsum:fun(fun(num,bool),fun(fun(num,real),real)) (#from:fun(num,fun(num,bool)) m:num)) f:fun(num,real))) ((#real_add:fun(real,fun(real,real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) ((#-:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) f:fun(num,real))) (#real_abs:fun(real,real) (f:fun(num,real) k:num)))))))))))
      #|Series.alt_sign_lower_bound =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\m:num. (#forall:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_abs:fun(real,real) (f:fun(num,real) n:num)))) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (f:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (f:fun(num,real) n:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) ((#/\:fun(bool,fun(bool,bool)) (((#--->:fun(fun(num,real),fun(real,fun(net(num),bool))) f:fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) #sequentially:net(num))) ((#<:fun(num,fun(num,bool)) m:num) k:num)))) ((#real_le:fun(real,fun(real,bool)) ((#real_sub:fun(real,fun(real,real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) m:num) ((#-:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) f:fun(num,real))) (#real_abs:fun(real,real) (f:fun(num,real) k:num)))) ((#real_infsum:fun(fun(num,bool),fun(fun(num,real),real)) (#from:fun(num,fun(num,bool)) m:num)) f:fun(num,real))))))))))
      #|Series.abs_neg_pow =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) x:real)) n:num))) ((#real_pow:fun(real,fun(num,real)) (#real_abs:fun(real,real) x:real)) n:num))))))
      #|Series.abs_neg_one_pow =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) n:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))
      #|Series.integral_uniform_limit =  |- (#forall:fun(fun(fun(num,fun(real,real)),bool),bool) (\f:fun(num,fun(real,real)). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(fun(num,real),bool),bool) (\s:fun(num,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (#?:fun(fun(num,bool),bool) (\N:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) N:num) n:num)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) #NIL:list(prod(real,real))))))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) ((f:fun(num,fun(real,real)) n:num) x:real)) (g:fun(real,real) x:real)))) e:real)))))))))))) (#forall:fun(fun(num,bool),bool) (\n:num. (((#has_real_integral:fun(fun(real,real),fun(real,fun(fun(real,bool),bool))) (f:fun(num,fun(real,real)) n:num)) (s:fun(num,real) n:num)) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) #NIL:list(prod(real,real))))))))) (#?:fun(fun(real,bool),bool) (\r:real. ((#/\:fun(bool,fun(bool,bool)) (((#has_real_integral:fun(fun(real,real),fun(real,fun(fun(real,bool),bool))) g:fun(real,real)) r:real) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) #NIL:list(prod(real,real)))))) (((#--->:fun(fun(num,real),fun(real,fun(net(num),bool))) s:fun(num,real)) r:real) #sequentially:net(num))))))))))))))))
      #|Series.integral_series =  |- (#forall:fun(fun(fun(num,fun(real,real)),bool),bool) (\f:fun(num,fun(real,real)). (#forall:fun(fun(fun(real,real),bool),bool) (\g:fun(real,real). (#forall:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). (#forall:fun(fun(fun(num,real),bool),bool) (\r:fun(num,real). (#forall:fun(fun(real,bool),bool) (\a:real. (#forall:fun(fun(real,bool),bool) (\b:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (#?:fun(fun(num,bool),bool) (\N:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) N:num) n:num)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) #NIL:list(prod(real,real))))))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#INTER:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) s:fun(num,bool)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num))) (\i:num. ((f:fun(num,fun(real,real)) i:num) x:real)))) (g:fun(real,real) x:real)))) e:real)))))))))))) (#forall:fun(fun(num,bool),bool) (\n:num. (((#has_real_integral:fun(fun(real,real),fun(real,fun(fun(real,bool),bool))) (f:fun(num,fun(real,real)) n:num)) (r:fun(num,real) n:num)) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) #NIL:list(prod(real,real))))))))) (#?:fun(fun(real,bool),bool) (\v:real. ((#/\:fun(bool,fun(bool,bool)) (((#has_real_integral:fun(fun(real,real),fun(real,fun(fun(real,bool),bool))) g:fun(real,real)) v:real) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) a:real) b:real)) #NIL:list(prod(real,real)))))) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) r:fun(num,real)) v:real) s:fun(num,bool))))))))))))))))))
      #|Series.power_series_uniform =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\a:fun(num,real). (#forall:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). (#forall:fun(fun(real,bool),bool) (\t:real. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_summable:fun(fun(num,bool),fun(fun(num,real),bool)) s:fun(num,bool)) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) y:real) i:num))))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) t:real)) (#real_abs:fun(real,real) y:real)))) (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (#?:fun(fun(num,bool),bool) (\N:num. (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) N:num) n:num)) ((#IN:fun(real,fun(fun(real,bool),bool)) x:real) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) (#real_neg:fun(real,real) (#real_abs:fun(real,real) t:real))) (#real_abs:fun(real,real) t:real))) #NIL:list(prod(real,real))))))) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#INTER:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) s:fun(num,bool)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num))) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num))))) ((#real_infsum:fun(fun(num,bool),fun(fun(num,real),real)) s:fun(num,bool)) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num))))))) e:real))))))))))))))))))))
      #|Series.has_real_integral_pow_pos =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\a:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) a:real)) (((#has_real_integral:fun(fun(real,real),fun(real,fun(fun(real,bool),bool))) (\x:real. ((#real_pow:fun(real,fun(num,real)) x:real) n:num))) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) a:real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) a:real)) #NIL:list(prod(real,real))))))))))
      #|Series.has_real_integral_pow_neg =  |- (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\a:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) a:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (((#has_real_integral:fun(fun(real,real),fun(real,fun(fun(real,bool),bool))) (\x:real. ((#real_pow:fun(real,fun(num,real)) x:real) n:num))) (#real_neg:fun(real,real) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) a:real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) a:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) #NIL:list(prod(real,real))))))))))
      #|Series.power_series_integral =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(num,real),bool),bool) (\a:fun(num,real). (#forall:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). (#forall:fun(fun(real,bool),bool) (\r:real. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) r:real)) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num)))) (f:fun(real,real) x:real)) s:fun(num,bool)))))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) r:real)) ((#LET:fun(fun(real,bool),fun(real,bool)) (\v:real. (#LET_END:fun(bool,bool) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) x:real) ((#+:fun(num,fun(num,num)) i:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) i:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) v:real) s:fun(num,bool))))) (((#COND:fun(bool,fun(real,fun(real,real))) ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (#real_neg:fun(real,real) ((#real_integral:fun(fun(real,bool),fun(fun(real,real),real)) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) #NIL:list(prod(real,real))))) f:fun(real,real)))) ((#real_integral:fun(fun(real,bool),fun(fun(real,real),real)) (#closed_real_interval:fun(list(prod(real,real)),fun(real,bool)) ((#CONS:fun(prod(real,real),fun(list(prod(real,real)),list(prod(real,real)))) ((#,:fun(real,fun(real,prod(real,real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) #NIL:list(prod(real,real))))) f:fun(real,real))))))))))))))))
      #|Series.power_series_integral2 =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(real,real),bool),bool) (\f':fun(real,real). (#forall:fun(fun(fun(num,real),bool),bool) (\a:fun(num,real). (#forall:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). (#forall:fun(fun(real,bool),bool) (\r:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) r:real)) (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) f:fun(real,real)) (f':fun(real,real) x:real)) (#atreal:fun(real,net(real)) x:real)))))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) r:real)) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num)))) (f':fun(real,real) x:real)) s:fun(num,bool))))))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) r:real)) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) x:real) ((#+:fun(num,fun(num,num)) i:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) i:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#real_sub:fun(real,fun(real,real)) (f:fun(real,real) x:real)) (f:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) s:fun(num,bool))))))))))))))))
      #|Series.strict_increasing_num_le =  |- (#forall:fun(fun(fun(num,num),bool),bool) (\h:fun(num,num). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#<:fun(num,fun(num,bool)) (h:fun(num,num) n:num)) (h:fun(num,num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) (#forall:fun(fun(num,bool),bool) (\n:num. ((#<=:fun(num,fun(num,bool)) n:num) (h:fun(num,num) n:num)))))))
      #|Series.strict_increasing_num_lt =  |- (#forall:fun(fun(fun(num,num),bool),bool) (\h:fun(num,num). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#<:fun(num,fun(num,bool)) (h:fun(num,num) n:num)) (h:fun(num,num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) n:num) m:num)) ((#<:fun(num,fun(num,bool)) (h:fun(num,num) n:num)) (h:fun(num,num) m:num))))))))))
      #|Series.strict_increasing_num_inj =  |- (#forall:fun(fun(fun(num,num),bool),bool) (\h:fun(num,num). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#<:fun(num,fun(num,bool)) (h:fun(num,num) n:num)) (h:fun(num,num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#=:fun(num,fun(num,bool)) (h:fun(num,num) n:num)) (h:fun(num,num) m:num))) ((#=:fun(num,fun(num,bool)) n:num) m:num)))))))))
      #|Series.strict_increasing_num_le_eq =  |- (#forall:fun(fun(fun(num,num),bool),bool) (\h:fun(num,num). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#<:fun(num,fun(num,bool)) (h:fun(num,num) n:num)) (h:fun(num,num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\m:num. ((#=:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (h:fun(num,num) n:num)) (h:fun(num,num) m:num))) ((#<=:fun(num,fun(num,bool)) n:num) m:num)))))))))
      #|Series.strict_increasing_num_lt_eq =  |- (#forall:fun(fun(fun(num,num),bool),bool) (\h:fun(num,num). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#<:fun(num,fun(num,bool)) (h:fun(num,num) n:num)) (h:fun(num,num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\m:num. ((#=:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (h:fun(num,num) n:num)) (h:fun(num,num) m:num))) ((#<:fun(num,fun(num,bool)) n:num) m:num)))))))))
      #|Series.strict_increasing_num_le2 =  |- (#forall:fun(fun(fun(num,num),bool),bool) (\h:fun(num,num). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#<:fun(num,fun(num,bool)) (h:fun(num,num) n:num)) (h:fun(num,num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(num,bool),bool) (\m:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) (h:fun(num,num) n:num)) m:num)) ((#<=:fun(num,fun(num,bool)) n:num) m:num)))))))))
      #|Series.real_sums_image =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,num),bool),bool) (\h:fun(num,num). (#forall:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). (#forall:fun(fun(real,bool),bool) (\l:real. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#<:fun(num,fun(num,bool)) (h:fun(num,num) n:num)) (h:fun(num,num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#=:fun(bool,fun(bool,bool)) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) f:fun(num,real)) l:real) ((#IMAGE:fun(fun(num,num),fun(fun(num,bool),fun(num,bool))) h:fun(num,num)) s:fun(num,bool)))) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) ((#o:fun(fun(num,real),fun(fun(num,num),fun(num,real))) f:fun(num,real)) h:fun(num,num))) l:real) s:fun(num,bool))))))))))))
      #|Series.real_summable_image =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,num),bool),bool) (\h:fun(num,num). (#forall:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\n:num. ((#<:fun(num,fun(num,bool)) (h:fun(num,num) n:num)) (h:fun(num,num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) ((#=:fun(bool,fun(bool,bool)) ((#real_summable:fun(fun(num,bool),fun(fun(num,real),bool)) ((#IMAGE:fun(fun(num,num),fun(fun(num,bool),fun(num,bool))) h:fun(num,num)) s:fun(num,bool))) f:fun(num,real))) ((#real_summable:fun(fun(num,bool),fun(fun(num,real),bool)) s:fun(num,bool)) ((#o:fun(fun(num,real),fun(fun(num,num),fun(num,real))) f:fun(num,real)) h:fun(num,num)))))))))))
      #|Series.real_sums_image_odd =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(real,bool),bool) (\l:real. ((#=:fun(bool,fun(bool,bool)) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. (((#COND:fun(bool,fun(real,fun(real,real))) (#ODD:fun(num,bool) i:num)) (f:fun(num,real) i:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) l:real) #UNIV:fun(num,bool))) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. (f:fun(num,real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) i:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) l:real) #UNIV:fun(num,bool)))))))
      #|Series.real_sums_image_even =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(real,bool),bool) (\l:real. ((#=:fun(bool,fun(bool,bool)) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. (((#COND:fun(bool,fun(real,fun(real,real))) (#EVEN:fun(num,bool) i:num)) (f:fun(num,real) i:num)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) l:real) #UNIV:fun(num,bool))) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. (f:fun(num,real) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) i:num)))) l:real) #UNIV:fun(num,bool)))))))
      #|Series.n_le_pow_lemma =  |- (#forall:fun(fun(real,bool),bool) (\e:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) e:real)) (#?:fun(fun(num,bool),bool) (\N:num. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<=:fun(num,fun(num,bool)) N:num) n:num)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) n:num)) ((#real_pow:fun(real,fun(num,real)) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) e:real)) n:num))))))))))
      #|Series.real_summable_lmul_eq =  |- (#forall:fun(fun(real,bool),bool) (\c:real. (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). ((#==>:fun(bool,fun(bool,bool)) (#~:fun(bool,bool) ((#=:fun(real,fun(real,bool)) c:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))) ((#=:fun(bool,fun(bool,bool)) ((#real_summable:fun(fun(num,bool),fun(fun(num,real),bool)) s:fun(num,bool)) (\i:num. ((#real_mul:fun(real,fun(real,real)) c:real) (f:fun(num,real) i:num))))) ((#real_summable:fun(fun(num,bool),fun(fun(num,real),bool)) s:fun(num,bool)) f:fun(num,real))))))))))
      #|Series.summable_power_series_shift =  |- (#forall:fun(fun(num,bool),bool) (\k:num. (#forall:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). (#forall:fun(fun(fun(num,real),bool),bool) (\a:fun(num,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_summable:fun(fun(num,bool),fun(fun(num,real),bool)) s:fun(num,bool)) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num))))) ((#real_summable:fun(fun(num,bool),fun(fun(num,real),bool)) s:fun(num,bool)) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) ((#-:fun(num,fun(num,num)) i:num) k:num))))))))))))))
      #|Series.power_sum_derivative_shift_lemma =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\a:fun(num,real). (#forall:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#INTER:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) ((#DIFF:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) s:fun(num,bool)) ((#INSERT:fun(num,fun(fun(num,bool),fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) #EMPTY:fun(num,bool)))) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num))) (\i:num. ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) i:num)) (a:fun(num,real) i:num))))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#INTER:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) s:fun(num,bool)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num))) (\i:num. ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) i:num)) (a:fun(num,real) i:num)))))))))))
      #|Series.power_sum_derivative_shift_lemma2 =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\a:fun(num,real). (#forall:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) n:num)) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#INTER:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) ((#IMAGE:fun(fun(num,num),fun(fun(num,bool),fun(num,bool))) #PRE:fun(num,num)) ((#DIFF:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) s:fun(num,bool)) ((#INSERT:fun(num,fun(fun(num,bool),fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) #EMPTY:fun(num,bool))))) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) (#PRE:fun(num,num) n:num)))) (\i:num. ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#SUC:fun(num,num) i:num))) (a:fun(num,real) (#SUC:fun(num,num) i:num)))))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#INTER:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) s:fun(num,bool)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num))) (\i:num. ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) i:num)) (a:fun(num,real) i:num))))))))))))
      #|Series.power_sum_derivative_shift_lemma3 =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\a:fun(num,real). (#forall:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). (#forall:fun(fun(num,bool),bool) (\n:num. (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) n:num)) ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#INTER:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) ((#IMAGE:fun(fun(num,num),fun(fun(num,bool),fun(num,bool))) #PRE:fun(num,num)) ((#DIFF:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) s:fun(num,bool)) ((#INSERT:fun(num,fun(fun(num,bool),fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) #EMPTY:fun(num,bool))))) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) (#PRE:fun(num,num) n:num)))) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#SUC:fun(num,num) i:num))) (a:fun(num,real) (#SUC:fun(num,num) i:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) i:num))))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#INTER:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) s:fun(num,bool)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num))) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) i:num)) (a:fun(num,real) i:num))) ((#real_pow:fun(real,fun(num,real)) x:real) ((#-:fun(num,fun(num,num)) i:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))))))))
      #|Series.power_series_derivative_shift_lemma =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\a:fun(num,real). (#forall:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). (#forall:fun(fun(real,bool),bool) (\l:real. ((#=:fun(bool,fun(bool,bool)) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) i:num)) (a:fun(num,real) i:num)))) l:real) s:fun(num,bool))) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) i:num)) (a:fun(num,real) i:num)))) l:real) ((#DIFF:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) s:fun(num,bool)) ((#INSERT:fun(num,fun(fun(num,bool),fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) #EMPTY:fun(num,bool)))))))))))
      #|Series.power_series_derivative_shift =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\a:fun(num,real). (#forall:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(real,bool),bool) (\l:real. ((#=:fun(bool,fun(bool,bool)) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) i:num)) (a:fun(num,real) i:num))) ((#real_pow:fun(real,fun(num,real)) x:real) ((#-:fun(num,fun(num,num)) i:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) l:real) s:fun(num,bool))) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#SUC:fun(num,num) i:num))) (a:fun(num,real) (#SUC:fun(num,num) i:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) i:num)))) l:real) ((#IMAGE:fun(fun(num,num),fun(fun(num,bool),fun(num,bool))) #PRE:fun(num,num)) ((#DIFF:fun(fun(num,bool),fun(fun(num,bool),fun(num,bool))) s:fun(num,bool)) ((#INSERT:fun(num,fun(fun(num,bool),fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) #EMPTY:fun(num,bool))))))))))))))
      #|Series.summable_power_series_derivative =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\a:fun(num,real). (#forall:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_summable:fun(fun(num,bool),fun(fun(num,real),bool)) s:fun(num,bool)) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) y:real) i:num))))) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) y:real)) ((#real_summable:fun(fun(num,bool),fun(fun(num,real),bool)) s:fun(num,bool)) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) i:num)) (a:fun(num,real) i:num))) ((#real_pow:fun(real,fun(num,real)) x:real) ((#-:fun(num,fun(num,num)) i:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))))))))
      #|Series.power_series_has_derivative =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(num,real),bool),bool) (\a:fun(num,real). (#forall:fun(fun(fun(num,bool),bool),bool) (\s:fun(num,bool). (#forall:fun(fun(real,bool),bool) (\r:real. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) r:real)) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num)))) (f:fun(real,real) x:real)) s:fun(num,bool)))))) (#?:fun(fun(fun(real,real),bool),bool) (\f':fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) r:real)) ((#/\:fun(bool,fun(bool,bool)) (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) f:fun(real,real)) (f':fun(real,real) x:real)) (#atreal:fun(real,net(real)) x:real))) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) i:num)) (a:fun(num,real) i:num))) ((#real_pow:fun(real,fun(num,real)) x:real) ((#-:fun(num,fun(num,num)) i:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) (f':fun(real,real) x:real)) s:fun(num,bool)))))))))))))))))
      #|Series.power_series_has_derivative2 =  |- (#forall:fun(fun(fun(real,real),bool),bool) (\f:fun(real,real). (#forall:fun(fun(fun(num,real),bool),bool) (\a:fun(num,real). (#forall:fun(fun(real,bool),bool) (\r:real. ((#==>:fun(bool,fun(bool,bool)) (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) r:real)) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. ((#real_mul:fun(real,fun(real,real)) (a:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num)))) (f:fun(real,real) x:real)) #UNIV:fun(num,bool)))))) (#?:fun(fun(fun(real,real),bool),bool) (\f':fun(real,real). (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) r:real)) ((#/\:fun(bool,fun(bool,bool)) (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) f:fun(real,real)) (f':fun(real,real) x:real)) (#atreal:fun(real,net(real)) x:real))) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#SUC:fun(num,num) i:num))) (a:fun(num,real) (#SUC:fun(num,num) i:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) i:num)))) (f':fun(real,real) x:real)) #UNIV:fun(num,bool)))))))))))))))
      #|Series.real_sums_i_xi =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num)))) ((#real_div:fun(real,fun(real,real)) x:real) ((#real_pow:fun(real,fun(num,real)) ((#real_sub:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) #UNIV:fun(num,bool)))))
      #|Series.real_sums_neg_i_xi =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) i:num)) (#real_of_num:fun(num,real) i:num))) ((#real_pow:fun(real,fun(num,real)) x:real) i:num)))) (#real_neg:fun(real,real) ((#real_div:fun(real,fun(real,real)) x:real) ((#real_pow:fun(real,fun(num,real)) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) #UNIV:fun(num,bool)))))
      #|Series.real_sums_neg_xi =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) i:num)) ((#real_pow:fun(real,fun(num,real)) x:real) i:num)))) ((#real_div:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real))) #UNIV:fun(num,bool)))))
      #|Series.exp_series =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\k:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#FACT:fun(num,num) k:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) k:num)))) (#exp:fun(real,real) x:real)) #UNIV:fun(num,bool))))
      #|Series.exp_infsum =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_infsum:fun(fun(num,bool),fun(fun(num,real),real)) (#from:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num))) (\k:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#real_of_num:fun(num,real) (#FACT:fun(num,num) k:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) k:num))))) (#exp:fun(real,real) x:real))))
      #|Series.log_derivative_series =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\k:num. ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) k:num)) ((#real_pow:fun(real,fun(num,real)) x:real) k:num)))) (#real_inv:fun(real,real) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real))) #UNIV:fun(num,bool)))))
      #|Series.log_series =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\k:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) k:num)) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_pow:fun(real,fun(num,real)) x:real) ((#+:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) (#log:fun(real,real) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real))) #UNIV:fun(num,bool)))))
      #|Series.log_infsum =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) ((#real_infsum:fun(fun(num,bool),fun(fun(num,real),real)) (#from:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num))) (\k:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) k:num)) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_pow:fun(real,fun(num,real)) x:real) ((#+:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) (#log:fun(real,real) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real))))))
      #|Series.atn_derivative_series =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\k:num. ((#real_mul:fun(real,fun(real,real)) (((#COND:fun(bool,fun(real,fun(real,real))) (#EVEN:fun(num,bool) k:num)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#DIV:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) k:num)))) (#real_inv:fun(real,real) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) #UNIV:fun(num,bool)))))
      #|Series.atn_series =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\k:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) k:num)) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) k:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_pow:fun(real,fun(num,real)) x:real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) k:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) (#atn:fun(real,real) x:real)) #UNIV:fun(num,bool)))))
      #|Series.atn_infsum =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_abs:fun(real,real) x:real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#=:fun(real,fun(real,bool)) ((#real_infsum:fun(fun(num,bool),fun(fun(num,real),real)) (#from:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num))) (\k:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) k:num)) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) k:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_pow:fun(real,fun(num,real)) x:real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) k:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) (#atn:fun(real,real) x:real)))))
      #|Series.sin_series =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\k:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) k:num)) (#real_of_num:fun(num,real) (#FACT:fun(num,num) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) k:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_pow:fun(real,fun(num,real)) x:real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) k:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) (#sin:fun(real,real) x:real)) #UNIV:fun(num,bool))))
      #|Series.sin_infsum =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_infsum:fun(fun(num,bool),fun(fun(num,real),real)) (#from:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num))) (\k:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) k:num)) (#real_of_num:fun(num,real) (#FACT:fun(num,num) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) k:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_pow:fun(real,fun(num,real)) x:real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) k:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) (#sin:fun(real,real) x:real))))
      #|Series.cos_series =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\k:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) k:num)) (#real_of_num:fun(num,real) (#FACT:fun(num,num) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) k:num))))) ((#real_pow:fun(real,fun(num,real)) x:real) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) k:num))))) (#cos:fun(real,real) x:real)) #UNIV:fun(num,bool))))
      #|Series.cos_infsum =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_infsum:fun(fun(num,bool),fun(fun(num,real),real)) (#from:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num))) (\k:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) k:num)) (#real_of_num:fun(num,real) (#FACT:fun(num,num) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) k:num))))) ((#real_pow:fun(real,fun(num,real)) x:real) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) k:num)))))) (#cos:fun(real,real) x:real))))
      #|types = multivector/1 matroid/1 group/1 frag/1 metric/1 net/1 topology/1 tybit1/1 tybit0/1 finite_prod/2 finite_diff/2 finite_sum/2 cart/2 finite_image/1 int/0 real/0 hreal/0 nadd/0 char/0 list/1 option/1 sum/2 recspace/1 num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = mod_plus arith_base float_num min_exp interval_gt interval_neg interval_pos interval_not_zero iabs bounded_on_int bounded_on interval_arith num_exp D199 D198 D197 D196 D195 D194 D193 D192 D191 D190 D189 D188 D187 D186 D185 D184 D183 D182 D181 D180 D179 D178 D177 D176 D175 D174 D173 D172 D171 D170 D169 D168 D167 D166 D165 D164 D163 D162 D161 D160 D159 D158 D157 D156 D155 D154 D153 D152 D151 D150 D149 D148 D147 D146 D145 D144 D143 D142 D141 D140 D139 D138 D137 D136 D135 D134 D133 D132 D131 D130 D129 D128 D127 D126 D125 D124 D123 D122 D121 D120 D119 D118 D117 D116 D115 D114 D113 D112 D111 D110 D109 D108 D107 D106 D105 D104 D103 D102 D101 D100 D99 D98 D97 D96 D95 D94 D93 D92 D91 D90 D89 D88 D87 D86 D85 D84 D83 D82 D81 D80 D79 D78 D77 D76 D75 D74 D73 D72 D71 D70 D69 D68 D67 D66 D65 D64 D63 D62 D61 D60 D59 D58 D57 D56 D55 D54 D53 D52 D51 D50 D49 D48 D47 D46 D45 D44 D43 D42 D41 D40 D39 D38 D37 D36 D35 D34 D33 D32 D31 D30 D29 D28 D27 D26 D25 D24 D23 D22 D21 D20 D19 D18 D17 D16 D15 D14 D13 D12 D11 D10 D9 D8 D7 D6 D5 D4 D3 D2 D1 D0 NUM200 real_variation has_bounded_real_variation_on real_lebesgue_measurable real_measurable_on bernoulli vector_polynomial_function real_polynomial_function bernstein slice real_measure real_measurable has_real_measure absolutely_real_integrable_on real_negligible real_integral real_integrable_on has_real_integral real_log_convex_on log_convex_on real_convex_on open_real_segment closed_real_segment has_liminf has_limsup real_differentiable_on higher_real_derivative real_derivative real_differentiable has_real_derivative real_uniformly_continuous_on real_continuous_on real_continuous atreal binom rpow root acs asn cacs casn atn catn unwinding cpow clog tan ctan rotate2d Arg pi log cos sin exp csin ccos cexp analytic_on holomorphic_on higher_complex_derivative complex_derivative complex_differentiable has_complex_derivative cproduct real csqrt cnj complex_pow complex_div complex_inv complex_mul ii Cx complex Im Re lebesgue_measurable measurable_on measure measurable has_measure path_length rectifiable_path absolutely_continuous_on absolutely_setcontinuous_on vector_variation has_bounded_variation_on equiintegrable_on absolutely_integrable_on has_bounded_setvariation_on set_variation negligible division_points lifted operative integral integrable_on has_integral has_integral_compact_interval fine tagged_division_of tagged_partial_division_of division_of gauge content interval_lowerbound interval_upperbound reversion outermorphism seqiterate inner outer geom_mul Product grade multivector multivec mbasis lambdas $$ codeset setcode dest_multivector mk_multivector binarysum bitset vector_derivative has_vector_derivative jacobian frechet_derivative differentiable_on differentiable has_derivative interval_bij ENR ANR AR retract_of retraction brouwer_degree brouwer_degree1 triangulation simplicial_complex simplex polyhedron polytope edge_of facet_of extreme_point_of exposed_face_of face_of covering_space dimension contractible homotopy_equivalent fundamental_group simply_connected homotopic_loops homotopic_paths outside inside path_connected path_components path_component linepath subpath shiftpath arc simple_path ++ reversepath path_image pathfinish pathstart path barycentre relative_frontier relative_interior starlike epigraph convex_cone polar_dual aff_dim convex_on coplanar affine_dependent conic convex affine analytic borel_measurable_on baire borel fsigma gdelta locally hausdist setdist closest_point summable infsum sums homeomorphic homeomorphism is_interval diameter components connected_component uniformly_continuous_on continuous_on continuous complete cauchy compact bounded condensation_point_of lim --> in_direction at_neginfinity at_posinfinity at_infinity at frontier closure interior limit_point_of connected open_segment closed_segment manhattan sphere cball ball closed euclidean_metric euclidean open reflect_along rotoinversion_matrix rotation_matrix orthogonal_matrix orthogonal_transformation positive_definite positive_semidefinite diagonal_matrix cofactor det trace sign evenperm permutation swapseq three_cycle swap inverse permutes closed_interval open_interval midpoint between collinear infnorm matrix_inv rank columnvector rowvector euclidean_matroid dim independent dependent span subspace pushin dropout indicator drop lift onorm matrix invertible normal_matrix symmetric_matrix columns rows column row transp mat vector_matrix_mul matrix_vector_mul matrix_mul matrix_sub matrix_add matrix_neg %% adjoint bilinear linear orthogonal basis vsum distance vector_norm dot vec % vector_neg vector_sub vector_add matroid_dim matroid_finite_dim matroid_dimension matroid_finite_dimensional submatroid matroid_subspace matroid_dependent matroid_basis matroid_independent matroid_spanning matroid_span matroid_set dest_matroid matroid brouwer_degree2 reduced_homology_group hom_relboundary hom_induced hom_boundary homology_group relative_homology_group relcycle_group chain_group singular_subdivision simplicial_subdivision simplicial_vertex simplicial_cone simplex_cone simplicial_chain simplicial_simplex oriented_simplex chain_map simplex_map homologous_rel singular_relboundary singular_relcycle mod_subset chain_boundary singular_chain singular_face singular_simplex simplicial_face standard_simplex short_exact_sequence group_exactness solvable_group free_abelian_group pgroup integer_mod_group integer_group finitely_generated_group cyclic_group group_element_order trivial_homomorphism group_image group_kernel quotient_group group_normalizer group_centralizer group_conjugate normal_subgroup_of left_coset right_coset group_orbit group_stabilizer group_action group_setmul group_setinv isomorphic_group group_automorphism group_isomorphism group_isomorphisms group_endomorphism group_epimorphism group_monomorphism group_homomorphism sum_group product_group prod_group subgroup_generated subgroup_of group_conjugation group_sum group_product group_nmul group_add group_neg abelian_group group_zpow group_pow group_div opposite_group trivial_group singleton_group group_mul group_inv group_id group_carrier group_operations group index frag_extend frag_sub frag_add frag_cmul frag_neg frag_of frag_0 frag_support dest_frag mk_frag cantor_set cantor_map cantor_term cantor_space dimension_le sigma_locally_finite_in paracompact_space cfunspace funspace nsphere euclidean_space capped_metric fccoverable_in ulc_space fccoverable_space mdiameter cauchy_continuous_map uniformly_continuous_map lipschitz_continuous_map prod_metric completely_metrizable_space contractible_space homotopy_equivalent_space homotopic_with alexandroff_compactification kification k_space quasi_components_of quasi_component_of locally_connected_space locally_connected_at weakly_locally_connected_at locally_path_connected_space locally_path_connected_at weakly_locally_path_connected_at completely_regular_space normal_space path_components_of path_component_of path_connected_in path_connected_space path_in real_summable real_infsum real_sums reallim ---> topcontinuous_at totally_bounded_in mcomplete cauchy_in limit atpointof real_compact real_bounded real_euclidean_metric euclideanreal real_closed real_open locally_compact_space regular_space kolmogorov_quotient t0_space neighbourhood_base_of neighbourhood_base_at monotone_map connected_components_of connected_component_of separated_between connected_in connected_space metrizable_space discrete_metric mbounded msphere mcball mtopology submetric mball mdist mspace dest_metric metric is_metric_space borel_measurable_map borel_in gdelta_in fsigma_in sequentially trivial_limit eventually within netlimit netlimits netfilter dest_net mk_net separable_space first_countable second_countable lindelof_space perfect_map proper_map kc_space hausdorff_space t1_space separated_in compact_space compact_in retract_of_space retraction_map section_map retraction_maps embedding_map homeomorphic_space homeomorphic_maps homeomorphic_map sum_topology product_topology prod_topology quotient_map closed_map open_map continuous_map locally_finite_in frontier_of interior_of closure_of derived_set_of hereditarily subtopology discrete_space discrete_topology closed_in topspace open_in topology istopology ITER suslin suslin_operation relative_to from hull matrify vectorize closed_real_interval open_real_interval is_realinterval frac floor rational ^_c *_c +_c ordinal linseg inseg properly strictly antichain chain wqoset woset toset poset qoset fld superadmissible tailadmissible admissible CASEWISE PCROSS vector mktybit1 _100531 _dest_tybit1 _mk_tybit1 mktybit0 _100512 _dest_tybit0 _mk_tybit0 dest_finite_prod mk_finite_prod dest_finite_diff mk_finite_diff sndcart fstcart pastecart dest_finite_sum mk_finite_sum lambda $ dest_cart mk_cart dest_finite_image finite_index dimindex polynomial_function sum nsum isum product iproduct nproduct iterato iterate support monoidal neutral .. has_sup has_inf inf sup COUNTABLE >_c >=_c =_c <_c <=_c ARBITRARY INTERSECTION_OF UNION_OF pairwise list_of_set set_of_list disjoint_union product_map cartesian_product RESTRICTION EXTENSIONAL ARB CROSS HAS_SIZE CARD ITSET FINREC REST CHOICE BIJ SURJ INJ IMAGE INFINITE FINITE SING DISJOINT PSUBSET SUBSET DELETE DIFF INTERS INTER UNIONS UNION UNIV INSERT EMPTY SETSPEC GSPEC IN real_zpow prime num_lcm num_gcd num_coprime num_mod num_divides num_of_int int_lcm int_gcd int_coprime int_mod int_divides real_mod == rem div int_pow int_min int_max int_sgn int_abs int_mul int_sub int_add int_neg int_of_num int_gt int_ge int_lt int_le real_of_int int_of_real integer DECIMAL sqrt real_sgn real_min real_max real_div real_pow real_abs real_gt real_ge real_lt real_sub real_inv real_le real_mul real_add real_neg real_of_num dest_real mk_real treal_eq treal_inv treal_le treal_mul treal_add treal_neg treal_of_num hreal_inv hreal_le hreal_mul hreal_add hreal_of_num dest_hreal mk_hreal nadd_inv nadd_rinv nadd_mul nadd_add nadd_le nadd_of_num nadd_eq dest_nadd mk_nadd is_nadd dist ASCII _22943 _dest_char _mk_char list_of_seq PAIRWISE ALLPAIRS ZIP ITLIST2 ASSOC FILTER EL MAP2 ALL2 MEM ITLIST EX ALL NULL REPLICATE BUTLAST LAST MAP LENGTH REVERSE APPEND TL HD ISO CONS NIL _dest_list _mk_list SOME NONE _dest_option _mk_option OUTR OUTL INR INL _dest_sum _mk_sum FNIL FCONS CONSTR BOTTOM _dest_rec _mk_rec ZRECSPACE ZBOT ZCONSTR INJP INJF INJA INJN NUMRIGHT NUMLEFT NUMSUM NUMSND NUMFST NUMPAIR MEASURE WF minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|definitions = 1052
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?1
      #|counter_genvar = _3716892:bool
      #|
    ),
  )
}
