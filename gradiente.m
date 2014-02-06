function  [gfx] = gradiente(fname,x)
% Aproximacion del gradiente por diferencias hacia adelante 
% de una funcion  de R^n a R.

% Zeferino Parada
% 15 de enero de 2014

%In
% fname .- cadena con el nombre de la funcion.
% x .- vector columna de dimension n.
% Out
% gfx - vector columna de dimension n, es la aproximacion al
%       gradiente en x.

h = 1.e-06;                    % tamaño de paso
fx = feval(fname,x);           % se evalúa la función en el punto
n = length(x);                 % dimensión del vector
gfx = zeros(n,1);              % vector gradiente de salida

for k = 1:n
    xt = double(x); xt(k) = xt(k) + h;  % punto en la dirección k-ésima
    fxh = feval(fname,xt);
    gfx(k) = ( fxh - fx)/ h;    % diferencia hacia adelante
end


