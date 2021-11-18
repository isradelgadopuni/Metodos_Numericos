% Interpolacion de Newton
%
% Datos de Entrada
% x
% y
%
% Datos de Salida
% 
% 
% 

function [acumulador, x_a, y_a] = interpolacion_newton (x,y)
x_a = x;
y_a = y;

d = zeros(length(y));
d(:,1) = y';
for k=2:length(x)
  for j =1:length(x)+1-k
    d(j,k)=(d(j+1,k-1)-d(j,k-1))/(x(j+k-1)-x(j));
  end
end

for w=1:length(x)
  ds =num2str(abs(d(1,w)));
  if w > 1
    if x(w-1) < 0
      signo_1 = "+";
    else
      signo_1 = "-";
    end
  end
  
  if d(1,w) < 0
    signo_2 = "-";
  else
    signo_2 = "+";
  end
  
  if (w == 1)
    acumulador = num2str(d(1,1));
  elseif (w == 2)
    x_t = x'
    polact =['(x_t signo_1 num2str(abs(x(w-1)))')'];
    actual = [ds '*' polact];
    acumulador= [acumulador, signo_2, actual];
   else
    polact=[polact '.*' '(x_t sg1 num2str(abs(x(w-1))) ')' ];
    actual=[ds '*' polact];
    acumulador=[acumulador sg2 actual];
  end
endfunction
