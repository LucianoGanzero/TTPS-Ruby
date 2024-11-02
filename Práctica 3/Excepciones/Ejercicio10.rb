# Implementá un método que reciba dos parámetros: un String que representa la ruta a un archivo y un bloque. El método deberá abrir el archivo indicado, leer su contenido y 
# procesar cada linea del mismo con el bloque recibido, imprimiendo a la salida estándar el resultado de cada invocación al bloque.
# Considerá qué posibles excepciones pueden ocurrir, intentá manejarlas, y en caso que la ejecución del bloque falle para alguna de las líneas, en el lugar que iría la salida 
# de la ejecución fallida deberá imprimirse Error encontrado: mensaje de error (ClaseDelError). Finalmente, el método deberá retornar la cantidad de líneas procesadas correctamente.
# 

def procesar_archivo(path, &block)
  correctas = 0
  begin
    f = File.open(path)
    while line = f.gets
      begin
        line = line.strip
        puts yield line
        correctas += 1
      rescue ArgumentError => e
        puts "Error encontrado: #{e.message} (#{e.class})"
      rescue e
        puts "Error encontrado: #{e.message} (#{e.class})"
      end
    end
  rescue Errno::ENOENT => e
    puts "No existe el archivo invocado"
  else
    f.close
  end
  correctas
end

puts procesar_archivo('datos.txt') { |linea| Integer(linea) }