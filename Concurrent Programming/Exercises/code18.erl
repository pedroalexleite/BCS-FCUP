-module(praticaErlang1).
-export([start/0, area/2, loop/0]).

% Escreva uma função start que chama spawn para criar um novo processo
start() -> spawn(praticaErlang1, loop, []).
%start() -> (fun() -> loop end).
area(Pid, What) ->
    rpc(Pid, What).
rpc(Pid, Request) ->
    Pid ! {self(), Request},
    receive
	{Pid, Response} ->
	    Response
    end.

% Acrescente o calculo da área do circulo e uma mensagem de erro {error, Outra} para Outra mensgem errada
loop() ->
    receive
	{From, {rectangle, Width, Ht}} ->
	    From ! {self(), Width * Ht},
	    loop();
	{From, {circle, R}} ->
	    From ! {self(), R*R*math:pi()},
      loop();
	{From, Other} ->
	    From ! {self(), {error, Other}},
      loop() %o último  não precisa de ";"
    end.

%Pid = praticaErlang1:start().
%praticaErlang1:area(Pid, {circle, 1}).
