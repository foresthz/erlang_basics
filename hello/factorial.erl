#!/usr/bin/env escript
%% -*- erlang -*-
%%! -smp enable -sname factorial -mnesia debug verbose


main([String]) ->
    try
        io:format("get input variable ~s ... ~n", [String]),
        N = list_to_integer(String),
        F = fac(N),
        % could not add dot to the following line
        io:format("factorial ~w = ~w\n", [N,F])
    catch
        _:_ ->
            usage()
    end;

main(_) ->
    usage().

hello() ->
    io:format("hello: ~s~n", ["HELLO_FUNCTION"]).

print_msg(Val) ->
    % canot use variable in fwrite?
    % io:fwrite("msg: ~s~n", [val]).
    io:format("msg: ~s~n", [Val]).

usage() ->
    % comma(,) cannot be replaced by dot(.)
    io:format("usage: factorial integer\n"),
    io:format("Hello World. with new line. ~n"),
    io:fwrite("Hello world! ~s~n", ["forest"]),
    print_msg('this is message ...  ### ### ###'),
    hello(),
    hello(),
    halt(1),
    % will not be executed after halt function.
    hello().


fac(0) -> 1;
fac(N) -> N * fac(N-1).
