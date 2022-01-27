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

%n=4;
%x=[0.2 0.6 1.2 1.4]
%y=[0.2 0.55 0.211 0.2]



%Problema 2 
%Ajuste  mediante splines cubicos  los datos siguientes
% x  / 3  /  4.5 / 7   /  9    
% ---------------------------
% y  / 2  /  1   / 2.5 /  0.5

n=4;
x=[3 4.5 7 9];
y=[2 1 2.5 0.5];
%wx=0;
%wn=0;


[c,h]=spl3(n,x,y,wx=0,wn=0)
c;
h;

for i=1:n-1
    t(i,:)=x(i):0.01*h(i):x(i+1);
    p(i,:)=c(i,1).*(t(i,:).^3)+c(i,2).*(t(i,:).^2)+c(i,3).*t(i,:)+c(i,4);
    plot(t(i,:),p(i,:),'k')
    grid on 
    hold on
end
plot(x,y,'o')
for j=1:n-1
    for i=1:4
        s(i)=c(j,i);
    end
    disp(strcat('p',num2str(j),'=',poly2str(s,'x')));
end