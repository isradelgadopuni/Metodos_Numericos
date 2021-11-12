%Funcion auxiliar para el intercambio de filas
function A=Intercambio(A,i)
  [n m]= size(A);
  k=i+1;
  while (k<=n) && (A(k,i)==0)
    k=k+1;
  endwhile
  if k<=n
    for j=1:m
      t=A(i,j);
      A(i,j)=A(k,j);
      A(k,j)=t;
    endfor
  endif
endfunction