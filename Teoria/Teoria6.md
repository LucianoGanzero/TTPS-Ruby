# Teoría Clase 7/10 #

Clase pasada: Conceptos avanzados.

## Gemas ##

### Gem cli ###
Una gema es un formato que nos permite descargar y publicar Gemas. Las Gemas con librerias: tienen nombre, versión y plataforma.  
**Nombre**: Tiene que ser único para poder identificarlo.
**Versión**: Standar: versionado semántico. **x.y*z**. 
**Plataforma**: Ruby tiene distintas máquinas virtuales/plataformas. Las Gemas deben especificar para que plataforma funciona

### CLI - Comandos ###
**gem search algo:** Busca todas las gemas que incluyen la palabra "algo". La búsqueda la realiza en *RubyGems*.  
**gem list:** lista las gemas que tengo instaladas.  
**gem install nombre_gema**  

### Blunder ###  
Es una Gema que gestiona dependencias. Mantiene un entorno consistente para las aplicaciones Ruby.  
Asegura que la aplicación que lo use tenga las dependencias necesarias para que se ejecute sin errores.  
**gem install bundler**
**blundle init:** iniciamos el entorno
**bundle install:** instalar las dependencias
**bundle list:** listar las dependencias instaladas

## Active Record ##
Es una libreria dentro del Framework de **rails**.  
Es un ORM. Conecta clases a tablas de una base de datos.  
En el contexto de la aplicación las clases son **modelos**. Los modelos pueden conectarse con otros modelos mediante asociaciones.  
**CoC: Convention over Configuration:** Se basa en convenciones de nombres de forma tal que se utiliza el nombre de la clase o asociación para establecer mapeos con las tablaas de la base de datos y claves foráneas.  
Las clases utilizan CamelCase y las tablas snake_case.  
Claves foraneas: nombre_en_singular_id
Claves primarias: agrega id.  

