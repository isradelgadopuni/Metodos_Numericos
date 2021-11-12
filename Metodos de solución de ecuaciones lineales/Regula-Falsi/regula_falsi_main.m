% Autores: 
%Israel Delgado
%Anthony Dominguez
%Cristiam Romero
%Fecha: 17-10-2021
%Descripcion: Realizar 2 ejemplos del método de Regula Falsi
%


% Problema 1:
%   
%   Descripción del problema 1
% 


%f = @(x) x.^3 - 10
%f = @(x) x .^ 3 + 4 * x .^ 2 - 10
%f = @(x) exp(x) - 4 + x
f = @(x) -x.^2 +5
a = 1;
b = 3;
delta=5;
datos=""

%----------------------------------------------------------------------------------

try 
  [y,datos,i] = regula_falsi (f, a, b);
  fprintf('El valor de corte en y=0 es x=%d, el número de iteraciones es %d\n',y,i);
  
  
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