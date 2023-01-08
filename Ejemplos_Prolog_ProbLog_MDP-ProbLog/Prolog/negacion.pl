/* Negación por falla */

:- dynamic p/1.
:- dynamic q/1.

p(a).

q(X) :- \+ p(X), write(X), nl.

/* Pregunta */
/* Dado que p(b) no existe, p(b) es falso y \+ p(b) es verdadero y así se imprime 'b' y q(b) es verdadero */ 
%:- q(b).
/* Dado que p(a) sí existe, p(a) es verdadero y \+ p(a) es falso y no se imprime 'a', así q(a) es falso  */ 
%:- q(a).


