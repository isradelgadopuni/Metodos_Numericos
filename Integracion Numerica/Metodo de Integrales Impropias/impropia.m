% Integrales Impropias
% Israel Delgado
% Anthony Dominguez
% Cristiam Romero
%
% Datos de Entrada
% f = función
% a = Limite inferior
% b = Limite superiorto
%
% Datos de Salida 
% I = Valor de la integral calculado


function I = impropia (g,a,b)
 syms x t u
   %Proceso integral numerica
   %Solo el limite superior es infinito
   %Se aplica la sustictucion t = 1/x para quitar el infinito de la integral
   %Una vez los limites son reales se aplica la sustitución
   % u = 2x-a-b
   %      b-a
   %Para conseguir que este en un intervalo entre -a y a
   %Y con esto podemos utilizar las tablas para hallar el valor
   t = 1/x;
   dx = -t.^-2;
   sust = subs(g,x,1/t);
   f_n = dx * sust;
   %a = 0;
   %b = 1;
   %u = (2*t - a - b) / (b - a)
   %t = (u+1)/2;
   sust2 = subs(f_n,t,(u+1)/2);
   du = 1/2;
   f_n2 = -du *sust2;
   
   
   %Los limites son 
   % a = -1
   % b = 1
   %Se aplica Gauss Lengendre 
   y_0 = subs(f_n2,u,0);
   y_1 = subs(f_n2,u,(sqrt(15)/5));
   y_2 = subs(f_n2,u,(-sqrt(15)/5));
   
   I = (((8/9)*double(y_0)) + ((5/9)*double(y_1)) + ((5/9)*double(y_2)));

endfunction
