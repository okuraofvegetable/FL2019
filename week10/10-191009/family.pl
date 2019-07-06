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
ancestor(X,Z) :- parent(X,Z).
ancestor(X,Z) :- parent(X,Y), ancestor(Y,Z).



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
