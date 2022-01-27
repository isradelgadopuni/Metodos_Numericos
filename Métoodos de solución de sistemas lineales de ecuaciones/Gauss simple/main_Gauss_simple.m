% Autores: 
% Santiago Israel Delgado Pinos
% Anthony Vinicio Dominguez Chacha
% Cristiam Patricio Romero 
% Fecha: 28/10/2021
% Descripcion: En el siguiente algoritmo se aplica el método de Gauss para la 
% resolucion de un sistema de ecuaciones lineales

%Problema 1:
%Encontar el valor de las corrientes del siguiente circuito:(figur 3.30)

%A=[170 -40 0 -80 0; -40 80 -30 -10 0; 0 -30 50 0 -20;-80 -10 0 90 0; 0 0 -20 0 80];
%B=[24; 0; -12;10;10];

%Problema 2:
%Encontar el valor de las corrientes del siguiente circuito:(figur 3.27)
%A=[0 -0.125 0.5 -0.125  ; -0.2 1.325 -0.125 -1; 0.3 -0.2 0 0 ; 0 -1 -0.125 1.625]
%B=[0 ;-3; 3; 6]
%A=[2 4 5 ; 6 9 8; 4.1 5 3]
%B=[200; 490;274]

A=[ 1 2 ; 1.05 2]
B=[10 ;10.4]
try 
  Y=ElimiGauss(A,B);
 
catch err
  
  
    fprintf('Error: %s\n',err.message);
  %err.identifier
end











