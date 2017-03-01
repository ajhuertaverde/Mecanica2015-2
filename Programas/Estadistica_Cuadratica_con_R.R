datos <- read.csv('datos_cuad.csv')
pairs(datos)
regresion <- lm(Y ~ X, data = datos)
summary(regresion)
plot(datos$X, datos$Y, xlab = "Tiempo (s)", ylab = "Posicion (m)")
abline(regresion)

datos$logX <- log(datos$X)
datos$logY <- log(datos$Y)
datos
datos_limpios = datos[2:1000,]
pairs(datos_limpios)
regresion <- lm(logY ~ logX, data = datos_limpios)
plot(datos_limpios$logX, datos_limpios$logY, xlab = "Log Tiempo (s)", ylab = "LogPosicion (m)")
summary(regresion)
abline(regresion)
