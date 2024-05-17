/*********************                                                        */
/*! \file
** \verbatim
** Top contributors (to current version):
**   Makai Mann, Ahmed Irfan
** This file is part of the pono project.
** Copyright (c) 2019 by the authors listed in the file AUTHORS
** in the top-level source directory) and their institutional affiliations.
** All rights reserved.  See the file LICENSE in the top-level source
** directory for licensing information.\endverbatim
**
** \brief
**
**
**/

#include <csignal>
#include <iostream>
#include <sstream>

#include "assert.h"

#ifdef WITH_PROFILING
#include <gperftools/profiler.h>
#endif

#include "smt-switch/boolector_factory.h"
#ifdef WITH_MSAT
#include "smt-switch/msat_factory.h"
#endif

#include "core/fts.h"
#include "engines/bmc.h"
#include "engines/ste.h"
#include "frontends/btor2_encoder.h"
#include "frontends/smv_encoder.h"
#include "frontends/vmt_encoder.h"
#include "map"
#include "modifiers/control_signals.h"
#include "modifiers/mod_ts_prop.h"
#include "modifiers/prop_monitor.h"
#include "modifiers/static_coi.h"
#include "options/options.h"
#include "printers/btor2_witness_printer.h"
#include "printers/vcd_witness_printer.h"
#include "smt-switch/logging_solver.h"
#include "smt/available_solvers.h"
// #include "ste/formula_compiler.cpp"
#include "ste/ste_specification_encoder.h"
#include "utils/logger.h"
#include "utils/make_provers.h"
#include "utils/str_util.cpp"
#include "utils/timestamp.h"
#include "utils/ts_analysis.h"
// #include <format>
#include <cstdlib>
// #include "printers/vcd_witness_printer.h"
using namespace pono;
using namespace smt;
using namespace std;

void test()
{
  logger.set_verbosity(4);
  SmtSolver s = create_solver(smt::BTOR);
  s->set_opt("incremental", "true");
    auto AND = [s](Term a, Term b) { return s->make_term(And, a, b); };
  auto ANDV = [s](vector<Term> v) { return s->make_term(And, v); };
  auto OR = [s](Term a, Term b) { return s->make_term(Or, a, b); };
  auto NOT = [s](Term a) { return s->make_term(Not, a); };
  auto IMPLY = [s](Term a, Term b) { return s->make_term(Implies, a, b); };
  auto EQUAL = [s](Term a, Term b) { return s->make_term(Equal, a, b); };
  auto x1 = s->make_symbol("x1", s->make_sort(BV, 1));
  auto x2 = s->make_symbol("x2", s->make_sort(BV, 1));
  auto y = s->make_symbol("y", s->make_sort(BV, 4));
  auto z1 = s->make_symbol("z1", s->make_sort(BV, 4));
  auto z2 = s->make_symbol("z2", s->make_sort(BV, 4));
  auto c = s->make_term(4,y->get_sort());
  //x -> y=z
  auto f1 = s->make_term(Implies,AND(x1,x2),s->make_term(Equal,y,z1));
  auto f2 = s->make_term(Implies,AND(x1,NOT(x2)),s->make_term(Equal,y,z1));
  auto f3 = s->make_term(And,f1,f2);
  auto f = AND(f3,AND(x1,x2));

}

void ste_mult()
{
  logger.set_verbosity(4);
  SmtSolver s = create_solver(smt::BTOR);
  s->set_opt("incremental", "true");
  FunctionalTransitionSystem fts(s);
  string filename = ("/root/SteBmcSmt/pono");
  filename += "/stecase/mult.btor2";
  BTOR2Encoder be(filename, fts);
  Property p(fts.solver(), s->make_term(true));
  Ste ste(p, fts, s);

  // function
  auto AND = [s](Term a, Term b) { return s->make_term(And, a, b); };
  auto ANDV = [s](vector<Term> v) { return s->make_term(And, v); };
  auto OR = [s](Term a, Term b) { return s->make_term(Or, a, b); };
  auto NOT = [s](Term a) { return s->make_term(Not, a); };
  auto IMPLY = [s](Term a, Term b) { return s->make_term(Implies, a, b); };
  auto EQUAL = [s](Term a, Term b) { return s->make_term(Equal, a, b); };
  auto EXTRACT = [s](Term a, int left, int right) {
    return s->make_term(Op(Extract, left, right), a);
  };
  auto ZEROEXTEND = [s](Term a, int left) {
    return s->make_term(Op(smt::Zero_Extend, left), a);
  };
  Term data_rdy = fts.named_terms().at("io_data_rdy");
  Term io_mult1 = fts.named_terms().at("io_mult1");
  Term io_mult2 = fts.named_terms().at("io_mult2");
  Term io_rstn = fts.named_terms().at("io_rstn");
  Term reset = fts.named_terms().at("reset");
  Term a = fts.make_statevar("a", io_mult1->get_sort());
  Term b = fts.make_statevar("b", io_mult2->get_sort());
  a = s->make_term(15, io_mult1->get_sort());
  b = s->make_term(15, io_mult1->get_sort());
  Term io_res = fts.named_terms().at("io_res");
  int n = 10;
  int latency = 4;
  int size = 3;
  for (int i = 0; i < n; i++) {
    Term a1;
    if (i == 0) {
      a1 = EQUAL(io_rstn, s->make_term(false));
    } else {
      a1 = EQUAL(io_rstn, s->make_term(true));
    }
    Term a2 = EQUAL(data_rdy, s->make_term(true));
    Term a3 = EQUAL(io_mult1, a);
    Term a4 = EQUAL(io_mult2, b);
    Term a5 = EQUAL(reset, s->make_term(false));
    ste.antecedent.push_back(ANDV(vector<Term>{ a1, a2, a3, a4, a5 }));
  }
  cout << s->make_term(BVMul, ZEROEXTEND(a, 4), ZEROEXTEND(b, 4))->to_string()
       << endl;
  for (int i = 0; i < n; i++) {
    if (i == 5) {
      ste.consequent.push_back(EQUAL(
          io_res, s->make_term(BVMul, ZEROEXTEND(a, 4), ZEROEXTEND(b, 4))));
    } else {
      ste.consequent.push_back(s->make_term(true));
    }
  }
  ProverResult r = ste.check_until(n - 1);

  logger.log(0, to_string(r));
}

// void parseFormulaTest()
// {
//   logger.set_verbosity(4);
//   SmtSolver s = create_solver(smt::BTOR);
//   s->set_opt("incremental", "true");
//   s->make_symbol("a1", s->make_sort(BV, 4));
//   s->make_symbol("a2", s->make_sort(BV, 4));
//   s->make_symbol("a3", s->make_sort(BV, 4));
//   cout << parseLogicExpression(s, "( (!( a1 = a3 ) )&(!( a2 = a3 ) ) )")
//        << endl;
//   cout << parseLogicExpression(s, "( a1 + a2 ) )") << endl;
// }

int main(int argc, char * argv[])
{
  //test
  if (argc == 1) {
    string modName = "CAM_m_n";
    string buildPath = "/root/chisel_with_ste/" + modName + "_build";
    
    // SteSpecificationEncoder *sse = new SteSpecificationEncoder(buildPath,modName);
    test();

    // parseFormulaTest();
    // string modName = "Ander";
    // string buildPath = "/root/chisel_with_ste/" + modName + "_build";
    // // convertVerilog2Btor2(buildPath,modName);
    // string resultPath = buildPath + "/VCD-CEX.vcd";
    // // convertVerilog2Btor2(buildPath, modName);
    // string btor2Path = buildPath + "/" + modName + ".btor2";
    // string assertPath = buildPath + "/ste.assert";
    // parseAssertFile(assertPath, btor2Path, resultPath,buildPath,1);
    return 0;
  }
  logger.set_verbosity(4);
  string buildPath = argv[1];
  string modName = argv[2];
  new SteSpecificationEncoder(buildPath,modName);
  // string resultPath = buildPath + "/VCD-CEX.vcd";
  // convertVerilog2Btor2(buildPath, modName);
  // string btor2Path = buildPath + "/" + modName + ".btor2";
  // string assertPath = buildPath + "/ste.assert";
  // parseAssertFile(assertPath, btor2Path, resultPath,buildPath);
  return 0;
}
