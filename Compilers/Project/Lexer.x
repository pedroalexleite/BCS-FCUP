{module Lexer where}
%wrapper "basic"
-- interface básica
-- alexScanTokens :: String -> [Token]

-- regexp definitions
$white = [\ \t\n\r]
$digit = [0-9]
$alpha = [a-zA-Z]

$alphap = [_a-zA-Z]
$hexa = [0-9a-fA-F]

tokens :-

//isto tem de ser a ultima coisa               ;
"+"                        { \_ -> TOK_PLUS }
"-"                        { \_ -> TOK_MINUS }
"*"                        { \_ -> TOK_MULTI }
"/"                        { \_ -> TOK_DIV }
"%"                        { \_ -> TOK_PERCENT }
"="                        { \_ -> TOK_EQUAL }
"<>"                       { \_ -> TOK_DIFF }
"<"                        { \_ -> TOK_SMALLER }
">"                        { \_ -> TOK_BIGGER }
"<="                       { \_ -> TOK_SMALLEREQUAL }
">="                       { \_ -> TOK_BIGGEREQUAL }
":="                       { \_ -> TOK_DEFINE }
","                        { \_ -> TOK_COMMA }
":"                        { \_ -> TOK_COLON }
";"                        { \_ -> TOK_SEMICOLON }
"("                        { \_ -> TOK_LPAREN }
")"                        { \_ -> TOK_RPAREN }
"do"                       { \_ -> TOK_DO}
"else"                     { \_ -> TOK_ELSE }
"end"                      { \_ -> TOK_END }
"function"                 { \_ -> TOK_FUNCTION }
"if"                       { \_ -> TOK_IF }
"in"                       { \_ -> TOK_IN }
"let"                      { \_ -> TOK_LET }
"then"                     { \_ -> TOK_THEN }
"var"                      { \_ -> TOK_VAR }
"while"                    { \_ -> TOK_WHILE }
"printi"                   { \_ -> TOK_PRINTI }
"scani"                    { \_ -> TOK_SCANI }
int							           { \_ -> TOK_INT }
$alpha($alphap|$digit|"_")*{ \s -> TOK_ID s }
($digit+|0[xX]$hexa+)	     { \s -> TOK_NUM (read s) }
$white+                    ;
{
 -- the token type
data Token = TOK_NUM Int
           | TOK_ID String
           | TOK_INT
           | TOK_PLUS
           | TOK_MINUS
           | TOK_MULTI
           | TOK_DIV
           | TOK_PERCENT
           | TOK_EQUAL
           | TOK_DIFF
           | TOK_SMALLER
           | TOK_BIGGER
           | TOK_SMALLEREQUAL
           | TOK_BIGGEREQUAL
           | TOK_DEFINE
           | TOK_COMMA
           | TOK_COLON
           | TOK_SEMICOLON
           | TOK_LPAREN
           | TOK_RPAREN
           | TOK_DO
           | TOK_ELSE
           | TOK_END
           | TOK_FUNCTION
           | TOK_IF
           | TOK_IN
           | TOK_LET
           | TOK_THEN
           | TOK_VAR
           | TOK_WHILE
           | TOK_SCANI
           | TOK_PRINTI
           deriving (Eq, Show)
}
