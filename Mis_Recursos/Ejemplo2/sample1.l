%option noyywrap

%{

    #include <iostream>
    using namespace std;

%}

NUMBER [0-9]+ 
ID [_a-zA-Z]+[_a-zA-Z0-9]* 
EOL \n

%%

{NUMBER} cout<<"Token::Number, Lexema: "<<yytext<<endl;
{ID} cout<<"Token::ID, Lexema: "<<yytext<<endl;
{EOL} ;
.   ;

%%

int main(){

    yylex();
    return 0;

}