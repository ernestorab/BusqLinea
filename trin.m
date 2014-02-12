function  [x] = trin(L,b)
% Esta funcion calcula la solucion del 
%  sistema lineal triangular inferior
%    L*x = b

% In
% L.- matriz triangular inferior de orden n.
% b.- vector columna de orden n.
%
%Out
% x.- vector columna de orden n.

% inicio
n = length(b);
x = zeros(n,1);

% solución del sistema lineal

 x(1) = b(1)/L(1,1);

 for  k =2:n
    x(k) = (b(k) - L(k,1:(k-1) )*x(1:k-1) )/L(k,k);
end
