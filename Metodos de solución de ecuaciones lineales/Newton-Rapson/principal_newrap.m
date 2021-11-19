pkg symbolic load
syms x

% Autores: 
% Santiago Israel Delgado Pinos
% Anthony Vinicio Dominguez Chacha
% Cristiam Patricio Romero 
% Fecha: 13/10/2021
% Descripcion: En el siguiente algoritmo se aplica el m�todo iterativo del punto
% fijo, el en cual dado mediante una funci�n que tiene diversos valores de 
% entrada se encuentra una soluci�n real de una funci�n matem�tica que no 
% necesariamente es l�neal.

% Problema 1:
% Esta es una ecuaci�n diferencial de segundo grado que se resuelve usando m�todos num�ricos
% dada por 
%
% q(t) = qo e^(-Rt/2L) cos(sqrt((1/LC)-(R/2L)^2)t
%
%Datos de entrada
%t=0
%q=qo=VoC
%Vo= el voltaje de la bater�a
%q/qo=0.01
%t=0.05
%L=5
%C=10C-4
%
%Luego de reordenar la ecuaci�n y reemplazar valores tenemos la ecuaci�n

% Calcular la ra�z usando el m�todo del punto fijo en x = 320
%f= @(x) exp(-0.005*x)*cos(sqrt(2000-0.01*x.^2)*0.05)-0.01;
%df=diff(f,x);
%xi=320
%iter=50
%tol=0.0012

%---------------------------------------------------------------------------
% Problema 2:
%   Determine la ra�z real m�s grande de f(x)=2*x^3 - 11.7*x^2 + 17.7*x-5
%   con el m�todo de ietraci�n simple de punto fijo(tres iteraciones, xi = 4)
%   hasta que el c�lculo del error sea menor a 0.00012%.
% 

f= @(x)  2*x.^3 - 11.7*x.^2 + 17.7*x - 5
xi=4
df=diff(f,x);
iter=50;
tol=0.00012;
datos=""


try
  [xn,datos,c]=new_rhapson(f,df,xi,iter,tol);
  fprintf('El valor de corte es x=%d, el n�mero de iteraciones es %d\n',xn,c);
  
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


