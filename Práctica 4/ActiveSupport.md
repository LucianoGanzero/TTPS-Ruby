# Active Support

## 9. ¿De qué forma extiende AS las clases básicas de Ruby para incorporar nuevos métodos?
Puede hacerlo de distintas maneras. Entre ellas, haciendo **monkey patching**, es decir, abriendo las clases nativas de Ruby y agregando o redefiniendo métodos. Tambíen hace uso de **módulos y mixins** 

## 10. Investigá qué métodos agrega AS a las siguientes clases:
### 1. String
- **html_safe**
- **html_safe?**
- **remove:** Quita todas las ocurrencias del patrón pasado por parámetro
- **squish:** Quita los espacios en blanco del principio y del final, y substituye varios espacios en blanco por uno solo. Tambíen quita saltos de linea o página.
- **truncate:** Retorna una copia del receptor truncado hasta el largo pasado por parámetro.
- **truncate_bytes**
- **truncate_words**
- **inquiry:** Convierte al string en un objeto stringInquiry, haciendo que los chequeos de igualdad sean mas lindos.
- **starts_with and ends_with**
- **strips_heredoc:** corta la indentación en heredocs. 
- **indent:** indenta las lineas en el receptor, se le puede pasar un indent_string para aclarar que string indentarle.
- **Access:**
    - **at** Devuelve el caracter del string en la posición que se le pasa
    - **from** Devuelve el substring del string comenzando de la posición que se le pasa
    - **to** Devuelve el substring del string hasta la posición que se le pasa
    - **first**
    - **last**
- **Inflections**
    - **pluralize** Retorna el plural
    - **singularize** inverso a pluralize
    - **camelize** Retorna al receptor en CamelCase
    - **underscore** De CamelCase a paths
    - **titelizes** Capitaliza las palabras del receptor
    - **dasherize** Reemplaza guiones bajos con guiones
    - **demodulize**
    - **deconstantize**
    - **parametrize** Normaliza el receptor para ser usado en pretty URLs
    - **tableize** Underscore y luego pluralize
    - **classify** inverso a tableize
    - **humanize** Manipula los nombres los atriubtos para mostrarlos mas amenos
    - **upcase_first**
    - **downcase_first**
- **Conversions**
    - **to_date**
    - **to_time**
    - **to_datetime**
### 2. Array
- **Accessing**
    - **to:** subarray hasta el índice pasado por parametro
    - **from** subarray desde el índice pasado por parámetro
    - **including:** Devuelve un nuevo arreglo que incluye lo pasado por parámetro.
    - **excluding:** Devuelve un nuevo arreglo que excluye lo pasado por parámetro
    - **second, third, fourth, fifth, second_to_last, third_to_last**
- **Extracting**
    - **extract!:** Extrae y devuelve los elementos para los que el bloque devuelve verdadero.
- **Conversions**
    - **to_sentence:** Transforma el array en un string que contiene una oración que enumera los items.
    - **to_fs:** actua como to_s
    - **to_xml**
- **Wrapping**
    - **wrapp:** Envuelve el argumento en un arreglo, a menos que ya sea un arreglo.
- **Grouping**
    - **in_groups_of:** Parte el arreglo en grupos consecutivos de cierto tamaño y devuelve el arreglo.
### 3. Hash
### 4. Date
- **current:** hoy en el actual timezone
- **Named dates**
    - **beginning_of_week**
    - **end_of_week**
    - **monday**
    - **sunday**
    - **prev_week** Recibe un symbol con el dia de la semana en ingles y devuelve la fecha
    - **next_week**
    - **beginning_of_month**
    - **end_of_month**
- **years/months/weeks/days_ago**
- **years_since**
- **change**: permite pasarle por parametro que parte cambiar de la fecha receptora.
- **Duration:** Los objetos de tipo Duration pueden ser sumados y restados a los Dates
### 5. Numeric
- **Bytes:** Los números responden a **bytes**, **kilobytes**, etc, retornando la correspondiente cantidad de bytes.
- **Time:** Los numeros responden a los siguientes métodos, y permiten declaraciones y calculos. Los valores devueltos tambíen pueden ser sumados o restados a objetos Time
    - **seconds**
    - **minutes**
    - **hours**
    - **days**
    - **weeks**
    - **forthnights**
    A estos métodos se los puede combinar con
    - **from_now**
    - **ago**
- **Formatting:** to_fs() permite formatear los números de varias maneras.
    - **:phone**
    - **:currency**
    - **:percentage**
    - **:delimited**
    - **:rounded**
    - **:human_size** human-readeble number of bytes
    - **:human**

## 11. ¿Qué hacen y en qué clase define AS los siguientes métodos?
- **blank?:** En todos los objetos. Pregunta si el objeto es blank, los siguientes valores se consideran blank: nil, false, strings compuestos solos de espacios vacios, arreglos o hashes vacios y cualquier otro objeto que responde a empty? y esta empty
- **present?** En todos los objetos. Opuesto a blank?
- **presence** En todos los objetos. Devuelve el receptor si esta presente, sino devuelve nil.
- **try:** En todos los objetos. Try intenta mandar un mensaje a un objeto. Esto permite enviarlo aunque sea nil, en cuyo caso devuelve nil 
- **in?:** Todos los objetos. Testea si un objeto esta incluido en otro. Levanta ArgumentError si el argumento no responde a include?
- **alias_method_chain**
- **delegate:** Modulos o métodos. Delega la respuesta de un método. Hay que indicarle a quién lo delega. 
- **pluralize:** String. Devuelve el plural
- **singularize:** String. Devuelve el singular.
- **camelize:** String. Lo devuelve en CamelCase.
- **underscore:** String. Transforma CamelCase en paths-
- **classify** String. Devuelve el nombre de la clase que se corresponde a una tabla.
- **constantize:** String. Devuelve la referencia constante en el receptor. Levanta NameError si no existe.
- **safe_constantize:** 
- **humanize:** String. Debuelve el nombre de un atributo adaptado para la lectura humana.
- **sum**
- **with_indifferent_access:** Hash.

## 12. ¿De qué manera se le puede enseñar a AS cómo pasar de singular a plural (o viceversa) los sustantivos que usamos en nuestro código?
En `/config/initializers/inflections.rb` pueden definirse las inflecciones para los lenguajes que quieras implementar. Se pueden definir las reglas para pluralizar y singularizar, como manejar irregulares o incluso aquellas palabras que no tienen pular/singular.

## 13. Modificá la configuración de la aplicación Rails para que aprenda a pluralizar correctamente en español todas las palabras que terminen en l, n y r
```
ActiveSupport::Inflector.inflections(:es) do |inflect|
  # Regla para pluralizar palabras que terminan en "l"
  inflect.plural(/l$/i, 'les')
  inflect.singular(/les$/i, 'l')

  # Regla para pluralizar palabras que terminan en "n"
  inflect.plural(/n$/i, 'nes')
  inflect.singular(/nes$/i, 'n')

  # Regla para pluralizar palabras que terminan en "r"
  inflect.plural(/r$/i, 'res')
  inflect.singular(/res$/i, 'r')
end
```