## Copyright (C) 2022 IsraDelgadoP
##
## Copyright (C) 2022 EQUIPO
##

%Método de diferencias finitas para la ecuacion de calor
%   df_calor (N, To, Tf, Xf, qg, kc, qs, tipo)
%       [Tx] = df_calor (N, To, Tf, Xf, qg, kc, qs, tipo)
%       N: puntos de analisis 
%       To, Tf: Temperatura inicial y final
%       Xf: Longitud de la barra
%       qg: generacion de calor
%       kc: conductividad
%       qs: flujo de calor
%       
%   Copyright 2021 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/12/01 19:00 $
%   Built-in function.

## Author: Delgado P, Dominguez C, Romero T <IsraDelgadoP@LAPTOP-NEGRA>
## Created: 2022-01-03

function [Tx] = df_calor (N, To, Tf, Xf, qg, kc, qs, tipo)
   
  

  if tipo==1
    n=N-2;
  elseif tipo==2    
    n=N;
  endif  
  
  
  Ts=To;
  Xo=0;
  L=Xf;
  h=(Xf-Xo)/(N-1);
  S=(h^2)*qg/kc;
  A=toeplitz([2,-1,zeros(1,n-2)]);
  B=zeros(n,1);
  B(:,1)=S;
  B(1,1)=S+To;
  
  if tipo==1
    B(n,1)=S+Tf;
    Tx=inv(A)*B;
  elseif tipo==2    
    A(n,n)=-1;
    A(n,n-1)=0;
    A(n,n-2)=1;
    S1=2*qs*h/kc;
    B(n,1)=S1;
    Tx=inv(A)*B;
    Tx1=Tx(1:n-1:1);
  endif
  
endfunction