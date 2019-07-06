type ('a,'b) recfunc = F of (('a,'b) recfunc -> (('a -> 'b) -> 'a -> 'b) -> 'a -> 'b)
let rec_call (F fld) = fld (F fld)
let fix_rec = F (fun self f x -> f ((rec_call self) f) x)
let fix f x = (rec_call fix_rec) f x
let sum_to_sub = fun f n -> if n=0 then 0
								   else n + f (n-1);;
let sum_to = fun x -> fix sum_to_sub x;;