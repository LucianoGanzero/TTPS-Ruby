# Repaso clase anterior #
# Modulos ##

## Mixins ## 

Permite incluir un modulo a una definición de una clase.
Los metodos de insatancia definidos en el modulo pueden ser invocados por objetos de la clase que lo implementan.
Las clases deben incluir modulos con la palabra clave **include** -> Agrega una referencia al modulo.
Si modificamos el modulo durante la ejecución todas las clases que lo incluyen tomaran los cambios automaticamente.
Es lo mas *parecido* a una interface de Java.

No es una buena práctica que los módulos usen variables de instancia porque pueden colisionar con la variables de las clases que los incluyan. Si tengo que definir variables puedo poner nombres crípticos.

### Modulos Comparable y Enumerable ###
Para incluir el modulo Comparabale, además de incluirlo debemos implementar en nuestra clase el método <=>. Esto nos permitirá comparar nuestra clase con cualquier de los operadores.

Los mismo con el Enumerable. Debemos implementar el metodo each.

# Clase nueva #

## Resolución de nombre ##
- Primero se busca si la clase del objeto lo implementa
- Luego en los mixins incluidos en la clase. Si tiene varios módulos, prima el último.
- Luego en la superclase.

El metodo **ancestors** me permite ver la lista de ancestros de una clase. Los modulos se inyectan como ancestros, entre la clase y la clase padre.
Entonces, la lista devuelta por el método ancestors me devuelve el orden por que el se va a buscar los métodos.

## Extend ##
Extend en una clase importará los métodos del módulo como métodos de clase.
En vez de actualizar la lista de ancestros, extend modificará el *Singleton* de la clase extendida, agregando métodos **de clase**

Los modulos serán pensandos para usar con include o con extend.

## Cuándo usar cada uno? ##
> **DRY: Don't repeat yourself**

> **KISS: Keep it simple & stupid**

**Herencia** debe aplicarse cuando se cumple la propiedad **es un**
Cuando usamos herencia deberíamos poder pasar en todo momento un objeto de una subclase a uno de la superclase
Muchas veces se utiliza mal en situaciones de posee un o utiliza un.
Herencia representa un gran acoplamiento, cambiar es algo complejo en casi cualquier programa.


## Excepciones ##
El objeto Exception se propagará hacia arriba en el stack
Ruby define una jerarquía de excepciones que son subclase de Exception
Al lanzar una excepción se puede hacer desde Exception o de una clase propia.

Cuando ocurre una excepción se ubica una referencia a la excepción en la variable global **$!**
Raise dentro de un rescue relanza la excepción que estoy trapeando.


## Conceptos avanzados ##