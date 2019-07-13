type order = LT | EQ | GT

module type ORDERED_TYPE = 
sig 
  type t
  val compare : t -> t -> order 
end

module type VALUE_TYPE =
sig
  type t
end

module OrderedInt =
struct
  type t = int
  let compare x y = if x < y then LT
            else if x > y then GT
            else EQ
end

module ValueInt = 
struct
  type t = int
end

module type MAP_NODE_TYPE = 
    sig
      type key_t
      type val_t
      type t
      val key : t -> key_t
      val value : t -> val_t
      val combine : key_t -> val_t -> t
      val compare_by_key : t -> key_t -> order
    end

module Map_node = 
  functor (Key: ORDERED_TYPE) (Value: VALUE_TYPE) -> struct
      type key_t = Key.t
      type val_t = Value.t
      type t = (Key.t)*(Value.t)
      let key = fun node -> match node with
                            | (k,v) -> k
      let value = fun node -> match node with
                              | (k,v) -> v
      let combine = fun k v -> (k,v)
      let compare_by_key = fun node k ->
        match node with 
        | (ke,va) -> Key.compare ke k
    end

module type MAP = 
  functor (T : MAP_NODE_TYPE) -> sig 
      type t 
      val empty : t 
      val add    : T.key_t -> T.val_t -> t -> t 
      val remove : T.key_t -> t -> t 
      val lookup  : T.key_t -> t -> T.val_t
    end

module Map : MAP =
  functor (T : MAP_NODE_TYPE) -> struct 
    type 'a btree = | Leaf
                    | Node of 'a * ('a btree) * ('a btree)
    type t = T.t btree
    exception RemoveError
    exception LookupError

    let rec remove_sub xs =
      match xs with
      | Leaf -> (raise RemoveError)
      | Node (v,l,r) -> (match l with
                         | Leaf -> (r,v)
                         | Node _ -> (match remove_sub l with
                                      | (ys,del) -> (Node(v,ys,r),del)))
    let rec remove a xs = 
      match xs with 
      | Leaf -> (raise RemoveError)
      | Node (v,l,r) -> (match (T.compare_by_key v a) with
                         | GT -> Node(v,l,(remove a r))
                         | LT -> Node(v,(remove a l),r)
                         | EQ -> (match r with
                                  | Leaf -> l
                                  | Node _ -> (match (remove_sub r) with
                                                     | (ys,del) -> Node(del,l,r))))
    let empty = Leaf
    let rec add a b xs =
      match xs with
      | Leaf -> Node ((T.combine a b),Leaf,Leaf)
      | Node (v,l,r) -> (match (T.compare_by_key v a) with
                         | GT -> Node (v,l,(add a b r))
                         | LT -> Node (v,(add a b l),r)
                         | EQ -> Node ((T.combine a b),l,r))
    let rec lookup a xs = 
      match xs with
      | Leaf -> (raise LookupError)
      | Node (v,l,r) -> (match (T.compare_by_key v a) with
                         | GT -> lookup a r
                         | LT -> lookup a l
                         | EQ -> (T.value v))
  end
module MapIntInt = Map (Map_node (OrderedInt) (ValueInt))
open MapIntInt;;
let e = empty;;
let e = (add 1 6 e);;
let e = (add 2 15 e);;
let e = (add 3 19 e);;
lookup 1 e;;
lookup 3 e;;
let e = (remove 1 e);;
lookup 1 e;;
