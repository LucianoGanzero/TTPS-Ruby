# . Dada una cadena cualquiera, y utilizando los métodos que provee la clase String, realizá las
# siguientes operaciones sobre dicha cadena, implementando métodos que funcionen de la si‑
# guiente forma:
# • string_reverso: retorna el string con los caracteres en orden inverso.
# • string_sin_espacio: elimina los espacios en blanco que contenga.
# • string_a_arreglo_ascii: retorna un arreglo con cada uno de los caracteres converti‑
# dos a su correspondiente valor ASCII.
# • string_remplaza_vocal: cambia las vocales por números:
# – "a" o "A" por "4",
# – "e" o "E" por "3",
# – "i" o "I" por "1",
# – "o" u "O" por "0",
# – y "u" o "U" por "6".

def string_remplaza_vocal frase
    frase.gsub(/[aeiouAEIOU]/, 'a' => '4', 'A' => '4',
                              'e' => '3', 'E' => '3',
                              'i' => '1', 'I' => '1',
                              'o' => '0', 'O' => '0',
                              'u' => '6', 'U' => '6')
end


frase = "La cursada de TTPS de Ruby"
puts "La frase es #{frase}"
puts "La frase al reverso es #{frase.reverse}"
puts "La frase sin espacios es #{frase.gsub(" ", "")}"
caracteres = frase.chars.map {|car| car.ord}
puts "La frase a arreglo de valores asciis es #{caracteres}"
puts "La frase con las vocales reemplazadas es #{string_remplaza_vocal frase}"

# 10. ¿Cuál es el valor de retorno del siguiente código?
# Es un arreglo con el string "TTPS Ruby" en mayuscula, minuscula, con la primera letra mayuscula y con las mayusculas y minusculas cambiadas
hola = [:upcase, :downcase, :capitalize, :swapcase].map do |meth|
    "TTPS Ruby".send(meth)
    end

puts hola

# 11. Tomando el ejercicio anterior como referencia, ¿en qué situaciones usarías los métodos send
# y public_send definidos en la clase Object? ¿Cuál es la principal diferencia entre esos dos
# métodos?

#Ambos metodos sirven para mandarle el mensaje pasado como parametro al objeto desde donde el cual se llama.
#La diferencia es que send puede llamar cualquier tipo de metodos, mientras que public_send solo puede llamar metodos publicos.

