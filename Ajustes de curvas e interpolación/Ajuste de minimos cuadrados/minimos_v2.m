% Autores: 
% Santiago Israel Delgado Pinos
% Anthony Vinicio Dominguez Chacha
% Cristiam Patricio Romero Toledo
% Fecha: 8/11/2021
% Descripcion: En el siguiente algoritmo se aplica el metodo de ajuste por 
% minimos cuadrados.

%Problema 1:
%A continuacion se presentan los alargamientos de un resorte correspondientes 
%a las fuerzas de diferente magnitud que lo deforman

%|---------------------------------------------------------|
%|Fuerza (kg)   | 0     |   2   |    3   |    6   |    7   |
%|---------------------------------------------------------|
%|Longitud del  |0.120  | 0.153 | 0.170  | 0.225  | 0.260  |
%|Resorte (m)   |                                          |
%|---------------------------------------------------------|

%Determine por minimos cuadrados el polinomio de primer grado que representa la 
%funcion dada
F = [0, 2, 3, 6, 7];
L = [0.120, 0.153, 0.170, 0.225, 0.260 ];
try
 [m,b] = minimos_cV2 (F,L)
 y_a = m*F + b
 %Metodo grafico por dispersion de puntos 
 %plot(F,L, "bo")
 plot(F,y_a,F,L,"bo")
end

%Problema 2:
% El brazo de un robot equipado con un laser debera realizar perforaciones en
% serie, de un mismo radio, en placas rectangulares de 15*10 pulgadas. Las
% perforaciones deberan estar ubicadas en la placa como se muestra en la tabla 

%|--------------------------------------------------------------------|
%|x(in)         | 2.5   |  4.5  |   5.2  |   7.8  |    9   |   10.6   |
%|--------------------------------------------------------------------|
%|y(in)         |   8   |  7.4  |   6.2  |  5.3   |   4.2  |    5     |
%|--------------------------------------------------------------------|

% El recorrido del brazo del robot debera ser suave, es decir, sin movimientos
% en zigzag, pero al mismo tiempo debera ser lo mas corto posible por lo que
% se debe realizar un ajuste de los datos a un polinomio de grado 4 

%x= [2.5,  4.5,  5.2, 7.8,   9,    10.6 ];
%y =[ 8,  7.4,  6.2, 5.3,    4.2,    5  ];


%try
 %[m,b] = minimos_cV2 (x,y)
 %y_a = m*x + b
 %Metodo grafico por dispersion de puntos 
 %plot(F,L, "bo")
 %plot(x,y_a,x,y,"bo")
%end