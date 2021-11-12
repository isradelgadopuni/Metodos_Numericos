
%Punto Fijo   Raíces de ecuaciones .
%   PUNTOFIJO(FUN,A,ITER,TOL) 
%       puntof = pf(f, xi, iter, tol)
%       puntof = raíz de la función
%       fun = la función a tratar
%       xi = valor inicial
%       iter = número máximo de iteraciones
%       tol = tolerancia

function [xn,datos,i] = PUNT_FIJO (fun, fung, xi,tol=0.0001,iter=1000)
  f = fun;
  g = fung;
  i=1;
  while 1
    xn=g(xi);
    ea=abs(xn-xi);
    datos(i,1)=xn;
    datos(i,2)=ea;
    %Espacio prescindible, usado para verificar
    fprintf('%0.4f\t\t',xi);
    fprintf('\n');
    fprintf('%0.4f\t\t',xn);
    fprintf('\n');
    fprintf('%0.4f\t\t',ea);
    fprintf('\n');
    fprintf('%0.4f\t\t',i);
    fprintf('\n');
    %fprintf('%0.4f\t\t',raiz);
    %fprintf('\n');
    %fprintf('%0.4f\t\t',ea);
    %fprintf('\n');
    %fprintf('%0.4f\t\t',fr);
    %fprintf('\n');
    %fprintf('\n');
    %Fin espacio pruebas
    xi = xn;
    if i>iter
        msgID = 'PUNTO_FIJO:iteraciones';
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
%ezplot(Fx);%graficamos la funcion
%grid on;

