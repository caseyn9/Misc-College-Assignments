
mult(X,f1(null),X).

mult(X,Y,Z) :-	incr(Y2,Y),
				mult(X,Y2,X2),
				add(X,X2,Z).