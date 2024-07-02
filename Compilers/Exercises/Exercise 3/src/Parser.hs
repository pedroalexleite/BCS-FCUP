{- Example Happy parser for simple arithmetic expressions.
   Semantic actions compute the value of the expressions.
   Pedro Vasconcelos, 2021
-}

{
module Parser where
import Lexer
}

%name parser
%tokentype { Token }
%error { parseError }

%token

num       { TOK_NUM $$ }
'+'       { TOK_PLUS }
'-'       { TOK_MINUS }
'*'       { TOK_MULTI }
'/'       { TOK_DIV }
'%'       { TOK_PERCENT }
'='       { TOK_EQUAL }
'<>'      { TOK_ANGLEBRACK }
'<'       { TOK_SMALLER }
'>'       { TOK_BIGGER }
'<='      { TOK_SMALLEREQUAL }
'>='      { TOK_BIGGEREQUAL }
'&'       { TOK_AND }
'|'       { TOK_OR }
':='      { TOK_DEFINE }
','       { TOK_COMMA }
':'       { TOK_COLON }
';'       { TOK_SEMICOLON }
'('       { TOK_LPAREN }
')'       { TOK_RPAREN }
'['       { TOK_LRECTPAREN }
']'       { TOK_RRECTPAREN }
'break'   { TOK_BREAK }
'do'      { TOK_DO}
'else'    { TOK_ELSE }
'end'     { TOK_END }
'for'     { TOK_FOR }
'function'{ TOK_FUNCTION }
'if'      { TOK_IF }
'in'      { TOK_IN }
'let'     { TOK_LET }
'of'      { TOK_OF }
'then'    { TOK_THEN }
'var'     { TOK_VAR }
'while'   { TOK_WHILE }

%%

Exp : Term             { $1 }
     | Exp '+' Term    { $1 + $3 }


Term : num             { $1 }
     | '(' Exp ')'     { $2 }

{
parseError :: [Token] -> a
parseError toks = error 'parse error'
}
