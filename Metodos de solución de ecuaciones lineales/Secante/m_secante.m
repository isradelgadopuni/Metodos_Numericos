%REGULA FALSI   Raices de ecuaciones (didáctica).
% Metodo de la Secante
% secante(f,xo,x1,iteraciones,tol)
% p = secante(funcion,xo, contador,iteraciones,tol)
% xo = Valor inicial
% x1 = valor final
% 
% contador = numero de iteraciones realizadas
% tol = valor de la tolerancia
% iteraciones = numero máximo de iteraciones
%
%   Copyright 2021 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/10/17 20:46 $
%   Built-in function.

## Author: Delgado P, Dominguez C, Romero T
## Created: 2021-10-17

function [raiz,datos,i] = m_secante(fun, x0, x1, iteraciones = 1000, tol = 0.001)
    i=1;
    f=fun;
    a=x0;
    b=x1;
    c=x1;
    fa=f(a);
    fb=f(b);
    fc=f(c);
    while 1
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
    a=b;
    fa=f(b);
    b=raiz;
    fb=f(raiz);
    c=b;
    if i>iteraciones
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
  
endfunction