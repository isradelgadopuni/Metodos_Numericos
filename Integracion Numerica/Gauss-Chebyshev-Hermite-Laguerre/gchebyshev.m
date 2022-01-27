## Copyright (C) 2021 IsraDelgadoP
##
## Copyright (C) 2021 EQUIPO
##

%Método de Gauss-Chebyshev
%   gchebyshev(f, x_i) 
%       res = fsimpson13 (a, b, k, f)
%       f: Funcion a diferenciar para el punto a y b
%       a, b: Extremos de la integral
%       n: grado
%       res: resultado de la integracion
%       
%   Copyright 2021 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/12/01 19:00 $
%   Built-in function.

## Author: Delgado P, Dominguez C, Romero T <IsraDelgadoP@LAPTOP-NEGRA>
## Created: 2021-12-06

function [acum, e_r] = gchebyshev (f, a, b, n, rreal)

g = @(x) 1/sqrt(1-x.^2);
t = @(x) cos(n*acos(x));
x_i = @(k) cos((2*k+1)*pi/(2*n+2));
A_i = pi/(n+1);

acum=0;

for k=0:n
   xi=x_i(k);
   acum = acum + f(xi);
endfor

acum = acum * A_i;

e_a=abs(rreal-acum);
e_r=e_a*100/rreal;

endfunction
