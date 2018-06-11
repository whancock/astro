danger(A,B) :-
   sign(A,pisces), B=ndanger.
danger(A,B) :-
   not(sign(A,pisces)), B=ydanger.


popular(A,B) :-
   blending(A,moon,jupiter), B=npopular.

popular(A,B) :-
   not(blending(A,moon,jupiter)), B=ypopular.


pacifist(A,B) :-
   blending(A,moon,jupiter), B=npacifist.
pacifist(A,B) :-
   not(blending(A,moon,jupiter)), B=ypacifist.


intelligent(A,B) :-
   harmonizing(A,venus,uranus), B=nintelligent.
intelligent(A,B) :-
   not(harmonizing(A,venus,uranus)), B=yintelligent.
