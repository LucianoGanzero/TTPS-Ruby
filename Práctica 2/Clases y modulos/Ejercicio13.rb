# Extendé las clases TrueClass y FalseClass para que ambas respondan al método de instan‑
# cia opposite, el cual en cada caso debe retornar el valor opuesto al que recibe la invocación
# al método.

module Opuesto
  def opposite
    not self
  end
end

class TrueClass; include Opuesto; end
class FalseClass; include Opuesto; end

puts false.opposite.opposite
puts true.opposite