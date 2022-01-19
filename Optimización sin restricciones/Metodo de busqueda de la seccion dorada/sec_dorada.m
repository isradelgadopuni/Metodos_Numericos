% Metodo de Busqueda de la Seccion Dorada
% Israel Delgado
% Anthony Dominguez
% Cristiam Romero
% 7/1/2022

% Datos de Entrada
% f = funcion unidimensiona
% ak = punto inicial del intervalo
% bk = limite superiort
% tol = tolerancia del metodo

% Datos de Salida
% D = Registro de los intervalos
% iter = Numero de iteraciones
% flambda = Vector que almacena la ecuaciones de la f(x)
% fmiu = Vector que almacena la ecuaciones de la f(x)

function [D, iter, flambda, fmiu] = sec_dorada (f, ak, bk, tol= 0.001)

%Condiciones iniciales del algoritmo
gama = 0.618;
lambdak = gama * ak + (1-gama) * bk;
miuk = (1-gama) * ak + gama * bk;

fl = f(lambdak);
fm = f(miuk);
flambda = [];
fmiu = [];
iter = 0;

while abs(bk-ak) >= tol
  iter = iter + 1;
  if fl > fm
    ak = lambdak;
    lambdak = miuk;
    fl = fm;
    miuk = (1-gama) * ak + gama * bk;
    fm = f(miuk);
  elseif
    bk = miuk;
    miuk = lambdak;
    fm = fl;
    lambdak = gama * ak + (1-gama) * bk;
    fl = f(lambdak);
  endif
  
  flambda(iter) = [fl];
  fmiu(iter) = [fm];
  D(iter,:) = [ak lambdak miuk bk];
  plot(lambdak, fl, '*b', miuk, fm, '*r')
  hold on
  
end  
endfunction
