
## Copyright (C) 2021 IsraDelgadoP
##
## Copyright (C) 2021 EQUIPO
##

%Método de Gauss-Hermite
%   ghermite(f, x_i) 
%       res = ghermite (a, b, k, f)
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
function [acum, e_r] = ghermite (f, a, b, n, rreal)

n = n+1;

syms x; 

aux1 = exp(x^2)*(-1)^n;
aux2 = exp(-(x)^2);
derivada = diff(aux2, x, n);
H_n = aux1*derivada;
H_prima=diff(H_n,x,1);

aux12 = exp(x^2)*(-1)^(n+1);
aux22 = exp(-(x)^2);
derivada2 = diff(aux22, x, n+1);
H_n2 = aux12*derivada2;
H_prima2=diff(H_n2,x,1);

x_i=solve(H_n==0,x);

H_p_e = subs(H_prima, x, x_i);

acum = 0;

for i=1:n;
  %x_i(i,:)
  A_i = (((2^(n+1))*factorial(n)*sqrt(pi))/((H_p_e(i,:))^2));
  acum = acum + A_i*f(x_i(i,:)) ;
endfor

acum=double(acum);
e_a=abs(rreal-acum);
e_r=e_a*100/rreal;

endfunction
