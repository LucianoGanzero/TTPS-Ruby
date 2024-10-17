class Rol
  def puede_ver? documento
    false
  end
  def puede_borrar? documento
    false
  end
  def puede_modificar? documento, usuario
    false
  end
end

class Lector < Rol
  attr_reader :nombre
  def initialize
    @nombre = "Lector"
  end

  def puede_ver? documento
    if documento.publico then true else false
    end
  end
end


class Director < Rol
  attr_reader :nombre
  def initialize
    @nombre = "Director"
  end

  def puede_modificar? documento, usuario
    if !documento.borrado then true else false
    end
  end

  def puede_ver? documento
    if !documento.borrado then true else false
    end
  end
end

class Redactor < Lector
  attr_reader :nombre
  def initialize
    @nombre = "Redactor"
  end
  def puede_modificar documento, usuario
    if documento.usuario==usuario then true else false end
  end
end

class Administrador < Director
  attr_reader :nombre
  def initialize
    @nombre = "Administrador"
  end
  def puede_borrar? documento
    true
  end
  
end


class UsuarioFinal
  attr_reader :nombre, :clave, :email, :rol

  def initialize(nombre, clave, email, rol)
    @nombre = nombre
    @clave = clave
    @email = email
    @rol = rol
  end
  def puede_borrar? documento
    rol.puede_borrar? documento, self
  end
  def puede_modificar? documento
    rol.puede_modificar? documento, self
  end
  def puede_borrar? documento
    rol.puede_borrar? documento,self
  end

  def to_s
    "#{email} (#{rol.nombre})"
  end
end

usuarito = UsuarioFinal.new("Luciano", "1234", "lucianoganzero94@gmail.com", Administrador.new())

puts usuarito.to_s
