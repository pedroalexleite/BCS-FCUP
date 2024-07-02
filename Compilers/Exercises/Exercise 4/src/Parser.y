{
module Parser where
import Lexer
}

%name parser
%tokentype { Token }
%error { parseError }

%token

num       { TOK_NUM $$ }
id        { TOK_ID $$}
int       { TOK_INT $$ }
'+'       { TOK_PLUS }
'-'       { TOK_MINUS }
'*'       { TOK_MULTI }
'/'       { TOK_DIV }
'%'       { TOK_PERCENT }
'='       { TOK_EQUAL }
'<>'      { TOK_DIFF }
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

-- Prioridade de baixo para cima, primeiro '*' '/' '%', depois '+' '-', ...
%left ':='
%nonassoc '<' '>' '=' '<>' '<=' '>='
%left '+' '-'
%left '*' '/' '%'
%%

Program : let Decl_list in Expr_seq end { LetP $2 $4 }
;

Decl_list : Decl                        { [$1] }
          | Decl_list Decl              { $1 : $2 }
;

Decl : Var_decl                         { VAR_DECL $1 }
     | Fun_decl                         { FUN_DECL $1 }
;

Fun_decl : function id '(' Type_fields ')' '=' Expr             { FunDecl $2 $4 $7 }
         | function id '(' Type_fields ')' ':' Type_id '=' Expr { FunDeclR $2 $4 $7 $9 }
;

Type_fields:{- empty -}                     { [] }
           | Type_field                     { [$1] }
           | Type_fields ',' Type_field     { $3 : $1 }
;

Type_field: id ':' Type_id                  { $3 $1 }
;

Lvalue : id                             { $1 }
;

Expr_seq : {- empty -}                  { [] }
         | Expr                         { [$1] }
         | Expr_seq ';' Expr            { $1 : $3 }
;

Expr_list : {- empty -}                  { [] }
          | Expr                         { [$1] }
          | Expr_list ',' Expr           { $3 : $1 }
;

Var_decl: var id ':=' Expr              { VarDecl $2 $4 }
;

Var_decl_list: Var_decl                 { [$1] }
             | Var_decl_list Var_decl   { $2 : $1 }
;

Type_id: int                            { $1 }
;

Expr : num                              { $1 }
    | Lvalue                            { $1 }
    | '-' Expr                          { () }
    | Lvalue ':=' Expr                  { Assign $1 $3 }
    | Expr '<' Expr                     { Less $1 $3 }
    | Expr '<=' Expr                    { Lesseq $1 $3 }
    | Expr '>' Expr                     { Less $3 $1 }
    | Expr '>=' Expr                    { Lesseq $3 $1 }
    | Expr '=' Expr                     { Eq $1 $3 }
    | Expr '<>' Expr                    { NotEq $1 $3 }
    | Expr '+' Expr                     { Add $1 $3 }
    | Expr '-' Expr                     { Minus $1 $3 }
    | Expr '*' Expr                     { Times $1 $3 }
    | Expr '/' Expr                     { Div $1 $3 }
    | Expr '%' Expr                     { Mod $1 $3 }
    | id ':=' Expr                      { Assign $1 $3 }
    | if Expr then Expr                 { If $2 Then $4 }
    | if Expr then Expr else Expr       { If $2 Then $4 Else $6 }
    | while Expr do Expr                { While $2 Do $4 }
    | let var_decl_list in Expr_seq end { Let $2 $4 }
    | printi '(' Expr ')'               { Printi Brace $1 }
    | scani '(' ')'                     { Scani }
;

{
data Program = LetP [Decl] [Expr]
            deriving Show

data Expr = num Int
          | Add Expr Expr
          | Minus Expr Expr
          | Times Expr Expr
          | Div Expr Expr
          | Lvalue Id
          | Mod Expr Expr
          | Less Expr Expr
          | Lesseq Expr Expr
          | Eq Expr Expr
          | NotEq Expr Expr
          | Assign Id Expr
          | If Expr Then Expr
          | If Expr Then Expr Else Expr
          | While Expr Do Expr
          | Let [Var_Decl] [Expr]
          | Printi Expr
          | Scani
          deriving Show
--?
data Id = id String
        deriving Show
--?
data Decl_list = Decl_list [Decl]
               | Decl
               deriving Show

data Decl = VAR_DECL Var_decl
          | FUN_DECL Fun_decl
          deriving Show

data Fun_decl = FunDecl Id Type_fields Expr
              | FunDeclR Id Type_fields Type_id Expr
              deriving Show

data Type_fields = Type_field
                 | Type_fields Type_field
                deriving Show

data Type_field = Type_id Id
                deriving Show

data Expr_seq = Expr
              | Expr_seq Expr
              deriving Show

data Expr_list = Expr
               | Expr_list  Expr
              deriving Show

data Var_decl = Var Id Expr
              deriving Show

data Var_decl_list = Var_decl_list [Var_decl]
                   deriving Show

data Type_id = Int
             deriving Show

parseError :: [Token] -> a
parseError toks = error 'parse error'
}
