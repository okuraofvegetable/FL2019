let rec fold_right = fun f l e -> 
	match l with
	| [] -> e
	| x::xs -> f x (fold_right f xs e);;
let rec fold_left = fun f e l ->
	match l with
	| [] -> e
	| x::xs -> fold_left f (f e x) xs;;
let append_via_fold_right = fun p q -> fold_right (fun x l -> x::l) p q;;
let filter_via_fold_right = fun judge l ->
	fold_right (fun x l -> if judge x then x::l else l) l [];;

let append_back = fun l x -> fold_right (fun y li -> y::li) l (x::[]);;
let append_back_f = fun judge l x ->
	if judge x then fold_right (fun y li -> y::li) l (x::[])
			   else l;;
let append_via_fold_left_slow = fun p q -> fold_left append_back p q;;
let filter_via_fold_left_slow = fun judge l -> fold_left (append_back_f judge) [] l;;

(* represent fold_right by fold_left only *)
let reverse_via_fold_left = fun l -> fold_left (fun l x -> x::l) [] l;;
let fold_right_via_fold_left = 
	fun f l e -> fold_left (fun l x -> f x l) e (reverse_via_fold_left l);;
let append_via_fold_left_fast = fun p q -> fold_right_via_fold_left (fun x l -> x::l) p q;;
let filter_via_fold_left_fast = fun judge l ->
	fold_right_via_fold_left (fun x l -> if judge x then x::l else l) l [];;