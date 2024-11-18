# Action Pack

### 32. ¿Qué son los callbacks de controladores de AP? ¿Para qué los utilizarías?
En Rails, los callbacks para controladores son métodos que se ejecutan automáticamente en ciertas etapas del ciclo de vida de las solicitudes HTTP. Los más comunes en los controladores son los before_action, after_action y around_action, que permiten ejecutar código antes, después o alrededor de la ejecución de una acción específica del controlador.
Los callbacks en los controladores de Rails son útiles en varias situaciones:

**Reutilización de código:** Los callbacks permiten que un conjunto de acciones (por ejemplo, la carga de un objeto, la validación de permisos, etc.) se ejecute automáticamente antes o después de ciertas acciones sin tener que repetir el mismo código en cada acción.

**Organización del código**: Mantienen el código de los controladores limpio y organizado, moviendo la lógica repetitiva fuera de las acciones individuales y agrupándola en métodos separados que se ejecutan en momentos específicos.

**Autenticación y autorización**: Un uso común de los before_action es para autenticar o autorizar usuarios antes de ejecutar una acción, asegurando que solo los usuarios permitidos puedan acceder a ciertas rutas.

**Cargar recursos antes de una acción**: Puedes cargar datos o realizar cálculos necesarios antes de ejecutar una acción, como cargar un objeto de la base de datos antes de que una acción de visualización o edición sea ejecutada.

**Auditoría y logging:** Los after_action y around_action se pueden utilizar para registrar información sobre cómo se procesaron las acciones, como el tiempo de ejecución o detalles de la solicitud, lo que es útil para auditar el comportamiento de la aplicación.

**Modificar la respuesta**: Con after_action o around_action, puedes manipular la respuesta después de que una acción haya sido ejecutada, como redirigir a otra página o modificar el contenido de la respuesta.
### 33. Tomando como base la lógica que implementaste en PoliteController para permitir que se especifique el locale a utilizar en la petición, refactorizá eso para que sea un callback de ese controlador.
### 34. Refactorizá nuevamente el callback para que el mismo se ejecute también en el resto de los controladores de tu aplicación (los scaffold controllers en este caso), sin repetir el código en cada controlador. ¿Cómo hiciste eso?