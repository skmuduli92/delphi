#ifndef EMU_EXPR2SYGUS
#define EMU_EXPR2SYGUS

#include <util/expr.h>
#include <util/std_expr.h>
#include <iostream>

std::string expr2sygus(const exprt &expr);
std::string expr2sygus(const exprt &expr, bool use_integers);
std::string expr2sygus_fun_def(const symbol_exprt &function, const exprt&body);
#endif /* EMU_EXPR2SYGUS*/