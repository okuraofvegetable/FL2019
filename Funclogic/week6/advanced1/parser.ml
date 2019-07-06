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
\001\000\001\000\001\000\001\000\004\000\004\000\002\000\002\000\
\002\000\002\000\002\000\002\000\002\000\002\000\005\000\005\000\
\006\000\006\000\007\000\007\000\007\000\008\000\008\000\008\000\
\009\000\009\000\010\000\010\000\010\000\010\000\003\000\000\000"

let yylen = "\002\000\
\002\000\005\000\004\000\004\000\006\000\004\000\006\000\005\000\
\005\000\006\000\002\000\003\000\003\000\001\000\003\000\002\000\
\003\000\002\000\003\000\003\000\001\000\003\000\003\000\001\000\
\002\000\001\000\001\000\001\000\001\000\003\000\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\027\000\028\000\029\000\000\000\000\000\000\000\
\000\000\032\000\000\000\000\000\000\000\000\000\026\000\031\000\
\000\000\000\000\000\000\000\000\000\000\000\000\011\000\001\000\
\000\000\000\000\000\000\000\000\000\000\000\000\025\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\030\000\
\000\000\018\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\003\000\000\000\000\000\016\000\000\000\004\000\
\000\000\000\000\000\000\000\000\017\000\000\000\009\000\000\000\
\002\000\015\000\008\000\000\000\000\000\000\000\007\000\010\000\
\000\000\005\000"

let yydgoto = "\002\000\
\010\000\011\000\032\000\033\000\036\000\023\000\012\000\013\000\
\014\000\015\000"

let yysindex = "\004\000\
\147\255\000\000\000\000\000\000\000\000\016\255\151\255\151\255\
\015\255\000\000\029\255\192\255\066\255\142\255\000\000\000\000\
\015\255\020\255\021\255\041\255\054\255\038\255\000\000\000\000\
\142\255\142\255\142\255\142\255\142\255\142\255\000\000\015\255\
\255\254\151\255\049\255\023\255\015\255\050\255\151\255\000\000\
\151\255\000\000\066\255\066\255\084\255\084\255\142\255\142\255\
\077\255\151\255\000\000\026\255\151\255\000\000\151\255\000\000\
\094\255\151\255\096\255\090\255\000\000\151\255\000\000\151\255\
\000\000\000\000\000\000\102\255\151\255\091\255\000\000\000\000\
\015\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\156\255\092\255\001\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\109\255\126\255\166\255\176\255\058\255\075\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\028\255\000\000\000\000\
\000\000\000\000"

let yygindex = "\000\000\
\000\000\249\255\007\000\221\255\023\000\094\000\049\000\068\000\
\080\000\245\255"

let yytablesize = 203
let yytable = "\020\000\
\021\000\057\000\031\000\050\000\001\000\024\000\024\000\024\000\
\024\000\024\000\024\000\024\000\018\000\024\000\024\000\022\000\
\024\000\016\000\016\000\051\000\024\000\024\000\016\000\016\000\
\035\000\038\000\052\000\055\000\022\000\034\000\064\000\060\000\
\006\000\061\000\017\000\031\000\031\000\074\000\049\000\037\000\
\016\000\035\000\063\000\056\000\035\000\066\000\065\000\067\000\
\006\000\024\000\068\000\016\000\016\000\039\000\070\000\041\000\
\071\000\054\000\053\000\058\000\059\000\072\000\022\000\022\000\
\022\000\022\000\022\000\022\000\022\000\040\000\022\000\022\000\
\029\000\022\000\030\000\045\000\046\000\022\000\022\000\023\000\
\023\000\023\000\023\000\023\000\023\000\023\000\062\000\023\000\
\023\000\025\000\023\000\026\000\043\000\044\000\023\000\023\000\
\021\000\021\000\050\000\021\000\055\000\021\000\021\000\069\000\
\021\000\021\000\064\000\021\000\047\000\048\000\073\000\021\000\
\021\000\019\000\019\000\042\000\019\000\000\000\019\000\019\000\
\000\000\019\000\019\000\000\000\019\000\000\000\000\000\000\000\
\019\000\019\000\020\000\020\000\000\000\020\000\000\000\020\000\
\020\000\000\000\020\000\020\000\000\000\020\000\003\000\004\000\
\005\000\020\000\020\000\003\000\004\000\005\000\006\000\003\000\
\004\000\005\000\019\000\000\000\008\000\000\000\007\000\000\000\
\014\000\008\000\007\000\009\000\000\000\008\000\000\000\009\000\
\014\000\014\000\012\000\014\000\000\000\000\000\000\000\014\000\
\014\000\000\000\012\000\012\000\013\000\012\000\000\000\000\000\
\000\000\012\000\012\000\000\000\013\000\013\000\000\000\013\000\
\000\000\000\000\000\000\013\000\013\000\025\000\000\000\026\000\
\000\000\027\000\028\000"

let yycheck = "\007\000\
\008\000\037\000\014\000\005\001\001\000\005\001\006\001\007\001\
\008\001\009\001\010\001\011\001\006\000\013\001\014\001\009\000\
\016\001\003\001\003\001\021\001\020\001\021\001\003\001\003\001\
\018\000\019\000\034\000\005\001\022\000\010\001\005\001\039\000\
\005\001\041\000\019\001\047\000\048\000\073\000\032\000\019\001\
\003\001\035\000\050\000\021\001\038\000\053\000\021\001\055\000\
\021\001\021\001\058\000\003\001\003\001\013\001\062\000\018\001\
\064\000\035\000\010\001\010\001\038\000\069\000\005\001\006\001\
\007\001\008\001\009\001\010\001\011\001\016\001\013\001\014\001\
\007\001\016\001\009\001\027\000\028\000\020\001\021\001\005\001\
\006\001\007\001\008\001\009\001\010\001\011\001\010\001\013\001\
\014\001\006\001\016\001\008\001\025\000\026\000\020\001\021\001\
\005\001\006\001\005\001\008\001\005\001\010\001\011\001\014\001\
\013\001\014\001\005\001\016\001\029\000\030\000\020\001\020\001\
\021\001\005\001\006\001\022\000\008\001\255\255\010\001\011\001\
\255\255\013\001\014\001\255\255\016\001\255\255\255\255\255\255\
\020\001\021\001\005\001\006\001\255\255\008\001\255\255\010\001\
\011\001\255\255\013\001\014\001\255\255\016\001\001\001\002\001\
\003\001\020\001\021\001\001\001\002\001\003\001\004\001\001\001\
\002\001\003\001\004\001\255\255\015\001\255\255\012\001\255\255\
\005\001\015\001\012\001\017\001\255\255\015\001\255\255\017\001\
\013\001\014\001\005\001\016\001\255\255\255\255\255\255\020\001\
\021\001\255\255\013\001\014\001\005\001\016\001\255\255\255\255\
\255\255\020\001\021\001\255\255\013\001\014\001\255\255\016\001\
\255\255\255\255\255\255\020\001\021\001\006\001\255\255\008\001\
\255\255\010\001\011\001"

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
# 205 "parser.ml"
               : Syntax.command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'var) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 24 "parser.mly"
                                     ( CDecl (_2, _4) )
# 213 "parser.ml"
               : Syntax.command))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'let_and_decls) in
    Obj.repr(
# 25 "parser.mly"
                                     ( CRecDecl (_3) )
# 220 "parser.ml"
               : Syntax.command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'var) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'vars_equal_expr) in
    Obj.repr(
# 26 "parser.mly"
                                       ( CDecl (_2,_3) )
# 228 "parser.ml"
               : Syntax.command))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 5 : 'var) in
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'var) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'let_and_decls) in
    Obj.repr(
# 30 "parser.mly"
                                      ( (_1,_2,_4) :: _6 )
# 238 "parser.ml"
               : 'let_and_decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'var) in
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'var) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 31 "parser.mly"
                                      ( [(_1,_2,_4)] )
# 247 "parser.ml"
               : 'let_and_decls))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'var) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 34 "parser.mly"
                                  ( ELet(_2,_4,_6) )
# 256 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'var) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'vars_equal_expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 35 "parser.mly"
                                    (ELet(_2,_3,_5) )
# 265 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'let_and_decls) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 36 "parser.mly"
                                  ( ELetRec(_3,_5) )
# 273 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 37 "parser.mly"
                                  ( EIf(_2,_4,_6) )
# 282 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vars_arrow_expr) in
    Obj.repr(
# 38 "parser.mly"
                                   ( _2 )
# 289 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arith_expr) in
    Obj.repr(
# 39 "parser.mly"
                                  ( EEq(_1,_3) )
# 297 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arith_expr) in
    Obj.repr(
# 40 "parser.mly"
                                  ( ELt(_1,_3) )
# 305 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'arith_expr) in
    Obj.repr(
# 41 "parser.mly"
                                  ( _1 )
# 312 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'var) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 44 "parser.mly"
                                 (EFun(_1,_3))
# 320 "parser.ml"
               : 'vars_equal_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'var) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vars_equal_expr) in
    Obj.repr(
# 45 "parser.mly"
                                 (EFun(_1,_2))
# 328 "parser.ml"
               : 'vars_equal_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'var) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 48 "parser.mly"
                                 (EFun(_1,_3))
# 336 "parser.ml"
               : 'vars_arrow_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'var) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vars_arrow_expr) in
    Obj.repr(
# 49 "parser.mly"
                                   (EFun(_1,_2))
# 344 "parser.ml"
               : 'vars_arrow_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'factor_expr) in
    Obj.repr(
# 52 "parser.mly"
                                 ( EAdd(_1,_3) )
# 352 "parser.ml"
               : 'arith_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'factor_expr) in
    Obj.repr(
# 53 "parser.mly"
                                 ( ESub(_1,_3) )
# 360 "parser.ml"
               : 'arith_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'factor_expr) in
    Obj.repr(
# 54 "parser.mly"
                                 ( _1 )
# 367 "parser.ml"
               : 'arith_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'factor_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'app_expr) in
    Obj.repr(
# 58 "parser.mly"
                               ( EMul(_1,_3) )
# 375 "parser.ml"
               : 'factor_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'factor_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'app_expr) in
    Obj.repr(
# 59 "parser.mly"
                               ( EDiv(_1,_3) )
# 383 "parser.ml"
               : 'factor_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'app_expr) in
    Obj.repr(
# 60 "parser.mly"
                               ( _1 )
# 390 "parser.ml"
               : 'factor_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'app_expr) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'atomic_expr) in
    Obj.repr(
# 64 "parser.mly"
                         ( EApp(_1, _2) )
# 398 "parser.ml"
               : 'app_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'atomic_expr) in
    Obj.repr(
# 65 "parser.mly"
                         ( _1 )
# 405 "parser.ml"
               : 'app_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 68 "parser.mly"
                   ( EConstInt(_1) )
# 412 "parser.ml"
               : 'atomic_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 69 "parser.mly"
                   ( EConstBool(_1) )
# 419 "parser.ml"
               : 'atomic_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 70 "parser.mly"
                   ( EVar(_1) )
# 426 "parser.ml"
               : 'atomic_expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 71 "parser.mly"
                   ( _2 )
# 433 "parser.ml"
               : 'atomic_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 75 "parser.mly"
       ( _1 )
# 440 "parser.ml"
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
