#ifndef __TOKENS_H__
#define __TOKENS_H__

enum class Token{

    SPACE,
    EOL ,
    IfKw,
    WhileKw,
    Number,
    Ident,
    Sum,
    Sub,
    Mult,
    Div,
    LeftParenthesis ,
    RightParenthesis,
    Error,
    Eof = 0 //No necesariamente tiene que estar = 0

};

#endif