%define parse.error verbose
%parse-param { std::unordered_map<std::string, double>& vars }
%code requires {

    #include <unordered_map>
    #include <string>

}  //Esto es para que me incluya la directriz en tokens.h

%{
    
    //Codigo de C++
    #include <iostream>
    #include <stdexcept>
    #include <unordered_map>
    #include <string>
    using namespace std;

    int yylex();        //que no se me olvide esto

    void yyerror(std::unordered_map<std::string, double>& vars, const char *msg){

        throw std::runtime_error(msg);

    }

%}

%union {

    double double_t;
    char* ident_t;

}

//Declaracion de Tokens
%token OpAdd
%token OpSub
%token OpMult
%token OpDiv
%token<double_t> Number
%token LeftParenthesis
%token RightParenthesis
%token EOL
%token LineComment
%token<ident_t> IDENT
%token Error

%type<double_t>expr term factor

//Gramatica
//Añadir -,*,/,(),
//Se empieza en 1 desde la izquierda y despues del :
//Execute: bison --defines=expr_tokens.h -o expr_parser.cpp expr.y
%%    

    input: expr { cout<<"Result = "<<$1<<endl; }
         | input EOL_List expr { cout<<"Resultado = "<<$3<<endl; }
    ;

    EOL_List: EOL_List EOL {  }
            | EOL
    ;

    expr: expr OpAdd term { $$ = $1 + $3; }
        | expr OpSub term { $$ = $1 - $3; }
        | term { $$ = $1; }
    ;

    term: term OpMult factor { $$ = $1 * $3; }
        | term OpDiv factor  { $$ = $1 / $3; }
        | factor { $$ = $1; }
    ;

    factor: Number { $$ = $1; }
        | IDENT {
        
            std::string ident = $1;
            Vars[$s2]
            free($1);

        }
        | LeftParenthesis expr RightParenthesis { $$ = $2; }
    ;

%%  