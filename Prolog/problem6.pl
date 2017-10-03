revers(X,Y) :- revers(X, null, Y).

revers(null,Z,Z).

revers(f1(X),Z,Y) :- revers(X,f1(Z),Y).
revers(f0(X),Z,Y) :- revers(X,f0(Z),Y).

normalise(null, f0(null)).

normalise(X,Y) :- 	revers(X,Z),
    				chopZero(Z,Y).

chopZero(f1(X), Y) :- revers(f1(X),Y).
chopZero(f0(X),Y) :- chopZero(X,Y).

