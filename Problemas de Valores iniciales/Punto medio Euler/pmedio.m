clear all;clc
%PUNTO MEDIO    Solución de una ecuación diferencial (didáctica).
%   PMEDIO(A,B,Y_I,FUNT,H) llenar
%       [t,y] = pmedio(x_i,x_f,y_i,f,h)
%       t= vector con todos los valores de t(variable independiente) a evaluar
%       y=vector con las soluciones de la EDO para cada valor de t
%       x_i=extremo inicial de t
%       x_f=extremo final de t
%       y_i=valor inicial (condición inicial)
%       f = función después de dy/dt
%       h=paso del intervalo

function [t,y]=pmedio(x_i,x_f,y_i,f,h)
t=x_i:h:x_f;
n=length(t);  
y(1)=y_i;
for i=1:n-1
  k1=f(t(i),y(i));
  k2=f(t(i)+h/2,y(i)+h/2*k1);
  y(i+1)=y(i)+h*k2;
endfor
endfunction

