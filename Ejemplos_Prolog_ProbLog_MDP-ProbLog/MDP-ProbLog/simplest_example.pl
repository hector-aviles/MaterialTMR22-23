state_fluent(var1).

action(move).
action(stay).

utility(var1(1), 2).

0.99::var1(1):- var1(0), stay.
0.04::var1(1):- not(var1(0)), stay.

0.03::var1(1):- var1(0), move.
0.98::var1(1):- not(var1(0)), move.

