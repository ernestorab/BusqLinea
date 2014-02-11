function [ t ] = BacktrackingRazondorada2(fname,x,c1,p,r)
tol=1.e-08;
maxiter = 50;

iter = 0;

t3=1; t0=c1;

%Mientras la diferencia entre los extremos del intervalo sean grandes, y
%las iteraciones no rebasen el máximo permitido, se busca el mínimo
while(abs(t3-t0)>=tol & iter < maxiter)
    
    %puntos entre t0 y t3
    t1=t0+r*(t3-t0);
    t2=t0+(1-r)*(t3-t1);
    
    %calculamos los puntos donde se evaluarán las funciones
    x1=x+t1*p;
    x2=x+t2*p;
    
    %Se construyen los nuevos extremos del intervalo
    if(feval(fname,x1)<=feval(fname,x2))
        t3=t2;
    else
        t0=t1;
    end
    
    iter=iter+1;
    
    
end

%la aproximación al mínimo es el punto medio del intervalo final.
t=(t0+t3)/2;    
    

end
