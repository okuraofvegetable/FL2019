%{
  open Syntax
  (* ここに書いたものは，ExampleParser.mliに入らないので注意 *)
%}

%token <string> SYMBID 
%token <string> VARID 
%token IMPLY COMMA
%token RULE QUERY
%token LPAR RPAR 
%token DOT

%start toplevel 
%type <Syntax.command> toplevel
%% 

toplevel:
  | rule
  | fact
  | query
;

expr:
  | IF expr THEN expr ELSE expr { EIf($2,$4,$6) }
  | arith_expr EQ arith_expr    { EEq($1,$3) }
  | arith_expr LT arith_expr    { ELt($1,$3) }
  | arith_expr                  { $1 } 
;

arith_expr:
  | arith_expr PLUS factor_expr { EAdd($1,$3) }
  | arith_expr MINUS factor_expr { ESub($1,$3) }
  | factor_expr                 { $1 }
;

factor_expr: 
  | atomic_expr                 { $1 }
  | factor_expr MUL atomic_expr { EMul($1,$3) }
  | factor_expr DIV atomic_expr { EDiv($1,$3) }
;

atomic_expr:
  | INT            { EConstInt($1) }
  | BOOL           { EConstBool($1) }
  | ID             { EVar($1) }
  | LPAR expr RPAR { $2 }
;

fact:
  | predicate DOT
;

rule:
  | predicate IMPLY predicates DOT
;

predicates
  | predicate
  | predicate COMMA predicates
;

predicate:
  | SYMBID LPAR terms RPAR
;

terms:
  | term
  | term COMMA terms
;

term:
  | atomic
  | SYMBID LPAR symbs RPAR
;
 
symbs:
  | atomic
  | atomic COMMA symbs
;

atomic:
  | SYMBID
  | VARID
;
