// ===========================================================================
// Parser combinators (parser.ml). A parser takes an input sequence and returns
// a result and the rest of the input, raising `Noparse` when it does not
// apply. `Failure` is a hard error that alternatives do not catch.
// ===========================================================================

///|
using @list {type List}

///|
/// Raised by a parser that does not apply (parser.ml's `Noparse`).
#derive(Debug)
pub(all) suberror Noparse

///|
pub extend Noparse with @debug.Debug::{to_repr}

///|
/// `p1 ||| p2`. The combinators are as polymorphic as parser.ml's: the
/// input and what is left of it are any types (Examples/sos.ml has a
/// function generic in them).
pub fn[X, R] alt(p1 : (X) -> R raise, p2 : (X) -> R raise) -> (X) -> R raise {
  input => {
    p1(input) catch {
      Noparse => p2(input)
      e => raise e
    }
  }
}

///|
/// `p1 ++ p2`
pub fn[X, A, Y, B, Z] seq(
  p1 : (X) -> (A, Y) raise,
  p2 : (Y) -> (B, Z) raise,
) -> (X) -> ((A, B), Z) raise {
  input => {
    let (r1, rest1) = p1(input)
    let (r2, rest2) = p2(rest1)
    ((r1, r2), rest2)
  }
}

///|
/// `many p`: zero or more `p`.
pub fn[X, A] many(p : (X) -> (A, X) raise) -> (X) -> (List[A], X) raise {
  input => {
    let results = []
    let mut rest = input
    while true {
      let (r, next) = p(rest) catch {
        Noparse => break
        e => raise e
      }
      results.push(r)
      rest = next
    }
    (@list.List(results), rest)
  }
}

///|
/// `p >> f`
pub fn[X, A, B, Y] map(
  p : (X) -> (A, Y) raise,
  f : (A) -> B raise?,
) -> (X) -> (B, Y) raise {
  input => {
    let (r, rest) = p(input)
    (f(r), rest)
  }
}

///|
/// `fix err p`: turn `Noparse` into a failure "<err> expected".
pub fn[X, R] fix(err : String, p : (X) -> R raise) -> (X) -> R raise {
  input => {
    p(input) catch {
      Noparse => raise Failure(err + " expected")
      e => raise e
    }
  }
}

///|
/// One or more `p` separated by `sep`.
pub fn[X, A, S] listof(
  p : (X) -> (A, X) raise,
  sep : (X) -> (S, X) raise,
  err : String,
) -> (X) -> (List[A], X) raise {
  map(seq(p, many(map(seq(sep, fix(err, p)), pr => pr.1))), ht => {
    ht.1.prepend(ht.0)
  })
}

///|
pub fn[X, A] nothing(input : X) -> (List[A], X) {
  (@list.List([]), input)
}

///|
/// Zero or more `p` separated by `sep`.
pub fn[X, A, S] elistof(
  p : (X) -> (A, X) raise,
  sep : (X) -> (S, X) raise,
  err : String,
) -> (X) -> (List[A], X) raise {
  alt(listof(p, sep, err), i => nothing(i))
}

///|
/// Zero or one `p`.
pub fn[X, A] possibly(p : (X) -> (A, X) raise) -> (X) -> (List[A], X) raise {
  input => {
    let (x, rest) = p(input) catch {
      Noparse => return (@list.List([]), input)
      e => raise e
    }
    (@list.singleton(x), rest)
  }
}

///|
/// An item satisfying `pred`.
fn[I] some(
  pred : (I) -> Bool raise?,
) -> (ArrayView[I]) -> (I, ArrayView[I]) raise {
  input => {
    match input {
      [] => raise Noparse
      [h, .. t] => if pred(h) { (h, t) } else { raise Noparse }
    }
  }
}

///|
/// The item `tok`.
pub fn[I : Eq] a(tok : I) -> (ArrayView[I]) -> (I, ArrayView[I]) raise {
  some(item => item == tok)
}

///|
/// An item satisfying `pred` in a linked-list input (used by character parsers).
pub fn[I] some_list(
  pred : (I) -> Bool raise?,
) -> (List[I]) -> (I, List[I]) raise {
  input => {
    match input {
      Empty => raise Noparse
      More(h, tail=t) => if pred(h) { (h, t) } else { raise Noparse }
    }
  }
}

///|
/// The item `tok` in a linked-list input.
pub fn[I : Eq] a_list(tok : I) -> (List[I]) -> (I, List[I]) raise {
  some_list(item => item == tok)
}

///|
/// At least `n` occurrences of `p`.
pub fn[X, A] atleast(
  n : Int32,
  p : (X) -> (A, X) raise,
) -> (X) -> (List[A], X) raise {
  input => {
    let first = []
    let mut rest = input
    for _ in 0..<n {
      let (r, next) = p(rest)
      first.push(r)
      rest = next
    }
    let (more, rest1) = many(p)(rest)
    (@list.List(first).concat(more), rest1)
  }
}

///|
/// Succeeds only at the end of a linked-list input.
pub fn[I] finished_list(input : List[I]) -> (Int32, List[I]) raise {
  if input.is_empty() {
    (0, input)
  } else {
    raise Failure("Unparsed input")
  }
}
