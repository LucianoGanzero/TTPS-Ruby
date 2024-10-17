# Clase 7 - 14/10 #

## Active Record ## 

**created_at** y **updated_at** se maneja automaticamente con solo crearlo  
**lock version** agrega optimistic locking al modelo
**type** especifica que el modelo utiliza Single Table Inheritance
**(table_name_plural)_count** Mantiene el número de registros que pertenecen a una asociación.

## CRUD ##
### Creación ###
Los objetos de Active Record pueden crearse desde
- Un Hash
- Un bloque
- Setear manualmente los atributos luego de la creación
New retornará un objeto nuevo, mientras que **create** retornará un objeto y lo guardará.

### Update ###

### Validaciones ###
Create, save y update usan validaciones. Retornan false cuando la validación falla.  
Si uso los métodos con bang!, en lugar de retornar false levantan una excepción. **ActiveRecord::RecordInvalid**

### Callback ###
Permite adódigo a ciertos eventos en el ciclo de vida de los modelos.
