# Clase 4 - 24/10 #

## Excepciones, gemas y bundle ##

### Primera parte: Excepciones ###

Los errores son instancias de una clase Exception.  
Los clases de los errores terminan con Error, los que terminan con Exception a menudo son superclases que no se instancian sino que agrupan a otro errores.  
SystemExit no es un error, pero no permite tratar algo cuando termina nuestro proceso.  
Lo mismo StopIteration, tampoco es un error, es la finalización de una iteración, y podemos hacer algo cuando termina atrapando esta excepción.  

### Segunda parte: Gemas y Bunndle ###
Librerias reutilizables. Paquetes de codigo que se pueden instalar, utilizar y actualizar.  
Hay dos grandes formas de manejarlo: con el comando **gem** o con **bundle**. La gran diferencia es que bundle utiliza gem pero lo hace dentro de un proyecto, gem es global.  
Hoy en dia bundle ya viene incorporado a la instalación normal de Ruby, y la ejecución de Ruby usa directamente bundle.  

### Ejemplo ###
En la raiz del proyecto que quiero crear, ejecuto **bundle init**: esto crea el **gemfile** a la altura del directorio que estoy parado.  
El Gemfile ya se crea con algunas lineas, la más importante es **source** que especifica donde va a buscar las gemas especificadas.  
Cuando hago **bundle install** me genera un **Gemfile.lock**, que mantiene información de cuales son las versiones que estan instaladas en el proyecto. Este archivo está en sincronía con el Gemfile, si se agrega una gema en Gemfile, se agregará acá. Si hago **bundle update** se actualizarán las versiones y, por tanto, el Gemfile.lock.  
  
**Ejemplo**  
`gem 'cowsay', '>= 0.3.0`
Definimos con gem y luego el nombre de la gema, y luego podemos especificar la versión, con diferentes operadores, como mayor igual, menor igual, etc.  
El **squeaky operator** que es **~>**, me dice que voy a instalar esa versión de la gema y lo únnico que puede cambiar es el último número, el del parche.

Cuando vamos a usar la gema debemos importarla en el archivo. Normalmente, se hace el require con el nombre de la gema que usamos en el Gemfile. Si no funciona así, deberia estar documentado como importarla.