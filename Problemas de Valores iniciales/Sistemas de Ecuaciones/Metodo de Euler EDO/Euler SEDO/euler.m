
% METODO DE EULER
% PARA SISTEMAS DE ECUACIONES DIFERENCIALES
%
% Israel Delgado
% Anthony Dominguez
% Cristiam Romero
% 20/12/2021

% Datos de entrada
%  x0 = vector de valores inicial de las variables independiente
%  ne = numero de ecuaciones diferenciales ordinarias
%  t0 = valor inicial de la variable dependiente
%  tf = valor final de la variable dependiente
%  dt = tamano del paso en el tiempo
%  n  = numeor de iteraciones

function [t,x] = euler (x0,t0,tf,dt,n,ne)
t(1) = t0;          

for i = 1:ne
    x(i,1)= x0(i);
end

for j = 1:n
    t(j+1) = t(j) + dt;
    [fx] = ediffo(x(:,j));
    for i = 1:ne
      x(i,j+1) = x(i,j) + fx(i)*dt;
    end
end

 
endfunction
