
%Punto Fijo   Ra�ces de ecuaciones .
%   PUNTOFIJO(FUN,A,ITER,TOL) 
%       puntof = pf(f, xi, iter, tol)
%       puntof = ra�z de la funci�n
%       fun = la funci�n a tratar
%       xi = valor inicial
%       iter = n�mero m�ximo de iteraciones
%       tol = tolerancia

function [xn,datos,i] = PUNTO_FIJO (fun, fung, xi,tol=0.0001,iter=1000)
  f = fun;
  g = fung;
  i=1;
  while 1
    xn=g(xi);
    ea=abs(xn-xi);
    datos(i,1)=xn;
    datos(i,2)=ea;
    xi = xn;
    if i>iter
        msgID = 'PUNTO_FIJO:iteraciones';
        msg = 'Gran n�mero de iteraciones, posiblemente el m�todo divergi�';
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

