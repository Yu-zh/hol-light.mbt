# TODO

State on 2026-10-18. PLAN.md has the design and the history; this file is
what to do next.

## Done

- Core: every file hol.ml loads (13 hand-ported, 32 translated).
- Library/: every file except `tactician_light.ml`.
- Multivariate/: all 32 theory files (make.ml/make_complex.ml order, plus the
  12 others loaded after their anchor).
- 100/: 66 of 67 files (e_is_transcendental fails upstream).
- The directories README.md lists, each in its make.ml's order.
- Each translated file loads identically to upstream (theorem statements,
  constants, counters) and asserts no axiom but upstream's three
  (`@testkit.check_axioms`): `tools/test.py all` (wasm-gc, 25 min on 24
  cores; `--target wasm` takes hours). Tiers: `tools/test.py` (hand-ported
  core, 10 s), `core`, `library`, `multivariate`, `100`.
- OCaml `int` is exact 63-bit `Int64`; native (debug) passes too.

## Porting is closed

The translator (tools/translator and its drivers) was retired in October
2026: the `.mbt` files are the source and are edited directly. What was not
ported stays unported unless done by hand: files that need a program that
is not here (QBF: squolem; zChaff's half of Minisat/test.ml), the theorem
search databases, the Proofrecording kernel, loaders and test scripts.
`tools/ocaml_ref/refresh_ref.py <name>_ref.ml` reruns one upstream
reference and re-embeds its golden.

## Fixed syntax (issue #140)

1. Remove ambient syntax mutation (lexer, constant hiding, toggles, direct
   interface writes): done (#141-#145). Proof-script languages (miz3,
   Mizar, Mizar Light, Isabelle Light) removed; the MoonBit proof API is
   `proof`. RichterHilbertAxiomGeometry's readable-format proofs are MoonBit
   programs (`@readable.prove`), and the text format's parser is gone. Left: overload priorities (`prioritize_*`,
   `override_interface`) and type abbreviations, decided with step 2.
2. A sub-MoonBit term syntax (`term_syntax`: `∀ x : _, body`,
   `∃ x : _, body`, `→`), with a printer, checked by round-trip over the
   library's theorems: done.
3. Migrate every quotation to it and remove the old parser: done (#434).

## Open issues

- **Publishing**: mooncakes caps a module at 100 MB unpacked (over it, the
  server answers "Invalid ZIP archive"). `bobzhang/hol_light` 0.1.0 has the
  core and Library/ with their tests (71 MB). Multivariate/ (166 MB: 73 MB
  source, 93 MB tests) and 100/ (which needs it) are on GitHub only. Publish
  them as separate modules (e.g. `bobzhang/hol_light_multivariate`, possibly
  split further, tests trimmed): imports use the paths
  `bobzhang/hol_light/<pkg>`, so they need a module prefix per directory.

- **csdp**: Examples/sos.ml (REAL_SOS) runs the external SDP solver csdp
  (not in Homebrew; build from COIN-OR source, ask first). For wasm, replay
  recorded solver answers like lib/gp.mbt does for PARI/GP; the kernel
  checks the certificates.
- **CI**: `.github/workflows/ci.yml` runs the core tier on every push
  and pull request (upstream's practice: its CI loads hol.ml), and
  `.github/workflows/full.yml` the whole suite on wasm-gc nightly and by
  hand, in 20 shards on hosted machines (16 GB): with one compiler
  process at a time every shard passes (two ran out of memory while
  linking). The first passing run took 26 to 96 minutes a shard, 17.6
  machine hours in all; its times are tools/test_times.tsv now, which
  balances the shards at about 73 minutes of tests each over three at
  once. Each run uploads its times again (artifacts). Not done: skipping
  a test whose package and dependencies did not change. Native would not
  be faster: with the build optimized (moonc 0.10.15) the test that loads
  the core takes 20 s against 12 s on wasm-gc, three quarters of it in
  reference counting and allocation.
- **Warnings**: `moon check` with moonc 0.10.15 gives 4 (deprecations in
  num/). Translated packages carry a `warnings = "..."` line
  for what is a property of machine-made code; words the compiler
  reserves get `_` like keywords (`@define.define_`). CI is still pinned
  to moonc 0.10.14, which accepts all of it.
- **Stale references**: tools/ocaml_ref/num_ref.expected has three lines
  the test no longer embeds (`int_big`, `int_too_big`, `max_min`), and
  Examples_prog_ref.expected differs from prog_ref_test.mbt since #133;
  regenerate or delete them.
- **Native release**: `moon test --release --target native` hits a moonc
  C-backend miscompile; repro in tools/moonbit_bugs/. Retry after a compiler
  update (debug native passes).
- **Not ported**: Jordan/tactics_refine.ml's `dump_thm` and `load_thm`
  (theorems marshalled to a file and read back as proved: the port never
  deserializes theorems; the two functions exist and fail; upstream leaves
  the fast load off), GL/tests.ml (an interactive script: `e GL_TAC` fails on
  purpose to show a countermodel, so the file cannot be loaded upstream
  either), tactician_light.ml (needs a tactic-expression interpreter
  to replace `loadt` of OCaml strings), help.ml/database.ml and the
  Multivariate `*_database.ml` search tables (interactive), 
  100/e_is_transcendental.ml (fails upstream).
- **Known limitations**: see PLAN.md (Num representation history,
  non-ASCII byte strings, float-array hashing, let rec groups with
  ambiguous initialization order are rejected).
