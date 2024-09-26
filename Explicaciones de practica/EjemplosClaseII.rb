#Implementá un método que retorne si una cadena, que recibe como parametro, es un palindromo.
#Sin considerar espacios, mayúsculas o minúsculas o signos de puntuación.

def palindromo?(cadena)
  #gsub reemplaza usando expresiones regulares, le paso la expresión regular y la cadena de reemplazo.
  #En este caso, reemplaza todos los caracteres que no son letras por espacio en blanco.
  cadena_limpia = cadena.gsub(/\W/, "").downcase

  cadena_limpia >= 3 && cadena_limpia == cadena_limpia.reverse
end

#Monkey patching
class String
  def palindromo?
    cadena_limpia = self.gsub(/\W/, "").downcase

    cadena_limpia >= 3 && cadena_limpia == cadena_limpia.reverse
end

