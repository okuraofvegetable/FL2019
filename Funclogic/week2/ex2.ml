type iexpr =
| EConstInt of int
| EAdd of iexpr * iexpr
| ESub of iexpr * iexpr
| EMul of iexpr * iexpr
let rec eval = fun exp ->
	match exp with
	| EConstInt x -> x
	| EAdd (e1,e2) -> eval e1+eval e2
	| ESub (e1,e2) -> eval e1-eval e2
	| EMul (e1,e2) -> eval e1*eval e2;;
eval (EAdd (EConstInt 2,ESub ((EConstInt 2),(EConstInt 1))));;