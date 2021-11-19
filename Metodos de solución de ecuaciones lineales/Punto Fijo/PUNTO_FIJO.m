pkg symbolic load
syms R
%Punto Fijo   Ra�ces de ecuaciones .
%   PUNTOFIJO(FUN,A,ITER,TOL) 
%       puntof = pf(f, xi, iter, tol)
%       puntof = ra�z de la funci�n
%       fun = la funci�n a tratar
%       xi = valor inicial
%       iter = n�mero m�ximo de iteraciones
%       tol = tolerancia

function [xn,datos,i] = PUNTO_FIJO (f,xi,tol,iter)
  syms R
  i=1;
  df = diff(f,R);
  %condicion = subs(df,R,xi)
  while i < iter 
    condicion = subs(df,R,xi);
    xn=f(xi)
    datos(i,1)=xn;
    datos(i,2)=abs(((xn-xi)/xn));
 
    if  abs(condicion) > 1
      xn = NaN
      msgID = 'PUNTO_FIJO:condicion';
      msg = 'Error: |g�(xi)| > 1';
      error(msgID,msg);

    elseif i+1>iter
        msgID = 'PUNTO_FIJO:iteraciones';
        msg = 'Gran n�mero de iteraciones, posiblemente el m�todo divergi�';
        #baseException = MException(msgID,msg);
        #throw(baseException);
        error(msgID,msg)
    else
        if abs(((xn-xi)/xn)) <= tol
            break;
        else
            xi = xn;
        end
    end
    i=i+1;
end
%ezplot(Fx);%graficamos la funcion
%grid on;

