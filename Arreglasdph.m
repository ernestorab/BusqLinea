function [ H ] =Arreglasdph( H )

tol=1.e-02;
v=eig(H);
[n,m]=size(H);
vmin=min(v);
vmax = max(v);

if(vmin < tol)
   H= H+ (abs(vmin)+1)*eye(n);
end

end
