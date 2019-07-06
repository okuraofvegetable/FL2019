open Syntax

exception Unbound

let empty_env = []
let extend x v env = (x, v) :: env

let rec lookup x env =
  try List.assoc x env with Not_found -> raise Unbound

exception EvalErr
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
  | EFun (x,exp) -> VFun(x,exp,ref env)
  | EDFun (x,exp) -> VDFun(x,exp)
  | EApp (e1,e2) -> let v1 = eval_expr env e1 in
                    let v2 = eval_expr env e2 in
                      (match v1 with 
                       | VFun (x,e,oenv) -> eval_expr (extend x v2 (!oenv)) e
                       | VDFun (x,e) -> eval_expr (extend x v2 env) e
                       | _ -> (raise EvalErr))
  | ELetRec (f,x,e1,e2) ->
    let oenv = ref [] in
    let v = VFun(x,e1,oenv) in
      (oenv := extend f v env;
       eval_expr (extend f v env) e2) 
and eval_command env c = 
  match c with
  | CExp e -> (*print_string "[env]\n";print_env env;print_string "[expr]\n";print_expr e;*)("-", env, eval_expr env e)
  | CDecl (n,e) -> (*print_expr e;*)(match (eval_expr env e) with
                    | v -> ("val "^n,(extend n v env),v))
  | CRecDecl (id,n,e) -> (*print_string "[expr]\n";print_expr e;*)
  let oenv = ref [] in
  let v = VFun(n,e,oenv) in
    (oenv := extend id v env;("rec val "^id,(extend id v env),v))