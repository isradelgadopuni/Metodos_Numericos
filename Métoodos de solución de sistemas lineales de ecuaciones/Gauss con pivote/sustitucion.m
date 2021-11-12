function x=sustitucion(C)
  n=length(C)-1
  m=n+1
  x(n)=C(n,m)/C(n,n);
  for i=n-1:-1:1
    suma=C(i,m);
    for j=i+1:n
      suma=suma-C(i,j)*x(j);
     end
     x(i)=suma/C(i,i)
  %%%%%%%%%%%%
  endfor
  
endfunction



