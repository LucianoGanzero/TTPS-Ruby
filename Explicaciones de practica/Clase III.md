# Clase 3 - 3/10 #

## Modulos ##
Declaramos con **module** y le damos un nombre, que comienza con mayúscula.  
Dentro puedo definir cualquier cosa: constantes, métodos, otros módulos, clases.  
La gran diferencia con las clases es que los módulos no se pueden instanciar. Los módulos existen solo como eso; depende como lo utilicemos que función van a cumplir.  
  
### Modulos como Namespaces###
Agrupan cosas dentro de un mismo espacio. Para poder referenciar cosas dentro de un método, como constantes o variables, debo utilizar **NombreModulo::Nombre**. Esto sirve para constantes, variables, otros módulos declarados dentro del modulo. Para poder ejecutar los métodos que defino dentro del módulo como **NombreModulo.NombreMetodo**, debo haberlo definido en el módulo como método "de modulo", es decir, con el self.  

### Modulos como Mixins ###
Los métodos que no defino como self, solo los voy a poder usar con las palabras claves **include** y **extend**.
Usando cualquiera de estas palabras dentro de una clase, los métodos que definí con **self** en el módulo no podrán ser usados dentro de una clase.
**Include** Trae los métodos para ejecutar como métodos de instancia.
**Extend** Trae los métodos para ejecutar como métodos de clase. 

### Metraprogramación ###
Podemos definir métodos especiales dentro del módulo que se intentan invcoar cuando se includen o extienden, como parte de la preparación para que funcione. A esos métodos se la pasa como parámetro la clase que lo incluyo/extendió. Ahí, yo puedo definirle variables a la clase, o métodos, etc.
Los métodos se llaman **self.included** y **self.extended**.