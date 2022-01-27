%ANÁLISIS DEL ERROR EN LA CUADRATURA DE GAUSS
%Para dos puntos, al reemplazar los datos en la ecuación del libro de
%Chapra(ecuación 22.32) se obtiene:

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f = @(x) 1.3 + 8*x -10*x.^2 + x.^3 - x.^4 - 25*x.^5;
df_4= @(x) -24-3000*x;

x=-1:0.01:1;
error_2p=1/35*df_4(x);
plot(x,error_2p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%f_1 = @(x) 4-x-5*x.^2 + x.^3 - x.^7 +x.^9;
%df_6 = @(x) 60480*x.^3-5040*x;
%error_3p=1/15750*df_6(x);
%plot(x,error_3p)
