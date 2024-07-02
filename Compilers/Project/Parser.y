{
module Parser where
import Lexer
}

%name parser
%tokentype { Token }
%error { parseError }

%token
int						{ TOK_INT }
id	          { TOK_ID $$ }
num		        { TOK_NUM $$ }
while					{ TOK_WHILE }
do						{ TOK_DO }
if					  { TOK_IF }
then					{ TOK_THEN }
else				  { TOK_ELSE }
scani					{ TOK_SCANI }
printi				{ TOK_PRINTI }
var 					{ TOK_VAR }
let 					{ TOK_LET }
in 						{ TOK_IN }
end 					{ TOK_END }
function      { TOK_FUNCTION }
';'						{ TOK_SEMICOLON }
'('						{ TOK_LPAREN }
')'						{ TOK_RPAREN }
','						{ TOK_COMMA }
'>'						{ TOK_BIGGER }
'>='					{ TOK_BIGGEREQUAL }
'<'						{ TOK_SMALLER }
'<='					{ TOK_SMALLEREQUAL }
'<>'					{ TOK_DIFF }
'='						{ TOK_EQUAL }
'+'						{ TOK_PLUS }
'-'						{ TOK_MINUS }
'*'						{ TOK_MULTI }
'/'						{ TOK_DIV }
'%'						{ TOK_PERCENT }
':='				  { TOK_DEFINE }
':'					  { TOK_COLON }

-- prioridades
%right in
%left ':='
%nonassoc '<' '>' '=' '<>' '<=' '>='
%left '+' '-'
%left '*' '/' '%'
%%

Program: let Decl_list in Expr_seq      { LetP $2 $4 }
;

Decl_list :: { [Decl] }
    : Decl                              { [$1] }
    | Decl_list Decl                    { $2 : $1 }
;

Expr_seq :: { [Expr] }
    : Expr                              { [$1] }
    | Expr_seq ';' Expr                 { $3 : $1 }
;

Type_id
    : int                               { TYPE_INT }
;

Var_decl ::  { Var_decl }
    : var Var ':=' Expr                 { VarDecl $2 $4 }
;

Var_decl_list :: { [Var_decl] }
    : Var_decl                           { [$1] }
    | Var_decl_list Var_decl             { $2 : $1 }
;

Type_fields :: { [Type_field] }
    : {- Empty -}                        { [] }
    | Type_field                         { [$1] }
    | Type_fields ',' Type_field         { $3 : $1 }
;

Type_field :: { Type_field }
    : Var ':' Type_id                    { ($1, $3) }
;

Var :: { Var }
    : id                                { Var_Simple $1 }
;

Decl :: { Decl }
    : Var_decl                                                { VAR_DECL $1 }
    | function Var '(' Type_fields ')' '=' Expr               { PROC_DECL $2 $4 $7 }
    | function Var '(' Type_fields ')' ':' Type_id '=' Expr   { FUN_DECL $2 $4 $7 $9 }
;

Expr :: { Expr }
    : num                               { Num $1 }
    | Var                               { Lvalue $1 }
    | Var ':=' Expr                     { Assign $1 $3 }
    | Expr '<' Expr                     { OpExpr Less $1 $3 }
    | Expr '<=' Expr                    { OpExpr LessEqual $1 $3 }
    | Expr '>' Expr                     { OpExpr Less $3 $1 }
    | Expr '>=' Expr                    { OpExpr LessEqual $3 $1 }
    | Expr '=' Expr                     { OpExpr Equal $1 $3 }
    | Expr '<>' Expr                    { OpExpr NotEqual $1 $3 }
    | Expr '-' Expr                     { OpExpr Minus $1 $3 }
    | Expr '+' Expr                     { OpExpr Add $1 $3 }
    | Expr '*' Expr                     { OpExpr Times $1 $3 }
    | Expr '/' Expr                     { OpExpr Div $1 $3 }
    | Expr '%' Expr                     { OpExpr Mod $1 $3 }
    | if Expr then Expr                 { If $2 $4 }
    | if Expr then Expr else Expr       { IfE $2 $4 $6 }
    | while Expr do Expr                { While $2 $4 }
    | let Var_decl_list in Expr_seq end { Let $2 $4 }
    | printi '(' Expr ')'               { Printi $3 }
    | scani '(' ')'                     { Scani }
;

{
parseError :: [Token] -> a
parseError toks = error "parse error"
}
