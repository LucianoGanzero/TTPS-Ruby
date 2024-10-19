# Extendé la clase Array con el método randomly que funcione de la siguiente manera:
# • Si recibe un bloque, debe invocar ese bloque con cada uno de los elementos del arreglo
# en orden aleatorio, sin repetir los elementos sobre los que se lo invoca.
# • Si no recibe un bloque, debe devolver un enumerador que va arrojando, de a uno, los ele‑
# mentos del arreglo en orden aleatorio

class Array
  def randomly
    shuffled = self.shuffle 
    if block_given?
      shuffled.map { |element| yield element } 
    else
      shuffled.to_enum 
    end
  end
end

puts [1,2,3,4,5].randomly {|x| x**2}