# Implementá el método cuanto_falta? que opcionalmente reciba como parámetro un objeto
# Time y que calcule la cantidad de minutos que faltan para ese momento. Si el parámetro de
# fecha no es provisto, asumí que la consulta es para la medianoche de hoy
# 
def cuanto_falta? horario=Time.new(Time.now.year, Time.now.mon, Time.now.day, 23, 59, 59)
  segundos = horario - Time.now
  puts "Faltan #{(segundos/60).ceil} minutos para #{horario.to_s}"
end

cuanto_falta?