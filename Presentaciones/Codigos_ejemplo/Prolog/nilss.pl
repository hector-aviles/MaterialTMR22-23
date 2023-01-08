%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Los hechos se describen con un punto al final, 'p.' (que se lee como ``sucede p si {}'' 
% Las reglas se escriben así: 'r :- p, q.' (ie, ``ocurre r si ocurren p y q'' 
% Los objetivos/preguntas se escriben ':- p.' (y se leen como ``si sucede r entonces {}'')   
% Observar que las cláusulas terminan con un '.' (terminador) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/* Hechos */
batt_ok.
liftable. 

/* Reglas */
moves :- batt_ok, 
  liftable. 

/* Objetivo */
:- moves.
