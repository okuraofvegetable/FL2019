rule male(koji).
rule parent(kobo,koji).
rule father(X,Y) :- parent(X,Y),male(Y).
query father(kobo,Z).

rule add(z,Y,Y).
rule add(s(X),Y,s(Z)) :- add(X,Y,Z).
query add(s(z),X,X).

