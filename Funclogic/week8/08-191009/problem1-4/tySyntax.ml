type tyvar = int

	      
type ty =
  | TyInt
  | TyBool
  | TyFun of ty * ty
  | TyVar of tyvar

(*
 * the type of substitution
 *)
type subst = (tyvar * ty) list
(*
 * the type of constraints
 *   a list of equations t1 = t2 for types t1 and t2
 *)
type constraints = (ty * ty) list

exception TyError
exception TyLookupError
exception TyMakeSubstError




let idx = ref 0 
let new_tyvar u = idx := !idx+1;!idx

(* ty -> unit *)
let rec print_type t =
	match t with
	| TyInt -> print_string " int"
	| TyBool -> print_string " bool "
	| TyFun (x,y) -> print_string " (";print_type x;print_string "-> ";print_type y;print_string ")"
	| TyVar alpha -> print_string " a";print_int alpha;print_string" "

let rec print_constraints c = 
	match c with
	| [] -> print_string "end constraints\n"
	| (x,y)::cs -> (print_type x);print_string "=";(print_type y);print_string "\n";print_constraints cs
let rec print_subst s = 
	match s with
	| [] -> print_string "end subst\n"
	| (tv,t)::ss -> print_type (TyVar tv);print_string "=";(print_type t);print_string "\n";print_subst ss

(* tyvar -> subst -> ty *)
let rec lookup_var x sigma =
  try List.assoc x sigma with Not_found -> raise TyLookupError

(* subst -> ty -> ty *)
let rec ty_subst sigma t = 
	match t with
	| TyInt -> TyInt
	| TyBool -> TyBool
	| TyFun (x,y) -> let sx = ty_subst sigma x in
					 let sy = ty_subst sigma y in TyFun(sx,sy)
	| TyVar id -> (try (lookup_var id sigma) with TyLookupError -> TyVar id)

(* subst -> subst -> tyvar list -> subst *)
let rec make_subst s t u =
	match u with
	| [] -> []
	| y::ys -> let z =  ty_subst t (TyVar y) in
			   let zz = ty_subst s z in
			   	(y,zz)::(make_subst s t ys)
(* subst -> tyvar list *)
let rec domain s =
	match s with
	| [] -> []
 	| (tv,t)::ss -> tv::(domain ss)

(* tyvar_list -> tyvar_list -> tyvar_list *)
let rec domain_union s t =
	match t with
	| [] -> s
	| y::ys -> if List.mem y s then domain_union s ys
							   else domain_union (y::s) ys

(* subst -> subst -> subst *)
let rec compose s t = let u = domain_union (domain s) (domain t) in make_subst s t u


(* subst -> constraints -> constraints *)
let rec ty_subst_constraints sigma con =
	match con with
	| [] -> []
	| (x,y)::ys -> ((ty_subst sigma x),(ty_subst sigma y))::(ty_subst_constraints sigma ys)



let rec include_tyvar t tv =
	match t with
	| TyInt -> false
	| TyBool -> false
	| TyFun (x,y) -> (if ((include_tyvar x tv) || (include_tyvar y tv)) then true else false )
	| TyVar id -> (if (id=tv) then true else false)

(*
 * return the most general unifier of the constraints
 * raise TyError if unification fails
 *)
 (* constraints -> subst *)



let rec unify c =
	(* print_constraints c; *)
	match c with
	| [] -> []
	| (x,y)::rem -> 
		(match x with
		 | TyVar alpha -> 
		 	(match y with
		 	 | TyVar beta -> 
		 	 	(if (alpha = beta)
		 	 		then (unify rem)
		 	 		else (if (include_tyvar y alpha)
		 	 				then (raise TyError)
							else ((compose (unify (ty_subst_constraints [(alpha,y)] rem)) [(alpha,y)])))) 
		 	 | _ -> (if (include_tyvar y alpha)
				 		then (raise TyError)
				 		else (compose (unify (ty_subst_constraints [(alpha,y)] rem)) [(alpha,y)])))
		 | TyFun (s,t) ->
		 	(match y with
		 	 | TyFun (s2,t2) -> unify ((s,s2)::((t,t2)::rem))
		 	 | TyVar alpha -> 
		 	 	(if include_tyvar x alpha 
		 	 					then (raise TyError)
		 	 					else (compose (unify (ty_subst_constraints [(alpha,x)] rem)) [(alpha,x)]))
		 	 | _ -> (raise TyError))
		 | TyInt ->
		 	(match y with
		 	 | TyVar alpha -> 
		 	 	(compose (unify (ty_subst_constraints [(alpha,x)] rem)) [(alpha,x)])
		 	 | TyInt -> (unify rem)
		 	 | _ -> (raise TyError))
		 | TyBool ->
		 	(match y with
		 	 | TyVar alpha -> 
		 	 	(compose (unify (ty_subst_constraints [(alpha,x)] rem)) [(alpha,x)])
		 	 | TyBool -> (unify rem)
		 	 | _ -> (raise TyError)))