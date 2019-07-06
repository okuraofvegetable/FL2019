type 'a m = ((int * 'a) list) -> ('a * ((int * 'a) list))

(** (>>=) : 'a m -> ('a -> 'b m) -> 'b m *)
let (>>=) (x : 'a m) (f : 'a -> 'b m) = 
  fun init ->
    (let (res,table) = x init in f res table)

(** return : 'a -> 'a m *)
let return x = fun init -> (x,init)

(** memo : (int -> int m) -> int -> int m *)
let memo (f : int -> int m) n = 
  (fun x -> (match List.mem_assoc n x with
             | true -> (let found_value = List.assoc n x in (found_value,x))
             | false -> (let (calc_value,y) = f n x in (calc_value,(n,calc_value)::y)))) 
(** runMemo : 'a m -> 'a *)
let runMemo (x : 'a m) = 
  let (res,_) = (x []) in res

let rec fib n =
  if n <= 1 then
    return n
  else
    (memo fib (n-2)) >>= (fun r1 ->
    (memo fib (n-1)) >>= (fun r2 ->
      return (r1 + r2)))
			   
let _ =
  if runMemo (fib 80) = 23416728348467685 && runMemo (fib 10) = 55 then
    print_string "ok\n"
  else
    print_string "wrong\n"
