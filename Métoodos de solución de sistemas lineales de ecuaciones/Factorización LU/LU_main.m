% Autores:
% Israel Delgado  
% Anthony Dominguez
% Cristiam Romero
% Fecha: 25-10-2021
% Descripcion: Realizar 2 ejemplos de sistemas de ecuaciones
% lineales que see resulevan mediante el metodo de LU


% Problema 1:
%   Dado el circuito y utilizando analisis de nodos
%   nos da un sistema de ecuaciones del modo
%   | 3 -7  6| |Va|   |-12|
%   | 1 -5  3| |Vb| = | 0 |
%   | 0  1 -3| |Vc|   |-4 |
%
%   encuentre los valores utilizando el metodo de factorización de LU


A = [3,-7,6 ;  1,-5,3  ; 0,1,-3]

b = [-12;0;-4]

try
  [L,U] = LU (A)
  L = L
  U = U
  Z = inv(L)* b
  fprintf("La solucion al sistema de ecuaciones es:\n" )
  x = inv(U)* Z
  catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end


% Problema 2:
%
% El siguiente circuito se resuleve mediante el uso de supernodos
% utilixando esta tecnica el circuito se reduce a uno de la forma
%   | 2  4 -3| |Va|   |36 | 
%   |-1  1  0| |Vb| = |12 |
%   | 0  1 -3| |Vc|   |-4 |
% Dado este sistema de ecuaciones resuelva utilizando la factorización LU

%A = [2,4,-3 ; -1,1,0  ; 0,1,-3]
A=[4,-1,0 ; -1,4,-1 ; 0,-1,4 ]

b = [36;12;-4]
try
  [L,U] = LU (A)
  Z = inv(L)* b
  fprintf("La solucion al sistema de ecuaciones es:\n" )
  x = inv(U)* Z
  catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end
