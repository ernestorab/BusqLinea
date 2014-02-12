function [ t ] = BacktrakingInterpolacion2( fname,g,x,c1,p )
%Método de Backtracking usando Interpolación para obtener la t que cumpla la condición de Wolfe

%In.-
% fname; cadena de caracteres con el nombre de la funcion a minimizar
% g; vector grafiente de la función fname de dimensión n
%x; vector n dimensional que denota el punto inicial
%c1; es el parametro relacionado a la primera condición de Wolfe
% p es un vector n dimensional, es la dirección de descenso para la busqueda de línea

%Out
% t .- la t que cumple la condición de Wolfe 

%DESCRIPCIÓN

t=1; % valor incial de t
g0=feval(fname, x);     %función evaluada
gprima0=g'*p;
g1=feval(fname,x+t*p);  % función evaluada al dar el paso completo

while(g1 > g0 + t*c1*gprima0)
    
    g1=feval(fname,x+t*p);
    t=-(gprima0*t^2) /(2*(g1-t*gprima0-g0));
    
    if t<0.1
        t=0.1;
        break;
    end

end


end
