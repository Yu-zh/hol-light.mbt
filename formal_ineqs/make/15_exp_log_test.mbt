// Formal_ineqs/trig/exp_log.hl in its directory's load order: the test block of
// formal_ineqs/trig/exp_log/exp_log_ref_test.mbt (tools/ocaml_ref/chain_test.py), with the same golden
// (tools/ocaml_ref/Formal_ineqs_trig_exp_log_ref.expected).

///|
test "Formal_ineqs/trig/exp_log matches Formal_ineqs/trig/exp_log.ml" {
  @testkit.release_output()
  @exp_log.load()
  let log = @testkit.Log::new()
  log.capture_reports()
  for th in ["Formal_ineqs/trig/exp_log"] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("Formal_ineqs/trig/exp_log")
  log.capture_stdout()
  // BEGIN generated theorem list
  log.attempt("Exp_log.exp_pos_poly_lower_bound", () => {
    sthm(@exp_log.exp_pos_poly_lower_bound())
  })
  log.attempt("Exp_log.exp_ge1", () => sthm(@exp_log.exp_ge1()))
  log.attempt("Exp_log.neg_exp_le1", () => sthm(@exp_log.neg_exp_le1()))
  log.attempt("Exp_log.neg_exp_series", () => sthm(@exp_log.neg_exp_series()))
  log.attempt("Exp_log.neg_exp_infsum", () => sthm(@exp_log.neg_exp_infsum()))
  log.attempt("Exp_log.n_le_fact", () => sthm(@exp_log.n_le_fact()))
  log.attempt("Exp_log.exp_alt_sign_lemma", () => {
    sthm(@exp_log.exp_alt_sign_lemma())
  })
  log.attempt("Exp_log.exp_neg_poly_upper_bound", () => {
    sthm(@exp_log.exp_neg_poly_upper_bound())
  })
  log.attempt("Exp_log.exp_neg_poly_lower_bound", () => {
    sthm(@exp_log.exp_neg_poly_lower_bound())
  })
  log.attempt("Exp_log.exp_reduce", () => sthm(@exp_log.exp_reduce()))
  log.attempt("Exp_log.exp_full_reduce", () => sthm(@exp_log.exp_full_reduce()))
  log.attempt("Exp_log.log_alt_sign_lemma", () => {
    sthm(@exp_log.log_alt_sign_lemma())
  })
  log.attempt("Exp_log.log_poly_upper_bound", () => {
    sthm(@exp_log.log_poly_upper_bound())
  })
  log.attempt("Exp_log.log_poly_lower_bound", () => {
    sthm(@exp_log.log_poly_lower_bound())
  })
  log.attempt("Exp_log.log_reduce_pos_pow", () => {
    sthm(@exp_log.log_reduce_pos_pow())
  })
  log.attempt("Exp_log.log_reduce_neg_pow", () => {
    sthm(@exp_log.log_reduce_neg_pow())
  })
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
      #|Formal_ineqs/trig/exp_log quotations (96):
      #|  0
      #|  from((n : Num) + 1)
      #|  (k : Num) => real_of_num(1) / real_of_num(FACT(k)) * pow((x : Real), k)
      #|  ((a : Real) <= a + (b : Real)) == (real_of_num(0) <= b)
      #|  inv((a : Real)) == real_of_num(1) / a
      #|  (x : Real)
      #|  (k : Num) => real_of_num(1) / real_of_num(FACT(k)) * pow((x : Real), k)
      #|  (n : Num)
      #|  0
      #|  \226\136\128 x : Real, \226\136\128 n : Num, real_of_num(0) <= x \226\134\146 sum(op_dot_dot(0, n), (k : Num) => inv(real_of_num(FACT(k))) * pow(x, k)) <= exp(x)
      #|  0
      #|  (x : Real)
      #|  \226\136\128 x : Real, real_of_num(0) <= x \226\134\146 real_of_num(1) <= exp(x)
      #|  \226\136\128 x : Real, real_of_num(0) <= x \226\134\146 exp(-x) <= real_of_num(1)
      #|  -(x : Real) == -real_of_num(1) * x
      #|  \226\136\128 k : Num, real_of_num(1) / real_of_num(FACT(k)) * pow(-(x : Real), k) == pow(-real_of_num(1), k) / real_of_num(FACT(k)) * pow(x, k)
      #|  -(x : Real)
      #|  \226\136\128 x : Real, real_sums((k : Num) => pow(-real_of_num(1), k) / real_of_num(FACT(k)) * pow(x, k), exp(-x), from(0))
      #|  \226\136\128 x : Real, real_infsum(from(0), (k : Num) => pow(-real_of_num(1), k) / real_of_num(FACT(k)) * pow(x, k)) == exp(-x)
      #|  ((a : Num) <= (b : Num)) == (a * 1 <= b)
      #|  \226\136\128 n : Num, n <= FACT(n)
      #|  real_of_num(1) / (a : Real) == inv(a)
      #|  ((a : Real) <= (b : Real)) == (a <= b * real_of_num(1))
      #|  1
      #|  (k : Num) => inv(real_of_num(k))
      #|  1 + ((k : Num) + 1 + k) == 2 * (k + 1)
      #|  ((a : Real) / (b : Real) * (r : Real) * ((c : Real) / (d : Real) * (t : Real)) <= real_of_num(0)) == (real_of_num(0) <= pow(-real_of_num(1), 1) * (a * c) * (r * t) / b / d)
      #|  real_of_num(1) / (a : Real) == inv(a)
      #|  \226\136\128 x : Real, real_of_num(0) <= x && x <= real_of_num(1) \226\134\146 (\226\136\128 k : Num, abs(pow(-real_of_num(1), k + 1) / real_of_num(FACT(k + 1)) * pow(x, k + 1)) <= abs(pow(-real_of_num(1), k) / real_of_num(FACT(k)) * pow(x, k)) && pow(-real_of_num(1), k + 1) / real_of_num(FACT(k + 1)) * pow(x, k + 1) * (pow(-real_of_num(1), k) / real_of_num(FACT(k)) * pow(x, k)) <= real_of_num(0)) && op_minus_minus_minus_gt((k : Num) => pow(-real_of_num(1), k) / real_of_num(FACT(k)) * pow(x, k), real_of_num(0), sequentially)
      #|  real_of_num(0) <= (x : Real) \226\134\146 abs(x) == x
      #|  abs(pow(-real_of_num(1), 2 * (m : Num)) / real_of_num(FACT(2 * m)) * pow((x : Real), 2 * m)) == (f : (Num) -> Real)(2 * m)
      #|  sum(op_dot_dot(0, 2 * (m : Num)), (f : (Num) -> Real)) == sum(op_dot_dot(0, SUC(2 * m - 1)), f)
      #|  SUC(2 * (m : Num) - 1) == 2 * m
      #|  !((n : Num) == 0) \226\134\146 0 < n
      #|  (n : Num)
      #|  0
      #|  (f : (Num) -> Real)
      #|  real_of_num(1) / real_of_num(1) * real_of_num(1) == real_of_num(1)
      #|  (n : Num) == 0
      #|  (f : (Num) -> Real) == ((k : Num) => pow(-real_of_num(1), k) / real_of_num(FACT(k)) * pow((x : Real), k))
      #|  \226\136\128 x : Real, \226\136\128 n : Num, real_of_num(0) <= x && x <= real_of_num(1) && EVEN(n) \226\134\146 exp(-x) <= sum(op_dot_dot(0, n), (k : Num) => pow(-real_of_num(1), k) / real_of_num(FACT(k)) * pow(x, k))
      #|  real_of_num(0) <= (x : Real) \226\134\146 abs(x) == x
      #|  abs(pow(-real_of_num(1), SUC(2 * (m : Num))) / real_of_num(FACT(SUC(2 * m))) * pow((x : Real), SUC(2 * m))) == -(f : (Num) -> Real)(SUC(2 * m))
      #|  SUC((a : Num)) - 1 == a
      #|  (n : Num)
      #|  0
      #|  (f : (Num) -> Real)
      #|  (f : (Num) -> Real) == ((k : Num) => pow(-real_of_num(1), k) / real_of_num(FACT(k)) * pow((x : Real), k))
      #|  \226\136\128 x : Real, \226\136\128 n : Num, real_of_num(0) <= x && x <= real_of_num(1) && ODD(n) \226\134\146 sum(op_dot_dot(0, n), (k : Num) => pow(-real_of_num(1), k) / real_of_num(FACT(k)) * pow(x, k)) <= exp(-x)
      #|  !(real_of_num((k : Num)) == real_of_num(0))
      #|  (a : Real) * ((b : Real) / a) == b * (a / a)
      #|  \226\136\128 x : Real, \226\136\128 k : Num, 0 < k \226\134\146 pow(exp(x / real_of_num(k)), k) == exp(x)
      #|  \226\136\128 x : Real, \226\136\128 k : Num, 0 < k \226\134\146 inv(pow(exp(-x / real_of_num(k)), k)) == exp(x)
      #|  real_of_num(1) / (a : Real) == inv(a)
      #|  ((a : Real) <= (b : Real)) == (a <= b * real_of_num(1))
      #|  1
      #|  (k : Num) => inv(real_of_num(k))
      #|  1 + ((k : Num) + 1 + k) == 2 * (k + 1)
      #|  0 <= (t : Num) + 1
      #|  0 <= (t : Num) + 1
      #|  ((a : Real) / (b : Real) * (r : Real) * ((c : Real) / (d : Real) * (t : Real)) <= real_of_num(0)) == (real_of_num(0) <= pow(-real_of_num(1), 1) * (a * c) * (r * t) / b / d)
      #|  real_of_num(1) / (a : Real) == inv(a)
      #|  \226\136\128 x : Real, real_of_num(0) <= x && x <= real_of_num(1) \226\134\146 LET((f : (Num) -> Real) => LET_END((\226\136\128 k : Num, abs(f(k + 1)) <= abs(f(k)) && f(k + 1) * f(k) <= real_of_num(0)) && op_minus_minus_minus_gt(f, real_of_num(0), sequentially)), (k : Num) => pow(-real_of_num(1), k) / real_of_num(k + 1) * pow(x, k + 1))
      #|  real_of_num(0) <= (x : Real) \226\134\146 abs(x) == x
      #|  abs((f : (Num) -> Real)(2 * (m : Num))) == f(2 * m)
      #|  sum(op_dot_dot(0, 2 * (m : Num)), (f : (Num) -> Real)) == sum(op_dot_dot(0, SUC(2 * m - 1)), f)
      #|  SUC(2 * (m : Num) - 1) == 2 * m
      #|  real_of_num(0) <= (x : Real) && x < real_of_num(1) \226\134\146 abs(x) < real_of_num(1)
      #|  real_infsum(from(0), (f : (Num) -> Real)) == log(real_of_num(1) + (x : Real))
      #|  (n : Num)
      #|  0
      #|  (f : (Num) -> Real)
      #|  SUC((k : Num)) == k + 1
      #|  (a : Real) * ((b : Real) / (c : Real) * (d : Real)) == b / c * (a * d)
      #|  (x : Real) * sum(op_dot_dot(0, (n : Num)), (k : Num) => pow(-real_of_num(1), k) / real_of_num(k + 1) * pow(x, k)) == sum(op_dot_dot(0, n), (f : (Num) -> Real))
      #|  (f : (Num) -> Real) == ((k : Num) => pow(-real_of_num(1), k) / real_of_num(k + 1) * pow((x : Real), k + 1))
      #|  \226\136\128 x : Real, \226\136\128 n : Num, real_of_num(0) <= x && x < real_of_num(1) && EVEN(n) && 0 < n \226\134\146 log(real_of_num(1) + x) <= x * sum(op_dot_dot(0, n), (k : Num) => pow(-real_of_num(1), k) / real_of_num(k + 1) * pow(x, k))
      #|  -(-real_of_num(1) / (b : Real) * (c : Real)) == inv(b) * c
      #|  real_of_num(0) <= -(x : Real) \226\134\146 abs(x) == -x
      #|  abs((f : (Num) -> Real)(SUC(2 * (m : Num)))) == -f(SUC(2 * m))
      #|  SUC((a : Num)) - 1 == a
      #|  real_of_num(0) <= (x : Real) && x < real_of_num(1) \226\134\146 abs(x) < real_of_num(1)
      #|  real_infsum(from(0), (f : (Num) -> Real)) == log(real_of_num(1) + (x : Real))
      #|  0 < SUC(2 * (m : Num))
      #|  (n : Num)
      #|  0
      #|  (f : (Num) -> Real)
      #|  SUC((k : Num)) == k + 1
      #|  (a : Real) * ((b : Real) / (c : Real) * (d : Real)) == b / c * (a * d)
      #|  (x : Real) * sum(op_dot_dot(0, (n : Num)), (k : Num) => pow(-real_of_num(1), k) / real_of_num(k + 1) * pow(x, k)) == sum(op_dot_dot(0, n), (f : (Num) -> Real))
      #|  (f : (Num) -> Real) == ((k : Num) => pow(-real_of_num(1), k) / real_of_num(k + 1) * pow((x : Real), k + 1))
      #|  \226\136\128 x : Real, \226\136\128 n : Num, real_of_num(0) <= x && x < real_of_num(1) && ODD(n) \226\134\146 x * sum(op_dot_dot(0, n), (k : Num) => pow(-real_of_num(1), k) / real_of_num(k + 1) * pow(x, k)) <= log(real_of_num(1) + x)
      #|  real_of_num(0) < real_of_num(2)
      #|  \226\136\128 k : Num, \226\136\128 y : Real, real_of_num(0) < y \226\134\146 log(pow(real_of_num(2), k) * y) == real_of_num(k) * log(real_of_num(2)) + log(y)
      #|  real_of_num(0) < real_of_num(2)
      #|  \226\136\128 k : Num, \226\136\128 y : Real, real_of_num(0) < y \226\134\146 log(y / pow(real_of_num(2), k)) == log(y) - real_of_num(k) * log(real_of_num(2))
      #|Exp_log.exp_pos_poly_lower_bound =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\k:num. ((#real_mul:fun(real,fun(real,real)) (#real_inv:fun(real,real) (#real_of_num:fun(num,real) (#FACT:fun(num,num) k:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) k:num))))) (#exp:fun(real,real) x:real)))))))
      #|Exp_log.exp_ge1 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) (#exp:fun(real,real) x:real)))))
      #|Exp_log.neg_exp_le1 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) (#exp:fun(real,real) (#real_neg:fun(real,real) x:real))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))
      #|Exp_log.neg_exp_series =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (((#real_sums:fun(fun(num,real),fun(real,fun(fun(num,bool),bool))) (\k:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) k:num)) (#real_of_num:fun(num,real) (#FACT:fun(num,num) k:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) k:num)))) (#exp:fun(real,real) (#real_neg:fun(real,real) x:real))) (#from:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)))))
      #|Exp_log.neg_exp_infsum =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) ((#real_infsum:fun(fun(num,bool),fun(fun(num,real),real)) (#from:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num))) (\k:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) k:num)) (#real_of_num:fun(num,real) (#FACT:fun(num,num) k:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) k:num))))) (#exp:fun(real,real) (#real_neg:fun(real,real) x:real)))))
      #|Exp_log.n_le_fact =  |- (#forall:fun(fun(num,bool),bool) (\n:num. ((#<=:fun(num,fun(num,bool)) n:num) (#FACT:fun(num,num) n:num))))
      #|Exp_log.exp_alt_sign_lemma =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\k:num. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#+:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) (#FACT:fun(num,num) ((#+:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_pow:fun(real,fun(num,real)) x:real) ((#+:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) (#real_abs:fun(real,real) ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) k:num)) (#real_of_num:fun(num,real) (#FACT:fun(num,num) k:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) k:num))))) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#+:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) (#FACT:fun(num,num) ((#+:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_pow:fun(real,fun(num,real)) x:real) ((#+:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) k:num)) (#real_of_num:fun(num,real) (#FACT:fun(num,num) k:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) k:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) (((#--->:fun(fun(num,real),fun(real,fun(net(num),bool))) (\k:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) k:num)) (#real_of_num:fun(num,real) (#FACT:fun(num,num) k:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) k:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) #sequentially:net(num))))))
      #|Exp_log.exp_neg_poly_upper_bound =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#EVEN:fun(num,bool) n:num)))) ((#real_le:fun(real,fun(real,bool)) (#exp:fun(real,real) (#real_neg:fun(real,real) x:real))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\k:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) k:num)) (#real_of_num:fun(num,real) (#FACT:fun(num,num) k:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) k:num))))))))))
      #|Exp_log.exp_neg_poly_lower_bound =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#ODD:fun(num,bool) n:num)))) ((#real_le:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\k:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) k:num)) (#real_of_num:fun(num,real) (#FACT:fun(num,num) k:num)))) ((#real_pow:fun(real,fun(num,real)) x:real) k:num))))) (#exp:fun(real,real) (#real_neg:fun(real,real) x:real))))))))
      #|Exp_log.exp_reduce =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) k:num)) ((#=:fun(real,fun(real,bool)) ((#real_pow:fun(real,fun(num,real)) (#exp:fun(real,real) ((#real_div:fun(real,fun(real,real)) x:real) (#real_of_num:fun(num,real) k:num)))) k:num)) (#exp:fun(real,real) x:real)))))))
      #|Exp_log.exp_full_reduce =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\k:num. ((#==>:fun(bool,fun(bool,bool)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) k:num)) ((#=:fun(real,fun(real,bool)) (#real_inv:fun(real,real) ((#real_pow:fun(real,fun(num,real)) (#exp:fun(real,real) ((#real_div:fun(real,fun(real,real)) (#real_neg:fun(real,real) x:real)) (#real_of_num:fun(num,real) k:num)))) k:num))) (#exp:fun(real,real) x:real)))))))
      #|Exp_log.log_alt_sign_lemma =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#real_le:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#LET:fun(fun(fun(num,real),bool),fun(fun(num,real),bool)) (\f:fun(num,real). (#LET_END:fun(bool,bool) ((#/\:fun(bool,fun(bool,bool)) (#forall:fun(fun(num,bool),bool) (\k:num. ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) (f:fun(num,real) ((#+:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_abs:fun(real,real) (f:fun(num,real) k:num)))) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) (f:fun(num,real) ((#+:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (f:fun(num,real) k:num))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))))))) (((#--->:fun(fun(num,real),fun(real,fun(net(num),bool))) f:fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) #sequentially:net(num)))))) (\k:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) k:num)) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_pow:fun(real,fun(num,real)) x:real) ((#+:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))
      #|Exp_log.log_poly_upper_bound =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#/\:fun(bool,fun(bool,bool)) (#EVEN:fun(num,bool) n:num)) ((#<:fun(num,fun(num,bool)) (#NUMERAL:fun(num,num) #_0:num)) n:num))))) ((#real_le:fun(real,fun(real,bool)) (#log:fun(real,real) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real))) ((#real_mul:fun(real,fun(real,real)) x:real) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\k:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) k:num)) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_pow:fun(real,fun(num,real)) x:real) k:num)))))))))))
      #|Exp_log.log_poly_lower_bound =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) ((#/\:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#ODD:fun(num,bool) n:num)))) ((#real_le:fun(real,fun(real,bool)) ((#real_mul:fun(real,fun(real,real)) x:real) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\k:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) k:num)) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_pow:fun(real,fun(num,real)) x:real) k:num)))))) (#log:fun(real,real) ((#real_add:fun(real,fun(real,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) x:real))))))))
      #|Exp_log.log_reduce_pos_pow =  |- (#forall:fun(fun(num,bool),bool) (\k:num. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real)) ((#=:fun(real,fun(real,bool)) (#log:fun(real,real) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) k:num)) y:real))) ((#real_add:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) k:num)) (#log:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) (#log:fun(real,real) y:real))))))))
      #|Exp_log.log_reduce_neg_pow =  |- (#forall:fun(fun(num,bool),bool) (\k:num. (#forall:fun(fun(real,bool),bool) (\y:real. ((#==>:fun(bool,fun(bool,bool)) ((#real_lt:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) y:real)) ((#=:fun(real,fun(real,bool)) (#log:fun(real,real) ((#real_div:fun(real,fun(real,real)) y:real) ((#real_pow:fun(real,fun(num,real)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) k:num)))) ((#real_sub:fun(real,fun(real,real)) (#log:fun(real,real) y:real)) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) k:num)) (#log:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))))
      #|types = multivector/1 matroid/1 group/1 frag/1 metric/1 net/1 topology/1 tybit1/1 tybit0/1 finite_prod/2 finite_diff/2 finite_sum/2 cart/2 finite_image/1 int/0 real/0 hreal/0 nadd/0 char/0 list/1 option/1 sum/2 recspace/1 num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = mod_plus arith_base float_num min_exp interval_gt interval_neg interval_pos interval_not_zero iabs bounded_on_int bounded_on interval_arith num_exp D199 D198 D197 D196 D195 D194 D193 D192 D191 D190 D189 D188 D187 D186 D185 D184 D183 D182 D181 D180 D179 D178 D177 D176 D175 D174 D173 D172 D171 D170 D169 D168 D167 D166 D165 D164 D163 D162 D161 D160 D159 D158 D157 D156 D155 D154 D153 D152 D151 D150 D149 D148 D147 D146 D145 D144 D143 D142 D141 D140 D139 D138 D137 D136 D135 D134 D133 D132 D131 D130 D129 D128 D127 D126 D125 D124 D123 D122 D121 D120 D119 D118 D117 D116 D115 D114 D113 D112 D111 D110 D109 D108 D107 D106 D105 D104 D103 D102 D101 D100 D99 D98 D97 D96 D95 D94 D93 D92 D91 D90 D89 D88 D87 D86 D85 D84 D83 D82 D81 D80 D79 D78 D77 D76 D75 D74 D73 D72 D71 D70 D69 D68 D67 D66 D65 D64 D63 D62 D61 D60 D59 D58 D57 D56 D55 D54 D53 D52 D51 D50 D49 D48 D47 D46 D45 D44 D43 D42 D41 D40 D39 D38 D37 D36 D35 D34 D33 D32 D31 D30 D29 D28 D27 D26 D25 D24 D23 D22 D21 D20 D19 D18 D17 D16 D15 D14 D13 D12 D11 D10 D9 D8 D7 D6 D5 D4 D3 D2 D1 D0 NUM200 real_variation has_bounded_real_variation_on real_lebesgue_measurable real_measurable_on bernoulli vector_polynomial_function real_polynomial_function bernstein slice real_measure real_measurable has_real_measure absolutely_real_integrable_on real_negligible real_integral real_integrable_on has_real_integral real_log_convex_on log_convex_on real_convex_on open_real_segment closed_real_segment has_liminf has_limsup real_differentiable_on higher_real_derivative real_derivative real_differentiable has_real_derivative real_uniformly_continuous_on real_continuous_on real_continuous atreal binom rpow root acs asn cacs casn atn catn unwinding cpow clog tan ctan rotate2d Arg pi log cos sin exp csin ccos cexp analytic_on holomorphic_on higher_complex_derivative complex_derivative complex_differentiable has_complex_derivative cproduct real csqrt cnj complex_pow complex_div complex_inv complex_mul ii Cx complex Im Re lebesgue_measurable measurable_on measure measurable has_measure path_length rectifiable_path absolutely_continuous_on absolutely_setcontinuous_on vector_variation has_bounded_variation_on equiintegrable_on absolutely_integrable_on has_bounded_setvariation_on set_variation negligible division_points lifted operative integral integrable_on has_integral has_integral_compact_interval fine tagged_division_of tagged_partial_division_of division_of gauge content interval_lowerbound interval_upperbound reversion outermorphism seqiterate inner outer geom_mul Product grade multivector multivec mbasis lambdas $$ codeset setcode dest_multivector mk_multivector binarysum bitset vector_derivative has_vector_derivative jacobian frechet_derivative differentiable_on differentiable has_derivative interval_bij ENR ANR AR retract_of retraction brouwer_degree brouwer_degree1 triangulation simplicial_complex simplex polyhedron polytope edge_of facet_of extreme_point_of exposed_face_of face_of covering_space dimension contractible homotopy_equivalent fundamental_group simply_connected homotopic_loops homotopic_paths outside inside path_connected path_components path_component linepath subpath shiftpath arc simple_path ++ reversepath path_image pathfinish pathstart path barycentre relative_frontier relative_interior starlike epigraph convex_cone polar_dual aff_dim convex_on coplanar affine_dependent conic convex affine analytic borel_measurable_on baire borel fsigma gdelta locally hausdist setdist closest_point summable infsum sums homeomorphic homeomorphism is_interval diameter components connected_component uniformly_continuous_on continuous_on continuous complete cauchy compact bounded condensation_point_of lim --> in_direction at_neginfinity at_posinfinity at_infinity at frontier closure interior limit_point_of connected open_segment closed_segment manhattan sphere cball ball closed euclidean_metric euclidean open reflect_along rotoinversion_matrix rotation_matrix orthogonal_matrix orthogonal_transformation positive_definite positive_semidefinite diagonal_matrix cofactor det trace sign evenperm permutation swapseq three_cycle swap inverse permutes closed_interval open_interval midpoint between collinear infnorm matrix_inv rank columnvector rowvector euclidean_matroid dim independent dependent span subspace pushin dropout indicator drop lift onorm matrix invertible normal_matrix symmetric_matrix columns rows column row transp mat vector_matrix_mul matrix_vector_mul matrix_mul matrix_sub matrix_add matrix_neg %% adjoint bilinear linear orthogonal basis vsum distance vector_norm dot vec % vector_neg vector_sub vector_add matroid_dim matroid_finite_dim matroid_dimension matroid_finite_dimensional submatroid matroid_subspace matroid_dependent matroid_basis matroid_independent matroid_spanning matroid_span matroid_set dest_matroid matroid brouwer_degree2 reduced_homology_group hom_relboundary hom_induced hom_boundary homology_group relative_homology_group relcycle_group chain_group singular_subdivision simplicial_subdivision simplicial_vertex simplicial_cone simplex_cone simplicial_chain simplicial_simplex oriented_simplex chain_map simplex_map homologous_rel singular_relboundary singular_relcycle mod_subset chain_boundary singular_chain singular_face singular_simplex simplicial_face standard_simplex short_exact_sequence group_exactness solvable_group free_abelian_group pgroup integer_mod_group integer_group finitely_generated_group cyclic_group group_element_order trivial_homomorphism group_image group_kernel quotient_group group_normalizer group_centralizer group_conjugate normal_subgroup_of left_coset right_coset group_orbit group_stabilizer group_action group_setmul group_setinv isomorphic_group group_automorphism group_isomorphism group_isomorphisms group_endomorphism group_epimorphism group_monomorphism group_homomorphism sum_group product_group prod_group subgroup_generated subgroup_of group_conjugation group_sum group_product group_nmul group_add group_neg abelian_group group_zpow group_pow group_div opposite_group trivial_group singleton_group group_mul group_inv group_id group_carrier group_operations group index frag_extend frag_sub frag_add frag_cmul frag_neg frag_of frag_0 frag_support dest_frag mk_frag cantor_set cantor_map cantor_term cantor_space dimension_le sigma_locally_finite_in paracompact_space cfunspace funspace nsphere euclidean_space capped_metric fccoverable_in ulc_space fccoverable_space mdiameter cauchy_continuous_map uniformly_continuous_map lipschitz_continuous_map prod_metric completely_metrizable_space contractible_space homotopy_equivalent_space homotopic_with alexandroff_compactification kification k_space quasi_components_of quasi_component_of locally_connected_space locally_connected_at weakly_locally_connected_at locally_path_connected_space locally_path_connected_at weakly_locally_path_connected_at completely_regular_space normal_space path_components_of path_component_of path_connected_in path_connected_space path_in real_summable real_infsum real_sums reallim ---> topcontinuous_at totally_bounded_in mcomplete cauchy_in limit atpointof real_compact real_bounded real_euclidean_metric euclideanreal real_closed real_open locally_compact_space regular_space kolmogorov_quotient t0_space neighbourhood_base_of neighbourhood_base_at monotone_map connected_components_of connected_component_of separated_between connected_in connected_space metrizable_space discrete_metric mbounded msphere mcball mtopology submetric mball mdist mspace dest_metric metric is_metric_space borel_measurable_map borel_in gdelta_in fsigma_in sequentially trivial_limit eventually within netlimit netlimits netfilter dest_net mk_net separable_space first_countable second_countable lindelof_space perfect_map proper_map kc_space hausdorff_space t1_space separated_in compact_space compact_in retract_of_space retraction_map section_map retraction_maps embedding_map homeomorphic_space homeomorphic_maps homeomorphic_map sum_topology product_topology prod_topology quotient_map closed_map open_map continuous_map locally_finite_in frontier_of interior_of closure_of derived_set_of hereditarily subtopology discrete_space discrete_topology closed_in topspace open_in topology istopology ITER suslin suslin_operation relative_to from hull matrify vectorize closed_real_interval open_real_interval is_realinterval frac floor rational ^_c *_c +_c ordinal linseg inseg properly strictly antichain chain wqoset woset toset poset qoset fld superadmissible tailadmissible admissible CASEWISE PCROSS vector mktybit1 _100531 _dest_tybit1 _mk_tybit1 mktybit0 _100512 _dest_tybit0 _mk_tybit0 dest_finite_prod mk_finite_prod dest_finite_diff mk_finite_diff sndcart fstcart pastecart dest_finite_sum mk_finite_sum lambda $ dest_cart mk_cart dest_finite_image finite_index dimindex polynomial_function sum nsum isum product iproduct nproduct iterato iterate support monoidal neutral .. has_sup has_inf inf sup COUNTABLE >_c >=_c =_c <_c <=_c ARBITRARY INTERSECTION_OF UNION_OF pairwise list_of_set set_of_list disjoint_union product_map cartesian_product RESTRICTION EXTENSIONAL ARB CROSS HAS_SIZE CARD ITSET FINREC REST CHOICE BIJ SURJ INJ IMAGE INFINITE FINITE SING DISJOINT PSUBSET SUBSET DELETE DIFF INTERS INTER UNIONS UNION UNIV INSERT EMPTY SETSPEC GSPEC IN real_zpow prime num_lcm num_gcd num_coprime num_mod num_divides num_of_int int_lcm int_gcd int_coprime int_mod int_divides real_mod == rem div int_pow int_min int_max int_sgn int_abs int_mul int_sub int_add int_neg int_of_num int_gt int_ge int_lt int_le real_of_int int_of_real integer DECIMAL sqrt real_sgn real_min real_max real_div real_pow real_abs real_gt real_ge real_lt real_sub real_inv real_le real_mul real_add real_neg real_of_num dest_real mk_real treal_eq treal_inv treal_le treal_mul treal_add treal_neg treal_of_num hreal_inv hreal_le hreal_mul hreal_add hreal_of_num dest_hreal mk_hreal nadd_inv nadd_rinv nadd_mul nadd_add nadd_le nadd_of_num nadd_eq dest_nadd mk_nadd is_nadd dist ASCII _22943 _dest_char _mk_char list_of_seq PAIRWISE ALLPAIRS ZIP ITLIST2 ASSOC FILTER EL MAP2 ALL2 MEM ITLIST EX ALL NULL REPLICATE BUTLAST LAST MAP LENGTH REVERSE APPEND TL HD ISO CONS NIL _dest_list _mk_list SOME NONE _dest_option _mk_option OUTR OUTL INR INL _dest_sum _mk_sum FNIL FCONS CONSTR BOTTOM _dest_rec _mk_rec ZRECSPACE ZBOT ZCONSTR INJP INJF INJA INJN NUMRIGHT NUMLEFT NUMSUM NUMSND NUMFST NUMPAIR MEASURE WF minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|definitions = 1052
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?1
      #|counter_genvar = _3717018:bool
      #|
    ),
  )
}
