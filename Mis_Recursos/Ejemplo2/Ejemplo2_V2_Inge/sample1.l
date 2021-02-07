%option noyywrap

%{

    #include <iostream>
    #include "tokens.h"
    using namespace std;

%}

NUMBER [0-9]+ 
ID [_a-zA-Z][_a-zA-Z0-9]* 
EOL \n

%%

{NUMBER} return Number;
{ID}  return Ident;
{EOL} ;
.   return Error;

%%
