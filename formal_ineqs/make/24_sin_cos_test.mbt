// Formal_ineqs/trig/sin_cos.hl in its directory's load order: the test block of
// formal_ineqs/trig/sin_cos/sin_cos_ref_test.mbt (tools/ocaml_ref/chain_test.py), with the same golden
// (tools/ocaml_ref/Formal_ineqs_trig_sin_cos_ref.expected).

///|
test "Formal_ineqs/trig/sin_cos matches Formal_ineqs/trig/sin_cos.ml" {
  @testkit.release_output()
  @sin_cos.load()
  let log = @testkit.Log::new()
  log.capture_reports()
  for th in ["Formal_ineqs/trig/sin_cos"] {
    log.show_theory_output(th)
  }
  log.show_theory_trace("Formal_ineqs/trig/sin_cos")
  log.capture_stdout()
  // BEGIN generated theorem list
  log.attempt("Sin_cos.cos_pi_2", () => sthm(@sin_cos.cos_pi_2()))
  log.attempt("Sin_cos.cos_derivatives", () => sthm(@sin_cos.cos_derivatives()))
  log.attempt("Sin_cos.taylor_cos_raw", () => sthm(@sin_cos.taylor_cos_raw()))
  log.attempt("Sin_cos.sum_pair_from_0", () => sthm(@sin_cos.sum_pair_from_0()))
  log.attempt("Sin_cos.taylor_cos", () => sthm(@sin_cos.taylor_cos()))
  log.attempt("Sin_cos.cos_poly_upper_bound", () => {
    sthm(@sin_cos.cos_poly_upper_bound())
  })
  log.attempt("Sin_cos.cos_poly_lower_bound", () => {
    sthm(@sin_cos.cos_poly_lower_bound())
  })
  log.attempt("Sin_cos.sin_pi_2", () => sthm(@sin_cos.sin_pi_2()))
  log.attempt("Sin_cos.sin_derivatives", () => sthm(@sin_cos.sin_derivatives()))
  log.attempt("Sin_cos.taylor_sin_raw", () => sthm(@sin_cos.taylor_sin_raw()))
  log.attempt("Sin_cos.taylor_sin", () => sthm(@sin_cos.taylor_sin()))
  log.attempt("Sin_cos.sin_pos_poly_upper_bound", () => {
    sthm(@sin_cos.sin_pos_poly_upper_bound())
  })
  log.attempt("Sin_cos.sin_pos_poly_lower_bound", () => {
    sthm(@sin_cos.sin_pos_poly_lower_bound())
  })
  log.attempt("Sin_cos.sin_neg_poly_upper_bound", () => {
    sthm(@sin_cos.sin_neg_poly_upper_bound())
  })
  log.attempt("Sin_cos.sin_neg_poly_lower_bound", () => {
    sthm(@sin_cos.sin_neg_poly_lower_bound())
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
      #|Formal_ineqs/trig/sin_cos quotations (124):
      #|  (a : Real) - ((b : Real) + a) == -b
      #|  \226\136\128 x : Real, cos(x + pi / real_of_num(2)) == -sin(x)
      #|  (x : Real) + ((a : Real) + real_of_num(1)) * (t : Real) == x + a * t + t
      #|  (real_of_num(1) + real_of_num(0)) * -(a : Real) == -a
      #|  \226\136\128 x : Real, \226\136\128 n : Num, has_real_derivative((x : Real) => cos(x + real_of_num(n) * (pi / real_of_num(2))), cos(x + real_of_num(n + 1) * (pi / real_of_num(2))), atreal(x))
      #|  (i : Num)
      #|  cos(real_of_num((i : Num)) * (pi / real_of_num(2))) == real_of_num(0)
      #|  real_of_num(2) * (a : Real) * ((b : Real) / real_of_num(2)) == a * b
      #|  DIV(2 * (m : Num), 2) == m
      #|  EVEN((i : Num))
      #|  \226\136\128 i : Num, cos(real_of_num(i) * (pi / real_of_num(2))) * (pow((x : Real), i) / real_of_num(FACT(i))) == (if EVEN(i) { pow(-real_of_num(1), DIV(i, 2)) * pow(x, i) / real_of_num(FACT(i)) } else { real_of_num(0) })
      #|  (x : Real)
      #|  real_of_num(0)
      #|  real_of_num(1)
      #|  (UNIV : (Real) -> Bool)
      #|  (n : Num)
      #|  (i : Num) => (x : Real) => cos(x + real_of_num(i) * (pi / real_of_num(2)))
      #|  \226\136\128 x : Real, \226\136\128 n : Num, abs(cos(x) - sum(op_dot_dot(0, n), (k : Num) => if EVEN(k) { pow(-real_of_num(1), DIV(k, 2)) * pow(x, k) / real_of_num(FACT(k)) } else { real_of_num(0) })) <= pow(abs(x), n + 1) / real_of_num(FACT(n + 1))
      #|  2 * 0 == 0
      #|  (n : Num)
      #|  0
      #|  (f : (Num) -> Real)
      #|  \226\136\128 f : (Num) -> Real, \226\136\128 n : Num, sum(op_dot_dot(0, 2 * n + 1), f) == sum(op_dot_dot(0, n), (i : Num) => f(2 * i) + f(2 * i + 1))
      #|  (a : Real) * (b : Real) / (c : Real) == a / c * b
      #|  \226\136\128 i : Num, DIV(2 * i, 2) == i
      #|  \226\136\128 i : Num, !EVEN(2 * i + 1)
      #|  2 * (n : Num) + 1 + 1 == 2 * n + 2
      #|  2 * (n : Num) + 1
      #|  (x : Real)
      #|  \226\136\128 x : Real, \226\136\128 n : Num, abs(cos(x) - sum(op_dot_dot(0, n), (i : Num) => pow(-real_of_num(1), i) / real_of_num(FACT(2 * i)) * pow(x, 2 * i))) <= pow(abs(x), 2 * n + 2) / real_of_num(FACT(2 * n + 2))
      #|  pow(abs((x : Real)), 2 * (n : Num)) == pow(x, 2 * n)
      #|  real_of_num(1) / (a : Real) * (b : Real) == b / a
      #|  !((n : Num) == 0) \226\134\146 2 * (n - 1) + 2 == 2 * n
      #|  pow(-real_of_num(1), (n : Num)) == real_of_num(1)
      #|  (n : Num) - 1
      #|  (x : Real)
      #|  0 <= (n : Num)
      #|  !((n : Num) == 0) \226\134\146 0 < n
      #|  (n : Num) == 0
      #|  \226\136\128 x : Real, \226\136\128 n : Num, EVEN(n) \226\134\146 cos(x) <= sum(op_dot_dot(0, n), (i : Num) => pow(-real_of_num(1), i) / real_of_num(FACT(2 * i)) * pow(x, 2 * i))
      #|  pow(abs((x : Real)), 2 * (n : Num)) == pow(x, 2 * n)
      #|  -real_of_num(1) / (a : Real) * (b : Real) == -b / a
      #|  !((n : Num) == 0) \226\134\146 2 * (n - 1) + 2 == 2 * n
      #|  pow(-real_of_num(1), (n : Num)) == -real_of_num(1)
      #|  (n : Num) - 1
      #|  (x : Real)
      #|  0 <= (n : Num)
      #|  !((n : Num) == 0) \226\134\146 0 < n
      #|  !EVEN((n : Num))
      #|  (n : Num) == 0
      #|  \226\136\128 x : Real, \226\136\128 n : Num, ODD(n) \226\134\146 sum(op_dot_dot(0, n), (i : Num) => pow(-real_of_num(1), i) / real_of_num(FACT(2 * i)) * pow(x, 2 * i)) <= cos(x)
      #|  (a : Real) - ((b : Real) + a) == -b
      #|  \226\136\128 x : Real, sin(x + pi / real_of_num(2)) == cos(x)
      #|  (x : Real) + ((a : Real) + real_of_num(1)) * (t : Real) == x + a * t + t
      #|  (real_of_num(1) + real_of_num(0)) * (a : Real) == a
      #|  \226\136\128 x : Real, \226\136\128 n : Num, has_real_derivative((x : Real) => sin(x + real_of_num(n) * (pi / real_of_num(2))), sin(x + real_of_num(n + 1) * (pi / real_of_num(2))), atreal(x))
      #|  (i : Num)
      #|  sin(real_of_num((i : Num)) * (pi / real_of_num(2))) == real_of_num(0)
      #|  (real_of_num(2) * (a : Real) + real_of_num(1)) * ((b : Real) / real_of_num(2)) == a * b + b / real_of_num(2)
      #|  1 < 2
      #|  !(2 == 0)
      #|  2 * (m : Num) == m * 2
      #|  DIV(SUC(2 * (m : Num)), 2) == m
      #|  ODD((i : Num))
      #|  \226\136\128 i : Num, sin(real_of_num(i) * (pi / real_of_num(2))) * (pow((x : Real), i) / real_of_num(FACT(i))) == (if ODD(i) { pow(-real_of_num(1), DIV(i, 2)) * pow(x, i) / real_of_num(FACT(i)) } else { real_of_num(0) })
      #|  (x : Real)
      #|  real_of_num(0)
      #|  real_of_num(1)
      #|  (UNIV : (Real) -> Bool)
      #|  (n : Num)
      #|  (i : Num) => (x : Real) => sin(x + real_of_num(i) * (pi / real_of_num(2)))
      #|  \226\136\128 x : Real, \226\136\128 n : Num, abs(sin(x) - sum(op_dot_dot(0, n), (k : Num) => if ODD(k) { pow(-real_of_num(1), DIV(k, 2)) * pow(x, k) / real_of_num(FACT(k)) } else { real_of_num(0) })) <= pow(abs(x), n + 1) / real_of_num(FACT(n + 1))
      #|  2 * (n : Num) + 2 + 1 == 2 * n + 3
      #|  (a : Real) * (b : Real) / (c : Real) == a / c * b
      #|  1 < 2
      #|  !(2 == 0)
      #|  2 * (m : Num) == m * 2
      #|  \226\136\128 i : Num, DIV(SUC(2 * i), 2) == i
      #|  \226\136\128 i : Num, !ODD(2 * i)
      #|  2 * (i : Num) + 1 == SUC(2 * i)
      #|  (n : Num)
      #|  !ODD(SUC(2 * (n : Num) + 1))
      #|  0 <= SUC((k : Num))
      #|  (a : Num) + 2 == SUC(a + 1)
      #|  \226\136\128 f : (Num) -> Real, sum(op_dot_dot(0, 2 * (n : Num) + 2), (k : Num) => if ODD(k) { f(k) } else { real_of_num(0) }) == sum(op_dot_dot(0, 2 * n + 1), (k : Num) => if ODD(k) { f(k) } else { real_of_num(0) })
      #|  2 * (n : Num) + 2
      #|  (x : Real)
      #|  \226\136\128 x : Real, \226\136\128 n : Num, abs(sin(x) - sum(op_dot_dot(0, n), (i : Num) => pow(-real_of_num(1), i) / real_of_num(FACT(2 * i + 1)) * pow(x, 2 * i + 1))) <= pow(abs(x), 2 * n + 3) / real_of_num(FACT(2 * n + 3))
      #|  pow(abs((x : Real)), 2 * (n : Num) + 1) == pow(x, 2 * n + 1)
      #|  real_of_num(1) / (a : Real) * (b : Real) == b / a
      #|  !((n : Num) == 0) \226\134\146 2 * (n - 1) + 3 == 2 * n + 1
      #|  pow(-real_of_num(1), (n : Num)) == real_of_num(1)
      #|  (n : Num) - 1
      #|  (x : Real)
      #|  0 <= (n : Num)
      #|  !((n : Num) == 0) \226\134\146 0 < n
      #|  real_of_num(0) <= (x : Real)
      #|  0
      #|  (x : Real)
      #|  (n : Num) == 0
      #|  \226\136\128 x : Real, \226\136\128 n : Num, real_of_num(0) <= x && EVEN(n) \226\134\146 sin(x) <= sum(op_dot_dot(0, n), (i : Num) => pow(-real_of_num(1), i) / real_of_num(FACT(2 * i + 1)) * pow(x, 2 * i + 1))
      #|  pow(abs((x : Real)), 2 * (n : Num) + 1) == pow(x, 2 * n + 1)
      #|  -real_of_num(1) / (a : Real) * (b : Real) == -b / a
      #|  !((n : Num) == 0) \226\134\146 2 * (n - 1) + 3 == 2 * n + 1
      #|  pow(-real_of_num(1), (n : Num)) == -real_of_num(1)
      #|  (n : Num) - 1
      #|  (x : Real)
      #|  0 <= (n : Num)
      #|  !((n : Num) == 0) \226\134\146 0 < n
      #|  !EVEN((n : Num))
      #|  (n : Num) == 0
      #|  \226\136\128 x : Real, \226\136\128 n : Num, real_of_num(0) <= x && ODD(n) \226\134\146 sum(op_dot_dot(0, n), (i : Num) => pow(-real_of_num(1), i) / real_of_num(FACT(2 * i + 1)) * pow(x, 2 * i + 1)) <= sin(x)
      #|  (a : Real) * -(b : Real) == -(a * b)
      #|  \226\136\128 x : Real, \226\136\128 i : Num, pow(-x, 2 * i + 1) == -pow(x, 2 * i + 1)
      #|  (n : Num)
      #|  -(x : Real)
      #|  real_of_num(0) <= -(x : Real)
      #|  \226\136\128 x : Real, \226\136\128 n : Num, x <= real_of_num(0) && ODD(n) \226\134\146 sin(x) <= sum(op_dot_dot(0, n), (i : Num) => pow(-real_of_num(1), i) / real_of_num(FACT(2 * i + 1)) * pow(x, 2 * i + 1))
      #|  (a : Real) * -(b : Real) == -(a * b)
      #|  \226\136\128 x : Real, \226\136\128 i : Num, pow(-x, 2 * i + 1) == -pow(x, 2 * i + 1)
      #|  (n : Num)
      #|  -(x : Real)
      #|  real_of_num(0) <= -(x : Real)
      #|  \226\136\128 x : Real, \226\136\128 n : Num, x <= real_of_num(0) && EVEN(n) \226\134\146 sum(op_dot_dot(0, n), (i : Num) => pow(-real_of_num(1), i) / real_of_num(FACT(2 * i + 1)) * pow(x, 2 * i + 1)) <= sin(x)
      #|Sin_cos.cos_pi_2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#cos:fun(real,real) ((#real_add:fun(real,fun(real,real)) x:real) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) (#real_neg:fun(real,real) (#sin:fun(real,real) x:real)))))
      #|Sin_cos.cos_derivatives =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) (\x:real. (#cos:fun(real,real) ((#real_add:fun(real,fun(real,real)) x:real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))) (#cos:fun(real,real) ((#real_add:fun(real,fun(real,real)) x:real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) (#atreal:fun(real,net(real)) x:real))))))
      #|Sin_cos.taylor_cos_raw =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (#cos:fun(real,real) x:real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\k:num. (((#COND:fun(bool,fun(real,fun(real,real))) (#EVEN:fun(num,bool) k:num)) ((#real_div:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#DIV:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_pow:fun(real,fun(num,real)) x:real) k:num))) (#real_of_num:fun(num,real) (#FACT:fun(num,num) k:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_abs:fun(real,real) x:real)) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) (#FACT:fun(num,num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))
      #|Sin_cos.sum_pair_from_0 =  |- (#forall:fun(fun(fun(num,real),bool),bool) (\f:fun(num,real). (#forall:fun(fun(num,bool),bool) (\n:num. ((#=:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) f:fun(num,real))) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\i:num. ((#real_add:fun(real,fun(real,real)) (f:fun(num,real) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) i:num))) (f:fun(num,real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) i:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))
      #|Sin_cos.taylor_cos =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (#cos:fun(real,real) x:real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) i:num)) (#real_of_num:fun(num,real) (#FACT:fun(num,num) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) i:num))))) ((#real_pow:fun(real,fun(num,real)) x:real) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) i:num)))))))) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_abs:fun(real,real) x:real)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_of_num:fun(num,real) (#FACT:fun(num,num) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))
      #|Sin_cos.cos_poly_upper_bound =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#EVEN:fun(num,bool) n:num)) ((#real_le:fun(real,fun(real,bool)) (#cos:fun(real,real) x:real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) i:num)) (#real_of_num:fun(num,real) (#FACT:fun(num,num) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) i:num))))) ((#real_pow:fun(real,fun(num,real)) x:real) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) i:num)))))))))))
      #|Sin_cos.cos_poly_lower_bound =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) (#ODD:fun(num,bool) n:num)) ((#real_le:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) i:num)) (#real_of_num:fun(num,real) (#FACT:fun(num,num) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) i:num))))) ((#real_pow:fun(real,fun(num,real)) x:real) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) i:num)))))) (#cos:fun(real,real) x:real)))))))
      #|Sin_cos.sin_pi_2 =  |- (#forall:fun(fun(real,bool),bool) (\x:real. ((#=:fun(real,fun(real,bool)) (#sin:fun(real,real) ((#real_add:fun(real,fun(real,real)) x:real) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) (#cos:fun(real,real) x:real))))
      #|Sin_cos.sin_derivatives =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. (((#has_real_derivative:fun(fun(real,real),fun(real,fun(net(real),bool))) (\x:real. (#sin:fun(real,real) ((#real_add:fun(real,fun(real,real)) x:real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) n:num)) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))) (#sin:fun(real,real) ((#real_add:fun(real,fun(real,real)) x:real) ((#real_mul:fun(real,fun(real,real)) (#real_of_num:fun(num,real) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#real_div:fun(real,fun(real,real)) #pi:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))) (#atreal:fun(real,net(real)) x:real))))))
      #|Sin_cos.taylor_sin_raw =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (#sin:fun(real,real) x:real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\k:num. (((#COND:fun(bool,fun(real,fun(real,real))) (#ODD:fun(num,bool) k:num)) ((#real_div:fun(real,fun(real,real)) ((#real_mul:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) ((#DIV:fun(num,fun(num,num)) k:num) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) ((#real_pow:fun(real,fun(num,real)) x:real) k:num))) (#real_of_num:fun(num,real) (#FACT:fun(num,num) k:num)))) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))))))) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_abs:fun(real,real) x:real)) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) (#real_of_num:fun(num,real) (#FACT:fun(num,num) ((#+:fun(num,fun(num,num)) n:num) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))
      #|Sin_cos.taylor_sin =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#real_le:fun(real,fun(real,bool)) (#real_abs:fun(real,real) ((#real_sub:fun(real,fun(real,real)) (#sin:fun(real,real) x:real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) i:num)) (#real_of_num:fun(num,real) (#FACT:fun(num,num) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) i:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_pow:fun(real,fun(num,real)) x:real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) i:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_abs:fun(real,real) x:real)) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))) (#real_of_num:fun(num,real) (#FACT:fun(num,num) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) n:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))))))))
      #|Sin_cos.sin_pos_poly_upper_bound =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) (#EVEN:fun(num,bool) n:num))) ((#real_le:fun(real,fun(real,bool)) (#sin:fun(real,real) x:real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) i:num)) (#real_of_num:fun(num,real) (#FACT:fun(num,num) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) i:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_pow:fun(real,fun(num,real)) x:real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) i:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))))
      #|Sin_cos.sin_pos_poly_lower_bound =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num))) x:real)) (#ODD:fun(num,bool) n:num))) ((#real_le:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) i:num)) (#real_of_num:fun(num,real) (#FACT:fun(num,num) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) i:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_pow:fun(real,fun(num,real)) x:real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) i:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) (#sin:fun(real,real) x:real)))))))
      #|Sin_cos.sin_neg_poly_upper_bound =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (#ODD:fun(num,bool) n:num))) ((#real_le:fun(real,fun(real,bool)) (#sin:fun(real,real) x:real)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) i:num)) (#real_of_num:fun(num,real) (#FACT:fun(num,num) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) i:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_pow:fun(real,fun(num,real)) x:real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) i:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))))))))
      #|Sin_cos.sin_neg_poly_lower_bound =  |- (#forall:fun(fun(real,bool),bool) (\x:real. (#forall:fun(fun(num,bool),bool) (\n:num. ((#==>:fun(bool,fun(bool,bool)) ((#/\:fun(bool,fun(bool,bool)) ((#real_le:fun(real,fun(real,bool)) x:real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) #_0:num)))) (#EVEN:fun(num,bool) n:num))) ((#real_le:fun(real,fun(real,bool)) ((#sum:fun(fun(num,bool),fun(fun(num,real),real)) ((#..:fun(num,fun(num,fun(num,bool))) (#NUMERAL:fun(num,num) #_0:num)) n:num)) (\i:num. ((#real_mul:fun(real,fun(real,real)) ((#real_div:fun(real,fun(real,real)) ((#real_pow:fun(real,fun(num,real)) (#real_neg:fun(real,real) (#real_of_num:fun(num,real) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))) i:num)) (#real_of_num:fun(num,real) (#FACT:fun(num,num) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) i:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num))))))) ((#real_pow:fun(real,fun(num,real)) x:real) ((#+:fun(num,fun(num,num)) ((#*:fun(num,fun(num,num)) (#NUMERAL:fun(num,num) (#BIT0:fun(num,num) (#BIT1:fun(num,num) #_0:num)))) i:num)) (#NUMERAL:fun(num,num) (#BIT1:fun(num,num) #_0:num)))))))) (#sin:fun(real,real) x:real)))))))
      #|types = multivector/1 matroid/1 group/1 frag/1 metric/1 net/1 topology/1 tybit1/1 tybit0/1 finite_prod/2 finite_diff/2 finite_sum/2 cart/2 finite_image/1 int/0 real/0 hreal/0 nadd/0 char/0 list/1 option/1 sum/2 recspace/1 num/0 ind/0 prod/2 1/0 bool/0 fun/2
      #|constants = halfatn4 halfatn poly_f_odd poly_f_even poly_f real_zero l_seq TABLE REVERSE_TABLE mod_plus arith_base float_num min_exp interval_gt interval_neg interval_pos interval_not_zero iabs bounded_on_int bounded_on interval_arith num_exp D199 D198 D197 D196 D195 D194 D193 D192 D191 D190 D189 D188 D187 D186 D185 D184 D183 D182 D181 D180 D179 D178 D177 D176 D175 D174 D173 D172 D171 D170 D169 D168 D167 D166 D165 D164 D163 D162 D161 D160 D159 D158 D157 D156 D155 D154 D153 D152 D151 D150 D149 D148 D147 D146 D145 D144 D143 D142 D141 D140 D139 D138 D137 D136 D135 D134 D133 D132 D131 D130 D129 D128 D127 D126 D125 D124 D123 D122 D121 D120 D119 D118 D117 D116 D115 D114 D113 D112 D111 D110 D109 D108 D107 D106 D105 D104 D103 D102 D101 D100 D99 D98 D97 D96 D95 D94 D93 D92 D91 D90 D89 D88 D87 D86 D85 D84 D83 D82 D81 D80 D79 D78 D77 D76 D75 D74 D73 D72 D71 D70 D69 D68 D67 D66 D65 D64 D63 D62 D61 D60 D59 D58 D57 D56 D55 D54 D53 D52 D51 D50 D49 D48 D47 D46 D45 D44 D43 D42 D41 D40 D39 D38 D37 D36 D35 D34 D33 D32 D31 D30 D29 D28 D27 D26 D25 D24 D23 D22 D21 D20 D19 D18 D17 D16 D15 D14 D13 D12 D11 D10 D9 D8 D7 D6 D5 D4 D3 D2 D1 D0 NUM200 real_variation has_bounded_real_variation_on real_lebesgue_measurable real_measurable_on bernoulli vector_polynomial_function real_polynomial_function bernstein slice real_measure real_measurable has_real_measure absolutely_real_integrable_on real_negligible real_integral real_integrable_on has_real_integral real_log_convex_on log_convex_on real_convex_on open_real_segment closed_real_segment has_liminf has_limsup real_differentiable_on higher_real_derivative real_derivative real_differentiable has_real_derivative real_uniformly_continuous_on real_continuous_on real_continuous atreal binom rpow root acs asn cacs casn atn catn unwinding cpow clog tan ctan rotate2d Arg pi log cos sin exp csin ccos cexp analytic_on holomorphic_on higher_complex_derivative complex_derivative complex_differentiable has_complex_derivative cproduct real csqrt cnj complex_pow complex_div complex_inv complex_mul ii Cx complex Im Re lebesgue_measurable measurable_on measure measurable has_measure path_length rectifiable_path absolutely_continuous_on absolutely_setcontinuous_on vector_variation has_bounded_variation_on equiintegrable_on absolutely_integrable_on has_bounded_setvariation_on set_variation negligible division_points lifted operative integral integrable_on has_integral has_integral_compact_interval fine tagged_division_of tagged_partial_division_of division_of gauge content interval_lowerbound interval_upperbound reversion outermorphism seqiterate inner outer geom_mul Product grade multivector multivec mbasis lambdas $$ codeset setcode dest_multivector mk_multivector binarysum bitset vector_derivative has_vector_derivative jacobian frechet_derivative differentiable_on differentiable has_derivative interval_bij ENR ANR AR retract_of retraction brouwer_degree brouwer_degree1 triangulation simplicial_complex simplex polyhedron polytope edge_of facet_of extreme_point_of exposed_face_of face_of covering_space dimension contractible homotopy_equivalent fundamental_group simply_connected homotopic_loops homotopic_paths outside inside path_connected path_components path_component linepath subpath shiftpath arc simple_path ++ reversepath path_image pathfinish pathstart path barycentre relative_frontier relative_interior starlike epigraph convex_cone polar_dual aff_dim convex_on coplanar affine_dependent conic convex affine analytic borel_measurable_on baire borel fsigma gdelta locally hausdist setdist closest_point summable infsum sums homeomorphic homeomorphism is_interval diameter components connected_component uniformly_continuous_on continuous_on continuous complete cauchy compact bounded condensation_point_of lim --> in_direction at_neginfinity at_posinfinity at_infinity at frontier closure interior limit_point_of connected open_segment closed_segment manhattan sphere cball ball closed euclidean_metric euclidean open reflect_along rotoinversion_matrix rotation_matrix orthogonal_matrix orthogonal_transformation positive_definite positive_semidefinite diagonal_matrix cofactor det trace sign evenperm permutation swapseq three_cycle swap inverse permutes closed_interval open_interval midpoint between collinear infnorm matrix_inv rank columnvector rowvector euclidean_matroid dim independent dependent span subspace pushin dropout indicator drop lift onorm matrix invertible normal_matrix symmetric_matrix columns rows column row transp mat vector_matrix_mul matrix_vector_mul matrix_mul matrix_sub matrix_add matrix_neg %% adjoint bilinear linear orthogonal basis vsum distance vector_norm dot vec % vector_neg vector_sub vector_add matroid_dim matroid_finite_dim matroid_dimension matroid_finite_dimensional submatroid matroid_subspace matroid_dependent matroid_basis matroid_independent matroid_spanning matroid_span matroid_set dest_matroid matroid brouwer_degree2 reduced_homology_group hom_relboundary hom_induced hom_boundary homology_group relative_homology_group relcycle_group chain_group singular_subdivision simplicial_subdivision simplicial_vertex simplicial_cone simplex_cone simplicial_chain simplicial_simplex oriented_simplex chain_map simplex_map homologous_rel singular_relboundary singular_relcycle mod_subset chain_boundary singular_chain singular_face singular_simplex simplicial_face standard_simplex short_exact_sequence group_exactness solvable_group free_abelian_group pgroup integer_mod_group integer_group finitely_generated_group cyclic_group group_element_order trivial_homomorphism group_image group_kernel quotient_group group_normalizer group_centralizer group_conjugate normal_subgroup_of left_coset right_coset group_orbit group_stabilizer group_action group_setmul group_setinv isomorphic_group group_automorphism group_isomorphism group_isomorphisms group_endomorphism group_epimorphism group_monomorphism group_homomorphism sum_group product_group prod_group subgroup_generated subgroup_of group_conjugation group_sum group_product group_nmul group_add group_neg abelian_group group_zpow group_pow group_div opposite_group trivial_group singleton_group group_mul group_inv group_id group_carrier group_operations group index frag_extend frag_sub frag_add frag_cmul frag_neg frag_of frag_0 frag_support dest_frag mk_frag cantor_set cantor_map cantor_term cantor_space dimension_le sigma_locally_finite_in paracompact_space cfunspace funspace nsphere euclidean_space capped_metric fccoverable_in ulc_space fccoverable_space mdiameter cauchy_continuous_map uniformly_continuous_map lipschitz_continuous_map prod_metric completely_metrizable_space contractible_space homotopy_equivalent_space homotopic_with alexandroff_compactification kification k_space quasi_components_of quasi_component_of locally_connected_space locally_connected_at weakly_locally_connected_at locally_path_connected_space locally_path_connected_at weakly_locally_path_connected_at completely_regular_space normal_space path_components_of path_component_of path_connected_in path_connected_space path_in real_summable real_infsum real_sums reallim ---> topcontinuous_at totally_bounded_in mcomplete cauchy_in limit atpointof real_compact real_bounded real_euclidean_metric euclideanreal real_closed real_open locally_compact_space regular_space kolmogorov_quotient t0_space neighbourhood_base_of neighbourhood_base_at monotone_map connected_components_of connected_component_of separated_between connected_in connected_space metrizable_space discrete_metric mbounded msphere mcball mtopology submetric mball mdist mspace dest_metric metric is_metric_space borel_measurable_map borel_in gdelta_in fsigma_in sequentially trivial_limit eventually within netlimit netlimits netfilter dest_net mk_net separable_space first_countable second_countable lindelof_space perfect_map proper_map kc_space hausdorff_space t1_space separated_in compact_space compact_in retract_of_space retraction_map section_map retraction_maps embedding_map homeomorphic_space homeomorphic_maps homeomorphic_map sum_topology product_topology prod_topology quotient_map closed_map open_map continuous_map locally_finite_in frontier_of interior_of closure_of derived_set_of hereditarily subtopology discrete_space discrete_topology closed_in topspace open_in topology istopology ITER suslin suslin_operation relative_to from hull matrify vectorize closed_real_interval open_real_interval is_realinterval frac floor rational ^_c *_c +_c ordinal linseg inseg properly strictly antichain chain wqoset woset toset poset qoset fld superadmissible tailadmissible admissible CASEWISE PCROSS vector mktybit1 _100531 _dest_tybit1 _mk_tybit1 mktybit0 _100512 _dest_tybit0 _mk_tybit0 dest_finite_prod mk_finite_prod dest_finite_diff mk_finite_diff sndcart fstcart pastecart dest_finite_sum mk_finite_sum lambda $ dest_cart mk_cart dest_finite_image finite_index dimindex polynomial_function sum nsum isum product iproduct nproduct iterato iterate support monoidal neutral .. has_sup has_inf inf sup COUNTABLE >_c >=_c =_c <_c <=_c ARBITRARY INTERSECTION_OF UNION_OF pairwise list_of_set set_of_list disjoint_union product_map cartesian_product RESTRICTION EXTENSIONAL ARB CROSS HAS_SIZE CARD ITSET FINREC REST CHOICE BIJ SURJ INJ IMAGE INFINITE FINITE SING DISJOINT PSUBSET SUBSET DELETE DIFF INTERS INTER UNIONS UNION UNIV INSERT EMPTY SETSPEC GSPEC IN real_zpow prime num_lcm num_gcd num_coprime num_mod num_divides num_of_int int_lcm int_gcd int_coprime int_mod int_divides real_mod == rem div int_pow int_min int_max int_sgn int_abs int_mul int_sub int_add int_neg int_of_num int_gt int_ge int_lt int_le real_of_int int_of_real integer DECIMAL sqrt real_sgn real_min real_max real_div real_pow real_abs real_gt real_ge real_lt real_sub real_inv real_le real_mul real_add real_neg real_of_num dest_real mk_real treal_eq treal_inv treal_le treal_mul treal_add treal_neg treal_of_num hreal_inv hreal_le hreal_mul hreal_add hreal_of_num dest_hreal mk_hreal nadd_inv nadd_rinv nadd_mul nadd_add nadd_le nadd_of_num nadd_eq dest_nadd mk_nadd is_nadd dist ASCII _22943 _dest_char _mk_char list_of_seq PAIRWISE ALLPAIRS ZIP ITLIST2 ASSOC FILTER EL MAP2 ALL2 MEM ITLIST EX ALL NULL REPLICATE BUTLAST LAST MAP LENGTH REVERSE APPEND TL HD ISO CONS NIL _dest_list _mk_list SOME NONE _dest_option _mk_option OUTR OUTL INR INL _dest_sum _mk_sum FNIL FCONS CONSTR BOTTOM _dest_rec _mk_rec ZRECSPACE ZBOT ZCONSTR INJP INJF INJA INJN NUMRIGHT NUMLEFT NUMSUM NUMSND NUMFST NUMPAIR MEASURE WF minimal MOD DIV FACT - ODD EVEN MIN MAX > >= < <= EXP * + PRE BIT1 BIT0 NUMERAL SUC _0 dest_num mk_num NUM_REP IND_0 IND_SUC ONTO ONE_ONE PASSOC UNCURRY CURRY SND FST , REP_prod ABS_prod mk_pair _FUNCTION _MATCH _GUARDED_PATTERN _UNGUARDED_PATTERN _SEQPATTERN GEQ GABS LET_END LET hashek one one_REP one_ABS I o COND @ _FALSITY_ ?! ~ F \/ ? forall ==> /\ T =
      #|definitions = 1061
      #|Warning: inventing type variables
      #|counter_tyvar = zz_counter:'?1
      #|counter_genvar = _3717804:bool
      #|
    ),
  )
}
