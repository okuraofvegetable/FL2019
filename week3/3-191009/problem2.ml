module type STACK =
sig
	type 'a t
	val empty : 'a t
	val pop : 'a t -> ('a * ('a t))
	val push : 'a -> 'a t -> 'a t
	val size : 'a t -> int
end
module Stack : STACK =
struct
	type 'a t = 'a list
	exception PopError
	let empty = []
	let pop s = 
		match s with
		| [] -> (raise PopError)
		| y::ys -> (y,ys)
	let push v s = v::s
	let rec size s =
		match s with
		| [] -> 0
		| y::ys -> 1+size ys
end
