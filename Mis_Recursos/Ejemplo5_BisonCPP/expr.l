%option noyywrap
%option nodefault
%option yylineno

%{

    #include <iostream>
    #include <cstdio>
    #include <cstring>
    #include "tokens.h"
    using namespace std;

    #define YY_DECL double yylex(Expr::Parser::semantic_type *yylval)

%}

%x BlockComment

%%

"//"[^\n]* return Expr::Parser::token::LineComment;
"/*" {BEGIN(BlockComment);}
[\n]+ return Expr::Parser::token::EOL;
[ ] ;
"+" return Expr::Parser::token::OpAdd;
"-" return Expr::Parser::token::OpSub;
"*" return Expr::Parser::token::OpMul;
"/" return Expr::Parser::token::OpDiv;
"(" return Expr::Parser::token::LParenthesis;
")" return Expr::Parser::token::RParenthesis;
[0-9]+("."[0-9]+)? { yylval->emplace<double>(atof(yytext));  return Expr::Parser::token::Number; }
[_a-zA-Z][_a-zA-Z0-9]* { yylval->emplace<std::string> (yytext, yyleng);  return Expr::Parser::token::Ident; }
. return Expr::Parser::token::Error;

<BlockComment>"*/" {BEGIN(INITIAL);}
<BlockComment>.|\n {  }
<BlockComment><<EOF>> { printf("Olvidaste cerrar el comentario de bloque!\n"); }

%%