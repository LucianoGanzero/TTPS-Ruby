# Implementá un método que reciba como parámetro un arreglo de números, los ordene y devuelva el resultado

def ordenar_arreglo arreglo
  arreglo.sort
end

p ordenar_arreglo([1,3,5,3,2])

# Modificá el método anterior para que en lugar de recibir un arreglo como único parámetro, re‑
# ciba todos los números como parámetros separados. Por ejemplo
def ordenar_numeros *numeros
  numeros.sort
end

p ordenar_numeros(1,2,22,33,4)

# Suponé que se te da el método que implementaste en el ejercicio 2 para que lo uses a fin de or‑
# denar un conjunto de números que te son provistos en forma de arreglo. ¿Cómo podrías invocar
# el método? Por ejemplo, teniendo la siguiente variable con los números a ordenar:

entrada = [10, 9, 1, 2, 3, 5, 7, 8]

p ordenar_numeros(*entrada)
