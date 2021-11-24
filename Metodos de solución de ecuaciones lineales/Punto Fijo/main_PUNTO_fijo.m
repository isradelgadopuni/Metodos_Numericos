%pkg load symbolic
%syms z

% Autores: 

%
% Fecha:
% Descripcion: 
%


% Problema 1:
%   
% La ecuacion que se detalla a continuacion nos muestra la corriente a la salida dependiendo del voltaje que se le aplique a la entrada
% calcule que voltaje se aplica, para producir una salida de 0 en la corriente en dicho punto 
%

% Problema 2
%
% La proporcion de un transformador esta denotada por la siguiente ecuacion, la misma que nos da la proporcion con la que se multiplica o divide el voltaje en funcion
% de lo requerido, utilizando esta expresion encuentre las raices en las cuales aplicando un voltaje a la entrada produce que la salida sea 0, es decir encuentre los fallos en 
% la proporcion que no proporcionan un correcto funcionamiento del transformador.

%f = @(x) (2*x.^3 - 11.7*x.^2 -5)/(-17.7);
%f = inline(f)
%g =  @(x) 2*x.^3 - 11.7*x.^2 + 17.7*x - 5;

%f2 = @(z) (2*z.^3 - 11.7*z.^2 -5)/(-17.7);
%%%%%%%%%%%
%df = diff(f2,z)

%%%%%%%%%%%%%%



f = @(x) x - exp(-x)
g = @(x) exp(-x)
xi = 1;
datos=""

try
  
  [xn,datos,i] = PUNTO_FIJO (f, g, xi);
  fprintf('El valor de corte es y=%d, el número de iteraciones es %d\n',xn,i);
  hold on
  ezplot(g)
  grid on
  legend ("f(x)");
  xlabel ("x");
  ylabel ("f(x)");
  plot(xn,0,"x")
  hold off
  
  
  [n,m] = size(datos)
  fprintf('i        Raiz        EA    \n');
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

