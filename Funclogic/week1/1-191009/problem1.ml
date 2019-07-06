let rec sum_to = fun x ->
	match x with
	| 0 -> 0
	| x -> x+sum_to (x-1);;
let rec gcd = fun x y ->
	if x = 0 then y
			 else gcd (y mod x) x;; 
let rec is_prime_sub = fun n k ->
	match k with
	| 0 -> false
	| 1 -> true
	| x -> if (n mod k)=0 then false
		   else is_prime_sub n (x-1);;
let is_prime = fun n -> is_prime_sub n (n-1);;