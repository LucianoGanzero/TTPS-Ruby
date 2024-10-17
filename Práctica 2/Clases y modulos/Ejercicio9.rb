# 9. Implementá el módulo Reverso para utilizar como Mixin e incluilo en alguna clase para probar‑
# lo. Reverso debe contener los siguientes métodos:
#1. di_tcejbo: Imprime el object_id del receptor en espejo (en orden inverso).
#2. ssalc: Imprime el nombre de la clase del receptor en espejo.

module Reverso
  def di_tcejbo 
    "#{self.object_id}".reverse
  end

  def ssalc
    "#{self.class.name.reverse}"
  end

end

class Array; include Reverso; end

mi_arregle = [1,2,3,4]

p mi_arregle.di_tcejbo
p mi_arregle.ssalc
puts [].di_tcejbo