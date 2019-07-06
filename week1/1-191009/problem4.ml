let rec fold_right = fun f l e -> 
	match l with
	| [] -> e
	| x::xs -> f x (fold_right f xs e);;
let rec fold_left = fun f e l ->
	match l with
	| [] -> e
	| x::xs -> fold_left f (f e x) xs;;