/* Ejemplo de retroceso */

/* Informs the interpreter that the definition of the predicate(s) may change during execution (using assert/1 and/or retract/1). */
:- dynamic p/1.
:- dynamic p/2.
:- dynamic q/1.
:- dynamic r/2.

p(a).
p(b).
p(c).
p(d).
q(a).
q(c).
q(d).
p(a, b).
p(a, c).
p(a, d).
p(d, c).

r(X, Y) :- p(X), q(Y), p(X, Y).

/* Objetivo */
%:- p(b).
/* Pregunta con múltiples resultados */
%:- p(X).
/* Pregunta con múltiples resultados */
%:- p(a, X).
/* Pregunta con múltiples resultados */
%:- p(X), q(X).
/* Pregunta con múltiples resultados */
%:- r(X, Y).

