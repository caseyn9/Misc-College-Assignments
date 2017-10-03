
revers(X,Y) :- revers(X, null, Y).

revers(null,Z,Z).

revers(f1(X),Z,Y) :- revers(X,f1(Z),Y).
revers(f0(X),Z,Y) :- revers(X,f0(Z),Y).