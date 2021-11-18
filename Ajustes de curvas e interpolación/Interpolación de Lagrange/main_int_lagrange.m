% Autores: 
%Israel Delgado
%Anthony Dominguez
%Cristiam Romero
%Fecha: 12-11-2021

%Descripcion: Realizar 2 ejemplos de ajuste con los polinomios de interpolación de Lagrange.
% 

%x=[1, 4, 6]
%y=[0, 1.386294, 1.791760]
%x0=2

%x=[0, 2, 3]
%y=[0.5, 2, 0.5]
%x0=2

%Problema 1 
% Las salidas de voltaje y tension de un circuito estan dadas por los vectores
% "x" y "y" respectivamente, encuentre y grafique el polinomio de interpolacion
% de Newton que modela el comportamiento de los vectores y estime el valor de x=1/2

x = [0 1/6 1/3]
y = [0.540302 0.070737 -4.416147]
x0=1/2

% Problema 2
% En un cirucito electronico, solo se devuelven valores si la potencia (x) esta
% en el intervalo indicado, asi mismo cuando se encuentra en dicho intervalo
% presenta valores minimos y máximos. Encuentre y modele el polinomio de 
% interpolacion que modela el comportamiento del circuito y la estimacion en x=1.

%x = [2 0 -2];
%y = [15 -1 -17];
%x0 = 1;

try
  [des_sum] = int_lagrange (x, y, x0)
  [x_a, y_a] = int_graf_lagrange (x, y); 
  [ec_coef] = int_coef_lagrange (x, y)
  
  plot(x_a, y_a, "-")
  %legend(ec_coef, "xo", "P. iniciales");
  grid on;
  hold;
  plot(x0, des_sum, "kd")
  %legend("x0");
  %hold;
  plot(x, y, "ro")  
  %legend("Puntos iniciales");
  legend(ec_coef, "xo", "P. iniciales");
  hold;
catch err
  fprintf('Error: %s\n', err.message);
  err.identifier  
end