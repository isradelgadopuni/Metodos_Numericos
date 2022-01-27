%DIFERENCIAS FINITAS   Solución de una ecuación diferencial (didáctica).
%   FINITESDIFFERENCES(P,Q,R,XI,XF,YI,YF,N) llenar
%       [vector,w] = finitesdifference(p,q,r,aa,bb,alpha,beta,n)
%       p=valor de p(x) en la ecuación diferencial:y''=p(x)y'+q(x)y+r(x)
%       q=valor de q(x) en la ecuación diferencial:y''=p(x)y'+q(x)y+r(x)
%       r=valor de r(x) en la ecuación diferencial:y''=p(x)y'+q(x)y+r(x)
%       aa=extremo inicial de x
%       bb=extremo final de x
%       alpha=valor inicial de y(condición inicial)
%       beta=valor final de y (condición inicial)
%       n=número de particiones

function [vector,w]=finitesdifference(p,q,r,aa,bb,alpha,beta,n)
 h = (bb-aa)/(n+1);
 a = zeros(1,n+1);
 b = zeros(1,n+1);
 c = zeros(1,n+1);
 d = zeros(1,n+1);
 l = zeros(1,n+1);
 u = zeros(1,n+1);
 z = zeros(1,n+1);
 w = zeros(1,n+1);
 x = aa+h;
 a(1) = 2+h^2*q(x);
 b(1) = -1+0.5*h*p(x);
 d(1) = -h^2*r(x)+(1+0.5*h*p(x))*alpha;
 m = n-1;
 
 for i = 2 : m 
   x = aa+i*h;
   a(i) = 2+h^2*q(x);
   b(i) = -1+0.5*h*p(x);
   c(i) = -1-0.5*h*p(x);
   d(i) = -h^2*r(x);
 end
 
 x = bb-h;
 a(n) = 2+h^2*q(x);
 c(n) = -1-0.5*h*p(x);
 d(n) = -h^2*r(x)+(1-0.5*h*p(x))*beta;
 l(1) = a(1);
 u(1) = b(1)/a(1);
 z(1) = d(1)/l(1);
 
 for i = 2 : m 
   l(i) = a(i)-c(i)*u(i-1);
   u(i) = b(i)/l(i);
   z(i) = (d(i)-c(i)*z(i-1))/l(i);
 end
 
 l(n) = a(n)-c(n)*u(n-1);
 z(n) = (d(n)-c(n)*z(n-1))/l(n);
 w(n) = z(n);

 for j = 1 : m 
   i = n-j;
   w(i) = z(i)-u(i)*w(i+1);
 end
 w(length(w))=beta; %-------------------
 i = 0;
 vector=(0:length(w)-1);
 for i = 1 : n 
   x = aa+i*h;
   vector(i)=x;
   end
 vector(length(w))=bb ;
endfunction