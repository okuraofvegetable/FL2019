open Syntax

exception Unbound

let empty_env = []
let extend x v env = (x, v) :: env

let rec lookup x env =
  try List.assoc x env with Not_found -> raise Unbound

exception EvalErr
exception DivisionByZero

let rec recFunExtendSub fs id fsfix oenv = 
  match fs with
  | [] -> oenv
  | ((f,x,e)::frem) -> (extend f (VRecFun(id,fsfix,oenv)) (recFunExtendSub frem (id+1) fsfix oenv))

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
     | Unbound -> raise EvalErr)
  | EAdd (e1,e2) ->
    let v1 = eval_expr env e1 in
    let v2 = eval_expr env e2 in
    (match v1, v2 with
     | VInt i1, VInt i2 -> VInt (i1 + i2)
     | _ -> raise EvalErr)
  | ESub (e1,e2) ->
    let v1 = eval_expr env e1 in
    let v2 = eval_expr env e2 in
    (match v1, v2 with
     | VInt i1, VInt i2 -> VInt (i1 - i2)
     | _ -> raise EvalErr)
  | EMul (e1,e2) ->
    let v1 = eval_expr env e1 in
    let v2 = eval_expr env e2 in
    (match v1, v2 with
     | VInt i1, VInt i2 -> VInt (i1 * i2)
     | _ -> raise EvalErr)
  | EDiv (e1,e2) ->
    let v1 = eval_expr env e1 in
    let v2 = eval_expr env e2 in
    (match v1, v2 with
     | VInt i1, VInt i2 -> (match i2 with
                            | 0 -> (raise DivisionByZero)
                            | i2 -> VInt (i1 / i2))
     | _ -> raise EvalErr)
  | EEq (e1,e2) ->
    let v1 = eval_expr env e1 in
    let v2 = eval_expr env e2 in
    (match v1, v2 with
     | VInt i1,  VInt i2  -> VBool (i1 = i2)
     | _ -> raise EvalErr)
  | ELt (e1,e2) ->
    let v1 = eval_expr env e1 in
    let v2 = eval_expr env e2 in
    (match v1, v2 with
     | VInt i1,  VInt i2  -> VBool (i1 < i2)
     | _ -> raise EvalErr)
  | EIf (e1,e2,e3) ->
    let v1 = eval_expr env e1 in
    (match v1 with
     | VBool b ->
       if b then eval_expr env e2 else eval_expr env e3
     | _ -> raise EvalErr)
  | ELet (n,e1,e2) -> (eval_expr (extend n (eval_expr env e1) env) e2)
  | EFun (x,exp) -> VFun(x,exp,env)
  | EApp (e1,e2) -> let v1 = eval_expr env e1 in
                    let v2 = eval_expr env e2 in
                    (match v1 with
                     | VFun(x,e,oenv) -> eval_expr (extend x v2 oenv) e
                     | VRecFun (idx,fs,oenv) -> let env' = (recFunExtendSub fs 0 fs oenv) in 
                                                let (f_i,x_i,e_i) = List.nth fs idx in
                                                  eval_expr (extend x_i v2 env') e_i
                     | _ -> raise EvalErr)
  | ELetRec (fs,e2) ->
    let env' = recFunExtendSub fs 0 fs env
      in eval_expr env' e2
and eval_command env c = 
  match c with
  | CExp e -> (*print_expr e;*)("-", env, eval_expr env e)
  | CDecl (n,e) -> (*print_expr e;*)(match (eval_expr env e) with
                    | v -> ("val "^n,(extend n v env),v))
  | CRecDecl (fs) -> (*print_expr e;*)("rec functions",(recFunExtendSub fs 0 fs env),(VInt 1374))

