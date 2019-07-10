type token =
  | SYMBID of (string)
  | VARID of (string)
  | NUMBER of (string)
  | IMPLY
  | COMMA
  | RULE
  | QUERY
  | LPAR
  | RPAR
  | DOT
  | SEMI
  | LBRACKET
  | RBRACKET
  | BAR
  | NIL
  | NEG

val toplevel :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Syntax.command
