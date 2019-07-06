module type EQ = sig
	type ('a, 'b) equal
	val refl : ('a, 'a) equal
	val symm : ('a, 'b) equal -> ('b, 'a) equal
	val trans :
	('a, 'b) equal -> ('b, 'c) equal -> ('a, 'c) equal
	val apply : ('a, 'b) equal -> 'a -> 'b
end
module Eq : EQ = 
struct
	type ('a, 'b) equal = {right : 'a -> 'b; left : 'b -> 'a}
	let refl = {right = (fun (x : 'a) -> x); left = (fun (x : 'a) -> x)}
	let symm (ab : ('a, 'b) equal) = {right = ab.left;left = ab.right;}
	let trans (ab : ('a, 'b) equal) (bc : ('b, 'c) equal) 
			= {right = (fun (x:'a) -> (bc.right (ab.right x)));
			   left  = (fun (x:'c) -> (ab.left (bc.left x)));}
	let apply (ab: ('a, 'b) equal) = ab.right
end
type 'a value =
	| VBool of (bool, 'a) Eq.equal * bool
	| VInt of (int, 'a) Eq.equal * int
type 'a expr =
	| EConstInt of (int, 'a) Eq.equal * int
	| EAdd of (int, 'a) Eq.equal * int expr * int expr
	| ESub of (int, 'a) Eq.equal * int expr * int expr
	| EMul of (int, 'a) Eq.equal * int expr * int expr
	| EConstBool of (bool, 'a) Eq.equal * bool
	| EIf of bool expr * 'a expr * 'a expr
	| EEq of (bool, 'a) Eq.equal * int expr * int expr
	| Elt of (bool, 'a) Eq.equal * int expr * int expr

let rec eval : 'a. 'a expr -> 'a value = fun exp ->
	match exp with
	| EConstInt (eq,x) -> (VInt (eq,x))
	| EConstBool (eq,x) -> (VBool (eq,x))
	| EAdd (eq,x,y) -> (match (eval x) with
					    | VInt (e,x) -> (match (eval y) with
										  | VInt (e,y) -> (VInt (eq,x+y))))
	| ESub (eq,x,y) -> (match (eval x) with
					    | VInt (e,x) -> (match (eval y) with
										  | VInt (e,y) -> (VInt (eq,x-y))))
	| EMul (eq,x,y) -> (match (eval x) with
					    | VInt (e,x) -> (match (eval y) with
										  | VInt (e,y) -> (VInt (eq,x*y))))
	| EIf (cond,x,y) -> (match (eval cond) with
						 | VBool (eq,c) -> if c then (eval x) else (eval y))
	| EEq (eq,x,y) -> (match (eval x) with
					   | VInt (xq,x) -> (match (eval y) with
										 | VInt (yq,y) -> (if (x=y) then (VBool (eq,true)) else (VBool (eq,false)))))
	| Elt (eq,x,y) -> (match (eval x) with
					   | VInt (xq,x) -> (match (eval y) with
										 | VInt (yq,y) -> (if (x<y) then (VBool (eq,true)) else (VBool (eq,false)))));;
let c1 = EConstInt (Eq.refl, 1);;
let c2 = EConstInt (Eq.refl, 2);;
let add12 = EAdd (Eq.refl, c1, c2);;
let ct = EConstBool (Eq.refl, true);;
let cif = EIf (ct, add12, c2);;
let cadd = EAdd (Eq.refl, c1, ct);;