open Array
open Color
open Command


type board = color array array

let init_board () =
  let board = Array.make_matrix 10 10 none in
    for i=0 to 9 do
      board.(i).(0) <- sentinel ;
      board.(i).(9) <- sentinel ;
      board.(0).(i) <- sentinel ;
      board.(9).(i) <- sentinel ;
    done;
    board.(4).(4) <- white;
    board.(5).(5) <- white;
    board.(4).(5) <- black;
    board.(5).(4) <- black;
    board

let dirs = [ (-1,-1); (0,-1); (1,-1); (-1,0); (1,0); (-1,1); (0,1); (1,1) ]

let count board color =
  let s = ref 0 in
    for i=1 to 8 do
      for j=1 to 8 do
        if board.(i).(j) = color then s := !s + 1
      done
    done;
    !s

let print_board board =
  print_endline " |A B C D E F G H ";
  print_endline "-+----------------";
  for j=1 to 8 do
    print_int j; print_string "|";
    for i=1 to 8 do
      print_color (board.(i).(j)); print_string " "
    done;
    print_endline ""
  done;
  print_endline "  (X: Black,  O: White)"

let print_move move =
  match move with
  | GiveUp -> print_string "GiveUp\n"
  | Pass -> print_string "Pass\n"
  | Mv (i,j) -> print_string ("Mv "^(string_of_int i)^","^(string_of_int j)^"\n")

let flippable_indices_line board color (di,dj) (i,j) =
  let ocolor = opposite_color color in
  let rec f (di,dj) (i,j) r =
    if board.(i).(j) = ocolor then
      g (di,dj) (i+di,j+dj) ( (i,j) :: r )
    else
      []
  and    g (di,dj) (i,j) r =
    if board.(i).(j) = ocolor then
      g (di,dj) (i+di,j+dj) ( (i,j) :: r )
    else if board.(i).(j) = color then
      r
    else
      [] in
    f (di,dj) (i,j) []



let flippable_indices board color (i,j) =
  let bs = List.map (fun (di,dj) -> flippable_indices_line board color (di,dj) (i+di,j+dj)) dirs in
    List.concat bs

let is_effective board color (i,j) =
  match flippable_indices board color (i,j) with
      [] -> false
    | _  -> true

let is_valid_move board color (i,j) =
  (board.(i).(j) = none) && is_effective board color (i,j)


let doMove board com color =
  match com with
      GiveUp  -> board
    | Pass    -> board
    | Mv (i,j) ->
	let ms = flippable_indices board color (i,j) in
	let _  = List.map (fun (ii,jj) -> board.(ii).(jj) <- color) ms in
	let _  = board.(i).(j) <- color in
	  board

let copy_board board = 
  let newboard = Array.make_matrix 10 10 none in
  for j=0 to 9 do
    for i=0 to 9 do
      newboard.(i).(j) <- board.(i).(j);
    done;
  done;
  newboard
let copy_and_doMove board com color = 
  let newboard = copy_board board in
  doMove newboard com color

let mix xs ys =
  List.concat (List.map (fun x -> List.map (fun y -> (x,y)) ys) xs)


let valid_moves board color =
  let ls = [1;2;3;4;5;6;7;8] in
  List.filter (is_valid_move board color)
    (mix ls ls)

let valid_coms board color = 
  let move_list = valid_moves board color in
  let com_list = List.map (fun (i,j) -> (Mv (i,j))) move_list in
  match com_list with
  | [] -> [Pass]
  | _ -> com_list    

type search_mode = Last | Middle

let count_corner board color =
  let cnt = ref 0 in
    if board.(1).(1) = color then cnt := !cnt +1;
    if board.(1).(8) = color then cnt := !cnt +1;
    if board.(8).(1) = color then cnt := !cnt +1;
    if board.(8).(8) = color then cnt := !cnt +1;
    !cnt

let count_edge board color = 
  let cnt = ref 0 in
    for i=2 to 7 do
      if board.(i).(1) = color then cnt := !cnt +1;
      if board.(i).(8) = color then cnt := !cnt +1;
      if board.(1).(i) = color then cnt := !cnt +1;
      if board.(8).(i) = color then cnt := !cnt +1;
    done;
    !cnt
let f board color = 
  (count_corner board color)*10+(List.length (valid_moves board color))


let eval_board mycolor color board mode = 
  match mode with
  | Last -> 
    (let value = ((count board mycolor) - (count board (opposite_color mycolor))) in
    if (color = mycolor) then value else (-value))
  | Middle ->
    (let value = (f board mycolor) - (f board (opposite_color mycolor)) in
    if (color = mycolor) then value else (-value))

let counter = ref 0

let max a b =
	if a > b then a else b

let rec negascout_rec (value,mv) com_list depth board mycolor color alpha beta mode =
  match com_list with 
  | [] -> (value,mv)
  | (com::rest) -> 
    let next = copy_and_doMove board com color in 
    let (v,_) = get_optimal_negascout (depth-1) next mycolor (opposite_color color) (-beta) (-(max value alpha)) mode in
    let (nval,nmove) = if (-v)>value then (-v,com) else (value,mv) in
    if nval>=beta then (nval,nmove) else (negascout_rec (nval,nmove) rest depth board mycolor color alpha beta mode)
(* eval value * move *)

and search_ordinary_window_rec (value,mv) com_list depth board mycolor color alpha beta mode = 
  match com_list with
  | [] -> (value,mv)
  | (com::rest) -> 
    let next = copy_and_doMove board com color in
    let (v,m) = get_optimal_negascout (depth-1) next mycolor color ((-alpha)-1) (-alpha) mode in
    if beta <= (-v) then
      (-v,m)
    else 

and get_optimal_negascout depth board mycolor color alpha beta mode =
  (*print_string "debug-------------------\n";
  print_board board;*)
  counter := !counter+1;
  if ((depth = 0) || ((count board none) = 0)) then
    let (v,m) = ((eval_board mycolor color board mode),Pass) in
    (*print_string "\ndebug-------------------\n";
    print_board board;
    print_string "limit : ";
    print_int limit;
    print_string "\n";
    print_string "mycolor : ";
    print_string (string_of_color mycolor);
    print_string "\n";
    print_string "color : ";
    print_string (string_of_color color);
    print_string "\n";
    print_int v;
    print_string " ";
    print_move m;*)
    (v,m)
  else 
    let com_list = valid_coms board color in
    let (v,m) = (negascout_rec (-1000,Pass) com_list depth board mycolor color alpha beta mode) in
    (*print_string "\ndebug-------------------\n";
    print_board board;
    print_string "limit : ";
    print_int limit;
    print_string "\n";
    print_string "mycolor : ";
    print_string (string_of_color mycolor);
    print_string "\n";
    print_string "color : ";
    print_string (string_of_color color);
    print_string "\n";
    print_int v;
    print_string " ";
    print_move m;*)
    (v,m)


let play board color =
  print_int !counter;
  print_string "\n";
  counter := 0;
  let ms = valid_moves board color in
  if ms = [] then
    Pass
  else if (count board none) <= 13 then
    let (_,com) = get_optimal_negascout 14 board color color (-1000) 1000 Last in
    com
  else if (count board none) <= 64 then
    let (_,com) = get_optimal_negascout 5 board color color (-1000) 1000 Middle in
    com
  else
      let k = Random.int (List.length ms) in
      let (i,j) = List.nth ms k in
	Mv (i,j)







let report_result board =
  let _ = print_endline "========== Final Result ==========" in
  let bc = count board black in
  let wc = count board white in
    if bc > wc then
      print_endline "*Black wins!*"
    else if bc < wc then
      print_endline "*White wins!*"
    else
      print_endline "*Even*";
    print_string "Black: "; print_endline (string_of_int bc);
    print_string "White: "; print_endline (string_of_int wc);
    print_board board
