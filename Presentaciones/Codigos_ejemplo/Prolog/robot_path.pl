% Ejemplo tomado de: https://stackoverflow.com/questions/27338918/write-a-prolog-program-to-model-a-gorilla-moving-across-a-grid

:- dynamic goal/1.


blocked((1, 2)).
blocked((4, 1)).
blocked((8, 8)).

grid_position((X, Y)) :- 
    X >= 1,
    X =< 8,
    Y >= 1,
    Y =< 8.
        
allowed_position((X, Y)) :-
    grid_position((X, Y)),
    \+blocked((X, Y)).    

% upleft
move_upleft((X,Y),(X,Y1), up):- 
    Y1 is Y + 1,
    allowed_position((X, Y1)). 
move_upleft((X,Y),(X1,Y), left):-  
    X1 is X - 1,
    allowed_position((X1, Y)). 
move_upleft((X,Y),(X1,Y1), diag_upleft):-  
    X1 is X - 1,
    Y1 is Y + 1,
    allowed_position((X1, Y1)). 

% downright
move_downright((X,Y),(X,Y1), down):- 
    Y1 is Y - 1,
    allowed_position((X, Y1)). 
move_downright((X,Y),(X1,Y), right):-  
    X1 is X + 1,
    allowed_position((X1, Y)). 
move_downright((X,Y),(X1,Y1), diag_downright):-  
    X1 is X + 1,
    Y1 is Y - 1,
    allowed_position((X1, Y1)).

% upright
move_upright((X,Y),(X,Y1), up):- 
    Y1 is Y + 1,
    allowed_position((X, Y1)). 
move_upright((X,Y),(X1,Y), right):-  
    X1 is X + 1,
    allowed_position((X1, Y)). 
move_upright((X,Y),(X1,Y1), diag_upright):-  
    X1 is X + 1,
    Y1 is Y + 1,
    allowed_position((X1, Y1)).     
    
% downleft    
move_downleft((X,Y),(X,Y1), down):- 
    Y1 is Y - 1,
    allowed_position((X, Y1)). 
move_downleft((X,Y),(X1,Y), left):-  
    X1 is X - 1,
    allowed_position((X1, Y)).         
move_downleft((X,Y),(X1,Y1), diag_downleft):-  
    X1 is X - 1,
    Y1 is Y - 1,
    allowed_position((X1, Y1)).  
    
% path_upleft     
path_upleft((X,Y), []):- goal((X,Y)).
path_upleft(Position, [Direction| Before]):-
    goal((X, Y)), 
    \+ Position = (X,Y),
    move_upleft(Position, NewPosition, Direction),
    path_upleft(NewPosition, Before).    
        
% path_upright     
path_upright((X,Y), []):- goal((X,Y)).
path_upright(Position, [Direction| Before]):-
    goal((X, Y)), 
    \+ Position = (X,Y),
    move_upright(Position, NewPosition, Direction),
    path_upright(NewPosition, Before).

% path_downleft    
path_downleft((X,Y), []):- goal((X,Y)).
path_downleft(Position, [Direction| Before]):-
    goal((X, Y)), 
    \+ Position = (X,Y),
    move_downleft(Position, NewPosition, Direction),
    path_downleft(NewPosition, Before).    

% path_downright    
path_downright((X,Y), []):- goal((X,Y)).
path_downright(Position, [Direction| Before]):-
    goal((X, Y)), 
    \+ Position = (X,Y),
    move_downright(Position, NewPosition, Direction),
    path_downright(NewPosition, Before).  


all_paths((X, Y), (X1,Y1), Path):-
    retractall(goal((_,_))), % Inicia eliminando goales anteriores.
    assert(goal((X1, Y1))), % Incluir el goal como un hecho.
    X1 >= X,
    Y1 >= Y,
    path_upright((X, Y), Path).

all_paths((X, Y), (X1,Y1), Path):-
    X1 < X,
    Y1 > Y,
    path_upleft((X, Y), Path).
    
all_paths((X, Y), (X1,Y1), Path):-
    X1 < X,
    Y1 < Y,  
    path_downleft((X, Y), Path).   

all_paths((X, Y), (X1,Y1), Path):-
    X1 > X,
    Y1 < Y,  
    path_downright((X, Y), Path). 

/* Ejemplos de consulta */
%:- all_paths((4,4),(6,6), Paths).
%:- all_paths((4,4),(2,2), Paths).
%:- all_paths((4,4),(2,5), Paths).
%:- all_paths((4,4),(5,2), Paths).
%:- all_paths((4,4),(4,8), Paths).
%:- all_paths((4,4),(4,4), Paths).
     
    
    

