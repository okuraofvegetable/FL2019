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
  | KANMA
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
  276 (* KANMA *);
  277 (* SEMISEMI *);
    0|]

let yytransl_block = [|
  257 (* INT *);
  258 (* BOOL *);
  259 (* ID *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\001\000\002\000\002\000\004\000\004\000\004\000\
\004\000\004\000\004\000\004\000\005\000\005\000\005\000\006\000\
\006\000\006\000\007\000\007\000\008\000\008\000\008\000\008\000\
\003\000\000\000"

let yylen = "\002\000\
\002\000\005\000\007\000\003\000\001\000\006\000\008\000\006\000\
\004\000\003\000\003\000\001\000\003\000\003\000\001\000\003\000\
\003\000\001\000\002\000\001\000\001\000\001\000\001\000\003\000\
\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\021\000\022\000\023\000\000\000\000\000\000\000\
\000\000\026\000\000\000\000\000\000\000\000\000\000\000\020\000\
\025\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\019\000\
\000\000\000\000\000\000\000\000\000\000\024\000\000\000\004\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\009\000\000\000\000\000\002\000\000\000\
\000\000\000\000\000\000\006\000\000\000\008\000\000\000\003\000\
\000\000\007\000"

let yydgoto = "\002\000\
\010\000\011\000\019\000\012\000\013\000\014\000\015\000\016\000"

let yysindex = "\003\000\
\005\255\000\000\000\000\000\000\000\000\020\255\009\255\009\255\
\254\254\000\000\250\254\029\255\184\255\041\255\183\255\000\000\
\000\000\254\254\008\255\022\255\051\255\026\255\049\255\000\000\
\009\255\183\255\183\255\183\255\183\255\183\255\183\255\000\000\
\254\254\009\255\254\254\061\255\009\255\000\000\009\255\000\000\
\041\255\041\255\047\255\047\255\183\255\183\255\071\255\023\255\
\254\254\009\255\070\255\000\000\009\255\009\255\000\000\078\255\
\093\255\009\255\031\255\000\000\009\255\000\000\009\255\000\000\
\096\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\019\255\147\255\103\255\052\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\120\255\137\255\157\255\167\255\069\255\086\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000"

let yygindex = "\000\000\
\000\000\250\255\252\255\249\255\009\000\043\000\056\000\244\255"

let yytablesize = 198
let yytable = "\021\000\
\017\000\022\000\032\000\001\000\023\000\003\000\004\000\005\000\
\006\000\003\000\004\000\005\000\020\000\033\000\024\000\036\000\
\007\000\034\000\040\000\008\000\007\000\009\000\017\000\008\000\
\017\000\009\000\048\000\054\000\047\000\051\000\049\000\052\000\
\032\000\032\000\005\000\063\000\043\000\044\000\018\000\005\000\
\035\000\038\000\057\000\055\000\056\000\059\000\060\000\030\000\
\025\000\031\000\062\000\064\000\026\000\065\000\027\000\066\000\
\018\000\018\000\018\000\018\000\018\000\018\000\018\000\037\000\
\018\000\018\000\039\000\018\000\041\000\042\000\050\000\018\000\
\018\000\016\000\016\000\016\000\016\000\016\000\016\000\016\000\
\053\000\016\000\016\000\058\000\016\000\045\000\046\000\061\000\
\016\000\016\000\017\000\017\000\017\000\017\000\017\000\017\000\
\017\000\054\000\017\000\017\000\063\000\017\000\000\000\000\000\
\000\000\017\000\017\000\015\000\015\000\000\000\015\000\000\000\
\015\000\015\000\000\000\015\000\015\000\000\000\015\000\000\000\
\000\000\000\000\015\000\015\000\013\000\013\000\000\000\013\000\
\000\000\013\000\013\000\000\000\013\000\013\000\000\000\013\000\
\000\000\000\000\000\000\013\000\013\000\014\000\014\000\000\000\
\014\000\000\000\014\000\014\000\000\000\014\000\014\000\012\000\
\014\000\000\000\000\000\000\000\014\000\014\000\000\000\012\000\
\012\000\010\000\012\000\000\000\000\000\000\000\012\000\012\000\
\000\000\010\000\010\000\011\000\010\000\000\000\000\000\000\000\
\010\000\010\000\000\000\011\000\011\000\000\000\011\000\003\000\
\004\000\005\000\011\000\011\000\000\000\026\000\000\000\027\000\
\000\000\028\000\029\000\000\000\000\000\008\000"

let yycheck = "\007\000\
\003\001\008\000\015\000\001\000\009\000\001\001\002\001\003\001\
\004\001\001\001\002\001\003\001\004\001\018\000\021\001\020\000\
\012\001\010\001\025\000\015\001\012\001\017\001\003\001\015\001\
\003\001\017\001\034\000\005\001\033\000\037\000\035\000\039\000\
\045\000\046\000\016\001\005\001\028\000\029\000\019\001\021\001\
\019\001\016\001\050\000\021\001\049\000\053\000\054\000\007\001\
\020\001\009\001\058\000\021\001\006\001\061\000\008\001\063\000\
\005\001\006\001\007\001\008\001\009\001\010\001\011\001\013\001\
\013\001\014\001\018\001\016\001\026\000\027\000\010\001\020\001\
\021\001\005\001\006\001\007\001\008\001\009\001\010\001\011\001\
\010\001\013\001\014\001\014\001\016\001\030\000\031\000\010\001\
\020\001\021\001\005\001\006\001\007\001\008\001\009\001\010\001\
\011\001\005\001\013\001\014\001\005\001\016\001\255\255\255\255\
\255\255\020\001\021\001\005\001\006\001\255\255\008\001\255\255\
\010\001\011\001\255\255\013\001\014\001\255\255\016\001\255\255\
\255\255\255\255\020\001\021\001\005\001\006\001\255\255\008\001\
\255\255\010\001\011\001\255\255\013\001\014\001\255\255\016\001\
\255\255\255\255\255\255\020\001\021\001\005\001\006\001\255\255\
\008\001\255\255\010\001\011\001\255\255\013\001\014\001\005\001\
\016\001\255\255\255\255\255\255\020\001\021\001\255\255\013\001\
\014\001\005\001\016\001\255\255\255\255\255\255\020\001\021\001\
\255\255\013\001\014\001\005\001\016\001\255\255\255\255\255\255\
\020\001\021\001\255\255\013\001\014\001\255\255\016\001\001\001\
\002\001\003\001\020\001\021\001\255\255\006\001\255\255\008\001\
\255\255\010\001\011\001\255\255\255\255\015\001"

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
  KANMA\000\
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
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'pair_expr) in
    Obj.repr(
# 24 "parser.mly"
                                          ( CExp _1 )
# 198 "parser.ml"
               : Syntax.command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'var) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 25 "parser.mly"
                                     ( CDecl (_2, _4) )
# 206 "parser.ml"
               : Syntax.command))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'var) in
    let _4 = (Parsing.peek_val __caml_parser_env 3 : 'var) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 26 "parser.mly"
                                     ( CRecDecl (_3,_4,_6) )
# 215 "parser.ml"
               : Syntax.command))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'pair_expr) in
    Obj.repr(
# 30 "parser.mly"
                               ( EPair(_1,_3) )
# 223 "parser.ml"
               : 'pair_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 31 "parser.mly"
                                    ( _1 )
# 230 "parser.ml"
               : 'pair_expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'var) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 35 "parser.mly"
                                    ( ELet(_2,_4,_6) )
# 239 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 5 : 'var) in
    let _4 = (Parsing.peek_val __caml_parser_env 4 : 'var) in
    let _6 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _8 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 36 "parser.mly"
                                    ( ELetRec(_3,_4,_6,_8) )
# 249 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 37 "parser.mly"
                                    ( EIf(_2,_4,_6) )
# 258 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'var) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 38 "parser.mly"
                                    ( EFun(_2,_4) )
# 266 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arith_expr) in
    Obj.repr(
# 39 "parser.mly"
                                    ( EEq(_1,_3) )
# 274 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arith_expr) in
    Obj.repr(
# 40 "parser.mly"
                                    ( ELt(_1,_3) )
# 282 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'arith_expr) in
    Obj.repr(
# 41 "parser.mly"
                                    ( _1 )
# 289 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'factor_expr) in
    Obj.repr(
# 45 "parser.mly"
                                 ( EAdd(_1,_3) )
# 297 "parser.ml"
               : 'arith_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'factor_expr) in
    Obj.repr(
# 46 "parser.mly"
                                 ( ESub(_1,_3) )
# 305 "parser.ml"
               : 'arith_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'factor_expr) in
    Obj.repr(
# 47 "parser.mly"
                                 ( _1 )
# 312 "parser.ml"
               : 'arith_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'factor_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'app_expr) in
    Obj.repr(
# 51 "parser.mly"
                               ( EMul(_1,_3) )
# 320 "parser.ml"
               : 'factor_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'factor_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'app_expr) in
    Obj.repr(
# 52 "parser.mly"
                               ( EDiv(_1,_3) )
# 328 "parser.ml"
               : 'factor_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'app_expr) in
    Obj.repr(
# 53 "parser.mly"
                               ( _1 )
# 335 "parser.ml"
               : 'factor_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'app_expr) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'atomic_expr) in
    Obj.repr(
# 57 "parser.mly"
                         ( EApp(_1, _2) )
# 343 "parser.ml"
               : 'app_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'atomic_expr) in
    Obj.repr(
# 58 "parser.mly"
                         ( _1 )
# 350 "parser.ml"
               : 'app_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 61 "parser.mly"
                   ( EConstInt(_1) )
# 357 "parser.ml"
               : 'atomic_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 62 "parser.mly"
                   ( EConstBool(_1) )
# 364 "parser.ml"
               : 'atomic_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 63 "parser.mly"
                   ( EVar(_1) )
# 371 "parser.ml"
               : 'atomic_expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'pair_expr) in
    Obj.repr(
# 64 "parser.mly"
                        ( _2 )
# 378 "parser.ml"
               : 'atomic_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 68 "parser.mly"
       ( _1 )
# 385 "parser.ml"
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
