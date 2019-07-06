let twice = fun f -> (fun x -> f (f x));;
let chain = fun f g -> (fun x -> f (g x));; (* 関数合成 *)
let rec repeat = fun f n -> 
	match n with
	| 1 -> (fun x -> (f x))
	| x -> chain f (repeat f (x-1));;