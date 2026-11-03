///|
/// Print every definition and axiom of the core library, parse the result
/// and compare: every term the printer accepts must come back unchanged.
test "core definitions and axioms round-trip" {
  ignore(@define.define_)
  let terms = (@kernel.definitions() + @kernel.axioms()).map(@kernel.concl)
  let reasons : Map[String, Int32] = Map([])
  let mut ok = 0
  let bad = []
  for t in terms {
    let s = @term_syntax.print_term(t) catch {
      @term_syntax.Unprintable(why) => {
        // the kind of name, not the name itself
        let kind = why.split(" ").take(2).collect().join(" ")
        reasons[kind] = reasons.get(kind).unwrap_or(0) + 1
        continue
      }
    }
    let u = @term_syntax.parse_term(s) catch {
      e => {
        bad.push(s + "  -- " + e.to_string())
        continue
      }
    }
    if @term_syntax.same_term(t, u) {
      ok += 1
    } else {
      bad.push(s)
    }
  }
  if !bad.is_empty() {
    fail(
      "\{bad.length()} terms do not round-trip, e.g.\n" +
      bad[:if bad.length() < 5 { bad.length() } else { 5 }].join("\n"),
    )
  }
  let summary = reasons.to_array().map(p => "\{p.0}: \{p.1}")
  summary.sort()
  inspect(
    "\{terms.length()} terms, \{ok} round-trip, \{terms.length() - ok} unprintable\n" +
    summary.join("\n"),
    content=(
      #|266 terms, 266 round-trip, 0 unprintable
      #|
    ),
  )
}
