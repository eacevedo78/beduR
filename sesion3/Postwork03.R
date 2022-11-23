# Postwork Sesión 3

#### Objetivo

#- Realizar un análisis descriptivo de las variables de un dataframe

#### Requisitos

#1. R, RStudio
#2. Haber realizado el prework y seguir el curso de los ejemplos de la sesión
#3. Curiosidad por investigar nuevos tópicos y funciones de R


library(dplyr)
library(ggplot2)
library(DescTools)

#### Desarrollo

"Utilizando el dataframe `boxp.csv` realiza el siguiente análisis descriptivo. No olvides excluir los missing values y transformar las variables a su
tipo y escala correspondiente."
df <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2022/main/Sesion-03/Data/boxp.csv")
View(df)
summary(df)
#Omitir valores faltantes
df <- na.omit(df)
summary(df)
#Transformar variables a su tipo y escala
df$Categoria <- factor(df$Categoria)
df$Grupo <- factor(df$Grupo, labels =c ("NO","SI"))
df
#1) Calcula e interpreta las medidas de tendencia central de la variable `Mediciones`
"Moda"
Mode(df$Mediciones)
"Mediana"
median(df$Mediciones)
"Media o promedio"
mean(df$Mediciones)
summary(df)


#2) Con base en tu resultado anterior, ¿qué se puede concluir respecto al sesgo de `Mediciones`?
#Como moda(23.3) < mediana(49.3) < media(62.88) tenemos un sesgo a la derecha, es decir la mayoria
#de los datos se concentran del lado izquierdo


#3) Calcula e interpreta la desviación estándar y los cuartiles de la distribución de `Mediciones`

sd(df$Mediciones)
"Las mediciones tienen una dispersion que está por debajo de la media (62.88) "
quantile(df$Mediciones, probs=c(0.25,0.50,0.75))
# 25% de las mediciones son iguales o menores a 23.45
# 50% de las mediciones son menores o iguales a 49.3
# 75% de las mediciones son menores o iguales a 82.86

"4) Con ggplot, realiza un histograma separando la distribución de `Mediciones` por `Categoría`
¿Consideras que sólo una categoría está generando el sesgo?"

ggplot(df,aes(x=Mediciones)) +
  geom_histogram(aes(color=Categoria,fill=Categoria))


"5) Con ggplot, realiza un boxplot separando la distribución de `Mediciones` por `Categoría` 
y por `Grupo` dentro de cada categoría. ¿Consideras que hay diferencias entre categorías? ¿Los grupos al interior de cada categoría 
podrían estar generando el sesgo?"

ggplot(df,aes(Mediciones,x=Mediciones, y=Categoria,fill=Grupo))+
geom_boxplot(outlier.size=3,autlier.colour="454545")
