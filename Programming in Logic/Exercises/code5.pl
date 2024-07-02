:- op(100, xfx, of).
:- dynamic cards/0.
:- dynamic suit/1.
:- dynamic rank/1.
suit(spades).
suit(hearts).
suit(clubs).
suit(diamonds).

rank(ace).
rank(2).
rank(3).
rank(4).
rank(5).
rank(6).
rank(7).
rank(8).
rank(9).
rank(10).
rank(jack).
rank(queen).
rank(king).

cards:-
	suit(S),	% 1
	rank(R),	% 2
	assert(R of S),
	fail.
cards.

:- op(100, xfx, above).

ace above king.
king above queen.
queen above jack.
jack above 10.
X above Y:-
	succ(Y, X).

succ(2,3).
succ(3,4).
succ(4,5).
succ(5,6).
succ(6,7).
succ(7,8).
succ(8,9).
succ(9,10).

:- op(100, xfx, beats).

X beats Y:-		% 4
	X above Y.	% 5
X beats Y:-		% 6
	X above Z,	% 7
	Z beats Y.	% 8

member(X, [X|_]).
member(X, [_|L]):-
	member(X, L).

:- op(100, xfx, beatsall).
_ beatsall [] .
X beatsall [H|T]:-
	X beats H,
	X beatsall T.

go:-			% 9
	rank(R),	% 10
	write('--------------------'), nl,
	R beats B,	% 11
	write(R beats B), nl,	% 12
	fail.
go.			% 13
