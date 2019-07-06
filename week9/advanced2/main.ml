open Syntax
open TySyntax
open Eval

let empty_env = []
let empty_tyenv = []

let print_colorful_error u =
  (Printf.printf "\x1b[5;1;31mE\x1b[33mr\x1b[36mr\x1b[34mo\x1b[32mr\x1b[31m!\x1b[m\n")
       
let rec read_eval_print env tyenv =
  print_string "# ";
  flush stdout;
  try(
    let cmd = Parser.toplevel Lexer.main (Lexing.from_channel stdin) in
    let (id, newenv, newtyenv, v) = eval_command env tyenv cmd in
    (Printf.printf "%s = " id;
     print_value v;
     print_newline ();
     read_eval_print newenv newtyenv))
  with
  | Parsing.Parse_error -> print_colorful_error ();print_string "Parsing.Parse_error\n";read_eval_print env tyenv
  | Failure msg -> print_colorful_error ();print_string ("Failure "^msg^"\n");read_eval_print env tyenv
  | DivisionByZero -> print_colorful_error ();print_string "DivisionByZero\n";read_eval_print env tyenv
  | Eval.InferTypeError -> print_colorful_error ();print_string "Type Error\n";read_eval_print env tyenv
  | TySyntax.TyError -> print_colorful_error ();print_string "Type Error\n";read_eval_print env tyenv

let initial_env =
  extend "i" (VInt 1)
   (extend "v" (VInt 5)
     (extend "x" (VInt 10)
       empty_env))

let initial_tyenv = empty_tyenv
    
let _ = read_eval_print initial_env initial_tyenv
