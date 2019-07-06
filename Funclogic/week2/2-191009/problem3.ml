let rec fold_left = fun f e l ->
	match l with
	| [] -> e
	| x::xs -> fold_left f (f e x) xs;;
let reverse = fun l -> fold_left (fun l x -> x::l) [] l;;
type 'a tree =
| Leaf
| Node of 'a * 'a tree * 'a tree;;
let t = Node(1,Node(2,Node(3,Leaf,Leaf),Node(4,Leaf,Leaf)),Node(5,Node(6,Leaf,Leaf),Node(7,Leaf,Leaf)));;
let rec bfs_sub = fun que acc -> 
	match que with 
	| [] -> acc
	| v::vs -> (match v with
				| Leaf -> (bfs_sub vs acc)
				| Node (n,l,r) -> (bfs_sub (vs@[l;r]) (n::acc)));;
let bfs = fun v -> reverse (bfs_sub [v] []);;