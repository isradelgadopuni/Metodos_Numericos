## Copyright (C) 2022 IsraDelgadoP
##
## Copyright (C) 2022 EQUIPO
##

%Método de diferencias finitas para la ecuacion de onda
%   df_onda (alpha, L, u_inicial, v_inicial, del_x, del_t, t_f)
%       [u] = df_onda (alpha, L, u_inicial, v_inicial, del_x, del_t, t_f)
%       alpha: cte de la ecuacion de onda
%       L: longitud de la cuerda
%       u_inicial: funcion que define a la cuerda en condicion inicial 
%       V_inicial: condicion inicial de velocidad
%       del_x, del_t: Parámetros para determinar los puntos de analisis
%       t_f: tiempo en el cual debe detenerse el análisis 
%       
%   Copyright 2021 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/12/01 19:00 $
%   Built-in function.

## Author: Delgado P, Dominguez C, Romero T <IsraDelgadoP@LAPTOP-NEGRA>
## Created: 2022-01-03

function [u] = df_onda (alpha, L, u_inicial, v_inicial, del_x, del_t, t_f)
   
  lambda = alpha*del_t/del_x;
  n_x = L/del_x + 1;
  
  for i=1:n_x
    u1_i=u_inicial((i-1)*del_x);
    u(i,1)=u_inicial((i-1)*del_x);
    u(i,2)=u1_i+del_t*v_inicial*((i-1)*del_x);
  endfor

  for j=2:t_f/del_t
    uj1_1=0;
    u(1,j+1)=0;
    for i=2:n_x-1
      u(i,j+1)=2*(1-lambda^2)*u(i,j)+lambda^2*(u(i+1,j)+u(i-1,j))-u(i,j-1);
    endfor
    u(n_x,j+1)=0;
  endfor
  
endfunction
