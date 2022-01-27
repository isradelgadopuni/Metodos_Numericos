%clc
%format long
%pkg load symbolic
warning('off','all')

% Autores: 
%Israel Delgado
%Anthony Dominguez
%Cristiam Romero
%Fecha: 3-1-2022

%Descripcion: Realizar 2 ejemplos de aplicacion del metodo de diferencias finitas
%para la ecuacion de Poisson y de Laplace


fprintf("\n\n\nEjercicio de ejemplo Laplace \n\n")

ua=100;
ub=0;
uc=0;
ud=0;
n=27;
m=27;
m_iter=1000;
tol=0.000001;
tipo="l";
f=0;
g=0;

[u, iter] = df_poisson (ua, ub, uc, ud, n, m, m_iter, tol, tipo, f, g)

fprintf("\n\n\nEjercicio de ejemplo Poisson \n\n")

ua=0;
ub=0.5;
uc=0;
ud=0.5;
n=10;
m=10;
m_iter=1000;
tol=0.001;
tipo="p";
f = @(x,y) 0;
g = @(x,y) 200*y;

%[u, iter] = df_poisson (ua, ub, uc, ud, n, m, m_iter, tol, tipo, f, g)


%Problema
