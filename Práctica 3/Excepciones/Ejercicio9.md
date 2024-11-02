## 9. Dado el siguiente código: ##

**1. Seguí el flujo de ejecución registrando la traza de impresiones que deja el programa, analizando por qué partes del código va pasando y justificando esos pasos**
Comienza el bloque, pone x en 0 y llama a la función 1 con pasandole x.  
Ahi imprime "Entrando a f1" y llama a f2 pasandole x.  
Ahi imprime "Entrando a f2" y llama a f3 sin pasarle nada.  
Ahi imprime "Entrando a f3" y levanta RuntimeError, pasandole como mensaje "Excepción intencional". Ese mensaje no se imprime porque es capturada por el manejador de RuntimeError, que imprime "Tratando excepción provocada en tiempo de ejecución".  
Luego de eso se ejecuta el **ensure** de f3, que imprime "Ejecutando ensure de fun3".  Ahi termina f3, el control vuelve a f2.  
En f2 se produce una división por 0, pero como f2 no tiene manejadores, la excepción se propaga a quien la llamo, que es f1, que si tiene manejador para cualquier excepción. Allí la captura e imprime "Manejador de excepciones de fun1".  
Después de eso la vuelve a levantar con un raise, y ejecuta su ensure, imprimiendo "Ejecutando ensure de f1.".  La excepción ahora debe ser capturada por main.  
Main la captura e imprime "Manejador de excepciones de Main". Ahí, si x es 0, que lo es, imprime "corrección de x", poné x en 1 y ejecuta un retry, que vuelve a ejecutar todo el código desde el inicio del bloge begin...rescue de Main, solo que con x=1 ahora.  

Nuevamente, comienza el bloque y Main llama a f1 pasandole x.
Ahi imprime "Entrando a f1" y llama a f2 pasandole x.  
Ahi imprime "Entrando a f2" y llama a f3 sin pasarle nada.  
Ahi imprime "Entrando a f3" y levanta RuntimeError, pasandole como mensaje "Excepción intencional". Ese mensaje no se imprime porque es capturada por el manejador de RuntimeError, que imprime "Tratando excepción provocada en tiempo de ejecución".  
Luego de eso se ejecuta el **ensure** de f3, que imprime "Ejecutando ensure de fun3".  Ahi termina f3, el control vuelve a f2.  
En f2 no se producen Excepciones, por lo que el bloque se ejecuta normalmente, imprime "Terminando fun2" y termina, volviendo el control a f1.
Ahí, continua la ejecución de f1 con la ejecución del ensure, que imprime "Ejecutando ensure de f1" y devuelve el control a main.  
En Main se continua la ejecución imprimiendo "Salida".

**2. ¿Qué pasaría si se permuta, dentro de fun3, el manejador de excepciones para RuntimeError y el manejador de excepciones genérico (el que tiene el rescue vacío)?**  
Se ejecuta el primer manejador que pueda tratar la excepción levantada, es por eso que el manejador genérico siempre se pone último. Si se permutan, el que levanta la excepción es el genérico.

**3. ¿El uso de retry afectaría el funcionamiento del programa si se mueve la línea x = 0 dentro del segundo begin (inmediatamente antes de llamar a fun1 con x)?**
Si, se entraría en un loop infinito, porque retry vuelve a ejecutar desde el begin, por lo que pondría a x en 0 y volvería a ejecutar todo.