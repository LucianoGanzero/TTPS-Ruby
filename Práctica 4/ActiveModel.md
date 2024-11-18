# Active Model

## 24. ¿Qué son los validadores de AM? ¿Cuáles son los validadores básicos que provee esta librería?
Los validadores son mecanismos que se utilizan para verificar la validez de los atributos de un modelo antes de realizar operaciones como guardar o actualizar registros en la base de datos. Los validadores garantizan que los datos que se ingresan en el modelo cumplan con ciertos requisitos o restricciones.  
**Validadores básicos:**  
- presence: Valida que el atributo no esté vacío
- lenght: Valida la longitud de un atributo (como una cadena o texto). Puedes especificar un rango de longitud o un valor exacto.
- numericality: Valida que el atributo sea un número. También permite comprobar si el valor es un número entero o un número decimal.
- uniqueness: Valida que el atributo tenga un valor único en la base de datos. Esto ayuda a evitar duplicados.
- format: Valida que el atributo cumpla con una expresión regular
- inclusion: Valida que el valor de un atributo esté dentro de un conjunto de valores especificados.
- exclusion: Valida que el valor del atributo no esté incluido en un conjunto de valores especificados.
- acceptance: Valida que el atributo tenga un valor de "aceptación", generalmente utilizado para validar campos como "acepto los términos y condiciones".
- validates_associated: Valida que los modelos asociados sean válidos. Esto es útil si tienes asociaciones has_many, belongs_to, etc., y quieres asegurarte de que el objeto asociado sea válido antes de guardar el objeto principal.
- confirmation: Valida que el valor de un atributo sea igual a otro atributo que se especifique (por ejemplo, para validar que el campo de "confirmación de contraseña" sea igual al campo de "contraseña").


## 25. Agregá a los modelos Office y Employee las validaciones necesarias para hacer que sus atributos cumplan las restricciones definidas para las columnas de la tabla que cada uno representa.

## 26. Validadores personalizados:
### 1. ¿Cómo podés definir uno para tus modelos AR?
Para definir un validador personalizado en ActiveRecord, puedes crear un método dentro del modelo y luego usar el método validate para llamar a esa validación. Este método personalizado puede agregar un error a los atributos si no cumple con la regla que definiste.
### 2. Implementá un validador que chequee que un string sea un número telefónico con un formato válido para la Argentina.

### 3. Agregá el validador que definiste en el punto anterior a tu modelo Office para validar el campo phone_number.