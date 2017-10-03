
legal(f0(null)).

legal(X) :- %incr(Y,X),
			legal(Y),
			incr(Y,X).

incrR(X,Y) :- legal(X),
				incr(X,Y).