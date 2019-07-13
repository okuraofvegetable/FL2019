type expr =
| EConstInt of int
| EAdd of expr * expr
| ESub of expr * expr
| EMul of expr * expr
| EDiv of expr * expr
| EConstBool of bool
| Eequal of expr * expr
| Elt of expr * expr
| Eif of expr * expr * expr;;
type value = VInt of int | VBool of bool;;

exception Eval_error;;

let rec eval = fun exp ->
	match exp with
	| EConstInt x -> VInt x
	| EAdd (x,y) -> (match (eval x) with
					 | VInt x -> (match (eval y) with
								  | VInt y -> VInt (x+y)
								  | _ -> (raise Eval_error))
					 | _ -> (raise Eval_error))
	| ESub (x,y) -> (match (eval x) with
					 | VInt x -> (match (eval y) with
								  | VInt y -> VInt (x-y)
								  | _ -> (raise Eval_error))
					 | _ -> (raise Eval_error))
	| EMul (x,y) -> (match (eval x) with
					 | VInt x -> (match (eval y) with
								  | VInt y -> VInt (x*y)
								  | _ -> (raise Eval_error))
					 | _ -> (raise Eval_error))
	| EDiv (x,y) -> (match (eval x) with
					 | VInt x -> (match (eval y) with
								  | VInt 0 -> (raise Eval_error)
								  | VInt y -> VInt (x/y)
								  | _ -> (raise Eval_error))
					 | _ -> (raise Eval_error))
	| EConstBool x -> VBool x
	| Eequal (x,y) -> (match (eval x) with
					  | VBool x -> (match (eval y) with
					  		        | VBool y -> VBool (x=y)
					  			   	| VInt y -> (raise Eval_error))
					  | VInt x -> (match (eval y) with
					  			   | VBool y -> (raise Eval_error)
					  			   | VInt y-> VBool (x=y)))
	| Elt (x,y) -> (match (eval x) with
					| VBool x -> (match (eval y) with
					  			  | VBool y -> VBool (x<y)
					  			  | VInt y-> (raise Eval_error))
					| VInt x -> (match (eval y) with
					  			 | VBool y -> (raise Eval_error)
					  			 | VInt y -> VBool (x<y)))
	| Eif (x,y,z) -> (match (eval x) with
					  | VBool true -> (eval y)
					  | VBool false -> (eval z)
					  | _ -> (raise Eval_error));;