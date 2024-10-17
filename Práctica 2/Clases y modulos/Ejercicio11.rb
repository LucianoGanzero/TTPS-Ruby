# Dada la siguiente clase abstracta GenericFactory, implementá subclases de la misma que
# permitan la creación de instancias de dichas clases mediante el uso del método de clase .
# create, de manera tal que luego puedas usar esa lógica para instanciar objetos sin invocar
# directamente el constructor new.

class GenericFactory
  def self.create(**args)
    new(**args)
  end
  def initialize(**args)
    raise NotImplementedError
  end
end

class Auto < GenericFactory
  attr_reader :color, :marca

  def initialize(color:, marca:)
    @color = color
    @marca = marca
  end

  def informacion
    puts "Es un #{self.marca} de color #{self.color}"
  end
  
end


class Libro < GenericFactory
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