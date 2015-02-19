#En este Programa abriremos un archivo y haremos un promedio de datos.
promedio = 0;
contador = 0;
file =  open('../Datos/medidas.csv','r')
for line in file:
     columns = line.split(",")
     promedio += float(columns[1])
     contador += 1;
print promedio/contador
