% Metodo de Busqueda de la Seccion Dorada
% Israel Delgado
% Anthony Dominguez
% Cristiam Romero
% 7/1/2022

% Realizar ejercicicios del metodo de busqueda de la seccion dorada

% La funcion modela el comportamiento en la carga de un capacitor a lo largo del tiempo

f = inline('x^2 + 2*x')
ak = -3;
bk = 5;
tol = 0.001;

[D, iter, flambda, fmiu] = sec_dorada (f, ak, bk, tol);

D
iter
flambda'
fmiu'
x = ak:0.1:bk;
y = x.^2 + 2*x;
plot(x,y)
hold on

