% Autores: 
%Israel Delgado
%Anthony Dominguez
%Cristiam Romero
%Fecha: 11-11-2021

%Descripcion: Realizar 2 ejemplos de ajuste con ecuaciones no lineales. (Linealización de relaciones no lineales). 
% 


%Ejercicio 1

%Se tiene una población de bacterias que se sabe que sigue el modelo exponencial de Malthus. Cada veinte minutos se toman
%mediciones de la población existente y se obtienen los datos de la siguiente tabla: 

% t = [0,1,2,3,4,5]
% N_t = [100,200,400,800,1600,3200]

%Encontrar la ecuación que rige el crecimiento de esta población de bacterias

%x = [0,1,2,3,4,5];
%y = [100,200,400,800,1600,3200];
%tipo=1;

%try
 %[calpha,cbeta,f] = ajuste_nl (x,y,tipo)
 %fplot(f, [0, 6])
 %hold on;
 %plot(x,y, "bo")
%end


%Problema 2:
% El brazo de un robot equipado con un laser debera realizar perforaciones en
% serie, de un mismo radio, en placas rectangulares de 15*10 pulgadas. Las
% perforaciones deberan estar ubicadas en la placa como se muestra en la tabla 


% x(in)         |   1   |   2   |   3   |   4   |   5   |
%-------------------------------------------------------|
% y(in)         |  0.5  |  1.7  |  3.4  |  5.7  |  8.4  | 
%-------------------------------------------------------|

% El recorrido del brazo del robot debera ser suave, es decir, sin movimientos
% en zigzag, pero al mismo tiempo debera ser lo mas corto posible por lo que
% se debe realizar un ajuste de los datos a una ecuacion de potencia

x = [1, 2, 3, 4, 5];
y = [0.5, 1.7, 3.4, 5.7, 8.4];
tipo=2;


try
 [calpha,cbeta,f] = ajuste_nl (x,y,tipo)
 fplot(f, [0, 6])
 hold on;
 plot(x,y, "bo")
end