%Interpolaci�n cuadr�tica   Optimizaci�n de funciones.
%   INTERPOLACI�N_CUADR�TICA(FUN,X0,X1,X2,ERROR,ITER) 
%       inter_cuadratica(f,x0,x1,x2,error,Ea)
%       f = la funci�n a optimizar
%       x0 = valor que fija el extremo (dominio de la funci�n)
%       x1= valor que fija el extremo (dominio de la funci�n)
%       x2= valor que fija el extremo (dominio de la funci�n)
%       error = tolerancia permitida (dentro del 100%)
%       Ea = n�mero m�ximo de iteraciones


function [x0,x1,x2,cont]=inter_cuadratica(f,x0,x1,x2,error,Ea)
  cont=0;
  max_iter=Ea;
  while Ea>error
    N=f(x0)*(x1^2-x2^2)+f(x1)*(x2^2-x0^2)+f(x2)*(x0^2-x1^2);
    D=2*f(x0)*(x1-x2)+2*f(x1)*(x2-x0)+2*f(x2)*(x0-x1);
    x3=N/D;
    %--------------------------------------------------------------------
    if x3>x0 && x3>x1 &&x3<x2
      Ea=abs((x3-x2)/x3)*100;
      x2=x3;
    endif
    %----------------------------------------------------------------------
     if x3>x0 && x3<x1 && x3<x2  
      Ea=abs((x3-x0)/x3)*100;
      x0=x3;
     endif
     %---------------------------------------------------------------------
     if x3<x0 && x3<x1 && x3<x2  
      Ea=abs((x3-x2)/x3)*100;
      x2=x1;
      x1=x0;
      x0=x3;
     endif
     %----------------------------------------------------------------------
     if x3>x0 && x3>x1 && x3>x2  
      Ea=abs((x3-x0)/x3)*100;
      x0=x1;
      x1=x2;
      x2=x3;
     endif
     cont=cont+1;
     %----------------------------------------------------------------------- 
     
     if cont+1>max_iter
       msgID = 'Interpolaci�n cuadr�tica:iteraciones';
       msg = 'Gran n�mero de iteraciones, posiblemente el m�todo divergi�';
        #baseException = MException(msgID,msg);
        #throw(baseException);
       error(msgID,msg);
       
     endif
     
  endwhile
endfunction
  