#ifndef __TOKENS_H__
#define __TOKENS_H__

//No es un class, por que flex retorna un int
//Un enum class no se puede castear a int
enum Token{

    Number,
    Ident,
    Error,
    Eof = 0

};

#endif