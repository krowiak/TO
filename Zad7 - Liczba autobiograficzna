var x{i in 0..9, j in 0..9}, binary;
/* czy na pozycji i jest cyfra j */
s.t. poz{i in 0..9}: sum{j in 0..9} x[i,j] = 1;
/* na kazdej pozycji jest dokladnie jedna cyfra */
s.t. lc{i in 0..9}:
sum{j in 0..9} j*x[i,j] == sum{k in 0..9} x[k,i];
/* liczba cyfr j rowna jest j−tej cyfrze */
solve;
display x; 
/* 1 wskazuje obecność cyfry na pozycji, 0 - brak.
Jeśli na x[5,3] jest 1, na piątej pozycji w liczbie (od lewej, od zera)
znajduje się cyfra 3.*/
end;
