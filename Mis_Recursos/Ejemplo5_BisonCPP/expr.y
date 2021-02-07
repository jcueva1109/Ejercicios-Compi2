%language "c++"
%define parse.error verbose
%define api.value.type variant

%define api.parser.class { Parser }
%define api.parser.namespace { Expr }

%parse-param { std::unordered_map<std::string, int>& vars }

%token<int> Number
%token<std::string> Ident
%type<int> expr term factor

%code requires{

    #include <unordered_map>
    #include <string>

}

%{

    #include <iostream>
    #include <stdexcept>
    #include <unordered_map>
    #include <string>
    using namespace std;

    int yylex(Expr::Parser::semantic_type **yylval);

%}

namespace Expr{

    void Parser::error(const std::sring& msg){
        throw std::runtime_error(msg);
    }

}

%token OpAdd
%token OpSub
%token OpMul
%token OpDiv
%token LParenthesis
%token RParenthesis
%token<int> Number
%token<std::string> Ident
%token EOL
%token LineComment
%token BlockComment
%token Error

%%

    input: EOL_List input EOL_List expr { cout<<"Resultado = "<<$4<<endl; }
        |  expr { cout<<"Resultado = "<<$1<<endl; }
    ;
    
    EOL_List: EOL_List EOL {  }
            | EOL
    ;

    expr: expr OpAdd term { $$ = $1 + $3; }
        | expr OpSub term { $$ = $1 - $3; }
        | term { $$ = $1; }
    ;

    term: term OpMul factor { $$ = $1 * $3; }
        | term OpDiv factor { 

            if($3 == 0){
                throw std::string("Error: No se puede dividir entre 0!\n");
            }else{
                $$ = $1 / $3;
            }

        }
        | factor { $$ = $1; }
    ;

    factor: Number { $$ = $1; }
        | Ident{

            std::string ident = $1;
            vars[$2];
            free($1);

        }
        | LParenthesis expr RParenthesis { $$ = $2; }
    ;

%%