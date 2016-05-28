# Zad.3
# Poprawione rozwiązanie z https://www.cs.cmu.edu/~ckingsf/bioinfo-lectures/linearp.pdf

set X;
set Y;
set E within X cross Y;
var jestKrawedz {(x, y) in E}, binary;

maximize liczKrawedzi: sum {(x,y) in E} jestKrawedz[x,y];
s.t. jednaKrawedzDoX {x in X}: sum {(x,y) in E} jestKrawedz[x,y] <= 1;
s.t. jednaKrawedzDoY {y in Y}: sum {(x,y) in E} jestKrawedz[x,y] <= 1;
solve; display jestKrawedz;

data;
set X := a b c d e f;
set Y := 1 2 3 4 5;
set E 
: 1 2 3 4 5 :=
a + + - - -
b - - + + +
c + - + - +
d - + - + -
e - - - - +
f + - + - - ;

end;
