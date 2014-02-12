function fx = rosenbrock(x)
% función de Rosenbrock: f: R^2 --> R
% cuyo mínimo local es muy difícil de alcanzar por medio
% de los métodos de optimización.
%In
% x.- vector de longitud 2
% fx.- número real con el valor de la función.
%  15 de enero de 2014

fx = 100*(x(2) - x(1)^2)^2 + (1 - x(1))^2;

end
