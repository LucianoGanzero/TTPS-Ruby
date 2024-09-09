# 5. Escribí una función llamada reemplazar que, dado un String que recibe como parámetro,
# busque y reemplace en éste cualquier ocurrencia de "{" por "do\n" y cualquier ocurrencia de
# "}" por "\nend", de modo que convierta los bloques escritos con llaves por bloques multilínea
# con do y end.

def reemplazar(frase)
    frase.gsub(/\{/, "do\n").gsub(/\}/, "\nend")
end

mi_frase = "Puedo encerrar bloques entre { Y adentro pongo el contenido }"
bloque = "3.times { |i| puts i }"
puts mi_frase
puts reemplazar mi_frase
puts "Por ejemplo, un bloque puede ser"
puts bloque
puts reemplazar bloque