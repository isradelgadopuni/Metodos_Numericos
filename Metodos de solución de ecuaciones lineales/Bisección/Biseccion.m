#Método de la Bisección

clc

#Ingresa la funcion a buscar la raíz
funcion = input('Escriba la f(x) entre parentesis:','s')
funcion = inline(funcion);

#Definir límites en los cuales sabemos que se encuentra la raíz
xinf = input('Ingrese el valor inferior: ');
xsup = input('Ingrese el valor superior: ');

#Número de iteraciones del método
iteraciones = input('Numero máximo de iteraciones:');
i=1;

if funcion(xinf)*funcion(xsup)<0

fprintf("%s\t%s\t%s\t%s\t%s\t\%s\t\%s\n", 'i','xinf','xsup','xm','f(xinf)', 'f(xm)', 'f(xinf)*f(xm)')

while i < iteraciones
    xm = (xinf + xsup)/2;
    fprintf("%d\t", i) 
    fprintf("%.4f\t", xinf)
    fprintf("%.4f\t", xsup)
    fprintf("%.4f\t", xm)
    fprintf("%.4f\t", funcion(xinf))
    fprintf("%.4f\t", funcion(xm))
       
 if funcion(xinf)*funcion(xm)<0
    fprintf("%.4f\t", funcion(xinf)*funcion(xm)) 
    xsup = xm; 
   
 elseif funcion(xinf)*funcion(xm)>0
    fprintf("%.4f\t", funcion(xinf)*funcion(xm))
    xinf = xm;
 
 elseif funcion(xm)==0
    fprintf("%s","raiz encontrada")
    break 
     
 endif
    fprintf("\n")   
i++;

endwhile

     fprintf(" la raiz aproximada es: %.4f \n", xm)
else
 fprintf("%s","no se puede resolver por este metodo")
endif