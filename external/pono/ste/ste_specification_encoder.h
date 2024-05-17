#include <iostream>
#include "smt-switch/smt.h"
#include "core/ts.h"
#include <cstdlib>
#include <fstream>
#include <ctime>
#include <iostream>
#include <sstream>
#include "smt/available_solvers.h"
#include "core/fts.h"
#include "core/prop.h"
#include "frontends/btor2_encoder.h"
// #include "engines/ste.h"
#include "utils/str_util.h"
#include "map"
#include "engines/ste.h"
// #include "ste/formula_compiler.cpp"
 
using namespace std;
using namespace smt;
using namespace pono;

class SteSpecificationEncoder {
  public:
     void test();
    SteSpecificationEncoder();
    SteSpecificationEncoder(string buildPath,string modName);
    void convertVerilog2Btor2(string buildPath, string modName);
    void loadSteSpec(string assertFilePath,string btor2FilePath,
                     string resultPath,string buildPath);
    Term nodeStr2BV(FunctionalTransitionSystem fts,string node_str);
    Term valStr2BV(string value_str, Term node);
  private:
    int a;
    SmtSolver s;
    // FunctionalTransitionSystem fts;
    string modName;
    string buildPath ;
    string resultPath ;
    string btor2Path ;
    string assertPath ;
    clock_t initial_time = clock();
    
};

