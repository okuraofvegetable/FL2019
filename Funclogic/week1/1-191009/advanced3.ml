let add = fun n m -> (fun f x -> n f (m f x));;
let mul = fun n m -> (fun f x -> n (m f) x);;
let zero = fun f x -> x;;
let succ = fun n -> (fun f x -> f (n f x));;
let next_pair = fun (n,m) -> (succ n, n);;
let fst = fun (x,y) -> x;;
let snd = fun (x,y) -> y;;
let pred = fun n -> snd (n next_pair (zero,zero));;
let sub = fun n m -> m pred n;;

(* for debug *)
let ctoi = fun n -> n (fun x -> x+1) 0;;
let rec itoc = fun n ->
	match n with
	| 0 -> zero
	| n -> succ (itoc (n-1));;