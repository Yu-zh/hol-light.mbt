# hol_light.mbt

A MoonBit port of [HOL Light](https://github.com/jrh13/hol-light), John Harrison's
LCF-style interactive theorem prover, targeting wasm (native works too).

The trusted kernel lives in `kernel/` (a port of `fusion.ml`); everything else
constructs theorems only through its API.

## Status

- **Core**: everything `hol.ml` loads. `lib`, `fusion` (`kernel/`), `basics`,
  `nets`, `printer`, `preterm`, `lexer`, `equal`, `bool`, `drule`, `tactics`,
  `itab` and `simp` are ported by hand; the theory files (`theorems` ..
  `define`) are translated.
- **Library/**: every file but `tactician_light.ml` (`library/<name>`).
- **Multivariate/**: all 32 theory files (`multivariate/<name>`).
- **100/**: 66 of 67 files (`100/<name>`): `e_is_transcendental` does not
  load upstream.
- **Complex/, Arithmetic/, Permutation/, Ntrie/, Model/, GL/, Divstep/, Rqe/,
  Unity/, Logic/, Jordan/** (with the Jordan curve theorem),
  **Functionspaces/, Quaternions/, Geometric_Algebra/, Probability/, IEEE/,
  Boyer_Moore/, EC/, Autoformalization/, Cadical/,
  Minisat/, WZ/, LP_arith/**: their theory files (`complex/<name>`, ...).
- **Formal_ineqs/**: the 62 files its make.ml loads (the verifier of
  nonlinear inequalities; `formal_ineqs/<dir>/<name>`).
- **Examples/**: 47 of 50. **Tutorial/**: 23 of 24.
- **RichterHilbertAxiomGeometry/**: readable.ml and the six developments
  in its proof format that load upstream (`richterhilbertaxiomgeometry/<name>`).
- Removed: the proof-script languages miz3/ (with its samples),
  Mizarlight/, IsabelleLight/ and Examples/mizar.ml. They add no logical
  power over tactics; the MoonBit proof API (`proof`, example in
  `examples/proof_api`) covers that style of proof.
- Not ported: QBF/ (needs squolem, which has no build for this platform);
  see [TODO.md](TODO.md).

Files that run an external program (csdp for `Examples/sos.ml`'s REAL_SOS,
cadical, MiniSat, maxima for WZ/, cdd for LP_arith/, Prover9) load without
it: the program's runs are recorded when the reference output is made and
replayed (`<pkg>/commands.mbt`); the kernel checks the proofs they lead to.
The proofs RichterHilbertAxiomGeometry/ wrote in readable.ml's text format
are MoonBit programs (`@readable.prove`, `steps`, `have`, `by`, ...;
richterhilbertaxiomgeometry/readable/script.mbt) that build the same tactics.

The mooncakes package `bobzhang/hol_light` has the core and Library/ (the
registry caps a module at 100 MB); Multivariate/, 100/ and the reference
tooling are in the [GitHub repository](https://github.com/bobzhang/hol-light.mbt).

Most packages were machine-translated from upstream's OCaml by a
translator that reproduced OCaml's runtime behaviour exactly (63-bit ints,
polymorphic compare and hashing, evaluation order, Hashtbl/Map/Random). The
translator has been retired: the `.mbt` files are now the source and are
edited directly. Each translated file is still checked against upstream:
loading it must give the same theorems, constants and name counters as HOL
Light itself (`*_ref_test.mbt`, golden outputs from `tools/ocaml_ref`;
`tools/ocaml_ref/refresh_ref.py` reruns one reference).

## Use

Packages for hol.ml's files initialize when imported, in upstream order.
Library and Multivariate packages load on demand, after what they need:

```moonbit
@prime.load()      // Library/prime.ml and its needs
let th = @prime.prime_2()
```

The `lexer` package owns `Lexcode`, `lex`, and the fixed reserved words
(`is_reserved_word`); `//` starts a line comment. Loading a theory cannot
reserve words or change comment syntax.
The `parserutil` package owns the parser combinators over lexer tokens. `lex`
returns an owned `Array[Lexcode]`; token parsers take `ArrayView[Lexcode]` and
return the unconsumed suffix as a view into the same array. Keep the token
array unchanged while parsing. `lex` uses the character classes in
`printer`.

Term and type quotations are read by `term_syntax`, a fixed MoonBit-like
syntax (`@term_syntax.parse_term("∀ n : Num, n + 0 == n")`); HOL Light's
extensible quotation parser has been removed.

In HOL's notation, which the printer writes and `lex` reads, universal
quantification uses `forall x. P x`, including `(forall)` when the quantifier
is passed as a function. The old `!x. P x` and `(!)` spellings are rejected. Existential `?` and unique-existence `?!` notation are unchanged.
The internal logical constant is also named `forall`; printer and
term constructors use the same name without an alias.
`tools/hol_notation.py` migrated the HOL-input literals of the translated
files; it is not a runtime compatibility parser.

## Develop

```
python3 tools/test.py                      # hand-ported core, wasm and wasm-gc (10 s)
python3 tools/test.py core                 # everything hol.ml loads (20 s)
python3 tools/test.py library              # or multivariate, 100, a package directory
python3 tools/test.py all                  # the whole suite on wasm-gc
python3 tools/test.py all --target wasm    # on the primary target (hours): before a release
python3 tools/ocaml_ref/refresh_ref.py 100_x_ref.ml    # rerun one OCaml reference
```

A file's test loads everything before it in a fresh process and compares
what HOL Light itself gives. The files of a directory with a load order
(its make.ml) are the test blocks of one package, `<dir>/make`, which
loads the chain once; `tools/test.py complex/make/05_quelim_test.mbt` runs
one member alone. Files outside such an order (100/, most of Library/)
have a test each. Run the tier you touch; `--shard I/N` splits a selection
across machines. Builds run 4 compiler processes at once (`--build-jobs`,
`$HOL_MOON_JOBS`): linking the test executable of a long chain takes about
14 GB, so moon's default of one per core is not safe here.

Shard allocation uses `tools/test_times.tsv`. Within each shard, test
executables start in descending estimated runtime; test order inside each
executable stays unchanged. Wasm runs print separate compilation and test
execution wall times and save them, along with time waiting for the build
lock, in `_build/test_<target>_timings.json`. Full-suite artifacts include
these reports so compilation cost can be distinguished from test imbalance.

CI (`.github/workflows/ci.yml`) runs the core tier on every push and pull
request, as upstream's CI builds HOL Light and loads hol.ml. The whole
suite (`.github/workflows/full.yml`, upstream's `holtest`) runs each night
after a change to main, split over 20 machines, and by hand:

```
gh workflow run "Full suite"                        # everything
gh workflow run "Full suite" -f tiers=multivariate -f shards=8
```

Locally, run the tier you touch.

The upstream sources go in `.repos/hol-light`. The reference runs use the
opam switch `hol-light` (or `$HOL_LIGHT_SWITCH`):

```
opam switch create hol-light ocaml-base-compiler.4.14.1 --no-switch
opam install --switch=hol-light camlp5.8.02.01 num camlp-streams ocamlfind
brew install pari    # upstream's PRIME_CONV calls gp (Library/pocklington.ml)
brew install cadical # Cadical/ (also lrat-trim, github.com/arminbiere/lrat-trim)
brew install maxima  # WZ/, Tutorial/Linking_external_tools.ml
# on PATH too, built from source: csdp (github.com/coin-or/Csdp, for
# Examples/sos.ml), MiniSat-p 1.14 as `minisat` (minisat.se, for Minisat/),
# cddlib with LP_arith/cdd_cert.c as `cdd_cert` (LP_arith/), and Prover9
# with `prooftrans` (LADR, for Examples/prover9.ml)
```

[PLAN.md](PLAN.md) has the design, decisions and known limitations;
[TODO.md](TODO.md) the plan for what is left.
