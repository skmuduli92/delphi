#include "simple_synth.h"
#include <solvers/smt2/smt2_dec.h>
#include <util/mathematical_expr.h>

void simple_syntht::add_problem(synth_encodingt &encoding, decision_proceduret &solver, const problemt &problem)
{
  implies_exprt implies_expr(problem.synthesis_assumptions,
                             implies_exprt(problem.assumptions, problem.constraints));
  quantifier_exprt full_problem(ID_forall, quantified_variables, implies_expr);
  const exprt encoded = encoding(full_problem);
  solver.set_to_true(encoded);
}

simple_syntht::resultt simple_syntht::operator()(const problemt &problem)
{
  // get solver
  smt2_dect solver(
      ns, "fastsynth", "generated by fastsynth",
      logic, smt2_dect::solvert::Z3);

  return this->operator()(problem, solver);
}

simple_syntht::resultt simple_syntht::operator()(const problemt &problem, decision_proceduret &solver)
{
  // add the problem to the solver (synthesis_assumptions => (assumptions => constraints))
  synth_encoding.program_size = 1;
  synth_encoding.enable_bitwise = false;
  add_problem(synth_encoding, solver, problem);

  // solve
  const decision_proceduret::resultt result = solver();
  switch (result)
  {
  case decision_proceduret::resultt::D_SATISFIABLE:
    last_solution = synth_encoding.get_solution(solver);
    return simple_syntht::resultt::CANDIDATE;
  case decision_proceduret::resultt::D_UNSATISFIABLE:
  case decision_proceduret::resultt::D_ERROR:
    return simple_syntht::resultt::NO_SOLUTION;
  }
}

exprt simple_syntht::model(exprt) const
{
  return nil_exprt();
}