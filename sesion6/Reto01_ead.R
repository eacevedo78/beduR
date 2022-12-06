#Reto 01: Regresión Lineal y predicción

#Una aseguradora de automóviles sueca está interesada en un modelo predictivo
#que le permite establecer el pago que sus clientes deben hacer por el
#seguro (Payment), explicado por el número de casos (Claims) y el número de
#asegurados (Insured).

#Tu trabajo es determinar el mejor modelo de predicción

df <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2022/main/Sesion-06/data/SwedishMotorInsurance.csv", header = TRUE)
head(df)

#1. Selecciona solo las variables de interés y realiza una matriz de correlaciones.
df.select <- select(df,Payment,Claims,Insured)
head(df.select)

#matriz de correlacion
round(cor(df.select),4)
#Hacemos el attach para mandar llamar las variables sin df
attach(df.select)

#Relacionamos las variables del df
#pairs(~)

#2. Estima un modelo de regresión lineal de acuerdo con lo solicitado por la
#aseguradora. No olvides interpretar tus resultados y realizar el diagnóstico
#sobre los residuos.

m1 <- la(Payment ~ Claims + Insured)


#3. Con el primero modelo, estima uno nuevo quitando la variable Insured.
#No olvides interpretar tus resultados y realizar el diagnóstico sobre los residuos.

m2 <- update(m1, ~.-Insured)
summary(m2)

StanRes2 <- rstandard(m2)
#4. Con el primero modelo, estima uno nuevo quitando la variable Claims.
#No olvides interpretar tus resultados y realizar el diagnóstico sobre los residuos.



#5. ¿Cuál de los 3 modelos tiene un mejor poder predictivo?
  