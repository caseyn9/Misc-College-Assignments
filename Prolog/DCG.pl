s --> p.
s --> [].
p --> 	a,p,a ; 
    	b,p,b ;
    	c,p,c.
p --> a ; b ; c.

a --> [0].
b --> [1].
c --> [2].
d --> [3].

s2 --> w(K,N,KN),d,checkZero(K),checkOne(N),checkTwo(KN), {KN is K*N}.
s2 --> [].

%/palindrome and counting./
w(0,0,0) --> [].
w(1,0,0) --> [0].
w(0,1,0) --> [1].
w(0,0,1) --> [2].
w(X,Y,Z) --> [0],w(X2,Y,Z),[0], {X is X2 + 2}.
w(X,Y,Z) --> [1],w(X,Y2,Z),[1], {Y is Y2 + 2}.
w(X,Y,Z) --> [2],w(X,Y,Z2),[2], {Z is Z2 + 2}.

checkZero(0) --> [].
checkZero(X) --> a,checkZero(X2), {X is X2+1}.

checkOne(0) --> [].
checkOne(X) --> b,checkOne(X2),  {X is X2+1}.

checkTwo(0) --> [].
checkTwo(X) --> c,checkTwo(X2),  {X is X2+1}.	




