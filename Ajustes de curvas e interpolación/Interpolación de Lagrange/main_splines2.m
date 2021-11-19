% Autores: 
% Santiago Israel Delgado Pinos
% Anthony Vinicio Dominguez Chacha
% Cristiam Patricio Romero 
% Fecha: 18/11/2021
%Problema 1 
%Un investigador informa sobre los datos tabulados a continuacion
%de un experimento para determinar la efectividad de un medicamento 


% c | 0.2  0.6  1.2  1.4 
% -----------------------------------------
% K | 0.2 0.55 0.211 0.2

x=[0.2 0.6 1.2 1.4];
y=[0.2 0.55 0.211 0.2];

[M1,b]=splines2(x,y); 

coeficientes=transpose(inv(M1)*b);
coeficientes=transpose(reshape(coeficientes,[length(x)-1, length(x)-1]))  
  
  
f=@(x) 2.1875*x.^2-0.875*x+0.2875;
g=@(x) -3.85833*x.^2+6.38*x-1.889;
h=@(x) 14.125*x.^2-36.78*x+24.007;

x_e1=0.2:0.01:0.6;
x_e2=0.6:0.01:1.2;
x_e3=1.2:0.01:1.4;

y_1=f(x_e1);
y_2=g(x_e2);
y_3=h(x_e3);


plot(x,y,"o")
hold on;
plot(x_e1, y_1)
plot(x_e2, y_2)
plot(x_e3, y_3)


%Problema 2 
%Ajuste  mediante splines cubicos  los datos siguientes
% x  / 3  /  4.5 / 7   /  9    
% ---------------------------
% y  / 2  /  1   / 2.5 /  0.5


%x=[3 4.5 7 9];
%y=[2 1 2.5 0.5];