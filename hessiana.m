function [ H ] = hessiana( fname,a )
%Calcula la matriz hessiaa de la función fname en el vector a.
%La matriz H es de n*n simétrica y tiene la aproximación a la matriz
%hessiana.

%Ernesto Ramírez Abitia
%116952

h = 1.e-04;                    % tamaño de paso
fx = feval(fname,a);           % se evalúa la función en el punto
n = length(a);                 % dimensión del vector
H = zeros(n,n);              % vector gradiente de salida

for i = 1:n
    for j = 1:i
        aj = a; aj(j) = aj(j)+h;                      %j-ésima coordenada de a cambia
        ai = a; ai(i) = ai(i)+h;                      %i-ésima coordenada de a cambia
        aij = a; aij(i) = aij(i) + h ; aij(j) = aij(j) + h;     %ambas coordenadas cambian
        fxh = feval(fname,aij);                      %Evaluación de la función en los distontos puntos
        fxhi = feval(fname,ai);
        fxhj = feval(fname,aj);
        H(i,j) = ( fxh - fxhi - fxhj + fx)./ (h.^2);  % diferencia hacia adelante
        H(j,i) = H(i,j);
    end
end

end

