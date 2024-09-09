### Investigá qué métodos provee Ruby para: ###

>**Obtener la lista de ancestros (superclases) de una clase.**  
El método ancestors devuelve una lista con todos los ancestros de una clase  
  
>**Conocer la lista de métodos de una clase.**  
El método methods devuelve una lista con todos los metodos de una clase  
  
>**Conocer la lista de métodos de instancia de una clase.**  
instance_methods te da lista de métodos de instancia de una clase. Se lo tengo que enviar a la clase, por ejemplo
`String.instance_methods`  
  
>**Conocer las variables de instancia de una clase.**  
Para obtener las variables de instancia de un objeto de una clase, puedes usar el método instance_variables.  
  
>**Obtener el valor de una variable de instancia de un objeto (sin utilizar un método generado con attr_reader o similar) accediéndolo desde fuera de éste.**  
Puedes utilizar el método instance_variable_get para acceder al valor de una variable de instancia desde fuera del objeto, incluso si no hay un método de lectura (attr_reader) definido. Por ejemplo `obj.instance_variable_get(:@nombre)`  
  
>**Establecer el valor de una variable de instancia de un objeto (sin utilizar un método generado con attr_writer o similar) desde fuera de éste.**  
Puedes usar el método instance_variable_set para establecer el valor de una variable de instancia desde fuera del objeto, sin necesidad de un método de escritura (attr_writer). Por ejemplo `obj.instance_variable_set(:@nombre, "Juan")`  