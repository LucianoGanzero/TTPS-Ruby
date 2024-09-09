# 6. Escribí una función que exprese en palabras la hora que recibe como parámetro, según las si‑
# guientes reglas:
# • Si el minuto está entre 0 y 10, debe decir “en punto”,
# • si el minuto está entre 11 y 20, debe decir “y cuarto”,
# • si el minuto está entre 21 y 34, debe decir “y media”,
# • si el minuto está entre 35 y 44, debe decir “menos veinticinco” con la hora siguiente,
# • si el minuto está entre 45 y 55, debe decir “menos cuarto” con la hora siguiente,
# • y si el minuto está entre 56 y 59, debe decir “Casi son las” con la hora siguiente

def time_en_palabras(tiempo)
    hora = tiempo.hour
    calculo_hora = lambda { |hora, sum=0| hora + sum == 1 ? "Es la" : "Son las"}
    case tiempo.min
    when 0..9 then "#{calculo_hora.call hora} #{hora} en punto"
    when 10..20 then "#{calculo_hora.call hora} #{hora} y cuarto"
    when 21..34 then "#{calculo_hora.call hora} #{hora} y media"
    when 35..44 then "#{calculo_hora.call hora, 1} #{hora + 1} menos veinticinco"
    when 45..55 then "#{calculo_hora.call hora, 1} #{hora + 1} menos cuarto"
    when 55..59 then "Casi #{(calculo_hora.call hora, 1).downcase} #{hora + 1}"
    end
end

puts time_en_palabras(Time.new(2024, 10, 21, 10, 1))
# => "Son las 10 en punto"
puts time_en_palabras(Time.new(2024, 10, 21, 9, 33))
# => "Son las 9 y media"
puts time_en_palabras(Time.new(2024, 10, 21, 8, 45))
# => "Son las 9 menos cuarto"
puts time_en_palabras(Time.new(2024, 10, 21, 6, 58))
# => "Casi son las 7"
puts time_en_palabras(Time.new(2024, 10, 21, 0, 58))