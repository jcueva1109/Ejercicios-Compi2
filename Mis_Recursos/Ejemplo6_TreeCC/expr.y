%language "c++"
%define parse.error verbose
%define api.value.type variant

%define api.parser.class { Parser }
%define api.namespace { Expr }

%parse-param { std::unordered_map<std::string, double>& vars }

%code requires{

    #include <unordered_map>
    #include <string>
    #include "treecc.h"

}

%{

    #include <iostream>
    #include <stdexcept>
    #include <unordered_map>
    #include <string>
    #include "tokens.h"
    #include "treecc.h"
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
%token<std::string> String
%token EOL
%token LineComment
%token BlockComment
%token Error

%type<AST::Expr*> expr term factor

%%

    input: EOL_List stmt_list EOL_List;

    stmt_list: stmt_list EOL_List stmt
            | stmt  
    ;

    stmt: PrintKw expr    { cout<<AST::eval($2)<<endl; }
        | expr { cout<<"Resultado = "<<AST::eval($1)<<endl; }
    ;
    
    EOL_List: EOL_List EOL {  }
            | EOL
            | 
    ;

    expr: expr OpAdd term { $$ = new AST::AddExpr($1,$3); }
        | expr OpSub term { $$ = new AST::SubExpr($1,$3); }
        | term { $$ = $1; }
    ;

    term: term OpMul factor { $$ = new AST::MulExpr($1,$3); }
        | term OpDiv factor { 
            $$ = new AST::DivExpr($1,$3);
        }
        | factor { $$ = $1; }
    ;

    factor: Number { $$ = new AST::NumExpr($1); }
        | LParenthesis expr RParenthesis { $$ = $2; }
    ;

%%