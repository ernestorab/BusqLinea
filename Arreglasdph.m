function [ H ] =Arreglasdph( H )
%
%IN matriz hessiana
%
%Out matriz hessiana definida positiva

%valores iniciales
tol=1.e-02; %tolerancia para el eigenvalor con el valor minimo
v=eig(H);   % vector de eigenvalores
[n,m]=size(H);
vmin=min(v);

if(vmin < tol)
   H= H+ (abs(vmin)+1)*eye(n); %se le suma una constante a la diagonal de la matriz hessiana en caso de ser mal condicionada
                              %para que sea bien condicionada
end

end
