%Ajuste con ecuaciones no lineales   Linealización de relaciones no lineales
%   ajuste_no_lineales(x, y) 
%       [calpha, cbeta] = ajuste_no_lineales(x, y, tipo)
%       x , y: Vectores con las entradas
%       tipo: tipo de ecuacion a la que se van a ajustar los puntos.
%             1 exponencial
%             2 de potencias
%             3 ec. de razon de crecimiento
%       calpha, cbeta: Constantes a devolver que caracterizan a la funcion
%       
%   Copyright 2021 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/11/11 15:00 $
%   Built-in function.

## Author: Delgado P, Dominguez C, Romero T
## Created: 2021-11-11


function [calpha, cbeta, f] = ajuste_nl (x, y, tipo)

  if (tipo == 1)
    x=x;
    y=log(y);
    [m, b] = minimos_cuadrados(x,y);
    calpha=exp(b);
    cbeta=m;
    f = @(x) calpha*exp(cbeta*x);
  elseif (tipo == 2)  
    x=log10(x);
    y=log10(y);
    [m, b] = minimos_cuadrados(x,y);
    calpha=10^b;
    cbeta=m;
    f = @(x) calpha*x.^(cbeta);
  elseif (tipo == 3)
    x=x.^(-1)
    y=y.^(-1)
    [m, b] = minimos_cuadrados(x,y);
    calpha=1/b;
    cbeta=m*calpha;
    f = @(x) (calpha*x)/(cbeta+x);
  endif
  
endfunction
