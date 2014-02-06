function [ t ] = BacktrakingInterpolacion2( fname,g,x,c1,p )

t=1;
g0=feval(fname, x);
gprima0=g'*p;
g1=feval(fname,x+t*p);

while(g1 > g0 + t*c1*gprima0)

    g1=feval(fname,x+t*p);
    t=-(gprima0*t^2) /(2*(g1-t*gprima0-g0));

end

if t<0.1
    t=0.1;
end

