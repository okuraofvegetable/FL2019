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
  268 (* LETAND *);
  269 (* AND *);
  270 (* OR *);
  271 (* XOR *);
  272 (* IF *);
  273 (* THEN *);
  274 (* ELSE *);
  275 (* LPAR *);
  276 (* RPAR *);
  277 (* SEMISEMI *);
    0|]

let yytransl_block = [|
  257 (* INT *);
  258 (* BOOL *);
  259 (* ID *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\004\000\004\000\005\000\005\000\002\000\002\000\
\002\000\002\000\002\000\002\000\002\000\002\000\006\000\006\000\
\006\000\007\000\007\000\007\000\008\000\008\000\008\000\008\000\
\003\000\000\000"

let yylen = "\002\000\
\002\000\005\000\005\000\001\000\002\000\005\000\005\000\006\000\
\003\000\003\000\003\000\003\000\003\000\001\000\003\000\003\000\
\001\000\003\000\003\000\001\000\001\000\001\000\001\000\003\000\
\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\021\000\022\000\023\000\000\000\000\000\000\000\
\026\000\000\000\000\000\000\000\020\000\025\000\000\000\000\000\
\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\024\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\018\000\
\019\000\000\000\000\000\000\000\000\000\000\000\004\000\002\000\
\007\000\000\000\000\000\005\000\000\000\000\000\008\000\000\000\
\000\000\000\000\000\000\003\000\006\000\000\000"

let yydgoto = "\002\000\
\009\000\010\000\015\000\048\000\049\000\011\000\012\000\013\000"

let yysindex = "\006\000\
\002\255\000\000\000\000\000\000\000\000\017\255\007\255\007\255\
\000\000\004\255\156\255\024\255\000\000\000\000\019\255\017\255\
\028\255\026\255\000\000\011\255\011\255\011\255\011\255\011\255\
\011\255\011\255\011\255\011\255\007\255\037\255\007\255\000\000\
\024\255\024\255\031\255\031\255\031\255\031\255\031\255\000\000\
\000\000\022\255\007\255\030\255\007\255\017\255\000\000\000\000\
\000\000\023\255\007\255\000\000\044\255\017\255\000\000\007\255\
\051\255\022\255\007\255\000\000\000\000\023\255"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\090\255\045\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\062\255\079\255\100\255\110\255\120\255\130\255\140\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\249\255\242\255\011\000\213\255\150\000\252\255\014\000"

let yytablesize = 176
let yytable = "\017\000\
\018\000\030\000\003\000\004\000\005\000\006\000\001\000\003\000\
\004\000\005\000\016\000\003\000\004\000\005\000\061\000\033\000\
\034\000\007\000\061\000\014\000\008\000\042\000\007\000\044\000\
\019\000\008\000\045\000\045\000\029\000\008\000\027\000\053\000\
\028\000\046\000\054\000\050\000\020\000\052\000\021\000\057\000\
\040\000\041\000\047\000\055\000\031\000\032\000\043\000\051\000\
\058\000\017\000\017\000\062\000\017\000\056\000\017\000\017\000\
\017\000\017\000\017\000\017\000\059\000\017\000\017\000\000\000\
\017\000\017\000\015\000\015\000\060\000\015\000\000\000\015\000\
\015\000\015\000\015\000\015\000\015\000\000\000\015\000\015\000\
\000\000\015\000\015\000\016\000\016\000\000\000\016\000\000\000\
\016\000\016\000\016\000\016\000\016\000\016\000\014\000\016\000\
\016\000\000\000\016\000\016\000\000\000\014\000\000\000\000\000\
\009\000\000\000\014\000\014\000\000\000\014\000\014\000\009\000\
\000\000\000\000\010\000\000\000\009\000\009\000\000\000\009\000\
\009\000\010\000\000\000\000\000\011\000\000\000\010\000\010\000\
\000\000\010\000\010\000\011\000\000\000\000\000\012\000\000\000\
\011\000\011\000\000\000\011\000\011\000\012\000\000\000\000\000\
\013\000\000\000\012\000\012\000\000\000\012\000\012\000\013\000\
\000\000\000\000\000\000\000\000\013\000\013\000\000\000\013\000\
\013\000\020\000\000\000\021\000\000\000\022\000\023\000\000\000\
\024\000\025\000\026\000\035\000\036\000\037\000\038\000\039\000"

let yycheck = "\007\000\
\008\000\016\000\001\001\002\001\003\001\004\001\001\000\001\001\
\002\001\003\001\004\001\001\001\002\001\003\001\058\000\020\000\
\021\000\016\001\062\000\003\001\019\001\029\000\016\001\031\000\
\021\001\019\001\005\001\005\001\010\001\019\001\007\001\046\000\
\009\001\012\001\012\001\043\000\006\001\045\000\008\001\054\000\
\027\000\028\000\021\001\051\000\017\001\020\001\010\001\018\001\
\056\000\005\001\006\001\059\000\008\001\010\001\010\001\011\001\
\012\001\013\001\014\001\015\001\010\001\017\001\018\001\255\255\
\020\001\021\001\005\001\006\001\058\000\008\001\255\255\010\001\
\011\001\012\001\013\001\014\001\015\001\255\255\017\001\018\001\
\255\255\020\001\021\001\005\001\006\001\255\255\008\001\255\255\
\010\001\011\001\012\001\013\001\014\001\015\001\005\001\017\001\
\018\001\255\255\020\001\021\001\255\255\012\001\255\255\255\255\
\005\001\255\255\017\001\018\001\255\255\020\001\021\001\012\001\
\255\255\255\255\005\001\255\255\017\001\018\001\255\255\020\001\
\021\001\012\001\255\255\255\255\005\001\255\255\017\001\018\001\
\255\255\020\001\021\001\012\001\255\255\255\255\005\001\255\255\
\017\001\018\001\255\255\020\001\021\001\012\001\255\255\255\255\
\005\001\255\255\017\001\018\001\255\255\020\001\021\001\012\001\
\255\255\255\255\255\255\255\255\017\001\018\001\255\255\020\001\
\021\001\006\001\255\255\008\001\255\255\010\001\011\001\255\255\
\013\001\014\001\015\001\022\000\023\000\024\000\025\000\026\000"

let yynames_const = "\
  LET\000\
  IN\000\
  PLUS\000\
  TIMES\000\
  MINUS\000\
  DIV\000\
  EQ\000\
  LT\000\
  LETAND\000\
  AND\000\
  OR\000\
  XOR\000\
  IF\000\
  THEN\000\
  ELSE\000\
  LPAR\000\
  RPAR\000\
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
# 189 "parser.ml"
               : Syntax.command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'var) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'toplets) in
    Obj.repr(
# 24 "parser.mly"
                            ( match (_5) with 
                              | CDecls l -> CDecls ((_2, _4)::l) 
                              | _ -> CDecls [] )
# 200 "parser.ml"
               : Syntax.command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'var) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'toplets) in
    Obj.repr(
# 30 "parser.mly"
                               ( match (_5) with 
                                     | CDecls l -> CDecls ((_2, _4)::l) 
                                     | _ -> CDecls [] )
# 211 "parser.ml"
               : 'toplets))
; (fun __caml_parser_env ->
    Obj.repr(
# 33 "parser.mly"
                                   ( CDecls [] )
# 217 "parser.ml"
               : 'toplets))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 36 "parser.mly"
                   ( ([],_2) )
# 224 "parser.ml"
               : 'lets_in_expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'var) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'lets_in_expr) in
    Obj.repr(
# 37 "parser.mly"
                                    ( match (_5) with
                                      | (xs,exp) -> (((_2,_4)::xs),exp) )
# 234 "parser.ml"
               : 'lets_in_expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'var) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'lets_in_expr) in
    Obj.repr(
# 41 "parser.mly"
                                 ( match (_5) with
                                   | (xs,exp) -> ELets(((_2,_4)::xs),exp) )
# 244 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 43 "parser.mly"
                                ( EIf(_2,_4,_6) )
# 253 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arith_expr) in
    Obj.repr(
# 44 "parser.mly"
                                ( EEq(_1,_3) )
# 261 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arith_expr) in
    Obj.repr(
# 45 "parser.mly"
                                ( ELt(_1,_3) )
# 269 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arith_expr) in
    Obj.repr(
# 46 "parser.mly"
                                ( EAnd(_1,_3))
# 277 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arith_expr) in
    Obj.repr(
# 47 "parser.mly"
                                ( EOr(_1,_3))
# 285 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arith_expr) in
    Obj.repr(
# 48 "parser.mly"
                                ( EXor(_1,_3))
# 293 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'arith_expr) in
    Obj.repr(
# 49 "parser.mly"
                                ( _1 )
# 300 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'factor_expr) in
    Obj.repr(
# 53 "parser.mly"
                                 ( EAdd(_1,_3) )
# 308 "parser.ml"
               : 'arith_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'factor_expr) in
    Obj.repr(
# 54 "parser.mly"
                                 ( ESub(_1,_3) )
# 316 "parser.ml"
               : 'arith_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'factor_expr) in
    Obj.repr(
# 55 "parser.mly"
                                 ( _1 )
# 323 "parser.ml"
               : 'arith_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'factor_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'atomic_expr) in
    Obj.repr(
# 59 "parser.mly"
                                  ( EMul(_1,_3) )
# 331 "parser.ml"
               : 'factor_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'factor_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'atomic_expr) in
    Obj.repr(
# 60 "parser.mly"
                                  ( EDiv(_1,_3) )
# 339 "parser.ml"
               : 'factor_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'atomic_expr) in
    Obj.repr(
# 61 "parser.mly"
                                  ( _1 )
# 346 "parser.ml"
               : 'factor_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 65 "parser.mly"
                   ( EConstInt(_1) )
# 353 "parser.ml"
               : 'atomic_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 66 "parser.mly"
                   ( EConstBool(_1) )
# 360 "parser.ml"
               : 'atomic_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 67 "parser.mly"
                   ( EVar(_1) )
# 367 "parser.ml"
               : 'atomic_expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 68 "parser.mly"
                   ( _2 )
# 374 "parser.ml"
               : 'atomic_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 72 "parser.mly"
       ( _1 )
# 381 "parser.ml"
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
