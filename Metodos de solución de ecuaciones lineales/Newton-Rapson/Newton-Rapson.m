clc;
funcion = input('Escribe la f(x) entre parentesis: ','s')
funcion = inline(funcion);

derivada = input('Escribe la df(x) entre parentesis: ','s') 
derivada = inline(derivada);

xi = input('Ingrese el valor inicial inicial: ');

iteraciones = input('Numero de interaciones máximas: ');
i=1;

function ea = errora(xa,xp)
    ea = abs(((xa-xp)/xa)*100);
end


if derivada(xi) == 0
    fprintf ('La raiz no se puede hallar o no existe');
else

    fprintf("%s\t %s\t\t  %s\n",'i','Xi',' Ea ');
        
  while i <= iteraciones
       fprintf('%d\t',i); 
       fprintf('%.8f\t',xi);
       xn = xi-(funcion(xi)/derivada(xi));
       fprintf('%.8f\t',errora(xn,xi));   
       xi = xn;
       fprintf ("\n");
       i++;

   endwhile
       fprintf('\nLA RAIZ APROXIMADA ES: %.8f\n',xn);
            
endif