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

open Parsing;;
let _ = parse_error;;
# 2 "parser.mly"
  open Syntax
  (* ここに書いたものは，ExampleParser.mliに入らないので注意 *)
# 25 "parser.ml"
let yytransl_const = [|
  260 (* IMPLY *);
  261 (* COMMA *);
  262 (* RULE *);
  263 (* QUERY *);
  264 (* LPAR *);
  265 (* RPAR *);
  266 (* DOT *);
  267 (* SEMI *);
  268 (* LBRACKET *);
  269 (* RBRACKET *);
  270 (* BAR *);
  271 (* NIL *);
  272 (* NEG *);
    0|]

let yytransl_block = [|
  257 (* SYMBID *);
  258 (* VARID *);
  259 (* NUMBER *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\001\000\001\000\001\000\004\000\003\000\002\000\
\005\000\005\000\006\000\006\000\007\000\007\000\008\000\008\000\
\010\000\010\000\009\000\009\000\009\000\009\000\011\000\011\000\
\000\000"

let yylen = "\002\000\
\002\000\002\000\002\000\001\000\001\000\001\000\002\000\004\000\
\001\000\003\000\004\000\001\000\001\000\003\000\001\000\004\000\
\001\000\003\000\001\000\001\000\001\000\001\000\001\000\005\000\
\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\004\000\005\000\025\000\000\000\
\001\000\002\000\000\000\003\000\006\000\000\000\000\000\000\000\
\007\000\000\000\000\000\021\000\020\000\000\000\023\000\000\000\
\000\000\015\000\022\000\000\000\010\000\000\000\019\000\000\000\
\011\000\000\000\008\000\000\000\000\000\000\000\014\000\000\000\
\016\000\000\000\018\000\024\000"

let yydgoto = "\002\000\
\007\000\009\000\010\000\012\000\013\000\014\000\024\000\025\000\
\026\000\037\000\027\000"

let yysindex = "\005\000\
\015\255\000\000\011\255\011\255\000\000\000\000\000\000\016\255\
\000\000\000\000\003\255\000\000\000\000\023\255\002\255\011\255\
\000\000\011\255\022\255\000\000\000\000\008\255\000\000\024\255\
\026\255\000\000\000\000\025\255\000\000\008\255\000\000\018\255\
\000\000\002\255\000\000\029\255\027\255\008\255\000\000\008\255\
\000\000\028\255\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\
\000\000\000\000\000\000\000\000\000\000\002\000\000\000\000\000\
\000\000\000\000\010\255\000\000\000\000\000\000\000\000\000\000\
\030\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\031\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\000\000\011\000\034\000\004\000\000\000\
\234\255\003\000\000\000"

let yytablesize = 268
let yytable = "\032\000\
\012\000\009\000\019\000\020\000\021\000\001\000\016\000\036\000\
\031\000\020\000\021\000\008\000\017\000\022\000\019\000\042\000\
\023\000\036\000\019\000\022\000\003\000\004\000\023\000\015\000\
\005\000\006\000\028\000\018\000\029\000\030\000\034\000\038\000\
\033\000\040\000\035\000\041\000\011\000\039\000\013\000\017\000\
\044\000\000\000\043\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\012\000\012\000\000\000\000\000\
\000\000\000\000\012\000\009\000"

let yycheck = "\022\000\
\000\000\000\000\001\001\002\001\003\001\001\000\004\001\030\000\
\001\001\002\001\003\001\001\001\010\001\012\001\005\001\038\000\
\015\001\040\000\009\001\012\001\006\001\007\001\015\001\008\001\
\010\001\011\001\016\000\005\001\018\000\008\001\005\001\014\001\
\009\001\005\001\010\001\009\001\003\000\034\000\009\001\009\001\
\013\001\255\255\040\000\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\004\001\005\001\255\255\255\255\
\255\255\255\255\010\001\010\001"

let yynames_const = "\
  IMPLY\000\
  COMMA\000\
  RULE\000\
  QUERY\000\
  LPAR\000\
  RPAR\000\
  DOT\000\
  SEMI\000\
  LBRACKET\000\
  RBRACKET\000\
  BAR\000\
  NIL\000\
  NEG\000\
  "

let yynames_block = "\
  SYMBID\000\
  VARID\000\
  NUMBER\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'rule) in
    Obj.repr(
# 21 "parser.mly"
              ( CRule (_2) )
# 194 "parser.ml"
               : Syntax.command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fact) in
    Obj.repr(
# 22 "parser.mly"
              ( CRule (_2) )
# 201 "parser.ml"
               : Syntax.command))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'query) in
    Obj.repr(
# 23 "parser.mly"
                ( CQuery (_2) )
# 208 "parser.ml"
               : Syntax.command))
; (fun __caml_parser_env ->
    Obj.repr(
# 24 "parser.mly"
        ( CExit )
# 214 "parser.ml"
               : Syntax.command))
; (fun __caml_parser_env ->
    Obj.repr(
# 25 "parser.mly"
         ( CCont )
# 220 "parser.ml"
               : Syntax.command))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'predicates) in
    Obj.repr(
# 29 "parser.mly"
               ( _1 )
# 227 "parser.ml"
               : 'query))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'predicate) in
    Obj.repr(
# 32 "parser.mly"
                  ( (_1,[]) )
# 234 "parser.ml"
               : 'fact))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'predicate) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'predicates) in
    Obj.repr(
# 36 "parser.mly"
                                   ( (_1,_3) )
# 242 "parser.ml"
               : 'rule))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'predicate) in
    Obj.repr(
# 40 "parser.mly"
              ( [_1] )
# 249 "parser.ml"
               : 'predicates))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'predicate) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'predicates) in
    Obj.repr(
# 41 "parser.mly"
                               ( _1::_3 )
# 257 "parser.ml"
               : 'predicates))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'terms) in
    Obj.repr(
# 45 "parser.mly"
                           ( EPdSymb(_1,_3) )
# 265 "parser.ml"
               : 'predicate))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 46 "parser.mly"
           ( EPdSymb(_1,[]) )
# 272 "parser.ml"
               : 'predicate))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'term) in
    Obj.repr(
# 50 "parser.mly"
         ( [_1] )
# 279 "parser.ml"
               : 'terms))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'term) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'terms) in
    Obj.repr(
# 51 "parser.mly"
                     ( _1::_3 )
# 287 "parser.ml"
               : 'terms))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'atomic) in
    Obj.repr(
# 55 "parser.mly"
           ( _1 )
# 294 "parser.ml"
               : 'term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'symbs) in
    Obj.repr(
# 56 "parser.mly"
                           ( EFnSymb(_1,_3) )
# 302 "parser.ml"
               : 'term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'atomic) in
    Obj.repr(
# 60 "parser.mly"
           ( [_1] )
# 309 "parser.ml"
               : 'symbs))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'atomic) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'symbs) in
    Obj.repr(
# 61 "parser.mly"
                       ( _1::_3 )
# 317 "parser.ml"
               : 'symbs))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 65 "parser.mly"
           ( EConst(_1) )
# 324 "parser.ml"
               : 'atomic))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 66 "parser.mly"
           ( EConst(_1) )
# 331 "parser.ml"
               : 'atomic))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 67 "parser.mly"
           ( EVar(_1) )
# 338 "parser.ml"
               : 'atomic))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'list) in
    Obj.repr(
# 68 "parser.mly"
           ( _1 )
# 345 "parser.ml"
               : 'atomic))
; (fun __caml_parser_env ->
    Obj.repr(
# 72 "parser.mly"
        ( ENil )
# 351 "parser.ml"
               : 'list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'atomic) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'atomic) in
    Obj.repr(
# 73 "parser.mly"
                                        ( ECons(_2,_4) )
# 359 "parser.ml"
               : 'list))
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
