let rec fix f x = f (fix f) x;;
let sum_to_sub = fun f n -> if n=0 then 0
								   else n + f (n-1);;
let sum_to = fun x -> fix sum_to_sub x;;
let is_prime_sub = fun f n k ->
	match k with
	| 0 -> false
	| 1 -> true
	| x -> if (n mod k)=0 then false
		   else f n (x-1);;
let is_prime = fun x -> fix is_prime_sub x (x-1);;
let gcd_sub = fun f x y ->
	if x = 0 then y
			 else f (y mod x) x;; 
let gcd = fun x y -> fix gcd_sub x y;;
