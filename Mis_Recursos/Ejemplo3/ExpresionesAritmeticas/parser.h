#ifndef __PARSER_H__
#define __PARSER_H__

#include <iostream>
#include "tokens.h"
using namespace std;


Token getNextToken();
extern char* yytext;

class Parser{

    public:

        Parser(): lookahead(lookahead){  }  //Constructor
        
        void main(){

            lookahead = getNextToken();
            input();

            if(lookahead != Token::Eof){
                throw std::string("Syntax Error!");
            }else{
                std::cerr<<"Sintaxis Correcta!"<<endl;
            }
        }

    private:

        Token lookahead;

        void input();
        void stmt_list();
        void stmt_listP();
        void E();
        void EP();
        void T();
        void TP();
        void F();
        
};

#endif