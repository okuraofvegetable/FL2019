open Syntax
open TySyntax

exception Unbound

let empty_env = []
let tyenv = []
let extend x v env = (x, v) :: env



let rec lookup x env =
  try List.assoc x env with Not_found -> raise Unbound
exception InferTypeError
exception EvalErr
exception DivisionByZero

let rec equal_expr e1 e2 =
  match (e1,e2) with
  | ((EConstInt i1), (EConstInt i2)) -> (if i1=i2 then true else false)
  | ((EConstBool b1), (EConstBool b2)) -> (if b1=b2 then true else false)
  | ((EVar x1),(EVar x2)) -> (if x1 = x2 then true else false)
  | ((EAdd (e11,e12)),(EAdd (e21,e22))) -> (if ((equal_expr e11 e21) && (equal_expr e12 e22)) then true else false)
  | ((ESub (e11,e12)),(ESub (e21,e22))) -> (if ((equal_expr e11 e21) && (equal_expr e12 e22)) then true else false)
  | ((EMul (e11,e12)),(EMul (e21,e22))) -> (if ((equal_expr e11 e21) && (equal_expr e12 e22)) then true else false)
  | ((EDiv (e11,e12)),(EDiv (e21,e22))) -> (if ((equal_expr e11 e21) && (equal_expr e12 e22)) then true else false)
  | ((EEq (e11,e12)),(EEq (e21,e22))) -> (if ((equal_expr e11 e21) && (equal_expr e12 e22)) then true else false)
  | ((ELt (e11,e12)),(ELt (e21,e22))) -> (if ((equal_expr e11 e21) && (equal_expr e12 e22)) then true else false)
  | ((EIf (e11,e12,e13)),(EIf (e21,e22,e23))) -> (if ((equal_expr e11 e21) && (equal_expr e12 e22) && (equal_expr e13 e23)) then true else false)
  | ((ELet (n1,e11,e12)),(ELet (n2,e21,e22))) -> (if ((n1 = n2) && (equal_expr e11 e21) && (equal_expr e12 e22)) then true else false)
  | ((EFun (x1,e1)),(EFun (x2,e2))) -> (if ((x1=x2) && (equal_expr e1 e2)) then true else false)
  | ((EPair (e11,e12)),(EPair (e21,e22))) -> (if ((equal_expr e11 e21) && (equal_expr e12 e22)) then true else false)
  | ((EApp (e11,e12)),(EApp (e21,e22))) -> (if ((equal_expr e11 e21) && (equal_expr e12 e22)) then true else false)
  | ((ELetRec (f1,x1,e11,e12)),(ELetRec (f2,x2,e21,e22))) -> (if ((f1=f2) && (x1=x2) && (equal_expr e11 e21) && (equal_expr e12 e22)) then true else false)
  | _ -> false

let rec infer_expr tyenv e =
  (*print_expr e;print_string "\n";*)
  match e with
  | EConstInt i -> (TyInt,[])
  | EConstBool b -> (TyBool,[])
  | EVar x ->
    (try
       (instantiate (lookup x tyenv),[])
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
    let sigma = unify c1 in
    let s1 = ty_subst sigma t1 in
    let delta = ty_subst_tyenv sigma tyenv in
    let (t2,c2) = infer_expr (extend n (generalize delta s1) delta) e2 in
    (t2,c1@c2)
  | EFun (x,exp) -> 
    let alpha = TyVar(new_tyvar ()) in
    let (t,c) = infer_expr (extend x ([],alpha) tyenv) exp in
    (TyFun(alpha,t),c) 
  | EPair (e1,e2) -> 
    if equal_expr e1 e2
      then (let (t,c) = infer_expr tyenv e1 in
              ((TySamePair t),c))
      else (let (t1,c1) = infer_expr tyenv e1 in
            let (t2,c2) = infer_expr tyenv e2 in
             (TyPair(t1,t2),c1@c2) )
  | EApp (e1,e2) -> let (t1,c1) = infer_expr tyenv e1 in
                    let (t2,c2) = infer_expr tyenv e2 in
                    let alpha = TyVar(new_tyvar ()) in
                    (alpha,[(t1,TyFun(t2,alpha))]@c1@c2)
  | ELetRec (f,x,e1,e2) ->
    let alpha = TyVar(new_tyvar ()) in
    let beta = TyVar(new_tyvar ()) in
    let env' = (extend x ([],alpha) (extend f ([],TyFun(alpha,beta)) tyenv)) in
    let (t1,c1) = infer_expr env' e1 in
    let sigma = unify c1 in
    let s1 = ty_subst sigma (TyFun(alpha,beta)) in
    let delta = ty_subst_tyenv sigma tyenv in
    let (t2,c2) = infer_expr (extend f (generalize delta s1) delta) e2 in
      (t2,[(t1,beta)]@c1@c2)

(* type_env -> expr -> type_schema *)
let decide_expr_type_schema tyenv exp = 
  match infer_expr tyenv exp with
  | (t,c) -> (*print_constraints c;
             print_string "\n";
             print_type t;
             print_string "\n";*)
             generalize tyenv (ty_subst (unify c) t)

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
  | EPair (e1,e2) -> if (equal_expr e1 e2) 
                      then (let v1 = eval_expr env e1 in VSamePair v1)
                      else (let v1 = eval_expr env e1 in
                            let v2 = eval_expr env e2 in
                              VPair(v1,v2))
                     
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
  | CExp e ->  let exp_tysc = decide_expr_type_schema tyenv e in
                 print_tysc exp_tysc;print_string "\n";
                 ("-", env, tyenv, eval_expr env e)
  | CDecl (n,e) -> let exp_tysc = decide_expr_type_schema tyenv e in 
                     let new_tyenv = extend n exp_tysc tyenv in
                       print_tysc exp_tysc;print_string "\n";
                       (match (eval_expr env e) with
                        | v -> ("val "^n,(extend n v env),new_tyenv,v))
  | CRecDecl (id,n,e) ->  let alpha = TyVar(new_tyvar ()) in
                          let beta = TyVar(new_tyvar ()) in
                          let env' = (extend n ([],alpha) (extend id ([],TyFun(alpha,beta)) tyenv)) in
                          let (t,c) = infer_expr env' e in
                          let (te,ce) = (TyFun(alpha,beta),[(t,beta)]@c) in 
                          let sigma = unify ce in
                          let delta = ty_subst_tyenv sigma tyenv in
                          let se = ty_subst sigma te in
                          let tysc = generalize delta se in
                          let new_tyenv = extend id tysc tyenv in
                             (*print_constraints ce;
                             print_subst (unify ce);
                             print_type te;
                             print_string "\n";*)
                             print_tysc tysc;
                             print_string "\n";
                             ("val "^id,(extend id (VRecFun (id,n,e,env)) env),new_tyenv,VRecFun(id,n,e,env)) 
