% Se modifica la V1 para incluir comportamiento de variables de estado
% no afectadas por cada acción

%%%%%%%%%%%%%%%%%%%%%%%%%%
% State variables
%%%%%%%%%%%%%%%%%%%%%%%%%%

state_fluent(free_North).
state_fluent(free_NorthWest).
state_fluent(free_West).
state_fluent(free_SouthWest).

%%%%%%%%%%%%%%%%%%%%%%%%%%
% Actions
%%%%%%%%%%%%%%%%%%%%%%%%%%

action(cruise).
action(keep_distance).
action(change_lane).

%%%%%%%%%%%%%%%%%%%%%%%%%%
% Utilities
%%%%%%%%%%%%%%%%%%%%%%%%%%

utility(free_North(0), 5).
utility(rearEnd_crash(1), -10).  
utility(sideSwipe_crash(1), -5).  
utility(keep_distance, -2).
utility(change_lane, -1).

0.99::rearEnd_crash(1) :- not(free_North(0)), cruise.
0.95::rearEnd_crash(1) :- not(free_NorthWest(0)), change_lane.
0.95::sideSwipe_crash(1) :- not(free_West(0)), change_lane.

%%%%%%%%%%%%%%%%%%%%%%%%%%
% Transitions
%%%%%%%%%%%%%%%%%%%%%%%%%%

% Action: cruise
0.95::free_North(1) :- free_North(0), cruise.
0.05::free_North(1) :- not(free_North(0)), cruise.

% Variables no modificadas por cruise
0.95::free_NorthWest(1) :- free_NorthWest(0), cruise.
0.05::free_NorthWest(1) :- not(free_NorthWest(0)), cruise.
0.95::free_West(1) :- free_West(0), cruise.
0.05::free_West(1) :- not(free_West(0)), cruise.
0.95::free_SouthWest(1) :- free_SouthWest(0), cruise.
0.05::free_SouthWest(1) :- not(free_SouthWest(0)), cruise.

% Action: change_lane
0.95::free_North(1) :- free_NorthWest(0), free_West(0), change_lane.
0.05::free_North(1) :- not(free_NorthWest(0)), change_lane.
0.05::free_North(1) :- not(free_West(0)), not(free_SouthWest(0)), change_lane.

% Variables no modificadas por change_lane
0.95::free_NorthWest(1) :- free_NorthWest(0), change_lane.
0.05::free_NorthWest(1) :- not(free_NorthWest(0)), change_lane.
0.95::free_West(1) :- free_West(0), change_lane.
0.05::free_West(1) :- not(free_West(0)), change_lane.
0.95::free_SouthWest(1) :- free_SouthWest(0), change_lane.
0.05::free_SouthWest(1) :- not(free_SouthWest(0)), change_lane.

% Action: keep_distance
0.5::free_North(1) :- not(free_North(0)), free_West(0), keep_distance.

% Variables no modificadas por keep_distance
0.95::free_NorthWest(1) :- free_NorthWest(0), keep_distance.
0.05::free_NorthWest(1) :- not(free_NorthWest(0)), keep_distance.
0.95::free_West(1) :- free_West(0), keep_distance.
0.05::free_West(1) :- not(free_West(0)), keep_distance.
0.95::free_SouthWest(1) :- free_SouthWest(0), keep_distance.
0.05::free_SouthWest(1) :- not(free_SouthWest(0)), keep_distance.

