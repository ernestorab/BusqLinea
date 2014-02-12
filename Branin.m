function [ fx ] = Branin( x )
%funcion de Branin con parámetros 
a = 1;
b = (5.1)/(4*pi^2);
c = 5 / pi;
d = 6;
e = 10;
f = 1 / (8*pi);
%Usada en el proyecto de búsqueda de línea

fx=a*(x(2)-b*x(1)^2+c*x(1)-d)^2+e*(1-f)*cos(x(1))+e;

end
