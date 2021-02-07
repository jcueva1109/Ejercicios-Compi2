%option noyywrap

%{

    #include <iostream>
    using namespace std;
    int num_lines = 0;
    int num_chars = 0;

%}

%%
\n ++num_lines; ++num_chars;
. ++num_chars;

%%

int main(){

    yylex();
    cout<<"Lines: "<<num_lines<<", Chars: "<<num_chars<<endl;
    return 0;

}