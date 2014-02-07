function [ t] = BacktrakingRazondorada( fname,x, g, c1, p)
tol=1.e-08;

t=1;
g0=feval(fname,x);
gprima0=g'*p;
g1=feval(fname,x+t*p);

while(g1 > g0 + t*c1*gprima0)
    a=0;
    b=t;
    r = (3 - sqrt(5))/2;

    c = a + r*(b-a);
    d = a + (1-r)*(b-a);

    fc = feval(fname, x + c*p);
    fd = feval(fname, x + d*p);


    while(d - c)> tol*max(abs(c), abs(d))

        if fc >= fd
            z = c + (1-r)*(b-c);
            %[a c d b] <- [c d z b]
            a = c;
            c = d;
            fc = fd;
            d = z;
            fd = feval(fname, x+z*p);
        else
            z = a + r*(b-a);
            %[a c d b ] <- [a z c d]
            b = d;
            d = c;
            fd=fc;
            c = z;
            fd = feval(fname, x+z*p);
        end
    end

    t = (c+d)/2;
    
    if t<0.1
        t=0.1;
        break;
    end
    
    g1=feval(fname,x+t*p);
end

end
