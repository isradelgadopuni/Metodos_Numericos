## Copyright (C) 2022 IsraDelgadoP
##
## Copyright (C) 2022 EQUIPO
##

%Optimizaci�n sin restricciones 
%   steepestdescent (f, grad, x0, tol, iter, bk, preal)
%       [D] = steepestdescent (f, grad, x0, tol, iter, bk, preal)
%       x0 : vector de punto inicial
%       tol : tolerancia
%       iter : Numero m�ximo de iteraciones
%       bk : l�mite superior unidimensional
%       f : funcion a minimizar
%       grad : gradiente de la funcion a minimizar
%       D: Tabla con los datos de ejecuci�n, 1 iter, 2 valor minimo estimado, 3 error relativo
%   Copyright 2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/01/09 19:00 $
%   Built-in function.

## Author: Delgado P, Dominguez C, Romero T <IsraDelgadoP@EQUIPO>
## Created: 2022-01-09

function [D] = steepestdescent (f, grad, x0, tol, iter, bk, preal)
    
    iter = iter - 1;
    
    a=grad{1}(x0(1,1),x0(2,1));
    b=grad{2}(x0(1,1),x0(2,1));
    
    Fgrad = [a;b];
    
    cont = 1; 
    
    Fgrad = -Fgrad;
    
    while norm(Fgrad) >= tol && cont<=iter 
      alpha = seccionAurea(f,x0,Fgrad,bk); 
      err_r = abs(preal-x0)./abs(preal);
      D(cont,:)={cont, x0, norm(err_r)}; 
      x0=x0+alpha*Fgrad;
      a=grad{1}(x0(1,1),x0(2,1));
      b=grad{2}(x0(1,1),x0(2,1));
      Fgrad = [a; b];
      Fgrad = -Fgrad; 
      cont = cont + 1;
      err_r = abs(preal-x0)./abs(preal);
      D(cont,:)={cont, x0, norm(err_r)};
      
      if cont > iter
        msgID = 'STEEPEST DESCENT:iteraciones';
        msg = 'Gran n�mero de iteraciones, posiblemente el m�todo divergi�';
        #baseException = MException(msgID,msg);
        #throw(baseException);
        error(msgID,msg)
      endif 
      
    endwhile
    
    
endfunction