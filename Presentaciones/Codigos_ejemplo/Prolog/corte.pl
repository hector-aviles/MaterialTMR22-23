/* Ejemplo modificado ligeramente de: Ulle Endriss. Lecture Notes: An Introduction to Prolog Programming. Institute for Logic, Language and Computation. University of Amsterdam. 2014. Disponible en: https://staff.fnwi.uva.nl/u.endriss/teaching/prolog/prolog.pdf. Última visita: 15 de diciembre del 2021.*/

/* Érase una vez un Príncipe que deseaba salir de su palacio a elegir a su  prometida. Sus asesores (entre los cuales se encuentran programadores de Prolog) han identificado que el Príncipe podría comprometerse de dos maneras: a) con una mujer joven, bella e inteligente (requisito indispensable para ser Reina), ó b) dado que el Príncipe es un romántico, se enamoraría de la primera mujer joven y bella, aunque no cumpla el tercer requisito y por tanto no lleguen a comprometerse (aunque el Príncipe le sería fiel de ahí en adelante). Sus asesores han identificado a las candidatas y el orden en que podría encontrar cuando salga del palacio y han reflejado esta información en un código en Prolog. */


joven(claudia).
joven(maria).
joven(denise).
joven(margarita).

bella(claudia).
bella(maria).
bella(margarita).

inteligente(maria).
inteligente(denise).

/* Primero se puede verificar el resultado sin considerar la opción b) (ie, buscando que la candidata cumpla las 3 condiciones) */

prometida_sin_cut(M) :- 
  joven(M), bella(M),         
  inteligente(M).
prometida_sin_cut(_M) :- write('Tiene suerte el Príncipe!'), nl.
  
/* Pregunta */  
%:- prometida_sin_cut(X).

/* Ahora, se puede introducir un corte para considerar la tercera condición. De acuerdo al programa, aunque Claudia será la pareja de vida del Príncipe, ella no podrá ser su prometida ya que al no ejecutar retroceso para buscar a una siguiente candidata joven e inteligente la cláusula completa falla. */   
  
prometida_con_cut(M) :- 
  joven(M), bella(M), !,         
  inteligente(M).
/* Aunque la anterior cláusula falló la siguiente cláusula no se ejecutará debido al corte de la cláusula anterior */  
%prometida_con_cut(_M) :- write('El Príncipe no se comprometerá'), nl.

/* Pregunta */  
%:- prometida_con_cut(X).


