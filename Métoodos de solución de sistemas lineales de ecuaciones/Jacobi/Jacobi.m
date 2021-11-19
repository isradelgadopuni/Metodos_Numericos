% Metodo de Jacobi
%
% Datos de Entrada
% A = Matriz A
% b = Matriz b
% x0 = Valor inicial
% tol = valor de la tolerancia
% kmax = numero de iteraciones
%
% Datos de salida
% x = Vector de salida solucion 
%

function [x,k] = Jacobi (A,b,x0,tol=0.001,kmax)
x(:,1)= x0
for k = 1: kmax
  for i = 1: length(x0)
    suma_ax = 0;
    for j = 1: length(x0)
      if i~=j
        suma_ax = suma_ax + A(i,j)* x(j,k);
      endif
    endfor
    x(i,k+1) = 1/A(i,i)*(-suma_ax + b(i));
  endfor
  if norm(x(:, k+1) - x(:,k) ) < tol
    return
  endif

end
