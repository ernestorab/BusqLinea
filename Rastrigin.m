function [ fx ] = Rastrigin( x )
%funcion de Rastrigin en 2 variables
%   Usada en el proyecto de búsqueda de línea

fx=20+(x(1)^2-10*cos(2*pi*x(1)))+(x(2)^2-10*cos(2*pi*x(2)));
end
