let rec sigma = fun f n ->
	if n = 0 then f 0
			 else f n + sigma f (n-1);; 
let f = fun x -> x*x+x in sigma f 10;;