class NoEsUnaPalabra < StandardError; end
class EsUnStringVacio < StandardError; end

class Palabra
  attr_reader :palabra
  
  def initialize palabra
    raise NoEsUnaPalabra, "#{palabra} no es una palabra" if !!(palabra =~ /[A-Za-z].*\s|.*\s.*[A-Za-z]/)
    raise EsUnStringVacio, "Es un string vacio" if !!(palabra =~ /^\s*$/)
    @palabra = palabra.downcase
  end

  def vocales
    @palabra.scan(/[aeiou]/).uniq
  end

  def consonantes
    @palabra.scan(/[bcdfghjklmnpqrstvwxyz]/).uniq
  end

  def longitud
    @palabra.size
  end

  def es_panvocalica?
    self.vocales.size == 5
  end

  def es_palindroma?
    self.longitud >= 3 && @palabra.reverse == @palabra 
  end

  def gritando
    @palabra.upcase
  end

  def en_jaquer
    #Fuente => https://stackoverflow.com/questions/41306355/how-to-replace-the-characters-in-a-string
    reemplazos = {'a'=>'4', 'e'=>'3','i'=>'1', 'o'=>'0', 'u'=>'2'}
    @palabra.gsub(Regexp.union(reemplazos.keys), reemplazos)
  end
end