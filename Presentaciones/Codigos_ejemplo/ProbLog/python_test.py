from problog.program import PrologString
from problog.core import ProbLog
from problog import get_evaluatable

p = PrologString("""
% Probabilistic facts:
0.5::heads1.
0.6::heads2.

% Rules:
/* Recordar: La conjunción implica multiplicación */
twoHeads :- heads1, heads2.

% Queries:
/* Probabilidad de que caiga cara en moneda 1 */
query(heads1).
/* Probabilidad de que caiga cara en moneda 2 */
query(heads2).
/* Probabilidad de que caiga cada en ambas monedas */
query(twoHeads).

""")

print(get_evaluatable().create_from(p).evaluate())

