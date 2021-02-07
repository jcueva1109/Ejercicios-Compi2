#include <iostream>
#include <fstream>
#include "tokens.h"
#include "parser.h"
using namespace std;

Token getNextToken();  //Prototipo de la funcion, retorna tipo Token
extern char *yytext;    //

const char* tokenToString(Token tk){

    switch(tk){
        case Token::Number: return "Number";
        case Token::Ident: return "Identifier";
        case Token::Sum: return "OpAdd";
        case Token::Sub: return "OpSub";
        case Token::Mult: return "OpMult";
        case Token::Div: return "OpDiv";
        case Token::LeftParenthesis: return "OpenParenthesis";
        case Token::RightParenthesis: return "CloseParenthesis";
        case Token::EOL: return "EOL";
        default: return "Unknown";
    }

}

int main(){

    // Token tk = getNextToken();
 
    // while(tk != Token::Eof){
        
    //     cout<<"Token: "<<tokenToString(tk) <<", Lexema: "<<yytext<<endl;
    //     tk = getNextToken();   

    // }


    Parser p;

    try{
        
        p.main();

    }catch(const std::string &e){
        
        std::cerr<<e<<endl;
    
    }

    return 0;

}