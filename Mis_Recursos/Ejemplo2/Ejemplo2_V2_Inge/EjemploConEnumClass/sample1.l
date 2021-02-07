%option noyywrap

%{

    #include <iostream>
    #include "tokens.h"
    using namespace std;

    #define yyterminate() return Token::Eof
    #define YY_DECL Token getNextToken()
    //Entonces para usar enum class Token no nos tenemos que olvidar de hacer estos define, son obligatorios
    //Y en el main, ya no utilizaremos yylex, sino que esta funcion que declaramos aqui!!

%}

NUMBER [0-9]+ 
ID [_a-zA-Z][_a-zA-Z0-9]*

%%

{NUMBER} cout<<"Token::Number, Lexema: "<<yytext<<endl;
{ID}  return Token::Ident;
[\n ]
. return Token::Error;

%%
