nth(0,[A|_],A).
nth(N,[_|X],B) :- 
	N > 0,
	M is N-1,
	nth(M,X,B).

append([], Y, Y).
append([A|X], Y, [A|Z]) :- append(X, Y, Z).

parser(SourceCode,Code,Length) :- 
	string_to_list(SourceCode,Code),
	length(Code,Length).

increase_pointer(Memory,Pointer,NewMemory,NewPointer) :-
	length(Memory,MemoryLength),
	Pointer+1 =:= MemoryLength,
	append(Memory,[0],NewMemory),
	NewPointer is Pointer+1.

increase_pointer(Memory,Pointer,Memory,NewPointer) :-
	length(Memory,MemoryLength),
	Pointer+1 < MemoryLength,
	NewPointer is Pointer+1. 

decrease_pointer(Memory,Pointer,Memory,NewPointer) :-
	length(Memory,MemoryLength),
	Pointer > 0,
	Pointer < MemoryLength,
	NewPointer is Pointer-1.

suffix(X,N,X) :- length(X,N).
suffix([_|X],N,S) :- suffix(X,N,S).

prefix(_,0,[]).
prefix([A|X],N,[A|Q]) :-
	N > 0,
	M is N-1,
	prefix(X,M,Q).

update_memory(Memory,Pointer,Value,NewMemory) :-
	length(Memory,N),
	prefix(Memory,Pointer,PreMemory),
	S is N-Pointer-1,
	suffix(Memory,S,SufMemory),
	append(PreMemory,[Value|SufMemory],NewMemory).
 
increase_memory(Memory,Pointer,NewMemory) :-
	nth(Pointer,Memory,X),
	X =:= 255,
	Y is 0,
	update_memory(Memory,Pointer,Y,NewMemory).

increase_memory(Memory,Pointer,NewMemory) :-
	nth(Pointer,Memory,X),
	X < 255,
	Y is X+1,
	update_memory(Memory,Pointer,Y,NewMemory).

decrease_memory(Memory,Pointer,NewMemory) :-
	nth(Pointer,Memory,X),
	X > 0,
	Y is X-1,
	update_memory(Memory,Pointer,Y,NewMemory).

decrease_memory(Memory,Pointer,NewMemory) :-
	nth(Pointer,Memory,X),
	X =:= 0,
	Y is 255,
	update_memory(Memory,Pointer,Y,NewMemory).

correspond_end_position(_,_,Counter,0,TargetCounter) :- 
	TargetCounter is Counter.

correspond_end_position(Code,Length,Counter,Stack,TargetCounter) :-
	Counter < Length,
	nth(Counter,Code,Inst),
	Inst =:= 91,
	Stack>0,
	NewStack is Stack+1,
	NextCounter is Counter+1,
	correspond_end_position(Code,Length,NextCounter,NewStack,TargetCounter).

correspond_end_position(Code,Length,Counter,Stack,TargetCounter) :-
	Counter < Length,
	nth(Counter,Code,Inst),
	Inst =:= 93,
	Stack>0,
	NewStack is Stack-1,
	NextCounter is Counter+1,
	correspond_end_position(Code,Length,NextCounter,NewStack,TargetCounter).

correspond_end_position(Code,Length,Counter,Stack,TargetCounter) :-
	Counter < Length,
	nth(Counter,Code,Inst),
	Inst =\= 91,
	Inst =\= 93,
	Stack>0,
	NewStack is Stack,
	NextCounter is Counter+1,
	correspond_end_position(Code,Length,NextCounter,NewStack,TargetCounter).

correspond_start_position(_,_,Counter,0,TargetCounter) :- 
	TargetCounter is Counter+2.

correspond_start_position(Code,Length,Counter,Stack,TargetCounter) :-
	Counter >= 0,
	nth(Counter,Code,Inst),
	Inst =:= 91,
	Stack>0,
	NewStack is Stack-1,
	PrevCounter is Counter-1,
	correspond_start_position(Code,Length,PrevCounter,NewStack,TargetCounter).

correspond_start_position(Code,Length,Counter,Stack,TargetCounter) :-
	Counter >= 0,
	nth(Counter,Code,Inst),
	Inst =:= 93,
	Stack>0,
	NewStack is Stack+1,
	PrevCounter is Counter-1,
	correspond_start_position(Code,Length,PrevCounter,NewStack,TargetCounter).

correspond_start_position(Code,Length,Counter,Stack,TargetCounter) :-
	Counter >= 0,
	nth(Counter,Code,Inst),
	Inst =\= 93,
	Inst =\= 91,
	Stack>0,
	NewStack is Stack,
	PrevCounter is Counter-1,
	correspond_start_position(Code,Length,PrevCounter,NewStack,TargetCounter).


exec(_,Length,Length,_,_).

exec(Code,Length,Counter,Memory,Pointer) :-
	nth(Counter,Code,Inst),
	Inst =:= 62,
	increase_pointer(Memory,Pointer,NewMemory,NewPointer),
	NewCounter is Counter+1,
	exec(Code,Length,NewCounter,NewMemory,NewPointer).

exec(Code,Length,Counter,Memory,Pointer) :-
	nth(Counter,Code,Inst),
	Inst =:= 60,
	decrease_pointer(Memory,Pointer,NewMemory,NewPointer),
	NewCounter is Counter+1,
	exec(Code,Length,NewCounter,NewMemory,NewPointer).

exec(Code,Length,Counter,Memory,Pointer) :-
	nth(Counter,Code,Inst),
	Inst =:= 43,
	increase_memory(Memory,Pointer,NewMemory),
	NewCounter is Counter+1,
	exec(Code,Length,NewCounter,NewMemory,Pointer).

exec(Code,Length,Counter,Memory,Pointer) :-
	nth(Counter,Code,Inst),
	Inst =:= 45,
	decrease_memory(Memory,Pointer,NewMemory),
	NewCounter is Counter+1,
	exec(Code,Length,NewCounter,NewMemory,Pointer).

exec(Code,Length,Counter,Memory,Pointer) :-
	nth(Counter,Code,Inst),
	Inst =:= 46,
	nth(Pointer,Memory,Value),
	put(Value),
	NewCounter is Counter+1,
	exec(Code,Length,NewCounter,Memory,Pointer).

exec(Code,Length,Counter,Memory,Pointer) :-
	nth(Counter,Code,Inst),
	Inst =:= 44,
	get(Value),
	update_memory(Memory,Pointer,Value,NewMemory),
	NewCounter is Counter+1,
	exec(Code,Length,NewCounter,NewMemory,Pointer).

exec(Code,Length,Counter,Memory,Pointer) :-
	nth(Counter,Code,Inst),
	Inst =:= 91,
	nth(Pointer,Memory,Value),
	Value =\= 0,
	NewCounter is Counter+1,
	exec(Code,Length,NewCounter,Memory,Pointer).

exec(Code,Length,Counter,Memory,Pointer) :-
	nth(Counter,Code,Inst),
	Inst =:= 91,
	nth(Pointer,Memory,Value),
	Value =:= 0,
	correspond_end_position(Code,Length,Counter+1,1,NewCounter),
	exec(Code,Length,NewCounter,Memory,Pointer).

exec(Code,Length,Counter,Memory,Pointer) :-
	nth(Counter,Code,Inst),
	Inst =:= 93,
	nth(Pointer,Memory,Value),
	Value =:= 0,
	NewCounter is Counter+1,
	exec(Code,Length,NewCounter,Memory,Pointer).

exec(Code,Length,Counter,Memory,Pointer) :-
	nth(Counter,Code,Inst),
	Inst =:= 93,
	nth(Pointer,Memory,Value),
	Value =\= 0,
	correspond_start_position(Code,Length,Counter-1,1,NewCounter),
	exec(Code,Length,NewCounter,Memory,Pointer).


interpreter(SourceCode) :- 
	parser(SourceCode,Code,Length),
	exec(Code,Length,0,[0],0).

/* Ascii codes:
 . 46
 , 44
 + 43
 - 45
 > 62
 < 60
 [ 91
 ] 93 */ 

 /* decrease_pointer(Memory,Pointer,NewMemory,NewPointer) :-
	Pointer =:= 0,
	append([0],Memory,NewMemory),
	NewPointer is Pointer. */




