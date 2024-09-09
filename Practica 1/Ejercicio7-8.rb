# Escribí una función llamada contar que reciba como parámetro dos String y que retorne
# la cantidad de veces que aparece el segundo String en el primero, en una búsqueda case‑
# insensitive (sin distinguir mayúsculas o minúsculas). Por ejemplo:

def count_string(word, substring)
    # i hace que la busqueda sea insensible a mayusculas
    word.scan(/#{substring}/i).count()
end

word = "La casa de la esquina tiene la puerta roja y la ventana blanca."
subs = "la"
puts "La palabra #{subs} aparece #{count_string(word, subs)} veces en la frase #{word}"

# Modificá la función anterior para que sólo considere como aparición del segundo String cuan‑
# do se trate de palabras completas. Por ejemplo:

def count_complete_string(word, substring)
    # \b es el delimitador de palabras
    word.scan(/\b#{substring}\b/i).count()
end

puts "La palabra #{subs} aparece completa #{count_complete_string(word, subs)} veces en la frase #{word}"