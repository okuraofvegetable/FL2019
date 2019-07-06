type 'a myErr = Err of string | Ok of 'a ;;
let (>>=) x f = match x with
				| Err msg -> Err msg
				| Ok y -> f y;;
let myDiv x y = if y = 0 then Err "Div by Zero"
						 else Ok (x/y);;
let rec eLookup key xs =
	match xs with
	| [] -> Err ("Not found")
	| ((k,v)::rest) -> if key = k then Ok v
					   else eLookup key rest;;
let lookupDiv = fun kx ky t -> (eLookup kx t) >>= (fun x ->
							   (eLookup ky t) >>= (fun y ->
							   myDiv x y));;