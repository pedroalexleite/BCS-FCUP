%concatenar listas
term([X|XS], Result):-
    term(XS, R1),
    append(X, R1, Result).
term([], Result):-
    Result=[].

%número de colunas e de linhas
length_of(N, L) :-
   length(L, N).
size(M, R, C) :-
   length(M,R),
   maplist(length_of(C), M).

%obter elemento
elem(L, Row, Col, Res):-
    size(L, _, C),
    Pos is Row*C+Col,
    term(L, Result),
    nth0(Pos, Result, Res).
elem([], _, _, []).

%obter linha
line(L, Row, Result) :-
    nth1(Row, L, Result).
line([], _, []).

%obter coluna
column([X|XS], Col, [X2|XS2]):-
   line(X, Col, X2),
column(XS,Col,XS2).
column([], _, []).

%somar
sum(X1, X2, X3) :-
    X3 is X1+X2.
addmat(M1, M2, M3) :-
    maplist(maplist(sum), M1, M2, M3).
addmat([], M2, M2).
addmat(M1, [], M1).
addmat([], [], R) :-
    R=[].

%somar elementos
addelem(L, Row1, Col1, Row2, Col2, Result) :-
    elem(L, Row1, Col1, R1),
	  elem(L, Row2, Col2, R2),
    Result is R1+R2.
addelem([], _, _, _, _, 0).

%adicionar um valor a todos os elementos da matriz
addaux(_, [], []) :- !.
addaux(A, [X|XS], Result):-
    F is X+A,
    addaux(A, XS, Result2),
    append([F], Result2, Result), !.

%subtrair um valor a todos os elementos da matriz
subaux(_, [], []) :- !.
subaux(A, [X|XS], Result):-
    F is X-A,
    subaux(A, XS, Result2),
    append([F], Result2, Result), !.

%multipicar um valor a todos os elementos da matriz
mulaux(_, [], []) :- !.
mulaux(A, [X|XS], Result):-
    F is X*A,
    mulaux(A, XS, Result2),
    append([F], Result2, Result), !.

%dividir um valor a todos os elementos da matriz
divaux(_, [], []) :- !.
divaux(A, [X|XS], Result):-
    F is X/A,
    divaux(A, XS, Result2),
    append([F], Result2, Result), !.

%mapear (usar addaux, subaux, mulaux, divaux)
mapmat(F, [X|XS], Result) :-
    call(F, X, Result2),
    mapmat(F, XS, Result3),
    append([Result2], Result3, Result), !.
mapmat(_, [], []) :- !.

%somar 2 valores
addaux2(L1, L2, Result) :-
	Result is L1+L2.

%subtrair 2 valores
subaux2(L1, L2, Result) :-
	Result is L1-L2.

%multiplicar 2 valores
mulaux2(L1, L2, Result) :-
	Result is L1*L2.

%dividir 2 valores
divaux2(L1, L2, Result) :-
	Result is L1/L2.

%reduzir
reducemat(F, Matrix, Reduced):-
    reduceleftlist(F, Matrix, List),
    reducelist(F, List, Reduced).

reduceleftlist(_, [], []).
reduceleftlist(F, [R1|R2], Matrix):-
    reducelist(F, R1, Nlist),
    reduceleftlist(F, R2, X),
    append([Nlist], X, Matrix).

reducelist(_, [A], A) :- !.
reducelist(F, [A, B|R1], List) :-
    call(F, A, B, Nelm),
    reducelist(F, [Nelm|R1], List), !.

%transpor
transpose([X|XS], Result) :-
    foldl(transpose2, X, Result, [X|XS], _).
transpose([], []).
transpose2(_, X, List1, List2) :-
        maplist(list_first_rest, List1, X, List2).
list_first_rest([X|XS], X, XS).
