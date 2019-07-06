type complex = {re: float; im: float};;
let prod = fun x y -> {re = x.re*.y.re -. x.im *. y.im;im = x.re *. y.im +. x.im *. y.re};;
type str_tree =
| Leaf
| Node of string * str_tree * str_tree;;
let tree1 = ("a",Leaf,Leaf);;
let tree2 = ("b",tree1,tree1);;
let tree3 = ("c",tree2,tree2);;
type ib_list = INil
| ICons of int * bi_list
and bi_list = BNil
| BCons of bool * ib_list;;
let ib1 = ICons(3,BNil);;
let ib2 = ICons(4,BCons(true,INil));;
let ib3 = ICons(5,BCons(false,ICons(2,BNil)));;
