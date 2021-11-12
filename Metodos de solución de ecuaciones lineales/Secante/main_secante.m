% Autores: 
%Israel Delgado
%Anthony Dominguez
%Cristiam Romero
%Fecha: 11-10-2021
%Descripcion: Realizar 2 ejemplos del método de la Secante
%


% Problema 1:
%   
% Esta es una ecuación diferencial de segundo grado que se resuelve usando métodos numéricos
% dada por 
%
% q(t) = qo e^(-Rt/2L) cos(sqrt((1/LC)-(R/2L)^2)t
%
%Datos de entrada
%t=0
%q=qo=VoC
%Vo= el voltaje de la batería
%q/qo=0.01
%t=0.05
%L=5
%C=10^-4
%
%Luego de reordenar la ecuación y reemplazar valores tenemos la ecuación
%
% f(R)= exp(-0.005*R)*cos(sqrt(2000-0.01*R.^2)*0.05)-0.01
%
% Calcular la raíz usando el método de la secante en el intervalo [300,400]

f= @(x) exp(-0.005*x)*cos(sqrt(2000-0.01*x.^2)*0.05)-0.01;
a=300;
b=400;
datos=""
delta=5;
try 
  [raiz,datos,i] = m_secante(f, a, b);
  fprintf('El valor de corte en y=0 es x=%d, el número de iteraciones es %d\n',raiz,i);
  
  
  h=figure(1);
  x = a-delta:0.1:b+delta;
  plot (x, f(x), "linewidth", 4);
  hold on;
  plot([a a], [f(a-delta) -(f(a-delta))], 'k-', "linewidth", 2);
  text (a+0.1, 1, "a");
  plot([b b], [f(a-delta) -(f(a-delta))], 'k-', "linewidth", 2);
  text (b+0.1, 1, "b");
  plot([y y], [f(a-delta) -(f(a-delta))], 'k-', "linewidth", 2);
  text (y+0.1, 1, "y");
  
  legend ("f(x)");
  xlabel ("x");
  ylabel ("f(x)");
  set(gca, "linewidth", 4, "fontsize", 12)
  #set(gca, "xaxislocation", "zero");
  set(gca, "xaxislocation", "origin")
  #set(gca, "yaxislocation", "zero");
  set(gca, "yaxislocation", "origin");
  set(gca, "box", "on")
  
  
  [n,m] = size(datos)
  fprintf('Iter\ta\tb\traiz\tf(a)\t\tf(b)\tf(raiz)\t\terror\n');
  for i=1:n
    fprintf('%d\t',i);
    for j=1:m
      fprintf('%d\t',datos(i,j));
    endfor
    fprintf('\n');
  endfor
   
catch err
  fprintf('Error: %s\n', err.message);
  %err.identifier
end

hold off;

%Problema 2
%
%Una viga en I simplemente apoyada se carga
%como se muestra. La deflexión, y, de la línea central de la viga
%en función de la posición, x, viene dada por la ecuación:
%
% y = wo * x      (7L^4-10L^2x^2+3x^4)
%     360 L E I
%
%Donde 
%L=4 
%E=70 
%I =52.9x10^-6
%wo= 20
%
%Reemplazando estos valores en la ecuación tenemos
%
% y = 6721.277043x - 600.11340217x^3 + 11.25213791 x^5
%

f= @(x) 6721.277043*x - 600.11340217* x.^3 + 11.25213791* x.^5
a=1.5;
b=2.5;
delta=5;
datos="";

 try 
  [raiz,datos,i] = m_secante(f, a, b);
  fprintf('El valor de corte en y=0 es x=%d, el número de iteraciones es %d\n',raiz,i);
  
  
  h=figure(1);
  x = a-delta:0.1:b+delta;
  plot (x, f(x), "linewidth", 4);
  hold on;
  %plot([a a], [f(a-delta) -(f(a-delta))], 'k-', "linewidth", 2);
  %text (a+0.1, 1, "a");
  %plot([b b], [f(a-delta) -(f(a-delta))], 'k-', "linewidth", 2);
  %text (b+0.1, 1, "b");
  %plot([y y], [f(a-delta) -(f(a-delta))], 'k-', "linewidth", 2);
  %text (y+0.1, 1, "y");
  
  legend ("f(x)");
  xlabel ("x");
  ylabel ("f(x)");
  set(gca, "linewidth", 4, "fontsize", 12)
  #set(gca, "xaxislocation", "zero");
  set(gca, "xaxislocation", "origin")
  #set(gca, "yaxislocation", "zero");
  set(gca, "yaxislocation", "origin");
  set(gca, "box", "on")
  
  
  [n,m] = size(datos)
  fprintf('Iter\ta\tb\traiz\tf(a)\t\tf(b)\tf(raiz)\t\terror\n');
  for i=1:n
    fprintf('%d\t',i);
    for j=1:m
      fprintf('%d\t',datos(i,j));
    endfor
    fprintf('\n');
  endfor
   
catch err
  fprintf('Error: %s\n', err.message);
  %err.identifier
end

hold off;
