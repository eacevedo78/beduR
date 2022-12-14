# Objetivo
# Realizar un análisis probabilístico del total de cargos internacionales de una compañía de telecomunicaciones
# Requisitos
# R, RStudio
# Haber trabajado con el prework y el work
# Desarrollo
# Utilizando la variable total_intl_charge de la base de datos telecom_service.csv de la sesión 3,
# realiza un análisis probabilístico. Para ello, debes determinar la función de distribución
# de probabilidad que más se acerque el comportamiento de los datos.
# Hint: Puedes apoyarte de medidas descriptivas o técnicas de visualización.

install.packages("DescTools")
library(dplyr)
library(ggplot2)
library(DescTools)

# Una vez que hayas seleccionado el modelo, realiza lo siguiente:
df <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2022/main/Sesion-03/Data/telecom_service.csv")
View(df)
mean <- mean(df$total_intl_charge)
sd <- sd(df$total_intl_charge)

# Grafica la distribución teórica de la variable aleatoria total_intl_charge
hist(df$total_intl_charge, prob=T, main="Cargos Internacionales")

curve(dnorm(x,mean=mean,sd=sd), from=0, to=5, col='blue',
      main="Densidad de Probabilidad normal", ylab="f(x)", xlab="X")
abline(v=mean,lwd=0.5, lty=2)
# ¿Cuál es la probabilidad de que el total de cargos internacionales sea menor a 1.85 usd?

pnorm(1.85, mean=mean, sd=sd, lower.tail=T) #0.1125

# ¿Cuál es la probabilidad de que el total de cargos internacionales sea mayor a 3 usd?

pnorm(3,mean=mean,sd=sd,lower.tail=F) #0.3773

# ¿Cuál es la probabilidad de que el total de cargos internacionales esté entre 2.35usd y 4.85 usd?

pnorm(4.85, mean=mean, sd=sd) - pnorm(2.35, mean=mean, sd=sd) # 0.7060

# Con una probabilidad de 0.48, ¿cuál es el total de cargos internacionales más alto que podría esperar?
qnorm(p=0.48, mean=mean, sd=sd) # 2.7267

# ¿Cuáles son los valores del total de cargos internacionales que dejan exactamente al centro el 80% de probabilidad?

qnorm(p=0.1,  mean=mean, sd=sd)  #1.7985
qnorm(p=0.1, mean=mean, sd=sd, FALSE) # 3.7305
