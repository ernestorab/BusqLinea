function [ x, iter ] = metodoBL( fname,x )
% Método de Búsqueda de Línea con la primer condición de Wolfe
% usando máximo descenso.
% 
% In
% fname - cadena de caracteres con el nombre de la función a minimizar
% x - vector n-dimensional
% Out
% x - vector n-dimensional con la aproximación al mínimo local
% iter - contador cpn el número final de iteraciones externas
% 
% Se requieren aproximaciones al gradiente de la función

% parámetros
tol = 1.e-05;   %tolerancia para la norma del gradiente
c1 = 1.e-04;       %valor para la condición de Wolfe
maxiter = 20;  %número máximo de iteraciones externas permitidas

%valores iniciales
iter = 0;       %contador para las iteraciones externas

g = gradiente(fname,x);
ng = norm(g);

%parte iterativa
while ( ng > tol && iter < maxiter)
    H = hessiana(fname,x);
    p = -H\g;                   %dirección de Newton
    %p = -g;                    %máximo descenso
    
    %graficación
    t = linspace(0,1,30)';
    for k = 1:30
        y(k) = feval(fname, x+t(k)*p);
    end
    plot(t,y,'--b','Linewidth',3)
    pause(1)
    close all
    
    
    t = BacktrakingInterpolacion2( fname,g,x,c1,p );
    
    x = x + t*p;
    iter = iter +1;
    ng = norm(g);
end


end

