format long
%pkg load symbolic
warning('off','all')

% Autores: 
%Israel Delgado
%Anthony Dominguez
%Cristiam Romero
%Fecha: 1-12-2021

%Descripcion: Realizar 2 ejemplos de integracion numerica con el metodo de Simpson

%Metodo de ejemplo para n  = 5
%Valor real 1.640533

fprintf("\n\n\nEjercicio 1 de ejemplo Gauss-Chebyshev\n\n")

%Problema
%Resolver la integral entre -1 y 1 de x^4/((1-x.^2)^(1/2));

a = -1;
b = 1;
n=2; 
f = @(x) 1;
rreal = pi;

[resgcheb, error] = gchebyshev (f, a, b, n, rreal)

fprintf("\n\n\nEjercicio 2 de ejemplo Gauss-Chebyshev\n\n")

%Problema
%Resolver la integral entre -1 y 1 de x^4/((1-x.^2)^(1/2));

a = -1;
b = 1;
n=3; 
f = @(x) x.^4;
rreal = 3*pi/8;

[resgcheb, error] = gchebyshev (f, a, b, n, rreal)

%---------------------------------------------------------------

fprintf("\n\n\nEjercicio 1 de ejemplo Gauss-Laguerre\n\n")

%Problema
%Resolver la integral entre 0 e infinito de x^4*e^(-x)

a = 0;
b = Inf;
n=1; 
f = @(x) 3*x+4;
rreal = 7;


[resglag, error] = glaguerre2 (f, a, b, n, rreal)

fprintf("\n\n\nEjercicio 2 de ejemplo Gauss-Laguerre\n\n")

%Problema
%Resolver la integral entre 0 e infinito de x^4*e^(-x)

a = 0;
b = Inf;
n=2; 
f = @(x) x;
rreal = 1;


[resglag, error] = glaguerre2 (f, a, b, n, rreal)

%---------------------------------------------------------------

fprintf("\n\n\nEjercicio 1 de ejemplo Gauss-Hermite\n\n")

%Problema
%Resolver la integral entre -Inf e Inf de x^4*e^(-x^2)


a = -Inf;
b = Inf;
n=2; 
f = @(x) x.^2;
rreal = sqrt(pi)/2;

[resgher, error] = ghermite (f, a, b, n, rreal)

fprintf("\n\n\nEjercicio 2 de ejemplo Gauss-Hermite\n\n")

%Problema
%Resolver la integral entre -Inf e Inf de x^4*e^(-x^2)


a = -Inf;
b = Inf;
n=3; 
f = @(x) 1;
rreal = sqrt(pi);

[resgher, error] = ghermite (f, a, b, n, rreal)