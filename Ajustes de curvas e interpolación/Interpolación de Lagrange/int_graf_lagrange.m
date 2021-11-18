%Ajuste con interpolación de Lagrange 
%   int_graf_lagrange(x, y) 
%       [x_a, y_a] = int_lagrange(x, y)
%       x , y: Vectores con las entradas
%       x_a, y_a: Vectores con los puntos de la funcion
%       
%   Copyright 2021 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/11/11 15:00 $
%   Built-in function.

## Author: Delgado P, Dominguez C, Romero T
## Created: 2021-11-12

function [x_a, y_a] = int_graf_lagrange (x, y)
  
  x0=min(x)-1;
  x_a=[];
  y_a=[];
  while x0 <= max(x) + 1
    
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
    
    x_a(length(x_a)+1)=x0;
    y_a(length(y_a)+1)=acum_sum;
    
    x0=x0+0.01;
    
  endwhile
  
  
endfunction