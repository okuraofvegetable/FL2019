type false_t = { t : 'a. 'a };;
type 'a not_t = 'a -> false_t;;
type ('a, 'b) and_t = 'a * 'b;;
type ('a, 'b) or_t = L of 'a | R of 'b;;
let top (x : 'a) = x;;
let orE (ab : ('a, 'b) or_t) (atoc : 'a -> 'c) (btoc : 'b -> 'c) =
	match ab with
	| L a -> atoc a
	| R b -> btoc b;;
let func1 (ab : 'a -> 'b) (bc : 'b -> 'c) = fun x -> bc (ab x);; 
let func2 (x : ('a, ('b, 'c) and_t) or_t) =
	match x with
	| L a -> ((L a,L a) : (('a, 'b) or_t, ('a, 'c) or_t) and_t)
	| R (b,c) -> ((R b,R c) : (('a, 'b) or_t, ('a, 'c) or_t) and_t);;
let func3 (x : (('a, 'b) or_t, ('a, 'c) or_t) and_t) =
	match x with
	| (aorb,aorc) -> (match aorb with
					  | L a -> (L a : ('a, ('b, 'c) and_t) or_t)
					  | R b -> (match aorc with
					  			| L a -> (L a : ('a, ('b, 'c) and_t) or_t)
					  			| R c -> (R (b,c) : ('a, ('b, 'c) and_t) or_t)));;
let rec callcc : ((('a -> false_t) -> 'a) -> 'a) = fun f -> callcc f;;
let func4 (ac : 'a -> 'c) (nac : 'a not_t -> 'c) = 
	match callcc (fun (k : (('a,'a not_t) or_t) not_t) -> (R (fun x -> (k (L x))))) with
	| L a -> ac a
	| R na -> nac na;;
let func6 (g : ('a -> 'b) -> 'a) =
	orE (callcc (fun (k : (('a,'a not_t) or_t) not_t) 
				-> (R (fun (x : 'a) -> (k (L x)))))) 
		top 
		(fun na -> g (fun a -> ((na a).t:'b)));;
