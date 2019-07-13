let digit = ['0'-'9']
let space = ' ' | '\t' | '\r' | '\n'
let loweralpha = ['a'-'z']
let capitalalpha = ['A'-'Z'] 
let symb = loweralpha (loweralpha | capital_alpha | '_' | digit)* 
let varname = capitalalpha (loweralpha | capital_alpha | '_' | digit)*

rule main = parse
| space+        { main lexbuf }
| "rule"        { Parser.RULE }
| "query"       { Parser.QUERY }
| ":-"          { Parser.IMPLY }
| "("           { Parser.LPAR }
| ")"           { Parser.RPAR }
| ","           { Parser.COMMA}
| "."           { Parser.DOT }
| ";"           { Parser.SEMI }
| symb  as id   { Parser.SYMBID id }
| varname as vn { Parser.VARID vn }
| _             { failwith ("Unknown Token: " ^ Lexing.lexeme lexbuf)}
