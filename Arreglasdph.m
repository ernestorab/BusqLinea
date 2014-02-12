function [ H ] =Arreglasdph( H )
%
%IN matriz hessiana
%
%OUT matriz hessiana definida positiva

%valores iniciales
tol=1.e-02; %tolerancia para el eigenvalor mínimo
v=eig(H); %eigenvalores de H
[n,m]=size(H);
vmin=min(v); %eigenvalor mínimo de H

%Si el eigenvalor mínimo es muy pequeño, se arregla la matriz para que sea
%spd
if(vmin < tol)
   %Se le suma una constante a la diagonal de la matriz hessiana en caso de ser mal condicionada
   %para que sea bien condicionada
   H= H+ (abs(vmin)+1)*eye(n);
end

end
