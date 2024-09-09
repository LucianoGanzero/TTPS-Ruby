# Escribí una función longitud que dado un arreglo que contenga varios String cualesquiera,
# retorne un nuevo arreglo donde cada elemento es la longitud del String que se encuentra en
# la misma posición del arreglo recibido como parámetro. Por ejemplo:

def longitud(arreglo)
    arreglo.map { |word| word.length }
end


p longitud(['TTPS', 'Opción', 'Ruby', 'Cursada 2024'])

#13. Escribí una función llamada listar que reciba un Hash y retorne un String con los pares de
# clave/valor formateados en una lista ordenada en texto plano. Por ejemplo:

def listar(hash)
    palabra = ""
    hash.each_with_index { |(key,value),index| palabra << "#{index + 1}. #{key}: #{value}\n"}
    palabra
end


p listar({ perros: 2, gatos: 2, peces: 0, aves: 0 })

#14. Mejorar la función anterior en una nueva llamada listar_mejorada para que además reciba
# opcionalmente un parámetro llamado pegamento (su valor por defecto debe ser ": ") que sea
# el que utilice para unir los pares de clave/valor. Por ejemplo:

def listar_mejorada(hash, separador = ": ")
    palabra = ""
    hash.each_with_index { |(key,value),index| palabra << "#{index + 1}. #{key}#{separador}#{value}\n"}
    palabra
end


puts listar_mejorada({ perros: 2, gatos: 2, peces: 0, aves: 0 }, " -> ")