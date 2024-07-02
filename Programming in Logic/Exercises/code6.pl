
%First program, assesses whether something is liked or disliked..

assess(X):-
	dislike(X),
	write('dislike'),
	nl.
assess(X):-
	like(X),
	write('like'),
	nl.
assess(X):-
	similar(X, Y),
	assess(Y).

similar(X, Y):-
	alike(X, Y).
similar(X, Y):-
	alike(Y, X).

dislike(fish).
dislike(dogs).
dislike(horses).
dislike(bears).

like(cats).
like(rabbits).
like(people).
like(swans).

alike(lions, cats).
alike(tigers, lions).
alike(wolves, dogs).
alike(dingoes, dogs).
alike(children, people).
alike(ducks, swans).
alike(ducks, pigeons).
alike(geese, ducks).
alike(bears, pandas).
alike(pandas, koalas).
alike(frogs, toads).
alike(newts, frogs).

%Second program, a mystery function...
f(0, 1).
f(1, 1).
f(X, N):-
	X1 is X-1,
	X2 is X-2,
	f(X1, N1),
	f(X2, N2),
	N is N1 + N2.

%Third program, member...
days([mon, tue, wed, thu, fri, sat, sun]).

member(X, [X|_]).
member(X, [_|L]):-
	member(X, L).
