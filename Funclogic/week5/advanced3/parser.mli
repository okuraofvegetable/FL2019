type token =
  | INT of (int)
  | BOOL of (bool)
  | ID of (string)
  | LET
  | IN
  | PLUS
  | TIMES
  | MINUS
  | DIV
  | EQ
  | LT
  | LETAND
  | AND
  | OR
  | XOR
  | IF
  | THEN
  | ELSE
  | LPAR
  | RPAR
  | SEMISEMI

val toplevel :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Syntax.command
