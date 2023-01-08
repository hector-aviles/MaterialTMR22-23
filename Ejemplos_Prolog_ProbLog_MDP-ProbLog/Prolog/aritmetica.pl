/* Operaciones lógicas básicas */
conjuncion(X,Y):- (X, Y).
% conjuncion(true,true).
% conjuncion(true,false).
% conjuncion(false,true).
% conjuncion(false,false).

/* ';' Permite derivar tres opciones para evaluar el predicado "disyuncion". */
disyuncion(X,Y, Z):- (X ; Y; Z).
% disyuncion(true, true, false).
% disyuncion(false, true, false).

/* Lo anterior es equivalente a: */
disyuncion_1(X, _Y, _Z):- X.
disyuncion_1(_X, Y, _Z):- Y.
disyuncion_1(_X, _Y, Z):- Z.
% disyuncion_1(true,true,true).
% disyuncion_1(true,false,true).

/* Error de excepción cuando las variables no están suficientemente instanciadas */
% disyuncion_1(true,Y,true).

/* Cabezas siempre verdad o falsas. */
siempre_verdad:- true.
% siempre_verdad.
siempre_falsa:- false.
/* Alternativamente: */ 
% siempre_falsa:- fail.
% siempre_falsa.

/* Para desplegar X en términos de los functores +,-,/,*,  
Útil para revisar el orden de precedencia */
precedencia :- X is 10 + 5 * 6 / 3 - 1, write(X), write(' '), display(X is 10 + 5 * 6 / 3 - 1), nl.

/* Desigualdades */
/* =\= Verdad si las expresiones X y Y no evalúan a la misma cantidad*/
compara(X,Y) :- X =\= Y, format('~w ~s ~w', [X,'no es igual a', Y]),  fail.
% compara(5, 10).
compara(X,Y) :- X > Y, format(' ~s ~w ~s ~w', ['y', X,'es más grande que', Y]), nl, !.
compara(X,Y) :- X < Y, format(' ~s ~w ~s ~w', ['y', X,'es más pequeño que', Y]), nl, !.
compara(X,Y) :- X is Y, format('~w ~s ~w', [X,'es igual a', Y]), !.
% compara(10, 10).
/* Verdad si =:= las expresiones X y Y evaluan a la misma cantidad */

/* Ejecución de dos elementos capturados por línea de comandos */
comparacion:- write('Dame el primer número: '), read(X), nl, write('Dame el segundo número: '), read(Y), compara(X, Y), nl, !.
% comparacion.

/* Operaciones aritmeticas */
/* Resta. */
resta :- write('Dame el primer número: '), read(X), nl, write('Dame el segundo número: '), read(Y), Z1 is X - Y, format('~s~w', ['El resultado es ', Z1]),  write(' que para Prolog no es lo mismo que '), Z2=X - Y, format('~w', [Z2]), nl, !.

/* El signo '=' "unifica", ie, verifica si pueden sustituirse los elementos uno por el otro y se enfoca en la estructura y no en la aritmética */
% 3 = (7 - 4).
/* Ejemplos donde sí hay unificación de la estructura, no de la aritmética */
% MiVariable = (7 -4).
% X + Y = 5 + 2.
/* Ejemplo con 'is' para evaluación aritmética */ 
% 3 is (7 - 4).
% X is (7 - 4), X = 3.
/* 'is' no funciona en sentido inverso */ 
% (7 - 4) is 3.

/* División */
division :- write('Dame el primer número: '), read(X), nl, write('Dame el segundo número: '), read(Y), Z1 is X / Y, format('~s~w', ['El resultado es ', Z1]), write(' que para Prolog no es lo mismo que '), Z2=X/Y, format('~w', [Z2]), nl, !.

/* Multiplicación */
multiplicacion :- write('Dame el primer número: '), read(X), nl, write('Dame el segundo número: '), read(Y), Z1 is X * Y, format('~s~w', ['El resultado es ', Z1]), write(' que es una salida diferente a '), Z2=X*Y, format('~w', [Z2]), nl, !.

/* Suma */
suma :- write('Dame el primer número: '), read(X), nl, write('Dame el segundo número: '), read(Y), Z1 is X + Y, format('~s~w', ['El resultado es ', Z1]), write(' que es una salida diferente a '), Z2=X+Y, format('~w', [Z2]), nl, !.

