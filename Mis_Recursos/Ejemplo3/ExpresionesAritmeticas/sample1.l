%option noyywrap

%{

    #include <iostream>
    #include "tokens.h"
    using namespace std;

    #define yyterminate() return Token::Eof
    #define YY_DECL Token getNextToken()

%}

EOL [\n]+
SPACE [ ]+
NUMBER [0-9]+ 
ID [_a-zA-Z][_a-zA-Z0-9]*
Sum \+
Sub \-
Mult \*
Div \/
LeftParenthesis  \(
RightParenthesis \)

%%

if return Token::IfKw;
while return Token::WhileKw;
{NUMBER}  return Token::Number;
{ID} return Token::Ident;
{Sum} return Token::Sum;
{Sub} return Token::Sub;
{Mult} return Token::Mult;
{Div} return Token::Div;
{LeftParenthesis} return Token::LeftParenthesis;
{RightParenthesis} return Token::RightParenthesis;
{EOL} return Token::EOL;
{SPACE} ;
. return Token::Error;

%%