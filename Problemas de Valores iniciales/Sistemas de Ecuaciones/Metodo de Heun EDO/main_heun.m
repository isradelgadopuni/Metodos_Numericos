% METODO DE HEUN
% Israel Delgado
% Anthony Dominguez
% Cristiam Romero
% 20/12/2021

%Problema
% El sistema de Ecuaciones considera un problema de valor inical, en el cual se 
% necesita calcular el valor de y desde el instante hasta el valor de 3
% Se proporciona como dato del problema el valor de y1 evaluado en 2
% Comporbar si este valor es el mismo mediante la resolución por el metodo de 
% Heun.

t0 = 0;
tf = 3;
y0 = [1;2];
ne = 2;
f = @(t,y) [1/y(2);y(1)^2];
h = 1/5;
n = round((tf-t0)/h);
t = linspace(t0,tf,n+1);
y = zeros(ne,n+1);
y(:,1)=y0;

y = heun (f,n,h,y,t);


[t',y']

tp = 2;
pos = round((tp-t0)/h+1);
disp(y(1,pos))
dato = abs(y(2,end)-y(2,1))

