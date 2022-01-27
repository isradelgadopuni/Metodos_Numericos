## Copyright (C) 2021 IsraDelgadoP
##
## Copyright (C) 2021 EQUIPO
##

%Metodo de Runge-Kutta tercer orden
%   [xv, yv] = rktercero (f,x0,x1,y0,h,tipo) 
%       xv, yv : vectores con los valores de respuesta de x y de y
%       f: Funcion a integrar para el punto a y b
%       x0, x1: Extremos de la integral
%       y0: valor inicial de y
%       
%   Copyright 2021 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021-12-15 19:00 $
%   Built-in function.

## Author: Delgado P, Dominguez C, Romero T <IsraDelgadoP@BLANCA>
## Created: 2021-12-15

function [xv, yv, datos] = rktercero (f,x0,x1,y0,h, sol)
  
  if (h <= 0) || (h>(x1-x0))
    msgID = 'RungeKutta2: Error de Paso';
    msg = 'Revise el paso, debe ser mayor a 0 y menor que el intervalo';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msgID,msg)  
  elseif (x0 > x1) 
    msgID = 'RungeKutta2: Error de limites';
    msg = 'Límites incorrectos';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msgID,msg)
  endif
  
  n = (x1-x0)/h;
  xi=x0;
  yi=y0;
  
  datos(1,1)=xi;
  datos(1,2)=sol(xi);
  datos(1,3)=yi;
  datos(1,4)=abs(yi-sol(xi));
  datos(1,5)=abs(yi-sol(xi))*100/sol(xi);

  xv(1)=xi;
  yv(1)=yi;

  for i=1:n
    k1 = f(xi,yi);
    k2 = f(xi+0.5*h,yi+0.5*k1*h);
    k3 = f(xi+h,yi-k1*h+2*k2+h);
    xi = xi + h;
    yi = yi + (1/6)*(k1+4*k2+k3)*h;
    datos(i+1,1)=xi;
    datos(i+1,2)=sol(xi);
    datos(i+1,3)=yi;
    datos(i+1,4)=abs(yi-sol(xi));
    datos(i+1,5)=abs(yi-sol(xi))*100/sol(xi);
    xv(i+1)=xi;
    yv(i+1)=yi;
  end

endfunction