goal([[0,0,0],[3,3,1]]).


edge([[3,3,1],[0,0,0]],[[2,3,0],[1,0,1]]).
edge([[3,3,1],[0,0,0]],[[3,2,0],[0,1,1]]).
edge([[3,3,1],[0,0,0]],[[1,3,0],[2,0,1]]).
edge([[3,3,1],[0,0,0]],[[3,1,0],[0,2,1]]).
edge([[3,3,1],[0,0,0]],[[2,2,0],[1,1,1]]).

edge([[3,2,0],[0,1,1]],[[3,3,1],[0,0,0]]).

edge([[3,1,0],[0,2,1]],[[3,2,1],[0,1,0]]).
edge([[3,1,0],[0,2,1]],[[3,3,1],[0,0,0]]).

edge([[2,2,0],[1,1,1]],[[3,2,1],[0,1,0]]).
edge([[2,2,0],[1,1,1]],[[2,3,1],[1,0,0]]).
edge([[2,2,0],[1,1,1]],[[3,3,1],[0,0,0]]).

edge([[3,2,1],[0,1,0]],[[2,2,0],[1,1,1]]).
edge([[3,2,1],[0,1,0]],[[3,1,0],[0,2,1]]).
edge([[3,2,1],[0,1,0]],[[1,2,0],[2,1,1]]).
edge([[3,2,1],[0,1,0]],[[3,0,0],[0,3,1]]).
edge([[3,2,1],[0,1,0]],[[2,1,0],[1,2,1]]).

edge([[3,0,0],[0,3,1]],[[3,1,1],[0,2,0]]).
edge([[3,0,0],[0,3,1]],[[3,2,1],[0,1,0]]).

edge([[3,1,1],[0,2,0]],[[2,1,0],[1,2,1]]).
edge([[3,1,1],[0,2,0]],[[3,0,0],[0,3,1]]).
edge([[3,1,1],[0,2,0]],[[1,1,0],[2,2,1]]).
edge([[3,1,1],[0,2,0]],[[2,0,0],[1,3,1]]).

edge([[1,1,0],[2,2,1]],[[2,1,1],[1,2,0]]).
edge([[1,1,0],[2,2,1]],[[1,2,1],[2,1,0]]).
edge([[1,1,0],[2,2,1]],[[3,1,1],[0,2,0]]).
edge([[1,1,0],[2,2,1]],[[1,3,1],[2,0,0]]).
edge([[1,1,0],[2,2,1]],[[2,2,1],[1,1,0]]).

edge([[2,2,1],[1,1,0]],[[1,2,0],[2,1,1]]).
edge([[2,2,1],[1,1,0]],[[2,1,0],[1,2,1]]).
edge([[2,2,1],[1,1,0]],[[0,2,0],[3,1,1]]).
edge([[2,2,1],[1,1,0]],[[2,0,0],[1,3,1]]).
edge([[2,2,1],[1,1,0]],[[1,1,0],[2,2,1]]).

edge([[0,2,0],[3,1,1]],[[1,2,1],[2,1,0]]).
edge([[0,2,0],[3,1,1]],[[0,3,1],[3,0,0]]).
edge([[0,2,0],[3,1,1]],[[2,2,1],[1,1,0]]).
edge([[0,2,0],[3,1,1]],[[1,3,1],[2,0,0]]).

edge([[0,3,1],[3,0,0]],[[0,2,0],[3,1,1]]).
edge([[0,3,1],[3,0,0]],[[0,1,0],[3,2,1]]).

edge([[0,1,0],[3,2,1]],[[1,1,1],[2,2,0]]).
edge([[0,1,0],[3,2,1]],[[0,2,1],[3,1,0]]).
edge([[0,1,0],[3,2,1]],[[2,1,1],[1,2,0]]).
edge([[0,1,0],[3,2,1]],[[0,3,1],[3,0,0]]).
edge([[0,1,0],[3,2,1]],[[1,2,1],[2,1,0]]).

edge([[1,1,1],[2,2,0]],[[0,1,0],[3,2,1]]).
edge([[1,1,1],[2,2,0]],[[1,0,0],[2,3,1]]).
edge([[1,1,1],[2,2,0]],[[0,0,0],[3,3,1]]).

edge([[0,2,1],[3,1,0]],[[0,1,0],[3,2,1]]).
edge([[0,2,1],[3,1,0]],[[0,0,0],[3,3,1]]).


dfs(X,P,[X|P]):-goal(X).
dfs(X,P,Path):-edge(X,Y), X\=Y, \+member(Y,P), dfs(Y,[X|P],Path).

% Run program: dfs([[3,3,1],[0,0,0]],[],P).