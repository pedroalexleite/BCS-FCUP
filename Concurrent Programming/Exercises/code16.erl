-module(praticaErlang1).
-export([start/0, area/2, loop/0]).

% Escreva uma função start que chama spawn para criar um novo processo
% pid identifica o processo
start() -> Pid = spawn(praticaErlang1, loop, []).

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
	    From ! {self(), R * 3.14 * 3.14},
      loop();
	{From, Other} ->
	    From ! {self(), {Error: not defined, Other}}
      loop();
    end.

% Novo ficheiro -module(math_server).
  -export([start/0,conc_factorial/2,status/1,stop/1]).

  %1)

  compute_factorial(N)  %função factorial

  loop() ->
     receive
           % comando factorial
        {factorial, From, M} ->
    end.

  start() ->
      spawn(...).


  factorial(Server, M) ->
     % enviar um request ao server
     Server ! {...}, % espera pela resposta e retorna-a
     receive {response, Result} -> Result end.


  %2)

  %loop(N), N é um contador de requests
   loop(N) ->
      receive
            % comando factorial
         {factorial, From, M} ->
            ......., loop(N+1); % no fim incrementa o N
         % comando status do server - retorna o N
         {status, From} ->
            From ! {response, N},
            loop(N); % não incrementa o N, pois só conta o numero de factoriais
         % comando stop
         {stop, From} ->
            ok
      end.

    stop(Server) ->
      Server ! {stop, self()},
      ok.

    status(Server) ->
       %enviar um request ao server
       Server ! {status, self()},
       %espera pela resposta e retorna-a
       receive {response, Result} -> Result end.


  %3)
  %Altere as funções anteriores para ter vários clientes, como exemplo, a nova função de pedido de status é:

  status(Server) ->
     Ref = make_ref(), % função buit-in que gera uma nova referência
     %o cliente Ref envia um pedido ao server
     Server ! {status, self(), Ref},
     % espera pela resposta e retorna-a
     receive {response, Ref, Result} -> Result end

     loop(N) -> receive
        receive
              % comando factorial
           {factorial, From, Ref, M} ->
              .......,loop(N+1);
              % comando status
           {status, From, Ref} ->
              From ! {response, Ref, N},
              loop(N);
           {stop, From, Ref} ->
             ok
     end.
