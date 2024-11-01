## 1. Investigá la jerarquía de clases que presenta Ruby para las excepciones. ¿Para qué se utilizan las siguientes clases? ##
- **ArgumentError =>** Se levanta cuando los argumentos están mal y no hay una excepción más precisa para manejarlos. Puede ser por número de argumentos, por tipo, por que el argumento es inacceptable, etc. Desciende de *StandardError*
- **IOError =>** Se levanta en un error de entrada/salida. Desciende de *StandardError*
- **NameError =>** Se levanta cuando un nombre es invalido o no está definido. Desciende de *StandardError*
- **NotImplementedError =>** Se levanta cuando una característica no está implementada en la plataforma actual. Desciende de *ScriptError*
- **RuntimeError =>** Es un error genérico que se levanta cuando una operación inválida es intentada. Es el error por defecto que se levanta con raise. Desciende de *StandardError*
- **StandardError =>** Es una clase que engloba a la mayoría de errores estandars. Si hay un rescue sin una declaración explicita, se rescataran solo los StandardError.
- **StopIteration =>** Es levantada para frenar una iteración, particularmente por el método next de los Enumerators. Un loop la rescata. Desciende de *IndexError* que a su vez desciende de *StandardError*
- **SystemExit =>** Es levantada por exit para iniciar la terminación del script.
- **SystemStackError =>** Se levanta por un overflow del stack. Por ejemplo: recursión mal manejada.
- **TypeError =>** Se levanta cuando se encuentra un objeto que no es del tipo esperado. Desciende de *StandardError*
- **ZeroDivisionError =>** División por 0. Desciende de *StandardError*

## 2. ¿Cuál es la diferencia entre raise y throw? ¿Para qué usarías una u otra opción? ##
**Raise** lanza una excepción, y podemos enviarle parámetros para especificarle el tipo y el mensaje. **throw** permite lanzar una excepción, a menudo según una condición, que luego será atrapada por otro bloque **catch** que ejecturá algo en caso de que sea levantada.


## 3. ¿Para qué sirven begin .. rescue .. else y ensure? Pensá al menos 2 casos concretos en que usarías estas sentencias en un script Ruby ##
Begin y rescue encierren el comportamiento principal del manejo de excepciones. El bloque dentro del begin se ejecutara normalmente hasta que ocurra una excepción. Una vez que ocurra, esa excepción puede ser manejada mediante un rescue, donde se determinará que hacer con ella. Puede haber varios rescue para un bloque y cada rescue puede catchear varias excepciones.  
Ensure puede formar parte de un bloque begin/rescue, y lo que nos ofrece es la posibilidad de poner código que deba ejecutarse si o si, se haya levantado una excepción o no. El ejemplo de uso más claro es para cerrar un archivo, que debe hacerse así su procesamiento haya sido exitoso o no.  
Else, por su parte, se ejecuta cuando ninguna de los rescue logra ejecutarse.

## 4. ¿Para qué sirve retry? ¿Cómo podés evitar caer en un loop infinito al usarla? ##
Retry nos permite volver a ejecutar un bloque begin/end. El problema es que si no se cambia nada en el rescue de una excepción y solo se ejecuta retry, posiblemente vayamos a entrar en un loop infinito, por lo que es necesario estar atento y acomodar el estado del programa al momento de hacer un retry.

## 5. ¿Para qué sirve redo? ¿Qué diferencias principales tiene con retry? ##
Redo permite volver a ejecutar una iteración dentro de un loop. La diferencia con retry es que retry requiere del levantamiento de una excepción, mientras que redo no. Además retry reinicia todo el bloque de código, mientras que redo solo reinicia la iteración.
