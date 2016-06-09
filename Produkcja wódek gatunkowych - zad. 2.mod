# Zad 2

set W;
param koszt{W};
param czas{W};
param cenaSprz{W};
param kapital;
param czasMax;

var x{i in W} >= 0, integer;
maximize zyskCalosc: sum{i in W} (cenaSprz[i] - koszt[i]) * x[i];

s.t. praca: sum{i in W} czas[i]*x[i] <= czasMax;
s.t. wydano: sum{i in W} koszt[i]*x[i] <= kapital;

solve; display zyskCalosc, x;

data;
set W := Sliwowica Zytnia;
param koszt := Sliwowica 3 Zytnia 2;
param czas := Sliwowica 3 Zytnia 4;
param cenaSprz := Sliwowica 6 Zytnia 5.40;
param kapital := 4000;
param czasMax := 20000;
end;
