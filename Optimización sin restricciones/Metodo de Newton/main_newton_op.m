clc
pkg load symbolic
syms x y 
%  Metodo de Newton Optimización
% Israel Delgado
% Anthony Dominguez
% Cristiam Romero
% 13/1/2022
%
% Ejercicios metodo de Newton Optimización
%

% Ejercicio
f = 2*x^3*y^2-7*x*y+x^2+3*y;
x0 =1;
y0 =1;
Tol = 1E-5;

[msg, xi, yi, k] = newton_op (f,x0,y0, Tol= 1E-6);

msg
fprintf('xoptimo = %8.5f\n yoptimo = %8.5f\n', [xi;yi])
disp('')
fprintf('Numero de iteraciones: ')
disp(k)
disp('')

figure(1)
ezsurf(f)
