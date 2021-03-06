pairs(M,N):-
	p(M,N,0).
p(M,N,K):-
	between(0,K,M),
	N is K-M.
p(M,N,K):-
	K1 is K+1,
	p(M,N,K1).
a --> "1".
a --> a,a.

suffix(P,L):-
	append(_,L,P).

x(0) --> "".
x(N+1) --> "a",x(N),"a".

len(X,N):-
	len(X,0,N).
len([],A,A).
len([_|T],A,N):-
	A \== N,
	A1 is A+1,
	len(T,A1,N).

rev([],[]).
rev([H|T],R):-
    rev(T,TR),
    append(TR,[H],R).
sq(Y,X) :- Y is X*X.
nat(0).
nat(N):-
    nat(M),
    N is M+1.

p1(a).
p1(b).
q1([]).
q1([X|Y]):-
	p1(X),
	q1(Y).

p2(a).
p2(f(X,Y)):-
	p2(X),
	p2(Y).

x1 --> [1].
x1 --> [0].
x1 --> x1,[+],x1.

p3([]).
p3([a|T]):-
	p3(T),
	!.
