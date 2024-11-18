# Ruby on Rails

## 1. El framework está compuesto de diferentes librerías: ¿Qué funcion principal cumplen?


**ActionMailer:** Permite enviar mails desde la aplicación Rails. Usa clases (llamadas "mailers") y vistas para crear la configuración de los mails a enviar. Los Mailers, que heredan de *ActionMailer:Base*, funcionan de manera similar a los controladores. Ambos tienen:
- Variables de instancia que son accesibles en los views
- La habilidad de usar layouts y partials
- La habilidad de acceder a parametros hash
- Acciones y vistas asociadas en *app/views*

**ActionPack:** Es un framework para el manejo de web requests. Provee mecanismos de ruteo, definición de controllers que implementan acciones y la generación de respuestas. En resumidas cuentas, ActionPack proveé la capa de controladores del paradigma MVC.

**ActionView:** ActionView proveé la V del MVC. Trabaja junto a ActionController, que es parte de ActionPack, para manejar las web requests. ActionController se encarga con la comunicación de la capa del modelo y con la devolución de datos. ActionView, por tanto, es responsable de renderizar el cuerpo de la respuesta a la web request usando la data provista por ActionController. Por default, los templates de AV se escriben usando Ruby Embebido (ERB), lo que permite usar código Ruby en documentos HTML. 

**ActiveJob:** Es un framework para declarar *jobs* y hacerlos correr en una variedad de backends encolados. Estos jobs pueden ser cualquier cosa que pueda ser separada en pequeñas unidades de trabajo y que puedan correr en paralelo. 

**ActiveModel:** ActiveModel incluye alguna de la funcionalidad que fue abstraida de ActiveRecord, por lo tanto, es complementario a este y lidia con problemas similares. ActiveModel es una librería que contiene módulos que pueden ser usados en objetos Ruby que requieren algunas funcionalidad similares a la de los modelos pero que no estan atados con ninguna tabla en la base de datos. Esto significa que ActiveModel puede ser usada independientemente de Active Record, ya que le proprociona funcionalidad a objetos no respaldados por la base de datos.

**ActiveRecord:** ActiveRecord es la M del MVC, los modelos, que es la capa del sistema responsable de representar la data y la lógica de negocios. ActiveRecord ayuda a crear y usar objetos Ruby cuyos atributos requieren persistencia. 
ActiveRecord tambíen es un patrón de arquitectura de software, por lo que la gema ActiveRecord es también la implementación de ese patrón en Rails. El patrón es descripto como "un objeto que envuelve una fila en una table de la base de datos, encapsula el acceso a la base y agrega lógica del dominio a esa data". Los objetos de AR llevan consigo tanto data como comportamiento.  
ActiveRecord es tambíen el Framework ORM de Rails. Esto es: ORM es una técnica que conecta los objetos del lenguaje de programación con las tablas de las bases de datos relacionales. Usando un ORM, los atributos de los objetos Ruby, así como sus relaciones, pueden ser facilmente mapeadas a un base de datos relacional, y manipularlos sin utilizar SQL. 
ActiveRecord nos permite:
- Representar modelos y sus datos 
- Representar asociaciones entre modelos
- Repesentar herencia 
- Validar modelos antes de que sean persistidos
- Realizar operaciones de base de datos en un estilo de objetos 

**ActiveSupport:** Le proveé al lenguaje extensiones y utilidades en distintos objetos, como String, Module, Datetimes, Hash, Arrays, etc.

**ActionCable:** Integra WebSockets a la aplicación Rails. Esto permite que las características en tiempo real puedan ser escritas en Ruby en el mismo estilo y forma que el resto de la aplicación, mientras sigue siendo performante y escalable. Proveé tanto un Framework de Javascript para el lado del cliente como un Framework de Ruby para el lado del servidor, y tenes acceso a todo el modelo. 
El WebSocker es un protocolo de comunicación distinto a HTTP. Proveé un canal de comunicación montado sobre TCP que es simultáneo y en dos direcciones. 

**ActiveStorage:** ActiveStorage facilita la subida de archivos a servicios de almacenamiento en la nube, y permite adjuntar esos archivos a objetos de ActiveRecord. 

**ActionText:** ActionText facilita el manejo y muestra de contenido de texto enriquecido. Texto enriquecido es texto que incluye elementos de formateo como negritas, itálicas, colores, hyperlinks, etc, proveyendo una visual enriquecida y una presentación más estructurada que el texto plano. 

**ActionMailbox:** Es el complemento del ActionMailer. Rutea los mailes entrantes a mailboxes que funcionan como controladores para el procesamiento dentro de la App Rails. ActionMailer, entonces, se encarga del recibimiento de mails. Los mailes entrantes se rutean de manera asíncrona usando *ActiveJob* a sus mailboxes correspondientes. Estos mails se cconvierten en registros de *InboundEmail* usando *ActiveRecord*, lo que los hace capaces de interactuar directamente con el resto del dominio. 

## 2. Investigá cómo se crea una aplicación Rails nueva y enumerá los pasos básicos para tener la aplicación funcionando con una base de datos SQLite.
Para crear una aplicación Rails es necesario tener instalada la gema Rails en el sistema. Eso se hace con el comando **gem install rails**. Esto nos da el comando global **rails**. A partir de ahí, para crear una nueva aplicación rails debo hacer **rails new nombre**: esto me creará toda la estructura necesaria de una aplicación rails y me dará una aplicación funcionando con todas las configuraciones por defecto, entre ellas, una base de datos SQLite.  
Sin embargo, puedo personalizar la creación del mi aplicación: si ejecuto el comando **rails new**, sin pasarle el nombre del repositorio, me devolverá una lista de todas las opciones que le puedo mandar para personalizar la creación de mi aplicación. Entre ellas, las más importantes son:  
  
**--database:** marco la base de datos que quiero integrar con mi aplicación. Por defecto SQLite.  
**--skip-parametro:** con skip y el nombre de la gema puedo indicarle que no integre determinada gema a mi aplicación, como puede ser ActionMailer, ActiveJob, Hotwire o JavaScript. Esto hará mi aplicación más liviana.  
**--javascript:** Configura la manera en que se van a resolver los modulos JavaScript. Por defecto es importmap.  
**--CSS**: configura el procesador de CSS. Tailwind, bootstrap, etc

## 3. Siguiendo los pasos que enumeraste en el punto anterior, creá una nueva aplicación Rails llamada practica_rails en la cual vas a realizar las pruebas para los ejercicios de esta práctica.

### 1. ¿Qué estructura de directorios y archivos se generó?

    Gemfile[.loc] 	Gemas del proyecto y lock
    README.md 	Documentación en markdown
    app/ 	Carpetas y archivos de la aplicación
    config/ 	Carpetas y archivos de configuración
    db/ 	Carpetas y archivos de la DB
    public/ 	Archivos sin código ruby para ser servidos por un web server
    Rakefile 	Directivas para rake. Tareas de gestión del proyecto
    bin/ 	Ejecutables del proyecto
    config.ru 	Configuración para Rack
    lib/ 	Directorio para código ruby variado
    log/ 	Logfiles del proyecto
    tmp/ 	Archivos temporales del proyecto
    vendor/ 	Librerías externas por fuera del Gemfile

El directorio **app/**. Si listamos el contenido del directorio, nos encontramos con varias carpetas que estarán presentes en todo proyecto rails:

    assets/
    channels/
    controllers/
    helpers/
    javascripts/
    jobs/
    mailers/
    models/
    views/

Aquí se hace evidente el patrón model view controller.  
La carpeta **mailers/** contempla código para el envío de mails.  
La carpeta **helpers/** contiene view helpers, que son pequeñas porciones de código reusable que generan HTML. Podríamos definirnos como macros que expanden un pequeño comando en strings más extensos de tags HTML y contenido.  
La carpeta **assets/** contiene estilos CSS y Javascripts que son procesados por assets pipeline, mientras que javascripts/ es utilizada por webpacker.  
La carpeta **channels/** contiene código de websockets.  
La carpeta **jobs/** contiene tareas asíncronas.  

### 2. Investigá (abrí y leé) los archivos de configuración que se generaron. ¿Qué información importante contienen?
**enviroments:** contiene la configuración de los distintos ambientes que se puede levantar la aplicación: development, production y test.  
**initializers:** contiene archivos para personalizar algunas comnfiguraciones que afectan a toda la aplicación al iniciarse. Entre estos estan la versión de los activos, la configuración de la politica de privacidad, un archivo para filtrar que información importante no se registre en los logs, y un archivo de reglas de inflección para setear en distintos idiomas.  
**locales:** contiene los yml para la configuración de la internacionalización.  
**aplication.rb** configuración general de la aplicación. Incluye el require de todas las gemas.  
**boot.rb** configuración para el booteo de la aplicación.  
**cable.yml** configuración para el manejo de tareas asincronas? o capaz también de WebSockets.  
**cache.yml** manejo de cache en los diferentes ambientes.  
**database.yml** configuración de la base de datos.  


### 3. Qué scripts encontrás en el directorio bin? ¿Para qué sirven?
### 4. ¿Qué gemas se incluyeron por defecto en el archivo Gemfile? Investigá para qué sirve cada una de ellas.

## 4. ¿Qué es un ambiente (environment) en una aplicación Rails? ¿Qué sentido considerás que tiene usar diferentes ambientes en tu aplicación? ¿Cuál es el ambiente por defecto?

Los ambientes permiten establecer distintas configuraciones para la aplicación, a fin de que esta se comporte distinto según en que ambiente la levantamos. El sentido es poder ver un distinto comportamiento según la tarea para la que estas usando la app: si estás desarrollando, quizás vas a buscar que la aplicación te devuelva más información respecto a debug, mientras que si estás en producción, lo que buscas en rendimiento y quizás más privacidad de la información. El ambiente por defecto es development, pero el ambiente se puede setear sobrescribiendo la variable de ambiente RAILS_ENV o pasandole por parámetro el ambiente cuando levantas la aplicación con el flag -e.  

## 5. Sobre la configuración de Rails:

### 1. ¿De qué forma podés especificar parámetros de configuración del framework en una app Rails?
Rails se maneja con la idea de *convention over configuration*, por lo que el espíritu del Framework es que uno no haga demasiada configuración. Aún así, uno debe poder especificar parámetros de configuración si desea cambiar algo de la configuración inicial de Rails. La manera correcta de especificiar estos parámetros es a través de variables de ambiente, que pueden accederse desde Ruby y son soportadas por todos los SO y por distintas plataformas de deployment. Las variables de ambiente brindan privacidad al proyecto. Para manejarlas pueden usarse gemas como *figaro* o *dotenv-rails*.

### 2. ¿Cuáles son los archivos de configuración principales? Intentá relacionar este concepto con los ambientes que antes viste.

### 3. Modificá el locale por defecto de tu aplicación para que sea español.
### 4. Modificá la zona horaria de tu aplicación para que sea la de la Argentina (GMT‑3).

## 6. Sobre los initializers:
Source: `https://www.writesoftwarewell.com/introduction-to-rails-initializers/`
### 1. ¿Qué son y para qué se utilizan?
Los initializers son culaquier archivo Ruby almacenado en la carpeta `config/initializers`. Se usan para configurar la aplicación o algunas gemas externas. 
### 2. ¿En qué momento de la vida de la aplicación se ejecutan?
Los initializers se ejecutan después de cargar el frameworks y las gemas externas que usa la aplicación. Rails se asegura que los initializers solo se ejecutan una vez en el inicio.
`Load framework -> Load Gems -> Load initializers`
### 3. Si tu app está corriendo y modificás algún initializer, ¿los cambios se reflejan automáticamente? ¿Por qué?
Debe reiniciarse el servidor, ya los initializers solo se cargan al inicio de la aplicación. Incluso en desarrollo es necesario detener el servidor y volverlo a arrancar, por que el mecanismo de autoloading no recarga los initializers.
### 4. Creá un initializer en tu aplicación que imprima en pantalla el string "Booting practica_rails :)". ¿En qué momento se visualiza este mensaje?
Se visualiza solo al ejecutar `bundle exec rails server`. Es decir, al levantar el servidor.

## 7. Sobre los generators:
### 1. ¿Qué son? ¿Qué beneficios imaginás que trae su uso?
Los generadores son herramientas de la línea de comandos que permiten la automatización del proceso de creación y edición de archivos de código repetitivo. Sirven por un lado para automatizar la escritura de código repetitivo, haciendo mucho más rápido el proceso; pero a la vez sirven para mantener un orden y un estándar en toda la aplicación Rails.
### 2. ¿Con qué comando podés consultar todos los generators disponibles en tu app Rails?
`bin/rails g o generate` me lista todos los generadores que me brinda Rails y todas las gemas instaladas. 
### 3. Utilizando el generator adecuado, creá un controlador llamado PoliteController que tenga una acción salute que responda con un saludo aleatorio de entre un arreglo de 5 diferentes, como por ejemplo “Good day sir/ma’am.”.
`rails generate controller PoliteController salute`
```
class PoliteController < ApplicationController
  def salute
    greetings = [
      "Good day, sir/ma'am.",
      "Hello! Hope you're having a wonderful day.",
      "Greetings! Wishing you the best.",
      "Hi there! Nice to see you.",
      "Salutations! May your day be great."
    ]
    @random_greeting = greetings.sample
  end
end
```

## 8. Sobre routing:
### 1. ¿Dónde se definen las rutas de la app Rails?
Las rutas de la app de rails de definen en el archivo `config/routes.rb`. Este archivo es donde se mapean las solicitudes HTTP entrantes a las acciones de los controladores correspondientes.
### 2. ¿De qué formas se pueden definir las rutas? Investigá la DSL para definición de rutas que Ruby on Rails provee.
DSL significa Domain Specific Language. Rails proveé varios DSL, entre ellos uno para el manejo de rutas. 
El router de Rails matchea las solicitudes HTTP entrantes con acciones especificas de un controlador en nuestra app basado en el PATH de la URL.  
Cuando la aplicación recibe una petición, le solicita al router que lo matchee con un controlador.  
Por ejemplo, si llega la solicitud `GET /users/17` y si la primera rutea que matchea es `get "/users/:id", to: "user#show"`, la solicitud es matcheada con la acción show de la clase UsersControllers con {id: 17} en el hash de parametros.  
### 3. ¿Qué ruta(s) agregó el generator que usaste en el último inciso del punto anterior?
Agrego la ruta `get "polite/salute"`, que es una ruta simple que matchea con la acción salute del PoliteController.
### 4. ¿Con qué comando podés consultar todas las rutas definidas en tu aplicación Rails?
**rails routes**
### 5. Modificá el mapeo de rutas de tu aplicación para que al acceder a / (root) se acceda al controlador definido antes (polite#salute).
`root "polite#salute"`