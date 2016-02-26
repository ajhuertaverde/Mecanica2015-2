#En este Programa abriremos un archivo y haremos un promedio de datos.
import math

promedio = 0;
contador = 0;
promedioLog = 0;
file =  open('../Datos/medidas.csv','r')
#print file
for linea  in file:
    columnas = linea.split(",")
    if (float(columnas[1]) > 0.0):
       contador += 1;
       promedio += float(columnas[1])
       promedioLog += math.log(float(columnas[1]))
print promedio/contador

print promedioLog/contador
print math.log(promedio/contador)
