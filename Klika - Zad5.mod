param liczWierz, integer, >= 1;
var czyWybrane{1..liczWierz}, binary;
param krawedzie{i in 1..(liczWierz-1), j in (i+1)..liczWierz}, binary;
maximize rozmiarKliki: sum{i in 1..liczWierz} czyWybrane[i];
s.t. r{i in 1..(liczWierz-1), j in (i+1)..liczWierz}:
czyWybrane[i] + czyWybrane[j] <= 1 + krawedzie[i,j];
solve;
display rozmiarKliki, czyWybrane;

data;
param liczWierz := 6;
param krawedzie := 
1 2 1  # wierzchołek 1 (i), wierzchołek 2 (j), czy jest krawędź (jest!!!1one)
1 3 0 
1 4 0 
1 5 1
1 6 0

2 3 1
2 4 0 
2 5 1
2 6 0 

3 4 1
3 5 0 
3 6 0

4 5 1 
4 6 1

5 6 0;
end;
