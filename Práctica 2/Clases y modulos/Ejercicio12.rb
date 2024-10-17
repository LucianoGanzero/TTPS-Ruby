# Modificá la implementación del ejercicio anterior para que GenericFactory sea un módulo
# que se incluya como Mixin en las subclases que implementaste. ¿Qué modificaciones tuviste
# que hacer en tus clases?

#Tuve que incluirlo con extend, porque create es un método de clase, asi como tambíen initialize. Entonces, lo unico que tuve que cambiar es que en lugar de heredar de GenericFactory
# la extiendan. A su vez, en generic factory cambié el método create, que en lugar de self, es solo create, porque despues lo extiendo.

module GenericFactory
  def create(**args)
    new(**args)
  end
  def initialize(**args)
    raise NotImplementedError
  end
end

class Auto
  extend GenericFactory
  attr_reader :color, :marca

  def initialize(color:, marca:)
    @color = color
    @marca = marca
  end

  def informacion
    puts "Es un #{self.marca} de color #{self.color}"
  end
  
end


class Libro
  extend GenericFactory
  attr_reader :autor, :editorial, :anio

  def initialize(autor:, editorial:, anio:)
    @autor = autor
    @editorial = editorial
    @anio = anio
  end

  def informacion
    puts "El libro fue escrito por #{self.autor} en el año #{self.anio}. La edición es de #{self.editorial}"
  end
  
end

autito = Auto.create(marca:"Chevrolet", color:"Gris")
autito.informacion

librito = Libro.create(autor: "Carlos Busqued", anio:"2014", editorial: "Planeta")
librito.informacion