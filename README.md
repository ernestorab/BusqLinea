Búsqueda de Línea
=========

En este proyecto se programó un método de Búsqueda de Línea para minimizar funciones. Se puede usar tanto la dirección de Newton como la dirección de descenso máximo; se puede usar backatrcking por interpolación así como backtracking por el método de la razón dorada.

#Archivos y su descripción

1. **MétodoBL** - Contiene el método de búsqueda de Línea que usa la condición de Armijo y una segunda condición muy relajada para evitar dar pasos muy largos o muy cortos. El criterio de paro principal es que el gradiente sea menor que una cierta tolerancia predefinida. Además contiene otros criterios de paro tales que evitan que el algoritmo itere entre sólo dos e incluso tres puntos. Además, si por alguna razón el algoritmo termina en el número máximo de iteraciones (esto es, no se cumpliò ninguna condición de paro) entonces se escoge el punto de norma mínima al que se llegó.
2. **BacktrackingInterpolacion2** - Hace una interpolación con tres puntos conocidos para generar una cuadrática, que se minimiza. El valor encontrado corresponde al tamaño del paso que se dará.
3. **BactrackingRazondorada2** - Se minimiza la función cuadrática (que depende del tamaño del paso) por el método de la razón dorada.
4. **BLEasom** - Contiene un ejemplo de cómo se corre el algoritmo.
5. **Otros archivos** - Contienen las funciones de prueba.

#¿Cómo se usa?

Descargar los archivos y abrirlos en Matlab. la sintaxis para correr el método de búsqueda de línea es
```bash
[x, iter] = MetodoBL(fname, ptoini, descenso, backtracking)
```
**fname** es el nombre de la función que se va a minimizar, previamente se debe haber creado una función en matlab con ese nombre. Para ello ver las funciones de prueba que se proveen.

**ptoini** es el punto inicial del algoritmo.

**descenso** es el tipo de descenso que se usará: 'N' es Newton y 'M' es máximo descenso.

**backtracking** es el método de backtracking que se usará: 'I' es interpolación y 'R' es razón dorada.

**x** es el punto donde se alcanza el posible mínimo que encontró el algoritmo.

**iter** es el número de iteraciones en que se alcanzó.
 
#Resultados

Función     | x                 | f(x)      |iter
------------|-------------------|-----------|-----
Rosenbrock  |[0.9997;0.9995]    |7.21E-08   |12
Rastrigin   |[1.0E-5,1.0e-5]    |2.79E-10   |5
Griewangk   |[1.0E-5,1.0e-5]    |-2.68E-09  |5
Branin      |[-3.1416,12.2750]  |4.05E-54   |4
Easom       |[3.1416,3.1416]    |-1         |4
