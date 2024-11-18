# Active Record

## 14. ¿Cómo se define un modelo con ActiveRecord? ¿Qué requisitos tienen que cumplir las clases para utilizar la lógica de abstracción del acceso a la base de datos que esta librería ofrece?

Un modelo en Active Record es una clase que tiene la intención de ser persistida en una base de datos. Para poder utilizar la lógica de AR, los modelos deben heredar de una clase base provista por la libreria. Esta herencia proporciona al modelo todos los métodos y funcionalidades necesarios para interactuar con la base de datos.

## 15. ¿De qué forma sabe ActiveRecord qué campos tiene un modelo?
Active Record mapea automáticamente entre tablas y clases, atributos y columnas. Por tanto, cuando lee la estructura de la tabla en la base de datos obtiene su esquema, lo que incluye los nombres y tipos de columnas, que mapea con el modelo y sus atributos. Inmediatamente define accessors para cada campo.

## 16. ¿Qué metodos (getters y setters) genera AR para los campos escalares básicos (integer,string, text, boolean, float)?
Active Record genera métodos de acceso para todos los campos escalares básicos. Así se podrá obtener el contenido del campo con el nombre del atributo, y se podrá setear con el nombre=.

## 17. ¿Qué convención define AR para inferir los nombres de las tablas a partir de las clases Ruby? Citá ejemplos.
La convención es que los nombres de las clases se pluralizan para mapear con las tablas. Además, cuando se utiliza más de una palabra las clases utilizan CamelCase, mientras que las tablas usan snake_case.

## 18. Sobre las migraciones de AR:
### 1. ¿Qué son y para qué sirven?
Las migraciones son una DSL (domain specific language) para el manejo de esquemas de bases de datos. Son una implementacion de **schema migrations**, esto es, el manejo versionado, controlado, incremental y reversible de cambios en los esquemas de bases de datos relacionados. Las migraciones se almacenan en archivos, que son ejecutados contra una base de datos usando **rake**.
### 2. ¿Cómo se generan?
Se pueden generar con el comando **rake** o también se pueden generar usando **generators**
### 3. ¿Dónde se guardan en el proyecto?
Se guardan en **db/migrate**
### 4. ¿Qué formato/organización tienen sus nombres de archivo? ¿Por qué considerás que es necesario respetar ese formato?
El nombre de los archivos se compone de un timestamp con la fecha en que fue generada seguida del nombre de la migración. Es necesario mantener el formato para poder respetar el orden de ejecución: las migraciones se ejecutan en orden cronológico basado en las marcas de tiempo. Este formato también permite el versionado y el deshacer cambios, ya que es posbile saber que migraciones se han aplicado.
### 5. Generá una migración que cree la tabla offices con los siguientes atributos:
- name: string de 255 caracteres, no puede ser nulo.
- phone_number: string de 30 caracteres, no puede ser nulo y debe ser único.
- address: text.
- available: boolean, por defecto true, no puede ser nulo.

`rails generate migration CreateOffices` => Genera el archivo con la migración. 
```
class CreateOffices < ActiveRecord::Migration[8.0]
  def change
    create_table :offices do |t|
      t.string :name, limit: 255, null: false
      t.string :phone_number, limit: 30, null: false, unique: true
      t.text :address
      t.boolean :available, null: false, default: true
      t.timestamps
    end
    add_index :offices, :phone_number, unique: true
  end
end
```
Modifico el archivo para agregarle los campos.
`rails db:migrate` => Aplica la migración.

## 19. Creá el modelo Office para la tabla offices que creaste antes, e implementá en éste el método de instancia to_s.
`rails generate model Office name:string phone_number:string address:text available:boolean --skip`
Tengo que poner --skip porque la migración ya la cree anteriormente, sino, el generador de modelo también te genera la migración.

## 20. Utilizando migraciones, creá la tabla y el modelo para la clase Employee, con la siguiente estructura:
- name: string de 150 caracteres, no puede ser nulo.
- e_number: integer, no puede ser nulo, debe ser único.
- office_id: integer, foreign key hacia offices

`rails generate model Employee name:string e_number:integer office_id:integer`
Este comando me genera el modelo y la migración. Tengo que modificar la migración para agregar las restricciones de null, de limites y de foreign key.

## 21. Agregá una asociación entre Employee y Office acorde a la columna office_id que posee la tabla employees.
### 1. ¿Qué tipo de asociación declaraste en la clase Employee?
La clase Employee tiene una asociación belongs_to :offices. Esto quiere decir que un empleado pertenece a una oficina. Office_id es una clave foranea en la tabla employees que hace referencia a la tabla offices.
### 2. ¿Y en la clase Office?
En la clase Office hay una asocación has_many :employeees. Lo que significa que cada oficina puede tener muchos empleados.
### 3. ¿Qué métodos generó AR en el modelo a partir de esto?
Esto genera el método office en la clase Employees y el método employees en la clase Office.

## 22. Sobre scopes:
### 1. ¿Qué son los scopes de AR? ¿Para qué los utilizarías?
Los scopes son querys personalizadas que se definen en el modelo de Rails. Toman dos argumentos: un nombre y un lambda, que se utiliza para implementar la query. Son una forma de definir consultas complejas de forma limpia, reutilizable y con un enfoque orientado a objetos.
### 2. Investigá qué diferencia principal existe entre un método de clase y un scope, cuando se los utiliza para realizar la misma tarea.
Se puede hacer lo mismo que hace un scope con un método de clase. La diferencia principal radica en que los scopes generan un código más limpio y simple; a la vez que los scopes son usados solo para una cosa, por lo que es más claro al momento de ver un scope que ver un método de clase. En términos de funcionalidad, la diferencia es que los scopes garantizan un ActiveRecord::Relation, mientras que los métodos de clase no. Esto puede ayudar a evitar errores cuando los scope no devuelven nada, y facilitar el encadenamiento.
### 3. Agregá los siguientes scopes al modelo Employee:
- vacant: Filtra los empleados para quedarse únicamente con aquellos que no tenganuna oficina asignada (o asociada).
- occupied: Complemento del anterior, devuelve los empleados que sí tengan una oficina asignada.
### 4. Agregá este scope al modelo Office:
- empty: Devuelve las oficinas que están disponibles (available == true) que no tienen empleados asignados.

## 23. Sobre scaffold controllers:
### 1. ¿Qué son? Al generarlos, ¿qué operaciones implementan sobre un modelo? ¿Pueden extenderse o modificarse?
Scaffolding es una técnica de generación de código que crea un conjunto de archivos y templates de código siguiendo una serie de reglas. Rails crea un conjunto completo de vistas, controladores, rutas y pruebas para realizar operaciones CRUD 
Generan los siguientes métodos.
- index: Muestra una lista de registros del modelo.
- show: Muestra los detalles de un único registro.
- new: Muestra un formulario para crear un nuevo registro.
- create: Maneja la creación de un nuevo registro en la base de datos.
- edit: Muestra un formulario para editar un registro existente.
- update: Maneja la actualización de un registro.
- destroy: Maneja la eliminación de un registro.
Se pueden extender o modificar. Rails genera un código básico que se puede personalizar.
### 2. ¿Con qué comando se generan?
Se crean con `rails generate scaffold` seguido del nombre del modelo y de los atributos.
### 3. Utilizando el generator que indicaste en el inciso anterior, generá un controlador de scaffold para el modelo Office y otro para el modelo Employee.
`rails generate scaffold Office name:string phone_number:string address:text available:boolean --skip-collision-check --skip`  
`rails generate scaffold Employee name:string e_number:integer office_id:integer`  
Tuve que agregar los parámetros --skip-collision-check y --skip porque scaffolding también crea los modelos y las migraciones, y yo ya los tenia creados.
### 4. ¿Qué rutas agregó este generator?
Agrego las rutas
```
resources :employees
resources :offices
```

Esto crea rutas como:
- GET /offices para la lista de oficinas (index).
- GET /offices/:id para ver los detalles de una oficina (show).
- GET /offices/new para crear una nueva oficina (new).
- POST /offices para crear la oficina en la base de datos (create).
- GET /offices/:id/edit para editar una oficina existente (edit).
- PATCH/PUT /offices/:id para actualizar una oficina (update).
- DELETE /offices/:id para eliminar una oficina (destroy).
Lo mismo genera para empleados.
### 5. Analizá el código que se generó para los controladores y para las vistas, y luego modificalo para que no permita el borrado de ninguno de los elementos. Enumerá los cambios que debiste hacer para que:
- Las vistas no muestren la opción de borrar.  
En **app/views/offices/show.html.erb** y su equivalente de employees, hay que eliminar o comentar la linea `<%# button_to "Destroy this office", @office, method: :delete #%>`  
- Los controladores no tenga la acción destroy.  
En los controladores, eliminar o comentar el método **destroy**. Tambien hay que eliminar destroy del `:before_action`.
- Las rutas de borrado dejen de existir en la aplicación.  
En **routes.rb**, agregar al resources de cada elemento la linea `, except: [:destroy]`
### 6. Modificá la vista de detalle (show) de una oficina para que, además de la información de la misma que ya presenta, muestre un listado con los empleados que tenga asociados en el cual cada nombre de empleado sea un link a su vista de detalle (employees#show).
