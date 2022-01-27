% Autores: 
% Santiago Israel Delgado Pinos
% Anthony Vinicio Dominguez Chacha
% Cristiam Patricio Romero 
% Fecha: 16/12/2021

%PROBLEMA 1:
%-------------------------------------------------------------------------
%El comportamineto de un circuito RC se puede modelar mediante 
%la siguiente ecuación diferencial :
%_________________dy/dt=t^3*y-1.5*y_______________________________________
%Se sabe que al momento de encenderlo en t=0 este está cargado con energía
%de 1[V],se requiere observar el comportamiento del circuito en un intervalo
%de tiempo de 0 a 2 segundos.

f=@(t,y) (t^3*y-1.5*y);
h=0.05;
x_i=0;
x_f=2;
y_i=1;
y_exacto=@(x) exp(0.25*x.^4-1.5*x);

%PROBLEMA 2:
%PROBLEMA 2:
%-------------------------------------------------------------------------
%Si se llena el agua desde un tanque cilíndrico vertical por medio de abrir
%una válvula en la base, el líquido fulirá rápido cuando el tanque este llena
%Como resultado la tasa a la que el nivel del agua aumenta es :
%_________________dy/dt=-y+t-1____________________________________________
%Se requiere calcular el nivel del agua en el intervalo de tiempo 
%de 0 a 5 segundos.Además se sabe que el nivel del agua en t=0 es
%1 litro.
%y_i=1;
%x_i=0;
%x_f=5;
%h=0.25;
%f=@(t,y) (-y+t-1);
%y_exacto=@(x) x+exp(-x);



x_e1=x_i:h:x_f;
y_1=y_exacto(x_e1);
[t,y]=pmedio(x_i,x_f,y_i,f,h);
n=length(t); 

fprintf('t       y_aprox     y_verd    Error  \n');
for j=1:n
  fprintf("%1.2f  %8.4f  %9.4f  %7.4f \n" ,t(j),y(j),y_1(j),(y_1(j)-y(j))/y_1(j))
endfor
%__________________________________________________
%GRÁFICAS
plot(t,y,"r","linewidth", 2) %solución aproximada (rojo)
hold on;
%y_1=y_exacto(x_i:h:x_f);
plot(t,y_1,"b","linewidth", 2) %solución exacta (azul)
xlabel("Tiempo");
ylabel("y(t)");
legend("y_{aprox}","y_{exacta}","fontsize",14,"FontWeight","bold");
title("Solución de una EDO")





