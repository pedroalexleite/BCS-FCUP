%contem
contains(Elem,t(Elem,_,_)).
contains(Elem,t(X,A,B)):-
    (Elem<X -> contains(Elem,A); contains(Elem,B)).

%maximo
max(t(X,_,nil),Ans):-
    Ans=X.
max(t(,,B),Ans):-
    max(B,Ans).

%minimo
min(t(X,nil,_),Ans):-
    Ans=X.
min(t(,A,),Ans):-
    min(A,Ans).

%converter numa lista
converttolist(nil, []).
converttolist(t(X, L, R), Result) :-
    converttolist(L, L2), converttolist(R, L3),
    append(L2, [X], Aux), append(Aux, L3, Result).

%inserir
insert(Elem, nil, t(Elem, nil, nil)).
insert(Elem, t(Elem, L, R), t(Elem, L, R)).
insert(Elem, t(X, L, R), t(X, L2, R)) :-
    Elem < X,
    insert(Elem, L, L2), !.
insert(Elem, t(X, L, R), t(X, L, R2)) :-
	Elem > X,
    insert(Elem, R , R2), !.
