function   x = tris(U,b)
%
% This function solves the upper triangular linear
% system ** Ux = b ** by backward substitution.
%
% In
% U     upper triangular marix of order n.
% b     vector of length n. It is the right hand side of
%       the system.
%
% Out
% x    vector of length n contained the solution

n = length(b);
x = zeros(n,1);

% backward substitution
x(n) = b(n)/U(n,n);
for k = n-1:-1:1
   x(k) = ( b(k) -U(k,(k+1):n)*x((k+1):n))/U(k,k);
end
