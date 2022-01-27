format long

% Autores: 
%Israel Delgado
%Anthony Dominguez
%Cristiam Romero
%Fecha: 1-12-2021

%Descripcion: Realizar 2 ejemplos de integracion numerica con el método de Simpson

%Método de ejemplo para n  = 5
%Valor real 1.640533

fprintf("\nEjercicio de ejemplo \n")

a = -0.5;
b = 0;
k = 8;
f = @(x) exp(-1/(2*x.^2))/(x.^2);

res_13 = fsimpson13 (0, 0.32, 1, f)
res_38 = fsimpson38 (0.32, 0.8, 1, f)

final = res_13 + res_38

fprintf("\nEjercicio 1\n")

%Ejercicio 1

%Calcule la integral de la siguiente señal que es periodica desde t +- 5.
%f = 1.3 + 8*x -10*x^2 + x^3 - x^4 - 25*x^5
%Valor real -2070.333333333343

a = -5;
b = 5;
k = 5;
f = @(x) 1.3 + 8*x -10*x.^2 + x.^3 - x.^4 - 25*x.^5;

res_13 = fsimpson13 (a, b, k, f)
res_38 = fsimpson38 (a, b, k, f)

fprintf("\nEjercicio 2\n")

%Ejercicio 2
%Calcule la carga que circuló en el tiempo t = 0 hasta t = 8 en una corriente regida por la expresion
%f = -0.2 - 3*x +10*x^2 + 20*x^3 - 30*x^4 + 25*x^5
%Valor real 917747.7333333333954

a = 0;
b = 8;
k = 2;
f = @(x) -0.2 - 3*x +10*x.^2 + 20*x.^3 - 30*x.^4 + 25*x.^5;

res_13 = fsimpson13 (a, b, k, f)
res_38 = fsimpson38 (a, b, k, f)