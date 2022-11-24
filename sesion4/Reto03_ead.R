#RETO 03: DISTRIBUCIÓN NORMAL
#Objetivo

#Calcular probabilidades haciendo uso de la distribución normal.

#Requisitos

#Haber trabajado con el Prework y el Work

#Desarrollo

#1.- El tiempo necesario para producir un determinado producto en una maquinaria
#tiene una distribución normal cuya media es 80 minutos con desviación estándar de 10 minutos.

set.seed(0202)

#a) Grafica la función de distribución de la variable aleatoria.
mean <- 80
sd <- 10
curve(dnorm(x,mean=mean,sd=10), from=40, to=120,col='blue',
      main="Densidad de probabilidad",ylab="f(x)",xlab="X")

#b) ¿Cuál es la probabilidad de que la maquinaria termine el producto en una hora o menos?
pnorm(q=60,mean=mean,sd=10)
  
#c) ¿Cuál es la probabilidad de que el producto sea terminado en más de 1.5 horas, pero en menos de 2.5 horas?
pnorm(q=150,mean=mean, sd=sd) - pnorm(q=90,mean=mean, sd=sd)
  
#d) ¿Cuál es el intervalo de tiempo que deja exactamente al centro el 90% de probabilidad?
qnorm(p=0.1/2,mean=mean,sd=10)
qnorm(p=0.1/2,mean=mean,sd=10,lower.tail=FALSE)

#63.55 y 96.44


#2.- Una institución de crédito informa a las autoridades que, en promedio, sus clientes mantienen un saldo deudor en sus tarjetas de crédito igual a 12,500 pesos mensuales, con una desviación estándar de 7,800 pesos.

#a) ¿Cuál es la probabilidad de que un cliente tenga un saldo deudor mayor a $20,000?
  
#b) ¿Cuál es la probabilidad de que un cliente tenga un saldo deudor menor a $11,000?
  
#c) ¿Cuál es la probabilidad de que un cliente tenga un saldo deudor entre $13,000 y 15,000?
  
#d) ¿Hasta qué monto se encuentra el 10% de clientes con saldo deudor más bajo?