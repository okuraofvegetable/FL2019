type 'a m = int -> ('a list * int)

let (>>=) x f = 
  fun init ->
    (let (r,seed) = x init in f r seed)

(** return : 'a -> 'a m *)
let return x = fun init -> (x,init)

(** next : int m -> int m *)
let next (f : int m) =
  fun ps -> (match f ps with
             | (rs,s) -> (let ns = ((s*23+17) mod 119) in (ns::rs,ns)))
(** generate : int -> int m *)
let rec generate n =
  if n = 0 then
    return []
  else
    (next (generate (n-1))) >>= (fun x ->
      return x)

let runGenerate x init_seed= 
  let (res,_) = ((generate x) init_seed) in res  

