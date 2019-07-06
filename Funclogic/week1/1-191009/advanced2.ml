let rec fold_right = fun f l e -> 
	match l with
	| [] -> e
	| x::xs -> f x (fold_right f xs e);;
let rec fold_left = fun f e l ->
	match l with
	| [] -> e
	| x::xs -> fold_left f (f e x) xs;;
let reverse_via_fold_left = fun l -> fold_left (fun l x -> x::l) [] l;;
let fold_right_via_fold_left = 
	fun f l e -> fold_left (fun l x -> f x l) e (reverse_via_fold_left l);;
let g = fun f x h -> (fun e -> h (f e x));;
let fold_left_via_fold_right = 
	fun f e l -> (fold_right (g f) l (fun x -> x)) e;;