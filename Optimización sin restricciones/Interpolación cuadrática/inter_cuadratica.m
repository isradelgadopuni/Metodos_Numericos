%Interpolación cuadrática   Optimización de funciones.
%   INTERPOLACIÓN_CUADRÁTICA(FUN,X0,X1,X2,ERROR,ITER) 
%       inter_cuadratica(f,x0,x1,x2,error,Ea)
%       f = la función a optimizar
%       x0 = valor que fija el extremo (dominio de la función)
%       x1= valor que fija el extremo (dominio de la función)
%       x2= valor que fija el extremo (dominio de la función)
%       error = tolerancia permitida (dentro del 100%)
%       Ea = número máximo de iteraciones


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
       msgID = 'Interpolación cuadrática:iteraciones';
       msg = 'Gran número de iteraciones, posiblemente el método divergió';
        #baseException = MException(msgID,msg);
        #throw(baseException);
       error(msgID,msg);
       
     endif
     
  endwhile
endfunction
  