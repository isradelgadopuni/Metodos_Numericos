## Factorización LU
##
## Función que recibe como parámetros una matriz A 
## devolviendo la matriz L y la matriz U que seran necesarias para resolver
## el sistema de ecuaciones reduciendolo de
## L * Ux = b
## L * y = b
## Donde
## Ux = Y
## Resoviendo 2 sistemas por separado 

function [L,U] = LU (A)
[n,n] = size(A);
for k = 1:n
    if abs(A(k, k)) < sqrt(eps)
      msgID = 'LU: Error';
      msg = 'Error: Valor de la columna del pivote muy pequeño';
      #baseException = MException(msgID,msg);
      #throw(baseException);
      error(msgID,msg);
    end
    L(k,k) = 1;
    for i = k+1:n
    L(i,k) = A(i,k) / A(k,k);
      for j = k+1:n
      A(i,j) = A(i,j) - L(i,k)*A(k,j);
      end
    end
      for j = k:n
      U(k,j) = A(k,j);
      end
end
endfunction
