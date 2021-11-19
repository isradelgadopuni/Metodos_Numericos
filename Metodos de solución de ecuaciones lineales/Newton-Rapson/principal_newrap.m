pkg symbolic load
syms x

% Autores: 
% Santiago Israel Delgado Pinos
% Anthony Vinicio Dominguez Chacha
% Cristiam Patricio Romero 
% Fecha: 13/10/2021
% Descripcion: En el siguiente algoritmo se aplica el método iterativo del punto
% fijo, el en cual dado mediante una función que tiene diversos valores de 
% entrada se encuentra una solución real de una función matemática que no 
% necesariamente es líneal.

% Problema 1:
% Esta es una ecuación diferencial de segundo grado que se resuelve usando métodos numéricos
% dada por 
%
% q(t) = qo e^(-Rt/2L) cos(sqrt((1/LC)-(R/2L)^2)t
%
%Datos de entrada
%t=0
%q=qo=VoC
%Vo= el voltaje de la batería
%q/qo=0.01
%t=0.05
%L=5
%C=10C-4
%
%Luego de reordenar la ecuación y reemplazar valores tenemos la ecuación

% Calcular la raíz usando el método del punto fijo en x = 320
%f= @(x) exp(-0.005*x)*cos(sqrt(2000-0.01*x.^2)*0.05)-0.01;
%df=diff(f,x);
%xi=320
%iter=50
%tol=0.0012

%---------------------------------------------------------------------------
% Problema 2:
%   Determine la raíz real más grande de f(x)=2*x^3 - 11.7*x^2 + 17.7*x-5
%   con el método de ietración simple de punto fijo(tres iteraciones, xi = 4)
%   hasta que el cálculo del error sea menor a 0.00012%.
% 

f= @(x)  2*x.^3 - 11.7*x.^2 + 17.7*x - 5
xi=4
df=diff(f,x);
iter=50;
tol=0.00012;
datos=""


try
  [xn,datos,c]=new_rhapson(f,df,xi,iter,tol);
  fprintf('El valor de corte es x=%d, el número de iteraciones es %d\n',xn,c);
  
  [n,m] = size(datos);
  fprintf('i        Raiz        EA    \n');
  for i=1:n
    fprintf('%d\t',i);
    for j=1:m
      fprintf('%d\t',datos(i,j));
    endfor
    fprintf('\n');
  endfor
  
  hold on
  ezplot(f)
  grid on
  legend ("f(x)");
  xlabel ("x");
  ylabel ("f(x)");
  plot(xn,0,"x")
  hold off
  
  
catch err
  fprintf('Error: %s\n', err.message);
  %err.identifier
end


