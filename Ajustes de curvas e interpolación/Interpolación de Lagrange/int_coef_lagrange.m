%Ajuste con interpolación de Lagrange 
%   int_lagrange(x, y) 
%       [ec_coef] = int_lagrange(x, y, tipo)
%       x , y: Vectores con las entradas
%       ec_coef: string de los coeficientes de salida
%       
%   Copyright 2021 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/11/11 15:00 $
%   Built-in function.

## Author: Delgado P, Dominguez C, Romero T
## Created: 2021-11-12

function [ec_coef] = int_coef_lagrange (x, y)
  
  n=length(x);
  matr_x=ones(n,n);
  vect_y=y';
  
  for i=2:n
    for j=1:n
      matr_x(j,i)=(x(j))^(i-1);
    endfor
  endfor
  
  b_1=inv(matr_x);
  b=b_1*vect_y;
 
  ec_coef = "";
  
  for i=0:n-1
    coef = strcat(mat2str(b'(i+1)), "*x.^", mat2str(i),"+");
    ec_coef = strcat(ec_coef, coef);
  endfor
  ec_coef(length(ec_coef))="";
  %func_coef = str2func(ec_coef, "x")
endfunction