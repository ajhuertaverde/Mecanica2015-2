#En este Programa abriremos un archivo y haremos un promedio de datos.
promedio = 0;
contador = 0;
file =  open('../Datos/medidas.csv','r')
#print file
for linea  in file:
    columnas = linea.split(",")
    if (float(columnas[1]) > 0.0):
       promedio += float(columnas[1])
       contador += 1;
print promedio/contador
