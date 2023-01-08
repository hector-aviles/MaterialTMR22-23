% Calcula todos los subconjuntos de [denis,thiago,leliane,fabio]
% Las personas se almacenan en una lista
% Tardó mucho tiempo en ejecutarse.
subset([], []).
subset([X|A], [X|B]):- subset(A, B).
subset([_|A], B):- subset(A, B).

% Verifica si X es miembro de una lista
member(X,[X|_]).
member(X,[_|A]) :- member(X,A).

% actions
% Considera marquetear a varias personas a la vez
action(market(X)) :- people(L), subset(L,X).

% costs
% Considera costo variable -C dependiendo del número de personas en X 
utility(market(X), -C) :- people(L), subset(L,X), length(X,C).
% Utilidad para la compra de cada persona (Obtiene en orden a cada persona en la lista)
utility(buys(P,1), 5) :- people(L), member(P,L).

% state
% Variable fluente para cada persona (obtiene en orden a cada persona en la lista)
state_fluent(marketed(P)) :- people(L), member(P,L).
% Diferencia con la domain3: la variable buys antes auxiliar ahora es fluente 
state_fluent(buys(P)) :- people(L), member(P,L).

% transition
marketed(P,1) :- market(L), member(P,L).
0.5::marketed(P,1) :- market(L), not(member(P,L)), marketed(P,0).

% reward model
0.2::buy_from_marketing(P) :- people(L), member(P,L).
0.3::buy_from_trust(P) :- people(L), member(P,L).
0.1::buy_again(P) :- people(L), member(P,L).

% X puede comprar ya sea porque (1) P fue marqueteada y X compra
% por marketing ó (2) P confía en Y que va a comprar y P compra por confianza
% ó (3) P no ha sido marketeada pero P ya compró y P podría comprar de nuevo
buys(P,1) :- marketed(P,1), buy_from_marketing(P).
buys(P,1) :- trusts(P,Y), buys(Y,1), buy_from_trust(P).
buys(P,1) :- market(L), not(member(P,L)), buys(P,0), buy_again(P).


