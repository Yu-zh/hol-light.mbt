# HOL Light → MoonBit port plan

Upstream: `.repos/hol-light` (jrh13/hol-light @ `cba9198`), not tracked in this repo.

This is the design and history of the port. The translator and the batch
tools it describes were retired in October 2026 (TODO.md, "Porting is
closed"); the `.mbt` files are now edited directly.

## Goals and decisions

- **Scope:** everything, incrementally. First the full `hol.ml` load sequence
  (~56K lines in the root dir), then `Library/`, `Multivariate/`, and the rest
  (~1.2M lines in total).
- **Targets:** `wasm` (linear memory) is the primary target, and every
  package must pass `moon test --target wasm`. `native` comes later. Keep
  packages target-agnostic: no FFI and no async in core packages. Day to
  day the theory tests run on `wasm-gc`, where they take a fifth of the
  time (see Verification); results must not depend on the target.
- **Small trusted kernel:** only `kernel/` (a port of `fusion.ml`) is trusted.
  It depends only on `moonbitlang/core` and uses the builtin `Failure` error.
  The `lib.ml` helpers it needs (`union`, `subtract`, `qmap`, `rev_assocd`, …)
  are private copies inside `kernel/`, so the audited trusted code is
  exactly that package. `HolType` and `Term` are read-only enums (they can be
  matched but not constructed outside the kernel), so every term is well
  typed. `Thm`
  has private fields, so the 10 primitive rules plus the axiom and definition
  functions are the only way to make a theorem. Everything else (lib, parser,
  tactics, decision procedures, theories) is untrusted and goes through the
  kernel API.
- **Review:** each commit gets `codex review --commit <sha>` (model
  `gpt-6-astra`, reasoning effort high). Valid findings
  are fixed in a follow-up commit, and disagreements are escalated.

## Trust boundary (kernel hardening)

- **Encapsulation:** `HolType`/`Term` are read-only enums and `Thm` has
  private fields. `tools/check_kernel_encapsulation.sh` checks that outside
  code cannot construct or update them. Never add `FromJson`, `Default`,
  arbitrary generators or deserializers for kernel types, because derives
  run with kernel privileges. The trusted base also includes the MoonBit
  compiler, `moonbitlang/core` and the absence of `%identity`/FFI casts
  in linked code.
- **Atomic extensions:** `new_basic_definition` and
  `new_basic_type_definition` run every check and build their theorems
  before publishing anything. Upstream can leave a registered type behind
  when `absname == repname`; the port cannot.
- **Fail closed:** the kernel's `abort` calls cover invariants that
  well-typed terms guarantee (operators have function types, binders are
  variables, clashes do not escape `inst`). None of them silently continues.
- **Axioms:** as upstream, `new_axiom` is unrestricted (`mk_thm` relies on
  it). `axioms()` is the audit trail, and `@testkit.check_axioms` (only
  `INFINITY_AX`, `SELECT_AX` and `ETA_AX` allowed, each once) runs at the end
  of every generated theory-load test (the template in
  tools/ocaml_ref/theory.py).
- **Traps:** a wasm trap (for example a stack overflow) during an extension
  leaves the store as it was at the trap. A trapped instance must be
  discarded, not resumed. Inference rules have no side effects, so a trap
  there produces no theorem.
- **Tests:** OCaml differential suite; failed-extension state snapshots;
  property tests on generated well-typed terms (capture avoidance, type
  preservation, alpha-order laws, sorted duplicate-free hypotheses); deep
  binders, operator spines and types.

## Semantic hazards (OCaml → MoonBit)

| Hazard | Decision |
|---|---|
| Polymorphic `compare` on terms, types and strings. MoonBit `String::compare` puts shorter strings first (`"b" < "aa"`), while OCaml compares byte by byte. This is load-bearing: the kernel sorts hypotheses with `alphaorder`, and `setify` and `sort` change output order. | Write `Compare` by hand to reproduce OCaml's order: constructor tag first, then fields from left to right, `[] < _::_`, and strings compared by code point (the same as UTF-8 byte order). Never use derived `Compare` or `String::compare` where OCaml's order matters. |
| `string` | HOL names and quotations are ASCII text, so use `String`. The only byte-level places are char/string theories (`mk_char`, `Library/strings`), which get explicit byte helpers. |
| OCaml `list` and physical-equality sharing (`==`) in `qmap`, `vsubst`, `inst`, `term_image` | Use the immutable `@list.List[T]` and `physical_equal`. Lists keep their order exactly as in OCaml (for example `constants()` returns the newest first). |
| `Failure`, `try … with Failure _`, `can`, `Unchanged`, `Match_failure` | Use the builtin `Failure(String)`. Every fallible HOL function is declared plain `raise`, kernel included, because a `raise Failure` function value is not accepted where a `raise` callback is expected, and HOL passes rules around as values everywhere. Catch sites match `Failure(_)` and re-raise everything else (`e => raise e`), like OCaml's `with Failure _`. `Unchanged`, `MatchFailure`, `InvalidArgument` and `DivisionByZero` are separate `pub(all)` error types. |
| Deep recursion. Both wasm and wasm-gc overflow somewhere between 10K and 30K frames. | List utilities use loops or `@list` builtins. Recursion over terms is **not** assumed safe: there are stress tests for deep combinations, binders and long lists, and explicit work stacks are added where needed. |
| Evaluation order. OCaml 4.14 evaluates tuples, function arguments, constructor arguments, list literals and binary operators right to left. But `let … and …` and `match (e1, e2) with` (where the tuple is never built) go left to right. MoonBit is always left to right. | Whenever the parts have effects (fresh names, registration, exceptions), write the order out explicitly. Library callback order follows `lib.ml` exactly: `map` runs head-first, `filter`/`mapfilter` tail-first. |
| OCaml 63-bit `int` vs MoonBit 32-bit `Int` | OCaml `int` is `Int64` with exact 63-bit semantics (lib/int63.mbt) in translated code and in OCaml-visible data; `Int` only for indexes and bounded internals, converted with a range check at the boundary. |
| `Hashtbl.hash` decides the tree shape of the `lib.ml` Patricia maps (`func`, `\|->`), and so their fold and `choose` order | Implement an OCaml-compatible `caml_hash` (MurmurHash3, limits 10/256) for the key types used (strings, ints, terms, types, tuples) and test it against OCaml values. Keep `Hashtbl` duplicate-binding semantics. |
| Callback effect types | Combinators that only propagate errors take `raise?` callbacks, which accept any function value. Combinators that catch `Failure` (`can`, `repeat`, `tryfind`, `splitlist`, `find_term`, …) take `raise` callbacks, and a named non-raising function must be passed as a lambda (`t => is_var(t)`). The translator always eta-expands function arguments. |
| Physical equality `==` | Use `physical_equal` only as a sharing optimization. Results must be structurally identical whether it returns true or false. |
| Alpha order vs structural order | They are kept separate: `alphaorder` puts `Const < Var < Comb < Abs`, while structural `compare` uses the constructor order `Var < Const < Comb < Abs`. |
| `Lazy` (thecops), exceptions other than `Failure` (`Unchanged`, `Noparse`, `Not_found`) | Port to `Lazy`-like explicit cells and separate `suberror`s. `can`/`try … with Failure _` catch only `Failure`. `abort` is used only for states the kernel makes impossible. |
| `Num` / Zarith bignums and rationals | `num/` implements arbitrary-precision rationals on top of `@bigint`, matching the `Num` operations HOL uses (`quo_num`/`mod_num` sign rules, `string_of_num`, …). |
| `Format` pretty printing | Port a minimal OCaml `Format` box engine (`pp/`) so that printer output matches byte for byte. |
| Term quotations `` `...` `` (camlp5 `pa_j`) | Becomes a call to the parser on a string (`@parser.parse_term("...")`). Type quotations `` `:ty` `` become `parse_type`. |
| `Hashtbl.hash`-dependent order | Where iteration order changes results, use insertion-ordered `Map` and check against the reference output. |

## Naming

MoonBit treats uppercase identifiers as constructors, so HOL's UPPERCASE
values (rules, tactics, conversions, theorems) become lowercase:
`REFL` → `refl`, `EQ_MP` → `eq_mp`, `ADD_SYM` → `add_sym`. When the
lowercase name collides with an existing lowercase HOL/OCaml identifier
or a MoonBit keyword, a suffix based on the kind is added: `_rule` for
inference rules, `_thm` for theorems, `_conv` for conversions, `_tac` for
tactics. Kernel examples: `MK_COMB` → `mk_comb_rule`, `INST` → `inst_rule`,
`ABS` → `abs_rule`, `ASSUME` → `assume_rule` (`assume` is reserved). Doc
comments name the original HOL identifier.

## Package layout (each package follows one HOL file or a few adjacent ones)

```
kernel/    fusion.ml               ← TRUSTED, kept minimal
lib/       lib.ml                  general utilities (untrusted)
num/       Num replacement on @bigint
pp/        OCaml Format subset
basics/    basics.ml, nets.ml
printer/   printer.ml
parser/    preterm.ml, parser.ml
equal/ … drule/ tactics/ simp/ …   one package per layer, in hol.ml load order
theories/… generated or hand-ported theory scripts
```

### Theory loading (decided with Codex guidance)

MoonBit does not reliably evaluate side-effecting top-level `let`s (unused
globals are dropped), and upstream's load-time effects are ordered:
definitions register constants, quotations advance the type-variable and
`GEN%PVAR` counters, and partially applied rules precompute theorems. So:

- Each theory package runs upstream's load-time steps in its `fn init`
  (suggested by the user). A probe confirmed that `fn init` runs for every
  imported package, even when nothing in it is used, in dependency order,
  and also in tests. Importing a theory therefore loads it, like `needs`.
  The canonical order comes from the import chain: each theory imports the
  previous one in `hol_lib.ml` order. A failed load aborts. The steps are
  every eager upstream computation, in order: definitions, quotations,
  syntax changes, closure set-up, and discarded results too.
- Theorems and precomputed proof steps are stored in write-once
  `@lib.Cell`s, exposed as typed accessors (`@bool.t_def()`). Rules are
  plain functions that read those cells.
- Effectful expressions are lowered to explicit temporaries in the pinned
  OCaml 4.14 evaluation order: arguments and tuples right to left,
  `let … and …` and `match (…)` left to right.
- The parser records the quotations each theory parses while loading
  (`@theory.theory_trace(name)`).
- On wasm, writing to stdout inside `fn init` traps (native is fine). So
  `begin_theory` holds stdout lines back (`@pp.defer_stdout`) until
  `end_theory`. The held-back lines are printed before the next line of
  output after initialisation (or by `@pp.flush_stdout_backlog()`), and are
  kept per theory for tests (`@theory.theory_output(name)`).
- Load-fidelity tests compare, after loading each file in a fresh process:
  the three counters (types, `GEN%PVAR`, `genvar`), `types()`,
  `constants()`, `definitions()`, `axioms()`, warnings, and structural
  theorem representations.
- Startup optimization (proof-DAG replay through the kernel, never raw
  theorem deserialization) comes after the eager baseline is measured.

## Proof scripts strategy

1. **Engine (hand-ported, idiomatic):** every file that mostly defines ML
   functions (rules, conversions, tactics, decision procedures, `define`,
   `ind_types`, …).
2. **Theory scripts (translated by a tool):** most of the remaining lines are
   `let NAME = prove(`…`, TAC)` and `new_definition` calls. Write a
   translator in OCaml using `compiler-libs`. It works on the camlp5-expanded,
   type-checked AST, so it has full type information (MoonBit needs types on
   top-level functions). It emits MoonBit; the output is spot-checked and
   fixed by hand where needed. **Built for theorems.ml** (tools/translator,
   driven by tools/ocaml_ref/translate.sh):
   - Upstream files load phrase by phrase in a live toplevel (camlp5 +
     pa_j + compiler-libs). Each phrase is typechecked, translated, then
     executed; the installed stamps record which file defined each value
     (provenance), which resolves to a MoonBit package and declaration read
     from its `pkg.generated.mbti` (names: lowercase plus `_rule`/`_thm`/
     `_conv`/`_tac`/`_tcl` on clashes).
   - Lowering keeps OCaml 4.14's evaluation order: all ordered siblings
     but the last (in OCaml order) are bound to temporaries; arguments are
     evaluated before any stage call; tuple-scrutinee matches go left to
     right.
   - Calls are aligned with MoonBit parameter groups from the declared
     OCaml type: a group of k > 1 takes k curried arguments or one k-tuple.
     Function values are adapted to the expected MoonBit type by
     eta-expansion that applies each stage as soon as its arguments arrive,
     so staging is preserved. `o`/`I`/`K`/`C`/`W`/`F_F` are expanded inline.
   - Theorems and other values become write-once cells with accessors; set
     in `load_steps()` in source order. Syntactic functions become `pub fn`.
   - Engine phrases are ported by hand and named in the manifest
     (tools/translator/main.ml), which calls their setup at the upstream
     position.
3. Optionally later: a small ML-subset interpreter or REPL for interactive use.

## Verification

- **Reference outputs:** run real HOL Light (OCaml 4.14 and camlp5 are
  installed locally) and dump `name: string_of_thm` for every theorem a file
  defines, plus selected printer and parser cases. The MoonBit port must
  match these exactly.
- Unit tests ported from `UnitTests/`. Kernel tests cover every rule's
  success and failure cases.
- Every commit must pass `moon check --target wasm`, `tools/test.py`
  (the hand-ported core on wasm and wasm-gc, seconds), `moon fmt` and
  `moon info`; a change to a theory, the translator or the engine also the
  tiers it touches (`tools/test.py core|library|multivariate|100|all`, on
  wasm-gc). A file's test loads everything before it in a fresh process;
  the files of a load order (a make.ml) are test blocks of one package,
  run in order in one process with their goldens unchanged (the blocks
  read the counters without advancing them: tools/ocaml_ref/chain_test.py).
  `tools/test.py all --target wasm` (the primary target) is for releases. `--shard I/N` splits a selection across machines,
  balanced by tools/test_times.tsv.

## Phases

0. Scaffold, plan and `.gitignore` (upstream excluded).
1. `kernel/` (`fusion.ml`), with exhaustive kernel tests and deep-term
   stress tests.
2. Reference harness (OCaml dump of theorems, registries and printer
   output), `lib/` (`lib.ml`, including OCaml-compatible hashing and
   `func`), and `num/`.
3. `basics/`, `nets/`, `pp/`, `printer/`, `preterm/`, `parser/`, plus an
   early translator spike on `pair.ml`.
4. `equal`, `bool`, `drule`, `tactics`, `itab`, `simp`, `theorems`,
   `ind_defs`, `class`, `trivia`, `canon`, `meson`, `firstorder`, `metis`,
   `thecops`, `quot`, `impconv`.
5. `pair` … `realarith` … `sets`, `iterate`, `cart`, `define`, … (the rest
   of `hol.ml`), plus the translator spike.
6. `Library/`, `Multivariate/`, and the other subdirectories, incrementally.
7. Add the `native` target and performance work.

## Progress log

- [x] Phase 0: scaffold, plan, OCaml reference harness (`tools/ocaml_ref`:
  builds `pa_j` for camlp5 8.00, loads upstream sources, emits reference
  output that is embedded into MoonBit tests with `embed_golden.py`).
- [x] Phase 1: `kernel/` matches `fusion.ml` on 56 differential checks
  (`kernel/kernel_ref_test.mbt`).
  Known limit: with the default wasm stack (984 KB) recursive kernel
  operations handle terms nested about 2500 deep in debug builds
  (`vsubst_rec` overflows first). `moonrun --stack-size 4000` makes depth
  3000+ work. Mitigations, if real theories need them: run the CLI through
  `moonrun --stack-size`, or rewrite the hot paths with explicit stacks.
  The Codex review found no soundness issues; the sharing fixes for `qmap`,
  `filter` and `term_image` are applied.
- [ ] Phase 2: `num/` is done (it matches OCaml `Num` and the `lib.ml` num
  helpers on 270 differential checks plus 12 bit-exact `float_of_num`
  cases; `int_of_num` is limited to 32 bits by design, and `int64_of_num`
  covers wider values). `lib/` is done: `OCompare`/`OHash` reproduce OCaml
  `compare` and `Hashtbl.hash` (35 hash values match), and `lib.ml`
  including the Patricia `func` matches on 68 differential checks that also
  compare callback order. Not yet ported: `time` (needs a clock and OCaml
  float formatting) and the file helpers (`strings_of_file` etc.), which
  wait for an I/O package.
- [ ] Phase 3: `basics/` is done (basics.ml plus the untrusted tail of
  fusion.ml; it matches basics.ml on 79 differential checks, including
  hash-ordered `atoms`, `genvar` counters and capture-avoiding `subst`).
  `nets/` is done (persistent term nets with `NetCompare`, which models
  OCaml `compare` raising on closures; it matches nets.ml on 28 lookups,
  including closure-ordered tips and merges). `pp/` is done: a port of
  OCaml 4.14's Format engine; 300 random box/break documents at several
  margins and max-box limits match OCaml byte for byte (5,766 lines).
  `printer/` is done: printer.ml plus the parse-status tables; it matches
  upstream on 73 hand-built cases (types, infix precedence and
  associativity, binders, sets, comprehensions, let, conditionals,
  character strings, decimals, interface reversal, theorems, wrapping at
  margins 78 and 30). Known difference: standard output is line-based, so
  `print_flush` on `std_formatter` ends a partial line with a newline.
  `preterm/` and `parser/` are done: typechecking with overload
  resolution, then the lexer and combinator grammar. The lexer is a loop,
  and the grammar uses the same combinators as upstream so that
  backtracking re-runs actions identically. They match upstream on
  `tools/ocaml_ref/parse_cases.txt` (186 outputs: types, terms, structure
  with invented type-variable numbers, `GEN%PVAR` numbering, overloading
  across num/int/real, warnings and error messages, wrapping).
  Phase 3 is complete.
- [ ] Phase 4: `equal/` is done (conversions as `Conv = (Term) -> Thm raise`
  closures, conversionals, depth conversions with upstream's exact `try`
  scopes, `CACHE_CONV` with OCaml closure-compare semantics in nets; it
  matches equal.ml on 62 checks, including callback order). `bool/` is done:
  the first theory with `load()`. Definitions and the precomputed rule
  theorems are in write-once cells, quotations are parsed in OCaml's
  evaluation order, and it matches bool.ml on 79 checks, including the
  constants, definitions, parse tables, interface and all three counters
  after loading. `testkit/` holds the shared test helpers. `drule/` is done
  (matching, unification, instantiation, PART_MATCH/MATCH_MP with
  upstream's staging, which return closures, and new_definition; it
  matches drule.ml including the load trace and counters).
  Test-writing rule: the OCaml reference scripts bind effectful arguments
  with explicit `let`s, because OCaml evaluates the script's own arguments
  right to left. `tactics/` is done: goals, goalstates and justifications
  as closures, THEN/THENL with OCaml's right-to-left justification order,
  the theorem tacticals, the goal printers, `prove`, and the interactive
  goalstack (`g`/`e`/`r`/`b`/`er`). It matches tactics.ml on 130 checks,
  including the load trace, failure messages, goal printing and counters.
  Infix tacticals that collide with keywords are `then_tac` and
  `orelse_tac`; `lib.time` reads a pluggable `cpu_time` clock (0 on wasm).
  `itab/` is done (ITAUT_TAC, UNIFY_ACCEPT_TAC, UNIFY_REFL_TAC; matches
  itab.ml on ten ITAUT proofs and the metavariable goalstack). `simp/` is
  done: rewrite nets of `Gconv` (priority plus closure, compared as OCaml
  compares closures), mk_rewrites, the simpset strategies with upstream's
  try scopes, basic rewrites, convs and congruences, staged
  REWRITE/SIMP rules and tactics, ABBREV_TAC and EXPAND_TAC. It matches
  simp.ml on 60 checks, including the load output. `theorems/` is done:
  the first file produced by the translator (66 theorems, AC, CLAIM_TAC,
  the basic rewrites and congruences), with the DESTRUCT/FIX/INTRO/HYP_TAC
  block ported by hand. It matches theorems.ml exactly: every theorem, the
  77-quotation load trace, load output, rewrite registries, the pattern
  tactics on goals, and the counters. `ind_defs/` is done, entirely
  translated (engine code: local `let rec`, polymorphic helpers lifted to
  generic top-level functions, tuple bindings of closures, refs); it
  matches ind_defs.ml on inductive definitions (schematic, mutual, nested
  quantifiers, redefinition), strong induction, the helpers, registries
  and counters. `class/` is done, entirely translated (43 theorems,
  SELECT/ETA/TAUT/COND tools, new_type_definition); it matches class.ml
  exactly. Translator additions on the way: a MoonBit group aligns with
  OCaml arguments by exact unit counts (spreading tuple arguments, e.g.
  `new_basic_type_definition tyname (abs, rep) th`), a package's own
  unqualified types are qualified, and the last definition of a redefined
  name (TAUT) gets the plain MoonBit name. `trivia/` and `canon/` are
  done, entirely translated, and match upstream (17 trivia theorems; NNF,
  CNF/DNF, PRENEX, SKOLEM and friends). Each phrase's load work is its own
  `step_N` function. Mutually recursive local functions are lambda-lifted
  to top-level functions (captures become parameters): large `letrec`
  closures hit a MoonBit compiler bug (native ICE "unbound scalar", bad
  pointer at run time on debug wasm). Polymorphic local functions are
  lifted when they capture nothing, else monomorphised at their instance.
  `meson/` is done, entirely translated (the translator now handles type
  declarations as `pub(all) enum ... derive(Eq, Debug)` with generated
  OCaml-order `OCompare`/`OHash` impls, exceptions as `suberror`s, and
  modules flattened into the package with `Module.x` provenance); MESON
  proofs and their progress output match upstream. `firstorder/` is done,
  entirely translated (nested modules, `include List`, Stdlib `List.*`
  mapped to lib functions with Stdlib semantics, printf with literal
  formats, `assert`, floats, operators named `op_...`). Records are
  supported (structs, OCaml's right-to-left field order, patterns,
  `{r with ...}`, mutable fields, generated OCompare/OHash).
  **Deferred: `metis.ml` and `thecops.ml`.** They are module-heavy programs
  (functors `Mmap.Make`/`Mset.Make` over OCaml's `Map.Make`/`Set.Make`,
  `include`/`open` of applications); they need functor instantiation in the
  translator and an ordered Map/Set in MoonBit. METIS is first used in
  arith.ml (3 times), so they come before that file. Until then later
  packages and their reference scripts skip both. `quot/` and `impconv/`
  are done, entirely translated, and match upstream (quotient types,
  lifted functions and theorems; IMP_REWRITE_TAC, SEQ_/CASE_/TARGET_
  rewriting, HINT_EXISTS_TAC). impconv needed local modules and module
  aliases, types declared in local modules, polymorphic local functions
  lifted to generic top-level functions (captured locals are passed at
  the instance used), local function-valued lets annotated with partial
  types (`_` for unknown parts), and type variable names past `TZ`.
  Generated packages also write `translated_names.txt` (a module member's
  qualified name -> its MoonBit name), which later translations consult,
  so `A.f` and `B.f` stay distinct across packages. `metis/` is done,
  entirely translated (28k lines of MoonBit) and matches upstream on
  METIS_TAC proofs (first-order, equality, lemmas, ASM_METIS_TAC). On the
  way: functor applications are specialized before typechecking (each
  `F (A)` becomes a structure aliasing the parameter to A followed by F's
  body, with hygiene for free modules and values); Stdlib Map.Make and
  Set.Make become wrappers over `omap`/`oset`, OCaml 4.14's Map/Set code
  with an explicit comparison (checked to build Stdlib's exact trees and
  call callbacks in the same order); OCaml 4.14's Random (with the MD5
  seeding `Random.init` uses) and List.sort are ported exactly; module
  members resolve through recorded module paths; exceptions get distinct
  suberrors; lambdas with known types are annotated raising `fn`s.
  `thecops/` is done, entirely translated, and matches upstream on
  LEANCOP_TAC and NANOCOP_TAC proofs (it needed while loops, lazy values,
  Hashtbl with OCaml's shadowing semantics, local opens, `include` of a
  translated module, and fixpoint bounds for recursive groups). Known
  limitation: Hashtbl.hash of float arrays is that of an ordinary block.
  Further known limits (each fails loudly or was checked not to matter
  where used): `num` keeps no representation history, so
  OCaml's structural compare and Hashtbl.hash on nums are reproduced from
  the canonical form (a non-normalized Big_int such as `minus_num (2^62)`
  differs) and where OCaml's compare raises on big-integer digits the port
  aborts; simp's generic net elements order equal-priority payloads by
  physical identity only (upstream compares non-closure payloads
  structurally; HOL's nets hold closures); a net whose elements are
  tuples holding a function compares them by identity as a whole
  (Examples/holby.ml); byte-level string operations
  abort on non-ASCII characters (e.g. dest_string of a char >= 128).
  The core (everything hol.ml loads before the theory files) is now
  ported. All theory files hol.ml loads are translated and match upstream
  in their differential tests: pair, compute, nums, recursion, arith, wf,
  calc_num, normalizer, grobner, ind_types, lists, realax, calc_int,
  realarith, real, calc_rat, int, sets, iterate, cart, define (theorem
  lists plus behaviour checks: EVAL_CONV, NUM_REDUCE_CONV,
  NUM_NORMALIZE_CONV, NUM_RING, define_type, REAL_ARITH, REAL_FIELD,
  INT_ARITH, INT_RING, general recursive `define`). They are produced by
  tools/ocaml_ref/theory.sh <file> <dependencies...> (now
  tools/ocaml_ref/theory.py <file>, which follows `needs`).
  Library/ is translated and matches upstream file by file (each package
  has `load()`, loading its `needs` first and itself once, so theories
  load in upstream order). External programs: wasm has no shell or file
  system, so `gp factorint` (pocklington, pratt) is emulated in
  lib/gp.mbt (Baillie-PSW + Brent rho) over in-memory files. Not ported:
  Library/tactician_light.ml, an interactive tool that evaluates OCaml
  tactic strings at run time with `loadt` (it needs a tactic-expression
  interpreter, a possible later addition).
  OCaml `int` is an `Int64` with exact 63-bit semantics (lib/int63.mbt:
  results normalized to [-2^62, 2^62 - 1], OCaml's `max_int`/`min_int`,
  `lsl`/`lsr`/`asr`, division by zero raising; checked against OCaml
  4.14). The translator maps `int` to `Int64` and converts at the
  boundaries of hand-ported `Int` APIs (scalars, tuples and functions;
  `Int` stays for indexes and bounded internals, narrowed with a check);
  APIs carrying OCaml ints inside data are `Int64` (kernel type arities,
  `range`, infix precedences, instantiations, `Num.int_of_num` as
  `int63_of_num`). Upstream and the port now agree beyond 2^31 (e.g.
  bitmatch on 32-bit word numerals). tools/ocaml_ref/retranslate_all.py
  regenerates every translated package in load order.
  Multivariate/ loads in make.ml's order (each file after its
  predecessor's chain and what it needs; known difference: a file of
  another directory that needs one Multivariate/ file gets every file
  before it in that order, where upstream loads only what it needs, and
  the references are taken in our order. theory.CHAIN_SKIP leaves a file
  out where it matters: clifford.ml's infix `outer` in
  Autoformalization/planar_graph.ml), checked a run of files at a time
  by tools/ocaml_ref/batch.py (one translation session and one upstream
  session, forking a child per file, instead of three chain reloads per
  file). Not ported: multivariate_database.ml and complex_database.ml, the
  name/theorem tables of the interactive `search` (they need help.ml, like
  database.ml, and define no theory). Native: `--target native` passes the
  whole suite; `--release` hits a moonc C-backend miscompile
  (tools/moonbit_bugs/).
  Multivariate/ is translated and matches upstream file by file: the 20
  files make.ml and make_complex.ml load, and the 12 others, each loaded
  after its anchor (the deepest make.ml file it needs; e.g. tarski.ml's
  proofs fail after the complex analysis). batch.py plans a run of files as
  a tree (branches fork the session) so a chain loads once per side. The
  whole suite (145 tests) passes with `moon test -j 16`.
  Not ported because they fail upstream (HOL Light 3.1.0, OCaml 4.14, in
  upstream's own hol_lib.ml environment): 100/e_is_transcendental.ml
  (ACCEPT_TAC fails; 100/transcendence.ml proves the result independently).
