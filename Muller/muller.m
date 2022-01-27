## Copyright (C) 2021 EQUIPO

function [xr,datos,iter] = muller (f, xr, h, iteraciones = 1000, tol = 0.001)
  iter = 0;
  x0 = xr - h*xr;
  x1 = xr + h*xr;
  x2 = xr;
  while (iter < iteraciones)
    iter = iter + 1;
    h0 = x1 - x0;
    h1 = x2 - x1;
    d0 = (f(x1) - f(x0))/h0;
    d1 = (f(x2) - f(x1))/h1;
    a = (d1 - d0)/(h1 - h0);
    b = a*h1 + d1;
    c =f(x2);
    rad = sqrt(b^2 - 4*a*c);
    datos(iter,1)=x0;
    datos(iter,2)=x1;
    datos(iter,3)=x2;
    datos(iter,4)=xr;
    datos(iter,5)=a;
    datos(iter,6)=b;
    datos(iter,7)=c;
    if (abs(b+rad) > abs(b-rad))
      den = b + rad;
    else
      den = b - rad; 
    endif
    dxr = -2*c/den;
    xr = x2 + dxr; 
    if (abs(dxr) < tol*xr)
      break;
    endif
    x0 = x1;
    x1 = x2;
    x2 = xr;   
  endwhile
endfunction
