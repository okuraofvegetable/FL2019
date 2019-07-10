(* open Syntax *)

exception UnifyError 
exception NextStateError 


(* type subst = (name,term) list *)

(* subst -> term -> term *)
let rec term_subst sigma t = 
	match t with
	| EFnSymb (f,fl) -> let new_fl = List.map (fun s -> term_subst sigma s) fl in EFnSymb(f,new_fl)
	| EVar id -> (try (lookup id sigma) with Not_found -> EVar id)

let rec fact_subst sigma t = 
	match t with 
	| EPdSymb (id,tl) -> let ntl = List.map (fun s -> term_subst sigma s) tl in
						 EPdSymb (id,ntl)

let rec constraints_subst sigma cons =
	match cons with
	| [] -> []
	| (x,y)::rest -> ((term_subst sigma x),(term_subst sigma y))::(constraints_subst sigma rest)

(* subst -> subst -> name list -> subst *)
let rec make_subst s t u =
	match u with
	| [] -> []
	| y::ys -> let z =  term_subst t (EVar y) in
			   let zz = term_subst s z in
			   	(y,zz)::(make_subst s t ys)
(* subst -> name list *)
let rec domain s =
	match s with
	| [] -> []
 	| (tv,t)::ss -> tv::(domain ss)

(* name_list -> name_list -> name_list *)
let rec domain_union s t =
	match t with
	| [] -> s
	| y::ys -> if List.mem y s then domain_union s ys
							   else domain_union (y::s) ys

(* subst -> subst -> subst *)
let rec compose s t = let u = domain_union (domain s) (domain t) in make_subst s t u

(* term -> term ->  constraints *)
let rec collect_constraints s t =
	match (s,t) with
	| (EFnSymb (f,fl),EFnSymb (g,gl)) -> if (f=g && List.length(fl)=List.length(gl))
											 then List.concat (List.map (fun (a,b) -> collect_constraints a b) (List.combine fl gl))
											 else (raise UnifyError) 

	| (EVar x,EFnSymb (f,fl)) -> [(EVar x,EFnSymb (f,fl))]
	| (EFnSymb (f,fl),EVar x) -> [(EVar x,EFnSymb (f,fl))]
	| (EVar x,EVar y) -> [(EVar x,EVar y)]

(* fact -> fact -> constraints *)
let collect_constraints_fact s t = 
	match (s,t) with
	| (EPdSymb (p,pl),EPdSymb (q,ql)) -> if (p=q && List.length(pl)=List.length(ql)) 
											 then List.concat (List.map (fun (a,b) -> collect_constraints a b) (List.combine pl ql))
											 else (raise UnifyError)
exception IncludeVarError
let include_var x vl = 
	match vl with
	| [] -> false
	| n::rest -> if n=x then (raise IncludeVarError)
				 else false
(* constraints -> subst *)
let rec unify cl =
	match cl with
	| [] -> []
	| (s,t)::rest ->
		(match (s,t) with
		 | (EVar x,EFnSymb (f,fl)) ->
		 	(try(
		 		let _ = List.map (fun y -> let vl = get_vars_term y in include_var x vl) fl in
				compose (unify (constraints_subst [x,EFnSymb (f,fl)] rest)) [(x,EFnSymb (f,fl))]
			)with | IncludeVarError -> (raise UnifyError))
		 | (EVar x,EVar y) -> if x = y then (unify rest) 
							  else compose (unify (constraints_subst [x,EVar y] rest)) [x,EVar y] 
		 | _ -> (raise UnifyError))

(*  make next state
	rule -> ((fact list) * subst) -> ((fact list) * subst)
	Goal list of q must not be empty.
*)
let rec next rule state =
	match state with
	| (gl,sigma) -> (match gl with
					 | [] -> (raise NextStateError)
					 | (p::rest) -> try(
					 					let (q,ql) = instantiate_rule rule in
					 					let cons = collect_constraints_fact p q in
					 					(* print_fact q;
					 					print_constraints cons; *)
						 				let mgu = unify cons in
						 				let new_sigma = compose mgu sigma in
						 				let nql = List.map (fun g -> fact_subst mgu g) ql in
						 				let nrest = List.map (fun g -> fact_subst mgu g) rest in
						 				print_string "mgu\n";
						 				print_subst sigma;
						 				print_string "\n";
						 				[((nql@nrest),new_sigma)]
						 			)with UnifyError -> [])

(*  rules [rule list] : Rules
	queue [((fact list) * subst) list] : State queue *)	
let rec search rules queue =
	(*print_rules rules;*)
	match queue with 
	| [] -> (false,[],rules,[],false)
	| state::rest -> print_state state;
		(match state with
		 | ([],sigma) -> (true,sigma,rules,rest,true)
		 | _ -> let nexts = List.concat (List.map (fun x -> (next x state)) rules) in
		 		(search rules (rest@nexts)))

(* let rules = [(EPdSymb ("male",[EFnSymb ("koji",[])]));(EPdSymb ("parent",[EFnSymb ("kobo",[]);EFnSymb ("koji",[])]))] *)

let rec eval_command cmd rules queue table = 
	match cmd with
	| CRule r -> (true,[],r::rules,[],[],false)
	| CQuery q -> let newtable = add_env (get_vars_fact_list q) in
				  let sigma = List.map (fun (x,y) -> (y,x)) newtable in
				  let gl = convert_fact_list q sigma in
				  let (result,sigma,newrules,nque,in_progress) = search rules [(gl,[])] in
					(result,sigma,newrules,nque,newtable,in_progress)
	| CCont -> let (result,sigma,newrules,nque,in_progress) = search rules queue in
					(result,sigma,newrules,nque,table,in_progress)
	| CExit -> (true,[],rules,[],[],false)