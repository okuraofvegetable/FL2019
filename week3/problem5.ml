type integer = Inf | Number of int 
type dist = INF | Z of int
module type SEMIRING = sig
	type t
	val add : t -> t -> t
	val mul : t -> t -> t
	val unit : t
	val zero : t
end
module Boolring = struct
	type t = bool
	let add x y = (x || y)
	let mul x y = (x && y)
	let unit = true
	let zero = false
end
module Tropicalring = struct
	type t = integer
	let add x y = match x with
				  | Inf -> y
				  | Number xv -> (match y with
				  		 		  | Inf -> x
				  	 			  | Number yv -> if (xv<yv) then (Number xv) else (Number yv))
	let mul x y = match x with
				  | Inf -> Inf
				  | Number xv -> (match y with
				  				  | Inf -> Inf
				  				  | Number yv -> Number (xv+yv))
	let unit = Number 0
	let zero = Inf
end
module Distring = struct
	type t = dist
	let add x y = match x with
				  | INF -> y
				  | Z x -> (match y with
				  			| INF -> (Z x)
				  			| Z y -> (if x<y then (Z x) else (Z y)))
	let mul x y = match x with
				  | INF -> INF
				  | Z x -> (match y with
				  			| INF -> INF
				  			| Z y -> (Z (x+y)))
	let zero = INF
	let unit = Z 0
end
module type MATRIX = 
	functor (R : SEMIRING) -> sig
		type t
		val init : R.t list list -> t
		val add : t -> t -> t
		val mul : t -> t -> t
		val pow : t -> int -> t
		val output : t -> R.t list list
	end
module Matrix : MATRIX =
	functor (R : SEMIRING) -> struct
		type t = R.t list list
		exception InvalidInitializer
		exception InvalidArgument
		exception AddTypeError
		exception MulTypeError
		let rec list_length l = 
			match l with
			| [] -> 0
			| x::xs -> 1+(list_length xs)
		let rec init_check x = 
			match x with
			| [] -> raise InvalidInitializer
			| _::[] -> true
			| a::(b::c) -> ((list_length a)=((list_length b))&&(init_check (b::c)))
		let init x = if (init_check x) then x else (raise InvalidInitializer)
		let row x = list_length x
		let column x = match x with
					   | [] -> (raise InvalidArgument)
					   | y::ys -> (list_length y)
		let add_type_check x y = ((row x)=(row y))&&((column x)=(column y))
		let mul_type_check x y = ((column x)=(row y))
		let rec add_list xl yl = match xl with
						   | [] -> []
						   | x::xs -> (match yl with
						   			   | [] -> (raise InvalidArgument)
						   			   | y::ys -> (R.add x y)::(add_list xs ys))
		let rec add_body xl yl = match xl with
						   | [] -> []
						   | x::xs -> (match yl with
						   			   | [] -> (raise InvalidArgument)
						   			   | y::ys -> (add_list x y)::(add_body xs ys))
		let rec first_col x = match x with
						  | [] -> ([],[])
						  | y::ys -> (match y with
						  			  | [] -> (raise InvalidArgument)
						  			  | z::zs -> (match (first_col ys) with
						  			 			  | (fc,rem) -> ((z::fc),(zs::rem))))
		let rec transpose x = match x with
							  | [] -> (raise InvalidArgument)
							  | y::ys -> (match y with
							  			  | [] -> []
							  			  | _ -> (match (first_col x) with
								  				  | (fc,rem) -> (fc::(transpose rem))))
		let rec dot x y = match x with
						  | [] -> R.zero
						  | xa::xs -> (match y with
						  			   | [] -> (raise InvalidArgument)
						  			   | ya::ys -> (R.add (R.mul xa ya) (dot xs ys)))
		let rec mul_sub xa y = match y with
							   | [] -> []
							   | ya::ys -> ((dot xa ya)::(mul_sub xa ys))
		let rec mul_body x y = match x with
						   | [] -> []
						   | xa::xs -> ((mul_sub xa y)::(mul_body xs y))
		let add x y = if (add_type_check x y) then (add_body x y) else (raise AddTypeError)
		let mul x y = if (mul_type_check x y) then (mul_body x (transpose y)) else (raise MulTypeError)
		let rec pow x n = if (n = 1) then x
							   else (match (n mod 2) with
					  				 | 0 -> (mul (pow x (n/2)) (pow x (n/2)))
					  				 | 1 -> (mul x (mul (pow x (n/2)) (pow x (n/2))))
					  				 | _ -> (raise InvalidArgument))
		let output x = x
	end
module BoolMatrix = Matrix(Boolring);;
module TropicalMatrix = Matrix(Tropicalring);;
module DistMatrix = Matrix(Distring);;
open DistMatrix;;
let m = init [[Z 0;Z 8;INF;Z 9];[Z 8;Z 0;Z 6;Z 3];[INF;Z 6;Z 0;INF];[Z 9;Z 3;INF;Z 0]];;
output (pow m 5);;