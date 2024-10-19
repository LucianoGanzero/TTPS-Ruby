¿Qué son los lazy enumerators? ¿Qué ventajas ves en ellos con respecto al uso de los enumera‑
dores que no son lazy?  
Tip: Analizalo pensando en conjuntos grandes de datos

Cualquier objeto enumerable en Ruby tiene el método lazy, que hace que los elementos no se procesen todos de inmedianto, si no que son procesados a medida que son necesitados.
Esto es necesario porque algunos enumerados pueden ser infinitos, por lo que algunas llamadas como count o select pueden hacer que el programa se rompa.
De todas maneras, lazy no solo es util en enumerados infinitos, sino que en cualquier colección grande, el uso de lazy puede hacer un mejor uso de la memoria y procesar con mayor eficiencia.
