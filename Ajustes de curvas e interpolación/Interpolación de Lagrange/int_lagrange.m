%Ajuste con interpolación de Lagrange 
%   int_lagrange(x, y) 
%       acum_sum = int_lagrange(x, y, x0)
%       x , y: Vectores con las entradas
%       x0: valor del polinomio a aproximarse.
%       acum_sum: Valor de la aproximacion
%       res_pol: Aproximaciones de cada orden
%   Copyright 2021 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/11/11 15:00 $
%   Built-in function.

## Author: Delgado P, Dominguez C, Romero T
## Created: 2021-11-12

function [acum_sum] = int_lagrange (x, y, x0)
  if length(x) != length(y)
    msgID = 'Lagrange: Errror en la entrada';
    msg = 'Error: Los vectores de entrada de las coordenadas no son del mismo tamaño';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msgID,msg);
  else
    n = length(x);
    acum_sum = 0;
    
    for i=1:n
     acum_prod = y(i);
     for j=1:n
       if (i != j)
         acum_prod = acum_prod*(x0 - x(j))/(x(i)-x(j));
       endif
     endfor
     acum_sum=acum_sum+acum_prod;
    endfor
  endif
  
endfunction