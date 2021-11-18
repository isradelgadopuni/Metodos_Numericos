%Calculo de la inversa de una matriz con base 
%del metodo de Guss Jordan
% 
%
% Descipción del método 
%Es un algoritmo que se usa para determinar la inversa de una matriz asi como
%las soluciones de un sistema de ecuaciones lineales este metodo transforma 
%la matriz original en la identidad despejando asi las incognitas en el
%sistema de ecuaciones, este metodo tambien encuentra la inversa de una matriz
%si la matriz a la que se iguala la original es la identidad

function L = matriz_inversa (A,B)
fprintf('La matriz ingresada es: \n')
A
C=[A B]; 
for i=1:length(C(:,1)) %
if C(i,i)~=1
    C(i,:)= C(i,:)./C(i,i);  
    %%%%%%%%%%
    m=C(i,:);
    d=sum(m);
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
           %disp(C)
           
      end              
    end     
end
L = C;