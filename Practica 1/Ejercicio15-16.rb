# 15. Escribí una función llamada rot13 que encripte un String recibido como parámetro utilizando
# el algoritmo ROT13. Por ejemplo:

def rot13(frase)
    letters = ('a'..'z').to_a
    frase.chars.map do |x| 
        if letters.include?(x.downcase)
            # Determinamos si la letra es mayúscula o minúscula
            is_upper = x == x.upcase
            # Ciframos usando ROT13
            rotated_letter = letters[(letters.find_index(x.downcase) + 13) % 26]
            # Si la letra era mayúscula, la volvemos a convertir a mayúscula
            is_upper ? rotated_letter.upcase : rotated_letter
        else
          # Si no es una letra, la dejamos igual
          x
        end
    end.join
end

# Escribí una función más genérica, parecida a la del ejercicio anterior, que reciba como paráme‑
# tro un String y un número n, y que realice una rotación de n lugares de las letras del String
# y retorne el resultado. Por ejemplo:

def rot(frase, n)
    letters = ('a'..'z').to_a
    frase.chars.map do |x| 
        if letters.include?(x.downcase)
            # Determinamos si la letra es mayúscula o minúscula
            is_upper = x == x.upcase
            # Ciframos usando ROT13
            rotated_letter = letters[(letters.find_index(x.downcase) + n) % 26]
            # Si la letra era mayúscula, la volvemos a convertir a mayúscula
            is_upper ? rotated_letter.upcase : rotated_letter
        else
          # Si no es una letra, la dejamos igual
          x
        end
    end.join
end

puts rot13("¡Bienvenidos a la cursada de TTPS Opción Ruby!")
puts rot("¡Bienvenidos a la cursada de TTPS Opción Ruby!", 1)