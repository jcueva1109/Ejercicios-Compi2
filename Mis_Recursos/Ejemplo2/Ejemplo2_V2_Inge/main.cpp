#include <iostream>
#include <fstream>
#include "tokens.h"
using namespace std;

Token yylex();  //Prototipo de la funcion, retorna tipo Token
extern char *yytext;    //

//Convertimos el token a string
const char *tokenToString(Token tk){

    switch(tk){
        case Number: return "Number";
        case Ident: return "Identifier";
        default: return "Unkown";
    }

}

int main(){

    Token tk = yylex();
 
    while(tk != Eof){
        
        cout<<"Token: "<<tokenToString(tk) <<", Lexema: "<<yytext<<endl;
        tk = yylex();   

    }

}