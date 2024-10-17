# 10. Implementá el Mixin Countable que te permita hacer que cualquier clase cuente la cantidad de
# veces que los métodos de instancia definidos en ella es invocado. Utilizalo en distintas clases,
# tanto desarrolladas por vos como clases de la librería standard de Ruby, y chequeá los resulta‑
# dos. El Mixin debe tener los siguientes métodos:
# 1. count_invocations_of(sym): método de clase que al invocarse realiza las tareas ne‑
# cesarias para contabilizar las invocaciones al método de instancia cuyo nombre es sym (un
# símbolo).
# 2. invoked?(sym): método de instancia que devuelve un valor booleano indicando si el
# método llamado sym fue invocado al menos una vez en la instancia receptora.
# 3. invoked(sym): método de instancia que devuelve la cantidad de veces que el método
# identificado por sym fue invocado en la instancia receptora.
module Countable
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def count_invocations_of(sym)
      alias_method :"original_#{sym}", sym

      define_method(sym) do |*args, &block|
        @invocations ||= Hash.new(0)
        @invocations[sym] += 1
        send(:"original_#{sym}", *args, &block)
      end
    end
  end

  def invoked?(sym)
    @invocations && @invocations[sym] > 0 ? true : false
  end

  def invoked(sym)
    @invocations ? @invocations[sym] : 0
  end
end

class String
  include Countable

  count_invocations_of :upcase
end

