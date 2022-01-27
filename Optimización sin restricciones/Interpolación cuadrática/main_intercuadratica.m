% Autores: 
% Santiago Israel Delgado Pinos
% Anthony Vinicio Dominguez Chacha
% Cristiam Patricio Romero 
% Fecha: 10/01/2022
% Descripcion: En el siguiente algoritmo se aplica el m�todo de 
%interpolaci�n cuadr�tica para la optimizaci�n de funciones.
%_______________________________________________________________________

%-------------PROBLEMA 1---------------------------------------------
%Se sabe que el consumo energ�tico de un circuito est� dado por la funci�n:
%---------------f(x)=2*sin(x)-0.1*x.^2----------------------------------
%Determine el momento de mayor consumo y su valor en KW/H.

%f=@(x) 2*sin(x)-0.1*x.^2;
%x0=0;
%x1=1;
%x2=4;
%_______________________________________________________________________

%_______________________________________________________________________
%--------------PROBLEMA 2----------------------------------------------
%Se requiere construir una caja,sin tapa,partiendo de una l�mina
%rectangular de 32cm de largo por 24cm de ancho.Para ello se 
%recortar� un cuadradito en cada esquina y se doblar�.�Cu�l debe ser
%el lado del cuadradito cortado para que el volumen de la caja resultante 
%m�ximo.Adem�s hallar su volumen m�ximo
f=@(x) 768*x-112*x.^2+4*x.^3;
x0=0.1;
x1=6;
x2=11.9;
Ea=100;
error=1;


try
  [x0,x1,x2,cont]=inter_cuadratica(f,x0,x1,x2,error,Ea);
  valores=[x0 x1 x2];
  fprintf('   x              f(x)\n');
for i=1:3
  fprintf('%5.4f    %11.8f\n', valores(i), f(valores(i)))
endfor
  fprintf('El n�mero de iteraciones es: %d\n',cont);
  
  hold on
  ezplot(f)
  grid on
  legend ("f(x)");
  xlabel ("x");
  ylabel ("f(x)");
  plot(valores(3),f(valores(3)),"x")
  hold off
 
catch err
  fprintf('Error: %s\n', err.message);
  %err.identifier
end 
  

  

  