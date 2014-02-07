function [ x, iter ] = metodoBL( fname,x, tipo_descenso, backtracking)
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
tol = 1.e-08;   %tolerancia para la norma del gradiente
c1 = 1.e-04;       %valor para la condición de Wolfe
maxiter = 50;  %número máximo de iteraciones externas permitidas

%valores iniciales
iter = 0;       %contador para las iteraciones externas

g = gradiente(fname,x);     %gradiente de g
ng = norm(g);               %norma del gradiente
ng2=ng;                     %ng2 es la norma de g en la iteración anterior

%parte iterativa.
%condición de paro es que la norma del gradiente sea cercana a 0
%o que se llegue al màximo de iteraciones
while ( ng > tol && iter < maxiter)
    
    %Condición de paro extra:
    %Si la norma de g no cambia mucho de una iteración a otra, se llegó a
    %la solución.
    if(ng<sqrt(tol) && abs(ng2-ng)<sqrt(tol))
        break;
    end
    
    %guardamos la norma de esta iteración
    ng2=ng;
    
    %Calculamos la Hessiana de f en x
    H = hessiana(fname,x);
    
    %Se checa qué tipo de dirección se usará
    if strncmp(tipo_descenso,'MaxD',4)
        p = -g;                    %máximo descenso
    else %strncmp(tipo_descenso,'Newton',6)
        %Resolver H*p=-g para obtener la dirección de Newton p
        L = chol(H)';                   %factorización de Cholesky H = L*L'
        y = trin(L, -g);                %L*y = -g
        p = tris(L',y);                 %L'*p = y
    end
    
    %graficación
    z = linspace(0,1,30)';
    for k = 1:30
        y(k) = feval(fname, x+z(k)*p);
    end
    plot(z,y,'--b','Linewidth',3)
    pause(1)
    close all
    
    %Obtenemos t con el backtracking
    if strncmp(backtracking,'Int',4)
        t = BacktrakingInterpolacion2( fname,g,x,c1,p );
    else %strncmp(backtracking,'RD',6)
        t = BacktrackingRazondorada(fname, g, x, c1, p)
    end
    
    %Actualizamos x
    x = x + t*p;
    iter = iter +1;
    
    %Se recalcula el gradiente y la norma de g para poder usarlo en la 
    %evaluación del while.
    g = gradiente(fname,x);
    ng = norm(g)
end


end
