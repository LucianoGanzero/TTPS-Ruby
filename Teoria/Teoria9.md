# Clase 9 - 4/11 

## Rails
Un framework es justamente eso, un marco de trabajo, una caja de herramientas.  

### Introducción - Como funciona la web?
### Que es Rails
Es un conjunto de estructuras y convenciones.  
Usa MVC.  
**Stack tecnologico** Conjunto de teconologias o librerias utilizadas para desarrollar una aplicación.  
En Rails, en general el stack es:
- Mac/Linux/Windows
- Puma/Unicorn
- SQLite/MariaDB/Postgres
- Ruby

Un WEBServer sirve contenido estático y un ApplicationServer sirve contenido dinámico.  
El WEBServer se pone por delante del ApplicationServer, responde sirviendo al contenido estático, y al dinámico se lo deriva al ApplicationServer.

### Instalar
**gem install rails** -> Te da el comando global **rails**
**rails new nombreRepo** -> Crea un directorio con el nombre del repo, crea el template de todo e instala.  

**bundle exec rails server**-> Levanta

# Clase 10 - 11/11

**bundle list** => Listar todas las gemas instaladas.  

## Directorios importantes

**README.md** => Completar para el trabajo final.  
**app/** => La carpeta más importante.
**config/** => Casi no se modifica, están todas las configuraciones del proyecto.
**db/** => Configuracion de la base de datos y migraciones.  
**public/** => Todo lo accesible por el WEBServer.  

## App/

## configuraciones

**Variables de entorno =>** 
