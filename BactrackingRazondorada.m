function [ t ] = BacktrackingRazondorada( fname, x, g, c1, p)
tol=1.e-08;

t=1;
g0=feval(fname,x);
gprima0=g'*p;
g1=feval(fname,x+t*p);

while(g1 > g0 + t*c1*gprima0)
    a=0;
    b=t;
    r = (3 - sqrt(5))/2;

    while ((b-a)>tol)
    c=a+r*(b-a);
    d=a+(1-r)*(b-a);
    
    if(feval(fname,x+c*p)<=feval(fname,x+d*p))
        b=d;
    else
        a=c;
    end
    
    
    end
    t=(a+b)/2;
    
    if t<0.1
        t=0.1;
        break;
    end
    
    g1=feval(fname,x+t*p);
end

end
