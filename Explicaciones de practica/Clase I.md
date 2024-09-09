# Clase I - 5/9

## Practica 0
***Uso de git***: No es necesario hacerlo, chusmear

## Practica 1
Tipos básicos
Documentación oficial => ruby-lang.org

**En ruby todo es un objeto**

**Symbol =>** La dierencia con el String es que los simbolos se guardan en una región especial de memoria, por lo que los simbolos tienen siempre el mismo id. Tampoco los agarra el garbage collector. Se los usa como etiquetas o claves de los hashes.

**Hashes =>** Almacenan pares de clave-valor. No tengo limitacion en tipos ni en las clave ni en los valores.

### Metodos ###
Puedo invocarlos sin parentesis. Son opcionales. Pueden ser obligatorios cuando tengo que desambiguar, es decir, demarcar claramente que quiero hacer una cosa y no otra.  
Se definen con la palabra clave **def**. Puedo pasarle parametros separados por comas. No lleva dos puntos. 
Terminan con la palabra clave **end**.  
Ruby retorna lo último que interpreta. Puedo agregarle el return pero es redundante y, como ruby es minimalista, no debe ponerse.

**Clases =>** Como en Ruby todo es un objeto, la clases también lo son. Todas las clases son instancias de otra clase, el última instancia, son instancias de la clase Class. Por ejemplo, nil es un objeto de la clase NilClass (nil.class), y la clase NilClass es un objeto de la clase Class (nil.class.class)

### Ejecucion ###
Puedo ejecutar cualquier archivo el la consola con ruby nombrearchivo
También puedo ejecutar directamente ingresando en la consola de ruby con irb
Dentro de la consola de ruby, puedo ejecutar un archivo poniendo require (ruta_del_archivo). Si estoy parado en la ruta no alcanza con poner el nombre del archivo, debo poner './nombre_del_archivo'.
El require carga el archivo, lo interpreta y registra esto, para evitar volver a hacerlo. Si cambio el archivo y vuelvo a ejecutar un require, me va a devolver false porque considera que ya lo cargo. Para aplicar los cambios puedo salir de la consola y volver a entrar, no es muy practica.
Hay otra forma de cargar los archivos que es con *load*. Load siempre carga los archivos.

### Sintaxis ###
Las comillas dobles permiten hacer *interpolacion*. Puedo poner dentro de #{} codigo ruby (nombre de una variable, funcion a ejecutar, hash, etc). La comilla simple interpreta todo como string.

### Salida ###
**puts** imprime el contenido del string.  
**p** imprime el contenido entre comillas. El metodo p, en lugar de enviar to_s envia el metodo *inspect*, que permite inspeccionar los valores y saber más de la representación interna. Útil con clases.

### Errores ###
El error devuelve la ruta del archivo : la linea donde se produjo : lo que estaba ejecutando cuando se produjo : explicación del tipo de error.

### Bloques ###
Encapsulan lógica y permiten enviarla a algunos métodos como map.  
Puedo enviarla entre llaves o entre do end, pero la lógica es la misma, código que va entre delimitadores. La convención es que si lo paso por llaves, es código en una línea; si va a llevar más uso do end.  
Para acceder a cada uno de los elementos del arreglo que estás recorriendo debe ponerse entre pipes || el nombre del argumento.
  
Hay otra forma de escribir un bloque, que es con &. El & representa un argumento al que le aplico el simbolo que pongo a continuación. Los métodos los puedo invocar como simbolos.