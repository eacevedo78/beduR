############## SESIÓN 3: ANÁLISIS EXPLORATORIO DE DATOS  ###############
###############################################################################

library(dplyr)
install.packages("DescTools")
library(DescTools)
library(ggplot2)
install.packages("moments")
library(moments)

## EJEMPLO 1: TIPOS DE VARIABLES Y ESCALAS DE MEDICIÓN
"A nivel estadístico, existen dos tipos de variables con distintas escalas de medición:
  - Cualitativas: Aquellas que describen una cualidad de la observación
        - Nominales: El orden de la cualidad no es importante
        - Ordinales: El orden de la cualidad sí es importante
        
  - Cuantitativas: Aquellas que rdescriben una cantidad relacionada con la observación.
      estas pueden ser de intervalo o razón.
        - Discretas: Resultan de un proceso de conteo
        - Continuas: Resultan de un proceso de medición

Es importante identificar correctamente el tipo de variable y su escala de medición, 
ya que con base en ello aplicaremos cierto tipo de técnicas y herramientas estadísticas.

Veamos la estadística descriptiva de las siguientes variables. ¿Tiene sentido?"
var <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2022/main/Sesion-03/Data/variables.csv")
str(var)
summary(var)

"Vamos a transformar las variables a su tipo y escala correspondiente"
var$SEXO <- factor(var$SEXO)
var$ESTUDIOS <- factor(var$ESTUDIOS,levels=c("Primaria","Secundaria","Bachillerato", "Licenciatura", "Maestria"), ordered=TRUE)
var$NIVEL_SOCIOECO <- factor(var$NIVEL_SOCIOECO,levels=c("Bajo","Medio","Alto"),ordered=TRUE) 
var$MEDIO_CONTACTO <- factor(var$MEDIO_CONTACTO) 
var$ACTIVO <- factor(var$ACTIVO,labels= c("No","Si")) 

summary(var)
head(var)
## EJEMPLO 2: TABLAS DE DISTRIBUCIÓN DE FRECUENCIAS
"El objetivo principal de la estadística descriptiva, es presentar, de forma sintetizada, 
la información para su correcto análisis.

Vamos a comenzar con métodos tabulares para presentar un resumen de la información:"
# Hay 2 tablas: de frecuencias (variables cualitativas), y de distribución de frecuencias (para datos cuantitativos)

freq <- table(var$ESTUDIOS) 
freq
# Para mostrar (frecuencia relativa) proporcionalmente cuanto representa cada nivle de estudio se hace:
# la funcion prop.table regresa la frecuencia proporcional (prop = proportional)
transform(freq,rel_freq=prop.table(Freq))

"Hacer este mismo análisis para variables cuantitativas puede resultar en una tabla 
de frecuencias muy larga y poco informativa (¿por qué?). En su lugar, debemos realizar
clases o intervalos con rangos específicos.

Vamos a comenzar por calcular el número de clases y el ancho de la clase"
#Hay 2 reglas para sacar el numero de clases:
# Regla d ela raiz = sqrt(n), se usa para pocos datos
# Regla de Sturges = 1 + 3.3log(n), se usa para cuando hay muchos datos.

#Ahorita usaremos la regla de la raiz
k = ceiling(sqrt(length(var$INGRESO))) #ceiling redondea hacia arriba aunque se pase por .1, ej, 1.1 sube a 2
# Para el ancho de cada clase
ac = (max(var$INGRESO)-min(var$INGRESO))/k

"Ahora vamos a crear una secuencia que vaya del valor mínimo al máximo con el ancho 
de clase. Esto nos va a permitir hacer cortes con las clases correspondientes:"
bins <- seq(min(var$INGRESO),max(var$INGRESO), by = ac) 

# La funcion cut va a crear grupos, toma la variable a cortar y los puntos de corte
ingreso.clases <- cut(var$INGRESO,breaks = bins, include.lowest=TRUE, dig.lab=8)
ingreso.clases
"Con esto, podemos crear nuestra tabla de distribución de frecuencias:"
dist.freq <- table(ingreso.clases)
dist.freq
transform(dist.freq, 
          rel.freq=prop.table(Freq), 
          cum.freq=cumsum(prop.table(Freq)))

## EJEMPLO 3: MEDIDAS DESCRIPTIVAS
df <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2022/main/Sesion-03/Data/telecom_service.csv")
summary(df)

# Medidas de tendencia central

# Media o promedio
mean(df$total_day_calls)
#media truncada, quitara el 25% de los extremos, es decir solo tomamos el 50%
#de los datos
mean(df$total_day_calls, trim=0.25)

# Mediana, representa el punto central de los datos 50% por abajo y 50% por arriba
median(df$total_day_calls)

# La moda no viene directamente en R pero viene en la libreria DescTools
Mode(df$total_day_calls)[1]

# Medidas de dispersión

#varianza
var(df$total_day_calls)

#desviacion estandar
sd(df$total_day_calls)

IQR(df$total_day_calls) #q3 - q1

# Medidas de posición (CuaNtiles)
# Cuantiles es una medida de posicion GENERAL
# De ahi se desprenden los cuartiles , que divide en 4 partes iguales
# Tambien haylos Deciles, que divide en 10 partes iguales

# CuaRtiles (Separan la distribución de los datos en 4 partes de 25% cada una)
# q1, q2 y q3
# Deciles (Separan la distribución de los datos en 10 partes de 10% cada una)
# d1, d2, d3, d4, d5, d6, d7, d8, d9
# Percentiles o centiles (Separan la distribución de los datos en 100 partes de 1% cada una) 
# p1, p2, p3, ... p10, ... p20, ..., p25, ... , p50, p75, ... p99

# Equivalencias
# d1 = p10 (En general dk = p(k*10) para toda k = 1, ... 9)
# q1 =  p25
# q2 = d5 = p50 (= mediana)
# q3 = p75

cuartiles <- quantile(df$total_day_calls, probs= c(0.25 ,0.5,0.75))
cuartiles

deciles <- quantile(df$total_day_calls, probs = seq(0.1,0.9, by=0.1))
deciles

percentiles <- quantile(df$total_day_calls,probs = seq(0.1,0.99,by=0.01)) #
percentiles

# 

## EJEMPLO 4: HISTOGRAMAS Y BOXPLOTS
"Un histograma es una gráfica de barras en donde el eje horizontal representa los 
intervalos de cases y el eje vertical representa frecuencias (absolutas o porcentuales)"
my_hist <- hist(var$INGRESO,braks=bins, main="Histograma Ingreso")
my_hist

my_hist$counts  <- cumsum(my_hist$counts) #
plot(my_hist, main = "Histograma acumulado", xlab = "Ingreso")  

ggplot(var, aes(INGRESO)) +
  geom_histogram(bins = 4) + 
  labs(title = "Histograma", 
       x = "Ingreso",
       y = "Frequency") + 
  theme_classic()

ggplot(var, aes(INGRESO)) +
  geom_histogram(aes(y = cumsum(..count..)), bins = 4) + 
  labs(title = "Histograma acumulado", 
       x = "Ingreso",
       y = "Frequency") + 
  theme_classic()

"Los histogramas nos ayudan a conocer la distribución de la variable, la cual junto 
con su forma, nos ayuda a entender el comportamiento de los datos.

Los histogramas pueden ser simétricos. Lo que implica que su moda, media y mediana 
son aproximadamente iguales:"
d <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2022/main/Sesion-03/Data/distribuciones.csv")

#moda = mediana = media entonces distribucion simetrica
hist(d$sim, main = "Distribución simétrica")
Mode(d$sim)[1]; median(d$sim); mean(d$sim)


# moda < mediana < media tenemos sesgo a la derecha
hist(d$rs, main = "Distribución con sesgo a la derecha")
Mode(d$rs)[1]; median(d$rs); mean(d$rs)


# moda > mediana > media, tenemos sesgo a la izquierda
hist(d$ls, main = "Distribución con sesgo a la izquierda")
Mode(d$ls)[1]; median(d$ls); mean(d$ls)

"Otra método gráfica para visulizar la distribución de una variable es a través de 
diagramas de caja y brazo, los cuales se basan en los cuartiles de la distribución 
y en su rango intercuartílico para mostrar datos extremos o atípicos."

#
