function [ fx] = Ackley( x )
%funcion de Ackley en 2 variables
%   Usada en el proyecto de búsqueda de línea

fx=-20*exp(-0.2*sqrt(0.5*(x(1)^2+x(2)^2)))-exp(0.5*(cos(2*pi*x(1)) + cos(2*pi*x(2))))+20+exp(1);

end
