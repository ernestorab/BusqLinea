function [ fx ] = Easom( x )
%funcion de Easom en 2 variables
%   Usada en el proyecto de búsqueda de línea

fx=-cos(x(1))*cos(x(2))*exp(-(x(1)-pi)^2-(x(2)-pi)^2);

end
