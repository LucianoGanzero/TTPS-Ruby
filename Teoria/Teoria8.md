# Teoria 8 - 28/10 #

## Validaciones ##

Garantiza que se guarden **datos validos** en la base de datos.  
Validar en la base de datos me hace perder portabilidad.  
Validar del **lado del cliente**, en javascript, es poco seguro y puede ser manipulado, por más que se use HTTPS y SSL.  
Validar en el **controlador** puede complejizar el testeo y hacer engordar los controladores innecesariamente.  

**Cuando ocurren las validaciones?**
Hay dos tipos de objetos en AR: los que están persistidos en la BD y los creados (new) aun no persistidos.  
Las validaciones ocurren antes de la creación o guardado, que mapena a un INSERT, o antes de actualizar, que mapen a UPDATE.
  
Hay metodos que realizan validaciones y métodos que las ignoran.
Los que la realizan son: **create, save y update**. Todos tienen su variante con bang(1), que fallan si falla la validación.  
**Create** crea y guarda un objeto en la misma acción, medio innecesario.  

### Validadores ###
**Acceptance**: Se usa en aplicaciones WEB donde se espera un checkbox tildado por el usuario. No es necesario que la base de datos tenga un atributo, sino que el helper creará un campo virtual para este proposito.  
**Validates_associated**: Valida las asociaciones relacionadas al objeto. No debe utilizarse en ambas partes de una asociación porque puede terminar en un loop infinito.  
**confirmation**: Se utiliza cuando dos campos de texto deben contener el mismo dato.  El segundo es un campo virtual.  
**exclusion/inclusion**: 
**format**: Valida el formato con una expresión regular.  
**length**: longitud.  
**numericality**: solo valores numéricos. Acepta negativos y puntos flotantes.  
**presence/absence**: 
**uniqueness**: 
**Validaciones condicionales**: usan :if o :unless. Pueden usar un simbolo, un string, un Proc, un arreglo.


## Asociaciones ##

Todos los tipos de asociaciones que nos permite modelar Active Record.  
- belongs_to => siemmpre del otro lado está contrapuesta por un has_one o un has_many
- has_one
- has_many
- has_many :through => Proxy. Tengo muchos de x a través de y
- has_one :through
- has_and_belongs_to_many