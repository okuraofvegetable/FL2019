type expr =
| EConstInt of int
| EAdd of expr * expr
| ESub of expr * expr
| EMul of expr * expr
| EConstBool of bool
| Eequal of expr * expr
| Elt of expr * expr
| Eif of expr * expr * expr;;
type value = VInt of int | VBool of bool;;