### 1. ¿Qué finalidad tiene el archivo Gemfile? ###
En el archivo Gemfile se definen las gemas que vamos a requerir, entre otras cosas. Se puede especificar versión, fuentes, formas, etc.  

### 2. ¿Para qué sirve la directiva source del Gemfile? ¿Cuántas veces puede estar en un mismo archivo? ###
La directiva source define la fuente desde donde se van a obtener las gemas. Puede estar todas las veces que sea necesario porque puede definirse para gemas o grupos de gemas.

### 3. Acorde a cómo agregaste la gema colorputs, ¿qué versión se instaló de la misma? Si mañana se publicara la versión 7.3.2, ¿esta se instalaría en tu proyecto? ¿Por qué? ¿Cómo podrías limitar esto y hacer que sólo se instalen releases de la gema en las que no cambie la versión mayor de la misma con respecto a la que tenés instalada ahora? ###
De la forma que la declaré, solo poniendo el nombre, se instalará la última disponible. Si mañana se publicará una nueva y yo ejecuto install o update, se va a instalar la nueva versión. Para limitar esto, puede definirse que versión instalarse o, con algunos operandos, establecer algunos límites.  
Si yo quisiera que no cambie la versión mayor de la que tengo instalada, pero si el resto, puedo poner:  
`gem 'colorputs',  '~>1.1'`

### 4. ¿Qué ocurrió la primera vez que ejecutaste prueba.rb? ¿Por qué? ###
La primera vez que lo ejecuté me dijo que no podía encontrar la gema 'colorputs' entre mis gemas instaladas.

### 5. ¿Qué cambió al ejecutar bundle install? ###
Bundle install me instaló la gema, por lo que al volver a ejecutarlo ya sabía donde ir a buscar lo requerido.

### 6. ¿Qué diferencia hay entre bundle install y bundle update? ###
**Bundle install** instala las versiones exactas de las dependencias definidas en el Gemfile.lock, en caso de no haber un .lock, se genera en función al Gemfile y guarda allí las versiones específicas de cada una de las gemas instaladas.
**Bundle update** se usa para actualizar las versionas de las gemas en el proyecto. Esto es, bundler update ignora lo especificado en el Gemfile.lock y actualiza las gemas a la versión más reciente según las restricciones definidas en el Gemfile. Al realizar la actualización, regenerá el Gemfile.lock con las nuevas versiones instaladas.

### 7. ¿Qué ocurrió al ejecutar prueba_dos.rb de las distintas formas enunciadas? ¿Por qué? ¿Cómo modificarías el archivo prueba_dos.rb para que funcione correctamente sin importar de cuál de las dos maneras indicadas es ejecutado? ###
Al ejecutar prueba_dos solo con ruby, me devolvió una excepción de NameError, porque no sabe quien es Bundler.
Declarado así, Bundler me realiza todas los require de las depencias instaladas. Pero si lo llamo con Ruby, esto no se puede hacer.  
La manera de que funcione correctamente la ejecución sin importar la forma es hacer lo require manualmente. Es decir, explicitar con require que dependencia se quiere importar.