% Ajuste por minimos cuadrados
%
% Datos de entrada
% x = Vector independiente
% y = Vector dependiente
% n = grado del polinomio
% 
% Datos de Salida
% m = Datos para recrear la funcion y = mx +b
% b = Datos para recrear la funcion y = mx +b
## y = mx+b

function [m,b] = minimos_cuadrados (x,y)
  n = length(x);
  i = 1;
  xy = 0;
  ex =0;   
  ey =0;
  ex2=0;
  while i <= length(x)
    val1  = x(i)*y(i);
    xy = xy + val1;
    val2 = x(i);
    ex = ex + val2;
    val3 = y(i);
    ey = ey + val3;
    val4 = x(i)^2;
    ex2 = ex2 + val4;  
    i = i + 1;
  endwhile
  m = (xy - ((ex*ey)/n))/(ex2 - ((ex)^2/n));
  b = (ey/n)-(m*(ex/n));
endfunction