let f = fun x -> fun y -> x;;
let rec fix f = fun x -> f (fix f) x;;
let rec f n = if n = 0 then 0 else n + f (n-1) in f 10;;
let apply = fun f ->  fun x -> let g = f in if true then f 1 else f true;;