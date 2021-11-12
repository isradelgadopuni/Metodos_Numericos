%CHOLESKY   M�todos para encontrar soluci�n de sistemas de ecuaciones lineales.
%   chol(A) llenar
%       [L, U] = chol(A)
%       A = Matriz del sistema lineal, esta debe ser sim�trico
%       L, U, Matrices de la descomposici�n de A
%       
%   Copyright 2021 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/10/29 08:46 $
%   Built-in function.

## Author: Delgado P, Dominguez C, Romero T
## Created: 2021-10-29

function [L,U] = alg_cholesky(A)
  [i,j] = size(A);
  if (i != j) 
    msgID = 'LU: Error - Matriz No cuadrada';
    msg = 'Error: Matriz no cuadrada';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msgID,msg);
  elseif sum(sum(A != A')) != 0
    msgID = 'LU: Error - Matriz No Simetrica';
    msg = 'Error: No es una matriz simetrica';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msgID,msg);
  endif

  n = i;
  L = zeros(n);
  L(1,1)=sqrt(A(1,1));

  for k = 2:n
    for i = 1:k
      if i == 1
        L(k,i)=A(k,i)/L(i,i);    
      elseif i == k
        acumulador = 0;
        for j=1:k-1
          acumulador = acumulador + L(k,j)^2;
        endfor
        L(i,i)=sqrt(A(i,i)-acumulador);
      else
        acumulador = 0; 
        for j=1:i-1
          acumulador = acumulador + L(i,j)*L(k,j);
        endfor
        L(k,i)=(A(k,i)-acumulador)/L(i,i);
      endif
    endfor
  endfor
    
  U = L';
  
endfunction