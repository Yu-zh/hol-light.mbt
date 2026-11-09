///|
pub(all) enum Token {
  LIDENT(String)
  UIDENT(String)
  RAWIDENT(String)
  VERBATIM(String)
  INT(String)
  INFIX1(String)
  INFIX3(String)
  DOT_LIDENT(String)
  TRUE
  FALSE
  IF
  ELSE
  FN
  MATCH
  ENUM
  STRUCT
  FORALL
  EXISTS
  IMPLIES
  BARBAR
  BAR
  AMPERAMPER
  PLUS
  MINUS
  STAR
  EXCLAMATION
  LPAREN
  RPAREN
  LBRACKET
  RBRACKET
  LBRACE
  RBRACE
  COMMA
  COLON
  SEMI
  FAT_ARROW
  THIN_ARROW
  UNDERSCORE
  EOF
} derive(Debug)

///|
#deprecated("Use Debug::to_repr instead")
#doc(hidden)
pub extend Token with Debug::{to_repr}

///|
pub fn Token::kind(self : Token) -> TokenKind {
  match self {
    LIDENT(_) => TK_LIDENT
    UIDENT(_) => TK_UIDENT
    RAWIDENT(_) => TK_RAWIDENT
    VERBATIM(_) => TK_VERBATIM
    INT(_) => TK_INT
    INFIX1(_) => TK_INFIX1
    INFIX3(_) => TK_INFIX3
    DOT_LIDENT(_) => TK_DOT_LIDENT
    TRUE => TK_TRUE
    FALSE => TK_FALSE
    IF => TK_IF
    ELSE => TK_ELSE
    FN => TK_FN
    MATCH => TK_MATCH
    ENUM => TK_ENUM
    STRUCT => TK_STRUCT
    FORALL => TK_FORALL
    EXISTS => TK_EXISTS
    IMPLIES => TK_IMPLIES
    BARBAR => TK_BARBAR
    BAR => TK_BAR
    AMPERAMPER => TK_AMPERAMPER
    PLUS => TK_PLUS
    MINUS => TK_MINUS
    STAR => TK_STAR
    EXCLAMATION => TK_EXCLAMATION
    LPAREN => TK_LPAREN
    RPAREN => TK_RPAREN
    LBRACKET => TK_LBRACKET
    RBRACKET => TK_RBRACKET
    LBRACE => TK_LBRACE
    RBRACE => TK_RBRACE
    COMMA => TK_COMMA
    COLON => TK_COLON
    SEMI => TK_SEMI
    FAT_ARROW => TK_FAT_ARROW
    THIN_ARROW => TK_THIN_ARROW
    UNDERSCORE => TK_UNDERSCORE
    EOF => TK_EOF
  }
}

///|
pub(all) enum TokenKind {
  TK_LIDENT
  TK_UIDENT
  TK_RAWIDENT
  TK_VERBATIM
  TK_INT
  TK_INFIX1
  TK_INFIX3
  TK_DOT_LIDENT
  TK_TRUE
  TK_FALSE
  TK_IF
  TK_ELSE
  TK_FN
  TK_MATCH
  TK_ENUM
  TK_STRUCT
  TK_FORALL
  TK_EXISTS
  TK_IMPLIES
  TK_BARBAR
  TK_BAR
  TK_AMPERAMPER
  TK_PLUS
  TK_MINUS
  TK_STAR
  TK_EXCLAMATION
  TK_LPAREN
  TK_RPAREN
  TK_LBRACKET
  TK_RBRACKET
  TK_LBRACE
  TK_RBRACE
  TK_COMMA
  TK_COLON
  TK_SEMI
  TK_FAT_ARROW
  TK_THIN_ARROW
  TK_UNDERSCORE
  TK_EOF
}

///|
#deprecated("Use Show::output or Show::to_string instead")
#doc(hidden)
pub extend TokenKind with Show::{output, to_string}

///|
pub impl Show for TokenKind with fn output(self, logger) {
  Logger::write_string(
    logger,
    match self {
      TK_LIDENT => "LIDENT"
      TK_UIDENT => "UIDENT"
      TK_RAWIDENT => "RAWIDENT"
      TK_VERBATIM => "VERBATIM"
      TK_INT => "INT"
      TK_INFIX1 => "INFIX1"
      TK_INFIX3 => "INFIX3"
      TK_DOT_LIDENT => "DOT_LIDENT"
      TK_TRUE => "\"true\""
      TK_FALSE => "\"false\""
      TK_IF => "\"if\""
      TK_ELSE => "\"else\""
      TK_FN => "\"fn\""
      TK_MATCH => "\"match\""
      TK_ENUM => "\"enum\""
      TK_STRUCT => "\"struct\""
      TK_FORALL => "\"∀\""
      TK_EXISTS => "\"∃\""
      TK_IMPLIES => "\"→\""
      TK_BARBAR => "\"||\""
      TK_BAR => "\"|\""
      TK_AMPERAMPER => "\"&&\""
      TK_PLUS => "\"+\""
      TK_MINUS => "\"-\""
      TK_STAR => "\"*\""
      TK_EXCLAMATION => "\"!\""
      TK_LPAREN => "\"(\""
      TK_RPAREN => "\")\""
      TK_LBRACKET => "\"[\""
      TK_RBRACKET => "\"]\""
      TK_LBRACE => "\"{\""
      TK_RBRACE => "\"}\""
      TK_COMMA => "\",\""
      TK_COLON => "\":\""
      TK_SEMI => "\";\""
      TK_FAT_ARROW => "\"=>\""
      TK_THIN_ARROW => "\"->\""
      TK_UNDERSCORE => "\"_\""
      TK_EOF => "EOF"
    }
  )
}

///|
#deprecated("Use Debug::to_repr instead")
#doc(hidden)
pub extend TokenKind with Debug::{to_repr}

///|
pub impl Debug for TokenKind with fn to_repr(self) {
  match self {
    TK_LIDENT => Repr("LIDENT")
    TK_UIDENT => Repr("UIDENT")
    TK_RAWIDENT => Repr("RAWIDENT")
    TK_VERBATIM => Repr("VERBATIM")
    TK_INT => Repr("INT")
    TK_INFIX1 => Repr("INFIX1")
    TK_INFIX3 => Repr("INFIX3")
    TK_DOT_LIDENT => Repr("DOT_LIDENT")
    TK_TRUE => Repr("true")
    TK_FALSE => Repr("false")
    TK_IF => Repr("if")
    TK_ELSE => Repr("else")
    TK_FN => Repr("fn")
    TK_MATCH => Repr("match")
    TK_ENUM => Repr("enum")
    TK_STRUCT => Repr("struct")
    TK_FORALL => Repr("∀")
    TK_EXISTS => Repr("∃")
    TK_IMPLIES => Repr("→")
    TK_BARBAR => Repr("||")
    TK_BAR => Repr("|")
    TK_AMPERAMPER => Repr("&&")
    TK_PLUS => Repr("+")
    TK_MINUS => Repr("-")
    TK_STAR => Repr("*")
    TK_EXCLAMATION => Repr("!")
    TK_LPAREN => Repr("(")
    TK_RPAREN => Repr(")")
    TK_LBRACKET => Repr("[")
    TK_RBRACKET => Repr("]")
    TK_LBRACE => Repr("{")
    TK_RBRACE => Repr("}")
    TK_COMMA => Repr(",")
    TK_COLON => Repr(":")
    TK_SEMI => Repr(";")
    TK_FAT_ARROW => Repr("=>")
    TK_THIN_ARROW => Repr("->")
    TK_UNDERSCORE => Repr("_")
    TK_EOF => Repr("EOF")
  }
}

///|
pub suberror ParseError {
  UnexpectedToken(Token, (Int, Int), Array[TokenKind])
  UnexpectedEndOfInput(Int, Array[TokenKind])
} derive(Debug)

///|
#deprecated("Use Debug::to_repr instead")
#doc(hidden)
pub extend ParseError with Debug::{to_repr}

///|
type YYObj = Error

///|
priv suberror YYObj_Void

///|
priv suberror YYObj_Option_Unit_ {
  YYObj_Option_Unit_(Option[Unit])
}

///|
priv suberror YYObj_String {
  YYObj_String(String)
}

///|
priv suberror YYObj__list_List_String_ {
  YYObj__list_List_String_(@list.List[String])
}

///|
priv suberror YYObj__list_List__preterm_Preterm_ {
  YYObj__list_List__preterm_Preterm_(@list.List[@preterm.Preterm])
}

///|
priv suberror YYObj__list_List__preterm_Pretype_ {
  YYObj__list_List__preterm_Pretype_(@list.List[@preterm.Pretype])
}

///|
priv suberror YYObj__list_List__String___list_List__preterm_Pretype___ {
  YYObj__list_List__String___list_List__preterm_Pretype___(
    @list.List[(String, @list.List[@preterm.Pretype])]
  )
}

///|
priv suberror YYObj__list_List__String___preterm_Pretype__ {
  YYObj__list_List__String___preterm_Pretype__(
    @list.List[(String, @preterm.Pretype)]
  )
}

///|
priv suberror YYObj__list_List__String___preterm_Pretype___ {
  YYObj__list_List__String___preterm_Pretype___(
    @list.List[(String, @preterm.Pretype?)]
  )
}

///|
priv suberror YYObj__list_List__String__String___list_List__String___list_List__preterm_Pretype_____ {
  YYObj__list_List__String__String___list_List__String___list_List__preterm_Pretype_____(
    @list.List[
      (String, String, @list.List[(String, @list.List[@preterm.Pretype])])
    ]
  )
}

///|
priv suberror YYObj__preterm_Preterm {
  YYObj__preterm_Preterm(@preterm.Preterm)
}

///|
priv suberror YYObj__preterm_Pretype {
  YYObj__preterm_Pretype(@preterm.Pretype)
}

///|
priv suberror YYObj__String___list_List__preterm_Pretype__ {
  YYObj__String___list_List__preterm_Pretype__(
    (String, @list.List[@preterm.Pretype])
  )
}

///|
priv suberror YYObj__String___preterm_Pretype_ {
  YYObj__String___preterm_Pretype_((String, @preterm.Pretype))
}

///|
priv suberror YYObj__String__String___list_List__String___list_List__preterm_Pretype____ {
  YYObj__String__String___list_List__String___list_List__preterm_Pretype____(
    (String, String, @list.List[(String, @list.List[@preterm.Pretype])])
  )
}

///|
priv suberror YYObj__String__String___list_List__String___preterm_Pretype___ {
  YYObj__String__String___list_List__String___preterm_Pretype___(
    (String, String, @list.List[(String, @preterm.Pretype)])
  )
}

///|
type YYState = ((YYSymbol) -> YYDecision)

///|
type YYAction = ((Int, ArrayView[(YYObj, Int, Int)]) -> YYObj)

///|
priv enum YYDecision {
  Accept
  Shift(YYState)
  Reduce(Int, YYSymbol, YYAction)
  ReduceNoLookahead(Int, YYSymbol, YYAction)
  Error
}

///|
priv enum YYSymbol {
  T_LIDENT
  T_UIDENT
  T_RAWIDENT
  T_VERBATIM
  T_INT
  T_INFIX1
  T_INFIX3
  T_DOT_LIDENT
  T_TRUE
  T_FALSE
  T_IF
  T_ELSE
  T_FN
  T_MATCH
  T_ENUM
  T_STRUCT
  T_FORALL
  T_EXISTS
  T_IMPLIES
  T_BARBAR
  T_BAR
  T_AMPERAMPER
  T_PLUS
  T_MINUS
  T_STAR
  T_EXCLAMATION
  T_LPAREN
  T_RPAREN
  T_LBRACKET
  T_RBRACKET
  T_LBRACE
  T_RBRACE
  T_COMMA
  T_COLON
  T_SEMI
  T_FAT_ARROW
  T_THIN_ARROW
  T_UNDERSCORE
  T_EOF
  NT_term
  NT_pretype
  NT_type_definition
  NT_enum_decls
  NT_enum_decl
  NT_enum_constructors
  NT_enum_constructor
  NT_constructor_name
  NT_record_definition
  NT_struct_fields
  NT_struct_field
  NT_expr
  NT_block_expr
  NT_if_expr
  NT_quantifier_expr
  NT_quantifier_body_expr
  NT_arrow_fn_expr
  NT_arrow_fn_prefix
  NT_arrow_fn_prefix_no_constraint
  NT_infix_expr
  NT_prefix_expr
  NT_tuple_expr
  NT_non_empty_tuple_elems
  NT_non_empty_tuple_elems_with_prefix
  NT_simple_expr
  NT_atomic_expr
  NT_match_arms
  NT_match_arm
  NT_set_binder
  NT_simple_type
  NT_optional_type_arguments
  NT_type_
  NT_option_SEMI_
  NT_non_empty_list_commas_type__
  NT_list_commas_expr_
  NT_non_empty_list_commas_expr_
  NT_non_empty_list_commas_set_binder_
  NT_non_empty_list_commas_rev_type__
  NT_option_COMMA_
  NT_non_empty_list_commas_rev_expr_
  NT_non_empty_list_commas_rev_set_binder_
  EOI
}

///|
// Workaround for EOI unused warning
fn init {
  match (EOI : YYSymbol) {
    EOI => ()
    _ => ()
  }
}

///|
// file:///./grammar.mbty
// 74|    expr EOF { $1 }
fn yy_action_0(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  YYObj__preterm_Preterm(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./grammar.mbty
// 226|    "match" infix_expr "{" match_arms "}" { match_cases($2, $4) }
fn yy_action_1(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj__preterm_Preterm(_dollar2)
  guard! _args[3].0 is YYObj__list_List__preterm_Preterm_(_dollar4)
  YYObj__preterm_Preterm(
    ({();  match_cases(_dollar2, _dollar4) 
    })
  )
}

///|
// file:///./grammar.mbty
// 225|    "fn" "{" match_arms "}" { function($3) }
fn yy_action_2(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[2].0 is YYObj__list_List__preterm_Preterm_(_dollar3)
  YYObj__preterm_Preterm(
    ({();  function(_dollar3) 
    })
  )
}

///|
// file:///./grammar.mbty
// 241|    match_arm option(";") { @list.singleton($1) }
fn yy_action_3(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  YYObj__list_List__preterm_Preterm_(
    ({();  @list.singleton(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 246|    infix_expr "=>" expr { clause($1, None, $3) }
fn yy_action_4(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Preterm(_dollar3)
  YYObj__preterm_Preterm(
    ({();  clause(_dollar1, None, _dollar3) 
    })
  )
}

///|
// file:///./grammar.mbty
// 247|    infix_expr "if" infix_expr "=>" expr { clause($1, Some($3), $5) }
fn yy_action_5(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Preterm(_dollar3)
  guard! _args[4].0 is YYObj__preterm_Preterm(_dollar5)
  YYObj__preterm_Preterm(
    ({();  clause(_dollar1, Some(_dollar3), _dollar5) 
    })
  )
}

///|
// file:///./grammar.mbty
// 221|    "{" "}" { pconst("EMPTY") }
fn yy_action_6(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  YYObj__preterm_Preterm(
    ({();  pconst("EMPTY") 
    })
  )
}

///|
// file:///./grammar.mbty
// 222|    "{" non_empty_list_commas(expr) "}" { set_enum($2) }
fn yy_action_7(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj__list_List__preterm_Preterm_(_dollar2)
  YYObj__preterm_Preterm(
    ({();  set_enum(_dollar2) 
    })
  )
}

///|
// file:///./grammar.mbty
// 223|    "{" expr "|" expr "}" { set_abs($2, $4) }
fn yy_action_8(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj__preterm_Preterm(_dollar2)
  guard! _args[3].0 is YYObj__preterm_Preterm(_dollar4)
  YYObj__preterm_Preterm(
    ({();  set_abs(_dollar2, _dollar4) 
    })
  )
}

///|
// file:///./grammar.mbty
// 224|    "{" expr "|" non_empty_list_commas(set_binder) "|" expr "}" { set_compr($2, $4, $6) }
fn yy_action_9(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj__preterm_Preterm(_dollar2)
  guard! _args[3].0 is YYObj__list_List__String___preterm_Pretype__(_dollar4)
  guard! _args[5].0 is YYObj__preterm_Preterm(_dollar6)
  YYObj__preterm_Preterm(
    ({();  set_compr(_dollar2, _dollar4, _dollar6) 
    })
  )
}

///|
// file:///./grammar.mbty
// 268|    non_empty_list_commas_rev(X) option(",") { $1.rev() }
fn yy_action_10(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__list_List__String___preterm_Pretype__(_dollar1)
  YYObj__list_List__String___preterm_Pretype__(
    ({();  _dollar1.rev() 
    })
  )
}

///|
// file:///./grammar.mbty
// 251|    binder ":" type_ { ($1, $3) }
fn yy_action_12(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_11(_last_pos, _args[0:1])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Pretype(_dollar3)
  YYObj__String___preterm_Pretype_(
    ({();  (_dollar1, _dollar3) 
    })
  )
}

///|
// file:///./grammar.mbty
// 251|    binder ":" type_ { ($1, $3) }
fn yy_action_14(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_13(_last_pos, _args[0:1])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Pretype(_dollar3)
  YYObj__String___preterm_Pretype_(
    ({();  (_dollar1, _dollar3) 
    })
  )
}

///|
// file:///./grammar.mbty
// 251|    binder ":" type_ { ($1, $3) }
fn yy_action_16(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_15(_last_pos, _args[0:1])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Pretype(_dollar3)
  YYObj__String___preterm_Pretype_(
    ({();  (_dollar1, _dollar3) 
    })
  )
}

///|
// file:///./grammar.mbty
// 251|    binder ":" type_ { ($1, $3) }
fn yy_action_18(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_17(_last_pos, _args[0:1])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Pretype(_dollar3)
  YYObj__String___preterm_Pretype_(
    ({();  (_dollar1, _dollar3) 
    })
  )
}

///|
// file:///./grammar.mbty
// 264|    non_empty_list_commas_rev(X) "," X { $1.prepend($3) }
fn yy_action_19(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__list_List__String___preterm_Pretype__(_dollar1)
  guard! _args[2].0 is YYObj__String___preterm_Pretype_(_dollar3)
  YYObj__list_List__String___preterm_Pretype__(
    ({();  _dollar1.prepend(_dollar3) 
    })
  )
}

///|
// file:///./grammar.mbty
// 263|    X { @list.singleton($1) }
fn yy_action_20(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__String___preterm_Pretype_(_dollar1)
  YYObj__list_List__String___preterm_Pretype__(
    ({();  @list.singleton(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 268|    non_empty_list_commas_rev(X) option(",") { $1.rev() }
fn yy_action_21(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__list_List__preterm_Preterm_(_dollar1)
  YYObj__list_List__preterm_Preterm_(
    ({();  _dollar1.rev() 
    })
  )
}

///|
// file:///./grammar.mbty
// 227|    simple_expr "(" non_empty_list_commas(expr) ")" { applies($1, $3) }
fn yy_action_22(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  guard! _args[2].0 is YYObj__list_List__preterm_Preterm_(_dollar3)
  YYObj__preterm_Preterm(
    ({();  applies(_dollar1, _dollar3) 
    })
  )
}

///|
// file:///./grammar.mbty
// 192|    "!" prefix_expr { apply(pconst("~"), $2) }
fn yy_action_23(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj__preterm_Preterm(_dollar2)
  YYObj__preterm_Preterm(
    ({();  apply(pconst("~"), _dollar2) 
    })
  )
}

///|
// file:///./grammar.mbty
// 200|    "(" expr ":" type_ ")" { typed($2, $4) }
fn yy_action_24(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj__preterm_Preterm(_dollar2)
  guard! _args[3].0 is YYObj__preterm_Pretype(_dollar4)
  YYObj__preterm_Preterm(
    ({();  typed(_dollar2, _dollar4) 
    })
  )
}

///|
// file:///./grammar.mbty
// 162|    "(" arrow_fn_prefix "=>" expr { lambdas($2, $4) }
fn yy_action_25(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj__list_List__String___preterm_Pretype___(_dollar2)
  guard! _args[3].0 is YYObj__preterm_Preterm(_dollar4)
  YYObj__preterm_Preterm(
    ({();  lambdas(_dollar2, _dollar4) 
    })
  )
}

///|
// file:///./grammar.mbty
// 199|    "(" binder ":" type_ ")" { typed(pvar($2), $4) }
fn yy_action_26(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_11(_args[0].2, _args[1:2])
  guard! _sub_action_0_result is YYObj_String(_dollar2)
  guard! _args[3].0 is YYObj__preterm_Pretype(_dollar4)
  YYObj__preterm_Preterm(
    ({();  typed(pvar(_dollar2), _dollar4) 
    })
  )
}

///|
// file:///./grammar.mbty
// 199|    "(" binder ":" type_ ")" { typed(pvar($2), $4) }
fn yy_action_27(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_13(_args[0].2, _args[1:2])
  guard! _sub_action_0_result is YYObj_String(_dollar2)
  guard! _args[3].0 is YYObj__preterm_Pretype(_dollar4)
  YYObj__preterm_Preterm(
    ({();  typed(pvar(_dollar2), _dollar4) 
    })
  )
}

///|
// file:///./grammar.mbty
// 199|    "(" binder ":" type_ ")" { typed(pvar($2), $4) }
fn yy_action_28(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_15(_args[0].2, _args[1:2])
  guard! _sub_action_0_result is YYObj_String(_dollar2)
  guard! _args[3].0 is YYObj__preterm_Pretype(_dollar4)
  YYObj__preterm_Preterm(
    ({();  typed(pvar(_dollar2), _dollar4) 
    })
  )
}

///|
// file:///./grammar.mbty
// 174|    binder ioption(",") ")" { @list.singleton($1) }
fn yy_action_30(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_15(_last_pos, _args[0:1])
  let _sub_action_1_result = yy_action_29(_args[0].2, _args[1:1])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List_String_(
    ({();  @list.singleton(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 174|    binder ioption(",") ")" { @list.singleton($1) }
fn yy_action_31(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_13(_last_pos, _args[0:1])
  let _sub_action_1_result = yy_action_29(_args[0].2, _args[1:1])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List_String_(
    ({();  @list.singleton(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 174|    binder ioption(",") ")" { @list.singleton($1) }
fn yy_action_32(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_11(_last_pos, _args[0:1])
  let _sub_action_1_result = yy_action_29(_args[0].2, _args[1:1])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List_String_(
    ({();  @list.singleton(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 134|    if_expr { $1 }
fn yy_action_33(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  YYObj__preterm_Preterm(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./grammar.mbty
// 135|    quantifier_expr { $1 }
fn yy_action_34(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  YYObj__preterm_Preterm(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./grammar.mbty
// 136|    arrow_fn_expr { $1 }
fn yy_action_35(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  YYObj__preterm_Preterm(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./grammar.mbty
// 137|    infix_expr { $1 }
fn yy_action_36(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  YYObj__preterm_Preterm(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./grammar.mbty
// 141|    "{" expr "}" { $2 }
fn yy_action_37(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj__preterm_Preterm(_dollar2)
  YYObj__preterm_Preterm(
    ({();  _dollar2 
    })
  )
}

///|
// file:///./grammar.mbty
// 145|    "if" infix_expr block_expr "else" block_expr { cond($2, $3, $5) }
fn yy_action_38(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj__preterm_Preterm(_dollar2)
  guard! _args[2].0 is YYObj__preterm_Preterm(_dollar3)
  guard! _args[4].0 is YYObj__preterm_Preterm(_dollar5)
  YYObj__preterm_Preterm(
    ({();  cond(_dollar2, _dollar3, _dollar5) 
    })
  )
}

///|
// file:///./grammar.mbty
// 146|    "if" infix_expr block_expr "else" if_expr { cond($2, $3, $5) }
fn yy_action_39(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj__preterm_Preterm(_dollar2)
  guard! _args[2].0 is YYObj__preterm_Preterm(_dollar3)
  guard! _args[4].0 is YYObj__preterm_Preterm(_dollar5)
  YYObj__preterm_Preterm(
    ({();  cond(_dollar2, _dollar3, _dollar5) 
    })
  )
}

///|
// file:///./grammar.mbty
// 151|    "∃" binder ":" type_ "," quantifier_body_expr { quantify("?", $2, $4, $6) }
fn yy_action_40(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_11(_args[0].2, _args[1:2])
  guard! _sub_action_0_result is YYObj_String(_dollar2)
  guard! _args[3].0 is YYObj__preterm_Pretype(_dollar4)
  guard! _args[5].0 is YYObj__preterm_Preterm(_dollar6)
  YYObj__preterm_Preterm(
    ({();  quantify("?", _dollar2, _dollar4, _dollar6) 
    })
  )
}

///|
// file:///./grammar.mbty
// 151|    "∃" binder ":" type_ "," quantifier_body_expr { quantify("?", $2, $4, $6) }
fn yy_action_41(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_13(_args[0].2, _args[1:2])
  guard! _sub_action_0_result is YYObj_String(_dollar2)
  guard! _args[3].0 is YYObj__preterm_Pretype(_dollar4)
  guard! _args[5].0 is YYObj__preterm_Preterm(_dollar6)
  YYObj__preterm_Preterm(
    ({();  quantify("?", _dollar2, _dollar4, _dollar6) 
    })
  )
}

///|
// file:///./grammar.mbty
// 151|    "∃" binder ":" type_ "," quantifier_body_expr { quantify("?", $2, $4, $6) }
fn yy_action_42(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_15(_args[0].2, _args[1:2])
  guard! _sub_action_0_result is YYObj_String(_dollar2)
  guard! _args[3].0 is YYObj__preterm_Pretype(_dollar4)
  guard! _args[5].0 is YYObj__preterm_Preterm(_dollar6)
  YYObj__preterm_Preterm(
    ({();  quantify("?", _dollar2, _dollar4, _dollar6) 
    })
  )
}

///|
// file:///./grammar.mbty
// 151|    "∃" binder ":" type_ "," quantifier_body_expr { quantify("?", $2, $4, $6) }
fn yy_action_43(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_17(_args[0].2, _args[1:2])
  guard! _sub_action_0_result is YYObj_String(_dollar2)
  guard! _args[3].0 is YYObj__preterm_Pretype(_dollar4)
  guard! _args[5].0 is YYObj__preterm_Preterm(_dollar6)
  YYObj__preterm_Preterm(
    ({();  quantify("?", _dollar2, _dollar4, _dollar6) 
    })
  )
}

///|
// file:///./grammar.mbty
// 150|    "∀" binder ":" type_ "," quantifier_body_expr { quantify("forall", $2, $4, $6) }
fn yy_action_44(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_11(_args[0].2, _args[1:2])
  guard! _sub_action_0_result is YYObj_String(_dollar2)
  guard! _args[3].0 is YYObj__preterm_Pretype(_dollar4)
  guard! _args[5].0 is YYObj__preterm_Preterm(_dollar6)
  YYObj__preterm_Preterm(
    ({();  quantify("forall", _dollar2, _dollar4, _dollar6) 
    })
  )
}

///|
// file:///./grammar.mbty
// 150|    "∀" binder ":" type_ "," quantifier_body_expr { quantify("forall", $2, $4, $6) }
fn yy_action_45(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_13(_args[0].2, _args[1:2])
  guard! _sub_action_0_result is YYObj_String(_dollar2)
  guard! _args[3].0 is YYObj__preterm_Pretype(_dollar4)
  guard! _args[5].0 is YYObj__preterm_Preterm(_dollar6)
  YYObj__preterm_Preterm(
    ({();  quantify("forall", _dollar2, _dollar4, _dollar6) 
    })
  )
}

///|
// file:///./grammar.mbty
// 150|    "∀" binder ":" type_ "," quantifier_body_expr { quantify("forall", $2, $4, $6) }
fn yy_action_46(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_15(_args[0].2, _args[1:2])
  guard! _sub_action_0_result is YYObj_String(_dollar2)
  guard! _args[3].0 is YYObj__preterm_Pretype(_dollar4)
  guard! _args[5].0 is YYObj__preterm_Preterm(_dollar6)
  YYObj__preterm_Preterm(
    ({();  quantify("forall", _dollar2, _dollar4, _dollar6) 
    })
  )
}

///|
// file:///./grammar.mbty
// 150|    "∀" binder ":" type_ "," quantifier_body_expr { quantify("forall", $2, $4, $6) }
fn yy_action_47(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_17(_args[0].2, _args[1:2])
  guard! _sub_action_0_result is YYObj_String(_dollar2)
  guard! _args[3].0 is YYObj__preterm_Pretype(_dollar4)
  guard! _args[5].0 is YYObj__preterm_Preterm(_dollar6)
  YYObj__preterm_Preterm(
    ({();  quantify("forall", _dollar2, _dollar4, _dollar6) 
    })
  )
}

///|
// file:///./grammar.mbty
// 152|    "∀" tuple_expr ":" type_ "," quantifier_body_expr { quantify_pattern("forall", $2, $4, $6) }
fn yy_action_48(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj__preterm_Preterm(_dollar2)
  guard! _args[3].0 is YYObj__preterm_Pretype(_dollar4)
  guard! _args[5].0 is YYObj__preterm_Preterm(_dollar6)
  YYObj__preterm_Preterm(
    ({();  quantify_pattern("forall", _dollar2, _dollar4, _dollar6) 
    })
  )
}

///|
// file:///./grammar.mbty
// 153|    "∃" tuple_expr ":" type_ "," quantifier_body_expr { quantify_pattern("?", $2, $4, $6) }
fn yy_action_49(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj__preterm_Preterm(_dollar2)
  guard! _args[3].0 is YYObj__preterm_Pretype(_dollar4)
  guard! _args[5].0 is YYObj__preterm_Preterm(_dollar6)
  YYObj__preterm_Preterm(
    ({();  quantify_pattern("?", _dollar2, _dollar4, _dollar6) 
    })
  )
}

///|
// file:///./grammar.mbty
// 157|    quantifier_expr { $1 }
fn yy_action_50(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  YYObj__preterm_Preterm(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./grammar.mbty
// 179|    infix_expr "→" infix_expr { binary("==>", $1, $3) }
fn yy_action_51(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Preterm(_dollar3)
  YYObj__preterm_Preterm(
    ({();  binary("==>", _dollar1, _dollar3) 
    })
  )
}

///|
// file:///./grammar.mbty
// 180|    infix_expr "||" infix_expr { binary("\\/", $1, $3) }
fn yy_action_52(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Preterm(_dollar3)
  YYObj__preterm_Preterm(
    ({();  binary("\\/", _dollar1, _dollar3) 
    })
  )
}

///|
// file:///./grammar.mbty
// 181|    infix_expr "&&" infix_expr { binary("/\\", $1, $3) }
fn yy_action_53(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Preterm(_dollar3)
  YYObj__preterm_Preterm(
    ({();  binary("/\\", _dollar1, _dollar3) 
    })
  )
}

///|
// file:///./grammar.mbty
// 182|    infix_expr INFIX1 infix_expr { comparison($2, $1, $3) }
fn yy_action_54(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj_String(_dollar2)
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Preterm(_dollar3)
  YYObj__preterm_Preterm(
    ({();  comparison(_dollar2, _dollar1, _dollar3) 
    })
  )
}

///|
// file:///./grammar.mbty
// 183|    infix_expr "+" infix_expr { binary("+", $1, $3) }
fn yy_action_55(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Preterm(_dollar3)
  YYObj__preterm_Preterm(
    ({();  binary("+", _dollar1, _dollar3) 
    })
  )
}

///|
// file:///./grammar.mbty
// 184|    infix_expr "-" infix_expr { binary("-", $1, $3) }
fn yy_action_56(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Preterm(_dollar3)
  YYObj__preterm_Preterm(
    ({();  binary("-", _dollar1, _dollar3) 
    })
  )
}

///|
// file:///./grammar.mbty
// 185|    infix_expr "*" infix_expr { binary("*", $1, $3) }
fn yy_action_57(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Preterm(_dollar3)
  YYObj__preterm_Preterm(
    ({();  binary("*", _dollar1, _dollar3) 
    })
  )
}

///|
// file:///./grammar.mbty
// 186|    infix_expr INFIX3 infix_expr { infix3($2, $1, $3) }
fn yy_action_58(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj_String(_dollar2)
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Preterm(_dollar3)
  YYObj__preterm_Preterm(
    ({();  infix3(_dollar2, _dollar1, _dollar3) 
    })
  )
}

///|
// file:///./grammar.mbty
// 158|    infix_expr { $1 }
fn yy_action_59(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  YYObj__preterm_Preterm(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./grammar.mbty
// 174|    binder ioption(",") ")" { @list.singleton($1) }
fn yy_action_61(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_11(_last_pos, _args[0:1])
  let _sub_action_1_result = yy_action_60(_args[0].2, _args[1:2])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List_String_(
    ({();  @list.singleton(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 175|    binder "," arrow_fn_prefix_no_constraint { $3.prepend($1) }
fn yy_action_62(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_11(_last_pos, _args[0:1])
  guard! _args[2].0 is YYObj__list_List_String_(_dollar3)
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List_String_(
    ({();  _dollar3.prepend(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 209|    binder "," non_empty_tuple_elems_with_prefix { $3.prepend(pvar($1)) }
fn yy_action_63(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_11(_last_pos, _args[0:1])
  guard! _args[2].0 is YYObj__list_List__preterm_Preterm_(_dollar3)
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List__preterm_Preterm_(
    ({();  _dollar3.prepend(pvar(_dollar1)) 
    })
  )
}

///|
// file:///./grammar.mbty
// 174|    binder ioption(",") ")" { @list.singleton($1) }
fn yy_action_64(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_13(_last_pos, _args[0:1])
  let _sub_action_1_result = yy_action_60(_args[0].2, _args[1:2])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List_String_(
    ({();  @list.singleton(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 175|    binder "," arrow_fn_prefix_no_constraint { $3.prepend($1) }
fn yy_action_65(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_13(_last_pos, _args[0:1])
  guard! _args[2].0 is YYObj__list_List_String_(_dollar3)
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List_String_(
    ({();  _dollar3.prepend(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 209|    binder "," non_empty_tuple_elems_with_prefix { $3.prepend(pvar($1)) }
fn yy_action_66(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_13(_last_pos, _args[0:1])
  guard! _args[2].0 is YYObj__list_List__preterm_Preterm_(_dollar3)
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List__preterm_Preterm_(
    ({();  _dollar3.prepend(pvar(_dollar1)) 
    })
  )
}

///|
// file:///./grammar.mbty
// 174|    binder ioption(",") ")" { @list.singleton($1) }
fn yy_action_67(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_15(_last_pos, _args[0:1])
  let _sub_action_1_result = yy_action_60(_args[0].2, _args[1:2])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List_String_(
    ({();  @list.singleton(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 175|    binder "," arrow_fn_prefix_no_constraint { $3.prepend($1) }
fn yy_action_68(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_15(_last_pos, _args[0:1])
  guard! _args[2].0 is YYObj__list_List_String_(_dollar3)
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List_String_(
    ({();  _dollar3.prepend(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 209|    binder "," non_empty_tuple_elems_with_prefix { $3.prepend(pvar($1)) }
fn yy_action_69(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_15(_last_pos, _args[0:1])
  guard! _args[2].0 is YYObj__list_List__preterm_Preterm_(_dollar3)
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List__preterm_Preterm_(
    ({();  _dollar3.prepend(pvar(_dollar1)) 
    })
  )
}

///|
// file:///./grammar.mbty
// 174|    binder ioption(",") ")" { @list.singleton($1) }
fn yy_action_70(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_17(_last_pos, _args[0:1])
  let _sub_action_1_result = yy_action_29(_args[0].2, _args[1:1])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List_String_(
    ({();  @list.singleton(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 174|    binder ioption(",") ")" { @list.singleton($1) }
fn yy_action_71(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_17(_last_pos, _args[0:1])
  let _sub_action_1_result = yy_action_60(_args[0].2, _args[1:2])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List_String_(
    ({();  @list.singleton(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 175|    binder "," arrow_fn_prefix_no_constraint { $3.prepend($1) }
fn yy_action_72(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_17(_last_pos, _args[0:1])
  guard! _args[2].0 is YYObj__list_List_String_(_dollar3)
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List_String_(
    ({();  _dollar3.prepend(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 209|    binder "," non_empty_tuple_elems_with_prefix { $3.prepend(pvar($1)) }
fn yy_action_73(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_17(_last_pos, _args[0:1])
  guard! _args[2].0 is YYObj__list_List__preterm_Preterm_(_dollar3)
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List__preterm_Preterm_(
    ({();  _dollar3.prepend(pvar(_dollar1)) 
    })
  )
}

///|
// file:///./grammar.mbty
// 199|    "(" binder ":" type_ ")" { typed(pvar($2), $4) }
fn yy_action_74(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_17(_args[0].2, _args[1:2])
  guard! _sub_action_0_result is YYObj_String(_dollar2)
  guard! _args[3].0 is YYObj__preterm_Pretype(_dollar4)
  YYObj__preterm_Preterm(
    ({();  typed(pvar(_dollar2), _dollar4) 
    })
  )
}

///|
// file:///./grammar.mbty
// 167|    binder ioption(",") ")" { @list.singleton(($1, None)) }
fn yy_action_75(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_17(_last_pos, _args[0:1])
  let _sub_action_1_result = yy_action_29(_args[0].2, _args[1:1])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List__String___preterm_Pretype___(
    ({();  @list.singleton((_dollar1, None)) 
    })
  )
}

///|
// file:///./grammar.mbty
// 167|    binder ioption(",") ")" { @list.singleton(($1, None)) }
fn yy_action_76(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_15(_last_pos, _args[0:1])
  let _sub_action_1_result = yy_action_29(_args[0].2, _args[1:1])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List__String___preterm_Pretype___(
    ({();  @list.singleton((_dollar1, None)) 
    })
  )
}

///|
// file:///./grammar.mbty
// 167|    binder ioption(",") ")" { @list.singleton(($1, None)) }
fn yy_action_77(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_15(_last_pos, _args[0:1])
  let _sub_action_1_result = yy_action_60(_args[0].2, _args[1:2])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List__String___preterm_Pretype___(
    ({();  @list.singleton((_dollar1, None)) 
    })
  )
}

///|
// file:///./grammar.mbty
// 169|    binder "," arrow_fn_prefix { $3.prepend(($1, None)) }
fn yy_action_78(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_15(_last_pos, _args[0:1])
  guard! _args[2].0 is YYObj__list_List__String___preterm_Pretype___(_dollar3)
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List__String___preterm_Pretype___(
    ({();  _dollar3.prepend((_dollar1, None)) 
    })
  )
}

///|
// file:///./grammar.mbty
// 168|    binder ":" type_ ioption(",") ")" { @list.singleton(($1, Some($3))) }
fn yy_action_79(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_15(_last_pos, _args[0:1])
  let _sub_action_1_result = yy_action_29(_args[2].2, _args[3:3])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Pretype(_dollar3)
  YYObj__list_List__String___preterm_Pretype___(
    ({();  @list.singleton((_dollar1, Some(_dollar3))) 
    })
  )
}

///|
// file:///./grammar.mbty
// 167|    binder ioption(",") ")" { @list.singleton(($1, None)) }
fn yy_action_80(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_13(_last_pos, _args[0:1])
  let _sub_action_1_result = yy_action_29(_args[0].2, _args[1:1])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List__String___preterm_Pretype___(
    ({();  @list.singleton((_dollar1, None)) 
    })
  )
}

///|
// file:///./grammar.mbty
// 167|    binder ioption(",") ")" { @list.singleton(($1, None)) }
fn yy_action_81(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_13(_last_pos, _args[0:1])
  let _sub_action_1_result = yy_action_60(_args[0].2, _args[1:2])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List__String___preterm_Pretype___(
    ({();  @list.singleton((_dollar1, None)) 
    })
  )
}

///|
// file:///./grammar.mbty
// 169|    binder "," arrow_fn_prefix { $3.prepend(($1, None)) }
fn yy_action_82(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_13(_last_pos, _args[0:1])
  guard! _args[2].0 is YYObj__list_List__String___preterm_Pretype___(_dollar3)
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List__String___preterm_Pretype___(
    ({();  _dollar3.prepend((_dollar1, None)) 
    })
  )
}

///|
// file:///./grammar.mbty
// 168|    binder ":" type_ ioption(",") ")" { @list.singleton(($1, Some($3))) }
fn yy_action_83(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_13(_last_pos, _args[0:1])
  let _sub_action_1_result = yy_action_29(_args[2].2, _args[3:3])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Pretype(_dollar3)
  YYObj__list_List__String___preterm_Pretype___(
    ({();  @list.singleton((_dollar1, Some(_dollar3))) 
    })
  )
}

///|
// file:///./grammar.mbty
// 167|    binder ioption(",") ")" { @list.singleton(($1, None)) }
fn yy_action_84(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_11(_last_pos, _args[0:1])
  let _sub_action_1_result = yy_action_29(_args[0].2, _args[1:1])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List__String___preterm_Pretype___(
    ({();  @list.singleton((_dollar1, None)) 
    })
  )
}

///|
// file:///./grammar.mbty
// 167|    binder ioption(",") ")" { @list.singleton(($1, None)) }
fn yy_action_85(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_11(_last_pos, _args[0:1])
  let _sub_action_1_result = yy_action_60(_args[0].2, _args[1:2])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List__String___preterm_Pretype___(
    ({();  @list.singleton((_dollar1, None)) 
    })
  )
}

///|
// file:///./grammar.mbty
// 169|    binder "," arrow_fn_prefix { $3.prepend(($1, None)) }
fn yy_action_86(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_11(_last_pos, _args[0:1])
  guard! _args[2].0 is YYObj__list_List__String___preterm_Pretype___(_dollar3)
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List__String___preterm_Pretype___(
    ({();  _dollar3.prepend((_dollar1, None)) 
    })
  )
}

///|
// file:///./grammar.mbty
// 168|    binder ":" type_ ioption(",") ")" { @list.singleton(($1, Some($3))) }
fn yy_action_87(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_11(_last_pos, _args[0:1])
  let _sub_action_1_result = yy_action_29(_args[2].2, _args[3:3])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Pretype(_dollar3)
  YYObj__list_List__String___preterm_Pretype___(
    ({();  @list.singleton((_dollar1, Some(_dollar3))) 
    })
  )
}

///|
// file:///./grammar.mbty
// 168|    binder ":" type_ ioption(",") ")" { @list.singleton(($1, Some($3))) }
fn yy_action_88(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_11(_last_pos, _args[0:1])
  let _sub_action_1_result = yy_action_60(_args[2].2, _args[3:4])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Pretype(_dollar3)
  YYObj__list_List__String___preterm_Pretype___(
    ({();  @list.singleton((_dollar1, Some(_dollar3))) 
    })
  )
}

///|
// file:///./grammar.mbty
// 170|    binder ":" type_ "," arrow_fn_prefix { $5.prepend(($1, Some($3))) }
fn yy_action_89(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_11(_last_pos, _args[0:1])
  guard! _args[4].0 is YYObj__list_List__String___preterm_Pretype___(_dollar5)
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Pretype(_dollar3)
  YYObj__list_List__String___preterm_Pretype___(
    ({();  _dollar5.prepend((_dollar1, Some(_dollar3))) 
    })
  )
}

///|
// file:///./grammar.mbty
// 168|    binder ":" type_ ioption(",") ")" { @list.singleton(($1, Some($3))) }
fn yy_action_90(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_13(_last_pos, _args[0:1])
  let _sub_action_1_result = yy_action_60(_args[2].2, _args[3:4])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Pretype(_dollar3)
  YYObj__list_List__String___preterm_Pretype___(
    ({();  @list.singleton((_dollar1, Some(_dollar3))) 
    })
  )
}

///|
// file:///./grammar.mbty
// 170|    binder ":" type_ "," arrow_fn_prefix { $5.prepend(($1, Some($3))) }
fn yy_action_91(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_13(_last_pos, _args[0:1])
  guard! _args[4].0 is YYObj__list_List__String___preterm_Pretype___(_dollar5)
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Pretype(_dollar3)
  YYObj__list_List__String___preterm_Pretype___(
    ({();  _dollar5.prepend((_dollar1, Some(_dollar3))) 
    })
  )
}

///|
// file:///./grammar.mbty
// 168|    binder ":" type_ ioption(",") ")" { @list.singleton(($1, Some($3))) }
fn yy_action_92(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_15(_last_pos, _args[0:1])
  let _sub_action_1_result = yy_action_60(_args[2].2, _args[3:4])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Pretype(_dollar3)
  YYObj__list_List__String___preterm_Pretype___(
    ({();  @list.singleton((_dollar1, Some(_dollar3))) 
    })
  )
}

///|
// file:///./grammar.mbty
// 170|    binder ":" type_ "," arrow_fn_prefix { $5.prepend(($1, Some($3))) }
fn yy_action_93(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_15(_last_pos, _args[0:1])
  guard! _args[4].0 is YYObj__list_List__String___preterm_Pretype___(_dollar5)
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Pretype(_dollar3)
  YYObj__list_List__String___preterm_Pretype___(
    ({();  _dollar5.prepend((_dollar1, Some(_dollar3))) 
    })
  )
}

///|
// file:///./grammar.mbty
// 167|    binder ioption(",") ")" { @list.singleton(($1, None)) }
fn yy_action_94(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_17(_last_pos, _args[0:1])
  let _sub_action_1_result = yy_action_60(_args[0].2, _args[1:2])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List__String___preterm_Pretype___(
    ({();  @list.singleton((_dollar1, None)) 
    })
  )
}

///|
// file:///./grammar.mbty
// 169|    binder "," arrow_fn_prefix { $3.prepend(($1, None)) }
fn yy_action_95(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_17(_last_pos, _args[0:1])
  guard! _args[2].0 is YYObj__list_List__String___preterm_Pretype___(_dollar3)
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj__list_List__String___preterm_Pretype___(
    ({();  _dollar3.prepend((_dollar1, None)) 
    })
  )
}

///|
// file:///./grammar.mbty
// 168|    binder ":" type_ ioption(",") ")" { @list.singleton(($1, Some($3))) }
fn yy_action_96(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_17(_last_pos, _args[0:1])
  let _sub_action_1_result = yy_action_29(_args[2].2, _args[3:3])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Pretype(_dollar3)
  YYObj__list_List__String___preterm_Pretype___(
    ({();  @list.singleton((_dollar1, Some(_dollar3))) 
    })
  )
}

///|
// file:///./grammar.mbty
// 168|    binder ":" type_ ioption(",") ")" { @list.singleton(($1, Some($3))) }
fn yy_action_97(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_17(_last_pos, _args[0:1])
  let _sub_action_1_result = yy_action_60(_args[2].2, _args[3:4])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Pretype(_dollar3)
  YYObj__list_List__String___preterm_Pretype___(
    ({();  @list.singleton((_dollar1, Some(_dollar3))) 
    })
  )
}

///|
// file:///./grammar.mbty
// 170|    binder ":" type_ "," arrow_fn_prefix { $5.prepend(($1, Some($3))) }
fn yy_action_98(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_17(_last_pos, _args[0:1])
  guard! _args[4].0 is YYObj__list_List__String___preterm_Pretype___(_dollar5)
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Pretype(_dollar3)
  YYObj__list_List__String___preterm_Pretype___(
    ({();  _dollar5.prepend((_dollar1, Some(_dollar3))) 
    })
  )
}

///|
// file:///./grammar.mbty
// 197|    "(" arrow_fn_prefix_no_constraint { tuple($2.map(pvar)) }
fn yy_action_99(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj__list_List_String_(_dollar2)
  YYObj__preterm_Preterm(
    ({();  tuple(_dollar2.map(pvar)) 
    })
  )
}

///|
// file:///./grammar.mbty
// 198|    "(" non_empty_tuple_elems_with_prefix { tuple($2) }
fn yy_action_100(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj__list_List__preterm_Preterm_(_dollar2)
  YYObj__preterm_Preterm(
    ({();  tuple(_dollar2) 
    })
  )
}

///|
// file:///./grammar.mbty
// 163|    binder "=>" expr { lambdas(@list.singleton(($1, None)), $3) }
fn yy_action_101(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_11(_last_pos, _args[0:1])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Preterm(_dollar3)
  YYObj__preterm_Preterm(
    ({();  lambdas(@list.singleton((_dollar1, None)), _dollar3) 
    })
  )
}

///|
// file:///./grammar.mbty
// 163|    binder "=>" expr { lambdas(@list.singleton(($1, None)), $3) }
fn yy_action_102(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_13(_last_pos, _args[0:1])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Preterm(_dollar3)
  YYObj__preterm_Preterm(
    ({();  lambdas(@list.singleton((_dollar1, None)), _dollar3) 
    })
  )
}

///|
// file:///./grammar.mbty
// 163|    binder "=>" expr { lambdas(@list.singleton(($1, None)), $3) }
fn yy_action_103(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_15(_last_pos, _args[0:1])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Preterm(_dollar3)
  YYObj__preterm_Preterm(
    ({();  lambdas(@list.singleton((_dollar1, None)), _dollar3) 
    })
  )
}

///|
// file:///./grammar.mbty
// 163|    binder "=>" expr { lambdas(@list.singleton(($1, None)), $3) }
fn yy_action_104(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_17(_last_pos, _args[0:1])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Preterm(_dollar3)
  YYObj__preterm_Preterm(
    ({();  lambdas(@list.singleton((_dollar1, None)), _dollar3) 
    })
  )
}

///|
// file:///./grammar.mbty
// 187|    prefix_expr { $1 }
fn yy_action_105(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  YYObj__preterm_Preterm(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./grammar.mbty
// 191|    "-" prefix_expr { apply(pconst("--"), $2) }
fn yy_action_106(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj__preterm_Preterm(_dollar2)
  YYObj__preterm_Preterm(
    ({();  apply(pconst("--"), _dollar2) 
    })
  )
}

///|
// file:///./grammar.mbty
// 204|    expr ioption(",") ")" { @list.singleton($1) }
fn yy_action_107(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_29(_args[0].2, _args[1:1])
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  YYObj__list_List__preterm_Preterm_(
    ({();  @list.singleton(_dollar1) 
    })
  )
}

///|
// file:///./stdlib.mbty
// 9|    { None }
fn yy_action_29(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  YYObj_Option_Unit_(
    ({();  None 
    })
  )
}

///|
// file:///./grammar.mbty
// 204|    expr ioption(",") ")" { @list.singleton($1) }
fn yy_action_108(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_60(_args[0].2, _args[1:2])
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  YYObj__list_List__preterm_Preterm_(
    ({();  @list.singleton(_dollar1) 
    })
  )
}

///|
// file:///./stdlib.mbty
// 10|    X { Some($1) }
fn yy_action_60(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _dollar1 = ()
  YYObj_Option_Unit_(
    ({();  Some(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 205|    expr "," non_empty_tuple_elems { $3.prepend($1) }
fn yy_action_109(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[2].0 is YYObj__list_List__preterm_Preterm_(_dollar3)
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  YYObj__list_List__preterm_Preterm_(
    ({();  _dollar3.prepend(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 210|    non_empty_tuple_elems { $1 }
fn yy_action_110(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__list_List__preterm_Preterm_(_dollar1)
  YYObj__list_List__preterm_Preterm_(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./grammar.mbty
// 215|    UIDENT %prec prec_apply_non_ident_fn { pvar($1) }
fn yy_action_111(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj_String(_dollar1)
  YYObj__preterm_Preterm(
    ({();  pvar(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 216|    LIDENT %prec prec_apply_non_ident_fn { pvar($1) }
fn yy_action_112(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj_String(_dollar1)
  YYObj__preterm_Preterm(
    ({();  pvar(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 217|    RAWIDENT %prec prec_apply_non_ident_fn { pvar($1) }
fn yy_action_113(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj_String(_dollar1)
  YYObj__preterm_Preterm(
    ({();  pvar(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 218|    VERBATIM %prec prec_apply_non_ident_fn { pvar($1) }
fn yy_action_114(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj_String(_dollar1)
  YYObj__preterm_Preterm(
    ({();  pvar(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 228|    simple_expr DOT_LIDENT "(" list_commas(expr) ")" { applies(pvar($2), $4.prepend($1)) }
fn yy_action_115(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj_String(_dollar2)
  guard! _args[3].0 is YYObj__list_List__preterm_Preterm_(_dollar4)
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  YYObj__preterm_Preterm(
    ({();  applies(pvar(_dollar2), _dollar4.prepend(_dollar1)) 
    })
  )
}

///|
// file:///./grammar.mbty
// 193|    simple_expr { $1 }
fn yy_action_116(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  YYObj__preterm_Preterm(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./grammar.mbty
// 214|    atomic_expr { $1 }
fn yy_action_117(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  YYObj__preterm_Preterm(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./grammar.mbty
// 219|    tuple_expr { $1 }
fn yy_action_118(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  YYObj__preterm_Preterm(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./grammar.mbty
// 220|    "[" list_commas(expr) "]" { list($2) }
fn yy_action_119(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj__list_List__preterm_Preterm_(_dollar2)
  YYObj__preterm_Preterm(
    ({();  list(_dollar2) 
    })
  )
}

///|
// file:///./grammar.mbty
// 273|    non_empty_list_commas(X) { $1 }
fn yy_action_120(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__list_List__preterm_Preterm_(_dollar1)
  YYObj__list_List__preterm_Preterm_(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./grammar.mbty
// 263|    X { @list.singleton($1) }
fn yy_action_121(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  YYObj__list_List__preterm_Preterm_(
    ({();  @list.singleton(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 272|    { @list.List([]) }
fn yy_action_122(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  YYObj__list_List__preterm_Preterm_(
    ({();  @list.List([]) 
    })
  )
}

///|
// file:///./grammar.mbty
// 264|    non_empty_list_commas_rev(X) "," X { $1.prepend($3) }
fn yy_action_123(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__list_List__preterm_Preterm_(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Preterm(_dollar3)
  YYObj__list_List__preterm_Preterm_(
    ({();  _dollar1.prepend(_dollar3) 
    })
  )
}

///|
// file:///./grammar.mbty
// 242|    match_arm ";" match_arms { $3.prepend($1) }
fn yy_action_124(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[2].0 is YYObj__list_List__preterm_Preterm_(_dollar3)
  guard! _args[0].0 is YYObj__preterm_Preterm(_dollar1)
  YYObj__list_List__preterm_Preterm_(
    ({();  _dollar3.prepend(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 232|    "true" { pconst("T") }
fn yy_action_125(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  YYObj__preterm_Preterm(
    ({();  pconst("T") 
    })
  )
}

///|
// file:///./grammar.mbty
// 233|    "false" { pconst("F") }
fn yy_action_126(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  YYObj__preterm_Preterm(
    ({();  pconst("F") 
    })
  )
}

///|
// file:///./grammar.mbty
// 234|    INT { pvar($1) }
fn yy_action_127(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj_String(_dollar1)
  YYObj__preterm_Preterm(
    ({();  pvar(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 78|    type_ EOF { $1 }
fn yy_action_128(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Pretype(_dollar1)
  YYObj__preterm_Pretype(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./grammar.mbty
// 85|    enum_decls EOF { $1 }
fn yy_action_129(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__list_List__String__String___list_List__String___list_List__preterm_Pretype_____(
    _dollar1
  )
  YYObj__list_List__String__String___list_List__String___list_List__preterm_Pretype_____(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./grammar.mbty
// 90|    enum_decl enum_decls { $2.prepend($1) }
fn yy_action_130(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj__list_List__String__String___list_List__String___list_List__preterm_Pretype_____(
    _dollar2
  )
  guard! _args[0].0 is YYObj__String__String___list_List__String___list_List__preterm_Pretype____(
    _dollar1
  )
  YYObj__list_List__String__String___list_List__String___list_List__preterm_Pretype_____(
    ({();  _dollar2.prepend(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 89|    enum_decl { @list.singleton($1) }
fn yy_action_131(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__String__String___list_List__String___list_List__preterm_Pretype____(
    _dollar1
  )
  YYObj__list_List__String__String___list_List__String___list_List__preterm_Pretype_____(
    ({();  @list.singleton(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 97|    "enum" UIDENT "{" enum_constructors "}" { (lowered($2), defined_type_var($2), $4) }
fn yy_action_132(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj_String(_dollar2)
  guard! _args[3].0 is YYObj__list_List__String___list_List__preterm_Pretype___(
    _dollar4
  )
  YYObj__String__String___list_List__String___list_List__preterm_Pretype____(
    ({();  (lowered(_dollar2), defined_type_var(_dollar2), _dollar4) 
    })
  )
}

///|
// file:///./grammar.mbty
// 98|    "enum" VERBATIM "{" enum_constructors "}" { ($2, defined_type_var("`" + $2 + "`"), $4) }
fn yy_action_133(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj_String(_dollar2)
  guard! _args[3].0 is YYObj__list_List__String___list_List__preterm_Pretype___(
    _dollar4
  )
  YYObj__String__String___list_List__String___list_List__preterm_Pretype____(
    ({();  (_dollar2, defined_type_var("`" + _dollar2 + "`"), _dollar4) 
    })
  )
}

///|
// file:///./grammar.mbty
// 103|    enum_constructor option(";") { @list.singleton($1) }
fn yy_action_134(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__String___list_List__preterm_Pretype__(_dollar1)
  YYObj__list_List__String___list_List__preterm_Pretype___(
    ({();  @list.singleton(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 104|    enum_constructor ";" enum_constructors { $3.prepend($1) }
fn yy_action_135(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[2].0 is YYObj__list_List__String___list_List__preterm_Pretype___(
    _dollar3
  )
  guard! _args[0].0 is YYObj__String___list_List__preterm_Pretype__(_dollar1)
  YYObj__list_List__String___list_List__preterm_Pretype___(
    ({();  _dollar3.prepend(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 110|    constructor_name "(" non_empty_list_commas(type_) ")" { ($1, $3) }
fn yy_action_136(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj_String(_dollar1)
  guard! _args[2].0 is YYObj__list_List__preterm_Pretype_(_dollar3)
  YYObj__String___list_List__preterm_Pretype__(
    ({();  (_dollar1, _dollar3) 
    })
  )
}

///|
// file:///./grammar.mbty
// 109|    constructor_name { ($1, @list.List([])) }
fn yy_action_137(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj_String(_dollar1)
  YYObj__String___list_List__preterm_Pretype__(
    ({();  (_dollar1, @list.List([])) 
    })
  )
}

///|
// file:///./grammar.mbty
// 114|    binder { $1 }
fn yy_action_138(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_11(_last_pos, _args[0:1])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj_String(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./grammar.mbty
// 114|    binder { $1 }
fn yy_action_139(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_13(_last_pos, _args[0:1])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj_String(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./grammar.mbty
// 114|    binder { $1 }
fn yy_action_140(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_15(_last_pos, _args[0:1])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj_String(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./grammar.mbty
// 114|    binder { $1 }
fn yy_action_141(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_17(_last_pos, _args[0:1])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  YYObj_String(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./grammar.mbty
// 120|    "struct" UIDENT "{" struct_fields "}" EOF { (lowered($2), defined_type_var($2), $4) }
fn yy_action_142(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj_String(_dollar2)
  guard! _args[3].0 is YYObj__list_List__String___preterm_Pretype__(_dollar4)
  YYObj__String__String___list_List__String___preterm_Pretype___(
    ({();  (lowered(_dollar2), defined_type_var(_dollar2), _dollar4) 
    })
  )
}

///|
// file:///./grammar.mbty
// 125|    struct_field option(";") { @list.singleton($1) }
fn yy_action_143(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__String___preterm_Pretype_(_dollar1)
  YYObj__list_List__String___preterm_Pretype__(
    ({();  @list.singleton(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 126|    struct_field ";" struct_fields { $3.prepend($1) }
fn yy_action_144(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[2].0 is YYObj__list_List__String___preterm_Pretype__(_dollar3)
  guard! _args[0].0 is YYObj__String___preterm_Pretype_(_dollar1)
  YYObj__list_List__String___preterm_Pretype__(
    ({();  _dollar3.prepend(_dollar1) 
    })
  )
}

///|
// file:///./stdlib.mbty
// 5|    X { Some($1) }
fn yy_action_145(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _dollar1 = ()
  YYObj_Option_Unit_(
    ({();  Some(_dollar1) 
    })
  )
}

///|
// file:///./stdlib.mbty
// 4|    { None }
fn yy_action_146(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  YYObj_Option_Unit_(
    ({();  None 
    })
  )
}

///|
// file:///./grammar.mbty
// 130|    binder ":" type_ { ($1, $3) }
fn yy_action_147(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_11(_last_pos, _args[0:1])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Pretype(_dollar3)
  YYObj__String___preterm_Pretype_(
    ({();  (_dollar1, _dollar3) 
    })
  )
}

///|
// file:///./grammar.mbty
// 256|    LIDENT { $1 }
fn yy_action_11(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj_String(_dollar1)
  YYObj_String(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./grammar.mbty
// 130|    binder ":" type_ { ($1, $3) }
fn yy_action_148(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_13(_last_pos, _args[0:1])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Pretype(_dollar3)
  YYObj__String___preterm_Pretype_(
    ({();  (_dollar1, _dollar3) 
    })
  )
}

///|
// file:///./grammar.mbty
// 257|    UIDENT { $1 }
fn yy_action_13(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj_String(_dollar1)
  YYObj_String(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./grammar.mbty
// 130|    binder ":" type_ { ($1, $3) }
fn yy_action_149(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_15(_last_pos, _args[0:1])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Pretype(_dollar3)
  YYObj__String___preterm_Pretype_(
    ({();  (_dollar1, _dollar3) 
    })
  )
}

///|
// file:///./grammar.mbty
// 258|    RAWIDENT { $1 }
fn yy_action_15(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj_String(_dollar1)
  YYObj_String(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./grammar.mbty
// 130|    binder ":" type_ { ($1, $3) }
fn yy_action_150(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_17(_last_pos, _args[0:1])
  guard! _sub_action_0_result is YYObj_String(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Pretype(_dollar3)
  YYObj__String___preterm_Pretype_(
    ({();  (_dollar1, _dollar3) 
    })
  )
}

///|
// file:///./grammar.mbty
// 259|    VERBATIM { $1 }
fn yy_action_17(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj_String(_dollar1)
  YYObj_String(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./grammar.mbty
// 280|    VERBATIM optional_type_arguments { verbatim_type($1, $2) }
fn yy_action_151(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj_String(_dollar1)
  guard! _args[1].0 is YYObj__list_List__preterm_Pretype_(_dollar2)
  YYObj__preterm_Pretype(
    ({();  verbatim_type(_dollar1, _dollar2) 
    })
  )
}

///|
// file:///./grammar.mbty
// 286|    "[" non_empty_list_commas(type_) "]" { $2 }
fn yy_action_152(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj__list_List__preterm_Pretype_(_dollar2)
  YYObj__list_List__preterm_Pretype_(
    ({();  _dollar2 
    })
  )
}

///|
// file:///./grammar.mbty
// 268|    non_empty_list_commas_rev(X) option(",") { $1.rev() }
fn yy_action_153(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__list_List__preterm_Pretype_(_dollar1)
  YYObj__list_List__preterm_Pretype_(
    ({();  _dollar1.rev() 
    })
  )
}

///|
// file:///./grammar.mbty
// 292|    "(" type_ "," non_empty_list_commas(type_) ")" "->" type_ { fun_type($4.prepend($2), $7) }
fn yy_action_154(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[3].0 is YYObj__list_List__preterm_Pretype_(_dollar4)
  guard! _args[1].0 is YYObj__preterm_Pretype(_dollar2)
  guard! _args[6].0 is YYObj__preterm_Pretype(_dollar7)
  YYObj__preterm_Pretype(
    ({();  fun_type(_dollar4.prepend(_dollar2), _dollar7) 
    })
  )
}

///|
// file:///./grammar.mbty
// 277|    "(" type_ "," non_empty_list_commas(type_) ")" { tuple_type($4.prepend($2)) }
fn yy_action_155(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[3].0 is YYObj__list_List__preterm_Pretype_(_dollar4)
  guard! _args[1].0 is YYObj__preterm_Pretype(_dollar2)
  YYObj__preterm_Pretype(
    ({();  tuple_type(_dollar4.prepend(_dollar2)) 
    })
  )
}

///|
// file:///./grammar.mbty
// 293|    "(" type_ ")" "->" type_ { fun_type(@list.singleton($2), $5) }
fn yy_action_156(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj__preterm_Pretype(_dollar2)
  guard! _args[4].0 is YYObj__preterm_Pretype(_dollar5)
  YYObj__preterm_Pretype(
    ({();  fun_type(@list.singleton(_dollar2), _dollar5) 
    })
  )
}

///|
// file:///./grammar.mbty
// 278|    "(" type_ ")" { $2 }
fn yy_action_157(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj__preterm_Pretype(_dollar2)
  YYObj__preterm_Pretype(
    ({();  _dollar2 
    })
  )
}

///|
// file:///./grammar.mbty
// 279|    UIDENT optional_type_arguments { named_type($1, $2) }
fn yy_action_158(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj_String(_dollar1)
  guard! _args[1].0 is YYObj__list_List__preterm_Pretype_(_dollar2)
  YYObj__preterm_Pretype(
    ({();  named_type(_dollar1, _dollar2) 
    })
  )
}

///|
// file:///./grammar.mbty
// 264|    non_empty_list_commas_rev(X) "," X { $1.prepend($3) }
fn yy_action_159(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__list_List__preterm_Pretype_(_dollar1)
  guard! _args[2].0 is YYObj__preterm_Pretype(_dollar3)
  YYObj__list_List__preterm_Pretype_(
    ({();  _dollar1.prepend(_dollar3) 
    })
  )
}

///|
// file:///./stdlib.mbty
// 5|    X { Some($1) }
fn yy_action_160(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _dollar1 = ()
  YYObj_Option_Unit_(
    ({();  Some(_dollar1) 
    })
  )
}

///|
// file:///./stdlib.mbty
// 4|    { None }
fn yy_action_161(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  YYObj_Option_Unit_(
    ({();  None 
    })
  )
}

///|
// file:///./grammar.mbty
// 263|    X { @list.singleton($1) }
fn yy_action_162(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Pretype(_dollar1)
  YYObj__list_List__preterm_Pretype_(
    ({();  @list.singleton(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 287|    { @list.List([]) }
fn yy_action_163(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  YYObj__list_List__preterm_Pretype_(
    ({();  @list.List([]) 
    })
  )
}

///|
// file:///./grammar.mbty
// 281|    INT { finite_type($1) }
fn yy_action_164(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj_String(_dollar1)
  YYObj__preterm_Pretype(
    ({();  finite_type(_dollar1) 
    })
  )
}

///|
// file:///./grammar.mbty
// 282|    "_" { @preterm.dpty }
fn yy_action_165(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  YYObj__preterm_Pretype(
    ({();  @preterm.dpty 
    })
  )
}

///|
// file:///./grammar.mbty
// 291|    simple_type { $1 }
fn yy_action_166(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj__preterm_Pretype(_dollar1)
  YYObj__preterm_Pretype(
    ({();  _dollar1 
    })
  )
}

///|
fn yy_input(token : Token, _start_pos : Int, _end_pos : Int) -> (
  YYSymbol, YYObj
) {
  match token {
    LIDENT(data) => (T_LIDENT, YYObj_String(data))
    UIDENT(data) => (T_UIDENT, YYObj_String(data))
    RAWIDENT(data) => (T_RAWIDENT, YYObj_String(data))
    VERBATIM(data) => (T_VERBATIM, YYObj_String(data))
    INT(data) => (T_INT, YYObj_String(data))
    INFIX1(data) => (T_INFIX1, YYObj_String(data))
    INFIX3(data) => (T_INFIX3, YYObj_String(data))
    DOT_LIDENT(data) => (T_DOT_LIDENT, YYObj_String(data))
    TRUE => (T_TRUE, YYObj_Void)
    FALSE => (T_FALSE, YYObj_Void)
    IF => (T_IF, YYObj_Void)
    ELSE => (T_ELSE, YYObj_Void)
    FN => (T_FN, YYObj_Void)
    MATCH => (T_MATCH, YYObj_Void)
    ENUM => (T_ENUM, YYObj_Void)
    STRUCT => (T_STRUCT, YYObj_Void)
    FORALL => (T_FORALL, YYObj_Void)
    EXISTS => (T_EXISTS, YYObj_Void)
    IMPLIES => (T_IMPLIES, YYObj_Void)
    BARBAR => (T_BARBAR, YYObj_Void)
    BAR => (T_BAR, YYObj_Void)
    AMPERAMPER => (T_AMPERAMPER, YYObj_Void)
    PLUS => (T_PLUS, YYObj_Void)
    MINUS => (T_MINUS, YYObj_Void)
    STAR => (T_STAR, YYObj_Void)
    EXCLAMATION => (T_EXCLAMATION, YYObj_Void)
    LPAREN => (T_LPAREN, YYObj_Void)
    RPAREN => (T_RPAREN, YYObj_Void)
    LBRACKET => (T_LBRACKET, YYObj_Void)
    RBRACKET => (T_RBRACKET, YYObj_Void)
    LBRACE => (T_LBRACE, YYObj_Void)
    RBRACE => (T_RBRACE, YYObj_Void)
    COMMA => (T_COMMA, YYObj_Void)
    COLON => (T_COLON, YYObj_Void)
    SEMI => (T_SEMI, YYObj_Void)
    FAT_ARROW => (T_FAT_ARROW, YYObj_Void)
    THIN_ARROW => (T_THIN_ARROW, YYObj_Void)
    UNDERSCORE => (T_UNDERSCORE, YYObj_Void)
    EOF => (T_EOF, YYObj_Void)
  }
}

///|
fn yy_state_0(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_record_definition => Shift(yy_state_1)
    T_STRUCT => Shift(yy_state_2)
    _ => Error
  }
}

///|
fn yy_state_1(_lookahead : YYSymbol) -> YYDecision {
  Accept
}

///|
fn yy_state_2(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_UIDENT => Shift(yy_state_3)
    _ => Error
  }
}

///|
fn yy_state_3(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LBRACE => Shift(yy_state_4)
    _ => Error
  }
}

///|
fn yy_state_4(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_VERBATIM => Shift(yy_state_5)
    T_RAWIDENT => Shift(yy_state_33)
    T_UIDENT => Shift(yy_state_36)
    T_LIDENT => Shift(yy_state_39)
    NT_struct_field => Shift(yy_state_42)
    NT_struct_fields => Shift(yy_state_46)
    _ => Error
  }
}

///|
fn yy_state_5(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COLON => Shift(yy_state_6)
    _ => Error
  }
}

///|
fn yy_state_6(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_7)
    T_UNDERSCORE => Shift(yy_state_8)
    T_INT => Shift(yy_state_9)
    T_VERBATIM => Shift(yy_state_10)
    T_UIDENT => Shift(yy_state_16)
    T_LPAREN => Shift(yy_state_18)
    NT_type_ => Shift(yy_state_32)
    _ => Error
  }
}

///|
fn yy_state_7(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_type_, yy_action_166)
}

///|
fn yy_state_8(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_simple_type, yy_action_165)
}

///|
fn yy_state_9(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_simple_type, yy_action_164)
}

///|
fn yy_state_10(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LBRACKET => Shift(yy_state_11)
    NT_optional_type_arguments => Shift(yy_state_31)
    T_BAR | T_RPAREN | T_RBRACKET | T_RBRACE | T_COMMA | T_SEMI | T_EOF =>
      Reduce(0, NT_optional_type_arguments, yy_action_163)
    _ => Error
  }
}

///|
fn yy_state_11(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_7)
    T_UNDERSCORE => Shift(yy_state_8)
    T_INT => Shift(yy_state_9)
    T_VERBATIM => Shift(yy_state_10)
    NT_type_ => Shift(yy_state_12)
    NT_non_empty_list_commas_rev_type__ => Shift(yy_state_13)
    T_UIDENT => Shift(yy_state_16)
    T_LPAREN => Shift(yy_state_18)
    NT_non_empty_list_commas_type__ => Shift(yy_state_29)
    _ => Error
  }
}

///|
fn yy_state_12(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_non_empty_list_commas_rev_type__, yy_action_162)
}

///|
fn yy_state_13(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_14)
    NT_option_COMMA_ => Shift(yy_state_28)
    T_RPAREN | T_RBRACKET => Reduce(0, NT_option_COMMA_, yy_action_161)
    _ => Error
  }
}

///|
fn yy_state_14(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_7)
    T_UNDERSCORE => Shift(yy_state_8)
    T_INT => Shift(yy_state_9)
    T_VERBATIM => Shift(yy_state_10)
    NT_type_ => Shift(yy_state_15)
    T_UIDENT => Shift(yy_state_16)
    T_LPAREN => Shift(yy_state_18)
    T_RPAREN | T_RBRACKET => Reduce(1, NT_option_COMMA_, yy_action_160)
    _ => Error
  }
}

///|
fn yy_state_15(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_non_empty_list_commas_rev_type__, yy_action_159)
}

///|
fn yy_state_16(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LBRACKET => Shift(yy_state_11)
    NT_optional_type_arguments => Shift(yy_state_17)
    T_BAR | T_RPAREN | T_RBRACKET | T_RBRACE | T_COMMA | T_SEMI | T_EOF =>
      Reduce(0, NT_optional_type_arguments, yy_action_163)
    _ => Error
  }
}

///|
fn yy_state_17(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_simple_type, yy_action_158)
}

///|
fn yy_state_18(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_7)
    T_UNDERSCORE => Shift(yy_state_8)
    T_INT => Shift(yy_state_9)
    T_VERBATIM => Shift(yy_state_10)
    T_UIDENT => Shift(yy_state_16)
    T_LPAREN => Shift(yy_state_18)
    NT_type_ => Shift(yy_state_19)
    _ => Error
  }
}

///|
fn yy_state_19(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RPAREN => Shift(yy_state_20)
    T_COMMA => Shift(yy_state_23)
    _ => Error
  }
}

///|
fn yy_state_20(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_THIN_ARROW => Shift(yy_state_21)
    T_BAR | T_RPAREN | T_RBRACKET | T_RBRACE | T_COMMA | T_SEMI | T_EOF =>
      Reduce(3, NT_simple_type, yy_action_157)
    _ => Error
  }
}

///|
fn yy_state_21(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_7)
    T_UNDERSCORE => Shift(yy_state_8)
    T_INT => Shift(yy_state_9)
    T_VERBATIM => Shift(yy_state_10)
    T_UIDENT => Shift(yy_state_16)
    T_LPAREN => Shift(yy_state_18)
    NT_type_ => Shift(yy_state_22)
    _ => Error
  }
}

///|
fn yy_state_22(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_type_, yy_action_156)
}

///|
fn yy_state_23(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_7)
    T_UNDERSCORE => Shift(yy_state_8)
    T_INT => Shift(yy_state_9)
    T_VERBATIM => Shift(yy_state_10)
    NT_type_ => Shift(yy_state_12)
    NT_non_empty_list_commas_rev_type__ => Shift(yy_state_13)
    T_UIDENT => Shift(yy_state_16)
    T_LPAREN => Shift(yy_state_18)
    NT_non_empty_list_commas_type__ => Shift(yy_state_24)
    _ => Error
  }
}

///|
fn yy_state_24(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RPAREN => Shift(yy_state_25)
    _ => Error
  }
}

///|
fn yy_state_25(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_THIN_ARROW => Shift(yy_state_26)
    T_BAR | T_RPAREN | T_RBRACKET | T_RBRACE | T_COMMA | T_SEMI | T_EOF =>
      Reduce(5, NT_simple_type, yy_action_155)
    _ => Error
  }
}

///|
fn yy_state_26(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_7)
    T_UNDERSCORE => Shift(yy_state_8)
    T_INT => Shift(yy_state_9)
    T_VERBATIM => Shift(yy_state_10)
    T_UIDENT => Shift(yy_state_16)
    T_LPAREN => Shift(yy_state_18)
    NT_type_ => Shift(yy_state_27)
    _ => Error
  }
}

///|
fn yy_state_27(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(7, NT_type_, yy_action_154)
}

///|
fn yy_state_28(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_non_empty_list_commas_type__, yy_action_153)
}

///|
fn yy_state_29(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RBRACKET => Shift(yy_state_30)
    _ => Error
  }
}

///|
fn yy_state_30(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_optional_type_arguments, yy_action_152)
}

///|
fn yy_state_31(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_simple_type, yy_action_151)
}

///|
fn yy_state_32(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_struct_field, yy_action_150)
}

///|
fn yy_state_33(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COLON => Shift(yy_state_34)
    _ => Error
  }
}

///|
fn yy_state_34(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_7)
    T_UNDERSCORE => Shift(yy_state_8)
    T_INT => Shift(yy_state_9)
    T_VERBATIM => Shift(yy_state_10)
    T_UIDENT => Shift(yy_state_16)
    T_LPAREN => Shift(yy_state_18)
    NT_type_ => Shift(yy_state_35)
    _ => Error
  }
}

///|
fn yy_state_35(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_struct_field, yy_action_149)
}

///|
fn yy_state_36(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COLON => Shift(yy_state_37)
    _ => Error
  }
}

///|
fn yy_state_37(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_7)
    T_UNDERSCORE => Shift(yy_state_8)
    T_INT => Shift(yy_state_9)
    T_VERBATIM => Shift(yy_state_10)
    T_UIDENT => Shift(yy_state_16)
    T_LPAREN => Shift(yy_state_18)
    NT_type_ => Shift(yy_state_38)
    _ => Error
  }
}

///|
fn yy_state_38(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_struct_field, yy_action_148)
}

///|
fn yy_state_39(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COLON => Shift(yy_state_40)
    _ => Error
  }
}

///|
fn yy_state_40(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_7)
    T_UNDERSCORE => Shift(yy_state_8)
    T_INT => Shift(yy_state_9)
    T_VERBATIM => Shift(yy_state_10)
    T_UIDENT => Shift(yy_state_16)
    T_LPAREN => Shift(yy_state_18)
    NT_type_ => Shift(yy_state_41)
    _ => Error
  }
}

///|
fn yy_state_41(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_struct_field, yy_action_147)
}

///|
fn yy_state_42(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_SEMI => Shift(yy_state_43)
    NT_option_SEMI_ => Shift(yy_state_45)
    T_RBRACE => Reduce(0, NT_option_SEMI_, yy_action_146)
    _ => Error
  }
}

///|
fn yy_state_43(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_VERBATIM => Shift(yy_state_5)
    T_RAWIDENT => Shift(yy_state_33)
    T_UIDENT => Shift(yy_state_36)
    T_LIDENT => Shift(yy_state_39)
    NT_struct_field => Shift(yy_state_42)
    NT_struct_fields => Shift(yy_state_44)
    T_RBRACE => Reduce(1, NT_option_SEMI_, yy_action_145)
    _ => Error
  }
}

///|
fn yy_state_44(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_struct_fields, yy_action_144)
}

///|
fn yy_state_45(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_struct_fields, yy_action_143)
}

///|
fn yy_state_46(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RBRACE => Shift(yy_state_47)
    _ => Error
  }
}

///|
fn yy_state_47(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_EOF => Shift(yy_state_48)
    _ => Error
  }
}

///|
fn yy_state_48(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(6, NT_record_definition, yy_action_142)
}

///|
fn yy_state_49(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_type_definition => Shift(yy_state_50)
    T_ENUM => Shift(yy_state_51)
    NT_enum_decl => Shift(yy_state_72)
    NT_enum_decls => Shift(yy_state_74)
    _ => Error
  }
}

///|
fn yy_state_50(_lookahead : YYSymbol) -> YYDecision {
  Accept
}

///|
fn yy_state_51(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_VERBATIM => Shift(yy_state_52)
    T_UIDENT => Shift(yy_state_68)
    _ => Error
  }
}

///|
fn yy_state_52(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LBRACE => Shift(yy_state_53)
    _ => Error
  }
}

///|
fn yy_state_53(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_VERBATIM => Shift(yy_state_54)
    T_RAWIDENT => Shift(yy_state_55)
    T_UIDENT => Shift(yy_state_56)
    T_LIDENT => Shift(yy_state_57)
    NT_constructor_name => Shift(yy_state_58)
    NT_enum_constructor => Shift(yy_state_62)
    NT_enum_constructors => Shift(yy_state_66)
    _ => Error
  }
}

///|
fn yy_state_54(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_constructor_name, yy_action_141)
}

///|
fn yy_state_55(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_constructor_name, yy_action_140)
}

///|
fn yy_state_56(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_constructor_name, yy_action_139)
}

///|
fn yy_state_57(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_constructor_name, yy_action_138)
}

///|
fn yy_state_58(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LPAREN => Shift(yy_state_59)
    T_RBRACE | T_SEMI => Reduce(1, NT_enum_constructor, yy_action_137)
    _ => Error
  }
}

///|
fn yy_state_59(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_7)
    T_UNDERSCORE => Shift(yy_state_8)
    T_INT => Shift(yy_state_9)
    T_VERBATIM => Shift(yy_state_10)
    NT_type_ => Shift(yy_state_12)
    NT_non_empty_list_commas_rev_type__ => Shift(yy_state_13)
    T_UIDENT => Shift(yy_state_16)
    T_LPAREN => Shift(yy_state_18)
    NT_non_empty_list_commas_type__ => Shift(yy_state_60)
    _ => Error
  }
}

///|
fn yy_state_60(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RPAREN => Shift(yy_state_61)
    _ => Error
  }
}

///|
fn yy_state_61(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(4, NT_enum_constructor, yy_action_136)
}

///|
fn yy_state_62(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_SEMI => Shift(yy_state_63)
    NT_option_SEMI_ => Shift(yy_state_65)
    T_RBRACE => Reduce(0, NT_option_SEMI_, yy_action_146)
    _ => Error
  }
}

///|
fn yy_state_63(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_VERBATIM => Shift(yy_state_54)
    T_RAWIDENT => Shift(yy_state_55)
    T_UIDENT => Shift(yy_state_56)
    T_LIDENT => Shift(yy_state_57)
    NT_constructor_name => Shift(yy_state_58)
    NT_enum_constructor => Shift(yy_state_62)
    NT_enum_constructors => Shift(yy_state_64)
    T_RBRACE => Reduce(1, NT_option_SEMI_, yy_action_145)
    _ => Error
  }
}

///|
fn yy_state_64(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_enum_constructors, yy_action_135)
}

///|
fn yy_state_65(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_enum_constructors, yy_action_134)
}

///|
fn yy_state_66(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RBRACE => Shift(yy_state_67)
    _ => Error
  }
}

///|
fn yy_state_67(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_enum_decl, yy_action_133)
}

///|
fn yy_state_68(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LBRACE => Shift(yy_state_69)
    _ => Error
  }
}

///|
fn yy_state_69(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_VERBATIM => Shift(yy_state_54)
    T_RAWIDENT => Shift(yy_state_55)
    T_UIDENT => Shift(yy_state_56)
    T_LIDENT => Shift(yy_state_57)
    NT_constructor_name => Shift(yy_state_58)
    NT_enum_constructor => Shift(yy_state_62)
    NT_enum_constructors => Shift(yy_state_70)
    _ => Error
  }
}

///|
fn yy_state_70(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RBRACE => Shift(yy_state_71)
    _ => Error
  }
}

///|
fn yy_state_71(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_enum_decl, yy_action_132)
}

///|
fn yy_state_72(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_ENUM => Shift(yy_state_51)
    NT_enum_decl => Shift(yy_state_72)
    NT_enum_decls => Shift(yy_state_73)
    T_EOF => Reduce(1, NT_enum_decls, yy_action_131)
    _ => Error
  }
}

///|
fn yy_state_73(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_enum_decls, yy_action_130)
}

///|
fn yy_state_74(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_EOF => Shift(yy_state_75)
    _ => Error
  }
}

///|
fn yy_state_75(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_type_definition, yy_action_129)
}

///|
fn yy_state_76(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_7)
    T_UNDERSCORE => Shift(yy_state_8)
    T_INT => Shift(yy_state_9)
    T_VERBATIM => Shift(yy_state_10)
    T_UIDENT => Shift(yy_state_16)
    T_LPAREN => Shift(yy_state_18)
    NT_pretype => Shift(yy_state_77)
    NT_type_ => Shift(yy_state_78)
    _ => Error
  }
}

///|
fn yy_state_77(_lookahead : YYSymbol) -> YYDecision {
  Accept
}

///|
fn yy_state_78(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_EOF => Shift(yy_state_79)
    _ => Error
  }
}

///|
fn yy_state_79(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_pretype, yy_action_128)
}

///|
fn yy_state_80(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_term => Shift(yy_state_81)
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    T_VERBATIM => Shift(yy_state_123)
    T_RAWIDENT => Shift(yy_state_126)
    T_UIDENT => Shift(yy_state_129)
    T_LIDENT => Shift(yy_state_132)
    T_LPAREN => Shift(yy_state_135)
    T_EXISTS => Shift(yy_state_207)
    T_FORALL => Shift(yy_state_231)
    T_IF => Shift(yy_state_277)
    NT_infix_expr => Shift(yy_state_286)
    NT_arrow_fn_expr => Shift(yy_state_287)
    NT_quantifier_expr => Shift(yy_state_288)
    NT_if_expr => Shift(yy_state_289)
    NT_expr => Shift(yy_state_394)
    _ => Error
  }
}

///|
fn yy_state_81(_lookahead : YYSymbol) -> YYDecision {
  Accept
}

///|
fn yy_state_82(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_atomic_expr, yy_action_127)
}

///|
fn yy_state_83(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_atomic_expr, yy_action_126)
}

///|
fn yy_state_84(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_atomic_expr, yy_action_125)
}

///|
fn yy_state_85(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_VERBATIM => Shift(yy_state_108)
    T_RAWIDENT => Shift(yy_state_109)
    T_LIDENT => Shift(yy_state_110)
    T_UIDENT => Shift(yy_state_111)
    T_LPAREN => Shift(yy_state_112)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    NT_infix_expr => Shift(yy_state_390)
    _ => Error
  }
}

///|
fn yy_state_86(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LBRACE => Shift(yy_state_87)
    _ => Error
  }
}

///|
fn yy_state_87(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    NT_match_arm => Shift(yy_state_88)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_VERBATIM => Shift(yy_state_108)
    T_RAWIDENT => Shift(yy_state_109)
    T_LIDENT => Shift(yy_state_110)
    T_UIDENT => Shift(yy_state_111)
    T_LPAREN => Shift(yy_state_112)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    NT_infix_expr => Shift(yy_state_380)
    NT_match_arms => Shift(yy_state_388)
    _ => Error
  }
}

///|
fn yy_state_88(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_SEMI => Shift(yy_state_89)
    NT_option_SEMI_ => Shift(yy_state_387)
    T_RBRACE => Reduce(0, NT_option_SEMI_, yy_action_146)
    _ => Error
  }
}

///|
fn yy_state_89(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    NT_match_arm => Shift(yy_state_88)
    NT_match_arms => Shift(yy_state_90)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_VERBATIM => Shift(yy_state_108)
    T_RAWIDENT => Shift(yy_state_109)
    T_LIDENT => Shift(yy_state_110)
    T_UIDENT => Shift(yy_state_111)
    T_LPAREN => Shift(yy_state_112)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    NT_infix_expr => Shift(yy_state_380)
    T_RBRACE => Reduce(1, NT_option_SEMI_, yy_action_145)
    _ => Error
  }
}

///|
fn yy_state_90(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_match_arms, yy_action_124)
}

///|
fn yy_state_91(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    NT_non_empty_list_commas_rev_expr_ => Shift(yy_state_92)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    T_VERBATIM => Shift(yy_state_123)
    T_RAWIDENT => Shift(yy_state_126)
    T_UIDENT => Shift(yy_state_129)
    T_LIDENT => Shift(yy_state_132)
    T_LPAREN => Shift(yy_state_135)
    T_EXISTS => Shift(yy_state_207)
    T_FORALL => Shift(yy_state_231)
    T_IF => Shift(yy_state_277)
    NT_infix_expr => Shift(yy_state_286)
    NT_arrow_fn_expr => Shift(yy_state_287)
    NT_quantifier_expr => Shift(yy_state_288)
    NT_if_expr => Shift(yy_state_289)
    NT_expr => Shift(yy_state_348)
    NT_non_empty_list_commas_expr_ => Shift(yy_state_377)
    T_RBRACE => Shift(yy_state_379)
    _ => Error
  }
}

///|
fn yy_state_92(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_93)
    NT_option_COMMA_ => Shift(yy_state_347)
    T_RPAREN | T_RBRACKET | T_RBRACE =>
      Reduce(0, NT_option_COMMA_, yy_action_161)
    _ => Error
  }
}

///|
fn yy_state_93(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    NT_expr => Shift(yy_state_94)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    T_VERBATIM => Shift(yy_state_123)
    T_RAWIDENT => Shift(yy_state_126)
    T_UIDENT => Shift(yy_state_129)
    T_LIDENT => Shift(yy_state_132)
    T_LPAREN => Shift(yy_state_135)
    T_EXISTS => Shift(yy_state_207)
    T_FORALL => Shift(yy_state_231)
    T_IF => Shift(yy_state_277)
    NT_infix_expr => Shift(yy_state_286)
    NT_arrow_fn_expr => Shift(yy_state_287)
    NT_quantifier_expr => Shift(yy_state_288)
    NT_if_expr => Shift(yy_state_289)
    T_RPAREN | T_RBRACKET | T_RBRACE =>
      Reduce(1, NT_option_COMMA_, yy_action_160)
    _ => Error
  }
}

///|
fn yy_state_94(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_non_empty_list_commas_rev_expr_, yy_action_123)
}

///|
fn yy_state_95(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    NT_non_empty_list_commas_rev_expr_ => Shift(yy_state_92)
    T_LBRACKET => Shift(yy_state_95)
    NT_expr => Shift(yy_state_96)
    NT_non_empty_list_commas_expr_ => Shift(yy_state_97)
    NT_list_commas_expr_ => Shift(yy_state_98)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    T_VERBATIM => Shift(yy_state_123)
    T_RAWIDENT => Shift(yy_state_126)
    T_UIDENT => Shift(yy_state_129)
    T_LIDENT => Shift(yy_state_132)
    T_LPAREN => Shift(yy_state_135)
    T_EXISTS => Shift(yy_state_207)
    T_FORALL => Shift(yy_state_231)
    T_IF => Shift(yy_state_277)
    NT_infix_expr => Shift(yy_state_286)
    NT_arrow_fn_expr => Shift(yy_state_287)
    NT_quantifier_expr => Shift(yy_state_288)
    NT_if_expr => Shift(yy_state_289)
    T_RBRACKET => Reduce(0, NT_list_commas_expr_, yy_action_122)
    _ => Error
  }
}

///|
fn yy_state_96(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_non_empty_list_commas_rev_expr_, yy_action_121)
}

///|
fn yy_state_97(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_list_commas_expr_, yy_action_120)
}

///|
fn yy_state_98(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RBRACKET => Shift(yy_state_99)
    _ => Error
  }
}

///|
fn yy_state_99(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_simple_expr, yy_action_119)
}

///|
fn yy_state_100(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_simple_expr, yy_action_118)
}

///|
fn yy_state_101(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_simple_expr, yy_action_117)
}

///|
fn yy_state_102(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_DOT_LIDENT => Shift(yy_state_103)
    T_LPAREN => Shift(yy_state_344)
    T_INFIX1 | T_INFIX3 | T_IF | T_IMPLIES | T_BARBAR | T_BAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_RPAREN | T_RBRACKET | T_LBRACE | T_RBRACE | T_COMMA | T_COLON | T_SEMI | T_FAT_ARROW | T_EOF =>
      Reduce(1, NT_prefix_expr, yy_action_116)
    _ => Error
  }
}

///|
fn yy_state_103(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LPAREN => Shift(yy_state_104)
    _ => Error
  }
}

///|
fn yy_state_104(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    NT_non_empty_list_commas_rev_expr_ => Shift(yy_state_92)
    T_LBRACKET => Shift(yy_state_95)
    NT_expr => Shift(yy_state_96)
    NT_non_empty_list_commas_expr_ => Shift(yy_state_97)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    NT_list_commas_expr_ => Shift(yy_state_105)
    T_EXCLAMATION => Shift(yy_state_107)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    T_VERBATIM => Shift(yy_state_123)
    T_RAWIDENT => Shift(yy_state_126)
    T_UIDENT => Shift(yy_state_129)
    T_LIDENT => Shift(yy_state_132)
    T_LPAREN => Shift(yy_state_135)
    T_EXISTS => Shift(yy_state_207)
    T_FORALL => Shift(yy_state_231)
    T_IF => Shift(yy_state_277)
    NT_infix_expr => Shift(yy_state_286)
    NT_arrow_fn_expr => Shift(yy_state_287)
    NT_quantifier_expr => Shift(yy_state_288)
    NT_if_expr => Shift(yy_state_289)
    T_RPAREN => Reduce(0, NT_list_commas_expr_, yy_action_122)
    _ => Error
  }
}

///|
fn yy_state_105(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RPAREN => Shift(yy_state_106)
    _ => Error
  }
}

///|
fn yy_state_106(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_simple_expr, yy_action_115)
}

///|
fn yy_state_107(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_VERBATIM => Shift(yy_state_108)
    T_RAWIDENT => Shift(yy_state_109)
    T_LIDENT => Shift(yy_state_110)
    T_UIDENT => Shift(yy_state_111)
    T_LPAREN => Shift(yy_state_112)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_343)
    _ => Error
  }
}

///|
fn yy_state_108(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_simple_expr, yy_action_114)
}

///|
fn yy_state_109(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_simple_expr, yy_action_113)
}

///|
fn yy_state_110(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_simple_expr, yy_action_112)
}

///|
fn yy_state_111(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_simple_expr, yy_action_111)
}

///|
fn yy_state_112(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    NT_non_empty_tuple_elems => Shift(yy_state_113)
    NT_expr => Shift(yy_state_114)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    T_LPAREN => Shift(yy_state_135)
    NT_non_empty_tuple_elems_with_prefix => Shift(yy_state_136)
    NT_arrow_fn_prefix_no_constraint => Shift(yy_state_137)
    T_EXISTS => Shift(yy_state_207)
    T_FORALL => Shift(yy_state_231)
    T_IF => Shift(yy_state_277)
    NT_infix_expr => Shift(yy_state_286)
    NT_arrow_fn_expr => Shift(yy_state_287)
    NT_quantifier_expr => Shift(yy_state_288)
    NT_if_expr => Shift(yy_state_289)
    T_VERBATIM => Shift(yy_state_311)
    T_RAWIDENT => Shift(yy_state_331)
    T_UIDENT => Shift(yy_state_335)
    T_LIDENT => Shift(yy_state_339)
    _ => Error
  }
}

///|
fn yy_state_113(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_non_empty_tuple_elems_with_prefix, yy_action_110)
}

///|
fn yy_state_114(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_115)
    T_RPAREN => Shift(yy_state_119)
    T_COLON => Shift(yy_state_308)
    _ => Error
  }
}

///|
fn yy_state_115(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    NT_non_empty_tuple_elems => Shift(yy_state_116)
    T_RPAREN => Shift(yy_state_117)
    NT_expr => Shift(yy_state_118)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    T_VERBATIM => Shift(yy_state_123)
    T_RAWIDENT => Shift(yy_state_126)
    T_UIDENT => Shift(yy_state_129)
    T_LIDENT => Shift(yy_state_132)
    T_LPAREN => Shift(yy_state_135)
    T_EXISTS => Shift(yy_state_207)
    T_FORALL => Shift(yy_state_231)
    T_IF => Shift(yy_state_277)
    NT_infix_expr => Shift(yy_state_286)
    NT_arrow_fn_expr => Shift(yy_state_287)
    NT_quantifier_expr => Shift(yy_state_288)
    NT_if_expr => Shift(yy_state_289)
    _ => Error
  }
}

///|
fn yy_state_116(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_non_empty_tuple_elems, yy_action_109)
}

///|
fn yy_state_117(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_non_empty_tuple_elems, yy_action_108)
}

///|
fn yy_state_118(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_115)
    T_RPAREN => Shift(yy_state_119)
    _ => Error
  }
}

///|
fn yy_state_119(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_non_empty_tuple_elems, yy_action_107)
}

///|
fn yy_state_120(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_VERBATIM => Shift(yy_state_108)
    T_RAWIDENT => Shift(yy_state_109)
    T_LIDENT => Shift(yy_state_110)
    T_UIDENT => Shift(yy_state_111)
    T_LPAREN => Shift(yy_state_112)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_121)
    _ => Error
  }
}

///|
fn yy_state_121(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_prefix_expr, yy_action_106)
}

///|
fn yy_state_122(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_infix_expr, yy_action_105)
}

///|
fn yy_state_123(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Shift(yy_state_124)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_BAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN | T_RPAREN | T_RBRACKET | T_RBRACE | T_COMMA | T_COLON | T_SEMI | T_EOF =>
      Reduce(1, NT_simple_expr, yy_action_114)
    _ => Error
  }
}

///|
fn yy_state_124(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    T_VERBATIM => Shift(yy_state_123)
    NT_expr => Shift(yy_state_125)
    T_RAWIDENT => Shift(yy_state_126)
    T_UIDENT => Shift(yy_state_129)
    T_LIDENT => Shift(yy_state_132)
    T_LPAREN => Shift(yy_state_135)
    T_EXISTS => Shift(yy_state_207)
    T_FORALL => Shift(yy_state_231)
    T_IF => Shift(yy_state_277)
    NT_infix_expr => Shift(yy_state_286)
    NT_arrow_fn_expr => Shift(yy_state_287)
    NT_quantifier_expr => Shift(yy_state_288)
    NT_if_expr => Shift(yy_state_289)
    _ => Error
  }
}

///|
fn yy_state_125(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_arrow_fn_expr, yy_action_104)
}

///|
fn yy_state_126(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Shift(yy_state_127)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_BAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN | T_RPAREN | T_RBRACKET | T_RBRACE | T_COMMA | T_COLON | T_SEMI | T_EOF =>
      Reduce(1, NT_simple_expr, yy_action_113)
    _ => Error
  }
}

///|
fn yy_state_127(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    T_VERBATIM => Shift(yy_state_123)
    T_RAWIDENT => Shift(yy_state_126)
    NT_expr => Shift(yy_state_128)
    T_UIDENT => Shift(yy_state_129)
    T_LIDENT => Shift(yy_state_132)
    T_LPAREN => Shift(yy_state_135)
    T_EXISTS => Shift(yy_state_207)
    T_FORALL => Shift(yy_state_231)
    T_IF => Shift(yy_state_277)
    NT_infix_expr => Shift(yy_state_286)
    NT_arrow_fn_expr => Shift(yy_state_287)
    NT_quantifier_expr => Shift(yy_state_288)
    NT_if_expr => Shift(yy_state_289)
    _ => Error
  }
}

///|
fn yy_state_128(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_arrow_fn_expr, yy_action_103)
}

///|
fn yy_state_129(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Shift(yy_state_130)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_BAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN | T_RPAREN | T_RBRACKET | T_RBRACE | T_COMMA | T_COLON | T_SEMI | T_EOF =>
      Reduce(1, NT_simple_expr, yy_action_111)
    _ => Error
  }
}

///|
fn yy_state_130(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    T_VERBATIM => Shift(yy_state_123)
    T_RAWIDENT => Shift(yy_state_126)
    T_UIDENT => Shift(yy_state_129)
    NT_expr => Shift(yy_state_131)
    T_LIDENT => Shift(yy_state_132)
    T_LPAREN => Shift(yy_state_135)
    T_EXISTS => Shift(yy_state_207)
    T_FORALL => Shift(yy_state_231)
    T_IF => Shift(yy_state_277)
    NT_infix_expr => Shift(yy_state_286)
    NT_arrow_fn_expr => Shift(yy_state_287)
    NT_quantifier_expr => Shift(yy_state_288)
    NT_if_expr => Shift(yy_state_289)
    _ => Error
  }
}

///|
fn yy_state_131(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_arrow_fn_expr, yy_action_102)
}

///|
fn yy_state_132(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Shift(yy_state_133)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_BAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN | T_RPAREN | T_RBRACKET | T_RBRACE | T_COMMA | T_COLON | T_SEMI | T_EOF =>
      Reduce(1, NT_simple_expr, yy_action_112)
    _ => Error
  }
}

///|
fn yy_state_133(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    T_VERBATIM => Shift(yy_state_123)
    T_RAWIDENT => Shift(yy_state_126)
    T_UIDENT => Shift(yy_state_129)
    T_LIDENT => Shift(yy_state_132)
    NT_expr => Shift(yy_state_134)
    T_LPAREN => Shift(yy_state_135)
    T_EXISTS => Shift(yy_state_207)
    T_FORALL => Shift(yy_state_231)
    T_IF => Shift(yy_state_277)
    NT_infix_expr => Shift(yy_state_286)
    NT_arrow_fn_expr => Shift(yy_state_287)
    NT_quantifier_expr => Shift(yy_state_288)
    NT_if_expr => Shift(yy_state_289)
    _ => Error
  }
}

///|
fn yy_state_134(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_arrow_fn_expr, yy_action_101)
}

///|
fn yy_state_135(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    NT_non_empty_tuple_elems => Shift(yy_state_113)
    NT_expr => Shift(yy_state_114)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    T_LPAREN => Shift(yy_state_135)
    NT_non_empty_tuple_elems_with_prefix => Shift(yy_state_136)
    NT_arrow_fn_prefix_no_constraint => Shift(yy_state_137)
    T_VERBATIM => Shift(yy_state_138)
    T_EXISTS => Shift(yy_state_207)
    T_FORALL => Shift(yy_state_231)
    T_IF => Shift(yy_state_277)
    NT_infix_expr => Shift(yy_state_286)
    NT_arrow_fn_expr => Shift(yy_state_287)
    NT_quantifier_expr => Shift(yy_state_288)
    NT_if_expr => Shift(yy_state_289)
    T_RAWIDENT => Shift(yy_state_293)
    T_UIDENT => Shift(yy_state_297)
    T_LIDENT => Shift(yy_state_301)
    NT_arrow_fn_prefix => Shift(yy_state_305)
    _ => Error
  }
}

///|
fn yy_state_136(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_tuple_expr, yy_action_100)
}

///|
fn yy_state_137(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_tuple_expr, yy_action_99)
}

///|
fn yy_state_138(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Shift(yy_state_124)
    T_COLON => Shift(yy_state_139)
    T_COMMA => Shift(yy_state_186)
    T_RPAREN => Shift(yy_state_191)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN =>
      Reduce(1, NT_simple_expr, yy_action_114)
    _ => Error
  }
}

///|
fn yy_state_139(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_7)
    T_UNDERSCORE => Shift(yy_state_8)
    T_INT => Shift(yy_state_9)
    T_VERBATIM => Shift(yy_state_10)
    T_UIDENT => Shift(yy_state_16)
    T_LPAREN => Shift(yy_state_18)
    NT_type_ => Shift(yy_state_140)
    _ => Error
  }
}

///|
fn yy_state_140(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_141)
    T_RPAREN => Shift(yy_state_185)
    _ => Error
  }
}

///|
fn yy_state_141(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_arrow_fn_prefix => Shift(yy_state_142)
    T_RPAREN => Shift(yy_state_143)
    T_VERBATIM => Shift(yy_state_144)
    T_RAWIDENT => Shift(yy_state_151)
    T_UIDENT => Shift(yy_state_157)
    T_LIDENT => Shift(yy_state_163)
    _ => Error
  }
}

///|
fn yy_state_142(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_arrow_fn_prefix, yy_action_98)
}

///|
fn yy_state_143(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_arrow_fn_prefix, yy_action_97)
}

///|
fn yy_state_144(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COLON => Shift(yy_state_145)
    T_COMMA => Shift(yy_state_148)
    T_RPAREN => Shift(yy_state_184)
    _ => Error
  }
}

///|
fn yy_state_145(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_7)
    T_UNDERSCORE => Shift(yy_state_8)
    T_INT => Shift(yy_state_9)
    T_VERBATIM => Shift(yy_state_10)
    T_UIDENT => Shift(yy_state_16)
    T_LPAREN => Shift(yy_state_18)
    NT_type_ => Shift(yy_state_146)
    _ => Error
  }
}

///|
fn yy_state_146(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_141)
    T_RPAREN => Shift(yy_state_147)
    _ => Error
  }
}

///|
fn yy_state_147(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(4, NT_arrow_fn_prefix, yy_action_96)
}

///|
fn yy_state_148(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_VERBATIM => Shift(yy_state_144)
    NT_arrow_fn_prefix => Shift(yy_state_149)
    T_RPAREN => Shift(yy_state_150)
    T_RAWIDENT => Shift(yy_state_151)
    T_UIDENT => Shift(yy_state_157)
    T_LIDENT => Shift(yy_state_163)
    _ => Error
  }
}

///|
fn yy_state_149(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_arrow_fn_prefix, yy_action_95)
}

///|
fn yy_state_150(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_arrow_fn_prefix, yy_action_94)
}

///|
fn yy_state_151(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COLON => Shift(yy_state_152)
    T_COMMA => Shift(yy_state_180)
    T_RPAREN => Shift(yy_state_183)
    _ => Error
  }
}

///|
fn yy_state_152(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_7)
    T_UNDERSCORE => Shift(yy_state_8)
    T_INT => Shift(yy_state_9)
    T_VERBATIM => Shift(yy_state_10)
    T_UIDENT => Shift(yy_state_16)
    T_LPAREN => Shift(yy_state_18)
    NT_type_ => Shift(yy_state_153)
    _ => Error
  }
}

///|
fn yy_state_153(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_154)
    T_RPAREN => Shift(yy_state_179)
    _ => Error
  }
}

///|
fn yy_state_154(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_VERBATIM => Shift(yy_state_144)
    T_RAWIDENT => Shift(yy_state_151)
    NT_arrow_fn_prefix => Shift(yy_state_155)
    T_RPAREN => Shift(yy_state_156)
    T_UIDENT => Shift(yy_state_157)
    T_LIDENT => Shift(yy_state_163)
    _ => Error
  }
}

///|
fn yy_state_155(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_arrow_fn_prefix, yy_action_93)
}

///|
fn yy_state_156(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_arrow_fn_prefix, yy_action_92)
}

///|
fn yy_state_157(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COLON => Shift(yy_state_158)
    T_COMMA => Shift(yy_state_175)
    T_RPAREN => Shift(yy_state_178)
    _ => Error
  }
}

///|
fn yy_state_158(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_7)
    T_UNDERSCORE => Shift(yy_state_8)
    T_INT => Shift(yy_state_9)
    T_VERBATIM => Shift(yy_state_10)
    T_UIDENT => Shift(yy_state_16)
    T_LPAREN => Shift(yy_state_18)
    NT_type_ => Shift(yy_state_159)
    _ => Error
  }
}

///|
fn yy_state_159(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_160)
    T_RPAREN => Shift(yy_state_174)
    _ => Error
  }
}

///|
fn yy_state_160(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_VERBATIM => Shift(yy_state_144)
    T_RAWIDENT => Shift(yy_state_151)
    T_UIDENT => Shift(yy_state_157)
    NT_arrow_fn_prefix => Shift(yy_state_161)
    T_RPAREN => Shift(yy_state_162)
    T_LIDENT => Shift(yy_state_163)
    _ => Error
  }
}

///|
fn yy_state_161(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_arrow_fn_prefix, yy_action_91)
}

///|
fn yy_state_162(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_arrow_fn_prefix, yy_action_90)
}

///|
fn yy_state_163(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COLON => Shift(yy_state_164)
    T_COMMA => Shift(yy_state_170)
    T_RPAREN => Shift(yy_state_173)
    _ => Error
  }
}

///|
fn yy_state_164(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_7)
    T_UNDERSCORE => Shift(yy_state_8)
    T_INT => Shift(yy_state_9)
    T_VERBATIM => Shift(yy_state_10)
    T_UIDENT => Shift(yy_state_16)
    T_LPAREN => Shift(yy_state_18)
    NT_type_ => Shift(yy_state_165)
    _ => Error
  }
}

///|
fn yy_state_165(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_166)
    T_RPAREN => Shift(yy_state_169)
    _ => Error
  }
}

///|
fn yy_state_166(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_VERBATIM => Shift(yy_state_144)
    T_RAWIDENT => Shift(yy_state_151)
    T_UIDENT => Shift(yy_state_157)
    T_LIDENT => Shift(yy_state_163)
    NT_arrow_fn_prefix => Shift(yy_state_167)
    T_RPAREN => Shift(yy_state_168)
    _ => Error
  }
}

///|
fn yy_state_167(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_arrow_fn_prefix, yy_action_89)
}

///|
fn yy_state_168(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_arrow_fn_prefix, yy_action_88)
}

///|
fn yy_state_169(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(4, NT_arrow_fn_prefix, yy_action_87)
}

///|
fn yy_state_170(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_VERBATIM => Shift(yy_state_144)
    T_RAWIDENT => Shift(yy_state_151)
    T_UIDENT => Shift(yy_state_157)
    T_LIDENT => Shift(yy_state_163)
    NT_arrow_fn_prefix => Shift(yy_state_171)
    T_RPAREN => Shift(yy_state_172)
    _ => Error
  }
}

///|
fn yy_state_171(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_arrow_fn_prefix, yy_action_86)
}

///|
fn yy_state_172(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_arrow_fn_prefix, yy_action_85)
}

///|
fn yy_state_173(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_arrow_fn_prefix, yy_action_84)
}

///|
fn yy_state_174(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(4, NT_arrow_fn_prefix, yy_action_83)
}

///|
fn yy_state_175(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_VERBATIM => Shift(yy_state_144)
    T_RAWIDENT => Shift(yy_state_151)
    T_UIDENT => Shift(yy_state_157)
    T_LIDENT => Shift(yy_state_163)
    NT_arrow_fn_prefix => Shift(yy_state_176)
    T_RPAREN => Shift(yy_state_177)
    _ => Error
  }
}

///|
fn yy_state_176(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_arrow_fn_prefix, yy_action_82)
}

///|
fn yy_state_177(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_arrow_fn_prefix, yy_action_81)
}

///|
fn yy_state_178(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_arrow_fn_prefix, yy_action_80)
}

///|
fn yy_state_179(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(4, NT_arrow_fn_prefix, yy_action_79)
}

///|
fn yy_state_180(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_VERBATIM => Shift(yy_state_144)
    T_RAWIDENT => Shift(yy_state_151)
    T_UIDENT => Shift(yy_state_157)
    T_LIDENT => Shift(yy_state_163)
    NT_arrow_fn_prefix => Shift(yy_state_181)
    T_RPAREN => Shift(yy_state_182)
    _ => Error
  }
}

///|
fn yy_state_181(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_arrow_fn_prefix, yy_action_78)
}

///|
fn yy_state_182(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_arrow_fn_prefix, yy_action_77)
}

///|
fn yy_state_183(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_arrow_fn_prefix, yy_action_76)
}

///|
fn yy_state_184(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_arrow_fn_prefix, yy_action_75)
}

///|
fn yy_state_185(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Reduce(4, NT_arrow_fn_prefix, yy_action_96)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_BAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN | T_RPAREN | T_RBRACKET | T_RBRACE | T_COMMA | T_COLON | T_SEMI | T_EOF =>
      Reduce(5, NT_tuple_expr, yy_action_74)
    _ => Error
  }
}

///|
fn yy_state_186(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    NT_non_empty_tuple_elems => Shift(yy_state_113)
    NT_expr => Shift(yy_state_118)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    T_LPAREN => Shift(yy_state_135)
    NT_arrow_fn_prefix => Shift(yy_state_149)
    NT_non_empty_tuple_elems_with_prefix => Shift(yy_state_187)
    NT_arrow_fn_prefix_no_constraint => Shift(yy_state_188)
    T_RPAREN => Shift(yy_state_189)
    T_VERBATIM => Shift(yy_state_190)
    T_RAWIDENT => Shift(yy_state_192)
    T_UIDENT => Shift(yy_state_197)
    T_LIDENT => Shift(yy_state_202)
    T_EXISTS => Shift(yy_state_207)
    T_FORALL => Shift(yy_state_231)
    T_IF => Shift(yy_state_277)
    NT_infix_expr => Shift(yy_state_286)
    NT_arrow_fn_expr => Shift(yy_state_287)
    NT_quantifier_expr => Shift(yy_state_288)
    NT_if_expr => Shift(yy_state_289)
    _ => Error
  }
}

///|
fn yy_state_187(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_non_empty_tuple_elems_with_prefix, yy_action_73)
}

///|
fn yy_state_188(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_arrow_fn_prefix_no_constraint, yy_action_72)
}

///|
fn yy_state_189(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Reduce(3, NT_arrow_fn_prefix, yy_action_94)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_BAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN | T_RPAREN | T_RBRACKET | T_RBRACE | T_COMMA | T_COLON | T_SEMI | T_EOF =>
      Reduce(3, NT_arrow_fn_prefix_no_constraint, yy_action_71)
    _ => Error
  }
}

///|
fn yy_state_190(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Shift(yy_state_124)
    T_COLON => Shift(yy_state_145)
    T_COMMA => Shift(yy_state_186)
    T_RPAREN => Shift(yy_state_191)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN =>
      Reduce(1, NT_simple_expr, yy_action_114)
    _ => Error
  }
}

///|
fn yy_state_191(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Reduce(2, NT_arrow_fn_prefix, yy_action_75)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_BAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN | T_RPAREN | T_RBRACKET | T_RBRACE | T_COMMA | T_COLON | T_SEMI | T_EOF =>
      Reduce(2, NT_arrow_fn_prefix_no_constraint, yy_action_70)
    _ => Error
  }
}

///|
fn yy_state_192(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Shift(yy_state_127)
    T_COLON => Shift(yy_state_152)
    T_COMMA => Shift(yy_state_193)
    T_RPAREN => Shift(yy_state_292)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN =>
      Reduce(1, NT_simple_expr, yy_action_113)
    _ => Error
  }
}

///|
fn yy_state_193(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    NT_non_empty_tuple_elems => Shift(yy_state_113)
    NT_expr => Shift(yy_state_118)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    T_LPAREN => Shift(yy_state_135)
    NT_arrow_fn_prefix => Shift(yy_state_181)
    T_VERBATIM => Shift(yy_state_190)
    T_RAWIDENT => Shift(yy_state_192)
    NT_non_empty_tuple_elems_with_prefix => Shift(yy_state_194)
    NT_arrow_fn_prefix_no_constraint => Shift(yy_state_195)
    T_RPAREN => Shift(yy_state_196)
    T_UIDENT => Shift(yy_state_197)
    T_LIDENT => Shift(yy_state_202)
    T_EXISTS => Shift(yy_state_207)
    T_FORALL => Shift(yy_state_231)
    T_IF => Shift(yy_state_277)
    NT_infix_expr => Shift(yy_state_286)
    NT_arrow_fn_expr => Shift(yy_state_287)
    NT_quantifier_expr => Shift(yy_state_288)
    NT_if_expr => Shift(yy_state_289)
    _ => Error
  }
}

///|
fn yy_state_194(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_non_empty_tuple_elems_with_prefix, yy_action_69)
}

///|
fn yy_state_195(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_arrow_fn_prefix_no_constraint, yy_action_68)
}

///|
fn yy_state_196(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Reduce(3, NT_arrow_fn_prefix, yy_action_77)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_BAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN | T_RPAREN | T_RBRACKET | T_RBRACE | T_COMMA | T_COLON | T_SEMI | T_EOF =>
      Reduce(3, NT_arrow_fn_prefix_no_constraint, yy_action_67)
    _ => Error
  }
}

///|
fn yy_state_197(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Shift(yy_state_130)
    T_COLON => Shift(yy_state_158)
    T_COMMA => Shift(yy_state_198)
    T_RPAREN => Shift(yy_state_291)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN =>
      Reduce(1, NT_simple_expr, yy_action_111)
    _ => Error
  }
}

///|
fn yy_state_198(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    NT_non_empty_tuple_elems => Shift(yy_state_113)
    NT_expr => Shift(yy_state_118)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    T_LPAREN => Shift(yy_state_135)
    NT_arrow_fn_prefix => Shift(yy_state_176)
    T_VERBATIM => Shift(yy_state_190)
    T_RAWIDENT => Shift(yy_state_192)
    T_UIDENT => Shift(yy_state_197)
    NT_non_empty_tuple_elems_with_prefix => Shift(yy_state_199)
    NT_arrow_fn_prefix_no_constraint => Shift(yy_state_200)
    T_RPAREN => Shift(yy_state_201)
    T_LIDENT => Shift(yy_state_202)
    T_EXISTS => Shift(yy_state_207)
    T_FORALL => Shift(yy_state_231)
    T_IF => Shift(yy_state_277)
    NT_infix_expr => Shift(yy_state_286)
    NT_arrow_fn_expr => Shift(yy_state_287)
    NT_quantifier_expr => Shift(yy_state_288)
    NT_if_expr => Shift(yy_state_289)
    _ => Error
  }
}

///|
fn yy_state_199(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_non_empty_tuple_elems_with_prefix, yy_action_66)
}

///|
fn yy_state_200(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_arrow_fn_prefix_no_constraint, yy_action_65)
}

///|
fn yy_state_201(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Reduce(3, NT_arrow_fn_prefix, yy_action_81)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_BAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN | T_RPAREN | T_RBRACKET | T_RBRACE | T_COMMA | T_COLON | T_SEMI | T_EOF =>
      Reduce(3, NT_arrow_fn_prefix_no_constraint, yy_action_64)
    _ => Error
  }
}

///|
fn yy_state_202(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Shift(yy_state_133)
    T_COLON => Shift(yy_state_164)
    T_COMMA => Shift(yy_state_203)
    T_RPAREN => Shift(yy_state_290)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN =>
      Reduce(1, NT_simple_expr, yy_action_112)
    _ => Error
  }
}

///|
fn yy_state_203(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    NT_non_empty_tuple_elems => Shift(yy_state_113)
    NT_expr => Shift(yy_state_118)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    T_LPAREN => Shift(yy_state_135)
    NT_arrow_fn_prefix => Shift(yy_state_171)
    T_VERBATIM => Shift(yy_state_190)
    T_RAWIDENT => Shift(yy_state_192)
    T_UIDENT => Shift(yy_state_197)
    T_LIDENT => Shift(yy_state_202)
    NT_non_empty_tuple_elems_with_prefix => Shift(yy_state_204)
    NT_arrow_fn_prefix_no_constraint => Shift(yy_state_205)
    T_RPAREN => Shift(yy_state_206)
    T_EXISTS => Shift(yy_state_207)
    T_FORALL => Shift(yy_state_231)
    T_IF => Shift(yy_state_277)
    NT_infix_expr => Shift(yy_state_286)
    NT_arrow_fn_expr => Shift(yy_state_287)
    NT_quantifier_expr => Shift(yy_state_288)
    NT_if_expr => Shift(yy_state_289)
    _ => Error
  }
}

///|
fn yy_state_204(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_non_empty_tuple_elems_with_prefix, yy_action_63)
}

///|
fn yy_state_205(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_arrow_fn_prefix_no_constraint, yy_action_62)
}

///|
fn yy_state_206(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Reduce(3, NT_arrow_fn_prefix, yy_action_85)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_BAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN | T_RPAREN | T_RBRACKET | T_RBRACE | T_COMMA | T_COLON | T_SEMI | T_EOF =>
      Reduce(3, NT_arrow_fn_prefix_no_constraint, yy_action_61)
    _ => Error
  }
}

///|
fn yy_state_207(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LPAREN => Shift(yy_state_112)
    NT_tuple_expr => Shift(yy_state_208)
    T_VERBATIM => Shift(yy_state_257)
    T_RAWIDENT => Shift(yy_state_262)
    T_UIDENT => Shift(yy_state_267)
    T_LIDENT => Shift(yy_state_272)
    _ => Error
  }
}

///|
fn yy_state_208(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COLON => Shift(yy_state_209)
    _ => Error
  }
}

///|
fn yy_state_209(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_7)
    T_UNDERSCORE => Shift(yy_state_8)
    T_INT => Shift(yy_state_9)
    T_VERBATIM => Shift(yy_state_10)
    T_UIDENT => Shift(yy_state_16)
    T_LPAREN => Shift(yy_state_18)
    NT_type_ => Shift(yy_state_210)
    _ => Error
  }
}

///|
fn yy_state_210(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_211)
    _ => Error
  }
}

///|
fn yy_state_211(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_VERBATIM => Shift(yy_state_108)
    T_RAWIDENT => Shift(yy_state_109)
    T_LIDENT => Shift(yy_state_110)
    T_UIDENT => Shift(yy_state_111)
    T_LPAREN => Shift(yy_state_112)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    T_EXISTS => Shift(yy_state_207)
    NT_infix_expr => Shift(yy_state_212)
    NT_quantifier_expr => Shift(yy_state_229)
    NT_quantifier_body_expr => Shift(yy_state_230)
    T_FORALL => Shift(yy_state_231)
    _ => Error
  }
}

///|
fn yy_state_212(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INFIX3 => Shift(yy_state_213)
    T_STAR => Shift(yy_state_215)
    T_MINUS => Shift(yy_state_217)
    T_PLUS => Shift(yy_state_219)
    T_INFIX1 => Shift(yy_state_221)
    T_AMPERAMPER => Shift(yy_state_223)
    T_BARBAR => Shift(yy_state_225)
    T_IMPLIES => Shift(yy_state_227)
    T_BAR | T_RPAREN | T_RBRACKET | T_RBRACE | T_COMMA | T_COLON | T_SEMI | T_EOF =>
      Reduce(1, NT_quantifier_body_expr, yy_action_59)
    _ => Error
  }
}

///|
fn yy_state_213(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_VERBATIM => Shift(yy_state_108)
    T_RAWIDENT => Shift(yy_state_109)
    T_LIDENT => Shift(yy_state_110)
    T_UIDENT => Shift(yy_state_111)
    T_LPAREN => Shift(yy_state_112)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    NT_infix_expr => Shift(yy_state_214)
    _ => Error
  }
}

///|
fn yy_state_214(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_infix_expr, yy_action_58)
}

///|
fn yy_state_215(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_VERBATIM => Shift(yy_state_108)
    T_RAWIDENT => Shift(yy_state_109)
    T_LIDENT => Shift(yy_state_110)
    T_UIDENT => Shift(yy_state_111)
    T_LPAREN => Shift(yy_state_112)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    NT_infix_expr => Shift(yy_state_216)
    _ => Error
  }
}

///|
fn yy_state_216(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_infix_expr, yy_action_57)
}

///|
fn yy_state_217(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_VERBATIM => Shift(yy_state_108)
    T_RAWIDENT => Shift(yy_state_109)
    T_LIDENT => Shift(yy_state_110)
    T_UIDENT => Shift(yy_state_111)
    T_LPAREN => Shift(yy_state_112)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    NT_infix_expr => Shift(yy_state_218)
    _ => Error
  }
}

///|
fn yy_state_218(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INFIX3 => Shift(yy_state_213)
    T_STAR => Shift(yy_state_215)
    T_INFIX1 | T_IF | T_IMPLIES | T_BARBAR | T_BAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_RPAREN | T_RBRACKET | T_LBRACE | T_RBRACE | T_COMMA | T_COLON | T_SEMI | T_FAT_ARROW | T_EOF =>
      Reduce(3, NT_infix_expr, yy_action_56)
    _ => Error
  }
}

///|
fn yy_state_219(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_VERBATIM => Shift(yy_state_108)
    T_RAWIDENT => Shift(yy_state_109)
    T_LIDENT => Shift(yy_state_110)
    T_UIDENT => Shift(yy_state_111)
    T_LPAREN => Shift(yy_state_112)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    NT_infix_expr => Shift(yy_state_220)
    _ => Error
  }
}

///|
fn yy_state_220(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INFIX3 => Shift(yy_state_213)
    T_STAR => Shift(yy_state_215)
    T_INFIX1 | T_IF | T_IMPLIES | T_BARBAR | T_BAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_RPAREN | T_RBRACKET | T_LBRACE | T_RBRACE | T_COMMA | T_COLON | T_SEMI | T_FAT_ARROW | T_EOF =>
      Reduce(3, NT_infix_expr, yy_action_55)
    _ => Error
  }
}

///|
fn yy_state_221(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_VERBATIM => Shift(yy_state_108)
    T_RAWIDENT => Shift(yy_state_109)
    T_LIDENT => Shift(yy_state_110)
    T_UIDENT => Shift(yy_state_111)
    T_LPAREN => Shift(yy_state_112)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    NT_infix_expr => Shift(yy_state_222)
    _ => Error
  }
}

///|
fn yy_state_222(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INFIX3 => Shift(yy_state_213)
    T_STAR => Shift(yy_state_215)
    T_MINUS => Shift(yy_state_217)
    T_PLUS => Shift(yy_state_219)
    T_INFIX1 | T_IF | T_IMPLIES | T_BARBAR | T_BAR | T_AMPERAMPER | T_RPAREN | T_RBRACKET | T_LBRACE | T_RBRACE | T_COMMA | T_COLON | T_SEMI | T_FAT_ARROW | T_EOF =>
      Reduce(3, NT_infix_expr, yy_action_54)
    _ => Error
  }
}

///|
fn yy_state_223(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_VERBATIM => Shift(yy_state_108)
    T_RAWIDENT => Shift(yy_state_109)
    T_LIDENT => Shift(yy_state_110)
    T_UIDENT => Shift(yy_state_111)
    T_LPAREN => Shift(yy_state_112)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    NT_infix_expr => Shift(yy_state_224)
    _ => Error
  }
}

///|
fn yy_state_224(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INFIX3 => Shift(yy_state_213)
    T_STAR => Shift(yy_state_215)
    T_MINUS => Shift(yy_state_217)
    T_PLUS => Shift(yy_state_219)
    T_INFIX1 => Shift(yy_state_221)
    T_AMPERAMPER => Shift(yy_state_223)
    T_IF | T_IMPLIES | T_BARBAR | T_BAR | T_RPAREN | T_RBRACKET | T_LBRACE | T_RBRACE | T_COMMA | T_COLON | T_SEMI | T_FAT_ARROW | T_EOF =>
      Reduce(3, NT_infix_expr, yy_action_53)
    _ => Error
  }
}

///|
fn yy_state_225(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_VERBATIM => Shift(yy_state_108)
    T_RAWIDENT => Shift(yy_state_109)
    T_LIDENT => Shift(yy_state_110)
    T_UIDENT => Shift(yy_state_111)
    T_LPAREN => Shift(yy_state_112)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    NT_infix_expr => Shift(yy_state_226)
    _ => Error
  }
}

///|
fn yy_state_226(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INFIX3 => Shift(yy_state_213)
    T_STAR => Shift(yy_state_215)
    T_MINUS => Shift(yy_state_217)
    T_PLUS => Shift(yy_state_219)
    T_INFIX1 => Shift(yy_state_221)
    T_AMPERAMPER => Shift(yy_state_223)
    T_BARBAR => Shift(yy_state_225)
    T_IF | T_IMPLIES | T_BAR | T_RPAREN | T_RBRACKET | T_LBRACE | T_RBRACE | T_COMMA | T_COLON | T_SEMI | T_FAT_ARROW | T_EOF =>
      Reduce(3, NT_infix_expr, yy_action_52)
    _ => Error
  }
}

///|
fn yy_state_227(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_VERBATIM => Shift(yy_state_108)
    T_RAWIDENT => Shift(yy_state_109)
    T_LIDENT => Shift(yy_state_110)
    T_UIDENT => Shift(yy_state_111)
    T_LPAREN => Shift(yy_state_112)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    NT_infix_expr => Shift(yy_state_228)
    _ => Error
  }
}

///|
fn yy_state_228(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INFIX3 => Shift(yy_state_213)
    T_STAR => Shift(yy_state_215)
    T_MINUS => Shift(yy_state_217)
    T_PLUS => Shift(yy_state_219)
    T_INFIX1 => Shift(yy_state_221)
    T_AMPERAMPER => Shift(yy_state_223)
    T_BARBAR => Shift(yy_state_225)
    T_IMPLIES => Shift(yy_state_227)
    T_IF | T_BAR | T_RPAREN | T_RBRACKET | T_LBRACE | T_RBRACE | T_COMMA | T_COLON | T_SEMI | T_FAT_ARROW | T_EOF =>
      Reduce(3, NT_infix_expr, yy_action_51)
    _ => Error
  }
}

///|
fn yy_state_229(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_quantifier_body_expr, yy_action_50)
}

///|
fn yy_state_230(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(6, NT_quantifier_expr, yy_action_49)
}

///|
fn yy_state_231(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LPAREN => Shift(yy_state_112)
    NT_tuple_expr => Shift(yy_state_232)
    T_VERBATIM => Shift(yy_state_237)
    T_RAWIDENT => Shift(yy_state_242)
    T_UIDENT => Shift(yy_state_247)
    T_LIDENT => Shift(yy_state_252)
    _ => Error
  }
}

///|
fn yy_state_232(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COLON => Shift(yy_state_233)
    _ => Error
  }
}

///|
fn yy_state_233(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_7)
    T_UNDERSCORE => Shift(yy_state_8)
    T_INT => Shift(yy_state_9)
    T_VERBATIM => Shift(yy_state_10)
    T_UIDENT => Shift(yy_state_16)
    T_LPAREN => Shift(yy_state_18)
    NT_type_ => Shift(yy_state_234)
    _ => Error
  }
}

///|
fn yy_state_234(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_235)
    _ => Error
  }
}

///|
fn yy_state_235(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_VERBATIM => Shift(yy_state_108)
    T_RAWIDENT => Shift(yy_state_109)
    T_LIDENT => Shift(yy_state_110)
    T_UIDENT => Shift(yy_state_111)
    T_LPAREN => Shift(yy_state_112)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    T_EXISTS => Shift(yy_state_207)
    NT_infix_expr => Shift(yy_state_212)
    NT_quantifier_expr => Shift(yy_state_229)
    T_FORALL => Shift(yy_state_231)
    NT_quantifier_body_expr => Shift(yy_state_236)
    _ => Error
  }
}

///|
fn yy_state_236(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(6, NT_quantifier_expr, yy_action_48)
}

///|
fn yy_state_237(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COLON => Shift(yy_state_238)
    _ => Error
  }
}

///|
fn yy_state_238(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_7)
    T_UNDERSCORE => Shift(yy_state_8)
    T_INT => Shift(yy_state_9)
    T_VERBATIM => Shift(yy_state_10)
    T_UIDENT => Shift(yy_state_16)
    T_LPAREN => Shift(yy_state_18)
    NT_type_ => Shift(yy_state_239)
    _ => Error
  }
}

///|
fn yy_state_239(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_240)
    _ => Error
  }
}

///|
fn yy_state_240(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_VERBATIM => Shift(yy_state_108)
    T_RAWIDENT => Shift(yy_state_109)
    T_LIDENT => Shift(yy_state_110)
    T_UIDENT => Shift(yy_state_111)
    T_LPAREN => Shift(yy_state_112)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    T_EXISTS => Shift(yy_state_207)
    NT_infix_expr => Shift(yy_state_212)
    NT_quantifier_expr => Shift(yy_state_229)
    T_FORALL => Shift(yy_state_231)
    NT_quantifier_body_expr => Shift(yy_state_241)
    _ => Error
  }
}

///|
fn yy_state_241(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(6, NT_quantifier_expr, yy_action_47)
}

///|
fn yy_state_242(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COLON => Shift(yy_state_243)
    _ => Error
  }
}

///|
fn yy_state_243(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_7)
    T_UNDERSCORE => Shift(yy_state_8)
    T_INT => Shift(yy_state_9)
    T_VERBATIM => Shift(yy_state_10)
    T_UIDENT => Shift(yy_state_16)
    T_LPAREN => Shift(yy_state_18)
    NT_type_ => Shift(yy_state_244)
    _ => Error
  }
}

///|
fn yy_state_244(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_245)
    _ => Error
  }
}

///|
fn yy_state_245(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_VERBATIM => Shift(yy_state_108)
    T_RAWIDENT => Shift(yy_state_109)
    T_LIDENT => Shift(yy_state_110)
    T_UIDENT => Shift(yy_state_111)
    T_LPAREN => Shift(yy_state_112)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    T_EXISTS => Shift(yy_state_207)
    NT_infix_expr => Shift(yy_state_212)
    NT_quantifier_expr => Shift(yy_state_229)
    T_FORALL => Shift(yy_state_231)
    NT_quantifier_body_expr => Shift(yy_state_246)
    _ => Error
  }
}

///|
fn yy_state_246(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(6, NT_quantifier_expr, yy_action_46)
}

///|
fn yy_state_247(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COLON => Shift(yy_state_248)
    _ => Error
  }
}

///|
fn yy_state_248(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_7)
    T_UNDERSCORE => Shift(yy_state_8)
    T_INT => Shift(yy_state_9)
    T_VERBATIM => Shift(yy_state_10)
    T_UIDENT => Shift(yy_state_16)
    T_LPAREN => Shift(yy_state_18)
    NT_type_ => Shift(yy_state_249)
    _ => Error
  }
}

///|
fn yy_state_249(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_250)
    _ => Error
  }
}

///|
fn yy_state_250(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_VERBATIM => Shift(yy_state_108)
    T_RAWIDENT => Shift(yy_state_109)
    T_LIDENT => Shift(yy_state_110)
    T_UIDENT => Shift(yy_state_111)
    T_LPAREN => Shift(yy_state_112)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    T_EXISTS => Shift(yy_state_207)
    NT_infix_expr => Shift(yy_state_212)
    NT_quantifier_expr => Shift(yy_state_229)
    T_FORALL => Shift(yy_state_231)
    NT_quantifier_body_expr => Shift(yy_state_251)
    _ => Error
  }
}

///|
fn yy_state_251(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(6, NT_quantifier_expr, yy_action_45)
}

///|
fn yy_state_252(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COLON => Shift(yy_state_253)
    _ => Error
  }
}

///|
fn yy_state_253(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_7)
    T_UNDERSCORE => Shift(yy_state_8)
    T_INT => Shift(yy_state_9)
    T_VERBATIM => Shift(yy_state_10)
    T_UIDENT => Shift(yy_state_16)
    T_LPAREN => Shift(yy_state_18)
    NT_type_ => Shift(yy_state_254)
    _ => Error
  }
}

///|
fn yy_state_254(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_255)
    _ => Error
  }
}

///|
fn yy_state_255(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_VERBATIM => Shift(yy_state_108)
    T_RAWIDENT => Shift(yy_state_109)
    T_LIDENT => Shift(yy_state_110)
    T_UIDENT => Shift(yy_state_111)
    T_LPAREN => Shift(yy_state_112)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    T_EXISTS => Shift(yy_state_207)
    NT_infix_expr => Shift(yy_state_212)
    NT_quantifier_expr => Shift(yy_state_229)
    T_FORALL => Shift(yy_state_231)
    NT_quantifier_body_expr => Shift(yy_state_256)
    _ => Error
  }
}

///|
fn yy_state_256(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(6, NT_quantifier_expr, yy_action_44)
}

///|
fn yy_state_257(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COLON => Shift(yy_state_258)
    _ => Error
  }
}

///|
fn yy_state_258(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_7)
    T_UNDERSCORE => Shift(yy_state_8)
    T_INT => Shift(yy_state_9)
    T_VERBATIM => Shift(yy_state_10)
    T_UIDENT => Shift(yy_state_16)
    T_LPAREN => Shift(yy_state_18)
    NT_type_ => Shift(yy_state_259)
    _ => Error
  }
}

///|
fn yy_state_259(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_260)
    _ => Error
  }
}

///|
fn yy_state_260(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_VERBATIM => Shift(yy_state_108)
    T_RAWIDENT => Shift(yy_state_109)
    T_LIDENT => Shift(yy_state_110)
    T_UIDENT => Shift(yy_state_111)
    T_LPAREN => Shift(yy_state_112)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    T_EXISTS => Shift(yy_state_207)
    NT_infix_expr => Shift(yy_state_212)
    NT_quantifier_expr => Shift(yy_state_229)
    T_FORALL => Shift(yy_state_231)
    NT_quantifier_body_expr => Shift(yy_state_261)
    _ => Error
  }
}

///|
fn yy_state_261(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(6, NT_quantifier_expr, yy_action_43)
}

///|
fn yy_state_262(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COLON => Shift(yy_state_263)
    _ => Error
  }
}

///|
fn yy_state_263(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_7)
    T_UNDERSCORE => Shift(yy_state_8)
    T_INT => Shift(yy_state_9)
    T_VERBATIM => Shift(yy_state_10)
    T_UIDENT => Shift(yy_state_16)
    T_LPAREN => Shift(yy_state_18)
    NT_type_ => Shift(yy_state_264)
    _ => Error
  }
}

///|
fn yy_state_264(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_265)
    _ => Error
  }
}

///|
fn yy_state_265(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_VERBATIM => Shift(yy_state_108)
    T_RAWIDENT => Shift(yy_state_109)
    T_LIDENT => Shift(yy_state_110)
    T_UIDENT => Shift(yy_state_111)
    T_LPAREN => Shift(yy_state_112)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    T_EXISTS => Shift(yy_state_207)
    NT_infix_expr => Shift(yy_state_212)
    NT_quantifier_expr => Shift(yy_state_229)
    T_FORALL => Shift(yy_state_231)
    NT_quantifier_body_expr => Shift(yy_state_266)
    _ => Error
  }
}

///|
fn yy_state_266(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(6, NT_quantifier_expr, yy_action_42)
}

///|
fn yy_state_267(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COLON => Shift(yy_state_268)
    _ => Error
  }
}

///|
fn yy_state_268(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_7)
    T_UNDERSCORE => Shift(yy_state_8)
    T_INT => Shift(yy_state_9)
    T_VERBATIM => Shift(yy_state_10)
    T_UIDENT => Shift(yy_state_16)
    T_LPAREN => Shift(yy_state_18)
    NT_type_ => Shift(yy_state_269)
    _ => Error
  }
}

///|
fn yy_state_269(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_270)
    _ => Error
  }
}

///|
fn yy_state_270(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_VERBATIM => Shift(yy_state_108)
    T_RAWIDENT => Shift(yy_state_109)
    T_LIDENT => Shift(yy_state_110)
    T_UIDENT => Shift(yy_state_111)
    T_LPAREN => Shift(yy_state_112)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    T_EXISTS => Shift(yy_state_207)
    NT_infix_expr => Shift(yy_state_212)
    NT_quantifier_expr => Shift(yy_state_229)
    T_FORALL => Shift(yy_state_231)
    NT_quantifier_body_expr => Shift(yy_state_271)
    _ => Error
  }
}

///|
fn yy_state_271(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(6, NT_quantifier_expr, yy_action_41)
}

///|
fn yy_state_272(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COLON => Shift(yy_state_273)
    _ => Error
  }
}

///|
fn yy_state_273(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_7)
    T_UNDERSCORE => Shift(yy_state_8)
    T_INT => Shift(yy_state_9)
    T_VERBATIM => Shift(yy_state_10)
    T_UIDENT => Shift(yy_state_16)
    T_LPAREN => Shift(yy_state_18)
    NT_type_ => Shift(yy_state_274)
    _ => Error
  }
}

///|
fn yy_state_274(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_275)
    _ => Error
  }
}

///|
fn yy_state_275(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_VERBATIM => Shift(yy_state_108)
    T_RAWIDENT => Shift(yy_state_109)
    T_LIDENT => Shift(yy_state_110)
    T_UIDENT => Shift(yy_state_111)
    T_LPAREN => Shift(yy_state_112)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    T_EXISTS => Shift(yy_state_207)
    NT_infix_expr => Shift(yy_state_212)
    NT_quantifier_expr => Shift(yy_state_229)
    T_FORALL => Shift(yy_state_231)
    NT_quantifier_body_expr => Shift(yy_state_276)
    _ => Error
  }
}

///|
fn yy_state_276(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(6, NT_quantifier_expr, yy_action_40)
}

///|
fn yy_state_277(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_VERBATIM => Shift(yy_state_108)
    T_RAWIDENT => Shift(yy_state_109)
    T_LIDENT => Shift(yy_state_110)
    T_UIDENT => Shift(yy_state_111)
    T_LPAREN => Shift(yy_state_112)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    NT_infix_expr => Shift(yy_state_278)
    _ => Error
  }
}

///|
fn yy_state_278(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INFIX3 => Shift(yy_state_213)
    T_STAR => Shift(yy_state_215)
    T_MINUS => Shift(yy_state_217)
    T_PLUS => Shift(yy_state_219)
    T_INFIX1 => Shift(yy_state_221)
    T_AMPERAMPER => Shift(yy_state_223)
    T_BARBAR => Shift(yy_state_225)
    T_IMPLIES => Shift(yy_state_227)
    NT_block_expr => Shift(yy_state_279)
    T_LBRACE => Shift(yy_state_283)
    _ => Error
  }
}

///|
fn yy_state_279(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_ELSE => Shift(yy_state_280)
    _ => Error
  }
}

///|
fn yy_state_280(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IF => Shift(yy_state_277)
    NT_if_expr => Shift(yy_state_281)
    NT_block_expr => Shift(yy_state_282)
    T_LBRACE => Shift(yy_state_283)
    _ => Error
  }
}

///|
fn yy_state_281(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_if_expr, yy_action_39)
}

///|
fn yy_state_282(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_if_expr, yy_action_38)
}

///|
fn yy_state_283(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    T_VERBATIM => Shift(yy_state_123)
    T_RAWIDENT => Shift(yy_state_126)
    T_UIDENT => Shift(yy_state_129)
    T_LIDENT => Shift(yy_state_132)
    T_LPAREN => Shift(yy_state_135)
    T_EXISTS => Shift(yy_state_207)
    T_FORALL => Shift(yy_state_231)
    T_IF => Shift(yy_state_277)
    NT_expr => Shift(yy_state_284)
    NT_infix_expr => Shift(yy_state_286)
    NT_arrow_fn_expr => Shift(yy_state_287)
    NT_quantifier_expr => Shift(yy_state_288)
    NT_if_expr => Shift(yy_state_289)
    _ => Error
  }
}

///|
fn yy_state_284(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RBRACE => Shift(yy_state_285)
    _ => Error
  }
}

///|
fn yy_state_285(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_block_expr, yy_action_37)
}

///|
fn yy_state_286(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INFIX3 => Shift(yy_state_213)
    T_STAR => Shift(yy_state_215)
    T_MINUS => Shift(yy_state_217)
    T_PLUS => Shift(yy_state_219)
    T_INFIX1 => Shift(yy_state_221)
    T_AMPERAMPER => Shift(yy_state_223)
    T_BARBAR => Shift(yy_state_225)
    T_IMPLIES => Shift(yy_state_227)
    T_BAR | T_RPAREN | T_RBRACKET | T_RBRACE | T_COMMA | T_COLON | T_SEMI | T_EOF =>
      Reduce(1, NT_expr, yy_action_36)
    _ => Error
  }
}

///|
fn yy_state_287(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_expr, yy_action_35)
}

///|
fn yy_state_288(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_expr, yy_action_34)
}

///|
fn yy_state_289(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_expr, yy_action_33)
}

///|
fn yy_state_290(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Reduce(2, NT_arrow_fn_prefix, yy_action_84)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_BAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN | T_RPAREN | T_RBRACKET | T_RBRACE | T_COMMA | T_COLON | T_SEMI | T_EOF =>
      Reduce(2, NT_arrow_fn_prefix_no_constraint, yy_action_32)
    _ => Error
  }
}

///|
fn yy_state_291(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Reduce(2, NT_arrow_fn_prefix, yy_action_80)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_BAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN | T_RPAREN | T_RBRACKET | T_RBRACE | T_COMMA | T_COLON | T_SEMI | T_EOF =>
      Reduce(2, NT_arrow_fn_prefix_no_constraint, yy_action_31)
    _ => Error
  }
}

///|
fn yy_state_292(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Reduce(2, NT_arrow_fn_prefix, yy_action_76)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_BAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN | T_RPAREN | T_RBRACKET | T_RBRACE | T_COMMA | T_COLON | T_SEMI | T_EOF =>
      Reduce(2, NT_arrow_fn_prefix_no_constraint, yy_action_30)
    _ => Error
  }
}

///|
fn yy_state_293(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Shift(yy_state_127)
    T_COMMA => Shift(yy_state_193)
    T_RPAREN => Shift(yy_state_292)
    T_COLON => Shift(yy_state_294)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN =>
      Reduce(1, NT_simple_expr, yy_action_113)
    _ => Error
  }
}

///|
fn yy_state_294(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_7)
    T_UNDERSCORE => Shift(yy_state_8)
    T_INT => Shift(yy_state_9)
    T_VERBATIM => Shift(yy_state_10)
    T_UIDENT => Shift(yy_state_16)
    T_LPAREN => Shift(yy_state_18)
    NT_type_ => Shift(yy_state_295)
    _ => Error
  }
}

///|
fn yy_state_295(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_154)
    T_RPAREN => Shift(yy_state_296)
    _ => Error
  }
}

///|
fn yy_state_296(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Reduce(4, NT_arrow_fn_prefix, yy_action_79)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_BAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN | T_RPAREN | T_RBRACKET | T_RBRACE | T_COMMA | T_COLON | T_SEMI | T_EOF =>
      Reduce(5, NT_tuple_expr, yy_action_28)
    _ => Error
  }
}

///|
fn yy_state_297(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Shift(yy_state_130)
    T_COMMA => Shift(yy_state_198)
    T_RPAREN => Shift(yy_state_291)
    T_COLON => Shift(yy_state_298)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN =>
      Reduce(1, NT_simple_expr, yy_action_111)
    _ => Error
  }
}

///|
fn yy_state_298(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_7)
    T_UNDERSCORE => Shift(yy_state_8)
    T_INT => Shift(yy_state_9)
    T_VERBATIM => Shift(yy_state_10)
    T_UIDENT => Shift(yy_state_16)
    T_LPAREN => Shift(yy_state_18)
    NT_type_ => Shift(yy_state_299)
    _ => Error
  }
}

///|
fn yy_state_299(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_160)
    T_RPAREN => Shift(yy_state_300)
    _ => Error
  }
}

///|
fn yy_state_300(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Reduce(4, NT_arrow_fn_prefix, yy_action_83)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_BAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN | T_RPAREN | T_RBRACKET | T_RBRACE | T_COMMA | T_COLON | T_SEMI | T_EOF =>
      Reduce(5, NT_tuple_expr, yy_action_27)
    _ => Error
  }
}

///|
fn yy_state_301(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Shift(yy_state_133)
    T_COMMA => Shift(yy_state_203)
    T_RPAREN => Shift(yy_state_290)
    T_COLON => Shift(yy_state_302)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN =>
      Reduce(1, NT_simple_expr, yy_action_112)
    _ => Error
  }
}

///|
fn yy_state_302(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_7)
    T_UNDERSCORE => Shift(yy_state_8)
    T_INT => Shift(yy_state_9)
    T_VERBATIM => Shift(yy_state_10)
    T_UIDENT => Shift(yy_state_16)
    T_LPAREN => Shift(yy_state_18)
    NT_type_ => Shift(yy_state_303)
    _ => Error
  }
}

///|
fn yy_state_303(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_166)
    T_RPAREN => Shift(yy_state_304)
    _ => Error
  }
}

///|
fn yy_state_304(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Reduce(4, NT_arrow_fn_prefix, yy_action_87)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_BAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN | T_RPAREN | T_RBRACKET | T_RBRACE | T_COMMA | T_COLON | T_SEMI | T_EOF =>
      Reduce(5, NT_tuple_expr, yy_action_26)
    _ => Error
  }
}

///|
fn yy_state_305(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Shift(yy_state_306)
    _ => Error
  }
}

///|
fn yy_state_306(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    T_VERBATIM => Shift(yy_state_123)
    T_RAWIDENT => Shift(yy_state_126)
    T_UIDENT => Shift(yy_state_129)
    T_LIDENT => Shift(yy_state_132)
    T_LPAREN => Shift(yy_state_135)
    T_EXISTS => Shift(yy_state_207)
    T_FORALL => Shift(yy_state_231)
    T_IF => Shift(yy_state_277)
    NT_infix_expr => Shift(yy_state_286)
    NT_arrow_fn_expr => Shift(yy_state_287)
    NT_quantifier_expr => Shift(yy_state_288)
    NT_if_expr => Shift(yy_state_289)
    NT_expr => Shift(yy_state_307)
    _ => Error
  }
}

///|
fn yy_state_307(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(4, NT_arrow_fn_expr, yy_action_25)
}

///|
fn yy_state_308(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_7)
    T_UNDERSCORE => Shift(yy_state_8)
    T_INT => Shift(yy_state_9)
    T_VERBATIM => Shift(yy_state_10)
    T_UIDENT => Shift(yy_state_16)
    T_LPAREN => Shift(yy_state_18)
    NT_type_ => Shift(yy_state_309)
    _ => Error
  }
}

///|
fn yy_state_309(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RPAREN => Shift(yy_state_310)
    _ => Error
  }
}

///|
fn yy_state_310(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_tuple_expr, yy_action_24)
}

///|
fn yy_state_311(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Shift(yy_state_124)
    T_COLON => Shift(yy_state_312)
    T_COMMA => Shift(yy_state_315)
    T_RPAREN => Shift(yy_state_318)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN =>
      Reduce(1, NT_simple_expr, yy_action_114)
    _ => Error
  }
}

///|
fn yy_state_312(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_7)
    T_UNDERSCORE => Shift(yy_state_8)
    T_INT => Shift(yy_state_9)
    T_VERBATIM => Shift(yy_state_10)
    T_UIDENT => Shift(yy_state_16)
    T_LPAREN => Shift(yy_state_18)
    NT_type_ => Shift(yy_state_313)
    _ => Error
  }
}

///|
fn yy_state_313(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RPAREN => Shift(yy_state_314)
    _ => Error
  }
}

///|
fn yy_state_314(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_tuple_expr, yy_action_74)
}

///|
fn yy_state_315(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    NT_non_empty_tuple_elems => Shift(yy_state_113)
    NT_expr => Shift(yy_state_118)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    T_LPAREN => Shift(yy_state_135)
    NT_non_empty_tuple_elems_with_prefix => Shift(yy_state_187)
    NT_arrow_fn_prefix_no_constraint => Shift(yy_state_188)
    T_EXISTS => Shift(yy_state_207)
    T_FORALL => Shift(yy_state_231)
    T_IF => Shift(yy_state_277)
    NT_infix_expr => Shift(yy_state_286)
    NT_arrow_fn_expr => Shift(yy_state_287)
    NT_quantifier_expr => Shift(yy_state_288)
    NT_if_expr => Shift(yy_state_289)
    T_RPAREN => Shift(yy_state_316)
    T_VERBATIM => Shift(yy_state_317)
    T_RAWIDENT => Shift(yy_state_319)
    T_UIDENT => Shift(yy_state_322)
    T_LIDENT => Shift(yy_state_325)
    _ => Error
  }
}

///|
fn yy_state_316(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_arrow_fn_prefix_no_constraint, yy_action_71)
}

///|
fn yy_state_317(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Shift(yy_state_124)
    T_COMMA => Shift(yy_state_315)
    T_RPAREN => Shift(yy_state_318)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN =>
      Reduce(1, NT_simple_expr, yy_action_114)
    _ => Error
  }
}

///|
fn yy_state_318(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_arrow_fn_prefix_no_constraint, yy_action_70)
}

///|
fn yy_state_319(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Shift(yy_state_127)
    T_COMMA => Shift(yy_state_320)
    T_RPAREN => Shift(yy_state_330)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN =>
      Reduce(1, NT_simple_expr, yy_action_113)
    _ => Error
  }
}

///|
fn yy_state_320(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    NT_non_empty_tuple_elems => Shift(yy_state_113)
    NT_expr => Shift(yy_state_118)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    T_LPAREN => Shift(yy_state_135)
    NT_non_empty_tuple_elems_with_prefix => Shift(yy_state_194)
    NT_arrow_fn_prefix_no_constraint => Shift(yy_state_195)
    T_EXISTS => Shift(yy_state_207)
    T_FORALL => Shift(yy_state_231)
    T_IF => Shift(yy_state_277)
    NT_infix_expr => Shift(yy_state_286)
    NT_arrow_fn_expr => Shift(yy_state_287)
    NT_quantifier_expr => Shift(yy_state_288)
    NT_if_expr => Shift(yy_state_289)
    T_VERBATIM => Shift(yy_state_317)
    T_RAWIDENT => Shift(yy_state_319)
    T_RPAREN => Shift(yy_state_321)
    T_UIDENT => Shift(yy_state_322)
    T_LIDENT => Shift(yy_state_325)
    _ => Error
  }
}

///|
fn yy_state_321(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_arrow_fn_prefix_no_constraint, yy_action_67)
}

///|
fn yy_state_322(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Shift(yy_state_130)
    T_COMMA => Shift(yy_state_323)
    T_RPAREN => Shift(yy_state_329)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN =>
      Reduce(1, NT_simple_expr, yy_action_111)
    _ => Error
  }
}

///|
fn yy_state_323(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    NT_non_empty_tuple_elems => Shift(yy_state_113)
    NT_expr => Shift(yy_state_118)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    T_LPAREN => Shift(yy_state_135)
    NT_non_empty_tuple_elems_with_prefix => Shift(yy_state_199)
    NT_arrow_fn_prefix_no_constraint => Shift(yy_state_200)
    T_EXISTS => Shift(yy_state_207)
    T_FORALL => Shift(yy_state_231)
    T_IF => Shift(yy_state_277)
    NT_infix_expr => Shift(yy_state_286)
    NT_arrow_fn_expr => Shift(yy_state_287)
    NT_quantifier_expr => Shift(yy_state_288)
    NT_if_expr => Shift(yy_state_289)
    T_VERBATIM => Shift(yy_state_317)
    T_RAWIDENT => Shift(yy_state_319)
    T_UIDENT => Shift(yy_state_322)
    T_RPAREN => Shift(yy_state_324)
    T_LIDENT => Shift(yy_state_325)
    _ => Error
  }
}

///|
fn yy_state_324(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_arrow_fn_prefix_no_constraint, yy_action_64)
}

///|
fn yy_state_325(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Shift(yy_state_133)
    T_COMMA => Shift(yy_state_326)
    T_RPAREN => Shift(yy_state_328)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN =>
      Reduce(1, NT_simple_expr, yy_action_112)
    _ => Error
  }
}

///|
fn yy_state_326(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    NT_non_empty_tuple_elems => Shift(yy_state_113)
    NT_expr => Shift(yy_state_118)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    T_LPAREN => Shift(yy_state_135)
    NT_non_empty_tuple_elems_with_prefix => Shift(yy_state_204)
    NT_arrow_fn_prefix_no_constraint => Shift(yy_state_205)
    T_EXISTS => Shift(yy_state_207)
    T_FORALL => Shift(yy_state_231)
    T_IF => Shift(yy_state_277)
    NT_infix_expr => Shift(yy_state_286)
    NT_arrow_fn_expr => Shift(yy_state_287)
    NT_quantifier_expr => Shift(yy_state_288)
    NT_if_expr => Shift(yy_state_289)
    T_VERBATIM => Shift(yy_state_317)
    T_RAWIDENT => Shift(yy_state_319)
    T_UIDENT => Shift(yy_state_322)
    T_LIDENT => Shift(yy_state_325)
    T_RPAREN => Shift(yy_state_327)
    _ => Error
  }
}

///|
fn yy_state_327(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_arrow_fn_prefix_no_constraint, yy_action_61)
}

///|
fn yy_state_328(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_arrow_fn_prefix_no_constraint, yy_action_32)
}

///|
fn yy_state_329(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_arrow_fn_prefix_no_constraint, yy_action_31)
}

///|
fn yy_state_330(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_arrow_fn_prefix_no_constraint, yy_action_30)
}

///|
fn yy_state_331(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Shift(yy_state_127)
    T_COMMA => Shift(yy_state_320)
    T_RPAREN => Shift(yy_state_330)
    T_COLON => Shift(yy_state_332)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN =>
      Reduce(1, NT_simple_expr, yy_action_113)
    _ => Error
  }
}

///|
fn yy_state_332(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_7)
    T_UNDERSCORE => Shift(yy_state_8)
    T_INT => Shift(yy_state_9)
    T_VERBATIM => Shift(yy_state_10)
    T_UIDENT => Shift(yy_state_16)
    T_LPAREN => Shift(yy_state_18)
    NT_type_ => Shift(yy_state_333)
    _ => Error
  }
}

///|
fn yy_state_333(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RPAREN => Shift(yy_state_334)
    _ => Error
  }
}

///|
fn yy_state_334(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_tuple_expr, yy_action_28)
}

///|
fn yy_state_335(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Shift(yy_state_130)
    T_COMMA => Shift(yy_state_323)
    T_RPAREN => Shift(yy_state_329)
    T_COLON => Shift(yy_state_336)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN =>
      Reduce(1, NT_simple_expr, yy_action_111)
    _ => Error
  }
}

///|
fn yy_state_336(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_7)
    T_UNDERSCORE => Shift(yy_state_8)
    T_INT => Shift(yy_state_9)
    T_VERBATIM => Shift(yy_state_10)
    T_UIDENT => Shift(yy_state_16)
    T_LPAREN => Shift(yy_state_18)
    NT_type_ => Shift(yy_state_337)
    _ => Error
  }
}

///|
fn yy_state_337(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RPAREN => Shift(yy_state_338)
    _ => Error
  }
}

///|
fn yy_state_338(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_tuple_expr, yy_action_27)
}

///|
fn yy_state_339(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Shift(yy_state_133)
    T_COMMA => Shift(yy_state_326)
    T_RPAREN => Shift(yy_state_328)
    T_COLON => Shift(yy_state_340)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN =>
      Reduce(1, NT_simple_expr, yy_action_112)
    _ => Error
  }
}

///|
fn yy_state_340(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_7)
    T_UNDERSCORE => Shift(yy_state_8)
    T_INT => Shift(yy_state_9)
    T_VERBATIM => Shift(yy_state_10)
    T_UIDENT => Shift(yy_state_16)
    T_LPAREN => Shift(yy_state_18)
    NT_type_ => Shift(yy_state_341)
    _ => Error
  }
}

///|
fn yy_state_341(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RPAREN => Shift(yy_state_342)
    _ => Error
  }
}

///|
fn yy_state_342(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_tuple_expr, yy_action_26)
}

///|
fn yy_state_343(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_prefix_expr, yy_action_23)
}

///|
fn yy_state_344(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    NT_non_empty_list_commas_rev_expr_ => Shift(yy_state_92)
    T_LBRACKET => Shift(yy_state_95)
    NT_expr => Shift(yy_state_96)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    T_VERBATIM => Shift(yy_state_123)
    T_RAWIDENT => Shift(yy_state_126)
    T_UIDENT => Shift(yy_state_129)
    T_LIDENT => Shift(yy_state_132)
    T_LPAREN => Shift(yy_state_135)
    T_EXISTS => Shift(yy_state_207)
    T_FORALL => Shift(yy_state_231)
    T_IF => Shift(yy_state_277)
    NT_infix_expr => Shift(yy_state_286)
    NT_arrow_fn_expr => Shift(yy_state_287)
    NT_quantifier_expr => Shift(yy_state_288)
    NT_if_expr => Shift(yy_state_289)
    NT_non_empty_list_commas_expr_ => Shift(yy_state_345)
    _ => Error
  }
}

///|
fn yy_state_345(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RPAREN => Shift(yy_state_346)
    _ => Error
  }
}

///|
fn yy_state_346(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(4, NT_simple_expr, yy_action_22)
}

///|
fn yy_state_347(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_non_empty_list_commas_expr_, yy_action_21)
}

///|
fn yy_state_348(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_BAR => Shift(yy_state_349)
    T_RBRACE | T_COMMA =>
      Reduce(1, NT_non_empty_list_commas_rev_expr_, yy_action_121)
    _ => Error
  }
}

///|
fn yy_state_349(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    T_LPAREN => Shift(yy_state_135)
    T_EXISTS => Shift(yy_state_207)
    T_FORALL => Shift(yy_state_231)
    T_IF => Shift(yy_state_277)
    NT_infix_expr => Shift(yy_state_286)
    NT_arrow_fn_expr => Shift(yy_state_287)
    NT_quantifier_expr => Shift(yy_state_288)
    NT_if_expr => Shift(yy_state_289)
    NT_set_binder => Shift(yy_state_350)
    NT_non_empty_list_commas_rev_set_binder_ => Shift(yy_state_351)
    NT_non_empty_list_commas_set_binder_ => Shift(yy_state_367)
    NT_expr => Shift(yy_state_371)
    T_VERBATIM => Shift(yy_state_373)
    T_RAWIDENT => Shift(yy_state_374)
    T_UIDENT => Shift(yy_state_375)
    T_LIDENT => Shift(yy_state_376)
    _ => Error
  }
}

///|
fn yy_state_350(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_non_empty_list_commas_rev_set_binder_, yy_action_20)
}

///|
fn yy_state_351(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_352)
    NT_option_COMMA_ => Shift(yy_state_366)
    T_BAR => Reduce(0, NT_option_COMMA_, yy_action_161)
    _ => Error
  }
}

///|
fn yy_state_352(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_set_binder => Shift(yy_state_353)
    T_VERBATIM => Shift(yy_state_354)
    T_RAWIDENT => Shift(yy_state_357)
    T_UIDENT => Shift(yy_state_360)
    T_LIDENT => Shift(yy_state_363)
    T_BAR => Reduce(1, NT_option_COMMA_, yy_action_160)
    _ => Error
  }
}

///|
fn yy_state_353(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_non_empty_list_commas_rev_set_binder_, yy_action_19)
}

///|
fn yy_state_354(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COLON => Shift(yy_state_355)
    _ => Error
  }
}

///|
fn yy_state_355(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_7)
    T_UNDERSCORE => Shift(yy_state_8)
    T_INT => Shift(yy_state_9)
    T_VERBATIM => Shift(yy_state_10)
    T_UIDENT => Shift(yy_state_16)
    T_LPAREN => Shift(yy_state_18)
    NT_type_ => Shift(yy_state_356)
    _ => Error
  }
}

///|
fn yy_state_356(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_set_binder, yy_action_18)
}

///|
fn yy_state_357(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COLON => Shift(yy_state_358)
    _ => Error
  }
}

///|
fn yy_state_358(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_7)
    T_UNDERSCORE => Shift(yy_state_8)
    T_INT => Shift(yy_state_9)
    T_VERBATIM => Shift(yy_state_10)
    T_UIDENT => Shift(yy_state_16)
    T_LPAREN => Shift(yy_state_18)
    NT_type_ => Shift(yy_state_359)
    _ => Error
  }
}

///|
fn yy_state_359(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_set_binder, yy_action_16)
}

///|
fn yy_state_360(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COLON => Shift(yy_state_361)
    _ => Error
  }
}

///|
fn yy_state_361(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_7)
    T_UNDERSCORE => Shift(yy_state_8)
    T_INT => Shift(yy_state_9)
    T_VERBATIM => Shift(yy_state_10)
    T_UIDENT => Shift(yy_state_16)
    T_LPAREN => Shift(yy_state_18)
    NT_type_ => Shift(yy_state_362)
    _ => Error
  }
}

///|
fn yy_state_362(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_set_binder, yy_action_14)
}

///|
fn yy_state_363(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COLON => Shift(yy_state_364)
    _ => Error
  }
}

///|
fn yy_state_364(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_simple_type => Shift(yy_state_7)
    T_UNDERSCORE => Shift(yy_state_8)
    T_INT => Shift(yy_state_9)
    T_VERBATIM => Shift(yy_state_10)
    T_UIDENT => Shift(yy_state_16)
    T_LPAREN => Shift(yy_state_18)
    NT_type_ => Shift(yy_state_365)
    _ => Error
  }
}

///|
fn yy_state_365(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_set_binder, yy_action_12)
}

///|
fn yy_state_366(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_non_empty_list_commas_set_binder_, yy_action_10)
}

///|
fn yy_state_367(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_BAR => Shift(yy_state_368)
    _ => Error
  }
}

///|
fn yy_state_368(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    T_VERBATIM => Shift(yy_state_123)
    T_RAWIDENT => Shift(yy_state_126)
    T_UIDENT => Shift(yy_state_129)
    T_LIDENT => Shift(yy_state_132)
    T_LPAREN => Shift(yy_state_135)
    T_EXISTS => Shift(yy_state_207)
    T_FORALL => Shift(yy_state_231)
    T_IF => Shift(yy_state_277)
    NT_infix_expr => Shift(yy_state_286)
    NT_arrow_fn_expr => Shift(yy_state_287)
    NT_quantifier_expr => Shift(yy_state_288)
    NT_if_expr => Shift(yy_state_289)
    NT_expr => Shift(yy_state_369)
    _ => Error
  }
}

///|
fn yy_state_369(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RBRACE => Shift(yy_state_370)
    _ => Error
  }
}

///|
fn yy_state_370(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(7, NT_simple_expr, yy_action_9)
}

///|
fn yy_state_371(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RBRACE => Shift(yy_state_372)
    _ => Error
  }
}

///|
fn yy_state_372(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_simple_expr, yy_action_8)
}

///|
fn yy_state_373(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Shift(yy_state_124)
    T_COLON => Shift(yy_state_355)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN | T_RBRACE =>
      Reduce(1, NT_simple_expr, yy_action_114)
    _ => Error
  }
}

///|
fn yy_state_374(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Shift(yy_state_127)
    T_COLON => Shift(yy_state_358)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN | T_RBRACE =>
      Reduce(1, NT_simple_expr, yy_action_113)
    _ => Error
  }
}

///|
fn yy_state_375(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Shift(yy_state_130)
    T_COLON => Shift(yy_state_361)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN | T_RBRACE =>
      Reduce(1, NT_simple_expr, yy_action_111)
    _ => Error
  }
}

///|
fn yy_state_376(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_FAT_ARROW => Shift(yy_state_133)
    T_COLON => Shift(yy_state_364)
    T_INFIX1 | T_INFIX3 | T_DOT_LIDENT | T_IMPLIES | T_BARBAR | T_AMPERAMPER | T_PLUS | T_MINUS | T_STAR | T_LPAREN | T_RBRACE =>
      Reduce(1, NT_simple_expr, yy_action_112)
    _ => Error
  }
}

///|
fn yy_state_377(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RBRACE => Shift(yy_state_378)
    _ => Error
  }
}

///|
fn yy_state_378(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_simple_expr, yy_action_7)
}

///|
fn yy_state_379(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_simple_expr, yy_action_6)
}

///|
fn yy_state_380(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INFIX3 => Shift(yy_state_213)
    T_STAR => Shift(yy_state_215)
    T_MINUS => Shift(yy_state_217)
    T_PLUS => Shift(yy_state_219)
    T_INFIX1 => Shift(yy_state_221)
    T_AMPERAMPER => Shift(yy_state_223)
    T_BARBAR => Shift(yy_state_225)
    T_IMPLIES => Shift(yy_state_227)
    T_IF => Shift(yy_state_381)
    T_FAT_ARROW => Shift(yy_state_385)
    _ => Error
  }
}

///|
fn yy_state_381(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_VERBATIM => Shift(yy_state_108)
    T_RAWIDENT => Shift(yy_state_109)
    T_LIDENT => Shift(yy_state_110)
    T_UIDENT => Shift(yy_state_111)
    T_LPAREN => Shift(yy_state_112)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    NT_infix_expr => Shift(yy_state_382)
    _ => Error
  }
}

///|
fn yy_state_382(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INFIX3 => Shift(yy_state_213)
    T_STAR => Shift(yy_state_215)
    T_MINUS => Shift(yy_state_217)
    T_PLUS => Shift(yy_state_219)
    T_INFIX1 => Shift(yy_state_221)
    T_AMPERAMPER => Shift(yy_state_223)
    T_BARBAR => Shift(yy_state_225)
    T_IMPLIES => Shift(yy_state_227)
    T_FAT_ARROW => Shift(yy_state_383)
    _ => Error
  }
}

///|
fn yy_state_383(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    T_VERBATIM => Shift(yy_state_123)
    T_RAWIDENT => Shift(yy_state_126)
    T_UIDENT => Shift(yy_state_129)
    T_LIDENT => Shift(yy_state_132)
    T_LPAREN => Shift(yy_state_135)
    T_EXISTS => Shift(yy_state_207)
    T_FORALL => Shift(yy_state_231)
    T_IF => Shift(yy_state_277)
    NT_infix_expr => Shift(yy_state_286)
    NT_arrow_fn_expr => Shift(yy_state_287)
    NT_quantifier_expr => Shift(yy_state_288)
    NT_if_expr => Shift(yy_state_289)
    NT_expr => Shift(yy_state_384)
    _ => Error
  }
}

///|
fn yy_state_384(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_match_arm, yy_action_5)
}

///|
fn yy_state_385(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    T_VERBATIM => Shift(yy_state_123)
    T_RAWIDENT => Shift(yy_state_126)
    T_UIDENT => Shift(yy_state_129)
    T_LIDENT => Shift(yy_state_132)
    T_LPAREN => Shift(yy_state_135)
    T_EXISTS => Shift(yy_state_207)
    T_FORALL => Shift(yy_state_231)
    T_IF => Shift(yy_state_277)
    NT_infix_expr => Shift(yy_state_286)
    NT_arrow_fn_expr => Shift(yy_state_287)
    NT_quantifier_expr => Shift(yy_state_288)
    NT_if_expr => Shift(yy_state_289)
    NT_expr => Shift(yy_state_386)
    _ => Error
  }
}

///|
fn yy_state_386(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_match_arm, yy_action_4)
}

///|
fn yy_state_387(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_match_arms, yy_action_3)
}

///|
fn yy_state_388(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RBRACE => Shift(yy_state_389)
    _ => Error
  }
}

///|
fn yy_state_389(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(4, NT_simple_expr, yy_action_2)
}

///|
fn yy_state_390(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INFIX3 => Shift(yy_state_213)
    T_STAR => Shift(yy_state_215)
    T_MINUS => Shift(yy_state_217)
    T_PLUS => Shift(yy_state_219)
    T_INFIX1 => Shift(yy_state_221)
    T_AMPERAMPER => Shift(yy_state_223)
    T_BARBAR => Shift(yy_state_225)
    T_IMPLIES => Shift(yy_state_227)
    T_LBRACE => Shift(yy_state_391)
    _ => Error
  }
}

///|
fn yy_state_391(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_INT => Shift(yy_state_82)
    T_FALSE => Shift(yy_state_83)
    T_TRUE => Shift(yy_state_84)
    T_MATCH => Shift(yy_state_85)
    T_FN => Shift(yy_state_86)
    NT_match_arm => Shift(yy_state_88)
    T_LBRACE => Shift(yy_state_91)
    T_LBRACKET => Shift(yy_state_95)
    NT_tuple_expr => Shift(yy_state_100)
    NT_atomic_expr => Shift(yy_state_101)
    NT_simple_expr => Shift(yy_state_102)
    T_EXCLAMATION => Shift(yy_state_107)
    T_VERBATIM => Shift(yy_state_108)
    T_RAWIDENT => Shift(yy_state_109)
    T_LIDENT => Shift(yy_state_110)
    T_UIDENT => Shift(yy_state_111)
    T_LPAREN => Shift(yy_state_112)
    T_MINUS => Shift(yy_state_120)
    NT_prefix_expr => Shift(yy_state_122)
    NT_infix_expr => Shift(yy_state_380)
    NT_match_arms => Shift(yy_state_392)
    _ => Error
  }
}

///|
fn yy_state_392(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RBRACE => Shift(yy_state_393)
    _ => Error
  }
}

///|
fn yy_state_393(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_simple_expr, yy_action_1)
}

///|
fn yy_state_394(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_EOF => Shift(yy_state_395)
    _ => Error
  }
}

///|
fn yy_state_395(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_term, yy_action_0)
}

///|
fn[T] yy_parse(
  tokens : Array[(Token, Int, Int)], start : YYState, return_ : ((YYObj) -> T),
  initial_pos? : Int
) -> T raise ParseError {
  let mut cursor = 0
  let mut state_stack : @list.List[YYState] = @list.List([start])
  let data_stack : Array[(YYObj, Int, Int)] = []
  let mut last_pos = initial_pos.unwrap_or_else(() => tokens[0].1)
  let mut state = start
  let mut lookahead : (YYSymbol, (YYObj, Int, Int), Token?)? = None
  let mut last_shifted_state_stack = state_stack
  while true {
    let decision = match state(EOI) {
      (ReduceNoLookahead(_) | Accept) as t => t
      _ =>
        match lookahead {
          Some(la) => state(la.0)
          None =>
            if cursor < tokens.length() {
              let (token, start_pos, end_pos) = tokens[cursor]
              cursor += 1
              let (symbol, data) = yy_input(token, start_pos, end_pos)
              lookahead = Some(
                (symbol, (data, start_pos, end_pos), Some(token))
              )
              state(symbol)
            } else {
              lookahead = Some((EOI, (YYObj_Void, last_pos, last_pos), None))
              state(EOI)
            }
        }
    }
    match decision {
      Accept =>
        ({
          ()
          return return_(data_stack.unsafe_pop().0)
        })
      Shift(next_state) =>
        ({
          ()
          guard! lookahead is Some(la)
          data_stack.push(la.1)
          state_stack = @list.cons(next_state, state_stack)
          last_shifted_state_stack = state_stack
          state = next_state
          last_pos = la.1.2
          lookahead = None
        })
      Reduce(count, symbol, action) | ReduceNoLookahead(count, symbol, action) =>
        ({
          ()
          for count = count, symbol = symbol, action = action {
            let args = data_stack[data_stack.length() - count:]
            let data = action(last_pos, args)
            let (start_pos, end_pos) = if args.length() == 0 {
              (last_pos, last_pos)
            } else {
              (args[0].1, args[args.length() - 1].2)
            }
            for _ in 0..<count {
              ignore(data_stack.unsafe_pop())
              state_stack = state_stack.unsafe_tail()
            }
            state = state_stack.unsafe_head()
            data_stack.push((data, start_pos, end_pos))
            match state(symbol) {
              Accept =>
                ({
                  ()
                  return return_(data_stack.unsafe_pop().0)
                })
              Shift(next_state) =>
                ({
                  ()
                  state_stack = @list.cons(next_state, state_stack)
                  state = next_state
                  break ()
                })
              Reduce(count, symbol, action) | ReduceNoLookahead(
                count, symbol, action
              ) =>
                ({
                  ()
                  continue count, symbol, action
                })
              _ => panic()
            }
          }
        })
      Error =>
        ({
          ()
          let (_, (_, start_pos, end_pos), token) = lookahead.unwrap()
          error(last_shifted_state_stack, token, (start_pos, end_pos))
        })
    }
  }
  panic()
}

///|
fn error(stack : @list.List[YYState], token : Token?, loc : (Int, Int)) -> Unit raise ParseError {
  let expected = []
  fn try_add(symbol : YYSymbol, kind : TokenKind) {
    fn go(stack : @list.List[YYState]) {
      match stack {
        Empty => ()
        More(state, ..) =>
          match state(symbol) {
            Accept | Shift(_) => expected.push(kind)
            Reduce(count, symbol, _) | ReduceNoLookahead(count, symbol, _) =>
              ({
                ()
                fn inner_go(stack : @list.List[YYState], count, symbol) {
                  let stack = stack.drop(count)
                  guard! stack is More(state, ..)
                  match state(symbol) {
                    Shift(state) => go(@list.cons(state, stack))
                    Reduce(count, symbol, _) | ReduceNoLookahead(
                      count, symbol, _
                    ) =>
                      inner_go(stack, count, symbol)
                    _ => panic()
                  }
                }
                inner_go(stack, count, symbol)
              })
            Error => ()
          }
      }
    }
    go(stack)
  }
  for term in ([
    (T_LIDENT, TK_LIDENT), (T_UIDENT, TK_UIDENT), (T_RAWIDENT, TK_RAWIDENT),
    (T_VERBATIM, TK_VERBATIM), (T_INT, TK_INT), (T_INFIX1, TK_INFIX1),
    (T_INFIX3, TK_INFIX3), (T_DOT_LIDENT, TK_DOT_LIDENT), (T_TRUE, TK_TRUE),
    (T_FALSE, TK_FALSE), (T_IF, TK_IF), (T_ELSE, TK_ELSE), (T_FN, TK_FN),
    (T_MATCH, TK_MATCH), (T_ENUM, TK_ENUM), (T_STRUCT, TK_STRUCT),
    (T_FORALL, TK_FORALL), (T_EXISTS, TK_EXISTS), (T_IMPLIES, TK_IMPLIES),
    (T_BARBAR, TK_BARBAR), (T_BAR, TK_BAR), (T_AMPERAMPER, TK_AMPERAMPER),
    (T_PLUS, TK_PLUS), (T_MINUS, TK_MINUS), (T_STAR, TK_STAR),
    (T_EXCLAMATION, TK_EXCLAMATION), (T_LPAREN, TK_LPAREN),
    (T_RPAREN, TK_RPAREN), (T_LBRACKET, TK_LBRACKET), (T_RBRACKET, TK_RBRACKET),
    (T_LBRACE, TK_LBRACE), (T_RBRACE, TK_RBRACE), (T_COMMA, TK_COMMA),
    (T_COLON, TK_COLON), (T_SEMI, TK_SEMI), (T_FAT_ARROW, TK_FAT_ARROW),
    (T_THIN_ARROW, TK_THIN_ARROW), (T_UNDERSCORE, TK_UNDERSCORE),
    (T_EOF, TK_EOF)
  ] : Array[(YYSymbol, TokenKind)]) {
    try_add(term.0, term.1)
  }
  match token {
    None =>
      ({
        ()
        raise UnexpectedEndOfInput(loc.1, expected)
      })
    Some(token) =>
      ({
        ()
        raise UnexpectedToken(token, loc, expected)
      })
  }
}

///|
pub fn term(tokens : Array[(Token, Int, Int)], initial_pos? : Int) -> @preterm.Preterm raise ParseError {
  yy_parse(
    tokens, yy_state_80,
    (it) =>
      ({
        ()
        guard! it is YYObj__preterm_Preterm(result)
        result
      }), initial_pos?
  )
}

///|
pub fn pretype(tokens : Array[(Token, Int, Int)], initial_pos? : Int) -> @preterm.Pretype raise ParseError {
  yy_parse(
    tokens, yy_state_76,
    (it) =>
      ({
        ()
        guard! it is YYObj__preterm_Pretype(result)
        result
      }), initial_pos?
  )
}

///|
pub fn type_definition(tokens : Array[(Token, Int, Int)], initial_pos? : Int) -> @list.List[
  (String, String, @list.List[(String, @list.List[@preterm.Pretype])])
] raise ParseError {
  yy_parse(
    tokens, yy_state_49,
    (it) =>
      ({
        ()
        guard! it is YYObj__list_List__String__String___list_List__String___list_List__preterm_Pretype_____(
          result
        )
        result
      }), initial_pos?
  )
}

///|
pub fn record_definition(tokens : Array[(Token, Int, Int)], initial_pos? : Int) -> (
  String, String, @list.List[(String, @preterm.Pretype)]
) raise ParseError {
  yy_parse(
    tokens, yy_state_0,
    (it) =>
      ({
        ()
        guard! it is YYObj__String__String___list_List__String___preterm_Pretype___(
          result
        )
        result
      }), initial_pos?
  )
}
