goal([0,0,3,3,0]).

dangres([A,B,C,D,_]):-A>=B,C>=D.
dangres([A,B,0,_,_]):-A>=B.
dangres([0,_,A,B,_]):-A>=B.

transit([A,B,C,D,1],[X,B,Z,D,0]):-A>0, X is A-1, Z is C+1.
transit([A,B,C,D,1],[A,Y,C,T,0]):-B>0, Y is B-1, T is D+1.
transit([A,B,C,D,1],[X,B,Z,D,0]):-A>1, X is A-2, Z is C+2.
transit([A,B,C,D,1],[A,Y,C,T,0]):-B>1, Y is B-2, T is D+2.
transit([A,B,C,D,1],[X,Y,Z,T,0]):-A>0, B>0, X is A-1, Y is B-1, Z is C+1, T is D+1.

transit([A,B,C,D,0],[X,B,Z,D,1]):-C>0, X is A+1, Z is C-1.
transit([A,B,C,D,0],[A,Y,C,T,1]):-D>0, Y is B+1, T is D-1.
transit([A,B,C,D,0],[X,B,Z,D,1]):-C>1, X is A+2, Z is C-2.
transit([A,B,C,D,0],[A,Y,C,T,1]):-D>1, Y is B+2, T is D-2.
transit([A,B,C,D,0],[X,Y,Z,T,1]):-C>0, D>0, X is A+1, Y is B+1, Z is C-1, T is D-1.

dfs(X,P,[X|P]):- goal(X),!.
dfs(X,P,Path):-transit(X,Y), X\=Y,dangres(Y),\+member(Y,P), dfs(Y,[X|P],Path).

% Run program: setof(P, dfs([3,3,0,0,1], [], P), UniquePaths).
