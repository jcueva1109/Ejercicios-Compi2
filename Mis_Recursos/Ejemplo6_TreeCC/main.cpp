#include <iostream>
#include <unordered_map>
#include <stdexcept>
#include "tokens.h"
//#include "expr.h"
using namespace std;

int main(){

    try{

        unordered_map<std::string, double> vars;
        Expr::Parser parser(vars);
        parser();

    }catch(runtime_error &e){
        cout<<e.what()<<endl;
    }
    
    return 0;

}