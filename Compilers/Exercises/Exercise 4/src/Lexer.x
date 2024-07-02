{module Lexer where
}

%wrapper "basic"
$alpha = [_a-zA-Z]
$digit = [0-9]
$white = [\ \t\n\r]

tokens :-
$white+                   ;
"("                         { \_ -> LPAREN }
")"                         { \_ -> RPAREN }
"+"                         { \_ -> PLUS }
"-"                         { \_ -> MINUS }
"*"                         { \_ -> TIMES }
"/"                         { \_ -> DIV }
$digit+                     { \s -> NUM (read s) }

{data Token = NUM Float
           | LPAREN
           | RPAREN
           | PLUS
           | MINUS
           | TIMES
           | DIV
           deriving (Eq,Show)
}
