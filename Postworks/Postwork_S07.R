# Postwork. Predicciones de la temperatura global

# OBJETIVO
# Estimar modelos ARIMA y realizar predicciones
# DESARROLLO
# Utilizando el siguiente vector numérico, realiza lo que se indica:

url = "https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2022/main/Sesion-07/Data/global.txt"
Global <- scan(url, sep="")
class(Global)
"1) Crea una objeto de serie de tiempo con los datos de Global. La serie debe ser mensual 
comenzado en Enero de 1856"
Global.ts <- ts(Global, st = c(1856, 1), fr = 12)

"2) Realiza una gráfica de la serie de tiempo anterior"
plot(Global.ts, xlab = "Tiempo", ylab = "Temperatura en °C", 
     main = "Serie de Temperatura Global",
     sub = "Serie mensual: Enero de 1856 a Diciembre de 2005")

"3) Ahora realiza una gráfica de la serie de tiempo anterior, transformando a la 
primera diferencia:"
plot(diff(Global.ts), xlab = "", ylab = "")
title(main = "Serie de Temperatura Global",
      xlab = "Tiempo", ylab = "Dif log-Serie",
      sub = "Gráfica de la serie log-transformada diferenciada de primer órden")

#4) ¿Consideras que la serie es estacionaria en niveles o en primera diferencia?
# En primera diferencia

#5) Con base en tu respuesta anterior, obten las funciones de autocorrelación y 
#autocorrelación parcial?
acf(diff(Global.ts))
pacf(diff(Global.ts))

"6) De acuerdo con lo observado en las gráficas anteriores, se sugiere un modelo ARIMA
con AR(1), I(1) y MA desde 1 a 4 rezagos Estima los diferentes modelos ARIMA propuestos:"
arima(Global.ts, order = c(1, 1, 1))
arima(Global.ts, order = c(1, 1, 2))
arima(Global.ts, order = c(1, 1, 3))
arima(Global.ts, order = c(1, 1, 4))

"7) Con base en el criterio de Akaike, estima el mejor modelo ARIMA y realiza una 
predicción de 12 periodos (meses)"
fit <- arima(Global.ts, order = c(1, 1, 4))
pr <- predict(fit, 12)$pred
