// Translated from upstream Examples/doomsday.ml; edit this file directly.

///|
/// leap_year
fn step_1() -> Unit raise {
  leap_year_c.set(@pair.new_definition(@term_syntax.parse_term("(leap_year : (Num) -> Bool)((y : Num)) == (divides(4, y) && !divides(100, y) || divides(400, y))")))
}

///|
let leap_year_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("leap_year")

///|
/// `leap_year`
pub fn leap_year() -> @kernel.Thm {
  leap_year_c.get()
}

///|
/// LEAP_YEAR_MOD
fn step_2() -> Unit raise {
  let t1 = @tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([leap_year(), @int.divides_mod()])))
  leap_year_mod_c.set(@tactics.prove(@term_syntax.parse_term("∀ y : Num, leap_year(y) == (MOD(y, 4) == 0 && !(MOD(y, 100) == 0) || MOD(y, 400) == 0)"), t1))
}

///|
let leap_year_mod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEAP_YEAR_MOD")

///|
/// `LEAP_YEAR_MOD`
pub fn leap_year_mod() -> @kernel.Thm {
  leap_year_mod_c.get()
}

///|
/// days_in_month
fn step_3() -> Unit raise {
  days_in_month_c.set(@pair.new_definition(@term_syntax.parse_term("(days_in_month : (Num, Num) -> Num)((y : Num), (m : Num)) == (if m == 1 { 31 } else { if m == 2 { if leap_year(y) { 29 } else { 28 } } else { if m == 3 { 31 } else { if m == 4 { 30 } else { if m == 5 { 31 } else { if m == 6 { 30 } else { if m == 7 { 31 } else { if m == 8 { 31 } else { if m == 9 { 30 } else { if m == 10 { 31 } else { if m == 11 { 30 } else { if m == 12 { 31 } else { 0 } } } } } } } } } } } })")))
}

///|
let days_in_month_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("days_in_month")

///|
/// `days_in_month`
pub fn days_in_month() -> @kernel.Thm {
  days_in_month_c.get()
}

///|
/// days_in_year
fn step_4() -> Unit raise {
  days_in_year_c.set(@pair.new_definition(@term_syntax.parse_term("(days_in_year : (Num) -> Num)((y : Num)) == (if leap_year(y) { 366 } else { 365 })")))
}

///|
let days_in_year_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("days_in_year")

///|
/// `days_in_year`
pub fn days_in_year() -> @kernel.Thm {
  days_in_year_c.get()
}

///|
/// valid_date
fn step_5() -> Unit raise {
  valid_date_c.set(@pair.new_definition(@term_syntax.parse_term("(valid_date : ((Num, Num, Num)) -> Bool)(((y : Num), (m : Num), (d : Num))) == (1 <= m && m <= 12 && 1 <= d && d <= days_in_month(y, m))")))
}

///|
let valid_date_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("valid_date")

///|
/// `valid_date`
pub fn valid_date() -> @kernel.Thm {
  valid_date_c.get()
}

///|
/// LEAP_YEAR_2000
fn step_6() -> Unit raise {
  let t2 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t3 = @tactics.then_tac(@simp.rewrite_tac(@list.List([leap_year_mod()])), t2)
  leap_year_2000_c.set(@tactics.prove(@term_syntax.parse_term("leap_year(2000)"), t3))
}

///|
let leap_year_2000_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEAP_YEAR_2000")

///|
/// `LEAP_YEAR_2000`
pub fn leap_year_2000() -> @kernel.Thm {
  leap_year_2000_c.get()
}

///|
/// NOT_LEAP_YEAR_1900
fn step_7() -> Unit raise {
  let t4 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t5 = @tactics.then_tac(@simp.rewrite_tac(@list.List([leap_year_mod()])), t4)
  not_leap_year_1900_c.set(@tactics.prove(@term_syntax.parse_term("!leap_year(1900)"), t5))
}

///|
let not_leap_year_1900_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOT_LEAP_YEAR_1900")

///|
/// `NOT_LEAP_YEAR_1900`
pub fn not_leap_year_1900() -> @kernel.Thm {
  not_leap_year_1900_c.get()
}

///|
/// LEAP_YEAR_2024
fn step_8() -> Unit raise {
  let t6 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t7 = @tactics.then_tac(@simp.rewrite_tac(@list.List([leap_year_mod()])), t6)
  leap_year_2024_c.set(@tactics.prove(@term_syntax.parse_term("leap_year(2024)"), t7))
}

///|
let leap_year_2024_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEAP_YEAR_2024")

///|
/// `LEAP_YEAR_2024`
pub fn leap_year_2024() -> @kernel.Thm {
  leap_year_2024_c.get()
}

///|
/// NOT_LEAP_YEAR_2023
fn step_9() -> Unit raise {
  let t8 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t9 = @tactics.then_tac(@simp.rewrite_tac(@list.List([leap_year_mod()])), t8)
  not_leap_year_2023_c.set(@tactics.prove(@term_syntax.parse_term("!leap_year(2023)"), t9))
}

///|
let not_leap_year_2023_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOT_LEAP_YEAR_2023")

///|
/// `NOT_LEAP_YEAR_2023`
pub fn not_leap_year_2023() -> @kernel.Thm {
  not_leap_year_2023_c.get()
}

///|
/// NOT_LEAP_YEAR_2100
fn step_10() -> Unit raise {
  let t10 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t11 = @tactics.then_tac(@simp.rewrite_tac(@list.List([leap_year_mod()])), t10)
  not_leap_year_2100_c.set(@tactics.prove(@term_syntax.parse_term("!leap_year(2100)"), t11))
}

///|
let not_leap_year_2100_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOT_LEAP_YEAR_2100")

///|
/// `NOT_LEAP_YEAR_2100`
pub fn not_leap_year_2100() -> @kernel.Thm {
  not_leap_year_2100_c.get()
}

///|
/// LEAP_YEAR_2400
fn step_11() -> Unit raise {
  let t12 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t13 = @tactics.then_tac(@simp.rewrite_tac(@list.List([leap_year_mod()])), t12)
  leap_year_2400_c.set(@tactics.prove(@term_syntax.parse_term("leap_year(2400)"), t13))
}

///|
let leap_year_2400_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEAP_YEAR_2400")

///|
/// `LEAP_YEAR_2400`
pub fn leap_year_2400() -> @kernel.Thm {
  leap_year_2400_c.get()
}

///|
/// MONTH_CASES_TAC
fn step_12() -> Unit raise {
  let t14 = @tactics.conv_tac(@calc_num.expand_cases_conv)
  month_cases_tac_c.set(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@theorems.imp_conj_alt(), @int.arith_rule(@term_syntax.parse_term("((n : Num) <= 12) == (n < 13)"))]))), t14))
}

///|
let month_cases_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("MONTH_CASES_TAC")

///|
/// `MONTH_CASES_TAC`
pub fn month_cases_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (month_cases_tac_c.get())(x)
}

///|
/// DAYS_IN_MONTH_POS
fn step_13() -> Unit raise {
  let t15 = @tactics.then_tac(@tactics.then_tac(month_cases_tac, @simp.rewrite_tac(@list.List([days_in_month()]))), @int.arith_tac)
  days_in_month_pos_c.set(@tactics.prove(@term_syntax.parse_term("∀ y : Num, ∀ m : Num, 1 <= m && m <= 12 → 1 <= days_in_month(y, m)"), t15))
}

///|
let days_in_month_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DAYS_IN_MONTH_POS")

///|
/// `DAYS_IN_MONTH_POS`
pub fn days_in_month_pos() -> @kernel.Thm {
  days_in_month_pos_c.get()
}

///|
/// DAYS_IN_MONTH_UPPER
fn step_14() -> Unit raise {
  let t17 = @tactics.repeat_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_rewrite_tac(@list.List([]))))
  let t16 = @simp.rewrite_tac(@list.List([days_in_month()]))
  let t18 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t16), t17), @int.arith_tac)
  days_in_month_upper_c.set(@tactics.prove(@term_syntax.parse_term("∀ y : Num, ∀ m : Num, days_in_month(y, m) <= 31"), t18))
}

///|
let days_in_month_upper_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DAYS_IN_MONTH_UPPER")

///|
/// `DAYS_IN_MONTH_UPPER`
pub fn days_in_month_upper() -> @kernel.Thm {
  days_in_month_upper_c.get()
}

///|
/// cumdays_before
fn step_15() -> Unit raise {
  cumdays_before_c.set(@pair.new_definition(@term_syntax.parse_term("(cumdays_before : (Num, Num) -> Num)((y : Num), (m : Num)) == (if m <= 1 { 0 } else { if m == 2 { 31 } else { if m == 3 { if leap_year(y) { 60 } else { 59 } } else { if m == 4 { if leap_year(y) { 91 } else { 90 } } else { if m == 5 { if leap_year(y) { 121 } else { 120 } } else { if m == 6 { if leap_year(y) { 152 } else { 151 } } else { if m == 7 { if leap_year(y) { 182 } else { 181 } } else { if m == 8 { if leap_year(y) { 213 } else { 212 } } else { if m == 9 { if leap_year(y) { 244 } else { 243 } } else { if m == 10 { if leap_year(y) { 274 } else { 273 } } else { if m == 11 { if leap_year(y) { 305 } else { 304 } } else { if m == 12 { if leap_year(y) { 335 } else { 334 } } else { if leap_year(y) { 366 } else { 365 } } } } } } } } } } } } })")))
}

///|
let cumdays_before_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cumdays_before")

///|
/// `cumdays_before`
pub fn cumdays_before() -> @kernel.Thm {
  cumdays_before_c.get()
}

///|
/// day_of_year
fn step_16() -> Unit raise {
  day_of_year_c.set(@pair.new_definition(@term_syntax.parse_term("(day_of_year : (Num, Num, Num) -> Num)((y : Num), (m : Num), (d : Num)) == cumdays_before(y, m) + d")))
}

///|
let day_of_year_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("day_of_year")

///|
/// `day_of_year`
pub fn day_of_year() -> @kernel.Thm {
  day_of_year_c.get()
}

///|
/// CUMDAYS_BEFORE_STEP
fn step_17() -> Unit raise {
  let t19 = @tactics.then_tac(@tactics.then_tac(month_cases_tac, @simp.rewrite_tac(@list.List([cumdays_before(), days_in_month()]))), @int.arith_tac)
  cumdays_before_step_c.set(@tactics.prove(@term_syntax.parse_term("∀ y : Num, ∀ m : Num, 1 <= m && m <= 12 → cumdays_before(y, m + 1) == cumdays_before(y, m) + days_in_month(y, m)"), t19))
}

///|
let cumdays_before_step_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CUMDAYS_BEFORE_STEP")

///|
/// `CUMDAYS_BEFORE_STEP`
pub fn cumdays_before_step() -> @kernel.Thm {
  cumdays_before_step_c.get()
}

///|
/// DAYS_IN_YEAR_SUM
fn step_18() -> Unit raise {
  let t20 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t21 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([days_in_year(), cumdays_before()]))), t20), @class.cond_cases_tac), @int.arith_tac)
  days_in_year_sum_c.set(@tactics.prove(@term_syntax.parse_term("∀ y : Num, days_in_year(y) == cumdays_before(y, 13)"), t21))
}

///|
let days_in_year_sum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DAYS_IN_YEAR_SUM")

///|
/// `DAYS_IN_YEAR_SUM`
pub fn days_in_year_sum() -> @kernel.Thm {
  days_in_year_sum_c.get()
}

///|
/// cumulative_days
fn step_19() -> Unit raise {
  cumulative_days_c.set(@define.define_(@term_syntax.parse_term("(cumulative_days : (Num) -> Num)(0) == 0 && cumulative_days(SUC((y : Num))) == cumulative_days(y) + days_in_year(y)")))
}

///|
let cumulative_days_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cumulative_days")

///|
/// `cumulative_days`
pub fn cumulative_days() -> @kernel.Thm {
  cumulative_days_c.get()
}

///|
/// day_number
fn step_20() -> Unit raise {
  day_number_c.set(@pair.new_definition(@term_syntax.parse_term("(day_number : (Num, Num, Num) -> Num)((y : Num), (m : Num), (d : Num)) == cumulative_days(y) + day_of_year(y, m, d)")))
}

///|
let day_number_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("day_number")

///|
/// `day_number`
pub fn day_number() -> @kernel.Thm {
  day_number_c.get()
}

///|
/// day_of_week
fn step_21() -> Unit raise {
  day_of_week_c.set(@pair.new_definition(@term_syntax.parse_term("(day_of_week : (Num, Num, Num) -> Num)((y : Num), (m : Num), (d : Num)) == MOD(day_number(y, m, d) + 5, 7)")))
}

///|
let day_of_week_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("day_of_week")

///|
/// `day_of_week`
pub fn day_of_week() -> @kernel.Thm {
  day_of_week_c.get()
}

///|
/// doomsday_date
fn step_22() -> Unit raise {
  doomsday_date_c.set(@pair.new_definition(@term_syntax.parse_term("(doomsday_date : (Num, Num) -> Num)((y : Num), (m : Num)) == (if m == 1 { if leap_year(y) { 4 } else { 3 } } else { if m == 2 { if leap_year(y) { 29 } else { 28 } } else { if m == 3 { 7 } else { if m == 4 { 4 } else { if m == 5 { 9 } else { if m == 6 { 6 } else { if m == 7 { 11 } else { if m == 8 { 8 } else { if m == 9 { 5 } else { if m == 10 { 10 } else { if m == 11 { 7 } else { 12 } } } } } } } } } } })")))
}

///|
let doomsday_date_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("doomsday_date")

///|
/// `doomsday_date`
pub fn doomsday_date() -> @kernel.Thm {
  doomsday_date_c.get()
}

///|
/// century_anchor
fn step_23() -> Unit raise {
  century_anchor_c.set(@pair.new_definition(@term_syntax.parse_term("(century_anchor : (Num) -> Num)((c : Num)) == MOD(5 * MOD(c, 4) + 2, 7)")))
}

///|
let century_anchor_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("century_anchor")

///|
/// `century_anchor`
pub fn century_anchor() -> @kernel.Thm {
  century_anchor_c.get()
}

///|
/// doomsday
fn step_24() -> Unit raise {
  doomsday_c.set(@pair.new_definition(@term_syntax.parse_term("(doomsday : (Num) -> Num)((y : Num)) == MOD(century_anchor(DIV(y, 100)) + (MOD(y, 100) + DIV(MOD(y, 100), 4)), 7)")))
}

///|
let doomsday_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("doomsday")

///|
/// `doomsday`
pub fn doomsday() -> @kernel.Thm {
  doomsday_c.get()
}

///|
/// VALID_DOOMSDAY
fn step_25() -> Unit raise {
  let t22 = @tactics.then_tac(@tactics.then_tac(month_cases_tac, @simp.rewrite_tac(@list.List([valid_date(), doomsday_date(), days_in_month()]))), @int.arith_tac)
  valid_doomsday_c.set(@tactics.prove(@term_syntax.parse_term("∀ y : Num, ∀ m : Num, 1 <= m && m <= 12 → valid_date((y, m, doomsday_date(y, m)))"), t22))
}

///|
let valid_doomsday_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VALID_DOOMSDAY")

///|
/// `VALID_DOOMSDAY`
pub fn valid_doomsday() -> @kernel.Thm {
  valid_doomsday_c.get()
}

///|
/// MOD_ADD_EQ_COMPAT
fn step_26() -> Unit raise {
  let t24 = @simp.asm_rewrite_tac(@list.List([]))
  let t23 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@arith.mod_add_mod())]))
  let t25 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t23), t24)
  mod_add_eq_compat_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ c : Num, ∀ n : Num, MOD(a, n) == MOD(b, n) → MOD(c + a, n) == MOD(c + b, n)"), t25))
}

///|
let mod_add_eq_compat_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MOD_ADD_EQ_COMPAT")

///|
/// `MOD_ADD_EQ_COMPAT`
pub fn mod_add_eq_compat() -> @kernel.Thm {
  mod_add_eq_compat_c.get()
}

///|
/// year_doomsday
fn step_27() -> Unit raise {
  year_doomsday_c.set(@pair.new_definition(@term_syntax.parse_term("(year_doomsday : (Num) -> Num)((y : Num)) == MOD(cumulative_days(y) + (if leap_year(y) { 2 } else { 1 }), 7)")))
}

///|
let year_doomsday_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("year_doomsday")

///|
/// `year_doomsday`
pub fn year_doomsday() -> @kernel.Thm {
  year_doomsday_c.get()
}

///|
/// YEAR_DOOMSDAY_EQ_DOW
fn step_28() -> Unit raise {
  let t32 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@arith.mod_add_mod())]))
  let t31 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t30 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.add_assoc())]))
  let t29 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t28 = @simp.asm_rewrite_tac(@list.List([]))
  let t27 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t26 = @simp.rewrite_tac(@list.List([cumdays_before(), doomsday_date()]))
  let t33 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(month_cases_tac, @simp.rewrite_tac(@list.List([day_of_week(), day_number(), year_doomsday(), day_of_year()]))), t26), t27), @class.cond_cases_tac), t28), t29), t30), t31), t32), @int.arith_tac)
  year_doomsday_eq_dow_c.set(@tactics.prove(@term_syntax.parse_term("∀ y : Num, ∀ m : Num, 1 <= m && m <= 12 → day_of_week(y, m, doomsday_date(y, m)) == year_doomsday(y)"), t33))
}

///|
let year_doomsday_eq_dow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("YEAR_DOOMSDAY_EQ_DOW")

///|
/// `YEAR_DOOMSDAY_EQ_DOW`
pub fn year_doomsday_eq_dow() -> @kernel.Thm {
  year_doomsday_eq_dow_c.get()
}

///|
/// DOOMSDAY_SAME_WEEKDAY
fn step_29() -> Unit raise {
  let t34 = @meson.meson_tac(@list.List([year_doomsday_eq_dow()]))
  doomsday_same_weekday_c.set(@tactics.prove(@term_syntax.parse_term("∀ y : Num, ∀ m1 : Num, ∀ m2 : Num, 1 <= m1 && m1 <= 12 && 1 <= m2 && m2 <= 12 → day_of_week(y, m1, doomsday_date(y, m1)) == day_of_week(y, m2, doomsday_date(y, m2))"), t34))
}

///|
let doomsday_same_weekday_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DOOMSDAY_SAME_WEEKDAY")

///|
/// `DOOMSDAY_SAME_WEEKDAY`
pub fn doomsday_same_weekday() -> @kernel.Thm {
  doomsday_same_weekday_c.get()
}

///|
/// CUMULATIVE_DAYS_SUC
fn step_30() -> Unit raise {
  let t35 = @simp.rewrite_tac(@list.List([cumulative_days()]))
  cumulative_days_suc_c.set(@tactics.prove(@term_syntax.parse_term("∀ y : Num, cumulative_days(SUC(y)) == cumulative_days(y) + days_in_year(y)"), t35))
}

///|
let cumulative_days_suc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CUMULATIVE_DAYS_SUC")

///|
/// `CUMULATIVE_DAYS_SUC`
pub fn cumulative_days_suc() -> @kernel.Thm {
  cumulative_days_suc_c.get()
}

///|
/// LEAP_YEAR_IN_CENTURY
fn step_31() -> Unit raise {
  let t42 = @simp.rewrite_tac(@list.List([@int.divides_mod()]))
  let t41 = @tactics.match_mp_tac(@int.number_rule(@term_syntax.parse_term("divides((f : Num), (fh : Num)) && divides(f, (h : Num)) → divides(fh, h * (c : Num) + (t : Num)) → divides(f, t)")))
  let t40 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.divides_mod())]))
  let t39 = @simp.rewrite_tac(@list.List([@arith.mult_assoc(), @calc_num.arith(), @class.taut(@term_syntax.parse_term("(((p : Bool) || (q : Bool)) == p) == (q → p)"))]))
  let t38 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("100 * (c : Num) == 4 * (25 * c)")), @arith.mod_mult_add()]))
  let t37 = @simp.asm_simp_tac(@list.List([@arith.mod_mult_add(), @arith.le_1(), @arith.mod_lt()]))
  let t36 = @simp.rewrite_tac(@list.List([leap_year_mod()]))
  let t43 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t36), t37), t38), t39), t40), t41), t42), @int.arith_tac)
  leap_year_in_century_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Num, ∀ t : Num, 0 < t && t < 100 → leap_year(100 * c + t) == (MOD(t, 4) == 0)"), t43))
}

///|
let leap_year_in_century_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEAP_YEAR_IN_CENTURY")

///|
/// `LEAP_YEAR_IN_CENTURY`
pub fn leap_year_in_century() -> @kernel.Thm {
  leap_year_in_century_c.get()
}

///|
/// YEAR_DOOMSDAY_STEP
fn step_32() -> Unit raise {
  let t48 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t47 = @tactics.repeat_tac(@tactics.match_mp_tac(mod_add_eq_compat()))
  let t46 = @simp.once_rewrite_tac(@list.List([@arith.add_sym()]))
  let t45 = @simp.rewrite_tac(@list.List([]))
  let t44 = @tactics.conv_tac(@arith.mod_down_conv)
  let t49 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([year_doomsday(), cumulative_days_suc(), days_in_year()]))), t44), @class.cond_cases_tac), t45), t46), t47), t48)
  year_doomsday_step_c.set(@tactics.prove(@term_syntax.parse_term("∀ y : Num, year_doomsday(SUC(y)) == MOD(year_doomsday(y) + (if leap_year(SUC(y)) { 2 } else { 1 }), 7)"), t49))
}

///|
let year_doomsday_step_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("YEAR_DOOMSDAY_STEP")

///|
/// `YEAR_DOOMSDAY_STEP`
pub fn year_doomsday_step() -> @kernel.Thm {
  year_doomsday_step_c.get()
}

///|
/// DOOMSDAY_STEP
fn step_33() -> Unit raise {
  let t53 = @tactics.conv_tac(@arith.mod_down_conv)
  let t52 = @simp.asm_simp_tac(@list.List([@arith.div_mult_add(), @arith.mod_mult_add(), @int.arith_rule(@term_syntax.parse_term("!(100 == 0)")), @arith.div_lt(), @arith.mod_lt(), @arith.add_clauses()]))
  let t51 = @tactics.subgoal_then(@term_syntax.parse_term("SUC((t : Num)) < 100 && t < 100"), @tactics.strip_assume_tac)
  let t50 = @simp.rewrite_tac(@list.List([doomsday(), century_anchor()]))
  let t54 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t50), t51), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t52), t53), @tactics.ap_thm_tac), @tactics.ap_term_tac), @int.arith_tac)
  doomsday_step_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Num, ∀ t : Num, t < 99 → doomsday(100 * c + SUC(t)) == MOD(doomsday(100 * c + t) + (if MOD(SUC(t), 4) == 0 { 2 } else { 1 }), 7)"), t54))
}

///|
let doomsday_step_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DOOMSDAY_STEP")

///|
/// `DOOMSDAY_STEP`
pub fn doomsday_step() -> @kernel.Thm {
  doomsday_step_c.get()
}

///|
/// WITHIN_CENTURY
fn step_34() -> Unit raise {
  let t76 = @list.List([@int.asm_arith_tac, @tactics.then_tac(@tactics.disch_tac, @simp.asm_rewrite_tac(@list.List([])))])
  let t74 = @term_syntax.parse_term("SUC((t : Num))")
  let t75 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(c : Num)"), t74]), leap_year_in_century()))
  let t73 = @simp.asm_simp_tac(@list.List([doomsday_step()]))
  let t72 = @tactics.subgoal_then(@term_syntax.parse_term("(t : Num) < 99"), fn(x69 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s70 = @tactics.assume_tac(x69)
    fn(x71 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s70(x71)
    }
  })
  let t68 = @tactics.subgoal_then(@term_syntax.parse_term("SUC(100 * (c : Num) + (t : Num)) == 100 * c + SUC(t)"), fn(x65 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s66 = @tactics.subst1_tac(x65)
    fn(x67 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s66(x67)
    }
  })
  let t64 = @simp.asm_rewrite_tac(@list.List([year_doomsday_step()]))
  let t63 = @tactics.subgoal_then(@term_syntax.parse_term("100 * (c : Num) + SUC((t : Num)) == SUC(100 * c + t)"), fn(x60 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s61 = @tactics.subst1_tac(x60)
    fn(x62 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s61(x62)
    }
  })
  let t59 = @list.List([@tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), @int.asm_arith_tac), @tactics.all_tac])
  let t77 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.disch_tac, @tactics.subgoal_then(@term_syntax.parse_term("year_doomsday(100 * (c : Num) + (t : Num)) == doomsday(100 * c + t)"), fn(x56 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s57 = @tactics.assume_tac(x56)
    fn(x58 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s57(x58)
    }
  })), t59), t63), @list.List([@int.arith_tac, @tactics.all_tac])), t64), t68), @list.List([@int.arith_tac, @tactics.all_tac])), t72), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t73), @tactics.ap_thm_tac), @tactics.ap_term_tac), @tactics.ap_term_tac), t75), @tactics.ants_tac), t76)
  let t55 = @simp.asm_rewrite_tac(@list.List([]))
  let t78 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.add_clauses()])), t55), t77])
  let t79 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), @nums.induct_tac), t78)
  within_century_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Num, year_doomsday(100 * c) == doomsday(100 * c) → (∀ t : Num, t < 100 → year_doomsday(100 * c + t) == doomsday(100 * c + t))"), t79))
}

///|
let within_century_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WITHIN_CENTURY")

///|
/// `WITHIN_CENTURY`
pub fn within_century() -> @kernel.Thm {
  within_century_c.get()
}

///|
/// YEAR_DOOMSDAY_0
fn step_35() -> Unit raise {
  let t80 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t81 = @tactics.then_tac(@simp.rewrite_tac(@list.List([year_doomsday(), cumulative_days(), leap_year_mod()])), t80)
  year_doomsday_0_c.set(@tactics.prove(@term_syntax.parse_term("year_doomsday(0) == 2"), t81))
}

///|
let year_doomsday_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("YEAR_DOOMSDAY_0")

///|
/// `YEAR_DOOMSDAY_0`
pub fn year_doomsday_0() -> @kernel.Thm {
  year_doomsday_0_c.get()
}

///|
/// DOOMSDAY_0
fn step_36() -> Unit raise {
  let t82 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t83 = @tactics.then_tac(@simp.rewrite_tac(@list.List([doomsday(), century_anchor()])), t82)
  doomsday_0_c.set(@tactics.prove(@term_syntax.parse_term("doomsday(0) == 2"), t83))
}

///|
let doomsday_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DOOMSDAY_0")

///|
/// `DOOMSDAY_0`
pub fn doomsday_0() -> @kernel.Thm {
  doomsday_0_c.get()
}

///|
/// `compute_year_doomsday`
pub fn compute_year_doomsday(x84 : Int64) -> @kernel.Thm raise {
  let n = x84
  fn go(x85 : Int64, x86 : @kernel.Thm) -> @kernel.Thm raise {
    let k = x85
    let th = x86
    if (k >= n) {
      th
    } else {
      let k_tm = @nums.mk_small_numeral(k)
      let step_th = @bool.spec(k_tm, year_doomsday_step())
      let t87 = @simp.rewrite_conv(@list.List([th, leap_year_mod()]))
      let t88 = @equal.rand_conv(@equal.thenc(@equal.thenc(@equal.once_depth_conv(@calc_num.num_suc_conv), t87), @calc_num.num_reduce_conv))
      let step_th_p = @equal.conv_rule(@equal.thenc(@equal.land_conv(@equal.rand_conv(@calc_num.num_suc_conv)), t88), step_th)
      go(@lib.add63(k, 1L), step_th_p)
    }
  }
  go(0L, year_doomsday_0())
}

///|
/// YEAR_DOOMSDAY_100
fn step_37() -> Unit raise {
  year_doomsday_100_c.set(compute_year_doomsday(100L))
}

///|
let year_doomsday_100_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("YEAR_DOOMSDAY_100")

///|
/// `YEAR_DOOMSDAY_100`
pub fn year_doomsday_100() -> @kernel.Thm {
  year_doomsday_100_c.get()
}

///|
/// YEAR_DOOMSDAY_200
fn step_38() -> Unit raise {
  year_doomsday_200_c.set(compute_year_doomsday(200L))
}

///|
let year_doomsday_200_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("YEAR_DOOMSDAY_200")

///|
/// `YEAR_DOOMSDAY_200`
pub fn year_doomsday_200() -> @kernel.Thm {
  year_doomsday_200_c.get()
}

///|
/// YEAR_DOOMSDAY_300
fn step_39() -> Unit raise {
  year_doomsday_300_c.set(compute_year_doomsday(300L))
}

///|
let year_doomsday_300_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("YEAR_DOOMSDAY_300")

///|
/// `YEAR_DOOMSDAY_300`
pub fn year_doomsday_300() -> @kernel.Thm {
  year_doomsday_300_c.get()
}

///|
/// YEAR_DOOMSDAY_400
fn step_40() -> Unit raise {
  year_doomsday_400_c.set(compute_year_doomsday(400L))
}

///|
let year_doomsday_400_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("YEAR_DOOMSDAY_400")

///|
/// `YEAR_DOOMSDAY_400`
pub fn year_doomsday_400() -> @kernel.Thm {
  year_doomsday_400_c.get()
}

///|
/// DOOMSDAY_100
fn step_41() -> Unit raise {
  let t89 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t90 = @tactics.then_tac(@simp.rewrite_tac(@list.List([doomsday(), century_anchor()])), t89)
  doomsday_100_c.set(@tactics.prove(@term_syntax.parse_term("doomsday(100) == 0"), t90))
}

///|
let doomsday_100_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DOOMSDAY_100")

///|
/// `DOOMSDAY_100`
pub fn doomsday_100() -> @kernel.Thm {
  doomsday_100_c.get()
}

///|
/// DOOMSDAY_200
fn step_42() -> Unit raise {
  let t91 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t92 = @tactics.then_tac(@simp.rewrite_tac(@list.List([doomsday(), century_anchor()])), t91)
  doomsday_200_c.set(@tactics.prove(@term_syntax.parse_term("doomsday(200) == 5"), t92))
}

///|
let doomsday_200_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DOOMSDAY_200")

///|
/// `DOOMSDAY_200`
pub fn doomsday_200() -> @kernel.Thm {
  doomsday_200_c.get()
}

///|
/// DOOMSDAY_300
fn step_43() -> Unit raise {
  let t93 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t94 = @tactics.then_tac(@simp.rewrite_tac(@list.List([doomsday(), century_anchor()])), t93)
  doomsday_300_c.set(@tactics.prove(@term_syntax.parse_term("doomsday(300) == 3"), t94))
}

///|
let doomsday_300_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DOOMSDAY_300")

///|
/// `DOOMSDAY_300`
pub fn doomsday_300() -> @kernel.Thm {
  doomsday_300_c.get()
}

///|
/// LEAP_YEAR_400_PERIOD
fn step_44() -> Unit raise {
  let t96 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("4 * 100 == 400 * 1")), @arith.mod_mult_add()]))
  let t95 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(y : Num) + 400 == y + 4 * 100")), @arith.mod_mult_add()]))
  let t97 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([leap_year_mod()]))), t95), t96)
  leap_year_400_period_c.set(@tactics.prove(@term_syntax.parse_term("∀ y : Num, leap_year(y + 400) == leap_year(y)"), t97))
}

///|
let leap_year_400_period_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEAP_YEAR_400_PERIOD")

///|
/// `LEAP_YEAR_400_PERIOD`
pub fn leap_year_400_period() -> @kernel.Thm {
  leap_year_400_period_c.get()
}

///|
/// DOOMSDAY_400_PERIOD
fn step_45() -> Unit raise {
  let t100 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("4 + (y : Num) == 4 * 1 + y")), @arith.mod_mult_add()]))
  let t99 = @simp.simp_tac(@list.List([@arith.div_mult_add(), @int.arith_rule(@term_syntax.parse_term("!(100 == 0)"))]))
  let t98 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(y : Num) + 400 == 100 * 4 + y")), @arith.mod_mult_add()]))
  let t101 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([doomsday(), century_anchor()]))), t98), t99), t100)
  doomsday_400_period_c.set(@tactics.prove(@term_syntax.parse_term("∀ y : Num, doomsday(y + 400) == doomsday(y)"), t101))
}

///|
let doomsday_400_period_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DOOMSDAY_400_PERIOD")

///|
/// `DOOMSDAY_400_PERIOD`
pub fn doomsday_400_period() -> @kernel.Thm {
  doomsday_400_period_c.get()
}

///|
/// YEAR_DOOMSDAY_400_PERIOD
fn step_46() -> Unit raise {
  let t108 = @simp.asm_rewrite_tac(@list.List([]))
  let t107 = @simp.rewrite_tac(@list.List([leap_year_400_period()]))
  let t109 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("SUC((y : Num) + 400) == SUC(y) + 400"))])), t107), t108])
  let t106 = @tactics.subgoal_then(@term_syntax.parse_term("leap_year(SUC((y : Num) + 400)) == leap_year(SUC(y))"), fn(x103 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s104 = @tactics.subst1_tac(x103)
    fn(x105 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s104(x105)
    }
  })
  let t102 = @simp.rewrite_tac(@list.List([year_doomsday_step()]))
  let t110 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("SUC((y : Num)) + 400 == SUC(y + 400)"))])), t102), t106), t109)
  let t111 = @tactics.thenl(@nums.induct_tac, @list.List([@simp.rewrite_tac(@list.List([@arith.add_clauses(), year_doomsday_400(), year_doomsday_0()])), t110]))
  year_doomsday_400_period_c.set(@tactics.prove(@term_syntax.parse_term("∀ y : Num, year_doomsday(y + 400) == year_doomsday(y)"), t111))
}

///|
let year_doomsday_400_period_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("YEAR_DOOMSDAY_400_PERIOD")

///|
/// `YEAR_DOOMSDAY_400_PERIOD`
pub fn year_doomsday_400_period() -> @kernel.Thm {
  year_doomsday_400_period_c.get()
}

///|
/// CENTURY_BASE_ALL
fn step_47() -> Unit raise {
  let t134 = @simp.asm_rewrite_tac(@list.List([]))
  let t133 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t132 = @simp.rewrite_tac(@list.List([year_doomsday_400_period(), doomsday_400_period()]))
  let t131 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("400 * SUC((q : Num)) + (x : Num) == 400 * q + x + 400"))]))
  let t135 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t131), t132), t133), t134)
  let t130 = @simp.rewrite_tac(@list.List([year_doomsday_0(), year_doomsday_100(), year_doomsday_200(), year_doomsday_300(), doomsday_0(), doomsday_100(), doomsday_200(), doomsday_300()]))
  let t129 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t128 = @tactics.conv_tac(@calc_num.expand_cases_conv)
  let t136 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.mult_clauses(), @arith.add_clauses()])), t128), t129), t130), t135])
  let t126 = @term_syntax.parse_term("(q : Num)")
  let t127 = @tactics.spec_tac(@term_syntax.parse_term("(q : Num)"), t126)
  let t124 = @term_syntax.parse_term("(r : Num)")
  let t125 = @tactics.spec_tac(@term_syntax.parse_term("(r : Num)"), t124)
  let t123 = @tactics.subgoal_then(@term_syntax.parse_term("(r : Num) < 4"), fn(x120 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s121 = @tactics.mp_tac(x120)
    fn(x122 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s121(x122)
    }
  })
  let t119 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), @int.arith_tac), @tactics.all_tac])
  let t118 = @tactics.subgoal_then(@term_syntax.parse_term("100 * (c : Num) == 400 * (q : Num) + 100 * (r : Num)"), fn(x115 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s116 = @tactics.subst1_tac(x115)
    fn(x117 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s116(x117)
    }
  })
  let t114 = @simp.abbrev_tac(@term_syntax.parse_term("(r : Num) == MOD((c : Num), 4)"))
  let t113 = @simp.abbrev_tac(@term_syntax.parse_term("(q : Num) == DIV((c : Num), 4)"))
  let t112 = @term_syntax.parse_term("4")
  let t137 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(c : Num)"), t112]), @arith.division()))), @tactics.ants_tac), @list.List([@int.arith_tac, @tactics.all_tac])), t113), t114), @tactics.strip_tac), t118), t119), t123), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t125), t127), @nums.induct_tac), t136)
  century_base_all_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Num, year_doomsday(100 * c) == doomsday(100 * c)"), t137))
}

///|
let century_base_all_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CENTURY_BASE_ALL")

///|
/// `CENTURY_BASE_ALL`
pub fn century_base_all() -> @kernel.Thm {
  century_base_all_c.get()
}

///|
/// YEAR_DOOMSDAY_EQ_DOOMSDAY
fn step_48() -> Unit raise {
  let t156 = @simp.asm_rewrite_tac(@list.List([]))
  let t152 = @term_syntax.parse_term("(t : Num)")
  let t155 = @tactics.disch_then(fn(x154 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x149 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s150 = @tactics.mp_tac(x149)
      fn(x151 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s150(x151)
      }
    })(((x153 : @kernel.Thm) => @bool.spec(t152, x153))(x154))
  })
  let t148 = @tactics.disch_then(fn(x146 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x146
    @tactics.mp_tac(@bool.mp(th, @bool.spec(@term_syntax.parse_term("(c : Num)"), century_base_all())))
  })
  let t145 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(c : Num)"), within_century()))
  let t144 = @tactics.subgoal_then(@term_syntax.parse_term("(y : Num) == 100 * (c : Num) + (t : Num)"), fn(x141 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s142 = @tactics.subst1_tac(x141)
    fn(x143 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s142(x143)
    }
  })
  let t140 = @simp.abbrev_tac(@term_syntax.parse_term("(t : Num) == MOD((y : Num), 100)"))
  let t139 = @simp.abbrev_tac(@term_syntax.parse_term("(c : Num) == DIV((y : Num), 100)"))
  let t138 = @term_syntax.parse_term("100")
  let t157 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(y : Num)"), t138]), @arith.division()))), @tactics.ants_tac), @list.List([@int.arith_tac, @tactics.all_tac])), t139), t140), @tactics.strip_tac), t144), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t145), t148), t155), t156)
  year_doomsday_eq_doomsday_c.set(@tactics.prove(@term_syntax.parse_term("∀ y : Num, year_doomsday(y) == doomsday(y)"), t157))
}

///|
let year_doomsday_eq_doomsday_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("YEAR_DOOMSDAY_EQ_DOOMSDAY")

///|
/// `YEAR_DOOMSDAY_EQ_DOOMSDAY`
pub fn year_doomsday_eq_doomsday() -> @kernel.Thm {
  year_doomsday_eq_doomsday_c.get()
}

///|
/// DOOMSDAY_CORRECT
fn step_49() -> Unit raise {
  let t160 = @simp.asm_rewrite_tac(@list.List([year_doomsday_eq_doomsday()]))
  let t158 = @term_syntax.parse_term("(m : Num)")
  let t159 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(y : Num)"), t158]), year_doomsday_eq_dow()))
  let t161 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t159), t160)
  doomsday_correct_c.set(@tactics.prove(@term_syntax.parse_term("∀ y : Num, ∀ m : Num, 1 <= m && m <= 12 → day_of_week(y, m, doomsday_date(y, m)) == doomsday(y)"), t161))
}

///|
let doomsday_correct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DOOMSDAY_CORRECT")

///|
/// `DOOMSDAY_CORRECT`
pub fn doomsday_correct() -> @kernel.Thm {
  doomsday_correct_c.get()
}

///|
/// DOW_SHIFT
fn step_50() -> Unit raise {
  let t163 = @tactics.conv_tac(@arith.mod_down_conv)
  let t162 = @simp.rewrite_tac(@list.List([day_of_week(), day_number(), day_of_year()]))
  let t164 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t162), t163), @tactics.ap_thm_tac), @tactics.ap_term_tac), @int.arith_tac)
  dow_shift_c.set(@tactics.prove(@term_syntax.parse_term("∀ y : Num, ∀ m : Num, ∀ d1 : Num, ∀ d2 : Num, day_of_week(y, m, d1 + d2) == MOD(day_of_week(y, m, d1) + d2, 7)"), t164))
}

///|
let dow_shift_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DOW_SHIFT")

///|
/// `DOW_SHIFT`
pub fn dow_shift() -> @kernel.Thm {
  dow_shift_c.get()
}

///|
/// DOW_FROM_DOOMSDAY
fn step_51() -> Unit raise {
  let t171 = @tactics.conv_tac(@arith.mod_down_conv)
  let t170 = @simp.asm_simp_tac(@list.List([doomsday_correct()]))
  let t169 = @simp.rewrite_tac(@list.List([dow_shift()]))
  let t168 = @tactics.subgoal_then(@term_syntax.parse_term("(d : Num) == doomsday_date((y : Num), (m : Num)) + (d - doomsday_date(y, m))"), fn(x165 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s166 = @tactics.subst1_tac(x165)
    fn(x167 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s166(x167)
    }
  })
  let t172 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t168), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t169), t170), t171), @tactics.ap_thm_tac), @tactics.ap_term_tac), @int.asm_arith_tac)
  dow_from_doomsday_c.set(@tactics.prove(@term_syntax.parse_term("∀ y : Num, ∀ m : Num, ∀ d : Num, 1 <= m && m <= 12 && doomsday_date(y, m) <= d → day_of_week(y, m, d) == MOD(doomsday(y) + (d - doomsday_date(y, m)), 7)"), t172))
}

///|
let dow_from_doomsday_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DOW_FROM_DOOMSDAY")

///|
/// `DOW_FROM_DOOMSDAY`
pub fn dow_from_doomsday() -> @kernel.Thm {
  dow_from_doomsday_c.get()
}

///|
/// `compute_cumdays`
pub fn compute_cumdays(x173 : Int64) -> @kernel.Thm raise {
  let n = x173
  fn go(x174 : Int64, x175 : @kernel.Thm) -> @kernel.Thm raise {
    let k = x174
    let th = x175
    if (k >= n) {
      th
    } else {
      let k_tm = @nums.mk_small_numeral(k)
      let step_th = @bool.spec(k_tm, cumulative_days_suc())
      let t176 = @simp.rewrite_conv(@list.List([th, days_in_year(), leap_year_mod()]))
      let t177 = @equal.rand_conv(@equal.thenc(@equal.thenc(@equal.once_depth_conv(@calc_num.num_suc_conv), t176), @calc_num.num_reduce_conv))
      let step_th_p = @equal.conv_rule(@equal.thenc(@equal.land_conv(@equal.rand_conv(@calc_num.num_suc_conv)), t177), step_th)
      go(@lib.add63(k, 1L), step_th_p)
    }
  }
  go(0L, @bool.conjunct1(cumulative_days()))
}

///|
/// CUMDAYS_400
fn step_52() -> Unit raise {
  cumdays_400_c.set(compute_cumdays(400L))
}

///|
let cumdays_400_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CUMDAYS_400")

///|
/// `CUMDAYS_400`
pub fn cumdays_400() -> @kernel.Thm {
  cumdays_400_c.get()
}

///|
/// CUMULATIVE_DAYS_400_MOD7
fn step_53() -> Unit raise {
  let t188 = @simp.asm_rewrite_tac(@list.List([]))
  let t187 = @tactics.match_mp_tac(mod_add_eq_compat())
  let t186 = @simp.once_rewrite_tac(@list.List([@arith.add_sym()]))
  let t185 = @tactics.conv_tac(@arith.mod_down_conv)
  let t184 = @simp.rewrite_tac(@list.List([]))
  let t183 = @list.List([@simp.rewrite_tac(@list.List([leap_year_400_period()])), @tactics.all_tac])
  let t182 = @tactics.subgoal_then(@term_syntax.parse_term("leap_year((y : Num) + 400) == leap_year(y)"), fn(x180 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x180
    @simp.rewrite_tac(@list.List([th]))
  })
  let t179 = @simp.rewrite_tac(@list.List([cumulative_days_suc(), days_in_year()]))
  let t189 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("SUC((y : Num)) + 400 == SUC(y + 400)"))])), t179), t182), t183), @class.cond_cases_tac), t184), t185), t186), t187), t188)
  let t178 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t190 = @tactics.thenl(@nums.induct_tac, @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.add_clauses(), cumdays_400(), cumulative_days()])), t178), t189]))
  cumulative_days_400_mod7_c.set(@tactics.prove(@term_syntax.parse_term("∀ y : Num, MOD(cumulative_days(y + 400), 7) == MOD(cumulative_days(y), 7)"), t190))
}

///|
let cumulative_days_400_mod7_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CUMULATIVE_DAYS_400_MOD7")

///|
/// `CUMULATIVE_DAYS_400_MOD7`
pub fn cumulative_days_400_mod7() -> @kernel.Thm {
  cumulative_days_400_mod7_c.get()
}

///|
/// DAY_OF_WEEK_400_PERIOD
fn step_54() -> Unit raise {
  let t202 = @simp.rewrite_tac(@list.List([cumulative_days_400_mod7()]))
  let t201 = @tactics.match_mp_tac(mod_add_eq_compat())
  let t200 = @simp.once_rewrite_tac(@list.List([@arith.add_sym()]))
  let t199 = @tactics.match_mp_tac(mod_add_eq_compat())
  let t198 = @simp.once_rewrite_tac(@list.List([@arith.add_sym()]))
  let t197 = @tactics.conv_tac(@arith.mod_down_conv)
  let t196 = @list.List([@simp.rewrite_tac(@list.List([cumdays_before(), leap_year_400_period()])), @tactics.all_tac])
  let t195 = @tactics.subgoal_then(@term_syntax.parse_term("cumdays_before((y : Num) + 400, (m : Num)) == cumdays_before(y, m)"), fn(x192 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s193 = @tactics.subst1_tac(x192)
    fn(x194 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s193(x194)
    }
  })
  let t191 = @simp.rewrite_tac(@list.List([day_of_week(), day_number(), day_of_year()]))
  let t203 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t191), t195), t196), t197), t198), t199), t200), t201), t202)
  day_of_week_400_period_c.set(@tactics.prove(@term_syntax.parse_term("∀ y : Num, ∀ m : Num, ∀ d : Num, day_of_week(y + 400, m, d) == day_of_week(y, m, d)"), t203))
}

///|
let day_of_week_400_period_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DAY_OF_WEEK_400_PERIOD")

///|
/// `DAY_OF_WEEK_400_PERIOD`
pub fn day_of_week_400_period() -> @kernel.Thm {
  day_of_week_400_period_c.get()
}

///|
/// DOW_PERIOD
fn step_55() -> Unit raise {
  let t209 = @simp.rewrite_tac(@list.List([@arith.mod_mult_add()]))
  let t208 = @simp.once_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(c : Num) + ((b : Num) + ((d : Num) + 7 * (k : Num))) == 7 * k + (c + (b + d))"))]))
  let t207 = @tactics.match_mp_tac(mod_add_eq_compat())
  let t206 = @simp.once_rewrite_tac(@list.List([@arith.add_sym()]))
  let t205 = @tactics.conv_tac(@arith.mod_down_conv)
  let t204 = @simp.rewrite_tac(@list.List([day_of_week(), day_number(), day_of_year()]))
  let t210 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t204), t205), t206), t207), t208), t209)
  dow_period_c.set(@tactics.prove(@term_syntax.parse_term("∀ y : Num, ∀ m : Num, ∀ d : Num, ∀ k : Num, day_of_week(y, m, d + 7 * k) == day_of_week(y, m, d)"), t210))
}

///|
let dow_period_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DOW_PERIOD")

///|
/// `DOW_PERIOD`
pub fn dow_period() -> @kernel.Thm {
  dow_period_c.get()
}

///|
/// DOOMSDAY_DATE_BOUND
fn step_56() -> Unit raise {
  let t211 = @tactics.then_tac(@tactics.then_tac(month_cases_tac, @simp.rewrite_tac(@list.List([doomsday_date()]))), @int.arith_tac)
  doomsday_date_bound_c.set(@tactics.prove(@term_syntax.parse_term("∀ y : Num, ∀ m : Num, 1 <= m && m <= 12 → 1 <= doomsday_date(y, m) && doomsday_date(y, m) <= 29"), t211))
}

///|
let doomsday_date_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DOOMSDAY_DATE_BOUND")

///|
/// `DOOMSDAY_DATE_BOUND`
pub fn doomsday_date_bound() -> @kernel.Thm {
  doomsday_date_bound_c.get()
}

///|
/// doomsday_algorithm
fn step_57() -> Unit raise {
  doomsday_algorithm_c.set(@pair.new_definition(@term_syntax.parse_term("(doomsday_algorithm : (Num, Num, Num) -> Num)((y : Num), (m : Num), (d : Num)) == MOD(doomsday(y) + (d + (35 - doomsday_date(y, m))), 7)")))
}

///|
let doomsday_algorithm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("doomsday_algorithm")

///|
/// `doomsday_algorithm`
pub fn doomsday_algorithm() -> @kernel.Thm {
  doomsday_algorithm_c.get()
}

///|
/// DOOMSDAY_ALGORITHM_CORRECT
fn step_58() -> Unit raise {
  let t229 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([valid_date()])))
  let t227 = @term_syntax.parse_term("(m : Num)")
  let t228 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(y : Num)"), t227]), doomsday_date_bound()))
  let t230 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x224 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s225 = @tactics.subst1_tac(x224)
    fn(x226 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s225(x226)
    }
  }), @tactics.ap_thm_tac), @tactics.ap_term_tac), t228), t229), @int.asm_arith_tac)
  let t222 = @term_syntax.parse_term("(m : Num)")
  let t223 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(y : Num)"), t222]), doomsday_date_bound()))
  let t231 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([valid_date()]))), t223), @int.asm_arith_tac), t230])
  let t219 = @term_syntax.parse_term("(d : Num) + 35")
  let t220 = @term_syntax.parse_term("(m : Num)")
  let t221 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(y : Num)"), t220, t219]), dow_from_doomsday()))
  let t217 = @simp.rewrite_tac(@list.List([dow_period()]))
  let t218 = @list.List([@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(d : Num) + 35 == d + 7 * 5"))])), t217), @tactics.all_tac])
  let t216 = @tactics.subgoal_then(@term_syntax.parse_term("day_of_week((y : Num), (m : Num), (d : Num)) == day_of_week(y, m, d + 35)"), fn(x213 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s214 = @tactics.subst1_tac(x213)
    fn(x215 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s214(x215)
    }
  })
  let t212 = @simp.rewrite_tac(@list.List([doomsday_algorithm()]))
  let t232 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t212), t216), t218), t221), @tactics.ants_tac), t231)
  doomsday_algorithm_correct_c.set(@tactics.prove(@term_syntax.parse_term("∀ y : Num, ∀ m : Num, ∀ d : Num, valid_date((y, m, d)) → doomsday_algorithm(y, m, d) == day_of_week(y, m, d)"), t232))
}

///|
let doomsday_algorithm_correct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DOOMSDAY_ALGORITHM_CORRECT")

///|
/// `DOOMSDAY_ALGORITHM_CORRECT`
pub fn doomsday_algorithm_correct() -> @kernel.Thm {
  doomsday_algorithm_correct_c.get()
}

///|
let day_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("day_INDUCT")

///|
/// `day_INDUCT`
pub fn day_induct() -> @kernel.Thm {
  day_induct_c.get()
}

///|
let day_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("day_RECURSION")

///|
/// `day_RECURSION`
pub fn day_recursion() -> @kernel.Thm {
  day_recursion_c.get()
}

///|
/// day_INDUCT, day_RECURSION
fn step_59() -> Unit raise {
  let (day_induct, day_recursion) = @ind_types.define_type("enum Day { Sunday; Monday; Tuesday; Wednesday; Thursday; Friday; Saturday }")
  day_induct_c.set(day_induct)
  day_recursion_c.set(day_recursion)
}

///|
/// dayname
fn step_60() -> Unit raise {
  dayname_c.set(@pair.new_definition(@term_syntax.parse_term("(dayname : (Num) -> Day)((n : Num)) == (if n == 0 { Sunday } else { if n == 1 { Monday } else { if n == 2 { Tuesday } else { if n == 3 { Wednesday } else { if n == 4 { Thursday } else { if n == 5 { Friday } else { Saturday } } } } } })")))
}

///|
let dayname_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("dayname")

///|
/// `dayname`
pub fn dayname() -> @kernel.Thm {
  dayname_c.get()
}

///|
/// doomsday_day
fn step_61() -> Unit raise {
  doomsday_day_c.set(@pair.new_definition(@term_syntax.parse_term("(doomsday_day : (Num, Num, Num) -> Day)((y : Num), (m : Num), (d : Num)) == dayname(doomsday_algorithm(y, m, d))")))
}

///|
let doomsday_day_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("doomsday_day")

///|
/// `doomsday_day`
pub fn doomsday_day() -> @kernel.Thm {
  doomsday_day_c.get()
}

///|
/// DOOMSDAY_DAY_CORRECT
fn step_62() -> Unit raise {
  let t233 = @meson.meson_tac(@list.List([doomsday_algorithm_correct()]))
  let t234 = @tactics.then_tac(@simp.rewrite_tac(@list.List([doomsday_day()])), t233)
  doomsday_day_correct_c.set(@tactics.prove(@term_syntax.parse_term("∀ y : Num, ∀ m : Num, ∀ d : Num, valid_date((y, m, d)) → doomsday_day(y, m, d) == dayname(day_of_week(y, m, d))"), t234))
}

///|
let doomsday_day_correct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DOOMSDAY_DAY_CORRECT")

///|
/// `DOOMSDAY_DAY_CORRECT`
pub fn doomsday_day_correct() -> @kernel.Thm {
  doomsday_day_correct_c.get()
}

///|
/// DOOMSDAY_DAY_CONV
fn step_63() -> Unit raise {
  let cs = @compute.bool_compset(())
  let t235 = Some(1L)
  @compute.set_skip(cs, @term_syntax.parse_term("(COND : (Bool, Num, Num) -> Num)"), t235)
  let t236 = Some(1L)
  @compute.set_skip(cs, @term_syntax.parse_term("(COND : (Bool, Day, Day) -> Day)"), t236)
  @calc_num.num_compute_add_convs(cs)
  @compute.add_thms(@list.List([doomsday_day(), doomsday_algorithm(), doomsday(), century_anchor(), doomsday_date(), leap_year_mod(), dayname()]), cs)
  doomsday_day_conv_c.set(@compute.weak_cbv_conv(cs))
}

///|
let doomsday_day_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("DOOMSDAY_DAY_CONV")

///|
/// `DOOMSDAY_DAY_CONV`
pub fn doomsday_day_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (doomsday_day_conv_c.get())(x)
}

///|
/// DAY_1776_7_4
fn step_64() -> Unit raise {
  let t237 = @tactics.conv_tac(doomsday_day_conv)
  day_1776_7_4_c.set(@tactics.prove(@term_syntax.parse_term("doomsday_day(1776, 7, 4) == Thursday"), t237))
}

///|
let day_1776_7_4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DAY_1776_7_4")

///|
/// `DAY_1776_7_4`
pub fn day_1776_7_4() -> @kernel.Thm {
  day_1776_7_4_c.get()
}

///|
/// DAY_1969_7_20
fn step_65() -> Unit raise {
  let t238 = @tactics.conv_tac(doomsday_day_conv)
  day_1969_7_20_c.set(@tactics.prove(@term_syntax.parse_term("doomsday_day(1969, 7, 20) == Sunday"), t238))
}

///|
let day_1969_7_20_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DAY_1969_7_20")

///|
/// `DAY_1969_7_20`
pub fn day_1969_7_20() -> @kernel.Thm {
  day_1969_7_20_c.get()
}

///|
/// DAY_1989_11_9
fn step_66() -> Unit raise {
  let t239 = @tactics.conv_tac(doomsday_day_conv)
  day_1989_11_9_c.set(@tactics.prove(@term_syntax.parse_term("doomsday_day(1989, 11, 9) == Thursday"), t239))
}

///|
let day_1989_11_9_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DAY_1989_11_9")

///|
/// `DAY_1989_11_9`
pub fn day_1989_11_9() -> @kernel.Thm {
  day_1989_11_9_c.get()
}

///|
/// DAY_2000_1_1
fn step_67() -> Unit raise {
  let t240 = @tactics.conv_tac(doomsday_day_conv)
  day_2000_1_1_c.set(@tactics.prove(@term_syntax.parse_term("doomsday_day(2000, 1, 1) == Saturday"), t240))
}

///|
let day_2000_1_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DAY_2000_1_1")

///|
/// `DAY_2000_1_1`
pub fn day_2000_1_1() -> @kernel.Thm {
  day_2000_1_1_c.get()
}

///|
/// DAY_2026_3_26
fn step_68() -> Unit raise {
  let t241 = @tactics.conv_tac(doomsday_day_conv)
  day_2026_3_26_c.set(@tactics.prove(@term_syntax.parse_term("doomsday_day(2026, 3, 26) == Thursday"), t241))
}

///|
let day_2026_3_26_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DAY_2026_3_26")

///|
/// `DAY_2026_3_26`
pub fn day_2026_3_26() -> @kernel.Thm {
  day_2026_3_26_c.get()
}

///|
/// DAY_1966_12_14
fn step_69() -> Unit raise {
  let t242 = @tactics.conv_tac(doomsday_day_conv)
  day_1966_12_14_c.set(@tactics.prove(@term_syntax.parse_term("doomsday_day(1966, 12, 14) == Wednesday"), t242))
}

///|
let day_1966_12_14_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DAY_1966_12_14")

///|
/// `DAY_1966_12_14`
pub fn day_1966_12_14() -> @kernel.Thm {
  day_1966_12_14_c.get()
}

///|
/// DAY_2005_03_25
fn step_70() -> Unit raise {
  let t243 = @tactics.conv_tac(doomsday_day_conv)
  day_2005_03_25_c.set(@tactics.prove(@term_syntax.parse_term("doomsday_day(2005, 3, 25) == Friday"), t243))
}

///|
let day_2005_03_25_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DAY_2005_03_25")

///|
/// `DAY_2005_03_25`
pub fn day_2005_03_25() -> @kernel.Thm {
  day_2005_03_25_c.get()
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
  step_61()
  step_62()
  step_63()
  step_64()
  step_65()
  step_66()
  step_67()
  step_68()
  step_69()
  step_70()
}
