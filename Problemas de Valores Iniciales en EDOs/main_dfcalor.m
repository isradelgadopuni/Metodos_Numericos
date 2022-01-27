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
%para la ecuacion de calor

%Problema 1

% Se tien una barra de seccion transversal constante de 1m de longitud y conductividad
% 20 W/mK la cual se mantiene a 30º en x=0 y con generacion interna de calor de 200 Wm-3
% Calcular la distribucion de temperatura a lo largo de la barra cuando en x = L existe
% flujo de calor constante qs=10Wm-2

fprintf("\n\n\nEjercicio 1\n\n")

N=10;
To=30;
Tf=0;
Xf=1;
qg=200;
kc=20;
qs=10;
tipo=2;

[Tx] = df_calor (N, To, Tf, Xf, qg, kc, qs, tipo)

%Problema 2

% Se tiene una barra de seccion transversal constante de 30cm de longitud y conductividad
% 16 W/mK la cual se mantiene a 100ºC en x=0 y 30ºC en x=xf=L y con generacion interna 
% de calor de 20 Wm-3. 
% Calcular la distribucion de la temperatura a lo largo de la barra.

fprintf("\n\n\nEjercicio 2\n\n")

N=10;
To=100;
Tf=30;
Xf=0.3;
qg=20;
kc=16;
qs=0;
tipo=1;

[Tx] = df_calor (N, To, Tf, Xf, qg, kc, qs, tipo)
