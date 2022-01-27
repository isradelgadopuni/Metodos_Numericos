clear
clc

% Santiago Israel Delgado Pinos
% Anthony Vinicio Dominguez Chacha
% Cristiam Patricio Romero 
% Fecha: 4/11/2021
% Descripcion:En el siguiente algoritmo se aplica el método de Gauss Seidel
%para la resolucion de un sistema de ecuaciones lineales

%Problema 1:
%Encontar el valor de las corrientes del siguiente circuito:(figur 3.30)

%A=[3 -0.1 -0.2 7.85 ;0.1 7 -0.3 -19.3 ;0.3 -0.2 10 71.4];
%Problema 2:
%Encontar el valor de las corrientes del siguiente circuito:(figur 3.27
%n=input('Número de variables en el sistema, n:  ');

n=4;
tol=0.001;
m=100;
A = zeros(n,n+1);
x1 = zeros(n);
x2= zeros(n);
x2=x2(1:n);
%A=[11 -5 -6 12;-5 19 -2 0;-1 -1 2 0];

A=[170 -40 0 -80 0 24;-40 80 -30 -10 0 0; 0 -30 50 0 -20 -12;-80 -10 0 90 0 10; 0 0 -20 0 80 -10]
%A=[10 -12  2 0 6 ; -1 11 -1 3 25;2 -1 10 -1 -11;0 -3 1 8 15]

%A=[0 -0.125 0.5 -0.125 0; -0.2 1.325 -0.125 -1 -3; 0.3 -0.2 0 0 3; 0 -1 -0.125 1.625 6]
%B=[0 ;-3; 3; 6]
%A=[1 2 10; 1.1 2 10.4]
%B=[10 ;10.4]
%A=[A B]
[x,xs] = Gauss_Seidel(A,tol,m,n,x1,x2);
%xs
try 
  [x,xs] = Gauss_Seidel(A,tol,m,n,x1,x2);
  
  fprintf('Solucion despues de %d iteraciones es :\n', x-1);
  for i=1:n
  
  fprintf(' %11.8f \n', xs(i));
  endfor
catch err
  
  
    fprintf('Error: %s\n',err.message);
  %err.identifie


end

  

