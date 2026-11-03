///|
test "command replay: same shape and inputs, any file names" {
  replay_command(
    "cd <F1>; csdp <F2> <F3>> <F4>",
    [None, Some("problem\n"), None, None],
    3,
    [(2, "answer\n")],
  )
  file_of_string("/tmp/sos000000.dat-s", "problem\n")
  let cmd = "cd /tmp; csdp /tmp/sos000000.dat-s /tmp/sos000000.out> /dev/null"
  inspect(command_shape(cmd).0, content="cd <F1>; csdp <F2> <F3>> <F4>")
  inspect(sys_command(cmd), content="3")
  inspect(string_of_file("/tmp/sos000000.out"), content="answer")
  // other inputs: not answered
  file_of_string("/tmp/sos000000.dat-s", "another problem\n")
  inspect(sys_command(cmd), content="127")
}

///|
test "channels on in-memory files" {
  let oc = open_out("/tmp/chan.txt")
  output_string(oc, "p cnf 2 1\n")
  output_string(oc, "1 -2 0")
  output_char(oc, '\n')
  close_out(oc)
  let ic = open_in("/tmp/chan.txt")
  inspect(input_line(ic), content="p cnf 2 1")
  inspect(input_char(ic), content="1")
  inspect(input_line(ic), content=" -2 0")
  let end = try {
    ignore(input_line(ic))
    "more"
  } catch {
    EndOfFile => "End_of_file"
    _ => "other"
  }
  inspect(end, content="End_of_file")
  close_in(ic)
  @debug.debug_inspect(string_index_opt("a.b", '.'), content="Some(1)")
  @debug.debug_inspect(string_index_opt("ab", '.'), content="None")
  inspect(
    string_split_on_char(' ', "1 -2  0").to_array().join("|"),
    content="1|-2||0",
  )
  inspect(string_split_on_char(' ', "").to_array().length(), content="1")
}

///|
test "Str on Minisat's uses" {
  let blank = str_regexp("[ \n\t\r]")
  inspect(str_split(blank, " a  b c ").to_array().join("|"), content="a||b|c")
  inspect(str_split(blank, "").to_array().length(), content="0")
  let sat = str_regexp("SAT")
  inspect(str_search_forward(sat, "UNSAT SAT", 0L), content="2")
  inspect(str_search_forward(sat, "UNSAT SAT", 3L), content="6")
  inspect(str_search_backward(str_regexp("0"), "1 0 2 0", 7L), content="6")
  inspect(str_string_before("abcdef", 2L), content="ab")
  inspect(str_string_after("abcdef", 2L), content="cdef")
  let r = try {
    ignore(str_regexp("\\(a"))
    "made"
  } catch {
    Failure(m) => m
    _ => "refused"
  }
  inspect(r, content="\\( group not closed by \\)")
}

///|
test "command replay: file names inside the files" {
  replay_command(
    "solve <F1> > <F2>",
    [Some("c File <F1>\np cnf 1 1\n"), None],
    0,
    [(1, "read <F1>\n")],
  )
  file_of_string("/tmp/x7.cnf", "c File /tmp/x7.cnf\np cnf 1 1\n")
  inspect(sys_command("solve /tmp/x7.cnf > /tmp/x7.cnf.out"), content="0")
  inspect(string_of_file("/tmp/x7.cnf.out"), content="read /tmp/x7.cnf")
}

///|
test "Filename.quote" {
  inspect(filename_quote("a b"), content="'a b'")
  inspect(filename_quote("it's"), content="'it'\\''s'")
}

///|
test "Stream and Char.escaped" {
  let st = stream_of_string("a b")
  inspect(stream_peek(st) is None, content="false")
  inspect(stream_next(st), content="a")
  stream_junk(st)
  inspect(stream_next(st), content="b")
  inspect(stream_peek(st) is None, content="true")
  let r = try {
    ignore(stream_next(st))
    "more"
  } catch {
    StreamFailure => "Stream.Failure"
    _ => "other"
  }
  inspect(r, content="Stream.Failure")
  inspect(
    char_escaped('a') + char_escaped('\n') + char_escaped('\''),
    content="a\\n\\'",
  )
}

///|
test "strings_of_file" {
  file_of_string("/tmp/lines.txt", "a\n\nb\n")
  inspect(
    strings_of_file("/tmp/lines.txt").to_array().join("|"),
    content="a||b",
  )
  file_of_string("/tmp/lines.txt", "a\nb")
  inspect(strings_of_file("/tmp/lines.txt").to_array().join("|"), content="a|b")
}

///|
test "%.0f" {
  inspect(
    float_fixed0(0.5) + " " + float_fixed0(1.5) + " " + float_fixed0(2.5),
    content="0 2 2",
  )
  inspect(
    float_fixed0(12.49) + " " + float_fixed0(-3.7) + " " + float_fixed0(0.0),
    content="12 -4 0",
  )
}

///|
test "input_line preserves the raw offset after input_byte" {
  file_of_string("split_surrogate", "😀line\nnext")
  let ic = open_in("split_surrogate")
  assert_eq(input_byte(ic), 0xD83DL)
  let line = input_line(ic)
  assert_eq(line.length(), 5)
  assert_eq(line[0], 0xDE00)
  assert_eq(line[1], 'l')
  assert_eq(input_line(ic), "next")
}
