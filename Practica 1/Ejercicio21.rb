# Escribí una función que encuentre la suma de todos los números naturales múltiplos de 3 y 5
# (ambos) que sean menores que un número tope que reciba como parámetro. Por ejemplo:

def multiplos_de_3_y_5 tope
  (1..tope).reduce(0) { |sum,n| n.modulo(3) == 0 && n.modulo(5) == 0 ? sum + n : sum }
end

puts multiplos_de_3_y_5(100)

# Creá otra función, similar a la anterior, que busque los números naturales múltiplos de N núme‑
# ros enteros que recibirá como parámetro en un arreglo. Por ejemplo:

def multiplos_de(arreglo, tope)
  (1..tope).reduce(0) do |sum, n|
    arreglo.all? {|numero| n.modulo(numero) == 0 } ? sum + n : sum
  end
end

puts multiplos_de([3, 5], 100)
# => 315
puts multiplos_de([3, 5, 17, 28, 65], 100_000)
# => 92820