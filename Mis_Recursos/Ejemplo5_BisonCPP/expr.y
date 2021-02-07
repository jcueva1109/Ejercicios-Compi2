%language "c++"
%define parse.error verbose
%define api.value.type variant

%define api.parser.class { Parser }
%define api.namespace { Expr }

%parse-param { std::unordered_map<std::string, double>& vars }

// %token<int> Number
// %token<std::string> Ident

%code requires{

    #include <unordered_map>
    #include <string>

}

%{

    #include <iostream>
    #include <stdexcept>
    #include <unordered_map>
    #include <string>
    #include "tokens.h"
    using namespace std;

    double yylex(Expr::Parser::semantic_type *yylval);

    namespace Expr{

        void Parser::error(const std::string& msg){
            throw std::runtime_error(msg);
        }

    }

%}


%token OpAdd
%token OpSub
%token OpMul
%token OpDiv
%token LParenthesis
%token RParenthesis
%token PrintKw
%token OpAssign
%token<double> Number
%token<std::string> Ident
%token EOL
%token LineComment
%token BlockComment
%token Error

%type<double> expr term factor

// expr { cout<<"Resultado = "<<$1<<endl; }
//         |  input EOL_List expr { cout<<"Resultado = "<<$3<<endl; }  
//     ;

%%

    

    input: EOL_List stmt_list EOL_List;

    stmt_list: stmt_list EOL_List stmt
            | stmt  
    ;

    stmt: PrintKw expr    { cout<<$2<<endl; }
        | Ident OpAssign expr  { vars.emplace($1,$3); }
        | expr { cout<<"Resultado = "<<$1<<endl; }
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
                throw runtime_error("Error: No se puede dividir entre 0!\n");
            }else{
                $$ = $1 / $3;
            }

        }
        | factor { $$ = $1; }
    ;

    factor: Number { $$ = $1; }
        | Ident{

            $$ = vars.at($1);

        }
        | LParenthesis expr RParenthesis { $$ = $2; }
    ;

%%