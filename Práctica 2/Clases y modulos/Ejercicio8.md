8. ¿Qué diferencia hay entre el uso de include y extend a la hora de incorporar un módulo en
una clase?  
La diferencia está en la forma en que el módulo y sus métodos son incorporados a la clase. Con include los métodos del módulo se agregan como métodos **de instancia**, es decir, 
las instancias de esa clase tendrán disponibles todos los métodos declarados en el módulo. En cambio, con exclude, los métodos se incorporan como métodos **de clase**; extend
modifica el Singleton de la clase extendida.   
1. Si quisieras usar un módulo para agregar métodos de instancia a una clase, ¿qué forma
usarías a la hora de incorporar el módulo a la clase?
Utilizaría **include**
2. Si en cambio quisieras usar un módulo para agregar métodos de clase, ¿qué forma usarías
en ese caso?
Utilizaría **extend**