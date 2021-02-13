
/* Esto es en el bison file

%language "c++"

%define parse.error verbose //Para que los mensajes de error sean mas descriptivos

%define api.value.type variant

%define api.parser.class {Parser}
%define api.parser.namespace {Expr}
//Estas dos lineas generan una clase Parser
//En otras palabras hacemos: Expr::Parser

%parse-param { std::unordered_map<std::string, int>& vars }

%token<int> NUMBER
%token<std::string> IDENT    
%type<int> expr term factor

Ya no hay mas yyerror, sino que cambia por: 
namespace Expr{

    void Parser::error(const std::string& msg){
        throw std::runtime_error(msg);
    }

}

*/

int yylex(Expr::Parser::semantic_type **yylval)

/* Esto es en el lexer

    ID { yylval->emplace<std::string (yytext, yyleng); }
    NUMBER { yylav->emplace<int>(atoi(yytext)); }


*/

/* Esto es en el main 

    std::unordered_map<std::string, int>& vars;
    Expr::Parser parser(vars);
    parser();

*/

