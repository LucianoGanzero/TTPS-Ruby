## 11. ¿Qué es una gema? ¿Para qué sirve? ¿Qué estructura general suele tener? ##

Una gema es un formato simple para publicar y compartir código Ruby. Son colecciones de código, paquetes reutilizables. Cada gema tiene un nombre, versión y plataforma.  

## 2. ¿Cuáles son las principales diferencias entre el comando gem y Bundler? ¿Hacen lo mismo? ##

Ambos son comandos que permiten gestionar las gemas en Ruby, pero no hacen lo mismo. La diferencia principal es que Bundler permite mantener entornos consistentes para las aplicaciones Ruby. Es decir, en lugar de hacer instalaciones globales, permite mantener las gemas especificas para un proyecto determinado.

## 13. ¿Dónde almacenan las gemas que se instalan con el comando gem? ¿Y aquellas instaladas con el comando bundle? ##  
Las gemas instaladas con **gem** se almacenan en la ubicación global para gemas del sistema Ruby, que pueda definirla el usuario pero normalmente es */usr/local/lib/ruby/gems/<versión_de_ruby>/*  
Las gemas instaladas con bundle se almacenan en distintos paths según el proyecto en donde fueron instaladas, y luego el Gemfile especfiica como ir a buscarlas.

## 14. ¿Para qué sirve el comando gem server? ¿Qué información podés obtener al usarlo? ##
Gem server le permite al usuario iniciar un servidor de gemas para poder servir sus propias gemas.  

## 15. Investigá un poco sobre Semantic Versioning (o SemVer). ¿Qué finalidad tiene? ¿Cómo se compone una versión? ¿Ante qué situaciones debería cambiarse cada una de sus partes? ##
El versionado semántico es una notación para facilitar la administración de dependencias en proyectos de software. La finalidad es poder manejar tu software sin temor a que la actualización de alguna de todas las librerías o dependencias utilizadas bloqueen el funcionamiento de todo el sistema.  
Asi, surge el versionado semántico para explicitar la versión de la libreria que utiliza un sistema.  Para esto, considera un formato de versión X.Y.Z (Mayor, menor, parche). Los softwares que usen versionado semántico deberán declarar un API público y las versiones que lance deben respetar el formato X.Y.Z, con X, Y, Z siendo números enteros no negativos.
Cuando los paquetes versionados son publicados, estos no pueden cambiar. Las modificaciones deben ser publicadas como nuevas versiones. 
Una versión parche Z debe ser incrementada si solamente se introducen correciones de errores compatibles con versiones anteriores. 
Una versión menor Y debe ser incrementada si se introduce una funcionalidad nueva y compatible con la versión anterior de l API público.
Una versión mayor X debe ser incrementada solamente si se introducen cambios incompatibles con la versión anterior del API público.

