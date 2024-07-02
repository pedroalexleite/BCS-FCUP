sat(Input, Output):- findall(R, sat1(Input, R), Aux), len(Aux, Size),
    (Size == 0 -> Output = not_solvable;
                Output=Aux).

len([], Resultado):-
    Resultado is 0.
len([_|XS], Resultado):-
    len(XS, L),
    Resultado is L + 1.

sat1([], []).
sat1([[(Literal, Prefix)]], [(Literal, Prefix)]):- !.
sat1(Input, Output):-
    check_unit(Input, Caso),

    (Caso == true -> %se tem unitarios entra neste caso
    unit(Input, Unit_list),
    head(Unit_list, Unit),
    value(Unit, Aux),
    remove_literal(Aux, Input, New_clause),
    sat1(New_clause, Res),
    append([Aux], Res, Output);

  	head(Input, Clause), head(Clause, Literal), %se nao tem unitarios entra neste caso
    value(Literal, Aux),
    remove_literal(Aux, Input, New_clause),
    sat1(New_clause, Res),
    append([Aux], Res, Output)).

check_unit([], false).
check_unit([X|XS], Resultado):-
    len(X, Size), (Size == 1 -> Resultado = true;
                check_unit(XS, Resultado)).

unit([],_).
unit([X|XS], Resultado):-
    len(X, Size), (Size == 1 -> Resultado = X;
                unit(XS, Resultado)).

head([X|_], X).

value((Literal, Prefix),(Literal, Prefix)).
value((Literal, Prefix),X):- reverse(Prefix, New_Prefix),
                        X= (Literal, New_Prefix).

reverse(0,1).
reverse(1,0).

remove_literal(_, [], []).
remove_literal((Literal, Prefix), [Disj|Conj], Resultado):-
    (find((Literal,Prefix), Disj, true)->  remove_literal((Literal, Prefix), Conj, Resultado);
    reverse(Prefix, New_Prefix),
    delete(Disj, (Literal, New_Prefix), DisjList),
    (DisjList == [] -> false;
    remove_literal((Literal, Prefix), Conj, ConjList),
    append([DisjList], ConjList, Resultado))).

find(_, [], false).
find((Literal, Prefix), [(Literal1, Prefix1)|R], Resultado):-
    (Literal == Literal1, Prefix == Prefix1-> Resultado = true;
                                find((Literal, Prefix), R, Resultado)).

%(A v B) ^ (-A v -B v -C) ^ (-A v B v C)
%sat([[(a,1),(b,1)], [(a,0),(b,0),(c,0)], [(a,0),(b,1),(c,1)]], R).
%sat([[(a,1),(b,1)], [(a,0),(b,0),(c,0)],[(b,0)], [(a,0),(b,1),(c,1)]], R).
%sat([[(a,0)], [(a,1)]], R).
Escreve para Pedro Carvalho
