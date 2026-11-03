// ===========================================================================
// A port of the core of OCaml 4.14's `Format` pretty-printing engine
// (stdlib/format.ml), so that HOL Light's printer output matches upstream
// byte for byte: the same token queue, scan stack, box kinds, margins,
// maximum indentation and box-depth ellipsis.
//
// Not ported: tabulation boxes, semantic tags and printf-style formats
// (HOL Light's printer uses none of them).
// ===========================================================================

///|
/// Box kinds (`Pp_fits` is internal: a box that fits on the line).
priv enum BoxType {
  HBox
  VBox
  HVBox
  HOVBox
  Box
  Fits
}

///|
priv enum Token {
  Text(String)
  Break(String, Int32, String, String, Int32, String) // fits, breaks
  Begin(Int32, BoxType)
  End
  Newline
  IfNewline
}

///|
priv struct QueueElem {
  mut size : Int32 // negative while unknown
  token : Token
  length : Int32
}

///|
priv struct ScanElem {
  left_total : Int32
  queue_elem : QueueElem
}

///|
priv struct FormatElem {
  box_type : BoxType
  width : Int32
}

///|
/// A pretty-printer instance (OCaml's `formatter`).
pub struct Formatter {
  priv scan_stack : Array[ScanElem]
  priv format_stack : Array[FormatElem]
  priv mut margin : Int32
  priv mut min_space_left : Int32
  priv mut max_indent : Int32
  priv mut space_left : Int32
  priv mut current_indent : Int32
  priv mut is_new_line : Bool
  priv mut left_total : Int32
  priv mut right_total : Int32
  priv mut curr_depth : Int32
  priv mut max_boxes : Int32
  priv mut ellipsis : String
  priv out_string : (String) -> Unit
  priv out_flush : () -> Unit
  priv queue : Array[QueueElem]
  priv mut queue_head : Int32
}

///|
let pp_infinity = 1000000010

///|
let max_int = 2147483647

///|
/// Length of a string in bytes, as OCaml's `String.length` on its UTF-8
/// encoding.
fn byte_length(s : String) -> Int32 {
  let mut n = 0
  let len = s.length()
  let mut i = 0
  while i < len {
    let u = s.code_unit_at(i).to_int()
    if u < 0x80 {
      n += 1
    } else if u < 0x800 {
      n += 2
    } else if u >= 0xD800 && u < 0xDC00 && i + 1 < len {
      n += 4
      i += 1
    } else {
      n += 3
    }
    i += 1
  }
  n
}

///|
fn Formatter::enqueue(self : Formatter, elem : QueueElem) -> Unit {
  self.right_total += elem.length
  self.queue.push(elem)
}

///|
fn Formatter::queue_peek(self : Formatter) -> QueueElem? {
  if self.queue_head < self.queue.length() {
    Some(self.queue[self.queue_head])
  } else {
    None
  }
}

///|
fn Formatter::queue_take(self : Formatter) -> QueueElem? {
  if self.queue_head < self.queue.length() {
    let e = self.queue[self.queue_head]
    self.queue_head += 1
    if self.queue_head == self.queue.length() {
      self.queue.clear()
      self.queue_head = 0
    } else if self.queue_head >= 1024 &&
      self.queue_head * 2 >= self.queue.length() {
      // Release consumed entries so long streams do not accumulate them.
      let rest = self.queue[self.queue_head:].to_owned()
      self.queue.clear()
      self.queue.append(rest)
      self.queue_head = 0
    }
    Some(e)
  } else {
    None
  }
}

///|
fn Formatter::clear_queue(self : Formatter) -> Unit {
  self.left_total = 1
  self.right_total = 1
  self.queue.clear()
  self.queue_head = 0
}

///|
fn Formatter::output_string(self : Formatter, s : String) -> Unit {
  (self.out_string)(s)
}

///|
fn Formatter::output_newline(self : Formatter) -> Unit {
  (self.out_string)("\n")
}

///|
fn Formatter::output_spaces(self : Formatter, n : Int32) -> Unit {
  if n > 0 {
    (self.out_string)(" ".repeat(n))
  }
}

///|
fn Formatter::format_pp_text(
  self : Formatter,
  size : Int32,
  text : String,
) -> Unit {
  self.space_left -= size
  self.output_string(text)
  self.is_new_line = false
}

///|
fn Formatter::format_string(self : Formatter, s : String) -> Unit {
  if s != "" {
    self.format_pp_text(byte_length(s), s)
  }
}

///|
fn Formatter::break_new_line(
  self : Formatter,
  before : String,
  offset : Int32,
  after : String,
  width : Int32,
) -> Unit {
  self.format_string(before)
  self.output_newline()
  self.is_new_line = true
  let indent = self.margin - width + offset
  let real_indent = if self.max_indent < indent {
    self.max_indent
  } else {
    indent
  }
  self.current_indent = real_indent
  self.space_left = self.margin - self.current_indent
  self.output_spaces(self.current_indent)
  self.format_string(after)
}

///|
fn Formatter::break_line(self : Formatter, width : Int32) -> Unit {
  self.break_new_line("", 0, "", width)
}

///|
fn Formatter::break_same_line(
  self : Formatter,
  before : String,
  width : Int32,
  after : String,
) -> Unit {
  self.format_string(before)
  self.space_left -= width
  self.output_spaces(width)
  self.format_string(after)
}

///|
fn Formatter::force_break_line(self : Formatter) -> Unit {
  match self.format_stack.last() {
    None => self.output_newline()
    Some({ box_type, width, }) =>
      if width > self.space_left {
        match box_type {
          Fits | HBox => ()
          VBox | HVBox | HOVBox | Box => self.break_line(width)
        }
      }
  }
}

///|
fn Formatter::skip_token(self : Formatter) -> Unit {
  match self.queue_take() {
    None => ()
    Some({ size, length, .. }) => {
      self.left_total -= length
      self.space_left += size
    }
  }
}

///|
fn Formatter::format_pp_token(
  self : Formatter,
  size : Int32,
  token : Token,
) -> Unit {
  match token {
    Text(s) => self.format_pp_text(size, s)
    Begin(off, ty) => {
      let insertion_point = self.margin - self.space_left
      if insertion_point > self.max_indent {
        self.force_break_line()
      }
      let width = self.space_left - off
      let box_type = match ty {
        VBox => VBox
        _ => if size > self.space_left { ty } else { Fits }
      }
      self.format_stack.push({ box_type, width, })
    }
    End => ignore(self.format_stack.pop())
    Newline =>
      match self.format_stack.last() {
        None => self.output_newline()
        Some({ width, .. }) => self.break_line(width)
      }
    IfNewline =>
      if self.current_indent != self.margin - self.space_left {
        self.skip_token()
      }
    Break(fb, fw, fa, bb, boff, ba) =>
      match self.format_stack.last() {
        None => ()
        Some({ box_type, width, }) =>
          match box_type {
            HOVBox =>
              if size + byte_length(bb) > self.space_left {
                self.break_new_line(bb, boff, ba, width)
              } else {
                self.break_same_line(fb, fw, fa)
              }
            Box =>
              if self.is_new_line {
                self.break_same_line(fb, fw, fa)
              } else if size + byte_length(bb) > self.space_left {
                self.break_new_line(bb, boff, ba, width)
              } else if self.current_indent > self.margin - width + boff {
                self.break_new_line(bb, boff, ba, width)
              } else {
                self.break_same_line(fb, fw, fa)
              }
            HVBox => self.break_new_line(bb, boff, ba, width)
            Fits => self.break_same_line(fb, fw, fa)
            VBox => self.break_new_line(bb, boff, ba, width)
            HBox => self.break_same_line(fb, fw, fa)
          }
      }
  }
}

///|
fn Formatter::advance_left(self : Formatter) -> Unit {
  while self.queue_peek() is Some({ size, token, length, }) {
    let pending_count = self.right_total - self.left_total
    if size >= 0 || pending_count >= self.space_left {
      ignore(self.queue_take())
      let size = if size >= 0 { size } else { pp_infinity }
      self.format_pp_token(size, token)
      self.left_total = length + self.left_total
    } else {
      break
    }
  }
}

///|
fn Formatter::enqueue_advance(self : Formatter, elem : QueueElem) -> Unit {
  self.enqueue(elem)
  self.advance_left()
}

///|
fn Formatter::enqueue_string_as(
  self : Formatter,
  size : Int32,
  s : String,
) -> Unit {
  self.enqueue_advance({ size, token: Text(s), length: size, })
}

///|
fn initialize_scan_stack(stack : Array[ScanElem]) -> Unit {
  stack.clear()
  let queue_elem = { size: -1, token: Text(""), length: 0, }
  stack.push({ left_total: -1, queue_elem, })
}

///|
fn Formatter::set_size(self : Formatter, ty : Bool) -> Unit {
  match self.scan_stack.last() {
    None => ()
    Some({ left_total, queue_elem, }) => {
      let size = queue_elem.size
      if left_total < self.left_total {
        initialize_scan_stack(self.scan_stack)
      } else {
        match queue_elem.token {
          Break(_) =>
            if ty {
              queue_elem.size = self.right_total + size
              ignore(self.scan_stack.pop())
            }
          Begin(_) =>
            if !ty {
              queue_elem.size = self.right_total + size
              ignore(self.scan_stack.pop())
            }
          _ => ()
        }
      }
    }
  }
}

///|
fn Formatter::scan_push(self : Formatter, b : Bool, elem : QueueElem) -> Unit {
  self.enqueue(elem)
  if b {
    self.set_size(true)
  }
  self.scan_stack.push({ left_total: self.right_total, queue_elem: elem, })
}

///|
fn Formatter::open_box_gen(
  self : Formatter,
  indent : Int32,
  ty : BoxType,
) -> Unit {
  self.curr_depth += 1
  if self.curr_depth < self.max_boxes {
    let elem = { size: -self.right_total, token: Begin(indent, ty), length: 0, }
    self.scan_push(false, elem)
  } else if self.curr_depth == self.max_boxes {
    self.enqueue_string_as(byte_length(self.ellipsis), self.ellipsis)
  }
}

///|
fn Formatter::open_sys_box(self : Formatter) -> Unit {
  self.open_box_gen(0, HOVBox)
}

///|
pub fn Formatter::close_box(self : Formatter) -> Unit {
  if self.curr_depth > 1 {
    if self.curr_depth < self.max_boxes {
      self.enqueue({ size: 0, token: End, length: 0, })
      self.set_size(true)
      self.set_size(false)
    }
    self.curr_depth -= 1
  }
}

///|
fn Formatter::rinit(self : Formatter) -> Unit {
  self.clear_queue()
  initialize_scan_stack(self.scan_stack)
  self.format_stack.clear()
  self.current_indent = 0
  self.curr_depth = 0
  self.space_left = self.margin
  self.open_sys_box()
}

///|
fn Formatter::flush_queue(self : Formatter, b : Bool) -> Unit {
  while self.curr_depth > 1 {
    self.close_box()
  }
  self.right_total = pp_infinity
  self.advance_left()
  if b {
    self.output_newline()
  }
  self.rinit()
}

///|
/// Print a string whose width is taken to be `size`.
pub fn Formatter::print_as(self : Formatter, size : Int32, s : String) -> Unit {
  if self.curr_depth < self.max_boxes {
    self.enqueue_string_as(size, s)
  }
}

///|
pub fn Formatter::print_string(self : Formatter, s : String) -> Unit {
  self.print_as(byte_length(s), s)
}

///|
pub fn Formatter::print_int(self : Formatter, i : Int32) -> Unit {
  self.print_string(i.to_string())
}

///|
pub fn Formatter::open_hbox(self : Formatter) -> Unit {
  self.open_box_gen(0, HBox)
}

///|
pub fn Formatter::open_vbox(self : Formatter, indent : Int32) -> Unit {
  self.open_box_gen(indent, VBox)
}

///|
pub fn Formatter::open_hvbox(self : Formatter, indent : Int32) -> Unit {
  self.open_box_gen(indent, HVBox)
}

///|
pub fn Formatter::open_hovbox(self : Formatter, indent : Int32) -> Unit {
  self.open_box_gen(indent, HOVBox)
}

///|
pub fn Formatter::open_box(self : Formatter, indent : Int32) -> Unit {
  self.open_box_gen(indent, Box)
}

///|
/// Flush pending output and print a newline.
pub fn Formatter::print_newline(self : Formatter) -> Unit {
  self.flush_queue(true)
  (self.out_flush)()
}

///|
/// Flush pending output.
pub fn Formatter::print_flush(self : Formatter) -> Unit {
  self.flush_queue(false)
  (self.out_flush)()
}

///|
pub fn Formatter::force_newline(self : Formatter) -> Unit {
  if self.curr_depth < self.max_boxes {
    self.enqueue_advance({ size: 0, token: Newline, length: 0, })
  }
}

///|
pub fn Formatter::print_if_newline(self : Formatter) -> Unit {
  if self.curr_depth < self.max_boxes {
    self.enqueue_advance({ size: 0, token: IfNewline, length: 0, })
  }
}

///|
/// A break hint: `width` spaces if the line is not broken, otherwise a
/// newline with `offset` added to the box indentation.
pub fn Formatter::print_break(
  self : Formatter,
  width : Int32,
  offset : Int32,
) -> Unit {
  if self.curr_depth < self.max_boxes {
    let elem = {
      size: -self.right_total,
      token: Break("", width, "", "", offset, ""),
      length: width,
    }
    self.scan_push(true, elem)
  }
}

///|
pub fn Formatter::print_space(self : Formatter) -> Unit {
  self.print_break(1, 0)
}

///|
pub fn Formatter::print_cut(self : Formatter) -> Unit {
  self.print_break(0, 0)
}

///|
pub fn Formatter::set_max_boxes(self : Formatter, n : Int32) -> Unit {
  if n > 1 {
    self.max_boxes = n
  }
}

///|
pub fn Formatter::get_max_boxes(self : Formatter) -> Int32 {
  self.max_boxes
}

///|
pub fn Formatter::set_ellipsis_text(self : Formatter, s : String) -> Unit {
  self.ellipsis = s
}

///|
fn pp_limit(n : Int32) -> Int32 {
  if n < pp_infinity {
    n
  } else {
    pp_infinity - 1
  }
}

///|
pub fn Formatter::set_min_space_left(self : Formatter, n : Int32) -> Unit {
  if n >= 1 {
    let n = pp_limit(n)
    self.min_space_left = n
    self.max_indent = self.margin - self.min_space_left
    self.rinit()
  }
}

///|
pub fn Formatter::set_max_indent(self : Formatter, n : Int32) -> Unit {
  if n > 1 {
    self.set_min_space_left(self.margin - n)
  }
}

///|
pub fn Formatter::get_max_indent(self : Formatter) -> Int32 {
  self.max_indent
}

///|
pub fn Formatter::set_margin(self : Formatter, n : Int32) -> Unit {
  if n >= 1 {
    let n = pp_limit(n)
    self.margin = n
    let new_max_indent = if self.max_indent <= self.margin {
      self.max_indent
    } else {
      let a = self.margin - self.min_space_left
      let b = self.margin / 2
      let m = if a > b { a } else { b }
      if m > 1 {
        m
      } else {
        1
      }
    }
    self.set_max_indent(new_max_indent)
  }
}

///|
pub fn Formatter::get_margin(self : Formatter) -> Int32 {
  self.margin
}

///|
/// A formatter writing through `out_string` (OCaml's `make_formatter`).
pub fn Formatter::new(
  out_string : (String) -> Unit,
  out_flush~ : () -> Unit = () => (),
) -> Formatter {
  let sys_tok = { size: -1, token: Begin(0, HOVBox), length: 0, }
  let scan_stack = []
  initialize_scan_stack(scan_stack)
  scan_stack.push({ left_total: 1, queue_elem: sys_tok, })
  let margin = 78
  let min_space_left = 10
  {
    scan_stack,
    format_stack: [],
    margin,
    min_space_left,
    max_indent: margin - min_space_left,
    space_left: margin,
    current_indent: 0,
    is_new_line: true,
    left_total: 1,
    right_total: 1,
    curr_depth: 1,
    max_boxes: max_int,
    ellipsis: ".",
    out_string,
    out_flush,
    queue: [sys_tok],
    queue_head: 0,
  }
}

///|
/// A formatter writing into a string buffer (OCaml's `formatter_of_buffer`).
pub fn formatter_of_buffer(buf : StringBuilder) -> Formatter {
  Formatter::new(s => buf.write_string(s))
}

///|
let stdout_pending : StringBuilder = StringBuilder()

///|
/// Where complete lines of standard output go (`println` by default; tests
/// capture them).
pub let stdout_sink : Ref[(String) -> Unit] = Ref::{ val: s => println(s), }

///|
/// While set, lines of standard output are held back. On wasm, writing to
/// standard output inside `fn init` traps, so theories hold their load-time
/// output (remarks, warnings) while they load. The held-back lines go to
/// `stdout_sink` before the next line of output or `print_flush` on
/// `std_formatter`; a program that prints by other means first should call
/// `flush_stdout_backlog()` at startup.
pub let defer_stdout : Ref[Bool] = Ref::{ val: false, }

///|
let stdout_backlog : Array[String] = []

///|
/// The number of lines held back so far.
pub fn stdout_backlog_length() -> Int32 {
  stdout_backlog.length()
}

///|
/// The held-back lines from index `start` on.
pub fn stdout_backlog_since(start : Int32) -> Array[String] {
  stdout_backlog[start:].to_owned()
}

///|
/// Send the held-back load-time output to `stdout_sink` now.
pub fn flush_stdout_backlog() -> Unit {
  if !defer_stdout.val && !stdout_backlog.is_empty() {
    let lines = stdout_backlog.copy()
    stdout_backlog.clear()
    for line in lines {
      (stdout_sink.val)(line)
    }
  }
}

///|
fn emit_stdout_line(s : String) -> Unit {
  if defer_stdout.val {
    stdout_backlog.push(s)
  } else {
    flush_stdout_backlog()
    (stdout_sink.val)(s)
  }
}

///|
/// Standard output can only be written line by line (`println`), so
/// complete lines are emitted as soon as they are formatted.
fn stdout_write(s : String) -> Unit {
  for c in s {
    if c == '\n' {
      emit_stdout_line(stdout_pending.to_string())
      stdout_pending.reset()
    } else {
      stdout_pending.write_char(c)
    }
  }
}

///|
/// Flush standard output. Output is line-based (`println`), so a partial
/// line stays pending until its newline arrives (OCaml would show it now);
/// `flush_stdout_partial` forces it out. Known differences: a pending
/// partial line is lost if the program ends without printing a newline or
/// calling `flush_stdout_partial`, and a direct `println` overtakes it.
fn stdout_flush() -> Unit {
  flush_stdout_backlog()
}

///|
/// Emit a pending partial line of standard output (with a newline).
pub fn flush_stdout_partial() -> Unit {
  flush_stdout_backlog()
  if !stdout_pending.is_empty() {
    emit_stdout_line(stdout_pending.to_string())
    stdout_pending.reset()
  }
}

///|
/// OCaml's `print_string`: write to the standard output channel, which
/// `std_formatter` also writes to, without going through the formatter.
pub fn print_string(s : String) -> Unit {
  stdout_write(s)
}

///|
/// The formatter on standard output (OCaml's `std_formatter`). Output is
/// emitted line by line: a partial line waits for its newline (see
/// `stdout_flush` and `flush_stdout_partial`).
pub let std_formatter : Formatter = Formatter::new(
  stdout_write,
  out_flush=stdout_flush,
)

///|
/// Number of entries held by the token queue (consumed or pending); for
/// tests.
pub fn Formatter::queue_length(self : Formatter) -> Int32 {
  self.queue.length()
}
