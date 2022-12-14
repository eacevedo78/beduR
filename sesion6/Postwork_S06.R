#Supongamos que nuestro trabajo consiste en aconsejar a un cliente sobre como mejorar las ventas
#de un producto particular, y el conjunto de datos con el que disponemos son datos de publicidad
#que consisten en las ventas de aquel producto en 200 diferentes mercados, junto con presupuestos
#de publicidad para el producto en cada uno de aquellos mercados para tres medios de comunicación
#diferentes: TV, radio, y periódico. No es posible para nuestro cliente incrementar directamente
#las ventas del producto. Por otro lado, ellos pueden controlar el gasto en publicidad para cada
#uno de los tres medios de comunicación. Por lo tanto, si determinamos que hay una asociación entre
#publicidad y ventas, entonces podemos instruir a nuestro cliente para que ajuste los presupuestos
#de publicidad, y así indirectamente incrementar las ventas.
#En otras palabras, nuestro objetivo es desarrollar un modelo preciso que pueda ser usado para
#predecir las ventas sobre la base de los tres presupuestos de medios de comunicación.
#Ajuste modelos de regresión lineal múltiple a los datos advertisement.csv y elija el modelo más
#adecuado siguiendo los procedimientos vistos

# Considera:
  
# Y: Sales (Ventas de un producto)
# X1: TV (Presupuesto de publicidad en TV para el producto)
# X2: Radio (Presupuesto de publicidad en Radio para el producto)
# X3: Newspaper (Presupuesto de publicidad en Periódico para el producto)

df <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2022/main/Sesion-06/data/advertising.csv")
View(df)

pairs(~ Sales + TV + Radio + Newspaper,
      data = df, gap = 0.4, cex.labels = 1.5)

par(mfrow=c(2,2))

#Para TV
x1 <- df$TV
y <- df$Sales

plot(x1,y, pch=19, col="blue", main="TV")
abline(lm(y ~ x1), col="red", lwd=3)

#Para Radio
x2 <- df$Radio

plot(x2, y, col = "blue", main = "Radio")
abline(lm(y ~ x2), col = "red", lwd = 3)

#Para Periodico
x3 <- df$Newspaper
plot(x3, y, col = "blue", main = "Periodico ")

abline(lm(y ~ x3), col = "red", lwd = 3)

dev.off()

attach(df)
m1 <- lm(Sales ~ TV)
summary(m1) #r2 = 0.8112

m2 <- lm(Sales ~ Radio)
summary(m2) #r2 = 0.1222

m3 <- lm(Sales ~ Newspaper)
summary(m3) #r2 = 0.02495


m0 <- lm(Sales ~ TV + Radio + Newspaper)
summary(m0)

stanres <- rstandard(m0)

par(mfrow = c(2, 2))

plot(TV, stanres, ylab = "Residuales Estandarizados")
plot(Radio, stanres, ylab = "Residuales Estandarizados")
plot(Newspaper, stanres, ylab = "Residuales Estandarizados")

qqnorm(stanres)
qqline(stanres)

shapiro.test(stanres)
