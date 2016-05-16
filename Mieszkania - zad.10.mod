# Zad 10 - mieszkania

set RodzajBloku;
param mDwa{RodzajBloku};
param mTrzy{RodzajBloku};
param koszt{RodzajBloku};
param minM2;
param maxM3;
param maxBlokow;

var bloki{r in RodzajBloku} >= 0, integer;
minimize lacznyKoszt: sum{r in RodzajBloku} (koszt[r]) * bloki[r];

s.t. lacznieBlokow: sum{r in RodzajBloku} bloki[r] <= maxBlokow;
s.t. liczbaM2: sum{r in RodzajBloku} mDwa[r]*bloki[r] >= minM2;
s.t. liczbaM3: sum{r in RodzajBloku} mTrzy[r]*bloki[r] <= maxM3;

solve; display lacznyKoszt, liczbaM2, liczbaM3;

data;
set RodzajBloku := Pietnascie Dziesiec;
param mDwa := Pietnascie 50 Dziesiec 100;
param mTrzy := Pietnascie 75 Dziesiec 0;
param koszt := Pietnascie 2000000 Dziesiec 1000000;
param minM2 := 350;
param maxM3 := 150;
param maxBlokow := 6;
end;
