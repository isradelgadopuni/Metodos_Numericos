## Copyright (C) 2022 ZONA LENOVO
%  Metodo de Newton Optimización
% Israel Delgado
% Anthony Dominguez
% Cristiam Romero
% 13/1/2022

% DATOS DE ENTRADA
% f = función
% x0 = x inicial
% y0 = y inicial
% Tol = Tolerancia

% DATOS DE SALIDA
% msg = Mensaje de ejecución exitosa
% xi = x optimo
% yi = y optimo
% k = Numero de iteraciones

## Created: 2022-01-13

function [msg, xi, yi, k] = newton_op (f,x0,y0, Tol= 1E-6)
syms x y
dx = diff(f,x);
dy = diff(f,y);
dxdx = diff(dx,x);
dxdy = diff(dx,y);
dydy = diff(dy,x);
dydx = diff(dy,x);

gradf = [dx;dy];
H = [dxdx, dxdy; dydx, dydy];
H1 = inv(H);

k = 0;
e = 1;
xi = x0;
yi = y0;

while e >= Tol
  x = xi;
  y = yi;
  gradf_ = eval(gradf);
  H1_ = eval(H1);
  M = [xi;yi]- H1_ * gradf_ ;
  xi1 = M(1);
  yi1 = M(2);
  e = abs(sqrt((xi1-xi)^2+(yi1-yi)^2));
  xi = xi1;
  yi = yi1;
  k = k+1;
  if k > 500
    error('Error: Limite de iteraciones alcanzado')
  endif

end 

msg = 'Se encontro una solucion';

x = xi;
y = yi;

detH = eval(det(H));
d2f = eval(dxdx);
 
if detH < 0
  c = 'Punto Silla';
else
  if d2f > 0
    c = 'Minimo';
  else
    c = 'Maximo';
  endif
endif
endfunction
