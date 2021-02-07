%option noyywrap
%option nodefault

%{

    #include <iostream>
    #include <cstdio>
    #include <cstring>
    #include "tokens.h"
    using namespace std;

%}

%x BlockComment

%%

"//"[^\n]* return LineComment;
"/*" {BEGIN(BlockComment);}
[\n]+ return EOL;
[ ] ;       //Ignorar espacios
"+" return OpAdd;
"-" return OpSub;
"*" return OpMul;
"/" return OpDiv;
"(" return LParenthesis;
")" return RParenthesis;
[_a-zA-Z][_a-zA-Z0-9]* { yylval->emplace<std::string (yytext, yyleng); } return Ident;
[0-9]+ { yylav->emplace<int>(atoi(yytext)); } return Number;       //Numeros enteros
. return Error;

<BlockComment>"*/" {BEGIN(INITIAL);}
<BlockComment>.|\n {  }
<BlockComment><<EOF>> { printf("Olvidaste cerrar el comentario de bloque!\n"); }

%%