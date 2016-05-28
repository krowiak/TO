# Zad.8
# Pomysł: http://felix.abecassis.me/2012/11/graph-coloring-with-glpk/

param lWierz, integer, >= 1;
param krawedzie{i in 1..(lWierz-1), j in (i+1)..lWierz}, binary;
var kolory{i in 1..lWierz, k in 1..lWierz}, binary;
var licznik, integer;

minimize lKol: sum{i in 1..lWierz, j in 1..lWierz} j*kolory[i, j];
minimize liczbaWLiczniku: licznik;
s.t. jedenKolorNaWierzcholek{i in 1..lWierz}: sum{k in 1..lWierz} kolory[i, k] = 1;
s.t. rozneKolorySasiadow{i in 1..(lWierz - 1), j in (i+1)..lWierz, k in 1..lWierz}: 
(kolory[i, k] + kolory[j, k]) * krawedzie[i, j] <= 1;
s.t. licznikKolorow{i in 1..lWierz, k in 1..lWierz}: kolory[i, k]*k <= licznik;

solve; display licznik, kolory;

data;
# Pentagramowaty graf

param lWierz := 6;
param krawedzie :=
1 2 1
1 3 1
1 4 0
1 5 1
1 6 1
2 3 1
2 4 1
2 5 0
2 6 1
3 4 1
3 5 1
3 6 0
4 5 1
4 6 1
5 6 1;


# Graf dwudzielny
/*
param lWierz := 8;
param krawedzie :=
1 2 0
1 3 0
1 4 0
1 5 0
1 6 1
1 7 1
1 8 1

2 3 0
2 4 0
2 5 0
2 6 1
2 7 1
2 8 1

3 4 0
3 5 0
3 6 1
3 7 1
3 8 1

4 5 0
4 6 1
4 7 1
4 8 1

5 6 1
5 7 1
5 8 1

6 7 0
6 8 0

7 8 0;
*/
end;
