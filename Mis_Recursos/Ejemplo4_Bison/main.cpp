#include <iostream>
#include <fstream>
#include "tokens.h"
using namespace std;

int main(){

    std::unordered_map<std::string, double> vars;
    vars.emplace("x",10.5);
    vars.emplace("y",20.34);

    try{

        yyparse(vars);

    }catch(const runtime_error& error){
        
        cout << error.what() <<endl;
    
    }

}