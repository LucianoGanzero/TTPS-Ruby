# Escribí un enumerador que genere series de números primos con algún tope, ya sea que se de‑
# tenga al alcanzar o superar un valor, o que termine su ejecución al encontrar el enésimo número
# primo.

def primos_enumerador(max: nil, cantidad: nil)
  Enumerator.new do |yielder|
    numero = 2
    encontrados = 0

    loop do
      break if (cantidad && encontrados >= cantidad) || (max && numero >= max)
      if primo?(numero)
        yielder.yield numero
        encontrados += 1
        
      end
      numero += 1
    end
  end
end

def primo?(n)
  return false if n < 2
  (2..Math.sqrt(n)).none? { |i| n % i == 0 }
end
