14) Analizá el siguiente script e indicá:

```ruby
VALUE = 'global'

module A
  VALUE = 'A'

  class B
    VALUE = 'B'

    def self.value
      VALUE
    end

    def value
      'iB'
    end
  end

  def self.value
    VALUE
  end
end

class C
  class D
    VALUE = 'D'

    def self.value
      VALUE
    end
  end

  module E
    def self.value
      VALUE
    end
  end

  def self.value
    VALUE
  end
end

class F < C
  VALUE = 'F'
end
```

1. ¿Qué imprimen cada una de las siguientes sentencias? ¿De dónde está obteniendo el valor?  
    1. `puts A.value`  Imprime A. Llama al modulo A e imprime su valor
    2. `puts A::B.value`  Imprime B. Llama a value como método de la clase B, y eso imprime lo que está en VALUE, que es B
    3. `puts C::D.value`  Imprime D. Llama a value como método de la clase D, y eso imprime lo que está en VALUE, que es D
    4. `puts C::E.value`  Imprime global. Llama al módulo E dentro de la clase C, pero VALUE, que lo que llame el modulo E cuando se le dice value, no esta definida ni en E ni en C
    5. `puts F.value`  Imprime global. F no tiene definido value, por lo que va a buscarlo a la superclase C, que si esta definido, y devuelve VALUE. Como VALUE no esta definido en el lugar donde se esta llamando, es decir en la superclase C, devuelve el valor global. **PREGUNTAR**

    
2. ¿Qué pasaría si ejecutases las siguientes sentencias? ¿Por qué?
    1. `puts A::value` Imprime A. Va a buscar el valor de value dentro de A, que es un metodo que devuelve VALUE, que es A
    2. `puts A.new.value` A es un modulo, por lo que no tiene definido el metodo new.
    3. `puts B.value` B no existe en el alcance del programa general, B solo existe dentro del módulo A, por lo que esa ejecución devuelve uninitialized constant B
    4. `puts C::D.value` Imprime D.
    5. `puts C.value` Imprime global
    6. `puts F.superclass.value` Imprime global