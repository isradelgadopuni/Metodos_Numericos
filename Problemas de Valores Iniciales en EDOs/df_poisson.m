## Copyright (C) 2022 IsraDelgadoP
##
## Copyright (C) 2022 EQUIPO
##

%Método de diferencias finitas para la ecuacion de laplace y poisson
%   df_poisson (ua, ub, uc, ud, n, m, m_iter, tol, tipo, f, g)
%       [u, iter] = df_poisson (ua, ub, uc, ud, n, m, m_iter, tol, tipo, f, g)
%       ua, ub, uc, ud: condiciones iniciales en los costados de la malla
%       n,m: puntos interiores horizontales y verticales en la malla
%       m_iter: iteraciones maximas
%       tol: tolerancia
%       f,g: funciones para poisson
%       
%   Copyright 2022 Universidad de Cuenca.
%   $Revision: 0.1 $  $Date: 2021/01/03 19:00 $
%   Built-in function.

## Author: Delgado P, Dominguez C, Romero T <IsraDelgadoP@LAPTOP-NEGRA>
## Created: 2022-01-03

function [u, iter] = df_poisson (ua, ub, uc, ud, n, m, m_iter, tol, tipo, f, g)
  
if tipo == "p"
  h=(ub-ua)/n;
  k=(ud-uc)/m;
  
  for i=1:n-1
    x(i)=ua+i*h;   
  endfor
  
  for j=1:m-1
    y(j)=uc+j*k;    
  endfor
  
  for i=1:n-1
    for j=1:m-1
      w(i,j)=0;
    endfor
  endfor
  
  lambda=(h^2)/(k^2);
  mu=2*(1+lambda);
  iter=1;
  
  while iter<=m_iter
    
    z=(-h^2*f(x(1), y(m-1))+g(ua,y(m-1))+lambda*g(x(1),ud)+lambda*w(1,m-2)+w(2,m-1))/mu;
    w(1,m-1);
    nor=abs(z-w(1,m-1));
    w(1, m-1)=z;
    
    for i=2:n-2
      z=(-h^2*f(x(i),y(m-1))+lambda*g(x(i),ud)+w(i-1,m-1)+w(i+1,m-1)+lambda*w(i,m-2))/mu;
      if abs(w(i,m-1)-z)>nor
        nor=abs(w(i,m-1)-z);
      endif
      w(i,m-1)=z;
    endfor
    
    z=(-h^2*f(x(n-1),y(m-1))+g(ub,y(m-1))+lambda*g(x(n-1),ud)+w(n-2,m-1)+lambda*(w(n-1,m-2)))/mu;
    
    if abs(w(n-1,m-1)-z)>nor
      w(n-1,m-1)=z;
    endif
    
    for j=m-2:-1:2
      z=(-h^2*f(x(1),y(j))+g(ua,y(j))+lambda*w(1,j+1)+lambda*w(1,j-1)+w(2,j))/mu;
      if abs(w(1,j)-z)>nor
        nor=abs(w(1,j)-z);
      endif
      w(1,j)=z;
      
      for i=2:n-2
        z=(-h^2*f(x(i),y(j))+w(i-1,j)+lambda*w(i,j+1)+lambda*w(i,j-1)+w(i+1,j))/mu;
        if abs(w(i,j)-z)>nor
          nor=abs(w(i,j)-z);
        endif
        w(i,j)=z;
      endfor
      
      z=(-h^2*f(x(n-1),y(j))+g(ub,y(j))+w(n-2,j)+lambda*w(n-1,j+1)+lambda*w(n-1,j-1))/mu;
      
      if abs(w(n-1,j)-z)>nor
        nor=abs(w(n-1,j)-z);
      endif
      w(n-1,j)=z;
    endfor
    
    z=(-h^2*f(x(n-1),y(1))+g(ua,y(1))+lambda*g(x(1),uc)+lambda*w(1,2)+w(2,1))/mu;
    
    if abs(w(1,1)-z)>nor
      nor=abs(w(1,1)-z);
    endif
    w(1,1)=z;
    
    for i=2:n-2
      z=(-h^2*f(x(i),y(1))+lambda*g(x(i),uc)+w(i-1,1)+lambda*w(i,2)+w(i+1,1))/mu;
      if abs(w(i,1)-z)>nor
        nor=abs(w(i,1)-z);
      endif
      w(i,1)=z;
    endfor
    
    z=(-h^2*f(x(n-1),y(1))+lambda*g(x(n-1),uc)+g(ub,y(1))+w(n-2,1)+lambda*w(n-1,2))/mu;
    
    if abs(w(n-1,1))>nor
      nor=abs(w(n-1,1));
    endif
    w(n-1,1)=z;
    
    iter=iter+1;
    u=w;
    

    nor    
    if nor<=tol
      break
    endif

  
  endwhile
  
elseif tipo == "l"
  for i=1:n+2
    u(i,1)=uc; 
    u(i, m+2)=ud;   
  endfor
  for j=1:m+2
    u(1,j)=ua; 
    u(n+2, j)=ud;   
  endfor

  p=(ua+ub+uc+ud)/4;

  for i=2:n+1
    for j=2:m+1
      u(i,j)=p;
    endfor
  endfor

    %u(1,1)=50;
    %u(1, 5)=50;

  iter=0;
  estado = 0; 

  while iter<m_iter & estado==0
    iter=iter+1; 
    t = u; 
    
    for i=2:n+1
      for j=2:m+1
        u(i,j)=0.25*(u(i-1,j)+u(i+1,j)+u(i,j+1)+u(i,j-1));
      endfor
    endfor
    
    if norm((u-t),inf)/norm(u,inf)<tol
    estado=1;
    endif

  endwhile

  
endif

endfunction
