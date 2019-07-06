open Syntax
open TySyntax
open ConstraintSolver

exception Unbound

let empty_env = []
let tyenv = []
let extend x v env = (x, v) :: env



let rec lookup x env =
  try List.assoc x env with Not_found -> raise Unbound
exception InferTypeError
exception EvalErr
exception DivisionByZero

let rec infer_expr tyenv e =
  match e with
  | EConstInt i -> (TyInt,[])
  | EConstBool b -> (TyBool,[])
  | EVar x ->
    (try
       ((lookup x tyenv),[])
     with
     | Unbound -> (raise InferTypeError))
  | EAdd (e1,e2) -> 
    let (t1,c1) = infer_expr tyenv e1 in
    let (t2,c2) = infer_expr tyenv e2 in
    (TyInt,[(t1,TyInt);(t2,TyInt)]@c1@c2)
  | ESub (e1,e2) -> 
    let (t1,c1) = infer_expr tyenv e1 in
    let (t2,c2) = infer_expr tyenv e2 in
    (TyInt,[(t1,TyInt);(t2,TyInt)]@c1@c2)
  | EMul (e1,e2) -> 
    let (t1,c1) = infer_expr tyenv e1 in
    let (t2,c2) = infer_expr tyenv e2 in
    (TyInt,[(t1,TyInt);(t2,TyInt)]@c1@c2)
  | EDiv (e1,e2) -> 
    let (t1,c1) = infer_expr tyenv e1 in
    let (t2,c2) = infer_expr tyenv e2 in
    (TyInt,[(t1,TyInt);(t2,TyInt)]@c1@c2)
  | EEq (e1,e2) ->
    let (t1,c1) = infer_expr tyenv e1 in
    let (t2,c2) = infer_expr tyenv e2 in
    (TyBool,[(t1,t2)]@c1@c2)
  | ELt (e1,e2) ->
    let (t1,c1) = infer_expr tyenv e1 in
    let (t2,c2) = infer_expr tyenv e2 in
    (TyBool,[(t1,t2)]@c1@c2)
  | EIf (e1,e2,e3) ->
    let (t1,c1) = infer_expr tyenv e1 in
    let (t2,c2) = infer_expr tyenv e2 in
    let (t3,c3) = infer_expr tyenv e3 in
    (t2,[(t1,TyBool);(t2,t3)]@c1@c2@c3)
  | ELet (n,e1,e2) -> 
    let (t1,c1) = infer_expr tyenv e1 in
    let (t2,c2) = infer_expr (extend n t1 tyenv) e2 in
    (t2,c1@c2)
  | EFun (x,exp) -> 
    let alpha = TyVar(new_tyvar ()) in
    let (t,c) = infer_expr (extend x alpha tyenv) exp in
    (TyFun(alpha,t),c) 
  | EApp (e1,e2) -> let (t1,c1) = infer_expr tyenv e1 in
                    let (t2,c2) = infer_expr tyenv e2 in
                    let alpha = TyVar(new_tyvar ()) in
                    (alpha,[(t1,TyFun(t2,alpha))]@c1@c2)
  | ELetRec (f,x,e1,e2) ->
    let alpha = TyVar(new_tyvar ()) in
    let beta = TyVar(new_tyvar ()) in
    let env' = (extend x alpha (extend f (TyFun(alpha,beta)) tyenv)) in
    let (t1,c1) = infer_expr env' e1 in
    let (t2,c2) = infer_expr (extend f (TyFun(alpha,beta)) tyenv) e2 in
      (t2,[(t1,beta)]@c1@c2)

let decide_expr_type tyenv exp = let (t,c) = infer_expr tyenv exp in ty_subst (unify c) t

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
                     | VRecFun (f,x,e,oenv) ->let env' = extend x v2 (extend f (VRecFun(f,x,e,oenv)) oenv)
                                              in eval_expr env' e
                     | _ -> raise EvalErr)
  | ELetRec (f,x,e1,e2) ->
    let env' = extend f (VRecFun(f,x,e1,env)) env 
      in eval_expr env' e2
and eval_command env tyenv c = 
  match c with
  | CExp e ->  let exp_type = decide_expr_type tyenv e in
                 print_type exp_type;print_string "\n";
                 ("-", env, tyenv, eval_expr env e)
  | CDecl (n,e) -> let exp_type = decide_expr_type tyenv e in 
                     let new_tyenv = extend n exp_type tyenv in
                       print_type exp_type;print_string "\n";
                       (match (eval_expr env e) with
                        | v -> ("val "^n,(extend n v env),new_tyenv,v))
  | CRecDecl (id,n,e) ->  let alpha = TyVar(new_tyvar ()) in
                          let beta = TyVar(new_tyvar ()) in
                          let env' = (extend n alpha (extend id (TyFun(alpha,beta)) tyenv)) in
                          let (t,c) = infer_expr env' e in
                          let (te,ce) = (TyFun(alpha,beta),[(t,beta)]@c) in 
                          let exp_type = ty_subst (unify ce) te in
                          let new_tyenv = extend id exp_type tyenv in
                             print_type exp_type;print_string "\n";
                             ("val "^id,(extend id (VRecFun (id,n,e,env)) env),new_tyenv,VRecFun(id,n,e,env))
