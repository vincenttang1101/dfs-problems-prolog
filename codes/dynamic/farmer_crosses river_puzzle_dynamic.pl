goal([0,0,0,0,1,1,1,1]).

dangerous([0,1,1,_,1,0,0,_]).
dangerous([0,_,1,1,1,_,0,0]).
dangerous([1,0,0,_,0,1,1,_]).
dangerous([1,_,0,0,0,_,1,1]).


farmer_wolf_LR([1,1,G_L,C_L,0,0,G_R,C_R],[0,0,G_L,C_L,1,1,G_R,C_R]).
farmer_goat_LR([1,W_L,1,C_L,0,W_R,0,C_R],[0,W_L,0,C_L,1,W_R,1,C_R]).
farmer_cabbage_LR([1,W_L,G_L,1,0,W_R,G_R,0],[0,W_L,G_L,0,1,W_R,G_R,1]).
farmer_LR([1,W_L,G_L,C_L,0,W_R,G_R,C_R],[0,W_L,G_L,C_L,1,W_R,G_R,C_R]).

farmer_wolf_RL([0,0,G_L,C_L,1,1,G_R,C_R],[1,1,G_L,C_L,0,0,G_R,C_R]).
farmer_goat_RL([0,W_L,0,C_L,1,W_R,1,C_R],[1,W_L,1,C_L,0,W_R,0,C_R]).
farmer_cabbage_RL([0,W_L,G_L,0,1,W_R,G_R,1],[1,W_L,G_L,1,0,W_R,G_R,0]).
farmer_RL([0,W_L,G_L,C_L,1,W_R,G_R,C_R],[1,W_L,G_L,C_L,0,W_R,G_R,C_R]).

transit(X,Y):-farmer_wolf_LR(X,Y).
transit(X,Y):-farmer_goat_LR(X,Y).
transit(X,Y):-farmer_cabbage_LR(X,Y).
transit(X,Y):-farmer_LR(X,Y).

transit(X,Y):-farmer_wolf_RL(X,Y).
transit(X,Y):-farmer_goat_RL(X,Y).
transit(X,Y):-farmer_cabbage_RL(X,Y).
transit(X,Y):-farmer_RL(X,Y).

dfs(X,P,[X|P]):-goal(X).
dfs(X,P,Path):-transit(X,Y), X\=Y, \+dangerous(Y), \+member(Y,P), dfs(Y,[X|P],Path).

% Run program: dfs([1,1,1,1,0,0,0,0],[],P).