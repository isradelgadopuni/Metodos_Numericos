pkg load symbolic
clc
syms x
warning('off','all')
% Integrales Impropias
% Israel Delgado
% Anthony Dominguez
% Cristiam Romero
%
% Problema 1
% La siguiente ecuación modela la función de densidad de probabiliddad o pdf,
% nos interesa conocer el area en un intervalo de 1 a infinito, modelado por
% la ecuación
%           2
%         -x
% f(x) = e
% Encuentre dicho valor
% R = 0.1394
real = 0.1394;

g = exp(-x^2)
a = 1;
b = inf;

I = impropia(g,a,b)

error = abs((real - I))/real
pause(10)

%Ejemplo del Libro

g = exp(-(x^2)/2)
a = -inf;
b = 1;
real = 0.8409;

I_2 = double(int(g,-2,1))

I = impropia2(g,a,b)

Res = (1/sqrt(2*pi))*(I + I_2)

error = abs((real - Res))/real