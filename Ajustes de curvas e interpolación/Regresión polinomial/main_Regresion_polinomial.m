%n=input("Numero de datos=");
%m=input("Grado del polinomio=");


%Problema 1 
%Un investigador informa sobre los datos tabulados a continuacion
%de un experimento para determinar la tasa de crecimiento de bacterias
%k (por día), como funcion de la concentración de oxígeno c (mg/L)
%Se sabe que dicho datos pueden modelarse por medio de la siguiente ecuación:
%       K=(k_max*c^2)/(c_s+c^2)

% c | 0.2  0.5  0.8  1.2  1.7    2    2.3
% -----------------------------------------
% K | 500 700 1000  1200  2200  2650  3750
%Utilice los datos para ajustar una parábola 
n=7;
m=2;
x=[0.2 0.5 0.8 1.2 1.7 2 2.3];
y=[500 700 1000 1200 2200 2650 3750];
M=zeros(m+1,m+1);
b=zeros(m+1,1);
f=@(t) 97731/145*t.^2 - 11932/51*t + 19331/32;


%Problema 2 
%Ajuste  una ecuación cubica a los datos siguientes
% x   3    4   5    7    8   9    11  12
% ------------------------------------------
% y   1.6 3.6 4.44 3.4 2.2  2.8  3.8  4.6 
%n=8;
%m=3;

%x=[3 4 5 7 8 9 11 12]
%y=[1.6 3.6 4.4 3.4 2.2 2.8 3.8 4.6]
%M=zeros(m+1,m+1);
%b=zeros(m+1,1);
%f=@(t) 832/17825*t.^3 - 1415/1359*t.^2 + 3179/445*t - 5595/487;
try 
  [y_t,y_x,vect,c]=Regresion_polinomialll(n,m,x,y,M,b);
  
  plot(x,y,"o");
  hold on
  plot(f,[x(1),x(length(x))]);
  grid on
  y_t
  y_x
  
%catch
%end_try_catch

end
