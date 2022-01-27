## Copyright (C) 2021 EQUIPO
##

%Ajuste de diferencias finitas centradas 
%   fsimpson(f, x_i) 
%       res = fsimpson13 (a, b, k, f)
%       f: Funcion a diferenciar para el punto a y b
%       a, b: Extremos de la integral
%       k: veces que se desea aplicar el metodo
%       res: resultado de la integracion
%       
%   Copyright 2021 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/12/01 19:00 $
%   Built-in function.

## Author: Delgado P, Dominguez C, Romero T
## Created: 2021-12-01

function res = fsimpson13 (a, b, k, f)
  
  res = 0;
  n = 2*k;
  h = (b-a)/n;

  for i=1:k
    res = res + (h/3)*(f(a)+4*f(a+h)+f(a+2*h));
    a = a + 2*h;
  endfor
  
endfunction
