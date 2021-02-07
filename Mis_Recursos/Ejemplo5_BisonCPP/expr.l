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

"print" return Expr::Parser::token::PrintKw;
"//"[^\n]* ;        // Line Comment
"/*" {BEGIN(BlockComment);} // Block Comment
[\n]+ return Expr::Parser::token::EOL;
[ ] ;
[_a-zA-Z][_a-zA-Z0-9]* { yylval->emplace<std::string> (yytext, yyleng);  return Expr::Parser::token::Ident; }
\(?\"[a-zA-Z ]+\"\)? { yylval->emplace<std::string> (yytext, yyleng);  return Expr::Parser::token::String; }
[0-9]+("."[0-9]+)? { yylval->emplace<double>(atof(yytext));  return Expr::Parser::token::Number; }
"+" return Expr::Parser::token::OpAdd;
"-" return Expr::Parser::token::OpSub;
"*" return Expr::Parser::token::OpMul;
"/" return Expr::Parser::token::OpDiv;
"(" return Expr::Parser::token::LParenthesis;
")" return Expr::Parser::token::RParenthesis;
"=" return Expr::Parser::token::OpAssign;
. return Expr::Parser::token::Error;

<BlockComment>"*/" {BEGIN(INITIAL);}
<BlockComment>.|\n {  }
<BlockComment><<EOF>> { printf("Olvidaste cerrar el comentario de bloque!\n"); }

%%