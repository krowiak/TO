# Zad 4

set W;
param koszt{W};
param cenaSprz{W};
param czas{W};
param hektary;
param czasMax;

var x{i in W} >= 0, integer;
maximize zyskCalosc: sum{i in W} (cenaSprz[i] - koszt[i]) * x[i];

s.t. godzPracy: sum{i in W} czas[i]*x[i] = czasMax;
s.t. wykHektary: sum{i in W} x[i] = hektary;

solve; display zyskCalosc, x;

data;
set W := Kukurydza Pomidaory Cebula Fasola;
param koszt := Kukurydza 100 Pomidory 100 Cebula 50 Fasola 55;
param cenaSprz := Kukurydza 230 Pomidory 160 Cebula 90 Fasola 110;
param czas := Kukurydza 3 Pomidory 2 Cebula 1 Fasola 1;
param hektary := 4;
param czasMax := 8;
end;
