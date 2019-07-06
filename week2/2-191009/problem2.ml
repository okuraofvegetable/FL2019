type 'a tree =
| Leaf
| Node of 'a * 'a tree * 'a tree;;
let rec dfs_pre = fun v ->
	match v with
	| Leaf -> []
	| Node (n,l,r) -> [n]@(dfs_pre l)@(dfs_pre r);;
let rec dfs_in = fun v ->
	match v with
	| Leaf -> []
	| Node (n,l,r) -> (dfs_in l)@[n]@(dfs_in r);;
let rec dfs_pos = fun v ->
	match v with
	| Leaf -> []
	| Node (n,l,r) -> (dfs_pos l)@(dfs_pos r)@[n];;

let t = Node(1,Node(2,Node(3,Leaf,Leaf),Node(4,Leaf,Leaf)),Node(5,Node(6,Leaf,Leaf),Node(7,Leaf,Leaf)));;

dfs_pre t;;
dfs_in t;;
dfs_pos t;;