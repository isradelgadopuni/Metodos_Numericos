%REGULA FALSI   Raices de ecuaciones (didáctica).
%   regula_falsi(FUN,A,B,T,ITER) llenar
%       [c,datos] = biseccion(fun, a, b, t, iter)
%       c = raiz de la función
%       datos = todas las variables de la ejecución
%       fun = la función a tratar
%       [a,b] intervalo
%       tol = tolerancia
%       iteraciones = número máximo de iteraciones
%
%   Copyright 2021 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/10/17 20:46 $
%   Built-in function.

## Author: Delgado P, Dominguez C, Romero T
## Created: 2021-10-17

function [raiz,datos,i] = regula_falsi(fun, x0, x1, iteraciones = 1000, tol = 0.001)
  i=1;
  f=fun;
  a=x0;
  b=x1;
  c=x0;
  if f(a)*f(b)<0 %Verificar condiciones de Bolzano
    while 1
    fa=f(a);
    fb=f(b);
    fc=f(c);
    raiz=b-((fb*(b-a))/(fb-fa));
    ea=abs(raiz-c);
    fr=f(raiz);
    %Espacio prescindible, usado para verificar
    %fprintf('%0.4f\t\t',a);
    %fprintf('\n');
    %fprintf('%0.4f\t\t',b);
    %fprintf('\n');
    %fprintf('%0.4f\t\t',fa);
    %fprintf('\n');
    %fprintf('%0.4f\t\t',fb);
    %fprintf('\n');
    %fprintf('%0.4f\t\t',raiz);
    %fprintf('\n');
    %fprintf('%0.4f\t\t',ea);
    %fprintf('\n');
    %fprintf('%0.4f\t\t',fr);
    %fprintf('\n');
    %fprintf('\n');
    %Fin espacio pruebas
    datos(i,1)=a;
    datos(i,2)=b;
    datos(i,3)=raiz;
    datos(i,4)=fa;
    datos(i,5)=fb;
    datos(i,6)=fr;
    datos(i,7)=ea;
    if fa*fr<0
      b=raiz;
      c=raiz;
    elseif fa*fr>0
      a=raiz;
      c=raiz;
    endif
    if(fa*fb>0)
      fc=NaN;
      c=NaN;
      msgID = 'BISECCION:condicion';
      msg = 'Error: f(a)*f(b)>0';
      #baseException = MException(msgID,msg);
      #throw(baseException);
      error(msgID,msg);
    elseif i>iteraciones
      msgID = 'BISECCION:iteraciones';
      msg = 'Gran número de iteraciones, posiblemente el método divergió';
      #baseException = MException(msgID,msg);
      #throw(baseException);
      error(msgID,msg)
    elseif ea<tol
        break;
    endif
    i=i+1;
    endwhile
  
  else
    msgID = 'Regula Falsi: Teorema de Bolzano';
    msg = 'Condiciones iniciales no cumplen el teorema de Bolzano';
    #baseException = MException(msgID,msg);
    #throw(baseException);
    error(msgID,msg)
  endif
  
endfunction
