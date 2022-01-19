% METODO DE HEUN
% Israel Delgado
% Anthony Dominguez
% Cristiam Romero
% 20/12/2021

% Datos de Entrada
% f = Sistema de ecuaciones
% n = numero de subintervalos
% h = tamaño de paso
% y = Matriz de 0 
% t = vector de tiempo

% Datos de Salida
% y = solucion del problema


function y = heun (f,n,h,y,t)
 for k = 1:n
   k1 = f(t(k),y(:,k));
   k2 = f(t(k)+ h, y(:,k)+k1*h);
   y(:,k+1)=y(:,k)+ h/2 * (k1+k2);
   
 endfor
endfunction
