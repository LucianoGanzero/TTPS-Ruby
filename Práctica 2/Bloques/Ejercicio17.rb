# Implementá un método que reciba un número variable de parámetros y un bloque, y que al ser
# invocado ejecute el bloque recibido pasándole todos los parámetros que se recibieron encap‑
# sulando todo esto con captura de excepciones de manera tal que si en la ejecución del bloque
# se produce alguna excepción, proceda de la siguiente forma:
# • Si la excepción es de clase RuntimeError, debe imprimir en pantalla "Hay algo mal
# que no anda bien", y retornar :rt.
# • Si la excepción es de clase NoMethodError, debe imprimir "Y este método?" más el
# mensaje original de la excepción que se produjo, y retornar :nm.
# • Si se produce cualquier otra excepción, debe imprimir en pantalla "Y ahora?", y relanzar
# la excepción que se produjo.

def metodo(*args, &block)
  begin
    puts block.call(args)
    :ok
  rescue RuntimeError
    puts "Hay algo mal que no anda bien"
    :rt
  rescue NoMethodError
    puts "Y este metodo? #{$!}"
    :nm
  rescue Exception
    puts "Y ahora?"
    raise
  end
end

puts metodo(2, 0) {|x, y| x/y}