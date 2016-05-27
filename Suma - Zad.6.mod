# Zad.6

param iMin;
param iMax;
param doUzyskania;
var czyWybrane{iMin..iMax}, binary;

minimize coWybrane: sum{i in iMin..iMax} czyWybrane[i];
s.t. suma: sum{i in iMin..iMax} czyWybrane[i] * (i*i - i + 1) = doUzyskania;
solve; display czyWybrane, suma;

data;
param iMin := 1;
param iMax := 30;
param doUzyskania := 4285;

end;
