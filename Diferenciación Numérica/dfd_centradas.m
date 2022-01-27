%Ajuste de diferencias finitas centradas 
%   dfd_centradas(f, x_i) 
%       [f_prima, error_fp, f_2prima, error_f2p]=dfd_centradas(f, x_i, h, v_r1, v_r2)
%       f , x_i: Funcion a diferenciar para el punto x_i
%       f_prima, error_fp, f_2prima, error_f2p: Valores de la diferenciacion y error respecto al valor real
%       
%   Copyright 2021 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/11/18 15:00 $
%   Built-in function.

## Author: Delgado P, Dominguez C, Romero T
## Created: 2021-11-18

function [f_prima, error_fp, f_2prima, error_f2p]=dfd_centradas(f, x_i, h, v_r1, v_r2)

  f_prima=(-f(x_i+2*h)+8*f(x_i+h)-8*f(x_i-h)+f(x_i-2*h))/(12*h);
  f_2prima=(-f(x_i+2*h)+16*f(x_i+h)-30*f(x_i)+16*f(x_i-h)-f(x_i-2*h))/(12*h^2);
  error_fp=abs((v_r1-f_prima)/v_r1);
  error_f2p=abs((v_r2-f_2prima)/v_r2);

endfunction