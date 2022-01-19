% METODO DE EULER
%
% Israel Delgado
% Anthony Dominguez
% Cristiam Romero
%

% En el sistema de ecuaciones diferenciales mostrado a continuación 
% se proporcionan valores iniciales, y un tiempo de 0 a 5 segundo, 
% resuelva usando el metodo de Euler

x0 = [2,1.117];
ne = 2;
t0 = 0;
tf = 5;

dt = 1e-3;
n = (tf-t0)/dt;

[t,x] = euler (x0,t0,tf,dt,n,ne);

for i = 1:ne
  subplot(ne,1,i), plot(t,x(i,:))
end
