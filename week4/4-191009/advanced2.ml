(* Definition of "the" list monad *)
type 'a m = 'a list

let single l =  if (List.length l) = 1 then true else false
let rec all judge l = match l with
				  | [] -> true
				  | x::xs -> (if (judge x) then (all judge xs)
				  						  else false)
let join xss = if single xss then List.concat xss
							 else (if all single xss then List.concat xss
							 						 else []);;
(** (>>=) : 'a m -> ('a -> 'b m) -> 'b m *)
let (>>=) (x : 'a m) (f : 'a -> 'b m) = join (List.map f x)
(** return : 'a -> 'a m *)
let return (x : 'a) = [x]