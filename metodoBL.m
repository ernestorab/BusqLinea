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
tol = 1.e-06;   %tolerancia para la norma del gradiente
c1 = 1.e-04;       %valor para la condición de Wolfe
maxiter = 50;  %número máximo de iteraciones externas permitidas

%valores iniciales
iter = 0;       %contador para las iteraciones externas

g = gradiente(fname,x);     %gradiente de g
ng = norm(g);               %norma del gradiente
min_ng = ng;                %norma mínima del gradiente a la que el algoritmo llegó
x1_min_ng = x(1);           %punto inicial de norma mínima;
x2_min_ng = x(2);
ng2=0;                      %ng2 es la norma de g en la iteración anterior
ng3=0;

%parte iterativa.
%condición de paro es que la norma del gradiente sea cercana a 0
%o que se llegue al màximo de iteraciones
while ( ng > tol && iter < maxiter)
    
    %Condición de paro extra:
    %Si la norma de g no cambia mucho de una iteración a otra, se llegó a
    %la solución.
    if (iter ~= 0 & abs(ng2-ng)<sqrt(tol))
        break;
    end
    
    if (iter > 1 & abs(ng3-ng)<sqrt(tol))
        break;
    end
    
    %Calculamos la Hessiana de f en x
    H = hessiana(fname,x);

    %Se escoge la dirección de descenso
    if strncmp(tipo_descenso,'M',1)
        p = -g/ng;                    %máximo descenso
    elseif strncmp(tipo_descenso,'N',1)
        %Resolver H*p=-g para obtener la dirección de Newton p
        L = chol(H)';                   %factorización de Cholesky H = L*L'
        y = trin(L, -g);                %L*y = -g
        p = tris(L',y);                 %L'*p = y
    end
    
    %guardamos la norma de esta iteración
    ng3=ng2;
    ng2=ng;
    
    %graficación
    z = linspace(0,1,30)';
    for k = 1:30
        y(k) = feval(fname, x+z(k)*p);
    end
    plot(z,y,'--b','Linewidth',3)
    pause(1)
    close all
    
    %Obtenemos t con el backtracking
    if strncmp(backtracking,'I',1) %Interopolación
        t = BacktrakingInterpolacion2( fname,g,x,c1,p )
    elseif strncmp(backtracking,'R',6) %Razón dorada
        r = 0.3 %sugerida, r entre
        t = BacktrackingRazondorada2(fname, x, c1, p, r)
    end
    
    %Actualizamos x y el contador de iteraciones.
    x = x + t*p;
    iter = iter +1;
    
    %Se recalcula el gradiente y la norma de g para poder usarlo en la 
    %evaluación del while.
    g = gradiente(fname,x);
    ng = norm(g)
    
    %Checamos y guardamos el punto actual si la norma de g en este punto es
    %la menor que se ha obtenido.
    if ng < min_ng
        min_ng = ng;
        x1_min_ng = x(1);
        x2_min_ng = x(2);
    end
end

%Condición para obtener la mejor aproximación posible al mínimo.
if ng > min_ng
    x = [x1_min_ng; x2_min_ng];
    min_ng
end


end
