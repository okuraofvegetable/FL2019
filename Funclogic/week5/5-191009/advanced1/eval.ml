open Syntax

exception Unbound

type env = (name * value) list

let empty_env = []
let extend x v env = (x, v) :: env

let rec lookup x env =
  try List.assoc x env with Not_found -> raise Unbound

exception EvalErr of string
exception DivisionByZero

let rec eval_expr env e =
  match e with
  | EConstInt i ->
    VInt i
  | EConstBool b ->
    VBool b
  | EVar x ->
    (try
       lookup x env
     with
     | Unbound -> (raise (EvalErr ("Unbound value "^x))))
  | EAdd (e1,e2) ->
    let v1 = eval_expr env e1 in
    let v2 = eval_expr env e2 in
    (match v1, v2 with
     | VInt i1, VInt i2 -> VInt (i1 + i2)
     | _ -> raise (EvalErr "argument of + is must have type int"))
  | ESub (e1,e2) ->
    let v1 = eval_expr env e1 in
    let v2 = eval_expr env e2 in
    (match v1, v2 with
     | VInt i1, VInt i2 -> VInt (i1 - i2)
     | _ -> raise (EvalErr "arguments of - is must have type int"))
  | EMul (e1,e2) ->
    let v1 = eval_expr env e1 in
    let v2 = eval_expr env e2 in
    (match v1, v2 with
     | VInt i1, VInt i2 -> VInt (i1 * i2)
     | _ -> raise (EvalErr "arguments of * is must have type int"))
  | EDiv (e1,e2) ->
    let v1 = eval_expr env e1 in
    let v2 = eval_expr env e2 in
    (match v1, v2 with
     | VInt i1, VInt i2 -> (match i2 with
                            | 0 -> (raise DivisionByZero)
                            | i2 -> VInt (i1 / i2))
     | _ -> raise (EvalErr "arguments of / is must have type int"))
  | EEq (e1,e2) ->
    let v1 = eval_expr env e1 in
    let v2 = eval_expr env e2 in
    (match v1, v2 with
     | VInt i1,  VInt i2  -> VBool (i1 = i2)
     | VBool i1,  VBool i2  -> VBool (i1 = i2)
     | _ -> raise (EvalErr "arguments of = must have same type"))
  | ELt (e1,e2) ->
    let v1 = eval_expr env e1 in
    let v2 = eval_expr env e2 in
    (match v1, v2 with
     | VInt i1,  VInt i2  -> VBool (i1 < i2)
     | _ -> raise (EvalErr "arguments of < must have type int"))
  | EIf (e1,e2,e3) ->
    let v1 = eval_expr env e1 in
    (match v1 with
     | VBool b ->
       if b then eval_expr env e2 else eval_expr env e3
     | _ -> raise (EvalErr "value follows 'if' must have type bool"))
  | ELet (n,e1,e2) -> (eval_expr (extend n (eval_expr env e1) env) e2)
  | EAnd (e1,e2) ->
    let v1 = eval_expr env e1 in
    let v2 = eval_expr env e2 in
    (match v1,v2 with
     | VBool b1, VBool b2 -> VBool (b1 && b2)
     | _ -> raise (EvalErr "arguments of && must have type bool"))
  | EOr (e1,e2) ->
    let v1 = eval_expr env e1 in
    let v2 = eval_expr env e2 in
    (match v1,v2 with
     | VBool b1, VBool b2 -> VBool (b1 || b2)
     | _ -> raise (EvalErr "arguments of && must have type bool"))
  | EXor (e1,e2) ->
    let v1 = eval_expr env e1 in
    let v2 = eval_expr env e2 in
    (match v1,v2 with
     | VBool b1, VBool b2 -> VBool (((not b1)&&b2)||(b1&&(not b2)))
     | _ -> raise (EvalErr "arguments of && must have type bool"))
let rec eval_command env c =
  match c with
  | CExp e -> ("-", env, eval_expr env e)
  | CDecl (n,e) -> (match (eval_expr env e) with
                    | v -> ("val "^n,(extend n v env),v)) 
