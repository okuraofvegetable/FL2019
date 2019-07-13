main : tySyntax.ml syntax.ml parser.mly lexer.mll eval.ml main.ml
	ocamlc -c tySyntax.ml
	ocamllex lexer.mll 
	ocamlyacc -v parser.mly 
	ocamlc -c syntax.ml 
	ocamlc -c parser.mli
	ocamlc -c lexer.ml
	ocamlc -c parser.ml
	ocamlc -c eval.ml
	ocamlc -c main.ml
	ocamlc -o main tySyntax.cmo syntax.cmo lexer.cmo parser.cmo eval.cmo main.cmo
