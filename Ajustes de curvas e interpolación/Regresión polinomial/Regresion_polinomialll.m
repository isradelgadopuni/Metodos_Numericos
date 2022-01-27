%REGRESIÓN POLINOMIAL    Ajuste de curvas.
%   REGRESION POLINOMIAL(datos,grado,x,y,M,b) 
%       [y_x ,error,vect,p]=Regresion_polinomial(n,m,x,y,M,b)
%       y_x = función apromixada
%       error = error de la curva
%       vect = vector con todos los valores desde el punto 
%       inicial de las abscisas hasta el punto final
%       p = vector con todos los valores evaluados en la funcion obtenida
%       n = numero de datos a ingresar (longitud del vector con los valores iniciales)
%       m = grado del polinomio
%       x = vector con los valores dados de las abscisas
%       y = vector con los valores dados de las ordenadas
%       M = matriz de ceros
%       b = matriz de ceros


function [y_t,y_x,vect,c]=Regresion_polinomialll(n,m,x,y,M,b)
  
%Se generan la matriz y el vector
for i=1:m+1
  for j=1:m+1
    for k=1:n
      M(i,j)=M(i,j)+x(k)^(i+j-2);
    endfor
  endfor
endfor

for i=1:m+1
  for k=1:n
    b(i)=b(i)+(x(k)^(i-1))*y(k);
  endfor
endfor
%Se calcula el vector solucion
a=inv(M)*b
%Se coloca el vector de coeficientes en orden decreciente de la potencia
c=fliplr(a');

%Se ewcribe el polinomio de regresion
%-------------------------------
y_x=  poly2str(c,"t")
y_t=y_x
%--------
y_x=@(t) y_x
%-----------
 %%%%%%%%%%%%%%%%%%%

%Se asignan valores al vector t
%------------------------------------
t=x(1):0.01:x(n);
vect=t;
%-------------------

%Se evalua el polinomio
%-------------------------p=polyval(c,t);

%Para calcular el error cuadratico medio 
%t=x;
%z=polyval(c,t);

%for k=1:n
 % e(k)=(y(k)-z(k))^2;
%endfor
%et=0;
%for k=1:n
 % et=et+e(k);
%endfor

%ecm=sqrt(et)/n
%---------------
%ecm
%error=ecm
%------------------

endfunction
