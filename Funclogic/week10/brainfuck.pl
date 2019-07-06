interpret(Ss) :- string_to_list(Ss, Instrl), eval(Instrl).

isz(z).
notz(s(_)).
succ(A, s(A)). 
pred(z, z).
pred(s(A), A).

lt(z, s(_)).
lt(s(A), s(B)) :- lt(A, B).

toint(z, 0).
toint(s(A), Nsa) :- toint(A, Na), Nsa is Na + 1.

% 本当は対応するnatにしないといけないが、今回はすべての文字を書くのは冗長だと感じたのでやめた。
tonat(43, z).
tonat(45, s(z)).
tonat(62, s(s(z))).
tonat(60, s(s(s(z)))).
tonat(46, s(s(s(s(z))))).
tonat(91, s(s(s(s(s(z)))))).
tonat(93, s(s(s(s(s(s(z))))))).
tonat(44, s(s(s(s(s(s(s(z)))))))).

% ,のテストのため。!に対応するnat。すべての文字についてアスキーコード表に従ってtonatを満たす組を定義してやれば任意の文字を入力として受け付けることができる。
tonat(33, s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(z)))))))))))))))))))))))))))))))))).

isrightb(s(s(s(s(s(s(s(z)))))))).
isleftb(s(s(s(s(s(s(z))))))).
noteq(z, s(_)).
noteq(s(_), z).
noteq(s(A), s(B)) :- noteq(A, B).

eval(Instrl) :-
	eval_rec(Instrl, [], [z], z).

eval_rec([], _, _, _) :-
	format("~c", [10]).
% +
eval_rec([43|Instrl], Sofar, Mem, Cur) :-
	inc(Mem, z, Cur, Newmem), eval_rec(Instrl, [43|Sofar], Newmem, Cur).
% -
eval_rec([45|Instrl], Sofar, Mem, Cur) :-
	dec(Mem, z, Cur, Newmem), eval_rec(Instrl, [45|Sofar], Newmem, Cur).
% >
eval_rec([62|Instrl], Sofar, Mem, Cur) :-
	succ(Cur, Inccur), updatemem(Mem, Inccur, Newmem), eval_rec(Instrl, [62|Sofar], Newmem, Inccur).
% <
eval_rec([60|Instrl], Sofar, Mem, Cur) :-
	pred(Cur, Deccur), notz(Cur), eval_rec(Instrl, [60|Sofar], Mem, Deccur).
% .
eval_rec([46|Instrl], Sofar, Mem, Cur) :-
	getfrommem(Mem, Cur, X), toint(X, N), format("~c", [N]), eval_rec(Instrl, [46|Sofar], Mem, Cur).

% [
eval_rec([91|Instrl], Sofar, Mem, Cur) :-
	getfrommem(Mem, Cur, X), notz(X), eval_rec(Instrl, [91|Sofar], Mem, Cur).	
eval_rec([91|Instrl], Sofar, Mem, Cur) :-
	getfrommem(Mem, Cur, X), isz(X), jumpright([91|Instrl], Sofar, Newinstrl, Newsofar), eval_rec(Newinstrl, Newsofar, Mem, Cur).
% ]
eval_rec([93|Instrl], Sofar, Mem, Cur) :-
	getfrommem(Mem, Cur, X), notz(X), jumpleft([93|Instrl], Sofar, Newinstrl, Newsofar), eval_rec(Newinstrl, Newsofar, Mem, Cur).
eval_rec([93|Instrl], Sofar, Mem, Cur) :-
	getfrommem(Mem, Cur, X), isz(X), eval_rec(Instrl, [93|Sofar], Mem, Cur).

% ,
eval_rec([44|Instrl], Sofar, Mem, Cur) :-
	writetomem(Mem, Cur, Nat, Newmem), get0(C), tonat(C, Nat), eval_rec(Instrl, [44|Sofar], Newmem, Cur).

jumpright([93|Rest], Sofar, Rest, [93|Sofar]).
jumpright([S|Rest], Sofar1, Rest2, Sofar2) :-
	tonat(S, Nat), isrightb(B), noteq(Nat,B), jumpright(Rest, [S|Sofar1], Rest2, Sofar2).

jumpleft(Instrl, [91|Rest], Instrl, [91|Rest]).
jumpleft(Instrl, [S|Rest], Instrl2, Rest2) :-
	tonat(S, Nat), isleftb(B), noteq(Nat, B), jumpleft([S|Instrl], Rest, Instrl2, Rest2).


inc([I|Rest], Cur, Target, [NewI|Rest]) :-
	Cur = Target, succ(I, NewI).
inc([I|Rest], Cur, Target, [I|Newrest]) :-
	lt(Cur, Target), succ(Cur, Inccur), inc(Rest, Inccur, Target, Newrest).

dec([I|Rest], Cur, Target, [NewI|Rest]) :-
	Cur = Target, pred(I, NewI), notz(I).
dec([I|Rest], Cur, Target, [I|Newrest]) :-
	lt(Cur, Target), succ(Cur, Inccur), dec(Rest, Inccur, Target, Newrest).

updatemem([], _, [z]).
updatemem([I|Rest], z, [I|Rest]).
updatemem([I|Rest], Newp, [I|NewRest]) :-
	pred(Newp, Decnewp), notz(Newp), updatemem(Rest, Decnewp, NewRest).

getfrommem([I|_], z, I).
getfrommem([_|Rest], Cur, X) :-
	notz(Cur), pred(Cur, Deccur), getfrommem(Rest, Deccur, X).

writetomem([_|Rest], z, C, [C|Rest]).
writetomem([I|Rest], Cur, C, [I|Newrest]) :-
	isz(Cur), pred(Cur, Deccur), notz(Cur), writetomem(Rest, Deccur, C, Newrest).
