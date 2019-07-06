type church = {t : 'a. ('a -> 'a) -> 'a -> 'a };;

let add = fun n m -> {t = (fun f x -> n.t f (m.t f x))};;
let mul = fun n m -> {t = (fun f x -> n.t (m.t f) x)};;
let zero = {t = (fun f x -> x)};;
let succ = fun n -> {t = (fun f x -> f (n.t f x))};;
let next_pair = fun (n,(m:church)) -> (succ n, n);;
let fst = fun (x,y) -> x;;
let snd = fun (x,y) -> y;;
let pred = fun n -> snd (n.t next_pair (zero,zero));;
let sub = fun n m -> m.t pred n;;

(* for debug *)
let ctoi = fun (n:church) -> n.t (fun x -> x+1) 0;;
let rec itoc = fun n ->
	match n with
	| 0 -> zero
	| n -> succ (itoc (n-1));;