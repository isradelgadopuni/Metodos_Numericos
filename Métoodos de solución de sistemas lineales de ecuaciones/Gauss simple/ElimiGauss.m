%Eliminacion usando Gauss   Solucion de un sistema de ecuaciones .
%   ELIMIGAUSS(Matriz,matriz) 
%       Y = ElimiGauss(A,b)
%       Y = Solucion del sistema de ecuaciones
%       A = Matriz de coeficientes
%       B = Matriz de valores independientes
function Y=ElimiGauss(A,B)
  [n,n]=size(A);
  A=[A'; B']';
  x=zeros(n,1);
  for p=1:n
    for k=[1:p-1,p+1:n];
      m=-A(k,p)/A(p,p);
      
      %A(k,:)=A(k,:) +m*A(p,:)
      if abs(m)==Inf
        msgID = 'Gauss:condicion';
        msg = 'Division por cero';
        #baseException = MException(msgID,msg);
        #throw(baseException);
        error(msgID,msg);
        
      endif
      A(k,:)=A(k,:) +m*A(p,:)
    endfor
  endfor
  
  Y=A(:,n+1)./diag(A)

endfunction


