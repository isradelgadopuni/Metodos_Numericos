format long
clc;
% Metodo del trapecio
% 
% Israel Delgado
% Anthony Dominguez
% Cristiam Romero
% 2/12/2021
%
%Ejercicio 1

%Calcule la integral de la siguiente señal que es periodica desde t +- 5.
%f = 1.3 + 8*x -10*x^2 + x^3 - x^4 - 25*x^5
%

x1 = -5;
x0 = 5;
n = 100;
f = @(x) 1.3 + 8*x -10*x.^2 + x.^3 - x.^4 - 25*x.^5;

s = trapecio (f,x1,x0,n)

hold on
x_e = linspace(x0,x1,n);
y_e = f(x_e);
bar(x_e,y_e)
xlabel = "x";
ylabel = "y";
plot(x_e,y_e, 'LineWidth',3)  
hold off

%Ejercicio 2
%Calcule la carga que circuló en el tiempo t = 0 hasta t = 8 en una corriente regida por la expresion
%f = -0.2 - 3*x +10*x^2 + 20*x^3 - 30*x^4 + 25*x^5
%

%x1 = 0;
%x0 = 8;
%n = 2;
%f = @(x) -0.2 - 3*x +10*x.^2 + 20*x.^3 - 30*x.^4 + 25*x.^5;

%s = trapecio (f,x1,x0,n)

%hold on
%x_e = linspace(x0,x1,n);
%y_e = f(x_e);
%bar(x_e,y_e)
%xlabel = "x";
%ylabel = "y";
%plot(x_e,y_e, 'LineWidth',3)  
%hold off