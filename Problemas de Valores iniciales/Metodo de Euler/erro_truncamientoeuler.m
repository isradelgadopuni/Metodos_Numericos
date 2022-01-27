%PROBLEMA 1:
y_exac=@(x) exp(0.25*x.^4-1.5*x);
H=0.05;
x_F=2;
error_tp1=y_exac(1.1)-(y_exac(1)-H*(-y_exac(1)+1+x_F))


%PROBLEMA 2:
y_exacto=@(x) x+exp(-x);
h=0.25;
x_f=5;
erro_tp2=y_exacto(1.1)-(y_exacto(1)-h*(-y_exacto(1)+1+x_f))

