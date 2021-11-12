% Autores: 
%Israel Delgado
%Anthony Dominguez
%Cristiam Romero
%Fecha: 29-10-2021
%Descripcion: Realizar 2 ejemplos del m�todo de Cholesky
% 

%TESTEOS
%A = [4,-1,0,2 ;  -1,4,-1,0  ; 0,-1,4,1 ; 2,0,1,3];
%A = [4,-1,0,2 ;  -1,4,-1,0  ; 0,-1,4,1]
%A = [4,-1,0,2 ;  -1,4,-1,0  ; 0,-1,4,1 ; 2,8,1,3]
%b = [6;3;16;12];


% Problema 1:
%   
% Descripci�n del problema 1
%Escriba por inspecci�n la matriz de las ecuaciones de tensi�n de nodos del circuito de la figura. 
%Escribiendo la matriz

A = [0.3, -0.2, 0, 0; -0.2, 1.325, -0.125, -1; 0, -0.125, 0.5, -0.125; 0, -1, -0.125, 1.625]
b = [3; -3; 0; 6]


try
  [L,U] = alg_cholesky (A);
  L = L 
  U = U
  D = inv(L)* b;
  fprintf("La solucion al sistema de ecuaciones es:\n" )
  X = inv(U)* D
catch err
  fprintf('Error: %s\n', err.message);
  %err.identifier
end

%Problema 2:
%   
% Descripci�n del problema 1
%Escriba por inspeccion la matriz de las ecuaciones de tensi�n de nodos del circuito de la figura. 
%Escribiendo la matriz

A = [1.25, -0.2, -1, 0; -0.2, 0.2, 0, 0; -1, 0, 1.25, -0.25; 0, 0, -0.25, 0.75]
b = [0; 3; -1; 3]

try
  [L,U] = alg_cholesky (A);
  L = L 
  U = U
  D = inv(L)* b;
  fprintf("La solucion al sistema de ecuaciones es:\n" )
  X = inv(U)* D
catch err
  fprintf('Error: %s\n', err.message);
  %err.identifier
end