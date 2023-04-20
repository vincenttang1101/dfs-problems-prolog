goal([_,2]).
goal([2,_]).

full_1([_,X],[4,X]).
full_2([Y,_],[Y,3]).
empty_1([_,X],[0,X]).
empty_2([Y,_],[Y,0]).
pour_1_2([X,Y],[P,Q]):-M is X+Y, M=<3, P is 0, Q is M.
pour_1_2([X,Y],[P,Q]):-M is X+Y, M>3, P is M-3, Q is 3.
pour_2_1([X,Y],[P,Q]):-N is X+Y, N=<4, Q is 0, P is N.
pour_2_1([X,Y],[P,Q]):-N is X+Y, N>4, Q is N-4, P is 4.

transit(X,Y):-full_1(X,Y).
transit(X,Y):-full_2(X,Y).
transit(X,Y):-empty_1(X,Y).
transit(X,Y):-empty_2(X,Y).
transit(X,Y):-pour_1_2(X,Y).
transit(X,Y):-pour_2_1(X,Y).

dfs(X,P,[X|P]):-goal(X),!.
dfs(X,P,Path):-transit(X,Y), X\=Y, \+member(Y,P), dfs(Y,[X|P],Path).

% Run program: dfs([0,0],[],P).