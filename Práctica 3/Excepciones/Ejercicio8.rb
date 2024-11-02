# 8. Partiendo del script que modificaste en el inciso anterior, implementá una nueva clase de ex‑
# cepción que se utilice para indicar que la entrada del usuario no es un valor numérico entero
# válido. ¿De qué clase de la jerarquía de Exception heredaría?

class InvalidIntegerError < ArgumentError
  def initialize(msg = 'La entrada no es un número entero válido')
    super(msg)
  end
end

# Este script lee una secuencia de no menos de 15 números desde teclado y luego imprime el resultado de la división # de cada número por su entero inmediato anterior.
# Como primer paso se pide al usuario que indique la cantidad de números que ingresará.
cantidad = 0
while cantidad < 15
  begin
    puts 'Cuál es la cantidad de números que ingresará? Debe ser al menos 15'
    cantidad = Integer(gets)
  rescue ArgumentError
    begin
      raise InvalidIntegerError
    rescue InvalidIntegerError => e
      puts e.message
    end
    retry
  end
end
# Luego se almacenan los números
numeros = 1.upto(cantidad).map do
  begin
    puts 'Ingrese un número'
    Integer(gets)
  rescue ArgumentError
    begin
      raise InvalidIntegerError
    rescue InvalidIntegerError => e
      puts e.message
    end
    retry
  end
end

# Y finalmente se imprime cada número dividido por su número entero inmediato anterior
resultado = numeros.map { |x| x / (x - 1) rescue 0}
puts 'El resultado es: %s' % resultado.join(', ')