% Autores: 
%Israel Delgado
%Anthony Dominguez
%Cristiam Romero
%Fecha: 19-11-2021

%Descripcion: Realizar 2 ejemplos de diferenciacion numérica con los metodos de diferencias finitas divididas.


%Problema 1
%La siguiente ecuacion f modela el movimiento de una carga en un plano, calcule la velocidad de la carga en x=0.5 empleando
%el m3todo de diferencias finitas divididas. 

%f = @(x) -0.1*x.^4-0.15*x.^3-0.5*x.^2-0.25*x+1.2

%x_i=0.5;
%h=0.25;
%v_r1=-0.9125;
%v_r2=-1.75;

%Problema 2

%Suponga que la ecuacion f describe la evolución de la carga en una batería a lo largo del
%tiempo x, describa si en el instante x = 2*pi el dispositivo se está cargando o descargando.

f = @(x) cos(2*x)+cos(x)+1.5

x_i=2*pi;
h=0.25;
v_r1=0;
v_r2=-5;




fprintf("Adelante\n")
[f_prima, error_fp, f_2prima, error_f2p]=dfd_adelante(f, x_i, h, v_r1, v_r2)
fprintf("\nAtras\n")
[f_prima, error_fp, f_2prima, error_f2p]=dfd_atras(f, x_i, h, v_r1, v_r2)
fprintf("\nCentrada\n")
[f_prima, error_fp, f_2prima, error_f2p]=dfd_centradas(f, x_i, h, v_r1, v_r2)


