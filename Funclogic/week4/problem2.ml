type 'a m = 'a list;;
let (>>=) x f = List.concat (List.map f x);;
let return x = [x];;
let guard b = if b then return () else [];;

let find =
[1; 2; 3] >>= (fun x ->
[4; 5; 6] >>= (fun y ->
(guard (x + y > 7)) >>= (fun _ ->
return (x, y))));;


let digit = [0;1;2;3;4;5;6;7;8;9];;
let rec fold_left = fun f e l ->
	match l with
	| [] -> e
	| x::xs -> fold_left f (f e x) xs;;
let ltoi l = fold_left (fun x y -> 10*x+y) 0 l;;
let rec remove xs key = 
	match xs with
	| [] -> []
	| y::ys -> if y=key then ys
						else y::(remove ys key);;
let remove_list lis kl =
	fold_left (fun e x -> remove e x) lis kl;;
digit >>= (fun ba ->
digit >>= (fun na ->
digit >>= (fun shi ->
digit >>= (fun mo ->
digit >>= (fun n ->
guard (2*(ltoi [ba;na;na])=(ltoi [shi;na;mo;n])) >>= (fun _ ->
return (ba,na,shi,mo,n)))))));;
(remove digit 0) >>= (fun s ->
(remove digit s) >>= (fun e ->
(remove_list digit [s;e]) >>= (fun n ->
(remove_list digit [s;e;n]) >>= (fun d ->
(remove_list digit [0;s;e;n;d]) >>= (fun m ->
(remove_list digit [s;e;n;d;m]) >>= (fun o ->
(remove_list digit [s;e;n;d;m;o]) >>= (fun r ->
(remove_list digit [s;e;n;d;m;o;r]) >>= (fun y ->
guard (((ltoi [s;e;n;d])+(ltoi [m;o;r;e]))=(ltoi [m;o;n;e;y])) >>= (fun _ ->
return (s,e,n,d,m,o,r,y))))))))));;