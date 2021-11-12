%Funcion que recibe una matriz de coeficientes A
%y un vector de terminos independientes b
%resuelve el sistema de ecuaciones con metodo de
%eliminacion Gaussiana

%Gauss   Solucion de un sistema de ecuaciones .
%   ELIMINACIONGAUSS(Matriz,matriz) 
%       X = EliminacionGauss(A,b)
%       X = Solucion del sistema de ecuaciones
%       A = Matriz de coeficientes
%       b = Matriz de valores independientes
%       
function X=EliminacionGauss(A,b)
  n=length(b);
  x=zeros(n,1);
  C=[A,b'];
  m=n+1;
  
  for i=1:n
    if C(i,i)==0
      C=Intercambio(C,i);
    endif
    for k=i+1:n
      pivote=C(k,i)/C(i,i);
      for j=i:m
        C(k,j)=C(k,j)-pivote*C(i,j);
      endfor
    endfor
  endfor
  
  if C(n,n)==0
    fprintf('No existe Solucion')
  endif
  
  sustitucion(C)
endfunction
