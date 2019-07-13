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
# 29 "parser.ml"
let yytransl_const = [|
  260 (* LET *);
  261 (* IN *);
  262 (* PLUS *);
  263 (* TIMES *);
  264 (* MINUS *);
  265 (* DIV *);
  266 (* EQ *);
  267 (* LT *);
  268 (* AND *);
  269 (* OR *);
  270 (* XOR *);
  271 (* IF *);
  272 (* THEN *);
  273 (* ELSE *);
  274 (* LPAR *);
  275 (* RPAR *);
  276 (* SEMISEMI *);
    0|]

let yytransl_block = [|
  257 (* INT *);
  258 (* BOOL *);
  259 (* ID *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\004\000\004\000\002\000\002\000\002\000\002\000\
\002\000\002\000\002\000\002\000\005\000\005\000\005\000\006\000\
\006\000\006\000\007\000\007\000\007\000\007\000\003\000\000\000"

let yylen = "\002\000\
\002\000\005\000\005\000\001\000\006\000\006\000\003\000\003\000\
\003\000\003\000\003\000\001\000\003\000\003\000\001\000\003\000\
\003\000\001\000\001\000\001\000\001\000\003\000\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\019\000\020\000\021\000\000\000\000\000\000\000\
\024\000\000\000\000\000\000\000\018\000\023\000\000\000\000\000\
\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\022\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\016\000\
\017\000\000\000\000\000\000\000\000\000\000\000\004\000\002\000\
\000\000\000\000\000\000\005\000\006\000\000\000\000\000\003\000"

let yydgoto = "\002\000\
\009\000\010\000\015\000\048\000\011\000\012\000\013\000"

let yysindex = "\015\000\
\002\255\000\000\000\000\000\000\000\000\029\255\008\255\008\255\
\000\000\020\255\143\255\018\255\000\000\000\000\028\255\029\255\
\025\255\023\255\000\000\012\255\012\255\012\255\012\255\012\255\
\012\255\012\255\012\255\012\255\008\255\039\255\008\255\000\000\
\018\255\018\255\027\255\027\255\027\255\027\255\027\255\000\000\
\000\000\014\255\008\255\038\255\029\255\008\255\000\000\000\000\
\053\255\008\255\054\255\000\000\000\000\008\255\017\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\091\255\040\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\057\255\074\255\096\255\101\255\118\255\123\255\128\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\249\255\242\255\011\000\136\000\243\255\001\000"

let yytablesize = 162
let yytable = "\017\000\
\018\000\030\000\003\000\004\000\005\000\006\000\033\000\034\000\
\003\000\004\000\005\000\016\000\003\000\004\000\005\000\001\000\
\007\000\045\000\046\000\008\000\045\000\042\000\007\000\044\000\
\027\000\008\000\028\000\040\000\041\000\008\000\051\000\014\000\
\020\000\047\000\021\000\049\000\047\000\029\000\052\000\019\000\
\031\000\032\000\053\000\015\000\015\000\015\000\055\000\015\000\
\043\000\015\000\015\000\015\000\015\000\015\000\050\000\015\000\
\015\000\046\000\015\000\015\000\013\000\013\000\013\000\054\000\
\013\000\056\000\013\000\013\000\013\000\013\000\013\000\000\000\
\013\000\013\000\000\000\013\000\013\000\014\000\014\000\014\000\
\000\000\014\000\000\000\014\000\014\000\014\000\014\000\014\000\
\000\000\014\000\014\000\000\000\014\000\014\000\012\000\012\000\
\000\000\000\000\000\000\007\000\007\000\000\000\000\000\000\000\
\008\000\008\000\012\000\012\000\000\000\012\000\012\000\007\000\
\007\000\000\000\007\000\007\000\008\000\008\000\000\000\008\000\
\008\000\009\000\009\000\000\000\000\000\000\000\010\000\010\000\
\000\000\000\000\000\000\011\000\011\000\009\000\009\000\000\000\
\009\000\009\000\010\000\010\000\000\000\010\000\010\000\011\000\
\011\000\000\000\011\000\011\000\020\000\000\000\021\000\000\000\
\022\000\023\000\024\000\025\000\026\000\035\000\036\000\037\000\
\038\000\039\000"

let yycheck = "\007\000\
\008\000\016\000\001\001\002\001\003\001\004\001\020\000\021\000\
\001\001\002\001\003\001\004\001\001\001\002\001\003\001\001\000\
\015\001\004\001\005\001\018\001\004\001\029\000\015\001\031\000\
\007\001\018\001\009\001\027\000\028\000\018\001\045\000\003\001\
\006\001\020\001\008\001\043\000\020\001\010\001\046\000\020\001\
\016\001\019\001\050\000\004\001\005\001\006\001\054\000\008\001\
\010\001\010\001\011\001\012\001\013\001\014\001\017\001\016\001\
\017\001\005\001\019\001\020\001\004\001\005\001\006\001\010\001\
\008\001\055\000\010\001\011\001\012\001\013\001\014\001\255\255\
\016\001\017\001\255\255\019\001\020\001\004\001\005\001\006\001\
\255\255\008\001\255\255\010\001\011\001\012\001\013\001\014\001\
\255\255\016\001\017\001\255\255\019\001\020\001\004\001\005\001\
\255\255\255\255\255\255\004\001\005\001\255\255\255\255\255\255\
\004\001\005\001\016\001\017\001\255\255\019\001\020\001\016\001\
\017\001\255\255\019\001\020\001\016\001\017\001\255\255\019\001\
\020\001\004\001\005\001\255\255\255\255\255\255\004\001\005\001\
\255\255\255\255\255\255\004\001\005\001\016\001\017\001\255\255\
\019\001\020\001\016\001\017\001\255\255\019\001\020\001\016\001\
\017\001\255\255\019\001\020\001\006\001\255\255\008\001\255\255\
\010\001\011\001\012\001\013\001\014\001\022\000\023\000\024\000\
\025\000\026\000"

let yynames_const = "\
  LET\000\
  IN\000\
  PLUS\000\
  TIMES\000\
  MINUS\000\
  DIV\000\
  EQ\000\
  LT\000\
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
# 22 "parser.mly"
                  ( CExp _1 )
# 179 "parser.ml"
               : Syntax.command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'var) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'lets) in
    Obj.repr(
# 23 "parser.mly"
                         ( match (_5) with 
                           | CDecls l -> CDecls ((_2, _4)::l) 
                           | _ -> CDecls [] )
# 190 "parser.ml"
               : Syntax.command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'var) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'lets) in
    Obj.repr(
# 29 "parser.mly"
                         ( match (_5) with 
                           | CDecls l -> CDecls ((_2, _4)::l) 
                           | _ -> CDecls [] )
# 201 "parser.ml"
               : 'lets))
; (fun __caml_parser_env ->
    Obj.repr(
# 32 "parser.mly"
                         ( CDecls [] )
# 207 "parser.ml"
               : 'lets))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'var) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 35 "parser.mly"
                                ( ELet(_2,_4,_6) )
# 216 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 36 "parser.mly"
                                ( EIf(_2,_4,_6) )
# 225 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arith_expr) in
    Obj.repr(
# 37 "parser.mly"
                                ( EEq(_1,_3) )
# 233 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arith_expr) in
    Obj.repr(
# 38 "parser.mly"
                                ( ELt(_1,_3) )
# 241 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arith_expr) in
    Obj.repr(
# 39 "parser.mly"
                                ( EAnd(_1,_3))
# 249 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arith_expr) in
    Obj.repr(
# 40 "parser.mly"
                                ( EOr(_1,_3))
# 257 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arith_expr) in
    Obj.repr(
# 41 "parser.mly"
                                ( EXor(_1,_3))
# 265 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'arith_expr) in
    Obj.repr(
# 42 "parser.mly"
                                ( _1 )
# 272 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'factor_expr) in
    Obj.repr(
# 46 "parser.mly"
                                 ( EAdd(_1,_3) )
# 280 "parser.ml"
               : 'arith_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'factor_expr) in
    Obj.repr(
# 47 "parser.mly"
                                 ( ESub(_1,_3) )
# 288 "parser.ml"
               : 'arith_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'factor_expr) in
    Obj.repr(
# 48 "parser.mly"
                                 ( _1 )
# 295 "parser.ml"
               : 'arith_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'factor_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'atomic_expr) in
    Obj.repr(
# 52 "parser.mly"
                                  ( EMul(_1,_3) )
# 303 "parser.ml"
               : 'factor_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'factor_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'atomic_expr) in
    Obj.repr(
# 53 "parser.mly"
                                  ( EDiv(_1,_3) )
# 311 "parser.ml"
               : 'factor_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'atomic_expr) in
    Obj.repr(
# 54 "parser.mly"
                                  ( _1 )
# 318 "parser.ml"
               : 'factor_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 58 "parser.mly"
                   ( EConstInt(_1) )
# 325 "parser.ml"
               : 'atomic_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 59 "parser.mly"
                   ( EConstBool(_1) )
# 332 "parser.ml"
               : 'atomic_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 60 "parser.mly"
                   ( EVar(_1) )
# 339 "parser.ml"
               : 'atomic_expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 61 "parser.mly"
                   ( _2 )
# 346 "parser.ml"
               : 'atomic_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 65 "parser.mly"
       ( _1 )
# 353 "parser.ml"
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
