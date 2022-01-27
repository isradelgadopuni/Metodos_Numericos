% Metodo de Busqueda de la Seccion Dorada Adaptado
% Israel Delgado
% Anthony Dominguez
% Cristiam Romero
% 7/1/2022

% Datos de Entrada
% f = funcion unidimensional
% ak = punto inicial del intervalo
% bk = limite superiort
% tol = tolerancia del metodo

% Datos de Salida
% alpha = valor minimizado

function [alpha1]=seccionAurea(f,x0,Fgrad,bk) 
  ak=-bk;   
  tol=0.001;
  alpha=0.618;                         

  lamdak=alpha*ak+(1-alpha)*bk;        
  miuk=(1-alpha)*ak+alpha*bk;          

  fl=f(x0(1,1)+lamdak*Fgrad(1,1),x0(2,1)+lamdak*Fgrad(2,1));                       
  fm=f(x0(1,1)+miuk*Fgrad(1,1),x0(2,1)+miuk*Fgrad(2,1));                          

  iter=0;  
  
  while abs(bk-ak) >= tol              
      
      iter=iter+1;                     
      if fl>fm                         
         ak=lamdak;                    
         lamdak=miuk;                  
         fl=fm;                        
         miuk=(1-alpha)*ak+alpha*bk;   
         fm=f(x0(1,1)+miuk*Fgrad(1,1),x0(2,1)+miuk*Fgrad(2,1));                
      elseif fl<fm                    
         bk=miuk;                     
         miuk=lamdak;                 
         fm=fl;                       
         lamdak=alpha*ak+(1-alpha)*bk; 
         fl=f(x0(1,1)+lamdak*Fgrad(1,1),x0(2,1)+lamdak*Fgrad(2,1));         
      endif
        
      
  endwhile 
  alpha1=(lamdak+miuk)/2;

endfunction