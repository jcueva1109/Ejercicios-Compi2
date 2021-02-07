%option noyywrap
%option nodefault

%{

    #include <iostream>
    #include <cstdio>
    #include <cstring>
    #include <string>
    #include "tokens.h"
    using namespace std;

    //Otra forma de hacer el line comment: "//"[^\n]* { /* Do nothing */ }

%}

EOL [\n]+
SPACE [ ]
NUMBER [0-9]+\.[0-9]+
ID [_a-zA-Z][_a-zA-Z0-9]*
Sum \+
Sub \-
Mult \*
Div \/
LeftParenthesis  \(
RightParenthesis \)
LineComment "//"[^\n]*

%x BlockComment

%%

{Div} return OpDiv;
{LineComment} {  }
"/*" {BEGIN(BlockComment);}
{ID} { yylval.ident_t = strdup(yytext); } return IDENT;
{Sum} return OpAdd;
{Mult} return OpMult;
{Sub} return OpSub;
{LeftParenthesis} return LeftParenthesis;
{RightParenthesis} return RightParenthesis;
{NUMBER} {yylval.double_t = strtod(yytext, nullptr);} return Number;
{EOL} return EOL;
{SPACE} {  } //Ignorar el espacio
. return Error;

<BlockComment>"*/" {BEGIN(INITIAL);}
<BlockComment>.|\n {  }
<BlockComment><<EOF>> {printf("Olvidaste cerrar el comentario de bloque!\n");}

%%