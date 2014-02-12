[x, iter] = metodoBL('Easom',[5;5],'M','R');
display('El punto en donde la función de Rosenbrock alcanza el mínimo es ')
x
display('El valor de la función de Rosenbrock es ese punto es ')
rosenbrock(x)
display('Este punto se alcanzó en ')
iter
display('iteraciones.')
