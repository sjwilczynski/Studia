a([1]).
a([1|X]):-
	b(X).
b([0]).
b([1]).
b([0|X]):-
	b(X).
b([1|X]):-
	b(X).
	

op(F):-
	member(F,[+,-,*,/]).

x(_) --> "1".
x(T) --> {write(5)},x(E1),{op(F)},x(E2), {T =.. [F,E1,E2]},{write(5)}.
x(E) --> '(',x(E),')'. 

fw("a").
fw("b").
fw(X) :- f(X,"a","b").
f(X,Y,Z) :-
	append(Y,Z,X).
f(X,Y,Z) :-
	append(Y,Z,NZ),
	f(X,Z,NZ). 
	

p(0).
p(X):-
	!,
	Y is X-1,
	p(Y).
