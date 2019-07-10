type token =
  | SYMBID of (string)
  | VARID of (string)
  | IMPLY
  | COMMA
  | RULE
  | QUERY
  | LPAR
  | RPAR
  | DOT
  | SEMI

val toplevel :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Syntax.command
