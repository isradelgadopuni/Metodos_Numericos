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
%para la ecuacion de onda




%Problema

% 

fprintf("\n\n\nEjercicio 1\n\n")

%Se tiene una cuerda de longitud = 1cm que en t=0 está descrita por sen(pi*x) y v_inicial=0
%Su ecuación de onda dice que la cosntante alpha es 2
%Encuentre la evolucion de los valores de u(x,t) cada 0.2cm 

alpha=2;
L=1;
del_x=0.2;
del_t=0.1;
u_inicial = @(x) sin(pi*x);
v_inicial=0;
t_f=1;

[u] = df_onda (alpha, L, u_inicial, v_inicial, del_x, del_t, t_f)


fprintf("\n\n\nEjercicio 2\n\n")

%Se tiene una cuerda de longitud = 10cm que en t=0 está descrita por sen(2pi*x) y v_inicial=1
%Su ecuación de onda dice que la cosntante alpha es 4
%Encuentre la evolucion de los valores de u(x,t) cada 0.1cm 

alpha=4;
L=10;
del_x=0.5;
del_t=0.1;
u_inicial = @(x) sin(2*pi*x);
v_inicial=1;
t_f=1;

[u] = df_onda (alpha, L, u_inicial, v_inicial, del_x, del_t, t_f)