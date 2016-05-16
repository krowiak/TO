/*http://lemon.cs.elte.hu/trac/lemon/browser/glpk-cmake/examples/sat.mod?rev=1*/


/* SAT, Satisfiability Problem */

/* Written in GNU MathProg by Andrew Makhorin <mao@gnu.org> */

param m, integer, > 0;
/* Liczba nawiasów. W nawiasach są ||, pomiędzy &&. */

param n, integer, > 0;
/* Liczba zmiennych x_coś. */

set C{1..m};
/* Zbiór wyrażeń w nawiasach. clauses; each clause C[i], i = 1, ..., m, is disjunction of some
   variables or their negations; in the data section each clause is
   coded as a set of indices of corresponding variables, where negative
   indices mean negation; for example, the clause (x3 or not x7 or x11)
   is coded as the set { 3, -7, 11 } */

var x{1..n}, binary;
/* main variables */

/* To solve the satisfiability problem means to determine all variables
   x[j] such that conjunction of all clauses C[1] and ... and C[m] takes
   on the value true, i.e. all clauses are satisfied.

   Let the clause C[i] be (t or t' or ... or t''), where t, t', ..., t''
   are either variables or their negations. The condition of satisfying
   C[i] can be most naturally written as:

      t + t' + ... + t'' >= 1,                                       (1)

   where t, t', t'' have to be replaced by either x[j] or (1 - x[j]).
   The formulation (1) leads to the mip problem with no objective, i.e.
   to a feasibility problem.

   Another, more practical way is to write the condition for C[i] as:

      t + t' + ... + t'' + y[i] >= 1,                                (2)

   where y[i] is an auxiliary binary variable, and minimize the sum of
   y[i]. If the sum is zero, all y[i] are also zero, and therefore all
   clauses are satisfied. If the sum is minimal but non-zero, its value
   shows the number of clauses which cannot be satisfied. */

var y{1..m}, binary, >= 0;
/* Zmienne pomocnicze */

s.t. c{i in 1..m}:
      sum{j in C[i]} (if j > 0 then x[j] else (1 - x[-j])) + y[i] >= 1;
/* the condition (2) */

minimize unsat: sum{i in 1..m} y[i];
/* number of unsatisfied clauses */
solve;
display unsat;  /* jeśli unset = 0 - spełnialna, inaczej nie */


data;
param m := 4; /*Cztery nawiasy*/
param n := 4; /*Cztery zmienne - x1 do x4*/

set C[1] := 1 -2 3; /*x1 + (-x2) + x3 */
set C[2] := -1 3 -4; /* (-x1) + x3 + (-x4) */
set C[3] := 1 -2 -3;
set C[4] := 2 -3 4;
end;
