#include <iostream>
#include <fstream>
#include "tokens.h"
using namespace std;

Token getNextToken();  //Prototipo de la funcion, retorna tipo Token
extern char *yytext;    //

//Convertimos el token a string
const char *tokenToString(Token tk){

    switch(tk){
        case Token::Number: return "Number";
        case Token::Ident: return "Identifier";
        default: return "Unkown";
    }

}

int main(){

    Token tk = getNextToken();
 
    while(tk != Token::Eof){
        
        cout<<"Token: "<<tokenToString(tk) <<", Lexema: "<<yytext<<endl;
        tk = getNextToken();   

    }

}