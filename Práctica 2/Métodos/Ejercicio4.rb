# Escribí un método que dado un número variable de parámetros que pueden ser de cualquier
# tipo, imprima en pantalla la cantidad de caracteres que tiene su representación como String
# y la representación que se utilizó para contarla.


def longitud *argumentos
  argumentos.each do |x|
    puts "\"#{x.to_s}\" --> #{x.to_s.length}"
  end
end

longitud(9, Time.now, 'Hola', {un: 'hash'}, :ruby)