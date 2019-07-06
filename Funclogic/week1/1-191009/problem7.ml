let rec map = fun f l ->
	match l with 
	| []  -> []
	| y::ys -> f y :: map f ys;;
let cons = fun x l -> x::l;;
let rec perm_sub = fun fi sec acc ->
	match sec with
	| [] -> if fi=[] then [[]] else acc
	| y::ys -> (perm_sub (fi@(y::[])) ys (acc@(map (cons y) (perm_sub [] (fi@ys) []))));;
let perm = fun l -> perm_sub [] l [];;