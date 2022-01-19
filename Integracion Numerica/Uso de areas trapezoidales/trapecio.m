% Universidad de Cuenca
% Israel Delgado
% Anthony Dominguez
% Cristiam Romero
% 1/12/2021
%
% Metodo del trapecio
%
% Datos de Entrada 
% f = función  
% x1 = Limite superior
% x0 = Limite inferior
% n = numero de intervalos
%
% Datos de salida
% s = Valor calculado del area mediante el metodo del trapecio


function s = trapecio (g,x1,x0,n)
 h =(x1-x0)/n;
 s = 0;
 for i=1:n
   s = h/2*(g(x0+(i-1)*h)+g(x0+(i)*h))+s;
 endfor

endfunction
