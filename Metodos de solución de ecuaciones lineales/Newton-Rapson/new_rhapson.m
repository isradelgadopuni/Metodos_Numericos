pkg load symbolic
syms x

function [xn,datos,c]=new_rhapson(f,df,xi,iter,tol)
  syms x
  c=1;
  while c <= iter
    deri=double(subs(df,xi));
    xn=xi-(f(xi)/deri); 
    datos(c,1)=xn;
    datos(c,2)=abs(((xn-xi)/xn));
    
    if c==1 && deri==0
      msgID="NEWTON-RHAPSON:ERROR";
      msg="No se puede hallar la raíz con el método";
      error(msgID,msg)
      
    elseif c!=1 && f(xi)==0
      xn=xi;
      break;
    endif
    
    if abs(((xn-xi)/xn))<=tol
      break;
      
     %elseif c+1>iter
      %msgID = 'NEWTON-RHAPSON:iteraciones';
      %msg = 'Gran número de iteraciones, posiblemente el método divergió';
      %error(msgID,msg)
      
     else
      xi=xn;
      
    endif
    c=c+1;
    
  endwhile
endfunction
