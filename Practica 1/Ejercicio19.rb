# Implementá las funciones necesabias para que, dado un color expresado en notación RGB, se
# pueda obtener su representación en las notaciones entera y hexadecimal. La notación entera
# se define como red + green * 256 + blue * 256 * 256 y la hexadecimal como el resul‑
# tado de expresar en base 16 el valor de cada color y concatenarlos en orden. Por ejemplo:

def notacion_entera(rgb)
    r, g, b = rgb
    r + g * 256 + b * 256 * 256
end

def notacion_hexadecimal(rgb)
    r, b ,g = rgb
    "##{r == 0 ? "00" : r.to_s(16).upcase}#{b == 0 ? "00" : b.to_s(16).upcase}#{g == 0 ? "00" : g.to_s(16).upcase}"
end



puts notacion_hexadecimal([0, 128, 255])
# => '#0080FF'
puts notacion_entera([0, 128, 255])
# => 16744448