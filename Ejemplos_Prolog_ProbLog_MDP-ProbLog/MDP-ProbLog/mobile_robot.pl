state_fluent(c1).
state_fluent(c2).
state_fluent(c3).
state_fluent(c4).

action(up).
action(down).
action(left).
action(right).
action(stay).

utility(goal, 1).
utility(cost, -1).

goal :- c1(0), c2(0), not(c3(0)), not(c4(0)), stay.
cost :- c1(0), not(c2(0)), not(c3(0)), c4(0), right. % from g
cost :- not(c1(0)), c2(0), not(c3(0)), not(c4(0)), up. % from l
cost :- c1(0), c2(0), not(c3(0)), not(c4(0)), down. % from d

% Para evita partir de un estado bloqueado
blocked :- c1(0), c2(0), c3(0), c4(0).
blocked :- not(c1(0)), not(c2(0)), not(c3(0)), c4(0).

% Transitions
% Recordar: ((B->P) & (B->Q) & (B->R) & (B->S)) <--> (B->(P & Q & R & S))
% To state a
0.01::c4(1) :- c1(0), c2(0), c3(0), not(c4(0)), left, not(blocked). % from b 
0.99::c1(1) :- c1(0), c2(0), c3(0), not(c4(0)), left, not(blocked). % from b 
0.99::c2(1) :- c1(0), c2(0), c3(0), not(c4(0)), left, not(blocked). % from b 
0.99::c3(1) :- c1(0), c2(0), c3(0), not(c4(0)), left, not(blocked). % from b 

0.01::c2(1) :- c1(0), not(c2(0)), c3(0), c4(0), up, not(blocked).%e
0.99::c1(1) :- c1(0), not(c2(0)), c3(0), c4(0), up, not(blocked).%e
0.99::c3(1) :- c1(0), not(c2(0)), c3(0), c4(0), up, not(blocked).%e
0.99::c4(1) :- c1(0), not(c2(0)), c3(0), c4(0), up, not(blocked).%e

% To state b 
0.01::c4(1) :- c1(0), c2(0), c3(0), c4(0), right, not(blocked). %a
0.99::c1(1) :- c1(0), c2(0), c3(0), c4(0), right, not(blocked). %a
0.99::c3(1) :- c1(0), c2(0), c3(0), c4(0), right, not(blocked). %a
0.99::c2(1) :- c1(0), c2(0), c3(0), c4(0), right, not(blocked). %a

0.99::c3(1) :- c1(0), c2(0), not(c3(0)), c4(0), left, not(blocked). %c
0.99::c1(1) :- c1(0), c2(0), not(c3(0)), c4(0), left, not(blocked). %c
0.99::c2(1) :- c1(0), c2(0), not(c3(0)), c4(0), left, not(blocked). %c
0.01::c4(1) :- c1(0), c2(0), not(c3(0)), c4(0), left, not(blocked). %c

0.99::c1(1) :- c1(0), not(c2(0)), c3(0), not(c4(0)), up, not(blocked). %f
0.99::c2(1) :- c1(0), not(c2(0)), c3(0), not(c4(0)), up, not(blocked). %f
0.99::c3(1) :- c1(0), not(c2(0)), c3(0), not(c4(0)), up, not(blocked). %f
0.01::c4(1) :- c1(0), not(c2(0)), c3(0), not(c4(0)), up, not(blocked). %f

% To state c
0.01::c3(1) :- c1(0), c2(0), c3(0), not(c4(0)), right, not(blocked).   %b 
0.99::c1(1) :- c1(0), c2(0), c3(0), not(c4(0)), right, not(blocked).   %b 
0.99::c2(1) :- c1(0), c2(0), c3(0), not(c4(0)), right, not(blocked).   %b 
0.99::c4(1) :- c1(0), c2(0), c3(0), not(c4(0)), right, not(blocked).   %b 

0.99::c2(1) :- c1(0), not(c2(0)), not(c3(0)), c4(0), up, not(blocked). %g
0.99::c1(1) :- c1(0), not(c2(0)), not(c3(0)), c4(0), up, not(blocked). %g
0.01::c3(1) :- c1(0), not(c2(0)), not(c3(0)), c4(0), up, not(blocked). %g
0.99::c4(1) :- c1(0), not(c2(0)), not(c3(0)), c4(0), up, not(blocked). %g

0.99::c4(1) :- c1(0), not(c2(0)), not(c3(0)), not(c4(0)), left, not(blocked). %d
0.99::c1(1) :- c1(0), not(c2(0)), not(c3(0)), not(c4(0)), left, not(blocked). %d
0.01::c2(1) :- c1(0), not(c2(0)), not(c3(0)), not(c4(0)), left, not(blocked). %d
0.01::c3(1) :- c1(0), not(c2(0)), not(c3(0)), not(c4(0)), left, not(blocked). %d

% To state d
0.01::c4(1) :- c1(0), c2(0), not(c3(0)), c4(0), right, not(blocked). %c
0.99::c1(1) :- c1(0), c2(0), not(c3(0)), c4(0), right, not(blocked). %c
0.99::c2(1) :- c1(0), c2(0), not(c3(0)), c4(0), right, not(blocked). %c
0.01::c3(1) :- c1(0), c2(0), not(c3(0)), c4(0), right, not(blocked). %c

0.99::c2(1) :- c1(0), not(c2(0)), not(c3(0)), not(c4(0)), up, not(blocked).  %h
0.99::c1(1) :- c1(0), not(c2(0)), not(c3(0)), not(c4(0)), up, not(blocked).  %h
0.01::c3(1) :- c1(0), not(c2(0)), not(c3(0)), not(c4(0)), up, not(blocked).  %h
0.01::c4(1) :- c1(0), not(c2(0)), not(c3(0)), not(c4(0)), up, not(blocked).  %h

% To state e
0.01::c2(1) :- c1(0), c2(0), c3(0), c4(0), down, not(blocked). %a
0.99::c1(1) :- c1(0), c2(0), c3(0), c4(0), down, not(blocked). %a
0.99::c3(1) :- c1(0), c2(0), c3(0), c4(0), down, not(blocked). %a
0.99::c4(1) :- c1(0), c2(0), c3(0), c4(0), down, not(blocked). %a

0.99::c1(1) :- c1(0), not(c2(0)), c3(0), not(c4(0)), left, not(blocked). %f
0.01::c2(1) :- c1(0), not(c2(0)), c3(0), not(c4(0)), left, not(blocked). %f
0.99::c3(1) :- c1(0), not(c2(0)), c3(0), not(c4(0)), left, not(blocked). %f
0.99::c4(1) :- c1(0), not(c2(0)), c3(0), not(c4(0)), left, not(blocked). %f

0.99::c1(1) :- not(c1(0)), c2(0), c3(0), c4(0), up, not(blocked). %i
0.01::c2(1) :- not(c1(0)), c2(0), c3(0), c4(0), up, not(blocked). %i
0.99::c3(1) :- not(c1(0)), c2(0), c3(0), c4(0), up, not(blocked). %i
0.99::c4(1) :- not(c1(0)), c2(0), c3(0), c4(0), up, not(blocked). %i

% To state f
0.01::c2(1) :- c1(0), c2(0), c3(0), not(c4(0)), down, not(blocked). %b
0.99::c1(1) :- c1(0), c2(0), c3(0), not(c4(0)), down, not(blocked). %b
0.99::c3(1) :- c1(0), c2(0), c3(0), not(c4(0)), down, not(blocked). %b
0.01::c4(1) :- c1(0), c2(0), c3(0), not(c4(0)), down, not(blocked). %b

0.01::c4(1) :- c1(0), not(c2(0)), c3(0), c4(0), right, not(blocked). %e
0.99::c1(1) :- c1(0), not(c2(0)), c3(0), c4(0), right, not(blocked). %e
0.01::c2(1) :- c1(0), not(c2(0)), c3(0), c4(0), right, not(blocked). %e
0.99::c3(1) :- c1(0), not(c2(0)), c3(0), c4(0), right, not(blocked). %e

0.99::c1(1) :- not(c1(0)), c2(0), c3(0), not(c4(0)), up, not(blocked). %j
0.01::c2(1) :- not(c1(0)), c2(0), c3(0), not(c4(0)), up, not(blocked). %j
0.99::c3(1) :- not(c1(0)), c2(0), c3(0), not(c4(0)), up, not(blocked). %j
0.01::c4(1) :- not(c1(0)), c2(0), c3(0), not(c4(0)), up, not(blocked). %j

0.99::c1(1) :- c1(0), not(c2(0)), not(c3(0)), c4(0), left, not(blocked). %g
0.01::c2(1) :- c1(0), not(c2(0)), not(c3(0)), c4(0), left, not(blocked). %g
0.99::c3(1) :- c1(0), not(c2(0)), not(c3(0)), c4(0), left, not(blocked). %g
0.01::c4(1) :- c1(0), not(c2(0)), not(c3(0)), c4(0), left, not(blocked). %g

% To state g
0.01::c2(1) :- c1(0), c2(0), not(c3(0)), c4(0), down, not(blocked). %c
0.99::c1(1) :- c1(0), c2(0), not(c3(0)), c4(0), down, not(blocked). %c
0.01::c3(1) :- c1(0), c2(0), not(c3(0)), c4(0), down, not(blocked). %c
0.99::c4(1) :- c1(0), c2(0), not(c3(0)), c4(0), down, not(blocked). %c

0.99::c1(1) :- c1(0), not(c2(0)), c3(0), not(c4(0)), right, not(blocked). %f
0.01::c2(1) :- c1(0), not(c2(0)), c3(0), not(c4(0)), right, not(blocked). %f
0.01::c3(1) :- c1(0), not(c2(0)), c3(0), not(c4(0)), right, not(blocked). %f
0.99::c4(1) :- c1(0), not(c2(0)), c3(0), not(c4(0)), right, not(blocked). %f

0.99::c1(1) :- not(c1(0)), c2(0), not(c3(0)), c4(0), up, not(blocked). %k
0.01::c2(1) :- not(c1(0)), c2(0), not(c3(0)), c4(0), up, not(blocked). %k
0.01::c3(1) :- not(c1(0)), c2(0), not(c3(0)), c4(0), up, not(blocked). %k
0.99::c4(1) :- not(c1(0)), c2(0), not(c3(0)), c4(0), up, not(blocked). %k

0.99::c1(1) :- c1(0), not(c2(0)), not(c3(0)), not(c4(0)), left, not(blocked). %h
0.01::c2(1) :- c1(0), not(c2(0)), not(c3(0)), not(c4(0)), left, not(blocked). %h
0.01::c3(1) :- c1(0), not(c2(0)), not(c3(0)), not(c4(0)), left, not(blocked). %h
0.99::c4(1) :- c1(0), not(c2(0)), not(c3(0)), not(c4(0)), left, not(blocked). %h

% To state h
0.01::c2(1) :- c1(0), c2(0), not(c3(0)), not(c4(0)), down, not(blocked). %d
0.99::c1(1) :- c1(0), c2(0), not(c3(0)), not(c4(0)), down, not(blocked). %d
0.01::c3(1) :- c1(0), c2(0), not(c3(0)), not(c4(0)), down, not(blocked). %d
0.01::c4(1) :- c1(0), c2(0), not(c3(0)), not(c4(0)), down, not(blocked). %d

0.01::c4(1) :- c1(0), not(c2(0)), not(c3(0)), c4(0), right, not(blocked). %g
0.99::c1(1) :- c1(0), not(c2(0)), not(c3(0)), c4(0), right, not(blocked). %g
0.01::c2(1) :- c1(0), not(c2(0)), not(c3(0)), c4(0), right, not(blocked). %g
0.01::c3(1) :- c1(0), not(c2(0)), not(c3(0)), c4(0), right, not(blocked). %g

0.99::c1(1) :- not(c1(0)), c2(0), not(c3(0)), not(c4(0)), up, not(blocked). %l
0.01::c2(1) :- not(c1(0)), c2(0), not(c3(0)), not(c4(0)), up, not(blocked). %l
0.01::c3(1) :- not(c1(0)), c2(0), not(c3(0)), not(c4(0)), up, not(blocked). %l
0.01::c4(1) :- not(c1(0)), c2(0), not(c3(0)), not(c4(0)), up, not(blocked). %l


% To state i
0.01::c1(1) :- c1(0), not(c2(0)), c3(0), c4(0), down, not(blocked). %e
0.99::c2(1) :- c1(0), not(c2(0)), c3(0), c4(0), down, not(blocked). %e
0.99::c3(1) :- c1(0), not(c2(0)), c3(0), c4(0), down, not(blocked). %e
0.99::c4(1) :- c1(0), not(c2(0)), c3(0), c4(0), down, not(blocked). %e

0.01::c1(1) :- not(c1(0)), c2(0), c3(0), not(c4(0)), left, not(blocked). %j
0.99::c2(1) :- not(c1(0)), c2(0), c3(0), not(c4(0)), left, not(blocked). %j
0.99::c3(1) :- not(c1(0)), c2(0), c3(0), not(c4(0)), left, not(blocked). %j
0.99::c4(1) :- not(c1(0)), c2(0), c3(0), not(c4(0)), left, not(blocked). %j

0.99::c2(1) :- not(c1(0)), not(c2(0)), c3(0), c4(0), up, not(blocked). %m
0.01::c1(1) :- not(c1(0)), not(c2(0)), c3(0), c4(0), up, not(blocked). %m
0.99::c3(1) :- not(c1(0)), not(c2(0)), c3(0), c4(0), up, not(blocked). %m
0.99::c4(1) :- not(c1(0)), not(c2(0)), c3(0), c4(0), up, not(blocked). %m

% To state j
0.01::c1(1) :- c1(0), not(c2(0)), c3(0), not(c4(0)), down, not(blocked). %f
0.01::c2(1) :- c1(0), not(c2(0)), c3(0), not(c4(0)), down, not(blocked). %f
0.99::c3(1) :- c1(0), not(c2(0)), c3(0), not(c4(0)), down, not(blocked). %f
0.01::c4(1) :- c1(0), not(c2(0)), c3(0), not(c4(0)), down, not(blocked). %f

0.01::c1(1) :- not(c1(0)), c2(0), c3(0), c4(0), right, not(blocked). %i
0.99::c2(1) :- not(c1(0)), c2(0), c3(0), c4(0), right, not(blocked). %i
0.99::c3(1) :- not(c1(0)), c2(0), c3(0), c4(0), right, not(blocked). %i
0.01::c4(1) :- not(c1(0)), c2(0), c3(0), c4(0), right, not(blocked). %i

0.99::c2(1) :- not(c1(0)), not(c2(0)), c3(0), not(c4(0)), up, not(blocked). %n
0.01::c1(1) :- not(c1(0)), not(c2(0)), c3(0), not(c4(0)), up, not(blocked). %n
0.99::c3(1) :- not(c1(0)), not(c2(0)), c3(0), not(c4(0)), up, not(blocked). %n
0.01::c4(1) :- not(c1(0)), not(c2(0)), c3(0), not(c4(0)), up, not(blocked). %n

0.99::c3(1) :- not(c1(0)), c2(0), not(c3(0)), c4(0), left, not(blocked). %k
0.01::c4(1) :- not(c1(0)), c2(0), not(c3(0)), c4(0), left, not(blocked). %k
0.01::c1(1) :- not(c1(0)), c2(0), not(c3(0)), c4(0), left, not(blocked). %k
0.99::c2(1) :- not(c1(0)), c2(0), not(c3(0)), c4(0), left, not(blocked). %k

% To state k
0.01::c1(1) :- c1(0), not(c2(0)), not(c3(0)), c4(0), down, not(blocked). %g
0.99::c2(1) :- c1(0), not(c2(0)), not(c3(0)), c4(0), down, not(blocked). %g
0.01::c3(1) :- c1(0), not(c2(0)), not(c3(0)), c4(0), down, not(blocked). %g
0.99::c4(1) :- c1(0), not(c2(0)), not(c3(0)), c4(0), down, not(blocked). %g

0.01::c3(1) :- not(c1(0)), c2(0), c3(0), not(c4(0)), right, not(blocked). %j
0.99::c4(1) :- not(c1(0)), c2(0), c3(0), not(c4(0)), right, not(blocked). %j
0.01::c1(1) :- not(c1(0)), c2(0), c3(0), not(c4(0)), right, not(blocked). %j
0.99::c2(1) :- not(c1(0)), c2(0), c3(0), not(c4(0)), right, not(blocked). %j

0.99::c2(1) :- not(c1(0)), not(c2(0)), not(c3(0)), c4(0), up, not(blocked). %o
0.01::c1(1) :- not(c1(0)), not(c2(0)), not(c3(0)), c4(0), up, not(blocked). %o
0.01::c3(1) :- not(c1(0)), not(c2(0)), not(c3(0)), c4(0), up, not(blocked). %o
0.99::c4(1) :- not(c1(0)), not(c2(0)), not(c3(0)), c4(0), up, not(blocked). %o

0.99::c4(1) :- not(c1(0)), c2(0), not(c3(0)), not(c4(0)), left, not(blocked). %l
0.01::c1(1) :- not(c1(0)), c2(0), not(c3(0)), not(c4(0)), left, not(blocked). %l
0.99::c2(1) :- not(c1(0)), c2(0), not(c3(0)), not(c4(0)), left, not(blocked). %l
0.01::c3(1) :- not(c1(0)), c2(0), not(c3(0)), not(c4(0)), left, not(blocked). %l

% To state l
0.01::c1(1) :- c1(0), not(c2(0)), not(c3(0)), not(c4(0)), down, not(blocked). %h
0.99::c2(1) :- c1(0), not(c2(0)), not(c3(0)), not(c4(0)), down, not(blocked). %h
0.01::c3(1) :- c1(0), not(c2(0)), not(c3(0)), not(c4(0)), down, not(blocked). %h
0.01::c4(1) :- c1(0), not(c2(0)), not(c3(0)), not(c4(0)), down, not(blocked). %h

0.01::c4(1) :- not(c1(0)), c2(0), not(c3(0)), c4(0), right, not(blocked). %k
0.01::c1(1) :- not(c1(0)), c2(0), not(c3(0)), c4(0), right, not(blocked). %k
0.99::c2(1) :- not(c1(0)), c2(0), not(c3(0)), c4(0), right, not(blocked). %k
0.01::c3(1) :- not(c1(0)), c2(0), not(c3(0)), c4(0), right, not(blocked). %k

0.99::c2(1):- not(c1(0)), not(c2(0)), not(c3(0)), not(c4(0)), up, not(blocked). %p
0.01::c1(1):- not(c1(0)), not(c2(0)), not(c3(0)), not(c4(0)), up, not(blocked). %p
0.01::c3(1):- not(c1(0)), not(c2(0)), not(c3(0)), not(c4(0)), up, not(blocked). %p
0.01::c4(1):- not(c1(0)), not(c2(0)), not(c3(0)), not(c4(0)), up, not(blocked). %p

% To state m
0.01::c1(1) :- not(c1(0)), c2(0), c3(0), c4(0), down, not(blocked). %i
0.01::c2(1) :- not(c1(0)), c2(0), c3(0), c4(0), down, not(blocked). %i
0.99::c3(1) :- not(c1(0)), c2(0), c3(0), c4(0), down, not(blocked). %i
0.99::c4(1) :- not(c1(0)), c2(0), c3(0), c4(0), down, not(blocked). %i

0.01::c1(1) :- not(c1(0)), not(c2(0)), c3(0), not(c4(0)), left, not(blocked). %n
0.01::c2(1) :- not(c1(0)), not(c2(0)), c3(0), not(c4(0)), left, not(blocked). %n
0.99::c3(1) :- not(c1(0)), not(c2(0)), c3(0), not(c4(0)), left, not(blocked). %n
0.99::c4(1) :- not(c1(0)), not(c2(0)), c3(0), not(c4(0)), left, not(blocked). %n

% To state n
0.01::c2(1) :- not(c1(0)), c2(0), c3(0), not(c4(0)), down, not(blocked). %j
0.01::c1(1) :- not(c1(0)), c2(0), c3(0), not(c4(0)), down, not(blocked). %j
0.99::c3(1) :- not(c1(0)), c2(0), c3(0), not(c4(0)), down, not(blocked). %j
0.01::c4(1) :- not(c1(0)), c2(0), c3(0), not(c4(0)), down, not(blocked). %j

0.01::c4(1) :- not(c1(0)), not(c2(0)), c3(0), c4(0), right, not(blocked). %m
0.01::c1(1) :- not(c1(0)), not(c2(0)), c3(0), c4(0), right, not(blocked). %m
0.01::c2(1) :- not(c1(0)), not(c2(0)), c3(0), c4(0), right, not(blocked). %m
0.99::c3(1) :- not(c1(0)), not(c2(0)), c3(0), c4(0), right, not(blocked). %m

0.99::c3(1) :- not(c1(0)), not(c2(0)), not(c3(0)), c4(0), left, not(blocked). %o
0.01::c4(1) :- not(c1(0)), not(c2(0)), not(c3(0)), c4(0), left, not(blocked). %o
0.01::c1(1) :- not(c1(0)), not(c2(0)), not(c3(0)), c4(0), left, not(blocked). %o
0.01::c2(1) :- not(c1(0)), not(c2(0)), not(c3(0)), c4(0), left, not(blocked). %o

% To state o
0.01::c2(1) :- not(c1(0)), not(c2(0)), not(c3(0)), c4(0), down, not(blocked). %k
0.01::c1(1) :- not(c1(0)), not(c2(0)), not(c3(0)), c4(0), down, not(blocked). %k
0.01::c3(1) :- not(c1(0)), not(c2(0)), not(c3(0)), c4(0), down, not(blocked). %k
0.99::c4(1) :- not(c1(0)), not(c2(0)), not(c3(0)), c4(0), down, not(blocked). %k

0.01::c3(1) :- not(c1(0)), not(c2(0)), c3(0), not(c4(0)), right, not(blocked). %n
0.99::c4(1) :- not(c1(0)), not(c2(0)), c3(0), not(c4(0)), right, not(blocked). %n
0.01::c1(1) :- not(c1(0)), not(c2(0)), c3(0), not(c4(0)), right, not(blocked). %n
0.01::c2(1) :- not(c1(0)), not(c2(0)), c3(0), not(c4(0)), right, not(blocked). %n

0.99::c4(1) :- not(c1(0)), not(c2(0)), c3(0), not(c4(0)), left, not(blocked). %p
0.01::c1(1) :- not(c1(0)), not(c2(0)), c3(0), not(c4(0)), left, not(blocked). %p
0.01::c2(1) :- not(c1(0)), not(c2(0)), c3(0), not(c4(0)), left, not(blocked). %p
0.99::c3(1) :- not(c1(0)), not(c2(0)), c3(0), not(c4(0)), left, not(blocked). %p

% To state p
0.01::c2(1) :- not(c1(0)), c2(0), not(c3(0)), not(c4(0)), down, not(blocked). %l
0.01::c3(1) :- not(c1(0)), c2(0), not(c3(0)), not(c4(0)), down, not(blocked). %l
0.01::c1(1) :- not(c1(0)), c2(0), not(c3(0)), not(c4(0)), down, not(blocked). %l
0.01::c4(1) :- not(c1(0)), c2(0), not(c3(0)), not(c4(0)), down, not(blocked). %l

0.01::c2(1) :- not(c1(0)), not(c2(0)), not(c3(0)), c4(0), right, not(blocked). %o
0.01::c4(1) :- not(c1(0)), not(c2(0)), not(c3(0)), c4(0), right, not(blocked). %o
0.01::c1(1) :- not(c1(0)), not(c2(0)), not(c3(0)), c4(0), right, not(blocked). %o
0.01::c3(1) :- not(c1(0)), not(c2(0)), not(c3(0)), c4(0), right, not(blocked). %o

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%c1  c2  c3  c4                            Estado
%c1(0), c2(0), c3(0), c4(0).                 %a
%c1(0), c2(0), c3(0), not(c4(0)).            %b 
%c1(0), c2(0), not(c3(0)), c4(0).            %c
%c1(0), c2(0), not(c3(0)), not(c4(0)).       %d
%c1(0), not(c2(0)), c3(0), c4(0).            %e
%c1(0), not(c2(0)), c3(0), not(c4(0)).       %f
%c1(0), not(c2(0)), not(c3(0)), c4(0).       %g
%c1(0), not(c2(0)), not(c3(0)), not(c4(0)).  %h
%not(c1(0)), c2(0), c3(0), c4(0).            %i
%not(c1(0)), c2(0), c3(0), not(c4(0)).       %j
%not(c1(0)), c2(0), not(c3(0)), c4(0).       %k
%not(c1(0)), c2(0), not(c3(0)), not(c4(0)).  %l
%not(c1(0)), not(c2(0)), c3(0), c4(0).       %m
%not(c1(0)), not(c2(0)), c3(0), not(c4(0)).  %n
%not(c1(0)), not(c2(0)), not(c3(0)), c4(0).  %o
%not(c1(0)), not(c2(0)), not(c3(0)), not(c4(0)).  %p


%c1  c2  c3  c4  Estado
%1   1    1   1   a
%1   1    1   0   b 
%1   1    0   1   c
%1   1    0   0   d
%1   0    1   1   e
%1   0    1   0   f
%1   0    0   1   g
%1   0    0   0   h
%0   1    1   1   i
%0   1    1   0   j
%0   1    0   1   k
%0   1    0   0   l
%0   0    1   1   m
%0   0    1   0   n
%0   0    0   1   o
%0   0    0   0   p 
   
