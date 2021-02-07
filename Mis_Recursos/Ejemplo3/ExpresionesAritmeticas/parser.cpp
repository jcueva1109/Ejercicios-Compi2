#include <iostream>
#include "parser.h"
#include <string>
using namespace std;

void Parser::input(){

    stmt_list();

}

void Parser::stmt_list(){

    E();
    stmt_listP();

}

void Parser::stmt_listP(){

    if(lookahead == Token::EOL){
        
        lookahead = getNextToken();
        E();
        stmt_listP();


    }else{
        //%epsilon
    }

}

void Parser::E(){

    T();
    EP();

}

void Parser::EP(){

    if(lookahead == Token::Sum){
        
        lookahead = getNextToken();
        T();
        EP();

    }else if(lookahead == Token::Sub){

        lookahead = getNextToken();
        T();
        EP();

    }else{
        //%epsilon
    }

}

void Parser::T(){

    F();
    TP();

}

void Parser::TP(){

    if(lookahead == Token::Mult){

        lookahead = getNextToken();
        F();
        TP();

    }else if(lookahead == Token::Div){

        lookahead = getNextToken();
        F();
        TP();

    }else{
        //%epsilon
    }

}

void Parser::F(){

    if(lookahead == Token::Ident){

        lookahead = getNextToken();

    }else if(lookahead == Token::Number){

        lookahead = getNextToken();

    }else if (lookahead == Token::LeftParenthesis){

        lookahead = getNextToken();
        E();

        if(lookahead != Token::RightParenthesis){
            throw std::string("Error: Se esperaba un )");
        }

        lookahead = getNextToken();

    }else{

        throw std::string("Uy! Ocurrio un error en algun lugar. Pero no te preocupes, no es tu culpa!");

    }


}