function [ fx ] = Griewangk( x )
%funcion de Griewangk en 2 variables
%   Usada en el proyecto de búsqueda de línea


fx=((x(1)^2+x(2)^2)/4000)-cos(x(1))*cos(x(2)/sqrt(2))+1;
end
