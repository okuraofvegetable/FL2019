type order = LT | EQ | GT

module type ORDERED_TYPE = 
sig 
  type t
  val compare : t -> t -> order 
end

module type MULTISET2 = 
  functor (T : ORDERED_TYPE) -> 
    sig 
      type t 
      val empty : t 
      val add    : T.t -> t -> t 
      val remove : T.t -> t -> t 
      val count  : T.t -> t -> int 
    end

module Multiset2 : MULTISET2 =
  functor (T : ORDERED_TYPE) -> struct 
  	type 'a btree = | Leaf
					          | Node of 'a * ('a btree) * ('a btree)
    type t = T.t btree
    exception RemoveError1
    exception RemoveError2
    let rec remove_sub xs =
    	match xs with
    	| Leaf -> (raise RemoveError1)
    	| Node (v,l,r) -> 
        (match l with
    		 | Leaf -> (r,v)
    		 | Node (_,_,_) -> 
            (match remove_sub l with
    				 | (ys,mini) -> (Node (v,ys,r),mini)))
    let rec remove a xs = 
      match xs with 
	    | Leaf -> (raise RemoveError2)
	    | Node (v,l,r) -> 
        (match (T.compare a v) with
				 | GT -> Node(v,l,(remove a r))
				 | LT -> Node(v,(remove a l),r)
				 | EQ -> (match r with
					   			| Leaf -> l
					   			| Node (_,_,_) -> (match (remove_sub r) with
					   							           | (ys,mini) -> Node (mini,l,ys))))
    let empty = Leaf
    let rec add a xs =
      match xs with
      | Leaf -> Node (a,Leaf,Leaf)
      | Node (v,l,r) -> (match (T.compare a v) with
      					 | LT -> Node (v,(add a l),r)
      					 | _ -> Node (v,l,(add a r)))
    let rec count a xs = 
    	match xs with
    	| Leaf -> 0
    	| Node (v,l,r) -> (match T.compare a v with
    					   | EQ -> 1 + (count a r)
    					   | GT -> (count a r)
    					   | LT -> (count a l))
    (* for debug *)
    let rec dump xs = 
      match xs with
      | Leaf -> (print_char '(';print_char ')')
      | Node (v,l,r) -> (print_char '(';dump l;print_int v;dump r;print_char ')')
  end

module OrderedInt =
struct
	type t = int
	let compare x y = if x < y then LT
					  else if x > y then GT
					  else EQ
end

module IntMultiset = Multiset2 (OrderedInt)
let e = IntMultiset.empty;;
let s = IntMultiset.add 5 (IntMultiset.add 5 (IntMultiset.add 2 e));;
IntMultiset.count 5 s;;
IntMultiset.count 2 s;;
IntMultiset.count 5 (IntMultiset.remove 5 s);;