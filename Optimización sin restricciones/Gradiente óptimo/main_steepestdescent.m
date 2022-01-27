clc
format long
%pkg load symbolic
warning('off','all')

% Autores: 
%Israel Delgado
%Anthony Dominguez
%Cristiam Romero
%Fecha: 9-1-2022

%Descripcion: Realizar 2 ejemplos de aplicacion del steepest descent


fprintf("\n\n\n---------------------------------------------- \n")
fprintf("    Ejercicio de ejemplo Steepest Descent    \n\n")
fprintf("---------------------------------------------- \n\n")

f = @(x1,x2) (x1-2)^4 + (x1-2*x2)^2; 
grad = {@(x1,x2) 4*x1^(3) - 24*x1^(2) + 50*x1 - 4*x2 - 32, @(x1,x2) -4*x1+8*x2};


x0=[0;3];
tol = 0.00001;
iter = 10000;
bk = 5; 
preal = [2;1];

try

  [D] = steepestdescent (f, grad, x0, tol, iter, bk, preal);
  [n,m]=size(D);
  display("Iteraciones")
  display(n)
  display("Punto estimado")
  display(D(n,2))
  display("Error relativo")
  display(D(n,3))
catch err
  fprintf('Error: %s\n',err.message);
  err.identifier
end


fprintf("\n\n\n---------------------------------------------- \n")
fprintf("                 Ejercicio 1                 \n\n")
fprintf("---------------------------------------------- \n\n")

% Considere el siguiente problema de optimización restringida no lineal
% f(x,y) = (x-3)^(2)+(y-3)^(2)
% Minimize la funcion con punto inicial en [1;3]

f = @(x1,x2) (x1-3)^(2)+(x2-3)^(2)
grad = {@(x1,x2) 2*x1-6, @(x1,x2) 2*x2-6};


x0=[1;3];
tol = 0.001;
iter = 1000;
bk = 5; 
preal = [3;3];



try

  [D] = steepestdescent (f, grad, x0, tol, iter, bk, preal);
  [n,m]=size(D);
  display("Iteraciones")
  display(n)
  display("Punto estimado")
  display(D(n,2))
  display("Error relativo")
  display(D(n,3))
catch err
  fprintf('Error: %s\n',err.message);
  err.identifier
end



fprintf("\n\n\n---------------------------------------------- \n")
fprintf("                 Ejercicio 2                 \n\n")
fprintf("---------------------------------------------- \n\n")


f = @(x1,x2) 15*x1^(4) + 15*x2^(2) - 32*x1^(8); 
grad = {@(x1,x2) -256*x1^7+60*x1^3, @(x1,x2) 30*x2};


x0=[0.5;0.5];
tol = 0.00001;
iter = 100;
bk = 0.5; 
preal = [0;0];


%try

  %[D] = steepestdescent (f, grad, x0, tol, iter, bk, preal);
  %[n,m]=size(D);
  %display("Iteraciones")
  %display(n)
  %display("Punto estimado")
  %display(D(n,2))
  %display("Error relativo")
  %display(D(n,3))
%catch err
  %fprintf('Error: %s\n',err.message);
  %err.identifier
%end
