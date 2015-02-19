# Programa para leer archivos
promedio = 0
contador = 0
f = File.open("../Datos/medidas.csv", "r")
f.each_line do |line|
  contador += 1
  ls = line.split(',')
  promedio += ls[1].to_f
end
puts promedio/contador
f.close
