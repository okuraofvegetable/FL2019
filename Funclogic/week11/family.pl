/* family.pl */
male(kobo).
male(koji).
male(iwao).
female(sanae).
female(mine).

parent(kobo, koji).
parent(kobo, sanae).
parent(sanae, iwao).
parent(sanae, mine).

parent(miho,koji).

grandparent(X,Z) :- parent(X,Y), parent(Y,Z).
father(X, Y) :- parent(X, Y), male(Y).
mother(X, Y) :- parent(X, Y), female(Y).

/*ancestor(X,Z) :- parent(X,Z).
ancestor(X,Z) :- parent(X,Y), ancestor(Y,Z).*/




sibling(X,Y) :- parent(X,Z),parent(Y,Z).

bloodrelative(X,Y) :- ancestor(X,Z),ancestor(Y,Z).
bloodrelative(X,Y) :- ancestor(X,Y).
bloodrelative(X,Y) :- ancestor(Y,X).

add(z,Y,Y).
add(s(X),Y,s(Z)) :- add(X,Y,Z).
mult(z,_,z).
mult(s(X),Y,Z) :- mult(X,Y,W),add(Y,W,Z). 

append([], Y, Y).
append([A|X], Y, [A|Z]) :- append(X, Y, Z).

samelength([],[]).
samelength([_|X],[_|Y]) :- samelength(X,Y).

pushback([],Y,[Y]).
pushback([A|X],Y,[A|Z]) :- pushback(X,Y,Z).

popback(X,Y) :- pushback(Y,_,X).

reverse([],[]).
reverse([A|X],Y) :- samelength([_|Z],Y),reverse(X,Z),pushback(Z,A,Y).

concat([X],X).
concat([X|Y],Z) :- concat(Y,W),append(X,W,Z).

in(X,[X|_]).
in(X,[_|Z]) :- in(X,Z).

choose([X|Y],Y,X).
choose([A|X],[A|Y],Z) :- choose(X,Y,Z).

hamilton(V,E) :- choose(V,Rem,Start),hamiltonsub(Rem,E,Start). 

hamiltonsub([],_,_).
hamiltonsub(V,E,Now) :- choose(V,Rem,Next),in([Now|[Next|[]]],E),hamiltonsub(Rem,E,Next).

/* 例題 */
/*nat(z).
nat(s(X)) :- nat(X).*/

/* 問1 */

ancestor(X,Y) :- ancestor(Z,Y), parent(X,Z).
ancestor(X,Y) :- parent(X,Y).

/* 問2 */
nat(z).
nat(s(N)) :- nat(N).
nat_list([]).
nat_list([N|X]) :- nat_list(X),nat(N).



/* 問3 */
end(A,[A,A,A,_,_,_,_,_,_]).
end(A,[_,_,_,A,A,A,_,_,_]).
end(A,[_,_,_,_,_,_,A,A,A]).
end(A,[A,_,_,A,_,_,A,_,_]).
end(A,[_,A,_,_,A,_,_,A,_]).
end(A,[_,_,A,_,_,A,_,_,A]).
end(A,[A,_,_,_,A,_,_,_,A]).
end(A,[_,_,A,_,A,_,A,_,_]).

notfull(B) :- next(a,B,_).

enemy(a,b).
enemy(b,a).

next(P,[e,E,F,G,H,I,J,K,L],[P,E,F,G,H,I,J,K,L]).
next(P,[D,e,F,G,H,I,J,K,L],[D,P,F,G,H,I,J,K,L]).
next(P,[D,E,e,G,H,I,J,K,L],[D,E,P,G,H,I,J,K,L]).
next(P,[D,E,F,e,H,I,J,K,L],[D,E,F,P,H,I,J,K,L]).
next(P,[D,E,F,G,e,I,J,K,L],[D,E,F,G,P,I,J,K,L]).
next(P,[D,E,F,G,H,e,J,K,L],[D,E,F,G,H,P,J,K,L]).
next(P,[D,E,F,G,H,I,e,K,L],[D,E,F,G,H,I,P,K,L]).
next(P,[D,E,F,G,H,I,J,e,L],[D,E,F,G,H,I,J,P,L]).
next(P,[D,E,F,G,H,I,J,K,e],[D,E,F,G,H,I,J,K,P]).



win(P,B) :- end(P,B).
win(P,B) :- enemy(P,Q),\+end(Q,B),next(P,B,C),lose(Q,C).

notwin(P,B) :- \+ win(P,B).

notlose(P,Q,B) :- next(P,B,C),notwin(Q,C).

lose(P,B) :- enemy(P,Q),end(Q,B).
lose(P,B) :- enemy(P,Q),\+end(P,B),notfull(B),\+ notlose(P,Q,B).




