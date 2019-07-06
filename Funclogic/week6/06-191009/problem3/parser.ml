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
  | IF
  | THEN
  | ELSE
  | LPAR
  | RPAR
  | FUN
  | ARROW
  | REC
  | AND
  | SEMISEMI

open Parsing;;
let _ = parse_error;;
# 2 "parser.mly"
  open Syntax
  (* ここに書いたものは，ExampleParser.mliに入らないので注意 *)
# 30 "parser.ml"
let yytransl_const = [|
  260 (* LET *);
  261 (* IN *);
  262 (* PLUS *);
  263 (* TIMES *);
  264 (* MINUS *);
  265 (* DIV *);
  266 (* EQ *);
  267 (* LT *);
  268 (* IF *);
  269 (* THEN *);
  270 (* ELSE *);
  271 (* LPAR *);
  272 (* RPAR *);
  273 (* FUN *);
  274 (* ARROW *);
  275 (* REC *);
  276 (* AND *);
  277 (* SEMISEMI *);
    0|]

let yytransl_block = [|
  257 (* INT *);
  258 (* BOOL *);
  259 (* ID *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\001\000\004\000\004\000\002\000\002\000\002\000\
\002\000\002\000\002\000\002\000\005\000\005\000\005\000\006\000\
\006\000\006\000\007\000\007\000\008\000\008\000\008\000\008\000\
\003\000\000\000"

let yylen = "\002\000\
\002\000\005\000\004\000\006\000\004\000\006\000\005\000\006\000\
\004\000\003\000\003\000\001\000\003\000\003\000\001\000\003\000\
\003\000\001\000\002\000\001\000\001\000\001\000\001\000\003\000\
\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\021\000\022\000\023\000\000\000\000\000\000\000\
\000\000\026\000\000\000\000\000\000\000\000\000\020\000\025\000\
\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\
\000\000\000\000\000\000\000\000\000\000\019\000\000\000\000\000\
\000\000\000\000\000\000\000\000\024\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\003\000\000\000\
\000\000\000\000\000\000\009\000\000\000\007\000\000\000\002\000\
\000\000\000\000\000\000\006\000\008\000\000\000\004\000"

let yydgoto = "\002\000\
\010\000\011\000\031\000\032\000\012\000\013\000\014\000\015\000"

let yysindex = "\017\000\
\136\255\000\000\000\000\000\000\000\000\004\255\140\255\140\255\
\001\255\000\000\006\255\181\255\008\255\035\255\000\000\000\000\
\001\255\032\255\016\255\036\255\043\255\044\255\000\000\035\255\
\035\255\035\255\035\255\035\255\035\255\000\000\001\255\019\255\
\140\255\001\255\056\255\140\255\000\000\140\255\008\255\008\255\
\039\255\039\255\035\255\035\255\066\255\140\255\000\000\020\255\
\074\255\140\255\069\255\000\000\140\255\000\000\140\255\000\000\
\088\255\140\255\076\255\000\000\000\000\001\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\145\255\000\255\047\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\098\255\115\255\
\155\255\165\255\064\255\081\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\023\255\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\249\255\003\000\224\255\038\000\057\000\070\000\245\255"

let yytablesize = 192
let yytable = "\020\000\
\021\000\049\000\030\000\016\000\015\000\015\000\016\000\015\000\
\018\000\015\000\015\000\022\000\015\000\015\000\028\000\015\000\
\029\000\001\000\016\000\015\000\015\000\035\000\017\000\046\000\
\055\000\048\000\023\000\005\000\051\000\063\000\052\000\030\000\
\030\000\045\000\034\000\003\000\004\000\005\000\054\000\047\000\
\056\000\033\000\057\000\005\000\024\000\059\000\025\000\060\000\
\036\000\008\000\061\000\018\000\018\000\018\000\018\000\018\000\
\018\000\018\000\037\000\018\000\018\000\038\000\018\000\041\000\
\042\000\050\000\018\000\018\000\016\000\016\000\016\000\016\000\
\016\000\016\000\016\000\053\000\016\000\016\000\046\000\016\000\
\039\000\040\000\058\000\016\000\016\000\017\000\017\000\017\000\
\017\000\017\000\017\000\017\000\055\000\017\000\017\000\062\000\
\017\000\043\000\044\000\000\000\017\000\017\000\013\000\013\000\
\000\000\013\000\000\000\013\000\013\000\000\000\013\000\013\000\
\000\000\013\000\000\000\000\000\000\000\013\000\013\000\014\000\
\014\000\000\000\014\000\000\000\014\000\014\000\000\000\014\000\
\014\000\000\000\014\000\000\000\000\000\000\000\014\000\014\000\
\003\000\004\000\005\000\006\000\003\000\004\000\005\000\019\000\
\000\000\000\000\000\000\007\000\000\000\012\000\008\000\007\000\
\009\000\000\000\008\000\000\000\009\000\012\000\012\000\010\000\
\012\000\000\000\000\000\000\000\012\000\012\000\000\000\010\000\
\010\000\011\000\010\000\000\000\000\000\000\000\010\000\010\000\
\000\000\011\000\011\000\000\000\011\000\000\000\000\000\000\000\
\011\000\011\000\024\000\000\000\025\000\000\000\026\000\027\000"

let yycheck = "\007\000\
\008\000\034\000\014\000\003\001\005\001\006\001\003\001\008\001\
\006\000\010\001\011\001\009\000\013\001\014\001\007\001\016\001\
\009\001\001\000\003\001\020\001\021\001\019\000\019\001\005\001\
\005\001\033\000\021\001\005\001\036\000\062\000\038\000\043\000\
\044\000\031\000\019\001\001\001\002\001\003\001\046\000\021\001\
\021\001\010\001\050\000\021\001\006\001\053\000\008\001\055\000\
\013\001\015\001\058\000\005\001\006\001\007\001\008\001\009\001\
\010\001\011\001\016\001\013\001\014\001\018\001\016\001\026\000\
\027\000\010\001\020\001\021\001\005\001\006\001\007\001\008\001\
\009\001\010\001\011\001\010\001\013\001\014\001\005\001\016\001\
\024\000\025\000\014\001\020\001\021\001\005\001\006\001\007\001\
\008\001\009\001\010\001\011\001\005\001\013\001\014\001\020\001\
\016\001\028\000\029\000\255\255\020\001\021\001\005\001\006\001\
\255\255\008\001\255\255\010\001\011\001\255\255\013\001\014\001\
\255\255\016\001\255\255\255\255\255\255\020\001\021\001\005\001\
\006\001\255\255\008\001\255\255\010\001\011\001\255\255\013\001\
\014\001\255\255\016\001\255\255\255\255\255\255\020\001\021\001\
\001\001\002\001\003\001\004\001\001\001\002\001\003\001\004\001\
\255\255\255\255\255\255\012\001\255\255\005\001\015\001\012\001\
\017\001\255\255\015\001\255\255\017\001\013\001\014\001\005\001\
\016\001\255\255\255\255\255\255\020\001\021\001\255\255\013\001\
\014\001\005\001\016\001\255\255\255\255\255\255\020\001\021\001\
\255\255\013\001\014\001\255\255\016\001\255\255\255\255\255\255\
\020\001\021\001\006\001\255\255\008\001\255\255\010\001\011\001"

let yynames_const = "\
  LET\000\
  IN\000\
  PLUS\000\
  TIMES\000\
  MINUS\000\
  DIV\000\
  EQ\000\
  LT\000\
  IF\000\
  THEN\000\
  ELSE\000\
  LPAR\000\
  RPAR\000\
  FUN\000\
  ARROW\000\
  REC\000\
  AND\000\
  SEMISEMI\000\
  "

let yynames_block = "\
  INT\000\
  BOOL\000\
  ID\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 23 "parser.mly"
                                     ( CExp _1 )
# 193 "parser.ml"
               : Syntax.command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'var) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 24 "parser.mly"
                                     ( CDecl (_2, _4) )
# 201 "parser.ml"
               : Syntax.command))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'let_and_decls) in
    Obj.repr(
# 25 "parser.mly"
                                     ( CRecDecl (_3) )
# 208 "parser.ml"
               : Syntax.command))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 5 : 'var) in
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'var) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'let_and_decls) in
    Obj.repr(
# 29 "parser.mly"
                                      ( (_1,_2,_4) :: _6 )
# 218 "parser.ml"
               : 'let_and_decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'var) in
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'var) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 30 "parser.mly"
                                      ( [(_1,_2,_4)] )
# 227 "parser.ml"
               : 'let_and_decls))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'var) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 33 "parser.mly"
                                  ( ELet(_2,_4,_6) )
# 236 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'let_and_decls) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 34 "parser.mly"
                                  ( ELetRec(_3,_5) )
# 244 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 35 "parser.mly"
                                  ( EIf(_2,_4,_6) )
# 253 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'var) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 36 "parser.mly"
                                  ( EFun(_2,_4) )
# 261 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arith_expr) in
    Obj.repr(
# 37 "parser.mly"
                                  ( EEq(_1,_3) )
# 269 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arith_expr) in
    Obj.repr(
# 38 "parser.mly"
                                  ( ELt(_1,_3) )
# 277 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'arith_expr) in
    Obj.repr(
# 39 "parser.mly"
                                  ( _1 )
# 284 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'factor_expr) in
    Obj.repr(
# 43 "parser.mly"
                                 ( EAdd(_1,_3) )
# 292 "parser.ml"
               : 'arith_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'factor_expr) in
    Obj.repr(
# 44 "parser.mly"
                                 ( ESub(_1,_3) )
# 300 "parser.ml"
               : 'arith_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'factor_expr) in
    Obj.repr(
# 45 "parser.mly"
                                 ( _1 )
# 307 "parser.ml"
               : 'arith_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'factor_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'app_expr) in
    Obj.repr(
# 49 "parser.mly"
                               ( EMul(_1,_3) )
# 315 "parser.ml"
               : 'factor_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'factor_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'app_expr) in
    Obj.repr(
# 50 "parser.mly"
                               ( EDiv(_1,_3) )
# 323 "parser.ml"
               : 'factor_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'app_expr) in
    Obj.repr(
# 51 "parser.mly"
                               ( _1 )
# 330 "parser.ml"
               : 'factor_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'app_expr) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'atomic_expr) in
    Obj.repr(
# 55 "parser.mly"
                         ( EApp(_1, _2) )
# 338 "parser.ml"
               : 'app_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'atomic_expr) in
    Obj.repr(
# 56 "parser.mly"
                         ( _1 )
# 345 "parser.ml"
               : 'app_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 59 "parser.mly"
                   ( EConstInt(_1) )
# 352 "parser.ml"
               : 'atomic_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 60 "parser.mly"
                   ( EConstBool(_1) )
# 359 "parser.ml"
               : 'atomic_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 61 "parser.mly"
                   ( EVar(_1) )
# 366 "parser.ml"
               : 'atomic_expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 62 "parser.mly"
                   ( _2 )
# 373 "parser.ml"
               : 'atomic_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 66 "parser.mly"
       ( _1 )
# 380 "parser.ml"
               : 'var))
(* Entry toplevel *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let toplevel (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Syntax.command)
