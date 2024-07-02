%wrapper "basic"
-- interface básica
-- alexScanTokens :: String -> [Token]

-- regexp definitions
$white = [\ \t\n\r]
$digit = [0-9]

tokens :-

$white+                    ;  -- skip whitespace
$digit+                    { \s -> TOK_NUM (read s) }
"+"                        { \s -> TOK_PLUS }
"-"                        { \s -> TOK_MINUS }
"*"                        { \s -> TOK_MULTI }
"/"                        { \s -> TOK_DIV }
"%"                        { \s -> TOK_PERCENT }
"="                        { \s -> TOK_EQUAL }
"<>"                       { \s -> TOK_ANGLEBRACK }
"<"                        { \s -> TOK_SMALLER }
">"                        { \s -> TOK_BIGGER }
"<="                       { \s -> TOK_SMALLEREQUAL }
">="                       { \s -> TOK_BIGGEREQUAL }
"&"                        { \s -> TOK_AND }
"|"                        { \s -> TOK_OR }
":="                       { \s -> TOK_DEFINE }
","                        { \s -> TOK_COMMA }
":"                        { \s -> TOK_COLON }
";"                        { \s -> TOK_SEMICOLON }
"("                        { \s -> TOK_LPAREN }
")"                        { \s -> TOK_RPAREN }
"["                        { \s -> TOK_LRECTPAREN }
"]"                        { \s -> TOK_RRECTPAREN }
"break"                    { \s -> TOK_BREAK }
"do"                       { \s -> TOK_DO}
"else"                     { \s -> TOK_ELSE }
"end"                      { \s -> TOK_END }
"for"                      { \s -> TOK_FOR }
"function"                 { \s -> TOK_FUNCTION }
"if"                       { \s -> TOK_IF }
"in"                       { \s -> TOK_IN }
"let"                      { \s -> TOK_LET }
"of"                       { \s -> TOK_OF }
"then"                     { \s -> TOK_THEN }
"var"                      { \s -> TOK_VAR }
"while"                    { \s -> TOK_WHILE }
{
 -- the token type
data Token = TOK_NUM Int
           | TOK_PLUS
           | TOK_MINUS
           | TOK_MULTI
           | TOK_DIV
           | TOK_PERCENT
           | TOK_EQUAL
           | TOK_ANGLEBRACK
           | TOK_SMALLER
           | TOK_BIGGER
           | TOK_SMALLEREQUAL
           | TOK_BIGGEREQUAL
           | TOK_AND
           | TOK_OR
           | TOK_DEFINE
           | TOK_COMMA
           | TOK_COLON
           | TOK_SEMICOLON
           | TOK_LPAREN
           | TOK_RPAREN
           | TOK_LRECTPAREN
           | TOK_RRECTPAREN
           | TOK_DO
           | TOK_ELSE
           | TOK_END
           | TOK_FOR
           | TOK_FUNCTION
           | TOK_IF
           | TOK_IN
           | TOK_LET
           | TOK_OF
           | TOK_THEN
           | TOK_VAR
           | TOK_WHILE
           deriving (Eq, Show)
}
