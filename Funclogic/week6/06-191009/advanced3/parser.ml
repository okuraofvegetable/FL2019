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
  | DFUN
  | ARROW
  | REC
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
  274 (* DFUN *);
  275 (* ARROW *);
  276 (* REC *);
  277 (* SEMISEMI *);
    0|]

let yytransl_block = [|
  257 (* INT *);
  258 (* BOOL *);
  259 (* ID *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\001\000\002\000\002\000\002\000\002\000\002\000\
\002\000\002\000\002\000\004\000\004\000\004\000\005\000\005\000\
\005\000\006\000\006\000\007\000\007\000\007\000\007\000\003\000\
\000\000"

let yylen = "\002\000\
\002\000\005\000\007\000\006\000\008\000\006\000\004\000\004\000\
\003\000\003\000\001\000\003\000\003\000\001\000\003\000\003\000\
\001\000\002\000\001\000\001\000\001\000\001\000\003\000\001\000\
\002\000"

let yydefred = "\000\000\
\000\000\000\000\020\000\021\000\022\000\000\000\000\000\000\000\
\000\000\000\000\025\000\000\000\000\000\000\000\000\000\019\000\
\024\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\001\000\000\000\000\000\000\000\000\000\000\000\000\000\018\000\
\000\000\000\000\000\000\000\000\000\000\023\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\007\000\008\000\000\000\000\000\002\000\
\000\000\000\000\000\000\000\000\004\000\000\000\006\000\000\000\
\003\000\000\000\005\000"

let yydgoto = "\002\000\
\011\000\012\000\019\000\013\000\014\000\015\000\016\000"

let yysindex = "\011\000\
\006\255\000\000\000\000\000\000\000\000\255\254\057\255\057\255\
\037\255\037\255\000\000\005\255\080\255\004\255\158\255\000\000\
\000\000\037\255\032\255\000\255\033\255\035\255\034\255\045\255\
\000\000\158\255\158\255\158\255\158\255\158\255\158\255\000\000\
\037\255\057\255\037\255\046\255\057\255\000\000\057\255\057\255\
\004\255\004\255\009\255\009\255\158\255\158\255\058\255\017\255\
\037\255\057\255\059\255\000\000\000\000\057\255\057\255\000\000\
\061\255\078\255\057\255\020\255\000\000\057\255\000\000\057\255\
\000\000\084\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\023\255\117\255\071\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\129\255\141\255\049\255\151\255\088\255\105\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\249\255\252\255\021\000\040\000\075\000\245\255"

let yytablesize = 173
let yytable = "\021\000\
\022\000\017\000\017\000\032\000\023\000\024\000\003\000\004\000\
\005\000\006\000\030\000\001\000\031\000\033\000\026\000\036\000\
\027\000\007\000\018\000\035\000\008\000\055\000\009\000\010\000\
\064\000\025\000\048\000\011\000\047\000\051\000\049\000\052\000\
\053\000\032\000\032\000\011\000\011\000\056\000\011\000\017\000\
\065\000\034\000\058\000\011\000\057\000\037\000\060\000\061\000\
\043\000\044\000\038\000\063\000\039\000\009\000\066\000\050\000\
\067\000\003\000\004\000\005\000\020\000\009\000\009\000\040\000\
\009\000\041\000\042\000\054\000\007\000\009\000\062\000\008\000\
\059\000\009\000\010\000\017\000\017\000\017\000\017\000\017\000\
\017\000\017\000\055\000\017\000\017\000\026\000\017\000\027\000\
\064\000\028\000\029\000\017\000\015\000\015\000\015\000\015\000\
\015\000\015\000\015\000\000\000\015\000\015\000\000\000\015\000\
\045\000\046\000\000\000\000\000\015\000\016\000\016\000\016\000\
\016\000\016\000\016\000\016\000\000\000\016\000\016\000\000\000\
\016\000\014\000\014\000\000\000\014\000\016\000\014\000\014\000\
\000\000\014\000\014\000\000\000\014\000\012\000\012\000\000\000\
\012\000\014\000\012\000\012\000\000\000\012\000\012\000\000\000\
\012\000\013\000\013\000\000\000\013\000\012\000\013\000\013\000\
\000\000\013\000\013\000\010\000\013\000\000\000\003\000\004\000\
\005\000\013\000\000\000\010\000\010\000\000\000\010\000\000\000\
\000\000\000\000\000\000\010\000\008\000"

let yycheck = "\007\000\
\008\000\003\001\003\001\015\000\009\000\010\000\001\001\002\001\
\003\001\004\001\007\001\001\000\009\001\018\000\006\001\020\000\
\008\001\012\001\020\001\020\001\015\001\005\001\017\001\018\001\
\005\001\021\001\034\000\005\001\033\000\037\000\035\000\039\000\
\040\000\045\000\046\000\013\001\014\001\021\001\016\001\003\001\
\021\001\010\001\050\000\021\001\049\000\013\001\054\000\055\000\
\028\000\029\000\016\001\059\000\019\001\005\001\062\000\010\001\
\064\000\001\001\002\001\003\001\004\001\013\001\014\001\019\001\
\016\001\026\000\027\000\010\001\012\001\021\001\010\001\015\001\
\014\001\017\001\018\001\005\001\006\001\007\001\008\001\009\001\
\010\001\011\001\005\001\013\001\014\001\006\001\016\001\008\001\
\005\001\010\001\011\001\021\001\005\001\006\001\007\001\008\001\
\009\001\010\001\011\001\255\255\013\001\014\001\255\255\016\001\
\030\000\031\000\255\255\255\255\021\001\005\001\006\001\007\001\
\008\001\009\001\010\001\011\001\255\255\013\001\014\001\255\255\
\016\001\005\001\006\001\255\255\008\001\021\001\010\001\011\001\
\255\255\013\001\014\001\255\255\016\001\005\001\006\001\255\255\
\008\001\021\001\010\001\011\001\255\255\013\001\014\001\255\255\
\016\001\005\001\006\001\255\255\008\001\021\001\010\001\011\001\
\255\255\013\001\014\001\005\001\016\001\255\255\001\001\002\001\
\003\001\021\001\255\255\013\001\014\001\255\255\016\001\255\255\
\255\255\255\255\255\255\021\001\015\001"

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
  DFUN\000\
  ARROW\000\
  REC\000\
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
# 192 "parser.ml"
               : Syntax.command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'var) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 24 "parser.mly"
                                     ( CDecl (_2, _4) )
# 200 "parser.ml"
               : Syntax.command))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'var) in
    let _4 = (Parsing.peek_val __caml_parser_env 3 : 'var) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 25 "parser.mly"
                                     ( CRecDecl (_3,_4,_6) )
# 209 "parser.ml"
               : Syntax.command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'var) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 29 "parser.mly"
                                    ( ELet(_2,_4,_6) )
# 218 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 5 : 'var) in
    let _4 = (Parsing.peek_val __caml_parser_env 4 : 'var) in
    let _6 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _8 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 30 "parser.mly"
                                    ( ELetRec(_3,_4,_6,_8) )
# 228 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 31 "parser.mly"
                                    ( EIf(_2,_4,_6) )
# 237 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'var) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 32 "parser.mly"
                                    ( EFun(_2,_4) )
# 245 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'var) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 33 "parser.mly"
                                    ( EDFun(_2,_4) )
# 253 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arith_expr) in
    Obj.repr(
# 34 "parser.mly"
                                    ( EEq(_1,_3) )
# 261 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arith_expr) in
    Obj.repr(
# 35 "parser.mly"
                                    ( ELt(_1,_3) )
# 269 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'arith_expr) in
    Obj.repr(
# 36 "parser.mly"
                                    ( _1 )
# 276 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'factor_expr) in
    Obj.repr(
# 40 "parser.mly"
                                 ( EAdd(_1,_3) )
# 284 "parser.ml"
               : 'arith_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'factor_expr) in
    Obj.repr(
# 41 "parser.mly"
                                 ( ESub(_1,_3) )
# 292 "parser.ml"
               : 'arith_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'factor_expr) in
    Obj.repr(
# 42 "parser.mly"
                                 ( _1 )
# 299 "parser.ml"
               : 'arith_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'factor_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'app_expr) in
    Obj.repr(
# 46 "parser.mly"
                               ( EMul(_1,_3) )
# 307 "parser.ml"
               : 'factor_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'factor_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'app_expr) in
    Obj.repr(
# 47 "parser.mly"
                               ( EDiv(_1,_3) )
# 315 "parser.ml"
               : 'factor_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'app_expr) in
    Obj.repr(
# 48 "parser.mly"
                               ( _1 )
# 322 "parser.ml"
               : 'factor_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'app_expr) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'atomic_expr) in
    Obj.repr(
# 52 "parser.mly"
                         ( EApp(_1, _2) )
# 330 "parser.ml"
               : 'app_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'atomic_expr) in
    Obj.repr(
# 53 "parser.mly"
                         ( _1 )
# 337 "parser.ml"
               : 'app_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 56 "parser.mly"
                   ( EConstInt(_1) )
# 344 "parser.ml"
               : 'atomic_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 57 "parser.mly"
                   ( EConstBool(_1) )
# 351 "parser.ml"
               : 'atomic_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 58 "parser.mly"
                   ( EVar(_1) )
# 358 "parser.ml"
               : 'atomic_expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 59 "parser.mly"
                   ( _2 )
# 365 "parser.ml"
               : 'atomic_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 63 "parser.mly"
       ( _1 )
# 372 "parser.ml"
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
