:- discontiguous father/2, female/1, husband/2.

grandpareent(X,Y) :-
        father(X,Z),
        father(Z,Y).

ancestor(X,Y) :-
    father(X,Y).
ancestor(X,Z) :-
    father(X,Y),
    ancestor(Y,Z).

husband(arthur, beryl).
father(arthur, carol).
father(arthur, david).
father(arthur, elaine).
father(arthur, frank).

female(beryl).

female(carol).

female(elaine).

husband(frank, glenda).
father(frank, linda).
father(frank, malcolm).

female(glenda).

female(helen).

husband(ian, natalie).
father(ian, oscar).

husband(john, katherine).
father(john, glenda).
father(john, helen).
father(john, ian).

female(katherine).

female(linda).

female(natalie).

husband(paul, linda).
father(paul, quentin).
father(paul, robert).

husband(stephen, carol).
father(stephen, tom).
father(stephen, ursula).
father(stephen, violet).

female(ursula).

female(violet).

husband(william, violet).
father(william, xavier).

female(yvonne).

husband(zaccharia, yvonne).
father(zaccharia, william).
