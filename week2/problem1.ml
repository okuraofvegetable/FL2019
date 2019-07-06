type nat = Z | S of nat;;
let rec add = fun x y ->
	match y with
	| Z -> x
	| S p -> add (S x) p;;
let pred = fun x ->
	match x with
	| Z -> Z
	| S p -> p;;
let rec sub = fun x y ->
	match y with
	| Z -> x
	| S p -> sub (pred x) p;;
let rec mul = fun x y -> 
	match y with
	| Z -> Z
	| S p -> add x (mul x p);;
let rec pow = fun x y ->
	match y with
	| Z -> S Z
	| S p -> mul x (pow x p);;
let rec n2i = fun x ->
	match x with
	| Z -> 0
	| S p -> 1 + n2i p;;
let rec i2n = fun x ->
	match x with
	| 0 -> Z
	| y -> S (i2n (y-1));;