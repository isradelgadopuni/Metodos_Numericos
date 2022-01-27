clc; clear;

%INTERPOLACION    Ajustes de curvas.
%   SPLINE_CUBICO(N,X,Y,WX,WN) 
%       [c,h]=spl3(n,x,y,wx=0,wn=0)
%       c = matriz de coeficientes de los polinomios
%       h = vector con coeficientes obtenidos mediante:h(i)=x(i+1)-x(i)
%       n = número total de coordenadas carte
%       x = vector con los puntos de las abscisas
%       y = vector con los puntos de las ordenadas
%       wx = valor entero a usar en la función
%       wn = valor entero a usar en la función

function [c,h]=spl3(n,x,y,wx=0,wn=0)
  for i=1:n-1
    h(i)=x(i+1)-x(i);
  endfor
  
  for k=1:n-2
    b(k)=6*((y(k+2)-y(k+1))/h(k+1)-(y(k+1)-y(k))/h(k));
  endfor
  
  M(1,1)=2*(h(1)+ h(2) );
  M(1,2)= h(2);
  B(1)=b(1)-h(1)*wx;
  M(n-2,n-3)=h(n-2);
  M(n-2,n-2)=2*(h(n-2)+h(n-1));
  B(n-2)=b(n-2)-h(n-1)*wn;
  
  for K=2:n-3
    M(k,k-1)=h(k);  
    M(k,k)=2*(h(k)+h(k+1));
    M(k,k+1)=h(k+1);
    B(k)=b(k);
  endfor

  aux=inv(M)*B'
  w(1)=wx;
  w(n)=wn;
  
  for j=2:n-1
    w(j)= aux(j-1);
  endfor

  for k=1:n-1
    U(k)=(y(k+1)-y(k))/h(k)-(h(k)/6)*(2*w(k)+w(k+1));
  endfor

  for k=1:n-1
    c(k,1)=(w(k+1)-w(k))/(6*h(k));
    c(k,2)=w(k)/2-3*x(k)*c(k,1);
    c(k,3)=U(k)-x(k)*w(k)+3*c(k,1)*x(k)^2;
    c(k,4)= -c(k,1)*x(k)^3 + (x(k)^2)*w(k)/2-x(k)*U(k)+y(k);
  endfor
  
  c;
   
endfunction
