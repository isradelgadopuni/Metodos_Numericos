

%Problema 1:
%Se conoce que la potencia de un automóvil puede ser 
%modelada por la siguiente ecuación diferencial :
%-------------y''=(-2/x)y'+(2/x^2)y+(sin(ln(x)))/x^2--------------------
%Se sabe que la potencia ent t=1--> e y(1)=1 y y(2)=2. Encuentre el
%comportamiento de la potencia del autómovil en el tiempo [1,2]
p = @(x) (-2/x);  
q = @(x) (2/x^2);
r = @(x) (sin(log(x))/x^2);
aa = 1; 
bb = 2; 
alpha = 1; 
beta = 2;
n=30;
f=@(x) 0.129*x.^(0.5*(3+sqrt(17)))+0.69*x.^(0.5*(3-sqrt(17)))-1/6*sin(log(x))+1/6*cos(log(x)); 
%________________________________________________________________

%Problema 2:
%Un resorte helicoidal se comporta de acuerdo a la ecuación diferencial:
%----------------4y''-2y'+y+x=0-----------------------------------------
%Se sabe que su estado en y(0)=1 y y(20)=10. Encuentre su comportamiento 
%en el tiempo [0,20]
%_______________________________________________________________-
%p = @(x) 1/2;
%q = @(x) -1/4;
%r = @(x) -1/4;
%aa = 0; 
%bb = 20; 
%alpha = 1; 
%beta = 10;
%n=30;
%f=@(x) 3*(exp(0.25*x)).*[cos(0.433013*x)]+3.43943*exp(0.25*x).*sin(0.433013*x)-x-2;
%_______________________________________________________________________

%____________________________TEST___________________________________
%p=@(x) 0;
%q=@(x)-4;
%r=@(x) 8*cos(2*x);
%aa=0;
%bb=10;
%alpha=0;
%beta=18.26;
%n=30;
%f=@(x) (2*x)*sin(2*x);
%-----------------------------ENDTEST-----------------------------------


%---------------No cambia------------------------------------------------
[vector,w]=finitesdifference(p,q,r,aa,bb,alpha,beta,n);
fprintf('   x          y     error\n');
X=[aa vector];
Y=[alpha w];
y_true=f(X);
for i=1:length(X)
  fprintf('%5.4f   %5.4f  %11.8f\n', X(i), Y(i),abs((y_true(i)-Y(i))/y_true(i)))
end


plot(X,y_true,"b")
hold on;
plot(X, Y,"r")
xlabel("Tiempo");
ylabel("y(t)");
legend("y_{exacta}","y_{aprox}","fontsize",14,"FontWeight","bold");
title("Solución de una EDO")
%-------------No cambia----------------------------------------------------
 