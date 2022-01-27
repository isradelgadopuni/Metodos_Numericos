% Autores: 
% Santiago Israel Delgado Pinos
% Anthony Vinicio Dominguez Chacha
% Cristiam Patricio Romero 
% Fecha: 28/10/2021
% Descripcion: En el siguiente algoritmo se aplica el método de Gauss Jordan
%para la  resolucion de un sistema de ecuaciones lineales

%Problema 1:
%Encontar el valor de las tensiones de los nodos 1 ,2 y 3 del siguiente circuito:
%El sistema de ecuaciones del ciruito nos queda de la siguiente manera:
% si v1=x , v2=y y v3=z
%-x+z=10 
%6x-8y+5z=00
%-x+2y-z=10

%A=[-1 0 1; 6 -8 5;-1 2 -1];
%B=[10; 0; 10];
%A = [3, -7, 6; 
     %1, -5, 3;
     %0, 1, -3];
%B = [-12; 0; -4];
%A=[1 2 ; 1.05 2]
%B=[10 ;10.4]
A=[0 2 3; 4 6 7;2 1 6]
B=[8;-3;5]
%Problema 2:
%Aplique el análisisnodal para hallar v1, v2 y v3 en el siguiente circuito:
%Para la resolucion del circuito usamos 
%v1=a , v2=b , v3=c
%a-c=12
%2a-2b-c=0
%a+4b+c=0
%A=[1 0 -1; 2 -2 -1;1 4 1];
%B=[12; 0; 0];
try 
  L=GGGJJ(A,B);
 
catch err
  
  
    fprintf('Error: %s\n',err.message);
  %err.identifier
end
