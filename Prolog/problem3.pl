

add(X,f0(null),X).
add(f0(null),X,X).
				
add(X,Y,Z) :- 	incr(Y2,Y),
				incr(X,X2),
				add(X2,Y2,Z).
			
				 