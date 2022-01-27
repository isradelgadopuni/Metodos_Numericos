%Eliminacion usando Gauss Jordan para la solucion de un sistema de ecuaciones .
%   GaussJordan(Matriz,matriz) 
%       L =GGGJJ(A,B)
%       L = Solucion del sistema de ecuaciones
%       A = Matriz de coeficientes
%       B = Matriz de valores independientes
function L=GGGJJ(A,B)
C=[A B] 
for i=1:length(C(:,1)) %
if C(i,i)~=1
    C(i,:)= C(i,:)./C(i,i);  
    %%%%%%%%%%
    m=C(i,:);
    d=sum(m)
    if abs(d)==Inf
      
      msgID = 'Gauss:condicion';
      msg = 'Error: Gauss';
        #baseException = MException(msgID,msg);
        #throw(baseException);
      error(msgID,msg);
    end
end

    for n=1:length(C(:,1)) 
      if n~=i 
          C(n,:)=-C(n,i).*C(i,:)+C(n,:); 
          L=C
           %disp(C) 
      end              
    end     
end

C