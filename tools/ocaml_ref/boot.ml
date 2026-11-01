(* Plain-OCaml bootstrap: camlp5 + HOL Light's pa_j syntax + num. *)
#use "topfind";;
Topfind.don't_load ["compiler-libs.common"];;
#require "num";;
#use "bignum_num.ml";;
Topfind.load_deeply ["camlp5"];;
#load "str.cma";;
#load "camlp5o.cma";;
#load "pa_j.cmo";;
