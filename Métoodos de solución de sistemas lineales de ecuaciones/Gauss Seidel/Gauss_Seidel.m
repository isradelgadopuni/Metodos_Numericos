%Gauss Seidel para la solucion de un sistema de ecuaciones .
%   Gauss_Seidel(Matriz,tolerancia,iter_max,ecuac;matriz_0;vector) 
%       [x,xs] =Gauss_Seidel(A,tol,m,n,x1,x2)
%       x=numero de iteraciones usadas
%       xs = Solucion del sistema de ecuaciones
%       A = Matriz de coeficientes con t�rminos independientes
%       tol= tolerancia m�xima del error
%       m=m�ximo n�mero de iteraciones
%       n=n�mero variables 
%       x1=matriz cuadrada de ceros
%       x2=vector donde se almacenar�n los valores soluci�n del sistema


function [x,xs] = Gauss_Seidel(A,tol,m,n,x1,x2)
 k = 1;
 while  k <= m
    err = 0;
    
    for i = 1 : n
       s = 0;
       for j = 1 : n
          s = s-A(i,j)*x1(j);
       end
       s = (s+A(i,n+1))/A(i,i);
       if abs(s) > err
         err  = abs(s);
       end
       x1(i) = x1(i) + s;
       x2(i)=x1(i);
       
    end

    if err <= tol
      break;
    else
      k = k+1;
    end
    xs=x2;
    x=k;
    
    if x>m
      
      msgID = 'Gauss Seidel:iteraciones';
      msg = 'Gran n�mero de iteraciones, posiblemente el m�todo divergi�';
        #baseException = MException(msgID,msg);
        #throw(baseException);
      error(msgID,msg)
     end
 end
    
