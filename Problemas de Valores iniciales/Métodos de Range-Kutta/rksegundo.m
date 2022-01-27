## Copyright (C) 2021 IsraDelgadoP
##
## Copyright (C) 2021 EQUIPO
##

%Metodo de Runge-Kutta segundo orden
%   [xv, yv] = rksegundo (f,x0,x1,y0,h,tipo) 
%       xv, yv : vectores con los valores de respuesta de x y de y
%       f: Funcion a integrar para el punto a y b
%       x0, x1: Extremos de la integral
%       y0: valor inicial de y
%       tipo: especifica los coeficientes a usarse en el metodo 1 Heun 2 PMedio 3 Ralston
%       
%   Copyright 2021 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021-12-15 19:00 $
%   Built-in function.

## Author: Delgado P, Dominguez C, Romero T <IsraDelgadoP@BLANCA>
## Created: 2021-12-15

function [xv, yv, datos] = rksegundo (f,x0,x1,y0,h,tipo, sol)
  
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

  xv(1)=xi;
  yv(1)=yi;
  
  datos(1,1)=xi;
  datos(1,2)=sol(xi);
  datos(1,3)=yi;
  datos(1,4)=abs(yi-sol(xi));
  datos(1,5)=abs(yi-sol(xi))*100/sol(xi);
  
  if (tipo == 1)
   %Coeficientes para Heun
    a1 = 0.5;
    a2 = 0.5;
    p1 = 1;
    q11 = 1;
  elseif (tipo == 2)
    %Coeficientes para Punto medio
    a1 = 0;
    a2 = 1;
    p1 = 0.5;
    q11 = 0.5;
  elseif (tipo == 3)
    %Coeficientes para Ralston
    a1 = 1/3;
    a2 = 2/3;
    p1 = 3/4;
    q11 = 3/4;
  else 
    msgID = 'RungeKutta2: Error de tipo';
    msg = 'Tipo incorrecto (1,2,3)';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msgID,msg)
  endif

  for i=1:n
    k1 = f(xi,yi);
    k2 = f(xi+p1*h,yi+q11*k1*h);
    xi = xi + h;
    yi = yi + (a1*k1+a2*k2)*h;
    datos(i+1,1)=xi;
    datos(i+1,2)=sol(xi);
    datos(i+1,3)=yi;
    datos(i+1,4)=abs(yi-sol(xi));
    datos(i+1,5)=abs(yi-sol(xi))*100/sol(xi);
    xv(i+1)=xi;
    yv(i+1)=yi;
  end

endfunction