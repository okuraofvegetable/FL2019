let rec map = fun f l ->
	match l with 
	| []  -> []
	| y::ys -> f y :: map f ys;;
map (fun x -> x*x)[1; 2; 3];;
