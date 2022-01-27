%   SPLINE_ CUADRATICO(N,X,Y,WX,WN) 
%       [M1,B]=splines2(x,y))
%M1=Matriz de coeficientes de las ecuaciones de las diferentes condiciones
%b=Matriz de coeficientes 
%x=vector con los valores de entrada(abscisas)
%y=vector con los valores de entrada(ordenadas)

function [M1,b]=splines2(x,y) 
y = transpose(y);
x = transpose(x);
[n,~] = size(x);
M_aux = [x(1,1) y(1,1)];
for i=2:2:2*(n-2)
    M_aux(i,1) = x(0.5*i+1,1); 
    M_aux(i+1,1) = x(0.5*i+1,1);
    M_aux(i,2) = y(0.5*i+1,1);
    M_aux(i+1,2) = y(0.5*i+1,1);
end
 
M_aux(i+2,1) = x(n,1); 
M_aux(i+2,2) = y(n,1);
[n,~] = size(M_aux);
%1. Es continua y pasa por 
for i=1:2:(n-1)
    M1(i,1+1.5*(i-1)) = M_aux(i,1).^2;
    M1(i,2+1.5*(i-1)) = M_aux(i,1); 
    M1(i,3+1.5*(i-1)) = 1;
    M1(i+1,1+1.5*(i-1)) = M_aux(i+1,1).^2;
    M1(i+1,2+1.5*(i-1)) = M_aux(i+1,1);
    M1(i+1,3+1.5*(i-1)) = 1;
end
%2. Primera derivada cero en los puntos de empalme
[n,~] = size(x);
for j=i+2:1:(i+2)+(n-2)-1
    M1(j,1+3*(j-(i+2))) = 2*x(j-(i+2)+2,1); 
    M1(j,2+3*(j-(i+2))) = 1;
    M1(j,4+3*(j-(i+2))) = -2*x(j-(i+2)+2,1); 
    M1(j,5+3*(j-(i+2))) = -1;
end
%3. condiciones superficiales, segunda derivada igual a cero en los extremos 
M1(j+1,1) = 2*x(1,1); 
M1(j+1,2) = 1; 
b = zeros(1,(2*n-2)+(n-2)+1); 
for i=1:(2*n-2)
    b(1,i) = M_aux(i,2);
end
b = transpose(b);
end

