% Autores: 
% Santiago Israel Delgado Pinos
% Anthony Vinicio Dominguez Chacha
% Cristiam Patricio Romero  Toledo
% Fecha: 4/11/2021
% Descripcion: En el siguiente algoritmo se aplica el metodo de Gauss Jordan
%para hallar la inversa d euna matrix

%Problema 1:
%Encontar el valor de las tensiones de los nodos 1 ,2 y 3 del siguiente circuito:
%El sistema de ecuaciones del ciruito nos queda de la siguiente manera:
% si v1=x , v2=y y v3=z
%-x+z=10 
%6x-8y+5z=00
%-x+2y-z=10

%A=[-1 0 1; 6 -8 5;-1 2 -1];
%B=[1,0,0; 0,1,0; 0,0,1];

%Problema 2:
%Aplique el analisisnodal para hallar v1, v2 y v3 en el siguiente circuito:
%Para la resolucion del circuito usamos 
%v1=a , v2=b , v3=c
%a-c=12
%2a-2b-c=0
%a+4b+c=0
A=[1 0 -1; 2 -2 -1;1 4 1];
B=[1,0,0; 0,1,0; 0,0,1];
try 
  L= matriz_inversa(A,B);
  fprintf('La inversa de la matriz ingresada es:\n')
  L(:,4:6)

catch err
    fprintf('Error: %s\n',err.message);
  %err.identifier
end
