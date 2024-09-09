# 1. Investigá y probá en un intérprete de Ruby (irb, por ejemplo) cómo crear objetos de los siguien‑
# tes tipos básicos, tanto mediante el uso de literales como utilizando el constructor new (cuando
# sea posible):
puts "EJERCICIO 1"
#Symbols
puts :my_simbol
puts "El simbolo #{:my_simbol} es un #{:my_simbol.class} con object_id #{:my_simbol.object_id}"


#Strings
hola = "soy un string"
files = <<-EOS
Yo tambien soy un string
pero ordenado y declarado distinto.
Como texto de mas de una linea
EOS
puts "La variable hola es un #{hola.class} que dice #{hola}"
puts "La variable files es un #{files.class} que dice #{files}"

#Arrays
arreglo_uno = [1, 2, 3, 4]
arreglo_dos = Array.new
arreglo_dos << 56

puts "La variable arreglo_uno es un #{arreglo_uno.class} que dice #{arreglo_uno}"
puts "La variable arreglo_dos es un #{arreglo_dos.class} que dice #{arreglo_dos}"

#Hash
hash_uno = {uno: "uno", dos: "dos" }
hash_dos = Hash.new
hash_dos[:tres] = "tres"
puts "La variable hash_uno es un #{hash_uno.class} que dice #{hash_uno}"
puts "La variable hash_dos es un #{hash_dos.class} que dice #{hash_dos}"

#2. ¿De qué forma(s) se puede convertir un objeto (cualquiera fuere su tipo o clase) en String?
puts "\n\n"
puts "EJERCICIO 2"

puts "Los objetos de cualquier tipo se pueden transformar en string con el metodo to_s"
puts "Arreglo_dos es un #{arreglo_dos.class} pero con to_s #{arreglo_dos.to_s} se transforma en un #{arreglo_dos.to_s.class}"

#3. ¿De qué forma(s) se puede convertir un objeto String en un símbolo?
puts "\n\n"
puts "EJERCICIO 3"
puts "Para trasformar un String a simbolo debo usar el metodo to_sym"
puts "Hola es un #{hola.class} pero puedo transformalo a '#{hola.to_sym}' que es un #{hola.to_sym.class}"

#4. Qué devuelve la siguiente comparación? ¿Por qué?
puts "\n\n"
puts "EJERCICIO 4"
puts "'TTPS Ruby'.object_id == 'TTPS Ruby'.object_id"
puts "Esa comparacion devuelve false porque cada string se aloca en una dirección de memoria distinta, son distintos strings"
puts "En cambio si fuese un symbol daría true, porque el symbol es siempre el mismo"
puts "'TTPS Ruby'.object_id == 'TTPS Ruby'.object_id => #{'TTPS Ruby'.object_id == 'TTPS Ruby'.object_id}"