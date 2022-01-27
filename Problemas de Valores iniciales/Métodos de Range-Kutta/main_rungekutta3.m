format long
%pkg load symbolic
warning('off','all')

% Autores: 
%Israel Delgado
%Anthony Dominguez
%Cristiam Romero
%Fecha: 15-12-2021

%Descripcion: Realizar 2 ejemplos de aplicación de los metodos de Runge-Kutta de orden 3 

%Metodo de ejemplo del libro 
%-------------------------------------------------------------------------------
% f = @(x,y) -2*x^3+12*x^2-20*x+8.5 
% Desde x = 0 hasta 4
% sol = @(x,y) 8.5*x - 10*x.^2 + 4*x.^3 - 0.5*x.^4
% Valor real 1.640533
try

  fprintf("Problema de ejemplo \n")

  f = @(x,y) -2*x.^3+12*x.^2-20*x+8.5;
  x0 = 0;
  x1 = 4;
  y0 = 1;
  h = 0.5;
  xsol = x0:0.01:x1;
  sol = @(x) 8.5*x - 10*x.^2 + 4*x.^3 - 0.5*x.^4 + 1;

  %f = @(x,y) exp(x+y);
  %x0 = 0;
  %x1 = 1;
  %y0 = 0;
  %h = 0.01;
  %xsol = x0:0.01:x1;
  %sol = @(x) -log(2-exp(x));

 
  [xv, yv, datos] = rktercero (f,x0,x1,y0,h, sol);

  subplot(3, 1, 1);
  plot (xsol, sol(xsol), "linewidth", 1, "r");
  hold on;
  plot (xv, yv, "linewidth", 1, "b");
  legend("Real", "Método")
  title('Problema de ejemplo - 0.5');

  [n,m] = size(datos);
  fprintf('Iter\tX\tY_real\tY_calc \tErr_v\tErr_r_p\t\n');
  for i=1:n
    fprintf('%d\t',i);
    for j=1:m
      fprintf('%d\t',datos(i,j));
    endfor
    fprintf('\n');
  endfor

catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end

%PROBLEMA 1:
%-------------------------------------------------------------------------
%El comportamineto de un circuito RC se puede modelar mediante 
%la siguiente ecuacion diferencial :
%_________________dy/dt=t^3*y-1.5*y_______________________________________
%Se sabe que al momento de encenderlo en t=0 este esta cargado con energia
%de 1[V],se requiere observar el comportamiento del circuito en un intervalo
%de tiempo de 0 a 2 segundos.

fprintf("\n\nProblema 1 \n")

f=@(x,y) (x.^3*y-1.5*y);
h=0.25;
x0=0;
x1=2;
y0=1;
xsol = x0:0.01:x1;
sol=@(x) exp(0.25*x.^4-1.5*x);

try
    
  [xv, yv, datos] = rktercero (f,x0,x1,y0,h, sol);
    
  subplot(3, 1, 2);
  plot (xsol, sol(xsol), "linewidth", 1, "r");
  hold on;
  plot (xv, yv, "linewidth", 1, "b");
  legend("Real", "Método");
  title('Problema 1 - 0.25');

  [n,m] = size(datos);
  fprintf('Iter\tX\tY_real\tY_calc \tErr_v\tErr_r_p\t\n');
  for i=1:n
    fprintf('%d\t',i);
    for j=1:m
      fprintf('%d\t',datos(i,j));
    endfor
    fprintf('\n');
  endfor

catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end

%PROBLEMA 2:
%-------------------------------------------------------------------------
%Si se llena el agua desde un tanque cilindrico vertical por medio de abrir
%una valvula en la base, el liquido fulira rapido cuando el tanque este llena
%Como resultado la tasa a la que el nivel del agua aumenta es :
%_________________dy/dt=-y+t-1____________________________________________
%Se requiere calcular el nivel del agua en el intervalo de tiempo 
%de 0 a 5 segundos.Ademas se sabe que el nivel del agua en t=0 es
%1 litro.

fprintf("\n\nProblema 2 \n")

y0=1;
x0=0;
x1=5;
h=0.1;
f=@(x,y) (-y+x-1);
xsol = x0:0.01:x1;
sol=@(x) x+3*exp(-x)-2;
  
try
         
  [xv, yv, datos] = rktercero (f,x0,x1,y0,h, sol);
      
  subplot(3, 1, 3);
  plot (xsol, sol(xsol), "linewidth", 1, "r");
  hold on;
  plot (xv, yv, "linewidth", 1, "b");
  legend("Real", "Método");
  title('Problema 2 - 0.1');

  [n,m] = size(datos);
  fprintf('Iter\tX\tY_real\tY_calc \tErr_v\tErr_r_p\t\n');
  for i=1:n
    fprintf('%d\t',i);
    for j=1:m
      fprintf('%d\t',datos(i,j));
    endfor
    fprintf('\n');
  endfor

catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end
