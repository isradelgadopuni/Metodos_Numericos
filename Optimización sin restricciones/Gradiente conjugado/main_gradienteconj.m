syms x y 
%  Metodo de Newton Optimizacion
% Israel Delgado
% Anthony Dominguez
% Cristiam Romero
% 13/1/2022
%
% Ejercicios metodo de Gradiente conjugado
%

% Ejercicio 1:
%Se requiere obtener el valor que minimice la disipación de una red 
%eléctrica , la cual viene dado por la siguiente funcion
%---------------C(x,y)=2*x^2+2*x*y+y^2-y+x---------------------------
%donde x representa la corriente , e y el valor de voltaje en la red.
%f = 2*x^2+2*x*y+y^2-y+x; %----------------S-------------------

%Ejercicio 2:
%Se conoce mediante la ecuación de Laplace que el valor de voltaje
%espacial de una varilla metalica es de:
%----------------V(x,y)=x^2+2*y^2-4*x+2*x*y---------------------
%Determine las cordenadas (x,y) en donde la varilla tiende a obtener 
%la menor cantidad de voltaje
f=x^2+2*y^2-4*x+2*x*y;
ezsurf(f)
fn=inline(f);
fobj=@(x) fn(x(:,1),x(:,2));
x0=[1 1]; 
maxiter=40; 
tol=1e-3;
iter=1;
[xt,msg]=grad_conjugado(f,x0,maxiter,tol);
fprintf('solución óptima x=[%f , %f]\n' ,xt(1),xt(2));
fprintf('Valor óptimo f(x,y)=%f \n',fobj(xt));
