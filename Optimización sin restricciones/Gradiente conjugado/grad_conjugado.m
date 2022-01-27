%Gradiente Conjugado   Optimización de funciones.
%   GRADIENTE CONJUGADO(FUN,X0,X1,X2,ERROR,ITER) 
%       inter_cuadratica(f,x0,maxiter,tol)
%       f = la función a optimizar
%       x0 = valores iniciales para la dirección
%       maxiter = numero máximo de iteraciones para el método
%       tol = error para el método
function [x_resp,msg]=grad_conjugado(f,x0,maxiter,tol)
syms x y
fn=inline(f);
fobj=@(x) fn(x(:,1),x(:,2));
gradien=gradient(f);
G=inline(gradien);

gradx=@(x) G(x(:,1),x(:,2));
H1=hessian(f);
Hx=inline(H1);

iter=1;
X=[];
S=0;
Gpr=-gradx(x0);

if norm(Gpr)==0
    msg='Entrada x0 invalida!'  %Solo para prueba(luego eliminar esto)
end

while norm(gradx(x0))>tol && iter < maxiter
    X=[X,x0];
    Gi=-gradx(x0);
    H=Hx(x0);
    beta=norm(Gi).^2./norm(Gpr).^2;
    S=Gi+beta.*S;
    lam=Gi'*Gi./(S'*H*S);
    Xnew=x0+lam.*S';
    x0=Xnew;
    x_resp=x0;
    Gpr=Gi;
    msg='Método exitoso'
end

if iter+1>maxiter
   msg='Gran número de iteraciones:Metodo divergente'


end
end