#RETO 1. Distribución binomial
#Objetivo

#Calcular probabilidades utilizando la distribución binomial.

#Requisitos

#Haber trabajado con el Prework y el Work

#Desarrollo

#Una maquina de ensamblaje, tiene una probabilidad de 0.15 de ensamblar de forma
#defectuosa una una unidad. Si la producción de una unidad es totaltamente
#independiente de las demás y al día se producen 10 unidades:
  
set.seed(0202)

#a) Grafica la función de distribución de la variable aleatoria. (Asume que se obtienen 10,000 muestras)
#n es el numero de muestras, size es el tamaño de la muestra, o sea 10 piezas
binom <- rbinom(n=10000, size=10, prob=0.15)

barplot(table(binom)/length(binom),
        main = "Distribución Binomial", 
        xlab = "# piezas defectuosas")

#b) ¿Cuál es la probabilidad de que se produzcan dos unidades defectuosas?
dbinom(x = 2, size = 10, prob = 0.15) # 0.2758
  
#c) ¿Cuál es la probabilidad de que a lo mucho 4 unidades sean defectuosas?
pbinom(q=4, size=10,prob=0.15,lower.tail=TRUE) #0.99
  
#d) ¿Cuál es la probabiliad de que por lo menos tres unidades se encuentren defectuosa?
1 - pbinom(q=2, size=10,prob=0.3,lower.tail=TRUE) # 0.6172
  
#e) ¿Cuál es la probabilidad de que entre 2 y 4 unidades se encuentren defectuosas?
pbinom(q=4, size=10,prob=0.3,lower.tail=TRUE) - pbinom(q=2, size=10,prob=0.3,lower.tail=TRUE)
# 0.4669  
#P(X <=b) - P(X <=a) = P(a < X <= b)

#f) ¿Cuál es el número esperado de unidades defectuosas? ¿Con qué variación?
mean(binom)  # 1.49
sd(binom)  #1.13 de variación


