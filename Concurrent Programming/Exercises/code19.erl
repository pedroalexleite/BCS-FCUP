-module(trab1).
-export([start/0, loop/1, stop/1, status/1, add/3, sub/3, mul/3, pol_cal/1, cal_add/2, cal_sub/2, cal_mul/2, neg/1, pol_mul/2, aux/1]).

start() -> spawn(trab1, loop, [0]).
loop(N) ->
        receive
            {add, From, Var1, Var2} ->
              From ! {self(), cal_add(Var1, Var2)},
              loop(N+1);
            {sub, From, Var1, Var2} ->
              From ! {self(), cal_sub(Var1, Var2)},
              loop(N+1);
            {mul, From, Var1, Var2} ->
              From ! {self(), cal_mul(Var1, Var2)},
              loop(N+1);
            {status, From} ->
               From ! {response, N},
               loop(N);
            {stop, From} ->
               {From, ok}
            end.

stop(Server) ->
  Server ! {stop, self()},
  ok.

status(Server) ->
  Server ! {status, self()},
  receive {response, Result} -> Result end.

add(Server, Var1, Var2) ->
  Server ! {add, self(), Var1, Var2},
  receive {Server, Result} -> Result end.

sub(Server, Var1, Var2) ->
  Server ! {sub, self(), Var1, Var2},
  receive {Server, Result} -> Result end.

mul(Server, Var1, Var2) ->
  Server ! {mul, self(), Var1, Var2},
  receive {Server, Result} -> Result end.

pol_cal([]) -> []; % lista vazia
pol_cal([T]) -> [T]; % lista com só 1 termo
pol_cal([{A,Cof1},{A,Cof2}|T]) -> pol_cal([{A,Cof1+Cof2}|T]); % mesma variável e expoente
pol_cal([{A,Cof1},{B,Cof2}|T]) -> lists:append([{A,Cof1}], pol_cal([{B,Cof2}|T])). % diferente expoente e/ou variavel

neg([]) -> [];
neg([{A,Cof1}|T]) -> lists:append([{A,-Cof1}], neg(T)).

cal_add(Var1, Var2) ->
  Exp = lists:append(Var1, Var2),
  pol_cal(lists:keysort(1, Exp)).

cal_sub(Var1, Var2) ->
  Exp = lists:append(Var1, neg(Var2)),
  pol_cal(lists:keysort(1, Exp)).

pol_mul([{A,Cof1}],[{B,Cof2}]) -> [{aux(lists:keysort(1,lists:append(A,B))),Cof1*Cof2}];
pol_mul([{A,Cof1}],[{B,Cof2}|T]) -> lists:append([{aux(lists:keysort(1,lists:append(A,B))),Cof1*Cof2}], pol_mul([{A,Cof1}],T));
pol_mul([{A,Cof1}|X],[{B,Cof2}|T]) -> lists:append(pol_mul([{A,Cof1}],[{B,Cof2}|T]), pol_mul(X,[{B,Cof2}|T])).

aux([]) -> [];
aux([T]) -> [T];
aux([{A,B},{A,C}|T]) -> lists:append([{A,B+C}], aux(T));
aux([{A,B},{C,D}|T]) -> lists:append([{A,B}], aux([{C,D}|T])).

cal_mul(Var1, Var2) ->
  pol_cal(pol_mul(Var1,Var2)).
  %io:fwrite("~w~n",[Exp]),

%erl / ctr+g -> q
%c(trab1).
%Pid = trab1:start().
%trab1: add (Pid,[{[{x,2}],3}],[{[{x,2}],4}]).
%trab1: sub (Pid, [{[{x,2}],3}] , [{[{x,2}],4}]).
%trab1: mul (Pid, [{[{x,2}],3}] , [{[{y,1}],4}]).
