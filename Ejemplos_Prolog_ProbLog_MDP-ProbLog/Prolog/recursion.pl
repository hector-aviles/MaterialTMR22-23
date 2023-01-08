/* Ejemplo 1 */

/* Llamada recursiva */
cuenta_regresiva(X):- 
  X >= 1, 
  format('~w ', [X]), nl, 
  X1 is X - 1,  
  cuenta_regresiva(X1), !.
/* Caso base */
cuenta_regresiva(X):- 
  X =:= 0, 
  format('~s', ["Ignición"]), 
  nl.

/* Objetivo */
%:- cuenta_regresiva(10).

/* Ejemplo 2 */

/* Llamada recursiva */
factorial(X, Y):- 
  X >= 1, 
  X1 is X - 1,  
  factorial(X1, Y1), 
  Y is X * Y1, !.
/* Caso base */
factorial(_X, Y):-  
  Y is 1, 
  nl.

/* Cláusula principal para despliegue, se puede llamar simplemente como: factorial(5, Y).*/  
/* Llamada recursiva */
factorial(X):- 
  factorial(X, Y), 
  format('~s ~w ~s ~w ', 
  ['El factorial de', X, 'es', Y]).

/* Pregunta */
%:- factorial(5).

/* Ejemplo 3 */

/* Llamada recursiva */
despliega_lista([H|T]):- 
  length([H|T], Length), 
  Length > 1, 
  format('~s ~w ~s ~w ', ['La cabeza es', H, 'y la cola es', T]), nl,
  despliega_lista(T), !.
/* Caso base */  
despliega_lista([H|_]):- 
  length([H|_], Length), 
  Length =:= 1, 
  format('~s ~w ', ['El último elemento es', H]), nl.

/* Objetivo */
%:- despliega_lista([a, e, i, o, u]).


