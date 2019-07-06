let time f arg1 arg2 =
    let a = Sys.time () in
    ignore (f arg1 arg2);
    print_string "  time :";
    print_float (Sys.time () -. a);
    print_string "s";
;;
let rec make_list_sub = fun n acc ->
	match n with
	| 0 -> acc
	| x -> make_list (x-1) (x::acc);;
let make_list = fun n -> make_list_sub n [];;