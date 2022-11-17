#RETO 01: TABLAS DE DISTRIBUCIÓN DE FRECUENCIAS
#Objetivo

#Utilizar tablas de distribución de frecuencias para analizar variables

#Requisitos

#Tener previamente instalados R y Rstudio
#Manipulación de datos
#Gráficas y atributos

#Desarrollo

library(ggplot2)

#Para este reto vamos a hacer uso del dataframe diamonds, disponible en la
# librería de ggplot2. Realiza los siguientes incisos y responde a las preguntas:

diamonds  
#  ¿Qué tipo de variable y escala de medición tiene la variable cut?
class(diamonds$cut)  
#  Reliza una tabla de frecuencias absolutas y relativas
freq <- table(diamonds$cut)
freq
transform(freq,freq_rel = prop.table(Freq))
#Para esta variable, ¿es posible calcular la frecuencia relativa acumulada? En caso afirmativo, agrégala a tu tabla anterior
transform(freq,freq_rel = prop.table(Freq),cum.freq=cumsum(prop.table(Freq)))

#Con base en tu tabla, responde:
#  ¿Cuál es el porcentaje de diamantes que tienen un corte Very Good? = 22.39%
#  ¿Cuál es el porcentaje de diamantes que tienen un corte entre Fair y Very Good? 34.48%
#  ¿Cuál es el porcentaje de diamantas que tienen un corte al menos Very Good? 87.92%
  
#  Crea una tabla de distribución de frecuencias para el precio de los diamantes. Para ello determina el número de clases con base en la regla de Sturges k = 1+3.3Log10(n)

k= ceiling(1 + 3.3 *log(10)*(length(diamonds$price)))
ac = (max(diamonds$price)-min(diamonds$price)) / k

bins  <- seq(min(diamonds$price), max(diamonds$price), by = ac)

price.diamonds <- cut(diamonds$price, breaks =bins, include.lowest=TRUE, dig.lab=10)
dist.freq <- table(price.diamonds)
transform(dist.freq, freq.rel = prop.table(Freq), cum.freq=cumsum(Freq))
#Con base en tu tabla, responde:
#  ¿Cuál es el porcentaje de diamantes que tienen un precio entre 3590.17 y 4678.23?
#  ¿Cuál es el porcentaje de diamantes que tienen un precio menor a 7942.41?
#  ¿Cuál es el porcentaje de diamantes que tienen un precio mayor a 11206.58?
  