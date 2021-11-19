% Autores: 
% Santiago Israel Delgado Pinos
% Anthony Vinicio Dominguez Chacha
% Cristiam Patricio Romero 
% Fecha: 4/11/2021
% Descripcion: En el siguiente algoritmo se aplica el m�todo de Jacobi
%para la  resolucion de un sistema Ax = b


%Problema 2:
%Aplique el analisisnodal para hallar v1, v2 y v3 en el siguiente circuito:

A = [3,1,1 ; -1, 4, 1 ; -2,1,4];
b = [8,10,12];
x0 = [1,1,1];
kmax = 20;

x = Jacobi (A,b,x0,tol=0.001,kmax)