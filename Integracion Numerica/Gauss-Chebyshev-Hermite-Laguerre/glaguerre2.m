## Copyright (C) 2021 IsraDelgadoP
##
## Copyright (C) 2021 EQUIPO
##

%Método de Gauss-Laguerre
%   glaguerre(f, x_i) 
%       res = glaguerre (a, b, k, f)
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

function [acum, e_r] = glaguerre2 (f, a, b, n, rreal)
  
n=1+n;

syms x; 

aux1 = (exp(x)/factorial(n));
aux2 = (x.^n)*exp(-x);
derivada = diff(aux2, x, n);
L_n = aux1*derivada;
L_prima=diff(L_n,x,1);

aux12 = (exp(x)/factorial(n+1));
aux22 = (x.^(n+1))*exp(-x);
derivada2 = diff(aux22, x, n+1);
L_n2 = aux12*derivada2;
L_prima2=diff(L_n2,x,1);

x_i=solve(L_n==0,x);

L_p_e = subs(L_prima, x, x_i);

acum = 0;

for i=1:n
  %x_i(i,:)
  A_i = (1/(x_i(i,:)*(L_p_e(i,:))^2));
  acum = acum + A_i*f(x_i(i,:)) ;
endfor

acum=double(acum);
e_a=abs(rreal-acum);
e_r=e_a*100/rreal;

endfunction