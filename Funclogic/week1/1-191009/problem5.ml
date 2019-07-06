let rec append = fun p q ->
	match p with
	| [] -> q
	| x::xs -> x::(append xs q);;
let rec filter = fun judge l ->
	match l with
	| [] -> []
	| x::xs -> if judge x then x::(filter judge xs)
						  else filter judge xs;;