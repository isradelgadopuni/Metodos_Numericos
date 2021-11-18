% Autores: 
% Santiago Israel Delgado Pinos
% Anthony Vinicio Dominguez Chacha
% Cristiam Patricio Romero Toledo
% Fecha: 12/11/2021
% Descripcion: En el siguiente algoritmo se aplica el metodo de interpolacion 
% de Newton 

%Problema 1 
% Las salidas de voltaje y tension de un circuito estan dadas por los vectores
% "x" y "y" respectivamente, encuentre y grafique el polinomio de interpolacion
% de Newton que modela el comportamiento de los vectores
x = [0 1/6 1/3];
y = [0.540302 0.070737 -4.416147];


% Problema 2
% En un cirucito electronico, solo se devuelven valores si la potencia (x) esta
% en el intervalo indicaco, asi mismo cuando se encuentra en dicho intervalo
% presenta valores minimos y máximos. Encuentre y modele el polinomio de 
% interpolacion que modela el comportamiento del circuito.

%x = [2 0 -2];
%y = [15 -1 -17];


[acum] = interpolacion_new (x,y);
fprintf('Polinomio interpolacion Newton: %s \n')
fprintf(acum)

if x>max(x)|x<min(x)
  fprintf('t Punto fuera de rango. El resultado puede equivocado n');
end

xinterp =x;

xg=linspace(min(x),max(x));
x=xg;
yg=eval(acum);
plot(xg,yg,xinterp,y,'or')
grid 


