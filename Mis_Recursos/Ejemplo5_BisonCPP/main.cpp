#include <iostream>
#include <unordered_map>
#include <stdexcept>
#include "tokens.h"
using namespace std;

int main(){

    unordered_map<std::string, double> vars;
    Expr::Parser parser(vars);
    parser();
    
    return 0;

}