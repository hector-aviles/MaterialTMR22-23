% Variables de estado 
state_fluent(marketed(P)) :- person(P).
% La definición es "intensional" equivalente a:
% state_fluent(marketed(denis)).
% state_fluent(marketed(thiago)).
% state_fluent(marketed(leliane)).
% state_fluent(marketed(fabio)).

% Acciones
action(market(P)) :- person(P).
action(market(none)).

% Utilidad
% Utilidad negativa sobre una acción
utility(market(P), -1) :- person(P).
% Utilidad positiva sobre un átomo auxiliar 
utility(buys(P,1), 5) :- person(P).

% Modelo de transición
% Regla determinista equivalente 
% a 1.0::marketed(X,1) :- market(X).
marketed(X,1) :- market(X).
% P(marketed(X)'| ~Market(X), Marketed(X)), ie,
% la probabilidad de que X esté marqueteado en el tiempo siguiente dado 
% que X está marqueteado ahora y no se le ha enviado publicidad.
0.5::marketed(X,1) :- not(market(X)), marketed(X,0).

% Modelo de recompensa
0.2::buy_from_marketing(P) :- person(P).
0.3::buy_from_trust(P) :- person(P).
% X puede comprar ya sea porque (1) X fue marqueteada y X compra por marketing 
% ó (2) X confía en Y que va a comprar y X compra por confianza
buys(X,1) :- marketed(X,1), buy_from_marketing(X).
buys(X,1) :- trusts(X,Y), buys(Y,1), buy_from_trust(X).




