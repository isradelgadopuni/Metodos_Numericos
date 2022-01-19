clear all;clc;
%EULER    Solución de una ecuación diferencial (didáctica).
%   EULER(A,B,Y_I,FUNT,H) llenar
%       [t,y] = Eulerr(x_i,x_f,y_i,f,h)
%       t= vector con todos los valores de t(variable independiente) a evaluar
%       y=vector con las soluciones de la EDO para cada valor de t
%       x_i=extremo inicial de t
%       x_f=extremo final de t
%       y_i=valor inicial (condición inicial)
%       f = función después de dy/dt
%       h=paso del intervalo

function [t,y]=Eulerr(x_i,x_f,y_i,f,h)
t=x_i:h:x_f;
n=length(t);  
y(1)=y_i;
for i=1:n-1
  y(i+1)=y(i)+h*f(t(i),y(i));
endfor
endfunction

